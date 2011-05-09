
const int speed = 19200;

const int refPin = 0;
const int readPin = 2;

const unsigned long r2 = 1000;

int ref = 0;
int input = 0;
unsigned long lastValue = 0;

void setup(){
    Serial.begin(speed);
    
    Serial.println("Ready");
}

void loop(){
    ref = analogRead(refPin);
    input = analogRead(readPin);
    
    unsigned long ohm = ohms();
    
      /*Serial.print(ref);
      Serial.print(" ");
      Serial.print(input);      
      Serial.print(" ");
      Serial.println(ohm);*/
    
    if(ohm > 10 && (ohm / 100 != lastValue)){
      
      Serial.print(ohm);
      Serial.print(" ohm    ");
      Serial.print(kohms(ohm));
      Serial.println(" K");
      lastValue = ohm / 100;
    }
    
    delay(250);
}

unsigned long ohms(){
   if(input == 0){
      return 0;
   }
   
   unsigned long ratio = (ref - input) / input;
   return ratio * r2;
}

double kohms(unsigned long ohmvalue){
   unsigned long hundred = ohmvalue / 100;
   double kohm = ((double)hundred) / 10.0;
}

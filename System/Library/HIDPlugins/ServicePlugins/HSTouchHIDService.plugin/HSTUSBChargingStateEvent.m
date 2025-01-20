@interface HSTUSBChargingStateEvent
+ (const)hsClassName;
- (unsigned)usbChargingState;
@end

@implementation HSTUSBChargingStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)85,(char)83,(char)66,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)usbChargingState
{
  return self->super.value;
}

@end
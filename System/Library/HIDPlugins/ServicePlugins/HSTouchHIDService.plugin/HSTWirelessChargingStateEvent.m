@interface HSTWirelessChargingStateEvent
+ (const)hsClassName;
- (unsigned)wirelessChargingState;
@end

@implementation HSTWirelessChargingStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)87,(char)105,(char)114,(char)101,(char)108,(char)101,(char)115,(char)115,(char)67,(char)104,(char)97,(char)114,(char)103,(char)105,(char)110,(char)103,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)wirelessChargingState
{
  return self->super.value;
}

@end
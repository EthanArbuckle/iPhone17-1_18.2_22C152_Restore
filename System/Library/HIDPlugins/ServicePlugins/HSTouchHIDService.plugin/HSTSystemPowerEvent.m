@interface HSTSystemPowerEvent
+ (const)hsClassName;
- (unsigned)systemPowerState;
@end

@implementation HSTSystemPowerEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)121,(char)115,(char)116,(char)101,(char)109,(char)80,(char)111,(char)119,(char)101,(char)114,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)systemPowerState
{
  return self->super.value;
}

@end
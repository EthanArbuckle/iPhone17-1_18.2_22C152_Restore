@interface HSTWristStateEvent
+ (const)hsClassName;
- (unsigned)wristState;
@end

@implementation HSTWristStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)87,(char)114,(char)105,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)wristState
{
  return self->super.value;
}

@end
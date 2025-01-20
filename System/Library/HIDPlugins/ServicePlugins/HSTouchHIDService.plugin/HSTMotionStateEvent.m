@interface HSTMotionStateEvent
+ (const)hsClassName;
- (unsigned)motionState;
@end

@implementation HSTMotionStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)77,(char)111,(char)116,(char)105,(char)111,(char)110,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)motionState
{
  return self->super.value;
}

@end
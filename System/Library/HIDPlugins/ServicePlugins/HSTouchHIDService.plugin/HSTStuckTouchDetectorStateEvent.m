@interface HSTStuckTouchDetectorStateEvent
+ (const)hsClassName;
- (unsigned)stuckTouchDetectorState;
@end

@implementation HSTStuckTouchDetectorStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)116,(char)117,(char)99,(char)107,(char)84,(char)111,(char)117,(char)99,(char)104,(char)68,(char)101,(char)116,(char)101,(char)99,(char)116,(char)111,(char)114,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)stuckTouchDetectorState
{
  return self->super.value;
}

@end
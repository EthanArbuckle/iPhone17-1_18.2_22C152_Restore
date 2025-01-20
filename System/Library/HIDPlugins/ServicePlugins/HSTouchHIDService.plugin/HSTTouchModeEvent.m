@interface HSTTouchModeEvent
+ (const)hsClassName;
- (unsigned)touchMode;
@end

@implementation HSTTouchModeEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)84,(char)111,(char)117,(char)99,(char)104,(char)77,(char)111,(char)100,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)touchMode
{
  return self->super.value;
}

@end
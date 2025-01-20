@interface HSTTouchHandEvent
+ (const)hsClassName;
- (unsigned)touchHand;
@end

@implementation HSTTouchHandEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)84,(char)111,(char)117,(char)99,(char)104,(char)72,(char)97,(char)110,(char)100,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)touchHand
{
  return self->super.value;
}

@end
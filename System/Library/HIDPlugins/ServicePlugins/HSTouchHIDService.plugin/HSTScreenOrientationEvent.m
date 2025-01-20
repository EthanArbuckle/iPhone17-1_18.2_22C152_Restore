@interface HSTScreenOrientationEvent
+ (const)hsClassName;
- (unsigned)screenOrientation;
@end

@implementation HSTScreenOrientationEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)99,(char)114,(char)101,(char)101,(char)110,(char)79,(char)114,(char)105,(char)101,(char)110,(char)116,(char)97,(char)116,(char)105,(char)111,(char)110,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (unsigned)screenOrientation
{
  return self->super.value;
}

@end
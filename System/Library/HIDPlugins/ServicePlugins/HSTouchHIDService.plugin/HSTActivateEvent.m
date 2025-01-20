@interface HSTActivateEvent
+ (const)hsClassName;
@end

@implementation HSTActivateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)65,(char)99,(char)116,(char)105,(char)118,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

@end
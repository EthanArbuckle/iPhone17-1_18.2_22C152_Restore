@interface HSTCancelEvent
+ (const)hsClassName;
@end

@implementation HSTCancelEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)97,(char)110,(char)99,(char)101,(char)108,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

@end
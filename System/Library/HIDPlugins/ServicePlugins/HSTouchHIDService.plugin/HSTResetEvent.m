@interface HSTResetEvent
+ (const)hsClassName;
@end

@implementation HSTResetEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)82,(char)101,(char)115,(char)101,(char)116,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

@end
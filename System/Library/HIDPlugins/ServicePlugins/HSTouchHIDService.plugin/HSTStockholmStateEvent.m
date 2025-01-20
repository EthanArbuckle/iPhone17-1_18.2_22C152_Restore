@interface HSTStockholmStateEvent
+ (const)hsClassName;
- (unsigned)stockholmState;
@end

@implementation HSTStockholmStateEvent

- (unsigned)stockholmState
{
  return self->super.value;
}

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)116,(char)111,(char)99,(char)107,(char)104,(char)111,(char)108,(char)109,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

@end
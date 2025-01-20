@interface HSTFeedbackEvent
+ (const)hsClassName;
@end

@implementation HSTFeedbackEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)70,(char)101,(char)101,(char)100,(char)98,(char)97,(char)99,(char)107,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (void).cxx_destruct
{
}

@end
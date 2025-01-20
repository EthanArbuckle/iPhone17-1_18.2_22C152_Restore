@interface UIImpactFeedbackGenerator(UIFeedbackGenerator_ASVFeedbackGenerator)
- (id)prepare;
@end

@implementation UIImpactFeedbackGenerator(UIFeedbackGenerator_ASVFeedbackGenerator)

- (id)prepare
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_1F3E1F568;
  return objc_msgSendSuper2(&v2, sel_prepare);
}

@end
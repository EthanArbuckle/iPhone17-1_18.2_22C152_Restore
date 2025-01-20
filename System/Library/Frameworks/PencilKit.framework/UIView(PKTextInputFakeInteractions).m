@interface UIView(PKTextInputFakeInteractions)
- (id)fakeScribbleInteractionDelegate;
- (void)setFakeScribbleInteractionDelegate:()PKTextInputFakeInteractions;
@end

@implementation UIView(PKTextInputFakeInteractions)

- (void)setFakeScribbleInteractionDelegate:()PKTextInputFakeInteractions
{
}

- (id)fakeScribbleInteractionDelegate
{
  return objc_getAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Pencil Text Input/PKTextInputFakeInteractions.m");
}

@end
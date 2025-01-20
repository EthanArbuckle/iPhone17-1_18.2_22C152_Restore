@interface AVTAvatarActionsViewControllerTransitionPadStartingLayout
- (AVTAvatarActionsViewControllerTransitionPadStartingLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5 avtViewLayoutInfo:(id)a6 startingAvatarViewFrame:(CGRect)a7;
- (CGRect)avatarContainerViewFrame;
- (double)actionButtonsViewAlpha;
@end

@implementation AVTAvatarActionsViewControllerTransitionPadStartingLayout

- (AVTAvatarActionsViewControllerTransitionPadStartingLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5 avtViewLayoutInfo:(id)a6 startingAvatarViewFrame:(CGRect)a7
{
  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarActionsViewControllerTransitionPadStartingLayout;
  result = -[AVTAvatarActionsViewControllerPadLayout initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:](&v8, sel_initWithContainerSize_insets_buttonCount_avtViewLayoutInfo_, a5, a6, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
  if (result) {
    result->_avatarContainerViewFrame = a7;
  }
  return result;
}

- (double)actionButtonsViewAlpha
{
  return 0.0;
}

- (CGRect)avatarContainerViewFrame
{
  double x = self->_avatarContainerViewFrame.origin.x;
  double y = self->_avatarContainerViewFrame.origin.y;
  double width = self->_avatarContainerViewFrame.size.width;
  double height = self->_avatarContainerViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end
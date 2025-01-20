@interface AVTAvatarActionsViewControllerLayout
+ (double)buttonHeight;
+ (double)heightForButtonsViewWithButtonCount:(int64_t)a3;
- (AVTAvatarActionsViewControllerLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5 avtViewLayoutInfo:(id)a6;
- (AVTViewLayoutInfo)avtViewLayout;
- (CGRect)actionButtonsViewFrame;
- (CGRect)actionButtonsViewFrameForButtonCount:(int64_t)a3;
- (CGRect)avatarContainerViewFrame;
- (CGRect)userInfoFrame;
- (CGSize)containerSize;
- (UIEdgeInsets)edgeInsets;
- (double)actionButtonsViewAlpha;
- (int64_t)buttonCount;
@end

@implementation AVTAvatarActionsViewControllerLayout

+ (double)buttonHeight
{
  v2 = +[AVTUIFontRepository avatarActionButtonTitleFont];
  [v2 ascender];
  double v4 = v3;
  [v2 descender];
  double v6 = fmax(v4 - v5 + 28.0, 50.0);

  return v6;
}

+ (double)heightForButtonsViewWithButtonCount:(int64_t)a3
{
  double v4 = (double)a3;
  [a1 buttonHeight];
  return (double)(a3 - 1) * 10.0 + v4 * v5;
}

- (AVTAvatarActionsViewControllerLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 buttonCount:(int64_t)a5 avtViewLayoutInfo:(id)a6
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarActionsViewControllerLayout;
  v16 = [(AVTAvatarActionsViewControllerLayout *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_containerSize.CGFloat width = width;
    v16->_containerSize.CGFloat height = height;
    v16->_edgeInsets.CGFloat top = top;
    v16->_edgeInsets.CGFloat left = left;
    v16->_edgeInsets.CGFloat bottom = bottom;
    v16->_edgeInsets.CGFloat right = right;
    v16->_buttonCount = a5;
    objc_storeStrong((id *)&v16->_avtViewLayout, a6);
  }

  return v17;
}

- (double)actionButtonsViewAlpha
{
  return 1.0;
}

- (CGRect)actionButtonsViewFrameForButtonCount:(int64_t)a3
{
  [(id)objc_opt_class() heightForButtonsViewWithButtonCount:a3];
  double v5 = v4;
  [(AVTAvatarActionsViewControllerLayout *)self containerSize];
  double v7 = v6 + -20.0;
  [(AVTAvatarActionsViewControllerLayout *)self containerSize];
  double v9 = v8;
  [(AVTAvatarActionsViewControllerLayout *)self edgeInsets];
  double v11 = v9 - v10 - v5 + -10.0;
  double v12 = 10.0;
  double v13 = v7;
  double v14 = v5;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGRect)actionButtonsViewFrame
{
  int64_t v3 = [(AVTAvatarActionsViewControllerLayout *)self buttonCount];
  [(AVTAvatarActionsViewControllerLayout *)self actionButtonsViewFrameForButtonCount:v3];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)avatarContainerViewFrame
{
  [(AVTAvatarActionsViewControllerLayout *)self actionButtonsViewFrameForButtonCount:+[AVTAvatarActionsProvider maximumNumberOfActions]];
  double v4 = v3;
  [(AVTAvatarActionsViewControllerLayout *)self containerSize];
  double v6 = fmin(v5, 340.0);
  double v7 = [(AVTAvatarActionsViewControllerLayout *)self avtViewLayout];
  [v7 avtViewBackingSize];
  double v9 = v8;
  double v10 = [(AVTAvatarActionsViewControllerLayout *)self avtViewLayout];
  [v10 avtViewBackingSize];
  double v12 = v9 / v11;

  double v13 = v6 * v12;
  [(AVTAvatarActionsViewControllerLayout *)self containerSize];
  double v15 = floor((v14 - v6) * 0.5);
  [(AVTAvatarActionsViewControllerLayout *)self edgeInsets];
  double v17 = v16;
  [(AVTAvatarActionsViewControllerLayout *)self edgeInsets];
  double v19 = v17 + (v4 - v18 - v13) * 0.5;
  double v20 = v15;
  double v21 = v6;
  double v22 = v13;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.y = v19;
  result.origin.x = v20;
  return result;
}

- (CGRect)userInfoFrame
{
  [(AVTAvatarActionsViewControllerLayout *)self avatarContainerViewFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v10 = +[AVTUIFontRepository userInfoLabelFont];
  v28.origin.x = v3;
  v28.origin.y = v5;
  v28.size.CGFloat width = v7;
  v28.size.CGFloat height = v9;
  double MaxY = CGRectGetMaxY(v28);
  [v10 ascender];
  double v13 = v12;
  [v10 descender];
  double v15 = MaxY - (v13 - v14);
  +[AVTUserInfoView textVerticalPadding];
  double v17 = v15 - v16 * 2.0;
  [v10 ascender];
  double v19 = v18;
  [v10 descender];
  double v21 = v19 - v20;
  +[AVTUserInfoView textVerticalPadding];
  double v23 = v21 + v22 * 2.0;

  double v24 = v3;
  double v25 = v17;
  double v26 = v7;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)buttonCount
{
  return self->_buttonCount;
}

- (AVTViewLayoutInfo)avtViewLayout
{
  return self->_avtViewLayout;
}

- (void).cxx_destruct
{
}

@end
@interface AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout
- (BOOL)showSideGroupPicker;
- (CGRect)attributesContentViewFrame;
- (CGRect)avatarContainerFrame;
- (CGRect)groupDialContainerFrame;
- (CGRect)headerMaskingViewFrame;
- (CGRect)sideGroupContainerFrame;
- (CGRect)userInfoFrame;
- (CGRect)verticalRuleFrame;
- (UIEdgeInsets)attributesContentViewInsets;
- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets;
- (double)attributesContentViewExtraHeight;
- (double)avatarContainerAlpha;
- (double)headerMaskingViewAlpha;
- (double)initWithContainerSize:(uint64_t)a3 insets:(char)a4 userInfoViewHeight:(uint64_t)a5 screenScale:(uint64_t)a6 RTL:(uint64_t)a7 avatarViewContainerFrame:(uint64_t)a8 attributesContentViewFrameExtraHeight:(double)a9 avatarViewAlpha:(double)a10 showSideGroupPicker:(double)a11;
- (double)verticalRuleAlpha;
- (id)backgroundColor;
- (unint64_t)supportedLayoutOrientation;
@end

@implementation AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout

- (double)initWithContainerSize:(uint64_t)a3 insets:(char)a4 userInfoViewHeight:(uint64_t)a5 screenScale:(uint64_t)a6 RTL:(uint64_t)a7 avatarViewContainerFrame:(uint64_t)a8 attributesContentViewFrameExtraHeight:(double)a9 avatarViewAlpha:(double)a10 showSideGroupPicker:(double)a11
{
  v17.receiver = a1;
  v17.super_class = (Class)AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout;
  v15 = (double *)objc_msgSendSuper2(&v17, sel_initWithContainerSize_insets_userInfoViewHeight_screenScale_RTL_showSideGroupPicker_);
  if (v15)
  {
    double result = a20;
    *((void *)v15 + 15) = a17;
    *((void *)v15 + 16) = a18;
    *((void *)v15 + 17) = a19;
    v15[18] = a20;
    *((void *)v15 + 14) = a21;
    *((void *)v15 + 13) = a22;
    *((unsigned char *)v15 + 96) = a4;
  }
  return result;
}

- (unint64_t)supportedLayoutOrientation
{
  return 1;
}

- (CGRect)groupDialContainerFrame
{
  double v3 = 0.0;
  if (![(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self showSideGroupPicker])
  {
    v4 = +[AVTUIFontRepository groupDialBoldLabelFont];
    [v4 _scaledValueForValue:18.0];
    if (v5 <= 30.0) {
      double v6 = v5;
    }
    else {
      double v6 = 30.0;
    }
    [v4 ascender];
    double v8 = v7;
    [v4 descender];
    double v3 = ceil(v8 - v9 + v6 * 2.0);
  }
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v11 = v10;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v13 = v12;
  double v14 = 0.0;
  double v15 = v11;
  double v16 = v3;
  result.size.height = v16;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  if ([(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self showSideGroupPicker])
  {
    double v3 = 192.0;
  }
  else
  {
    double v3 = 0.0;
  }
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v5 = v4;
  double v6 = 0.0;
  double v7 = -v3;
  double v8 = v3;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (CGRect)attributesContentViewFrame
{
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self attributesContentViewInsets];
  double v4 = v3;
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self groupDialContainerFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self sideGroupContainerFrame];
  double v14 = v13;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  CGFloat v15 = CGRectGetMaxY(v25) - v4;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v17 = v16 - v14;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v19 = v18;
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self attributesContentViewExtraHeight];
  double v21 = v19 + v20;
  double v22 = v14;
  double v23 = v15;
  double v24 = v17;
  result.size.height = v21;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)userInfoFrame
{
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self groupDialContainerFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v10 = +[AVTUIFontRepository userInfoLabelFont];
  double v11 = +[AVTUIFontRepository groupDialBoldLabelFont];
  [v11 _scaledValueForValue:18.0];
  double v13 = v12;
  double v14 = v12 * 0.5;
  v34.origin.x = v3;
  v34.origin.y = v5;
  v34.size.width = v7;
  v34.size.height = v9;
  double MinY = CGRectGetMinY(v34);
  double v16 = 15.0;
  if (v13 <= 30.0) {
    double v16 = v14;
  }
  double v17 = MinY + v16;
  [v10 ascender];
  double v19 = v18;
  [v10 descender];
  double v21 = v17 - (v19 - v20);
  +[AVTUserInfoView textVerticalPadding];
  double v23 = v21 - v22 * 2.0;
  [v10 ascender];
  double v25 = v24;
  [v10 descender];
  double v27 = v25 - v26;
  +[AVTUserInfoView textVerticalPadding];
  double v29 = v27 + v28 * 2.0;

  double v30 = v3;
  double v31 = v23;
  double v32 = v7;
  double v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (double)headerMaskingViewAlpha
{
  return 1.0;
}

- (CGRect)headerMaskingViewFrame
{
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self attributesContentViewFrame];
  double v4 = v3;
  double v6 = v5;
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self groupDialContainerFrame];
  double v7 = CGRectGetMaxY(v11) - v4;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v6;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)verticalRuleAlpha
{
  return 0.0;
}

- (CGRect)verticalRuleFrame
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)attributesContentViewInsets
{
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self avatarContainerFrame];
  double v7 = v6;
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self groupDialContainerFrame];
  double v9 = v7 + v8;
  double v10 = v3;
  double v11 = v4;
  double v12 = v5;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self avatarContainerFrame];
  double v7 = v6;
  [(AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *)self groupDialContainerFrame];
  double v9 = v7 + v8;
  double v10 = v3;
  double v11 = v4;
  double v12 = v5;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (id)backgroundColor
{
  return (id)[MEMORY[0x263F1C550] clearColor];
}

- (CGRect)avatarContainerFrame
{
  double x = self->_avatarContainerFrame.origin.x;
  double y = self->_avatarContainerFrame.origin.y;
  double width = self->_avatarContainerFrame.size.width;
  double height = self->_avatarContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)avatarContainerAlpha
{
  return self->_avatarContainerAlpha;
}

- (BOOL)showSideGroupPicker
{
  return self->_showSideGroupPicker;
}

- (double)attributesContentViewExtraHeight
{
  return self->_attributesContentViewExtraHeight;
}

@end
@interface AVTAvatarAttributeEditorDefaultPortraitLayout
- (CGRect)attributesContentViewFrame;
- (CGRect)avatarContainerFrame;
- (CGRect)defaultUserInfoFrame;
- (CGRect)groupDialContainerFrame;
- (CGRect)headerMaskingViewFrame;
- (CGRect)sideGroupContainerFrame;
- (CGRect)userInfoFrame;
- (CGRect)verticalRuleFrame;
- (UIEdgeInsets)attributesContentViewInsets;
- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets;
- (double)avatarContainerAlpha;
- (double)headerMaskingViewAlpha;
- (double)maxHeaderHeight;
- (double)verticalRuleAlpha;
- (unint64_t)supportedLayoutOrientation;
@end

@implementation AVTAvatarAttributeEditorDefaultPortraitLayout

- (unint64_t)supportedLayoutOrientation
{
  return 1;
}

- (double)maxHeaderHeight
{
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v4 = v3 * 0.5;
  [(AVTAvatarAttributeEditorLayout *)self edgeInsets];
  return v4 - v5;
}

- (CGRect)avatarContainerFrame
{
  [(AVTAvatarAttributeEditorLayout *)self edgeInsets];
  double v4 = v3;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v6 = v5;
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self maxHeaderHeight];
  double v8 = v7;
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self groupDialContainerFrame];
  double v10 = v8 - v9;
  double v11 = 0.0;
  double v12 = v4;
  double v13 = v6;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)avatarContainerAlpha
{
  return 1.0;
}

- (CGRect)userInfoFrame
{
  [(AVTAvatarAttributeEditorLayout *)self userInfoViewHeight];
  if (v3 <= 0.0)
  {
    [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self defaultUserInfoFrame];
    double v5 = v20;
    double v17 = v21;
    double v9 = v22;
    double v19 = v23;
  }
  else
  {
    [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self groupDialContainerFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v10 = +[AVTUIFontRepository groupDialBoldLabelFont];
    [v10 _scaledValueForValue:18.0];
    double v12 = v11 * 0.5;
    BOOL v13 = v11 <= 30.0;
    double v14 = 15.0;
    if (v13) {
      double v14 = v12;
    }
    double v15 = v7 + v14;
    [(AVTAvatarAttributeEditorLayout *)self userInfoViewHeight];
    double v17 = v15 - v16;
    [(AVTAvatarAttributeEditorLayout *)self userInfoViewHeight];
    double v19 = v18;
  }
  double v24 = v5;
  double v25 = v17;
  double v26 = v9;
  double v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)defaultUserInfoFrame
{
  double v3 = +[AVTUIFontRepository userInfoLabelFont];
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self groupDialContainerFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = +[AVTUIFontRepository groupDialBoldLabelFont];
  [v12 _scaledValueForValue:18.0];
  double v14 = v13;
  double v15 = v13 * 0.5;
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  double MinY = CGRectGetMinY(v35);
  double v17 = 15.0;
  if (v14 <= 30.0) {
    double v17 = v15;
  }
  double v18 = MinY + v17;
  [v3 ascender];
  double v20 = v19;
  [v3 descender];
  double v22 = v18 - (v20 - v21);
  +[AVTUserInfoView textVerticalPadding];
  double v24 = v22 - v23 * 2.0;
  [v3 ascender];
  double v26 = v25;
  [v3 descender];
  double v28 = v26 - v27;
  +[AVTUserInfoView textVerticalPadding];
  double v30 = v28 + v29 * 2.0;

  double v31 = v5;
  double v32 = v24;
  double v33 = v9;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)attributesContentViewFrame
{
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v4 = v3;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)headerMaskingViewAlpha
{
  return 1.0;
}

- (CGRect)headerMaskingViewFrame
{
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v4 = v3;
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self groupDialContainerFrame];
  double MaxY = CGRectGetMaxY(v9);
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.size.height = MaxY;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
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
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self maxHeaderHeight];
  double v6 = v5;
  [(AVTAvatarAttributeEditorLayout *)self screenScale];
  AVTRoundToScale(v6, v7);
  double v9 = 36.0;
  double v10 = v3;
  double v11 = v4;
  result.right = v11;
  result.bottom = v9;
  result.left = v10;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self avatarContainerFrame];
  double v7 = v6;
  [(AVTAvatarAttributeEditorLayout *)self edgeInsets];
  double v9 = v8 - v7;
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self maxHeaderHeight];
  double v11 = v10 - v9;
  [(AVTAvatarAttributeEditorLayout *)self screenScale];
  AVTRoundToScale(v11, v12);
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGRect)groupDialContainerFrame
{
  double v3 = +[AVTUIFontRepository groupDialBoldLabelFont];
  [v3 _scaledValueForValue:18.0];
  if (v4 <= 30.0) {
    double v5 = v4;
  }
  else {
    double v5 = 30.0;
  }
  [v3 ascender];
  double v7 = v6;
  [v3 descender];
  double v9 = ceil(v7 - v8 + v5 * 2.0);
  [(AVTAvatarAttributeEditorDefaultPortraitLayout *)self maxHeaderHeight];
  double v11 = v10 - v9;
  [(AVTAvatarAttributeEditorLayout *)self edgeInsets];
  double v13 = v12 + v11;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v15 = v14;

  double v16 = 0.0;
  double v17 = v13;
  double v18 = v15;
  double v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)sideGroupContainerFrame
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

@end
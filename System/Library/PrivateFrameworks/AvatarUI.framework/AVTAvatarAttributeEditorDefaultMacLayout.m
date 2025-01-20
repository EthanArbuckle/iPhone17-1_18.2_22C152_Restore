@interface AVTAvatarAttributeEditorDefaultMacLayout
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
- (double)widthToFitGroupLabels;
- (unint64_t)supportedLayoutOrientation;
@end

@implementation AVTAvatarAttributeEditorDefaultMacLayout

- (unint64_t)supportedLayoutOrientation
{
  return 1;
}

- (double)maxHeaderHeight
{
  return 270.0;
}

- (CGRect)avatarContainerFrame
{
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self attributesContentViewFrame];
  double v4 = v3;
  double v6 = v5;
  [(AVTAvatarAttributeEditorLayout *)self edgeInsets];
  double v8 = v7;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self maxHeaderHeight];
  double v10 = v9;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self groupDialContainerFrame];
  double v12 = v10 - v11;
  double v13 = v4;
  double v14 = v8;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
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
    [(AVTAvatarAttributeEditorDefaultMacLayout *)self defaultUserInfoFrame];
    double v5 = v20;
    double v17 = v21;
    double v9 = v22;
    double v19 = v23;
  }
  else
  {
    [(AVTAvatarAttributeEditorDefaultMacLayout *)self groupDialContainerFrame];
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
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self groupDialContainerFrame];
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
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self sideGroupContainerFrame];
  double v4 = v3;
  if ([(AVTAvatarAttributeEditorLayout *)self RTL]) {
    double v5 = 0.0;
  }
  else {
    double v5 = v4;
  }
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v7 = v6 - v4;
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v9 = v8;
  double v10 = 0.0;
  double v11 = v5;
  double v12 = v7;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
  return result;
}

- (double)headerMaskingViewAlpha
{
  return 1.0;
}

- (CGRect)headerMaskingViewFrame
{
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self attributesContentViewFrame];
  double v4 = v3;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self groupDialContainerFrame];
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
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self avatarContainerFrame];
  double v6 = v5;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self attributesContentViewFrame];
  double v8 = v7 - v6;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self maxHeaderHeight];
  double v10 = v9 - v8;
  double v11 = 36.0;
  double v12 = v3;
  double v13 = v4;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self avatarContainerFrame];
  double v7 = v6;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self attributesContentViewFrame];
  double v9 = v8 - v7;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self maxHeaderHeight];
  double v11 = v10 - v9;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGRect)groupDialContainerFrame
{
  double v3 = 0.0;
  if (![(AVTAvatarAttributeEditorLayout *)self showSideGroupPicker])
  {
    double v4 = +[AVTUIFontRepository groupDialBoldLabelFont];
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
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self maxHeaderHeight];
  double v11 = v10 - v3;
  [(AVTAvatarAttributeEditorLayout *)self edgeInsets];
  double v13 = v11 + v12;
  [(AVTAvatarAttributeEditorDefaultMacLayout *)self attributesContentViewFrame];
  double v15 = 0.0;
  double v16 = v13;
  double v17 = v3;
  result.size.height = v17;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  double v3 = 0.0;
  double v4 = 0.0;
  if ([(AVTAvatarAttributeEditorLayout *)self showSideGroupPicker])
  {
    [(AVTAvatarAttributeEditorDefaultMacLayout *)self widthToFitGroupLabels];
    double v4 = v5;
  }
  if ([(AVTAvatarAttributeEditorLayout *)self RTL])
  {
    [(AVTAvatarAttributeEditorLayout *)self containerSize];
    double v3 = v6 - v4;
  }
  [(AVTAvatarAttributeEditorLayout *)self containerSize];
  double v8 = v7;
  double v9 = 0.0;
  double v10 = v3;
  double v11 = v4;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (double)widthToFitGroupLabels
{
  +[AVTGroupListCollectionViewCell estimatedLabelWidthForContainerWidth:195.0];
  double v4 = v3;
  [(AVTAvatarAttributeEditorLayout *)self maxGroupLabelWidth];
  double result = fmax(v5 - v4 + 215.0, 192.0);
  if (result > 215.0) {
    return 215.0;
  }
  return result;
}

@end
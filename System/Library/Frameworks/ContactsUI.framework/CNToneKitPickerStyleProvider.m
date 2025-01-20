@interface CNToneKitPickerStyleProvider
- (BOOL)tonePickerHeaderTextShouldBeUppercase;
- (BOOL)tonePickerUsesOpaqueBackground;
- (BOOL)wantsCustomTonePickerHeaderView;
- (UIColor)tonePickerCellBackgroundColor;
- (UIColor)tonePickerCellHighlightedTextColor;
- (UIColor)tonePickerCellTextColor;
- (UIColor)tonePickerCustomTableSeparatorColor;
- (UIColor)tonePickerHeaderTextColor;
- (UIColor)tonePickerHeaderTextShadowColor;
- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets;
- (UIFont)tonePickerCellTextFont;
- (UIFont)tonePickerHeaderTextFont;
- (UIOffset)tonePickerHeaderTextShadowOffset;
- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell;
- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3;
- (int64_t)tonePickerCustomTableSeparatorBackdropOverlayBlendMode;
- (int64_t)tonePickerTableViewSeparatorStyle;
@end

@implementation CNToneKitPickerStyleProvider

- (BOOL)tonePickerHeaderTextShouldBeUppercase
{
  return 1;
}

- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3 + 6.0;

  double v5 = 14.0;
  double v6 = 15.0;
  double v7 = 15.0;
  double v8 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (UIOffset)tonePickerHeaderTextShadowOffset
{
  double v2 = *MEMORY[0x1E4FB2E10];
  double v3 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIColor)tonePickerHeaderTextShadowColor
{
  return 0;
}

- (UIColor)tonePickerHeaderTextColor
{
  double v2 = +[CNContactStyle currentStyle];
  double v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (UIFont)tonePickerHeaderTextFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

- (BOOL)wantsCustomTonePickerHeaderView
{
  return 1;
}

- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell
{
  double v3 = UIImageGetTableNext();
  double v4 = +[CNUIColorRepository contactStyleDefaultSeparatorColor];
  double v5 = [v3 imageWithTintColor:v4];
  double v6 = [v5 imageFlippedForRightToLeftLayoutDirection];

  double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
  double v8 = UIImageGetTableNext();
  v9 = [(CNToneKitPickerStyleProvider *)self tonePickerCellTextColor];
  v10 = [v8 imageWithTintColor:v9];
  v11 = [v10 imageFlippedForRightToLeftLayoutDirection];
  [v7 setHighlightedImage:v11];

  return v7;
}

- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = +[CNContactStyle currentStyle];
  int v6 = [v5 blurSupported];

  if (v6) {
    [v4 _setDrawsAsBackdropOverlayWithBlendMode:3];
  }
  double v7 = +[CNContactStyle currentStyle];
  double v8 = [v7 selectedCellBackgroundColor];
  [v4 setBackgroundColor:v8];

  return v4;
}

- (UIColor)tonePickerCellBackgroundColor
{
  double v2 = +[CNContactStyle currentStyle];
  id v3 = [v2 backgroundColor];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[CNUIColorRepository contactStyleDefaultBackgroundColor];
  }
  int v6 = v5;

  return (UIColor *)v6;
}

- (UIColor)tonePickerCellHighlightedTextColor
{
  double v2 = +[CNContactStyle currentStyle];
  id v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (UIColor)tonePickerCellTextColor
{
  double v2 = +[CNContactStyle currentStyle];
  id v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (UIFont)tonePickerCellTextFont
{
  return 0;
}

- (int64_t)tonePickerCustomTableSeparatorBackdropOverlayBlendMode
{
  double v2 = (uint64_t (*)(uint64_t))softLinkTKBackdropViewOverlayBlendModeFromUIBackdropViewOverlayBlendMode[0];
  id v3 = +[CNContactStyle currentStyle];
  int64_t v4 = v2([v3 separatorBackdropOverlayBlendMode]);

  return v4;
}

- (UIColor)tonePickerCustomTableSeparatorColor
{
  double v2 = +[CNContactStyle currentStyle];
  id v3 = [v2 separatorColor];

  return (UIColor *)v3;
}

- (int64_t)tonePickerTableViewSeparatorStyle
{
  double v2 = +[CNContactStyle currentStyle];
  int64_t v3 = [v2 separatorStyle];

  return v3;
}

- (BOOL)tonePickerUsesOpaqueBackground
{
  double v2 = +[CNContactStyle currentStyle];
  char v3 = [v2 usesOpaqueBackground];

  return v3;
}

@end
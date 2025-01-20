@interface _SFAccountManagerAppearanceValues
+ (CGRect)chicletSize;
+ (CGSize)preferredFormSheetContentSize;
+ (NSDirectionalEdgeInsets)edgeInsetsForTopLevelCells;
+ (UIColor)buttonCellTextColor;
+ (UIColor)defaultMonogramBackgroundColor;
+ (double)chicletCornerRadius;
+ (id)_excessiveLineHeightCharacterSet;
+ (id)subtitleFontForLargerCell;
+ (id)subtitleFontForNarrowCellWithText:(id)a3;
+ (id)subtitleFontForStackViewLabel;
+ (id)titleFontForLargerCell;
+ (id)titleFontForNarrowCell;
+ (id)titleFontForStackViewLabel;
+ (int64_t)preferencesTableViewStyle;
@end

@implementation _SFAccountManagerAppearanceValues

+ (UIColor)defaultMonogramBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (id)titleFontForNarrowCell
{
  v2 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28C8]];
  v3 = [MEMORY[0x1E4FB1798] systemFontOfSize:17.0];
  v4 = [v2 scaledFontForFont:v3];

  return v4;
}

+ (id)subtitleFontForNarrowCellWithText:(id)a3
{
  id v4 = a3;
  v5 = [a1 _excessiveLineHeightCharacterSet];
  uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:v7];
    v9 = [MEMORY[0x1E4FB1798] systemFontOfSize:15.0];
    v10 = [v8 scaledFontForFont:v9];
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v7];
  }

  return v10;
}

+ (id)titleFontForLargerCell
{
  return (id)[MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)subtitleFontForLargerCell
{
  return (id)[MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

+ (id)titleFontForStackViewLabel
{
  v2 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:32770];

  id v4 = (void *)MEMORY[0x1E4FB1798];
  [v3 pointSize];
  v5 = objc_msgSend(v4, "fontWithDescriptor:size:", v3);

  return v5;
}

+ (id)subtitleFontForStackViewLabel
{
  v2 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  id v4 = (void *)MEMORY[0x1E4FB1798];
  [v3 pointSize];
  v5 = objc_msgSend(v4, "fontWithDescriptor:size:", v3);

  return v5;
}

+ (int64_t)preferencesTableViewStyle
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  v3 = [v2 view];
  if (PSShouldInsetListView()) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

+ (UIColor)buttonCellTextColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (CGRect)chicletSize
{
  double v2 = 32.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 32.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (double)chicletCornerRadius
{
  return 6.0;
}

+ (NSDirectionalEdgeInsets)edgeInsetsForTopLevelCells
{
  double v2 = 8.0;
  double v3 = 0.0;
  double v4 = 8.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (_excessiveLineHeightCharacterSet_onceToken != -1) {
    dispatch_once(&_excessiveLineHeightCharacterSet_onceToken, &__block_literal_global_9);
  }
  double v2 = (void *)_excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet;

  return v2;
}

+ (CGSize)preferredFormSheetContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end
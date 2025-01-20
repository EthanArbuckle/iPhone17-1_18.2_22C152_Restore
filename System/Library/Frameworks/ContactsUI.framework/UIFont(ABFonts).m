@interface UIFont(ABFonts)
+ (BOOL)ab_preferredContentSizeCategoryIsAccessibilityCategory;
+ (id)ab_preferredContentSizeCategoryName;
+ (id)ab_preferredFontForTextStyle:()ABFonts;
+ (id)ab_preferredRowFontForTextStyle:()ABFonts;
+ (uint64_t)_shouldUseDefaultFont;
+ (void)ab_setIgnoreUserFontSize:()ABFonts;
- (id)ab_boldFont;
- (id)ab_italicFont;
@end

@implementation UIFont(ABFonts)

+ (BOOL)ab_preferredContentSizeCategoryIsAccessibilityCategory
{
  v0 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL v1 = ([v0 isEqualToString:*MEMORY[0x1E4FB2798]] & 1) != 0
    || ([v0 isEqualToString:*MEMORY[0x1E4FB2790]] & 1) != 0
    || ([v0 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) != 0
    || ([v0 isEqualToString:*MEMORY[0x1E4FB2780]] & 1) != 0
    || [v0 isEqualToString:*MEMORY[0x1E4FB2778]];

  return v1;
}

- (id)ab_italicFont
{
  v2 = [a1 fontDescriptor];
  v3 = [v2 fontDescriptorWithSymbolicTraits:1];

  v4 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  v5 = objc_msgSend(v4, "fontWithDescriptor:size:", v3);

  return v5;
}

- (id)ab_boldFont
{
  v2 = [a1 fontDescriptor];
  v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  v4 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  v5 = objc_msgSend(v4, "fontWithDescriptor:size:", v3);

  return v5;
}

+ (id)ab_preferredContentSizeCategoryName
{
  if ([a1 _shouldUseDefaultFont])
  {
    id v1 = (id)*MEMORY[0x1E4FB27D0];
  }
  else
  {
    id v1 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  }

  return v1;
}

+ (id)ab_preferredRowFontForTextStyle:()ABFonts
{
  id v4 = a3;
  if ([a1 _shouldUseDefaultFont])
  {
    v5 = [a1 defaultFontForTextStyle:v4];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v4 addingSymbolicTraits:0 options:2];

    v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];
    id v4 = (id)v6;
  }

  return v5;
}

+ (id)ab_preferredFontForTextStyle:()ABFonts
{
  id v4 = a3;
  if ([a1 _shouldUseDefaultFont]) {
    [a1 defaultFontForTextStyle:v4];
  }
  else {
  v5 = [a1 preferredFontForTextStyle:v4];
  }

  return v5;
}

+ (uint64_t)_shouldUseDefaultFont
{
  return _ab_ignoreUserFontSize;
}

+ (void)ab_setIgnoreUserFontSize:()ABFonts
{
  _ab_ignoreUserFontSize = a3;
}

@end
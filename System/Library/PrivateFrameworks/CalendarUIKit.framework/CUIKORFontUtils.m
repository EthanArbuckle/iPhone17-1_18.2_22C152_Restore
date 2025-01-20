@interface CUIKORFontUtils
+ (UIFont)defaultOccurrenceSecondaryTextFont;
+ (double)_minimumPrimaryFontLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (double)attributedStringMinimumLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (id)_primaryTextFontCache;
+ (id)defaultOccurrencePrimaryTextFontForSizeClass:(int64_t)a3;
+ (id)defaultOccurrenceSmallPrimaryTextFontForSizeClass:(int64_t)a3;
@end

@implementation CUIKORFontUtils

+ (id)defaultOccurrencePrimaryTextFontForSizeClass:(int64_t)a3
{
  v4 = [a1 _primaryTextFontCache];
  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingBoldFontForTextStyle:", *MEMORY[0x1E4FB28F0]);
  v6 = [v5 fontDescriptor];
  [v6 pointSize];
  double v8 = v7;

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%zd.%f", a3, *(void *)&v8);
  v10 = [v4 objectForKey:v9];
  if (!v10)
  {
    CUIKRoundToScreenScale(v8);
    v10 = objc_msgSend(v5, "fontWithSize:");
    [v4 setObject:v10 forKey:v9];
  }

  return v10;
}

+ (id)_primaryTextFontCache
{
  if (_primaryTextFontCache_onceToken != -1) {
    dispatch_once(&_primaryTextFontCache_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)_primaryTextFontCache_cache;

  return v2;
}

void __40__CUIKORFontUtils__primaryTextFontCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_primaryTextFontCache_cache;
  _primaryTextFontCache_cache = (uint64_t)v0;
}

+ (UIFont)defaultOccurrenceSecondaryTextFont
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingFontForTextStyle:", *MEMORY[0x1E4FB28E0]);
  v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CUIKRoundToScreenScale(v5);
  v6 = objc_msgSend(v2, "fontWithSize:");

  return (UIFont *)v6;
}

+ (id)defaultOccurrenceSmallPrimaryTextFontForSizeClass:(int64_t)a3
{
  if (a3 == 2) {
    double v3 = 13.0;
  }
  else {
    double v3 = 11.0;
  }
  double v4 = (id *)MEMORY[0x1E4FB28F0];
  if (a3 != 2) {
    double v4 = (id *)MEMORY[0x1E4FB28E0];
  }
  id v5 = *v4;
  double v6 = v3 / v3;
  double v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingBoldFontForTextStyle:", v5);
  double v8 = [v7 fontDescriptor];
  [v8 pointSize];
  double v10 = v9;

  CUIKRoundToScreenScale(v6 * v10);
  v11 = objc_msgSend(v7, "fontWithSize:");

  return v11;
}

+ (double)attributedStringMinimumLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  if (a3) {
    double v4 = 8.0;
  }
  else {
    double v4 = 9.0;
  }
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  double result = CUIKCeilToScreenScale(v5);
  if (v4 >= result) {
    return v4;
  }
  return result;
}

+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  BOOL v5 = a3;
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  double v8 = v7;
  [a1 attributedStringMinimumLineHeightUsingSmallText:v5 sizeClass:a4];
  if (v8 >= result) {
    return v8;
  }
  return result;
}

+ (double)_minimumPrimaryFontLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  BOOL v9 = a3;
  CUIKMultiwindowAssert(a4 != 0, @"Unspecified size class", a3, a4, v4, v5, v6, v7, v15);
  double v10 = +[CUIKSemiConstantCache sharedInstance];
  v11 = v10;
  if (v9)
  {
    if (a4 == 1) {
      [v10 dayOccurrenceMinimumCachedLineHeightSmallCompact];
    }
    else {
      [v10 dayOccurrenceMinimumCachedLineHeightSmallRegular];
    }
  }
  else if (a4 == 1)
  {
    [v10 dayOccurrenceMinimumCachedLineHeightCompact];
  }
  else
  {
    [v10 dayOccurrenceMinimumCachedLineHeightRegular];
  }
  double v13 = v12;

  return v13;
}

@end
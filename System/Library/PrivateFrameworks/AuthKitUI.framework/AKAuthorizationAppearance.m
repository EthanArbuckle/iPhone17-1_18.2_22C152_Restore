@interface AKAuthorizationAppearance
+ (BOOL)shouldShowBlurBackground;
+ (UIButtonConfiguration)clearButtonConfiguration;
+ (UIButtonConfiguration)dismissButtonConfiguration;
+ (UIColor)captionTextColor;
+ (UIColor)checkmarkDeselectedTintColor;
+ (UIColor)continueButtonDefaultColor;
+ (UIColor)continueButtonDisabledColor;
+ (UIColor)continueButtonHighlightedColor;
+ (UIColor)continueButtonTextColor;
+ (UIColor)editScopeInfoLabelTextColor;
+ (UIColor)editScopeInputFieldTextColor;
+ (UIColor)editScopeRowBackgroundColor;
+ (UIColor)linkColor;
+ (UIColor)paneBackgroundColor;
+ (UIColor)scopeImageViewBackgroundColor;
+ (UIColor)scopeImageViewTintColor;
+ (UIColor)scopeInfoLabelTextColor;
+ (UIColor)scopeRowBackgroundColor;
+ (UIColor)scopeSubtitleTextColor;
+ (UIColor)scopeTitleTextColor;
+ (UIColor)sharedAccountIconBackgroundColor;
+ (UIColor)smallTitleTextColor;
+ (UIColor)translucentBackdropColor;
+ (UIFont)bulletInfoLabelDescriptionFont;
+ (UIFont)bulletInfoLabelTitleFont;
+ (UIFont)captionFont;
+ (UIFont)continueButtonFont;
+ (UIFont)editScopeInfoLabelFont;
+ (UIFont)editScopeInputFieldFont;
+ (UIFont)messageFont;
+ (UIFont)scopeInfoLabelFont;
+ (UIFont)scopeSelectionTitleFont;
+ (UIFont)scopeSubtitleFont;
+ (UIFont)scopeTitleFont;
+ (UIFont)smallTitleFont;
+ (UIFont)subtitleFont;
+ (UIFont)titleFont;
+ (UIImageSymbolConfiguration)emailSelectionSymbolConfiguration;
+ (id)clearButtonColor;
+ (id)useDifferentIDButtonTextColor;
+ (int64_t)editingDoneButtonStyle;
+ (int64_t)paneBlurEffectStyle;
+ (int64_t)tableViewStyle;
@end

@implementation AKAuthorizationAppearance

+ (UIFont)titleFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  v4 = (void *)MEMORY[0x1E4F438E8];
  if (v3) {
    v4 = (void *)MEMORY[0x1E4F438F0];
  }
  v5 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *v4, 32770);

  return (UIFont *)v5;
}

+ (UIFont)subtitleFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F438A0], 0);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E4F43930]);
  }

  return (UIFont *)v4;
}

+ (UIFont)smallTitleFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F438A0], 0);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E4F43920]);
  }

  return (UIFont *)v4;
}

+ (UIColor)smallTitleTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] secondaryLabelColor];
}

+ (UIFont)captionFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43888], 0);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 11.0, *MEMORY[0x1E4F43930]);
  }

  return (UIFont *)v4;
}

+ (UIColor)captionTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] secondaryLabelColor];
}

+ (UIFont)messageFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F438C8], 0);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E4F43928]);
  }

  return (UIFont *)v4;
}

+ (UIFont)bulletInfoLabelTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F438A0], 0);
}

+ (UIFont)bulletInfoLabelDescriptionFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43890], *MEMORY[0x1E4F43930]);
}

+ (id)clearButtonColor
{
  return (id)[MEMORY[0x1E4F428B8] lightGrayColor];
}

+ (UIFont)scopeTitleFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43870], 0x8000);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E4F43928]);
  }

  return (UIFont *)v4;
}

+ (UIColor)scopeTitleTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] labelColor];
}

+ (UIFont)scopeInfoLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 13.0, *MEMORY[0x1E4F43928]);
}

+ (UIColor)scopeInfoLabelTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] secondaryLabelColor];
}

+ (UIColor)scopeRowBackgroundColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  else {
  v4 = [MEMORY[0x1E4F428B8] clearColor];
  }

  return (UIColor *)v4;
}

+ (UIColor)paneBackgroundColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  }
  else {
  v4 = [MEMORY[0x1E4F428B8] clearColor];
  }

  return (UIColor *)v4;
}

+ (int64_t)paneBlurEffectStyle
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    return 9;
  }
  else {
    return 4;
  }
}

+ (UIColor)translucentBackdropColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.800000012];
}

+ (int64_t)tableViewStyle
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (int64_t)editingDoneButtonStyle
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

+ (UIColor)scopeImageViewTintColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] labelColor];
}

+ (UIColor)scopeImageViewBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
}

+ (UIFont)scopeSelectionTitleFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F438C8], 0);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E4F43928]);
  }

  return (UIFont *)v4;
}

+ (UIFont)scopeSubtitleFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43890], 0x8000);
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_preferredFontForSize:weight:", 13.0, *MEMORY[0x1E4F43928]);
  }

  return (UIFont *)v4;
}

+ (UIColor)scopeSubtitleTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] secondaryLabelColor];
}

+ (UIColor)linkColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] linkColor];
}

+ (UIColor)checkmarkDeselectedTintColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] separatorColor];
}

+ (UIColor)editScopeRowBackgroundColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  else {
  v4 = [MEMORY[0x1E4F428B8] clearColor];
  }

  return (UIColor *)v4;
}

+ (UIColor)editScopeInfoLabelTextColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    [MEMORY[0x1E4F428B8] labelColor];
  }
  else {
  v4 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }

  return (UIColor *)v4;
}

+ (UIFont)editScopeInfoLabelFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E4F43870];
  if (!v3) {
    v5 = (void *)MEMORY[0x1E4F43890];
  }
  v6 = objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *v5, v4);

  return (UIFont *)v6;
}

+ (UIColor)editScopeInputFieldTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] labelColor];
}

+ (UIFont)editScopeInputFieldFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E4F43870], 0);
}

+ (BOOL)shouldShowBlurBackground
{
  return 1;
}

+ (UIColor)continueButtonDefaultColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.48 blue:1.0 alpha:1.0];
  }

  return (UIColor *)v4;
}

+ (UIColor)continueButtonDisabledColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3) {
    [MEMORY[0x1E4F428B8] systemGray3Color];
  }
  else {
  uint64_t v4 = [MEMORY[0x1E4F428B8] colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
  }

  return (UIColor *)v4;
}

+ (UIColor)continueButtonHighlightedColor
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
    v5 = [v4 colorWithAlphaComponent:0.25];
  }
  else
  {
    v5 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.48 blue:1.0 alpha:0.25];
  }

  return (UIColor *)v5;
}

+ (UIFont)continueButtonFont
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  uint64_t v4 = *MEMORY[0x1E4F43878];
  if (v3) {
    objc_msgSend(MEMORY[0x1E4F42A30], "ak_dynamicFontWithStyle:traits:", v4, 2);
  }
  else {
  v5 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v4 maximumContentSizeCategory:*MEMORY[0x1E4F43770]];
  }

  return (UIFont *)v5;
}

+ (UIColor)continueButtonTextColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] whiteColor];
}

+ (id)useDifferentIDButtonTextColor
{
  return (id)[MEMORY[0x1E4F428B8] systemGrayColor];
}

+ (UIImageSymbolConfiguration)emailSelectionSymbolConfiguration
{
  v2 = [MEMORY[0x1E4F4F020] sharedManager];
  int v3 = [v2 isLisbonAvailable];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:14.0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (UIImageSymbolConfiguration *)v4;
}

+ (UIButtonConfiguration)dismissButtonConfiguration
{
  v2 = [MEMORY[0x1E4F427E8] tintedButtonConfiguration];
  int v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark"];
  [v2 setImage:v3];

  [v2 setCornerStyle:4];
  uint64_t v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:2 scale:15.0];
  [v2 setPreferredSymbolConfigurationForImage:v4];

  objc_msgSend(v2, "setContentInsets:", 7.0, 8.0, 7.0, 8.0);
  v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v2 setBaseForegroundColor:v5];

  v6 = [MEMORY[0x1E4F428B8] systemGray2Color];
  [v2 setBaseBackgroundColor:v6];

  return (UIButtonConfiguration *)v2;
}

+ (UIButtonConfiguration)clearButtonConfiguration
{
  v2 = [MEMORY[0x1E4F427E8] tintedButtonConfiguration];
  int v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark"];
  [v2 setImage:v3];

  [v2 setCornerStyle:4];
  uint64_t v4 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:-1 scale:10.0];
  [v2 setPreferredSymbolConfigurationForImage:v4];

  v5 = [MEMORY[0x1E4F4F020] sharedManager];
  int v6 = [v5 isLisbonAvailable];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [v2 setBaseForegroundColor:v7];

    [MEMORY[0x1E4F428B8] systemGray2Color];
  }
  else
  {
    v8 = [MEMORY[0x1E4F428B8] systemGray5Color];
    [v2 setBaseForegroundColor:v8];

    [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v9 = };
  [v2 setBaseBackgroundColor:v9];

  return (UIButtonConfiguration *)v2;
}

+ (UIColor)sharedAccountIconBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] systemGrayColor];
}

@end
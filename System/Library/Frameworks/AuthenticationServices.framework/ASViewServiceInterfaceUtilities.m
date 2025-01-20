@interface ASViewServiceInterfaceUtilities
+ (CGColor)iconBorderColor;
+ (CGSize)cellIconSize;
+ (CGSize)headerIconSize;
+ (CGSize)otherAccountsCellIconSize;
+ (UIBackgroundConfiguration)cellBackgroundConfiguration;
+ (UIBlurEffect)paneBackgroundBlurEffect;
+ (UIColor)cellIconBackgroundColor;
+ (UIColor)cellIconTintColor;
+ (UIColor)cellSubtitleColor;
+ (UIColor)cellTitleColor;
+ (UIColor)continueButtonBackgroundColor;
+ (UIColor)continueButtonDisabledBackgroundColor;
+ (UIColor)continueButtonHighlightedBackgroundColor;
+ (UIColor)continueButtonTitleColor;
+ (UIColor)headerMessageColor;
+ (UIColor)headerTitleColor;
+ (UIFont)cellSubtitleFont;
+ (UIFont)cellTitleFont;
+ (UIFont)continueButtonTitleFont;
+ (UIFont)headerTitleFont;
+ (UIImageSymbolConfiguration)cellIconDefaultSymbolConfiguration;
+ (UIImageSymbolConfiguration)cellIconPasskeySymbolConfiguration;
+ (double)_iconCornerRadiusForSize:(CGSize)a3;
+ (double)cellIconCornerRadius;
+ (double)cellIconMarginLeading;
+ (double)cellIconMarginTrailing;
+ (double)continueButtonCornerRadius;
+ (double)continueButtonHeight;
+ (double)continueButtonTitleMargin;
+ (double)headerIconCornerRadius;
+ (double)iconBorderWidth;
+ (double)navigationBarHeight;
+ (double)otherAccountsCellSizeFactor;
+ (double)tableViewRowHeight;
+ (int64_t)tableViewStyle;
@end

@implementation ASViewServiceInterfaceUtilities

+ (CGColor)iconBorderColor
{
  id v2 = [MEMORY[0x263F825C8] systemGray2Color];
  v3 = (CGColor *)[v2 CGColor];

  return v3;
}

+ (double)iconBorderWidth
{
  id v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

+ (int64_t)tableViewStyle
{
  return 2;
}

+ (double)tableViewRowHeight
{
  return 60.0;
}

+ (UIBlurEffect)paneBackgroundBlurEffect
{
  return (UIBlurEffect *)[MEMORY[0x263F824D8] effectWithStyle:9];
}

+ (double)navigationBarHeight
{
  return 56.0;
}

+ (UIFont)headerTitleFont
{
  return (UIFont *)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
}

+ (UIColor)headerTitleColor
{
  return (UIColor *)[MEMORY[0x263F825C8] labelColor];
}

+ (UIColor)headerMessageColor
{
  return (UIColor *)[MEMORY[0x263F825C8] secondaryLabelColor];
}

+ (CGSize)headerIconSize
{
  double v2 = 54.0;
  double v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)headerIconCornerRadius
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ASViewServiceInterfaceUtilities_headerIconCornerRadius__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (headerIconCornerRadius_onceToken != -1) {
    dispatch_once(&headerIconCornerRadius_onceToken, block);
  }
  return *(double *)&headerIconCornerRadius_cornerRadius;
}

uint64_t __57__ASViewServiceInterfaceUtilities_headerIconCornerRadius__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_iconCornerRadiusForSize:", 54.0, 54.0);
  headerIconCornerRadius_cornerRadius = v2;
  return result;
}

+ (UIFont)cellTitleFont
{
  return (UIFont *)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

+ (UIColor)cellTitleColor
{
  return (UIColor *)[MEMORY[0x263F825C8] labelColor];
}

+ (UIFont)cellSubtitleFont
{
  return (UIFont *)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
}

+ (UIColor)cellSubtitleColor
{
  return (UIColor *)[MEMORY[0x263F825C8] secondaryLabelColor];
}

+ (CGSize)cellIconSize
{
  double v2 = 36.0;
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIColor)cellIconTintColor
{
  return (UIColor *)[MEMORY[0x263F825C8] labelColor];
}

+ (UIBackgroundConfiguration)cellBackgroundConfiguration
{
  return (UIBackgroundConfiguration *)[MEMORY[0x263F82498] listGroupedCellConfiguration];
}

+ (double)cellIconCornerRadius
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ASViewServiceInterfaceUtilities_cellIconCornerRadius__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellIconCornerRadius_onceToken != -1) {
    dispatch_once(&cellIconCornerRadius_onceToken, block);
  }
  return *(double *)&cellIconCornerRadius_cornerRadius;
}

uint64_t __55__ASViewServiceInterfaceUtilities_cellIconCornerRadius__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_iconCornerRadiusForSize:", 36.0, 36.0);
  cellIconCornerRadius_cornerRadius = v2;
  return result;
}

+ (double)cellIconMarginLeading
{
  return 18.0;
}

+ (double)cellIconMarginTrailing
{
  return 16.0;
}

+ (UIColor)cellIconBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F825C8] tertiarySystemGroupedBackgroundColor];
}

+ (UIImageSymbolConfiguration)cellIconDefaultSymbolConfiguration
{
  return (UIImageSymbolConfiguration *)[MEMORY[0x263F82818] configurationWithPointSize:17.0];
}

+ (UIImageSymbolConfiguration)cellIconPasskeySymbolConfiguration
{
  return (UIImageSymbolConfiguration *)[MEMORY[0x263F82818] configurationWithPointSize:20.0];
}

+ (UIColor)continueButtonBackgroundColor
{
  uint64_t v2 = [MEMORY[0x263F825C8] systemBlueColor];
  double v3 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:1];
  double v4 = [v2 resolvedColorWithTraitCollection:v3];

  return (UIColor *)v4;
}

+ (UIColor)continueButtonDisabledBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F825C8] systemGrayColor];
}

+ (UIColor)continueButtonHighlightedBackgroundColor
{
  uint64_t v2 = [a1 continueButtonBackgroundColor];
  double v3 = [v2 colorWithAlphaComponent:0.25];

  return (UIColor *)v3;
}

+ (UIFont)continueButtonTitleFont
{
  return (UIFont *)[MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
}

+ (UIColor)continueButtonTitleColor
{
  return (UIColor *)[MEMORY[0x263F825C8] whiteColor];
}

+ (double)continueButtonTitleMargin
{
  return 27.0;
}

+ (double)continueButtonCornerRadius
{
  return 10.0;
}

+ (double)continueButtonHeight
{
  return 44.0;
}

+ (double)otherAccountsCellSizeFactor
{
  return 0.8;
}

+ (CGSize)otherAccountsCellIconSize
{
  [a1 cellIconSize];
  double v4 = v3;
  [a1 otherAccountsCellSizeFactor];
  double v6 = v4 * v5;
  [a1 cellIconSize];
  double v8 = v7;
  [a1 otherAccountsCellSizeFactor];
  double v10 = v8 * v9;
  double v11 = v6;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (double)_iconCornerRadiusForSize:(CGSize)a3
{
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", a3.width, a3.height, 1.0);
  [v3 setShape:1];
  [v3 continuousCornerRadius];
  double v5 = v4;

  return v5;
}

@end
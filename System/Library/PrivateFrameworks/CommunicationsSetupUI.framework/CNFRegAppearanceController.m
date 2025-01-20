@interface CNFRegAppearanceController
+ (id)appearanceControllerForStyle:(int64_t)a3;
+ (id)globalAppearanceController;
+ (id)gradientAppearanceController;
+ (id)modernAppearanceController;
+ (id)modernTransparentDarkAppearanceController;
+ (id)modernTransparentLightAppearanceController;
+ (id)stripedAppearanceController;
- (BOOL)actionSheetsUsePopoverStyle;
- (BOOL)firstNavigationBarHidden;
- (BOOL)learnMoreButtonDrawsUnderline;
- (BOOL)navigationBarHidesShadow;
- (BOOL)navigationBarHidesTitle;
- (BOOL)navigationBarIsTranslucent;
- (BOOL)navigationBarTranslucent;
- (BOOL)splashScreenShowsIcon;
- (BOOL)styleUsesCustomAccessoryView;
- (BOOL)styleUsesCustomSearchResultsStyle;
- (BOOL)styleUsesCustomSeparatorStyle;
- (BOOL)styleUsesCustomTableStyle;
- (BOOL)webViewDrawsShadows;
- (BOOL)webViewIsOpaque;
- (CGSize)tableHeaderTextShadowOffset;
- (UIColor)customBackgroundColor;
- (UIColor)learnMoreShadowColor;
- (UIColor)learnMoreTextColor;
- (UIColor)navigationBarTintColor;
- (UIColor)searchResultsTableSeparatorBottomShadowColor;
- (UIColor)searchResultsTableSeparatorColor;
- (UIColor)searchResultsTableSeparatorTopShadowColor;
- (UIColor)splashEntryFieldLabelTextColor;
- (UIColor)splashEntryFieldTextColor;
- (UIColor)splashEntryPlaceholderTextColor;
- (UIColor)splashSignInFieldsBackgroundColor;
- (UIColor)splashSignInFieldsBorderColor;
- (UIColor)splashTitleLabelTextColor;
- (UIColor)tableBackgroundColor;
- (UIColor)tableCellBackgroundColor;
- (UIColor)tableCellDetailLabelBackgroundColor;
- (UIColor)tableCellDetailLabelColor;
- (UIColor)tableCellEditableInsertionPointColor;
- (UIColor)tableCellEditableTextColor;
- (UIColor)tableCellEditableTextPlaceholderColor;
- (UIColor)tableCellTextLabelBackgroundColor;
- (UIColor)tableCellTextLabelColor;
- (UIColor)tableFooterTextColor;
- (UIColor)tableHeaderTextColor;
- (UIColor)tableHeaderTextShadowColor;
- (UIColor)tableSectionBorderColor;
- (UIColor)tableSeparatorBottomShadowColor;
- (UIColor)tableSeparatorColor;
- (UIColor)tableSeparatorTopShadowColor;
- (UIColor)userInteractionColor;
- (UIColor)webViewBackgroundColor;
- (UIFont)tableHeaderFont;
- (UIImage)learnMoreArrowImage;
- (UIImage)navigationBarBackgroundImage;
- (UIImage)tableCellButtonImage;
- (UIImage)tableCellButtonImageSelected;
- (UIImage)tableCellCheckmarkImage;
- (UIImage)tableCellCheckmarkImageDisabled;
- (UIImage)tableCellCheckmarkImageSelected;
- (UIImage)tableCellEditableTextFieldClearButton;
- (UIImage)tableCellEditableTextFieldClearButtonPressed;
- (UIImage)tableSectionShadowImage;
- (UIView)tableCellCustomAccessoryViewDisclosureIndicator;
- (UIView)webViewBackgroundView;
- (int64_t)keyboardAppearance;
- (int64_t)modalPresentationStyle;
- (int64_t)navigationBarActivityIndicatorStyle;
- (int64_t)navigationBarStyle;
- (int64_t)searchResultsTableSeparatorStyle;
- (int64_t)splashSignInProgressIndicatorColor;
- (int64_t)tableFooterTextAlignment;
- (int64_t)tableHeaderTextAlignment;
- (int64_t)tableSeparatorStyle;
@end

@implementation CNFRegAppearanceController

- (int64_t)keyboardAppearance
{
  return 0;
}

- (BOOL)styleUsesCustomTableStyle
{
  return 0;
}

- (BOOL)styleUsesCustomAccessoryView
{
  return 0;
}

- (BOOL)styleUsesCustomSeparatorStyle
{
  return 0;
}

- (BOOL)styleUsesCustomSearchResultsStyle
{
  return 0;
}

- (UIColor)customBackgroundColor
{
  return 0;
}

- (UIColor)userInteractionColor
{
  v2 = (void *)userInteractionColor_color;
  if (!userInteractionColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0784313753 green:0.435294122 blue:0.874509811 alpha:1.0];
    v4 = (void *)userInteractionColor_color;
    userInteractionColor_color = v3;

    v2 = (void *)userInteractionColor_color;
  }
  return (UIColor *)v2;
}

- (UIColor)tableBackgroundColor
{
  return 0;
}

- (int64_t)tableSeparatorStyle
{
  return 1;
}

- (UIColor)tableSeparatorColor
{
  return 0;
}

- (UIColor)tableSeparatorTopShadowColor
{
  return 0;
}

- (UIColor)tableSeparatorBottomShadowColor
{
  return 0;
}

- (UIColor)tableCellBackgroundColor
{
  return 0;
}

- (UIColor)tableCellTextLabelColor
{
  return 0;
}

- (UIColor)tableCellTextLabelBackgroundColor
{
  return 0;
}

- (UIColor)tableCellDetailLabelColor
{
  return 0;
}

- (UIColor)tableCellDetailLabelBackgroundColor
{
  return 0;
}

- (UIImage)tableCellButtonImage
{
  return 0;
}

- (UIImage)tableCellButtonImageSelected
{
  return 0;
}

- (UIColor)tableCellEditableTextColor
{
  return 0;
}

- (UIColor)tableCellEditableTextPlaceholderColor
{
  return 0;
}

- (UIColor)tableSectionBorderColor
{
  return 0;
}

- (UIImage)tableSectionShadowImage
{
  return 0;
}

- (UIColor)tableCellEditableInsertionPointColor
{
  return 0;
}

- (UIImage)tableCellEditableTextFieldClearButton
{
  return 0;
}

- (UIImage)tableCellEditableTextFieldClearButtonPressed
{
  return 0;
}

- (UIView)tableCellCustomAccessoryViewDisclosureIndicator
{
  return 0;
}

- (UIImage)tableCellCheckmarkImage
{
  v2 = (void *)tableCellCheckmarkImage_sTintedImage;
  if (!tableCellCheckmarkImage_sTintedImage)
  {
    uint64_t v3 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    v4 = [MEMORY[0x263F825C8] _labelColor];
    uint64_t v5 = [v3 _flatImageWithColor:v4];
    v6 = (void *)tableCellCheckmarkImage_sTintedImage;
    tableCellCheckmarkImage_sTintedImage = v5;

    v2 = (void *)tableCellCheckmarkImage_sTintedImage;
  }
  return (UIImage *)v2;
}

- (UIImage)tableCellCheckmarkImageSelected
{
  return (UIImage *)[MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesWhiteCheck.png"];
}

- (UIImage)tableCellCheckmarkImageDisabled
{
  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_0;
  if (!tableCellCheckmarkImageDisabled_sTintedImage_0)
  {
    uint64_t v3 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    v4 = [MEMORY[0x263F825C8] _tertiaryLabelColor];
    uint64_t v5 = [v3 _flatImageWithColor:v4];
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_0;
    tableCellCheckmarkImageDisabled_sTintedImage_0 = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_0;
  }
  return (UIImage *)v2;
}

- (UIColor)tableHeaderTextColor
{
  return (UIColor *)MEMORY[0x270F55370](self, a2);
}

- (UIColor)tableHeaderTextShadowColor
{
  return 0;
}

- (CGSize)tableHeaderTextShadowOffset
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)tableHeaderFont
{
  return (UIFont *)MEMORY[0x270F55378](self, a2);
}

- (UIColor)tableFooterTextColor
{
  return (UIColor *)MEMORY[0x270F55360](self, a2);
}

- (int64_t)tableHeaderTextAlignment
{
  return 4;
}

- (int64_t)tableFooterTextAlignment
{
  return 4;
}

- (int64_t)searchResultsTableSeparatorStyle
{
  return 1;
}

- (UIColor)searchResultsTableSeparatorColor
{
  return 0;
}

- (UIColor)searchResultsTableSeparatorTopShadowColor
{
  return 0;
}

- (UIColor)searchResultsTableSeparatorBottomShadowColor
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (UIView)webViewBackgroundView
{
  return 0;
}

- (UIColor)webViewBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F825C8] whiteColor];
}

- (BOOL)webViewIsOpaque
{
  return 1;
}

- (BOOL)webViewDrawsShadows
{
  return 1;
}

- (BOOL)splashScreenShowsIcon
{
  return 1;
}

- (UIColor)splashTitleLabelTextColor
{
  return (UIColor *)[MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_0];
}

id __55__CNFRegAppearanceController_splashTitleLabelTextColor__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (void *)[a2 userInterfaceStyle];
  if ((unint64_t)v2 >= 2)
  {
    if (v2 != (void *)2) {
      goto LABEL_6;
    }
    double v3 = (void *)MEMORY[0x263F825C8];
    double v4 = 0.854901961;
  }
  else
  {
    double v3 = (void *)MEMORY[0x263F825C8];
    double v4 = 0.145098039;
  }
  double v2 = [v3 colorWithRed:v4 green:v4 blue:v4 alpha:1.0];
LABEL_6:
  return v2;
}

- (UIColor)splashEntryFieldTextColor
{
  return 0;
}

- (UIColor)splashEntryPlaceholderTextColor
{
  return 0;
}

- (UIColor)splashEntryFieldLabelTextColor
{
  return 0;
}

- (UIColor)splashSignInFieldsBorderColor
{
  double v2 = (void *)splashSignInFieldsBorderColor_color_0;
  if (!splashSignInFieldsBorderColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.298039228];
    double v4 = (void *)splashSignInFieldsBorderColor_color_0;
    splashSignInFieldsBorderColor_color_0 = v3;

    double v2 = (void *)splashSignInFieldsBorderColor_color_0;
  }
  return (UIColor *)v2;
}

- (UIColor)splashSignInFieldsBackgroundColor
{
  double v2 = (void *)splashSignInFieldsBackgroundColor_color;
  if (!splashSignInFieldsBackgroundColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    double v4 = (void *)splashSignInFieldsBackgroundColor_color;
    splashSignInFieldsBackgroundColor_color = v3;

    double v2 = (void *)splashSignInFieldsBackgroundColor_color;
  }
  return (UIColor *)v2;
}

- (int64_t)splashSignInProgressIndicatorColor
{
  return 2;
}

- (int64_t)navigationBarStyle
{
  return 0;
}

- (BOOL)navigationBarIsTranslucent
{
  return 0;
}

- (int64_t)navigationBarActivityIndicatorStyle
{
  return 2;
}

- (BOOL)firstNavigationBarHidden
{
  return 0;
}

- (BOOL)navigationBarHidesTitle
{
  return 0;
}

- (BOOL)navigationBarHidesShadow
{
  return 0;
}

- (UIColor)navigationBarTintColor
{
  return 0;
}

- (BOOL)navigationBarTranslucent
{
  return 1;
}

- (UIImage)navigationBarBackgroundImage
{
  return 0;
}

- (UIColor)learnMoreTextColor
{
  double v2 = (void *)learnMoreTextColor_color;
  if (!learnMoreTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.298039228 green:0.337254912 blue:0.423529416 alpha:1.0];
    double v4 = (void *)learnMoreTextColor_color;
    learnMoreTextColor_color = v3;

    double v2 = (void *)learnMoreTextColor_color;
  }
  return (UIColor *)v2;
}

- (UIColor)learnMoreShadowColor
{
  return (UIColor *)[MEMORY[0x263F825C8] whiteColor];
}

- (UIImage)learnMoreArrowImage
{
  double v2 = (void *)MEMORY[0x263F827E8];
  uint64_t v3 = CommunicationsSetupUIBundle();
  double v4 = [v2 imageNamed:@"arrowbutton-default" inBundle:v3];

  return (UIImage *)v4;
}

- (BOOL)learnMoreButtonDrawsUnderline
{
  return 1;
}

- (BOOL)actionSheetsUsePopoverStyle
{
  return 0;
}

+ (id)globalAppearanceController
{
  uint64_t v3 = CNFRegGlobalAppearanceStyle();
  return (id)[a1 appearanceControllerForStyle:v3];
}

+ (id)appearanceControllerForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = [a1 stripedAppearanceController];
      break;
    case 2:
      uint64_t v3 = [a1 gradientAppearanceController];
      break;
    case 3:
    case 6:
      uint64_t v3 = [a1 modernTransparentDarkAppearanceController];
      break;
    case 4:
      uint64_t v3 = [a1 modernAppearanceController];
      break;
    case 5:
      uint64_t v3 = [a1 modernTransparentLightAppearanceController];
      break;
    default:
      uint64_t v3 = [a1 defaultAppearanceController];
      break;
  }
  return v3;
}

+ (id)stripedAppearanceController
{
  double v2 = (void *)stripedAppearanceController_controller;
  if (!stripedAppearanceController_controller)
  {
    uint64_t v3 = objc_alloc_init(CNFRegStripedAppearanceController);
    double v4 = (void *)stripedAppearanceController_controller;
    stripedAppearanceController_controller = (uint64_t)v3;

    double v2 = (void *)stripedAppearanceController_controller;
  }
  return v2;
}

+ (id)gradientAppearanceController
{
  double v2 = (void *)gradientAppearanceController_controller;
  if (!gradientAppearanceController_controller)
  {
    uint64_t v3 = objc_alloc_init(CNFRegGradientAppearanceController);
    double v4 = (void *)gradientAppearanceController_controller;
    gradientAppearanceController_controller = (uint64_t)v3;

    double v2 = (void *)gradientAppearanceController_controller;
  }
  return v2;
}

+ (id)modernAppearanceController
{
  double v2 = (void *)modernAppearanceController_controller;
  if (!modernAppearanceController_controller)
  {
    uint64_t v3 = objc_alloc_init(CNFRegModernAppearanceController);
    double v4 = (void *)modernAppearanceController_controller;
    modernAppearanceController_controller = (uint64_t)v3;

    double v2 = (void *)modernAppearanceController_controller;
  }
  return v2;
}

+ (id)modernTransparentLightAppearanceController
{
  double v2 = (void *)modernTransparentLightAppearanceController_controller;
  if (!modernTransparentLightAppearanceController_controller)
  {
    uint64_t v3 = objc_alloc_init(CNFRegModernTransparentLightAppearanceController);
    double v4 = (void *)modernTransparentLightAppearanceController_controller;
    modernTransparentLightAppearanceController_controller = (uint64_t)v3;

    double v2 = (void *)modernTransparentLightAppearanceController_controller;
  }
  return v2;
}

+ (id)modernTransparentDarkAppearanceController
{
  double v2 = (void *)modernTransparentDarkAppearanceController_controller;
  if (!modernTransparentDarkAppearanceController_controller)
  {
    uint64_t v3 = objc_alloc_init(CNFRegModernTransparentDarkAppearanceController);
    double v4 = (void *)modernTransparentDarkAppearanceController_controller;
    modernTransparentDarkAppearanceController_controller = (uint64_t)v3;

    double v2 = (void *)modernTransparentDarkAppearanceController_controller;
  }
  return v2;
}

@end
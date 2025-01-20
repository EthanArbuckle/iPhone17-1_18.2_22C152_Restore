@interface CNFRegModernTransparentLightAppearanceController
- (BOOL)splashScreenShowsIcon;
- (id)navigationBarTintColor;
- (id)splashEntryFieldLabelTextColor;
- (id)splashEntryFieldTextColor;
- (id)splashEntryPlaceholderTextColor;
- (id)splashSignInFieldsBackgroundColor;
- (id)splashSignInFieldsBorderColor;
- (id)tableBackgroundColor;
- (id)tableCellCheckmarkImageDisabled;
- (int64_t)modalPresentationStyle;
- (int64_t)navigationBarActivityIndicatorStyle;
@end

@implementation CNFRegModernTransparentLightAppearanceController

- (id)tableBackgroundColor
{
  v2 = (void *)tableBackgroundColor_color_1;
  if (!tableBackgroundColor_color_1)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)tableBackgroundColor_color_1;
    tableBackgroundColor_color_1 = v3;

    v2 = (void *)tableBackgroundColor_color_1;
  }
  return v2;
}

- (id)tableCellCheckmarkImageDisabled
{
  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_2;
  if (!tableCellCheckmarkImageDisabled_sTintedImage_2)
  {
    uint64_t v3 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    v4 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v5 = [v3 _flatImageWithColor:v4];
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_2;
    tableCellCheckmarkImageDisabled_sTintedImage_2 = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_2;
  }
  return v2;
}

- (BOOL)splashScreenShowsIcon
{
  return 0;
}

- (id)splashEntryFieldTextColor
{
  return 0;
}

- (id)splashEntryPlaceholderTextColor
{
  v2 = (void *)splashEntryPlaceholderTextColor_color_0;
  if (!splashEntryPlaceholderTextColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.266666681 green:0.266666681 blue:0.266666681 alpha:1.0];
    v4 = (void *)splashEntryPlaceholderTextColor_color_0;
    splashEntryPlaceholderTextColor_color_0 = v3;

    v2 = (void *)splashEntryPlaceholderTextColor_color_0;
  }
  return v2;
}

- (id)splashEntryFieldLabelTextColor
{
  v2 = (void *)splashEntryFieldLabelTextColor_color_0;
  if (!splashEntryFieldLabelTextColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.00392156886 green:0.00392156886 blue:0.00392156886 alpha:1.0];
    v4 = (void *)splashEntryFieldLabelTextColor_color_0;
    splashEntryFieldLabelTextColor_color_0 = v3;

    v2 = (void *)splashEntryFieldLabelTextColor_color_0;
  }
  return v2;
}

- (id)splashSignInFieldsBorderColor
{
  v2 = (void *)splashSignInFieldsBorderColor_color_1;
  if (!splashSignInFieldsBorderColor_color_1)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.00392156886 green:0.00392156886 blue:0.00392156886 alpha:1.0];
    v4 = (void *)splashSignInFieldsBorderColor_color_1;
    splashSignInFieldsBorderColor_color_1 = v3;

    v2 = (void *)splashSignInFieldsBorderColor_color_1;
  }
  return v2;
}

- (id)splashSignInFieldsBackgroundColor
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 3;
}

- (int64_t)navigationBarActivityIndicatorStyle
{
  return 1;
}

- (id)navigationBarTintColor
{
  v2 = (void *)navigationBarTintColor_color_0;
  if (!navigationBarTintColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)navigationBarTintColor_color_0;
    navigationBarTintColor_color_0 = v3;

    v2 = (void *)navigationBarTintColor_color_0;
  }
  return v2;
}

@end
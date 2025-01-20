@interface CNFRegModernTransparentDarkAppearanceController
- (BOOL)navigationBarTranslucent;
- (BOOL)splashScreenShowsIcon;
- (BOOL)styleUsesCustomTableStyle;
- (id)customBackgroundColor;
- (id)navigationBarBackgroundImage;
- (id)navigationBarTintColor;
- (id)splashEntryFieldLabelTextColor;
- (id)splashEntryFieldTextColor;
- (id)splashEntryPlaceholderTextColor;
- (id)splashSignInFieldsBackgroundColor;
- (id)splashSignInFieldsBorderColor;
- (id)splashTitleLabelTextColor;
- (id)tableBackgroundColor;
- (id)tableCellBackgroundColor;
- (id)tableCellCheckmarkImageDisabled;
- (id)tableCellDetailLabelBackgroundColor;
- (id)tableCellDetailLabelColor;
- (id)tableCellEditableTextFieldClearButton;
- (id)tableCellEditableTextFieldClearButtonPressed;
- (id)tableCellTextLabelBackgroundColor;
- (id)tableCellTextLabelColor;
- (id)tableFooterTextColor;
- (id)tableHeaderTextColor;
- (id)tableSeparatorColor;
- (id)userInteractionColor;
- (int64_t)keyboardAppearance;
- (int64_t)modalPresentationStyle;
- (int64_t)navigationBarActivityIndicatorStyle;
- (int64_t)navigationBarStyle;
- (int64_t)splashSignInProgressIndicatorColor;
- (int64_t)tableSeparatorStyle;
@end

@implementation CNFRegModernTransparentDarkAppearanceController

- (int64_t)keyboardAppearance
{
  return 1;
}

- (BOOL)styleUsesCustomTableStyle
{
  return 1;
}

- (id)customBackgroundColor
{
  v2 = (void *)customBackgroundColor_color;
  if (!customBackgroundColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)customBackgroundColor_color;
    customBackgroundColor_color = v3;

    v2 = (void *)customBackgroundColor_color;
  }
  return v2;
}

- (id)userInteractionColor
{
  return (id)[MEMORY[0x263F825C8] systemTealColor];
}

- (id)tableBackgroundColor
{
  v2 = (void *)tableBackgroundColor_color;
  if (!tableBackgroundColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)tableBackgroundColor_color;
    tableBackgroundColor_color = v3;

    v2 = (void *)tableBackgroundColor_color;
  }
  return v2;
}

- (id)tableCellCheckmarkImageDisabled
{
  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  if (!tableCellCheckmarkImageDisabled_sTintedImage)
  {
    uint64_t v3 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    v4 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v5 = [v3 _flatImageWithColor:v4];
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
    tableCellCheckmarkImageDisabled_sTintedImage = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  }
  return v2;
}

- (id)tableCellEditableTextFieldClearButton
{
  v2 = (void *)MEMORY[0x263F827E8];
  uint64_t v3 = CommunicationsSetupUIBundle();
  v4 = [v2 imageNamed:@"UITextFieldClearButton-white" inBundle:v3];

  return v4;
}

- (id)tableCellEditableTextFieldClearButtonPressed
{
  return 0;
}

- (id)tableCellTextLabelBackgroundColor
{
  v2 = (void *)tableCellTextLabelBackgroundColor_color;
  if (!tableCellTextLabelBackgroundColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)tableCellTextLabelBackgroundColor_color;
    tableCellTextLabelBackgroundColor_color = v3;

    v2 = (void *)tableCellTextLabelBackgroundColor_color;
  }
  return v2;
}

- (id)tableCellBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.200000003];
}

- (id)tableCellTextLabelColor
{
  v2 = (void *)tableCellTextLabelColor_color;
  if (!tableCellTextLabelColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)tableCellTextLabelColor_color;
    tableCellTextLabelColor_color = v3;

    v2 = (void *)tableCellTextLabelColor_color;
  }
  return v2;
}

- (id)tableCellDetailLabelColor
{
  v2 = (void *)tableCellDetailLabelColor_color;
  if (!tableCellDetailLabelColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)tableCellDetailLabelColor_color;
    tableCellDetailLabelColor_color = v3;

    v2 = (void *)tableCellDetailLabelColor_color;
  }
  return v2;
}

- (id)tableCellDetailLabelBackgroundColor
{
  v2 = (void *)tableCellDetailLabelBackgroundColor_color;
  if (!tableCellDetailLabelBackgroundColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)tableCellDetailLabelBackgroundColor_color;
    tableCellDetailLabelBackgroundColor_color = v3;

    v2 = (void *)tableCellDetailLabelBackgroundColor_color;
  }
  return v2;
}

- (int64_t)tableSeparatorStyle
{
  return 1;
}

- (id)tableSeparatorColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
}

- (id)tableHeaderTextColor
{
  v2 = (void *)tableHeaderTextColor_color;
  if (!tableHeaderTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)tableHeaderTextColor_color;
    tableHeaderTextColor_color = v3;

    v2 = (void *)tableHeaderTextColor_color;
  }
  return v2;
}

- (id)tableFooterTextColor
{
  v2 = (void *)tableFooterTextColor_color;
  if (!tableFooterTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)tableFooterTextColor_color;
    tableFooterTextColor_color = v3;

    v2 = (void *)tableFooterTextColor_color;
  }
  return v2;
}

- (BOOL)splashScreenShowsIcon
{
  return 0;
}

- (id)splashTitleLabelTextColor
{
  v2 = (void *)splashTitleLabelTextColor_color;
  if (!splashTitleLabelTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)splashTitleLabelTextColor_color;
    splashTitleLabelTextColor_color = v3;

    v2 = (void *)splashTitleLabelTextColor_color;
  }
  return v2;
}

- (id)splashEntryFieldTextColor
{
  v2 = (void *)splashEntryFieldTextColor_color;
  if (!splashEntryFieldTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)splashEntryFieldTextColor_color;
    splashEntryFieldTextColor_color = v3;

    v2 = (void *)splashEntryFieldTextColor_color;
  }
  return v2;
}

- (id)splashEntryPlaceholderTextColor
{
  v2 = (void *)splashEntryPlaceholderTextColor_color;
  if (!splashEntryPlaceholderTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.588235319 green:0.588235319 blue:0.588235319 alpha:1.0];
    v4 = (void *)splashEntryPlaceholderTextColor_color;
    splashEntryPlaceholderTextColor_color = v3;

    v2 = (void *)splashEntryPlaceholderTextColor_color;
  }
  return v2;
}

- (id)splashEntryFieldLabelTextColor
{
  v2 = (void *)splashEntryFieldLabelTextColor_color;
  if (!splashEntryFieldLabelTextColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)splashEntryFieldLabelTextColor_color;
    splashEntryFieldLabelTextColor_color = v3;

    v2 = (void *)splashEntryFieldLabelTextColor_color;
  }
  return v2;
}

- (id)splashSignInFieldsBorderColor
{
  v2 = (void *)splashSignInFieldsBorderColor_color;
  if (!splashSignInFieldsBorderColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)splashSignInFieldsBorderColor_color;
    splashSignInFieldsBorderColor_color = v3;

    v2 = (void *)splashSignInFieldsBorderColor_color;
  }
  return v2;
}

- (id)splashSignInFieldsBackgroundColor
{
  return 0;
}

- (int64_t)splashSignInProgressIndicatorColor
{
  return 1;
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
  v2 = (void *)navigationBarTintColor_color;
  if (!navigationBarTintColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)navigationBarTintColor_color;
    navigationBarTintColor_color = v3;

    v2 = (void *)navigationBarTintColor_color;
  }
  return v2;
}

- (BOOL)navigationBarTranslucent
{
  return 1;
}

- (id)navigationBarBackgroundImage
{
  id v2 = objc_alloc_init(MEMORY[0x263F827E8]);
  return v2;
}

- (int64_t)navigationBarStyle
{
  return 1;
}

@end
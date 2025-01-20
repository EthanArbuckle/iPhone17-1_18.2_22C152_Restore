@interface CNFRegModernAppearanceController
- (BOOL)firstNavigationBarHidden;
- (BOOL)navigationBarHidesShadow;
- (BOOL)navigationBarHidesTitle;
- (BOOL)styleUsesCustomTableStyle;
- (BOOL)webViewDrawsShadows;
- (BOOL)webViewIsOpaque;
- (id)tableBackgroundColor;
- (id)tableCellCheckmarkImage;
- (id)tableCellCheckmarkImageDisabled;
- (id)tableCellDetailLabelBackgroundColor;
- (id)tableCellDetailLabelColor;
- (id)tableCellTextLabelBackgroundColor;
- (id)tableCellTextLabelColor;
- (id)tableFooterFont;
- (id)tableFooterTextColor;
- (id)tableHeaderFont;
- (id)tableHeaderTextColor;
- (id)webViewBackgroundColor;
- (id)webViewBackgroundView;
- (int64_t)modalPresentationStyle;
- (int64_t)tableFooterTextAlignment;
- (int64_t)tableHeaderTextAlignment;
@end

@implementation CNFRegModernAppearanceController

- (BOOL)styleUsesCustomTableStyle
{
  return 1;
}

- (id)tableBackgroundColor
{
  v2 = (void *)tableBackgroundColor_color_0;
  if (!tableBackgroundColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)tableBackgroundColor_color_0;
    tableBackgroundColor_color_0 = v3;

    v2 = (void *)tableBackgroundColor_color_0;
  }
  return v2;
}

- (BOOL)firstNavigationBarHidden
{
  return 1;
}

- (BOOL)navigationBarHidesTitle
{
  return 1;
}

- (BOOL)navigationBarHidesShadow
{
  return 1;
}

- (id)tableCellTextLabelBackgroundColor
{
  v2 = (void *)tableCellTextLabelBackgroundColor_color_0;
  if (!tableCellTextLabelBackgroundColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v4 = (void *)tableCellTextLabelBackgroundColor_color_0;
    tableCellTextLabelBackgroundColor_color_0 = v3;

    v2 = (void *)tableCellTextLabelBackgroundColor_color_0;
  }
  return v2;
}

- (id)tableCellTextLabelColor
{
  v2 = (void *)tableCellTextLabelColor_color_0;
  if (!tableCellTextLabelColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v4 = (void *)tableCellTextLabelColor_color_0;
    tableCellTextLabelColor_color_0 = v3;

    v2 = (void *)tableCellTextLabelColor_color_0;
  }
  return v2;
}

- (id)tableCellDetailLabelColor
{
  v2 = (void *)tableCellDetailLabelColor_color_0;
  if (!tableCellDetailLabelColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v4 = (void *)tableCellDetailLabelColor_color_0;
    tableCellDetailLabelColor_color_0 = v3;

    v2 = (void *)tableCellDetailLabelColor_color_0;
  }
  return v2;
}

- (id)tableCellDetailLabelBackgroundColor
{
  v2 = (void *)tableCellDetailLabelBackgroundColor_color_0;
  if (!tableCellDetailLabelBackgroundColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v4 = (void *)tableCellDetailLabelBackgroundColor_color_0;
    tableCellDetailLabelBackgroundColor_color_0 = v3;

    v2 = (void *)tableCellDetailLabelBackgroundColor_color_0;
  }
  return v2;
}

- (id)tableHeaderFont
{
  return (id)[MEMORY[0x263F81708] _thinSystemFontOfSize:35.0];
}

- (id)tableFooterFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:17.0];
}

- (id)tableHeaderTextColor
{
  v2 = (void *)tableHeaderTextColor_color_0;
  if (!tableHeaderTextColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.145098045 green:0.145098045 blue:0.145098045 alpha:1.0];
    v4 = (void *)tableHeaderTextColor_color_0;
    tableHeaderTextColor_color_0 = v3;

    v2 = (void *)tableHeaderTextColor_color_0;
  }
  return v2;
}

- (id)tableFooterTextColor
{
  v2 = (void *)tableFooterTextColor_color_0;
  if (!tableFooterTextColor_color_0)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.145098045 green:0.145098045 blue:0.145098045 alpha:1.0];
    v4 = (void *)tableFooterTextColor_color_0;
    tableFooterTextColor_color_0 = v3;

    v2 = (void *)tableFooterTextColor_color_0;
  }
  return v2;
}

- (int64_t)tableHeaderTextAlignment
{
  return 1;
}

- (int64_t)tableFooterTextAlignment
{
  return 4;
}

- (id)tableCellCheckmarkImage
{
  uint64_t v3 = (void *)tableCellCheckmarkImage_sTintedImage_0;
  if (!tableCellCheckmarkImage_sTintedImage_0)
  {
    v4 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    v5 = [(CNFRegAppearanceController *)self userInteractionColor];
    uint64_t v6 = [v4 _flatImageWithColor:v5];
    v7 = (void *)tableCellCheckmarkImage_sTintedImage_0;
    tableCellCheckmarkImage_sTintedImage_0 = v6;

    uint64_t v3 = (void *)tableCellCheckmarkImage_sTintedImage_0;
  }
  return v3;
}

- (id)tableCellCheckmarkImageDisabled
{
  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_1;
  if (!tableCellCheckmarkImageDisabled_sTintedImage_1)
  {
    uint64_t v3 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesBlueCheck.png"];
    v4 = [MEMORY[0x263F825C8] colorWithRed:0.698039216 green:0.698039216 blue:0.698039216 alpha:1.0];
    uint64_t v5 = [v3 _flatImageWithColor:v4];
    uint64_t v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_1;
    tableCellCheckmarkImageDisabled_sTintedImage_1 = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_1;
  }
  return v2;
}

- (int64_t)modalPresentationStyle
{
  return 2 * (UserInterfaceIdiom() != 1);
}

- (id)webViewBackgroundView
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:style:", 1, 0.0, 0.0, 1.0, 1.0);
  [v2 setAutoresizingMask:18];
  return v2;
}

- (id)webViewBackgroundColor
{
  return 0;
}

- (BOOL)webViewIsOpaque
{
  return 0;
}

- (BOOL)webViewDrawsShadows
{
  return 0;
}

@end
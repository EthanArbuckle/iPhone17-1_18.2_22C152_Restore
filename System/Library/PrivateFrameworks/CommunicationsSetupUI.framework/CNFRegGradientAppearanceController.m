@interface CNFRegGradientAppearanceController
- (BOOL)actionSheetsUsePopoverStyle;
- (BOOL)webViewDrawsShadows;
- (BOOL)webViewIsOpaque;
- (id)webViewBackgroundColor;
- (int64_t)modalPresentationStyle;
- (int64_t)navigationBarActivityIndicatorStyle;
@end

@implementation CNFRegGradientAppearanceController

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (int64_t)navigationBarActivityIndicatorStyle
{
  return 2;
}

- (BOOL)actionSheetsUsePopoverStyle
{
  return 1;
}

- (id)webViewBackgroundColor
{
  v2 = (void *)webViewBackgroundColor_color;
  if (!webViewBackgroundColor_color)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.886274517 green:0.898039222 blue:0.917647064 alpha:1.0];
    v4 = (void *)webViewBackgroundColor_color;
    webViewBackgroundColor_color = v3;

    v2 = (void *)webViewBackgroundColor_color;
  }
  return v2;
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
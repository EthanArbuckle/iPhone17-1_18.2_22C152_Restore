@interface CNFRegStripedAppearanceController
- (BOOL)webViewDrawsShadows;
- (BOOL)webViewIsOpaque;
- (id)webViewBackgroundColor;
- (id)webViewBackgroundView;
@end

@implementation CNFRegStripedAppearanceController

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
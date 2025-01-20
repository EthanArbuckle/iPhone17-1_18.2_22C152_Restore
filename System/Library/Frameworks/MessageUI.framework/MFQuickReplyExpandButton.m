@interface MFQuickReplyExpandButton
+ (id)buttonWithType:(int64_t)a3;
- (id)_quickReplyExpandButtonPointerStyleInView:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation MFQuickReplyExpandButton

+ (id)buttonWithType:(int64_t)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MFQuickReplyExpandButton;
  v3 = objc_msgSendSuper2(&v8, sel_buttonWithType_, a3);
  v4 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForView:", 24);
  [v3 setPreferredSymbolConfiguration:v4 forImageInState:0];

  v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.left.square"];
  [v3 setImage:v5 forState:0];

  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F73CB8]];
  [v3 setShowsLargeContentViewer:1];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
  [v3 addInteraction:v6];

  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v4 = -[MFQuickReplyExpandButton _quickReplyExpandButtonPointerStyleInView:](self, "_quickReplyExpandButtonPointerStyleInView:", self, a4);

  return v4;
}

- (id)_quickReplyExpandButtonPointerStyleInView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1AB0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  v7 = [v5 effectWithPreview:v6];

  [v4 frame];
  objc_super v8 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:");
  v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v7 shape:v8];

  return v9;
}

@end
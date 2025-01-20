@interface MFComposeSendAccessoryButton
+ (id)buttonWithType:(int64_t)a3;
- (id)_pointerShapeForTargetedPreview:(id)a3;
- (id)_preview;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFComposeSendAccessoryButton

+ (id)buttonWithType:(int64_t)a3
{
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___MFComposeSendAccessoryButton;
  v3 = objc_msgSendSuper2(&v13, sel_buttonWithType_, a3);
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle.fill"];
  v5 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForView:", 14);
  [v5 setPreferredSymbolConfigurationForImage:v6];

  [v5 setImage:v4];
  objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  v7 = [MEMORY[0x1E4FB1618] clearColor];
  v8 = [v5 background];
  [v8 setBackgroundColor:v7];

  [v3 setConfiguration:v5];
  [v3 setLargeContentImage:v4];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
  [v3 setLargeContentTitle:v10];

  [v3 setShowsLargeContentViewer:1];
  [v3 setScalesLargeContentImage:1];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F73C88]];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
  [v3 addInteraction:v11];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeSendAccessoryButton;
  [(MFComposeSendAccessoryButton *)&v10 traitCollectionDidChange:v4];
  if (!v4
    || ([(MFComposeSendAccessoryButton *)self traitCollection],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceStyle],
        uint64_t v7 = [v4 userInterfaceStyle],
        v5,
        v6 != v7))
  {
    v8 = [(MFComposeSendAccessoryButton *)self window];
    v9 = [v8 tintColor];
    [(MFComposeSendAccessoryButton *)self setTintColor:v9];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [(MFComposeSendAccessoryButton *)self _preview];
  uint64_t v6 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v5];
  uint64_t v7 = [(MFComposeSendAccessoryButton *)self _pointerShapeForTargetedPreview:v5];
  v8 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v7];

  return v8;
}

- (id)_preview
{
  v3 = [(MFComposeSendAccessoryButton *)self window];
  if (v3)
  {
    [(MFComposeSendAccessoryButton *)self bounds];
    UIRectGetCenter();
    -[MFComposeSendAccessoryButton convertPoint:toView:](self, "convertPoint:toView:", v3);
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1B38]), "initWithContainer:center:", v3, v4, v5);
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v7 target:v6];
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  }

  return v8;
}

- (id)_pointerShapeForTargetedPreview:(id)a3
{
  id v4 = a3;
  [(MFComposeSendAccessoryButton *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [v4 target];
  v14 = [v13 container];
  -[MFComposeSendAccessoryButton convertRect:toView:](self, "convertRect:toView:", v14, v6, v8, v10, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  double Width = CGRectGetWidth(v28);
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  double Height = CGRectGetHeight(v29);
  if (Width >= Height) {
    double Height = Width;
  }
  v25 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v16, v18, v20, v22, Height * 0.5);

  return v25;
}

@end
@interface _FCUIFocusSelectionFooterView
- (id)_attributedTextForText:(id)a3;
- (void)_configureLabel:(id)a3;
- (void)_handleLabelTap:(id)a3;
- (void)_layoutLabel:(id)a3 inBounds:(CGRect)a4 measuringOnly:(CGSize *)a5;
- (void)_openURL:(id)a3;
@end

@implementation _FCUIFocusSelectionFooterView

- (id)_attributedTextForText:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F81678];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x263F82818];
  v8 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v9 = [v7 configurationWithHierarchicalColor:v8];

  v10 = (void *)MEMORY[0x263F82818];
  v11 = [(_FCUIFocusSelectionHeaderFooterView *)self _labelFont];
  v12 = [v10 configurationWithFont:v11];
  v13 = [v9 configurationByApplyingConfiguration:v12];

  v14 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.forward" withConfiguration:v13];
  [v6 setImage:v14];

  id v15 = objc_alloc(MEMORY[0x263F089B8]);
  v16 = [v5 stringByAppendingString:@" "];

  v17 = (void *)[v15 initWithString:v16];
  v18 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v6];
  [v17 appendAttributedString:v18];

  return v17;
}

- (void)_layoutLabel:(id)a3 inBounds:(CGRect)a4 measuringOnly:(CGSize *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v32 = a4.origin.x;
  id v33 = a3;
  objc_msgSend(v33, "sizeThatFits:", width, height);
  BSRectWithSize();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  CGRectGetMaxY(v35);
  v36.origin.CGFloat x = v12;
  v36.origin.CGFloat y = v14;
  v36.size.double width = v16;
  v36.size.double height = v18;
  CGRectGetHeight(v36);
  v19 = [(_FCUIFocusSelectionFooterView *)self traitCollection];
  [v19 displayScale];
  uint64_t v31 = v20;
  UIRectCenteredXInRectScale();
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  if (a5)
  {
    v37.origin.CGFloat x = v32;
    v37.origin.CGFloat y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    CGFloat v29 = CGRectGetWidth(v37);
    v38.origin.CGFloat x = v22;
    v38.origin.CGFloat y = v24;
    v38.size.double width = v26;
    v38.size.double height = v28;
    CGFloat v30 = CGRectGetHeight(v38);
    a5->double width = v29;
    a5->double height = v30 + 29.0;
  }
  else
  {
    objc_msgSend(v33, "setFrame:", v22, v24, v26, v28, v31);
  }
}

- (void)_configureLabel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_FCUIFocusSelectionFooterView;
  id v4 = a3;
  [(_FCUIFocusSelectionHeaderFooterView *)&v6 _configureLabel:v4];
  objc_msgSend(v4, "setUserInteractionEnabled:", 1, v6.receiver, v6.super_class);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleLabelTap_];
  [v4 addGestureRecognizer:v5];
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42___FCUIFocusSelectionFooterView__openURL___block_invoke;
  block[3] = &unk_264542B68;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_handleLabelTap:(id)a3
{
  objc_msgSend(MEMORY[0x263F3F3A0], "activitiesSettingsURL", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(_FCUIFocusSelectionFooterView *)self _openURL:v4];
}

@end
@interface MFComposeWebContentVariationView
- (MFComposeWebContentVariationView)initWithFrame:(CGRect)a3;
- (NSString)selectedContentVariation;
- (UIButton)webContentVariableButton;
- (UIView)background;
- (id)_generateActionsForTitles:(id)a3 currentSelection:(unint64_t)a4 handler:(id)a5;
- (void)_flashBackground;
- (void)layoutSubviews;
- (void)refreshPreferredContentSize;
- (void)setBackground:(id)a3;
- (void)setSelectedContentVariationLabel:(id)a3;
- (void)setWebContentVariableButton:(id)a3;
- (void)setupMenuItemTitles:(id)a3 currentSelection:(unint64_t)a4 handler:(id)a5;
@end

@implementation MFComposeWebContentVariationView

- (MFComposeWebContentVariationView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)MFComposeWebContentVariationView;
  v3 = -[MFComposeWebContentVariationView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"SEND_WEB_CONTENT_AS" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeWebContentVariationView *)v3 setLabel:v5];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    id v6 = objc_alloc(MEMORY[0x1E4FB14D0]);
    v7 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __50__MFComposeWebContentVariationView_initWithFrame___block_invoke;
    v19 = &unk_1E5F7A198;
    objc_copyWeak(&v20, &location);
    v8 = [v7 actionWithTitle:@"No Action Selected" image:0 identifier:@"0" handler:&v16];
    uint64_t v9 = objc_msgSend(v6, "initWithFrame:primaryAction:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v16, v17, v18, v19);
    webContentVariableButton = v3->_webContentVariableButton;
    v3->_webContentVariableButton = (UIButton *)v9;

    [(UIButton *)v3->_webContentVariableButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_webContentVariableButton setContextMenuIsPrimary:1];
    [(UIButton *)v3->_webContentVariableButton _setDisableAutomaticTitleAnimations:1];
    v11 = [(id)objc_opt_class() defaultFont];
    v12 = [(UIButton *)v3->_webContentVariableButton titleLabel];
    [v12 setFont:v11];

    v13 = v3->_webContentVariableButton;
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIButton *)v13 setTitleColor:v14 forState:0];

    [(UIButton *)v3->_webContentVariableButton setAccessibilityIdentifier:*MEMORY[0x1E4F73BA8]];
    [(MFComposeWebContentVariationView *)v3 addSubview:v3->_webContentVariableButton];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __50__MFComposeWebContentVariationView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _flashBackground];
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)MFComposeWebContentVariationView;
  [(MFComposeWebContentVariationView *)&v20 layoutSubviews];
  uint64_t v3 = [(MFComposeWebContentVariationView *)self effectiveUserInterfaceLayoutDirection];
  [(MFComposeWebContentVariationView *)self _contentRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFComposeWebContentVariationView *)self bounds];
  double v13 = v12;
  v14 = [(MFComposeWebContentVariationView *)self labelView];
  [v14 frame];
  double Width = CGRectGetWidth(v21);
  if (v13 >= v11) {
    double v16 = v13;
  }
  else {
    double v16 = v11;
  }
  double v17 = v16 + -4.0;
  double v18 = Width + 5.0;

  double v19 = 0.0;
  if (v3 != 1) {
    double v19 = v18;
  }
  -[UIButton setFrame:](self->_webContentVariableButton, "setFrame:", v5 + v19, v7, v9 - v18, v17);
  [(UIButton *)self->_webContentVariableButton setContentHorizontalAlignment:4];
}

- (void)setupMenuItemTitles:(id)a3 currentSelection:(unint64_t)a4 handler:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  if ([v12 count])
  {
    double v9 = (void *)MEMORY[0x1E4FB1970];
    double v10 = [(MFComposeWebContentVariationView *)self _generateActionsForTitles:v12 currentSelection:a4 handler:v8];
    double v11 = [v9 menuWithTitle:&stru_1F0817A00 children:v10];
    [(UIButton *)self->_webContentVariableButton setMenu:v11];

    [(MFComposeWebContentVariationView *)self layoutIfNeeded];
  }
}

- (id)_generateActionsForTitles:(id)a3 currentSelection:(unint64_t)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [(MFComposeWebContentVariationView *)self webContentVariableButton];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke;
  aBlock[3] = &unk_1E5F7A1C0;
  id v23 = v9;
  id v31 = v23;
  id v20 = v8;
  id v32 = v20;
  objc_super v22 = _Block_copy(aBlock);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v10 setNumberStyle:0];
  double v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  unint64_t v12 = 0;
  double v13 = v10;
  while (v12 < [v7 count])
  {
    v14 = [v7 objectAtIndexedSubscript:v12];
    if (a4 == v12)
    {
      v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
    }
    else
    {
      v15 = 0;
    }
    double v16 = objc_msgSend(MEMORY[0x1E4F28EE0], "ef_formatUnsignedInteger:withGrouping:", v12, 0);
    double v17 = (void *)MEMORY[0x1E4FB13F0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke_2;
    v24[3] = &unk_1E5F7A1E8;
    id v25 = v13;
    id v26 = v23;
    v27 = self;
    id v28 = v7;
    id v29 = v22;
    double v18 = [v17 actionWithTitle:v14 image:v15 identifier:v16 handler:v24];
    [v11 addObject:v18];

    ++v12;
    id v10 = v13;
  }

  return v11;
}

void __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  id v6 = v3;
  double v5 = [v3 title];
  [v4 setTitle:v5 forState:0];

  [*(id *)(a1 + 32) layoutIfNeeded];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  id v11 = v3;
  double v5 = [v3 identifier];
  id v6 = [v4 numberFromString:v5];
  uint64_t v7 = [v6 unsignedIntValue];

  id v8 = (void *)MEMORY[0x1E4FB1970];
  double v9 = [*(id *)(a1 + 48) _generateActionsForTitles:*(void *)(a1 + 56) currentSelection:v7 handler:*(void *)(a1 + 64)];
  id v10 = [v8 menuWithTitle:&stru_1F0817A00 children:v9];
  [*(id *)(a1 + 40) setMenu:v10];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)setSelectedContentVariationLabel:(id)a3
{
  id v5 = a3;
  double v4 = [(MFComposeWebContentVariationView *)self webContentVariableButton];
  [v4 setTitle:v5 forState:0];

  [(MFComposeWebContentVariationView *)self setNeedsLayout];
}

- (void)refreshPreferredContentSize
{
  v7.receiver = self;
  v7.super_class = (Class)MFComposeWebContentVariationView;
  [(MFComposeWebContentVariationView *)&v7 refreshPreferredContentSize];
  id v3 = [MEMORY[0x1E4F5A0D8] sharedFontMetricCache];
  [v3 ensureCacheIsValid];

  double v4 = [(MFComposeWebContentVariationView *)self webContentVariableButton];
  id v5 = [v4 titleLabel];
  id v6 = [(id)objc_opt_class() defaultFont];
  [v5 setFont:v6];

  [(MFComposeWebContentVariationView *)self setNeedsLayout];
}

- (void)_flashBackground
{
  id v3 = [(MFComposeWebContentVariationView *)self background];

  if (!v3)
  {
    [(MFComposeWebContentVariationView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    unint64_t v12 = [(MFComposeWebContentVariationView *)self separator];
    [v12 frame];
    double v14 = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v7 + v14 * -2.0, v9, v11 + v14 * 2.0);
    double v16 = (void *)MEMORY[0x1E4FB1818];
    double v17 = [MEMORY[0x1E4FB1618] separatorColor];
    double v18 = objc_msgSend(v16, "mf_imageWithColor:size:", v17, 1.0, 1.0);
    [v15 setImage:v18];

    [v15 setAutoresizingMask:2];
    double v19 = [(MFComposeWebContentVariationView *)self labelView];
    [(MFComposeWebContentVariationView *)self insertSubview:v15 belowSubview:v19];

    [(MFComposeWebContentVariationView *)self setBackground:v15];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__MFComposeWebContentVariationView__flashBackground__block_invoke;
  v21[3] = &unk_1E5F79088;
  v21[4] = self;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__MFComposeWebContentVariationView__flashBackground__block_invoke_2;
  v20[3] = &unk_1E5F7A210;
  v20[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v21 animations:v20 completion:0.3];
}

void __52__MFComposeWebContentVariationView__flashBackground__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) background];
  [v1 setAlpha:1.0];
}

uint64_t __52__MFComposeWebContentVariationView__flashBackground__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__MFComposeWebContentVariationView__flashBackground__block_invoke_3;
  v2[3] = &unk_1E5F79088;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.3];
}

void __52__MFComposeWebContentVariationView__flashBackground__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) background];
  [v1 setAlpha:0.0];
}

- (NSString)selectedContentVariation
{
  return self->_selectedContentVariation;
}

- (UIButton)webContentVariableButton
{
  return self->_webContentVariableButton;
}

- (void)setWebContentVariableButton:(id)a3
{
}

- (UIView)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_webContentVariableButton, 0);

  objc_storeStrong((id *)&self->_selectedContentVariation, 0);
}

@end
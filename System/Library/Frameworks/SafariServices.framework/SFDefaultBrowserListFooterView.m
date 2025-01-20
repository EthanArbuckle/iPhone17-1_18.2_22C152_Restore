@interface SFDefaultBrowserListFooterView
+ (CGSize)sizeForBounds:(CGSize)a3 state:(unint64_t)a4;
+ (NSString)reuseIdentifier;
+ (id)_confirmButtonConfigurationWithState:(unint64_t)a3;
- (SFDefaultBrowserListFooterView)initWithFrame:(CGRect)a3;
- (SFDefaultBrowserListFooterViewDelegate)delegate;
- (void)_didTapConfirmButton;
- (void)setDelegate:(id)a3;
- (void)updateButtonState:(unint64_t)a3;
@end

@implementation SFDefaultBrowserListFooterView

- (SFDefaultBrowserListFooterView)initWithFrame:(CGRect)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SFDefaultBrowserListFooterView;
  v3 = -[SFDefaultBrowserListFooterView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v27 = objc_msgSend(MEMORY[0x1E4FB13F0], "safari_actionWithTarget:selector:", v3, sel__didTapConfirmButton);
    v4 = (void *)MEMORY[0x1E4FB14D0];
    v5 = +[SFDefaultBrowserListFooterView _confirmButtonConfigurationWithState:0];
    uint64_t v6 = [v4 buttonWithConfiguration:v5 primaryAction:v27];
    confirmButton = v3->_confirmButton;
    v3->_confirmButton = (UIButton *)v6;

    [(UIButton *)v3->_confirmButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDefaultBrowserListFooterView *)v3 addSubview:v3->_confirmButton];
    v8 = [(SFDefaultBrowserListFooterView *)v3 layoutMarginsGuide];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(UIButton *)v3->_confirmButton topAnchor];
    v23 = v8;
    v25 = [v8 topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:24.0];
    v29[0] = v24;
    v22 = [(UIButton *)v3->_confirmButton centerYAnchor];
    v21 = [(SFDefaultBrowserListFooterView *)v3 centerYAnchor];
    v9 = [v22 constraintEqualToAnchor:v21];
    v29[1] = v9;
    v10 = [(UIButton *)v3->_confirmButton leadingAnchor];
    v11 = [v8 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v29[2] = v12;
    v13 = [(UIButton *)v3->_confirmButton trailingAnchor];
    v14 = [(SFDefaultBrowserListFooterView *)v3 layoutMarginsGuide];
    v15 = [v14 trailingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v29[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [v20 activateConstraints:v17];

    v18 = v3;
  }

  return v3;
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SFDefaultBrowserListFooterView";
}

+ (CGSize)sizeForBounds:(CGSize)a3 state:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = (void *)MEMORY[0x1E4FB14D0];
  v7 = +[SFDefaultBrowserListFooterView _confirmButtonConfigurationWithState:a4];
  v8 = [v6 buttonWithConfiguration:v7 primaryAction:0];

  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11 + 24.0 + 15.0;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)updateButtonState:(unint64_t)a3
{
  v5 = +[SFDefaultBrowserListFooterView _confirmButtonConfigurationWithState:](SFDefaultBrowserListFooterView, "_confirmButtonConfigurationWithState:");
  id v9 = v5;
  if (a3 - 1 >= 2)
  {
    [(UIButton *)self->_confirmButton configuration];
    if (a3 == 3) {
      v7 = {;
    }
      [v7 setShowsActivityIndicator:0];

      uint64_t v6 = 1;
    }
    else {
      v8 = {;
    }
      [v8 setShowsActivityIndicator:0];

      uint64_t v6 = 0;
    }
  }
  else
  {
    [v5 setShowsActivityIndicator:1];
    uint64_t v6 = 0;
  }
  [(UIButton *)self->_confirmButton setEnabled:v6];
  [(UIButton *)self->_confirmButton setConfiguration:v9];
  [(UIButton *)self->_confirmButton setNeedsUpdateConfiguration];
}

+ (id)_confirmButtonConfigurationWithState:(unint64_t)a3
{
  v3 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  v4 = [v3 background];
  [v4 setCornerRadius:14.0];

  [v3 setButtonSize:3];
  [v3 setImagePadding:8.0];
  v5 = [MEMORY[0x1E4FB1798] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] design:0 variant:0 weight:*MEMORY[0x1E4FB2780] maximumContentSizeCategory:0 compatibleWithTraitCollection:*MEMORY[0x1E4FB29D0]];
  uint64_t v6 = [MEMORY[0x1E4FB1380] defaultParagraphStyle];
  v7 = (void *)[v6 mutableCopy];

  [v7 setAlignment:1];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __71__SFDefaultBrowserListFooterView__confirmButtonConfigurationWithState___block_invoke;
  v15 = &unk_1E5C75E38;
  id v16 = v5;
  id v17 = v7;
  id v8 = v7;
  id v9 = v5;
  [v3 setTitleTextAttributesTransformer:&v12];
  double v10 = _WBSLocalizedString();
  objc_msgSend(v3, "setTitle:", v10, v12, v13, v14, v15);

  return v3;
}

id __71__SFDefaultBrowserListFooterView__confirmButtonConfigurationWithState___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4FB12D0];
  v5[0] = *MEMORY[0x1E4FB12B0];
  v5[1] = v1;
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)_didTapConfirmButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained footerViewDidTapConfirmationAction:self];
  }
}

- (SFDefaultBrowserListFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDefaultBrowserListFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_confirmButton, 0);
}

@end
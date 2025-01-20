@interface _NCContentUnavailableViewWithButton
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (_NCContentUnavailableViewWithButton)initWithTitle:(id)a3 buttonAction:(id)a4;
- (id)_visualStylingProviderForCategory:(int64_t)a3;
- (id)buttonHandler;
- (void)_buttonPressed:(id)a3;
- (void)_configureBackgroundView;
- (void)_configureTitleLabelWithTitle:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateVisualStyling;
- (void)didMoveToWindow;
- (void)setBackgroundView:(id)a3;
- (void)setButtonHandler:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation _NCContentUnavailableViewWithButton

- (_NCContentUnavailableViewWithButton)initWithTitle:(id)a3 buttonAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_NCContentUnavailableViewWithButton;
  v8 = [(_NCContentUnavailableViewWithButton *)&v12 init];
  v9 = v8;
  if (v8)
  {
    -[_NCContentUnavailableViewWithButton setLayoutMargins:](v8, "setLayoutMargins:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    [(_NCContentUnavailableViewWithButton *)v9 setPreservesSuperviewLayoutMargins:1];
    [(_NCContentUnavailableViewWithButton *)v9 _configureBackgroundView];
    [(_NCContentUnavailableViewWithButton *)v9 _configureTitleLabelWithTitle:v6];
    [(_NCContentUnavailableViewWithButton *)v9 setButtonHandler:v7];
    v10 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v9 action:sel__buttonPressed_];
    [v10 setNumberOfTapsRequired:1];
    [v10 setNumberOfTouchesRequired:1];
    [(UIView *)v9->_backgroundView addGestureRecognizer:v10];
  }
  return v9;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_NCContentUnavailableViewWithButton;
  [(_NCContentUnavailableViewWithButton *)&v4 didMoveToWindow];
  v3 = [(_NCContentUnavailableViewWithButton *)self window];

  if (v3) {
    [(_NCContentUnavailableViewWithButton *)self _updateVisualStyling];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_NCContentUnavailableViewWithButton;
  [(_NCContentUnavailableViewWithButton *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(_NCContentUnavailableViewWithButton *)self _updateVisualStyling];
}

- (void)_configureTitleLabelWithTitle:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  if (!self->_titleLabel)
  {
    objc_super v4 = (objc_class *)MEMORY[0x263F1C768];
    id v5 = a3;
    id v6 = (UILabel *)objc_alloc_init(v4);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v6;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = self->_titleLabel;
    v9 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setText:v5];

    [(_NCContentUnavailableViewWithButton *)self addSubview:self->_titleLabel];
    v10 = (void *)MEMORY[0x263F08938];
    v11 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, self->_titleLabel, 0);
    objc_super v12 = [v10 constraintsWithVisualFormat:@"H:|-(padding)-[_titleLabel]-(padding)-|" options:0 metrics:&unk_26D928428 views:v11];

    [(_NCContentUnavailableViewWithButton *)self addConstraints:v12];
    v13 = [(_NCContentUnavailableViewWithButton *)self layoutMarginsGuide];
    v14 = [v13 centerYAnchor];
    v15 = [(UILabel *)self->_titleLabel centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v20[0] = v16;
    v17 = [(UILabel *)self->_titleLabel heightAnchor];
    v18 = [v17 constraintEqualToConstant:30.0];
    v20[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];

    [(_NCContentUnavailableViewWithButton *)self addConstraints:v19];
  }
}

- (void)_configureBackgroundView
{
  v16[2] = *MEMORY[0x263EF8340];
  if (!self->_backgroundView)
  {
    objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [(UIView *)self->_backgroundView layer];
    [v5 setCornerRadius:4.0];

    [(_NCContentUnavailableViewWithButton *)self addSubview:self->_backgroundView];
    id v6 = (void *)MEMORY[0x263F08938];
    id v7 = _NSDictionaryOfVariableBindings(&cfstr_Backgroundview.isa, self->_backgroundView, 0);
    v8 = [v6 constraintsWithVisualFormat:@"H:|-(padding)-[_backgroundView]-(padding)-|" options:0 metrics:&unk_26D928450 views:v7];

    [(_NCContentUnavailableViewWithButton *)self addConstraints:v8];
    v9 = [(_NCContentUnavailableViewWithButton *)self layoutMarginsGuide];
    v10 = [v9 centerYAnchor];
    v11 = [(UIView *)self->_backgroundView centerYAnchor];
    objc_super v12 = [v10 constraintEqualToAnchor:v11];
    v16[0] = v12;
    v13 = [(UIView *)self->_backgroundView heightAnchor];
    v14 = [v13 constraintEqualToConstant:30.0];
    v16[1] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

    [(_NCContentUnavailableViewWithButton *)self addConstraints:v15];
  }
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  objc_super v4 = (void *)MEMORY[0x263F54000];
  id v5 = [(_NCContentUnavailableViewWithButton *)self traitCollection];
  id v6 = objc_msgSend(v4, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, a3, objc_msgSend(v5, "userInterfaceStyle"));

  return v6;
}

- (void)_updateVisualStyling
{
  titleLabel = self->_titleLabel;
  objc_super v4 = [(_NCContentUnavailableViewWithButton *)self _visualStylingProviderForCategory:1];
  id v5 = [v4 _visualStylingForStyle:0];
  [(UILabel *)titleLabel mt_replaceVisualStyling:v5];

  backgroundView = self->_backgroundView;
  id v8 = [(_NCContentUnavailableViewWithButton *)self _visualStylingProviderForCategory:2];
  id v7 = [v8 _visualStylingForStyle:4];
  [(UIView *)backgroundView mt_replaceVisualStyling:v7];
}

- (void)_buttonPressed:(id)a3
{
  objc_super v4 = [(_NCContentUnavailableViewWithButton *)self buttonHandler];

  if (v4)
  {
    id v5 = [(_NCContentUnavailableViewWithButton *)self buttonHandler];
    v5[2]();
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (id)buttonHandler
{
  return self->_buttonHandler;
}

- (void)setButtonHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_buttonHandler, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
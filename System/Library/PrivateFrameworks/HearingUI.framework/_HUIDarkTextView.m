@interface _HUIDarkTextView
- (HACCCapsuleDarkBackground)darkBackgroundView;
- (NSArray)requiredVisualStyleCategories;
- (UILabel)nameLabel;
- (UILabel)valueLabel;
- (UIStackView)stackView;
- (_HUIDarkTextView)initWithFrame:(CGRect)a3;
- (void)setDarkBackgroundView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setStackView:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateLayout:(BOOL)a3;
@end

@implementation _HUIDarkTextView

- (_HUIDarkTextView)initWithFrame:(CGRect)a3
{
  v29[4] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)_HUIDarkTextView;
  v3 = -[_HUIDarkTextView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HACCCapsuleDarkBackground);
    darkBackgroundView = v3->_darkBackgroundView;
    v3->_darkBackgroundView = v4;

    [(HACCCapsuleDarkBackground *)v3->_darkBackgroundView setAutoresizingMask:18];
    [(_HUIDarkTextView *)v3 addSubview:v3->_darkBackgroundView];
    [(HACCCapsuleDarkBackground *)v3->_darkBackgroundView setupBackgroundVisualStyle];
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v3->_stackView;
    v3->_stackView = v6;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setLayoutMarginsRelativeArrangement:1];
    [(_HUIDarkTextView *)v3 addSubview:v3->_stackView];
    uint64_t v8 = HUICCMenuTextLabel();
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v8;

    [(UILabel *)v3->_nameLabel setTextAlignment:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_nameLabel];
    uint64_t v10 = HUICCMenuTextLabel();
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = (UILabel *)v10;

    [(UILabel *)v3->_valueLabel setTextAlignment:2];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_valueLabel];
    v23 = (void *)MEMORY[0x263F08938];
    v27 = [(UIStackView *)v3->_stackView leadingAnchor];
    v26 = [(_HUIDarkTextView *)v3 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v29[0] = v25;
    v24 = [(UIStackView *)v3->_stackView trailingAnchor];
    v12 = [(_HUIDarkTextView *)v3 trailingAnchor];
    v13 = [v24 constraintEqualToAnchor:v12];
    v29[1] = v13;
    v14 = [(UIStackView *)v3->_stackView topAnchor];
    v15 = [(_HUIDarkTextView *)v3 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v29[2] = v16;
    v17 = [(UIStackView *)v3->_stackView bottomAnchor];
    v18 = [(_HUIDarkTextView *)v3 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v29[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
    [v23 activateConstraints:v20];

    [(_HUIDarkTextView *)v3 updateLayout:HUICCLargeTextEnabled()];
    v21 = HUICCBackgroundVisualStylingProviderForCategory(1);
    [(_HUIDarkTextView *)v3 setVisualStylingProvider:v21 forCategory:1];
  }
  return v3;
}

- (void)updateLayout:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_HUIDarkTextView *)self valueLabel];
  v6 = v5;
  if (v3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  if (v3) {
    double v8 = 10.0;
  }
  else {
    double v8 = 0.0;
  }
  [v5 setTextAlignment:v7];

  [(UIStackView *)self->_stackView setAxis:v3];
  CCUILayoutGutter();
  double v10 = v9;
  CCUILayoutGutter();
  stackView = self->_stackView;
  -[UIStackView setLayoutMargins:](stackView, "setLayoutMargins:", v8, v10, v8, v11);
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26DAB9B68;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_HUIDarkTextView *)self requiredVisualStyleCategories];
  double v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57___HUIDarkTextView_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_2647CD360;
    id v11 = v6;
    v12 = self;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (HACCCapsuleDarkBackground)darkBackgroundView
{
  return self->_darkBackgroundView;
}

- (void)setDarkBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkBackgroundView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
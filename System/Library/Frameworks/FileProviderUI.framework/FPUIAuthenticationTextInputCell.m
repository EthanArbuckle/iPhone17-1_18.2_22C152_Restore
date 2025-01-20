@interface FPUIAuthenticationTextInputCell
- (BOOL)_isLargeTextTraitCollection:(id)a3;
- (FPUIAuthenticationTextInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)label;
- (UITextField)textField;
- (void)prepareForReuse;
- (void)updateForChangedContentSizeCategory;
@end

@implementation FPUIAuthenticationTextInputCell

- (FPUIAuthenticationTextInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v46[5] = *MEMORY[0x263EF8340];
  v44.receiver = self;
  v44.super_class = (Class)FPUIAuthenticationTextInputCell;
  v4 = [(FPUIAuthenticationTextInputCell *)&v44 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v43 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v5 = objc_opt_new();
    [v5 setFont:v43];
    v6 = objc_opt_new();
    [v6 setFont:v43];
    [v6 setHoverStyle:0];
    objc_storeWeak((id *)&v4->_label, v5);
    objc_storeWeak((id *)&v4->_textField, v6);
    v41 = v5;
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = (UIStackView *)objc_opt_new();
    [(UIStackView *)v7 setAxis:0];
    [(UIStackView *)v7 setSpacing:20.0];
    [(UIStackView *)v7 setAlignment:0];
    [(UIStackView *)v7 setDistribution:0];
    [(UIStackView *)v7 addArrangedSubview:v5];
    v42 = v6;
    [(UIStackView *)v7 addArrangedSubview:v6];
    [(UIStackView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    stackView = v4->_stackView;
    v4->_stackView = v7;
    v9 = v7;

    v10 = [(FPUIAuthenticationTextInputCell *)v4 contentView];
    [v10 addSubview:v9];

    v40 = [v6 widthAnchor];
    v39 = [v40 constraintGreaterThanOrEqualToConstant:100.0];
    v46[0] = v39;
    v35 = v9;
    v37 = [(UIStackView *)v9 leadingAnchor];
    v38 = [(FPUIAuthenticationTextInputCell *)v4 contentView];
    v36 = [v38 layoutMarginsGuide];
    v34 = [v36 leadingAnchor];
    v33 = [v37 constraintEqualToAnchor:v34];
    v46[1] = v33;
    v32 = [(FPUIAuthenticationTextInputCell *)v4 contentView];
    v31 = [v32 layoutMarginsGuide];
    v30 = [v31 bottomAnchor];
    v29 = [(UIStackView *)v9 bottomAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:0.5];
    v46[2] = v28;
    v26 = [(FPUIAuthenticationTextInputCell *)v4 contentView];
    v11 = [v26 layoutMarginsGuide];
    v12 = [v11 trailingAnchor];
    v13 = [(UIStackView *)v9 trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:8.0];
    v46[3] = v14;
    v15 = [(UIStackView *)v9 topAnchor];
    v16 = [(FPUIAuthenticationTextInputCell *)v4 contentView];
    v17 = [v16 layoutMarginsGuide];
    v18 = [v17 topAnchor];
    v19 = [v15 constraintEqualToAnchor:v18 constant:0.5];
    v46[4] = v19;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:5];

    LODWORD(v20) = 1132134400;
    [v41 setContentHuggingPriority:0 forAxis:v20];
    [MEMORY[0x263F08938] activateConstraints:v27];
    [(FPUIAuthenticationTextInputCell *)v4 updateForChangedContentSizeCategory];
    v21 = self;
    v45[0] = v21;
    v22 = self;
    v45[1] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];

    id v24 = (id)[(FPUIAuthenticationTextInputCell *)v4 registerForTraitChanges:v23 withHandler:&__block_literal_global];
  }
  return v4;
}

uint64_t __65__FPUIAuthenticationTextInputCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForChangedContentSizeCategory];
}

- (void)prepareForReuse
{
  v2 = self;
  v7.receiver = self;
  v7.super_class = (Class)FPUIAuthenticationTextInputCell;
  [(FPUIAuthenticationTextInputCell *)&v7 prepareForReuse];
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_label);
  [WeakRetained setText:0];

  v2 = (FPUIAuthenticationTextInputCell *)((char *)v2 + 1032);
  id v4 = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
  [v4 setText:0];

  id v5 = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
  [v5 setSecureTextEntry:0];

  id v6 = objc_loadWeakRetained((id *)&v2->super.super.super.super.isa);
  [v6 setKeyboardType:0];
}

- (void)updateForChangedContentSizeCategory
{
  v3 = [(FPUIAuthenticationTextInputCell *)self traitCollection];
  BOOL v4 = [(FPUIAuthenticationTextInputCell *)self _isLargeTextTraitCollection:v3];

  stackView = self->_stackView;

  [(UIStackView *)stackView setAxis:v4];
}

- (BOOL)_isLargeTextTraitCollection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F1D140];
  uint64_t v10 = *MEMORY[0x263F1D148];
  uint64_t v11 = v3;
  uint64_t v4 = *MEMORY[0x263F1D130];
  uint64_t v12 = *MEMORY[0x263F1D138];
  uint64_t v13 = v4;
  uint64_t v14 = *MEMORY[0x263F1D160];
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  objc_super v7 = [v5 arrayWithObjects:&v10 count:5];
  v8 = objc_msgSend(v6, "preferredContentSizeCategory", v10, v11, v12, v13, v14, v15);

  LOBYTE(v5) = [v7 containsObject:v8];
  return (char)v5;
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  return (UITextField *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textField);
  objc_destroyWeak((id *)&self->_label);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
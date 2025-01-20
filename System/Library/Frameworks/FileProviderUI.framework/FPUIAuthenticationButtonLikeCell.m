@interface FPUIAuthenticationButtonLikeCell
- (FPUIAuthenticationButtonLikeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)label;
- (void)prepareForReuse;
- (void)setLabel:(id)a3;
@end

@implementation FPUIAuthenticationButtonLikeCell

- (FPUIAuthenticationButtonLikeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30[4] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)FPUIAuthenticationButtonLikeCell;
  v4 = [(FPUIAuthenticationButtonLikeCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v28 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    v5 = objc_opt_new();
    [v5 setFont:v28];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FPUIAuthenticationButtonLikeCell *)v4 bounds];
    objc_msgSend(v5, "setFrame:");
    v6 = [(FPUIAuthenticationButtonLikeCell *)v4 contentView];
    [v6 addSubview:v5];

    v19 = (void *)MEMORY[0x263F08938];
    v26 = [v5 centerXAnchor];
    v27 = [(FPUIAuthenticationButtonLikeCell *)v4 contentView];
    v25 = [v27 centerXAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v30[0] = v24;
    v22 = [v5 centerYAnchor];
    v23 = [(FPUIAuthenticationButtonLikeCell *)v4 contentView];
    v21 = [v23 centerYAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v30[1] = v20;
    v18 = [(FPUIAuthenticationButtonLikeCell *)v4 contentView];
    v17 = [v18 layoutMarginsGuide];
    v16 = [v17 bottomAnchor];
    v7 = [v5 bottomAnchor];
    v8 = [v16 constraintEqualToAnchor:v7 constant:0.5];
    v30[2] = v8;
    v9 = [v5 topAnchor];
    v10 = [(FPUIAuthenticationButtonLikeCell *)v4 contentView];
    v11 = [v10 layoutMarginsGuide];
    v12 = [v11 topAnchor];
    v13 = [v9 constraintEqualToAnchor:v12 constant:0.5];
    v30[3] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
    [v19 activateConstraints:v14];

    objc_storeWeak((id *)&v4->_label, v5);
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)FPUIAuthenticationButtonLikeCell;
  [(FPUIAuthenticationButtonLikeCell *)&v4 prepareForReuse];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  [WeakRetained setText:0];
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
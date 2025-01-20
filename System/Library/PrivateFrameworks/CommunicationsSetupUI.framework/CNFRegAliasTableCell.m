@interface CNFRegAliasTableCell
- (BOOL)hasSpinner;
- (BOOL)usesStandardBackgroundImage;
- (CNFRegAliasTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIActivityIndicatorView)spinner;
- (UIImageView)iconView;
- (UIImageView)temporaryPhoneGlyph;
- (void)_updateIcon;
- (void)dealloc;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setHasSpinner:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIsTemporaryPhone:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setTemporaryPhoneGlyph:(id)a3;
@end

@implementation CNFRegAliasTableCell

- (CNFRegAliasTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CNFRegAliasTableCell;
  v5 = [(PSTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(CNFRegAliasTableCell *)v5 detailTextLabel];
    [v7 setTextAlignment:2];

    v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    v9 = [(CNFRegAliasTableCell *)v6 detailTextLabel];
    [v9 setTextColor:v8];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(CNFRegAliasTableCell *)self spinner];
  [v3 stopAnimating];

  v4 = [(CNFRegAliasTableCell *)self spinner];
  [v4 removeFromSuperview];

  v5.receiver = self;
  v5.super_class = (Class)CNFRegAliasTableCell;
  [(PSTableCell *)&v5 dealloc];
}

- (void)setIsTemporaryPhone:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];

  if (v3)
  {
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F82828]);
      [(CNFRegAliasTableCell *)self setTemporaryPhoneGlyph:v6];

      v7 = [MEMORY[0x263F827E8] systemImageNamed:@"clock"];
      v8 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
      [v8 setImage:v7];

      v9 = [MEMORY[0x263F825C8] lightGrayColor];
      v10 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
      [v10 setTintColor:v9];

      objc_super v11 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      v12 = [(CNFRegAliasTableCell *)self contentView];
      v13 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
      [v12 addSubview:v13];

      v14 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
      v15 = [v14 trailingAnchor];
      v16 = [(CNFRegAliasTableCell *)self contentView];
      v17 = [v16 layoutMarginsGuide];
      v18 = [v17 trailingAnchor];
      v19 = [v15 constraintEqualToAnchor:v18];
      [v19 setActive:1];

      id v25 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
      v20 = [v25 centerYAnchor];
      v21 = [(CNFRegAliasTableCell *)self contentView];
      v22 = [v21 centerYAnchor];
      v23 = [v20 constraintEqualToAnchor:v22];
      [v23 setActive:1];
    }
  }
  else if (v5)
  {
    v24 = [(CNFRegAliasTableCell *)self temporaryPhoneGlyph];
    [v24 removeFromSuperview];

    [(CNFRegAliasTableCell *)self setTemporaryPhoneGlyph:0];
  }
}

- (void)setHasSpinner:(BOOL)a3
{
  if (self->_hasSpinner != a3)
  {
    self->_hasSpinner = a3;
    [(CNFRegAliasTableCell *)self _updateIcon];
    [(CNFRegAliasTableCell *)self setNeedsLayout];
  }
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3 = (int)*MEMORY[0x263F5FE50];
  if (*((unsigned char *)&self->super.super.super.super.super.isa + v3) != a3)
  {
    *((unsigned char *)&self->super.super.super.super.super.isa + v3) = a3;
    [(CNFRegAliasTableCell *)self _updateIcon];
    [(CNFRegAliasTableCell *)self setNeedsLayout];
  }
}

- (void)_updateIcon
{
  if (!self->_hasSpinner) {
    goto LABEL_4;
  }
  uint64_t v3 = [(CNFRegAliasTableCell *)self spinner];

  if (!v3)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F823E8]);
    [(CNFRegAliasTableCell *)self setSpinner:v7];

    v8 = [(CNFRegAliasTableCell *)self spinner];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(CNFRegAliasTableCell *)self spinner];
    [v9 startAnimating];

    v10 = [(CNFRegAliasTableCell *)self contentView];
    objc_super v11 = [(CNFRegAliasTableCell *)self spinner];
    [v10 addSubview:v11];

    v12 = [(CNFRegAliasTableCell *)self spinner];
    v13 = [v12 leadingAnchor];
    v14 = [(CNFRegAliasTableCell *)self contentView];
    v15 = [v14 layoutMarginsGuide];
    v16 = [v15 leadingAnchor];
    v17 = [v13 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(CNFRegAliasTableCell *)self spinner];
    v19 = [v18 centerYAnchor];
    v20 = [(CNFRegAliasTableCell *)self contentView];
    v21 = [v20 centerYAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    goto LABEL_7;
  }
  if (!self->_hasSpinner)
  {
LABEL_4:
    v4 = [(CNFRegAliasTableCell *)self spinner];

    if (v4)
    {
      objc_super v5 = [(CNFRegAliasTableCell *)self spinner];
      [v5 stopAnimating];

      id v6 = [(CNFRegAliasTableCell *)self spinner];
      [v6 removeFromSuperview];

      [(CNFRegAliasTableCell *)self setSpinner:0];
    }
  }
LABEL_7:
  if (*((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE50]) && !self->_hasSpinner)
  {
    id v25 = [(CNFRegAliasTableCell *)self iconView];

    if (!v25)
    {
      id v26 = objc_alloc_init(MEMORY[0x263F82828]);
      [(CNFRegAliasTableCell *)self setIconView:v26];

      v27 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark"];
      v28 = [(CNFRegAliasTableCell *)self iconView];
      [v28 setImage:v27];

      v29 = [(CNFRegAliasTableCell *)self iconView];
      [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

      v30 = [(CNFRegAliasTableCell *)self contentView];
      v31 = [(CNFRegAliasTableCell *)self iconView];
      [v30 addSubview:v31];

      v32 = [(CNFRegAliasTableCell *)self iconView];
      v33 = [v32 leadingAnchor];
      v34 = [(CNFRegAliasTableCell *)self contentView];
      v35 = [v34 layoutMarginsGuide];
      v36 = [v35 leadingAnchor];
      v37 = [v33 constraintEqualToAnchor:v36];
      [v37 setActive:1];

      id v42 = [(CNFRegAliasTableCell *)self iconView];
      v38 = [v42 centerYAnchor];
      v39 = [(CNFRegAliasTableCell *)self contentView];
      v40 = [v39 centerYAnchor];
      v41 = [v38 constraintEqualToAnchor:v40];
      [v41 setActive:1];
    }
  }
  else
  {
    v23 = [(CNFRegAliasTableCell *)self iconView];

    if (v23)
    {
      v24 = [(CNFRegAliasTableCell *)self iconView];
      [v24 removeFromSuperview];

      [(CNFRegAliasTableCell *)self setIconView:0];
    }
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegAliasTableCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(CNFRegAliasTableCell *)self _updateIcon];
  [(CNFRegAliasTableCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v38[1] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)CNFRegAliasTableCell;
  [(PSTableCell *)&v36 layoutSubviews];
  uint64_t v3 = [(CNFRegAliasTableCell *)self contentView];
  objc_super v4 = [(PSTableCell *)self titleLabel];
  objc_super v5 = [(CNFRegAliasTableCell *)self detailTextLabel];
  id v6 = [v5 text];
  uint64_t v7 = [v6 length];

  v8 = (id *)MEMORY[0x263F83300];
  if (v7)
  {
    [v5 frame];
    double v10 = v9;
    double v12 = v11;
    uint64_t v37 = *MEMORY[0x263F814F0];
    v13 = [v5 font];
    v38[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];

    v15 = [v5 text];
    if ([v15 length])
    {
      v16 = [v5 text];
      [v3 frame];
      objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 0, v14, 0, v17, v18);
      double v20 = v19;
    }
    else
    {
      double v20 = 0.0;
    }

    uint64_t v22 = [*v8 userInterfaceLayoutDirection];
    double v23 = 10.0;
    if (!v22)
    {
      objc_msgSend(v3, "bounds", 10.0);
      double v23 = v24 + -10.0 - v20;
    }
    objc_msgSend(v5, "setFrame:", v23, v10, v20, v12);
    double v21 = v20 + 6.0;
  }
  else
  {
    double v21 = 0.0;
  }
  [v4 frame];
  double v26 = v25;
  double v28 = v27;
  [v3 bounds];
  double v30 = v29 + -10.0 + -16.0 - v21 + -60.0;
  if ([*v8 userInterfaceLayoutDirection])
  {
    [v3 bounds];
    double v32 = v31 - v30 + -60.0;
  }
  else
  {
    double v32 = 60.0;
  }
  objc_msgSend(v4, "setFrame:", v32, v26, v30, v28);
  v33 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v33 styleUsesCustomTableStyle])
  {
    v34 = [v33 tableCellTextLabelColor];

    if (v34)
    {
      v35 = [v33 tableCellTextLabelColor];
      [v4 setTextColor:v35];
    }
  }
  [(CNFRegAliasTableCell *)self _updateIcon];
  [(CNFRegAliasTableCell *)self setAccessoryType:0];
}

- (BOOL)usesStandardBackgroundImage
{
  return 1;
}

- (BOOL)hasSpinner
{
  return self->_hasSpinner;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIImageView)temporaryPhoneGlyph
{
  return self->_temporaryPhoneGlyph;
}

- (void)setTemporaryPhoneGlyph:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneGlyph, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
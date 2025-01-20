@interface SFContactAutoFillTableViewCell
- (BOOL)checked;
- (BOOL)usesDetailAppearance;
- (SFContactAutoFillTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)checkmarkButtonTapped:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setUsesDetailAppearance:(BOOL)a3;
- (void)setValue:(id)a3 property:(id)a4;
@end

@implementation SFContactAutoFillTableViewCell

- (SFContactAutoFillTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v67[9] = *MEMORY[0x1E4F143B8];
  v66.receiver = self;
  v66.super_class = (Class)SFContactAutoFillTableViewCell;
  v4 = [(SFContactAutoFillTableViewCell *)&v66 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SFContactAutoFillTableViewCell *)v4 contentView];
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v7 setAlignment:1];
    [v7 setAxis:0];
    [v7 setDistribution:0];
    [v7 setSpacing:-14.0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v7];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v8 setAlignment:1];
    [v8 setAxis:0];
    [v8 setDistribution:0];
    objc_msgSend(v8, "setLayoutMargins:", 14.0, 14.0, 14.0, 14.0);
    [v8 setLayoutMarginsRelativeArrangement:1];
    [v8 setSpacing:14.0];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addArrangedSubview:v8];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    categoryLabel = v5->_categoryLabel;
    v5->_categoryLabel = v9;

    v11 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [(UILabel *)v5->_categoryLabel setFont:v11];

    [(UILabel *)v5->_categoryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_categoryLabel _setTextColorFollowsTintColor:1];
    v65 = v8;
    [v8 addArrangedSubview:v5->_categoryLabel];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    optionLabel = v5->_optionLabel;
    v5->_optionLabel = v12;

    v14 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v5->_optionLabel setFont:v14];

    [(UILabel *)v5->_optionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addArrangedSubview:v5->_optionLabel];
    v15 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    v64 = [v15 background];
    [v15 setButtonSize:0];
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [v64 setBackgroundColor:v16];

    double v17 = *MEMORY[0x1E4FB12A8];
    double v18 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v19 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v20 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
    objc_msgSend(v64, "setBackgroundInsets:", *MEMORY[0x1E4FB12A8], v18, v19, v20);
    v63 = v15;
    objc_msgSend(v15, "setContentInsets:", v17, v18, v19, v20);
    uint64_t v21 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:0];
    checkmarkButton = v5->_checkmarkButton;
    v5->_checkmarkButton = (UIButton *)v21;

    [(UIButton *)v5->_checkmarkButton addTarget:v5 action:sel_checkmarkButtonTapped_ forControlEvents:64];
    [(UIButton *)v5->_checkmarkButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v23 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v23 addSubview:v5->_checkmarkButton];
    [v7 insertArrangedSubview:v23 atIndex:0];
    v49 = (void *)MEMORY[0x1E4F28DC8];
    v61 = [(UIButton *)v5->_checkmarkButton centerXAnchor];
    v62 = v23;
    v60 = [v23 centerXAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v67[0] = v59;
    v56 = [(UIButton *)v5->_checkmarkButton centerYAnchor];
    v55 = [v23 centerYAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v67[1] = v54;
    v53 = [v23 widthAnchor];
    v52 = [v53 constraintEqualToConstant:48.0];
    v67[2] = v52;
    v51 = [v23 heightAnchor];
    v50 = [v51 constraintEqualToConstant:48.0];
    v67[3] = v50;
    v48 = [v7 leadingAnchor];
    v47 = [v6 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v67[4] = v46;
    v45 = [v7 topAnchor];
    v44 = [v6 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v67[5] = v43;
    v58 = v7;
    v42 = [v7 widthAnchor];
    v24 = v6;
    v57 = v6;
    v25 = [v6 widthAnchor];
    v26 = [v42 constraintEqualToAnchor:v25];
    v67[6] = v26;
    v27 = [v7 heightAnchor];
    v28 = [v24 heightAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v67[7] = v29;
    v30 = [(UILabel *)v5->_categoryLabel widthAnchor];
    v31 = [v30 constraintEqualToConstant:100.0];
    v67[8] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:9];
    [v49 activateConstraints:v32];

    LODWORD(v33) = 1148846080;
    [(UILabel *)v5->_optionLabel setContentHuggingPriority:0 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(UILabel *)v5->_categoryLabel setContentCompressionResistancePriority:0 forAxis:v34];
    LODWORD(v35) = 1148846080;
    [(UILabel *)v5->_categoryLabel setContentHuggingPriority:0 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(UIButton *)v5->_checkmarkButton setContentCompressionResistancePriority:1 forAxis:v36];
    LODWORD(v37) = 1148846080;
    [(UIButton *)v5->_checkmarkButton setContentCompressionResistancePriority:0 forAxis:v37];
    LODWORD(v38) = 1148846080;
    [(UIButton *)v5->_checkmarkButton setContentHuggingPriority:1 forAxis:v38];
    LODWORD(v39) = 1148846080;
    [(UIButton *)v5->_checkmarkButton setContentHuggingPriority:0 forAxis:v39];
    v40 = v5;
  }
  return v5;
}

- (void)setValue:(id)a3 property:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_value, a3);
  id v8 = (void *)MEMORY[0x1E4F99020];
  if (self->_usesDetailAppearance)
  {
    v9 = [v14 label];
  }
  else
  {
    id v10 = v7;
    if ([v10 isEqualToString:*v8]) {
      _WBSLocalizedString();
    }
    else {
    v9 = [MEMORY[0x1E4F1B8F8] localizedStringForKey:v10];
    }
  }
  [(UILabel *)self->_categoryLabel setText:v9];

  int v11 = [v7 isEqualToString:*MEMORY[0x1E4F1AF10]];
  if (v11) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 4;
  }
  [(UILabel *)self->_optionLabel setNumberOfLines:v11 ^ 1u];
  [(UILabel *)self->_optionLabel setLineBreakMode:v12];
  -[UIButton setEnabled:](self->_checkmarkButton, "setEnabled:", [v7 isEqualToString:*v8] ^ 1);
  -[SFContactAutoFillTableViewCell setChecked:](self, "setChecked:", [v14 selected]);
  v13 = [v14 displayValue];
  [(UILabel *)self->_optionLabel setText:v13];
}

- (void)checkmarkButtonTapped:(id)a3
{
}

- (void)setUsesDetailAppearance:(BOOL)a3
{
  self->_usesDetailAppearance = a3;
  -[UIButton setHidden:](self->_checkmarkButton, "setHidden:");
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->_checked = a3;
  -[SFContactAutoFillValue setSelected:](self->_value, "setSelected:");
  [(UIButton *)self->_checkmarkButton setSelected:self->_checked];
  v4 = [MEMORY[0x1E4FB1618] tintColor];
  v5 = [(SFContactAutoFillValue *)self->_value matches];
  v6 = [v5 firstObject];
  id v7 = [v6 property];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F99020]];

  if ((v8 & 1) == 0)
  {
    v9 = [(UIButton *)self->_checkmarkButton configuration];
    if (self->_checked)
    {
      id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      [v9 setImage:v10];

      int v11 = (void *)MEMORY[0x1E4FB1830];
      uint64_t v12 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      double v20 = v12;
      uint64_t v21 = v4;
      v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = &v20;
      uint64_t v15 = 2;
    }
    else
    {
      v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
      [v9 setImage:v16];

      int v11 = (void *)MEMORY[0x1E4FB1830];
      uint64_t v12 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      double v19 = v12;
      v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = &v19;
      uint64_t v15 = 1;
    }
    double v17 = objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v19, v20, v21);
    double v18 = [v11 configurationWithPaletteColors:v17];
    [v9 setPreferredSymbolConfigurationForImage:v18];

    [(UIButton *)self->_checkmarkButton setConfiguration:v9];
  }
}

- (BOOL)usesDetailAppearance
{
  return self->_usesDetailAppearance;
}

- (BOOL)checked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionLabel, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkButton, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end
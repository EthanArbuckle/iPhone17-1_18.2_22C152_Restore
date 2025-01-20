@interface DKNotableUserDataCardPrimaryCell
- (BOOL)hideChevron;
- (BOOL)isExpanded;
- (DKNotableUserDataCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (UIImageView)chevronImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelContainer;
- (UIView)iconView;
- (UIView)separatorView;
- (id)_chevronImage;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)setChevronImageView:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setHideChevron:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setLabelContainer:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DKNotableUserDataCardPrimaryCell

- (DKNotableUserDataCardPrimaryCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  v87[15] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v86.receiver = self;
  v86.super_class = (Class)DKNotableUserDataCardPrimaryCell;
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  v15 = -[DKNotableUserDataCardPrimaryCell initWithFrame:](&v86, sel_initWithFrame_, *MEMORY[0x263F001A8], v12, v13, v14);
  if (v15)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10];
    iconView = v15->_iconView;
    v15->_iconView = (UIView *)v16;

    [(UIView *)v15->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v15->_iconView setContentMode:1];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v15->_titleLabel;
    v15->_titleLabel = (UILabel *)v18;

    [(UILabel *)v15->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DKNotableUserDataCardPrimaryCell *)v15 _titleFont];
    v20 = id v83 = v10;
    [(UILabel *)v15->_titleLabel setFont:v20];

    [(UILabel *)v15->_titleLabel setText:v8];
    [(UILabel *)v15->_titleLabel setNumberOfLines:0];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
    subtitleLabel = v15->_subtitleLabel;
    v15->_subtitleLabel = (UILabel *)v21;

    [(UILabel *)v15->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v85 = v8;
    v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v15->_subtitleLabel setTextColor:v23];

    v24 = [(DKNotableUserDataCardPrimaryCell *)v15 _subtitleFont];
    [(UILabel *)v15->_subtitleLabel setFont:v24];

    [(UILabel *)v15->_subtitleLabel setText:v9];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", v11, v12, v13, v14);
    labelContainer = v15->_labelContainer;
    v15->_labelContainer = (UIStackView *)v25;

    [(UIStackView *)v15->_labelContainer setAxis:1];
    [(UIStackView *)v15->_labelContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v15->_labelContainer addArrangedSubview:v15->_titleLabel];
    [(UIStackView *)v15->_labelContainer addArrangedSubview:v15->_subtitleLabel];
    id v27 = objc_alloc(MEMORY[0x263F1C6D0]);
    v28 = [(DKNotableUserDataCardPrimaryCell *)v15 _chevronImage];
    uint64_t v29 = [v27 initWithImage:v28];
    chevronImageView = v15->_chevronImageView;
    v15->_chevronImageView = (UIImageView *)v29;

    v31 = [MEMORY[0x263F1C550] secondaryLabelColor];
    v32 = [v31 colorWithAlphaComponent:0.3];
    [(UIImageView *)v15->_chevronImageView setTintColor:v32];

    [(UIImageView *)v15->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v15->_chevronImageView setContentMode:1];
    LODWORD(v33) = 1148846080;
    [(UIImageView *)v15->_chevronImageView setContentHuggingPriority:0 forAxis:v33];
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v11, v12, v13, v14);
    separatorView = v15->_separatorView;
    v15->_separatorView = (UIView *)v34;

    [(UIView *)v15->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v15->_separatorView setHidden:1];
    v36 = [MEMORY[0x263F1C550] separatorColor];
    [(UIView *)v15->_separatorView setBackgroundColor:v36];

    [(DKNotableUserDataCardPrimaryCell *)v15 addSubview:v15->_iconView];
    [(DKNotableUserDataCardPrimaryCell *)v15 addSubview:v15->_labelContainer];
    [(DKNotableUserDataCardPrimaryCell *)v15 addSubview:v15->_chevronImageView];
    [(DKNotableUserDataCardPrimaryCell *)v15 addSubview:v15->_separatorView];
    v82 = [(UIView *)v15->_iconView widthAnchor];
    v81 = [v82 constraintEqualToConstant:40.0];
    v87[0] = v81;
    v80 = [(UIView *)v15->_iconView heightAnchor];
    v79 = [v80 constraintEqualToConstant:40.0];
    v87[1] = v79;
    v77 = [(UIView *)v15->_iconView leadingAnchor];
    v78 = [(DKNotableUserDataCardPrimaryCell *)v15 layoutMarginsGuide];
    v76 = [v78 leadingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v87[2] = v75;
    v74 = [(UIView *)v15->_iconView centerYAnchor];
    v73 = [(DKNotableUserDataCardPrimaryCell *)v15 centerYAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v87[3] = v72;
    v71 = [(UIStackView *)v15->_labelContainer leadingAnchor];
    v70 = [(UIView *)v15->_iconView trailingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:14.0];
    v87[4] = v69;
    v68 = [(UIStackView *)v15->_labelContainer trailingAnchor];
    v67 = [(UIImageView *)v15->_chevronImageView leadingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v87[5] = v66;
    v65 = [(UIStackView *)v15->_labelContainer centerYAnchor];
    v64 = [(DKNotableUserDataCardPrimaryCell *)v15 centerYAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v87[6] = v63;
    v62 = [(UIStackView *)v15->_labelContainer topAnchor];
    v61 = [(DKNotableUserDataCardPrimaryCell *)v15 topAnchor];
    v60 = [v62 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v61 multiplier:1.0];
    v87[7] = v60;
    v59 = [(DKNotableUserDataCardPrimaryCell *)v15 bottomAnchor];
    v58 = [(UIStackView *)v15->_labelContainer bottomAnchor];
    v57 = [v59 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v58 multiplier:1.0];
    v87[8] = v57;
    v56 = [(UIImageView *)v15->_chevronImageView centerYAnchor];
    v55 = [(DKNotableUserDataCardPrimaryCell *)v15 centerYAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v87[9] = v54;
    v52 = [(UIImageView *)v15->_chevronImageView trailingAnchor];
    v53 = [(DKNotableUserDataCardPrimaryCell *)v15 layoutMarginsGuide];
    v51 = [v53 trailingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v87[10] = v50;
    v49 = [(UIView *)v15->_separatorView heightAnchor];
    v48 = [v49 constraintEqualToConstant:1.0];
    v87[11] = v48;
    v47 = [(UIView *)v15->_separatorView leadingAnchor];
    v37 = [(UIStackView *)v15->_labelContainer leadingAnchor];
    v38 = [v47 constraintEqualToAnchor:v37];
    v87[12] = v38;
    v39 = [(UIView *)v15->_separatorView trailingAnchor];
    v40 = [(DKNotableUserDataCardPrimaryCell *)v15 trailingAnchor];
    [v39 constraintEqualToAnchor:v40];
    v41 = id v84 = v9;
    v87[13] = v41;
    v42 = [(UIView *)v15->_separatorView bottomAnchor];
    v43 = [(DKNotableUserDataCardPrimaryCell *)v15 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v87[14] = v44;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:15];
    [(DKNotableUserDataCardPrimaryCell *)v15 addConstraints:v45];

    id v10 = v83;
    id v9 = v84;

    id v8 = v85;
  }

  return v15;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  self->_expanded = a3;
  v5 = [(DKNotableUserDataCardPrimaryCell *)self _chevronImage];
  v6 = [(DKNotableUserDataCardPrimaryCell *)self chevronImageView];
  [v6 setImage:v5];

  id v7 = [(DKNotableUserDataCardPrimaryCell *)self separatorView];
  [v7 setHidden:!v3];
}

- (void)setHideChevron:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DKNotableUserDataCardPrimaryCell *)self chevronImageView];
  [v4 setHidden:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DKNotableUserDataCardPrimaryCell;
  [(DKNotableUserDataCardPrimaryCell *)&v8 traitCollectionDidChange:a3];
  id v4 = [(DKNotableUserDataCardPrimaryCell *)self _titleFont];
  v5 = [(DKNotableUserDataCardPrimaryCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [(DKNotableUserDataCardPrimaryCell *)self _subtitleFont];
  id v7 = [(DKNotableUserDataCardPrimaryCell *)self subtitleLabel];
  [v7 setFont:v6];
}

- (id)_chevronImage
{
  if ([(DKNotableUserDataCardPrimaryCell *)self isExpanded]) {
    v2 = @"chevron.down";
  }
  else {
    v2 = @"chevron.forward";
  }
  BOOL v3 = [MEMORY[0x263F1C6B0] systemImageNamed:v2];
  return v3;
}

- (id)_titleFont
{
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
  BOOL v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  id v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)_subtitleFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
  id v4 = [v2 fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)hideChevron
{
  return self->_hideChevron;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
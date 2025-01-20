@interface DKNotableUserDataCardCell
- (DKNotableUserDataCardCell)initWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5;
- (UILabel)stateLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelContainer;
- (UIView)accessoryView;
- (id)_bodyFont;
- (id)_stateFont;
- (id)_titleFont;
- (int64_t)_stateStackViewAxis;
- (void)setAccessoryView:(id)a3;
- (void)setLabelContainer:(id)a3;
- (void)setStateLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DKNotableUserDataCardCell

- (DKNotableUserDataCardCell)initWithTitle:(id)a3 subtitle:(id)a4 accessoryView:(id)a5
{
  v69[7] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v67.receiver = self;
  v67.super_class = (Class)DKNotableUserDataCardCell;
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  v15 = -[DKNotableUserDataCardCell initWithFrame:](&v67, sel_initWithFrame_, *MEMORY[0x263F001A8], v12, v13, v14);
  v16 = v15;
  if (v15)
  {
    id v64 = v10;
    p_accessoryView = (id *)&v15->_accessoryView;
    objc_storeStrong((id *)&v15->_accessoryView, a5);
    [*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v8)
    {
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
      titleLabel = v16->_titleLabel;
      v16->_titleLabel = (UILabel *)v18;

      [(UILabel *)v16->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = [(DKNotableUserDataCardCell *)v16 _titleFont];
      [(UILabel *)v16->_titleLabel setFont:v20];

      [(UILabel *)v16->_titleLabel setText:v8];
      [(UILabel *)v16->_titleLabel setNumberOfLines:0];
    }
    id v66 = v8;
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v11, v12, v13, v14);
    subtitleLabel = v16->_subtitleLabel;
    v16->_subtitleLabel = (UILabel *)v21;

    [(UILabel *)v16->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UILabel *)v16->_subtitleLabel setTextColor:v23];

    v24 = [(DKNotableUserDataCardCell *)v16 _bodyFont];
    [(UILabel *)v16->_subtitleLabel setFont:v24];

    id v65 = v9;
    [(UILabel *)v16->_subtitleLabel setText:v9];
    [(UILabel *)v16->_subtitleLabel setNumberOfLines:0];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", v11, v12, v13, v14);
    labelContainer = v16->_labelContainer;
    v16->_labelContainer = (UIStackView *)v25;

    [(UIStackView *)v16->_labelContainer setAxis:1];
    [(UIStackView *)v16->_labelContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v16->_labelContainer addArrangedSubview:v16->_titleLabel];
    [(UIStackView *)v16->_labelContainer addArrangedSubview:v16->_subtitleLabel];
    [(DKNotableUserDataCardCell *)v16 addSubview:v16->_labelContainer];
    if (*p_accessoryView)
    {
      -[DKNotableUserDataCardCell addSubview:](v16, "addSubview:");
      v58 = [*p_accessoryView widthAnchor];
      uint64_t v53 = [v58 constraintEqualToConstant:40.0];
      v69[0] = v53;
      v54 = [*p_accessoryView heightAnchor];
      v62 = [v54 constraintEqualToConstant:40.0];
      v69[1] = v62;
      v60 = [*p_accessoryView leadingAnchor];
      v56 = [(DKNotableUserDataCardCell *)v16 leadingAnchor];
      v55 = [v60 constraintEqualToAnchor:v56];
      v69[2] = v55;
      v52 = [*p_accessoryView topAnchor];
      v51 = [(DKNotableUserDataCardCell *)v16 topAnchor];
      v50 = [v52 constraintEqualToAnchor:v51];
      v69[3] = v50;
      v49 = [(UIStackView *)v16->_labelContainer leadingAnchor];
      v48 = [*p_accessoryView trailingAnchor];
      v27 = [v49 constraintEqualToAnchor:v48 constant:14.0];
      v69[4] = v27;
      v28 = [(UIStackView *)v16->_labelContainer topAnchor];
      v29 = [*p_accessoryView topAnchor];
      v30 = [v28 constraintLessThanOrEqualToAnchor:v29];
      v69[5] = v30;
      v31 = [(UIStackView *)v16->_labelContainer bottomAnchor];
      v32 = [*p_accessoryView bottomAnchor];
      v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32];
      v69[6] = v33;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:7];
      [(DKNotableUserDataCardCell *)v16 addConstraints:v34];

      v35 = (void *)v53;
      v36 = v58;

      v37 = v54;
    }
    else
    {
      v36 = [(UIStackView *)v16->_labelContainer leadingAnchor];
      v35 = [(DKNotableUserDataCardCell *)v16 leadingAnchor];
      v37 = [v36 constraintEqualToAnchor:v35 constant:54.0];
      [(DKNotableUserDataCardCell *)v16 addConstraint:v37];
    }

    v63 = [(UIStackView *)v16->_labelContainer trailingAnchor];
    v61 = [(DKNotableUserDataCardCell *)v16 trailingAnchor];
    v59 = [v63 constraintEqualToAnchor:v61];
    v68[0] = v59;
    v57 = [(UIStackView *)v16->_labelContainer centerYAnchor];
    v38 = [(DKNotableUserDataCardCell *)v16 centerYAnchor];
    v39 = [v57 constraintEqualToAnchor:v38];
    v68[1] = v39;
    v40 = [(UIStackView *)v16->_labelContainer topAnchor];
    v41 = [(DKNotableUserDataCardCell *)v16 topAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v68[2] = v42;
    v43 = [(UIStackView *)v16->_labelContainer bottomAnchor];
    v44 = [(DKNotableUserDataCardCell *)v16 bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v68[3] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:4];
    [(DKNotableUserDataCardCell *)v16 addConstraints:v46];

    id v9 = v65;
    id v8 = v66;
    id v10 = v64;
  }

  return v16;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DKNotableUserDataCardCell;
  [(DKNotableUserDataCardCell *)&v8 traitCollectionDidChange:a3];
  v4 = [(DKNotableUserDataCardCell *)self _titleFont];
  v5 = [(DKNotableUserDataCardCell *)self titleLabel];
  [v5 setFont:v4];

  v6 = [(DKNotableUserDataCardCell *)self _bodyFont];
  v7 = [(DKNotableUserDataCardCell *)self subtitleLabel];
  [v7 setFont:v6];
}

- (id)_titleFont
{
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)_stateFont
{
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0]];
  v4 = [v2 fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (int64_t)_stateStackViewAxis
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (UIStackView)labelContainer
{
  return self->_labelContainer;
}

- (void)setLabelContainer:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)stateLabel
{
  return self->_stateLabel;
}

- (void)setStateLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
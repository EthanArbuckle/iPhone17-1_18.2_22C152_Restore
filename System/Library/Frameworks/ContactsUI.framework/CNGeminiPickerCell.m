@interface CNGeminiPickerCell
- (CNGeminiBadge)badgeView;
- (CNGeminiBadge)centeredBadgeView;
- (CNGeminiPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)centeredNameLabel;
- (UILabel)labelLabel;
- (UILabel)valueLabel;
- (void)setBadgeView:(id)a3;
- (void)setCenteredBadgeView:(id)a3;
- (void)setCenteredNameLabel:(id)a3;
- (void)setLabelLabel:(id)a3;
- (void)setText:(id)a3 detailText:(id)a4 badgeText:(id)a5;
- (void)setValueLabel:(id)a3;
@end

@implementation CNGeminiPickerCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);

  objc_storeStrong((id *)&self->_badgeView, 0);
}

- (void)setCenteredNameLabel:(id)a3
{
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredBadgeView:(id)a3
{
}

- (CNGeminiBadge)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setValueLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setLabelLabel:(id)a3
{
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (void)setBadgeView:(id)a3
{
}

- (CNGeminiBadge)badgeView
{
  return self->_badgeView;
}

- (void)setText:(id)a3 detailText:(id)a4 badgeText:(id)a5
{
  v28 = (__CFString *)a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(CNGeminiPickerCell *)self badgeView];
  [v10 setText:v8];

  v11 = [(CNGeminiPickerCell *)self labelLabel];
  [v11 setText:v9];

  v12 = [(CNGeminiPickerCell *)self centeredBadgeView];
  [v12 setText:v8];

  v13 = [(CNGeminiPickerCell *)self centeredNameLabel];
  [v13 setText:v9];

  uint64_t v14 = [(__CFString *)v28 length];
  v15 = [(CNGeminiPickerCell *)self badgeView];
  v16 = v15;
  if (v14)
  {
    [v15 setHidden:0];

    v17 = [(CNGeminiPickerCell *)self labelLabel];
    [v17 setHidden:0];

    v18 = [(CNGeminiPickerCell *)self valueLabel];
    [v18 setHidden:0];

    v19 = [(CNGeminiPickerCell *)self centeredBadgeView];
    [v19 setHidden:1];

    v20 = [(CNGeminiPickerCell *)self centeredNameLabel];
    [v20 setHidden:1];

    v21 = [(CNGeminiPickerCell *)self valueLabel];
    v22 = v21;
    v23 = v28;
  }
  else
  {
    [v15 setHidden:1];

    v24 = [(CNGeminiPickerCell *)self labelLabel];
    [v24 setHidden:1];

    v25 = [(CNGeminiPickerCell *)self valueLabel];
    [v25 setHidden:1];

    v26 = [(CNGeminiPickerCell *)self centeredBadgeView];
    [v26 setHidden:0];

    v27 = [(CNGeminiPickerCell *)self centeredNameLabel];
    [v27 setHidden:0];

    v21 = [(CNGeminiPickerCell *)self valueLabel];
    v22 = v21;
    v23 = @"+1 (123) 456-7890";
  }
  [v21 setText:v23];
}

- (CNGeminiPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v103[3] = *MEMORY[0x1E4F143B8];
  v101.receiver = self;
  v101.super_class = (Class)CNGeminiPickerCell;
  v4 = [(CNGeminiPickerCell *)&v101 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = +[CNGeminiBadge geminiBadgeWithText:@"-"];
    badgeView = v4->_badgeView;
    v4->_badgeView = (CNGeminiBadge *)v5;

    v7 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0];
    v100 = [v7 scaledFontForFont:v8];

    v99 = +[CNUIColorRepository monogrammerBackTextWhiteColor];
    v98 = +[CNUIColorRepository contactCardStaticIdentityBadgeGlyphColor];
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    v102[0] = *MEMORY[0x1E4FB06F8];
    v102[1] = v9;
    v103[0] = v100;
    v103[1] = v99;
    v102[2] = *MEMORY[0x1E4FB06C0];
    v103[2] = v98;
    v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
    [(CNGeminiBadge *)v4->_badgeView setViewAttributes:v97];
    v10 = [(CNGeminiPickerCell *)v4 contentView];
    v11 = [(CNGeminiPickerCell *)v4 badgeView];
    [v10 addSubview:v11];

    v12 = [(CNGeminiPickerCell *)v4 badgeView];
    v13 = [v12 leadingAnchor];
    uint64_t v14 = [(CNGeminiPickerCell *)v4 contentView];
    v15 = [v14 layoutMarginsGuide];
    v16 = [v15 leadingAnchor];
    v17 = [v13 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelLabel = v4->_labelLabel;
    v4->_labelLabel = v18;

    uint64_t v96 = *MEMORY[0x1E4FB28C8];
    v20 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
    [(UILabel *)v4->_labelLabel setFont:v20];

    [(UILabel *)v4->_labelLabel setNumberOfLines:0];
    [(UILabel *)v4->_labelLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(CNGeminiPickerCell *)v4 contentView];
    [v21 addSubview:v4->_labelLabel];

    v22 = [(UILabel *)v4->_labelLabel firstBaselineAnchor];
    v23 = [(CNGeminiPickerCell *)v4 contentView];
    v24 = [v23 topAnchor];
    v25 = [v22 constraintEqualToSystemSpacingBelowAnchor:v24 multiplier:1.0];
    [v25 setActive:1];

    v26 = [(UILabel *)v4->_labelLabel leadingAnchor];
    v27 = [(CNGeminiPickerCell *)v4 badgeView];
    v28 = [v27 trailingAnchor];
    v29 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v29 scaledValueForValue:4.0];
    v30 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28);
    [v30 setActive:1];

    v31 = [(CNGeminiPickerCell *)v4 badgeView];
    v32 = [v31 centerYAnchor];
    v33 = [(UILabel *)v4->_labelLabel centerYAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(CNGeminiPickerCell *)v4 badgeView];
    [v35 frame];
    double v37 = v36;
    v38 = [(CNGeminiPickerCell *)v4 badgeView];
    [v38 frame];
    double v40 = v39;
    v41 = [(CNGeminiPickerCell *)v4 badgeView];
    [v41 intrinsicContentSize];
    double v43 = v42;
    v44 = [(CNGeminiPickerCell *)v4 labelLabel];
    v45 = [v44 font];
    [v45 capHeight];
    double v47 = v46;
    v48 = [(CNGeminiPickerCell *)v4 badgeView];
    objc_msgSend(v48, "setFrame:", v37, v40, v43, v47);

    v49 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = v49;

    v51 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v4->_valueLabel setFont:v51];

    [(UILabel *)v4->_valueLabel setNumberOfLines:0];
    [(UILabel *)v4->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v52 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v4->_valueLabel setTextColor:v52];

    v53 = [(CNGeminiPickerCell *)v4 contentView];
    [v53 addSubview:v4->_valueLabel];

    v54 = [(UILabel *)v4->_valueLabel firstBaselineAnchor];
    v55 = [(UILabel *)v4->_labelLabel lastBaselineAnchor];
    v56 = [v54 constraintEqualToSystemSpacingBelowAnchor:v55 multiplier:1.0];
    [v56 setActive:1];

    v57 = [(UILabel *)v4->_valueLabel leadingAnchor];
    v58 = [(CNGeminiPickerCell *)v4 badgeView];
    v59 = [v58 leadingAnchor];
    v60 = [v57 constraintEqualToAnchor:v59];
    [v60 setActive:1];

    v61 = [(UILabel *)v4->_valueLabel trailingAnchor];
    v62 = [(CNGeminiPickerCell *)v4 contentView];
    v63 = [v62 layoutMarginsGuide];
    v64 = [v63 trailingAnchor];
    v65 = [v61 constraintLessThanOrEqualToAnchor:v64];
    [v65 setActive:1];

    v66 = [(CNGeminiPickerCell *)v4 contentView];
    v67 = [v66 bottomAnchor];
    v68 = [(UILabel *)v4->_valueLabel lastBaselineAnchor];
    v69 = [v67 constraintEqualToSystemSpacingBelowAnchor:v68 multiplier:1.0];
    [v69 setActive:1];

    uint64_t v70 = +[CNGeminiBadge geminiBadgeWithText:@"-"];
    centeredBadgeView = v4->_centeredBadgeView;
    v4->_centeredBadgeView = (CNGeminiBadge *)v70;

    [(CNGeminiBadge *)v4->_centeredBadgeView setViewAttributes:v97];
    v72 = [(CNGeminiPickerCell *)v4 contentView];
    v73 = [(CNGeminiPickerCell *)v4 centeredBadgeView];
    [v72 addSubview:v73];

    v74 = [(CNGeminiPickerCell *)v4 centeredBadgeView];
    v75 = [v74 leadingAnchor];
    v76 = [(CNGeminiPickerCell *)v4 contentView];
    v77 = [v76 layoutMarginsGuide];
    v78 = [v77 leadingAnchor];
    v79 = [v75 constraintEqualToAnchor:v78];
    [v79 setActive:1];

    v80 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    centeredNameLabel = v4->_centeredNameLabel;
    v4->_centeredNameLabel = v80;

    v82 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v96];
    [(UILabel *)v4->_centeredNameLabel setFont:v82];

    [(UILabel *)v4->_centeredNameLabel setNumberOfLines:0];
    [(UILabel *)v4->_centeredNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v83 = [(CNGeminiPickerCell *)v4 contentView];
    [v83 addSubview:v4->_centeredNameLabel];

    v84 = [(UILabel *)v4->_centeredNameLabel centerYAnchor];
    v85 = [(CNGeminiPickerCell *)v4 contentView];
    v86 = [v85 centerYAnchor];
    v87 = [v84 constraintEqualToAnchor:v86];
    [v87 setActive:1];

    v88 = [(UILabel *)v4->_centeredNameLabel leadingAnchor];
    v89 = [(CNGeminiBadge *)v4->_centeredBadgeView trailingAnchor];
    v90 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v90 scaledValueForValue:4.0];
    v91 = objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89);
    [v91 setActive:1];

    v92 = [(CNGeminiBadge *)v4->_centeredBadgeView centerYAnchor];
    v93 = [(UILabel *)v4->_centeredNameLabel centerYAnchor];
    v94 = [v92 constraintEqualToAnchor:v93];
    [v94 setActive:1];
  }
  return v4;
}

@end
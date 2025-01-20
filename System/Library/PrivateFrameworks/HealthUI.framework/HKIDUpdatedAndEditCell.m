@interface HKIDUpdatedAndEditCell
- (BOOL)isEditButtonDisabled;
- (BOOL)isEditButtonHidden;
- (HKIDUpdatedAndEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKIDUpdatedAndEditCellDelegate)delegate;
- (NSDate)dateSaved;
- (NSString)titleText;
- (UIButton)editButton;
- (UILabel)dateLabel;
- (UILabel)titleLabel;
- (void)_editButtonTapped:(id)a3;
- (void)_updateFont;
- (void)_updateForCurrentSizeCategory;
- (void)setDateLabel:(id)a3;
- (void)setDateSaved:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableEditButton:(BOOL)a3;
- (void)setEditButton:(id)a3;
- (void)setHideEditButton:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKIDUpdatedAndEditCell

- (HKIDUpdatedAndEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v87[2] = *MEMORY[0x1E4F143B8];
  v84.receiver = self;
  v84.super_class = (Class)HKIDUpdatedAndEditCell;
  v4 = [(HKIDUpdatedAndEditCell *)&v84 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v7 = [v6 localizedStringForKey:@"updated_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v8 = [v7 localizedUppercaseString];
    [(UILabel *)v5 setText:v8];

    v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5 setTextColor:v9];

    v82 = v5;
    [(UILabel *)v5 setNumberOfLines:0];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v10 setTextColor:v11];

    v83 = v10;
    [(UILabel *)v10 setNumberOfLines:0];
    v12 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    [(UIButton *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v12 addTarget:v4 action:sel__editButtonTapped_ forControlEvents:64];
    v13 = HKHealthKeyColor();
    [(UIButton *)v12 setTitleColor:v13 forState:0];

    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UIButton *)v12 setTitleColor:v14 forState:2];

    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v16 = [v15 localizedStringForKey:@"updated_edit_button_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(UIButton *)v12 setTitle:v16 forState:0];

    v17 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    [v17 addSubview:v12];

    id v18 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v87[0] = v5;
    v87[1] = v10;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    v20 = (UIStackView *)[v18 initWithArrangedSubviews:v19];

    [(UIStackView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v20 setAxis:1];
    [(UIStackView *)v20 setAlignment:1];
    [(UIStackView *)v20 setDistribution:0];
    v21 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    [v21 addSubview:v20];

    v22 = [(UIButton *)v12 firstBaselineAnchor];
    v23 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v24 = [v23 topAnchor];
    uint64_t v25 = [v22 constraintEqualToAnchor:v24 constant:0.0];
    editFirstBaseLineAnchorConstraint = v4->_editFirstBaseLineAnchorConstraint;
    v4->_editFirstBaseLineAnchorConstraint = (NSLayoutConstraint *)v25;

    stackView = v4->_stackView;
    v4->_stackView = v20;
    v81 = v20;

    v86[0] = v4->_editFirstBaseLineAnchorConstraint;
    v76 = [(UIButton *)v12 trailingAnchor];
    v78 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v28 = [v78 trailingAnchor];
    v29 = [v76 constraintEqualToAnchor:v28 constant:-16.0];
    v86[1] = v29;
    v30 = v12;
    v80 = v12;
    v31 = [(UIButton *)v12 centerYAnchor];
    v32 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v33 = [v32 centerYAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    v86[2] = v34;
    v35 = [(UIStackView *)v81 centerYAnchor];
    v36 = [(UIButton *)v30 centerYAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v86[3] = v37;
    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
    regularLayoutConstraints = v4->_regularLayoutConstraints;
    v4->_regularLayoutConstraints = (NSArray *)v38;

    v79 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v77 = [v79 topAnchor];
    v75 = [(UIStackView *)v81 topAnchor];
    v74 = [v77 constraintEqualToAnchor:v75 constant:-12.0];
    v85[0] = v74;
    v73 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v72 = [v73 bottomAnchor];
    v71 = [(UIStackView *)v81 bottomAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:12.0];
    v85[1] = v70;
    v69 = [(UILabel *)v82 widthAnchor];
    v68 = [(UIStackView *)v81 widthAnchor];
    [(HKIDUpdatedAndEditCell *)v4 separatorInset];
    v67 = [v69 constraintEqualToAnchor:v68 constant:-v40];
    v85[2] = v67;
    v66 = [(UILabel *)v83 widthAnchor];
    v65 = [(UIStackView *)v81 widthAnchor];
    [(HKIDUpdatedAndEditCell *)v4 separatorInset];
    v42 = [v66 constraintEqualToAnchor:v65 constant:-v41];
    v85[3] = v42;
    v43 = [(UIStackView *)v81 centerYAnchor];
    v44 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v45 = [v44 centerYAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    v85[4] = v46;
    v47 = [(UIStackView *)v81 trailingAnchor];
    v48 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v49 = [v48 trailingAnchor];
    v50 = [v47 constraintEqualToAnchor:v49];
    v85[5] = v50;
    uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:6];
    largeTextLayoutConstraints = v4->_largeTextLayoutConstraints;
    v4->_largeTextLayoutConstraints = (NSArray *)v51;

    v53 = [(UIStackView *)v81 leadingAnchor];
    v54 = [(HKIDUpdatedAndEditCell *)v4 contentView];
    v55 = [v54 leadingAnchor];
    [(HKIDUpdatedAndEditCell *)v4 separatorInset];
    v57 = [v53 constraintEqualToAnchor:v55 constant:v56];
    [v57 setActive:1];

    LODWORD(v58) = 1148846080;
    [(UIButton *)v80 setContentCompressionResistancePriority:0 forAxis:v58];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v82;
    v60 = v82;

    dateLabel = v4->_dateLabel;
    v4->_dateLabel = v83;
    v62 = v83;

    editButton = v4->_editButton;
    v4->_editButton = v80;

    [(HKIDUpdatedAndEditCell *)v4 _updateForCurrentSizeCategory];
  }
  return v4;
}

- (void)_updateFont
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2950], 2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *MEMORY[0x1E4FB28D8];
  v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28D8], 2);
  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", v3);
  [(UILabel *)self->_titleLabel setFont:v4];
  [(UILabel *)self->_dateLabel setFont:v5];
  v6 = [(UIButton *)self->_editButton titleLabel];
  [v6 setFont:v7];

  [v7 _scaledValueForValue:36.0];
  -[NSLayoutConstraint setConstant:](self->_editFirstBaseLineAnchorConstraint, "setConstant:");
}

- (void)_updateForCurrentSizeCategory
{
  [(HKIDUpdatedAndEditCell *)self _updateFont];
  BOOL IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  stackView = self->_stackView;
  editButton = self->_editButton;
  if (IsUsingAccessibilityContentSizeCategory)
  {
    [(UIStackView *)stackView addArrangedSubview:editButton];
    v6 = &OBJC_IVAR___HKIDUpdatedAndEditCell__largeTextLayoutConstraints;
    id v7 = &OBJC_IVAR___HKIDUpdatedAndEditCell__regularLayoutConstraints;
  }
  else
  {
    [(UIStackView *)stackView removeArrangedSubview:editButton];
    v8 = [(HKIDUpdatedAndEditCell *)self contentView];
    [v8 addSubview:self->_editButton];

    v6 = &OBJC_IVAR___HKIDUpdatedAndEditCell__regularLayoutConstraints;
    id v7 = &OBJC_IVAR___HKIDUpdatedAndEditCell__largeTextLayoutConstraints;
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v7)];
  v9 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v6);
  [v9 activateConstraints:v10];
}

- (void)_editButtonTapped:(id)a3
{
  id v4 = [(HKIDUpdatedAndEditCell *)self delegate];
  [v4 updatedAndEditCellDidTapEditButton:self];
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setDateSaved:(id)a3
{
  p_dateSaved = (void **)&self->_dateSaved;
  objc_storeStrong((id *)&self->_dateSaved, a3);
  id v6 = a3;
  HKLocalizedStringForDateAndTemplate(*p_dateSaved, 35);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [(HKIDUpdatedAndEditCell *)self dateLabel];
  [v7 setText:v8];
}

- (void)setHideEditButton:(BOOL)a3
{
  self->_hideEditButton = a3;
  -[UIButton setHidden:](self->_editButton, "setHidden:");
}

- (void)setDisableEditButton:(BOOL)a3
{
}

- (BOOL)isEditButtonDisabled
{
  return [(UIButton *)self->_editButton isEnabled] ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKIDUpdatedAndEditCell;
  [(HKIDUpdatedAndEditCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(HKIDUpdatedAndEditCell *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKIDUpdatedAndEditCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (HKIDUpdatedAndEditCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKIDUpdatedAndEditCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)dateSaved
{
  return self->_dateSaved;
}

- (BOOL)isEditButtonHidden
{
  return self->_hideEditButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dateSaved, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editFirstBaseLineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_largeTextLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
}

@end
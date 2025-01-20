@interface HUTitleValueEditableTextCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)hideTitle;
- (BOOL)isDisabled;
- (HFItem)item;
- (HUTitleValueEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)titleLabelConstraints;
- (NSArray)valueTextFieldConstraints;
- (NSLayoutConstraint)labelsSpacingConstraint;
- (NSLayoutConstraint)minimumHeightConstraint;
- (NSString)titleText;
- (UIFont)titleFont;
- (UILabel)titleLabel;
- (UITextField)valueTextField;
- (void)_addTitleLabel;
- (void)_addValueTextField;
- (void)_updateTitle;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setHideTitle:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLabelsSpacingConstraint:(id)a3;
- (void)setMinimumHeightConstraint:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitleFont:(id)a3;
- (void)setTitleLabelConstraints:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setValueTextFieldConstraints:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUTitleValueEditableTextCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUTitleValueEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUTitleValueEditableTextCell;
  v4 = [(HUTitleValueEditableTextCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v5;

    [(HUTitleValueEditableTextCell *)v4 _addTitleLabel];
    [(HUTitleValueEditableTextCell *)v4 _addValueTextField];
  }
  return v4;
}

- (void)prepareForReuse
{
  v12.receiver = self;
  v12.super_class = (Class)HUTitleValueEditableTextCell;
  [(HUTitleValueEditableTextCell *)&v12 prepareForReuse];
  [(HUTitleValueEditableTextCell *)self setHideTitle:0];
  [(HUTitleValueEditableTextCell *)self setTitleText:0];
  uint64_t v3 = *MEMORY[0x1E4F43870];
  v4 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [(HUTitleValueEditableTextCell *)self setTitleFont:v4];

  uint64_t v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v3];
  v6 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v6 setFont:v5];

  v7 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v7 setText:0];

  objc_super v8 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v8 setPlaceholder:0];

  v9 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v9 setDelegate:0];

  v10 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v10 setEnabled:1];

  v11 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v11 endEditing:1];
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v5 = a3;
  id v6 = [(HUTitleValueEditableTextCell *)self titleLabel];
  [v6 setText:v5];
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
  id v5 = a3;
  id v6 = [(HUTitleValueEditableTextCell *)self titleLabel];
  [v6 setFont:v5];
}

- (void)setHideTitle:(BOOL)a3
{
  if (self->_hideTitle != a3)
  {
    self->_hideTitle = a3;
    if (a3)
    {
      [(UILabel *)self->_titleLabel removeFromSuperview];
      [(HUTitleValueEditableTextCell *)self setTitleLabelConstraints:0];
      [(HUTitleValueEditableTextCell *)self setLabelsSpacingConstraint:0];
    }
    else
    {
      [(HUTitleValueEditableTextCell *)self _addTitleLabel];
      [(HUTitleValueEditableTextCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    id v4 = [(HUTitleValueEditableTextCell *)self valueTextField];
    [v4 becomeFirstResponder];
  }
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  BOOL v4 = !a3;
  id v5 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v5 setEnabled:v4];

  if (v4) {
    [MEMORY[0x1E4F428B8] labelColor];
  }
  else {
  id v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  v7 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v7 setTextColor:v6];

  objc_super v8 = [(HUTitleValueEditableTextCell *)self valueTextField];
  [v8 setClearButtonMode:v4];

  [(HUTitleValueEditableTextCell *)self _updateTitle];
}

- (void)updateConstraints
{
  v74[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUTitleValueEditableTextCell *)self contentView];
  BOOL v4 = [v3 layoutMarginsGuide];

  id v5 = [(HUTitleValueEditableTextCell *)self titleLabel];
  uint64_t v6 = [v5 superview];
  if (v6)
  {
    v7 = (void *)v6;
    objc_super v8 = [(HUTitleValueEditableTextCell *)self titleLabelConstraints];

    if (v8) {
      goto LABEL_5;
    }
    v70 = [(HUTitleValueEditableTextCell *)self titleLabel];
    v68 = [v70 leadingAnchor];
    v66 = [v4 leadingAnchor];
    v64 = [v68 constraintEqualToAnchor:v66];
    v74[0] = v64;
    v62 = [(HUTitleValueEditableTextCell *)self titleLabel];
    v60 = [v62 widthAnchor];
    v58 = [v4 widthAnchor];
    v56 = [v60 constraintLessThanOrEqualToAnchor:v58];
    v74[1] = v56;
    v54 = [(HUTitleValueEditableTextCell *)self titleLabel];
    v9 = [v54 centerYAnchor];
    v10 = [v4 centerYAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v74[2] = v11;
    objc_super v12 = [(HUTitleValueEditableTextCell *)self titleLabel];
    v13 = [v12 heightAnchor];
    [v4 heightAnchor];
    v15 = v14 = v4;
    v16 = [v13 constraintEqualToAnchor:v15];
    v74[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    [(HUTitleValueEditableTextCell *)self setTitleLabelConstraints:v17];

    BOOL v4 = v14;
    v18 = (void *)MEMORY[0x1E4F28DC8];
    id v5 = [(HUTitleValueEditableTextCell *)self titleLabelConstraints];
    [v18 activateConstraints:v5];
  }

LABEL_5:
  v19 = [(HUTitleValueEditableTextCell *)self valueTextField];
  uint64_t v20 = [v19 superview];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(HUTitleValueEditableTextCell *)self valueTextFieldConstraints];

    if (v22) {
      goto LABEL_9;
    }
    v71 = [(HUTitleValueEditableTextCell *)self valueTextField];
    v69 = [v71 trailingAnchor];
    v67 = [v4 trailingAnchor];
    v65 = [v69 constraintEqualToAnchor:v67];
    v73[0] = v65;
    v63 = [(HUTitleValueEditableTextCell *)self valueTextField];
    v61 = [v63 widthAnchor];
    v59 = [v4 widthAnchor];
    v57 = [v61 constraintLessThanOrEqualToAnchor:v59];
    v73[1] = v57;
    v55 = [(HUTitleValueEditableTextCell *)self valueTextField];
    v53 = [v55 widthAnchor];
    v52 = [v4 widthAnchor];
    v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52 multiplier:0.4];
    v73[2] = v51;
    v50 = [(HUTitleValueEditableTextCell *)self valueTextField];
    v23 = [v50 centerYAnchor];
    [v4 centerYAnchor];
    v25 = v24 = v4;
    v26 = [v23 constraintEqualToAnchor:v25];
    v73[3] = v26;
    v27 = [(HUTitleValueEditableTextCell *)self valueTextField];
    v28 = [v27 heightAnchor];
    v29 = [v24 heightAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v73[4] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:5];
    [(HUTitleValueEditableTextCell *)self setValueTextFieldConstraints:v31];

    BOOL v4 = v24;
    v32 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(HUTitleValueEditableTextCell *)self valueTextFieldConstraints];
    [v32 activateConstraints:v19];
  }

LABEL_9:
  v33 = [(HUTitleValueEditableTextCell *)self titleLabel];
  uint64_t v34 = [v33 superview];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(HUTitleValueEditableTextCell *)self valueTextField];
    uint64_t v37 = [v36 superview];
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [(HUTitleValueEditableTextCell *)self labelsSpacingConstraint];

      if (v39) {
        goto LABEL_15;
      }
      v40 = [(HUTitleValueEditableTextCell *)self titleLabel];
      v41 = [v40 trailingAnchor];
      v42 = [(HUTitleValueEditableTextCell *)self valueTextField];
      v43 = [v42 leadingAnchor];
      v44 = [v41 constraintLessThanOrEqualToAnchor:v43 constant:-16.0];
      [(HUTitleValueEditableTextCell *)self setLabelsSpacingConstraint:v44];

      v33 = [(HUTitleValueEditableTextCell *)self labelsSpacingConstraint];
      [v33 setActive:1];
    }
    else
    {
    }
  }

LABEL_15:
  v45 = [(HUTitleValueEditableTextCell *)self minimumHeightConstraint];

  if (!v45)
  {
    v46 = [(HUTitleValueEditableTextCell *)self contentView];
    v47 = [v46 heightAnchor];
    v48 = [v47 constraintEqualToConstant:*MEMORY[0x1E4F43D20]];
    [(HUTitleValueEditableTextCell *)self setMinimumHeightConstraint:v48];

    v49 = [(HUTitleValueEditableTextCell *)self minimumHeightConstraint];
    [v49 setActive:1];
  }
  v72.receiver = self;
  v72.super_class = (Class)HUTitleValueEditableTextCell;
  [(HUTitleValueEditableTextCell *)&v72 updateConstraints];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(HUTitleValueEditableTextCell *)self item];
  id v5 = [v4 latestResults];

  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [(HUTitleValueEditableTextCell *)self setTitleText:v6];

  uint64_t v7 = *MEMORY[0x1E4F68980];
  objc_super v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];

  if (v8)
  {
    v20[0] = *MEMORY[0x1E4F42508];
    v9 = [(HUTitleValueEditableTextCell *)self valueTextField];
    v10 = [v9 font];
    v21[0] = v10;
    v20[1] = *MEMORY[0x1E4F42510];
    v11 = [(HUTitleValueEditableTextCell *)self valueTextField];
    objc_super v12 = [v11 textColor];
    v21[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    v14 = [v5 objectForKeyedSubscript:v7];
    if ([v14 prefersDynamicString])
    {
      v15 = [(HUTitleValueEditableTextCell *)self valueTextField];
      [v15 bounds];
      v18 = objc_msgSend(v14, "dynamicStringForSize:attributes:", v13, v16, v17);
      v19 = [(HUTitleValueEditableTextCell *)self valueTextField];
      [v19 setAttributedText:v18];
    }
    else
    {
      v15 = [v14 stringWithAttributes:v13];
      v18 = [(HUTitleValueEditableTextCell *)self valueTextField];
      [v18 setAttributedText:v15];
    }
  }
  [(HUTitleValueEditableTextCell *)self _updateTitle];
}

- (void)_addTitleLabel
{
  uint64_t v3 = [(UILabel *)self->_titleLabel superview];

  if (v3) {
    NSLog(&cfstr_TitleLabelAlre.isa, self);
  }
  if (!self->_titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    id v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [(HUTitleValueEditableTextCell *)self titleFont];
    [(UILabel *)self->_titleLabel setFont:v7];

    objc_super v8 = [(HUTitleValueEditableTextCell *)self titleText];
    [(UILabel *)self->_titleLabel setText:v8];

    [(HUTitleValueEditableTextCell *)self _updateTitle];
  }
  id v9 = [(HUTitleValueEditableTextCell *)self contentView];
  [v9 addSubview:self->_titleLabel];
}

- (void)_addValueTextField
{
  uint64_t v3 = [(UITextField *)self->_valueTextField superview];

  if (v3) {
    NSLog(&cfstr_ValueLabelAlre.isa, self);
  }
  if (!self->_valueTextField)
  {
    id v4 = (UITextField *)objc_opt_new();
    valueTextField = self->_valueTextField;
    self->_valueTextField = v4;

    uint64_t v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UITextField *)self->_valueTextField setFont:v6];

    [(UITextField *)self->_valueTextField setReturnKeyType:9];
    [(UITextField *)self->_valueTextField setClearButtonMode:3];
    [(UITextField *)self->_valueTextField setTextAlignment:2* ([(HUTitleValueEditableTextCell *)self effectiveUserInterfaceLayoutDirection] == 0)];
    uint64_t v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UITextField *)self->_valueTextField setTextColor:v7];

    [(UITextField *)self->_valueTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  id v8 = [(HUTitleValueEditableTextCell *)self contentView];
  [v8 addSubview:self->_valueTextField];
}

- (void)_updateTitle
{
  if ([(HUTitleValueEditableTextCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  id v3 = [MEMORY[0x1E4F428B8] labelColor];
  }
  [(UILabel *)self->_titleLabel setTextColor:v3];
}

- (UITextField)valueTextField
{
  return self->_valueTextField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (BOOL)hideTitle
{
  return self->_hideTitle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSArray)titleLabelConstraints
{
  return self->_titleLabelConstraints;
}

- (void)setTitleLabelConstraints:(id)a3
{
}

- (NSArray)valueTextFieldConstraints
{
  return self->_valueTextFieldConstraints;
}

- (void)setValueTextFieldConstraints:(id)a3
{
}

- (NSLayoutConstraint)labelsSpacingConstraint
{
  return self->_labelsSpacingConstraint;
}

- (void)setLabelsSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (void)setMinimumHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelsSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_valueTextFieldConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_valueTextField, 0);
}

@end
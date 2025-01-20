@interface HKMedicalIDEditorCell
+ (BOOL)showsLabelAndValue;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (HKCaretOptionalTextField)inputTextField;
- (HKMedicalIDEditorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKMedicalIDEditorCellEditDelegate)editDelegate;
- (NSString)label;
- (UILabel)labelLabel;
- (UIStackView)stackView;
- (UIView)verticalSeparatorView;
- (double)minimumLabelWidth;
- (id)formattedValue;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)dismissInputView;
- (void)setEditDelegate:(id)a3;
- (void)setInputTextField:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelLabel:(id)a3;
- (void)setMinimumLabelWidth:(double)a3;
- (void)setStackView:(id)a3;
- (void)setVerticalSeparatorView:(id)a3;
- (void)setupStackView;
- (void)setupSubviews;
- (void)updateValueLabel;
- (void)valueDidChange;
@end

@implementation HKMedicalIDEditorCell

- (HKMedicalIDEditorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorCell;
  v4 = [(HKMedicalIDEditorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    if ([(id)objc_opt_class() showsLabelAndValue])
    {
      [(HKMedicalIDEditorCell *)v4 setupSubviews];
      [(HKMedicalIDEditorCell *)v4 setupStackView];
      [(HKMedicalIDEditorCell *)v4 _contentSizeCategoryDidChange:0];
    }
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorCell;
  [(HKMedicalIDEditorCell *)&v4 dealloc];
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKMedicalIDEditorCell *)self setLabelLabel:v3];

  objc_super v4 = HKHealthKeyColor();
  v5 = [(HKMedicalIDEditorCell *)self labelLabel];
  [v5 setTextColor:v4];

  v6 = [(HKMedicalIDEditorCell *)self labelLabel];
  LODWORD(v7) = 1148846080;
  [v6 setContentHuggingPriority:0 forAxis:v7];

  v8 = objc_alloc_init(HKCaretOptionalTextField);
  [(HKMedicalIDEditorCell *)self setInputTextField:v8];

  v9 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v9 setDelegate:self];

  v10 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v10 setAdjustsFontSizeToFitWidth:1];

  v11 = [(HKMedicalIDEditorCell *)self inputTextField];
  LODWORD(v12) = 1132068864;
  [v11 setContentHuggingPriority:0 forAxis:v12];

  v13 = [MEMORY[0x1E4FB1618] labelColor];
  v14 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v14 setTextColor:v13];

  id v15 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(HKMedicalIDEditorCell *)self setVerticalSeparatorView:v15];

  id v17 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
  v16 = [(HKMedicalIDEditorCell *)self verticalSeparatorView];
  [v16 setBackgroundColor:v17];
}

- (void)setupStackView
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  objc_super v4 = [(HKMedicalIDEditorCell *)self labelLabel];
  v5 = [(HKMedicalIDEditorCell *)self verticalSeparatorView];
  v43[1] = v5;
  v6 = [(HKMedicalIDEditorCell *)self inputTextField];
  v43[2] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  v8 = (void *)[v3 initWithArrangedSubviews:v7];
  [(HKMedicalIDEditorCell *)self setStackView:v8];

  v9 = [(HKMedicalIDEditorCell *)self stackView];
  [v9 setSpacing:1.17549435e-38];

  v10 = [(HKMedicalIDEditorCell *)self stackView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(HKMedicalIDEditorCell *)self contentView];
  double v12 = [(HKMedicalIDEditorCell *)self stackView];
  [v11 addSubview:v12];

  v13 = [(HKMedicalIDEditorCell *)self stackView];
  v14 = [v13 leadingAnchor];
  id v15 = [(HKMedicalIDEditorCell *)self contentView];
  v16 = [v15 leadingAnchor];
  id v17 = [v14 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:1.0];
  [v17 setActive:1];

  v18 = [(HKMedicalIDEditorCell *)self stackView];
  v19 = [v18 trailingAnchor];
  v20 = [(HKMedicalIDEditorCell *)self contentView];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(HKMedicalIDEditorCell *)self stackView];
  v24 = [v23 topAnchor];
  v25 = [(HKMedicalIDEditorCell *)self contentView];
  v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [(HKMedicalIDEditorCell *)self stackView];
  v29 = [v28 bottomAnchor];
  v30 = [(HKMedicalIDEditorCell *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(HKMedicalIDEditorCell *)self stackView];
  v34 = [v33 heightAnchor];
  v35 = [v34 constraintGreaterThanOrEqualToConstant:44.0];

  LODWORD(v36) = 1144750080;
  [v35 setPriority:v36];
  [v35 setActive:1];
  v37 = [(HKMedicalIDEditorCell *)self labelLabel];
  v38 = [v37 widthAnchor];
  v39 = [v38 constraintGreaterThanOrEqualToConstant:90.0];
  [v39 setActive:1];

  v40 = [(HKMedicalIDEditorCell *)self verticalSeparatorView];
  v41 = [v40 widthAnchor];
  v42 = [v41 constraintEqualToConstant:0.5];
  [v42 setActive:1];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB2950]);
  v5 = [(HKMedicalIDEditorCell *)self labelLabel];
  [v5 setFont:v4];

  v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  double v7 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v7 setFont:v6];

  v8 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v8 setAdjustsFontSizeToFitWidth:1];

  BOOL IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  v10 = [(HKMedicalIDEditorCell *)self verticalSeparatorView];
  [v10 setHidden:IsUsingAccessibilityContentSizeCategory];

  LODWORD(IsUsingAccessibilityContentSizeCategory) = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  id v11 = [(HKMedicalIDEditorCell *)self stackView];
  [v11 setAxis:IsUsingAccessibilityContentSizeCategory];
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return [(UILabel *)self->_labelLabel text];
}

- (id)formattedValue
{
  return 0;
}

- (void)valueDidChange
{
  [(HKMedicalIDEditorCell *)self updateValueLabel];
  id v3 = [(HKMedicalIDEditorCell *)self editDelegate];
  [v3 medicalIDEditorCellDidChangeValue:self];
}

- (void)updateValueLabel
{
  if (self->_inputTextField)
  {
    id v3 = [(HKMedicalIDEditorCell *)self formattedValue];
    [(HKCaretOptionalTextField *)self->_inputTextField setText:v3];
  }
}

- (void)dismissInputView
{
}

+ (BOOL)showsLabelAndValue
{
  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  objc_super v4 = [(HKMedicalIDEditorCell *)self _tableView];
  if (([v4 isDragging] & 1) != 0
    || ([v4 isDecelerating] & 1) != 0
    || ([v4 isTracking] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    __setCurrentlyEditingCell(self);
    BOOL v5 = 1;
  }

  return v5;
}

- (double)minimumLabelWidth
{
  return self->_minimumLabelWidth;
}

- (void)setMinimumLabelWidth:(double)a3
{
  self->_minimumLabelWidth = a3;
}

- (HKMedicalIDEditorCellEditDelegate)editDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);
  return (HKMedicalIDEditorCellEditDelegate *)WeakRetained;
}

- (void)setEditDelegate:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (void)setLabelLabel:(id)a3
{
}

- (HKCaretOptionalTextField)inputTextField
{
  return self->_inputTextField;
}

- (void)setInputTextField:(id)a3
{
}

- (UIView)verticalSeparatorView
{
  return self->_verticalSeparatorView;
}

- (void)setVerticalSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalSeparatorView, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_editDelegate);
}

@end
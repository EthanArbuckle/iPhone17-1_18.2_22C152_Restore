@interface WDProfileTableViewCell
+ (double)editingTrailingEdgeMargin;
+ (double)notEditingTrailingEdgeMargin;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldDisplayClearButtonDuringEditing;
- (BOOL)shouldUseSelectedColorForDisplayValue;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (NSString)displayName;
- (NSString)displayValue;
- (NSString)placeholderValue;
- (UILabel)displayNameLabel;
- (UITextField)displayValueTextField;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (WDProfileTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupAccessibilitySizeConstraintsWithTrailingConstant:(double)a3;
- (void)_setupConstraints;
- (void)_setupConstraintsForContentSize;
- (void)_setupNonAccessibilitySizeConstraints;
- (void)_setupUI;
- (void)_updateClearButtonState;
- (void)_updateClearButtonStateForBirthdate;
- (void)_updateForCurrentSizeCategory;
- (void)addClearButtonTarget:(id)a3 action:(SEL)a4;
- (void)removeClearButtonTarget:(id)a3 action:(SEL)a4;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameLabel:(id)a3;
- (void)setDisplayValue:(id)a3;
- (void)setDisplayValueTextField:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setInputAccessoryView:(id)a3;
- (void)setInputView:(id)a3;
- (void)setPlaceholderValue:(id)a3;
- (void)setShouldDisplayClearButtonDuringEditing:(BOOL)a3;
- (void)setShouldUseSelectedColorForDisplayValue:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAutomationIdentifiersForProfileDetail:(id)a3;
@end

@implementation WDProfileTableViewCell

+ (double)editingTrailingEdgeMargin
{
  return 15.0;
}

+ (double)notEditingTrailingEdgeMargin
{
  return 5.0;
}

- (WDProfileTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDProfileTableViewCell;
  v4 = [(WDProfileTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(WDProfileTableViewCell *)v4 _setupUI];
  }
  return v5;
}

- (void)updateAutomationIdentifiersForProfileDetail:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v14[0] = @"HealthDetail";
  v14[1] = a3;
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v14 count:2];
  objc_super v7 = HKUIJoinStringsForAutomationIdentifier();

  [(WDProfileTableViewCell *)self setAccessibilityIdentifier:v7];
  v13[0] = v7;
  v13[1] = @"Title";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v9 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_displayNameLabel setAccessibilityIdentifier:v9];

  v12[0] = v7;
  v12[1] = @"Value";
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v11 = HKUIJoinStringsForAutomationIdentifier();
  [(UITextField *)self->_displayValueTextField setAccessibilityIdentifier:v11];
}

- (void)_setupUI
{
  v3 = [MEMORY[0x263F1C550] labelColor];
  normalDisplayValueColor = self->_normalDisplayValueColor;
  self->_normalDisplayValueColor = v3;

  HKHealthKeyColor();
  id v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  selectedDisplayValueColor = self->_selectedDisplayValueColor;
  self->_selectedDisplayValueColor = v5;

  objc_super v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  displayNameLabel = self->_displayNameLabel;
  self->_displayNameLabel = v7;

  [(UILabel *)self->_displayNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = (UITextField *)objc_alloc_init(MEMORY[0x263F1CA98]);
  displayValueTextField = self->_displayValueTextField;
  self->_displayValueTextField = v9;

  [(UITextField *)self->_displayValueTextField setDelegate:self];
  [(UITextField *)self->_displayValueTextField setTextColor:self->_normalDisplayValueColor];
  [(UITextField *)self->_displayValueTextField setUserInteractionEnabled:0];
  [(UITextField *)self->_displayValueTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = (void *)MEMORY[0x263F1C6B0];
  v12 = HKHealthUIFrameworkBundle();
  id v20 = [v11 imageNamed:@"remove_button_minus" inBundle:v12];

  v13 = [MEMORY[0x263F1C550] systemRedColor];
  v14 = [v20 _flatImageWithColor:v13];

  v15 = [MEMORY[0x263F1C488] buttonWithType:0];
  clearButton = self->_clearButton;
  self->_clearButton = v15;

  [(UIButton *)self->_clearButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_clearButton setImage:v14 forState:0];
  [(WDProfileTableViewCell *)self _updateClearButtonState];
  v17 = [(WDProfileTableViewCell *)self contentView];
  [v17 addSubview:self->_clearButton];

  v18 = [(WDProfileTableViewCell *)self contentView];
  [v18 addSubview:self->_displayNameLabel];

  v19 = [(WDProfileTableViewCell *)self contentView];
  [v19 addSubview:self->_displayValueTextField];

  [(WDProfileTableViewCell *)self _updateForCurrentSizeCategory];
  [(WDProfileTableViewCell *)self _setupConstraints];
}

- (void)_updateForCurrentSizeCategory
{
  objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:", *MEMORY[0x263F1D260]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_displayNameLabel setFont:v5];
  [(UITextField *)self->_displayValueTextField setFont:v5];
  [(UILabel *)self->_displayNameLabel setTextAlignment:4];
  uint64_t v3 = 2 * ([MEMORY[0x263F1CB60] userInterfaceLayoutDirectionForSemanticContentAttribute:0] != 1);
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory()) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = v3;
  }
  [(UITextField *)self->_displayValueTextField setTextAlignment:v4];
  [(UILabel *)self->_displayNameLabel setAdjustsFontSizeToFitWidth:0];
  [(UITextField *)self->_displayValueTextField setAdjustsFontSizeToFitWidth:HKUIApplicationIsUsingAccessibilityContentSizeCategory()];
  [(UILabel *)self->_displayNameLabel setNumberOfLines:0];
}

- (void)_setupNonAccessibilitySizeConstraints
{
  v16[3] = *MEMORY[0x263EF8340];
  v15 = [(WDProfileTableViewCell *)self contentView];
  v14 = [v15 bottomAnchor];
  uint64_t v3 = [(UILabel *)self->_displayNameLabel bottomAnchor];
  uint64_t v4 = [v14 constraintGreaterThanOrEqualToAnchor:v3 constant:12.5];
  v16[0] = v4;
  id v5 = [(UIButton *)self->_clearButton leadingAnchor];
  v6 = [(UILabel *)self->_displayNameLabel trailingAnchor];
  objc_super v7 = [v5 constraintGreaterThanOrEqualToAnchor:v6 constant:5.0];
  v16[1] = v7;
  v8 = [(UITextField *)self->_displayValueTextField topAnchor];
  v9 = [(WDProfileTableViewCell *)self contentView];
  v10 = [v9 topAnchor];
  v11 = [v8 constraintGreaterThanOrEqualToAnchor:v10 constant:12.5];
  v16[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  normalSizeConstraints = self->_normalSizeConstraints;
  self->_normalSizeConstraints = v12;
}

- (void)_setupAccessibilitySizeConstraintsWithTrailingConstant:(double)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  id v20 = [(UILabel *)self->_displayNameLabel trailingAnchor];
  v21 = [(WDProfileTableViewCell *)self contentView];
  v19 = [v21 trailingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:a3];
  v22[0] = v18;
  v17 = [(UITextField *)self->_displayValueTextField topAnchor];
  v16 = [(UILabel *)self->_displayNameLabel bottomAnchor];
  id v5 = [v17 constraintGreaterThanOrEqualToAnchor:v16 constant:12.5];
  v22[1] = v5;
  v6 = [(UIButton *)self->_clearButton leadingAnchor];
  objc_super v7 = [(WDProfileTableViewCell *)self contentView];
  v8 = [v7 leadingAnchor];
  v9 = [v6 constraintEqualToAnchor:v8 constant:20.0];
  v22[2] = v9;
  v10 = [(WDProfileTableViewCell *)self contentView];
  v11 = [v10 trailingAnchor];
  v12 = [(UITextField *)self->_displayValueTextField trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:a3];
  v22[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  accessibilitySizeConstraints = self->_accessibilitySizeConstraints;
  self->_accessibilitySizeConstraints = v14;
}

- (void)_setupConstraints
{
  v40[8] = *MEMORY[0x263EF8340];
  int v3 = [(WDProfileTableViewCell *)self isEditing];
  uint64_t v4 = objc_opt_class();
  if (v3) {
    [v4 editingTrailingEdgeMargin];
  }
  else {
    [v4 notEditingTrailingEdgeMargin];
  }
  double v6 = v5;
  objc_super v7 = [(WDProfileTableViewCell *)self contentView];
  v8 = [v7 trailingAnchor];
  v9 = [(UITextField *)self->_displayValueTextField trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:v6];
  displayValueTrailingConstraint = self->_displayValueTrailingConstraint;
  self->_displayValueTrailingConstraint = v10;

  v12 = [(UIButton *)self->_clearButton widthAnchor];
  v13 = [v12 constraintEqualToConstant:22.0];
  clearButtonWidthAnchor = self->_clearButtonWidthAnchor;
  self->_clearButtonWidthAnchor = v13;

  v15 = [(UITextField *)self->_displayValueTextField leadingAnchor];
  v16 = [(UIButton *)self->_clearButton trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:5.0];
  displayValueLeadingAnchor = self->_displayValueLeadingAnchor;
  self->_displayValueLeadingAnchor = v17;

  [(WDProfileTableViewCell *)self _setupNonAccessibilitySizeConstraints];
  [(WDProfileTableViewCell *)self _setupAccessibilitySizeConstraintsWithTrailingConstant:v6];
  v32 = (void *)MEMORY[0x263F08938];
  v38 = [(UILabel *)self->_displayNameLabel topAnchor];
  v39 = [(WDProfileTableViewCell *)self contentView];
  v37 = [v39 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:12.5];
  v40[0] = v36;
  v34 = [(UILabel *)self->_displayNameLabel leadingAnchor];
  v35 = [(WDProfileTableViewCell *)self contentView];
  v33 = [v35 leadingAnchor];
  v31 = [v34 constraintEqualToAnchor:v33 constant:20.0];
  v19 = self->_clearButtonWidthAnchor;
  v40[1] = v31;
  v40[2] = v19;
  v30 = [(UIButton *)self->_clearButton heightAnchor];
  id v20 = [v30 constraintEqualToConstant:22.0];
  v40[3] = v20;
  v21 = [(UIButton *)self->_clearButton centerYAnchor];
  v22 = [(UITextField *)self->_displayValueTextField centerYAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v24 = self->_displayValueLeadingAnchor;
  v40[4] = v23;
  v40[5] = v24;
  v40[6] = self->_displayValueTrailingConstraint;
  v25 = [(WDProfileTableViewCell *)self contentView];
  v26 = [v25 bottomAnchor];
  v27 = [(UITextField *)self->_displayValueTextField bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:12.5];
  v40[7] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:8];
  [v32 activateConstraints:v29];

  [(WDProfileTableViewCell *)self _setupConstraintsForContentSize];
}

- (void)_setupConstraintsForContentSize
{
  int IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  if (IsUsingAccessibilityContentSizeCategory) {
    uint64_t v4 = &OBJC_IVAR___WDProfileTableViewCell__normalSizeConstraints;
  }
  else {
    uint64_t v4 = &OBJC_IVAR___WDProfileTableViewCell__accessibilitySizeConstraints;
  }
  if (IsUsingAccessibilityContentSizeCategory) {
    double v5 = &OBJC_IVAR___WDProfileTableViewCell__accessibilitySizeConstraints;
  }
  else {
    double v5 = &OBJC_IVAR___WDProfileTableViewCell__normalSizeConstraints;
  }
  if (IsUsingAccessibilityContentSizeCategory) {
    double v6 = 0.0;
  }
  else {
    double v6 = 22.0;
  }
  if (IsUsingAccessibilityContentSizeCategory) {
    double v7 = 0.0;
  }
  else {
    double v7 = 5.0;
  }
  [MEMORY[0x263F08938] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v4)];
  [MEMORY[0x263F08938] activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v5)];
  [(NSLayoutConstraint *)self->_clearButtonWidthAnchor setConstant:v6];
  displayValueLeadingAnchor = self->_displayValueLeadingAnchor;

  [(NSLayoutConstraint *)displayValueLeadingAnchor setConstant:v7];
}

- (void)setDisplayName:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_displayName, a3);
  double v5 = [(UILabel *)self->_displayNameLabel text];
  char v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UILabel *)self->_displayNameLabel setText:v7];
    [(WDProfileTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setDisplayValue:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_displayValue, a3);
  double v5 = [(UITextField *)self->_displayValueTextField text];
  char v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [(UITextField *)self->_displayValueTextField setText:v7];
    [(WDProfileTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setPlaceholderValue:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_placeholderValue, a3);
  double v5 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8];
  [(UITextField *)self->_displayValueTextField setAttributedPlaceholder:v5];

  char v6 = [(WDProfileTableViewCell *)self displayValue];
  uint64_t v7 = [v6 length];

  if (!v7) {
    [(WDProfileTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setShouldUseSelectedColorForDisplayValue:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  self->_shouldUseSelectedColorForDisplayValue = a3;
  double v5 = &OBJC_IVAR___WDProfileTableViewCell__normalDisplayValueColor;
  if (a3) {
    double v5 = &OBJC_IVAR___WDProfileTableViewCell__selectedDisplayValueColor;
  }
  [(UITextField *)self->_displayValueTextField setTextColor:*(Class *)((char *)&self->super.super.super.super.isa + *v5)];
  if (self->_placeholderValue)
  {
    if (v3)
    {
      char v6 = self->_selectedDisplayValueColor;
    }
    else
    {
      char v6 = [MEMORY[0x263F1C550] systemGrayColor];
    }
    uint64_t v7 = v6;
    id v8 = objc_alloc(MEMORY[0x263F089B8]);
    placeholderValue = self->_placeholderValue;
    uint64_t v12 = *MEMORY[0x263F1C240];
    v13[0] = v7;
    v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v11 = (void *)[v8 initWithString:placeholderValue attributes:v10];
    [(UITextField *)self->_displayValueTextField setAttributedPlaceholder:v11];
  }
}

- (void)setShouldDisplayClearButtonDuringEditing:(BOOL)a3
{
  self->_shouldDisplayClearButtonDuringEditing = a3;
  [(WDProfileTableViewCell *)self _updateClearButtonState];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WDProfileTableViewCell;
  [(WDProfileTableViewCell *)&v7 setEditing:a3 animated:a4];
  char v6 = objc_opt_class();
  if (v4) {
    [v6 editingTrailingEdgeMargin];
  }
  else {
    [v6 notEditingTrailingEdgeMargin];
  }
  -[NSLayoutConstraint setConstant:](self->_displayValueTrailingConstraint, "setConstant:");
  [(WDProfileTableViewCell *)self _updateClearButtonState];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDProfileTableViewCell;
  [(WDProfileTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(WDProfileTableViewCell *)self traitCollection];
    char v6 = [v5 preferredContentSizeCategory];
    objc_super v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(WDProfileTableViewCell *)self _updateForCurrentSizeCategory];
      [(WDProfileTableViewCell *)self _setupConstraintsForContentSize];
      [(WDProfileTableViewCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(WDProfileTableViewCell *)self inputView];

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)WDProfileTableViewCell;
    return [(WDProfileTableViewCell *)&v7 becomeFirstResponder];
  }
  else
  {
    double v5 = [(WDProfileTableViewCell *)self displayValueTextField];
    uint64_t v6 = [v5 becomeFirstResponder];

    return v6;
  }
}

- (void)addClearButtonTarget:(id)a3 action:(SEL)a4
{
}

- (void)removeClearButtonTarget:(id)a3 action:(SEL)a4
{
}

- (void)_updateClearButtonState
{
  int v3 = [(UIButton *)self->_clearButton isHidden];
  if ([(WDProfileTableViewCell *)self shouldDisplayClearButtonDuringEditing]) {
    uint64_t v4 = [(WDProfileTableViewCell *)self isEditing] ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }
  [(UIButton *)self->_clearButton setHidden:v4];
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    int v5 = [(UIButton *)self->_clearButton isHidden];
    double v6 = 22.0;
    if (v5) {
      double v6 = 0.0;
    }
    [(NSLayoutConstraint *)self->_clearButtonWidthAnchor setConstant:v6];
    int v7 = [(UIButton *)self->_clearButton isHidden];
    double v8 = 5.0;
    if (v7) {
      double v8 = 0.0;
    }
    [(NSLayoutConstraint *)self->_displayValueLeadingAnchor setConstant:v8];
  }
  if (v3 != [(UIButton *)self->_clearButton isHidden])
  {
    [(WDProfileTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)_updateClearButtonStateForBirthdate
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    [(NSLayoutConstraint *)self->_clearButtonWidthAnchor setConstant:22.0];
    [(NSLayoutConstraint *)self->_displayValueLeadingAnchor setConstant:5.0];
  }

  [(WDProfileTableViewCell *)self setNeedsUpdateConstraints];
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (NSString)placeholderValue
{
  return self->_placeholderValue;
}

- (BOOL)shouldUseSelectedColorForDisplayValue
{
  return self->_shouldUseSelectedColorForDisplayValue;
}

- (BOOL)shouldDisplayClearButtonDuringEditing
{
  return self->_shouldDisplayClearButtonDuringEditing;
}

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
}

- (UITextField)displayValueTextField
{
  return self->_displayValueTextField;
}

- (void)setDisplayValueTextField:(id)a3
{
}

- (UILabel)displayNameLabel
{
  return self->_displayNameLabel;
}

- (void)setDisplayNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_displayValueTextField, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_placeholderValue, 0);
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accessibilitySizeConstraints, 0);
  objc_storeStrong((id *)&self->_normalSizeConstraints, 0);
  objc_storeStrong((id *)&self->_birthdatePickerLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_displayValueLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_clearButtonWidthAnchor, 0);
  objc_storeStrong((id *)&self->_birthdatePickerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_displayValueTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_selectedDisplayValueColor, 0);
  objc_storeStrong((id *)&self->_normalDisplayValueColor, 0);

  objc_storeStrong((id *)&self->_clearButton, 0);
}

@end
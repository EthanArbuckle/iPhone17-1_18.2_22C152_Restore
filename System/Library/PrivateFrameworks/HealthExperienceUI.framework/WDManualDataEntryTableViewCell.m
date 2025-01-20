@interface WDManualDataEntryTableViewCell
- (BOOL)shouldHighlightWhenEditing;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (HKDisplayType)displayType;
- (NSString)displayName;
- (NSString)value;
- (UIFont)bodyFont;
- (WDManualDataEntryTableViewCell)initWithCoder:(id)a3;
- (WDManualDataEntryTableViewCell)initWithDisplayName:(id)a3 unitName:(id)a4 dataEntryType:(unint64_t)a5;
- (WDManualDataEntryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WDManualDataEntryTableViewCellDelegate)delegate;
- (id)_removeDecimalSeparatorsFromText:(id)a3;
- (id)_sanitizedTextFieldText:(id)a3;
- (id)inputView;
- (void)_localeDidChange:(id)a3;
- (void)_setupConstraints;
- (void)_setupIntegerNumberFormatterIfNeeded;
- (void)_setupUIWithDisplayName:(id)a3 unitName:(id)a4;
- (void)_updateDecimalSeparator;
- (void)_updateDisplayNameLabelConstraints;
- (void)_updateFont;
- (void)_updateForCurrentSizeCategory;
- (void)_valueFieldDidChange:(id)a3;
- (void)beginEditing;
- (void)dealloc;
- (void)endEditing;
- (void)setBodyFont:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setInputView:(id)a3;
- (void)setShouldHighlightWhenEditing:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDManualDataEntryTableViewCell

- (WDManualDataEntryTableViewCell)initWithDisplayName:(id)a3 unitName:(id)a4 dataEntryType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDManualDataEntryTableViewCell;
  v10 = [(WDManualDataEntryTableViewCell *)&v14 initWithStyle:0 reuseIdentifier:0];
  v11 = v10;
  if (v10)
  {
    v10->_dataEntryType = a5;
    [(WDManualDataEntryTableViewCell *)v10 _updateDecimalSeparator];
    [(WDManualDataEntryTableViewCell *)v11 _setupUIWithDisplayName:v8 unitName:v9];
    [(WDManualDataEntryTableViewCell *)v11 _setupConstraints];
    [(WDManualDataEntryTableViewCell *)v11 _setupIntegerNumberFormatterIfNeeded];
    [(WDManualDataEntryTableViewCell *)v11 _updateForCurrentSizeCategory];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v11 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v11;
}

- (WDManualDataEntryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (WDManualDataEntryTableViewCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WDManualDataEntryTableViewCell;
  return [(WDManualDataEntryTableViewCell *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDManualDataEntryTableViewCell;
  [(WDManualDataEntryTableViewCell *)&v4 dealloc];
}

- (UIFont)bodyFont
{
  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    objc_super v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (void)setDisplayName:(id)a3
{
  [(UILabel *)self->_displayNameLabel setText:a3];
  [(WDManualDataEntryTableViewCell *)self _updateDisplayNameLabelConstraints];
  [(WDManualDataEntryTableViewCell *)self setNeedsUpdateConstraints];
}

- (NSString)displayName
{
  return [(UILabel *)self->_displayNameLabel text];
}

- (NSString)value
{
  return [(UITextField *)self->_valueField text];
}

- (void)setValue:(id)a3
{
}

- (void)_setupConstraints
{
  v51[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _NSDictionaryOfVariableBindings(&cfstr_ValuefieldDisp.isa, self->_valueField, self->_displayNameLabel, self->_unitLabel, 0);
  objc_super v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(WDManualDataEntryTableViewCell *)self contentView];
  uint64_t v6 = objc_msgSend(v5, "hk_addConstraintsWithFormat:options:views:", @"V:|-10-[_displayNameLabel]-10-|", 0, v3);
  [(NSArray *)v4 addObjectsFromArray:v6];

  v7 = [(WDManualDataEntryTableViewCell *)self contentView];
  v50 = (void *)v3;
  id v8 = objc_msgSend(v7, "hk_addConstraintsWithFormat:options:views:", @"V:|-10-[_valueField]-10-|", 0, v3);
  [(NSArray *)v4 addObjectsFromArray:v8];

  id v9 = [(WDManualDataEntryTableViewCell *)self contentView];
  v10 = objc_msgSend(v9, "hk_addConstraintsWithFormat:options:views:", @"V:|-10-[_unitLabel]-10-|", 0, v3);
  [(NSArray *)v4 addObjectsFromArray:v10];

  regularLayoutConstraints = self->_regularLayoutConstraints;
  self->_regularLayoutConstraints = v4;
  v41 = v4;

  v12 = [(UITextField *)self->_valueField trailingAnchor];
  v13 = [(UILabel *)self->_unitLabel leadingAnchor];
  objc_super v14 = [v12 constraintEqualToAnchor:v13 constant:0.0];
  largeTextValueFieldToUnitLabelSpacingConstraint = self->_largeTextValueFieldToUnitLabelSpacingConstraint;
  self->_largeTextValueFieldToUnitLabelSpacingConstraint = v14;

  v49 = [(WDManualDataEntryTableViewCell *)self contentView];
  v48 = [v49 topAnchor];
  v47 = [(UILabel *)self->_displayNameLabel topAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:-10.0];
  v51[0] = v46;
  v45 = [(WDManualDataEntryTableViewCell *)self contentView];
  v44 = [v45 bottomAnchor];
  v43 = [(UITextField *)self->_valueField bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:10.0];
  v51[1] = v42;
  v39 = [(UILabel *)self->_displayNameLabel leadingAnchor];
  v40 = [(WDManualDataEntryTableViewCell *)self contentView];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:15.0];
  v51[2] = v37;
  v35 = [(UILabel *)self->_displayNameLabel trailingAnchor];
  v36 = [(WDManualDataEntryTableViewCell *)self contentView];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:15.0];
  v51[3] = v33;
  v31 = [(UITextField *)self->_valueField leadingAnchor];
  v32 = [(WDManualDataEntryTableViewCell *)self contentView];
  v30 = [v32 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:15.0];
  v51[4] = v29;
  v28 = [(UITextField *)self->_valueField topAnchor];
  v16 = [(UILabel *)self->_displayNameLabel bottomAnchor];
  v17 = [v28 constraintEqualToAnchor:v16 constant:3.0];
  v18 = self->_largeTextValueFieldToUnitLabelSpacingConstraint;
  v51[5] = v17;
  v51[6] = v18;
  v19 = [(UILabel *)self->_unitLabel firstBaselineAnchor];
  v20 = [(UITextField *)self->_valueField firstBaselineAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v51[7] = v21;
  v22 = [(UILabel *)self->_unitLabel trailingAnchor];
  v23 = [(WDManualDataEntryTableViewCell *)self contentView];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24 constant:15.0];
  v51[8] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:9];
  largeTextLayoutConstraints = self->_largeTextLayoutConstraints;
  self->_largeTextLayoutConstraints = v26;
}

- (void)_updateForCurrentSizeCategory
{
  [(WDManualDataEntryTableViewCell *)self _updateFont];
  [(WDManualDataEntryTableViewCell *)self _updateDisplayNameLabelConstraints];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA20];
  objc_super v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5 = [v4 objectForKey:*MEMORY[0x1E4F1C438]];
  uint64_t v6 = [v3 characterDirectionForLanguage:v5];

  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    uint64_t v7 = 2 * (v6 == 2);
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_regularLayoutConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_largeTextLayoutConstraints];
    id v8 = [(UILabel *)self->_unitLabel text];
    uint64_t v9 = [v8 length];

    if (v9) {
      double v10 = 3.0;
    }
    else {
      double v10 = 0.0;
    }
    [(NSLayoutConstraint *)self->_largeTextValueFieldToUnitLabelSpacingConstraint setConstant:v10];
  }
  else
  {
    uint64_t v7 = 2 * (v6 != 2);
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_largeTextLayoutConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_regularLayoutConstraints];
  }
  valueField = self->_valueField;
  [(UITextField *)valueField setTextAlignment:v7];
}

- (void)_updateFont
{
  bodyFont = self->_bodyFont;
  self->_bodyFont = 0;

  objc_super v4 = [(WDManualDataEntryTableViewCell *)self bodyFont];
  [(UITextField *)self->_valueField setFont:v4];

  v5 = [(WDManualDataEntryTableViewCell *)self bodyFont];
  [(UILabel *)self->_displayNameLabel setFont:v5];

  uint64_t v6 = [(WDManualDataEntryTableViewCell *)self bodyFont];
  [(UILabel *)self->_unitLabel setFont:v6];

  [(WDManualDataEntryTableViewCell *)self setNeedsUpdateConstraints];
}

- (void)_updateDisplayNameLabelConstraints
{
  if (self->_displayNameLabelConstraints)
  {
    uint64_t v3 = [(WDManualDataEntryTableViewCell *)self contentView];
    [v3 removeConstraints:self->_displayNameLabelConstraints];
  }
  double v4 = *MEMORY[0x1E4FB2C68];
  double v5 = *(double *)(MEMORY[0x1E4FB2C68] + 8);
  -[UILabel systemLayoutSizeFittingSize:](self->_displayNameLabel, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], v5);
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  id firstValue = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(UILabel *)self->_unitLabel text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    -[UILabel systemLayoutSizeFittingSize:](self->_unitLabel, "systemLayoutSizeFittingSize:", v4, v5);
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
    uint64_t v9 = _NSDictionaryOfVariableBindings(&cfstr_ValuefieldDisp.isa, self->_valueField, self->_displayNameLabel, self->_unitLabel, 0);
    double v10 = _NSDictionaryOfVariableBindings(&cfstr_Displaynamelab_0.isa, firstValue, v8, 0);

    v11 = @"H:|-15-[_displayNameLabel(displayNameLabelWidth)]-[_valueField]-3-[_unitLabel(unitLabelWidth)]-15-|";
  }
  else
  {
    uint64_t v9 = _NSDictionaryOfVariableBindings(&cfstr_ValuefieldDisp_0.isa, self->_valueField, self->_displayNameLabel, 0);
    double v10 = _NSDictionaryOfVariableBindings(&cfstr_Displaynamelab.isa, firstValue, 0);
    v11 = @"H:|-15-[_displayNameLabel(displayNameLabelWidth)]-[_valueField]-15-|";
  }
  v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v11 options:0 metrics:v10 views:v9];
  displayNameLabelConstraints = self->_displayNameLabelConstraints;
  self->_displayNameLabelConstraints = v12;

  objc_super v14 = [(WDManualDataEntryTableViewCell *)self contentView];
  [v14 addConstraints:self->_displayNameLabelConstraints];
}

- (void)_setupUIWithDisplayName:(id)a3 unitName:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  if (self->_dataEntryType == 3)
  {
    uint64_t v7 = (UITextField *)objc_alloc_init(MEMORY[0x1E4F679B8]);
    [(UITextField *)v7 setAllowsSelection:0];
    valueField = self->_valueField;
    self->_valueField = v7;
    uint64_t v9 = v7;

    [(UITextField *)self->_valueField setAdjustsFontSizeToFitWidth:1];
  }
  else
  {
    double v10 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    uint64_t v9 = self->_valueField;
    self->_valueField = v10;
  }

  [(UITextField *)self->_valueField setDelegate:self];
  v11 = (void *)MEMORY[0x1E4F1CA20];
  v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  v13 = [v12 objectForKey:*MEMORY[0x1E4F1C438]];
  LODWORD(v11) = [v11 characterDirectionForLanguage:v13] != 2;

  [(UITextField *)self->_valueField setTextAlignment:2 * v11];
  [(UITextField *)self->_valueField setUserInteractionEnabled:0];
  [(UITextField *)self->_valueField addTarget:self action:sel__valueFieldDidChange_ forControlEvents:0x20000];
  unint64_t dataEntryType = self->_dataEntryType;
  if (dataEntryType == 1)
  {
    uint64_t v15 = 4;
  }
  else
  {
    if (dataEntryType != 2) {
      goto LABEL_9;
    }
    uint64_t v15 = 8;
  }
  [(UITextField *)self->_valueField setKeyboardType:v15];
LABEL_9:
  v16 = [(WDManualDataEntryTableViewCell *)self bodyFont];
  [(UITextField *)self->_valueField setFont:v16];

  v17 = [MEMORY[0x1E4FB1618] labelColor];
  [(UITextField *)self->_valueField setTextColor:v17];

  [(UITextField *)self->_valueField setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(WDManualDataEntryTableViewCell *)self contentView];
  [v18 addSubview:self->_valueField];

  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  displayNameLabel = self->_displayNameLabel;
  self->_displayNameLabel = v19;

  [(UILabel *)self->_displayNameLabel setText:v29];
  v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_displayNameLabel setTextColor:v21];

  v22 = [(WDManualDataEntryTableViewCell *)self bodyFont];
  [(UILabel *)self->_displayNameLabel setFont:v22];

  [(UILabel *)self->_displayNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [(WDManualDataEntryTableViewCell *)self contentView];
  [v23 addSubview:self->_displayNameLabel];

  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  unitLabel = self->_unitLabel;
  self->_unitLabel = v24;

  [(UILabel *)self->_unitLabel setText:v6];
  v26 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_unitLabel setTextColor:v26];

  v27 = [(WDManualDataEntryTableViewCell *)self bodyFont];
  [(UILabel *)self->_unitLabel setFont:v27];

  [(UILabel *)self->_unitLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [(WDManualDataEntryTableViewCell *)self contentView];
  [v28 addSubview:self->_unitLabel];

  [(WDManualDataEntryTableViewCell *)self setSelectionStyle:0];
}

- (void)_setupIntegerNumberFormatterIfNeeded
{
  if (self->_dataEntryType - 1 <= 1)
  {
    uint64_t v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    integerNumberFormatter = self->_integerNumberFormatter;
    self->_integerNumberFormatter = v3;

    double v5 = self->_integerNumberFormatter;
    [(NSNumberFormatter *)v5 setMaximumFractionDigits:0];
  }
}

- (void)beginEditing
{
  if (self->_dataEntryType - 1 <= 2)
  {
    [(UITextField *)self->_valueField setUserInteractionEnabled:1];
    valueField = self->_valueField;
    [(UITextField *)valueField becomeFirstResponder];
  }
}

- (void)endEditing
{
  if (self->_dataEntryType - 1 <= 2)
  {
    [(UITextField *)self->_valueField setUserInteractionEnabled:0];
    valueField = self->_valueField;
    [(UITextField *)valueField resignFirstResponder];
  }
}

- (void)setInputView:(id)a3
{
}

- (id)inputView
{
  return [(UITextField *)self->_valueField inputView];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDManualDataEntryTableViewCell;
  [(WDManualDataEntryTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(WDManualDataEntryTableViewCell *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(WDManualDataEntryTableViewCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)_valueFieldDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [v4 text];
  id v8 = [(WDManualDataEntryTableViewCell *)self _sanitizedTextFieldText:v5];

  [v4 setText:v8];
  id v6 = [(WDManualDataEntryTableViewCell *)self delegate];
  uint64_t v7 = [v4 text];

  [v6 manualDataEntryTableViewCell:self valueDidChangeToValue:v7];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_dataEntryType != 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (self->_shouldHighlightWhenEditing)
  {
    id v3 = a3;
    id v4 = [v3 tintColor];
    [v3 setTextColor:v4];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  if (self->_shouldHighlightWhenEditing)
  {
    id v3 = (void *)MEMORY[0x1E4FB1618];
    id v4 = a3;
    id v5 = [v3 labelColor];
    [v4 setTextColor:v5];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)_localeDidChange:(id)a3
{
  [(UITextField *)self->_valueField setText:&stru_1F04402E8];
  [(WDManualDataEntryTableViewCell *)self _updateDecimalSeparator];
}

- (id)_removeDecimalSeparatorsFromText:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 componentsSeparatedByString:self->_decimalSeparator];
  id v5 = [v4 firstObject];
  if ([(__CFString *)v5 isEqual:&stru_1F04402E8])
  {

    id v5 = @"0";
  }
  if ((unint64_t)[v4 count] <= 1)
  {
    id v6 = [(NSNumberFormatter *)self->_integerNumberFormatter numberFromString:v5];
    if (v6) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    goto LABEL_14;
  }
  id v6 = [v4 objectAtIndexedSubscript:1];
  v15[0] = v5;
  v15[1] = v6;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  double v10 = [v9 componentsJoinedByString:self->_decimalSeparator];

  uint64_t v11 = [(NSNumberFormatter *)self->_integerNumberFormatter numberFromString:v10];
  v12 = (void *)v11;
  if (self->_dataEntryType == 1)
  {
    v13 = [(NSNumberFormatter *)self->_integerNumberFormatter stringFromNumber:v11];
  }
  else
  {
    if (!v11)
    {
      id v8 = 0;
      goto LABEL_13;
    }
    v13 = v10;
  }
  id v8 = v13;
LABEL_13:

LABEL_14:
  return v8;
}

- (id)_sanitizedTextFieldText:(id)a3
{
  lastValidSanitizedText = (NSString *)a3;
  id v6 = lastValidSanitizedText;
  if (self->_dataEntryType - 1 <= 1)
  {
    if ([(NSString *)lastValidSanitizedText length])
    {
      uint64_t v7 = [(WDManualDataEntryTableViewCell *)self _removeDecimalSeparatorsFromText:v6];
      if ([v7 length]) {
        objc_storeStrong((id *)&self->_lastValidSanitizedText, v7);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastValidSanitizedText, a3);
    }
    lastValidSanitizedText = self->_lastValidSanitizedText;
  }
  id v8 = lastValidSanitizedText;

  return v8;
}

- (void)_updateDecimalSeparator
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v3 = [v5 decimalSeparator];
  decimalSeparator = self->_decimalSeparator;
  self->_decimalSeparator = v3;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (BOOL)shouldHighlightWhenEditing
{
  return self->_shouldHighlightWhenEditing;
}

- (void)setShouldHighlightWhenEditing:(BOOL)a3
{
  self->_shouldHighlightWhenEditing = a3;
}

- (WDManualDataEntryTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WDManualDataEntryTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setBodyFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_largeTextValueFieldToUnitLabelSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_largeTextLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_regularLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_lastValidSanitizedText, 0);
  objc_storeStrong((id *)&self->_integerNumberFormatter, 0);
  objc_storeStrong((id *)&self->_displayNameLabelConstraints, 0);
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_valueField, 0);
}

@end
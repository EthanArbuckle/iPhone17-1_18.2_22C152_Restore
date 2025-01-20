@interface AXUISettingsEditableTableCellWithStepper
- (AXUISettingsEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (AXUISettingsEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (AXUISettingsEditableTableCellWithStepperDelegate)delegate;
- (BOOL)shouldResizeTextFieldOnUpdate;
- (BOOL)testingUseNoPreferencesDelegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)secondsLabel;
- (UIStepper)stepper;
- (double)_axStepperMaximumValue;
- (double)_axStepperMinimumValue;
- (double)_axStepperStepValue;
- (double)_axStepperValue;
- (id)_axStepperStringValue;
- (id)_axStepperUnitString;
- (id)_stepperValueFormatString;
- (int64_t)_axStepperKeyboardType;
- (void)_axStepperSetValue:(double)a3;
- (void)_stepperChanged:(id)a3;
- (void)_textFieldChanged:(id)a3;
- (void)_updateAccessibilityLabelForTextField;
- (void)_updateSecondsLabel;
- (void)_updateSecondsLabelForDelegate:(id)a3;
- (void)didMoveToSuperview;
- (void)initializeView;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSecondsLabel:(id)a3;
- (void)setStepper:(id)a3;
- (void)setTestingUseNoPreferencesDelegate:(BOOL)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateWithValue:(double)a3 shouldUpdateTextField:(BOOL)a4;
@end

@implementation AXUISettingsEditableTableCellWithStepper

- (AXUISettingsEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  v4 = [(AXUISettingsEditableTableCellWithStepper *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  *(_DWORD *)((char *)&v4->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F50]) = 1;
  *((unsigned char *)&v4->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F58]) = 1;
  [(AXUISettingsEditableTableCellWithStepper *)v4 initializeView];
  return v4;
}

- (AXUISettingsEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  v9 = [(AXUISettingsEditableTextCell *)&v15 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(AXUISettingsEditableTableCellWithStepper *)v9 initializeView];
    v11 = [v8 target];
    v12 = [v8 propertyForKey:@"testingUseNoPreferencesDelegate"];
    -[AXUISettingsEditableTableCellWithStepper setTestingUseNoPreferencesDelegate:](v10, "setTestingUseNoPreferencesDelegate:", [v12 BOOLValue]);

    [(AXUISettingsEditableTableCellWithStepper *)v10 setDelegate:v11];
    v13 = v10;
  }
  return v10;
}

- (void)initializeView
{
  v31.receiver = self;
  v31.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  [(AXUISettingsEditableTextCell *)&v31 initializeView];
  v3 = [(PSTableCell *)self specifier];
  uint64_t v4 = *MEMORY[0x1E4F93130];
  v5 = [v3 propertyForKey:*MEMORY[0x1E4F93130]];
  if (v5)
  {
    objc_super v6 = [(PSTableCell *)self specifier];
    v7 = [v6 propertyForKey:v4];
    uint64_t v8 = [v7 BOOLValue];
  }
  else
  {
    uint64_t v8 = 1;
  }

  v9 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v9 setKeyboardType:8];

  v10 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v10 setReturnKeyType:9];

  v11 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v11 addTarget:self action:sel__textFieldChanged_ forControlEvents:0x20000];

  v12 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v12 setEnabled:v8];

  v13 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  v14 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v14 setBackgroundColor:v13];

  objc_super v15 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v15 setBorderStyle:3];

  stepper = self->_stepper;
  if (!stepper)
  {
    id v17 = objc_alloc(MEMORY[0x1E4FB1CA8]);
    v18 = (UIStepper *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v19 = self->_stepper;
    self->_stepper = v18;

    [(UIStepper *)self->_stepper setUserInteractionEnabled:1];
    [(UIStepper *)self->_stepper addTarget:self action:sel__stepperChanged_ forControlEvents:4096];
    [(UIStepper *)self->_stepper accessibilitySetIdentification:@"AXStepper"];
    v20 = [(AXUISettingsEditableTableCellWithStepper *)self contentView];
    [v20 addSubview:self->_stepper];

    stepper = self->_stepper;
  }
  [(UIStepper *)stepper setEnabled:v8];
  secondsLabel = self->_secondsLabel;
  if (!secondsLabel)
  {
    v22 = [(AXUISettingsEditableTableCellWithStepper *)self detailTextLabel];
    v23 = self->_secondsLabel;
    self->_secondsLabel = v22;

    if (!self->_secondsLabel)
    {
      v24 = (UILabel *)objc_opt_new();
      v25 = self->_secondsLabel;
      self->_secondsLabel = v24;

      v26 = [(AXUISettingsEditableTableCellWithStepper *)self contentView];
      [v26 addSubview:self->_secondsLabel];
    }
    v27 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)self->_secondsLabel setFont:v27];

    v28 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_secondsLabel setBackgroundColor:v28];

    v29 = [MEMORY[0x1E4F92E40] appearance];
    v30 = [v29 textColor];
    [(UILabel *)self->_secondsLabel setTextColor:v30];

    [(UILabel *)self->_secondsLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_secondsLabel setIsAccessibilityElement:0];
    secondsLabel = self->_secondsLabel;
  }
  [(UILabel *)secondsLabel setEnabled:v8];
  [(AXUISettingsEditableTableCellWithStepper *)self _updateAccessibilityLabelForTextField];
}

- (double)_axStepperMaximumValue
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  v5 = v4;
  if (v3)
  {
    [v4 maximumValueForStepperCell:self];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [(PSTableCell *)self specifier];
    [v5 maximumValueForSpecifier:v8];
    double v7 = v9;
  }
  return v7;
}

- (double)_axStepperMinimumValue
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  v5 = v4;
  if (v3)
  {
    [v4 minimumValueForStepperCell:self];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [(PSTableCell *)self specifier];
    [v5 minimumValueForSpecifier:v8];
    double v7 = v9;
  }
  return v7;
}

- (int64_t)_axStepperKeyboardType
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  v5 = v4;
  if (v3)
  {
    int64_t v6 = [v4 keyboardTypeForStepperCell:self];
  }
  else
  {
    int v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return 8;
    }
    v5 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
    uint64_t v8 = [(PSTableCell *)self specifier];
    int64_t v6 = [v5 keyboardTypeForSpecifier:v8];
  }
  return v6;
}

- (id)_axStepperUnitString
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  v5 = v4;
  if (v3)
  {
    int64_t v6 = [v4 unitsStringForStepperCell:self];
LABEL_5:

    goto LABEL_7;
  }
  int v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v5 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
    uint64_t v8 = [(PSTableCell *)self specifier];
    int64_t v6 = [v5 unitsStringForSpecifier:v8];

    goto LABEL_5;
  }
  int64_t v6 = 0;
LABEL_7:
  return v6;
}

- (double)_axStepperValue
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  v5 = v4;
  if (v3)
  {
    [v4 valueForStepperCell:self];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [(PSTableCell *)self specifier];
    [v5 valueForSpecifier:v8];
    double v7 = v9;
  }
  return v7;
}

- (double)_axStepperStepValue
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  v5 = v4;
  if (v3)
  {
    [v4 stepValueForStepperCell:self];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [(PSTableCell *)self specifier];
    [v5 stepValueForSpecifier:v8];
    double v7 = v9;
  }
  return v7;
}

- (void)_axStepperSetValue:(double)a3
{
  BOOL v5 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  id v7 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  if (v5)
  {
    [v7 stepperCell:self setValue:a3];
  }
  else
  {
    double v6 = [(PSTableCell *)self specifier];
    [v7 specifier:v6 setValue:a3];
  }
}

- (id)_axStepperStringValue
{
  BOOL v3 = [(AXUISettingsEditableTableCellWithStepper *)self testingUseNoPreferencesDelegate];
  uint64_t v4 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  BOOL v5 = v4;
  if (v3)
  {
    double v6 = [v4 stringValueForStepperCell:self];
  }
  else
  {
    id v7 = [(PSTableCell *)self specifier];
    double v6 = [v5 stringValueForSpecifier:v7];
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  objc_storeWeak((id *)p_delegate, v7);
  int64_t v5 = [(AXUISettingsEditableTableCellWithStepper *)self _axStepperKeyboardType];
  double v6 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v6 setKeyboardType:v5];

  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperMinimumValue];
  -[UIStepper setMinimumValue:](self->_stepper, "setMinimumValue:");
  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperMaximumValue];
  -[UIStepper setMaximumValue:](self->_stepper, "setMaximumValue:");
  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperValue];
  -[UIStepper setValue:](self->_stepper, "setValue:");
  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperStepValue];
  -[UIStepper setStepValue:](self->_stepper, "setStepValue:");
  [(AXUISettingsEditableTableCellWithStepper *)self _updateSecondsLabelForDelegate:v7];
}

- (void)_updateAccessibilityLabelForTextField
{
  id v4 = [(AXUISettingsEditableTextCell *)self nameTextField];
  BOOL v3 = [(UILabel *)self->_secondsLabel text];
  [v4 setAccessibilityLabel:v3];
}

- (id)_stepperValueFormatString
{
  return @"%.2f";
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v19 = [a3 text];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  int64_t v5 = [v4 decimalSeparator];
  double v6 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  id v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v5];
  [v7 formUnionWithCharacterSet:v8];

  if ([v19 length])
  {
    double v9 = [v19 stringByTrimmingCharactersInSet:v7];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      [(AXUISettingsEditableTableCellWithStepper *)self _axStepperValue];
LABEL_6:
      double v16 = v11;
      goto LABEL_7;
    }
  }
  v12 = [v4 numberFromString:v19];
  [v12 doubleValue];
  double v14 = v13;

  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperMinimumValue];
  double v16 = v15;
  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperMaximumValue];
  if (v14 >= v16)
  {
    double v16 = v14;
    if (v14 > v11) {
      goto LABEL_6;
    }
  }
LABEL_7:
  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperSetValue:v16];
  id v17 = [(AXUISettingsEditableTableCellWithStepper *)self _axStepperStringValue];
  v18 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v18 setText:v17];

  [(UIStepper *)self->_stepper setValue:v16];
  [(AXUISettingsEditableTableCellWithStepper *)self _updateSecondsLabel];
  [(AXUISettingsEditableTableCellWithStepper *)self _updateAccessibilityLabelForTextField];
}

- (void)_stepperChanged:(id)a3
{
  [(UIStepper *)self->_stepper value];
  -[AXUISettingsEditableTableCellWithStepper updateWithValue:shouldUpdateTextField:](self, "updateWithValue:shouldUpdateTextField:", 1);
}

- (void)_textFieldChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  double v6 = v5;

  [(AXUISettingsEditableTableCellWithStepper *)self updateWithValue:0 shouldUpdateTextField:v6];
}

- (BOOL)shouldResizeTextFieldOnUpdate
{
  return 1;
}

- (void)updateWithValue:(double)a3 shouldUpdateTextField:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(AXUISettingsEditableTableCellWithStepper *)self stepper];
  [v7 maximumValue];
  double v9 = v8;

  if (v9 > a3) {
    double v9 = a3;
  }
  uint64_t v10 = [(AXUISettingsEditableTableCellWithStepper *)self stepper];
  [v10 minimumValue];
  double v12 = v11;

  if (v9 >= v12) {
    double v12 = v9;
  }
  [(AXUISettingsEditableTableCellWithStepper *)self _axStepperSetValue:v12];
  double v13 = [(AXUISettingsEditableTableCellWithStepper *)self stepper];
  [v13 setValue:v12];

  if (v4)
  {
    [(AXUISettingsEditableTextCell *)self updateText];
    if ([(AXUISettingsEditableTableCellWithStepper *)self shouldResizeTextFieldOnUpdate])
    {
      double v14 = [(AXUISettingsEditableTextCell *)self nameTextField];
      [v14 frame];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(AXUISettingsEditableTextCell *)self nameTextField];
      objc_msgSend(v21, "sizeThatFits:", 200.0, 100.0);
      double v23 = v22;

      objc_msgSend(v14, "setFrame:", v16, v18, v23, v20);
    }
    [(AXUISettingsEditableTableCellWithStepper *)self _updateSecondsLabel];
    [(AXUISettingsEditableTableCellWithStepper *)self _updateAccessibilityLabelForTextField];
  }
}

- (void)_updateSecondsLabel
{
  id v3 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];
  [(AXUISettingsEditableTableCellWithStepper *)self _updateSecondsLabelForDelegate:v3];
}

- (void)_updateSecondsLabelForDelegate:(id)a3
{
  BOOL v4 = [(UILabel *)self->_secondsLabel text];
  double v5 = (void *)[v4 copy];

  double v6 = [(AXUISettingsEditableTableCellWithStepper *)self _axStepperUnitString];
  if (v6)
  {
    [(UILabel *)self->_secondsLabel setText:v6];
  }
  else
  {
    id v7 = [(AXUISettingsEditableTextCell *)self nameTextField];
    double v8 = [v7 text];

    double v9 = [MEMORY[0x1E4F28FE8] localizedScannerWithString:v8];
    double v16 = 0.0;
    [v9 scanDouble:&v16];
    uint64_t v10 = NSString;
    if (fabs(v16 + -1.0) >= 0.001) {
      double v11 = @"DELAY_SECONDS_PLURAL";
    }
    else {
      double v11 = @"DELAY_SECONDS_SINGULAR";
    }
    double v12 = AXUILocalizedStringForKey(v11);
    double v13 = objc_msgSend(v10, "stringWithFormat:", v12, *(void *)&v16);
    [(UILabel *)self->_secondsLabel setText:v13];
  }
  double v14 = [(UILabel *)self->_secondsLabel text];
  char v15 = [v5 isEqualToString:v14];

  if ((v15 & 1) == 0) {
    [(AXUISettingsEditableTableCellWithStepper *)self layoutSubviews];
  }
}

- (void)didMoveToSuperview
{
  id v3 = [(AXUISettingsEditableTableCellWithStepper *)self superview];

  if (v3)
  {
    [(AXUISettingsEditableTextCell *)self updateText];
    [(AXUISettingsEditableTableCellWithStepper *)self _updateAccessibilityLabelForTextField];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (AXPreferredContentSizeCategoryIsAccessibilityCategory())
  {
    double v6 = [(AXUISettingsEditableTextCell *)self nameTextField];
    objc_msgSend(v6, "sizeThatFits:", 200.0, 3.40282347e38);
    double v8 = v7;
    -[UILabel sizeThatFits:](self->_secondsLabel, "sizeThatFits:", 200.0, 3.40282347e38);
    double v10 = v8 + v9;
    [(AXUISettingsEditableTableCellWithStepper *)self layoutMargins];
    double v12 = v10 + v11 + 5.0;
    [(AXUISettingsEditableTableCellWithStepper *)self layoutMargins];
    double v14 = v13 + v12;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
    -[AXUISettingsEditableTableCellWithStepper sizeThatFits:](&v19, sel_sizeThatFits_, width, height);
    double width = v15;
    double v14 = v16;
  }
  double v17 = width;
  double v18 = v14;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)AXUISettingsEditableTableCellWithStepper;
  [(AXUISettingsEditableTextCell *)&v40 layoutSubviews];
  id v3 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v3 sizeToFit];
  [(UILabel *)self->_secondsLabel sizeToFit];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(AXUISettingsEditableTextCell *)self nameTextField];
  objc_msgSend(v8, "sizeThatFits:", 200.0, 100.0);
  double v10 = v9;

  BOOL IsAccessibilityCategory = AXPreferredContentSizeCategoryIsAccessibilityCategory();
  double v12 = [(AXUISettingsEditableTableCellWithStepper *)self contentView];
  [v12 frame];
  double v14 = v13;
  double v15 = v7;
  if (IsAccessibilityCategory)
  {
    [(UILabel *)self->_secondsLabel frame];
    double v15 = v7 + 5.0 + v16;
  }
  double v17 = v14 - v15;

  double v18 = v17 * 0.5;
  objc_super v19 = [MEMORY[0x1E4F92E40] appearance];
  double v20 = [v19 textColor];
  [(UILabel *)self->_secondsLabel setTextColor:v20];

  v21 = (id *)MEMORY[0x1E4FB2608];
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
  {
    [(AXUISettingsEditableTableCellWithStepper *)self bounds];
    double v5 = v22 - v10 + -20.0;
    v41.origin.x = v5;
    v41.origin.y = v18;
    v41.size.double width = v10;
    v41.size.double height = v7;
    CGFloat v23 = CGRectGetMinX(v41) + -20.0;
    [(UILabel *)self->_secondsLabel frame];
    double v25 = v23 - v24;
  }
  else
  {
    v42.origin.x = v5;
    v42.origin.y = v18;
    v42.size.double width = v10;
    v42.size.double height = v7;
    double v25 = CGRectGetMaxX(v42) + 20.0;
  }
  [(UILabel *)self->_secondsLabel frame];
  CGFloat v27 = v26;
  objc_msgSend(v3, "setFrame:", v5, v18, v10, v7);
  secondsLabel = self->_secondsLabel;
  v43.origin.x = v25;
  v43.origin.y = v18;
  v43.size.double width = v27;
  v43.size.double height = v7;
  CGRect v44 = CGRectIntegral(v43);
  -[UILabel setFrame:](secondsLabel, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
  [(UIStepper *)self->_stepper frame];
  double v30 = v29;
  double v31 = 10.0;
  if (![*v21 userInterfaceLayoutDirection])
  {
    v32 = [(AXUISettingsEditableTableCellWithStepper *)self contentView];
    [v32 bounds];
    double MaxX = CGRectGetMaxX(v45);
    [(UIStepper *)self->_stepper frame];
    double v31 = MaxX - (v34 + 10.0);
  }
  if (AXPreferredContentSizeCategoryIsAccessibilityCategory())
  {
    [(UILabel *)self->_secondsLabel frame];
    [v3 frame];
    CGRectGetMaxY(v46);
    [v3 frame];
    -[UILabel setFrame:](self->_secondsLabel, "setFrame:");
  }
  v35 = [(AXUISettingsEditableTableCellWithStepper *)self contentView];
  [v35 frame];
  double v37 = v36;
  [(UIStepper *)self->_stepper frame];
  double v39 = (v37 - v38) * 0.5;

  -[UIStepper setFrame:](self->_stepper, "setFrame:", v31, v39, 50.0, v30);
  [(AXUISettingsEditableTableCellWithStepper *)self _updateAccessibilityLabelForTextField];
}

- (UIStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
}

- (AXUISettingsEditableTableCellWithStepperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXUISettingsEditableTableCellWithStepperDelegate *)WeakRetained;
}

- (UILabel)secondsLabel
{
  return self->_secondsLabel;
}

- (void)setSecondsLabel:(id)a3
{
}

- (BOOL)testingUseNoPreferencesDelegate
{
  return self->_testingUseNoPreferencesDelegate;
}

- (void)setTestingUseNoPreferencesDelegate:(BOOL)a3
{
  self->_testingUseNoPreferencesDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stepper, 0);
}

@end
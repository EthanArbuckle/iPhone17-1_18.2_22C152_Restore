@interface HUAccessibilityEditableTableCellWithStepper
- (BOOL)isDisabled;
- (HUAccessibilityEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUStepperCellDelegate)stepperCellDelegate;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSNumber)stepperValue;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)stringValueForSpecifier:(id)a3;
- (id)textFieldValue:(id)a3;
- (void)_update;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setStepperCellDelegate:(id)a3;
- (void)setStepperValue:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
@end

@implementation HUAccessibilityEditableTableCellWithStepper

- (HUAccessibilityEditableTableCellWithStepper)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)HUAccessibilityEditableTableCellWithStepper;
  v4 = [(AXUISettingsEditableTableCellWithStepper *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUAccessibilityEditableTableCellWithStepper *)v4 setDisabled:0];
    v6 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];

    if (!v6)
    {
      v7 = objc_opt_new();
      [(AXUISettingsEditableTableCellWithStepper *)v5 setSecondsLabel:v7];

      v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
      v9 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];
      [v9 setFont:v8];

      v10 = [MEMORY[0x1E4F428B8] clearColor];
      v11 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];
      [v11 setBackgroundColor:v10];

      v12 = [MEMORY[0x1E4F428B8] systemBlackColor];
      v13 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];
      [v13 setTextColor:v12];

      v14 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];
      [v14 setAdjustsFontForContentSizeCategory:1];

      v15 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];
      [v15 setIsAccessibilityElement:0];

      v16 = [(HUAccessibilityEditableTableCellWithStepper *)v5 contentView];
      v17 = [(AXUISettingsEditableTableCellWithStepper *)v5 secondsLabel];
      [v16 addSubview:v17];
    }
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUAccessibilityEditableTableCellWithStepper;
  [(PSTableCell *)&v3 prepareForReuse];
  [(HUAccessibilityEditableTableCellWithStepper *)self setDisabled:0];
  [(AXUISettingsEditableTextCell *)self setSelectionStyle:0];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUAccessibilityEditableTableCellWithStepper;
  [(AXUISettingsEditableTableCellWithStepper *)&v5 layoutSubviews];
  objc_super v3 = [MEMORY[0x1E4F428B8] labelColor];
  v4 = [(AXUISettingsEditableTextCell *)self nameTextField];
  [v4 setTextColor:v3];
}

- (void)setMaximumValue:(id)a3
{
  id v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_maximumValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)[v6 copy];
    maximumValue = self->_maximumValue;
    self->_maximumValue = v4;

    [(HUAccessibilityEditableTableCellWithStepper *)self _update];
  }
}

- (void)setMinimumValue:(id)a3
{
  id v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_minimumValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)[v6 copy];
    minimumValue = self->_minimumValue;
    self->_minimumValue = v4;

    [(HUAccessibilityEditableTableCellWithStepper *)self _update];
  }
}

- (void)setStepValue:(id)a3
{
  id v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_stepValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)[v6 copy];
    stepValue = self->_stepValue;
    self->_stepValue = v4;

    [(HUAccessibilityEditableTableCellWithStepper *)self _update];
  }
}

- (void)setStepperValue:(id)a3
{
  id v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_stepperValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)[v6 copy];
    stepperValue = self->_stepperValue;
    self->_stepperValue = v4;

    [(HUAccessibilityEditableTableCellWithStepper *)self _update];
  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(HUAccessibilityEditableTableCellWithStepper *)self _update];
  }
}

- (void)_update
{
  if ([(HUAccessibilityEditableTableCellWithStepper *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  objc_super v3 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v4 = [(AXUISettingsEditableTableCellWithStepper *)self secondsLabel];
  [v4 setTextColor:v3];

  uint64_t v5 = [(HUAccessibilityEditableTableCellWithStepper *)self isDisabled] ^ 1;
  id v6 = [(AXUISettingsEditableTableCellWithStepper *)self stepper];
  [v6 setUserInteractionEnabled:v5];

  uint64_t v7 = [(HUAccessibilityEditableTableCellWithStepper *)self isDisabled] ^ 1;
  v8 = [(AXUISettingsEditableTableCellWithStepper *)self stepper];
  [v8 setEnabled:v7];

  if ([(HUAccessibilityEditableTableCellWithStepper *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  v9 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v10 = [(AXUISettingsEditableTableCellWithStepper *)self stepper];
  [v10 setTintColor:v9];

  v11 = [(HUAccessibilityEditableTableCellWithStepper *)self stepperValue];

  if (v11)
  {
    [(AXUISettingsEditableTextCell *)self updateText];
    uint64_t v12 = [(HUAccessibilityEditableTableCellWithStepper *)self minimumValue];
    if (v12)
    {
      id v17 = (id)v12;
      uint64_t v13 = [(HUAccessibilityEditableTableCellWithStepper *)self maximumValue];
      if (v13)
      {
        v14 = (void *)v13;
        v15 = [(HUAccessibilityEditableTableCellWithStepper *)self stepValue];

        if (v15)
        {
          v16 = [(AXUISettingsEditableTableCellWithStepper *)self delegate];

          if (v16 != self)
          {
            [(AXUISettingsEditableTableCellWithStepper *)self setDelegate:self];
          }
        }
      }
      else
      {
      }
    }
  }
}

- (double)valueForSpecifier:(id)a3
{
  objc_super v3 = [(HUAccessibilityEditableTableCellWithStepper *)self stepperValue];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6 = [NSNumber numberWithDouble:a3];
  [(HUAccessibilityEditableTableCellWithStepper *)self setStepperValue:v6];

  uint64_t v7 = [(HUAccessibilityEditableTableCellWithStepper *)self stepperCellDelegate];
  v8 = [NSNumber numberWithDouble:a4];
  [v7 stepperCell:self steppedToValue:v8];

  [(HUAccessibilityEditableTableCellWithStepper *)self _update];

  [(HUAccessibilityEditableTableCellWithStepper *)self setNeedsLayout];
}

- (double)stepValueForSpecifier:(id)a3
{
  objc_super v3 = [(HUAccessibilityEditableTableCellWithStepper *)self stepValue];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)minimumValueForSpecifier:(id)a3
{
  objc_super v3 = [(HUAccessibilityEditableTableCellWithStepper *)self minimumValue];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)maximumValueForSpecifier:(id)a3
{
  objc_super v3 = [(HUAccessibilityEditableTableCellWithStepper *)self maximumValue];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)stringValueForSpecifier:(id)a3
{
  objc_super v3 = [(HUAccessibilityEditableTableCellWithStepper *)self stepperValue];
  double v4 = AXFormatNumberWithOptions();

  return v4;
}

- (id)textFieldValue:(id)a3
{
  return [(HUAccessibilityEditableTableCellWithStepper *)self stringValueForSpecifier:0];
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepperValue
{
  return self->_stepperValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (HUStepperCellDelegate)stepperCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepperCellDelegate);

  return (HUStepperCellDelegate *)WeakRetained;
}

- (void)setStepperCellDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepperCellDelegate);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_stepperValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);

  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
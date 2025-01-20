@interface HUStepperCell
- (BOOL)isDisabled;
- (HFItem)item;
- (HUStepperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUStepperCellDelegate)stepperCellDelegate;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (NSNumber)stepperValue;
- (UILabel)valueLabel;
- (UIStepper)stepper;
- (id)_valueDescription;
- (void)_stepperValueDidChange:(id)a3;
- (void)_toggleValueChange:(id)a3;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStepValue:(id)a3;
- (void)setStepper:(id)a3;
- (void)setStepperCellDelegate:(id)a3;
- (void)setStepperValue:(id)a3;
- (void)setValueLabel:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUStepperCell

- (HUStepperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)HUStepperCell;
  v4 = [(HUStepperCell *)&v57 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    stepper = v4->_stepper;
    v4->_stepper = (UIStepper *)v5;

    [(UIStepper *)v4->_stepper sizeToFit];
    [(UIStepper *)v4->_stepper addTarget:v4 action:sel__stepperValueDidChange_ forControlEvents:4096];
    v7 = NSNumber;
    [(UIStepper *)v4->_stepper maximumValue];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
    maximumValue = v4->_maximumValue;
    v4->_maximumValue = (NSNumber *)v8;

    v10 = NSNumber;
    [(UIStepper *)v4->_stepper minimumValue];
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
    minimumValue = v4->_minimumValue;
    v4->_minimumValue = (NSNumber *)v11;

    v13 = NSNumber;
    [(UIStepper *)v4->_stepper stepValue];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    stepValue = v4->_stepValue;
    v4->_stepValue = (NSNumber *)v14;

    v16 = NSNumber;
    [(UIStepper *)v4->_stepper value];
    uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
    stepperValue = v4->_stepperValue;
    v4->_stepperValue = (NSNumber *)v17;

    uint64_t v19 = objc_opt_new();
    valueLabel = v4->_valueLabel;
    v4->_valueLabel = (UILabel *)v19;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v59[0] = v4->_valueLabel;
    v59[1] = v4->_stepper;
    v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v59, 2, 0);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
          v27 = [(HUStepperCell *)v4 contentView];
          [v27 addSubview:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v23);
    }

    v28 = [(UIStepper *)v4->_stepper centerYAnchor];
    v29 = [(HUStepperCell *)v4 contentView];
    v30 = [v29 centerYAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];

    v32 = [(HUStepperCell *)v4 valueLabel];
    v33 = [v32 centerYAnchor];
    v34 = [(HUStepperCell *)v4 contentView];
    v35 = [v34 centerYAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];

    v37 = [(HUStepperCell *)v4 valueLabel];
    v38 = [v37 trailingAnchor];
    v39 = [(HUStepperCell *)v4 stepper];
    v40 = [v39 leadingAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:-7.0];

    v42 = [(UIStepper *)v4->_stepper trailingAnchor];
    v43 = [(HUStepperCell *)v4 contentView];
    v44 = [v43 readableContentGuide];
    v45 = [v44 trailingAnchor];
    v46 = [v42 constraintEqualToAnchor:v45];

    v47 = [(HUStepperCell *)v4 contentView];
    v48 = [v47 heightAnchor];
    v49 = [v48 constraintGreaterThanOrEqualToConstant:*MEMORY[0x1E4F43D20]];

    v50 = (void *)MEMORY[0x1E4F28DC8];
    v58[0] = v36;
    v58[1] = v41;
    v58[2] = v46;
    v58[3] = v31;
    v58[4] = v49;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:5];
    [v50 activateConstraints:v51];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUStepperCell;
  [(HUStepperCell *)&v3 prepareForReuse];
  [(HUStepperCell *)self setDisabled:0];
  [(HUStepperCell *)self setSelectionStyle:0];
}

- (void)setMaximumValue:(id)a3
{
  id v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_maximumValue, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)[v6 copy];
    maximumValue = self->_maximumValue;
    self->_maximumValue = v4;

    [(HUStepperCell *)self updateUIWithAnimation:0];
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

    [(HUStepperCell *)self updateUIWithAnimation:0];
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

    [(HUStepperCell *)self updateUIWithAnimation:0];
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

    [(HUStepperCell *)self updateUIWithAnimation:0];
  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(HUStepperCell *)self updateUIWithAnimation:0];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4 = [(HUStepperCell *)self item];
  uint64_t v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v7 = [(HUStepperCell *)self textLabel];
  [v7 setText:v6];

  if ([(HUStepperCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v9 = [(HUStepperCell *)self textLabel];
  [v9 setTextColor:v8];

  v10 = [(HUStepperCell *)self _valueDescription];
  uint64_t v11 = [(HUStepperCell *)self valueLabel];
  [v11 setText:v10];

  if ([(HUStepperCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  v12 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v13 = [(HUStepperCell *)self valueLabel];
  [v13 setTextColor:v12];

  uint64_t v14 = [(HUStepperCell *)self valueLabel];
  [v14 sizeToFit];

  uint64_t v15 = [(HUStepperCell *)self isDisabled] ^ 1;
  v16 = [(HUStepperCell *)self stepper];
  [v16 setUserInteractionEnabled:v15];

  uint64_t v17 = [(HUStepperCell *)self isDisabled] ^ 1;
  v18 = [(HUStepperCell *)self stepper];
  [v18 setEnabled:v17];

  uint64_t v19 = [(HUStepperCell *)self minimumValue];
  [v19 doubleValue];
  double v21 = v20;
  uint64_t v22 = [(HUStepperCell *)self stepper];
  [v22 setMinimumValue:v21];

  uint64_t v23 = [(HUStepperCell *)self maximumValue];
  [v23 doubleValue];
  double v25 = v24;
  v26 = [(HUStepperCell *)self stepper];
  [v26 setMaximumValue:v25];

  v27 = [(HUStepperCell *)self stepValue];
  [v27 doubleValue];
  double v29 = v28;
  v30 = [(HUStepperCell *)self stepper];
  [v30 setStepValue:v29];

  v31 = [(HUStepperCell *)self stepperValue];
  [v31 doubleValue];
  double v33 = v32;
  v34 = [(HUStepperCell *)self stepper];
  [v34 setValue:v33];

  if ([(HUStepperCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  id v36 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v35 = [(HUStepperCell *)self stepper];
  [v35 setTintColor:v36];
}

- (void)_stepperValueDidChange:(id)a3
{
  if (![(HUStepperCell *)self isDisabled])
  {
    v4 = NSNumber;
    uint64_t v5 = [(HUStepperCell *)self stepper];
    [v5 value];
    objc_msgSend(v4, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [(HUStepperCell *)self stepperValue];
    uint64_t v7 = [v6 compare:v8];

    if (v7)
    {
      [(HUStepperCell *)self setStepperValue:v8];
      [(HUStepperCell *)self _toggleValueChange:self];
      [(HUStepperCell *)self updateUIWithAnimation:0];
    }
  }
}

- (void)_toggleValueChange:(id)a3
{
  id v7 = [(HUStepperCell *)self stepperCellDelegate];
  v4 = NSNumber;
  uint64_t v5 = [(HUStepperCell *)self stepper];
  [v5 value];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  [v7 stepperCell:self steppedToValue:v6];
}

- (id)_valueDescription
{
  objc_super v3 = [(HUStepperCell *)self stepperValue];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v5 = [(HUStepperCell *)self stepperValue];
    id v6 = [v4 localizedStringFromNumber:v5 numberStyle:1];
  }
  else
  {
    id v6 = &stru_1F18F92B8;
  }

  return v6;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSNumber)stepperValue
{
  return self->_stepperValue;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
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

- (UIStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_destroyWeak((id *)&self->_stepperCellDelegate);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_stepperValue, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end
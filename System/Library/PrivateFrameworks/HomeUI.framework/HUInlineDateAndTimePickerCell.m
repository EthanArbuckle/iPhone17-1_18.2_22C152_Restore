@interface HUInlineDateAndTimePickerCell
- (BOOL)hideTitleLabel;
- (BOOL)isDisabled;
- (HUInlineDateAndTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUInlineDateAndTimePickerCellDelegate)delegate;
- (NSArray)allConstraints;
- (NSDateComponents)timeComponents;
- (NSString)title;
- (UIDatePicker)datePicker;
- (double)datePickerHeight;
- (double)leftMargin;
- (void)_valueChanged:(id)a3;
- (void)setAllConstraints:(id)a3;
- (void)setDateAndTimePickerDate:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideTitleLabel:(BOOL)a3;
- (void)setLeftMargin:(double)a3;
- (void)setTimeComponents:(id)a3;
- (void)setTitle:(id)a3;
- (void)toggleTimePickerOptionVisibility:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation HUInlineDateAndTimePickerCell

- (HUInlineDateAndTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HUInlineDateAndTimePickerCell;
  v4 = [(HUInlineDateAndTimePickerCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HUInlineDateAndTimePickerCell *)v4 textLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4F42928]);
    datePicker = v5->_datePicker;
    v5->_datePicker = v7;

    [(UIDatePicker *)v5->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v5->_datePicker setDatePickerMode:2];
    [(UIDatePicker *)v5->_datePicker setPreferredDatePickerStyle:3];
    [(UIDatePicker *)v5->_datePicker addTarget:v5 action:sel__valueChanged_ forControlEvents:4096];
    v9 = [(HUInlineDateAndTimePickerCell *)v5 contentView];
    v10 = [(HUInlineDateAndTimePickerCell *)v5 datePicker];
    [v9 addSubview:v10];
  }
  return v5;
}

- (void)updateConstraints
{
  v3 = [(HUInlineDateAndTimePickerCell *)self allConstraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    if ([(HUInlineDateAndTimePickerCell *)self hideTitleLabel])
    {
      v5 = [(HUInlineDateAndTimePickerCell *)self datePicker];
      v6 = [v5 leadingAnchor];
      v7 = [(HUInlineDateAndTimePickerCell *)self contentView];
      v8 = [v7 leadingAnchor];
      [(HUInlineDateAndTimePickerCell *)self leftMargin];
      v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
      [v4 addObject:v9];

      v10 = [(HUInlineDateAndTimePickerCell *)self datePicker];
      v11 = [v10 trailingAnchor];
      objc_super v12 = [(HUInlineDateAndTimePickerCell *)self contentView];
      v13 = [v12 trailingAnchor];
      v14 = [v11 constraintEqualToAnchor:v13];
      [v4 addObject:v14];
    }
    else
    {
      v15 = [(HUInlineDateAndTimePickerCell *)self textLabel];
      v16 = [v15 topAnchor];
      v17 = [(HUInlineDateAndTimePickerCell *)self contentView];
      v18 = [v17 readableContentGuide];
      v19 = [v18 topAnchor];
      v20 = [v16 constraintEqualToAnchor:v19];
      [v4 addObject:v20];

      v21 = [(HUInlineDateAndTimePickerCell *)self textLabel];
      v22 = [v21 bottomAnchor];
      v23 = [(HUInlineDateAndTimePickerCell *)self contentView];
      v24 = [v23 readableContentGuide];
      v25 = [v24 bottomAnchor];
      v26 = [v22 constraintEqualToAnchor:v25];
      [v4 addObject:v26];

      v27 = [(HUInlineDateAndTimePickerCell *)self textLabel];
      v28 = [v27 leadingAnchor];
      v29 = [(HUInlineDateAndTimePickerCell *)self contentView];
      v30 = [v29 readableContentGuide];
      v31 = [v30 leadingAnchor];
      [(HUInlineDateAndTimePickerCell *)self leftMargin];
      v32 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v31);
      [v4 addObject:v32];

      v33 = [(HUInlineDateAndTimePickerCell *)self datePicker];
      v34 = [v33 leadingAnchor];
      v35 = [(HUInlineDateAndTimePickerCell *)self textLabel];
      v36 = [v35 trailingAnchor];
      v37 = [v34 constraintEqualToAnchor:v36];
      [v4 addObject:v37];

      v10 = [(HUInlineDateAndTimePickerCell *)self datePicker];
      v11 = [v10 trailingAnchor];
      objc_super v12 = [(HUInlineDateAndTimePickerCell *)self contentView];
      v13 = [v12 readableContentGuide];
      v14 = [v13 trailingAnchor];
      v38 = [v11 constraintEqualToAnchor:v14];
      [v4 addObject:v38];
    }
    v39 = [(HUInlineDateAndTimePickerCell *)self contentView];
    v40 = [v39 heightAnchor];
    v41 = [v40 constraintGreaterThanOrEqualToConstant:216.0];

    [v4 addObject:v41];
    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(HUInlineDateAndTimePickerCell *)self setAllConstraints:v4];
  }
  v42.receiver = self;
  v42.super_class = (Class)HUInlineDateAndTimePickerCell;
  [(HUInlineDateAndTimePickerCell *)&v42 updateConstraints];
}

- (void)toggleTimePickerOptionVisibility:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [(HUInlineDateAndTimePickerCell *)self datePicker];
  [v4 setDatePickerMode:v3];
}

- (double)datePickerHeight
{
  v2 = [(HUInlineDateAndTimePickerCell *)self datePicker];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (void)setDateAndTimePickerDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HUInlineDateAndTimePickerCell *)self datePicker];
    [v5 setDate:v4];
  }
}

- (NSDateComponents)timeComponents
{
  double v3 = [(HUInlineDateAndTimePickerCell *)self datePicker];
  id v4 = [v3 calendar];
  id v5 = [(HUInlineDateAndTimePickerCell *)self datePicker];
  v6 = [v5 date];
  v7 = [v4 components:96 fromDate:v6];

  return (NSDateComponents *)v7;
}

- (void)setTimeComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(HUInlineDateAndTimePickerCell *)self datePicker];
  v6 = [v5 calendar];
  id v8 = [v6 dateFromComponents:v4];

  if (v8)
  {
    v7 = [(HUInlineDateAndTimePickerCell *)self datePicker];
    [v7 setDate:v8];
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id v6 = [(HUInlineDateAndTimePickerCell *)self textLabel];
  [v6 setText:v5];
}

- (void)setHideTitleLabel:(BOOL)a3
{
  if (self->_hideTitleLabel != a3)
  {
    self->_hideTitleLabel = a3;
    [(HUInlineDateAndTimePickerCell *)self setAllConstraints:0];
    [(HUInlineDateAndTimePickerCell *)self setNeedsUpdateConstraints];
  }
}

- (void)_valueChanged:(id)a3
{
  id v6 = [(HUInlineDateAndTimePickerCell *)self delegate];
  id v4 = [(HUInlineDateAndTimePickerCell *)self datePicker];
  id v5 = [v4 date];
  [v6 dateAndTimePickerCell:self didSelectDate:v5];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    BOOL v4 = !a3;
    id v5 = [(HUInlineDateAndTimePickerCell *)self datePicker];
    [v5 setUserInteractionEnabled:v4];

    if (v4) {
      [MEMORY[0x1E4F428B8] labelColor];
    }
    else {
    id v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    }
    id v6 = [(HUInlineDateAndTimePickerCell *)self textLabel];
    [v6 setTextColor:v7];
  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUInlineDateAndTimePickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUInlineDateAndTimePickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hideTitleLabel
{
  return self->_hideTitleLabel;
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
}

- (NSArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
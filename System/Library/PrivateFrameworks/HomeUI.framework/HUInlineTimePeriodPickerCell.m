@interface HUInlineTimePeriodPickerCell
- (BOOL)isDisabled;
- (HUInlineTimePeriodPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUInlineTimePeriodPickerCellDelegate)delegate;
- (NSArray)allConstraints;
- (NSDateComponents)timeComponents;
- (NSString)title;
- (UIDatePicker)endTimePicker;
- (UIDatePicker)startTimePicker;
- (UIStackView)stackView;
- (id)endTimeComponents;
- (id)startTimeComponents;
- (void)_endValueChanged:(id)a3;
- (void)_startValueChanged:(id)a3;
- (void)setAllConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEndTimeComponents:(id)a3;
- (void)setEndTimePicker:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStartTimeComponents:(id)a3;
- (void)setStartTimePicker:(id)a3;
- (void)setTimeComponents:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation HUInlineTimePeriodPickerCell

- (HUInlineTimePeriodPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)HUInlineTimePeriodPickerCell;
  v4 = [(HUInlineTimePeriodPickerCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HUInlineTimePeriodPickerCell *)v4 textLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v7 = objc_alloc_init(MEMORY[0x1E4F42E20]);
    [(HUInlineTimePeriodPickerCell *)v5 setStackView:v7];

    v8 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    [v9 setAxis:0];

    v10 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    [v10 setAlignment:3];

    v11 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    [v11 setSpacing:8.0];

    v12 = [(HUInlineTimePeriodPickerCell *)v5 contentView];
    v13 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    [v12 addSubview:v13];

    v14 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4F42928]);
    startTimePicker = v5->_startTimePicker;
    v5->_startTimePicker = v14;

    [(UIDatePicker *)v5->_startTimePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v5->_startTimePicker setDatePickerMode:0];
    [(UIDatePicker *)v5->_startTimePicker setPreferredDatePickerStyle:2];
    [(UIDatePicker *)v5->_startTimePicker addTarget:v5 action:sel__startValueChanged_ forControlEvents:4096];
    v16 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    v17 = [(HUInlineTimePeriodPickerCell *)v5 startTimePicker];
    [v16 addArrangedSubview:v17];

    v18 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4F42928]);
    endTimePicker = v5->_endTimePicker;
    v5->_endTimePicker = v18;

    [(UIDatePicker *)v5->_endTimePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v5->_endTimePicker setDatePickerMode:0];
    [(UIDatePicker *)v5->_endTimePicker setPreferredDatePickerStyle:2];
    [(UIDatePicker *)v5->_endTimePicker addTarget:v5 action:sel__endValueChanged_ forControlEvents:4096];
    v20 = [(HUInlineTimePeriodPickerCell *)v5 stackView];
    v21 = [(HUInlineTimePeriodPickerCell *)v5 endTimePicker];
    [v20 addArrangedSubview:v21];
  }
  return v5;
}

- (void)updateConstraints
{
  v3 = [(HUInlineTimePeriodPickerCell *)self allConstraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(HUInlineTimePeriodPickerCell *)self stackView];
    v6 = [v5 topAnchor];
    id v7 = [(HUInlineTimePeriodPickerCell *)self contentView];
    v8 = [v7 topAnchor];
    v9 = [v6 constraintEqualToAnchor:v8];
    [v4 addObject:v9];

    v10 = [(HUInlineTimePeriodPickerCell *)self stackView];
    v11 = [v10 bottomAnchor];
    v12 = [(HUInlineTimePeriodPickerCell *)self contentView];
    v13 = [v12 bottomAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    [v4 addObject:v14];

    v15 = [(HUInlineTimePeriodPickerCell *)self stackView];
    v16 = [v15 trailingAnchor];
    v17 = [(HUInlineTimePeriodPickerCell *)self contentView];
    v18 = [v17 readableContentGuide];
    v19 = [v18 trailingAnchor];
    v20 = [v16 constraintEqualToAnchor:v19];
    [v4 addObject:v20];

    v21 = [(HUInlineTimePeriodPickerCell *)self textLabel];
    v22 = [v21 topAnchor];
    objc_super v23 = [(HUInlineTimePeriodPickerCell *)self contentView];
    v24 = [v23 readableContentGuide];
    v25 = [v24 topAnchor];
    v26 = [v22 constraintEqualToAnchor:v25];
    [v4 addObject:v26];

    v27 = [(HUInlineTimePeriodPickerCell *)self textLabel];
    v28 = [v27 bottomAnchor];
    v29 = [(HUInlineTimePeriodPickerCell *)self contentView];
    v30 = [v29 readableContentGuide];
    v31 = [v30 bottomAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    [v4 addObject:v32];

    v33 = [(HUInlineTimePeriodPickerCell *)self textLabel];
    v34 = [v33 leadingAnchor];
    v35 = [(HUInlineTimePeriodPickerCell *)self contentView];
    v36 = [v35 readableContentGuide];
    v37 = [v36 leadingAnchor];
    v38 = [v34 constraintEqualToAnchor:v37];
    [v4 addObject:v38];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(HUInlineTimePeriodPickerCell *)self setAllConstraints:v4];
  }
  v39.receiver = self;
  v39.super_class = (Class)HUInlineTimePeriodPickerCell;
  [(HUInlineTimePeriodPickerCell *)&v39 updateConstraints];
}

- (id)startTimeComponents
{
  v3 = [(HUInlineTimePeriodPickerCell *)self startTimePicker];
  v4 = [v3 calendar];
  v5 = [(HUInlineTimePeriodPickerCell *)self startTimePicker];
  v6 = [v5 date];
  id v7 = [v4 components:96 fromDate:v6];

  return v7;
}

- (void)setStartTimeComponents:(id)a3
{
  id v4 = a3;
  v5 = [(HUInlineTimePeriodPickerCell *)self startTimePicker];
  v6 = [v5 calendar];
  id v8 = [v6 dateFromComponents:v4];

  if (v8)
  {
    id v7 = [(HUInlineTimePeriodPickerCell *)self startTimePicker];
    [v7 setDate:v8];
  }
}

- (id)endTimeComponents
{
  v3 = [(HUInlineTimePeriodPickerCell *)self endTimePicker];
  id v4 = [v3 calendar];
  v5 = [(HUInlineTimePeriodPickerCell *)self endTimePicker];
  v6 = [v5 date];
  id v7 = [v4 components:96 fromDate:v6];

  return v7;
}

- (void)setEndTimeComponents:(id)a3
{
  id v4 = a3;
  v5 = [(HUInlineTimePeriodPickerCell *)self endTimePicker];
  v6 = [v5 calendar];
  id v8 = [v6 dateFromComponents:v4];

  if (v8)
  {
    id v7 = [(HUInlineTimePeriodPickerCell *)self endTimePicker];
    [v7 setDate:v8];
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  v6 = [(HUInlineTimePeriodPickerCell *)self textLabel];
  [v6 setText:v5];

  [(HUInlineTimePeriodPickerCell *)self setAllConstraints:0];

  [(HUInlineTimePeriodPickerCell *)self setNeedsUpdateConstraints];
}

- (void)_startValueChanged:(id)a3
{
  id v7 = [(HUInlineTimePeriodPickerCell *)self delegate];
  id v4 = [(HUInlineTimePeriodPickerCell *)self startTimePicker];
  id v5 = [v4 date];
  v6 = [v5 dateComponents];
  [v7 timePickerCell:self didSelectStartTime:v6];
}

- (void)_endValueChanged:(id)a3
{
  id v7 = [(HUInlineTimePeriodPickerCell *)self delegate];
  id v4 = [(HUInlineTimePeriodPickerCell *)self endTimePicker];
  id v5 = [v4 date];
  v6 = [v5 dateComponents];
  [v7 timePickerCell:self didSelectEndTime:v6];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    BOOL v4 = !a3;
    id v5 = [(HUInlineTimePeriodPickerCell *)self startTimePicker];
    [v5 setUserInteractionEnabled:v4];

    v6 = [(HUInlineTimePeriodPickerCell *)self endTimePicker];
    [v6 setUserInteractionEnabled:v4];

    if (v4) {
      [MEMORY[0x1E4F428B8] labelColor];
    }
    else {
    id v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
    }
    id v7 = [(HUInlineTimePeriodPickerCell *)self textLabel];
    [v7 setTextColor:v8];
  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUInlineTimePeriodPickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUInlineTimePeriodPickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDateComponents)timeComponents
{
  return self->_timeComponents;
}

- (void)setTimeComponents:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIDatePicker)startTimePicker
{
  return self->_startTimePicker;
}

- (void)setStartTimePicker:(id)a3
{
}

- (UIDatePicker)endTimePicker
{
  return self->_endTimePicker;
}

- (void)setEndTimePicker:(id)a3
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
  objc_storeStrong((id *)&self->_endTimePicker, 0);
  objc_storeStrong((id *)&self->_startTimePicker, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeComponents, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface HUInlineDatePickerCell
- (BOOL)hideTitleLabel;
- (BOOL)isDisabled;
- (HUInlineDatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUInlineDatePickerCellDelegate)delegate;
- (NSArray)allConstraints;
- (NSDateComponents)timeComponents;
- (NSString)title;
- (UIDatePicker)datePicker;
- (double)leftMargin;
- (void)_valueChanged:(id)a3;
- (void)setAllConstraints:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideTitleLabel:(BOOL)a3;
- (void)setLeftMargin:(double)a3;
- (void)setTimeComponents:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation HUInlineDatePickerCell

- (HUInlineDatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HUInlineDatePickerCell;
  v4 = [(HUInlineDatePickerCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HUInlineDatePickerCell *)v4 textLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4F42928]);
    datePicker = v5->_datePicker;
    v5->_datePicker = v7;

    [(UIDatePicker *)v5->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v5->_datePicker setDatePickerMode:0];
    [(UIDatePicker *)v5->_datePicker setPreferredDatePickerStyle:3];
    [(UIDatePicker *)v5->_datePicker addTarget:v5 action:sel__valueChanged_ forControlEvents:4096];
    v9 = [(HUInlineDatePickerCell *)v5 contentView];
    v10 = [(HUInlineDatePickerCell *)v5 datePicker];
    [v9 addSubview:v10];
  }
  return v5;
}

- (void)updateConstraints
{
  v3 = [(HUInlineDatePickerCell *)self allConstraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    if ([(HUInlineDatePickerCell *)self hideTitleLabel])
    {
      v5 = [(HUInlineDatePickerCell *)self datePicker];
      v6 = [v5 leadingAnchor];
      v7 = [(HUInlineDatePickerCell *)self contentView];
      v8 = [v7 leadingAnchor];
      [(HUInlineDatePickerCell *)self leftMargin];
      v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
      [v4 addObject:v9];
    }
    else
    {
      v10 = [(HUInlineDatePickerCell *)self textLabel];
      v11 = [v10 topAnchor];
      objc_super v12 = [(HUInlineDatePickerCell *)self contentView];
      v13 = [v12 readableContentGuide];
      v14 = [v13 topAnchor];
      v15 = [v11 constraintEqualToAnchor:v14];
      [v4 addObject:v15];

      v16 = [(HUInlineDatePickerCell *)self textLabel];
      v17 = [v16 bottomAnchor];
      v18 = [(HUInlineDatePickerCell *)self contentView];
      v19 = [v18 readableContentGuide];
      v20 = [v19 bottomAnchor];
      v21 = [v17 constraintEqualToAnchor:v20];
      [v4 addObject:v21];

      v22 = [(HUInlineDatePickerCell *)self textLabel];
      v23 = [v22 leadingAnchor];
      v24 = [(HUInlineDatePickerCell *)self contentView];
      v25 = [v24 readableContentGuide];
      v26 = [v25 leadingAnchor];
      [(HUInlineDatePickerCell *)self leftMargin];
      v27 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v26);
      [v4 addObject:v27];

      v5 = [(HUInlineDatePickerCell *)self datePicker];
      v6 = [v5 trailingAnchor];
      v7 = [(HUInlineDatePickerCell *)self contentView];
      v8 = [v7 readableContentGuide];
      v9 = [v8 trailingAnchor];
      v28 = [v6 constraintEqualToAnchor:v9];
      [v4 addObject:v28];
    }
    v29 = [(HUInlineDatePickerCell *)self datePicker];
    v30 = [v29 topAnchor];
    v31 = [(HUInlineDatePickerCell *)self contentView];
    v32 = [v31 readableContentGuide];
    v33 = [v32 topAnchor];
    v34 = [v30 constraintEqualToAnchor:v33];
    [v4 addObject:v34];

    v35 = [(HUInlineDatePickerCell *)self datePicker];
    v36 = [v35 bottomAnchor];
    v37 = [(HUInlineDatePickerCell *)self contentView];
    v38 = [v37 readableContentGuide];
    v39 = [v38 bottomAnchor];
    v40 = [v36 constraintEqualToAnchor:v39];
    [v4 addObject:v40];

    v41 = [(HUInlineDatePickerCell *)self datePicker];
    v42 = [v41 leadingAnchor];
    v43 = [(HUInlineDatePickerCell *)self textLabel];
    v44 = [v43 trailingAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:10.0];
    [v4 addObject:v45];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(HUInlineDatePickerCell *)self setAllConstraints:v4];
  }
  v46.receiver = self;
  v46.super_class = (Class)HUInlineDatePickerCell;
  [(HUInlineDatePickerCell *)&v46 updateConstraints];
}

- (NSDateComponents)timeComponents
{
  v3 = [(HUInlineDatePickerCell *)self datePicker];
  v4 = [v3 calendar];
  v5 = [(HUInlineDatePickerCell *)self datePicker];
  v6 = [v5 date];
  v7 = [v4 components:96 fromDate:v6];

  return (NSDateComponents *)v7;
}

- (void)setTimeComponents:(id)a3
{
  id v4 = a3;
  v5 = [(HUInlineDatePickerCell *)self datePicker];
  v6 = [v5 calendar];
  id v8 = [v6 dateFromComponents:v4];

  if (v8)
  {
    v7 = [(HUInlineDatePickerCell *)self datePicker];
    [v7 setDate:v8];
  }
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  id v6 = [(HUInlineDatePickerCell *)self textLabel];
  [v6 setText:v5];
}

- (void)setHideTitleLabel:(BOOL)a3
{
  if (self->_hideTitleLabel != a3)
  {
    self->_hideTitleLabel = a3;
    [(HUInlineDatePickerCell *)self setAllConstraints:0];
    [(HUInlineDatePickerCell *)self setNeedsUpdateConstraints];
  }
}

- (void)_valueChanged:(id)a3
{
  id v6 = [(HUInlineDatePickerCell *)self delegate];
  id v4 = [(HUInlineDatePickerCell *)self datePicker];
  id v5 = [v4 date];
  [v6 datePickerCell:self didSelectDate:v5];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    BOOL v4 = !a3;
    id v5 = [(HUInlineDatePickerCell *)self datePicker];
    [v5 setUserInteractionEnabled:v4];

    if (v4) {
      [MEMORY[0x1E4F428B8] labelColor];
    }
    else {
    id v7 = [MEMORY[0x1E4F428B8] systemGrayColor];
    }
    id v6 = [(HUInlineDatePickerCell *)self textLabel];
    [v6 setTextColor:v7];
  }
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUInlineDatePickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUInlineDatePickerCellDelegate *)WeakRetained;
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
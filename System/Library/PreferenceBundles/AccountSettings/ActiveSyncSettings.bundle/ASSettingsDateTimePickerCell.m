@interface ASSettingsDateTimePickerCell
- (ASSettingsDateTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (ASSettingsDateTimePickerCellDelegate)delegate;
- (UIDatePicker)datePicker;
- (void)dateSelectionChanged:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ASSettingsDateTimePickerCell

- (ASSettingsDateTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASSettingsDateTimePickerCell;
  v9 = [(ASSettingsDateTimePickerCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    v11 = [(ASSettingsDateTimePickerCell *)v9 contentView];
    uint64_t v12 = +[UIDatePicker as_newConfiguredPicker];
    datePicker = v10->_datePicker;
    v10->_datePicker = (UIDatePicker *)v12;

    [v11 addSubview:v10->_datePicker];
    [(UIDatePicker *)v10->_datePicker as_installConstraints];
    [(ASSettingsDateTimePickerCell *)v10 setSpecifier:v8];
    [(UIDatePicker *)v10->_datePicker addTarget:v10 action:"dateSelectionChanged:" forControlEvents:4096];
    v14 = v10->_datePicker;
    v15 = [v8 propertyForKey:@"kPSOofPickerSelectedDate"];
    [(UIDatePicker *)v14 setDate:v15];

    v16 = [v8 propertyForKey:@"kPSOofDateTimePickerDelegate"];
    objc_storeWeak((id *)&v10->_delegate, v16);
  }
  return v10;
}

- (void)dateSelectionChanged:(id)a3
{
  id v4 = a3;
  id v7 = [(ASSettingsDateTimePickerCell *)self delegate];
  v5 = [(ASSettingsDateTimePickerCell *)self specifier];
  v6 = [v4 date];

  [v7 datePickerCell:v5 changedDate:v6];
}

- (ASSettingsDateTimePickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASSettingsDateTimePickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
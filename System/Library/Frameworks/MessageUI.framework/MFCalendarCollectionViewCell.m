@interface MFCalendarCollectionViewCell
+ (NSString)reusableIdentifier;
- (MFCalendarCollectionViewCell)initWithFrame:(CGRect)a3;
- (MFCalendarCollectionViewCellDelegate)delegate;
- (UIDatePicker)datePicker;
- (void)datePickerChanged:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateCalendarDate:(id)a3;
@end

@implementation MFCalendarCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MFCalendarCollectionViewCellIdentifier";
}

- (MFCalendarCollectionViewCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MFCalendarCollectionViewCell;
  v3 = -[MFCalendarCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MFCalendarCollectionViewCell *)v3 contentView];
    v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v5 setBackgroundColor:v6];

    v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
    datePicker = v4->_datePicker;
    v4->_datePicker = v7;

    [(UIDatePicker *)v4->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1148846080;
    [(UIDatePicker *)v4->_datePicker setContentHuggingPriority:0 forAxis:v9];
    [(UIDatePicker *)v4->_datePicker setPreferredDatePickerStyle:3];
    [(UIDatePicker *)v4->_datePicker setDatePickerMode:1];
    [(UIDatePicker *)v4->_datePicker setContentHorizontalAlignment:5];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel_datePickerChanged_ forControlEvents:4096];
    v10 = [MEMORY[0x1E4F1C9C8] now];
    [(UIDatePicker *)v4->_datePicker setMinimumDate:v10];

    [(UIDatePicker *)v4->_datePicker setAccessibilityIdentifier:*MEMORY[0x1E4F73BB0]];
    v11 = [(MFCalendarCollectionViewCell *)v4 contentView];
    [v11 addSubview:v4->_datePicker];

    v12 = v4->_datePicker;
    v13 = [(MFCalendarCollectionViewCell *)v4 contentView];
    [(UIDatePicker *)v12 mf_pinToView:v13 usingLayoutMargins:0];
  }
  return v4;
}

- (void)datePickerChanged:(id)a3
{
  id v6 = a3;
  v4 = [(MFCalendarCollectionViewCell *)self delegate];
  v5 = [v6 date];
  [v4 calendarCollectionViewCell:self didChangeDate:v5];
}

- (void)updateCalendarDate:(id)a3
{
  id v5 = a3;
  v4 = [(MFCalendarCollectionViewCell *)self datePicker];
  [v4 setDate:v5];
}

- (MFCalendarCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFCalendarCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void)setDatePicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
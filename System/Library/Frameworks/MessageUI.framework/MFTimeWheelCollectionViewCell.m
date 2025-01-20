@interface MFTimeWheelCollectionViewCell
+ (NSString)reusableIdentifier;
- (MFTimeWheelCollectionViewCell)initWithFrame:(CGRect)a3;
- (MFTimeWheelCollectionViewCellDelegate)delegate;
- (NSDate)date;
- (NSDate)minimumDate;
- (UIDatePicker)timePicker;
- (void)datePickerChanged:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMinimumDate:(id)a3;
- (void)setTimePicker:(id)a3;
@end

@implementation MFTimeWheelCollectionViewCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MFTimeWheelCollectionViewCellIdentifier";
}

- (MFTimeWheelCollectionViewCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MFTimeWheelCollectionViewCell;
  v3 = -[MFTimeWheelCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v5 = [(MFTimeWheelCollectionViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4FB16B0]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v7) = 1148846080;
    [v6 setContentHuggingPriority:0 forAxis:v7];
    [v6 setPreferredDatePickerStyle:1];
    [v6 setDatePickerMode:0];
    [v6 setContentHorizontalAlignment:5];
    v8 = [MEMORY[0x1E4F1C9C8] now];
    [v6 setMinimumDate:v8];

    [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F73CA8]];
    [v6 addTarget:v3 action:sel_datePickerChanged_ forControlEvents:4096];
    [(MFTimeWheelCollectionViewCell *)v3 setTimePicker:v6];
    v9 = [(MFTimeWheelCollectionViewCell *)v3 contentView];
    v10 = [(MFTimeWheelCollectionViewCell *)v3 timePicker];
    [v9 addSubview:v10];

    v11 = [(MFTimeWheelCollectionViewCell *)v3 timePicker];
    v12 = [(MFTimeWheelCollectionViewCell *)v3 contentView];
    objc_msgSend(v11, "mf_pinToView:usingLayoutMargins:", v12, 0);
  }
  return v3;
}

- (void)datePickerChanged:(id)a3
{
  id v6 = a3;
  v4 = [(MFTimeWheelCollectionViewCell *)self delegate];
  v5 = [v6 date];
  [v4 timeCollectionViewCell:self didChangeDate:v5];
}

- (void)setMinimumDate:(id)a3
{
  id v5 = a3;
  v4 = [(MFTimeWheelCollectionViewCell *)self timePicker];
  [v4 setMinimumDate:v5];
}

- (NSDate)minimumDate
{
  v2 = [(MFTimeWheelCollectionViewCell *)self timePicker];
  v3 = [v2 minimumDate];

  return (NSDate *)v3;
}

- (void)setDate:(id)a3
{
  id v5 = a3;
  v4 = [(MFTimeWheelCollectionViewCell *)self timePicker];
  [v4 setDate:v5];
}

- (NSDate)date
{
  v2 = [(MFTimeWheelCollectionViewCell *)self timePicker];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (MFTimeWheelCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTimeWheelCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePicker, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface HUAlarmEditView
- (BOOL)accessorySupportsMusicAlarm;
- (HUAlarmEditView)initWithFrame:(CGRect)a3;
- (HUAlarmEditView)initWithFrame:(CGRect)a3 supportsMusicAlarm:(BOOL)a4;
- (UIDatePicker)timePicker;
- (UITableView)settingsTable;
- (void)layoutSubviews;
- (void)setAccessorySupportsMusicAlarm:(BOOL)a3;
@end

@implementation HUAlarmEditView

- (HUAlarmEditView)initWithFrame:(CGRect)a3 supportsMusicAlarm:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3)
    || (v26.receiver = self,
        v26.super_class = (Class)HUAlarmEditView,
        v10 = -[HUAlarmEditView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height),
        (self = v10) == 0))
  {
    v14 = 0;
  }
  else
  {
    v10->_accessorySupportsMusicAlarm = v4;
    if (v4)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F42E98]);
      v12 = (UITableView *)objc_msgSend(v11, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      settingsTable = self->_settingsTable;
      self->_settingsTable = v12;
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F42928]);
      double v16 = *MEMORY[0x1E4F1DB28];
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v20 = (UIDatePicker *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], v17, v18, v19);
      timePicker = self->_timePicker;
      self->_timePicker = v20;

      [(UIDatePicker *)self->_timePicker setDatePickerMode:0];
      v22 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 1, v16, v17, v18, v19);
      v23 = self->_settingsTable;
      self->_settingsTable = v22;

      [(UITableView *)self->_settingsTable _setTopPadding:0.0];
    }
    [(UITableView *)self->_settingsTable setAlwaysBounceVertical:0];
    [(HUAlarmEditView *)self addSubview:self->_settingsTable];
    if (!self->_accessorySupportsMusicAlarm) {
      [(HUAlarmEditView *)self addSubview:self->_timePicker];
    }
    v24 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(HUAlarmEditView *)self setBackgroundColor:v24];

    self = self;
    v14 = self;
  }

  return v14;
}

- (HUAlarmEditView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3)
    || (v20.receiver = self,
        v20.super_class = (Class)HUAlarmEditView,
        (self = -[HUAlarmEditView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height)) == 0))
  {
    double v18 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F42928]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v13 = (UIDatePicker *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    timePicker = self->_timePicker;
    self->_timePicker = v13;

    [(UIDatePicker *)self->_timePicker setDatePickerMode:0];
    id v15 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E98]), "initWithFrame:style:", 1, v9, v10, v11, v12);
    settingsTable = self->_settingsTable;
    self->_settingsTable = v15;

    [(UITableView *)self->_settingsTable _setTopPadding:0.0];
    [(UITableView *)self->_settingsTable setAlwaysBounceVertical:0];
    [(HUAlarmEditView *)self addSubview:self->_settingsTable];
    [(HUAlarmEditView *)self addSubview:self->_timePicker];
    double v17 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(HUAlarmEditView *)self setBackgroundColor:v17];

    self = self;
    double v18 = self;
  }

  return v18;
}

- (void)layoutSubviews
{
  [(HUAlarmEditView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if (self->_accessorySupportsMusicAlarm)
  {
    CGFloat v8 = *MEMORY[0x1E4F1DB28];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    [(UIDatePicker *)self->_timePicker sizeToFit];
    [(UIDatePicker *)self->_timePicker frame];
    double v9 = v11;
    CGFloat v7 = 0.0;
    -[UIDatePicker setFrame:](self->_timePicker, "setFrame:", 0.0, 0.0, v4);
    CGFloat v10 = v4;
    CGFloat v8 = 0.0;
  }
  [(UITableView *)self->_settingsTable frame];
  if (!self->_accessorySupportsMusicAlarm)
  {
    v14.origin.double x = v8;
    v14.origin.double y = v7;
    v14.size.double width = v10;
    v14.size.double height = v9;
    double MaxY = CGRectGetMaxY(v14);
    double v6 = v6 - v9;
  }
  -[UITableView setFrame:](self->_settingsTable, "setFrame:", 0.0, MaxY, v4, v6);
  v13.receiver = self;
  v13.super_class = (Class)HUAlarmEditView;
  [(HUAlarmEditView *)&v13 layoutSubviews];
}

- (UITableView)settingsTable
{
  return self->_settingsTable;
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (BOOL)accessorySupportsMusicAlarm
{
  return self->_accessorySupportsMusicAlarm;
}

- (void)setAccessorySupportsMusicAlarm:(BOOL)a3
{
  self->_accessorySupportsMusicAlarm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePicker, 0);

  objc_storeStrong((id *)&self->_settingsTable, 0);
}

@end
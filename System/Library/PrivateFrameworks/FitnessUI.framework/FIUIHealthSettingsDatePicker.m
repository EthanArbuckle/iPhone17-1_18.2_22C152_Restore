@interface FIUIHealthSettingsDatePicker
- (FIUIHealthSettingsDatePicker)initWithFrame:(CGRect)a3;
- (id)dateUpdateHandler;
- (void)_dateDidChange:(id)a3;
- (void)forceUpdate;
- (void)layoutSubviews;
- (void)setDateUpdateHandler:(id)a3;
@end

@implementation FIUIHealthSettingsDatePicker

- (FIUIHealthSettingsDatePicker)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)FIUIHealthSettingsDatePicker;
  v3 = -[FIUIHealthSettingsDatePicker initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FIUIHealthSettingsDatePicker *)v3 setDatePickerMode:1];
    [(FIUIHealthSettingsDatePicker *)v4 setPreferredDatePickerStyle:1];
    v5 = [MEMORY[0x263EFFA18] localTimeZone];
    [(FIUIHealthSettingsDatePicker *)v4 setTimeZone:v5];

    v6 = [MEMORY[0x263EFF910] date];
    [(FIUIHealthSettingsDatePicker *)v4 setMaximumDate:v6];

    v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    v8 = [MEMORY[0x263EFF910] date];
    v9 = [v7 components:4 fromDate:v8];

    objc_msgSend(v9, "setYear:", objc_msgSend(v9, "year") - 150);
    [v9 setDay:1];
    [v9 setMonth:1];
    v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    v11 = [v10 dateFromComponents:v9];

    [(FIUIHealthSettingsDatePicker *)v4 setMinimumDate:v11];
    v12 = [MEMORY[0x263F825C8] grayColor];
    [(FIUIHealthSettingsDatePicker *)v4 _setTextColor:v12];

    [(FIUIHealthSettingsDatePicker *)v4 _setHighlightsToday:0];
    [(FIUIHealthSettingsDatePicker *)v4 addTarget:v4 action:sel__dateDidChange_ forControlEvents:4096];
    [(FIUIHealthSettingsDatePicker *)v4 _setUsesBlackChrome:1];
    v13 = [MEMORY[0x263F825C8] colorWithRed:0.109803922 green:0.109803922 blue:0.109803922 alpha:1.0];
    [(FIUIHealthSettingsDatePicker *)v4 setBackgroundColor:v13];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FIUIHealthSettingsDatePicker;
  [(FIUIHealthSettingsDatePicker *)&v3 layoutSubviews];
  _changeSeparatorLineColors(self);
}

- (void)_dateDidChange:(id)a3
{
  v4 = [(FIUIHealthSettingsDatePicker *)self dateUpdateHandler];

  if (v4)
  {
    v6 = [(FIUIHealthSettingsDatePicker *)self dateUpdateHandler];
    v5 = [(FIUIHealthSettingsDatePicker *)self date];
    v6[2](v6, v5);
  }
}

- (void)forceUpdate
{
}

- (id)dateUpdateHandler
{
  return self->_dateUpdateHandler;
}

- (void)setDateUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface UIDatePicker
- (int64_t)selectedDurationInMinutes;
- (void)setGaxDatePickerEnabled:(BOOL)a3;
- (void)updateSelectedDurationInMinutes:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation UIDatePicker

- (int64_t)selectedDurationInMinutes
{
  [(UIDatePicker *)self countDownDuration];
  return (uint64_t)v2 / 60;
}

- (void)updateSelectedDurationInMinutes:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setGaxDatePickerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_308AC;
  block[3] = &unk_5CD28;
  block[4] = self;
  if (qword_6E828 != -1) {
    dispatch_once(&qword_6E828, block);
  }
  [(UIDatePicker *)self setEnabled:v3];
  [(UIDatePicker *)self setUserInteractionEnabled:v3];
  objc_opt_class();
  v5 = [(UIDatePicker *)self safeValueForKey:@"_pickerView"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [v6 safeValueForKey:@"_hourLabel"];
  v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v9 = [v6 safeValueForKey:@"_minuteLabel"];
  v10 = __UIAccessibilityCastAsClass();

  if (v3)
  {
    [(UIDatePicker *)self _setTextColor:qword_6E820];
    [v8 setTextColor:qword_6E820];
    [v10 setTextColor:qword_6E820];
  }
  else
  {
    v11 = +[UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:0.9];
    [(UIDatePicker *)self _setTextColor:v11];
    [v8 setTextColor:v11];
    [v10 setTextColor:v11];
  }
  [v6 reloadAllComponents];
}

@end
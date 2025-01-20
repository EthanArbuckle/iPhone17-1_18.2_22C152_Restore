@interface HKMonthDayCell
+ (double)dayLabelFontSize;
- (BOOL)_representsWeekendDay;
- (HKMonthDayCell)initWithDateCache:(id)a3;
- (int64_t)circleState;
- (void)_setCircleState:(int64_t)a3;
- (void)_updateFontAndCircle;
- (void)dealloc;
- (void)pressToTransition:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4;
@end

@implementation HKMonthDayCell

- (HKMonthDayCell)initWithDateCache:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMonthDayCell;
  v3 = [(HKCalendarDayCell *)&v6 initWithDateCache:a3];
  v4 = v3;
  if (v3)
  {
    [(HKCalendarDayCell *)v3 setDayDiameter:35.0];
    [(HKMonthDayCell *)v4 _updateFontAndCircle];
  }
  return v4;
}

+ (double)dayLabelFontSize
{
  uint64_t v2 = *MEMORY[0x1E4FB2790];
  BOOL IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB2790]);
  v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  if (IsLargerThanSizeCategory)
  {
    objc_super v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v2];
    v7 = [v4 preferredFontForTextStyle:v5 compatibleWithTraitCollection:v6];
    [v7 _scaledValueForValue:16.0];
    double v9 = v8;
  }
  else
  {
    objc_super v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v6 _scaledValueForValue:16.0];
    double v9 = v10;
  }

  return v9;
}

- (void)_updateFontAndCircle
{
  [(id)objc_opt_class() dayLabelFontSize];
  double v4 = v3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");
  [(HKCalendarDayCell *)self setFont:v5];

  objc_super v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:v4];
  [(HKCalendarDayCell *)self setBoldFont:v6];

  [(HKCalendarDayCell *)self circleSize];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(HKCalendarDayCell *)self circle];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v10);
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKMonthDayCell;
  [(HKMonthDayCell *)&v4 dealloc];
}

- (void)_setCircleState:(int64_t)a3
{
  self->_circleState = a3;
  if (a3 == 2)
  {
    double v9 = [(HKCalendarDayCell *)self circle];
    [v9 setHidden:0];

    double v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v11 = [(HKCalendarDayCell *)self date];
    int v12 = [v10 isDateInToday:v11];

    if (v12) {
      HKHealthKeyColor();
    }
    else {
    id v13 = [MEMORY[0x1E4FB1618] labelColor];
    }
    uint64_t v14 = [v13 CGColor];

    uint64_t v5 = [(HKCalendarDayCell *)self circle];
    id v15 = v5;
    uint64_t v6 = v14;
LABEL_11:
    [v5 setBackgroundColor:v6];
    goto LABEL_12;
  }
  if (a3 != 1)
  {
    if (a3) {
      return;
    }
    objc_super v4 = [(HKCalendarDayCell *)self circle];
    [v4 setHidden:1];

    uint64_t v5 = [(HKCalendarDayCell *)self circle];
    id v15 = v5;
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  double v7 = [(HKCalendarDayCell *)self circle];
  [v7 setHidden:0];

  id v15 = [(HKCalendarDayCell *)self circle];
  id v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

LABEL_12:
}

- (BOOL)_representsWeekendDay
{
  double v3 = [(HKCalendarDayCell *)self dateCache];
  objc_super v4 = [NSNumber numberWithInteger:self->_dayOfWeek];
  char v5 = [v3 isDayOfWeekNumberOnWeekend:v4];

  return v5;
}

- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)HKMonthDayCell;
  id v6 = a3;
  [(HKCalendarDayCell *)&v12 updateWithDate:v6 dayOfMonth:a4];
  -[HKMonthDayCell _setCircleState:](self, "_setCircleState:", 0, v12.receiver, v12.super_class);
  [(HKMonthDayCell *)self setSelected:0];
  double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v8 = [v7 component:512 fromDate:v6];

  self->_dayOfWeek = v8;
  if ([(HKCalendarDayCell *)self representsToday])
  {
    uint64_t v9 = HKHealthKeyColor();
  }
  else
  {
    if ([(HKMonthDayCell *)self _representsWeekendDay]) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
    }
  }
  double v10 = (void *)v9;
  [(HKCalendarDayCell *)self setTextColor:v9];

  [(HKMonthDayCell *)self _updateFontAndCircle];
  id v11 = [(HKCalendarDayCell *)self textColor];
  [(HKCalendarDayCell *)self updateDateTextForDayNumber:a4 textColor:v11];
}

- (void)pressToTransition:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKMonthDayCell *)self circleState] != 2)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.3];
    [(HKMonthDayCell *)self _setCircleState:v3];
    char v5 = (void *)MEMORY[0x1E4F39CF8];
    [v5 commit];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HKMonthDayCell;
  -[HKCalendarDayCell setSelected:](&v6, sel_setSelected_);
  if (v3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(HKMonthDayCell *)self _setCircleState:v5];
}

- (int64_t)circleState
{
  return self->_circleState;
}

@end
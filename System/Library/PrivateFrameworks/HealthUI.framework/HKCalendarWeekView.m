@interface HKCalendarWeekView
- (BOOL)containsDate:(id)a3;
- (BOOL)containsMonthTitle;
- (BOOL)supportsRTL;
- (CGRect)frameForDayCell:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)cellClass;
- (Class)monthTitleClass;
- (HKCalendarDayCell)pressedDayCell;
- (HKCalendarMonthTitleFormatting)monthTitleView;
- (HKCalendarWeekView)initWithDateCache:(id)a3;
- (HKCalendarWeekViewDelegate)delegate;
- (HKDateCache)dateCache;
- (NSArray)dayCells;
- (NSDate)monthWeekStart;
- (double)additionalSpacingPerRow;
- (double)dateBottomMargin;
- (double)dateDiameter;
- (double)dateTopMargin;
- (double)leadingMargin;
- (double)monthTitleBottomMargin;
- (double)monthTitleTopMargin;
- (double)preferredHeight;
- (id)_getDayCellWithTouchLocation:(CGPoint)a3;
- (id)_getDayCellWithTouches:(id)a3;
- (id)currentWeekStartDate;
- (id)description;
- (id)nextWeekStartDate;
- (id)previousWeekStartDate;
- (int64_t)firstDayOfMonthCellIndex;
- (int64_t)pressedDayOfWeek;
- (void)reloadCells;
- (void)selectedCalendarDay:(id)a3;
- (void)setAdditionalSpacingPerRow:(double)a3;
- (void)setDateBottomMargin:(double)a3;
- (void)setDateDiameter:(double)a3;
- (void)setDateTopMargin:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstDayOfMonthCellIndex:(int64_t)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setMonthTitleBottomMargin:(double)a3;
- (void)setMonthTitleTopMargin:(double)a3;
- (void)setMonthTitleView:(id)a3;
- (void)setMonthWeekStart:(id)a3;
- (void)setPressedDayCell:(id)a3;
- (void)setPressedDayOfWeek:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation HKCalendarWeekView

- (HKCalendarWeekView)initWithDateCache:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKCalendarWeekView;
  v6 = -[HKCalendarWeekView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    dayCells = v6->_dayCells;
    v6->_dayCells = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_dateCache, a3);
    if ([(HKCalendarWeekView *)v6 cellClass])
    {
      for (uint64_t i = *MEMORY[0x1E4F29998]; i; --i)
      {
        v10 = objc_msgSend(objc_alloc(-[HKCalendarWeekView cellClass](v6, "cellClass")), "initWithDateCache:", v5);
        v11 = [(HKCalendarWeekView *)v6 layer];
        [v11 addSublayer:v10];

        [(NSMutableArray *)v6->_dayCells addObject:v10];
      }
    }
    id v12 = objc_alloc_init([(HKCalendarWeekView *)v6 monthTitleClass]);
    [(HKCalendarWeekView *)v6 setMonthTitleView:v12];

    v13 = [(HKCalendarWeekView *)v6 monthTitleView];
    [v13 setHidden:1];

    v14 = [(HKCalendarWeekView *)v6 monthTitleView];
    [(HKCalendarWeekView *)v6 addSubview:v14];
  }
  return v6;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)HKCalendarWeekView;
  v3 = [(HKCalendarWeekView *)&v13 description];
  v4 = [(NSMutableArray *)self->_dayCells firstObject];
  id v5 = [(NSMutableArray *)self->_dayCells lastObject];
  v6 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v7 = [v4 date];
  v8 = [v6 localizedStringFromDate:v7 dateStyle:2 timeStyle:0];

  v9 = (void *)MEMORY[0x1E4F28C10];
  v10 = [v5 date];
  v11 = [v9 localizedStringFromDate:v10 dateStyle:2 timeStyle:0];

  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
  [v3 appendFormat:@"; dates: %@ – %@>", v8, v11];

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(HKCalendarWeekView *)self preferredHeight];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)setMonthWeekStart:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v6 = [v15 startOfDayForDate:v5];

  self->_firstDayOfMonthCellIndex = -1;
  if ([(HKCalendarWeekView *)self supportsRTL]) {
    int IsRightToLeft = HKUICalendarLocaleIsRightToLeft();
  }
  else {
    int IsRightToLeft = 0;
  }
  if ([(NSMutableArray *)self->_dayCells count])
  {
    unint64_t v8 = 0;
    uint64_t v9 = -1;
    do
    {
      int64_t v10 = v8;
      if (IsRightToLeft) {
        int64_t v10 = [(NSMutableArray *)self->_dayCells count] + v9;
      }
      v11 = [(NSMutableArray *)self->_dayCells objectAtIndexedSubscript:v10];
      id v12 = [v15 dateByAddingUnit:16 value:v8 toDate:v6 options:0];
      uint64_t v13 = [v15 component:16 fromDate:v12];
      if (v13 == 1)
      {
        self->_firstDayOfMonthCellIndex = v10;
        [(HKCalendarMonthTitleFormatting *)self->_monthTitleView setDate:v12];
      }
      [v11 updateWithDate:v12 dayOfMonth:v13];

      ++v8;
      --v9;
    }
    while (v8 < [(NSMutableArray *)self->_dayCells count]);
  }
  [(HKCalendarMonthTitleFormatting *)self->_monthTitleView setHidden:[(HKCalendarWeekView *)self containsMonthTitle] ^ 1];
  [(HKCalendarWeekView *)self setNeedsLayout];
  [MEMORY[0x1E4F39CF8] commit];
  monthWeekStart = self->_monthWeekStart;
  self->_monthWeekStart = v6;
}

- (void)reloadCells
{
  if (self->_monthWeekStart) {
    -[HKCalendarWeekView setMonthWeekStart:](self, "setMonthWeekStart:");
  }
}

- (double)preferredHeight
{
  double v3 = 1.0;
  if ([(HKCalendarWeekView *)self containsMonthTitle])
  {
    if ([(HKCalendarWeekView *)self supportsRTL] && HKUICalendarLocaleIsRightToLeft()) {
      BOOL v4 = self->_firstDayOfMonthCellIndex < (unint64_t)(*MEMORY[0x1E4F29998] - 1);
    }
    else {
      BOOL v4 = self->_firstDayOfMonthCellIndex > 0;
    }
    if (v4) {
      double v3 = 2.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  [(HKCalendarWeekView *)self dateTopMargin];
  double v6 = v5;
  [(HKCalendarWeekView *)self dateDiameter];
  double v8 = v6 + v7;
  [(HKCalendarWeekView *)self dateBottomMargin];
  double v10 = v8 + v9;
  [(HKCalendarWeekView *)self additionalSpacingPerRow];
  double v12 = v3 * (v10 + v11);
  if ([(HKCalendarWeekView *)self containsMonthTitle])
  {
    monthTitleView = self->_monthTitleView;
    [(HKCalendarWeekView *)self bounds];
    -[HKCalendarMonthTitleFormatting sizeThatFits:](monthTitleView, "sizeThatFits:", v14, v15);
    double v17 = v16;
    [(HKCalendarWeekView *)self monthTitleTopMargin];
    double v19 = v18;
    [(HKCalendarWeekView *)self monthTitleBottomMargin];
    double v12 = v12 + v17 + v19 + v20;
    if (!self->_firstDayOfMonthCellIndex)
    {
      [(HKCalendarWeekView *)self dateTopMargin];
      return v12 + v21;
    }
  }
  return v12;
}

- (BOOL)containsMonthTitle
{
  return self->_firstDayOfMonthCellIndex != -1;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  double v5 = [(HKCalendarWeekView *)self currentWeekStartDate];

  BOOL v6 = 0;
  if (v4 && v5)
  {
    double v16 = 0.0;
    double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v15 = 0;
    double v8 = [(HKCalendarWeekView *)self currentWeekStartDate];
    int v9 = [v7 rangeOfUnit:4096 startDate:&v15 interval:&v16 forDate:v8];
    id v10 = v15;

    if (v9)
    {
      [v4 timeIntervalSinceReferenceDate];
      double v12 = v11;
      [v10 timeIntervalSinceReferenceDate];
      BOOL v6 = v12 < v13 + v16 && v12 >= v13;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (CGRect)frameForDayCell:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HKCalendarWeekView *)self containsDate:v4])
  {
    double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    BOOL v6 = [v5 components:30 fromDate:v4];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v7 = self->_dayCells;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          double v13 = objc_msgSend(v12, "date", (void)v27);
          double v14 = [v5 components:30 fromDate:v13];

          if ([v6 isEqual:v14])
          {
            [v12 frame];
            double v15 = v19;
            double v16 = v20;
            double v17 = v21;
            double v18 = v22;

            goto LABEL_13;
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  double v15 = *MEMORY[0x1E4F1DB28];
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_13:

  double v23 = v15;
  double v24 = v16;
  double v25 = v17;
  double v26 = v18;
  result.size.height = v26;
  result.size.CGFloat width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)currentWeekStartDate
{
  if ([(HKCalendarWeekView *)self supportsRTL] && HKUICalendarLocaleIsRightToLeft())
  {
    double v3 = [(NSMutableArray *)self->_dayCells lastObject];
  }
  else
  {
    double v3 = [(NSMutableArray *)self->_dayCells firstObject];
  }
  id v4 = v3;
  double v5 = [v3 date];

  return v5;
}

- (id)previousWeekStartDate
{
  double v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [(HKCalendarWeekView *)self currentWeekStartDate];
  double v5 = [v3 dateByAddingUnit:0x2000 value:-1 toDate:v4 options:0];

  return v5;
}

- (id)nextWeekStartDate
{
  double v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [(HKCalendarWeekView *)self currentWeekStartDate];
  double v5 = [v3 dateByAddingUnit:0x2000 value:1 toDate:v4 options:0];

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[HKCalendarWeekView _getDayCellWithTouches:](self, "_getDayCellWithTouches:", a3, a4);
  double v5 = (HKCalendarDayCell *)objc_claimAutoreleasedReturnValue();
  pressedDayCell = self->_pressedDayCell;
  self->_pressedDayCell = v5;

  if (self->_pressedDayCell)
  {
    int64_t pressedDayOfWeek = self->_pressedDayOfWeek;
    -[HKCalendarWeekView pressedOnCalendarDay:cell:down:](self, "pressedOnCalendarDay:cell:down:", pressedDayOfWeek);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  pressedDayCell = self->_pressedDayCell;
  if (pressedDayCell) {
    -[HKCalendarWeekView selectedCalendarDay:](self, "selectedCalendarDay:", pressedDayCell, a4);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (self->_pressedDayCell)
  {
    -[HKCalendarWeekView _getDayCellWithTouches:](self, "_getDayCellWithTouches:", a3, a4);
    double v5 = (HKCalendarDayCell *)objc_claimAutoreleasedReturnValue();
    pressedDayCell = self->_pressedDayCell;
    if (pressedDayCell != v5)
    {
      double v7 = v5;
      [(HKCalendarWeekView *)self pressedOnCalendarDay:self->_pressedDayOfWeek cell:pressedDayCell down:0];
      double v5 = v7;
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  pressedDayCell = self->_pressedDayCell;
  if (pressedDayCell) {
    [(HKCalendarWeekView *)self pressedOnCalendarDay:self->_pressedDayOfWeek cell:pressedDayCell down:0];
  }
}

- (id)_getDayCellWithTouches:(id)a3
{
  id v4 = [a3 anyObject];
  [v4 locationInView:self];
  double v5 = -[HKCalendarWeekView _getDayCellWithTouchLocation:](self, "_getDayCellWithTouchLocation:");

  return v5;
}

- (id)_getDayCellWithTouchLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  [(HKCalendarWeekView *)self frame];
  double v7 = floor(v6 / (double)(unint64_t)*MEMORY[0x1E4F29998]);
  uint64_t v8 = vcvtpd_s64_f64(x / v7);
  int64_t v9 = v8 - 1;
  if (v8 < 1 || (unint64_t)v9 >= *MEMORY[0x1E4F29998])
  {
    double v11 = 0;
  }
  else
  {
    double v12 = [(NSMutableArray *)self->_dayCells objectAtIndexedSubscript:v8 - 1];
    [(HKCalendarWeekView *)self dateTopMargin];
    double v14 = v13;
    [v12 frame];
    double v16 = v14 + v15;
    [(HKCalendarWeekView *)self dateBottomMargin];
    double v18 = v17 + v16;
    [(HKCalendarWeekView *)self additionalSpacingPerRow];
    CGFloat v20 = v19 + v18;
    [v12 frame];
    double v22 = v21;
    [(HKCalendarWeekView *)self dateTopMargin];
    v28.origin.CGFloat y = v22 - v23;
    v28.origin.double x = v7 * (double)v9;
    v28.size.CGFloat width = v7;
    v28.size.height = v20;
    v27.double x = x;
    v27.CGFloat y = y;
    if (CGRectContainsPoint(v28, v27))
    {
      self->_int64_t pressedDayOfWeek = v9;
      double v11 = [(NSMutableArray *)self->_dayCells objectAtIndexedSubscript:v9];
    }
    else
    {
      double v11 = 0;
    }
  }
  return v11;
}

- (BOOL)supportsRTL
{
  return 0;
}

- (HKCalendarMonthTitleFormatting)monthTitleView
{
  return self->_monthTitleView;
}

- (void)setMonthTitleView:(id)a3
{
}

- (double)dateTopMargin
{
  return self->_dateTopMargin;
}

- (void)setDateTopMargin:(double)a3
{
  self->_dateTopMargin = a3;
}

- (double)dateBottomMargin
{
  return self->_dateBottomMargin;
}

- (void)setDateBottomMargin:(double)a3
{
  self->_dateBottomMargin = a3;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)monthTitleTopMargin
{
  return self->_monthTitleTopMargin;
}

- (void)setMonthTitleTopMargin:(double)a3
{
  self->_monthTitleTopMargin = a3;
}

- (double)monthTitleBottomMargin
{
  return self->_monthTitleBottomMargin;
}

- (void)setMonthTitleBottomMargin:(double)a3
{
  self->_monthTitleBottomMargin = a3;
}

- (double)dateDiameter
{
  return self->_dateDiameter;
}

- (void)setDateDiameter:(double)a3
{
  self->_dateDiameter = a3;
}

- (double)additionalSpacingPerRow
{
  return self->_additionalSpacingPerRow;
}

- (void)setAdditionalSpacingPerRow:(double)a3
{
  self->_additionalSpacingPerRow = a3;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (NSDate)monthWeekStart
{
  return self->_monthWeekStart;
}

- (HKCalendarWeekViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKCalendarWeekViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)dayCells
{
  return &self->_dayCells->super;
}

- (int64_t)firstDayOfMonthCellIndex
{
  return self->_firstDayOfMonthCellIndex;
}

- (void)setFirstDayOfMonthCellIndex:(int64_t)a3
{
  self->_firstDayOfMonthCellIndedouble x = a3;
}

- (int64_t)pressedDayOfWeek
{
  return self->_pressedDayOfWeek;
}

- (void)setPressedDayOfWeek:(int64_t)a3
{
  self->_int64_t pressedDayOfWeek = a3;
}

- (HKCalendarDayCell)pressedDayCell
{
  return self->_pressedDayCell;
}

- (void)setPressedDayCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedDayCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monthWeekStart, 0);
  objc_storeStrong((id *)&self->_monthTitleView, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_dayCells, 0);
}

- (void)selectedCalendarDay:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (Class)cellClass
{
  return 0;
}

- (Class)monthTitleClass
{
  return 0;
}

@end
@interface HKCalendarScrollViewController
- (CGPoint)_centerPointToCenterDate:(id)a3;
- (CGPoint)_setWeekViewsToCenterDate:(id)a3 forceUpdate:(BOOL)a4;
- (CGRect)_visibleContentRect;
- (HKCalendarScrollViewController)initWithCoder:(id)a3;
- (HKCalendarScrollViewController)initWithSelectedDate:(id)a3;
- (HKCalendarScrollViewControllerDelegate)delegate;
- (UIScrollView)scrollView;
- (double)_heightOfAllWeekCells;
- (double)topInset;
- (id)_currentlyCenteredVisibleWeek;
- (id)_startDateToTileWeekViews:(id)a3;
- (id)_weekForDate:(id)a3;
- (id)_weekViewContainingTitleForThisMonth;
- (id)_weekViewForToday;
- (unint64_t)_firstVisibleWeekIndex;
- (void)_createWeekViews;
- (void)_findCenteredWeekAndUpdateTitleIfNecessary;
- (void)_pulseCircle;
- (void)_refreshViewsAndUpdateToday;
- (void)_selectCellForDate:(id)a3;
- (void)_selectTodayCell;
- (void)dealloc;
- (void)loadView;
- (void)scrollToDate:(id)a3 animateIfPossible:(BOOL)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedCell:(id)a3;
- (void)setTopInset:(double)a3;
- (void)updateVisibleAccessoryViews;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)week:(id)a3 cellSelected:(id)a4;
@end

@implementation HKCalendarScrollViewController

- (HKCalendarScrollViewController)initWithSelectedDate:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKCalendarScrollViewController;
  v6 = [(HKCalendarScrollViewController *)&v17 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v6->_numberOfRows = 32;
    uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7->_numberOfRows];
    weekViews = v7->_weekViews;
    v7->_weekViews = (NSMutableArray *)v10;

    v7->_needsInitialOffset = 1;
    v12 = [HKDateCache alloc];
    v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v14 = [(HKDateCache *)v12 initWithCalendar:v13];
    dateCache = v7->_dateCache;
    v7->_dateCache = (HKDateCache *)v14;

    [(HKDateCache *)v7->_dateCache registerObserver:v7];
    v7->_topInset = 42.0;
    objc_storeStrong((id *)&v7->_initiallyCenteredDate, a3);
  }

  return v7;
}

- (HKCalendarScrollViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewController;
  return [(HKCalendarScrollViewController *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  [(HKDateCache *)self->_dateCache unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HKCalendarScrollViewController;
  [(HKCalendarScrollViewController *)&v3 dealloc];
}

- (UIScrollView)scrollView
{
  objc_super v4 = [(HKCalendarScrollViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKCalendarScrollViewController.m" lineNumber:59 description:@"Our view should be a UIScrollView. It's not and now I'm sad."];
  }
  return (UIScrollView *)[(HKCalendarScrollViewController *)self view];
}

- (void)_createWeekViews
{
  if (self->_numberOfRows)
  {
    unint64_t v3 = 0;
    do
    {
      objc_super v4 = [[HKMonthWeekView alloc] initWithDateCache:self->_dateCache displaysMonthTitle:1 displaysTopBorderLine:1];
      [(HKCalendarWeekView *)v4 setDelegate:self];
      id v5 = [(HKCalendarScrollViewController *)self scrollView];
      [v5 addSubview:v4];

      [(NSMutableArray *)self->_weekViews addObject:v4];
      ++v3;
    }
    while (v3 < self->_numberOfRows);
  }
}

- (void)_refreshViewsAndUpdateToday
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HKCalendarScrollViewController *)self _weekViewContainingTitleForThisMonth];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = self->_weekViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "reloadCells", (void)v14);
        [v9 setTitleHighlighted:v9 == v3];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(HKCalendarDayCell *)self->_selectedCell date];
  if (v10
    && (v11 = (void *)v10,
        calendar = self->_calendar,
        [(HKCalendarDayCell *)self->_selectedCell date],
        v13 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(calendar) = [(NSCalendar *)calendar isDateInYesterday:v13],
        v13,
        v11,
        (calendar & 1) == 0))
  {
    [(HKCalendarScrollViewController *)self setSelectedCell:self->_selectedCell];
  }
  else
  {
    [(HKCalendarScrollViewController *)self _selectTodayCell];
  }
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  [(HKCalendarScrollViewController *)self setView:v3];

  objc_super v4 = [(HKCalendarScrollViewController *)self scrollView];
  [v4 setDelegate:self];

  uint64_t v5 = [(HKCalendarScrollViewController *)self scrollView];
  [v5 setScrollsToTop:0];

  uint64_t v6 = [(HKCalendarScrollViewController *)self scrollView];
  [v6 setBounces:0];

  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v11 = [(HKCalendarScrollViewController *)self scrollView];
  objc_msgSend(v11, "setContentInset:", v7, v8, v9, v10);

  v12 = [(HKCalendarScrollViewController *)self scrollView];
  [v12 setShowsVerticalScrollIndicator:0];

  v13 = [(HKCalendarScrollViewController *)self scrollView];
  [v13 setShowsHorizontalScrollIndicator:0];

  double v14 = *MEMORY[0x1E4F1DB30];
  double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v16 = [(HKCalendarScrollViewController *)self scrollView];
  objc_msgSend(v16, "setContentSize:", v14, v15);

  [(HKCalendarScrollViewController *)self _createWeekViews];
}

- (void)viewWillLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HKCalendarScrollViewController;
  [(HKCalendarScrollViewController *)&v18 viewWillLayoutSubviews];
  if (self->_needsInitialOffset)
  {
    initiallyCenteredDate = self->_initiallyCenteredDate;
    if (initiallyCenteredDate)
    {
      objc_super v4 = initiallyCenteredDate;
    }
    else
    {
      objc_super v4 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v5 = v4;
    [(HKCalendarScrollViewController *)self _setWeekViewsToCenterDate:v4 forceUpdate:0];
    double v7 = v6;
    double v9 = v8;
    double v10 = [(HKCalendarScrollViewController *)self scrollView];
    v11 = [(HKCalendarScrollViewController *)self scrollView];
    [v11 bounds];
    double v13 = v12;
    [(HKCalendarScrollViewController *)self _heightOfAllWeekCells];
    objc_msgSend(v10, "setContentSize:", v13, v14);

    double v15 = [(HKCalendarScrollViewController *)self scrollView];
    objc_msgSend(v15, "setContentOffset:animated:", 0, v7, v9);

    if (!self->_selectedCell) {
      [(HKCalendarScrollViewController *)self _selectCellForDate:v5];
    }
    self->_needsInitialOffset = 0;
  }
  long long v16 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  long long v17 = [(HKCalendarScrollViewController *)self scrollView];
  [v17 setBackgroundColor:v16];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewController;
  [(HKCalendarScrollViewController *)&v4 viewDidAppear:a3];
  [(HKCalendarScrollViewController *)self updateVisibleAccessoryViews];
}

- (id)_weekViewForToday
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  objc_super v4 = [(HKCalendarScrollViewController *)self _weekForDate:v3];

  return v4;
}

- (id)_weekViewContainingTitleForThisMonth
{
  calendar = self->_calendar;
  objc_super v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [(NSCalendar *)calendar components:14 fromDate:v4];

  [v5 setDay:1];
  double v6 = [(NSCalendar *)self->_calendar dateFromComponents:v5];
  double v7 = [(HKCalendarScrollViewController *)self _weekForDate:v6];

  return v7;
}

- (void)_pulseCircle
{
  id v3 = [(HKCalendarScrollViewController *)self _weekViewForToday];
  objc_super v4 = [HKUITodayCirclePulseView alloc];
  [(HKMonthDayCell *)self->_selectedCell frame];
  uint64_t v5 = -[HKUITodayCirclePulseView initWithFrame:](v4, "initWithFrame:");
  [(HKCalendarDayCell *)self->_selectedCell dayDiameter];
  -[HKUITodayCirclePulseView setCircleDiameter:](v5, "setCircleDiameter:");
  double v6 = [(HKCalendarDayCell *)self->_selectedCell dayLabel];
  double v7 = [v6 contents];
  [(HKUITodayCirclePulseView *)v5 setDayLabelContent:v7];

  [v3 addSubview:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__HKCalendarScrollViewController__pulseCircle__block_invoke;
  v9[3] = &unk_1E6D50ED8;
  double v10 = v5;
  double v8 = v5;
  [(HKUITodayCirclePulseView *)v8 pulse:v9];
}

uint64_t __46__HKCalendarScrollViewController__pulseCircle__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_selectTodayCell
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKCalendarDayCell *)self->_selectedCell date];
  if (v3
    && (objc_super v4 = (void *)v3,
        uint64_t v5 = self->_dateCache,
        [(HKCalendarDayCell *)self->_selectedCell date],
        double v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = [(HKDateCache *)v5 isDateInToday:v6],
        v6,
        v4,
        v5))
  {
    [(HKCalendarScrollViewController *)self _pulseCircle];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v7 = self->_weekViews;
    uint64_t v22 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v22)
    {
      uint64_t v8 = *(void *)v30;
      v24 = v7;
      uint64_t v21 = *(void *)v30;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v23 = v9;
          double v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          v11 = objc_msgSend(v10, "dayCells", v21);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v26;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v26 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                uint64_t v17 = [v16 date];
                if (v17)
                {
                  objc_super v18 = (void *)v17;
                  dateCache = self->_dateCache;
                  v20 = [v16 date];
                  LOBYTE(dateCache) = [(HKDateCache *)dateCache isDateInToday:v20];

                  if (dateCache)
                  {
                    [(HKCalendarScrollViewController *)self setSelectedCell:v16];

                    double v7 = v24;
                    goto LABEL_24;
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v23 + 1;
          double v7 = v24;
          uint64_t v8 = v21;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v22);
    }
LABEL_24:
  }
}

- (void)_selectCellForDate:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HKCalendarDayCell *)self->_selectedCell date];
  unint64_t v6 = 0x1E4F1C000uLL;
  if (!v5) {
    goto LABEL_3;
  }
  double v7 = (void *)v5;
  uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v9 = [(HKCalendarDayCell *)self->_selectedCell date];
  uint64_t v10 = [v8 compareDate:v9 toDate:v4 toUnitGranularity:16];

  if (v10)
  {
LABEL_3:
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v11 = self->_weekViews;
    uint64_t v29 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v29)
    {
      uint64_t v12 = *(void *)v38;
      uint64_t v27 = *(void *)v38;
      long long v28 = self;
      long long v31 = v11;
      id v32 = v4;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v30 = v13;
          uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          double v15 = objc_msgSend(v14, "dayCells", v27);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v34;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v34 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                uint64_t v21 = [v20 date];
                if (v21)
                {
                  uint64_t v22 = (void *)v21;
                  [*(id *)(v6 + 2472) currentCalendar];
                  v24 = unint64_t v23 = v6;
                  long long v25 = [v20 date];
                  uint64_t v26 = [v24 compareDate:v25 toDate:v32 toUnitGranularity:16];

                  unint64_t v6 = v23;
                  if (!v26)
                  {
                    [(HKCalendarScrollViewController *)v28 setSelectedCell:v20];

                    v11 = v31;
                    id v4 = v32;
                    goto LABEL_21;
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v13 = v30 + 1;
          v11 = v31;
          id v4 = v32;
          uint64_t v12 = v27;
        }
        while (v30 + 1 != v29);
        uint64_t v29 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v29);
    }
LABEL_21:
  }
}

- (void)setSelectedCell:(id)a3
{
  id v4 = (HKMonthDayCell *)a3;
  [(HKMonthDayCell *)self->_selectedCell setSelected:0];
  [(HKMonthDayCell *)v4 setSelected:1];
  selectedCell = self->_selectedCell;
  self->_selectedCell = v4;
}

- (double)_heightOfAllWeekCells
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_weekViews;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "frame", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)_startDateToTileWeekViews:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setWeekOfYear:-(uint64_t)(double)((self->_numberOfRows >> 1) - 1)];
  double v7 = [(NSCalendar *)self->_calendar dateByAddingComponents:v6 toDate:v5 options:0];

  double v8 = [(NSCalendar *)self->_calendar hk_startOfWeekWithFirstWeekday:[(NSCalendar *)self->_calendar firstWeekday] beforeDate:v7 addingWeeks:0];

  return v8;
}

- (CGPoint)_centerPointToCenterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HKCalendarScrollViewController *)self _weekForDate:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 frameForDayCell:v4];
    double v8 = v7;
    double v10 = v9;
    [v6 frame];
    double v12 = v8 + v11;
    long long v13 = [(HKCalendarScrollViewController *)self view];
    [v13 safeAreaInsets];
    double v15 = v14;

    uint64_t v16 = [(HKCalendarScrollViewController *)self scrollView];
    [v16 frame];
    double v18 = v15 + round((v17 - v15) * 0.5);

    double v19 = v10 * 0.5 + v12 - v18;
    double v20 = 0.0;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v21 = v20;
  double v22 = v19;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)_setWeekViewsToCenterDate:(id)a3 forceUpdate:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(HKCalendarScrollViewController *)self _currentlyCenteredVisibleWeek];
  double v8 = v7;
  if (v7 && [v7 containsDate:v6] && !a4)
  {
    double v9 = [(HKCalendarScrollViewController *)self scrollView];
    [v9 contentOffset];
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v9 = [(HKCalendarScrollViewController *)self _startDateToTileWeekViews:v6];
    double v14 = [(HKCalendarDayCell *)self->_selectedCell date];
    if (self->_numberOfRows)
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = [(NSMutableArray *)self->_weekViews objectAtIndex:v15];
        double v17 = [(NSCalendar *)self->_calendar dateByAddingUnit:0x2000 value:v15 toDate:v9 options:0];
        [v16 setMonthWeekStart:v17];

        if ([v16 containsDate:v14])
        {
          double v18 = [v16 cellMatchingDate:v14];
          [(HKCalendarScrollViewController *)self setSelectedCell:v18];
        }
        if (v15)
        {
          double v19 = [(NSMutableArray *)self->_weekViews objectAtIndexedSubscript:v15 - 1];
          [v19 frame];
          double MaxY = CGRectGetMaxY(v31);
        }
        else
        {
          double MaxY = 0.0;
        }
        double v21 = [(HKCalendarScrollViewController *)self view];
        [v21 bounds];
        double v23 = v22;
        [v16 preferredHeight];
        objc_msgSend(v16, "setFrame:", 0.0, MaxY, v23, v24);

        [v16 setTitleHighlighted:0];
        ++v15;
      }
      while (v15 < self->_numberOfRows);
    }
    long long v25 = [(HKCalendarScrollViewController *)self _weekViewContainingTitleForThisMonth];
    [v25 setTitleHighlighted:1];

    [(HKCalendarScrollViewController *)self _centerPointToCenterDate:v6];
    double v11 = v26;
    double v13 = v27;
  }
  double v28 = v11;
  double v29 = v13;
  result.y = v29;
  result.x = v28;
  return result;
}

- (id)_weekForDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_weekViews;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsDate:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)_visibleContentRect
{
  uint64_t v3 = [(HKCalendarScrollViewController *)self viewIfLoaded];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];

  if (v5)
  {
    id v6 = [v5 statusBarManager];
    [v6 statusBarFrame];
    double v8 = v7;

    double v9 = [(HKCalendarScrollViewController *)self view];
    [v9 safeAreaInsets];
    double v11 = v8 + v10;

    long long v12 = [(HKCalendarScrollViewController *)self scrollView];
    [v12 contentOffset];
    double v14 = v11 + v13;

    unint64_t v15 = [(HKCalendarScrollViewController *)self scrollView];
    [v15 frame];
    double v17 = v16 - v11;

    double v18 = [(HKCalendarScrollViewController *)self scrollView];
    [v18 frame];
    double v20 = v19;
    double v21 = [(HKCalendarScrollViewController *)self scrollView];
    [v21 frame];
    double v23 = v22;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v24 = v20;
  double v25 = v14;
  double v26 = v23;
  double v27 = v17;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)_currentlyCenteredVisibleWeek
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HKCalendarScrollViewController *)self _firstVisibleWeekIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    unint64_t v5 = v3;
    uint64_t v6 = [(NSMutableArray *)self->_weekViews count];
    double v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v5, v6 - v5);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v8 = -[NSMutableArray objectsAtIndexes:](self->_weekViews, "objectsAtIndexes:", v7, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          double v14 = [(HKCalendarScrollViewController *)self scrollView];
          [v13 frame];
          double v16 = v15;
          double v18 = v17;
          double v19 = [(HKCalendarScrollViewController *)self view];
          objc_msgSend(v14, "convertPoint:toView:", v19, v16, v18);
          double v21 = v20;

          [v13 frame];
          double v23 = v21 + v22;
          double v24 = [(HKCalendarScrollViewController *)self scrollView];
          [v24 frame];
          double v26 = floor(v25 * 0.5);

          if (v23 > v26)
          {
            id v4 = v13;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v4 = 0;
LABEL_13:
  }
  double v27 = [v4 currentWeekStartDate];
  if (v27) {
    double v28 = v4;
  }
  else {
    double v28 = 0;
  }
  id v29 = v28;

  return v29;
}

- (unint64_t)_firstVisibleWeekIndex
{
  [(HKCalendarScrollViewController *)self _visibleContentRect];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  weekViews = self->_weekViews;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HKCalendarScrollViewController__firstVisibleWeekIndex__block_invoke;
  v10[3] = &unk_1E6D52C78;
  v10[5] = v4;
  v10[6] = v5;
  v10[7] = v6;
  v10[8] = v7;
  v10[4] = &v11;
  [(NSMutableArray *)weekViews enumerateObjectsUsingBlock:v10];
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __56__HKCalendarScrollViewController__firstVisibleWeekIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 frame];
  if (CGRectGetMinY(v7) > *(double *)(a1 + 48))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)scrollToDate:(id)a3 animateIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  uint64_t v6 = [(HKCalendarScrollViewController *)self scrollView];
  if ([v6 isTracking])
  {
  }
  else
  {
    CGRect v7 = [(HKCalendarScrollViewController *)self scrollView];
    int v8 = [v7 isDecelerating];

    if (!v8) {
      goto LABEL_5;
    }
  }
  uint64_t v9 = [(HKCalendarScrollViewController *)self scrollView];
  [v9 stopScrollingAndZooming];

LABEL_5:
  uint64_t v10 = [(HKCalendarScrollViewController *)self _currentlyCenteredVisibleWeek];
  if ([v10 containsDate:v15]) {
    goto LABEL_12;
  }
  uint64_t v11 = [v10 currentWeekStartDate];
  [v11 timeIntervalSinceDate:v15];
  uint64_t v13 = (uint64_t)(v12 / (double)(unint64_t)(*MEMORY[0x1E4F29998] * *MEMORY[0x1E4F296E8]));

  if (v13 < 0) {
    uint64_t v13 = -v13;
  }
  uint64_t v14 = [(HKCalendarScrollViewController *)self scrollView];
  if ((unint64_t)v13 < 0x11)
  {
    [(HKCalendarScrollViewController *)self _centerPointToCenterDate:v15];
    objc_msgSend(v14, "setContentOffset:animated:", v4);

    if (v4) {
      goto LABEL_12;
    }
  }
  else
  {
    [(HKCalendarScrollViewController *)self _setWeekViewsToCenterDate:v15 forceUpdate:0];
    objc_msgSend(v14, "setContentOffset:animated:", 0);
  }
  [(HKCalendarScrollViewController *)self updateVisibleAccessoryViews];
LABEL_12:
  [(HKCalendarScrollViewController *)self _selectCellForDate:v15];
}

- (void)week:(id)a3 cellSelected:(id)a4
{
  id v5 = a4;
  [(HKCalendarScrollViewController *)self setSelectedCell:v5];
  id v7 = [(HKCalendarScrollViewController *)self delegate];
  uint64_t v6 = [v5 date];

  [v7 calendarScrollViewController:self didSelectDate:v6];
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_weekViews count])
  {
    [v4 contentOffset];
    if (v5 < 150.0
      || (v6 = v5, [v4 contentSize], double v8 = v7, objc_msgSend(v4, "frame"), v6 > v8 - v9 + -150.0))
    {
      uint64_t v10 = [(HKCalendarScrollViewController *)self _currentlyCenteredVisibleWeek];
      if (!v10)
      {
        uint64_t v10 = [(NSMutableArray *)self->_weekViews lastObject];
      }
      uint64_t v11 = [v10 currentWeekStartDate];

      if (v11)
      {
        double v12 = [v10 currentWeekStartDate];
        uint64_t v13 = [(HKCalendarScrollViewController *)self view];
        uint64_t v14 = [v13 superview];
        [v10 frame];
        objc_msgSend(v14, "convertPoint:fromView:", v4);

        [(HKCalendarScrollViewController *)self _setWeekViewsToCenterDate:v12 forceUpdate:1];
        objc_msgSend(v4, "setContentOffset:");
        id v15 = [(HKCalendarScrollViewController *)self _weekForDate:v12];
        double v16 = [(HKCalendarScrollViewController *)self view];
        double v17 = [v16 superview];
        [v15 frame];
        objc_msgSend(v17, "convertPoint:fromView:", v4);

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        double v18 = self->_weekViews;
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v18);
              }
              double v23 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              objc_msgSend(v23, "center", (void)v24);
              objc_msgSend(v23, "setCenter:");
            }
            uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v20);
        }
      }
    }
    [(HKCalendarScrollViewController *)self _findCenteredWeekAndUpdateTitleIfNecessary];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(HKCalendarScrollViewController *)self updateVisibleAccessoryViews];
  }
}

- (void)updateVisibleAccessoryViews
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HKCalendarScrollViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(HKCalendarScrollViewController *)self scrollView];
    [v5 contentOffset];
    CGFloat v7 = v6;
    double v8 = [(HKCalendarScrollViewController *)self scrollView];
    [v8 contentOffset];
    CGFloat v10 = v9;
    uint64_t v11 = [(HKCalendarScrollViewController *)self scrollView];
    [v11 frame];
    CGFloat v13 = v12;
    uint64_t v14 = [(HKCalendarScrollViewController *)self scrollView];
    [v14 frame];
    CGFloat v16 = v15;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v17 = self->_weekViews;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v45;
      long long v34 = v39;
      uint64_t v36 = v17;
      long long v37 = self;
      uint64_t v35 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ((objc_msgSend(v22, "accessoryContentsFetched", v34) & 1) == 0)
          {
            [v22 bounds];
            if (!CGRectIsEmpty(v51))
            {
              [v22 frame];
              v53.origin.x = v23;
              v53.origin.y = v24;
              v53.size.width = v25;
              v53.size.height = v26;
              v52.origin.x = v7;
              v52.origin.y = v10;
              v52.size.width = v13;
              v52.size.height = v16;
              if (CGRectIntersectsRect(v52, v53))
              {
                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v27 = [v22 accessoryViews];
                uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  uint64_t v30 = *(void *)v41;
                  do
                  {
                    for (uint64_t j = 0; j != v29; ++j)
                    {
                      if (*(void *)v41 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      long long v32 = [*(id *)(*((void *)&v40 + 1) + 8 * j) subviews];
                      [v32 makeObjectsPerformSelector:sel_removeFromSuperview];
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
                  }
                  while (v29);
                }

                [v22 setAccessoryContentsFetched:1];
                long long v33 = [v22 dayCells];
                v38[0] = MEMORY[0x1E4F143A8];
                v38[1] = 3221225472;
                v39[0] = __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke;
                v39[1] = &unk_1E6D52CC8;
                v39[2] = v37;
                v39[3] = v22;
                [v33 enumerateObjectsUsingBlock:v38];

                uint64_t v20 = v35;
                double v17 = v36;
              }
            }
          }
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v19);
    }
  }
}

void __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = [v5 date];

  if (v6)
  {
    CGFloat v7 = [*(id *)(a1 + 32) delegate];
    uint64_t v8 = *(void *)(a1 + 32);
    double v9 = [v5 date];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_2;
    v10[3] = &unk_1E6D52CA0;
    v10[4] = *(void *)(a1 + 40);
    v10[5] = a3;
    [v7 calendarScrollViewController:v8 accessoryViewForDate:v9 accessoryViewCompletion:v10];
  }
}

void __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) accessoryViews];
    id v5 = [v4 objectAtIndexedSubscript:*(void *)(a1 + 40)];

    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v3];
    double v6 = [v3 leadingAnchor];
    CGFloat v7 = [v5 leadingAnchor];
    uint64_t v8 = [v6 constraintEqualToAnchor:v7];
    [v8 setActive:1];

    double v9 = [v3 trailingAnchor];
    CGFloat v10 = [v5 trailingAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    double v12 = [v3 topAnchor];
    CGFloat v13 = [v5 topAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    double v15 = [v3 bottomAnchor];
    CGFloat v16 = [v5 bottomAnchor];
    double v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    [v3 setAlpha:0.0];
    uint64_t v18 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_3;
    v19[3] = &unk_1E6D50ED8;
    id v20 = v3;
    [v18 animateWithDuration:v19 animations:0.25];
  }
}

uint64_t __61__HKCalendarScrollViewController_updateVisibleAccessoryViews__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_findCenteredWeekAndUpdateTitleIfNecessary
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKCalendarScrollViewController *)self delegate];

  if (v3)
  {
    char v4 = [(HKCalendarScrollViewController *)self scrollView];
    [v4 bounds];
    double MidY = CGRectGetMidY(v38);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v6 = self->_weekViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
          double v12 = [(HKCalendarScrollViewController *)self scrollView];
          [v11 frame];
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          uint64_t v21 = [(HKCalendarScrollViewController *)self view];
          objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;

          v39.origin.x = v23;
          v39.origin.y = v25;
          v39.size.width = v27;
          v39.size.height = v29;
          if (CGRectGetMinY(v39) < MidY)
          {
            v40.origin.x = v23;
            v40.origin.y = v25;
            v40.size.width = v27;
            v40.size.height = v29;
            if (CGRectGetMaxY(v40) > MidY)
            {
              uint64_t v30 = [(HKCalendarScrollViewController *)self delegate];
              long long v31 = [v11 currentWeekStartDate];
              [v30 calendarScrollViewController:self didUpdateCenteredMonth:v31];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v8);
    }
  }
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (HKCalendarScrollViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKCalendarScrollViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_storeStrong((id *)&self->_initiallyCenteredDate, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
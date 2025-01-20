@interface _ActivityCurrentValueDataSource
- (BOOL)currentValueViewHasNoData;
- (HKInteractiveChartCurrentValueViewCallbacks)currentValueViewCallbacks;
- (UIView)noDataView;
- (_ActivityCurrentValueDataSource)initWithDisplayTypeController:(id)a3 unitController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 currentValueViewContext:(BOOL)a6 firstWeekday:(int64_t)a7 activityOptions:(unint64_t)a8 currentValueViewCallbacks:(id)a9 isChartSharingContext:(BOOL)a10;
- (id)_buildNoDataView;
- (id)_dateRangeFromComponents;
- (id)_dateRangeFromStartDate:(id)a3 endDate:(id)a4;
- (id)_localizedCurrentValueViewDateRange;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (void)setCurrentValueViewCallbacks:(id)a3;
- (void)setCurrentValueViewHasNoData:(BOOL)a3;
@end

@implementation _ActivityCurrentValueDataSource

- (_ActivityCurrentValueDataSource)initWithDisplayTypeController:(id)a3 unitController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 currentValueViewContext:(BOOL)a6 firstWeekday:(int64_t)a7 activityOptions:(unint64_t)a8 currentValueViewCallbacks:(id)a9 isChartSharingContext:(BOOL)a10
{
  BOOL v12 = a6;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)_ActivityCurrentValueDataSource;
  v18 = [(HKActivitySummaryAnnotationViewDataSource *)&v24 initWithDisplayTypeController:a3 unitController:a4 wheelchairUseCharacteristicCache:a5 dateCache:0 currentValueViewContext:v12 activityOptions:a8 firstWeekday:a7 isChartSharingContext:a10];
  v19 = v18;
  if (v18)
  {
    [(_ActivityCurrentValueDataSource *)v18 setCurrentValueViewCallbacks:v17];
    uint64_t v20 = [(_ActivityCurrentValueDataSource *)v19 _buildNoDataView];
    noDataView = v19->_noDataView;
    v19->_noDataView = (UIView *)v20;
  }
  return v19;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  if ([(_ActivityCurrentValueDataSource *)self currentValueViewHasNoData])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_ActivityCurrentValueDataSource;
    v5 = [(HKActivitySummaryAnnotationViewDataSource *)&v7 leftMarginViewWithOrientation:a3];
  }
  return v5;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  id v4 = a3;
  if ([(_ActivityCurrentValueDataSource *)self currentValueViewHasNoData])
  {
    int64_t v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_ActivityCurrentValueDataSource;
    int64_t v5 = [(HKActivitySummaryAnnotationViewDataSource *)&v7 numberOfValuesForAnnotationView:v4];
  }

  return v5;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  if ([(_ActivityCurrentValueDataSource *)self currentValueViewHasNoData])
  {
    objc_super v7 = [(_ActivityCurrentValueDataSource *)self noDataView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_ActivityCurrentValueDataSource;
    objc_super v7 = [(HKActivitySummaryAnnotationViewDataSource *)&v9 valueViewForColumnAtIndex:a3 orientation:a4];
  }
  return v7;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  v3 = [(_ActivityCurrentValueDataSource *)self _localizedCurrentValueViewDateRange];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  int64_t v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueDateFont");
  [v4 setFont:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  [v4 setTextColor:v6];

  [v4 setText:v3];
  [v4 setAdjustsFontSizeToFitWidth:1];

  return v4;
}

- (id)_buildNoDataView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
  [v2 setFont:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  [v2 setTextColor:v4];

  int64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:@"CHART_NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v2 setText:v6];

  return v2;
}

- (id)_localizedCurrentValueViewDateRange
{
  v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  uint64_t v4 = [v3 _startDate];
  if (v4)
  {
    int64_t v5 = (void *)v4;
    v6 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
    objc_super v7 = [v6 _endDate];

    if (v7)
    {
      v8 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
      objc_super v9 = [v8 _startDate];
      v10 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
      v11 = [v10 _endDate];
      BOOL v12 = [(_ActivityCurrentValueDataSource *)self _dateRangeFromStartDate:v9 endDate:v11];

      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v12 = [(_ActivityCurrentValueDataSource *)self _dateRangeFromComponents];
LABEL_6:
  return v12;
}

- (id)_dateRangeFromStartDate:(id)a3 endDate:(id)a4
{
  int64_t v5 = +[HKValueRange valueRangeWithMinValue:a3 maxValue:a4];
  v6 = [(_ActivityCurrentValueDataSource *)self currentValueViewCallbacks];
  objc_super v7 = objc_msgSend(v6, "stringForValueRange:timeScope:", v5, -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope"));

  return v7;
}

- (id)_dateRangeFromComponents
{
  v3 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
  uint64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  int64_t v5 = [v4 _gregorianDateComponents];
  v6 = [v3 dateFromComponents:v5];

  switch([(HKActivitySummaryAnnotationViewDataSource *)self timeScope])
  {
    case 0:
      [v3 dateByAddingUnit:4 value:10 toDate:v6 options:0];

      goto LABEL_4;
    case 1:
LABEL_4:
      objc_super v7 = v3;
      uint64_t v8 = 4;
      uint64_t v9 = 5;
      goto LABEL_10;
    case 2:
      objc_super v7 = v3;
      uint64_t v8 = 4;
      goto LABEL_9;
    case 3:
      objc_super v7 = v3;
      uint64_t v8 = 0x2000;
      uint64_t v9 = 26;
      goto LABEL_10;
    case 4:
    case 5:
      objc_super v7 = v3;
      uint64_t v8 = 8;
      goto LABEL_9;
    case 6:
      objc_super v7 = v3;
      uint64_t v8 = 16;
      goto LABEL_9;
    case 7:
      objc_super v7 = v3;
      uint64_t v8 = 32;
LABEL_9:
      uint64_t v9 = 1;
LABEL_10:
      v10 = [v7 dateByAddingUnit:v8 value:v9 toDate:v6 options:0];
      if (!v10) {
        goto LABEL_12;
      }
      v11 = [(_ActivityCurrentValueDataSource *)self _dateRangeFromStartDate:v6 endDate:v10];

      break;
    default:
LABEL_12:
      v11 = @"Unknown Date";
      break;
  }

  return v11;
}

- (HKInteractiveChartCurrentValueViewCallbacks)currentValueViewCallbacks
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentValueViewCallbacks);
  return (HKInteractiveChartCurrentValueViewCallbacks *)WeakRetained;
}

- (void)setCurrentValueViewCallbacks:(id)a3
{
}

- (BOOL)currentValueViewHasNoData
{
  return self->_currentValueViewHasNoData;
}

- (void)setCurrentValueViewHasNoData:(BOOL)a3
{
  self->_currentValueViewHasNoData = a3;
}

- (UIView)noDataView
{
  return self->_noDataView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataView, 0);
  objc_destroyWeak((id *)&self->_currentValueViewCallbacks);
}

@end
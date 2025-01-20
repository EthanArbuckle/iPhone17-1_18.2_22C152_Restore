@interface _ActivityCurrentValueView
- (BOOL)_summaryOutsideRanges:(id)a3 summary:(id)a4;
- (BOOL)isChartSharingContext;
- (HKActivitySummaryDataProvider)activitySummaryDataProvider;
- (HKInteractiveChartAnnotationView)annotationView;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (_ActivityCurrentValueDataSource)currentValueDataSource;
- (_ActivityCurrentValueView)initWithDisplayTypeController:(id)a3 unitPreferenceController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 currentValueViewCallbacks:(id)a6 activitySummaryDataProvider:(id)a7 activityOptions:(unint64_t)a8 firstWeekday:(int64_t)a9 isChartSharingContext:(BOOL)a10;
- (id)_computeMultiDayVisibleSummaryForGraphView:(id)a3 timeScope:(int64_t)a4 filterDateIntervals:(id)a5;
- (id)_computeSingleDayVisibleSummaryForGraphView:(id)a3 filterDateIntervals:(id)a4;
- (id)computeVisibleSummaryForGraphView:(id)a3 timeScope:(int64_t)a4 filterDateIntervals:(id)a5;
- (void)layoutSubviews;
- (void)setActivitySummaryDataProvider:(id)a3;
- (void)setCurrentValueDataSource:(id)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)updateWithGraphView:(id)a3 timeScope:(int64_t)a4;
@end

@implementation _ActivityCurrentValueView

- (_ActivityCurrentValueView)initWithDisplayTypeController:(id)a3 unitPreferenceController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 currentValueViewCallbacks:(id)a6 activitySummaryDataProvider:(id)a7 activityOptions:(unint64_t)a8 firstWeekday:(int64_t)a9 isChartSharingContext:(BOOL)a10
{
  id v27 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_ActivityCurrentValueView;
  v20 = -[_ActivityCurrentValueView initWithFrame:](&v28, sel_initWithFrame_, 0.0, 0.0, 320.0, 48.0);
  if (v20)
  {
    v21 = [[HKInteractiveChartAnnotationView alloc] initWithContext:2];
    annotationView = v20->_annotationView;
    v20->_annotationView = v21;

    LOBYTE(v26) = a10;
    v23 = [[_ActivityCurrentValueDataSource alloc] initWithDisplayTypeController:v27 unitController:v16 wheelchairUseCharacteristicCache:v17 currentValueViewContext:1 firstWeekday:a9 activityOptions:a8 currentValueViewCallbacks:v18 isChartSharingContext:v26];
    currentValueDataSource = v20->_currentValueDataSource;
    v20->_currentValueDataSource = v23;

    [(HKInteractiveChartAnnotationView *)v20->_annotationView setDataSource:v20->_currentValueDataSource];
    [(_ActivityCurrentValueView *)v20 addSubview:v20->_annotationView];
    objc_storeStrong((id *)&v20->_activitySummaryDataProvider, a7);
    [(HKInteractiveChartAnnotationView *)v20->_annotationView setTranslatesAutoresizingMaskIntoConstraints:1];
    v20->_isChartSharingContext = a10;
    [(_ActivityCurrentValueView *)v20 setPreservesSuperviewLayoutMargins:1];
  }

  return v20;
}

- (void)updateWithGraphView:(id)a3 timeScope:(int64_t)a4
{
  id v12 = [(_ActivityCurrentValueView *)self computeVisibleSummaryForGraphView:a3 timeScope:a4 filterDateIntervals:MEMORY[0x1E4F1CBF0]];
  v5 = [v12 summaryResult];
  v6 = [(_ActivityCurrentValueView *)self currentValueDataSource];
  [v6 setActivitySummary:v5];

  uint64_t v7 = [v12 timeScope];
  v8 = [(_ActivityCurrentValueView *)self currentValueDataSource];
  [v8 setTimeScope:v7];

  uint64_t v9 = [v12 hasNoData];
  v10 = [(_ActivityCurrentValueView *)self currentValueDataSource];
  [v10 setCurrentValueViewHasNoData:v9];

  v11 = [(_ActivityCurrentValueView *)self annotationView];
  [v11 reloadData];

  [(_ActivityCurrentValueView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)_ActivityCurrentValueView;
  [(_ActivityCurrentValueView *)&v14 layoutSubviews];
  [(_ActivityCurrentValueView *)self layoutMargins];
  double v4 = v3 + -10.0;
  v5 = [(_ActivityCurrentValueView *)self annotationView];
  [v5 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;

  [(_ActivityCurrentValueView *)self bounds];
  double v12 = (v11 - v9) * 0.5;
  if (v10 + v4 * -2.0 < v7) {
    double v7 = v10 + v4 * -2.0;
  }
  v13 = [(_ActivityCurrentValueView *)self annotationView];
  objc_msgSend(v13, "setFrame:", v4, v12, v7, v9);
}

- (id)computeVisibleSummaryForGraphView:(id)a3 timeScope:(int64_t)a4 filterDateIntervals:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)a4 < 6)
  {
    uint64_t v10 = [(_ActivityCurrentValueView *)self _computeMultiDayVisibleSummaryForGraphView:v8 timeScope:a4 filterDateIntervals:v9];
LABEL_3:
    double v11 = (void *)v10;
    goto LABEL_4;
  }
  if (a4 == 6)
  {
    uint64_t v10 = [(_ActivityCurrentValueView *)self _computeSingleDayVisibleSummaryForGraphView:v8 filterDateIntervals:v9];
    goto LABEL_3;
  }
  double v11 = 0;
LABEL_4:

  return v11;
}

- (id)_computeMultiDayVisibleSummaryForGraphView:(id)a3 timeScope:(int64_t)a4 filterDateIntervals:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [[_ActivityCurrentValueSummary alloc] initWithTimeScope:a4];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__20;
  v26[4] = __Block_byref_object_dispose__20;
  id v27 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  double v11 = +[HKInteractiveChartActivityController firstActivitySeriesForGraphView:v8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102___ActivityCurrentValueView__computeMultiDayVisibleSummaryForGraphView_timeScope_filterDateIntervals___block_invoke;
  v17[3] = &unk_1E6D55B40;
  v17[4] = self;
  id v12 = v9;
  id v18 = v12;
  v20 = v26;
  v13 = v10;
  id v19 = v13;
  v21 = &v22;
  [v8 enumerateVisibleCoordinatesForSeries:v11 block:v17];
  [(_ActivityCurrentValueSummary *)v13 finishCollatingSummaryWithGraphView:v8];
  objc_super v14 = [_ActivitySummaryForCollection alloc];
  v15 = [(_ActivitySummaryForCollection *)v14 initWithActivitySummary:v13 timeScope:a4 hasNoData:v23[3] == 0];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

  return v15;
}

- (BOOL)_summaryOutsideRanges:(id)a3 summary:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    double v7 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    id v8 = [v6 dateComponentsForCalendar:v7];
    id v9 = [v7 dateFromComponents:v8];

    uint64_t v10 = [v7 startOfDayForDate:v9];
    BOOL v11 = 1;
    id v12 = objc_msgSend(v7, "hk_startOfDateByAddingDays:toDate:", 1, v10);
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v12];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v20 = v10;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if ([*(id *)(*((void *)&v21 + 1) + 8 * i) intersectsDateInterval:v13])
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      BOOL v11 = 1;
LABEL_12:
      uint64_t v10 = v20;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_computeSingleDayVisibleSummaryForGraphView:(id)a3 filterDateIntervals:(id)a4
{
  id v6 = a4;
  double v7 = [a3 effectiveVisibleRangeCadence];
  id v8 = [(_ActivityCurrentValueView *)self activitySummaryDataProvider];
  id v9 = [v8 activitySummariesForDateRange:v7 timeScope:5];

  uint64_t v10 = [v9 firstObject];
  if (v10
    && ![(_ActivityCurrentValueView *)self _summaryOutsideRanges:v6 summary:v10])
  {
    uint64_t v14 = 0;
  }
  else
  {
    BOOL v11 = [[_ActivityCurrentValueSummary alloc] initWithTimeScope:6];

    id v12 = [v7 startDate];
    [(_ActivityCurrentValueSummary *)v11 _setStartDate:v12];

    v13 = [v7 endDate];
    [(_ActivityCurrentValueSummary *)v11 _setEndDate:v13];

    uint64_t v14 = 1;
    uint64_t v10 = v11;
  }
  uint64_t v15 = [[_ActivitySummaryForCollection alloc] initWithActivitySummary:v10 timeScope:6 hasNoData:v14];

  return v15;
}

- (HKInteractiveChartAnnotationView)annotationView
{
  return self->_annotationView;
}

- (_ActivityCurrentValueDataSource)currentValueDataSource
{
  return self->_currentValueDataSource;
}

- (void)setCurrentValueDataSource:(id)a3
{
}

- (HKActivitySummaryDataProvider)activitySummaryDataProvider
{
  return self->_activitySummaryDataProvider;
}

- (void)setActivitySummaryDataProvider:(id)a3
{
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (BOOL)isChartSharingContext
{
  return self->_isChartSharingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_activitySummaryDataProvider, 0);
  objc_storeStrong((id *)&self->_currentValueDataSource, 0);
  objc_storeStrong((id *)&self->_annotationView, 0);
}

@end
@interface HKInteractiveChartAnnotationViewDataSource
- (BOOL)_isMultiSelectionDateRange;
- (BOOL)showSeparators;
- (HKCurrentValueViewDataSourceDelegate)currentValueViewDataSourceDelegate;
- (HKInteractiveChartAnnotationViewDataSource)initWithSelectedRangeFormatter:(id)a3 firstWeekday:(int64_t)a4 currentValueViewDataSourceDelegate:(id)a5;
- (HKSelectedRangeFormatter)selectedRangeFormatter;
- (HKValueRange)lastDateRange;
- (NSArray)annotationLabels;
- (NSString)lastCombinedDateString;
- (NSString)lastLowerDateString;
- (NSString)lastUpperDateString;
- (UIFont)majorFont;
- (UIFont)minorFont;
- (UILabel)mainDateLabel;
- (id)_dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4;
- (id)_weeksContainingDateRange:(id)a3;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)firstWeekday;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (void)_buildDateLabels;
- (void)_updateDateTextWithTimeScope:(int64_t)a3 resolution:(int64_t)a4;
- (void)setAnnotationLabels:(id)a3;
- (void)setCurrentValueViewDataSourceDelegate:(id)a3;
- (void)setFirstWeekday:(int64_t)a3;
- (void)setLastCombinedDateString:(id)a3;
- (void)setLastDateRange:(id)a3;
- (void)setLastLowerDateString:(id)a3;
- (void)setLastUpperDateString:(id)a3;
- (void)setMainDateLabel:(id)a3;
- (void)setMajorFont:(id)a3;
- (void)setMinorFont:(id)a3;
- (void)updateWithSelectionContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 healthStore:(id)a7 viewController:(id)a8;
@end

@implementation HKInteractiveChartAnnotationViewDataSource

- (HKInteractiveChartAnnotationViewDataSource)initWithSelectedRangeFormatter:(id)a3 firstWeekday:(int64_t)a4 currentValueViewDataSourceDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKInteractiveChartAnnotationViewDataSource;
  v11 = [(HKInteractiveChartAnnotationViewDataSource *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_selectedRangeFormatter, a3);
    v12->_firstWeekday = a4;
    objc_storeWeak((id *)&v12->_currentValueViewDataSourceDelegate, v10);
    v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueValueFont");
    [(HKInteractiveChartAnnotationViewDataSource *)v12 setMajorFont:v13];

    v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueUnitFont");
    [(HKInteractiveChartAnnotationViewDataSource *)v12 setMinorFont:v14];

    [(HKInteractiveChartAnnotationViewDataSource *)v12 _buildDateLabels];
  }

  return v12;
}

- (void)_buildDateLabels
{
  objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKInteractiveChartAnnotationViewDataSource *)self setMainDateLabel:v3];

  v4 = [(HKInteractiveChartAnnotationViewDataSource *)self mainDateLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueDateFont");
  v6 = [(HKInteractiveChartAnnotationViewDataSource *)self mainDateLabel];
  [v6 setFont:v5];

  v7 = v10;
  if (!v10)
  {
    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
  }
  v8 = [(HKInteractiveChartAnnotationViewDataSource *)self mainDateLabel];
  [v8 setTextColor:v7];

  if (!v10) {
  id v9 = [(HKInteractiveChartAnnotationViewDataSource *)self mainDateLabel];
  }
  [v9 setBaselineAdjustment:1];
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  v5 = [(HKInteractiveChartAnnotationViewDataSource *)self lastCombinedDateString];
  v6 = [(HKInteractiveChartAnnotationViewDataSource *)self mainDateLabel];
  [v6 setText:v5];

  if (!a3)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKInteractiveChartAnnotationViewDataSource dateViewWithOrientation:](v7);
    }
  }
  v8 = [(HKInteractiveChartAnnotationViewDataSource *)self mainDateLabel];
  return v8;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (void)_updateDateTextWithTimeScope:(int64_t)a3 resolution:(int64_t)a4
{
  if ([(HKInteractiveChartAnnotationViewDataSource *)self _isMultiSelectionDateRange])
  {
    v7 = [(HKInteractiveChartAnnotationViewDataSource *)self currentValueViewDataSourceDelegate];
    v8 = [(HKInteractiveChartAnnotationViewDataSource *)self lastDateRange];
    id v18 = [v7 stringForValueRange:v8 timeScope:a3];

    [(HKInteractiveChartAnnotationViewDataSource *)self setLastUpperDateString:v18];
    [(HKInteractiveChartAnnotationViewDataSource *)self setLastLowerDateString:0];
    [(HKInteractiveChartAnnotationViewDataSource *)self setLastCombinedDateString:v18];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    id v10 = [(HKInteractiveChartAnnotationViewDataSource *)self lastDateRange];
    v11 = [v10 startDate];
    id v18 = [v9 components:126 fromDate:v11];

    v12 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    v13 = HKUpperStringForAnnotationDateWithTimeScope((uint64_t)v18, v12, a3);
    [(HKInteractiveChartAnnotationViewDataSource *)self setLastUpperDateString:v13];

    v14 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    v15 = HKLowerStringForAnnotationDateWithTimeScope((uint64_t)v18, v14, a3);
    [(HKInteractiveChartAnnotationViewDataSource *)self setLastLowerDateString:v15];

    objc_super v16 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    v17 = HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v18, v16, a3, a4);
    [(HKInteractiveChartAnnotationViewDataSource *)self setLastCombinedDateString:v17];
  }
}

- (BOOL)_isMultiSelectionDateRange
{
  id v3 = [(HKInteractiveChartAnnotationViewDataSource *)self lastDateRange];
  if (v3)
  {
    v4 = [(HKInteractiveChartAnnotationViewDataSource *)self lastDateRange];
    v5 = [v4 startDate];
    v6 = [(HKInteractiveChartAnnotationViewDataSource *)self lastDateRange];
    v7 = [v6 endDate];
    char v8 = objc_msgSend(v5, "hk_isBeforeDate:", v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  return [(NSArray *)self->_annotationLabels count];
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  v5 = [(NSArray *)self->_annotationLabels objectAtIndexedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = v6;
    if (a4)
    {
      if (a4 != 1)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = 1;
    }
    [v6 setAxis:v8];
    goto LABEL_7;
  }
LABEL_8:
  return v5;
}

- (BOOL)showSeparators
{
  return 0;
}

- (void)updateWithSelectionContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 healthStore:(id)a7 viewController:(id)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v45 = a7;
  id v44 = a8;
  v15 = [(HKInteractiveChartAnnotationViewDataSource *)self _dateRangeFromSelectionContext:v13 timeScope:a5];
  [(HKInteractiveChartAnnotationViewDataSource *)self setLastDateRange:v15];

  objc_super v16 = [(HKInteractiveChartAnnotationViewDataSource *)self selectedRangeFormatter];
  v41 = v13;
  v17 = [v13 userInfo];
  id v18 = [(HKInteractiveChartAnnotationViewDataSource *)self majorFont];
  v19 = [(HKInteractiveChartAnnotationViewDataSource *)self minorFont];
  v42 = v14;
  int64_t v39 = a5;
  v20 = [v16 selectedRangeDataWithCoordinateInfo:v17 majorFont:v18 minorFont:v19 displayType:v14 timeScope:a5 context:0];

  v21 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v20;
  uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    double v25 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(obj);
        }
        v30 = *(void **)(*((void *)&v49 + 1) + 8 * v29);
        v31 = [(HKInteractiveChartAnnotationViewDataSource *)self currentValueViewDataSourceDelegate];
        char v32 = objc_opt_respondsToSelector();

        if (v32)
        {
          v33 = [(HKInteractiveChartAnnotationViewDataSource *)self currentValueViewDataSourceDelegate];
          [v33 processSelectedRangeData:v30 displayType:v42];
        }
        v34 = -[HKInteractiveChartAnnotationViewKeyValueLabel initWithFrame:]([HKInteractiveChartAnnotationViewKeyValueLabel alloc], "initWithFrame:", v25, v26, v27, v28);
        v35 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v34 keyLabel];
        [v35 setSelectedRangeData:v30];

        v36 = [v30 titleTapOutBlock];

        if (v36)
        {
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __133__HKInteractiveChartAnnotationViewDataSource_updateWithSelectionContext_displayType_timeScope_resolution_healthStore_viewController___block_invoke;
          v46[3] = &unk_1E6D51318;
          v46[4] = v30;
          id v47 = v45;
          id v48 = v44;
          [(HKInteractiveChartAnnotationViewKeyValueLabel *)v34 setTapOutBlock:v46];
        }
        v37 = [(HKInteractiveChartAnnotationViewKeyValueLabel *)v34 valueLabel];
        v38 = [v30 attributedString];
        [v37 setAttributedText:v38];

        [v21 addObject:v34];
        ++v29;
      }
      while (v23 != v29);
      uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v23);
  }

  [(HKInteractiveChartAnnotationViewDataSource *)self setAnnotationLabels:v21];
  [(HKInteractiveChartAnnotationViewDataSource *)self _updateDateTextWithTimeScope:v39 resolution:a6];
}

void __133__HKInteractiveChartAnnotationViewDataSource_updateWithSelectionContext_displayType_timeScope_resolution_healthStore_viewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) titleTapOutBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)_dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HKInteractiveChartAnnotationViewDataSource *)self currentValueViewDataSourceDelegate];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || (-[HKInteractiveChartAnnotationViewDataSource currentValueViewDataSourceDelegate](self, "currentValueViewDataSourceDelegate"), id v9 = objc_claimAutoreleasedReturnValue(), [v9 dateRangeFromSelectionContext:v6 timeScope:a4], v10 = objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    if ((unint64_t)a4 > 8)
    {
      id v10 = 0;
    }
    else
    {
      [v6 selectedPointValueRange];
      if (a4 == 3) {
        v12 = {;
      }
        id v10 = [(HKInteractiveChartAnnotationViewDataSource *)self _weeksContainingDateRange:v12];
      }
      else {
        id v10 = {;
      }
      }
    }
  }

  return v10;
}

- (id)_weeksContainingDateRange:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "hk_gregorianCalendarWithLocalTimeZone");
  v7 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithValueRange:", v5);

  char v8 = objc_msgSend(v6, "hk_weeksContainingInterval:firstWeekday:", v7, -[HKInteractiveChartAnnotationViewDataSource firstWeekday](self, "firstWeekday"));

  id v9 = [v8 startDate];
  id v10 = [v8 endDate];
  v11 = +[HKValueRange valueRangeWithMinValue:v9 maxValue:v10];

  return v11;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (NSArray)annotationLabels
{
  return self->_annotationLabels;
}

- (void)setAnnotationLabels:(id)a3
{
}

- (int64_t)firstWeekday
{
  return self->_firstWeekday;
}

- (void)setFirstWeekday:(int64_t)a3
{
  self->_firstWeekday = a3;
}

- (HKValueRange)lastDateRange
{
  return (HKValueRange *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastDateRange:(id)a3
{
}

- (UILabel)mainDateLabel
{
  return self->_mainDateLabel;
}

- (void)setMainDateLabel:(id)a3
{
}

- (NSString)lastUpperDateString
{
  return self->_lastUpperDateString;
}

- (void)setLastUpperDateString:(id)a3
{
}

- (NSString)lastLowerDateString
{
  return self->_lastLowerDateString;
}

- (void)setLastLowerDateString:(id)a3
{
}

- (NSString)lastCombinedDateString
{
  return self->_lastCombinedDateString;
}

- (void)setLastCombinedDateString:(id)a3
{
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
}

- (HKCurrentValueViewDataSourceDelegate)currentValueViewDataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentValueViewDataSourceDelegate);
  return (HKCurrentValueViewDataSourceDelegate *)WeakRetained;
}

- (void)setCurrentValueViewDataSourceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentValueViewDataSourceDelegate);
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_lastCombinedDateString, 0);
  objc_storeStrong((id *)&self->_lastLowerDateString, 0);
  objc_storeStrong((id *)&self->_lastUpperDateString, 0);
  objc_storeStrong((id *)&self->_mainDateLabel, 0);
  objc_storeStrong((id *)&self->_lastDateRange, 0);
  objc_storeStrong((id *)&self->_annotationLabels, 0);
  objc_storeStrong((id *)&self->_selectedRangeFormatter, 0);
}

- (void)dateViewWithOrientation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "Date formatting in lollipop no longer supports column orientation", v1, 2u);
}

@end
@interface HKOverlayRoomTrendContext
+ (id)findInitialDateFromTrendModel:(id)a3;
+ (int64_t)findStartingTimeScopeFromTrendModel:(id)a3;
- (BOOL)_timeScopeHasTrendSpans:(int64_t)a3;
- (BOOL)_timeScopeMayHaveTrends:(int64_t)a3;
- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6;
- (BOOL)isEqual:(id)a3;
- (HKChartSummaryTrendModel)trendModel;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKGraphSeries)seriesForSelectedTrend;
- (HKInteractiveChartDisplayType)trendDisplayType;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlayRoomTrendContext)initWithBaseDisplayType:(id)a3 trendModel:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 overlayMode:(int64_t)a7;
- (id)_adjustTrendValueRange:(id)a3 timescope:(int64_t)a4 calendar:(id)a5;
- (id)_buildAnnotatedHorizontalLineSeriesUsingDisplayType:(id)a3 unitController:(id)a4;
- (id)_buildTrendDisplayTypeFromModel:(id)a3 baseDisplayType:(id)a4 unitController:(id)a5;
- (id)_buildTrendOverlayValueFormatterUsingDisplayType:(id)a3 unitController:(id)a4;
- (id)_buildTrendingLineSeriesStyleWithColor:(id)a3 formattingDisplayType:(id)a4 unitController:(id)a5 annotationFormatter:(id)a6;
- (id)_durationContextItemWithSummaryPhrase:(id)a3 timeScope:(int64_t)a4;
- (id)_representativeDisplayTypeFromDisplayType:(id)a3;
- (id)_summaryGivenChartPoints:(id)a3 timeScope:(int64_t)a4;
- (id)_trendTitle;
- (id)_trendValueRangeForTimescope:(int64_t)a3 calendar:(id)a4;
- (id)_unselectedMetricColorsUserInteractive:(BOOL)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)categoryIdentifier;
- (int64_t)overlayMode;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)overlayStateDidChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setLastUpdatedItem:(id)a3;
- (void)setSeriesForSelectedTrend:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKOverlayRoomTrendContext

- (HKOverlayRoomTrendContext)initWithBaseDisplayType:(id)a3 trendModel:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 overlayMode:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKOverlayRoomTrendContext;
  v16 = [(HKOverlayRoomTrendContext *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_trendModel, a4);
    v18 = [v15 unitController];
    uint64_t v19 = [(HKOverlayRoomTrendContext *)v17 _buildTrendDisplayTypeFromModel:v13 baseDisplayType:v12 unitController:v18];
    trendDisplayType = v17->_trendDisplayType;
    v17->_trendDisplayType = (HKInteractiveChartDisplayType *)v19;

    objc_storeStrong((id *)&v17->_overlayChartController, a5);
    v17->_categoryIdentifier = [v12 categoryIdentifier];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v12 baseDisplayType];
      v17->_categoryIdentifier = [v21 categoryIdentifier];
    }
    v17->_overlayMode = a7;
    uint64_t v22 = [(HKOverlayRoomTrendContext *)v17 _durationContextItemWithSummaryPhrase:&stru_1F3B9CF20 timeScope:4];
    lastUpdatedItem = v17->_lastUpdatedItem;
    v17->_lastUpdatedItem = (HKDisplayTypeContextItem *)v22;

    seriesForSelectedTrend = v17->_seriesForSelectedTrend;
    v17->_seriesForSelectedTrend = 0;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKOverlayRoomTrendContext *)a3;
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass() & (self == v4);

  return (char)self;
}

+ (int64_t)findStartingTimeScopeFromTrendModel:(id)a3
{
  id v3 = a3;
  if ([v3 selectTrendInitially]
    && ([v3 timeScopeTrends],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 firstObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [v3 timeScopeTrends];
    v7 = [v6 firstObject];
    int64_t v8 = [v7 timeScope];
  }
  else
  {
    int64_t v8 = 8;
  }

  return v8;
}

+ (id)findInitialDateFromTrendModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 timeScopeTrends];
  v5 = [v4 firstObject];
  v6 = [v5 trendSpans];
  v7 = [v6 firstObject];
  int64_t v8 = [v7 trendDateInterval];

  LODWORD(v4) = [v3 selectTrendInitially];
  v9 = 0;
  if (v4 && v8)
  {
    v9 = [v8 endDate];
  }

  return v9;
}

- (id)_buildTrendDisplayTypeFromModel:(id)a3 baseDisplayType:(id)a4 unitController:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(HKOverlayRoomTrendContext *)self _representativeDisplayTypeFromDisplayType:a4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke;
  aBlock[3] = &unk_1E6D52688;
  id v26 = v8;
  id v11 = v10;
  id v27 = v11;
  id v12 = v8;
  id v13 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke_2;
  v23[3] = &unk_1E6D526B0;
  id v24 = v11;
  id v14 = v11;
  id v15 = _Block_copy(v23);
  v16 = [[HKFixedValueDateSpanDataSource alloc] initWithTrendModel:v9 preferredUnitBlock:v13 fixedValueScalingBlock:v15];

  v17 = [(HKOverlayRoomTrendContext *)self _buildAnnotatedHorizontalLineSeriesUsingDisplayType:v14 unitController:v12];
  [v17 setDataSource:v16];
  v18 = [(HKOverlayRoomTrendContext *)self _buildTrendOverlayValueFormatterUsingDisplayType:v14 unitController:v12];
  uint64_t v19 = [HKInteractiveChartDisplayType alloc];
  v20 = [v14 objectType];
  v21 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v19, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v17, v14, v18, [v20 code]);

  return v21;
}

uint64_t __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unitForDisplayType:*(void *)(a1 + 40)];
}

id __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 presentation];
  v5 = [v4 adjustedValueForDaemonValue:v3];

  return v5;
}

- (id)_representativeDisplayTypeFromDisplayType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v3;
  v6 = v5;
  id v7 = v5;
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 baseDisplayType];
    id v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = v6;
    }
    id v7 = v10;
  }
  return v7;
}

- (id)_buildTrendOverlayValueFormatterUsingDisplayType:(id)a3 unitController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HKInteractiveChartTrendOverlayFormatter);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopValueFont");
  [(HKInteractiveChartDataFormatter *)v7 setMajorFont:v8];

  id v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartLollipopKeyFont");
  [(HKInteractiveChartDataFormatter *)v7 setMinorFont:v9];

  [(HKInteractiveChartDataFormatter *)v7 setUnitController:v5];
  [(HKInteractiveChartDataFormatter *)v7 setDisplayType:v6];

  return v7;
}

- (id)_buildAnnotatedHorizontalLineSeriesUsingDisplayType:(id)a3 unitController:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v26 = objc_alloc_init(HKAnnotatedHorizontalLineSeries);
  uint64_t v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  v25 = [(HKOverlayRoomTrendContext *)self _representativeDisplayTypeFromDisplayType:v6];
  v10 = +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", [v25 categoryIdentifier]);
  id v24 = v10;
  if (v10)
  {
    uint64_t v11 = [v10 color];

    id v9 = (void *)v11;
  }
  id v12 = v6;
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass())
  {
    id v14 = v12;
    id v15 = [v14 baseDisplayType];

    id v13 = v14;
    if (v15)
    {
      id v13 = [v14 baseDisplayType];
    }
  }
  v16 = [[HKDisplayTypeNumberFormatter alloc] initWithDisplayType:v13 unitController:v7];
  v17 = [[HKUnitlessNumberFormatter alloc] initWithDisplayType:v13 unitPreferenceController:v7];
  [(HKOverlayRoomTrendContext *)self _buildTrendingLineSeriesStyleWithColor:v9 formattingDisplayType:v13 unitController:v7 annotationFormatter:v17];
  v18 = v23 = v12;
  uint64_t v19 = [(HKOverlayRoomTrendContext *)self _buildTrendingLineSeriesStyleWithColor:v8 formattingDisplayType:v13 unitController:v7 annotationFormatter:v16];
  v20 = [(HKOverlayRoomTrendContext *)self _buildTrendingLineSeriesStyleWithColor:v9 formattingDisplayType:v13 unitController:v7 annotationFormatter:v16];

  v27[0] = &unk_1F3C204E8;
  v27[1] = &unk_1F3C20500;
  v28[0] = v20;
  v28[1] = v18;
  v27[2] = &unk_1F3C20518;
  v28[2] = v19;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  [(HKAnnotatedHorizontalLineSeries *)v26 setHorizontalLineStyles:v21];

  [(HKAnnotatedHorizontalLineSeries *)v26 setValueOutlineWidth:0.0];
  return v26;
}

- (id)_buildTrendingLineSeriesStyleWithColor:(id)a3 formattingDisplayType:(id)a4 unitController:(id)a5 annotationFormatter:(id)a6
{
  id v7 = a3;
  id v8 = a6;
  id v9 = objc_alloc_init(HKStrokeStyle);
  [(HKStrokeStyle *)v9 setStrokeColor:v7];
  [(HKStrokeStyle *)v9 setLineWidth:4.0];
  [(HKStrokeStyle *)v9 setLineCap:1];
  [(HKStrokeStyle *)v9 setLineJoin:1];
  [(HKStrokeStyle *)v9 setDashStyle:0];
  v10 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  unint64_t v11 = [v10 userInterfaceStyle];
  if (v11 <= 2) {
    [(HKStrokeStyle *)v9 setBlendMode:dword_1E0F05810[v11]];
  }
  id v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredRoundedFontForTextStyle:additionalSymbolicTraits:", *MEMORY[0x1E4FB28F0], 2);
  id v13 = +[HKAxisLabelStyle labelStyleWithColor:v7 font:v12 horizontalAlignment:0 verticalAlignment:2 numberFormatter:v8];

  id v14 = objc_alloc_init(HKAnnotationHorizontalLineSeriesStyle);
  [(HKAnnotationHorizontalLineSeriesStyle *)v14 setLineStrokeStyle:v9];
  [(HKAnnotationHorizontalLineSeriesStyle *)v14 setValueStyle:v13];

  return v14;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  id v12 = [(HKOverlayRoomTrendContext *)self trendDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = [(HKOverlayRoomTrendContext *)self trendDisplayType];
    id v15 = [(HKOverlayRoomTrendContext *)self overlayChartController];
    v16 = [v14 graphSeriesForTimeScope:a5];
    v17 = [v10 startDate];
    v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E6D52700;
    v19[4] = self;
    int64_t v21 = a5;
    id v20 = v11;
    [v15 cachedDataForCustomGraphSeries:v16 timeScope:a5 resolution:0 startDate:v17 endDate:v18 completion:v19];
  }
}

void __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
  v12[3] = &unk_1E6D526D8;
  char v17 = a3;
  id v9 = (void *)a1[5];
  v12[4] = a1[4];
  id v13 = v7;
  uint64_t v16 = a1[6];
  id v14 = v8;
  id v15 = v9;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    id v4 = [*(id *)(a1 + 32) _summaryGivenChartPoints:*(void *)(a1 + 40) timeScope:*(void *)(a1 + 64)];
    v2 = [*(id *)(a1 + 32) _durationContextItemWithSummaryPhrase:v4 timeScope:*(void *)(a1 + 64)];
    [*(id *)(a1 + 32) setLastUpdatedItem:v2];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return -[HKOverlayRoomTrendContext _timeScopeMayHaveTrends:](self, "_timeScopeMayHaveTrends:", a5, a4);
}

- (void)overlayStateDidChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v14 = a5;
  id v7 = [v14 selectedTimeScopeController];
  uint64_t v8 = [v7 selectedTimeScope];

  if (v5)
  {
    id v9 = [v14 fixedRangeForTimeScope:v8];

    if (!v9)
    {
      id v10 = [v14 currentCalendar];
      id v11 = [(HKOverlayRoomTrendContext *)self _trendValueRangeForTimescope:v8 calendar:v10];

      if (v11) {
        [v14 scrollToRange:v11 withVisibleAlignment:1];
      }
    }
    id v12 = [(HKOverlayRoomTrendContext *)self trendDisplayType];
    id v13 = [v12 graphSeriesForTimeScope:v8];
    [(HKOverlayRoomTrendContext *)self setSeriesForSelectedTrend:v13];
  }
  else
  {
    [(HKOverlayRoomTrendContext *)self setSeriesForSelectedTrend:0];
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)_trendValueRangeForTimescope:(int64_t)a3 calendar:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = [(HKOverlayRoomTrendContext *)self trendModel];
  BOOL v5 = [v4 timeScopeTrends];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v38;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v7;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        if (objc_msgSend(v11, "timeScope", v25) == a3)
        {
          uint64_t v28 = v10;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v29 = [v11 trendSpans];
          uint64_t v12 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                char v17 = [v16 trendDateInterval];
                v18 = [v17 startDate];
                uint64_t v19 = [v16 trendDateInterval];
                id v20 = [v19 endDate];
                int64_t v21 = +[HKValueRange valueRangeWithMinValue:v18 maxValue:v20];

                uint64_t v22 = [(HKOverlayRoomTrendContext *)self _adjustTrendValueRange:v21 timescope:a3 calendar:v31];
                v23 = v22;
                if (v8) {
                  [v8 unionRange:v22];
                }
                else {
                  id v8 = v22;
                }
              }
              uint64_t v13 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v13);
          }

          uint64_t v9 = v25;
          uint64_t v7 = v26;
          uint64_t v10 = v28;
        }
        ++v10;
      }
      while (v10 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_adjustTrendValueRange:(id)a3 timescope:(int64_t)a4 calendar:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (a4 == 4)
  {
    int64_t v21 = [v9 endDate];
    uint64_t v22 = objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 0, v21);

    v23 = [v9 endDate];
    int v24 = objc_msgSend(v22, "hk_isBeforeDate:", v23);

    if (v24)
    {
      uint64_t v25 = [v9 endDate];
      v18 = objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 1, v25);

      uint64_t v26 = [v9 endDate];
      LODWORD(v25) = objc_msgSend(v18, "hk_isBeforeDate:", v26);

      if (v25)
      {
        id v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomTrendContext.m" lineNumber:372 description:@"Trend end date computation failure"];
      }
    }
    else
    {
      v18 = v22;
    }
    id v29 = objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", -31, v18);
    id v31 = [v9 startDate];
    uint64_t v32 = objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 0, v31);
  }
  else
  {
    if (a4 != 3)
    {
      uint64_t v28 = 0;
      goto LABEL_17;
    }
    uint64_t v12 = [v10 firstWeekday];
    uint64_t v13 = [v9 endDate];
    uint64_t v14 = objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v12, v13, 0);

    id v15 = [v9 endDate];
    LODWORD(v13) = objc_msgSend(v14, "hk_isBeforeDate:", v15);

    if (v13)
    {
      uint64_t v16 = [v11 firstWeekday];
      char v17 = [v9 endDate];
      v18 = objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v16, v17, 1);

      uint64_t v19 = [v9 endDate];
      LODWORD(v17) = objc_msgSend(v18, "hk_isBeforeDate:", v19);

      if (v17)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomTrendContext.m" lineNumber:358 description:@"Trend end date computation failure"];
      }
    }
    else
    {
      v18 = v14;
    }
    id v29 = objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v11, "firstWeekday"), v18, -26);
    uint64_t v30 = [v11 firstWeekday];
    id v31 = [v9 startDate];
    uint64_t v32 = objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v30, v31, 0);
  }
  long long v33 = (void *)v32;

  if (objc_msgSend(v33, "hk_isBeforeDate:", v29))
  {
    id v34 = v29;

    long long v33 = v34;
  }
  uint64_t v28 = +[HKValueRange valueRangeWithMinValue:v33 maxValue:v18];

LABEL_17:
  return v28;
}

- (id)_summaryGivenChartPoints:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  if ([(HKOverlayRoomTrendContext *)self _timeScopeMayHaveTrends:a4])
  {
    uint64_t v7 = [v6 firstObject];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = (void *)MEMORY[0x1E4F28B50];
      id v9 = v7;
      id v10 = [v8 bundleWithIdentifier:@"com.apple.HealthUI"];
      id v11 = [v9 localizableTrendDescription];

      uint64_t v12 = [v10 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v12 = [v10 localizedStringForKey:@"TREND_UNAVAILABLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v12 = [v7 localizedStringForKey:@"TREND_NOT_COMPUTED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }

  return v12;
}

- (id)_durationContextItemWithSummaryPhrase:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(HKDisplayTypeContextItem);
  id v8 = [(HKOverlayRoomTrendContext *)self _trendTitle];
  [(HKDisplayTypeContextItem *)v7 setTitle:v8];

  id v9 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"Trend");
  [(HKDisplayTypeContextItem *)v7 setAccessibilityIdentifier:v9];

  [(HKDisplayTypeContextItem *)v7 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v7 setUnit:&stru_1F3B9CF20];
  [(HKDisplayTypeContextItem *)v7 setValue:v6];

  [(HKDisplayTypeContextItem *)v7 setUserInteractive:[(HKOverlayRoomTrendContext *)self _timeScopeMayHaveTrends:a4]];
  id v10 = [(HKOverlayRoomTrendContext *)self _unselectedMetricColorsUserInteractive:[(HKDisplayTypeContextItem *)v7 userInteractive]];
  [(HKDisplayTypeContextItem *)v7 setMetricColors:v10];

  id v11 = +[HKOverlayContextUtilities selectedMetricColorsForCategory:[(HKOverlayRoomTrendContext *)self categoryIdentifier]];
  [(HKDisplayTypeContextItem *)v7 setSelectedMetricColors:v11];

  return v7;
}

- (id)_unselectedMetricColorsUserInteractive:(BOOL)a3
{
  unint64_t v5 = [(HKOverlayRoomTrendContext *)self overlayMode];
  if (v5 >= 3)
  {
    if (v5 != 3) {
      goto LABEL_9;
    }
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
      goto LABEL_7;
    }
  }
  else if (a3)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
LABEL_7:
    uint64_t v7 = (void *)v6;
    id v3 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v6];

    goto LABEL_9;
  }
  id v3 = +[HKUIMetricColors disabledContextViewColor];
LABEL_9:
  return v3;
}

- (id)_trendTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v3 = [v2 localizedStringForKey:@"TREND_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (BOOL)_timeScopeMayHaveTrends:(int64_t)a3
{
  return (unint64_t)(a3 - 3) <= 1
      && -[HKOverlayRoomTrendContext _timeScopeHasTrendSpans:](self, "_timeScopeHasTrendSpans:");
}

- (BOOL)_timeScopeHasTrendSpans:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(HKOverlayRoomTrendContext *)self trendModel];
  unint64_t v5 = [v4 timeScopeTrends];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 timeScope] == a3)
        {
          id v11 = [v10 trendSpans];
          uint64_t v12 = [v11 count];

          if (v12)
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKInteractiveChartDisplayType)trendDisplayType
{
  return self->_trendDisplayType;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (int64_t)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (HKGraphSeries)seriesForSelectedTrend
{
  return self->_seriesForSelectedTrend;
}

- (void)setSeriesForSelectedTrend:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesForSelectedTrend, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
  objc_storeStrong((id *)&self->_trendDisplayType, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
}

@end
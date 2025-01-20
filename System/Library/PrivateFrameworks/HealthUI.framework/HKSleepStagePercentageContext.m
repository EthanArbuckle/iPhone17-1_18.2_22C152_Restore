@interface HKSleepStagePercentageContext
+ (double)roundedSleepStageDurationPercentageFromDurations:(id)a3 withCategoryValue:(int64_t)a4;
- (BOOL)unselectedContextShouldUseContextBaseType;
- (HKDisplayType)baseDisplayType;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate;
- (HKSleepStagePercentageContext)initWithSleepStage:(int64_t)a3 baseDisplayType:(id)a4 overlayDisplayType:(id)a5 overlayChartController:(id)a6 contextChangeDelegate:(id)a7;
- (NSNumberFormatter)percentageFormatter;
- (double)_computePercentageValueFromChartPoints:(id)a3;
- (id)_contextItemWithPercentageString:(id)a3 timeScope:(int64_t)a4;
- (id)_percentageStringFromValue:(double)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (int64_t)sleepStage;
- (void)overlayStateDidChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5;
- (void)setLastUpdatedItem:(id)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKSleepStagePercentageContext

- (HKSleepStagePercentageContext)initWithSleepStage:(int64_t)a3 baseDisplayType:(id)a4 overlayDisplayType:(id)a5 overlayChartController:(id)a6 contextChangeDelegate:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKSleepStagePercentageContext;
  v17 = [(HKSleepStagePercentageContext *)&v24 init];
  v18 = v17;
  if (v17)
  {
    v17->_sleepStage = a3;
    objc_storeStrong((id *)&v17->_baseDisplayType, a4);
    objc_storeStrong((id *)&v18->_overlayDisplayType, a5);
    objc_storeStrong((id *)&v18->_overlayChartController, a6);
    objc_storeWeak((id *)&v18->_contextChangeDelegate, v16);
    uint64_t v19 = [(HKSleepStagePercentageContext *)v18 _contextItemWithPercentageString:&stru_1F3B9CF20 timeScope:5];
    lastUpdatedItem = v18->_lastUpdatedItem;
    v18->_lastUpdatedItem = (HKDisplayTypeContextItem *)v19;

    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_percentNumberFormatter");
    percentageFormatter = v18->_percentageFormatter;
    v18->_percentageFormatter = (NSNumberFormatter *)v21;

    [(NSNumberFormatter *)v18->_percentageFormatter setRoundingMode:2];
  }

  return v18;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(HKSleepStagePercentageContext *)self contextChangeDelegate];
  [v6 setStagePercentageContextWillBeSelected:v5];
}

- (void)overlayStateDidChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  BOOL v5 = a3;
  id v6 = [(HKSleepStagePercentageContext *)self contextChangeDelegate];
  [v6 setStagePercentageContextSelected:v5];
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  v12 = [(HKSleepStagePercentageContext *)self baseDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = [(HKSleepStagePercentageContext *)self baseDisplayType];
    id v15 = [(HKSleepStagePercentageContext *)self overlayChartController];
    id v16 = [v14 graphSeriesForTimeScope:a5];
    v17 = [v10 startDate];
    v18 = [v10 endDate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116__HKSleepStagePercentageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E6D52700;
    v19[4] = self;
    int64_t v21 = a5;
    id v20 = v11;
    [v15 cachedDataForCustomGraphSeries:v16 timeScope:a5 resolution:0 startDate:v17 endDate:v18 completion:v19];
  }
}

void __116__HKSleepStagePercentageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    [*(id *)(a1 + 32) _computePercentageValueFromChartPoints:a2];
    objc_msgSend(*(id *)(a1 + 32), "_percentageStringFromValue:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [*(id *)(a1 + 32) _contextItemWithPercentageString:v6 timeScope:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setLastUpdatedItem:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)_contextItemWithPercentageString:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  v8 = +[HKSleepUtilities sleepStageContextTitleForSleepValue:[(HKSleepStagePercentageContext *)self sleepStage] timeScope:a4];
  [(HKDisplayTypeContextItem *)v7 setTitle:v8];

  v9 = NSString;
  id v10 = [(HKDisplayTypeContextItem *)v7 title];
  id v11 = objc_msgSend(v9, "hk_chartOverlayAccessibilityIdentifier:", v10);
  [(HKDisplayTypeContextItem *)v7 setAccessibilityIdentifier:v11];

  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  id v13 = +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:@"circle.fill" imageColor:v12];
  [(HKDisplayTypeContextItem *)v7 setTitleAccessory:v13];

  id v14 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepPrimaryTextColorForSleepAnalysis:", -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  id v15 = +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:@"circle" imageColor:v14];
  [(HKDisplayTypeContextItem *)v7 setSelectedTitleAccessory:v15];

  [(HKDisplayTypeContextItem *)v7 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v7 setUseTightSpacingBetweenValueAndUnit:1];
  [(HKDisplayTypeContextItem *)v7 setIsUnitIncludedInValue:1];
  id v16 = [(NSNumberFormatter *)self->_percentageFormatter percentSymbol];
  [(HKDisplayTypeContextItem *)v7 setUnit:v16];

  [(HKDisplayTypeContextItem *)v7 setValue:v6];
  v17 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  v18 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v17];
  [(HKDisplayTypeContextItem *)v7 setMetricColors:v18];

  uint64_t v19 = +[HKUIMetricColors sleepColorsForSleepAnalysis:[(HKSleepStagePercentageContext *)self sleepStage]];
  [(HKDisplayTypeContextItem *)v7 setSelectedMetricColors:v19];

  return v7;
}

- (double)_computePercentageValueFromChartPoints:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_52);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v14 awakeDuration];
        double v11 = v11 + v15;
        [v14 remSleepDuration];
        double v8 = v8 + v16;
        [v14 coreSleepDuration];
        double v9 = v9 + v17;
        [v14 deepSleepDuration];
        double v10 = v10 + v18;
        [v14 awakeDuration];
        double v20 = v19;
        [v14 remSleepDuration];
        double v22 = v20 + v21;
        [v14 coreSleepDuration];
        double v24 = v22 + v23;
        [v14 deepSleepDuration];
        double v12 = v12 + v24 + v25;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }
  v38[0] = &unk_1F3C21D30;
  v26 = [NSNumber numberWithDouble:v11 / v12 * 100.0];
  v39[0] = v26;
  v38[1] = &unk_1F3C21D48;
  v27 = [NSNumber numberWithDouble:v8 / v12 * 100.0];
  v39[1] = v27;
  v38[2] = &unk_1F3C21D60;
  v28 = [NSNumber numberWithDouble:v9 / v12 * 100.0];
  v39[2] = v28;
  v38[3] = &unk_1F3C21D78;
  v29 = [NSNumber numberWithDouble:v10 / v12 * 100.0];
  v39[3] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

  objc_msgSend((id)objc_opt_class(), "roundedSleepStageDurationPercentageFromDurations:withCategoryValue:", v30, -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  if (v12 <= 2.22507386e-308) {
    double v32 = -1.0;
  }
  else {
    double v32 = v31;
  }

  return v32;
}

id __72__HKSleepStagePercentageContext__computePercentageValueFromChartPoints___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  v3 = [v2 sleepDaySummary];

  return v3;
}

+ (double)roundedSleepStageDurationPercentageFromDurations:(id)a3 withCategoryValue:(int64_t)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [NSNumber numberWithInteger:a4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (!v9)
  {
    double v20 = 0.0;
    double v18 = v8;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v10 = v9;
  v63 = v6;
  int v11 = 0;
  uint64_t v12 = *(void *)v67;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v67 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void *)(*((void *)&v66 + 1) + 8 * i);
      double v15 = [v8 objectForKeyedSubscript:v14];
      [v15 doubleValue];
      double v17 = v16;

      if (v17 >= 1.0) {
        v11 += (int)v17;
      }
      else {
        [v7 addObject:v14];
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v66 objects:v72 count:16];
  }
  while (v10);

  if (v11)
  {
    if (v11 == 100)
    {
      uint64_t v6 = v63;
      double v18 = [v8 objectForKeyedSubscript:v63];
      [v18 doubleValue];
      double v20 = v19;
    }
    else
    {
      if ([v7 count]) {
        int v21 = 99;
      }
      else {
        int v21 = 100;
      }
      int v22 = v21 - v11;
      v70[0] = &unk_1F3C21D30;
      double v23 = NSNumber;
      v64 = [v8 objectForKeyedSubscript:&unk_1F3C21D30];
      [v64 doubleValue];
      double v25 = v24;
      v61 = [v8 objectForKeyedSubscript:&unk_1F3C21D30];
      v60 = objc_msgSend(v23, "numberWithDouble:", v25 - (double)objc_msgSend(v61, "integerValue"));
      v71[0] = v60;
      v70[1] = &unk_1F3C21D48;
      v26 = NSNumber;
      v59 = [v8 objectForKeyedSubscript:&unk_1F3C21D48];
      [v59 doubleValue];
      double v28 = v27;
      v58 = [v8 objectForKeyedSubscript:&unk_1F3C21D48];
      v57 = objc_msgSend(v26, "numberWithDouble:", v28 - (double)objc_msgSend(v58, "integerValue"));
      v71[1] = v57;
      v70[2] = &unk_1F3C21D60;
      v29 = NSNumber;
      v30 = [v8 objectForKeyedSubscript:&unk_1F3C21D60];
      [v30 doubleValue];
      double v32 = v31;
      v33 = [v8 objectForKeyedSubscript:&unk_1F3C21D60];
      long long v34 = objc_msgSend(v29, "numberWithDouble:", v32 - (double)objc_msgSend(v33, "integerValue"));
      v71[2] = v34;
      v70[3] = &unk_1F3C21D78;
      long long v35 = NSNumber;
      long long v36 = [v8 objectForKeyedSubscript:&unk_1F3C21D78];
      [v36 doubleValue];
      double v38 = v37;
      v39 = [v8 objectForKeyedSubscript:&unk_1F3C21D78];
      v40 = objc_msgSend(v35, "numberWithDouble:", v38 - (double)objc_msgSend(v39, "integerValue"));
      v71[3] = v40;
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:4];

      v62 = v41;
      v42 = [v41 keysSortedByValueUsingComparator:&__block_literal_global_307];
      v65 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v8];
      int v43 = [v42 count];
      if (v22 >= 1 && v43 >= 1)
      {
        uint64_t v44 = 0;
        uint64_t v45 = v43;
        do
        {
          v46 = [v42 objectAtIndexedSubscript:v44];
          char v47 = [v7 containsObject:v46];

          if (v47)
          {
            ++v22;
          }
          else
          {
            v48 = NSNumber;
            v49 = [v42 objectAtIndexedSubscript:v44];
            v50 = [v8 objectForKey:v49];
            [v50 doubleValue];
            v52 = [v48 numberWithDouble:v51 + 1.0];
            v53 = [v42 objectAtIndexedSubscript:v44];
            [v65 setObject:v52 forKey:v53];
          }
          ++v44;
        }
        while (v44 < v22 && v44 < v45);
      }
      uint64_t v6 = v63;
      v54 = [v65 objectForKeyedSubscript:v63];
      [v54 doubleValue];
      double v20 = v55;

      double v18 = v62;
    }
    goto LABEL_28;
  }
  double v20 = 0.0;
  uint64_t v6 = v63;
LABEL_29:

  return v20;
}

uint64_t __100__HKSleepStagePercentageContext_roundedSleepStageDurationPercentageFromDurations_withCategoryValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)_percentageStringFromValue:(double)a3
{
  if (a3 == -1.0)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", -1.0);
    id v5 = v4;
    uint64_t v6 = @"NO_DATA_PERCENT";
  }
  else
  {
    if (a3 <= 2.22507386e-308 || a3 >= 1.0)
    {
      id v5 = [(HKSleepStagePercentageContext *)self percentageFormatter];
      id v8 = [NSNumber numberWithDouble:a3 / 100.0];
      uint64_t v9 = [v5 stringFromNumber:v8];

      goto LABEL_10;
    }
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = v4;
    uint64_t v6 = @"LESS_THAN_1_PERCENT";
  }
  uint64_t v9 = [v4 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
LABEL_10:

  return v9;
}

- (int64_t)sleepStage
{
  return self->_sleepStage;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
  return (HKOverlaySleepRoomContextChangeDelegate *)WeakRetained;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
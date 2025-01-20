@interface HKHRAFibBurdenSevenDayAnalysisManager
- ($0AC6E346AE4835514AAA8AC86D8F4844)_determineDayIndexRangeForPreviousCalendarWeekWithCurrentDate:(id)a3;
- (BOOL)_isDayOneDayAfterCalendarWeekWithCurrentDate:(id)a3;
- (HKHRAFibBurdenSevenDayAnalysisManager)initWithProfile:(id)a3 analyzer:(id)a4;
- (HKHRAFibBurdenSevenDayAnalysisManager)initWithProfile:(id)a3 modeDeterminer:(id)a4 analyzer:(id)a5 calendarCache:(id)a6 dateGenerator:(id)a7;
- (id)_createBurdenSampleWithPercentage:(double)a3 burdenPercentageWasClampedToLowerBound:(BOOL)a4 range:(id)a5 shouldSaveSampleToDatabase:(BOOL)a6 error:(id *)a7;
- (id)analyzePreviousCalendarWeekWithFeatureStatus:(id)a3 shouldSaveSampleToDatabase:(BOOL)a4 breadcrumbManager:(id)a5 error:(id *)a6;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisManager

- (HKHRAFibBurdenSevenDayAnalysisManager)initWithProfile:(id)a3 analyzer:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F2AC98];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [[HKHRAFibBurdenSevenDayAnalysisModeDeterminer alloc] initWithProfile:v8 calendarCache:v9];
  v11 = [(HKHRAFibBurdenSevenDayAnalysisManager *)self initWithProfile:v8 modeDeterminer:v10 analyzer:v7 calendarCache:v9 dateGenerator:&__block_literal_global_15];

  return v11;
}

uint64_t __66__HKHRAFibBurdenSevenDayAnalysisManager_initWithProfile_analyzer___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (HKHRAFibBurdenSevenDayAnalysisManager)initWithProfile:(id)a3 modeDeterminer:(id)a4 analyzer:(id)a5 calendarCache:(id)a6 dateGenerator:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisManager;
  v17 = [(HKHRAFibBurdenSevenDayAnalysisManager *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_storeStrong((id *)&v18->_modeDeterminer, a4);
    objc_storeStrong((id *)&v18->_analyzer, a5);
    objc_storeStrong((id *)&v18->_calendarCache, a6);
    uint64_t v19 = MEMORY[0x1D943B130](v16);
    id dateGenerator = v18->_dateGenerator;
    v18->_id dateGenerator = (id)v19;
  }
  return v18;
}

- (id)analyzePreviousCalendarWeekWithFeatureStatus:(id)a3 shouldSaveSampleToDatabase:(BOOL)a4 breadcrumbManager:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id dateGenerator = self->_dateGenerator;
  id v12 = (void (*)(void *))dateGenerator[2];
  id v13 = a3;
  id v14 = v12(dateGenerator);
  uint64_t v15 = [(HKHRAFibBurdenSevenDayAnalysisManager *)self _determineDayIndexRangeForPreviousCalendarWeekWithCurrentDate:v14];
  uint64_t v17 = v16;
  modeDeterminer = self->_modeDeterminer;
  id v52 = 0;
  uint64_t v19 = -[HKHRAFibBurdenSevenDayAnalysisModeDeterminer determineModeForAnalysisWeekRange:featureStatus:error:](modeDeterminer, "determineModeForAnalysisWeekRange:featureStatus:error:", v15, v16, v13, &v52);

  id v20 = v52;
  if (!v19)
  {
    _HKInitializeLogging();
    v26 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:]((uint64_t)self, (uint64_t)v20, v26);
    }

    id v20 = v20;
    if (v20)
    {
      if (a6) {
        *a6 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v24 = objc_alloc(MEMORY[0x1E4F67DC0]);
    uint64_t v25 = 1;
    goto LABEL_26;
  }
  BOOL v49 = v7;
  uint64_t v21 = [v19 integerValue];
  _HKInitializeLogging();
  objc_super v22 = HKHRAFibBurdenLogForCategory();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21 == 2)
  {
    if (v23)
    {
      *(_DWORD *)buf = 138543362;
      v54 = self;
      _os_log_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mode determination indicated we should not perform analysis, skipping.", buf, 0xCu);
    }

    id v24 = objc_alloc(MEMORY[0x1E4F67DC0]);
    uint64_t v25 = 2;
LABEL_26:
    v44 = (void *)[v24 initWithResult:v25 sample:0 onboardedWithinAnalysisInterval:0];
    goto LABEL_43;
  }
  uint64_t v48 = v21;
  if (v23)
  {
    v27 = NSStringFromHKDayIndexRange();
    *(_DWORD *)buf = 138412546;
    v54 = self;
    __int16 v55 = 2112;
    v56 = v27;
    _os_log_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Performing analysis for day index range: %@", buf, 0x16u);
  }
  [v10 dropBreadcrumb:3];
  analyzer = self->_analyzer;
  id v51 = v20;
  v29 = -[HKHRAFibBurdenAnalyzer generateSevenDayBurdenWithRange:breadcrumbManager:error:](analyzer, "generateSevenDayBurdenWithRange:breadcrumbManager:error:", v15, v17, v10, &v51);
  id v30 = v51;

  [v10 dropBreadcrumb:5];
  if (!v29)
  {
    _HKInitializeLogging();
    v43 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:]();
    }

    id v30 = v30;
    if (v30)
    {
      if (a6) {
        *a6 = v30;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v44 = (void *)[objc_alloc(MEMORY[0x1E4F67DC0]) initWithResult:1 sample:0 onboardedWithinAnalysisInterval:0];
    goto LABEL_42;
  }
  uint64_t v31 = [v29 unavailabilityReason];
  v32 = 0;
  v33 = @"Not enough total tachograms";
  uint64_t v34 = 3;
  switch(v31)
  {
    case 0:
      objc_msgSend(v29, "burdenPercentage", @"Not enough total tachograms");
      v36 = v35 = v29;
      [v36 doubleValue];
      v47 = v35;
      id v50 = v30;
      v32 = -[HKHRAFibBurdenSevenDayAnalysisManager _createBurdenSampleWithPercentage:burdenPercentageWasClampedToLowerBound:range:shouldSaveSampleToDatabase:error:](self, "_createBurdenSampleWithPercentage:burdenPercentageWasClampedToLowerBound:range:shouldSaveSampleToDatabase:error:", [v35 burdenPercentageWasClampedToLowerBound], v15, v17, v49, &v50, v37);
      id v38 = v50;

      _HKInitializeLogging();
      v39 = HKHRAFibBurdenLogForCategory();
      v40 = v39;
      if (v32)
      {
        BOOL v41 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        if (v49)
        {
          v29 = v47;
          if (v41)
          {
            *(_DWORD *)buf = 138412290;
            v54 = self;
            v42 = "[%@] Saved sample to HealthKit";
LABEL_39:
            _os_log_impl(&dword_1D3AC6000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
          }
        }
        else
        {
          v29 = v47;
          if (v41)
          {
            *(_DWORD *)buf = 138412290;
            v54 = self;
            v42 = "[%@] Sample created but not saved";
            goto LABEL_39;
          }
        }

        uint64_t v34 = 0;
        v33 = @"Sample created";
        id v30 = v38;
        goto LABEL_41;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:].cold.4();
      }

      v32 = 0;
      uint64_t v34 = 1;
      id v30 = v38;
      v33 = @"Error saving sample to HealthKit";
      v29 = v47;
LABEL_41:
      [v10 dropAnalysisResultBreadcrumbWithContext:v33];
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F67DC0]) initWithResult:v34 sample:v32 onboardedWithinAnalysisInterval:v48 == 1];

LABEL_42:
      id v20 = v30;
LABEL_43:

      return v44;
    case 1:
      goto LABEL_41;
    case 2:
      v32 = 0;
      v33 = @"Not enough days with minimum number tachograms";
      uint64_t v34 = 4;
      goto LABEL_41;
    case 3:
      v32 = 0;
      v33 = @"Not enough segments";
      uint64_t v34 = 5;
      goto LABEL_41;
    default:
      _HKInitializeLogging();
      v45 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        -[HKHRAFibBurdenSevenDayAnalysisManager analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:]((uint64_t)self, v29, v45);
      }

      v32 = 0;
      v33 = @"Received unexpected unavailability reason";
      uint64_t v34 = 1;
      goto LABEL_41;
  }
}

- (BOOL)_isDayOneDayAfterCalendarWeekWithCurrentDate:(id)a3
{
  calendarCache = self->_calendarCache;
  id v4 = a3;
  v5 = [(HKCalendarCache *)calendarCache currentCalendar];
  uint64_t v6 = [v5 component:512 fromDate:v4];

  LOBYTE(v4) = v6 == *MEMORY[0x1E4F67D58];
  return (char)v4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_determineDayIndexRangeForPreviousCalendarWeekWithCurrentDate:(id)a3
{
  calendarCache = self->_calendarCache;
  id v4 = a3;
  v5 = [(HKCalendarCache *)calendarCache currentCalendar];
  uint64_t v6 = HKHRAFibBurdenPreviousWeekDayIndexRange();
  int64_t v8 = v7;

  int64_t v9 = v6;
  int64_t v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)_createBurdenSampleWithPercentage:(double)a3 burdenPercentageWasClampedToLowerBound:(BOOL)a4 range:(id)a5 shouldSaveSampleToDatabase:(BOOL)a6 error:(id *)a7
{
  BOOL v46 = a6;
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v12 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", var0, 0, v12);
  int64_t v14 = var0 + var1;
  uint64_t v15 = (void *)v13;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v14, 0, v12);
  uint64_t v17 = (void *)MEMORY[0x1E4F2B370];
  v18 = [MEMORY[0x1E4F2B618] percentUnit];
  uint64_t v19 = v17;
  id v20 = a7;
  uint64_t v21 = [v19 quantityWithUnit:v18 doubleValue:a3];

  objc_super v22 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  BOOL v23 = HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped();

  id v24 = (void *)MEMORY[0x1E4F2B388];
  uint64_t v25 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F0]];
  v26 = [MEMORY[0x1E4F2AEF8] localDevice];
  v47 = (void *)v21;
  v27 = [v24 quantitySampleWithType:v25 quantity:v21 startDate:v15 endDate:v16 device:v26 metadata:v23];

  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v30 = [WeakRetained deviceManager];
  uint64_t v31 = [v30 currentDeviceEntityWithError:v20];

  if (v31)
  {
    v45 = v16;
    id v32 = objc_loadWeakRetained((id *)p_profile);
    v33 = [v32 dataProvenanceManager];
    uint64_t v34 = [v33 defaultLocalDataProvenanceWithDeviceEntity:v31];

    v35 = v27;
    if (v46)
    {
      id v36 = objc_loadWeakRetained((id *)p_profile);
      double v37 = [v36 dataManager];
      v48[0] = v27;
      id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
      int v39 = [v37 insertDataObjects:v38 withProvenance:v34 creationDate:v20 error:CFAbsoluteTimeGetCurrent()];
      v40 = v15;
      int v41 = v39;

      BOOL v42 = v41 == 0;
      uint64_t v15 = v40;
      if (v42) {
        v35 = 0;
      }
      else {
        v35 = v27;
      }
    }
    id v43 = v35;

    uint64_t v16 = v45;
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_storeStrong((id *)&self->_modeDeterminer, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:(NSObject *)a3 shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, a2, a3, "[%{public}@] Error received when determining analysis mode: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Error received when performing burden analysis: %@");
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:(NSObject *)a3 shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 unavailabilityReason];
  _os_log_fault_impl(&dword_1D3AC6000, a3, OS_LOG_TYPE_FAULT, "[%@] Received unexpected unavailability reason: %ld", (uint8_t *)&v4, 0x16u);
}

- (void)analyzePreviousCalendarWeekWithFeatureStatus:shouldSaveSampleToDatabase:breadcrumbManager:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Error saving sample to HealthKit: %@");
}

@end
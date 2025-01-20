@interface HKHRAFibBurdenAnalyzer
- (HKHRAFibBurdenAnalyzer)initWithClassificationRetriever:(id)a3 burdenDeterminer:(id)a4 tachogramClassifierFactory:(id)a5 majorityTimeZoneDeterminer:(id)a6 calendarCache:(id)a7 dateGenerator:(id)a8;
- (HKHRAFibBurdenAnalyzer)initWithProfile:(id)a3;
- (id)_generateDayOfWeekHistogramWithTachogramClassifier:(id)a3 error:(id *)a4;
- (id)_generateTimeOfDayHistogramWithTachogramClassifier:(id)a3 error:(id *)a4;
- (id)_julianDayToTimeZoneMappingForPastSixWeeksWithError:(id *)a3;
- (id)_logDayNameForWeekday:(int64_t)a3;
- (id)generateSevenDayBurdenWithRange:(id)a3 breadcrumbManager:(id)a4 error:(id *)a5;
- (id)generateSixWeekBurdenHistogramsWithError:(id *)a3;
@end

@implementation HKHRAFibBurdenAnalyzer

- (HKHRAFibBurdenAnalyzer)initWithProfile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F2ABE8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = HKHRAFibBurdenLogForCategory();
  v8 = (void *)[v6 initWithLoggingCategory:v7 healthDataSource:v5];

  v9 = [[BerylliumBurdenDeterminer alloc] initWithAnalyticsEventSubmissionManager:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  v11 = [[HKHRAFibBurdenTachogramClassificationsRetriever alloc] initWithProfile:v5 calendarCache:v10];
  v12 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
  v13 = [[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer alloc] initWithProfile:v5 calendarCache:v10];

  v14 = [(HKHRAFibBurdenAnalyzer *)self initWithClassificationRetriever:v11 burdenDeterminer:v9 tachogramClassifierFactory:v12 majorityTimeZoneDeterminer:v13 calendarCache:v10 dateGenerator:&__block_literal_global];
  return v14;
}

uint64_t __42__HKHRAFibBurdenAnalyzer_initWithProfile___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (HKHRAFibBurdenAnalyzer)initWithClassificationRetriever:(id)a3 burdenDeterminer:(id)a4 tachogramClassifierFactory:(id)a5 majorityTimeZoneDeterminer:(id)a6 calendarCache:(id)a7 dateGenerator:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HKHRAFibBurdenAnalyzer;
  v19 = [(HKHRAFibBurdenAnalyzer *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_classificationRetriever, a3);
    objc_storeStrong((id *)&v20->_burdenDeterminer, a4);
    objc_storeStrong((id *)&v20->_tachogramClassifierFactory, a5);
    objc_storeStrong((id *)&v20->_majorityTimeZoneDeterminer, a6);
    objc_storeStrong((id *)&v20->_calendarCache, a7);
    uint64_t v21 = MEMORY[0x1D943B130](v18);
    id dateGenerator = v20->_dateGenerator;
    v20->_id dateGenerator = (id)v21;
  }
  return v20;
}

- (id)generateSevenDayBurdenWithRange:(id)a3 breadcrumbManager:(id)a4 error:(id *)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v9 = a4;
  id v10 = [(HKHRAFibBurdenTachogramClassifierFactory *)self->_tachogramClassifierFactory createTachogramClassifier];
  classificationRetriever = self->_classificationRetriever;
  id v19 = 0;
  v12 = -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsDayIndexRange:tachogramClassifier:error:](classificationRetriever, "tachogramClassificationsDayIndexRange:tachogramClassifier:error:", var0, var1, v10, &v19);
  id v13 = v19;
  if (v12)
  {
    [v9 dropBreadcrumb:4];
    v14 = [(HKHRAFibBurdenDeterminer *)self->_burdenDeterminer burdenForTachogramClassifications:v12 calculationType:0 calculationTypeContext:0 error:a5];
    if (v14) {
      goto LABEL_12;
    }
    id v15 = @"Error determining burden";
  }
  else
  {
    _HKInitializeLogging();
    id v16 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenAnalyzer generateSevenDayBurdenWithRange:breadcrumbManager:error:]();
    }

    id v17 = v13;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v14 = 0;
    id v15 = @"Error classifying tachograms";
  }
  [v9 dropAnalysisResultBreadcrumbWithContext:v15];
LABEL_12:

  return v14;
}

- (id)generateSixWeekBurdenHistogramsWithError:(id *)a3
{
  id v5 = [(HKHRAFibBurdenTachogramClassifierFactory *)self->_tachogramClassifierFactory createTachogramClassifier];
  id v6 = [(HKHRAFibBurdenAnalyzer *)self _generateDayOfWeekHistogramWithTachogramClassifier:v5 error:a3];
  if (v6)
  {
    v7 = [(HKHRAFibBurdenAnalyzer *)self _generateTimeOfDayHistogramWithTachogramClassifier:v5 error:a3];
    if (v7) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F67DA8]) initWithDayOfWeekHistogram:v6 timeOfDayHistogram:v7];
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_generateDayOfWeekHistogramWithTachogramClassifier:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = HKHRAFibBurdenDayOfWeekHistogramOverride();
  if (v7)
  {
    _HKInitializeLogging();
    v8 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Using override for day of week histogram", buf, 0xCu);
    }

    id v9 = v7;
  }
  else
  {
    v28 = a4;
    id v10 = 0;
    v29 = 0;
    v30 = 0;
    v34 = 0;
    v35 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    unint64_t v11 = 1;
    while (1)
    {
      v12 = (void *)MEMORY[0x1D943AF40]();
      classificationRetriever = self->_classificationRetriever;
      id v37 = v10;
      v14 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)classificationRetriever tachogramClassificationsForLastSixWeeksOfWeekday:v11 tachogramClassifier:v6 error:&v37];
      id v15 = v37;

      if (!v14) {
        break;
      }
      burdenDeterminer = self->_burdenDeterminer;
      id v17 = [NSNumber numberWithInteger:v11];
      id v36 = v15;
      id v18 = [(HKHRAFibBurdenDeterminer *)burdenDeterminer burdenForTachogramClassifications:v14 calculationType:2 calculationTypeContext:v17 error:&v36];
      id v10 = v36;

      if (v18)
      {
        switch(v11)
        {
          case 1uLL:
            id v19 = v30;
            v30 = v18;
            goto LABEL_12;
          case 2uLL:
            id v19 = v29;
            v29 = v18;
            goto LABEL_12;
          case 3uLL:
            id v19 = v35;
            v35 = v18;
            goto LABEL_12;
          case 4uLL:
            id v19 = v34;
            v34 = v18;
            goto LABEL_12;
          case 5uLL:
            id v19 = v33;
            v33 = v18;
            goto LABEL_12;
          case 6uLL:
            id v19 = v32;
            v32 = v18;
            goto LABEL_12;
          case 7uLL:
            id v19 = v31;
            v31 = v18;
            goto LABEL_12;
          default:
            break;
        }
      }
      else
      {
        _HKInitializeLogging();
        id v19 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = [(HKHRAFibBurdenAnalyzer *)self _logDayNameForWeekday:v11];
          *(_DWORD *)buf = 138412802;
          v39 = self;
          __int16 v40 = 2112;
          v41 = v21;
          __int16 v42 = 2112;
          id v43 = v10;
          _os_log_error_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_ERROR, "[%@] Error received while determining burden for %@, aborting day of week histogram burden analysis: %@", buf, 0x20u);
        }
LABEL_12:
      }
      if (v18)
      {
        if (v11++ < 7) {
          continue;
        }
      }
      goto LABEL_26;
    }
    _HKInitializeLogging();
    v22 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = [(HKHRAFibBurdenAnalyzer *)self _logDayNameForWeekday:v11];
      *(_DWORD *)buf = 138412802;
      v39 = self;
      __int16 v40 = 2112;
      v41 = v27;
      __int16 v42 = 2112;
      id v43 = v15;
      _os_log_error_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_ERROR, "[%@] Error received while classifying tachograms for %@, aborting day of week histogram burden analysis: %@", buf, 0x20u);
    }
    id v10 = v15;
LABEL_26:
    if (v10)
    {
      v7 = 0;
      v23 = v29;
      id v24 = v30;
      id v9 = v28;
      if (v28)
      {
        id v9 = 0;
        id *v28 = v10;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    else
    {
      v7 = 0;
      v23 = v29;
      id v24 = v30;
      if (v30 && v29 && v35 && v34 && v33 && v32 && v31)
      {
        id v9 = (id *)[objc_alloc(MEMORY[0x1E4F67D90]) initWithSundayBurden:v30 mondayBurden:v29 tuesdayBurden:v35 wednesdayBurden:v34 thursdayBurden:v33 fridayBurden:v32 saturdayBurden:v31];
      }
      else
      {
        _HKInitializeLogging();
        id v25 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          -[HKHRAFibBurdenAnalyzer _generateDayOfWeekHistogramWithTachogramClassifier:error:]((uint64_t)self, v25);
        }

        id v9 = 0;
      }
    }
  }

  return v9;
}

- (id)_generateTimeOfDayHistogramWithTachogramClassifier:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v6 = HKHRAFibBurdenTimeOfDayHistogramOverride();
  if (v6)
  {
    _HKInitializeLogging();
    v7 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = self;
      _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Using override for time of day histogram", buf, 0xCu);
    }

    id v8 = v6;
  }
  else
  {
    id v44 = 0;
    uint64_t v9 = [(HKHRAFibBurdenAnalyzer *)self _julianDayToTimeZoneMappingForPastSixWeeksWithError:&v44];
    id v10 = v44;
    __int16 v40 = (void *)v9;
    if (v9)
    {
      v33 = a4;
      uint64_t v11 = 0;
      v38 = 0;
      v39 = 0;
      uint64_t v12 = 0;
      v34 = 0;
      v35 = 0;
      id v36 = 0;
      id v37 = 0;
      while (1)
      {
        id v13 = (void *)MEMORY[0x1D943AF40]();
        uint64_t v14 = v12 + 4;
        classificationRetriever = self->_classificationRetriever;
        id v43 = v10;
        id v16 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)classificationRetriever tachogramClassificationsForLastSixWeeksOfHoursFrom:v12 to:v12 + 4 julianDayToMajorityTimeZone:v40 tachogramClassifier:v41 error:&v43];
        id v17 = v43;

        if (!v16) {
          break;
        }
        burdenDeterminer = self->_burdenDeterminer;
        id v19 = [NSNumber numberWithInteger:v12];
        __int16 v42 = v17;
        v20 = [(HKHRAFibBurdenDeterminer *)burdenDeterminer burdenForTachogramClassifications:v16 calculationType:1 calculationTypeContext:v19 error:&v42];
        id v10 = v42;

        if (!v20)
        {
          _HKInitializeLogging();
          v28 = HKHRAFibBurdenLogForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v46 = self;
            __int16 v47 = 2048;
            uint64_t v48 = v12;
            __int16 v49 = 2048;
            uint64_t v50 = v12 + 4;
            __int16 v51 = 2112;
            v52 = v10;
            _os_log_error_impl(&dword_1D3AC6000, v28, OS_LOG_TYPE_ERROR, "[%@] Error received while determining burden between hours %ld and %ld, aborting day of week histogram burden analysis: %@", buf, 0x2Au);
          }

          goto LABEL_33;
        }
        switch(v11)
        {
          case 0:
            uint64_t v21 = v39;
            v39 = v20;
            break;
          case 1:
            uint64_t v21 = v38;
            v38 = v20;
            break;
          case 2:
            uint64_t v21 = v37;
            id v37 = v20;
            break;
          case 3:
            uint64_t v21 = v36;
            id v36 = v20;
            break;
          case 4:
            uint64_t v21 = v35;
            v35 = v20;
            break;
          case 5:
            uint64_t v21 = v34;
            v34 = v20;
            break;
          default:
            _HKInitializeLogging();
            uint64_t v21 = HKHRAFibBurdenLogForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v46 = self;
              __int16 v47 = 2048;
              uint64_t v48 = v12;
              _os_log_fault_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_FAULT, "[%@] Invalid start hour being used for burden analysis calculation: %ld", buf, 0x16u);
            }
            break;
        }

        ++v11;
        v12 += 4;
        if ((unint64_t)(v14 - 4) >= 0x14)
        {
          if (v10)
          {
LABEL_20:
            v23 = v38;
            v22 = v39;
            id v24 = v37;
            id v25 = v34;
            if (v33)
            {
              id v8 = 0;
              id *v33 = v10;
            }
            else
            {
              _HKLogDroppedError();
              id v8 = 0;
            }
            id v6 = 0;
            v30 = v35;
            v29 = v36;
            goto LABEL_46;
          }
LABEL_34:
          v23 = v38;
          v22 = v39;
          v29 = v36;
          id v24 = v37;
          id v25 = v34;
          v30 = v35;
          if (v39 && v38 && v37 && v36 && v35 && v34)
          {
            id v8 = (id)[objc_alloc(MEMORY[0x1E4F67DC8]) initWithMidnightToFourAMBurden:v39 fourAMtoEightAMBurden:v38 eightAMToNoonBurden:v37 noonToFourPMBurden:v36 fourPMToEightPMBurden:v35 eightPMToMidnightBurden:v34];
            id v6 = 0;
          }
          else
          {
            _HKInitializeLogging();
            v31 = HKHRAFibBurdenLogForCategory();
            id v6 = 0;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
              -[HKHRAFibBurdenAnalyzer _generateDayOfWeekHistogramWithTachogramClassifier:error:]((uint64_t)self, v31);
            }

            id v8 = 0;
          }
LABEL_46:

          goto LABEL_49;
        }
      }
      _HKInitializeLogging();
      id v16 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v46 = self;
        __int16 v47 = 2048;
        uint64_t v48 = v12;
        __int16 v49 = 2048;
        uint64_t v50 = v12 + 4;
        __int16 v51 = 2112;
        v52 = v17;
        _os_log_error_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_ERROR, "[%@] Error received while classifying tachograms between hours %ld and %ld, aborting time of day histogram burden analysis: %@", buf, 0x2Au);
      }
      id v10 = v17;
LABEL_33:

      if (v10) {
        goto LABEL_20;
      }
      goto LABEL_34;
    }
    _HKInitializeLogging();
    objc_super v26 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[HKHRAFibBurdenAnalyzer _generateTimeOfDayHistogramWithTachogramClassifier:error:]();
    }

    v27 = v10;
    v22 = v27;
    if (v27)
    {
      if (a4)
      {
        v22 = v27;
        id v8 = 0;
        *a4 = v22;
        id v10 = v22;
        goto LABEL_49;
      }
      _HKLogDroppedError();
    }
    id v8 = 0;
    id v10 = v22;
LABEL_49:
  }

  return v8;
}

- (id)_julianDayToTimeZoneMappingForPastSixWeeksWithError:(id *)a3
{
  id v5 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  id v6 = (*((void (**)(void))self->_dateGenerator + 2))();
  v7 = [v5 startOfDayForDate:v6];

  id v8 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  uint64_t v9 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", v8);

  id v10 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:](self->_majorityTimeZoneDeterminer, "determineJulianDayToMajorityTimeZoneForRange:error:", v9 - 42, 42, a3);

  return v10;
}

- (id)_logDayNameForWeekday:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return @"Unknownday";
  }
  else {
    return off_1E69B3F28[a3 - 1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateGenerator, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_majorityTimeZoneDeterminer, 0);
  objc_storeStrong((id *)&self->_tachogramClassifierFactory, 0);
  objc_storeStrong((id *)&self->_burdenDeterminer, 0);

  objc_storeStrong((id *)&self->_classificationRetriever, 0);
}

- (void)generateSevenDayBurdenWithRange:breadcrumbManager:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Error received while classifying tachograms, aborting seven day burden analysis: %@");
}

- (void)_generateDayOfWeekHistogramWithTachogramClassifier:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%@] Expected to have all buckets filled in, at least one missing!", (uint8_t *)&v2, 0xCu);
}

- (void)_generateTimeOfDayHistogramWithTachogramClassifier:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%@] Error received while determining julian day to majority time zone, aborting time of day histogram burden analysis: %@");
}

@end
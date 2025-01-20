@interface HDMCDaySummaryBuilder
- (BOOL)_intermenstrualBleeding;
- (HDMCDaySummaryBuilder)initWithProfile:(id)a3 dayIndex:(int64_t)a4 orderedWatchSources:(id)a5 calendarCache:(id)a6;
- (id)_basalBodyTemperature;
- (id)_endedCycleFactors;
- (id)_startedCycleFactors;
- (id)_wristTemperature;
- (id)createDaySummaryWithDevice:(id)a3;
- (int64_t)_bleedingAfterPregnancyFlow;
- (int64_t)_bleedingInPregnancyFlow;
- (int64_t)_cervicalMucusQuality;
- (int64_t)_menstrualFlowWithModificationDay:(int64_t *)a3 startOfCycleFromCycleTracking:(id *)a4;
- (int64_t)_ovulationTestResult;
- (int64_t)_pregnancyTestResult;
- (int64_t)_progesteroneTestResult;
- (int64_t)_sexualActivity;
- (int64_t)dayIndex;
- (unint64_t)_symptoms;
- (void)addCycleTrackingSample:(id)a3;
@end

@implementation HDMCDaySummaryBuilder

- (void)addCycleTrackingSample:(id)a3
{
  id v69 = a3;
  v5 = [v69 sampleType];
  uint64_t v6 = [v5 code];

  if (v6 <= 190)
  {
    if ((unint64_t)(v6 - 157) >= 0xF)
    {
      switch(v6)
      {
        case 'Z':
          basalBodyTemperatureSamples = self->_basalBodyTemperatureSamples;
          if (basalBodyTemperatureSamples)
          {
            v8 = basalBodyTemperatureSamples;
          }
          else
          {
            v8 = [MEMORY[0x263EFF980] array];
          }
          v58 = self->_basalBodyTemperatureSamples;
          self->_basalBodyTemperatureSamples = v8;

          v12 = self->_basalBodyTemperatureSamples;
          goto LABEL_12;
        case '[':
          cervicalMucusQualitySamples = self->_cervicalMucusQualitySamples;
          if (cervicalMucusQualitySamples)
          {
            v34 = cervicalMucusQualitySamples;
          }
          else
          {
            v34 = [MEMORY[0x263EFF980] array];
          }
          v61 = self->_cervicalMucusQualitySamples;
          self->_cervicalMucusQualitySamples = v34;

          v12 = self->_cervicalMucusQualitySamples;
          goto LABEL_12;
        case '\\':
          ovulationTestResultSamples = self->_ovulationTestResultSamples;
          if (ovulationTestResultSamples)
          {
            v36 = ovulationTestResultSamples;
          }
          else
          {
            v36 = [MEMORY[0x263EFF980] array];
          }
          v62 = self->_ovulationTestResultSamples;
          self->_ovulationTestResultSamples = v36;

          v12 = self->_ovulationTestResultSamples;
          goto LABEL_12;
        case '_':
          menstrualFlowSamples = self->_menstrualFlowSamples;
          if (menstrualFlowSamples)
          {
            v38 = menstrualFlowSamples;
          }
          else
          {
            v38 = [MEMORY[0x263EFF980] array];
          }
          v63 = self->_menstrualFlowSamples;
          self->_menstrualFlowSamples = v38;

          v12 = self->_menstrualFlowSamples;
          goto LABEL_12;
          intermenstrualBleedingSamples = self->_intermenstrualBleedingSamples;
          if (intermenstrualBleedingSamples)
          {
            v40 = intermenstrualBleedingSamples;
          }
          else
          {
            v40 = [MEMORY[0x263EFF980] array];
          }
          v64 = self->_intermenstrualBleedingSamples;
          self->_intermenstrualBleedingSamples = v40;

          v12 = self->_intermenstrualBleedingSamples;
          goto LABEL_12;
        case 'a':
          sexualActivitySamples = self->_sexualActivitySamples;
          if (sexualActivitySamples)
          {
            v42 = sexualActivitySamples;
          }
          else
          {
            v42 = [MEMORY[0x263EFF980] array];
          }
          v65 = self->_sexualActivitySamples;
          self->_sexualActivitySamples = v42;

          v12 = self->_sexualActivitySamples;
          goto LABEL_12;
        default:
          goto LABEL_51;
      }
    }
    goto LABEL_8;
  }
  if (v6 > 242)
  {
    if (v6 <= 255)
    {
      if (v6 == 243)
      {
        pregnancyTestResultSamples = self->_pregnancyTestResultSamples;
        if (pregnancyTestResultSamples)
        {
          v48 = pregnancyTestResultSamples;
        }
        else
        {
          v48 = [MEMORY[0x263EFF980] array];
        }
        v68 = self->_pregnancyTestResultSamples;
        self->_pregnancyTestResultSamples = v48;

        v12 = self->_pregnancyTestResultSamples;
        goto LABEL_12;
      }
      if (v6 == 244)
      {
        progesteroneTestResultSamples = self->_progesteroneTestResultSamples;
        if (progesteroneTestResultSamples)
        {
          v32 = progesteroneTestResultSamples;
        }
        else
        {
          v32 = [MEMORY[0x263EFF980] array];
        }
        v60 = self->_progesteroneTestResultSamples;
        self->_progesteroneTestResultSamples = v32;

        v12 = self->_progesteroneTestResultSamples;
        goto LABEL_12;
      }
    }
    else
    {
      switch(v6)
      {
        case 256:
          wristTemperatureSamples = self->_wristTemperatureSamples;
          if (wristTemperatureSamples)
          {
            v44 = wristTemperatureSamples;
          }
          else
          {
            v44 = [MEMORY[0x263EFF980] array];
          }
          v66 = self->_wristTemperatureSamples;
          self->_wristTemperatureSamples = v44;

          v12 = self->_wristTemperatureSamples;
          goto LABEL_12;
        case 313:
          bleedingInPregnancyFlowSamples = self->_bleedingInPregnancyFlowSamples;
          if (bleedingInPregnancyFlowSamples)
          {
            v46 = bleedingInPregnancyFlowSamples;
          }
          else
          {
            v46 = [MEMORY[0x263EFF980] array];
          }
          v67 = self->_bleedingInPregnancyFlowSamples;
          self->_bleedingInPregnancyFlowSamples = v46;

          v12 = self->_bleedingInPregnancyFlowSamples;
          goto LABEL_12;
        case 314:
          bleedingAfterPregnancyFlowSamples = self->_bleedingAfterPregnancyFlowSamples;
          if (bleedingAfterPregnancyFlowSamples)
          {
            v21 = bleedingAfterPregnancyFlowSamples;
          }
          else
          {
            v21 = [MEMORY[0x263EFF980] array];
          }
          v59 = self->_bleedingAfterPregnancyFlowSamples;
          self->_bleedingAfterPregnancyFlowSamples = v21;

          v12 = self->_bleedingAfterPregnancyFlowSamples;
          goto LABEL_12;
      }
    }
LABEL_51:
    v49 = [MEMORY[0x263F08690] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"HDMCDaySummaryBuilder.m", 144, @"%@: Invalid data type", objc_opt_class() object file lineNumber description];
LABEL_61:

    goto LABEL_13;
  }
  if ((unint64_t)(v6 - 229) < 7)
  {
LABEL_8:
    symptomsSamples = self->_symptomsSamples;
    if (symptomsSamples)
    {
      v10 = symptomsSamples;
    }
    else
    {
      v10 = [MEMORY[0x263EFF980] array];
    }
    v11 = self->_symptomsSamples;
    self->_symptomsSamples = v10;

    v12 = self->_symptomsSamples;
LABEL_12:
    [(NSMutableArray *)v12 addObject:v69];
    goto LABEL_13;
  }
  if ((unint64_t)(v6 - 191) >= 3) {
    goto LABEL_51;
  }
  calendarCache = self->_calendarCache;
  v23 = [v69 _timeZone];
  v24 = [(HKCalendarCache *)calendarCache calendarForTimeZone:v23];
  uint64_t v25 = objc_msgSend(v69, "hk_dayIndexRangeWithCalendar:", v24);
  uint64_t v27 = v26;

  int64_t dayIndex = self->_dayIndex;
  if (v25 == dayIndex)
  {
    startedCycleFactors = self->_startedCycleFactors;
    if (startedCycleFactors)
    {
      v30 = startedCycleFactors;
    }
    else
    {
      v30 = [MEMORY[0x263EFF980] array];
    }
    v50 = self->_startedCycleFactors;
    self->_startedCycleFactors = v30;

    v51 = self->_startedCycleFactors;
    v52 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v69, "hkmc_cycleFactor"));
    [(NSMutableArray *)v51 addObject:v52];

    int64_t dayIndex = self->_dayIndex;
  }
  uint64_t v53 = v27 + v25 - 1;
  if (v27 <= 0) {
    uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v53 == dayIndex)
  {
    endedCycleFactors = self->_endedCycleFactors;
    if (endedCycleFactors)
    {
      v55 = endedCycleFactors;
    }
    else
    {
      v55 = [MEMORY[0x263EFF980] array];
    }
    v56 = self->_endedCycleFactors;
    self->_endedCycleFactors = v55;

    v57 = self->_endedCycleFactors;
    v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v69, "hkmc_cycleFactor"));
    [(NSMutableArray *)v57 addObject:v49];
    goto LABEL_61;
  }
LABEL_13:
  v13 = [v69 sampleType];
  if (objc_msgSend(v13, "hkmc_requiresMultipleReplaceConfirmation"))
  {
    sampleCountByType = self->_sampleCountByType;
    if (sampleCountByType) {
      v15 = sampleCountByType;
    }
    else {
      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v16 = self->_sampleCountByType;
    self->_sampleCountByType = v15;

    v17 = NSNumber;
    v18 = [(NSMutableDictionary *)self->_sampleCountByType objectForKeyedSubscript:v13];
    v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue") + 1);
    [(NSMutableDictionary *)self->_sampleCountByType setObject:v19 forKeyedSubscript:v13];
  }
}

- (HDMCDaySummaryBuilder)initWithProfile:(id)a3 dayIndex:(int64_t)a4 orderedWatchSources:(id)a5 calendarCache:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDMCDaySummaryBuilder;
  v13 = [(HDMCDaySummaryBuilder *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    v14->_int64_t dayIndex = a4;
    uint64_t v15 = [v11 copy];
    orderedWatchSources = v14->_orderedWatchSources;
    v14->_orderedWatchSources = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_calendarCache, a6);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCountByType, 0);
  objc_storeStrong((id *)&self->_endedCycleFactors, 0);
  objc_storeStrong((id *)&self->_startedCycleFactors, 0);
  objc_storeStrong((id *)&self->_wristTemperatureSamples, 0);
  objc_storeStrong((id *)&self->_basalBodyTemperatureSamples, 0);
  objc_storeStrong((id *)&self->_cervicalMucusQualitySamples, 0);
  objc_storeStrong((id *)&self->_progesteroneTestResultSamples, 0);
  objc_storeStrong((id *)&self->_pregnancyTestResultSamples, 0);
  objc_storeStrong((id *)&self->_ovulationTestResultSamples, 0);
  objc_storeStrong((id *)&self->_sexualActivitySamples, 0);
  objc_storeStrong((id *)&self->_symptomsSamples, 0);
  objc_storeStrong((id *)&self->_intermenstrualBleedingSamples, 0);
  objc_storeStrong((id *)&self->_bleedingAfterPregnancyFlowSamples, 0);
  objc_storeStrong((id *)&self->_bleedingInPregnancyFlowSamples, 0);
  objc_storeStrong((id *)&self->_menstrualFlowSamples, 0);
  objc_storeStrong((id *)&self->_orderedWatchSources, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (id)createDaySummaryWithDevice:(id)a3
{
  id v24 = 0;
  uint64_t v25 = 0;
  int64_t v23 = [(HDMCDaySummaryBuilder *)self _menstrualFlowWithModificationDay:&v25 startOfCycleFromCycleTracking:&v24];
  id v18 = v24;
  int64_t dayIndex = self->_dayIndex;
  v22 = (void *)MEMORY[0x263F45140];
  int64_t v20 = [(HDMCDaySummaryBuilder *)self _bleedingInPregnancyFlow];
  int64_t v19 = [(HDMCDaySummaryBuilder *)self _bleedingAfterPregnancyFlow];
  BOOL v17 = [(HDMCDaySummaryBuilder *)self _intermenstrualBleeding];
  unint64_t v16 = [(HDMCDaySummaryBuilder *)self _symptoms];
  int64_t v15 = [(HDMCDaySummaryBuilder *)self _sexualActivity];
  int64_t v4 = [(HDMCDaySummaryBuilder *)self _ovulationTestResult];
  int64_t v5 = [(HDMCDaySummaryBuilder *)self _pregnancyTestResult];
  int64_t v6 = [(HDMCDaySummaryBuilder *)self _progesteroneTestResult];
  int64_t v7 = [(HDMCDaySummaryBuilder *)self _cervicalMucusQuality];
  v8 = [(HDMCDaySummaryBuilder *)self _basalBodyTemperature];
  v9 = [(HDMCDaySummaryBuilder *)self _wristTemperature];
  uint64_t v10 = v25;
  id v11 = [(HDMCDaySummaryBuilder *)self _startedCycleFactors];
  id v12 = [(HDMCDaySummaryBuilder *)self _endedCycleFactors];
  objc_msgSend(v22, "daySummaryWithDayIndex:menstrualFlow:bleedingInPregnancyFlow:bleedingAfterPregnancyFlow:intermenstrualBleeding:symptoms:sexualActivity:ovulationTestResult:pregnancyTestResult:progesteroneTestResult:cervicalMucusQuality:basalBodyTemperature:wristTemperature:menstrualFlowModificationDayIndex:startOfCycleFromCycleTracking:startedCycleFactors:endedCycleFactors:sampleCountByType:", dayIndex, v23, v20, v19, v17, v16, v15, v4, v5, v6, v7, v8, v9, v10,
    v18,
    v11,
    v12,
  v13 = self->_sampleCountByType);

  return v13;
}

- (id)_wristTemperature
{
  wristTemperatureSamples = self->_wristTemperatureSamples;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HDMCDaySummaryBuilder__wristTemperature__block_invoke;
  v9[3] = &unk_264751500;
  v9[4] = self;
  [(NSMutableArray *)wristTemperatureSamples sortUsingComparator:v9];
  int64_t v4 = [(NSMutableArray *)self->_wristTemperatureSamples firstObject];

  if (v4)
  {
    int64_t v5 = (void *)MEMORY[0x263F45208];
    int64_t v6 = [(NSMutableArray *)self->_wristTemperatureSamples firstObject];
    int64_t v7 = [v5 wristTemperatureFromWristTemperatureSample:v6];
  }
  else
  {
    int64_t v7 = 0;
  }
  return v7;
}

- (unint64_t)_symptoms
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_symptomsSamples;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hkmc_daySummarySymptom", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_startedCycleFactors
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->_startedCycleFactors count];
  if (v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_startedCycleFactors];
  }
  return v3;
}

- (int64_t)_sexualActivity
{
  [(NSMutableArray *)self->_sexualActivitySamples sortUsingComparator:&__block_literal_global_295];
  uint64_t v3 = [(NSMutableArray *)self->_sexualActivitySamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummarySexualActivity");

  return v4;
}

- (int64_t)_progesteroneTestResult
{
  [(NSMutableArray *)self->_progesteroneTestResultSamples sortUsingComparator:&__block_literal_global_301];
  uint64_t v3 = [(NSMutableArray *)self->_progesteroneTestResultSamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummaryProgesteroneTestResult");

  return v4;
}

- (int64_t)_pregnancyTestResult
{
  [(NSMutableArray *)self->_pregnancyTestResultSamples sortUsingComparator:&__block_literal_global_299];
  uint64_t v3 = [(NSMutableArray *)self->_pregnancyTestResultSamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummaryPregnancyTestResult");

  return v4;
}

- (int64_t)_ovulationTestResult
{
  [(NSMutableArray *)self->_ovulationTestResultSamples sortUsingComparator:&__block_literal_global_297];
  uint64_t v3 = [(NSMutableArray *)self->_ovulationTestResultSamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummaryOvulationTestResult");

  return v4;
}

- (int64_t)_menstrualFlowWithModificationDay:(int64_t *)a3 startOfCycleFromCycleTracking:(id *)a4
{
  [(NSMutableArray *)self->_menstrualFlowSamples sortUsingComparator:&__block_literal_global_6];
  int64_t v7 = [(NSMutableArray *)self->_menstrualFlowSamples lastObject];
  v8 = v7;
  if (v7)
  {
    long long v9 = [v7 _creationDate];
    calendarCache = self->_calendarCache;
    long long v11 = [v8 _timeZone];
    long long v12 = [(HKCalendarCache *)calendarCache calendarForTimeZone:v11];
    *a3 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v12);

    if (objc_msgSend(v8, "hkmc_wasEnteredFromCycleTracking"))
    {
      v13 = [v8 metadata];
      uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F09AC0]];
      uint64_t v15 = [v14 BOOLValue];

      *a4 = [NSNumber numberWithBool:v15];
    }
  }
  int64_t v16 = objc_msgSend(v8, "hkmc_daySummaryMenstrualFlow");

  return v16;
}

- (BOOL)_intermenstrualBleeding
{
  return [(NSMutableArray *)self->_intermenstrualBleedingSamples count] != 0;
}

- (id)_endedCycleFactors
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->_endedCycleFactors count];
  if (v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_endedCycleFactors];
  }
  return v3;
}

- (int64_t)_cervicalMucusQuality
{
  [(NSMutableArray *)self->_cervicalMucusQualitySamples sortUsingComparator:&__block_literal_global_303];
  uint64_t v3 = [(NSMutableArray *)self->_cervicalMucusQualitySamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummaryCervicalMucusQuality");

  return v4;
}

- (int64_t)_bleedingInPregnancyFlow
{
  [(NSMutableArray *)self->_bleedingInPregnancyFlowSamples sortUsingComparator:&__block_literal_global_291];
  uint64_t v3 = [(NSMutableArray *)self->_bleedingInPregnancyFlowSamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummaryBleedingInPregnancyFlow");

  return v4;
}

- (int64_t)_bleedingAfterPregnancyFlow
{
  [(NSMutableArray *)self->_bleedingAfterPregnancyFlowSamples sortUsingComparator:&__block_literal_global_293];
  uint64_t v3 = [(NSMutableArray *)self->_bleedingAfterPregnancyFlowSamples lastObject];
  int64_t v4 = objc_msgSend(v3, "hkmc_daySummaryBleedingAfterPregnancyFlow");

  return v4;
}

- (id)_basalBodyTemperature
{
  [(NSMutableArray *)self->_basalBodyTemperatureSamples sortUsingComparator:&__block_literal_global_306];
  uint64_t v3 = [(NSMutableArray *)self->_basalBodyTemperatureSamples lastObject];
  int64_t v4 = [v3 quantity];

  return v4;
}

uint64_t __89__HDMCDaySummaryBuilder__menstrualFlowWithModificationDay_startOfCycleFromCycleTracking___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryMenstrualFlow"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryMenstrualFlow");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __49__HDMCDaySummaryBuilder__bleedingInPregnancyFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryBleedingInPregnancyFlow"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryBleedingInPregnancyFlow");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __52__HDMCDaySummaryBuilder__bleedingAfterPregnancyFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryBleedingAfterPregnancyFlow"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryBleedingAfterPregnancyFlow");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __40__HDMCDaySummaryBuilder__sexualActivity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummarySexualActivity"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummarySexualActivity");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __45__HDMCDaySummaryBuilder__ovulationTestResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryOvulationTestResult"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryOvulationTestResult");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __45__HDMCDaySummaryBuilder__pregnancyTestResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryPregnancyTestResult"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryPregnancyTestResult");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __48__HDMCDaySummaryBuilder__progesteroneTestResult__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryProgesteroneTestResult"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryProgesteroneTestResult");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __46__HDMCDaySummaryBuilder__cervicalMucusQuality__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "hkmc_daySummaryCervicalMucusQuality"));
  int64_t v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v5, "hkmc_daySummaryCervicalMucusQuality");

  long long v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __46__HDMCDaySummaryBuilder__basalBodyTemperature__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __42__HDMCDaySummaryBuilder__wristTemperature__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v8 = [v5 sourceRevision];
  long long v9 = [v8 source];
  unint64_t v10 = [v7 indexOfObject:v9];

  long long v11 = *(void **)(*(void *)(a1 + 32) + 24);
  long long v12 = [v6 sourceRevision];
  v13 = [v12 source];
  unint64_t v14 = [v11 indexOfObject:v13];

  if (v10 >= v14)
  {
    if (v10 > v14)
    {
      uint64_t v15 = 1;
    }
    else
    {
      int64_t v16 = [v6 startDate];
      BOOL v17 = [v5 startDate];
      uint64_t v15 = [v16 compare:v17];
    }
  }
  else
  {
    uint64_t v15 = -1;
  }

  return v15;
}

- (int64_t)dayIndex
{
  return self->_dayIndex;
}

@end
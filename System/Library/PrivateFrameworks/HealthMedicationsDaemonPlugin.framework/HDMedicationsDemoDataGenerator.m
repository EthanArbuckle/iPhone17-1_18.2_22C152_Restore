@interface HDMedicationsDemoDataGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)_saveStateWithError:(id *)a3;
- (BOOL)loadDemoDataObjectsFrom:(id)a3 medications:(id)a4 schedules:(id)a5 logHistory:(id)a6;
- (BOOL)saveMedicationDoseEvents:(id)a3 error:(id *)a4;
- (BOOL)saveMedications:(id)a3 schedules:(id)a4 logHistory:(id)a5;
- (BOOL)setupOntologyContentIfRequired;
- (HDMedicationsDemoDataGenerator)init;
- (HDMedicationsDemoDataGenerator)initWithCoder:(id)a3;
- (HDProfile)profile;
- (id)_keyValueDomain;
- (id)_scheduleItemsForDate:(id)a3;
- (id)asNeededDoseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5;
- (id)dailyScheduleForMedicationIdentifier:(id)a3 isAMSchedule:(BOOL)a4;
- (id)dayBeforeDate:(id)a3 withHour:(int64_t)a4;
- (id)doseEventWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 medicationIdentifier:(id)a5 scheduledDoseQuantity:(id)a6 doseQuantity:(id)a7 scheduledDate:(id)a8 startDate:(id)a9 status:(int64_t)a10;
- (id)doseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5 logOrigin:(int64_t)a6;
- (id)doseEventsForScheduleItems:(id)a3 withStatus:(int64_t)a4;
- (id)medicationWithDetail:(id)a3;
- (id)scheduledDoseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5;
- (id)scheduledDoseEventsWithCurrentDate:(id)a3;
- (int64_t)dayDifferenceFrom:(id)a3 to:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)generateDemoDataForCurrentDate:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateIntitialDemoDataIfRequired;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)overrideMedicationShardCheck;
- (void)restoreState;
- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4;
- (void)setupOntologyContentIfRequired;
- (void)updateDemoDataFileName;
@end

@implementation HDMedicationsDemoDataGenerator

- (HDMedicationsDemoDataGenerator)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationsDemoDataGenerator;
  v2 = [(HDMedicationsDemoDataGenerator *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->isGeneratingDataOnWatch = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
    uint64_t v5 = [v4 currentCalendar];
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = (NSCalendar *)v5;

    v7 = objc_alloc_init(HDMedicationsDemoDataGeneratorState);
    state = v3->_state;
    v3->_state = v7;

    [(HDMedicationsDemoDataGenerator *)v3 updateDemoDataFileName];
    [(HDMedicationsDemoDataGenerator *)v3 overrideMedicationShardCheck];
  }
  return v3;
}

- (void)updateDemoDataFileName
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = HKLogMedication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    objc_super v10 = self;
    __int16 v11 = 1024;
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_isUSLocale");
    _os_log_impl(&dword_1BD54A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateDemoDataFileName  [NSLocale hk_isUSLocale] %d .", (uint8_t *)&v9, 0x12u);
  }

  if (([MEMORY[0x1E4F2B860] isRunningStoreDemoMode] & 1) != 0
    || [MEMORY[0x1E4F2B860] runningInStoreDemoModeF201])
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_isUSLocale");
    uint64_t v5 = @"medications_store_demo_data_NonUS";
    v6 = @"medications_store_demo_data_US";
  }
  else
  {
    int v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_isUSLocale");
    uint64_t v5 = @"medications_demo_data_NonUS";
    v6 = @"medications_demo_data_US";
  }
  if (v4) {
    uint64_t v5 = v6;
  }
  v7 = v5;
  demoDataFileName = self->_demoDataFileName;
  self->_demoDataFileName = v7;
}

- (void)overrideMedicationShardCheck
{
  v2 = [(HDMedicationsDemoDataGenerator *)self profile];
  v3 = [v2 healthMedicationsProfileExtension];
  id v4 = [v3 medicationUserDefaults];

  [v4 setBool:1 forKey:*MEMORY[0x1E4F66A38]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_keyValueDomain
{
  id v3 = objc_alloc(MEMORY[0x1E4F65B28]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = (void *)[v3 initWithCategory:3 domainName:@"MedicationsDemoData" profile:WeakRetained];

  return v5;
}

- (BOOL)_saveStateWithError:(id *)a3
{
  uint64_t v5 = [(HDMedicationsDemoDataGenerator *)self _keyValueDomain];
  v6 = [(HDMedicationsDemoDataGeneratorState *)self->_state dictionary];
  LOBYTE(a3) = [v5 setValuesWithDictionary:v6 error:a3];

  return (char)a3;
}

- (void)restoreState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HDMedicationsDemoDataGenerator *)self _keyValueDomain];
  id v9 = 0;
  id v4 = [v3 allValuesWithError:&v9];
  id v5 = v9;
  if (v4)
  {
    v6 = [[HDMedicationsDemoDataGeneratorState alloc] initWithDictionary:v4];
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v11 = self;
      __int16 v12 = 2114;
      uint64_t v13 = v3;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_error_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Could not load HDMedicationsDemoDataGeneratorState from KeyValueDomain %{public}@  Error: %{public}@", buf, 0x20u);
    }

    v6 = objc_alloc_init(HDMedicationsDemoDataGeneratorState);
  }
  state = self->_state;
  self->_state = v6;
}

- (HDMedicationsDemoDataGenerator)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HDMedicationsDemoDataGenerator;
  id v3 = [(HDMedicationsDemoDataGenerator *)&v9 init];
  id v4 = v3;
  if (v3)
  {
    v3->isGeneratingDataOnWatch = 0;
    id v5 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
    uint64_t v6 = [v5 currentCalendar];
    currentCalendar = v4->_currentCalendar;
    v4->_currentCalendar = (NSCalendar *)v6;

    [(HDMedicationsDemoDataGenerator *)v4 restoreState];
    [(HDMedicationsDemoDataGenerator *)v4 updateDemoDataFileName];
    [(HDMedicationsDemoDataGenerator *)v4 overrideMedicationShardCheck];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)doseEventWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 medicationIdentifier:(id)a5 scheduledDoseQuantity:(id)a6 doseQuantity:(id)a7 scheduledDate:(id)a8 startDate:(id)a9 status:(int64_t)a10
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v15 = (void *)MEMORY[0x1E4F2B1F0];
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = [v15 syncIdentifierForScheduleItemIdentifier:0 medicationIdentifier:v20];
  v23 = [MEMORY[0x1E4F2B1F0] syncVersionForStatus:4];
  uint64_t v24 = *MEMORY[0x1E4F2A1F8];
  v29[0] = *MEMORY[0x1E4F2A1F0];
  v29[1] = v24;
  v30[0] = v22;
  v30[1] = v23;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v26 = [MEMORY[0x1E4F2B1F0] medicationDoseEventWithLogOrigin:a3 scheduleItemIdentifier:v21 medicationIdentifier:v20 scheduledDoseQuantity:v19 doseQuantity:v18 scheduledDate:v17 startDate:v16 status:a10 metadata:v25];

  return v26;
}

- (BOOL)saveMedicationDoseEvents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDMedicationsDemoDataGenerator *)self profile];
  v8 = +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:v7 error:a4];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_super v10 = [WeakRetained dataManager];
    char v11 = [v10 insertDataObjects:v6 sourceEntity:v8 deviceEntity:0 sourceVersion:0 creationDate:a4 error:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)asNeededDoseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = v9;
  id v17 = v11;
  if (a5)
  {
    uint64_t v12 = 0x800000000;
    uint64_t v13 = v11;
    do
    {
      __int16 v14 = [(HDMedicationsDemoDataGenerator *)self doseEventWithLogOrigin:1 scheduleItemIdentifier:0 medicationIdentifier:v8 scheduledDoseQuantity:0 doseQuantity:&unk_1F17FC138 scheduledDate:0 startDate:v13 status:4];
      [v10 addObject:v14];

      id v11 = [v13 dateByAddingTimeInterval:-691200.0];

      BOOL v15 = a5 > v12 >> 32;
      v12 += 0x800000000;
      uint64_t v13 = v11;
    }
    while (v15);
  }

  return v10;
}

- (id)scheduledDoseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = v9;
  id v20 = v11;
  if (a5)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v11;
    do
    {
      __int16 v14 = [MEMORY[0x1E4F66B50] makeStableIdentifierFromScheduledDateTime:v13];
      if ((v12 & 0x7FFFFFF7) != 0) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = 5;
      }
      if ((v12 & 0x7FFFFFF7) != 0) {
        double v16 = 300.0;
      }
      else {
        double v16 = 0.0;
      }
      id v17 = [v13 dateByAddingTimeInterval:v16];
      id v18 = [(HDMedicationsDemoDataGenerator *)self doseEventWithLogOrigin:2 scheduleItemIdentifier:v14 medicationIdentifier:v8 scheduledDoseQuantity:&unk_1F17FC138 doseQuantity:&unk_1F17FC138 scheduledDate:v13 startDate:v17 status:v15];
      [v10 addObject:v18];

      ++v12;
      id v11 = [v13 dateByAddingTimeInterval:-86400.0];

      uint64_t v13 = v11;
    }
    while (a5 != v12);
  }

  return v10;
}

- (id)doseEventsForMedication:(id)a3 startDateTime:(id)a4 historyDayCount:(unint64_t)a5 logOrigin:(int64_t)a6
{
  if (a6 == 2) {
    [(HDMedicationsDemoDataGenerator *)self scheduledDoseEventsForMedication:a3 startDateTime:a4 historyDayCount:a5];
  }
  else {
  id v6 = [(HDMedicationsDemoDataGenerator *)self asNeededDoseEventsForMedication:a3 startDateTime:a4 historyDayCount:a5];
  }
  return v6;
}

- (id)dailyScheduleForMedicationIdentifier:(id)a3 isAMSchedule:(BOOL)a4
{
  BOOL v4 = a4;
  v21[1] = *MEMORY[0x1E4F143B8];
  currentCalendar = self->_currentCalendar;
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a3;
  id v9 = [v7 date];
  id v10 = [(NSCalendar *)currentCalendar startOfDayForDate:v9];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v12 = v11;
  if (v4) {
    uint64_t v13 = 8;
  }
  else {
    uint64_t v13 = 20;
  }
  [v11 setHour:v13];
  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F66B48]) initWithStartTimeComponent:v12 daysOfWeek:0 cycleIndex:0 cycleIntervalDays:0 dose:&unk_1F17FC138];
  id v15 = objc_alloc(MEMORY[0x1E4F66B28]);
  double v16 = [MEMORY[0x1E4F29128] UUID];
  id v17 = [(NSCalendar *)self->_currentCalendar timeZone];
  v21[0] = v14;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v19 = (void *)[v15 initWithUUID:v16 medicationIdentifier:v8 createdUTCOffset:v17 startDateTime:v10 endDateTime:0 timeIntervals:v18 scheduleType:2 cycleStartDateComponents:0 note:0];

  return v19;
}

- (id)medicationWithDetail:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"VisualConfigFileName"];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v5 stringByDeletingPathExtension];
  id v8 = [v5 pathExtension];
  uint64_t v9 = [v6 pathForResource:v7 ofType:v8];

  v40 = (void *)v9;
  id v10 = [NSString stringWithContentsOfFile:v9 encoding:4 error:0];
  if (self->isGeneratingDataOnWatch) {
    goto LABEL_2;
  }
  uint64_t v19 = [v4 objectForKey:@"OntologyCoding"];
  if (!v19) {
    goto LABEL_2;
  }
  id v20 = (void *)v19;
  id v21 = [v4 objectForKey:@"OntologyCoding"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v4 objectForKey:@"OntologyCoding"];
    v23 = (void *)MEMORY[0x1E4F2B668];
    uint64_t v24 = [v4 objectForKey:@"NickName"];
    v25 = [v23 propertyCollectionWithUserSpecifiedName:v24 userSpecifiedNotes:0 medicationVisualizationConfig:v10 freeTextProperties:0];
    v26 = [v25 properties];

    v27 = (void *)MEMORY[0x1E4F65C20];
    v39 = [MEMORY[0x1E4F2ADE8] identifierWithNumber:v11];
    v28 = [MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
    v29 = [(HDMedicationsDemoDataGenerator *)self profile];
    id v41 = 0;
    v30 = [v27 createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:v39 additionalProperties:v26 userDomainConceptTypeIdentifier:v28 profile:v29 error:&v41];
    id v31 = v41;

    _HKInitializeLogging();
    v32 = HKLogMedication();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v43 = self;
      __int16 v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_1BD54A000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Medication generated from ontology code %{public}@ .", buf, 0x16u);
    }
  }
  else
  {
LABEL_2:
    id v11 = [v4 objectForKey:@"Strength"];
    if (v11)
    {
      uint64_t v12 = [v4 objectForKey:@"Strength"];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        __int16 v14 = [v4 objectForKey:@"Strength"];
        id v15 = [v4 objectForKey:@"isStrengthInMCG"];
        if ([v15 BOOLValue]) {
          uint64_t v16 = 3;
        }
        else {
          uint64_t v16 = 4;
        }

        id v17 = (void *)MEMORY[0x1E4F2B370];
        id v18 = [MEMORY[0x1E4F2B618] gramUnitWithMetricPrefix:v16];
        [v14 doubleValue];
        id v11 = objc_msgSend(v17, "quantityWithUnit:doubleValue:", v18);
      }
      else
      {
        id v11 = 0;
      }
    }
    v33 = (void *)MEMORY[0x1E4F2B668];
    v34 = [v4 objectForKey:@"Name"];
    v35 = [v4 objectForKey:@"DoseFormCode"];
    v26 = objc_msgSend(v33, "userDomainConceptPropertyListWithFreeTextMedicationName:freeTextFormCode:freeTextStrengthQuantity:", v34, (int)objc_msgSend(v35, "intValue"), v11);

    id v36 = objc_alloc(MEMORY[0x1E4F66B80]);
    v37 = [v4 objectForKey:@"NickName"];
    v30 = (void *)[v36 initWithOntologyCoding:0 userSpecifiedName:v37 userSpecifiedNotes:0 medicationVisualizationConfig:v10 freeTextProperties:v26];

    _HKInitializeLogging();
    v32 = HKLogMedication();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v43 = self;
      __int16 v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_1BD54A000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Medication generated as free text med %{public}@ .", buf, 0x16u);
    }
    id v31 = 0;
  }

  return v30;
}

- (BOOL)saveMedications:(id)a3 schedules:(id)a4 logHistory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v12 = [WeakRetained database];
  char v13 = [MEMORY[0x1E4F65B08] contextForWritingProtectedData];
  id v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __71__HDMedicationsDemoDataGenerator_saveMedications_schedules_logHistory___block_invoke;
  v21[3] = &unk_1E63370F8;
  v21[4] = self;
  id v14 = v8;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  id v16 = v10;
  id v24 = v16;
  char v17 = [v12 performTransactionWithContext:v13 error:&v25 block:v21 inaccessibilityHandler:0];
  id v18 = v25;

  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v19 = HKLogMedication();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationsDemoDataGenerator saveMedications:schedules:logHistory:]();
    }
  }
  return v17;
}

uint64_t __71__HDMedicationsDemoDataGenerator_saveMedications_schedules_logHistory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v6 = [WeakRetained userDomainConceptManager];
  int v7 = [v6 updateUserDomainConcepts:*(void *)(a1 + 40) error:a3];

  if (!v7) {
    return 0;
  }
  id v8 = [*(id *)(a1 + 32) profile];
  id v9 = [v8 healthMedicationsProfileExtension];
  id v10 = [v9 medicationScheduleManager];

  if ([v10 insertMedicationSchedules:*(void *)(a1 + 48) error:a3]
    && [*(id *)(a1 + 32) saveMedicationDoseEvents:*(void *)(a1 + 56) error:a3])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setDidSaveIntialData:1];
    uint64_t v11 = [*(id *)(a1 + 32) _saveStateWithError:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)loadDemoDataObjectsFrom:(id)a3 medications:(id)a4 schedules:(id)a5 logHistory:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v38 = a6;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v41 = v11;
    uint64_t v42 = *(void *)v44;
    id obj = v12;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v17 = [(HDMedicationsDemoDataGenerator *)self medicationWithDetail:v16];
        if (!v17)
        {
          _HKInitializeLogging();
          id v36 = HKLogMedication();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[HDMedicationsDemoDataGenerator loadDemoDataObjectsFrom:medications:schedules:logHistory:]();
          }

          BOOL v35 = 0;
          id v12 = obj;
          v34 = obj;
          goto LABEL_27;
        }
        id v18 = (void *)v17;
        [v11 addObject:v17];
        uint64_t v19 = [v18 semanticIdentifier];
        id v20 = [v19 stringValue];

        id v21 = [v16 objectForKey:@"hasSchedule"];
        int v22 = [v21 BOOLValue];

        if (v22)
        {
          id v23 = [v16 objectForKey:@"isAMSchedule"];
          id v24 = -[HDMedicationsDemoDataGenerator dailyScheduleForMedicationIdentifier:isAMSchedule:](self, "dailyScheduleForMedicationIdentifier:isAMSchedule:", v20, [v23 BOOLValue]);

          [v39 addObject:v24];
          [(HDMedicationsDemoDataGeneratorState *)self->_state setHasScheduledMedications:1];

          id v11 = v41;
          uint64_t v25 = 2;
        }
        else
        {
          uint64_t v25 = 1;
        }
        if (!self->isGeneratingDataOnWatch)
        {
          v26 = [v16 objectForKey:@"shouldGenerateLogHistory"];
          int v27 = [v26 BOOLValue];

          id v11 = v41;
          if (v27)
          {
            if (v22)
            {
              v28 = [v16 objectForKey:@"isAMSchedule"];
              if ([v28 BOOLValue]) {
                uint64_t v29 = 8;
              }
              else {
                uint64_t v29 = 20;
              }
            }
            else
            {
              uint64_t v29 = 15;
            }
            v30 = [MEMORY[0x1E4F1C9C8] date];
            id v31 = [(HDMedicationsDemoDataGenerator *)self dayBeforeDate:v30 withHour:v29];

            [(HDMedicationsDemoDataGeneratorState *)self->_state setLatestLogDate:v31];
            v32 = [(HDMedicationsDemoDataGenerator *)self doseEventsForMedication:v20 startDateTime:v31 historyDayCount:30 logOrigin:v25];
            if ([v32 count])
            {
              [(HDMedicationsDemoDataGeneratorState *)self->_state setLatestLogDate:v31];
              [(HDMedicationsDemoDataGeneratorState *)self->_state setLatestTakenLogDate:v31];
            }
            [v38 addObjectsFromArray:v32];
          }
        }
      }
      id v12 = obj;
      uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v33 = (void *)[objc_alloc(MEMORY[0x1E4F2B148]) initWithListType:2 listName:@"Active Medications"];
  v34 = [v33 listByAddingUserDomainConcepts:v11];

  [v11 addObject:v34];
  BOOL v35 = 1;
LABEL_27:

  return v35;
}

- (void)generateIntitialDemoDataIfRequired
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(HDMedicationsDemoDataGeneratorState *)self->_state didSaveIntialData])
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = [v4 pathForResource:self->_demoDataFileName ofType:@"json"];

    _HKInitializeLogging();
    id v5 = HKLogMedication();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      uint64_t v23 = (uint64_t)v3;
      _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] generateDemoData JSON path %{public}@", (uint8_t *)&v20, 0x16u);
    }

    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
    int v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
    id v8 = v7;
    if (!v7 || ![v7 count])
    {
      _HKInitializeLogging();
      id v10 = HKLogMedication();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        id v21 = self;
        __int16 v22 = 2114;
        uint64_t v23 = (uint64_t)v3;
        _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not decode JSON file %{public}@", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_21;
    }
    _HKInitializeLogging();
    id v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      uint64_t v23 = (uint64_t)v8;
      _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] generateDemoData medicationDetails from JSON %{public}@", (uint8_t *)&v20, 0x16u);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(HDMedicationsDemoDataGenerator *)self loadDemoDataObjectsFrom:v8 medications:v10 schedules:v11 logHistory:v12])
    {
      if (![(HDMedicationsDemoDataGenerator *)self saveMedications:v10 schedules:v11 logHistory:v12])
      {
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      _HKInitializeLogging();
      uint64_t v13 = HKLogMedication();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v10 count];
        uint64_t v15 = [v11 count];
        uint64_t v16 = [v12 count];
        int v20 = 138544130;
        id v21 = self;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2048;
        uint64_t v25 = v15;
        __int16 v26 = 2048;
        uint64_t v27 = v16;
        uint64_t v17 = "[%{public}@] Complete generateDemoData UDC Count %lu schdule count %lu logHistory count %lu";
        id v18 = v13;
        uint32_t v19 = 42;
LABEL_18:
        _os_log_impl(&dword_1BD54A000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
      }
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v13 = HKLogMedication();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        id v21 = self;
        __int16 v22 = 2114;
        uint64_t v23 = (uint64_t)v8;
        uint64_t v17 = "[%{public}@] Could not create objects from Medication details %{public}@";
        id v18 = v13;
        uint32_t v19 = 22;
        goto LABEL_18;
      }
    }

    goto LABEL_20;
  }
  _HKInitializeLogging();
  id v3 = HKLogMedication();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543362;
    id v21 = self;
    _os_log_impl(&dword_1BD54A000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initial Medications Demo Data is already setup.", (uint8_t *)&v20, 0xCu);
  }
LABEL_22:
}

- (BOOL)setupOntologyContentIfRequired
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->isGeneratingDataOnWatch
    && [MEMORY[0x1E4F66AF0] supportsOntologyBackedMedications]
    && ![(HDMedicationsDemoDataGeneratorState *)self->_state didSetupOntologyData])
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 URLForResource:@"MedsDemoData-MercuryZipTSV-002-27000024" withExtension:@"zip"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v8 = [WeakRetained daemon];
    id v9 = [v8 ontologyUpdateCoordinator];
    uint64_t v10 = *MEMORY[0x1E4F2A2B8];
    uint64_t v11 = *MEMORY[0x1E4F2A2F8];
    id v18 = 0;
    char v3 = [v9 updateOntologyWithShardIdentifier:v10 schemaType:v11 schemaVersion:HKCurrentSchemaVersionForShardIdentifier() localShardURL:v6 shardVersion:27000024 error:&v18];
    id v12 = v18;

    _HKInitializeLogging();
    uint64_t v13 = HKLogMedication();
    uint64_t v14 = v13;
    if (v3)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        int v20 = self;
        _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully updated ontology shard.", buf, 0xCu);
      }

      [(HDMedicationsDemoDataGeneratorState *)self->_state setDidSetupOntologyData:1];
      id v17 = v12;
      BOOL v15 = [(HDMedicationsDemoDataGenerator *)self _saveStateWithError:&v17];
      id v16 = v17;

      if (v15) {
        goto LABEL_16;
      }
      _HKInitializeLogging();
      uint64_t v14 = HKLogMedication();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationsDemoDataGenerator setupOntologyContentIfRequired]();
      }
      id v12 = v16;
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[HDMedicationsDemoDataGenerator setupOntologyContentIfRequired]();
    }

    id v16 = v12;
LABEL_16:

    return v3;
  }
  return 1;
}

- (id)_scheduleItemsForDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HDMedicationScheduleItemPredicateForScheduledDateTime(1);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  id v20 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke;
  v17[3] = &unk_1E63370D0;
  id v9 = v5;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  BOOL v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:&v20 block:v17];
  id v12 = v20;

  if (v12)
  {
    _HKInitializeLogging();
    uint64_t v13 = HKLogMedication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v22 = self;
      __int16 v23 = 2114;
      id v24 = v4;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_error_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Could not read schedule items for %{public}@ Error: %{public}@", buf, 0x20u);
    }
  }
  if (v11) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

BOOL __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke_2;
  v8[3] = &unk_1E6337120;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  BOOL v6 = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:v5 orderingTerms:0 transaction:a2 error:a3 enumerationHandler:v8];

  return v6;
}

uint64_t __56__HDMedicationsDemoDataGenerator__scheduleItemsForDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)doseEventsForScheduleItems:(id)a3 withStatus:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v35;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v34 + 1) + 8 * v5);
        uint64_t v29 = [v6 identifier];
        int v7 = [v6 scheduledDateTime];
        id v8 = v7;
        uint64_t v24 = v5;
        if (a4 == 4)
        {
          uint64_t v9 = [v7 dateByAddingTimeInterval:300.0];

          id v8 = (void *)v9;
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v25 = [v6 doses];
        uint64_t v10 = [v25 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v25);
              }
              uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v15 = [v14 medicationIdentifier];
              id v16 = [v14 dose];
              id v17 = [v14 dose];
              id v18 = [v6 scheduledDateTime];
              id v19 = [(HDMedicationsDemoDataGenerator *)self doseEventWithLogOrigin:2 scheduleItemIdentifier:v29 medicationIdentifier:v15 scheduledDoseQuantity:v16 doseQuantity:v17 scheduledDate:v18 startDate:v8 status:a4];
              [v27 addObject:v19];
            }
            uint64_t v11 = [v25 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v11);
        }

        uint64_t v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v23);
  }

  return v27;
}

- (id)scheduledDoseEventsWithCurrentDate:(id)a3
{
  id v4 = [(HDMedicationsDemoDataGenerator *)self dayBeforeDate:a3 withHour:0];
  uint64_t v5 = 0;
  if ([(HDMedicationsDemoDataGeneratorState *)self->_state hasScheduledMedications])
  {
    uint64_t v6 = [(HDMedicationsDemoDataGeneratorState *)self->_state latestLogDate];
    if (v6
      && (int v7 = (void *)v6,
          [(HDMedicationsDemoDataGeneratorState *)self->_state latestLogDate],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8 >= v4))
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v9 = [(HDMedicationsDemoDataGeneratorState *)self->_state latestTakenLogDate];
      if (v9)
      {
        uint64_t v10 = [(HDMedicationsDemoDataGeneratorState *)self->_state latestTakenLogDate];
        if ((unint64_t)[(HDMedicationsDemoDataGenerator *)self dayDifferenceFrom:v10 to:v4] <= 7)uint64_t v11 = 4; {
        else
        }
          uint64_t v11 = 5;
      }
      else
      {
        uint64_t v11 = 4;
      }

      uint64_t v12 = [(HDMedicationsDemoDataGenerator *)self _scheduleItemsForDate:v4];
      uint64_t v5 = [(HDMedicationsDemoDataGenerator *)self doseEventsForScheduleItems:v12 withStatus:v11];
      if ([v5 count])
      {
        uint64_t v13 = [v5 objectAtIndexedSubscript:0];
        uint64_t v14 = [v13 startDate];
        [(HDMedicationsDemoDataGeneratorState *)self->_state setLatestLogDate:v14];

        if (v11 == 4)
        {
          id v15 = [v5 objectAtIndexedSubscript:0];
          id v16 = [v15 startDate];
          [(HDMedicationsDemoDataGeneratorState *)self->_state setLatestTakenLogDate:v16];
        }
      }
    }
  }

  return v5;
}

- (void)generateDemoDataForCurrentDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->isGeneratingDataOnWatch)
  {
    uint64_t v5 = [(HDMedicationsDemoDataGenerator *)self scheduledDoseEventsWithCurrentDate:v4];
    uint64_t v6 = v5;
    if (v5 && [v5 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v8 = [WeakRetained database];
      uint64_t v9 = [MEMORY[0x1E4F65B08] contextForWritingProtectedData];
      id v16 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __65__HDMedicationsDemoDataGenerator_generateDemoDataForCurrentDate___block_invoke;
      v14[3] = &unk_1E63370D0;
      v14[4] = self;
      id v15 = v6;
      char v10 = [v8 performTransactionWithContext:v9 error:&v16 block:v14 inaccessibilityHandler:0];
      id v11 = v16;

      _HKInitializeLogging();
      uint64_t v12 = HKLogMedication();
      uint64_t v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v18 = self;
          __int16 v19 = 2114;
          id v20 = v4;
          _os_log_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_DEFAULT, " [%{public}@] Completed dose events generation for current date %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v18 = self;
        __int16 v19 = 2114;
        id v20 = v4;
        __int16 v21 = 2114;
        id v22 = v11;
        _os_log_error_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_ERROR, "[%{public}@]: Could not Demodata for Date  %{public}@ Error: %{public}@", buf, 0x20u);
      }
    }
  }
}

uint64_t __65__HDMedicationsDemoDataGenerator_generateDemoDataForCurrentDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) saveMedicationDoseEvents:*(void *)(a1 + 40) error:a3];
  if (result)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 _saveStateWithError:a3];
  }
  return result;
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = HKLogMedication();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1BD54A000, v6, OS_LOG_TYPE_DEFAULT, " [%{public}@] setDemoDataGenerationContext", (uint8_t *)&v7, 0xCu);
  }

  objc_storeWeak((id *)&self->_profile, v5);
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v6 = HKLogMedication();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    int v22 = 138543618;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    id v25 = WeakRetained;
    _os_log_impl(&dword_1BD54A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] generateFirstRunObjectsForDemoPerson _profile %{public}@", (uint8_t *)&v22, 0x16u);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_profile);

  if (v8)
  {
    [(HDMedicationsDemoDataGenerator *)self restoreState];
    if ([(HDMedicationsDemoDataGenerator *)self setupOntologyContentIfRequired])
    {
      [(HDMedicationsDemoDataGenerator *)self generateIntitialDemoDataIfRequired];
      return;
    }
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationsDemoDataGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:]((uint64_t)self, v9, v16, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationsDemoDataGenerator generateFirstRunObjectsForDemoPerson:firstDate:objectCollection:]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v8 = a6;
  [(HDMedicationsDemoDataGenerator *)self restoreState];
  if ([(HDMedicationsDemoDataGeneratorState *)self->_state didSaveIntialData])
  {
    [(HDMedicationsDemoDataGenerator *)self generateDemoDataForCurrentDate:v8];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationsDemoDataGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (int64_t)dayDifferenceFrom:(id)a3 to:(id)a4
{
  currentCalendar = self->_currentCalendar;
  id v7 = a3;
  id v8 = [(NSCalendar *)currentCalendar components:16 fromDate:a4];
  uint64_t v9 = [(NSCalendar *)self->_currentCalendar components:16 fromDate:v7];

  uint64_t v10 = [v8 day];
  int64_t v11 = v10 - [v9 day];

  return v11;
}

- (id)dayBeforeDate:(id)a3 withHour:(int64_t)a4
{
  uint64_t v6 = [(NSCalendar *)self->_currentCalendar components:28 fromDate:a3];
  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") - 1);
  [v6 setHour:a4];
  id v7 = [(NSCalendar *)self->_currentCalendar dateFromComponents:v6];

  return v7;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_demoDataFileName, 0);
}

- (void)saveMedications:schedules:logHistory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: Could not save Medication Initial Date Error: %{public}@");
}

- (void)loadDemoDataObjectsFrom:medications:schedules:logHistory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not create medication with detail : %{public}@");
}

- (void)setupOntologyContentIfRequired
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Could not update ontology shard Error: %{public}@");
}

- (void)generateFirstRunObjectsForDemoPerson:(uint64_t)a3 firstDate:(uint64_t)a4 objectCollection:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)generateFirstRunObjectsForDemoPerson:(uint64_t)a3 firstDate:(uint64_t)a4 objectCollection:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)generateObjectsForDemoPerson:(uint64_t)a3 fromTime:(uint64_t)a4 toTime:(uint64_t)a5 currentDate:(uint64_t)a6 objectCollection:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
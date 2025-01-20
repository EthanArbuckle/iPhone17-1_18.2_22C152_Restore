@interface HDMedicationScheduleDailyAnalytics
+ (id)_allActiveMedicationSchedulesWithProfile:(id)a3 error:(id *)a4;
+ (id)_medicationCountForSchedulesWithProfile:(id)a3 error:(id *)a4;
+ (id)_medicationCountForUnavailableSchedulesWithProfile:(id)a3 error:(id *)a4;
- (BOOL)isEventSubmissionIHAGated;
- (HDMedicationScheduleDailyAnalytics)initWithProfile:(id)a3;
- (NSString)eventName;
- (id)_makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:(id)a3;
- (id)_makeMedicationCountPayloadForSchedulesWithProfile:(id)a3;
- (id)_makeMedicationPayloadForConfigurationsWithProfile:(id)a3;
- (id)_makeMedicationPayloadForNewScheduleTypesWithProfile:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (int)_countOfSchedulesInList:(id)a3 matchingScheduleType:(int64_t)a4;
@end

@implementation HDMedicationScheduleDailyAnalytics

- (HDMedicationScheduleDailyAnalytics)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMedicationScheduleDailyAnalytics;
  v5 = [(HDMedicationScheduleDailyAnalytics *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [(HDMedicationScheduleDailyAnalytics *)self _makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:WeakRetained];
  objc_msgSend(v5, "hk_addEntriesFromNonNilDictionary:", v7);

  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [(HDMedicationScheduleDailyAnalytics *)self _makeMedicationCountPayloadForSchedulesWithProfile:WeakRetained];
  objc_msgSend(v5, "hk_addEntriesFromNonNilDictionary:", v7);

  id v8 = objc_loadWeakRetained((id *)&self->_profile);
  v9 = [(HDMedicationScheduleDailyAnalytics *)self _makeMedicationPayloadForNewScheduleTypesWithProfile:v8];
  objc_msgSend(v5, "hk_addEntriesFromNonNilDictionary:", v9);

  return v5;
}

- (id)_makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v13 = 0;
  v6 = [(id)objc_opt_class() _medicationCountForUnavailableSchedulesWithProfile:v4 error:&v13];

  id v7 = v13;
  if (v6)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v6, "integerValue") > 0);
    [v5 setObject:v8 forKeyedSubscript:@"hasUnavailableMedSchedules"];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationScheduleDailyAnalytics _makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:]();
    }
  }

  v9 = [v5 allKeys];
  if ([v9 count]) {
    v10 = v5;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (id)_makeMedicationCountPayloadForSchedulesWithProfile:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v17 = 0;
  id v5 = [(id)objc_opt_class() _medicationCountForSchedulesWithProfile:v3 error:&v17];
  id v6 = v17;
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v5, "integerValue") > 0);
    [v4 setObject:v7 forKeyedSubscript:@"hasMedsScheduled"];

    id v8 = HDMedicationDailyAnalyticsBucketForCount(v5);
    [v4 setObject:v8 forKeyedSubscript:@"numberOfMedsScheduled"];
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationScheduleDailyAnalytics _makeMedicationCountPayloadForSchedulesWithProfile:]();
    }
  }

  id v16 = v6;
  v9 = [(id)objc_opt_class() _medicationCountForUnavailableSchedulesWithProfile:v3 error:&v16];
  id v10 = v16;

  if (v9)
  {
    id v11 = HDMedicationDailyAnalyticsBucketForCount(v9);
    [v4 setObject:v11 forKeyedSubscript:@"numberOfUnavailableMedSchedules"];
  }
  else
  {
    _HKInitializeLogging();
    id v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationScheduleDailyAnalytics _makeMedicationCountPayloadForSchedulesWithProfile:]();
    }
  }

  v12 = [v4 allKeys];
  if ([v12 count]) {
    id v13 = v4;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)_makeMedicationPayloadForNewScheduleTypesWithProfile:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v47 = 0;
  id v7 = +[HDMedicationScheduleDailyAnalytics _allActiveMedicationSchedulesWithProfile:v5 error:&v47];

  id v8 = v47;
  if (v7)
  {
    uint64_t v9 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:2];
    id v44 = v8;
    uint64_t v10 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:7];
    uint64_t v11 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:8];
    uint64_t v12 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:3];
    unsigned int v39 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:1];
    unsigned int v40 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:4];
    unsigned int v41 = [(HDMedicationScheduleDailyAnalytics *)self _countOfSchedulesInList:v7 matchingScheduleType:5];
    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", &__block_literal_global_18);
    unsigned int v43 = (int)v13;
    id v14 = [MEMORY[0x1E4F1C9C8] now];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __91__HDMedicationScheduleDailyAnalytics__makeMedicationPayloadForNewScheduleTypesWithProfile___block_invoke_2;
    v45[3] = &unk_1E6338270;
    id v46 = v14;
    v15 = v14;
    objc_msgSend(v7, "hk_sumUsingEvaluationBlock:", v45);
    unsigned int v42 = (int)v16;
    id v17 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
    v18 = HDMedicationDailyAnalyticsBucketForCount(v17);
    [v6 setObject:v18 forKeyedSubscript:@"numMedsWithEveryDaySchedule"];

    v19 = [MEMORY[0x1E4F28ED0] numberWithInt:(v11 + v10)];
    v20 = HDMedicationDailyAnalyticsBucketForCount(v19);
    [v6 setObject:v20 forKeyedSubscript:@"numMedsWithCyclicalSchedule"];

    v21 = [MEMORY[0x1E4F28ED0] numberWithInt:v10];
    v22 = HDMedicationDailyAnalyticsBucketForCount(v21);
    [v6 setObject:v22 forKeyedSubscript:@"numMedsWithDailyCyclicalSchedule"];

    v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
    v24 = HDMedicationDailyAnalyticsBucketForCount(v23);
    [v6 setObject:v24 forKeyedSubscript:@"numMedsWithWeeklyCyclicalSchedule"];

    v25 = [MEMORY[0x1E4F28ED0] numberWithInt:v12];
    v26 = HDMedicationDailyAnalyticsBucketForCount(v25);
    [v6 setObject:v26 forKeyedSubscript:@"numMedsWithDayOfWeekSchedule"];

    v27 = [MEMORY[0x1E4F28ED0] numberWithInt:v39];
    v28 = HDMedicationDailyAnalyticsBucketForCount(v27);
    [v6 setObject:v28 forKeyedSubscript:@"numMedsWithEveryFewDaysSchedule"];

    v29 = [MEMORY[0x1E4F28ED0] numberWithInt:v40];
    v30 = HDMedicationDailyAnalyticsBucketForCount(v29);
    [v6 setObject:v30 forKeyedSubscript:@"numMedsWithAsNeededSchedule"];

    v31 = [MEMORY[0x1E4F28ED0] numberWithInt:v41];
    v32 = HDMedicationDailyAnalyticsBucketForCount(v31);
    [v6 setObject:v32 forKeyedSubscript:@"numMedsWithDifferentDosesDayOfWeekSchedule"];

    v33 = [MEMORY[0x1E4F28ED0] numberWithInt:v43];
    v34 = HDMedicationDailyAnalyticsBucketForCount(v33);
    [v6 setObject:v34 forKeyedSubscript:@"numMedsWithScheduledEndDate"];

    v35 = [MEMORY[0x1E4F28ED0] numberWithInt:v42];
    v36 = HDMedicationDailyAnalyticsBucketForCount(v35);
    [v6 setObject:v36 forKeyedSubscript:@"numMedsWithScheduleEnded"];

    id v8 = v44;
    id v37 = v6;
  }
  else
  {
    _HKInitializeLogging();
    v15 = HKLogMedication();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationScheduleDailyAnalytics _makeMedicationPayloadForNewScheduleTypesWithProfile:]();
    }
    id v37 = 0;
  }

  return v37;
}

double __91__HDMedicationScheduleDailyAnalytics__makeMedicationPayloadForNewScheduleTypesWithProfile___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 endDateTime];
  if (v2) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

double __91__HDMedicationScheduleDailyAnalytics__makeMedicationPayloadForNewScheduleTypesWithProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 endDateTime];
  if (v4)
  {
    id v5 = [v3 endDateTime];
    double v6 = (double)objc_msgSend(v5, "hk_isBeforeDate:", *(void *)(a1 + 32));
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (int)_countOfSchedulesInList:(id)a3 matchingScheduleType:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__HDMedicationScheduleDailyAnalytics__countOfSchedulesInList_matchingScheduleType___block_invoke;
  v6[3] = &__block_descriptor_40_e30_d16__0__HKMedicationSchedule_8l;
  v6[4] = a4;
  objc_msgSend(a3, "hk_sumUsingEvaluationBlock:", v6);
  return (int)v4;
}

double __83__HDMedicationScheduleDailyAnalytics__countOfSchedulesInList_matchingScheduleType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 scheduleType];
  double result = 0.0;
  if (v3 == *(void *)(a1 + 32)) {
    return 1.0;
  }
  return result;
}

- (id)_makeMedicationPayloadForConfigurationsWithProfile:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasPregnancyModeEnabled"];
  return v3;
}

+ (id)_medicationCountForSchedulesWithProfile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  double v6 = objc_opt_class();
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  double v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  id v7 = [v5 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__HDMedicationScheduleDailyAnalytics__medicationCountForSchedulesWithProfile_error___block_invoke;
  v11[3] = &unk_1E63382B8;
  v11[4] = &v12;
  v11[5] = v6;
  LODWORD(a4) = [v6 performReadTransactionWithHealthDatabase:v7 error:a4 block:v11];

  if (a4) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

BOOL __84__HDMedicationScheduleDailyAnalytics__medicationCountForSchedulesWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F65D00];
  id v6 = a2;
  id v7 = [v5 predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
  id v8 = *(void **)(a1 + 40);
  id v9 = [v6 protectedDatabase];

  uint64_t v10 = [v8 countDistinctForProperty:@"medication_uuid" predicate:v7 database:v9 error:a3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  return v13;
}

+ (id)_medicationCountForUnavailableSchedulesWithProfile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  double v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  id v7 = [v5 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__HDMedicationScheduleDailyAnalytics__medicationCountForUnavailableSchedulesWithProfile_error___block_invoke;
  v11[3] = &unk_1E63382B8;
  v11[4] = &v12;
  v11[5] = v6;
  LODWORD(a4) = [v6 performReadTransactionWithHealthDatabase:v7 error:a4 block:v11];

  if (a4) {
    id v8 = (void *)v13[5];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  return v9;
}

BOOL __95__HDMedicationScheduleDailyAnalytics__medicationCountForUnavailableSchedulesWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F65D08];
  id v6 = a2;
  id v7 = +[HDMedicationScheduleEntity availableSchedulePredicate];
  id v8 = [v5 negatedPredicate:v7];

  id v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
  uint64_t v10 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v8 otherPredicate:v9];
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [v6 protectedDatabase];

  uint64_t v13 = [v11 countDistinctForProperty:@"medication_uuid" predicate:v10 database:v12 error:a3];
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  BOOL v16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  return v16;
}

+ (id)_allActiveMedicationSchedulesWithProfile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  id v6 = [v5 database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__HDMedicationScheduleDailyAnalytics__allActiveMedicationSchedulesWithProfile_error___block_invoke;
  v10[3] = &unk_1E63382E0;
  v10[4] = &v11;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:a4 block:v10];

  if (a4) {
    id v7 = (void *)v12[5];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __85__HDMedicationScheduleDailyAnalytics__allActiveMedicationSchedulesWithProfile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDMedicationScheduleEntity allActiveMedicationSchedulesWithTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (void).cxx_destruct
{
}

- (void)_makeHasUnavailableSchedulesPayloadForSchedulesWithProfile:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error loading a count of unavailable scheduled medications with error: %{public}@");
}

- (void)_makeMedicationCountPayloadForSchedulesWithProfile:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error loading a count of unavailable scheduled medications, continuing daily analytics submission: %{public}@");
}

- (void)_makeMedicationCountPayloadForSchedulesWithProfile:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error loading a count of scheduled medications, continuing daily analytics submission: %{public}@");
}

- (void)_makeMedicationPayloadForNewScheduleTypesWithProfile:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "%{public}@ Fetching all non-deleted schedules failed with error: %{public}@");
}

@end
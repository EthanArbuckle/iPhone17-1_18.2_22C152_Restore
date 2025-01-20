@interface HDMedicationDoseEventDailyAnalytics
+ (id)_countOfDoseEventsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_doseEventCountLoggedSinceDate:(id)a3 transaction:(id)a4;
+ (id)_predicateForDoseEventsBetweenDate:(id)a3 andDate:(id)a4;
+ (id)_predicateForDoseEventsLoggedSinceDate:(id)a3;
- (BOOL)isEventSubmissionIHAGated;
- (HDMedicationDoseEventDailyAnalytics)initWithProfile:(id)a3 calendar:(id)a4 currentDate:(id)a5;
- (NSString)eventName;
- (id)_hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:(id)a3;
- (id)_hasLoggedMedsInPastPayloadWithTransaction:(id)a3;
- (id)_weeksSinceFirstLoggedMedPayload;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (void)_weeksSinceFirstLoggedMedPayload;
@end

@implementation HDMedicationDoseEventDailyAnalytics

- (HDMedicationDoseEventDailyAnalytics)initWithProfile:(id)a3 calendar:(id)a4 currentDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicationDoseEventDailyAnalytics;
  v11 = [(HDMedicationDoseEventDailyAnalytics *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_calendar, a4);
    objc_storeStrong((id *)&v12->_currentDate, a5);
  }

  return v12;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (void *)MEMORY[0x1E4F65B48];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  v16 = self;
  id v17 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__HDMedicationDoseEventDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke;
  v14[3] = &unk_1E63370D0;
  id v15 = v5;
  id v9 = v5;
  LODWORD(v5) = [v6 performReadTransactionWithHealthDatabase:v8 error:&v17 block:v14];
  id v10 = v17;

  if (v5) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

uint64_t __88__HDMedicationDoseEventDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) _weeksSinceFirstLoggedMedPayload];
  objc_msgSend(v1, "hk_addEntriesFromNonNilDictionary:", v2);

  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (void *)MEMORY[0x1E4F65B48];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  v16 = self;
  id v17 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__HDMedicationDoseEventDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke;
  v14[3] = &unk_1E63370D0;
  id v15 = v5;
  id v9 = v5;
  LODWORD(v5) = [v6 performReadTransactionWithHealthDatabase:v8 error:&v17 block:v14];
  id v10 = v17;

  if (v5) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

uint64_t __84__HDMedicationDoseEventDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 _hasLoggedMedsInPastPayloadWithTransaction:v5];
  objc_msgSend(v3, "hk_addEntriesFromNonNilDictionary:", v6);

  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) _hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:v5];

  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v8);
  return 1;
}

- (id)_hasLoggedMedsInPastPayloadWithTransaction:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-1 toDate:self->_currentDate];
  v7 = [(id)objc_opt_class() _doseEventCountLoggedSinceDate:v6 transaction:v4];
  id v8 = v7;
  if (v7)
  {
    if ([v7 integerValue] >= 1)
    {
      uint64_t v9 = MEMORY[0x1E4F1CC38];
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasLoggedMedsInPast24hrs"];
      [v5 setObject:v9 forKeyedSubscript:@"hasLoggedMedsInPastWeek"];
      [v5 setObject:v9 forKeyedSubscript:@"hasLoggedMedsInPastMonth"];
      [v5 setObject:v9 forKeyedSubscript:@"hasLoggedMedsInPast6Months"];
      [v5 setObject:v9 forKeyedSubscript:@"hasLoggedMedsInPastYear"];
      [v5 setObject:v9 forKeyedSubscript:@"hasMedsHistory"];
      id v10 = v5;
      goto LABEL_30;
    }
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasLoggedMedsInPast24hrs"];
  }
  v11 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-7 toDate:self->_currentDate];
  id v12 = [(id)objc_opt_class() _doseEventCountLoggedSinceDate:v11 transaction:v4];
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v16 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-30 toDate:self->_currentDate];
    id v17 = [(id)objc_opt_class() _doseEventCountLoggedSinceDate:v16 transaction:v4];
    v18 = v17;
    if (v17)
    {
      if ([v17 integerValue] >= 1)
      {
        uint64_t v19 = MEMORY[0x1E4F1CC38];
        [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasLoggedMedsInPastMonth"];
        [v5 setObject:v19 forKeyedSubscript:@"hasLoggedMedsInPast6Months"];
        [v5 setObject:v19 forKeyedSubscript:@"hasLoggedMedsInPastYear"];
        [v5 setObject:v19 forKeyedSubscript:@"hasMedsHistory"];
        id v20 = v5;
LABEL_28:

        goto LABEL_29;
      }
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasLoggedMedsInPastMonth"];
    }
    uint64_t v21 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-180 toDate:self->_currentDate];
    v22 = [(id)objc_opt_class() _doseEventCountLoggedSinceDate:v21 transaction:v4];
    v54 = v22;
    if (v22)
    {
      if ([v22 integerValue] >= 1)
      {
        v23 = (void *)v21;
        uint64_t v24 = MEMORY[0x1E4F1CC38];
        [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasLoggedMedsInPast6Months"];
        [v5 setObject:v24 forKeyedSubscript:@"hasLoggedMedsInPastYear"];
        [v5 setObject:v24 forKeyedSubscript:@"hasMedsHistory"];
        id v25 = v5;
LABEL_27:

        goto LABEL_28;
      }
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasLoggedMedsInPast6Months"];
    }
    v50 = v18;
    uint64_t v51 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-365 toDate:self->_currentDate];
    v26 = [(id)objc_opt_class() _doseEventCountLoggedSinceDate:v51 transaction:v4];
    v52 = v26;
    v53 = (void *)v21;
    if (v26)
    {
      if ([v26 integerValue] >= 1)
      {
        uint64_t v27 = MEMORY[0x1E4F1CC38];
        [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasLoggedMedsInPastYear"];
        [v5 setObject:v27 forKeyedSubscript:@"hasMedsHistory"];
        id v28 = v5;
        v29 = (void *)v51;
LABEL_26:

        v23 = v53;
        goto LABEL_27;
      }
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasLoggedMedsInPastYear"];
    }
    v45 = v16;
    v30 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    v57[0] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    uint64_t v32 = HDSampleEntityPredicateForDataTypes();

    uint64_t v33 = HDMedicationDoseEventEntityPredicateForStatuses();
    v34 = (void *)MEMORY[0x1E4F65D08];
    v48 = (void *)v33;
    v49 = (void *)v32;
    v56[0] = v32;
    v56[1] = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    uint64_t v36 = [v34 predicateMatchingAllPredicates:v35];

    v37 = objc_opt_class();
    v38 = [v4 protectedDatabase];
    id v55 = 0;
    v47 = (void *)v36;
    uint64_t v39 = [v37 anyInDatabase:v38 predicate:v36 error:&v55];
    id v44 = v55;

    v46 = (void *)v39;
    if (v39)
    {
      v40 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
      [v5 setObject:v40 forKeyedSubscript:@"hasMedsHistory"];
      v41 = v44;
      v16 = v45;
      v18 = v50;
    }
    else
    {
      _HKInitializeLogging();
      v40 = HKLogMedication();
      v18 = v50;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = v44;
        -[HDMedicationDoseEventDailyAnalytics _hasLoggedMedsInPastPayloadWithTransaction:]();
        v16 = v45;
      }
      else
      {
        v41 = v44;
        v16 = v45;
      }
    }

    id v42 = v5;
    v29 = (void *)v51;
    goto LABEL_26;
  }
  if ([v12 integerValue] < 1)
  {
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasLoggedMedsInPastWeek"];
    goto LABEL_9;
  }
  uint64_t v14 = MEMORY[0x1E4F1CC38];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasLoggedMedsInPastWeek"];
  [v5 setObject:v14 forKeyedSubscript:@"hasLoggedMedsInPastMonth"];
  [v5 setObject:v14 forKeyedSubscript:@"hasLoggedMedsInPast6Months"];
  [v5 setObject:v14 forKeyedSubscript:@"hasLoggedMedsInPastYear"];
  [v5 setObject:v14 forKeyedSubscript:@"hasMedsHistory"];
  id v15 = v5;
LABEL_29:

LABEL_30:
  return v5;
}

- (id)_weeksSinceFirstLoggedMedPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSCalendar *)self->_calendar startOfDayForDate:self->_currentDate];
  id v5 = HDMedicationDoseEventEntityPredicateForStatuses();
  v6 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v16 = 0;
  uint64_t v9 = [v7 oldestSampleWithType:v6 profile:WeakRetained encodingOptions:0 predicate:v5 error:&v16];
  id v10 = v16;

  if (v9)
  {
    calendar = self->_calendar;
    id v12 = [v9 _creationDate];
    v13 = [(NSCalendar *)calendar startOfDayForDate:v12];

    uint64_t v14 = HKMedicationAnalyticsWeeksBetweenDates();
    if (v14) {
      [v3 setObject:v14 forKeyedSubscript:@"weeksSinceFirstLoggedMed"];
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = HKLogMedication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationDoseEventDailyAnalytics _weeksSinceFirstLoggedMedPayload]();
    }
  }

  return v3;
}

- (id)_hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:(id)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [(NSCalendar *)self->_calendar dateByAddingUnit:16 value:-1 toDate:self->_currentDate options:0];
  uint64_t v7 = [(NSCalendar *)self->_calendar startOfDayForDate:v6];

  id v8 = [(NSCalendar *)self->_calendar dateByAddingUnit:16 value:1 toDate:v7 options:0];
  uint64_t v9 = [(NSCalendar *)self->_calendar startOfDayForDate:v8];

  v38 = (void *)v9;
  uint64_t v39 = (void *)v7;
  uint64_t v10 = [(id)objc_opt_class() _predicateForDoseEventsBetweenDate:v7 andDate:v9];
  uint64_t v11 = HDMedicationDoseEventEntityPredicateForLogOrigin();
  id v12 = (void *)MEMORY[0x1E4F65D08];
  v40 = (void *)v11;
  v41 = (void *)v10;
  v47[0] = v10;
  v47[1] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  uint64_t v14 = [v12 predicateMatchingAllPredicates:v13];

  id v15 = objc_opt_class();
  uint64_t v16 = *MEMORY[0x1E4F659C0];
  id v17 = [v4 databaseForEntityClass:v15];
  id v43 = 0;
  v37 = (void *)v14;
  v18 = [v15 countValueForProperty:v16 predicate:v14 database:v17 error:&v43];
  id v19 = v43;

  if (!v18)
  {
    _HKInitializeLogging();
    id v20 = HKLogMedication();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationDoseEventDailyAnalytics _hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:]();
    }
    id v29 = 0;
    goto LABEL_8;
  }
  if ([v18 integerValue] <= 0)
  {
    _HKInitializeLogging();
    id v20 = HKLogMedication();
    uint64_t v32 = v37;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = self;
      _os_log_impl(&dword_1BD54A000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] No scheduled dose events found for yesterday", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v36 = v5;
    id v20 = HDMedicationDoseEventEntityPredicateForStatuses();
    uint64_t v21 = v4;
    v22 = (void *)MEMORY[0x1E4F65D08];
    v44[0] = v41;
    v44[1] = v40;
    v44[2] = v20;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    uint64_t v24 = v22;
    id v4 = v21;
    id v25 = [v24 predicateMatchingAllPredicates:v23];

    v26 = [v21 databaseForEntityClass:v15];
    id v42 = 0;
    uint64_t v27 = [v15 countValueForProperty:v16 predicate:v25 database:v26 error:&v42];
    id v19 = v42;

    if (v27)
    {
      id v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v18, "integerValue") == objc_msgSend(v27, "integerValue"));
      id v5 = v36;
      [v36 setObject:v28 forKeyedSubscript:@"hasLoggedAllScheduledMedsInPreviousDay"];

      id v29 = v36;
LABEL_8:
      v31 = v38;
      v30 = v39;
      uint64_t v32 = v37;
      goto LABEL_15;
    }
    uint64_t v33 = v25;
    _HKInitializeLogging();
    v34 = HKLogMedication();
    id v5 = v36;
    uint64_t v32 = v37;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationDoseEventDailyAnalytics _hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:]();
    }
  }
  id v29 = 0;
  v31 = v38;
  v30 = v39;
LABEL_15:

  return v29;
}

+ (id)_doseEventCountLoggedSinceDate:(id)a3 transaction:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() _predicateForDoseEventsLoggedSinceDate:v6];
  id v14 = 0;
  uint64_t v9 = [(id)objc_opt_class() _countOfDoseEventsWithPredicate:v8 transaction:v7 error:&v14];

  id v10 = v14;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v16 = a1;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_error_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Error when determining if logged medications since date: %{public}@, continuing daily analytics submission: %{public}@", buf, 0x20u);
    }
  }
  return v9;
}

+ (id)_countOfDoseEventsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *MEMORY[0x1E4F659C0];
  id v11 = [v7 protectedDatabase];

  id v12 = [v9 countDistinctForProperty:v10 predicate:v8 database:v11 error:a5];

  return v12;
}

+ (id)_predicateForDoseEventsLoggedSinceDate:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F2B1F8];
  id v4 = a3;
  id v5 = [v3 medicationDoseEventType];
  v15[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v7 = HDSampleEntityPredicateForDataTypes();

  id v8 = HDDataEntityPredicateForCreationDate();

  uint64_t v9 = HDMedicationDoseEventEntityPredicateForStatuses();
  uint64_t v10 = (void *)MEMORY[0x1E4F65D08];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  id v12 = [v10 predicateMatchingAllPredicates:v11];

  return v12;
}

+ (id)_predicateForDoseEventsBetweenDate:(id)a3 andDate:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F2B1F8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 medicationDoseEventType];
  v18[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v10 = HDSampleEntityPredicateForDataTypes();

  id v11 = HDSampleEntityPredicateForStartDate();

  id v12 = HDSampleEntityPredicateForStartDate();

  v13 = (void *)MEMORY[0x1E4F65D08];
  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  id v15 = [v13 predicateMatchingAllPredicates:v14];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_hasLoggedMedsInPastPayloadWithTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error when determining if user has any dose events in the database, continuing daily analytics submission: %{public}@");
}

- (void)_weeksSinceFirstLoggedMedPayload
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error loading oldest logged dose event, continuing daily analytics submission: %{public}@");
}

- (void)_hasLoggedAllScheduledMedsInPreviousDayPayloadWithTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error loading scheduled logged dose event count for yesterday, continuing daily analytics submission: %{public}@");
}

@end
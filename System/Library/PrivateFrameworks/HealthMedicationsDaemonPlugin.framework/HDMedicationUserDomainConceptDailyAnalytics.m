@interface HDMedicationUserDomainConceptDailyAnalytics
+ (id)_countOfUserDomainConceptsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_medicationsAddedCountSinceDate:(id)a3 transaction:(id)a4;
+ (id)_predicateForMedicationsSinceDate:(id)a3;
- (BOOL)isEventSubmissionIHAGated;
- (HDMedicationUserDomainConceptDailyAnalytics)initWithProfile:(id)a3 medicationsKeyValueDomain:(id)a4 calendar:(id)a5 currentDate:(id)a6;
- (NSString)eventName;
- (id)_archivedMedsCountPayloadWithTransaction:(id)a3;
- (id)_hasAddedMedsInPastIHAGatedPayloadWithTransaction:(id)a3;
- (id)_hasAddedMedsInPastUnrestrictedPayloadWithTransaction:(id)a3;
- (id)_hasAnyLifestyleFactorEnabledPayload;
- (id)_hasMedsListPayloadWithTransaction:(id)a3;
- (id)_medsCountPayloadWithTransaction:(id)a3;
- (id)_medsInteractionsPayloadWithTransaction:(id)a3;
- (id)_weeksSinceFirstAddedMedPayloadWithTransaction:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HDMedicationUserDomainConceptDailyAnalytics

- (HDMedicationUserDomainConceptDailyAnalytics)initWithProfile:(id)a3 medicationsKeyValueDomain:(id)a4 calendar:(id)a5 currentDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDMedicationUserDomainConceptDailyAnalytics;
  v14 = [(HDMedicationUserDomainConceptDailyAnalytics *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_medicationsKeyValueDomain, a4);
    objc_storeStrong((id *)&v15->_calendar, a5);
    objc_storeStrong((id *)&v15->_currentDate, a6);
  }

  return v15;
}

- (BOOL)isEventSubmissionIHAGated
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The -%@ method is not available on %@", v4, objc_opt_class() format];

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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [WeakRetained database];
  v15 = self;
  id v16 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__HDMedicationUserDomainConceptDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke;
  v13[3] = &unk_1E63370D0;
  id v14 = v5;
  id v8 = v5;
  LODWORD(v5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:&v16 block:v13];
  id v9 = v16;

  if (v5) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

uint64_t __96__HDMedicationUserDomainConceptDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 _hasAddedMedsInPastUnrestrictedPayloadWithTransaction:v5];
  objc_msgSend(v3, "hk_addEntriesFromNonNilDictionary:", v6);

  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) _hasMedsListPayloadWithTransaction:v5];
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v8);

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) _hasAnyLifestyleFactorEnabledPayload];
  objc_msgSend(v9, "hk_addEntriesFromNonNilDictionary:", v10);

  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) _weeksSinceFirstAddedMedPayloadWithTransaction:v5];

  objc_msgSend(v11, "hk_addEntriesFromNonNilDictionary:", v12);
  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [WeakRetained database];
  v15 = self;
  id v16 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__HDMedicationUserDomainConceptDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke;
  v13[3] = &unk_1E63370D0;
  id v14 = v5;
  id v8 = v5;
  LODWORD(v5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:&v16 block:v13];
  id v9 = v16;

  if (v5) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

uint64_t __92__HDMedicationUserDomainConceptDailyAnalytics_makeIHAGatedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v4 _hasAddedMedsInPastIHAGatedPayloadWithTransaction:v5];
  objc_msgSend(v3, "hk_addEntriesFromNonNilDictionary:", v6);

  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) _medsCountPayloadWithTransaction:v5];
  objc_msgSend(v7, "hk_addEntriesFromNonNilDictionary:", v8);

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) _archivedMedsCountPayloadWithTransaction:v5];
  objc_msgSend(v9, "hk_addEntriesFromNonNilDictionary:", v10);

  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) _medsInteractionsPayloadWithTransaction:v5];

  objc_msgSend(v11, "hk_addEntriesFromNonNilDictionary:", v12);
  return 1;
}

- (id)_weeksSinceFirstAddedMedPayloadWithTransaction:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
  v7 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  id v8 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65A20] entityClass:objc_opt_class() ascending:1];
  v31[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  id v28 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained userDomainConceptManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __94__HDMedicationUserDomainConceptDailyAnalytics__weeksSinceFirstAddedMedPayloadWithTransaction___block_invoke;
  v21[3] = &unk_1E6337F90;
  v21[4] = &v23;
  id v22 = 0;
  char v12 = [v11 enumerateUserDomainConceptsWithPredicate:v7 limit:1 orderingTerms:v9 error:&v22 enumerationHandler:v21];
  id v13 = v22;

  if (v12)
  {
    if (v24[5])
    {
      id v14 = [(NSCalendar *)self->_calendar startOfDayForDate:self->_currentDate];
      calendar = self->_calendar;
      id v16 = [(id)v24[5] creationDate];
      objc_super v17 = [(NSCalendar *)calendar startOfDayForDate:v16];

      v18 = HKMedicationAnalyticsWeeksBetweenDates();
      [v5 setObject:v18 forKeyedSubscript:@"weeksSinceFirstAddedMed"];

      id v19 = v5;
      goto LABEL_9;
    }
    _HKInitializeLogging();
    id v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] No error when fetching oldest medications added, but also no value", buf, 0xCu);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v14 = HKLogMedication();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationUserDomainConceptDailyAnalytics _weeksSinceFirstAddedMedPayloadWithTransaction:]();
    }
  }
  id v19 = 0;
LABEL_9:

  _Block_object_dispose(&v23, 8);
  return v19;
}

uint64_t __94__HDMedicationUserDomainConceptDailyAnalytics__weeksSinceFirstAddedMedPayloadWithTransaction___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (id)_hasAnyLifestyleFactorEnabledPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(HDKeyValueDomain *)self->_medicationsKeyValueDomain hdmd_numberValueAsBoolForKey:*MEMORY[0x1E4F66978]])
  {
    [v4 addObject:&unk_1F17FC498];
  }
  if ([(HDKeyValueDomain *)self->_medicationsKeyValueDomain hdmd_numberValueAsBoolForKey:*MEMORY[0x1E4F669D8]])
  {
    [v4 addObject:&unk_1F17FC4B0];
  }
  if ([(HDKeyValueDomain *)self->_medicationsKeyValueDomain hdmd_numberValueAsBoolForKey:*MEMORY[0x1E4F66A70]])
  {
    [v4 addObject:&unk_1F17FC4C8];
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v4, "count") != 0);
  [v3 setObject:v5 forKeyedSubscript:@"hasAnyLifestyleFactorEnabled"];

  return v3;
}

- (id)_medsInteractionsPayloadWithTransaction:(id)a3
{
  v73[3] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v48 = [MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
  v47 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  id v4 = [MEMORY[0x1E4F2B180] appleOntologySystem];
  v46 = HDUserDomainConceptEntityPredicateForMedicalCodingSystem();

  v45 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
  id v5 = (void *)MEMORY[0x1E4F65D08];
  v73[0] = v47;
  v73[1] = v45;
  v73[2] = v46;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  v44 = [v5 predicateMatchingAllPredicates:v6];

  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__10;
  v69 = __Block_byref_object_dispose__10;
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained userDomainConceptManager];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __87__HDMedicationUserDomainConceptDailyAnalytics__medsInteractionsPayloadWithTransaction___block_invoke;
  v63[3] = &unk_1E6337FB8;
  v63[4] = &v65;
  id v64 = 0;
  char v9 = [v8 enumerateUserDomainConceptsWithPredicate:v44 error:&v64 enumerationHandler:v63];
  id v50 = v64;

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ([(HDKeyValueDomain *)self->_medicationsKeyValueDomain hdmd_numberValueAsBoolForKey:*MEMORY[0x1E4F66978]])
    {
      [v10 addObject:&unk_1F17FC498];
    }
    if ([(HDKeyValueDomain *)self->_medicationsKeyValueDomain hdmd_numberValueAsBoolForKey:*MEMORY[0x1E4F669D8]])
    {
      [v10 addObject:&unk_1F17FC4B0];
    }
    if ([(HDKeyValueDomain *)self->_medicationsKeyValueDomain hdmd_numberValueAsBoolForKey:*MEMORY[0x1E4F66A70]])
    {
      [v10 addObject:&unk_1F17FC4C8];
    }
    v42 = v10;

    uint64_t v11 = v66[5];
    id v12 = objc_loadWeakRetained((id *)&self->_profile);
    id v62 = 0;
    v41 = +[HDDrugInteractionEngine interactionResultsForMedications:v11 lifestyleFactors:v42 profile:v12 error:&v62];
    id v50 = v62;

    if (v41)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = v41;
      uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      if (v13)
      {
        uint64_t v52 = *(void *)v59;
        do
        {
          uint64_t v53 = v13;
          for (uint64_t i = 0; i != v53; ++i)
          {
            if (*(void *)v59 != v52) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v19 = [v18 interactions];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v71 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v55;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v55 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v23 = [*(id *)(*((void *)&v54 + 1) + 8 * j) severity];
                  uint64_t v24 = [v23 severityLevel];

                  switch(v24)
                  {
                    case 1:
                      ++v14;
                      break;
                    case 2:
                      ++v15;
                      break;
                    case 3:
                      ++v16;
                      break;
                  }
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v71 count:16];
              }
              while (v20);
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v72 count:16];
        }
        while (v13);
      }

      uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:v15 + v14 + v16];
      v26 = HDMedicationDailyAnalyticsBucketForCount(v25);
      [v49 setObject:v26 forKeyedSubscript:@"numberOfMedsInteractions"];

      v27 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
      id v28 = HDMedicationDailyAnalyticsBucketForCount(v27);
      [v49 setObject:v28 forKeyedSubscript:@"numberOfSevereMedsInteractions"];

      v29 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
      v30 = HDMedicationDailyAnalyticsBucketForCount(v29);
      [v49 setObject:v30 forKeyedSubscript:@"numberOfCriticalMedsInteractions"];

      v31 = [MEMORY[0x1E4F28ED0] numberWithInteger:v15];
      v32 = HDMedicationDailyAnalyticsBucketForCount(v31);
      [v49 setObject:v32 forKeyedSubscript:@"numberOfMajorMedsInteractions"];

      v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:v15];
      v34 = HDMedicationDailyAnalyticsBucketForCount(v33);
      [v49 setObject:v34 forKeyedSubscript:@"numberOfSeriousMedsInteractions"];

      v35 = [MEMORY[0x1E4F28ED0] numberWithInteger:v16];
      v36 = HDMedicationDailyAnalyticsBucketForCount(v35);
      [v49 setObject:v36 forKeyedSubscript:@"numberOfModerateMedsInteractions"];

      id v37 = v49;
    }
    else
    {
      _HKInitializeLogging();
      v39 = HKLogMedication();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationUserDomainConceptDailyAnalytics _medsInteractionsPayloadWithTransaction:]();
      }

      id v37 = 0;
    }

    v38 = v42;
  }
  else
  {
    _HKInitializeLogging();
    v38 = HKLogMedication();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationUserDomainConceptDailyAnalytics _medsInteractionsPayloadWithTransaction:]();
    }
    id v37 = 0;
  }

  _Block_object_dispose(&v65, 8);
  return v37;
}

uint64_t __87__HDMedicationUserDomainConceptDailyAnalytics__medsInteractionsPayloadWithTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_hasAddedMedsInPastIHAGatedPayloadWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-1 toDate:self->_currentDate];
  v7 = [(id)objc_opt_class() _medicationsAddedCountSinceDate:v6 transaction:v4];
  id v8 = v7;
  if (v7)
  {
    if ([v7 integerValue] >= 1)
    {
      uint64_t v9 = MEMORY[0x1E4F1CC38];
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasAddedMedsInPast24hrs"];
      [v5 setObject:v9 forKeyedSubscript:@"hasAddedMedsInPastWeek"];
      [v5 setObject:v9 forKeyedSubscript:@"hasAddedMedsInPastMonth"];
      [v5 setObject:v9 forKeyedSubscript:@"hasAddedMedsInPast6Months"];
      [v5 setObject:v9 forKeyedSubscript:@"hasAddedMedsInPastYear"];
      goto LABEL_11;
    }
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasAddedMedsInPast24hrs"];
  }
  id v10 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-7 toDate:self->_currentDate];
  uint64_t v11 = [(id)objc_opt_class() _medicationsAddedCountSinceDate:v10 transaction:v4];
  id v12 = v11;
  if (v11)
  {
    if ([v11 integerValue] < 1)
    {
      uint64_t v16 = MEMORY[0x1E4F1CC28];
      uint64_t v14 = @"hasAddedMedsInPastWeek";
      uint64_t v15 = v5;
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F1CC38];
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasAddedMedsInPastWeek"];
      [v5 setObject:v13 forKeyedSubscript:@"hasAddedMedsInPastMonth"];
      [v5 setObject:v13 forKeyedSubscript:@"hasAddedMedsInPast6Months"];
      uint64_t v14 = @"hasAddedMedsInPastYear";
      uint64_t v15 = v5;
      uint64_t v16 = v13;
    }
    [v15 setObject:v16 forKeyedSubscript:v14];
  }

LABEL_11:
  return v5;
}

- (id)_hasAddedMedsInPastUnrestrictedPayloadWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-30 toDate:self->_currentDate];
  v7 = [(id)objc_opt_class() _medicationsAddedCountSinceDate:v6 transaction:v4];
  id v8 = v7;
  if (v7)
  {
    if ([v7 integerValue] >= 1)
    {
      uint64_t v9 = MEMORY[0x1E4F1CC38];
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasAddedMedsInPastMonth"];
      [v5 setObject:v9 forKeyedSubscript:@"hasAddedMedsInPast6Months"];
      [v5 setObject:v9 forKeyedSubscript:@"hasAddedMedsInPastYear"];
      id v10 = v5;
      goto LABEL_13;
    }
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasAddedMedsInPastMonth"];
  }
  uint64_t v11 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-180 toDate:self->_currentDate];
  id v12 = [(id)objc_opt_class() _medicationsAddedCountSinceDate:v11 transaction:v4];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_9;
  }
  if ([v12 integerValue] < 1)
  {
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"hasAddedMedsInPast6Months"];
LABEL_9:
    uint64_t v16 = [(NSCalendar *)self->_calendar hk_dateByAddingDays:-365 toDate:self->_currentDate];
    objc_super v17 = [(id)objc_opt_class() _medicationsAddedCountSinceDate:v16 transaction:v4];
    v18 = v17;
    if (v17)
    {
      id v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v17, "integerValue") > 0);
      [v5 setObject:v19 forKeyedSubscript:@"hasAddedMedsInPastYear"];
    }
    id v20 = v5;

    goto LABEL_12;
  }
  uint64_t v14 = MEMORY[0x1E4F1CC38];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasAddedMedsInPast6Months"];
  [v5 setObject:v14 forKeyedSubscript:@"hasAddedMedsInPastYear"];
  id v15 = v5;
LABEL_12:

LABEL_13:
  return v5;
}

- (id)_medsCountPayloadWithTransaction:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
  id v11 = 0;
  v7 = [MEMORY[0x1E4F65C28] countOfUserDomainConceptsMatchingPredicate:v6 options:0 transaction:v4 error:&v11];

  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = HDMedicationDailyAnalyticsBucketForCount(v7);
    [v5 setObject:v9 forKeyedSubscript:@"numberOfMedsInList"];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationUserDomainConceptDailyAnalytics _medsCountPayloadWithTransaction:]();
    }
  }

  return v5;
}

- (id)_archivedMedsCountPayloadWithTransaction:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v17 = 0;
  id v5 = [(id)objc_opt_class() _countOfUserDomainConceptsWithPredicate:0 transaction:v3 error:&v17];
  id v6 = v17;
  if (v5)
  {
    v7 = objc_opt_class();
    id v8 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
    id v16 = v6;
    uint64_t v9 = [v7 _countOfUserDomainConceptsWithPredicate:v8 transaction:v3 error:&v16];
    id v10 = v16;

    if (v9)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v5, "intValue") - -[NSObject intValue](v9, "intValue"));
      id v12 = HDMedicationDailyAnalyticsBucketForCount(v11);
      [v4 setObject:v12 forKeyedSubscript:@"numberOfArchivedMeds"];

      id v13 = v4;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v14 = HKLogMedication();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationUserDomainConceptDailyAnalytics _archivedMedsCountPayloadWithTransaction:]();
      }

      id v13 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationUserDomainConceptDailyAnalytics _archivedMedsCountPayloadWithTransaction:]();
    }
    id v13 = 0;
    id v10 = v6;
  }

  return v13;
}

- (id)_hasMedsListPayloadWithTransaction:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
  id v11 = 0;
  v7 = [MEMORY[0x1E4F65C28] countOfUserDomainConceptsMatchingPredicate:v6 options:0 transaction:v4 error:&v11];

  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v7, "integerValue") > 0);
    [v5 setObject:v9 forKeyedSubscript:@"hasMedsList"];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationUserDomainConceptDailyAnalytics _medsCountPayloadWithTransaction:]();
    }
  }

  return v5;
}

+ (id)_medicationsAddedCountSinceDate:(id)a3 transaction:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() _predicateForMedicationsSinceDate:v6];
  id v14 = 0;
  uint64_t v9 = [(id)objc_opt_class() _countOfUserDomainConceptsWithPredicate:v8 transaction:v7 error:&v14];

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
      _os_log_error_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Error when determining if user added medications since date: %{public}@, continuing daily analytics submission: %{public}@", buf, 0x20u);
    }
  }
  return v9;
}

+ (id)_countOfUserDomainConceptsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *MEMORY[0x1E4F65A60];
  id v11 = [v7 protectedDatabase];

  id v12 = [v9 countDistinctForProperty:v10 predicate:v8 database:v11 error:a5];

  return v12;
}

+ (id)_predicateForMedicationsSinceDate:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F2B690];
  id v4 = a3;
  id v5 = [v3 medicationUserDomainConceptTypeIdentifier];
  id v6 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  id v7 = [MEMORY[0x1E4F65D00] predicateWithProperty:*MEMORY[0x1E4F65A20] greaterThanValue:v4];

  id v8 = (void *)MEMORY[0x1E4F65D08];
  v12[0] = v6;
  v12[1] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v10 = [v8 predicateMatchingAllPredicates:v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_medicationsKeyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_weeksSinceFirstAddedMedPayloadWithTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error fetching oldest medication while determening weeks since first med added, continuing daily analytics submission: %{public}@");
}

- (void)_medsInteractionsPayloadWithTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error fetching interaction results, continuing daily analytics submission: %{public}@");
}

- (void)_medsInteractionsPayloadWithTransaction:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error fetching medications while determining interactions, continuing daily analytics submission: %{public}@");
}

- (void)_medsCountPayloadWithTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Error when determining if user has active medications in the database, continuing daily analytics submission: %{public}@");
}

- (void)_archivedMedsCountPayloadWithTransaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to get all medications with error: %{public}@");
}

- (void)_archivedMedsCountPayloadWithTransaction:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to get active medications with error: %{public}@");
}

@end
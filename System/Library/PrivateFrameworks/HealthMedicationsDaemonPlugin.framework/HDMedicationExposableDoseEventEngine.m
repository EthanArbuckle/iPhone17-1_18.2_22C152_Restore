@interface HDMedicationExposableDoseEventEngine
+ (BOOL)writeDoseEvents:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_allExposableDoseEventsForTransaction:(void *)a3 dateInterval:(void *)a4 medicationIdentifier:(void *)a5 profile:(uint64_t)a6 error:;
+ (id)_createDoseEventsForScheduleItem:(void *)a3 medicationIdentifier:(void *)a4 existingDoseEvents:;
+ (id)_createDoseEventsFromExposableEvents:(void *)a3 profile:(uint64_t)a4 error:;
+ (id)_createExposableDoseEventsFromDoseEvents:(uint64_t)a1;
+ (id)_createPredicateForDateInterval:(void *)a3 medicationIdentifier:;
+ (id)_doseEventForScheduleDose:(void *)a3 scheduleItem:;
+ (id)_generateMetadataForScheduleItemIdentifier:(void *)a3 semanticId:(uint64_t)a4 status:(uint64_t)a5 isLastScheduledDose:;
+ (id)_getActiveListMedicationsForProfile:(uint64_t)a3 error:;
+ (id)_getDoseEventsForProfile:(void *)a3 predicate:(uint64_t)a4 error:;
+ (id)_getMatchingScheduleItemDoseEventsForExistingDoseEvents:(void *)a3 dateInterval:(void *)a4 medicationIdentifier:(void *)a5 transaction:(uint64_t)a6 profile:(uint64_t)a7 error:;
+ (id)_populateSemanticIdentifierForExposableEvent:(void *)a3 activeMedications:(uint64_t)a4 error:;
+ (id)_scheuduleItemsPredicateForDateInterval:(uint64_t)a1;
+ (id)doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (uint64_t)_dosesEqualExceptStatusForDoseEvent:(void *)a3 doseEvent2:;
@end

@implementation HDMedicationExposableDoseEventEngine

+ (id)doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14 = [v12 database];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__HDMedicationExposableDoseEventEngine_doseEventsForDateInterval_medicationIdentifier_profile_error___block_invoke;
  v22[3] = &unk_1E6336FC8;
  id v26 = v13;
  id v27 = a1;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  LODWORD(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a6 block:v22];

  if (a6) {
    v19 = v15;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  return v20;
}

BOOL __101__HDMedicationExposableDoseEventEngine_doseEventsForDateInterval_medicationIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = +[HDMedicationExposableDoseEventEngine _allExposableDoseEventsForTransaction:dateInterval:medicationIdentifier:profile:error:](*(void *)(a1 + 64), a2, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a3);
  if (v4) {
    [*(id *)(a1 + 56) addObjectsFromArray:v4];
  }

  return v4 != 0;
}

+ (id)_allExposableDoseEventsForTransaction:(void *)a3 dateInterval:(void *)a4 medicationIdentifier:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = self;
  id v15 = +[HDMedicationExposableDoseEventEngine _createPredicateForDateInterval:medicationIdentifier:](v14, v11, v12);
  id v16 = +[HDMedicationExposableDoseEventEngine _getDoseEventsForProfile:predicate:error:](v14, v13, v15, a6);
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v18 = +[HDMedicationExposableDoseEventEngine _createExposableDoseEventsFromDoseEvents:](v14, v16);
    v19 = (void *)[v17 initWithArray:v18];

    v21 = +[HDMedicationExposableDoseEventEngine _getMatchingScheduleItemDoseEventsForExistingDoseEvents:dateInterval:medicationIdentifier:transaction:profile:error:](v14, v16, v11, v12, v10, v20, a6);
    if (v21)
    {
      [v19 addObjectsFromArray:v21];
      id v22 = v19;
    }
    else
    {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (BOOL)writeDoseEvents:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = +[HDMedicationExposableDoseEventEngine _createDoseEventsFromExposableEvents:profile:error:]((uint64_t)a1, a3, v8, (uint64_t)a5);
  if (v9)
  {
    id v10 = +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:v8 error:a5];
    if (v10)
    {
      id v11 = [v8 dataManager];
      char v12 = [v11 insertDataObjects:v9 sourceEntity:v10 deviceEntity:0 sourceVersion:0 creationDate:a5 error:CFAbsoluteTimeGetCurrent()];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (id)_createDoseEventsFromExposableEvents:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  id v26 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke;
  v15[3] = &unk_1E6337060;
  id v17 = v25;
  uint64_t v19 = v8;
  id v9 = v7;
  uint64_t v20 = a4;
  id v16 = v9;
  id v18 = &v21;
  id v10 = objc_msgSend(v6, "hk_map:", v15);
  id v11 = v10;
  if (*((unsigned char *)v22 + 24))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke_2;
    v14[3] = &__block_descriptor_40_e63___HKMedicationDoseEvent_16__0__HKMedicationExposableDoseEvent_8l;
    v14[4] = v8;
    char v12 = objc_msgSend(v10, "hk_map:", v14);
  }
  else
  {
    char v12 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

  return v12;
}

+ (id)_createPredicateForDateInterval:(void *)a3 medicationIdentifier:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = [v5 startDate];
  id v7 = HDSampleEntityPredicateForStartDate();

  uint64_t v8 = [v5 endDate];

  id v9 = HDSampleEntityPredicateForEndDate();

  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v16[0] = v7;
  v16[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  char v12 = (void *)[v10 initWithArray:v11];

  if (v4)
  {
    id v13 = HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifier();
    [v12 addObject:v13];
  }
  uint64_t v14 = [MEMORY[0x1E4F65D08] predicateMatchingAllPredicates:v12];

  return v14;
}

+ (id)_getDoseEventsForProfile:(void *)a3 predicate:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  uint64_t v8 = (void *)MEMORY[0x1E4F65B48];
  id v9 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  id v10 = [v8 samplesWithType:v9 profile:v7 encodingOptions:0 predicate:v6 limit:0 anchor:0 error:a4];

  return v10;
}

+ (id)_createExposableDoseEventsFromDoseEvents:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_2);

  return v3;
}

+ (id)_getMatchingScheduleItemDoseEventsForExistingDoseEvents:(void *)a3 dateInterval:(void *)a4 medicationIdentifier:(void *)a5 transaction:(uint64_t)a6 profile:(uint64_t)a7 error:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = +[HDMedicationExposableDoseEventEngine _scheuduleItemsPredicateForDateInterval:](v15, v14);

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __156__HDMedicationExposableDoseEventEngine__getMatchingScheduleItemDoseEventsForExistingDoseEvents_dateInterval_medicationIdentifier_transaction_profile_error___block_invoke;
  v24[3] = &unk_1E6336FF0;
  id v25 = v12;
  id v26 = v11;
  id v27 = v16;
  uint64_t v28 = v15;
  id v18 = v16;
  id v19 = v11;
  id v20 = v12;
  LODWORD(a7) = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:v17 orderingTerms:0 transaction:v13 error:a7 enumerationHandler:v24];

  if (a7) {
    uint64_t v21 = v18;
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = v21;

  return v22;
}

+ (id)_scheuduleItemsPredicateForDateInterval:(uint64_t)a1
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = [v2 startDate];
  id v4 = HDMedicationScheduleItemPredicateForScheduledDateTime(5);

  id v5 = [v2 endDate];

  id v6 = HDMedicationScheduleItemPredicateForScheduledDateTime(3);

  id v7 = (void *)MEMORY[0x1E4F65D08];
  v11[0] = v4;
  v11[1] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v7 predicateMatchingAllPredicates:v8];

  return v9;
}

uint64_t __156__HDMedicationExposableDoseEventEngine__getMatchingScheduleItemDoseEventsForExistingDoseEvents_dateInterval_medicationIdentifier_transaction_profile_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = +[HDMedicationExposableDoseEventEngine _createDoseEventsForScheduleItem:medicationIdentifier:existingDoseEvents:](*(void *)(a1 + 56), a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
  id v4 = *(void **)(a1 + 48);
  id v5 = +[HDMedicationExposableDoseEventEngine _createExposableDoseEventsFromDoseEvents:]((uint64_t)HDMedicationExposableDoseEventEngine, v3);
  [v4 addObjectsFromArray:v5];

  return 1;
}

+ (id)_createDoseEventsForScheduleItem:(void *)a3 medicationIdentifier:(void *)a4 existingDoseEvents:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = [v6 doses];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__HDMedicationExposableDoseEventEngine__createDoseEventsForScheduleItem_medicationIdentifier_existingDoseEvents___block_invoke;
  void v16[3] = &unk_1E6337018;
  id v17 = v7;
  id v18 = v6;
  id v19 = v8;
  uint64_t v20 = v9;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  id v14 = objc_msgSend(v10, "hk_map:", v16);

  return v14;
}

id __113__HDMedicationExposableDoseEventEngine__createDoseEventsForScheduleItem_medicationIdentifier_existingDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F2B200]);
  id v5 = [v3 medicationIdentifier];
  id v6 = (void *)[v4 initWithSemanticIdentifierString:v5];

  id v7 = *(void **)(a1 + 32);
  if (!v7 || v6 == v7 || objc_msgSend(v6, "isEqual:"))
  {
    id v8 = +[HDMedicationExposableDoseEventEngine _doseEventForScheduleDose:scheduleItem:](*(void *)(a1 + 56), v3, *(void **)(a1 + 40));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (+[HDMedicationExposableDoseEventEngine _dosesEqualExceptStatusForDoseEvent:doseEvent2:](*(void *)(a1 + 56), v8, *(void **)(*((void *)&v16 + 1) + 8 * i)))
          {

            id v14 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v14 = v8;
LABEL_14:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)_doseEventForScheduleDose:(void *)a3 scheduleItem:
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = self;
  id v7 = [v4 identifier];
  id v8 = [v5 medicationIdentifier];
  id v9 = +[HDMedicationExposableDoseEventEngine _generateMetadataForScheduleItemIdentifier:semanticId:status:isLastScheduledDose:](v6, v7, v8, 1, [v5 isLastScheduledDose]);

  uint64_t v10 = (void *)MEMORY[0x1E4F2B1F0];
  uint64_t v11 = [v4 identifier];
  uint64_t v12 = [v5 medicationIdentifier];
  id v13 = [v5 dose];

  id v14 = [v4 scheduledDateTime];
  uint64_t v15 = [v4 scheduledDateTime];

  long long v16 = [v10 medicationDoseEventWithLogOrigin:2 scheduleItemIdentifier:v11 medicationIdentifier:v12 scheduledDoseQuantity:v13 doseQuantity:0 scheduledDate:v14 startDate:v15 status:2 metadata:v9];

  return v16;
}

+ (uint64_t)_dosesEqualExceptStatusForDoseEvent:(void *)a3 doseEvent2:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = [v6 medicationIdentifier];
  id v9 = [v7 medicationIdentifier];
  if (v8 != v9)
  {
    uint64_t v10 = [v7 medicationIdentifier];
    if (!v10)
    {
      uint64_t v20 = 0;
      goto LABEL_43;
    }
    id v3 = (void *)v10;
    id v4 = [v6 medicationIdentifier];
    uint64_t v11 = [v7 medicationIdentifier];
    if (![v4 isEqual:v11])
    {
      uint64_t v20 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v43 = v11;
  }
  uint64_t v12 = [v6 scheduleItemIdentifier];
  uint64_t v13 = [v7 scheduleItemIdentifier];
  id v14 = (void *)v13;
  if (v12 == (void *)v13)
  {
    v46 = (void *)v13;
  }
  else
  {
    uint64_t v15 = [v7 scheduleItemIdentifier];
    if (!v15)
    {
      uint64_t v20 = 0;
      goto LABEL_33;
    }
    long long v16 = (void *)v15;
    v44 = v3;
    v46 = v14;
    long long v17 = v4;
    long long v18 = [v6 scheduleItemIdentifier];
    long long v19 = [v7 scheduleItemIdentifier];
    if (([v18 isEqual:v19] & 1) == 0)
    {

      uint64_t v20 = 0;
      uint64_t v11 = v43;
      id v4 = v17;
      id v3 = v44;
      if (v8 == v9) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    v39 = v19;
    v40 = v18;
    v41 = v16;
    id v4 = v17;
    id v3 = v44;
  }
  uint64_t v21 = [v6 scheduledDate];
  id v22 = [v7 scheduledDate];
  if (v21 == v22)
  {
    v42 = v4;
    v45 = v3;
  }
  else
  {
    uint64_t v23 = [v7 scheduledDate];
    if (!v23)
    {
      uint64_t v20 = 0;
      goto LABEL_38;
    }
    v38 = (void *)v23;
    char v24 = [v6 scheduledDate];
    v36 = [v7 scheduledDate];
    v37 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      uint64_t v20 = 0;
LABEL_31:

      id v14 = v46;
      if (v12 == v46)
      {

        goto LABEL_41;
      }

LABEL_33:
      goto LABEL_41;
    }
    v42 = v4;
    v45 = v3;
  }
  id v25 = [v6 scheduledDoseQuantity];
  id v26 = [v7 scheduledDoseQuantity];
  if (v25 == v26)
  {
    v34 = v22;
    v35 = v21;
  }
  else
  {
    uint64_t v20 = [v7 scheduledDoseQuantity];
    if (!v20)
    {

      goto LABEL_36;
    }
    v33 = v25;
    id v27 = [v6 scheduledDoseQuantity];
    v30 = [v7 scheduledDoseQuantity];
    v31 = v27;
    v34 = v22;
    v35 = v21;
    v32 = (void *)v20;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      uint64_t v20 = 0;
      goto LABEL_35;
    }
    id v25 = v33;
  }
  uint64_t v28 = [v6 logOrigin];
  uint64_t v20 = v28 == [v7 logOrigin];
  if (v25 != v26)
  {
    v33 = v25;
LABEL_35:

    id v22 = v34;
    uint64_t v21 = v35;
LABEL_36:
    id v3 = v45;
    id v4 = v42;
    if (v21 != v22)
    {
    }
    goto LABEL_38;
  }

  id v22 = v34;
  uint64_t v21 = v35;
  id v3 = v45;
  id v4 = v42;
  if (v35 != v34) {
    goto LABEL_31;
  }
LABEL_38:

  if (v12 != v46)
  {
  }
LABEL_41:

  uint64_t v11 = v43;
  if (v8 != v9) {
    goto LABEL_42;
  }
LABEL_43:

  return v20;
}

+ (id)_generateMetadataForScheduleItemIdentifier:(void *)a3 semanticId:(uint64_t)a4 status:(uint64_t)a5 isLastScheduledDose:
{
  id v8 = a3;
  id v9 = a2;
  self;
  uint64_t v10 = [MEMORY[0x1E4F2B1F0] syncIdentifierForScheduleItemIdentifier:v9 medicationIdentifier:v8];

  uint64_t v11 = [MEMORY[0x1E4F2B1F0] syncVersionForStatus:a4];
  uint64_t v12 = [MEMORY[0x1E4F2B1F0] _metadataWithSyncIdentifier:v10 syncVersion:v11 isLastScheduledDose:a5];

  return v12;
}

id __81__HDMedicationExposableDoseEventEngine__createExposableDoseEventsFromDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F66AF8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDoseEvent:v3];

  return v4;
}

id __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 semanticIdentifier];

  if (v4)
  {
    id v5 = v3;
    goto LABEL_11;
  }
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v6)
  {
LABEL_4:
    id v7 = +[HDMedicationExposableDoseEventEngine _populateSemanticIdentifierForExposableEvent:activeMedications:error:](*(void *)(a1 + 56), v3, v6, *(void *)(a1 + 64));
    id v5 = v7;
    if (v7) {
      id v8 = v7;
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }

    goto LABEL_11;
  }
  uint64_t v9 = +[HDMedicationExposableDoseEventEngine _getActiveListMedicationsForProfile:error:](*(void *)(a1 + 56), *(void **)(a1 + 32), *(void *)(a1 + 64));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v12)
  {
    if ([v12 count])
    {
      id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      goto LABEL_4;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", *(void *)(a1 + 64), 126, @"User has no active medications, thus attempts to write dose events are invalid.");
    id v5 = 0;
  }
  else
  {
    id v5 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
LABEL_11:

  return v5;
}

+ (id)_getActiveListMedicationsForProfile:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  id v5 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v7 = [v4 userDomainConceptManager];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__HDMedicationExposableDoseEventEngine__getActiveListMedicationsForProfile_error___block_invoke;
  v12[3] = &unk_1E63370A8;
  id v13 = v6;
  id v8 = v6;
  LODWORD(a3) = [v7 enumerateUserDomainConceptsWithPredicate:v5 error:a3 enumerationHandler:v12];

  if (a3) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

+ (id)_populateSemanticIdentifierForExposableEvent:(void *)a3 activeMedications:(uint64_t)a4 error:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  self;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v7;
  uint64_t v37 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v40;
    uint64_t v32 = a4;
    id obj = v8;
    id v34 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F2B200]);
        uint64_t v12 = [v10 semanticIdentifier];
        id v13 = [v12 stringValue];
        id v14 = (void *)[v11 initWithSemanticIdentifierString:v13];

        uint64_t v15 = [v14 underlyingIdentifier];
        long long v16 = [v6 medicationIdentifier];
        uint64_t v17 = [v16 underlyingIdentifier];
        if (v15 == (void *)v17)
        {
          v35 = v10;

LABEL_15:
          [v35 semanticIdentifier];
          v29 = id v27 = v14;
          v30 = [v29 stringValue];
          uint64_t v28 = [v6 updateForSemanticIdentifier:v30];

          id v25 = v6;
          id v8 = obj;
          id v26 = obj;
          goto LABEL_16;
        }
        long long v18 = (void *)v17;
        long long v19 = [v6 medicationIdentifier];
        uint64_t v20 = [v19 underlyingIdentifier];
        if (v20)
        {
          v35 = v10;
          uint64_t v21 = [v14 underlyingIdentifier];
          id v22 = [v6 medicationIdentifier];
          uint64_t v23 = [v22 underlyingIdentifier];
          char v38 = [v21 isEqualToString:v23];

          id v6 = v34;
          if (v38) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      id v8 = obj;
      a4 = v32;
      uint64_t v37 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  char v24 = (void *)MEMORY[0x1E4F28C58];
  [v6 medicationIdentifier];
  v26 = id v25 = v6;
  id v27 = [v26 underlyingIdentifier];
  objc_msgSend(v24, "hk_assignError:code:format:", a4, 118, @"Unable to find a HKMedicationUserDomainConcept with a semantic identifier that matches the HKMedicationExposableDoseEvent's hashed identifier: %@. Cancelling saving dose events.", v27);
  uint64_t v28 = 0;
LABEL_16:

  return v28;
}

id __91__HDMedicationExposableDoseEventEngine__createDoseEventsFromExposableEvents_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 scheduleItemIdentifier];
  id v5 = [v3 semanticIdentifier];
  uint64_t v23 = +[HDMedicationExposableDoseEventEngine _generateMetadataForScheduleItemIdentifier:semanticId:status:isLastScheduledDose:](v2, v4, v5, [v3 status], 0);

  id v6 = (void *)MEMORY[0x1E4F2B1F0];
  id v7 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  id v22 = [v3 startDate];
  id v8 = [v3 startDate];
  uint64_t v21 = [v3 logOrigin];
  uint64_t v9 = [v3 scheduleItemIdentifier];
  id v10 = [v3 semanticIdentifier];
  id v11 = [v3 scheduledDoseQuantity];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v3 doseQuantity];
  [v14 doubleValue];
  double v16 = v15;
  uint64_t v17 = [v3 scheduledDate];
  uint64_t v18 = [v3 status];

  long long v19 = [v6 medicationDoseEventWithType:v7 startDate:v22 endDate:v8 device:0 metadata:v23 logOrigin:v21 scheduleItemIdentifier:v13 medicationIdentifier:v16 scheduledDoseQuantity:v9 doseQuantity:v10 scheduledDate:v17 status:v18 medicationUuid:0];

  return v19;
}

uint64_t __82__HDMedicationExposableDoseEventEngine__getActiveListMedicationsForProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

@end
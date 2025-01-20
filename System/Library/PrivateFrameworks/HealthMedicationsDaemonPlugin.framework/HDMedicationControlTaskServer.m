@interface HDMedicationControlTaskServer
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_accountDevicesInfoTriggeringUpdate:(BOOL)a3 completion:(id)a4;
- (void)remote_allDismissedDrugInteractionsWithCompletion:(id)a3;
- (void)remote_allDismissedPregnancyLactationInteractionsWithCompletion:(id)a3;
- (void)remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion:(id)a3;
- (void)remote_deleteDismissedDrugInteractionsForMedication:(id)a3 completion:(id)a4;
- (void)remote_deleteDismissedPregnancyLactationInteractionsForMedication:(id)a3 interactionTypes:(id)a4 completion:(id)a5;
- (void)remote_deleteDismissedRemoteScheduleUnavailableForMedication:(id)a3 completion:(id)a4;
- (void)remote_markDrugInteractionAsDismissed:(id)a3 completion:(id)a4;
- (void)remote_markPregnancyLactationInteractionForMedicationAsDismissed:(id)a3 interactionType:(int64_t)a4 completion:(id)a5;
- (void)remote_markRemoteScheduleUnavailableRecordsAsDismissed:(id)a3 completion:(id)a4;
- (void)remote_updateLocalDeviceValuesNowWithCompletion:(id)a3;
@end

@implementation HDMedicationControlTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F66BD0];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F66AE8] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F66AE8] clientInterface];
}

- (void)remote_updateLocalDeviceValuesNowWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 healthMedicationsProfileExtension];
  v7 = [v6 deviceScopedStorageManager];

  id v10 = 0;
  uint64_t v8 = [v7 updateLocalDeviceValuesNowWithError:&v10];
  id v9 = v10;
  v4[2](v4, v8, v9);
}

- (void)remote_accountDevicesInfoTriggeringUpdate:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v7 = [(HDStandardTaskServer *)self profile];
  uint64_t v8 = [v7 healthMedicationsProfileExtension];
  id v9 = [v8 deviceScopedStorageManager];

  id v12 = 0;
  id v10 = [v9 accountDevicesInfoTriggeringUpdate:v4 error:&v12];
  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_markRemoteScheduleUnavailableRecordsAsDismissed:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, BOOL, id))a4;
  v7 = objc_msgSend(a3, "hk_map:", &__block_literal_global);
  uint64_t v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  BOOL v9 = +[HDDismissedRemoteScheduleUnavailableRecordEntity insertDismissedRemoteScheduleUnavailableRecords:v7 profile:v8 error:&v11];
  id v10 = v11;

  v6[2](v6, v9, v10);
}

uint64_t __99__HDMedicationControlTaskServer_remote_markRemoteScheduleUnavailableRecordsAsDismissed_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dismissedRecord];
}

- (void)remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  v5 = (void (**)(id, void, id))a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(HDStandardTaskServer *)self profile];
  uint64_t v8 = [v7 database];
  id v14 = v6;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__HDMedicationControlTaskServer_remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke;
  v13[3] = &unk_1E6336E90;
  id v9 = v6;
  BOOL v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:&v15 block:v13];
  id v11 = v15;

  if (v10) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  ((void (**)(id, id, id))v5)[2](v5, v12, v11);
}

BOOL __99__HDMedicationControlTaskServer_remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__HDMedicationControlTaskServer_remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6336E68;
  id v8 = *(id *)(a1 + 32);
  BOOL v5 = +[HDDismissedRemoteScheduleUnavailableRecordEntity enumerateDismissedRemoteScheduleUnavailableRecordEntitiesWithPredicate:0 transaction:a2 error:a3 enumerationHandler:v7];

  return v5;
}

uint64_t __99__HDMedicationControlTaskServer_remote_allDismissedRemoteScheduleUnavailableRecordsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)remote_deleteDismissedRemoteScheduleUnavailableForMedication:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, BOOL, id))a4;
  id v9 = [v7 semanticIdentifier];
  BOOL v10 = [v9 stringValue];

  if (v10)
  {
    id v11 = [v7 semanticIdentifier];
    id v12 = [v11 stringValue];
    v21[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v14 = HDDismissedRemoteScheduleUnavailableRecordsForMedicationSemanticIdentifiers((uint64_t)v13);

    id v15 = [(HDStandardTaskServer *)self profile];
    v16 = [v15 database];
    id v20 = 0;
    BOOL v17 = +[HDHealthEntity deleteEntitiesWithPredicate:v14 healthDatabase:v16 error:&v20];
    id v18 = v20;

    v8[2](v8, v17, v18);
  }
  else
  {
    v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: medication.semanticIdentifier must not be nil"", self);
    v8[2](v8, 0, v19);
  }
}

- (void)remote_markDrugInteractionAsDismissed:(id)a3 completion:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F66AA0];
  id v7 = (void (**)(id, BOOL, id))a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] _initWithDrugInteractionResult:v8];

  BOOL v10 = [(HDStandardTaskServer *)self profile];
  id v13 = 0;
  BOOL v11 = +[HDDismissedDrugInteractionResultEntity insertDismissedDrugInteractionResult:v9 profile:v10 error:&v13];
  id v12 = v13;

  v7[2](v7, v11, v12);
}

- (void)remote_allDismissedDrugInteractionsWithCompletion:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  BOOL v5 = (void (**)(id, void, id))a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(HDStandardTaskServer *)self profile];
  id v8 = [v7 database];
  id v14 = v6;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke;
  v13[3] = &unk_1E6336E90;
  id v9 = v6;
  BOOL v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:&v15 block:v13];
  id v11 = v15;

  if (v10) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  ((void (**)(id, id, id))v5)[2](v5, v12, v11);
}

BOOL __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6336EB8;
  id v8 = *(id *)(a1 + 32);
  BOOL v5 = +[HDDismissedDrugInteractionResultEntity enumerateDismissedDrugInteractionResultsWithPredicate:0 transaction:a2 error:a3 enumerationHandler:v7];

  return v5;
}

uint64_t __83__HDMedicationControlTaskServer_remote_allDismissedDrugInteractionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)remote_deleteDismissedDrugInteractionsForMedication:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, BOOL, id))a4;
  id v9 = [v7 firstConceptIdentifier];

  if (v9)
  {
    BOOL v10 = [v7 firstConceptIdentifier];
    id v11 = HDDismissedDrugInteractionResultPredicateForDrugClassAncestorIdentifier(v10);

    id v12 = [(HDStandardTaskServer *)self profile];
    id v13 = [v12 database];
    id v16 = 0;
    BOOL v14 = +[HDHealthEntity deleteEntitiesWithPredicate:v11 healthDatabase:v13 error:&v16];
    id v15 = v16;

    v8[2](v8, v14, v15);
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: medication.firstConceptIdentifier must not be nil"", self);
    v8[2](v8, 0, v11);
  }
}

- (void)remote_markPregnancyLactationInteractionForMedicationAsDismissed:(id)a3 interactionType:(int64_t)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F66AA8];
  id v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  id v12 = [v10 firstConceptIdentifier];

  id v13 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v14 = (void *)[v11 _initWithMedicationIdentifier:v12 interactionType:a4 creationDate:v13];

  id v15 = [(HDStandardTaskServer *)self profile];
  id v18 = 0;
  BOOL v16 = +[HDDismissedPregnancyLactationInteractionEntity insertDismissedPregnancyLactationInteraction:v14 profile:v15 error:&v18];
  id v17 = v18;

  v9[2](v9, v16, v17);
}

- (void)remote_allDismissedPregnancyLactationInteractionsWithCompletion:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  BOOL v5 = (void (**)(id, void, id))a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(HDStandardTaskServer *)self profile];
  id v8 = [v7 database];
  id v14 = v6;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke;
  v13[3] = &unk_1E6336E90;
  id v9 = v6;
  BOOL v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:&v15 block:v13];
  id v11 = v15;

  if (v10) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }
  ((void (**)(id, id, id))v5)[2](v5, v12, v11);
}

BOOL __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6336EE0;
  id v8 = *(id *)(a1 + 32);
  BOOL v5 = +[HDDismissedPregnancyLactationInteractionEntity enumerateDismissedPregnancyLactationInteractionsWithPredicate:0 transaction:a2 error:a3 enumerationHandler:v7];

  return v5;
}

uint64_t __97__HDMedicationControlTaskServer_remote_allDismissedPregnancyLactationInteractionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (void)remote_deleteDismissedPregnancyLactationInteractionsForMedication:(id)a3 interactionTypes:(id)a4 completion:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, BOOL, id))a5;
  id v12 = [v9 firstConceptIdentifier];

  if (v12)
  {
    id v13 = [v9 firstConceptIdentifier];
    v22[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v15 = HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiersAndInteractionTypes(v14, v10);

    BOOL v16 = [(HDStandardTaskServer *)self profile];
    id v17 = [v16 database];
    id v21 = 0;
    BOOL v18 = +[HDHealthEntity deleteEntitiesWithPredicate:v15 healthDatabase:v17 error:&v21];
    id v19 = v21;

    v11[2](v11, v18, v19);
  }
  else
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: medication.firstConceptIdentifier must not be nil"", self);
    v11[2](v11, 0, v20);
  }
}

@end
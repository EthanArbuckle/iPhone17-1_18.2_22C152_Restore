@interface HDDatabaseControlServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_getHealthDatabaseIdentifierWithCompletion:(id)a3;
- (void)remote_getHealthDirectorySizeInBytesWithCompletion:(id)a3;
- (void)remote_hkqa_generateDemoDataWithDurationInDays:(int64_t)a3 completion:(id)a4;
- (void)remote_hkqa_statisticsWithCompletion:(id)a3;
- (void)remote_obliterateHealthDataWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)remote_performMigrationWithCompletion:(id)a3;
@end

@implementation HDDatabaseControlServer

- (void)remote_getHealthDatabaseIdentifierWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 database];
  id v9 = 0;
  uint64_t v7 = [v6 databaseUUIDWithError:&v9];
  uint64_t v8 = (uint64_t)v9;

  if (!(v7 | v8))
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 11, @"No identifier found protected data may not exist.");;
  }
  v4[2](v4, v7, v8);
}

- (void)remote_getHealthDirectorySizeInBytesWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 daemon];
  id v7 = [v6 healthDirectorySizeInBytes];

  v4[2](v4, v7, 0);
}

- (void)remote_obliterateHealthDataWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(HDStandardTaskServer *)self client];
  uint64_t v8 = *MEMORY[0x1E4F2A288];
  id v21 = 0;
  int v9 = [v7 hasRequiredEntitlement:v8 error:&v21];
  id v10 = v21;

  if (v9)
  {
    v11 = [(HDStandardTaskServer *)self client];
    v12 = [v11 process];

    v13 = NSString;
    v14 = [v12 name];
    v15 = [v13 stringWithFormat:@"Requested by \"%@\" (%d)", v14, objc_msgSend(v12, "processIdentifier")];

    v16 = [(HDStandardTaskServer *)self profile];
    v17 = [v16 daemon];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__HDDatabaseControlServer_remote_obliterateHealthDataWithOptions_completion___block_invoke;
    v18[3] = &unk_1E62F3CA8;
    id v19 = 0;
    id v20 = v6;
    [v17 obliterateAndTerminateWithOptions:a3 reason:v15 completion:v18];
  }
  else if (v6)
  {
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v10);
  }
}

uint64_t __77__HDDatabaseControlServer_remote_obliterateHealthDataWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, *(void *)(a1 + 32));
  }
  return result;
}

- (void)remote_performMigrationWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 database];
  id v7 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
  id v10 = 0;
  uint64_t v8 = [v6 performTransactionWithContext:v7 error:&v10 block:&__block_literal_global_5 inaccessibilityHandler:0];
  id v9 = v10;

  v4[2](v4, v8, v9);
}

uint64_t __65__HDDatabaseControlServer_remote_performMigrationWithCompletion___block_invoke()
{
  return 1;
}

- (void)remote_hkqa_generateDemoDataWithDurationInDays:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = HKCreateSerialDispatchQueue();
  uint64_t v8 = [HDDemoDataGenerator alloc];
  id v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [(HDDemoDataGenerator *)v8 initWithProfile:v9 queue:v7];

  v11 = [(HDDemoDataGenerator *)v10 configuration];
  [v11 setGenerationPeriodInDays:a3];
  v12 = +[HDDemoDataPerson defaultPersonWithBiologicalSex:](HDDemoDataPerson, "defaultPersonWithBiologicalSex:", [v11 biologicalSex]);
  v13 = [(HDDemoDataGenerator *)v10 gregorianCalendar];
  v14 = [v12 birthDateComponents];
  v15 = [v13 dateFromComponents:v14];
  [v12 setBirthDate:v15];

  objc_msgSend(v12, "setNutritionTrackingType:", objc_msgSend(v11, "nutritionTrackingType"));
  objc_msgSend(v12, "setResultsTrackingType:", objc_msgSend(v11, "resultsTrackingType"));
  objc_msgSend(v12, "applyProfileType:", objc_msgSend(v11, "profileType"));
  objc_msgSend(v12, "setHighFidelityGeneration:", objc_msgSend(v11, "highFidelityGeneration"));
  [(HDDemoDataGenerator *)v10 setDemoPerson:v12];
  v16 = [MEMORY[0x1E4F1C9C8] date];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__HDDatabaseControlServer_remote_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke;
  v18[3] = &unk_1E62F3CF0;
  id v19 = v6;
  id v17 = v6;
  [(HDDemoDataGenerator *)v10 generateThroughEndDate:v16 completion:v18];
}

uint64_t __85__HDDatabaseControlServer_remote_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__HDDatabaseControlServer__querySampleCount_withTransaction_error___block_invoke(uint64_t a1)
{
  **(void **)(a1 + 32) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __68__HDDatabaseControlServer__queryDistinctTypesWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnAsInt64();
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithInteger:v2];
  [v3 addObject:v4];

  return 1;
}

uint64_t __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F2B3B8], "_quantityTypeWithCode:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v3 = [NSNumber numberWithInteger:HDSQLiteColumnAsInt64()];
  [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v2];

  return 1;
}

uint64_t __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (void)remote_hkqa_statisticsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDDatabaseControlServer_remote_hkqa_statisticsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62F3DB0;
  aBlock[4] = self;
  aBlock[5] = &v14;
  v5 = _Block_copy(aBlock);
  id v6 = [(HDStandardTaskServer *)self profile];
  id v7 = [v6 database];
  uint64_t v8 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  id v12 = 0;
  int v9 = [v7 performTransactionWithContext:v8 error:&v12 block:v5 inaccessibilityHandler:0];
  id v10 = v12;

  if (v9) {
    uint64_t v11 = v15[5];
  }
  else {
    uint64_t v11 = 0;
  }
  v4[2](v4, v11, v10);

  _Block_object_dispose(&v14, 8);
}

BOOL __64__HDDatabaseControlServer_remote_hkqa_statisticsWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v43 = 0;
  uint64_t v37 = a1;
  if (!*(void *)(a1 + 32))
  {
    BOOL v28 = 0;
    goto LABEL_28;
  }
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v54 = 3221225472;
  v55 = __67__HDDatabaseControlServer__querySampleCount_withTransaction_error___block_invoke;
  v56 = &__block_descriptor_40_e26_B24__0__HDSQLiteRow__8__16l;
  v57 = &v43;
  id v36 = v4;
  id v5 = v4;
  id v6 = _Block_copy(&aBlock);
  id v7 = [v5 protectedDatabase];

  int v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT COUNT(*) FROM samples JOIN objects USING (data_id) WHERE type=1;",
         a3,
         0,
         v6);

  if (v8)
  {
    int v9 = *(void **)(v37 + 32);
    if (v9)
    {
      id v10 = (void *)MEMORY[0x1E4F1CA48];
      id v11 = v5;
      id v12 = [v10 array];
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v54 = 3221225472;
      v55 = __68__HDDatabaseControlServer__queryDistinctTypesWithTransaction_error___block_invoke;
      v56 = &unk_1E62F3D38;
      v57 = v12;
      v13 = v12;
      uint64_t v14 = _Block_copy(&aBlock);
      v15 = [v11 protectedDatabase];

      int v16 = objc_msgSend(v15, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT DISTINCT data_type FROM samples JOIN objects USING (data_id) WHERE type=1;",
              a3,
              0,
              v14);

      if (v16) {
        id v17 = v13;
      }
      else {
        id v17 = 0;
      }
      v18 = v17;

      if (v18)
      {
        id v19 = *(id *)(v37 + 32);
        v35 = v18;
        id v40 = v11;
        if (v19)
        {
          v41 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id obj = v35;
          uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:&aBlock count:16];
          if (v20)
          {
            uint64_t v39 = *(void *)v50;
            uint64_t v21 = MEMORY[0x1E4F143A8];
            while (2)
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v50 != v39) {
                  objc_enumerationMutation(obj);
                }
                v23 = *(void **)(*((void *)&v49 + 1) + 8 * v22);
                v47[0] = 0;
                v47[1] = v47;
                v47[2] = 0x2020000000;
                uint64_t v48 = 0;
                uint64_t v48 = objc_msgSend(v23, "integerValue", v35);
                v45[0] = v21;
                v45[1] = 3221225472;
                v45[2] = __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke;
                v45[3] = &unk_1E62F3D60;
                v45[4] = v23;
                id v46 = v41;
                v24 = _Block_copy(v45);
                v44[0] = v21;
                v44[1] = 3221225472;
                v44[2] = __66__HDDatabaseControlServer__queryTypeCounts_withTransaction_error___block_invoke_2;
                v44[3] = &unk_1E62F3D88;
                v44[4] = v47;
                v25 = _Block_copy(v44);
                v26 = [v40 protectedDatabase];
                LOBYTE(v23) = objc_msgSend(v26, "executeSQL:error:bindingHandler:enumerationHandler:", @"SELECT COUNT(*) FROM samples JOIN objects USING (data_id) WHERE type = 1 AND data_type = ?;",
                                a3,
                                v25,
                                v24);

                _Block_object_dispose(v47, 8);
                if ((v23 & 1) == 0)
                {

                  id v19 = 0;
                  v27 = v41;
                  goto LABEL_20;
                }
                ++v22;
              }
              while (v20 != v22);
              uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:&aBlock count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          v27 = v41;
          id v19 = v41;
LABEL_20:
        }
        BOOL v28 = v19 != 0;
        if (v19)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F2B368]);
          v30 = [NSNumber numberWithInteger:v43];
          uint64_t v31 = [v29 initWithSampleCount:v30 sampleCountByType:v19];
          uint64_t v32 = *(void *)(*(void *)(v37 + 40) + 8);
          v33 = *(void **)(v32 + 40);
          *(void *)(v32 + 40) = v31;
        }
        int v9 = v35;
        goto LABEL_26;
      }
      int v9 = 0;
    }
    BOOL v28 = 0;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v28 = 0;
LABEL_27:
  id v4 = v36;
LABEL_28:

  return v28;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7BE8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7BE0](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AED0] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end
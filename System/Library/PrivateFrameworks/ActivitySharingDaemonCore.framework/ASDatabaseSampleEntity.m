@interface ASDatabaseSampleEntity
+ (BOOL)deleteSamplesOfType:(id)a3 predicate:(id)a4 healthStore:(id)a5 deletedSampleCount:(unint64_t *)a6 error:(id *)a7;
+ (BOOL)enumerateSamplesOfType:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7 handler:(id)a8;
+ (BOOL)enumerateSamplesOfTypes:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7 handler:(id)a8;
+ (id)samplesOfType:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7;
+ (id)samplesOfTypes:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7;
@end

@implementation ASDatabaseSampleEntity

+ (id)samplesOfType:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v19 = a3;
  v12 = (void *)MEMORY[0x263EFF8C0];
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [v12 arrayWithObjects:&v19 count:1];

  v17 = objc_msgSend(a1, "samplesOfTypes:predicate:healthStore:anchor:error:", v16, v14, v13, a6, a7, v19, v20);

  return v17;
}

+ (id)samplesOfTypes:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    id v14 = objc_msgSend(MEMORY[0x263F0A670], "anchorFromValue:", objc_msgSend(*a6, "integerValue"));
  }
  else
  {
    id v14 = 0;
  }
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __76__ASDatabaseSampleEntity_samplesOfTypes_predicate_healthStore_anchor_error___block_invoke;
  v37[3] = &unk_265215E38;
  id v16 = v12;
  id v38 = v16;
  v17 = objc_msgSend(v11, "hk_map:", v37);
  id v18 = objc_alloc(MEMORY[0x263F0A0C8]);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __76__ASDatabaseSampleEntity_samplesOfTypes_predicate_healthStore_anchor_error___block_invoke_2;
  v32 = &unk_265215E60;
  v34 = &v51;
  v35 = &v45;
  v36 = &v39;
  id v19 = v15;
  v33 = v19;
  uint64_t v20 = (void *)[v18 initWithQueryDescriptors:v17 anchor:v14 limit:0 resultsHandler:&v29];
  objc_msgSend(v20, "setIgnoreDeletedObjects:", 1, v29, v30, v31, v32);
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  [v20 setDebugIdentifier:v22];

  [v13 executeQuery:v20];
  dispatch_time_t v23 = dispatch_time(0, 15000000000);
  intptr_t v24 = dispatch_semaphore_wait(v19, v23);
  [v13 stopQuery:v20];
  if (v24)
  {
    uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ActivitySharing.DatabaseSampleEntity" code:0 userInfo:0];
    v26 = (void *)v40[5];
    v40[5] = v25;
  }
  if (a6) {
    *a6 = (id) v46[5];
  }
  *a7 = (id) v40[5];
  id v27 = (id)v52[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v27;
}

id __76__ASDatabaseSampleEntity_samplesOfTypes_predicate_healthStore_anchor_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F0A678];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithSampleType:v4 predicate:*(void *)(a1 + 32)];

  return v5;
}

void __76__ASDatabaseSampleEntity_samplesOfTypes_predicate_healthStore_anchor_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v22 = v9;
  id v13 = a5;

  id v14 = NSNumber;
  uint64_t v15 = [v13 _rowid];

  uint64_t v16 = [v14 numberWithLongLong:v15];
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v10;
  id v21 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)enumerateSamplesOfType:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7 handler:(id)a8
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v14 = (void *)MEMORY[0x263EFF8C0];
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [v14 arrayWithObjects:&v21 count:1];

  LOBYTE(a7) = objc_msgSend(a1, "enumerateSamplesOfTypes:predicate:healthStore:anchor:error:handler:", v19, v17, v16, a6, a7, v15, v21, v22);
  return (char)a7;
}

+ (BOOL)enumerateSamplesOfTypes:(id)a3 predicate:(id)a4 healthStore:(id)a5 anchor:(id *)a6 error:(id *)a7 handler:(id)a8
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v14 = (void (**)(id, void))a8;
  id v15 = [a1 samplesOfTypes:a3 predicate:a4 healthStore:a5 anchor:a6 error:a7];
  id v16 = v15;
  id v17 = *a7;
  if (!*a7)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v16);
          }
          v14[2](v14, *(void *)(*((void *)&v23 + 1) + 8 * i));
        }
        uint64_t v19 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }

  return v17 == 0;
}

+ (BOOL)deleteSamplesOfType:(id)a3 predicate:(id)a4 healthStore:(id)a5 deletedSampleCount:(unint64_t *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  long long v23 = __93__ASDatabaseSampleEntity_deleteSamplesOfType_predicate_healthStore_deletedSampleCount_error___block_invoke;
  long long v24 = &unk_265215E88;
  long long v26 = &v39;
  id v27 = &v35;
  uint64_t v28 = &v29;
  id v15 = v14;
  long long v25 = v15;
  [v13 deleteObjectsOfType:v11 predicate:v12 withCompletion:&v21];
  dispatch_time_t v16 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.ActivitySharing.DatabaseSampleEntity", 0, 0, v21, v22, v23, v24);
    uint64_t v18 = (void *)v30[5];
    v30[5] = v17;
  }
  *a6 = v36[3];
  *a7 = (id) v30[5];
  char v19 = *((unsigned char *)v40 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v19;
}

void __93__ASDatabaseSampleEntity_deleteSamplesOfType_predicate_healthStore_deletedSampleCount_error___block_invoke(uint64_t a1, char a2, uint64_t a3, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  id v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
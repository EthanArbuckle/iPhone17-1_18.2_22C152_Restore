@interface DPStorage
@end

@implementation DPStorage

uint64_t __31___DPStorage_removeBadObjects___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

void __29___DPStorage_errorStringFor___block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F372C618;
  v2[1] = &unk_1F372C630;
  v3[0] = @"Not an error";
  v3[1] = @"Unknown error";
  v2[2] = &unk_1F372C648;
  v2[3] = &unk_1F372C660;
  v3[2] = @"Invalid parameter";
  v3[3] = @"Empty Array";
  v2[4] = &unk_1F372C678;
  v2[5] = &unk_1F372C690;
  v3[4] = @"Empty Array after removing bad objects";
  v3[5] = @"Permission denied";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)errorStringFor__errorsDict;
  errorStringFor__errorsDict = v0;
}

void __47___DPStorage_handleEmptyArrayError_completion___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() errorStringFor:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = +[_DPStrings errorDomain];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v2;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v8 = [v4 errorWithDomain:v5 code:v6 userInfo:v7];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v8);
}

void __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() errorStringFor:5];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = +[_DPStrings errorDomain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v6 = [v3 errorWithDomain:v4 code:5 userInfo:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() createFetchRequestFor:*(void *)(a1 + 40) entityName:*(void *)(a1 + 48) predicate:*(void *)(a1 + 56) fetchLimit:0 fetchOffset:0];
  [v2 setIncludesSubentities:0];
  [v2 setIncludesPropertyValues:0];
  [v2 setResultType:4];
  uint64_t v3 = *(void **)(a1 + 40);
  id v17 = 0;
  uint64_t v4 = [v3 countForFetchRequest:v2 error:&v17];
  id v5 = v17;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_81;
    block[3] = &unk_1E6C442F0;
    id v16 = *(id *)(a1 + 72);
    id v15 = v5;
    dispatch_async(v6, block);

    [*(id *)(a1 + 40) reset];
    uint64_t v7 = &v16;
    uint64_t v8 = &v15;
  }
  else
  {
    [*(id *)(a1 + 40) reset];
    uint64_t v9 = [*(id *)(a1 + 32) queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2_82;
    v10[3] = &unk_1E6C44318;
    v13[0] = *(id *)(a1 + 72);
    v13[1] = v4;
    uint64_t v11 = 0;
    id v12 = *(id *)(a1 + 64);
    dispatch_async(v9, v10);

    uint64_t v7 = (id *)v13;
    uint64_t v8 = (id *)&v11;
  }
}

uint64_t __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __61___DPStorage_fetchRecordCountForEntity_predicate_completion___block_invoke_2_82(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E019F810]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() errorStringFor:5];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = +[_DPStrings errorDomain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v6 = [v3 errorWithDomain:v4 code:5 userInfo:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() createFetchRequestFor:*(void *)(a1 + 40) entityName:*(void *)(a1 + 48) predicate:*(void *)(a1 + 56) fetchLimit:*(void *)(a1 + 80) fetchOffset:*(void *)(a1 + 88)];
  [v2 setIncludesSubentities:0];
  [v2 setPropertiesToFetch:&unk_1F37A0620];
  [v2 setPropertiesToGroupBy:&unk_1F37A0638];
  [v2 setResultType:2];
  uint64_t v3 = *(void **)(a1 + 40);
  id v27 = 0;
  long long v14 = [v3 executeFetchRequest:v2 error:&v27];
  id v4 = v27;
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_90;
    block[3] = &unk_1E6C442F0;
    id v26 = *(id *)(a1 + 72);
    id v25 = v4;
    dispatch_async(v5, block);

    [*(id *)(a1 + 40) reset];
    id v6 = v26;
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v14;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:@"key"];
          if (v12) {
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 40) reset];
    long long v13 = [*(id *)(a1 + 32) queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2_92;
    v15[3] = &unk_1E6C44368;
    id v19 = *(id *)(a1 + 72);
    id v16 = v7;
    id v17 = 0;
    id v18 = *(id *)(a1 + 64);
    id v6 = v7;
    dispatch_async(v13, v15);
  }
}

uint64_t __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __79___DPStorage_fetchKeynamesFor_predicate_fetchLimit_fetchOffset_withCompletion___block_invoke_2_92(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E019F810]();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() errorStringFor:5];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = +[_DPStrings errorDomain];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [v3 errorWithDomain:v4 code:5 userInfo:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = [(id)objc_opt_class() createFetchRequestFor:*(void *)(a1 + 40) entityName:*(void *)(a1 + 48) predicate:*(void *)(a1 + 56) fetchLimit:*(void *)(a1 + 80) fetchOffset:*(void *)(a1 + 88)];
  if (*(unsigned char *)(a1 + 104))
  {
    v2 = (void *)[v29 copy];
    [v2 setResultType:1];
    if (*(void *)(v1 + 80) <= 0x32uLL) {
      uint64_t v3 = 50;
    }
    else {
      uint64_t v3 = *(void *)(v1 + 80);
    }
    [v2 setFetchLimit:v3];
    id v4 = *(void **)(v1 + 40);
    id v48 = 0;
    id v28 = v2;
    id obj = [v4 executeFetchRequest:v2 error:&v48];
    id v5 = v48;
    if (v5)
    {
      id v6 = [*(id *)(v1 + 32) queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_94;
      block[3] = &unk_1E6C442F0;
      id v7 = *(id *)(a1 + 72);
      id v46 = v5;
      id v47 = v7;
      id v8 = v5;
      dispatch_async(v6, block);

      [*(id *)(a1 + 40) reset];
      goto LABEL_23;
    }
    uint64_t v9 = [(id)objc_opt_class() shuffleOrderOfRecords:obj count:*(void *)(a1 + 80)];
    unint64_t v10 = *(void *)(a1 + 80);
    if (v10 >= [v9 count]) {
      uint64_t v11 = [v9 count];
    }
    else {
      uint64_t v11 = *(void *)(a1 + 80);
    }
    id v12 = objc_msgSend(v9, "subarrayWithRange:", 0, v11);

    long long v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(self IN %@)", v12];
    [v29 setPredicate:v13];

    uint64_t v1 = a1;
  }
  long long v14 = *(void **)(v1 + 40);
  id v44 = 0;
  id obj = [v14 executeFetchRequest:v29 error:&v44];
  id v28 = v44;
  if (v28)
  {
    id v15 = [*(id *)(v1 + 32) queue];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_99;
    v41[3] = &unk_1E6C442F0;
    id v43 = *(id *)(a1 + 72);
    id v28 = v28;
    id v42 = v28;
    dispatch_async(v15, v41);

    [*(id *)(a1 + 40) reset];
    id v8 = v43;
  }
  else
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = obj;
    uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v21 = (void *)MEMORY[0x1E019F810]();
          long long v22 = [*(id *)(a1 + 32) converterFromEntity];
          long long v23 = [v20 entity];
          v24 = [v23 name];
          id v25 = [v22 objectForKeyedSubscript:v24];

          id v26 = [v25 createRecordFromManagedObject:v20];
          if (v26) {
            [v16 addObject:v26];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v17);
    }

    [*(id *)(a1 + 40) reset];
    id v27 = [*(id *)(a1 + 32) queue];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2_100;
    v32[3] = &unk_1E6C44368;
    id v36 = *(id *)(a1 + 72);
    id v33 = v16;
    id v34 = 0;
    id v35 = *(id *)(a1 + 64);
    id v8 = v16;
    dispatch_async(v27, v32);
  }
LABEL_23:
}

uint64_t __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

uint64_t __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

void __93___DPStorage_fetchRecordsFor_predicate_fetchLimit_fetchOffset_randomizeOrder_withCompletion___block_invoke_2_100(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E019F810]();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v36;
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v10 = [(id)objc_opt_class() description];
        uint64_t v11 = [v2 objectForKeyedSubscript:v10];

        if (!v11)
        {
          id v12 = (void *)[v7 mutableCopy];
          [v2 setObject:v12 forKey:v10];
        }
        long long v13 = [v2 objectForKeyedSubscript:v10];
        [v13 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v5);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v2 allKeys];
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        long long v20 = [v2 objectForKeyedSubscript:v19];
        long long v21 = (void *)[v20 copy];

        long long v22 = [*(id *)(a1 + 32) converterFromClass];
        long long v23 = [v22 objectForKeyedSubscript:v19];

        v24 = [v23 insertRecords:v21 inManagedObjectContext:*(void *)(a1 + 40)];
        uint64_t v25 = [v21 count];
        v16 += v25 - [v24 count];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 40) save:0];
  }
  if (*(void *)(a1 + 48))
  {
    id v26 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke_2;
    block[3] = &unk_1E6C443E0;
    id v29 = *(id *)(a1 + 48);
    BOOL v30 = v16 == 0;
    dispatch_async(v26, block);
  }
}

uint64_t __50___DPStorage_saveRecords_andFlush_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __43___DPStorage_updateRecords_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v43 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v58;
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        unint64_t v10 = [(id)objc_opt_class() description];
        uint64_t v11 = [v2 objectForKeyedSubscript:v10];

        if (!v11)
        {
          id v12 = (void *)[v7 mutableCopy];
          [v2 setObject:v12 forKey:v10];
        }
        long long v13 = [v2 objectForKeyedSubscript:v10];
        [v13 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v5);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [v2 allKeys];
  uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  uint64_t v14 = 0;
  if (v44)
  {
    uint64_t v41 = *(void *)v54;
    id v42 = v2;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v14;
        uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        uint64_t v17 = [v2 objectForKeyedSubscript:v16];
        uint64_t v18 = (void *)[v17 copy];

        uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
        long long v20 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        long long v21 = (void *)[v19 mutableCopy];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v22 = v18;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v61 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v50;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v50 != v25) {
                objc_enumerationMutation(v22);
              }
              id v27 = *(void **)(*((void *)&v49 + 1) + 8 * k);
              id v28 = [v27 objectId];

              if (v28) {
                id v29 = v21;
              }
              else {
                id v29 = v20;
              }
              [v29 addObject:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v61 count:16];
          }
          while (v24);
        }

        BOOL v30 = (id *)v43;
        long long v31 = [*(id *)(v43 + 40) converterFromClass];
        long long v32 = [v31 objectForKeyedSubscript:v16];

        long long v33 = [v32 insertRecords:v20 inManagedObjectContext:*(void *)(v43 + 48)];
        uint64_t v34 = [v20 count];
        uint64_t v35 = [v33 count];
        long long v36 = [v32 updateRecords:v21 inManagedObjectContext:*(void *)(v43 + 48)];

        uint64_t v37 = [v21 count];
        uint64_t v14 = v34 + v45 - v35 + v37 - [v36 count];

        v2 = v42;
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v44);
  }
  else
  {
    BOOL v30 = (id *)v43;
  }

  [v30[6] save:0];
  if (v30[7])
  {
    BOOL v38 = v14 == 0;
    long long v39 = [v30[5] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___DPStorage_updateRecords_withCompletion___block_invoke_2;
    block[3] = &unk_1E6C443E0;
    id v47 = v30[7];
    BOOL v48 = v38;
    dispatch_async(v39, block);
  }
}

uint64_t __43___DPStorage_updateRecords_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __43___DPStorage_deleteRecords_withCompletion___block_invoke(id *a1)
{
  v2 = [a1[4] valueForKey:@"objectId"];
  id v3 = (void *)[v2 copy];

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithObjectIDs:v3];
  [v4 setResultType:2];
  uint64_t v5 = [a1[5] executeRequest:v4 error:0];
  uint64_t v6 = [v5 result];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [v3 count];
  [a1[5] reset];
  if (a1[7])
  {
    BOOL v9 = v7 == v8;
    unint64_t v10 = [a1[6] queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43___DPStorage_deleteRecords_withCompletion___block_invoke_2;
    v11[3] = &unk_1E6C443E0;
    id v12 = a1[7];
    BOOL v13 = v9;
    dispatch_async(v10, v11);
  }
}

uint64_t __43___DPStorage_deleteRecords_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke(uint64_t a1)
{
  v2 = +[_DPRecordQueryPredicates predicateForKey:*(void *)(a1 + 32)];
  id v3 = [(id)objc_opt_class() createFetchRequestFor:*(void *)(a1 + 48) entityName:*(void *)(a1 + 56) predicate:v2 fetchLimit:0 fetchOffset:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v3];
  [v4 setResultType:0];
  uint64_t v5 = [*(id *)(a1 + 48) executeRequest:v4 error:0];
  uint64_t v6 = [v5 result];
  char v7 = [v6 BOOLValue];

  [*(id *)(a1 + 48) reset];
  if (*(void *)(a1 + 64))
  {
    uint64_t v8 = [*(id *)(a1 + 40) queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke_2;
    v9[3] = &unk_1E6C443E0;
    id v10 = *(id *)(a1 + 64);
    char v11 = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __51___DPStorage_deleteAllRecordsByKey_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __19___DPStorage_flush__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) save:0];
}

void __54___DPStorage_scheduleStorageCullingWithName_database___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  uint64_t v5 = (void *)MEMORY[0x1E019F810]();
  uint64_t v6 = [*(id *)(a1 + 32) coredataStorage];
  uint64_t v7 = [v6 deleteVersionMismatchRecords:*(void *)(a1 + 48) entities:*(void *)(a1 + 40) limit:*(void *)(a1 + 56)];
  uint64_t v8 = +[_DPLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1DC55E000, v8, OS_LOG_TYPE_INFO, "Deleted %ld records with report version mismatch", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = [v6 deleteSubmittedRecords:*(void *)(a1 + 48) entities:*(void *)(a1 + 40) limit:*(void *)(a1 + 56)];
  id v10 = +[_DPLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    uint64_t v12 = v9;
    _os_log_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_INFO, "Deleted %ld submitted records", (uint8_t *)&v11, 0xCu);
  }
}

void __51___DPStorage_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)os_transaction_create();
  uint64_t v5 = (void *)MEMORY[0x1E019F810]();
  uint64_t v6 = [*(id *)(a1 + 32) coredataStorage];
  uint64_t v7 = [v6 deleteOldObjectsToLimitTotalNumber:*(void *)(a1 + 48) entities:*(void *)(a1 + 40) limit:*(void *)(a1 + 56)];
  uint64_t v8 = +[_DPLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1DC55E000, v8, OS_LOG_TYPE_INFO, "Deleted %ld records to enforce total size limit on the database", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*(double *)(a1 + 64)];
  uint64_t v10 = [v6 deleteObjectsOlderThanDate:v9 entities:*(void *)(a1 + 40) limit:*(void *)(a1 + 56)];
  int v11 = +[_DPLog framework];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    uint64_t v13 = v10;
    _os_log_impl(&dword_1DC55E000, v11, OS_LOG_TYPE_INFO, "Deleted %ld old records", (uint8_t *)&v12, 0xCu);
  }
}

@end
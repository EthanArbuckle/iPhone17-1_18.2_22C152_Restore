@interface CADEventPredicate
@end

@implementation CADEventPredicate

void __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectID];
  v5 = [v3 uniqueID];
  if (v5)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    v10 = [v6 objectForKeyedSubscript:v5];
    if (!v10)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v10 forKeyedSubscript:v5];
    }
    [v10 addObject:v3];
  }
  else
  {
    v11 = logHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_cold_1((uint64_t)v4, v11);
    }
  }
}

uint64_t __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 objectID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4)
  {
    uint64_t v6 = 1;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v7 = [v3 uniqueID];
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v7];
    v28 = [v3 calendar];
    v9 = [v28 externalID];
    if (v8)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = v8;
      uint64_t v6 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v6)
      {
        v23 = v8;
        v24 = v7;
        id v25 = v3;
        v26 = v9;
        uint64_t v11 = *(void *)v30;
        id v27 = v10;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v10);
            }
            v13 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "calendar", v23);
            v14 = [v13 externalID];
            if ([v9 isEqualToString:v14])
            {
              v15 = [v28 source];
              v16 = [v15 externalID];
              v17 = [v13 source];
              [v17 externalID];
              uint64_t v18 = v6;
              v20 = uint64_t v19 = v11;
              char v21 = [v16 isEqual:v20];

              uint64_t v11 = v19;
              uint64_t v6 = v18;

              v9 = v26;
              id v10 = v27;

              if (v21)
              {
                uint64_t v6 = 1;
                uint64_t v8 = v27;
                id v7 = v24;
                id v3 = v25;
                goto LABEL_19;
              }
            }
            else
            {
            }
          }
          uint64_t v6 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v6);
        id v7 = v24;
        id v3 = v25;
        uint64_t v8 = v23;
      }
LABEL_19:
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "A pending integration event has no uniqueID (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end
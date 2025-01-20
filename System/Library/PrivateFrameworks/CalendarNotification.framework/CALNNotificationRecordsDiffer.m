@interface CALNNotificationRecordsDiffer
+ (id)diffOldRecords:(id)a3 withNewRecords:(id)a4 filteredBySourceClientIDs:(id)a5;
@end

@implementation CALNNotificationRecordsDiffer

+ (id)diffOldRecords:(id)a3 withNewRecords:(id)a4 filteredBySourceClientIDs:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v42 = a5;
  v45 = objc_opt_new();
  v44 = objc_opt_new();
  v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v16 = [CALNNotificationIdentifier alloc];
        v17 = [v15 sourceIdentifier];
        v18 = [v15 sourceClientIdentifier];
        v19 = [(CALNNotificationIdentifier *)v16 initWithSourceIdentifier:v17 sourceClientIdentifier:v18];

        [v9 setObject:v15 forKeyedSubscript:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v12);
  }
  v41 = v10;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v8;
  uint64_t v20 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v49 + 1) + 8 * v23);
        v25 = [CALNNotificationIdentifier alloc];
        v26 = [v24 sourceIdentifier];
        v27 = [v24 sourceClientIdentifier];
        v28 = [(CALNNotificationIdentifier *)v25 initWithSourceIdentifier:v26 sourceClientIdentifier:v27];

        v29 = [v9 objectForKeyedSubscript:v28];
        v30 = v45;
        if (!v29) {
          goto LABEL_20;
        }
        [v9 removeObjectForKey:v28];
        v31 = [v29 content];
        v32 = [v24 content];
        v33 = v32;
        if (v31) {
          BOOL v34 = v32 == 0;
        }
        else {
          BOOL v34 = 1;
        }
        if (v34)
        {

          v30 = v44;
          if (v31 == v33) {
            goto LABEL_21;
          }
LABEL_20:
          [v30 addObject:v24];
          goto LABEL_21;
        }
        char v35 = [v31 isEqualForDiffingPurposesToContent:v32];

        v30 = v44;
        if ((v35 & 1) == 0) {
          goto LABEL_20;
        }
LABEL_21:

        ++v23;
      }
      while (v21 != v23);
      uint64_t v36 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      uint64_t v21 = v36;
    }
    while (v36);
  }

  if (v42)
  {
    v37 = (void *)[v9 copy];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __89__CALNNotificationRecordsDiffer_diffOldRecords_withNewRecords_filteredBySourceClientIDs___block_invoke;
    v46[3] = &unk_2645C0C60;
    id v47 = v42;
    id v48 = v9;
    [v37 enumerateKeysAndObjectsUsingBlock:v46];
  }
  v38 = [v9 allValues];
  v39 = +[CALNNotificationRecordsDiff diffWithAddedRecords:v45 removedRecords:v38 modifiedRecords:v44];

  return v39;
}

void __89__CALNNotificationRecordsDiffer_diffOldRecords_withNewRecords_filteredBySourceClientIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = +[CALNNotificationFilterUtils filterIdentifierForNotificationRecord:a3];
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0) {
    [*(id *)(a1 + 40) removeObjectForKey:v6];
  }
}

@end
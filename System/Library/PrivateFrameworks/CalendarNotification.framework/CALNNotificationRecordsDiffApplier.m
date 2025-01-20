@interface CALNNotificationRecordsDiffApplier
+ (void)applyDiff:(id)a3 toNotificationManager:(id)a4;
+ (void)refreshNotificationManager:(id)a3 withNotificationRecords:(id)a4 forSourceWithIdentifier:(id)a5 filteredBySourceClientIDs:(id)a6;
@end

@implementation CALNNotificationRecordsDiffApplier

+ (void)applyDiff:(id)a3 toNotificationManager:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSNumber;
    v9 = [v5 removedRecords];
    v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v11 = NSNumber;
    v12 = [v5 modifiedRecords];
    v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v14 = NSNumber;
    v15 = [v5 addedRecords];
    v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    *(_DWORD *)buf = 138412802;
    v51 = v10;
    __int16 v52 = 2112;
    v53 = v13;
    __int16 v54 = 2112;
    v55 = v16;
    _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "Applying diff to notification manager. Removed: %@, Modified: %@, Added: %@", buf, 0x20u);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v17 = [v5 removedRecords];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v23 = [v22 sourceIdentifier];
        v24 = [v22 sourceClientIdentifier];
        [v6 removeRecordWithSourceIdentifier:v23 sourceClientIdentifier:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v19);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v25 = [v5 modifiedRecords];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        [v6 updateRecord:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v27);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v30 = objc_msgSend(v5, "addedRecords", 0);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        [v6 addRecord:*(void *)(*((void *)&v35 + 1) + 8 * k)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v32);
  }
}

+ (void)refreshNotificationManager:(id)a3 withNotificationRecords:(id)a4 forSourceWithIdentifier:(id)a5 filteredBySourceClientIDs:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [v12 fetchRecordsWithSourceIdentifier:a5];
  v13 = +[CALNNotificationRecordsDiffer diffOldRecords:v14 withNewRecords:v11 filteredBySourceClientIDs:v10];

  [a1 applyDiff:v13 toNotificationManager:v12];
}

@end
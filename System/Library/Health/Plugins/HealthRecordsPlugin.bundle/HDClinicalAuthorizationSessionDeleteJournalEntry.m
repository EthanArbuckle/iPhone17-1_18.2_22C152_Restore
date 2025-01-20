@interface HDClinicalAuthorizationSessionDeleteJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
@end

@implementation HDClinicalAuthorizationSessionDeleteJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138543874;
    long long v20 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "state", v20);
        id v21 = 0;
        unsigned __int8 v14 = +[HDClinicalAuthorizationSessionEntity deleteSessionWithState:v13 profile:v6 error:&v21];
        id v15 = v21;

        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          v16 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            v17 = v16;
            uint64_t v18 = objc_opt_class();
            v19 = [v12 state];
            *(_DWORD *)buf = v20;
            uint64_t v27 = v18;
            __int16 v28 = 2114;
            v29 = v19;
            __int16 v30 = 2114;
            id v31 = v15;
            _os_log_fault_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}@> Failed to perform journaled session deletion: %{public}@", buf, 0x20u);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
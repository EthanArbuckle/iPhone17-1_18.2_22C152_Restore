@interface HDClinicalAccountCreateCredentialJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
@end

@implementation HDClinicalAccountCreateCredentialJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  id v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = [v10 authResponse];
        v12 = [v10 accountIdentifier];
        v13 = [v10 requestedScope];
        v14 = [v6 database];
        v15 = [v10 event];
        id v22 = 0;
        unsigned __int8 v16 = +[HDClinicalAccountEntity createAccountCredentialFromAuthResponse:v11 accountIdentifier:v12 requestedScope:v13 profile:v6 healthDatabase:v14 event:v15 createdCredential:0 error:&v22];
        id v17 = v22;

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v28 = a1;
            __int16 v29 = 2114;
            id v30 = v17;
            _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert journaled clinical account credential update: %{public}@", buf, 0x16u);
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
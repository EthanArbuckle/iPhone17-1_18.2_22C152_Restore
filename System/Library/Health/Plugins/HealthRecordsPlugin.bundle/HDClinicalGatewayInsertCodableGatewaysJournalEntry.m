@interface HDClinicalGatewayInsertCodableGatewaysJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
@end

@implementation HDClinicalGatewayInsertCodableGatewaysJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138543618;
    long long v18 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "codableResources", v18);
        id v14 = [v12 syncProvenance];
        id v20 = 0;
        unsigned __int8 v15 = +[HDClinicalGatewayEntity _insertCodableGateways:v13 syncProvenance:v14 profile:v6 error:&v20];
        id v16 = v20;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            id v26 = a1;
            __int16 v27 = 2114;
            id v28 = v16;
            _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert journaled clinical gateways: %{public}@", buf, 0x16u);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
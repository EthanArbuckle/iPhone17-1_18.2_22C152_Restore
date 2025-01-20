@interface HDClinicalGatewayUpdateCodableGatewaysJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
@end

@implementation HDClinicalGatewayUpdateCodableGatewaysJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138543362;
    long long v19 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "codableResources", v19);
        id v14 = [v12 syncProvenance];
        id v21 = 0;
        unsigned __int8 v15 = +[HDClinicalGatewayEntity _updateCodableGateways:v13 syncProvenance:v14 profile:v6 error:&v21];
        id v16 = v21;

        if ((v15 & 1) == 0)
        {
          unsigned int v17 = objc_msgSend(v16, "hk_isDatabaseAccessibilityError");
          _HKInitializeLogging();
          v18 = HKLogHealthRecords;
          if (v17)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v27 = a1;
              __int16 v28 = 2114;
              id v29 = v16;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed to update journaled clinical gateways: %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v19;
            id v27 = v16;
            _os_log_fault_impl(&dword_0, v18, OS_LOG_TYPE_FAULT, "HDClinicalGatewayUpdateCodableGatewaysJournalEntry failed to update journaled clinical gateways: %{public}@", buf, 0xCu);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface NSManagedObjectContext
@end

@implementation NSManagedObjectContext

void __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@- INS %@", (uint8_t *)&v8, 0x16u);
  }
}

void __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isInserted] & 1) == 0 && (objc_msgSend(v3, "isDeleted") & 1) == 0)
  {
    v4 = [v3 changedValues];
    id v5 = [v4 allKeys];
    v6 = [v5 sortedArrayUsingSelector:sel_compare_];

    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = HMFGetLogIdentifier();
      id v11 = [v6 componentsJoinedByString:@", "];
      int v12 = 138543874;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@- UPD %@: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

void __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 entity];
  v6 = [v5 relationshipsByName];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_2;
  v16[3] = &unk_264A23338;
  id v7 = v4;
  id v17 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];

  uint64_t v8 = [v7 count];
  v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  id v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      v13 = HMFGetLogIdentifier();
      __int16 v14 = [v7 sortedArrayUsingSelector:sel_compare_];
      id v15 = [v14 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v3;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@- DEL %@ (cascades along %{public}@))", buf, 0x20u);

LABEL_6:
    }
  }
  else if (v12)
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v13;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@- DEL %@", buf, 0x16u);
    goto LABEL_6;
  }
}

void __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 deleteRule] == 2) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

@end
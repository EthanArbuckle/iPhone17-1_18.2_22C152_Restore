@interface NSManagedObjectContext(HomeKitDaemon)
- (id)hmd_fetchExistingObjectWithID:()HomeKitDaemon propertiesToFetch:;
- (id)hmd_fetchExistingObjectWithID:()HomeKitDaemon propertiesToFetch:error:;
- (id)hmd_homeUUID;
- (uint64_t)hmd_saveWithTransactionAuthor:()HomeKitDaemon clientIdentifier:allowQoSEscalation:error:;
- (uint64_t)hmd_saveWithTransactionAuthor:()HomeKitDaemon error:;
- (uint64_t)hmd_transactionAuthor;
- (void)hmd_logPendingChangesWithReason:()HomeKitDaemon;
@end

@implementation NSManagedObjectContext(HomeKitDaemon)

- (void)hmd_logPendingChangesWithReason:()HomeKitDaemon
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = v5;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [a1 transactionAuthor];
    *(_DWORD *)buf = 138544130;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = a1;
    __int16 v28 = 2114;
    v29 = v11;
    __int16 v30 = 2114;
    id v31 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@%{public}@ (%{public}@) - %{public}@", buf, 0x2Au);
  }
  v12 = [a1 insertedObjects];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke;
  v22[3] = &unk_264A23310;
  id v13 = v8;
  id v23 = v13;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);

  v14 = [a1 updatedObjects];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_30;
  v20[3] = &unk_264A23310;
  id v15 = v13;
  id v21 = v15;
  objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  v16 = [a1 deletedObjects];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__NSManagedObjectContext_HomeKitDaemon__hmd_logPendingChangesWithReason___block_invoke_34;
  v18[3] = &unk_264A23310;
  id v17 = v15;
  id v19 = v17;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
}

- (id)hmd_fetchExistingObjectWithID:()HomeKitDaemon propertiesToFetch:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  id v8 = objc_msgSend(a1, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v6, v7, &v15);
  id v9 = v15;
  if (v9)
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch %@: %@", buf, 0x20u);
    }
  }

  return v8;
}

- (id)hmd_fetchExistingObjectWithID:()HomeKitDaemon propertiesToFetch:error:
{
  id v8 = (objc_class *)MEMORY[0x263EFF260];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  v12 = [v10 entity];
  id v13 = [v12 name];
  v14 = (void *)[v11 initWithEntityName:v13];

  id v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"self == %@", v10];

  [v14 setPredicate:v15];
  [v14 setPropertiesToFetch:v9];

  v16 = [a1 executeFetchRequest:v14 error:a5];
  id v17 = v16;
  if (v16)
  {
    __int16 v18 = [v16 firstObject];
  }
  else
  {
    __int16 v18 = 0;
  }

  return v18;
}

- (uint64_t)hmd_saveWithTransactionAuthor:()HomeKitDaemon clientIdentifier:allowQoSEscalation:error:
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = v10;
  if (a5)
  {
    id v12 = v10;
    if (v12)
    {
      id v13 = v12;
      v14 = a6;
      id v15 = [NSString stringWithFormat:@"%@.%@", @"com.apple", *MEMORY[0x263F0C748]];
      if ([v13 isEqualToString:v15])
      {
LABEL_8:

LABEL_9:
        id v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = a1;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          __int16 v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v51 = v20;
          __int16 v52 = 2112;
          id v53 = v13;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Bumping sync QoS because changes were performed on behalf of owner from client: %@", buf, 0x16u);
        }
        id v21 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:a3 clientIdentifier:v13 qualityOfService:25];
        goto LABEL_21;
      }
      v16 = [NSString stringWithFormat:@"%@.%@", @"com.apple", *MEMORY[0x263F0D4A0]];
      if ([v13 isEqualToString:v16])
      {
LABEL_7:

        goto LABEL_8;
      }
      v47 = [NSString stringWithFormat:@"%@.%@", @"com.apple", *MEMORY[0x263F0DB30]];
      if (objc_msgSend(v13, "isEqualToString:"))
      {
LABEL_6:

        goto LABEL_7;
      }
      if (isInternalBuild())
      {
        uint64_t v45 = *MEMORY[0x263F0C740];
        if (objc_msgSend(v13, "isEqualToString:")) {
          goto LABEL_6;
        }
        v46 = [NSString stringWithFormat:@"%@.%@", @"com.apple", v45];
        if ((objc_msgSend(v13, "isEqualToString:") & 1) != 0
          || (uint64_t v44 = *MEMORY[0x263F0DB38], (objc_msgSend(v13, "isEqualToString:") & 1) != 0))
        {

          goto LABEL_6;
        }
        v42 = [NSString stringWithFormat:@"%@.%@", @"com.apple", v44];
        char v43 = [v13 isEqualToString:v42];

        a6 = v14;
        if (v43) {
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
  }
  uint64_t v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = a1;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = HMFGetLogIdentifier();
    __int16 v26 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v51 = v25;
    __int16 v52 = 2112;
    id v53 = v26;
    __int16 v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Not escalating QoS due to allowQoSEscalation=%@, clientIdentifier=%@", buf, 0x20u);
  }
  id v21 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:a3 clientIdentifier:v11];
LABEL_21:
  v27 = v21;
  uint64_t v28 = [v21 string];
  if (!a3 || (v29 = (void *)v28) == 0) {
    _HMFPreconditionFailure();
  }
  __int16 v30 = [a1 transactionAuthor];
  [a1 setTransactionAuthor:v29];
  id v49 = 0;
  uint64_t v31 = [a1 save:&v49];
  id v32 = v49;
  [a1 setTransactionAuthor:v30];
  if ((v31 & 1) == 0)
  {
    if (a3 != 2)
    {
      v33 = [[HMDLogEventCoreDataSignificantEvent alloc] initWithReason:2 author:a3];
      v34 = [v32 description];
      [(HMDLogEventCoreDataSignificantEvent *)v33 setExtraContext:v34];

      v35 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v35 submitLogEvent:v33];
    }
    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = objc_opt_class();
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = v11;
      v40 = v39 = a6;
      *(_DWORD *)buf = 138543618;
      v51 = v40;
      __int16 v52 = 2112;
      id v53 = v32;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to save changes: %@", buf, 0x16u);

      a6 = v39;
      id v11 = v48;
    }

    if (a6)
    {
      HMDSanitizeCoreDataError(v32);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v31;
}

- (uint64_t)hmd_saveWithTransactionAuthor:()HomeKitDaemon error:
{
  return objc_msgSend(a1, "hmd_saveWithTransactionAuthor:clientIdentifier:allowQoSEscalation:error:", a3, 0, 0, a4);
}

- (uint64_t)hmd_transactionAuthor
{
  v1 = [a1 transactionAuthor];
  v2 = +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:v1];

  uint64_t v3 = [v2 type];
  return v3;
}

- (id)hmd_homeUUID
{
  v1 = [a1 name];
  v2 = HMDHomeUUIDFromWorkingContextName(v1);

  return v2;
}

@end
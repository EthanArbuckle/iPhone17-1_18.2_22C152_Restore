@interface HDAuthorizationStatus
+ (BOOL)isAuthorizedForObjectType:(id)a3 authorizationStatus:(id)a4 clientEntitlements:(id)a5 sharing:(BOOL)a6 error:(id *)a7;
+ (id)authorizationStatusForTypes:(id)a3 bundleIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
@end

@implementation HDAuthorizationStatus

+ (id)authorizationStatusForTypes:(id)a3 bundleIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v35 = v9;
  if (!v10)
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    v29 = @"Missing application-identifier entitlement.";
    v30 = a6;
    uint64_t v31 = 4;
LABEL_20:
    objc_msgSend(v28, "hk_assignError:code:description:", v30, v31, v29);
    v16 = 0;
    goto LABEL_23;
  }
  if (![v9 count])
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    v29 = @"The types argument may not be empty";
    v30 = a6;
    uint64_t v31 = 3;
    goto LABEL_20;
  }
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__178;
  v49 = __Block_byref_object_dispose__178;
  id v50 = 0;
  v12 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  [(HDMutableDatabaseTransactionContext *)v12 setHighPriority:1];
  v13 = [v11 database];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __84__HDAuthorizationStatus_authorizationStatusForTypes_bundleIdentifier_profile_error___block_invoke;
  v40[3] = &unk_1E62FD3D8;
  v44 = &v45;
  id v41 = v10;
  id v14 = v9;
  id v42 = v14;
  id v43 = v11;
  BOOL v15 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v13 context:v12 error:a6 block:v40];
  id v34 = v11;

  if (!v15)
  {
    v16 = 0;
    goto LABEL_22;
  }
  v16 = (void *)[(id)v46[5] mutableCopy];
  v17 = [MEMORY[0x1E4F2B2C0] _typesIncludingParentTypes:v14];
  uint64_t v18 = [v16 count];
  if (v18 == [v17 count]) {
    goto LABEL_17;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v51 count:16];
  v33 = v17;
  if (!v20) {
    goto LABEL_16;
  }
  uint64_t v21 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v37 != v21) {
        objc_enumerationMutation(v19);
      }
      v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      objc_msgSend(v23, "code", v33);
      char v24 = HKDataTypeRequiresAuthorization();
      v25 = &unk_1F17EEF10;
      if (v24)
      {
        v26 = [(id)v46[5] objectForKeyedSubscript:v23];
        BOOL v27 = v26 == 0;

        if (!v27) {
          continue;
        }
        v25 = &unk_1F17EEEF8;
      }
      [v16 setObject:v25 forKeyedSubscript:v23];
    }
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v51 count:16];
  }
  while (v20);
LABEL_16:

  v17 = v33;
LABEL_17:

LABEL_22:
  _Block_object_dispose(&v45, 8);

  id v11 = v34;
LABEL_23:

  return v16;
}

BOOL __84__HDAuthorizationStatus_authorizationStatusForTypes_bundleIdentifier_profile_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[HDAuthorizationEntity authorizationStatusesForBundleIdentifier:a1[4] types:a1[5] profile:a1[6] error:a3];
  uint64_t v5 = *(void *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (!v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[5];
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_INFO, "Could not determine authorization status for types %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v7 != 0;
}

+ (BOOL)isAuthorizedForObjectType:(id)a3 authorizationStatus:(id)a4 clientEntitlements:(id)a5 sharing:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"HDAuthorizationStatus.m", 95, @"Invalid parameter not satisfying: %@", @"authorizationStatus != nil" object file lineNumber description];
  }
  uint64_t v15 = [v13 integerValue];
  char v16 = HKAuthorizationStatusAllowsSharing();
  char v17 = HKAuthorizationStatusAllowsReading();
  uint64_t v18 = *MEMORY[0x1E4F2A958];
  v28 = v12;
  id v19 = [v12 identifier];
  int v20 = [v14 arrayEntitlement:v18 containsString:v19];

  if ((unint64_t)(v15 - 101) < 4)
  {
    if (v7) {
      char v21 = v16;
    }
    else {
      char v21 = v17;
    }
    if (v21) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  if (v15 != 100)
  {
    char v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HDAuthorizationStatus.m", 117, @"Unexpected authorization status %@", v13 object file lineNumber description];

LABEL_14:
    v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Not authorized");
    goto LABEL_15;
  }
  if (v7 || v20 != 1)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 5, @"Authorization is not determined");
LABEL_15:
    BOOL v22 = 0;
    *a7 = v23;
    goto LABEL_16;
  }
LABEL_8:
  BOOL v22 = 1;
LABEL_16:

  return v22;
}

@end
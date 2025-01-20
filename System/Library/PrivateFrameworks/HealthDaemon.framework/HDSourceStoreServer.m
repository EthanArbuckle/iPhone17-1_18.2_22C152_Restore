@interface HDSourceStoreServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_IsAllowedToAccessQASPI:(void *)a1;
- (void)remote_deleteSourceWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchAllSourcesWithCompletion:(id)a3;
- (void)remote_fetchHasSampleWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)remote_fetchOrderedSourcesForObjectType:(id)a3 completion:(id)a4;
- (void)remote_qaSourceForBundleIdentifier:(id)a3 name:(id)a4 completion:(id)a5;
- (void)remote_sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 completion:(id)a7;
- (void)remote_updateOrderedSources:(id)a3 forObjectType:(id)a4 completion:(id)a5;
@end

@implementation HDSourceStoreServer

- (void)remote_fetchAllSourcesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__50;
  v14 = __Block_byref_object_dispose__50;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HDSourceStoreServer_remote_fetchAllSourcesWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __60__HDSourceStoreServer_remote_fetchAllSourcesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) profile];
  v5 = [v4 sourceManager];
  uint64_t v6 = [v5 allSourcesWithError:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_fetchHasSampleWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, id))a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HDSourceStoreServer_remote_fetchHasSampleWithBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E62FA2E8;
  id v15 = v17;
  id v16 = 0;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  uint64_t v11 = [v9 performHighPriorityTransactionsWithError:&v16 block:v13];
  id v12 = v16;

  v7[2](v7, v11, v12);
  _Block_object_dispose(v17, 8);
}

BOOL __76__HDSourceStoreServer_remote_fetchHasSampleWithBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) profile];
  v5 = [v4 dataManager];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 hasSampleWithBundleIdentifier:*(void *)(a1 + 40) error:a2];

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1;
}

- (void)remote_deleteSourceWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    v8 = (void (**)(id, uint64_t, id))a4;
    id v9 = [(HDStandardTaskServer *)self profile];
    id v10 = [v9 sourceManager];
    id v25 = 0;
    uint64_t v11 = [v10 deleteSourceWithBundleIdentifier:v7 error:&v25];
    id v12 = v25;

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E4F29F18];
    id v14 = *MEMORY[0x1E4F29F18];
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v13;
        id v16 = [(HDStandardTaskServer *)self client];
        v17 = [v16 process];
        v18 = [v17 name];
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        __int16 v28 = 2114;
        id v29 = v7;
        _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" deleted source %{public}@", buf, 0x16u);
      }
      v19 = [(HDStandardTaskServer *)self profile];
      +[HDCloudSyncStore samplesDeletedInProfile:v19 byUser:1 intervals:0];
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      v22 = v13;
      v19 = [(HDStandardTaskServer *)self client];
      v23 = [v19 process];
      v24 = [v23 name];
      *(_DWORD *)buf = 138543874;
      v27 = v24;
      __int16 v28 = 2114;
      id v29 = v7;
      __int16 v30 = 2114;
      id v31 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" failed to deleted source %{public}@: %{public}@", buf, 0x20u);
    }
LABEL_9:
    v8[2](v8, v11, v12);

    goto LABEL_10;
  }
  v20 = (void *)MEMORY[0x1E4F28C58];
  id v21 = a4;
  objc_msgSend(v20, "hk_errorForNilArgument:class:selector:", @"bundleIdentifier", objc_opt_class(), a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v21, 0, v12);

LABEL_10:
}

- (void)remote_fetchOrderedSourcesForObjectType:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 sourceOrderManager];
  id v12 = 0;
  id v10 = [v9 orderedSourcesForObjectType:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (void)remote_updateOrderedSources:(id)a3 forObjectType:(id)a4 completion:(id)a5
{
  v8 = (void (**)(id, uint64_t, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HDStandardTaskServer *)self profile];
  id v12 = [v11 sourceOrderManager];
  id v15 = 0;
  uint64_t v13 = [v12 updateOrderedSources:v10 forObjectType:v9 error:&v15];

  id v14 = v15;
  v8[2](v8, v13, v14);
}

- (uint64_t)_IsAllowedToAccessQASPI:(void *)a1
{
  if (a1)
  {
    v4 = [a1 client];
    v5 = [v4 process];
    id v6 = [v5 bundleIdentifier];
    if ([v6 isEqual:@"com.apple.HealthKitTests"])
    {
LABEL_7:

LABEL_8:
      uint64_t v13 = [a1 client];
      uint64_t v14 = [v13 hasRequiredEntitlement:*MEMORY[0x1E4F2AA08] error:a2];

      return v14;
    }
    id v7 = [a1 client];
    v8 = [v7 process];
    id v9 = [v8 bundleIdentifier];
    if ([v9 isEqual:@"com.apple.HKTester"])
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v20 = a2;
    id v10 = [a1 client];
    id v11 = [v10 process];
    id v12 = [v11 bundleIdentifier];
    if ([v12 hasPrefix:@"com.apple.internal.HealthUIAKit."])
    {

      a2 = v20;
      goto LABEL_6;
    }
    v17 = [a1 client];
    [v17 sourceBundleIdentifier];
    id v16 = v18 = v10;
    char v19 = [v16 hasPrefix:@"com.apple.internal.HealthUIAKit."];

    a2 = v20;
    if (v19) {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v20, 4, @"Client unauthorized; only specific bundle identifiers are allowed to call this method");
  }
  return 0;
}

- (void)remote_sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void *, id))a7;
  id v29 = 0;
  int v17 = -[HDSourceStoreServer _IsAllowedToAccessQASPI:](self, (uint64_t)&v29);
  id v18 = v29;
  if (v17)
  {
    char v19 = [(HDStandardTaskServer *)self profile];
    uint64_t v20 = [v19 sourceManager];
    id v28 = v18;
    id v26 = v12;
    id v21 = [v20 sourceForAppleDeviceWithUUID:v12 identifier:v13 name:v14 productType:v15 createIfNecessary:1 error:&v28];
    id v22 = v28;

    if (v21)
    {
      v23 = [(HDStandardTaskServer *)self profile];
      id v27 = v22;
      v24 = [v21 sourceWithProfile:v23 error:&v27];
      id v25 = v27;

      id v22 = v25;
    }
    else
    {
      v24 = 0;
    }

    id v18 = v22;
    id v12 = v26;
  }
  else
  {
    v24 = 0;
  }
  v16[2](v16, v24, v18);
}

- (void)remote_qaSourceForBundleIdentifier:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  id v23 = 0;
  int v11 = -[HDSourceStoreServer _IsAllowedToAccessQASPI:](self, (uint64_t)&v23);
  id v12 = v23;
  if (v11)
  {
    id v13 = [(HDStandardTaskServer *)self profile];
    id v14 = [v13 sourceManager];
    id v15 = [MEMORY[0x1E4F2B8D8] entitlementsWithDictionary:MEMORY[0x1E4F1CC08]];
    id v22 = v12;
    id v16 = [v14 sourceForApplicationIdentifier:v8 createOrUpdateIfNecessary:1 entitlements:v15 name:v9 error:&v22];
    id v17 = v22;

    if (v16)
    {
      id v18 = [(HDStandardTaskServer *)self profile];
      id v21 = v17;
      char v19 = [v16 sourceWithProfile:v18 error:&v21];
      id v20 = v21;

      id v17 = v20;
    }
    else
    {
      char v19 = 0;
    }

    id v12 = v17;
  }
  else
  {
    char v19 = 0;
  }
  v10[2](v10, v19, v12);
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7F78](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7F70](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B580] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end
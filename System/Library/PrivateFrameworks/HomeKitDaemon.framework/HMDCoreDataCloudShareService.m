@interface HMDCoreDataCloudShareService
+ (id)logCategory;
- (HMDCoreDataCloudShareService)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6;
- (HMDManagedObjectContext)managedObjectContext;
- (NSPersistentCloudKitContainer)container;
- (NSPersistentStore)privateStore;
- (NSPersistentStore)sharedStore;
- (id)_acceptShareInvitation:(id)a3;
- (id)_addParticipant:(id)a3 share:(id)a4;
- (id)_auditUsersForRevokedAccessWithAccountHandles:(id)a3 share:(id)a4;
- (id)_fetchParticipantForAccountHandle:(id)a3;
- (id)_fetchParticipantsForAccountHandles:(id)a3;
- (id)_fetchShareMetadataForInvitation:(id)a3;
- (id)_grantAccessForUserWithAccountHandle:(id)a3 share:(id)a4 logEventBuilder:(id)a5;
- (id)_pushUpdatedShare:(id)a3;
- (id)_removeParticipant:(id)a3 share:(id)a4;
- (id)_revokeAccessForUserWithAccountHandle:(id)a3 share:(id)a4;
- (id)acceptShareInvitation:(id)a3;
- (id)acceptShareInvitationsFromMetadata:(id)a3 intoPersistentStore:(id)a4;
- (id)auditUsersForRevokedAccessWithAccountHandles:(id)a3 share:(id)a4;
- (id)ckContainer;
- (id)fetchShareWithRecordID:(id)a3;
- (id)grantAccessForUserWithAccountHandle:(id)a3 share:(id)a4 logEventBuilder:(id)a5;
- (id)revokeAccessForUserWithAccountHandle:(id)a3 share:(id)a4;
- (void)_acceptShareInvitationsFromMetadata:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5;
- (void)_fetchShareMetadataForInvitation:(id)a3 completion:(id)a4;
- (void)_fetchShareWithRecordID:(id)a3 completion:(id)a4;
- (void)_pushUpdatedShare:(id)a3 completion:(id)a4;
@end

@implementation HMDCoreDataCloudShareService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_privateStore, 0);
  objc_storeStrong((id *)&self->_sharedStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_ckContainer, 0);
}

- (HMDManagedObjectContext)managedObjectContext
{
  return (HMDManagedObjectContext *)objc_getProperty(self, a2, 48, 1);
}

- (NSPersistentStore)privateStore
{
  return (NSPersistentStore *)objc_getProperty(self, a2, 40, 1);
}

- (NSPersistentStore)sharedStore
{
  return (NSPersistentStore *)objc_getProperty(self, a2, 32, 1);
}

- (NSPersistentCloudKitContainer)container
{
  return (NSPersistentCloudKitContainer *)objc_getProperty(self, a2, 24, 1);
}

- (id)_fetchShareMetadataForInvitation:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  v5 = [MEMORY[0x263F42538] futureWithPromise:&v13];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation___block_invoke;
  v8[3] = &unk_264A15D60;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v9 = v6;
  id v10 = v13;
  [(HMDCoreDataCloudShareService *)self _fetchShareMetadataForInvitation:v6 completion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __65__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  unint64_t v8 = (unint64_t)v6;
  id v9 = (void *)v8;
  if (!(v5 | v8))
  {
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  }
  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = WeakRetained;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      v14 = [a1[4] url];
      int v15 = 138544130;
      v16 = v13;
      __int16 v17 = 2160;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Fetching metadata for URL %{mask.hash}@ failed due to %{public}@", (uint8_t *)&v15, 0x2Au);
    }
    [a1[5] rejectWithError:v9];
  }
  else
  {
    [a1[5] fulfillWithValue:v5];
  }
}

- (void)_fetchShareMetadataForInvitation:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFD6E8]);
  id v9 = [v6 content];
  id v10 = [v9 allKeys];
  id v11 = [v6 content];
  v12 = (void *)[v8 initWithShareURLs:v10 invitationTokensByShareURL:v11];

  id v13 = [MEMORY[0x263EFF980] array];
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke;
  v30[3] = &unk_264A15D38;
  objc_copyWeak(&v32, &location);
  id v14 = v13;
  id v31 = v14;
  [v12 setPerShareMetadataBlock:v30];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_79;
  v25[3] = &unk_264A2B650;
  objc_copyWeak(&v29, &location);
  id v15 = v7;
  id v28 = v15;
  id v16 = v6;
  id v26 = v16;
  id v17 = v14;
  id v27 = v17;
  uint64_t v18 = (void *)MEMORY[0x230FBD990]([v12 setFetchShareMetadataCompletionBlock:v25]);
  __int16 v19 = self;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = [v16 url];
    uint64_t v23 = [v12 operationID];
    *(_DWORD *)buf = 138544130;
    id v35 = v21;
    __int16 v36 = 2160;
    uint64_t v37 = 1752392040;
    __int16 v38 = 2112;
    v39 = v22;
    __int16 v40 = 2112;
    v41 = v23;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching share metadata for invitation URL %{mask.hash}@ (operationID: %@)", buf, 0x2Au);
  }
  v24 = [(HMDCoreDataCloudShareService *)v19 ckContainer];
  [v24 addOperation:v12];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = WeakRetained;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138544130;
      id v16 = v14;
      __int16 v17 = 2160;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching metadata for URL %{mask.hash}@ failed due to %{public}@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

void __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_79(id *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(v3, "hmd_retryAfterCKError");
      unint64_t v5 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = WeakRetained;
      id v8 = HMFGetOSLogHandle();
      id v9 = v8;
      if (v5)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v10 = HMFGetLogIdentifier();
          id v11 = [a1[4] url];
          *(_DWORD *)buf = 138544386;
          id v27 = v10;
          __int16 v28 = 2160;
          uint64_t v29 = 1752392040;
          __int16 v30 = 2112;
          id v31 = v11;
          __int16 v32 = 2114;
          id v33 = v5;
          __int16 v34 = 2112;
          id v35 = v3;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Retrying fetching share metadata for URL %{mask.hash}@ in %{public}@s due to error: %@", buf, 0x34u);
        }
        [v5 doubleValue];
        dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_80;
        block[3] = &unk_264A2EE80;
        block[4] = v7;
        id v24 = a1[4];
        id v25 = a1[6];
        dispatch_after(v13, MEMORY[0x263EF83A0], block);

        goto LABEL_19;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        __int16 v21 = [a1[4] url];
        *(_DWORD *)buf = 138544130;
        id v27 = v20;
        __int16 v28 = 2160;
        uint64_t v29 = 1752392040;
        __int16 v30 = 2112;
        id v31 = v21;
        __int16 v32 = 2114;
        id v33 = v3;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch metadata for URL %{mask.hash}@ due to %{public}@", buf, 0x2Au);
      }
      id v22 = _Block_copy(a1[6]);
      __int16 v19 = v22;
      if (v22) {
        (*((void (**)(void *, void, id))v22 + 2))(v22, 0, v3);
      }
    }
    else
    {
      unint64_t v5 = (void (**)(void, void, void))_Block_copy(a1[6]);
      if (!v5)
      {
LABEL_19:

        goto LABEL_20;
      }
      __int16 v19 = [a1[5] firstObject];
      ((void (**)(void, void *, void))v5)[2](v5, v19, 0);
    }

    goto LABEL_19;
  }
  id v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v27 = v16;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Lost self fetching share metadata", buf, 0xCu);
  }
  __int16 v17 = _Block_copy(a1[6]);
  uint64_t v18 = v17;
  if (v17) {
    (*((void (**)(void *, void, id))v17 + 2))(v17, 0, v3);
  }

LABEL_20:
}

uint64_t __76__HMDCoreDataCloudShareService__fetchShareMetadataForInvitation_completion___block_invoke_80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchShareMetadataForInvitation:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)_pushUpdatedShare:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  unint64_t v5 = [MEMORY[0x263F42538] futureWithPromise:&v11];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HMDCoreDataCloudShareService__pushUpdatedShare___block_invoke;
  v7[3] = &unk_264A15CC0;
  objc_copyWeak(&v9, &location);
  id v8 = v11;
  [(HMDCoreDataCloudShareService *)self _pushUpdatedShare:v4 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

void __50__HMDCoreDataCloudShareService__pushUpdatedShare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      int v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching share failed with %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) rejectWithError:v6];
  }
  else
  {
    double v12 = *(void **)(a1 + 32);
    if (v5)
    {
      [v12 fulfillWithValue:v5];
    }
    else
    {
      dispatch_time_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v12 rejectWithError:v13];
    }
  }
}

- (void)_pushUpdatedShare:(id)a3 completion:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFD778]);
  [v8 setQualityOfService:17];
  id v9 = objc_alloc(MEMORY[0x263EFD748]);
  v38[0] = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  id v11 = (void *)[v9 initWithRecordsToSave:v10 recordIDsToDelete:0];

  [v11 setConfiguration:v8];
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke;
  v29[3] = &unk_264A15CE8;
  __int16 v21 = &v30;
  objc_copyWeak(&v30, &location);
  [v11 setPerRecordCompletionBlock:v29];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  id v24 = __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_74;
  id v25 = &unk_264A15D10;
  objc_copyWeak(&v28, &location);
  id v12 = v7;
  id v27 = v12;
  id v13 = v6;
  id v26 = v13;
  int v14 = (void *)MEMORY[0x230FBD990]([v11 setModifyRecordsCompletionBlock:&v22]);
  int v15 = self;
  HMFGetOSLogHandle();
  __int16 v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend(v11, "operationID", &v30, v22, v23, v24, v25);
    *(_DWORD *)buf = 138543874;
    id v33 = v17;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    uint64_t v37 = v18;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Pushing updated share %@ (operationID: %@)", buf, 0x20u);
  }
  __int16 v19 = [(HMDCoreDataCloudShareService *)v15 ckContainer];
  id v20 = [v19 privateCloudDatabase];
  [v20 addOperation:v11];

  objc_destroyWeak(&v28);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v17 = 138543874;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2114;
      id v22 = v6;
      id v13 = "%{public}@Failed to push share %@: %{public}@";
      int v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, (uint8_t *)&v17, v16);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v5;
    id v13 = "%{public}@Successfully pushed share: %@";
    int v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

void __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_74(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v9)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = WeakRetained;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v14;
        __int16 v50 = 2114;
        id v51 = v9;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Push updated share operation failed: %{public}@", buf, 0x16u);
      }
      uint64_t v15 = objc_msgSend(v9, "hmd_retryAfterCKError");
      if (v15)
      {
        id v16 = (id)v15;
        int v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = v12;
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v20;
          __int16 v50 = 2114;
          id v51 = v16;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Retrying pushing updated share in %{public}@s", buf, 0x16u);
        }
        [v16 doubleValue];
        dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_75;
        block[3] = &unk_264A2EE80;
        block[4] = v18;
        id v46 = a1[4];
        id v47 = a1[5];
        dispatch_after(v22, MEMORY[0x263EF83A0], block);
      }
      else
      {
        __int16 v36 = [a1[4] recordID];
        uint64_t v37 = objc_msgSend(v9, "hmd_actualCKErrorFromCKErrorPartialFailure:", v36);

        __int16 v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = v12;
        __int16 v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v49 = v41;
          __int16 v50 = 2114;
          id v51 = v37;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failing push updated share with %{public}@", buf, 0x16u);
        }
        uint64_t v42 = _Block_copy(a1[5]);
        v43 = v42;
        if (v42) {
          (*((void (**)(void *, void, void *))v42 + 2))(v42, 0, v37);
        }

        id v16 = 0;
      }
    }
    else
    {
      id v27 = [v7 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v28 = v27;
      }
      else {
        id v28 = 0;
      }
      id v16 = v28;

      if (!v16)
      {
        uint64_t v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = WeakRetained;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v32 = HMFGetLogIdentifier();
          [v7 firstObject];
          id v33 = v44 = v29;
          *(_DWORD *)buf = 138543618;
          v49 = v32;
          __int16 v50 = 2112;
          id v51 = v33;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unexpected record received when pushing updated share: %@", buf, 0x16u);

          uint64_t v29 = v44;
        }
      }
      __int16 v34 = _Block_copy(a1[5]);
      id v35 = v34;
      if (v34) {
        (*((void (**)(void *, id, void))v34 + 2))(v34, v16, 0);
      }
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Lost self while pushing updated share", buf, 0xCu);
    }
    id v26 = _Block_copy(a1[5]);
    id v16 = v26;
    if (v26) {
      (*((void (**)(void *, void, id))v26 + 2))(v26, 0, v9);
    }
  }
}

uint64_t __61__HMDCoreDataCloudShareService__pushUpdatedShare_completion___block_invoke_75(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushUpdatedShare:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)fetchShareWithRecordID:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  id v5 = [MEMORY[0x263F42538] futureWithPromise:&v11];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDCoreDataCloudShareService_fetchShareWithRecordID___block_invoke;
  v7[3] = &unk_264A15CC0;
  objc_copyWeak(&v9, &location);
  id v8 = v11;
  [(HMDCoreDataCloudShareService *)self _fetchShareWithRecordID:v4 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

void __55__HMDCoreDataCloudShareService_fetchShareWithRecordID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching share failed with %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 32) rejectWithError:v6];
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    if (v5)
    {
      [v12 fulfillWithValue:v5];
    }
    else
    {
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v12 rejectWithError:v13];
    }
  }
}

- (void)_fetchShareWithRecordID:(id)a3 completion:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFD778]);
  [v8 setQualityOfService:17];
  id v9 = objc_alloc(MEMORY[0x263EFD6D8]);
  v38[0] = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  id v11 = (void *)[v9 initWithRecordIDs:v10];

  [v11 setConfiguration:v8];
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke;
  v29[3] = &unk_264A15C70;
  double v21 = &v30;
  objc_copyWeak(&v30, &location);
  [v11 setPerRecordCompletionBlock:v29];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  id v24 = __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_67;
  id v25 = &unk_264A15C98;
  objc_copyWeak(&v28, &location);
  id v12 = v7;
  id v27 = v12;
  id v13 = v6;
  id v26 = v13;
  int v14 = (void *)MEMORY[0x230FBD990]([v11 setFetchRecordsCompletionBlock:&v22]);
  uint64_t v15 = self;
  HMFGetOSLogHandle();
  __int16 v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend(v11, "operationID", &v30, v22, v23, v24, v25);
    *(_DWORD *)buf = 138543874;
    id v33 = v17;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    uint64_t v37 = v18;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Fetching share with record ID: %@ (operationID: %@)", buf, 0x20u);
  }
  __int16 v19 = [(HMDCoreDataCloudShareService *)v15 ckContainer];
  id v20 = [v19 privateCloudDatabase];
  [v20 addOperation:v11];

  objc_destroyWeak(&v28);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = WeakRetained;
  id v13 = HMFGetOSLogHandle();
  int v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v20 = 138543874;
      double v21 = v15;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v16 = "%{public}@Failed to fetch share %@: %{public}@";
      id v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v17, v18, v16, (uint8_t *)&v20, v19);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    int v20 = 138543618;
    double v21 = v15;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v16 = "%{public}@Successfully fetched share: %@";
    id v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint32_t v19 = 22;
    goto LABEL_6;
  }
}

void __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_67(id *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = WeakRetained;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v11;
        __int16 v44 = 2114;
        id v45 = v6;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch share operation failed: %{public}@", buf, 0x16u);
      }
      uint64_t v12 = objc_msgSend(v6, "hmd_retryAfterCKError");
      if (v12)
      {
        id v13 = (id)v12;
        int v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = v9;
        __int16 v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v43 = v17;
          __int16 v44 = 2114;
          id v45 = v13;
          __int16 v46 = 2112;
          id v47 = v6;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Retrying fetching share in %{public}@s due to error: %@", buf, 0x20u);
        }
        [v13 doubleValue];
        dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_68;
        block[3] = &unk_264A2EE80;
        block[4] = v15;
        id v40 = a1[4];
        id v41 = a1[5];
        dispatch_after(v19, MEMORY[0x263EF83A0], block);
      }
      else
      {
        __int16 v32 = objc_msgSend(v6, "hmd_actualCKErrorFromCKErrorPartialFailure:", a1[4]);
        id v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = v9;
        id v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          __int16 v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v43 = v36;
          __int16 v44 = 2114;
          id v45 = v32;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failing fetch share failed with %{public}@", buf, 0x16u);
        }
        uint64_t v37 = _Block_copy(a1[5]);
        __int16 v38 = v37;
        if (v37) {
          (*((void (**)(void *, void, void *))v37 + 2))(v37, 0, v32);
        }

        id v13 = 0;
      }
    }
    else
    {
      __int16 v24 = [v5 objectForKeyedSubscript:a1[4]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v25 = v24;
      }
      else {
        id v25 = 0;
      }
      id v13 = v25;

      if (!v13)
      {
        uint64_t v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = WeakRetained;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v43 = v29;
          __int16 v44 = 2112;
          id v45 = v5;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetched share: %@", buf, 0x16u);
        }
      }
      id v30 = _Block_copy(a1[5]);
      id v31 = v30;
      if (v30) {
        (*((void (**)(void *, id, void))v30 + 2))(v30, v13, 0);
      }
    }
  }
  else
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    double v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Lost self while fetching share", buf, 0xCu);
    }
    id v23 = _Block_copy(a1[5]);
    id v13 = v23;
    if (v23) {
      (*((void (**)(void *, void, id))v23 + 2))(v23, 0, v6);
    }
  }
}

uint64_t __67__HMDCoreDataCloudShareService__fetchShareWithRecordID_completion___block_invoke_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchShareWithRecordID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (id)_fetchParticipantForAccountHandle:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v14[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v7 = [(HMDCoreDataCloudShareService *)self _fetchParticipantsForAccountHandles:v6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__HMDCoreDataCloudShareService__fetchParticipantForAccountHandle___block_invoke;
    v11[3] = &unk_264A2C760;
    id v12 = v5;
    id v13 = self;
    id v8 = [v7 then:v11];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F42538];
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    id v8 = [v9 futureWithError:v6];
  }

  return v8;
}

uint64_t __66__HMDCoreDataCloudShareService__fetchParticipantForAccountHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = v4;
  if (v4)
  {
    v4;
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@No participant with handle %@", (uint8_t *)&v16, 0x16u);
    }
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v6 = 2;
  }

  return v6;
}

- (id)_fetchParticipantsForAccountHandles:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
  id v30 = v4;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v36;
    *(void *)&long long v7 = 138543618;
    long long v29 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "cloudKitLookupInfo", v29);
        if (v12)
        {
          [v4 setObject:v11 forKeyedSubscript:v12];
        }
        else
        {
          if ([v5 count] == 1)
          {
            uint64_t v26 = (void *)MEMORY[0x263F42538];
            id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
            __int16 v22 = [v26 futureWithError:v27];

            goto LABEL_20;
          }
          id v13 = (void *)MEMORY[0x230FBD990]();
          id v14 = self;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v29;
            *(void *)&uint8_t buf[4] = v16;
            __int16 v40 = 2112;
            id v41 = v11;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Skipping user with handle %@ due to missing cloudkit lookup info", buf, 0x16u);

            id v4 = v30;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if ([v4 count])
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    __int16 v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      double v21 = [v30 allKeys];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      __int16 v40 = 2112;
      id v41 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching share participants using lookup infos: %@", buf, 0x16u);

      id v4 = v30;
    }

    *(void *)buf = 0;
    __int16 v22 = [MEMORY[0x263F42538] futureWithPromise:buf];
    id v23 = [(HMDCoreDataCloudShareService *)v18 container];
    __int16 v24 = [v4 allKeys];
    id v25 = [(HMDCoreDataCloudShareService *)v18 privateStore];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __68__HMDCoreDataCloudShareService__fetchParticipantsForAccountHandles___block_invoke;
    v32[3] = &unk_264A2D848;
    v32[4] = v18;
    id v33 = v30;
    id v34 = *(id *)buf;
    [v23 fetchParticipantsMatchingLookupInfos:v24 intoPersistentStore:v25 completion:v32];

    id v4 = v30;
  }
  else
  {
    __int16 v22 = [MEMORY[0x263F42538] futureWithValue:MEMORY[0x263EFFA78]];
  }
LABEL_20:

  return v22;
}

void __68__HMDCoreDataCloudShareService__fetchParticipantsForAccountHandles___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = a1;
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = v7[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [v7[5] allKeys];
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v11;
      __int16 v49 = 2112;
      __int16 v50 = v12;
      __int16 v51 = 2114;
      id v52 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetching participant for %@ resulted in error %{public}@", buf, 0x20u);
    }
    [v7[6] rejectWithError:v6];
  }
  else if ([v5 count])
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v38 = v5;
    id v14 = v5;
    id v15 = (void *)v13;
    id v16 = v14;
    uint64_t v17 = [v14 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      id v39 = (void *)v13;
      uint64_t v40 = *(void *)v43;
      id v41 = v16;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          __int16 v22 = [v21 userIdentity];
          id v23 = [v22 lookupInfo];

          if (v23)
          {
            __int16 v24 = [a1[5] objectForKeyedSubscript:v23];
            if (v24)
            {
              [v15 setObject:v21 forKeyedSubscript:v24];
            }
            else
            {
              id v25 = (void *)MEMORY[0x230FBD990]();
              id v26 = a1[4];
              id v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v29 = id v28 = a1;
                *(_DWORD *)buf = 138543618;
                uint64_t v48 = v29;
                __int16 v49 = 2112;
                __int16 v50 = v21;
                _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot find account handle for fetching participant %@", buf, 0x16u);

                a1 = v28;
                id v15 = v39;
              }

              uint64_t v19 = v40;
              id v16 = v41;
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v18);
    }

    [a1[6] fulfillWithValue:v15];
    id v6 = 0;
    id v5 = v38;
  }
  else
  {
    id v30 = a1;
    id v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = v30[4];
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      long long v35 = [v30[5] allKeys];
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v34;
      __int16 v49 = 2112;
      __int16 v50 = v35;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Did not fetch any participants using lookup infos %@", buf, 0x16u);
    }
    id v36 = v30[6];
    long long v37 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v36 rejectWithError:v37];
  }
}

- (id)_removeParticipant:(id)a3 share:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v65 = v11;
    __int16 v66 = 2112;
    uint64_t v67 = (uint64_t)v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing participant %@ from share", buf, 0x16u);
  }
  if ([v6 role] == 1)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = v9;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v65 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cannot remove participant from share: Cannot remove the owner from a share", buf, 0xCu);
    }
    id v16 = [[HMDAssertionLogEvent alloc] initWithReason:@"Cannot remove participant from share: Cannot remove the owner from a share"];
    uint64_t v17 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v17 submitLogEvent:v16];

    uint64_t v18 = (void *)MEMORY[0x263F42538];
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = @"Cannot remove the owner from a share";
LABEL_11:
    id v27 = [v19 hmfErrorWithCode:5 reason:v20];
    id v28 = [v18 futureWithError:v27];

    goto LABEL_12;
  }
  if ([v6 isCurrentUser])
  {
    double v21 = (void *)MEMORY[0x230FBD990]();
    __int16 v22 = v9;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v65 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cannot remove participant from share: Cannot remove the current user from the share", buf, 0xCu);
    }
    id v25 = [[HMDAssertionLogEvent alloc] initWithReason:@"Cannot remove participant from share: Cannot remove the current user from the share"];
    id v26 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v26 submitLogEvent:v25];

    uint64_t v18 = (void *)MEMORY[0x263F42538];
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = @"Cannot remove the current user from the share";
    goto LABEL_11;
  }
  id v30 = [v7 currentUserParticipant];
  if ([v30 role] == 1)
  {
  }
  else
  {
    id v31 = [v7 currentUserParticipant];
    uint64_t v32 = [v31 role];

    if (v32 != 2)
    {
      long long v44 = (void *)MEMORY[0x230FBD990]();
      long long v45 = v9;
      __int16 v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        id v47 = HMFGetLogIdentifier();
        uint64_t v48 = [v7 currentUserParticipant];
        uint64_t v49 = [v48 role];
        *(_DWORD *)buf = 138543618;
        v65 = v47;
        __int16 v66 = 2048;
        uint64_t v67 = v49;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Current user participant with non-owner role %ld cannot remove participants from a share", buf, 0x16u);
      }
      __int16 v50 = [HMDAssertionLogEvent alloc];
      __int16 v51 = [v7 currentUserParticipant];
      id v52 = -[HMDAssertionLogEvent initWithReason:](v50, "initWithReason:", @"Current user participant with non-owner role %ld cannot remove participants from a share", [v51 role]);

      uint64_t v53 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v53 submitLogEvent:v52];

      v54 = (void *)MEMORY[0x263F42538];
      v55 = (void *)MEMORY[0x263F087E8];
      v56 = NSString;
      v57 = [v7 currentUserParticipant];
      v58 = objc_msgSend(v56, "stringWithFormat:", @"Current user participant with non-owner role %ld cannot remove participants from a share", objc_msgSend(v57, "role"));
      v59 = [v55 hmfErrorWithCode:5 reason:v58];
      id v28 = [v54 futureWithError:v59];

      goto LABEL_12;
    }
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v33 = [v7 participants];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v61;
LABEL_20:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v61 != v36) {
        objc_enumerationMutation(v33);
      }
      id v38 = *(void **)(*((void *)&v60 + 1) + 8 * v37);
      if ([v6 isEqual:v38]) {
        break;
      }
      if (v35 == ++v37)
      {
        uint64_t v35 = [v33 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v35) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }
    id v39 = v38;

    if (!v39) {
      goto LABEL_29;
    }
    [v7 removeParticipant:v39];
    id v28 = [(HMDCoreDataCloudShareService *)v9 _pushUpdatedShare:v7];
  }
  else
  {
LABEL_26:

LABEL_29:
    uint64_t v40 = (void *)MEMORY[0x230FBD990]();
    id v41 = v9;
    long long v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      long long v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v65 = v43;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v6;
      __int16 v68 = 2112;
      id v69 = v7;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Didn't find requested participant %@ on share %@. Considering this success", buf, 0x20u);
    }
    id v28 = [MEMORY[0x263F42538] futureWithValue:v7];
  }
LABEL_12:

  return v28;
}

- (id)_addParticipant:(id)a3 share:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding participant %@ to share", (uint8_t *)&v14, 0x16u);
  }
  [v7 addParticipant:v6];
  id v12 = [(HMDCoreDataCloudShareService *)v9 _pushUpdatedShare:v7];

  return v12;
}

- (id)_auditUsersForRevokedAccessWithAccountHandles:(id)a3 share:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__10129;
    v23[4] = __Block_byref_object_dispose__10130;
    id v24 = 0;
    uint64_t v8 = [v7 recordID];
    id v9 = [(HMDCoreDataCloudShareService *)self fetchShareWithRecordID:v8];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke;
    v20[3] = &unk_264A15B60;
    __int16 v22 = v23;
    v20[4] = self;
    id v10 = v6;
    id v21 = v10;
    uint64_t v11 = [v9 then:v20];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke_2;
    v16[3] = &unk_264A15C48;
    uint64_t v18 = self;
    uint64_t v19 = v23;
    id v17 = v10;
    id v12 = [v11 then:v16];

    _Block_object_dispose(v23, 8);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F42538];
    int v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    id v12 = [v13 futureWithError:v14];
  }
  return v12;
}

uint64_t __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = [*(id *)(a1 + 32) _fetchParticipantsForAccountHandles:*(void *)(a1 + 40)];
  if (v5)
  {
    id v6 = v5;

    return 3;
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    return __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke_2(v8);
  }
}

uint64_t __84__HMDCoreDataCloudShareService__auditUsersForRevokedAccessWithAccountHandles_share___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = [*(id *)(a1 + 32) count];
  id v6 = v4;
  id v7 = v3;
  uint64_t v8 = [v6 arrayWithCapacity:v5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [v3 allKeys];
  uint64_t v28 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v28)
  {
    uint64_t v11 = *(void *)v30;
    *(void *)&long long v10 = 138543874;
    long long v25 = v10;
    id v26 = v9;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        int v14 = objc_msgSend(v7, "objectForKeyedSubscript:", v13, v25);
        id v15 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) participants];
        char v16 = [v15 containsObject:v14];

        if ((v16 & 1) == 0)
        {
          id v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(a1 + 40);
          uint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v20 = v8;
            v22 = id v21 = v7;
            uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            *(_DWORD *)buf = v25;
            uint64_t v34 = v22;
            __int16 v35 = 2112;
            uint64_t v36 = v14;
            __int16 v37 = 2112;
            uint64_t v38 = v23;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Participant %@ no longer found on share %@", buf, 0x20u);

            id v7 = v21;
            uint64_t v8 = v20;
            id v9 = v26;
          }

          [v8 addObject:v13];
          uint64_t v11 = v27;
        }
      }
      uint64_t v28 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v28);
  }

  return 1;
}

- (id)_revokeAccessForUserWithAccountHandle:(id)a3 share:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__10129;
  v26[4] = __Block_byref_object_dispose__10130;
  id v27 = 0;
  uint64_t v8 = [v7 recordID];
  id v9 = [(HMDCoreDataCloudShareService *)self fetchShareWithRecordID:v8];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke;
  v23[3] = &unk_264A15B60;
  long long v25 = v26;
  v23[4] = self;
  id v10 = v6;
  id v24 = v10;
  uint64_t v11 = [v9 then:v23];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_2;
  uint64_t v19 = &unk_264A15C00;
  __int16 v22 = v26;
  uint64_t v20 = self;
  id v12 = v7;
  id v21 = v12;
  uint64_t v13 = [v11 then:&v16];
  int v14 = objc_msgSend(v13, "then:", &__block_literal_global_42, v16, v17, v18, v19, v20);

  _Block_object_dispose(v26, 8);
  return v14;
}

uint64_t __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = [*(id *)(a1 + 32) _fetchParticipantForAccountHandle:*(void *)(a1 + 40)];
  if (v5)
  {
    id v6 = v5;

    return 3;
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    return __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_2(v8);
  }
}

uint64_t __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) participants];
  int v5 = [v4 containsObject:v3];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) _removeParticipant:v3 share:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@No matching participant %@ found on share %@ to revoke", (uint8_t *)&v15, 0x20u);
    }
    id v6 = [MEMORY[0x263F42538] futureWithValue:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  id v12 = v6;
  if (!v12) {
    _HMFPreconditionFailure();
  }
  uint64_t v13 = v12;

  return 3;
}

uint64_t __76__HMDCoreDataCloudShareService__revokeAccessForUserWithAccountHandle_share___block_invoke_40()
{
  return 1;
}

- (id)_grantAccessForUserWithAccountHandle:(id)a3 share:(id)a4 logEventBuilder:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v40 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Granting access for user with account handle %@ to share: %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__10129;
  id v41 = __Block_byref_object_dispose__10130;
  id v42 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__10129;
  v37[4] = __Block_byref_object_dispose__10130;
  id v38 = 0;
  [v10 markAddUserBegin];
  int v15 = [v9 recordID];
  uint64_t v16 = [(HMDCoreDataCloudShareService *)v12 fetchShareWithRecordID:v15];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke;
  v34[3] = &unk_264A15B60;
  uint64_t v36 = buf;
  v34[4] = v12;
  id v17 = v8;
  id v35 = v17;
  id v18 = [v16 then:v34];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_2;
  v33[3] = &unk_264A15BB0;
  v33[5] = v37;
  v33[6] = buf;
  v33[4] = v12;
  __int16 v19 = [v18 then:v33];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_2_36;
  v29[3] = &unk_264A15BD8;
  long long v32 = v37;
  void v29[4] = v12;
  id v30 = v10;
  id v31 = v17;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_38;
  v25[3] = &unk_264A2BAF0;
  void v25[4] = v12;
  id v20 = v31;
  id v26 = v20;
  uint64_t v21 = v9;
  id v27 = v21;
  id v22 = v30;
  id v28 = v22;
  uint64_t v23 = [v19 then:v29 orRecover:v25];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(buf, 8);

  return v23;
}

uint64_t __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = [*(id *)(a1 + 32) _fetchParticipantForAccountHandle:*(void *)(a1 + 40)];
  if (v5)
  {
    id v6 = v5;

    return 3;
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    return __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_2(v8);
  }
}

uint64_t __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) participants];
  int v6 = [v5 containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if (!v6)
  {
    id v15 = [*(id *)(a1 + 32) _addParticipant:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) share:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    if (v15)
    {
      uint64_t v16 = v15;

      goto LABEL_8;
    }
LABEL_9:
    _HMFPreconditionFailure();
  }
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing and re-adding participant because fetched share already contains equivalent participant: %@", buf, 0x16u);
  }
  id v12 = [*(id *)(a1 + 32) _removeParticipant:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) share:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_34;
  v18[3] = &unk_264A15B88;
  long long v19 = *(_OWORD *)(a1 + 32);
  id v13 = [v12 then:v18];
  if (!v13) {
    goto LABEL_9;
  }
  int v14 = v13;

LABEL_8:
  return 3;
}

uint64_t __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_2_36(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = objc_msgSend(v3, "participants", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v9 isEqual:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
        {
          id v18 = [v9 invitationToken];

          long long v19 = (void *)MEMORY[0x230FBD990]();
          id v20 = *(id *)(a1 + 32);
          uint64_t v21 = HMFGetOSLogHandle();
          __int16 v22 = v21;
          if (v18)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = HMFGetLogIdentifier();
              uint64_t v24 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              uint64_t v36 = v23;
              __int16 v37 = 2112;
              uint64_t v38 = v24;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully added user with handle %@ to share", buf, 0x16u);
            }
            [*(id *)(a1 + 40) markAddUserEnd];
            long long v25 = [HMDCoreDataCloudShareInvitation alloc];
            id v16 = [v3 URL];
            id v26 = [v9 invitationToken];
            [(HMDCoreDataCloudShareInvitation *)v25 initWithURL:v16 token:v26];
            uint64_t v17 = 1;
          }
          else
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v27 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v36 = v27;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil invitation token after adding user as new participant", buf, 0xCu);
            }
            id v28 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3504];
            [*(id *)(a1 + 40) markError:v28];
            id v29 = v28;
            if (v29)
            {
              id v26 = v29;
              uint64_t v17 = 2;
              id v16 = v26;
            }
            else
            {
              [MEMORY[0x263F087E8] hmfUnspecifiedError];
              objc_claimAutoreleasedReturnValue();
              id v26 = 0;
              id v16 = 0;
              uint64_t v17 = 2;
            }
          }

          goto LABEL_24;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected no matching participant after adding user as a new participant", buf, 0xCu);
  }
  int v14 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3505];
  [*(id *)(a1 + 40) markError:v14];
  id v15 = v14;
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 2;
    id v4 = v16;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
    id v16 = 0;
    id v4 = 0;
    uint64_t v17 = 2;
  }
LABEL_24:

  return v17;
}

uint64_t __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = objc_msgSend(v3, "hmd_isRecordConflictCKError");
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = objc_msgSend(v3, "hmd_conciseCKError");
      id v11 = [v10 shortDescription];
      int v19 = 138543618;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to save share, need to resolve conflict, %{public}@", (uint8_t *)&v19, 0x16u);
    }
    id v12 = [*(id *)(a1 + 32) _grantAccessForUserWithAccountHandle:*(void *)(a1 + 40) share:*(void *)(a1 + 48) logEventBuilder:*(void *)(a1 + 56)];
    if (!v12) {
      _HMFPreconditionFailure();
    }
    id v13 = v12;

    uint64_t v14 = 3;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v15;
      __int16 v21 = 2114;
      id v22 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to add participant with %{public}@", (uint8_t *)&v19, 0x16u);
    }
    [*(id *)(a1 + 56) markError:v3];
    id v16 = v3;
    id v13 = v16;
    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = 2;
  }

  return v14;
}

uint64_t __91__HMDCoreDataCloudShareService__grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _addParticipant:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) share:v3];
  if (v4)
  {
    uint64_t v5 = v4;

    return 3;
  }
  else
  {
    uint64_t v7 = (HMDCoreDataCloudShareService *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDCoreDataCloudShareService *)v7 acceptShareInvitation:v9];
  }
}

- (id)acceptShareInvitation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F42538];
  managedObjectContext = self->_managedObjectContext;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HMDCoreDataCloudShareService_acceptShareInvitation___block_invoke;
  v10[3] = &unk_264A2EC78;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  SEL v8 = [v5 inContext:managedObjectContext perform:v10];

  return v8;
}

uint64_t __54__HMDCoreDataCloudShareService_acceptShareInvitation___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _acceptShareInvitation:*(void *)(a1 + 40)];
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDCoreDataCloudShareService *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDCoreDataCloudShareService *)v4 _acceptShareInvitation:v6];
  }
}

- (id)_acceptShareInvitation:(id)a3
{
  id v4 = [(HMDCoreDataCloudShareService *)self _fetchShareMetadataForInvitation:a3];
  managedObjectContext = self->_managedObjectContext;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke;
  v9[3] = &unk_264A15B38;
  v9[4] = self;
  id v6 = [v4 inContext:managedObjectContext then:v9];
  id v7 = [v6 then:&__block_literal_global_32_10148];

  return v7;
}

uint64_t __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v10[0] = v3;
  SEL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v6 = [*(id *)(a1 + 32) sharedStore];
  id v7 = [v4 acceptShareInvitationsFromMetadata:v5 intoPersistentStore:v6];
  if (!v7) {
    _HMFPreconditionFailure();
  }
  SEL v8 = v7;

  return 3;
}

uint64_t __55__HMDCoreDataCloudShareService__acceptShareInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 firstObject];
  [v2 share];
  objc_claimAutoreleasedReturnValue();

  return 1;
}

- (id)acceptShareInvitationsFromMetadata:(id)a3 intoPersistentStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  SEL v8 = [MEMORY[0x263F42538] futureWithPromise:&v16];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__HMDCoreDataCloudShareService_acceptShareInvitationsFromMetadata_intoPersistentStore___block_invoke;
  v11[3] = &unk_264A2E930;
  objc_copyWeak(&v14, &location);
  id v12 = v16;
  id v9 = v6;
  id v13 = v9;
  [(HMDCoreDataCloudShareService *)self _acceptShareInvitationsFromMetadata:v9 intoPersistentStore:v7 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __87__HMDCoreDataCloudShareService_acceptShareInvitationsFromMetadata_intoPersistentStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    [*(id *)(a1 + 32) rejectWithError:v6];
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) fulfillWithValue:v5];
  }
  else
  {
    SEL v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v15 = 138543618;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to accept share, no metadata returned for %@", (uint8_t *)&v15, 0x16u);
    }
    id v13 = *(void **)(a1 + 32);
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v13 rejectWithError:v14];
  }
}

- (void)_acceptShareInvitationsFromMetadata:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v25 = v14;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Accepting share invitations from metadata: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v12);
  int v15 = [(HMDCoreDataCloudShareService *)v12 container];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke;
  v19[3] = &unk_264A15B10;
  objc_copyWeak(&v23, (id *)buf);
  id v16 = v10;
  id v22 = v16;
  id v17 = v8;
  id v20 = v17;
  id v18 = v9;
  id v21 = v18;
  [v15 acceptShareInvitationsFromMetadata:v17 intoPersistentStore:v18 completion:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v31 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Lost self while accepting share invitations", buf, 0xCu);
    }
    uint64_t v19 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
    id v20 = v19;
    if (!v19) {
      goto LABEL_14;
    }
    id v21 = v19[2];
    goto LABEL_13;
  }
  if (!v6)
  {
    id v22 = (void (**)(void))_Block_copy(*(const void **)(a1 + 48));
    id v20 = v22;
    if (!v22)
    {
LABEL_14:

      goto LABEL_21;
    }
    id v21 = v22[2];
LABEL_13:
    v21();
    goto LABEL_14;
  }
  id v8 = objc_msgSend(v6, "hmd_retryAfterCKError");
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = WeakRetained;
  id v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v31 = v13;
      __int16 v32 = 2112;
      id v33 = v8;
      __int16 v34 = 2114;
      id v35 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Retrying with %@, failed to accept share invitation due to %{public}@", buf, 0x20u);
    }
    [v8 doubleValue];
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke_25;
    v26[3] = &unk_264A2EE30;
    v26[4] = v10;
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    dispatch_after(v15, MEMORY[0x263EF83A0], v26);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v31 = v23;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to accept share invitation due to %{public}@", buf, 0x16u);
    }
    uint64_t v24 = _Block_copy(*(const void **)(a1 + 48));
    long long v25 = v24;
    if (v24) {
      (*((void (**)(void *, void, id))v24 + 2))(v24, 0, v6);
    }
  }
LABEL_21:
}

uint64_t __99__HMDCoreDataCloudShareService__acceptShareInvitationsFromMetadata_intoPersistentStore_completion___block_invoke_25(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acceptShareInvitationsFromMetadata:*(void *)(a1 + 40) intoPersistentStore:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (id)auditUsersForRevokedAccessWithAccountHandles:(id)a3 share:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F42538];
  managedObjectContext = self->_managedObjectContext;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __83__HMDCoreDataCloudShareService_auditUsersForRevokedAccessWithAccountHandles_share___block_invoke;
  v14[3] = &unk_264A2BEC8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v8 inContext:managedObjectContext perform:v14];

  return v12;
}

uint64_t __83__HMDCoreDataCloudShareService_auditUsersForRevokedAccessWithAccountHandles_share___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _auditUsersForRevokedAccessWithAccountHandles:*(void *)(a1 + 40) share:*(void *)(a1 + 48)];
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDCoreDataCloudShareService *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDCoreDataCloudShareService *)v4 revokeAccessForUserWithAccountHandle:v6 share:v7];
  }
}

- (id)revokeAccessForUserWithAccountHandle:(id)a3 share:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F42538];
  managedObjectContext = self->_managedObjectContext;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __75__HMDCoreDataCloudShareService_revokeAccessForUserWithAccountHandle_share___block_invoke;
  v14[3] = &unk_264A2BEC8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v8 inContext:managedObjectContext perform:v14];

  return v12;
}

uint64_t __75__HMDCoreDataCloudShareService_revokeAccessForUserWithAccountHandle_share___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _revokeAccessForUserWithAccountHandle:*(void *)(a1 + 40) share:*(void *)(a1 + 48)];
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDCoreDataCloudShareService *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDCoreDataCloudShareService *)v4 grantAccessForUserWithAccountHandle:v6 share:v7 logEventBuilder:v8];
  }
}

- (id)grantAccessForUserWithAccountHandle:(id)a3 share:(id)a4 logEventBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F42538];
  managedObjectContext = self->_managedObjectContext;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__HMDCoreDataCloudShareService_grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke;
  v18[3] = &unk_264A2BEA0;
  void v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v11 inContext:managedObjectContext perform:v18];

  return v16;
}

uint64_t __90__HMDCoreDataCloudShareService_grantAccessForUserWithAccountHandle_share_logEventBuilder___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _grantAccessForUserWithAccountHandle:*(void *)(a1 + 40) share:*(void *)(a1 + 48) logEventBuilder:*(void *)(a1 + 56)];
  if (v1)
  {
    v2 = v1;

    return 3;
  }
  else
  {
    id v4 = (HMDCoreDataCloudShareService *)_HMFPreconditionFailure();
    return (uint64_t)[(HMDCoreDataCloudShareService *)v4 ckContainer];
  }
}

- (id)ckContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ckContainer = self->_ckContainer;
  if (!ckContainer)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFD628]);
    [v5 setUseZoneWidePCS:1];
    id v6 = [MEMORY[0x263EFD610] containerIDForContainerIdentifier:@"com.apple.homekit.config"];
    id v7 = (CKContainer *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v6 options:v5];
    id v8 = self->_ckContainer;
    self->_ckContainer = v7;

    ckContainer = self->_ckContainer;
  }
  id v9 = ckContainer;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (HMDCoreDataCloudShareService)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCoreDataCloudShareService;
  id v15 = [(HMDCoreDataCloudShareService *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_container, a3);
    objc_storeStrong((id *)&v16->_sharedStore, a4);
    objc_storeStrong((id *)&v16->_privateStore, a5);
    objc_storeStrong((id *)&v16->_managedObjectContext, a6);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_10162 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_10162, &__block_literal_global_10163);
  }
  v2 = (void *)logCategory__hmf_once_v1_10164;
  return v2;
}

void __43__HMDCoreDataCloudShareService_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v1_10164;
  logCategory__hmf_once_v1_10164 = v0;
}

@end
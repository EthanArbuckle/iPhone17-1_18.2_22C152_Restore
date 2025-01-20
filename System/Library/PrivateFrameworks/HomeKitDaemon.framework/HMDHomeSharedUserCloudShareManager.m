@interface HMDHomeSharedUserCloudShareManager
+ (id)logCategory;
- (BOOL)_onlyShareOwnerInShare:(id)a3;
- (HMDHomeSharedUserCloudShareManager)initWithCloudShareService:(id)a3;
- (HMDHomeSharedUserCloudShareManager)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6;
- (id)_createShareForSharedUserDataWithHomeModelID:(id)a3 logEventBuilder:(id)a4;
- (id)_existingShareForSharedUserDataWithHomeModelID:(id)a3 error:(id *)a4;
- (id)_existingSharedUserDataRootWithHomeModelID:(id)a3 error:(id *)a4;
- (id)_existingSharedUserDataRootWithoutShareWithHomeModelID:(id)a3 error:(id *)a4;
- (id)_existingSharedUserPrivateRootWithHomeModelID:(id)a3 error:(id *)a4;
- (id)_existingSharesForSharedUserDataWithHomeModelID:(id)a3 error:(id *)a4;
- (id)_shareForSharedUserDataWithHomeModelID:(id)a3 logEventBuilder:(id)a4;
- (id)acceptShareInvitation:(id)a3 homeWithHomeModelID:(id)a4;
- (id)grantAccessForOwner:(id)a3 sharedUserDataWithHomeModelID:(id)a4 logEventBuilder:(id)a5;
- (void)_deleteDanglingShare:(id)a3 homeModelID:(id)a4;
- (void)_removeSharedUserDataRootsForHomeWithModelID:(id)a3;
- (void)leaveShareWithSharedHomeModelID:(id)a3;
- (void)removeShareForSharedUserDataWithHomeModelID:(id)a3;
- (void)removeSharesWithNoParticipantForHomeWithModelID:(id)a3;
- (void)revokeAccessForOwner:(id)a3 sharedUserDataWithHomeModelID:(id)a4;
@end

@implementation HMDHomeSharedUserCloudShareManager

- (void).cxx_destruct
{
}

- (BOOL)_onlyShareOwnerInShare:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a3, "participants", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) type] != 1)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (void)_deleteDanglingShare:(id)a3 homeModelID:(id)a4
{
  id v6 = a4;
  shareService = self->_shareService;
  id v8 = a3;
  v9 = [(HMDCoreDataCloudShareService *)shareService container];
  long long v10 = [v8 recordID];

  long long v11 = [v10 zoneID];
  long long v12 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__HMDHomeSharedUserCloudShareManager__deleteDanglingShare_homeModelID___block_invoke;
  v14[3] = &unk_264A2C050;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [v9 purgeObjectsAndRecordsInZoneWithID:v11 inPersistentStore:v12 completion:v14];
}

void __71__HMDHomeSharedUserCloudShareManager__deleteDanglingShare_homeModelID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  long long v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543874;
      v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      id v13 = "%{public}@Removing dangling share for user data for home %@ failed with %@";
      v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 138543618;
    v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    id v13 = "%{public}@Removed dangling share for user data for home %@";
    v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

- (void)removeSharesWithNoParticipantForHomeWithModelID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint32_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Looking for dangling shares to remove for home %@", buf, 0x16u);
  }
  v9 = (void *)MEMORY[0x263F42538];
  long long v10 = [(HMDCoreDataCloudShareService *)v6->_shareService managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke;
  v13[3] = &unk_264A2EC78;
  v13[4] = v6;
  id v14 = v4;
  id v11 = v4;
  id v12 = (id)[v9 inContext:v10 perform:v13];
}

uint64_t __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v31 = 0;
  id v4 = [v2 _existingSharesForSharedUserDataWithHomeModelID:v3 error:&v31];
  id v5 = v31;
  if (v4 && (unint64_t)[v4 count] > 1)
  {
    id v22 = v5;
    id v23 = v4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v4;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          os_log_type_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint32_t v16 = *(void **)(*(void *)(a1 + 32) + 8);
          __int16 v17 = objc_msgSend(v15, "recordID", v22, v23);
          id v18 = [v16 fetchShareWithRecordID:v17];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke_150;
          v25[3] = &unk_264A2C028;
          uint64_t v19 = *(void **)(a1 + 40);
          v25[4] = *(void *)(a1 + 32);
          v25[5] = v15;
          id v26 = v19;
          id v20 = (id)[v18 then:v25];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    id v5 = v22;
    id v4 = v23;
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v34 = v9;
      __int16 v35 = 2112;
      uint64_t v36 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@One or fewer reverse shares for home %@, nothing to prune.", buf, 0x16u);
    }
  }

  return 1;
}

uint64_t __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Completed fetch for share %@", (uint8_t *)&v17, 0x16u);
    }
    if ([*(id *)(a1 + 32) _onlyShareOwnerInShare:v3])
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = *(void *)(a1 + 48);
        int v17 = 138543874;
        id v18 = v12;
        __int16 v19 = 2112;
        id v20 = v3;
        __int16 v21 = 2112;
        uint64_t v22 = v13;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing dangling share %@ for home %@", (uint8_t *)&v17, 0x20u);
      }
      [*(id *)(a1 + 32) _deleteDanglingShare:v3 homeModelID:*(void *)(a1 + 48)];
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      os_log_type_t v15 = *(void **)(a1 + 40);
      int v17 = 138543618;
      id v18 = v14;
      __int16 v19 = 2112;
      id v20 = v15;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Performed a fetch for share %@ but found none", (uint8_t *)&v17, 0x16u);
    }
  }

  return 1;
}

- (id)_createShareForSharedUserDataWithHomeModelID:(id)a3 logEventBuilder:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  v53 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  [v7 markCreateMKFCKSharedUserDataRootBegin];
  id v59 = 0;
  v9 = [(HMDHomeSharedUserCloudShareManager *)self _existingSharedUserDataRootWithoutShareWithHomeModelID:v6 error:&v59];
  id v10 = v59;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v62 = 2114;
      id v63 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Checking for existing shared data root failed with error: %{public}@", buf, 0x16u);
    }
    uint32_t v16 = (void *)MEMORY[0x263F087E8];
    int v17 = HMDSanitizeCoreDataError(v11);
    id v18 = [v16 hmInternalErrorWithCode:3507 underlyingError:v17];

    __int16 v19 = (void *)MEMORY[0x263F42538];
    id v20 = HMDSanitizeCoreDataError(v18);
    __int16 v21 = [v19 futureWithError:v20];
  }
  else
  {
    uint64_t v22 = [v9 count];
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    uint64_t v24 = self;
    v25 = HMFGetOSLogHandle();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v22)
    {
      if (v26)
      {
        long long v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v62 = 2112;
        id v63 = v6;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Will attempt to re-share existing MKFCKSharedUserDataRoot for home %@ that doesn't have an associated share", buf, 0x16u);
      }
      uint64_t v28 = [v9 firstObject];
    }
    else
    {
      if (v26)
      {
        long long v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v29;
        __int16 v62 = 2112;
        id v63 = v6;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Creating MKFCKSharedUserDataRoot for home %@ since none was found", buf, 0x16u);
      }
      uint64_t v28 = +[MKFCKSharedUserDataRoot createWithHomeModelID:v6 persistentStore:v53 context:v8];
    }
    id v18 = (void *)v28;
    id v58 = 0;
    id v20 = [(HMDHomeSharedUserCloudShareManager *)v24 _existingSharedUserPrivateRootWithHomeModelID:v6 error:&v58];
    id v30 = v58;
    v52 = v8;
    if (v30)
    {
      uint64_t v11 = v30;
      id v31 = (void *)MEMORY[0x230FBD990]();
      v32 = v24;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        __int16 v62 = 2114;
        id v63 = v11;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Checking for existing private settings root failed with error: %{public}@", buf, 0x16u);
      }
      __int16 v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = HMDSanitizeCoreDataError(v11);
      uint64_t v37 = [v35 hmInternalErrorWithCode:3506 underlyingError:v36];

      v38 = (void *)MEMORY[0x263F42538];
      v39 = HMDSanitizeCoreDataError(v37);
      __int16 v21 = [v38 futureWithError:v39];
    }
    else
    {
      if (!v20)
      {
        context = (void *)MEMORY[0x230FBD990]();
        v40 = v24;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v42;
          __int16 v62 = 2112;
          id v63 = v6;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Creating MKFCKSharedUserPrivateRoot for home %@ since none was found", buf, 0x16u);

          id v8 = v52;
        }

        id v43 = +[MKFCKSharedUserPrivateRoot createWithHomeModelID:v6 persistentStore:v53 context:v8];
      }
      v44 = (void *)MEMORY[0x230FBD990](objc_msgSend(v7, "markCreateMKFCKSharedUserDataRootEnd", context));
      v45 = v24;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v47;
        __int16 v62 = 2112;
        id v63 = v6;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Creating reverse share for shared user data for home %@", buf, 0x16u);
      }
      [v7 markCreateReverseShareBegin];
      *(void *)buf = 0;
      __int16 v21 = [MEMORY[0x263F42538] futureWithPromise:buf];
      v48 = [(HMDCoreDataCloudShareService *)self->_shareService container];
      v60 = v18;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __99__HMDHomeSharedUserCloudShareManager__createShareForSharedUserDataWithHomeModelID_logEventBuilder___block_invoke;
      v54[3] = &unk_264A2C0E0;
      v54[4] = v45;
      id v55 = v6;
      id v56 = v7;
      id v57 = *(id *)buf;
      [v48 shareManagedObjects:v49 toShare:0 completion:v54];

      uint64_t v11 = 0;
    }
    id v8 = v52;
  }

  return v21;
}

void __99__HMDHomeSharedUserCloudShareManager__createShareForSharedUserDataWithHomeModelID_logEventBuilder___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = *(id *)(a1 + 32);
  os_log_type_t v15 = HMFGetOSLogHandle();
  uint32_t v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 40);
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create share for home %@ due to %@", (uint8_t *)&v21, 0x20u);
    }
    [*(id *)(a1 + 48) markError:v12];
    [*(id *)(a1 + 56) rejectWithError:v12];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 40);
      int v21 = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Created reverse share successful for home %@", (uint8_t *)&v21, 0x16u);
    }
    [*(id *)(a1 + 48) markCreateReverseShareEnd];
    [*(id *)(a1 + 56) fulfillWithValue:v10];
  }
}

- (id)_existingSharedUserPrivateRootWithHomeModelID:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[MKFCKSharedUserPrivateRoot fetchRequest];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", v6];

  [v7 setPredicate:v8];
  id v9 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  v15[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  [v7 setAffectedStores:v10];

  [v7 setFetchLimit:1];
  id v11 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  id v12 = [v11 executeFetchRequest:v7 error:a4];
  uint64_t v13 = [v12 firstObject];

  return v13;
}

- (id)_existingShareForSharedUserDataWithHomeModelID:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDHomeSharedUserCloudShareManager *)self _existingSharesForSharedUserDataWithHomeModelID:v6 error:a4];
  if ((unint64_t)[v7 count] >= 2)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      os_log_type_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@More than one shared data root with home modelID %@ is found, using the first one", (uint8_t *)&v14, 0x16u);
    }
  }
  id v12 = [v7 firstObject];

  return v12;
}

- (id)_existingSharesForSharedUserDataWithHomeModelID:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v42 = [MEMORY[0x263EFF980] array];
  id v7 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", v6];
  [v7 setPredicate:v8];

  id v9 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  v60[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:1];
  [v7 setAffectedStores:v10];

  id v11 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  id v12 = [v11 executeFetchRequest:v7 error:a4];

  if (*a4 || ![v12 count])
  {
    uint64_t v13 = 0;
    int v14 = (void *)v42;
  }
  else
  {
    os_log_type_t v15 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v41 = v12;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = [*(id *)(*((void *)&v50 + 1) + 8 * i) objectID];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v18);
    }

    uint64_t v22 = [(HMDCoreDataCloudShareService *)self->_shareService container];
    __int16 v23 = (void *)[v15 copy];
    uint64_t v24 = [v22 fetchSharesMatchingObjectIDs:v23 error:a4];

    int v14 = (void *)v42;
    if (*a4)
    {
      uint64_t v13 = 0;
    }
    else
    {
      v39 = v7;
      id v40 = v6;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v15;
      uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v47;
        id v43 = v15;
        do
        {
          uint64_t v28 = 0;
          uint64_t v44 = v26;
          do
          {
            if (*(void *)v47 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void *)(*((void *)&v46 + 1) + 8 * v28);
            id v30 = [v24 objectForKeyedSubscript:v29];
            if (v30)
            {
              [v14 addObject:v30];
            }
            else
            {
              uint64_t v31 = v27;
              v32 = v24;
              v33 = (void *)MEMORY[0x230FBD990]();
              v34 = self;
              __int16 v35 = self;
              uint64_t v36 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                uint64_t v37 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v55 = v37;
                __int16 v56 = 2112;
                uint64_t v57 = v29;
                _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@No CKShare for objectID %@ in map", buf, 0x16u);

                int v14 = (void *)v42;
              }

              self = v34;
              uint64_t v24 = v32;
              uint64_t v27 = v31;
              os_log_type_t v15 = v43;
              uint64_t v26 = v44;
            }

            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
        }
        while (v26);
      }

      uint64_t v13 = (void *)[v14 copy];
      id v7 = v39;
      id v6 = v40;
    }
    id v12 = v41;
  }
  return v13;
}

- (id)_existingSharedUserDataRootWithoutShareWithHomeModelID:(id)a3 error:(id *)a4
{
  id v6 = -[HMDHomeSharedUserCloudShareManager _existingSharedUserDataRootWithHomeModelID:error:](self, "_existingSharedUserDataRootWithHomeModelID:error:", a3);
  id v7 = v6;
  if (*a4 || ![v6 count])
  {
    id v8 = 0;
  }
  else
  {
    id v9 = objc_msgSend(v7, "na_map:", &__block_literal_global_148_245486);
    id v10 = [(HMDCoreDataCloudShareService *)self->_shareService container];
    id v11 = [v10 fetchSharesMatchingObjectIDs:v9 error:a4];

    if (*a4)
    {
      id v8 = 0;
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __99__HMDHomeSharedUserCloudShareManager__existingSharedUserDataRootWithoutShareWithHomeModelID_error___block_invoke_2;
      v13[3] = &unk_264A2C0B8;
      id v14 = v11;
      id v8 = objc_msgSend(v7, "na_filter:", v13);
    }
  }

  return v8;
}

BOOL __99__HMDHomeSharedUserCloudShareManager__existingSharedUserDataRootWithoutShareWithHomeModelID_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectID];
  id v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

uint64_t __99__HMDHomeSharedUserCloudShareManager__existingSharedUserDataRootWithoutShareWithHomeModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)_existingSharedUserDataRootWithHomeModelID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", v6];

  [v7 setPredicate:v8];
  id v9 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  v14[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v7 setAffectedStores:v10];

  id v11 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  id v12 = [v11 executeFetchRequest:v7 error:a4];

  return v12;
}

- (id)_shareForSharedUserDataWithHomeModelID:(id)a3 logEventBuilder:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v19 = 0;
  id v8 = [(HMDHomeSharedUserCloudShareManager *)self _existingShareForSharedUserDataWithHomeModelID:v6 error:&v19];
  id v9 = v19;
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F42538] futureWithError:v9];
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v14)
      {
        os_log_type_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v21 = v15;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Found existing reverse share for home %@", buf, 0x16u);
      }
      uint64_t v10 = [MEMORY[0x263F42538] futureWithValue:v8];
    }
    else
    {
      if (v14)
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v21 = v16;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@No reverse share for home found, creating a new reverse share with owner for home %@", buf, 0x16u);
      }
      uint64_t v10 = [(HMDHomeSharedUserCloudShareManager *)v12 _createShareForSharedUserDataWithHomeModelID:v6 logEventBuilder:v7];
    }
  }
  uint64_t v17 = (void *)v10;

  return v17;
}

- (void)leaveShareWithSharedHomeModelID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_shareService;
  id v6 = [(HMDCoreDataCloudShareService *)v5 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke;
  v9[3] = &unk_264A2F2F8;
  id v10 = v4;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  id v8 = v4;
  [v6 performBlock:v9];
}

void __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke(id *a1)
{
  v55[1] = *MEMORY[0x263EF8340];
  v2 = +[MKFCKSharedHome fetchRequest];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"modelID", a1[4]];
  [v2 setPredicate:v3];

  id v4 = [a1[5] sharedStore];
  v55[0] = v4;
  BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
  [v2 setAffectedStores:v5];

  id v6 = [a1[5] managedObjectContext];
  id v47 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v47];
  id v8 = v47;

  if (v8)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[6];
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = a1[4];
      *(_DWORD *)buf = 138543874;
      long long v50 = v12;
      __int16 v51 = 2112;
      long long v52 = v13;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Leaving shared home %@ failed due to %@", buf, 0x20u);
    }
  }
  else if (objc_msgSend(v7, "hmf_isEmpty"))
  {
    BOOL v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1[6];
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      id v18 = a1[4];
      *(_DWORD *)buf = 138543618;
      long long v50 = v17;
      __int16 v51 = 2112;
      long long v52 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to leave non-existence shared home %@", buf, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v19 = objc_msgSend(v7, "na_map:", &__block_literal_global_144_245494);
    uint64_t v20 = [a1[5] container];
    id v46 = 0;
    int v21 = [v20 fetchSharesMatchingObjectIDs:v19 error:&v46];
    id v8 = v46;

    if (v8)
    {
      __int16 v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = a1[6];
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v50 = v25;
        __int16 v51 = 2112;
        long long v52 = v7;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get share mapping for shared homes %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v36 = v19;
      uint64_t v37 = v7;
      v38 = v2;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      __int16 v35 = v21;
      id obj = [v21 allValues];
      uint64_t v26 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(obj);
            }
            id v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            uint64_t v31 = [a1[5] container];
            v32 = [v30 recordID];
            v33 = [v32 zoneID];
            v34 = [a1[5] sharedStore];
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke_145;
            v40[3] = &unk_264A2C050;
            v40[4] = a1[6];
            id v41 = a1[4];
            [v31 purgeObjectsAndRecordsInZoneWithID:v33 inPersistentStore:v34 completion:v40];
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v27);
      }

      id v7 = v37;
      v2 = v38;
      id v19 = v36;
      id v8 = 0;
      int v21 = v35;
    }
  }
}

void __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543874;
      id v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      id v13 = "%{public}@Leaving share for shared home %@ failed with %@";
      BOOL v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    id v13 = "%{public}@Left share for shared home %@";
    BOOL v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

uint64_t __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke_141(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

- (id)acceptShareInvitation:(id)a3 homeWithHomeModelID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDCoreData sharedInstance];
  id v9 = +[MKFCKSharedHome entity];
  [v8 applyVoucherForModel:v9 withModelID:v6 eventType:1 storeType:1];

  id v10 = [(HMDCoreDataCloudShareService *)self->_shareService acceptShareInvitation:v7];

  id v11 = [v10 ignoreResult];

  return v11;
}

- (void)_removeSharedUserDataRootsForHomeWithModelID:(id)a3
{
  v80[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[MKFCKSharedUserPrivateRoot fetchRequest];
  uint64_t v64 = v4;
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", v4];
  [v5 setPredicate:v6];

  id v7 = [(HMDCoreDataCloudShareService *)self->_shareService privateStore];
  v80[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:1];
  [v5 setAffectedStores:v8];

  id v9 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  id v72 = 0;
  id v10 = [v9 executeFetchRequest:v5 error:&v72];
  id v11 = v72;

  if (!v10 || ![v10 count])
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = os_log_type_t v15 = v10;
      uint64_t v17 = HMDSanitizeCoreDataError(v11);
      *(_DWORD *)buf = 138543618;
      v74 = v16;
      __int16 v75 = 2112;
      v76 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFCKSharedUserPrivateRoot with error: %@", buf, 0x16u);

      id v10 = v15;
    }
  }
  int v18 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", v64];
  [v18 setPredicate:v19];

  __int16 v20 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  id v71 = 0;
  uint64_t v21 = [v20 executeFetchRequest:v18 error:&v71];
  id v22 = v71;

  __int16 v62 = v10;
  id v63 = v11;
  if (!v21 || ![v21 count])
  {
    id v23 = v21;
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      HMDSanitizeCoreDataError(v22);
      id v28 = v22;
      v30 = uint64_t v29 = v18;
      *(_DWORD *)buf = 138543618;
      v74 = v27;
      __int16 v75 = 2112;
      v76 = v30;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFCKSharedUserDataRoot with error: %@", buf, 0x16u);

      int v18 = v29;
      id v22 = v28;

      id v10 = v62;
    }

    uint64_t v21 = v23;
    id v11 = v63;
  }
  uint64_t v31 = [MEMORY[0x263EFFA68] arrayByAddingObjectsFromArray:v10];
  v32 = [v31 arrayByAddingObjectsFromArray:v21];

  if ([v32 count])
  {
    id v58 = v21;
    id v59 = v22;
    v60 = v18;
    v61 = v5;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v57 = v32;
    id obj = v32;
    uint64_t v33 = [obj countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v68 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          v38 = (void *)MEMORY[0x230FBD990]();
          v39 = self;
          id v40 = self;
          id v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            long long v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v74 = v42;
            __int16 v75 = 2112;
            v76 = v37;
            __int16 v77 = 2112;
            id v78 = v64;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Removing shared user data root %@ for home with model ID %@", buf, 0x20u);
          }
          self = v39;
          long long v43 = [(HMDCoreDataCloudShareService *)v39->_shareService managedObjectContext];
          [v43 deleteObject:v37];
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v34);
    }

    long long v44 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
    id v66 = 0;
    int v45 = objc_msgSend(v44, "hmd_saveWithTransactionAuthor:error:", 9, &v66);
    id v46 = v66;

    id v47 = (void *)MEMORY[0x230FBD990]();
    long long v48 = self;
    long long v49 = HMFGetOSLogHandle();
    long long v50 = v49;
    if (v45)
    {
      id v5 = v61;
      id v10 = v62;
      id v22 = v59;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        __int16 v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v74 = v51;
        __int16 v75 = 2112;
        v76 = v64;
        long long v52 = "%{public}@Successfully removed shared user data roots for home with model ID %@";
        __int16 v53 = v50;
        os_log_type_t v54 = OS_LOG_TYPE_INFO;
        uint32_t v55 = 22;
LABEL_26:
        _os_log_impl(&dword_22F52A000, v53, v54, v52, buf, v55);
      }
    }
    else
    {
      id v5 = v61;
      id v10 = v62;
      id v22 = v59;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        __int16 v51 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v74 = v51;
        __int16 v75 = 2112;
        v76 = v64;
        __int16 v77 = 2112;
        id v78 = v46;
        long long v52 = "%{public}@Failed to remove shared user data roots for home with modelmID %@ with error: %@";
        __int16 v53 = v50;
        os_log_type_t v54 = OS_LOG_TYPE_ERROR;
        uint32_t v55 = 32;
        goto LABEL_26;
      }
    }

    __int16 v56 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
    [v56 reset];

    id v11 = v63;
    int v18 = v60;
    v32 = v57;
    uint64_t v21 = v58;
  }
}

- (void)removeShareForSharedUserDataWithHomeModelID:(id)a3
{
  id v4 = a3;
  id v5 = self->_shareService;
  id v6 = (void *)MEMORY[0x263F42538];
  id v7 = [(HMDCoreDataCloudShareService *)v5 managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke;
  v11[3] = &unk_264A2BEC8;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v8 = v5;
  id v9 = v4;
  id v10 = (id)[v6 inContext:v7 perform:v11];
}

uint64_t __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _removeSharedUserDataRootsForHomeWithModelID:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v24 = 0;
  id v4 = [v2 _existingShareForSharedUserDataWithHomeModelID:v3 error:&v24];
  id v5 = v24;
  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      id v30 = v5;
      id v11 = "%{public}@Fetching existing share for user data for home %@ failed with %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_4:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    if (v4)
    {
      os_log_type_t v15 = [*(id *)(a1 + 48) container];
      uint32_t v16 = [v4 recordID];
      uint64_t v17 = [v16 zoneID];
      int v18 = [*(id *)(a1 + 48) privateStore];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke_136;
      v22[3] = &unk_264A2C050;
      id v19 = *(void **)(a1 + 40);
      v22[4] = *(void *)(a1 + 32);
      id v23 = v19;
      [v15 purgeObjectsAndRecordsInZoneWithID:v17 inPersistentStore:v18 completion:v22];

      goto LABEL_8;
    }
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v21;
      id v11 = "%{public}@No share for user data for home %@ to remove";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 22;
      goto LABEL_4;
    }
  }

LABEL_8:

  return 1;
}

void __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543874;
      id v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      os_log_type_t v13 = "%{public}@Removing share for user data for home %@ failed with %@";
      uint32_t v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    os_log_type_t v13 = "%{public}@Removed share for user data for home %@";
    uint32_t v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

- (void)revokeAccessForOwner:(id)a3 sharedUserDataWithHomeModelID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F42538];
  id v9 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__HMDHomeSharedUserCloudShareManager_revokeAccessForOwner_sharedUserDataWithHomeModelID___block_invoke;
  v13[3] = &unk_264A2BEC8;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = (id)[v8 inContext:v9 perform:v13];
}

uint64_t __89__HMDHomeSharedUserCloudShareManager_revokeAccessForOwner_sharedUserDataWithHomeModelID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v20 = 0;
  id v4 = [v2 _existingShareForSharedUserDataWithHomeModelID:v3 error:&v20];
  id v5 = v20;
  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      id v26 = v5;
      id v11 = "%{public}@Fetching existing share for user data for home %@ failed with %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_4:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    if (v4)
    {
      id v15 = *(void **)(*(void *)(a1 + 32) + 8);
      uint32_t v16 = [*(id *)(a1 + 48) accountHandle];
      id v17 = (id)[v15 revokeAccessForUserWithAccountHandle:v16 share:v4];

      goto LABEL_8;
    }
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      id v11 = "%{public}@Nothing to do, no existing share for user data home %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 22;
      goto LABEL_4;
    }
  }

LABEL_8:

  return 1;
}

- (id)grantAccessForOwner:(id)a3 sharedUserDataWithHomeModelID:(id)a4 logEventBuilder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F42538];
  id v12 = [(HMDCoreDataCloudShareService *)self->_shareService managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __104__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID_logEventBuilder___block_invoke;
  v18[3] = &unk_264A2BEA0;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v21 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  uint32_t v16 = [v11 inContext:v12 perform:v18];

  return v16;
}

HMDHomeSharedUserCloudShareManager *__104__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID_logEventBuilder___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _shareForSharedUserDataWithHomeModelID:*(void *)(a1 + 40) logEventBuilder:*(void *)(a1 + 48)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __104__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID_logEventBuilder___block_invoke_2;
  v8[3] = &unk_264A2C028;
  v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 then:v8];
  if (v3)
  {
    id v4 = v3;

    return (HMDHomeSharedUserCloudShareManager *)3;
  }
  else
  {
    uint64_t v6 = _HMFPreconditionFailure();
    return __104__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID_logEventBuilder___block_invoke_2(v6, v7);
  }
}

HMDHomeSharedUserCloudShareManager *__104__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID_logEventBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = [*(id *)(a1 + 40) accountHandle];
  id v6 = [v4 grantAccessForUserWithAccountHandle:v5 share:v3 logEventBuilder:*(void *)(a1 + 48)];
  if (v6)
  {
    id v7 = v6;

    return (HMDHomeSharedUserCloudShareManager *)3;
  }
  else
  {
    id v9 = (HMDHomeSharedUserCloudShareManager *)_HMFPreconditionFailure();
    return [(HMDHomeSharedUserCloudShareManager *)v9 initWithContainer:v11 sharedStore:v12 privateStore:v13 moc:v14];
  }
}

- (HMDHomeSharedUserCloudShareManager)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[HMDCoreDataCloudShareService alloc] initWithContainer:v13 sharedStore:v12 privateStore:v11 moc:v10];

  id v15 = [(HMDHomeSharedUserCloudShareManager *)self initWithCloudShareService:v14];
  return v15;
}

- (HMDHomeSharedUserCloudShareManager)initWithCloudShareService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeSharedUserCloudShareManager;
  id v6 = [(HMDHomeSharedUserCloudShareManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareService, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22_245513 != -1) {
    dispatch_once(&logCategory__hmf_once_t22_245513, &__block_literal_global_131_245514);
  }
  v2 = (void *)logCategory__hmf_once_v23_245515;
  return v2;
}

void __49__HMDHomeSharedUserCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v23_245515;
  logCategory__hmf_once_v23_245515 = v0;
}

@end
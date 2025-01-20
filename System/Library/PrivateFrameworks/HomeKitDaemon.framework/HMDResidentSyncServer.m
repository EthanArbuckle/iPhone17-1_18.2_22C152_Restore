@interface HMDResidentSyncServer
- (HMDBufferingStructureDataFilter)_createResponseAdapterForRequest:(void *)a1 writer:(void *)a2 forceFullResponse:(unsigned char *)a3;
- (HMDRemoteAccountMessageDestination)_destinationForUser:(uint64_t)a3 restrictToResidentCapable:;
- (HMDResidentSyncServer)initWithHome:(id)a3 codingModel:(id)a4 dispatcher:(id)a5 residentDeviceManager:(id)a6 notificationCenter:(id)a7 persistence:(id)a8 dataSource:(id)a9 logEventSubmitter:(id)a10;
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)_generateHomeDataWithRequest:(void *)a3 message:(int)a4 useCachedToken:(void *)a5 error:;
- (id)decodeToken:(id)a3 error:(id *)a4;
- (id)start;
- (int64_t)currentToken:(id *)a3 andHistory:(id *)a4 fromToken:(id)a5 limit:(int64_t)a6 error:(id *)a7;
- (uint64_t)_currentToken:(void *)a3 andHistory:(void *)a4 fromToken:(uint64_t)a5 limit:(void *)a6 error:;
- (uint64_t)_parseRequestDetails:(void *)a3 fromDictionary:(void *)a4 message:;
- (void)_handleFetchHomeData:(id)a3;
- (void)_notifyDevicesOfHomeChangeWithToken:(void *)a3 changes:;
- (void)handlePersistentStoreChanged:(id)a3;
- (void)handlePrimaryResidentChanged:(id)a3;
- (void)handlePrimaryResidentState:(void *)a1;
- (void)handleReassertAsTheCurrentPrimaryResident:(id)a3;
- (void)interceptRemoteResidentRequest:(id)a3 proceed:(id)a4;
- (void)stop;
@end

@implementation HMDResidentSyncServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_storeExemplarToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_residentDeviceManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (id)decodeToken:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDResidentSyncServer;
  v7 = [(HMDResidentSyncController *)&v14 decodeToken:v6 error:a4];
  if (!v7) {
    goto LABEL_8;
  }
  if ([(NSPersistentHistoryToken *)self->_storeExemplarToken compareToken:v7 error:0])
  {
    id v8 = v7;
    goto LABEL_9;
  }
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Client-provided change token is incompatible with our store, ignoring it", buf, 0xCu);
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:3];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    id v8 = 0;
  }
LABEL_9:

  return v8;
}

- (void)handleReassertAsTheCurrentPrimaryResident:(id)a3
{
  id v3 = -[HMDResidentSyncServer handlePrimaryResidentState:](self, [(HMDResidentDeviceManager *)self->_residentDeviceManager isCurrentDevicePrimaryResident]);
}

- (void)handlePrimaryResidentState:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = a1[4];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__HMDResidentSyncServer_handlePrimaryResidentState___block_invoke;
    v5[3] = &unk_264A2D448;
    v5[4] = a1;
    char v6 = a2;
    a1 = [MEMORY[0x263F42538] inContext:v3 perform:v5];
    uint64_t v2 = vars8;
  }
  return a1;
}

uint64_t __52__HMDResidentSyncServer_handlePrimaryResidentState___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) persistentStoreCoordinator];
  uint64_t v3 = *MEMORY[0x263EFF0F8];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 40) removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263EFF0F8] object:v2];
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addObserver:*(void *)(a1 + 32) selector:sel_handlePersistentStoreChanged_ name:v3 object:v2];
    uint64_t v5 = *(void *)(a1 + 32);
    id v20 = 0;
    -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](v5, &v20, 0, 0, 0, 0);
    id v6 = v20;
    id v7 = v20;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v6);
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = HMFGetLogIdentifier();
      v12 = HMDShortDescriptionForToken(v7);
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      __int16 v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Became primary resident, will broadcast Home change notification with token %{public}@", buf, 0x16u);
    }
    -[HMDResidentSyncServer _notifyDevicesOfHomeChangeWithToken:changes:](*(id **)(a1 + 32), v7, 0);
    [*(id *)(*(void *)(a1 + 32) + 32) reset];
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990](v4);
    id v14 = *(id *)(a1 + 32);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Not acting as the primary resident", buf, 0xCu);
    }
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 96);
    *(void *)(v17 + 96) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  }

  return 1;
}

- (uint64_t)_currentToken:(void *)a3 andHistory:(void *)a4 fromToken:(uint64_t)a5 limit:(void *)a6 error:
{
  v55[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = v8;
  if (!a1)
  {
    uint64_t v37 = 0;
    goto LABEL_35;
  }
  unint64_t v47 = a5;
  if (v8) {
    BOOL v10 = a5 < 0;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = !v10;
  uint64_t v48 = *MEMORY[0x263F07F70];
  while (1)
  {
    v12 = [MEMORY[0x263EFF2F8] fetchHistoryAfterToken:v9];
    v13 = v12;
    uint64_t v14 = (v11 & 1) != 0 ? 5 : 3;
    [v12 setResultType:v14];
    v55[0] = *(void *)(a1 + 72);
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
    [v13 setAffectedStores:v15];

    v16 = [MEMORY[0x263EFF310] fetchRequest];
    uint64_t v17 = (void *)MEMORY[0x263F08A98];
    v18 = HMDWorkingContextNameForHomeUUID(*(void **)(a1 + 16));
    v19 = [v17 predicateWithFormat:@"%K == %@", @"contextName", v18];
    [v16 setPredicate:v19];

    if (v11)
    {
      if (v47) {
        [v13 setFetchBatchSize:v47];
      }
    }
    else
    {
      id v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:0];
      v54 = v20;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
      [v16 setSortDescriptors:v21];

      [v16 setFetchLimit:1];
      [v13 setFetchLimit:1];
    }
    [v13 setFetchRequest:v16];
    v22 = *(void **)(a1 + 32);
    id v49 = 0;
    __int16 v23 = [v22 executeRequest:v13 error:&v49];
    id v24 = v49;
    uint64_t v25 = v24;
    if (v23) {
      break;
    }
    if (!v9) {
      goto LABEL_28;
    }
    v26 = [v24 domain];
    if (([v26 isEqualToString:v48] & 1) == 0)
    {

LABEL_28:
      v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = (id)a1;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        __int16 v52 = 2114;
        unint64_t v53 = (unint64_t)v25;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch store history: %{public}@", buf, 0x16u);
      }
      if (a6)
      {
        HMDSanitizeCoreDataError(v25);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v32 = 0;
LABEL_33:
      uint64_t v37 = 0;
      goto LABEL_34;
    }
    uint64_t v27 = [v25 code];

    if (v27 != 134301) {
      goto LABEL_28;
    }
    v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = (id)a1;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v51 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Provided change token was expired, ignoring it", buf, 0xCu);
    }

    char v11 = 0;
    id v9 = 0;
  }
  id v32 = [v23 result];

  if (![v32 count])
  {
    if (v9)
    {
      uint64_t v37 = 1;
    }
    else
    {
      if (!a6)
      {
        id v9 = 0;
        goto LABEL_33;
      }
      [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:@"Unable to fetch current transaction" reason:0 suggestion:0];
      id v9 = 0;
      uint64_t v37 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_34;
  }
  if (a2)
  {
    if (v11) {
      [v32 lastObject];
    }
    else {
    v39 = [v32 firstObject];
    }
    *a2 = [v39 token];
    if ((v11 & 1) == 0)
    {

      goto LABEL_52;
    }
  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_52;
  }
  if (!v47 || [v32 count] <= v47)
  {
    if (a3)
    {
      id v32 = v32;
      *a3 = v32;
    }
    uint64_t v37 = 2;
    goto LABEL_34;
  }
  v40 = (void *)MEMORY[0x230FBD990]();
  id v41 = (id)a1;
  v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v43;
    __int16 v52 = 2048;
    unint64_t v53 = v47;
    _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Not processing history, would need to process more than %zd transactions", buf, 0x16u);
  }
LABEL_52:
  uint64_t v37 = 3;
LABEL_34:

LABEL_35:
  return v37;
}

- (void)_notifyDevicesOfHomeChangeWithToken:(void *)a3 changes:
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v61 = a3;
  if (!a1) {
    goto LABEL_42;
  }
  v65 = a1;
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    id v7 = [a1 encodeToken:v5 error:0];
    [v6 setObject:v7 forKeyedSubscript:@"etag"];
    [a1[8] primaryResidentGenerationID];
    v9 = id v8 = a1;
    BOOL v10 = [v9 UUIDString];
    [v6 setObject:v10 forKeyedSubscript:@"resgen"];

    char v11 = [v8[8] primaryResidentSelectionTimestamp];
    [v6 setObject:v11 forKeyedSubscript:@"seltimestamp"];

    if ([v6 count]) {
      v12 = (void *)[v6 copy];
    }
    else {
      v12 = 0;
    }

    a1 = v65;
  }
  else
  {
    v12 = 0;
  }
  id v13 = a1[2];
  id v14 = a1[4];
  id v72 = 0;
  v15 = +[_MKFModel modelWithModelID:v13 context:v14 error:&v72];
  id v16 = v72;
  if (!v15)
  {
    unint64_t v53 = (void *)MEMORY[0x230FBD990]();
    v54 = a1;
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v75 = v56;
      __int16 v76 = 2114;
      id v77 = v16;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home with error: %{public}@", buf, 0x16u);
    }
    goto LABEL_41;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v17 = v15;
  v18 = [v17 users];
  v19 = [v18 allObjects];
  id v20 = (void *)[v19 mutableCopy];

  v21 = [v17 guests];

  v22 = [v21 allObjects];
  [v20 addObjectsFromArray:v22];

  __int16 v23 = (void *)[v20 copy];
  uint64_t v67 = [v23 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (!v67) {
    goto LABEL_37;
  }
  id v57 = v16;
  v58 = v15;
  id v59 = v5;
  char v64 = 0;
  uint64_t v66 = *(void *)v69;
  id v24 = v61;
  uint64_t v25 = v65;
  v62 = v12;
  id obj = v23;
  do
  {
    for (uint64_t i = 0; i != v67; ++i)
    {
      if (*(void *)v69 != v66) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      if (v24)
      {
        id v28 = v27;
        id v29 = v24;
        id v30 = v17;
        if (!v28) {
          _HMFPreconditionFailure();
        }
        v31 = v30;
        id v32 = v17;
        v33 = [[HMDResidentSyncCodingContext alloc] initWithTargetUser:v28 targetIsResident:0 targetDeviceAddress:0];
        if ([v25[3] isRelevantChanges:v29 withRootObject:v31 conditions:0 userContext:v33])
        {
          id v34 = -[HMDResidentSyncServer _destinationForUser:restrictToResidentCapable:](v25, v28, 0);
          goto LABEL_30;
        }
        if ([v28 isOwner])
        {
          v35 = [[HMDResidentSyncCodingContext alloc] initWithTargetUser:v28 targetIsResident:1 targetDeviceAddress:0];
          if ([v25[3] isRelevantChanges:v29 withRootObject:v31 conditions:0 userContext:v35])
          {
            context = (void *)MEMORY[0x230FBD990]();
            v36 = v25;
            uint64_t v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              v38 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v75 = v38;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Broadcasting Home change notification to residents only", buf, 0xCu);

              id v24 = v61;
            }

            id v34 = -[HMDResidentSyncServer _destinationForUser:restrictToResidentCapable:](v36, v28, 1);

LABEL_29:
            v12 = v62;
            uint64_t v25 = v65;
LABEL_30:

            id v17 = v32;
            if (!v34) {
              goto LABEL_32;
            }
LABEL_31:
            v43 = [HMDRemoteMessage alloc];
            double v44 = HMDHomeDataChangedMessageTimeout();
            v45 = [v17 modelID];
            v46 = [v45 UUIDString];
            char v64 = 1;
            unint64_t v47 = [(HMDRemoteMessage *)v43 initWithName:@"HMDHomeDataChangedMessage" qualityOfService:-1 destination:v34 payload:v12 type:3 timeout:1 secure:v44 restriction:-1 sendOptions:1 collapseID:v46];

            uint64_t v25 = v65;
            [v65[7] sendMessage:v47];

            goto LABEL_32;
          }
        }
        v39 = (void *)MEMORY[0x230FBD990]();
        v40 = v25;
        id v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v75 = v42;
          __int16 v76 = 2112;
          id v77 = v28;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Skipping notifying user %@ of home change because it is not relevant", buf, 0x16u);

          id v24 = v61;
        }

        id v34 = 0;
        goto LABEL_29;
      }
      id v34 = -[HMDResidentSyncServer _destinationForUser:restrictToResidentCapable:](v25, v27, 0);
      if (v34) {
        goto LABEL_31;
      }
LABEL_32:
    }
    uint64_t v67 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
  }
  while (v67);

  v15 = v58;
  id v5 = v59;
  id v16 = v57;
  if ((v64 & 1) != 0 && isInternalBuild())
  {
    __int16 v23 = [MEMORY[0x263EFF9A0] dictionary];
    [v61 summary];
    v49 = uint64_t v48 = v25;
    [v23 setObject:v49 forKeyedSubscript:@"HMDGeneratedHomeDataChangedSummaryNotificationKey"];

    v50 = [v17 modelID];
    [v23 setObject:v50 forKeyedSubscript:@"HMDGeneratedHomeDataChangedHomeUUIDNotificationKey"];

    id v51 = v48[5];
    __int16 v52 = (void *)[v23 copy];
    logAndPostNotificationWithNotificationCenter(v51, @"HMDGeneratedHomeDataChangedNotification", v48, v52);

LABEL_37:
  }
LABEL_41:

LABEL_42:
}

- (HMDRemoteAccountMessageDestination)_destinationForUser:(uint64_t)a3 restrictToResidentCapable:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 accountHandle];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    id v8 = WeakRetained;
    if (WeakRetained && a3)
    {
      id v9 = [WeakRetained destinationForEnabledResidents];
      BOOL v10 = (void *)MEMORY[0x230FBD990]();
      char v11 = a1;
      v12 = HMFGetOSLogHandle();
      id v13 = v12;
      if (v9)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          int v23 = 138543362;
          id v24 = v14;
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Residents only broadcast of Home Data Changed notification is utilizing bulk send API", (uint8_t *)&v23, 0xCu);
        }
        goto LABEL_15;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v23 = 138543362;
        id v24 = v19;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bulk send destination invalid, residents only broadcast of Home Data Changed notification is falling back to account destination", (uint8_t *)&v23, 0xCu);
      }
    }
    id v20 = [HMDRemoteAccountMessageDestination alloc];
    v21 = [a1 messageTargetUUID];
    id v9 = [(HMDRemoteAccountMessageDestination *)v20 initWithTarget:v21 handle:v6 multicast:1];

    [(HMDRemoteAccountMessageDestination *)v9 setRestrictToResidentCapable:a3];
LABEL_15:

    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = a1;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    int v23 = 138543618;
    id v24 = v18;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Skipping notifying user %{public}@ of home change because the account handle is missing", (uint8_t *)&v23, 0x16u);
  }
  id v9 = 0;
LABEL_16:

  return v9;
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if ([v7 isCurrentDevice])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__HMDResidentSyncServer_handlePrimaryResidentChanged___block_invoke;
    v10[3] = &unk_264A2F3E8;
    v10[4] = self;
    [WeakRetained doFullImportWithCompletion:v10];
  }
  else
  {
    id v9 = -[HMDResidentSyncServer handlePrimaryResidentState:](self, [v7 isCurrentDevice]);
  }
}

void __54__HMDResidentSyncServer_handlePrimaryResidentChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 64) isCurrentDeviceConfirmedPrimaryResident])
  {
    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = *(id *)(a1 + 32);
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = HMFGetLogIdentifier();
        int v13 = 138543618;
        id v14 = v7;
        __int16 v15 = 2114;
        id v16 = v3;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Full import for home failed with error: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    id v8 = -[HMDResidentSyncServer handlePrimaryResidentState:](*(void **)(a1 + 32), 1);
    [*(id *)(*(void *)(a1 + 32) + 40) postNotificationName:@"HMDHomeDataReadyAfterBecomingPrimaryNotification" object:*(void *)(a1 + 32) userInfo:0];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@We are not the primary resident anymore.", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)handlePersistentStoreChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263EFF170]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [(NSPersistentStore *)self->_store identifier];
    int v10 = [v9 isEqualToString:v8];

    if (v10)
    {
      context = self->super._context;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __54__HMDResidentSyncServer_handlePersistentStoreChanged___block_invoke;
      v12[3] = &unk_264A2F820;
      v12[4] = self;
      id v13 = v4;
      [(HMDManagedObjectContext *)context performBlock:v12];
    }
  }
}

void __54__HMDResidentSyncServer_handlePersistentStoreChanged___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 88))
  {
    id v3 = *(id *)(v2 + 96);
    id v4 = [*(id *)(a1 + 40) userInfo];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFF098]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (!v7 || ([*(id *)(a1 + 32) changeToken:v7 isAheadOf:v3] & 1) != 0)
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 104) maximumTransactionsForStoreChange];
      uint64_t v9 = *(void *)(a1 + 32);
      id v48 = 0;
      id v49 = v7;
      uint64_t v10 = -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](v9, &v49, &v48, v3, v8, 0);
      id v11 = v49;
      id v12 = v49;

      id v13 = v48;
      if (!v10)
      {
LABEL_34:

        [*(id *)(*(void *)(a1 + 32) + 32) reset];
        return;
      }
      if (v10 == 1)
      {
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 32);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v51 = v17;
          v18 = "%{public}@Not broadcasting Home change notification, no new transactions.";
          v19 = v16;
          os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
          uint32_t v21 = 12;
LABEL_25:
          _os_log_impl(&dword_22F52A000, v19, v20, v18, buf, v21);

          goto LABEL_26;
        }
        goto LABEL_26;
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v11);
      if (([*(id *)(*(void *)(a1 + 32) + 64) isCurrentDeviceConfirmedPrimaryResident] & 1) == 0)
      {
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 32);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          uint64_t v39 = [v13 count];
          *(_DWORD *)buf = 138543618;
          id v51 = v17;
          __int16 v52 = 2048;
          uint64_t v53 = v39;
          v18 = "%{public}@Not broadcasting Home change notification, no longer the primary resident (processed %tu transactions)";
          v19 = v16;
          os_log_type_t v20 = OS_LOG_TYPE_INFO;
          uint32_t v21 = 22;
          goto LABEL_25;
        }
LABEL_26:

        goto LABEL_34;
      }
      if (v13)
      {
        v31 = [[HMDManagedObjectCodingChangeSet alloc] initWithCodingModel:*(void *)(*(void *)(a1 + 32) + 24) context:*(void *)(*(void *)(a1 + 32) + 32) transactions:v13];
        BOOL v32 = [(HMDManagedObjectCodingChangeSet *)v31 isEmpty];
        v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = *(id *)(a1 + 32);
        v35 = HMFGetOSLogHandle();
        v36 = v35;
        if (v32)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = HMFGetLogIdentifier();
            uint64_t v38 = [v13 count];
            *(_DWORD *)buf = 138543618;
            id v51 = v37;
            __int16 v52 = 2048;
            uint64_t v53 = v38;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Not broadcasting Home change notification, no syncable changes (processed %tu transactions)", buf, 0x16u);
          }
          goto LABEL_33;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v42 = unint64_t v47 = v33;
          uint64_t v45 = [v13 count];
          v43 = HMDShortDescriptionForToken(v12);
          v46 = [(HMDManagedObjectCodingChangeSet *)v31 summary];
          double v44 = [v46 shortDescriptionForChangeSet];
          *(_DWORD *)buf = 138544130;
          id v51 = v42;
          __int16 v52 = 2048;
          uint64_t v53 = v45;
          __int16 v54 = 2114;
          v55 = v43;
          __int16 v56 = 2114;
          id v57 = v44;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Found syncable changes (processed %tu transactions), will broadcast Home change notification with token %{public}@. Changes: %{public}@", buf, 0x2Au);

          v33 = v47;
        }
      }
      else
      {
        v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = *(id *)(a1 + 32);
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v40 = HMFGetLogIdentifier();
          id v41 = HMDShortDescriptionForToken(v12);
          *(_DWORD *)buf = 138543874;
          id v51 = v40;
          __int16 v52 = 2048;
          uint64_t v53 = v8;
          __int16 v54 = 2114;
          v55 = v41;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Assuming syncable changes (more than %tu transactions), will broadcast Home change notification with token %{public}@", buf, 0x20u);
        }
        v31 = 0;
      }

      -[HMDResidentSyncServer _notifyDevicesOfHomeChangeWithToken:changes:](*(id **)(a1 + 32), v12, v31);
LABEL_33:

      goto LABEL_34;
    }
    id v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = *(id *)(a1 + 32);
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v29 = HMFGetLogIdentifier();
      id v30 = HMDShortDescriptionForToken(v7);
      *(_DWORD *)buf = 138543618;
      id v51 = v29;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v30;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Not broadcasting Home change notification, provided token is not ahead: %@", buf, 0x16u);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 32);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v51 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring persistent store change, not the primary resident", buf, 0xCu);
    }
  }
}

- (int64_t)currentToken:(id *)a3 andHistory:(id *)a4 fromToken:(id)a5 limit:(int64_t)a6 error:(id *)a7
{
  id v12 = a5;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__166300;
  v40 = __Block_byref_object_dispose__166301;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__166300;
  id v34 = __Block_byref_object_dispose__166301;
  id v35 = 0;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__166300;
  id v28 = __Block_byref_object_dispose__166301;
  id v29 = 0;
  context = self->super._context;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__HMDResidentSyncServer_currentToken_andHistory_fromToken_limit_error___block_invoke;
  v17[3] = &unk_264A22F18;
  v19 = &v42;
  os_log_type_t v20 = &v36;
  v17[4] = self;
  uint32_t v21 = &v30;
  id v14 = v12;
  v22 = &v24;
  int64_t v23 = a6;
  id v18 = v14;
  [(HMDManagedObjectContext *)context performBlockAndWait:v17];
  if (a3) {
    *a3 = (id) v37[5];
  }
  if (a4) {
    *a4 = (id) v31[5];
  }
  if (a7) {
    *a7 = (id) v25[5];
  }
  int64_t v15 = v43[3];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v15;
}

void __71__HMDResidentSyncServer_currentToken_andHistory_fromToken_limit_error___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[7] + 8);
  id v3 = *(void **)(v2 + 40);
  uint64_t v4 = *(void *)(a1[8] + 8);
  id v11 = *(id *)(v4 + 40);
  id obj = v3;
  uint64_t v5 = a1[4];
  id v6 = (void *)a1[5];
  uint64_t v7 = a1[10];
  uint64_t v8 = *(void *)(a1[9] + 8);
  id v10 = *(id *)(v8 + 40);
  uint64_t v9 = -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](v5, &obj, &v11, v6, v7, &v10);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v4 + 40), v11);
  objc_storeStrong((id *)(v8 + 40), v10);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v9;
}

- (void)_handleFetchHomeData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  context = self->super._context;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDResidentSyncServer__handleFetchHomeData___block_invoke;
  v7[3] = &unk_264A2C148;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(HMDManagedObjectContext *)context performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__HMDResidentSyncServer__handleFetchHomeData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    v9[0] = 0;
    v9[1] = 0;
    id v10 = 0;
    id v3 = [v2 messagePayload];
    char v4 = -[HMDResidentSyncServer _parseRequestDetails:fromDictionary:message:]((uint64_t)WeakRetained, (uint64_t)v9, v3, v2);

    if (v4)
    {
      id v8 = 0;
      uint64_t v5 = -[HMDResidentSyncServer _generateHomeDataWithRequest:message:useCachedToken:error:]((uint64_t)WeakRetained, (uint64_t)v9, v2, 1, &v8);
      id v6 = v8;
      if (v5) {
        [v2 respondWithPayload:v5];
      }
      else {
        [v2 respondWithError:v6];
      }
    }
  }
}

- (uint64_t)_parseRequestDetails:(void *)a3 fromDictionary:(void *)a4 message:
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (!v7)
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = (id)a1;
      int64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = [v8 shortDescription];
        int v43 = 138543618;
        uint64_t v44 = v16;
        __int16 v45 = 2112;
        v46 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: missing resident sync details", (uint8_t *)&v43, 0x16u);
      }
      id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v8 respondWithError:v9];
      goto LABEL_24;
    }
    id v9 = [v7 objectForKeyedSubscript:@"schema"];
    if (!v9)
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x263F42670]) initWithMajorVersion:0 minorVersion:0 updateVersion:0];
      id v19 = *(id *)a2;
      *(void *)a2 = v18;

      *(void *)(a2 + 8) = 1;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:v9];
      if (v10)
      {
        id v11 = v10;
        objc_storeStrong((id *)a2, v10);
        id v12 = [v7 objectForKeyedSubscript:@"opts"];
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          *(void *)(a2 + 8) = [v12 unsignedIntegerValue];

LABEL_13:
          os_log_type_t v20 = objc_msgSend(v7, "hmf_dataForKey:", @"etag");
          if (v20)
          {
            uint64_t v21 = [(id)a1 decodeToken:v20 error:0];
            v22 = *(void **)(a2 + 16);
            *(void *)(a2 + 16) = v21;
          }
          else
          {
            v22 = *(void **)(a2 + 16);
            *(void *)(a2 + 16) = 0;
          }

          a1 = 1;
          goto LABEL_25;
        }
        uint64_t v37 = (void *)MEMORY[0x230FBD990]();
        id v38 = (id)a1;
        uint64_t v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = HMFGetLogIdentifier();
          id v41 = [v8 shortDescription];
          int v43 = 138543618;
          uint64_t v44 = v40;
          __int16 v45 = 2112;
          v46 = v41;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: invalid request options", (uint8_t *)&v43, 0x16u);
        }
        uint64_t v42 = [MEMORY[0x263F087E8] hmErrorWithCode:22];
        [v8 respondWithError:v42];

LABEL_24:
        a1 = 0;
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = (id)a1;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        id v34 = [v8 shortDescription];
        int v43 = 138543618;
        uint64_t v44 = v33;
        __int16 v45 = 2112;
        v46 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: invalid schema version", (uint8_t *)&v43, 0x16u);
      }
      id v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = 3;
    }
    else
    {
      int64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = (id)a1;
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        id v27 = [v8 shortDescription];
        int v43 = 138543618;
        uint64_t v44 = v26;
        __int16 v45 = 2112;
        v46 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: invalid schema version", (uint8_t *)&v43, 0x16u);
      }
      id v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = 22;
    }
    id v35 = [v28 hmErrorWithCode:v29];
    [v8 respondWithError:v35];

    goto LABEL_24;
  }
LABEL_26:

  return a1;
}

- (id)_generateHomeDataWithRequest:(void *)a3 message:(int)a4 useCachedToken:(void *)a5 error:
{
  v188[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (a1)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = *(id *)(a1 + 96);
    if (v12) {
      BOOL v13 = a4 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13 && ([(id)a1 changeToken:v12 isAheadOf:*(void *)(a2 + 16)] & 1) == 0)
    {
      int64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = (id)a1;
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v172 = (uint64_t)v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Provided token is up to date with cached token, home data not modified", buf, 0xCu);
      }
      v187 = @"response";
      v188[0] = &unk_26E4723D0;
      v22 = [NSDictionary dictionaryWithObjects:v188 forKeys:&v187 count:1];
      goto LABEL_111;
    }
    id v167 = 0;
    id v168 = 0;
    uint64_t v14 = -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](a1, &v168, &v167, *(void **)(a2 + 16), [*(id *)(a1 + 104) maximumTransactionsForSparseUpdate], a5);
    id v15 = v168;
    id v16 = v167;
    uint64_t v17 = v16;
    if (!v14)
    {
      v22 = 0;
LABEL_110:

LABEL_111:
      [*(id *)(a1 + 32) reset];
      goto LABEL_112;
    }
    if (v14 == 1)
    {
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = (id)a1;
      os_log_type_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v172 = (uint64_t)v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@No history transactions since the provided token, home data not modified", buf, 0xCu);
      }
      v185 = @"response";
      v186 = &unk_26E4723D0;
      v22 = [NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
      goto LABEL_110;
    }
    if (v16) {
      id v27 = [[HMDManagedObjectCodingChangeSet alloc] initWithCodingModel:*(void *)(a1 + 24) context:*(void *)(a1 + 32) transactions:v16];
    }
    else {
      id v27 = 0;
    }
    id v166 = 0;
    id v28 = [(id)a1 encodeToken:v15 error:&v166];
    id v29 = v166;
    id v30 = v29;
    if (!v28)
    {
      if (a5)
      {
        id v30 = v29;
        v22 = 0;
        *a5 = v30;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_109;
    }
    v158 = v28;
    v159 = v27;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v161 = v9;
    uint64_t v32 = [v9 userForHome:WeakRetained];

    v157 = v32;
    if ([v32 isRestrictedGuest])
    {
      v33 = [v161 remoteSourceDevice];
      if (v33)
      {
        id v150 = v15;
        v154 = v17;
        id v34 = v33;
        id v35 = [v33 version];
        uint64_t v36 = [[HMDHomeKitVersion alloc] initWithVersionString:@"12.0"];
        char v37 = [v35 isAtLeastVersion:v36];

        if (v37)
        {

          id v15 = v150;
          uint64_t v17 = v154;
          goto LABEL_24;
        }
        v149 = v34;
        v63 = (void *)MEMORY[0x230FBD990]();
        id v64 = (id)a1;
        v65 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v66 = HMFGetLogIdentifier();
          uint64_t v67 = [v34 version];
          *(_DWORD *)buf = 138544130;
          uint64_t v172 = (uint64_t)v66;
          __int16 v173 = 2112;
          uint64_t v174 = (uint64_t)v67;
          __int16 v175 = 2112;
          double v176 = *(double *)&v34;
          __int16 v177 = 2112;
          double v178 = *(double *)&v161;
          _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_DEBUG, "%{public}@Not sending home data to Restricted Guest with version: %@, device: %@, message: %@", buf, 0x2Au);
        }
        v183[0] = @"response";
        v183[1] = @"etag";
        id v28 = v158;
        v184[0] = &unk_26E4723D0;
        v184[1] = v158;
        v22 = [NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:2];
        id v15 = v150;
        uint64_t v17 = v154;
        id v27 = v159;
      }
      else
      {
        v149 = 0;
        id v57 = (void *)MEMORY[0x230FBD990]();
        id v58 = (id)a1;
        id v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          uint64_t v60 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v172 = v60;
          v156 = v57;
          id v61 = (void *)v60;
          __int16 v173 = 2112;
          uint64_t v174 = (uint64_t)v161;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine source device, not generating home data for message: %@", buf, 0x16u);

          id v57 = v156;
        }

        if (a5)
        {
          [MEMORY[0x263F087E8] hmErrorWithCode:2];
          v22 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        id v28 = v158;
        id v27 = v159;
      }
      int v43 = v157;

LABEL_108:
      id v9 = v161;
LABEL_109:

      goto LABEL_110;
    }
LABEL_24:
    id v27 = v159;
    if (v159 && [(HMDManagedObjectCodingChangeSet *)v159 isEmpty])
    {
      id v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = (id)a1;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v42 = id v41 = v17;
        *(_DWORD *)buf = 138543362;
        uint64_t v172 = (uint64_t)v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_DEBUG, "%{public}@No syncable changes since the provided token, home data not modified", buf, 0xCu);

        uint64_t v17 = v41;
      }

      v181[0] = @"response";
      v181[1] = @"etag";
      id v28 = v158;
      v182[0] = &unk_26E4723D0;
      v182[1] = v158;
      v22 = [NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:2];
      id v27 = v159;
      int v43 = v157;
      goto LABEL_108;
    }
    uint64_t v44 = *(void *)(a1 + 16);
    uint64_t v45 = *(void *)(a1 + 32);
    id v165 = v30;
    v46 = +[_MKFModel modelWithModelID:v44 context:v45 error:&v165];
    id v148 = v165;

    if (!v46)
    {
      v62 = 0;
      if (a5)
      {
        HMDSanitizeCoreDataError(v148);
        v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      int v43 = v157;
      goto LABEL_107;
    }
    v155 = v17;
    id v47 = v161;
    id v146 = v46;
    id v48 = objc_loadWeakRetained((id *)(a1 + 8));
    v143 = v47;
    id v49 = [v47 matchingRemoteIdentityUserForHome:v48];

    v139 = v46;
    v144 = v49;
    if (!v49)
    {
      long long v68 = (void *)MEMORY[0x230FBD990]();
      id v69 = (id)a1;
      long long v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        long long v71 = HMFGetLogIdentifier();
        [v143 shortDescription];
        id v72 = v151 = v15;
        *(_DWORD *)buf = 138543618;
        uint64_t v172 = (uint64_t)v71;
        __int16 v173 = 2112;
        uint64_t v174 = (uint64_t)v72;
        _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine remote user for '%@'", buf, 0x16u);

        id v15 = v151;
      }

      if (a5)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:10];
        v73 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v73 = 0;
      }
      uint64_t v17 = v155;
      id v28 = v158;
      id v27 = v159;
      v82 = v146;
LABEL_70:

      v145 = v73;
      if (!v73)
      {
        v62 = v139;
        v22 = 0;
        int v43 = v157;
LABEL_106:

LABEL_107:
        id v30 = v148;
        goto LABEL_108;
      }
      id v153 = v15;
      id v137 = objc_alloc_init(MEMORY[0x263EFF990]);
      v83 = +[HMDStructuredWriter writerIntoOPACKData:](HMDStructuredWriter, "writerIntoOPACKData:");
      char v164 = 0;
      v84 = *(void **)a2;
      v85 = [(id)a1 schemaVersion];
      uint64_t v86 = [v84 compare:v85];

      if (v86 == -1)
      {
        v89 = -[HMDResidentSyncServer _createResponseAdapterForRequest:writer:forceFullResponse:]((void **)a2, v83, &v164);
        if (v89 == v83)
        {
          v140 = v83;
        }
        else
        {
          v90 = (void *)MEMORY[0x230FBD990]();
          id v91 = (id)a1;
          v92 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v93 = v141 = v90;
            v94 = *(void **)a2;
            v95 = HMFBooleanToString();
            *(_DWORD *)buf = 138543874;
            uint64_t v172 = (uint64_t)v93;
            __int16 v173 = 2112;
            uint64_t v174 = (uint64_t)v94;
            __int16 v175 = 2112;
            double v176 = *(double *)&v95;
            _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_INFO, "%{public}@Using adapters for client version %@ (forceFullResponse=%@)", buf, 0x20u);

            v90 = v141;
          }

          id v96 = v89;

          v140 = v96;
          id v28 = v158;
          v82 = v146;
        }
        v88 = v139;

        id v27 = v159;
        v87 = v145;
      }
      else
      {
        v140 = v83;
        v87 = v145;
        v88 = v139;
      }
      if (v27)
      {
        v97 = [(HMDResidentSyncCodingContext *)v87 targetUser];
        v98 = [v97 databaseID];
        v99 = [v98 objectID];
        id v162 = 0;
        id v163 = 0;
        uint64_t v100 = [(HMDManagedObjectCodingChangeSet *)v27 changeScopeForObjectWithID:v99 attributeKeys:&v163 relationshipKeys:&v162];
        id v101 = v163;
        id v136 = v162;

        if (v100 == 3 || [v101 containsObject:@"privilege"])
        {
          v102 = (void *)MEMORY[0x230FBD990]();
          id v103 = (id)a1;
          v104 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            v105 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v172 = (uint64_t)v105;
            _os_log_impl(&dword_22F52A000, v104, OS_LOG_TYPE_INFO, "%{public}@Change includes user privilege. Forcing full update", buf, 0xCu);
          }
          char v164 = 1;
          v87 = v145;
        }

        id v28 = v158;
        id v27 = v159;
        v82 = v146;
      }
      v106 = [(HMDResidentSyncCodingContext *)v87 targetUser];
      int v107 = [v106 isRestrictedGuest];

      if (v107)
      {
        char v164 = 1;
        uint64_t v17 = v155;
      }
      else
      {
        uint64_t v17 = v155;
        if (!v164) {
          goto LABEL_91;
        }
      }

      id v27 = 0;
LABEL_91:
      id v15 = v153;
      if (([*(id *)(a1 + 24) encodeRootObject:v82 withWriter:v140 changes:v27 conditions:0 userContext:v87] & 1) == 0)
      {
        v62 = v88;
        if (a5)
        {
          [v140 error];
          v22 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        int v43 = v157;
        v125 = v137;
        goto LABEL_105;
      }
      uint64_t v108 = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      double v110 = v109 - v11;
      v111 = v27;
      v112 = (void *)MEMORY[0x230FBD990](v108);
      id v113 = (id)a1;
      v114 = HMFGetOSLogHandle();
      BOOL v115 = os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
      v160 = v111;
      v62 = v88;
      if (v111)
      {
        if (v115)
        {
          v116 = HMFGetLogIdentifier();
          uint64_t v117 = [v155 count];
          id v118 = v137;
          uint64_t v119 = [v137 length];
          [v143 shortDescription];
          v120 = v147 = v112;
          *(_DWORD *)buf = 138544386;
          uint64_t v172 = (uint64_t)v116;
          __int16 v173 = 2048;
          uint64_t v174 = v117;
          id v15 = v153;
          __int16 v175 = 2048;
          double v176 = *(double *)&v119;
          __int16 v177 = 2048;
          double v178 = v110;
          __int16 v179 = 2112;
          v180 = v120;
          _os_log_impl(&dword_22F52A000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@Generated sparse home data (%tu transactions, %tu bytes) in %.3lf seconds for %@", buf, 0x34u);

          v112 = v147;
          uint64_t v121 = 2;
LABEL_104:

          v169[0] = @"response";
          v126 = [NSNumber numberWithInteger:v121];
          v170[0] = v126;
          v170[1] = v118;
          v169[1] = @"data";
          v169[2] = @"etag";
          id v28 = v158;
          v170[2] = v158;
          v22 = [NSDictionary dictionaryWithObjects:v170 forKeys:v169 count:3];

          id v27 = v160;
          v125 = v118;
          uint64_t v17 = v155;
          int v43 = v157;
LABEL_105:

          goto LABEL_106;
        }
        uint64_t v121 = 2;
      }
      else
      {
        if (v115)
        {
          v122 = HMFGetLogIdentifier();
          id v118 = v137;
          uint64_t v123 = [v137 length];
          v124 = [v143 shortDescription];
          *(_DWORD *)buf = 138544130;
          uint64_t v172 = (uint64_t)v122;
          __int16 v173 = 2048;
          uint64_t v174 = v123;
          id v15 = v153;
          __int16 v175 = 2048;
          double v176 = v110;
          __int16 v177 = 2112;
          double v178 = *(double *)&v124;
          _os_log_impl(&dword_22F52A000, v114, OS_LOG_TYPE_DEFAULT, "%{public}@Generated full home data (%tu bytes) in %.3lf seconds for %@", buf, 0x2Au);

          uint64_t v121 = 1;
          goto LABEL_104;
        }
        uint64_t v121 = 1;
      }
      id v118 = v137;
      goto LABEL_104;
    }
    v50 = [v49 uuid];
    id v51 = *(void **)(a1 + 32);
    id v52 = v50;
    id v53 = v51;
    __int16 v54 = +[_MKFModel modelWithModelID:v52 context:v53];
    v55 = v54;
    if (v54)
    {
      id v56 = v54;
    }
    else
    {
      id v56 = +[_MKFModel modelWithModelID:v52 context:v53];
    }
    v74 = v56;

    v152 = v74;
    if (v74)
    {
      id v75 = [v74 home];
      if (v75 == v146)
      {
        char v76 = [v74 isResidentSyncParticipant];

        if (v76)
        {
          if (*(unsigned char *)(a2 + 8)) {
            uint64_t v77 = [v152 isOwner];
          }
          else {
            uint64_t v77 = 0;
          }
          v128 = [v143 remoteSourceDevice];
          v129 = [v128 deviceAddress];

          if (v129)
          {
            v73 = [[HMDResidentSyncCodingContext alloc] initWithTargetUser:v152 targetIsResident:v77 targetDeviceAddress:v129];
            uint64_t v17 = v155;
            id v28 = v158;
            v82 = v146;
          }
          else
          {
            v130 = (void *)MEMORY[0x230FBD990]();
            id v131 = (id)a1;
            v132 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v133 = v142 = v130;
              [v143 shortDescription];
              id v138 = v131;
              v135 = id v134 = v15;
              *(_DWORD *)buf = 138543618;
              uint64_t v172 = (uint64_t)v133;
              __int16 v173 = 2112;
              uint64_t v174 = (uint64_t)v135;
              _os_log_impl(&dword_22F52A000, v132, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine device address for '%@'", buf, 0x16u);

              id v15 = v134;
              id v131 = v138;

              v130 = v142;
            }

            uint64_t v17 = v155;
            v82 = v146;
            if (a5)
            {
              [MEMORY[0x263F087E8] hmErrorWithCode:10];
              v73 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v73 = 0;
            }
            id v28 = v158;
          }

          id v27 = v159;
          goto LABEL_67;
        }
      }
      else
      {
      }
    }
    uint64_t v78 = (void *)MEMORY[0x230FBD990]();
    id v79 = (id)a1;
    v80 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v81 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v172 = (uint64_t)v81;
      __int16 v173 = 2114;
      uint64_t v174 = (uint64_t)v144;
      _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_ERROR, "%{public}@Unable to find active MKFUser for %{public}@", buf, 0x16u);
    }
    if (a5)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:10];
      v73 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v73 = 0;
    }
    uint64_t v17 = v155;
    id v28 = v158;
    id v27 = v159;
    v82 = v146;
LABEL_67:

    goto LABEL_70;
  }
  v22 = 0;
LABEL_112:

  return v22;
}

- (HMDBufferingStructureDataFilter)_createResponseAdapterForRequest:(void *)a1 writer:(void *)a2 forceFullResponse:(unsigned char *)a3
{
  uint64_t v5 = a2;
  id v6 = *a1;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithMajorVersion:1 minorVersion:1 updateVersion:0];
  uint64_t v8 = [v6 compare:v7];

  if (v8 == -1)
  {
    if (a3) {
      *a3 = 1;
    }
    id v9 = v5;
    uint64_t v5 = [[HMDBufferingStructureDataFilter alloc] initWithUnderlyingWriter:v9 block:&__block_literal_global_15846];
  }
  double v10 = v5;

  return v10;
}

- (void)interceptRemoteResidentRequest:(id)a3 proceed:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v27 = 0;
  uint64_t v28 = 0;
  id v29 = 0;
  uint64_t v8 = [v6 dictionaryForKey:@"$HMDRS$"];
  char v9 = -[HMDResidentSyncServer _parseRequestDetails:fromDictionary:message:]((uint64_t)self, (uint64_t)&v27, v8, v6);

  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
    char v11 = [WeakRetained isCurrentDeviceConfirmedPrimaryResident];

    id v12 = (void *)MEMORY[0x230FBD990]();
    BOOL v13 = self;
    if (v11)
    {
      HMFGetOSLogHandle();
      uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v16 = [v6 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v31 = v15;
        __int16 v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Intercepting remote resident request: %@", buf, 0x16u);
      }
      uint64_t v17 = (void *)[v6 mutableCopy];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3254779904;
      v21[2] = __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke;
      v21[3] = &unk_26E2E48C8;
      id v22 = v6;
      int64_t v23 = v13;
      id v24 = v27;
      uint64_t v25 = v28;
      id v26 = v29;
      [v17 setResponseHandler:v21];
      v7[2](v7, v17);
    }
    else
    {
      HMFGetOSLogHandle();
      uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        os_log_type_t v20 = [v6 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v31 = v19;
        __int16 v32 = 2112;
        v33 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Rejecting resident request %@: not the primary resident", buf, 0x16u);
      }
      uint64_t v17 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3202];
      [v6 respondWithError:v17];
    }
  }
}

void __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v5)
  {
    [*(id *)(a1 + 32) respondWithError:v5];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F42538];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(v9 + 32);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3254779904;
    uint64_t v17 = __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke_2;
    uint64_t v18 = &unk_26E2E4890;
    uint64_t v19 = v9;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    BOOL v13 = *(void **)(a1 + 64);
    id v22 = v11;
    uint64_t v23 = v12;
    id v24 = v13;
    id v20 = *(id *)(a1 + 32);
    id v21 = v6;
    uint64_t v14 = [v8 inContext:v10 perform:&v15];
    objc_msgSend(v7, "respondWithOutcomeOf:", v14, v15, v16, v17, v18, v19);
  }
}

uint64_t __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke_2(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t)(a1 + 7);
  uint64_t v3 = (uint64_t)a1[4];
  id v4 = a1[5];
  id v22 = 0;
  id v5 = -[HMDResidentSyncServer _generateHomeDataWithRequest:message:useCachedToken:error:](v3, v2, v4, 0, &v22);
  id v6 = v22;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1[4];
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543618;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Responding to intercepted remote resident request: %@", buf, 0x16u);
    }
    BOOL v13 = (void *)[a1[6] mutableCopy];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v19 = v15;

    [v19 setObject:v5 forKeyedSubscript:@"$HMDRS$"];
    [v19 copy];
    uint64_t v20 = 1;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543874;
      id v24 = v16;
      __int16 v25 = 2114;
      id v26 = v17;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Home data changes for successfully handled message '%{public}@': %{public}@", buf, 0x20u);
    }
    id v18 = v6;
    if (v18)
    {
      id v19 = v18;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
      id v19 = 0;
    }
    uint64_t v20 = 2;
  }

  return v20;
}

- (void)stop
{
  [(HMFMessageDispatcher *)self->_dispatcher deregisterReceiver:self];
  notificationCenter = self->super._notificationCenter;
  [(NSNotificationCenter *)notificationCenter removeObserver:self];
}

- (id)start
{
  v16[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
  id v4 = +[HMDUserMessagePolicy userMessagePolicyWithHome:WeakRetained userPrivilege:5 remoteAccessRequired:0];

  id v5 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v5, "setRoles:", objc_msgSend(v5, "roles") | 8);
  id v6 = (void *)[v5 copy];
  dispatcher = self->_dispatcher;
  v16[0] = v4;
  v16[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [(HMFMessageDispatcher *)dispatcher registerForMessage:@"HMDFetchHomeDataMessage" receiver:self policies:v8 selector:sel__handleFetchHomeData_];

  if (shouldEnableInternalDebugInterfaces__hmf_once_t31 != -1) {
    dispatch_once(&shouldEnableInternalDebugInterfaces__hmf_once_t31, &__block_literal_global_867);
  }
  if (shouldEnableInternalDebugInterfaces__hmf_once_v32)
  {
    uint64_t v9 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    uint64_t v10 = self->_dispatcher;
    id v11 = [@"HMDFetchHomeDataMessage" stringByAppendingString:@".Debug"];
    id v15 = v9;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    [(HMFMessageDispatcher *)v10 registerForMessage:v11 receiver:self policies:v12 selector:sel__handleFetchHomeData_];
  }
  [(NSNotificationCenter *)self->super._notificationCenter addObserver:self selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:self->_residentDeviceManager];
  [(NSNotificationCenter *)self->super._notificationCenter addObserver:self selector:sel_handleReassertAsTheCurrentPrimaryResident_ name:@"HMDResidentDeviceManagerReassertAsCurrentPrimaryNotification" object:self->_residentDeviceManager];
  BOOL v13 = -[HMDResidentSyncServer handlePrimaryResidentState:](self, [(HMDResidentDeviceManager *)self->_residentDeviceManager isCurrentDeviceConfirmedPrimaryResident]);

  return v13;
}

- (HMDResidentSyncServer)initWithHome:(id)a3 codingModel:(id)a4 dispatcher:(id)a5 residentDeviceManager:(id)a6 notificationCenter:(id)a7 persistence:(id)a8 dataSource:(id)a9 logEventSubmitter:(id)a10
{
  v35[1] = *MEMORY[0x263EF8340];
  id v31 = a5;
  id v30 = a6;
  id v17 = a8;
  id v29 = a9;
  id v18 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDResidentSyncServer;
  id v19 = [(HMDResidentSyncController *)&v34 initWithHome:a3 codingModel:a4 notificationCenter:a7 persistence:v17];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dispatcher, a5);
    objc_storeStrong((id *)&v20->_residentDeviceManager, a6);
    uint64_t v21 = objc_msgSend(v17, "workingStore", v29, v30, v31);
    store = v20->_store;
    v20->_store = (NSPersistentStore *)v21;

    uint64_t v23 = [v17 coordinator];
    v35[0] = v20->_store;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    uint64_t v25 = [v23 currentPersistentHistoryTokenFromStores:v24];
    storeExemplarToken = v20->_storeExemplarToken;
    v20->_storeExemplarToken = (NSPersistentHistoryToken *)v25;

    objc_storeStrong((id *)&v20->_logEventSubmitter, a10);
    objc_storeStrong((id *)&v20->_dataSource, a9);
    context = v20->super._context;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __143__HMDResidentSyncServer_initWithHome_codingModel_dispatcher_residentDeviceManager_notificationCenter_persistence_dataSource_logEventSubmitter___block_invoke;
    v32[3] = &unk_264A2F7F8;
    v33 = v20;
    [(HMDManagedObjectContext *)context performBlockAndWait:v32];
  }
  return v20;
}

void __143__HMDResidentSyncServer_initWithHome_codingModel_dispatcher_residentDeviceManager_notificationCenter_persistence_dataSource_logEventSubmitter___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
  id v7 = 0;
  char v3 = [v1 setQueryGenerationFromToken:v2 error:&v7];
  id v4 = v7;

  if (v3)
  {
  }
  else
  {
    id v5 = (HMDResidentSyncController *)_HMFPreconditionFailureWithFormat();
    [(HMDResidentSyncController *)v5 .cxx_destruct];
  }
}

@end
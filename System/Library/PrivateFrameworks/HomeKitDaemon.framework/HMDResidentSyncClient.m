@interface HMDResidentSyncClient
- (HMDResidentSyncClient)initWithHome:(id)a3 codingModel:(id)a4 dispatcher:(id)a5 residentDeviceManager:(id)a6 notificationCenter:(id)a7 persistence:(id)a8 isResidentCapable:(BOOL)a9 dataSource:(id)a10 logEventSubmitter:(id)a11;
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)_performFetchIfRequired;
- (id)_performFetchWithReason:(uint64_t)a1;
- (id)_performMaybeDelayedFetchWithReason:(uint64_t)a1;
- (id)retryTimer;
- (id)start;
- (uint64_t)_applyAndSaveHomeDataChanges:(void *)a3 forRequest:(void *)a4 previousLastSeenToken:(void *)a5 versionChecksum:(void *)a6 error:;
- (uint64_t)_fetchOrCreateMetadataWithError:(uint64_t)result;
- (unsigned)_syncDetailsWithChangeToken:(unsigned __int8 *)a1;
- (void)_handleHomeDataChanged:(id)a3;
- (void)handlePrimaryResidentChanged:(id)a3;
- (void)performResidentRequest:(id)a3 options:(unint64_t)a4;
- (void)performSync;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentSyncClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_performFetchJitterPromise, 0);
  objc_storeStrong((id *)&self->_performFetchJitterFuture, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_requestsInProgress, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_residentDeviceManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)_handleHomeDataChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  context = self->super._context;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDResidentSyncClient__handleHomeDataChanged___block_invoke;
  v7[3] = &unk_264A2C148;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(HMDManagedObjectContext *)context performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__HMDResidentSyncClient__handleHomeDataChanged___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    [v2 respondWithSuccess];
    v3 = [v2 remoteSourceDevice];
    if (!v3)
    {
      v22 = (void *)MEMORY[0x230FBD990]();
      v23 = WeakRetained;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Ignoring home data changed message, unable to determine source device", buf, 0xCu);
      }
      goto LABEL_25;
    }
    id v4 = [v2 dataForKey:@"etag"];
    v5 = [v2 uuidForKey:@"resgen"];
    id v6 = [v2 dateForKey:@"seltimestamp"];
    if (!v4) {
      goto LABEL_13;
    }
    v7 = [WeakRetained decodeToken:v4 error:0];
    if (v7)
    {
      id v8 = [WeakRetained[12] lastSeenToken];
      char v9 = [WeakRetained changeToken:v7 isAheadOf:v8];

      context = (void *)MEMORY[0x230FBD990]();
      v10 = WeakRetained;
      v11 = HMFGetOSLogHandle();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v12)
        {
          v13 = HMFGetLogIdentifier();
          v14 = HMDShortDescriptionForToken(v7);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Home data on resident has changed, saving last seen change token: %{public}@", buf, 0x16u);
        }
        [v10[12] setLastSeenToken:v7];
        id v15 = v10[4];
        id v39 = 0;
        char v16 = [v15 save:&v39];
        id v17 = v39;
        if ((v16 & 1) == 0)
        {
          contexta = (void *)MEMORY[0x230FBD990]();
          v18 = v10;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v17;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to save last seen change token, proceeding anyway: %{public}@", buf, 0x16u);
          }
        }
        [v10[12] willAccessValueForKey:0];
        [v10[4] setQueryGenerationFromToken:0 error:0];
        *((unsigned char *)v10 + 128) = 0;
        [v10[13] suspend];

LABEL_13:
        v20 = [WeakRetained[8] foundNewPrimaryResident:v3 generationID:v5 selectionTimestamp:v6 changeSource:3];
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __49__HMDResidentSyncClient___handleHomeDataChanged___block_invoke;
        v41 = &unk_264A2EC28;
        v42 = WeakRetained;
        id v43 = v3;
        id v21 = (id)[v20 then:buf];

LABEL_24:
LABEL_25:

        goto LABEL_26;
      }
      if (v12)
      {
        v30 = HMFGetLogIdentifier();
        HMDShortDescriptionForToken(v7);
        v31 = v35 = v6;
        v33 = [v10[12] lastSeenToken];
        v32 = HMDShortDescriptionForToken(v33);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2114;
        v41 = v32;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring home data changed message, incoming change token %{public}@ is not ahead of last seen token %{public}@", buf, 0x20u);

        id v6 = v35;
      }

      [v10[8] sawGenerationID:v5 forDevice:v3];
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      v27 = WeakRetained;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Ignoring home data changed message, failed to decode change token", buf, 0xCu);
      }
    }

    goto LABEL_24;
  }
LABEL_26:
}

uint64_t __49__HMDResidentSyncClient___handleHomeDataChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 unsignedIntValue];
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 32);
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        BOOL v12 = HMFGetLogIdentifier();
        v13 = [*(id *)(a1 + 40) shortDescription];
        int v15 = 138543618;
        char v16 = v12;
        __int16 v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resident Device Manager asked to ignore the home data changed message from: %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      if (v4 != 2)
      {
LABEL_11:
        uint64_t v11 = 1;
        goto LABEL_12;
      }
      v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 32);
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v15 = 138543362;
        char v16 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident is changing, will fetch once we're notified that it changed", (uint8_t *)&v15, 0xCu);
      }
    }

    goto LABEL_11;
  }
  -[HMDResidentSyncClient _performMaybeDelayedFetchWithReason:](*(void *)(a1 + 32), @"received home data changed notification");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    _HMFPreconditionFailure();
  }
  v10 = v9;
  uint64_t v11 = 3;

LABEL_12:
  return v11;
}

- (id)_performMaybeDelayedFetchWithReason:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1)
  {
    id v11 = 0;
    goto LABEL_13;
  }
  if (!*(unsigned char *)(a1 + 80))
  {
    -[HMDResidentSyncClient _performFetchWithReason:](a1, v3);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    id v11 = v12;
    goto LABEL_13;
  }
  int v4 = [*(id *)(a1 + 88) anyObject];

  if (v4)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = (id)a1;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Eliding delayed home data fetch because there are requests in progress", buf, 0xCu);
    }
    id v9 = (void *)MEMORY[0x263F42538];
    v10 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
    id v11 = [v9 futureWithError:v10];

    goto LABEL_13;
  }
  if (*(void *)(a1 + 112))
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = (id *)(id)a1;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      __int16 v32 = 2114;
      id v33 = v3;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Waiting for existing delayed fetch (reason: %{public}@)", buf, 0x16u);
    }
    id v12 = v14[14];
    goto LABEL_12;
  }
  uint64_t v18 = arc4random_uniform(0xAu) + 5;
  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  v20 = (id *)(id)a1;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v22;
    __int16 v32 = 1024;
    LODWORD(v33) = v18;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Delaying home data fetch for %u seconds", buf, 0x12u);
  }
  v23 = [MEMORY[0x263F42538] futureWithPromise:v20 + 15];
  objc_storeStrong(v20 + 14, v23);
  id v24 = v20[9];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke;
  v27[3] = &unk_264A2F2F8;
  v27[4] = v20;
  id v25 = v23;
  id v28 = v25;
  id v29 = v3;
  [v24 performWithDelay:v18 block:v27];
  v26 = v29;
  id v11 = v25;

LABEL_13:
  return v11;
}

- (id)_performFetchWithReason:(uint64_t)a1
{
  v52[1] = *(id *)MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    int v4 = *(void **)(a1 + 112);
    if (v4)
    {
      *(void *)(a1 + 112) = 0;
    }
    id v41 = v3;
    id v42 = v3;
    *(unsigned char *)(a1 + 128) = 0;
    [*(id *)(a1 + 104) suspend];
    v5 = [*(id *)(a1 + 88) anyObject];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = (id)a1;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Eliding home data fetch because there are requests in progress", buf, 0xCu);
      }
      v10 = (void *)MEMORY[0x263F42538];
      id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:15];
      id v12 = [v10 futureWithError:v11];
    }
    else
    {
      v13 = [*(id *)(a1 + 32) persistentStoreCoordinator];
      v14 = [v13 managedObjectModel];
      int v15 = [v14 versionChecksum];

      char v16 = [*(id *)(a1 + 96) lastSyncChecksum];
      int v17 = HMFEqualObjects();

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = (void *)MEMORY[0x230FBD990]();
        uint64_t v19 = (id *)(id)a1;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          v22 = [v19[12] lastSyncChecksum];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2114;
          v48 = v22;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Database checksums don't match, forcing a full sync: %{public}@ != %{public}@", buf, 0x20u);
        }
      }
      v23 = [*(id *)(a1 + 96) lastSeenToken];
      if (v17)
      {
        id v24 = [*(id *)(a1 + 96) lastSyncToken];
      }
      else
      {
        id v24 = 0;
      }
      id v39 = v24;
      v40 = -[HMDResidentSyncClient _syncDetailsWithChangeToken:]((unsigned __int8 *)a1, v24);
      id v25 = (void *)MEMORY[0x230FBD990]();
      v26 = (id *)(id)a1;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v42;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching home data with reason: %{public}@", buf, 0x16u);
      }
      id v29 = [[HMDRemoteHomeMessageDestination alloc] initWithTarget:v26[2] homeUUID:v26[2]];
      v30 = +[HMDRemoteMessage secureMessageWithName:@"HMDFetchHomeDataMessage" destination:v29 messagePayload:v40];
      [v26[11] addObject:v30];
      objc_initWeak(&location, v26);
      v31 = [v26[7] sendMessageExpectingResponse:v30];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke;
      v48 = &unk_264A22EC8;
      objc_copyWeak(v52, &location);
      id v32 = v30;
      id v49 = v32;
      id v33 = v23;
      id v50 = v33;
      id v11 = v15;
      id v51 = v11;
      uint64_t v34 = [v31 then:buf];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke_2;
      v43[3] = &unk_264A22EF0;
      objc_copyWeak(&v45, &location);
      id v35 = v32;
      id v44 = v35;
      id v12 = [v34 recover:v43];

      objc_destroyWeak(&v45);
      objc_destroyWeak(v52);

      objc_destroyWeak(&location);
    }

    v36 = *(void **)(a1 + 120);
    if (v36)
    {
      [v36 resolveWithFuture:v12];
      v37 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = 0;
    }
    id v3 = v41;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke_2;
  v4[3] = &unk_264A2F2F8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 performBlock:v4];
}

void __61__HMDResidentSyncClient__performMaybeDelayedFetchWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  int v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Jitter timer fired", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 112) == *(void *)(a1 + 40))
  {
    id v11 = -[HMDResidentSyncClient _performFetchWithReason:](v6, *(void **)(a1 + 48));
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@The future changed, not fetching", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (unsigned)_syncDetailsWithChangeToken:(unsigned __int8 *)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = a1[80];
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v6 = [a1 schemaVersion];
    id v7 = [v6 versionString];
    [v5 setObject:v7 forKeyedSubscript:@"schema"];

    if (v4)
    {
      id v8 = [NSNumber numberWithUnsignedInteger:1];
      [v5 setObject:v8 forKeyedSubscript:@"opts"];

      if (v3)
      {
LABEL_4:
        id v9 = [a1 encodeToken:v3 error:0];
        [v5 setObject:v9 forKeyedSubscript:@"etag"];

LABEL_7:
        a1 = (unsigned __int8 *)[v5 copy];

        goto LABEL_8;
      }
    }
    else
    {
      [v5 setObject:0 forKeyedSubscript:@"opts"];
      if (v3) {
        goto LABEL_4;
      }
    }
    [v5 setObject:0 forKeyedSubscript:@"etag"];
    goto LABEL_7;
  }
LABEL_8:

  return a1;
}

uint64_t __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 1);
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 homeManager];
      id v9 = [v7 uuid];
      v10 = [v8 sharedUserAcceptEventBuilderForHomeUuid:v9];
    }
    else
    {
      v10 = 0;
    }
    int v12 = *(void **)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void **)(a1 + 48);
    id v22 = 0;
    char v15 = -[HMDResidentSyncClient _applyAndSaveHomeDataChanges:forRequest:previousLastSeenToken:versionChecksum:error:](v5, v3, v12, v13, v14, &v22);
    id v16 = v22;
    if (v15)
    {
      [v10 markResidentSyncEnd];
      [v5[11] removeObject:*(void *)(a1 + 32)];
      [v5[13] reset];
      v5[17] = 0;
      id v17 = -[HMDResidentSyncClient _performFetchIfRequired](v5);
      uint64_t v11 = 1;
    }
    else
    {
      [v10 markError:v16];
      id v18 = v16;
      uint64_t v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        [MEMORY[0x263F087E8] hmfUnspecifiedError];
        objc_claimAutoreleasedReturnValue();
      }

      uint64_t v11 = 2;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

uint64_t __55__HMDResidentSyncClient__reallyPerformFetchWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v18 = 1;
    goto LABEL_16;
  }
  [*((id *)WeakRetained + 11) removeObject:*(void *)(a1 + 32)];
  if ([v3 isHMError] && objc_msgSend(v3, "code") == 10)
  {
    uint64_t v6 = v5[17];
    v5[17] = v6 + 1;
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6 >= 4)
    {
      if (v10)
      {
        uint64_t v11 = HMFGetLogIdentifier();
        uint64_t v12 = v8[17];
        int v23 = 138543874;
        id v24 = v11;
        __int16 v25 = 2048;
        uint64_t v26 = v12;
        __int16 v27 = 2114;
        id v28 = v3;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home data %ld time(s) with error: %{public}@. Giving up.", (uint8_t *)&v23, 0x20u);
      }
      *((unsigned char *)v8 + 128) = 0;
      [(id)v8[13] suspend];
      goto LABEL_11;
    }
    if (v10)
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = v8[17];
      [(id)v8[13] timeInterval];
      int v23 = 138544130;
      id v24 = v20;
      __int16 v25 = 2048;
      uint64_t v26 = v21;
      __int16 v27 = 2114;
      id v28 = v3;
      __int16 v29 = 2048;
      uint64_t v30 = v22;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home data %ld time(s) with error: %{public}@ (will retry in %.0lf seconds)", (uint8_t *)&v23, 0x2Au);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      [(id)v8[13] timeInterval];
      int v23 = 138543874;
      id v24 = v13;
      __int16 v25 = 2048;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      id v28 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home data (will retry in %.0lf seconds): %{public}@", (uint8_t *)&v23, 0x20u);
    }
  }

  *((unsigned char *)v8 + 128) = 1;
  [(id)v8[13] resume];
LABEL_11:
  id v15 = v3;
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  uint64_t v18 = 2;
LABEL_16:

  return v18;
}

- (uint64_t)_applyAndSaveHomeDataChanges:(void *)a3 forRequest:(void *)a4 previousLastSeenToken:(void *)a5 versionChecksum:(void *)a6 error:
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  v13 = a5;
  if (!a1)
  {
    uint64_t v26 = 0;
    goto LABEL_123;
  }
  uint64_t v14 = [v10 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (!v16)
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = a1;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = id v24 = v13;
      *(_DWORD *)buf = 138543362;
      v182 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, missing response type", buf, 0xCu);

      v13 = v24;
    }

    if (a6)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      uint64_t v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v26 = 0;
    }
    goto LABEL_122;
  }
  id v176 = v12;
  uint64_t v175 = [objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.resident-sync"];
  id v17 = [v10 objectForKeyedSubscript:@"etag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    id v20 = [a1 decodeToken:v19 error:0];
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v27 = [(__CFString *)v16 integerValue];
  v177 = v11;
  if ((unint64_t)(v27 - 1) >= 2)
  {
    if (v27)
    {
      id v172 = v10;
      uint64_t v31 = v20;
      id v67 = v19;
      v68 = (void *)MEMORY[0x230FBD990]();
      v69 = a1;
      v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v72 = v71 = v13;
        *(_DWORD *)buf = 138543618;
        v182 = v72;
        __int16 v183 = 2114;
        v184 = v16;
        _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, invalid response type: %{public}@", buf, 0x16u);

        v13 = v71;
      }

      id v39 = (void *)v175;
      if (a6)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        uint64_t v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v26 = 0;
      }
      id v19 = v67;
      goto LABEL_63;
    }
    v174 = 0;
    goto LABEL_29;
  }
  id v28 = [v10 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v29 = v28;
  }
  else {
    __int16 v29 = 0;
  }
  id v30 = v29;
  v174 = v28;

  if (v30)
  {
    if (!v20)
    {
      id v172 = v10;
      uint64_t v31 = 0;
      id v32 = v16;
      id v33 = v19;
      uint64_t v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = a1;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = v37 = v13;
        *(_DWORD *)buf = 138543362;
        v182 = v38;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, missing change token", buf, 0xCu);

        v13 = v37;
      }

      id v39 = (void *)v175;
      if (a6)
      {
        *a6 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      }

LABEL_55:
      uint64_t v26 = 0;
      goto LABEL_56;
    }
LABEL_29:
    v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
    if (!a1[12] && (-[HMDResidentSyncClient _fetchOrCreateMetadataWithError:]((uint64_t)a1, a6) & 1) == 0)
    {

      uint64_t v26 = 0;
LABEL_120:
      id v39 = (void *)v175;
      goto LABEL_121;
    }
    id v41 = a1[4];
    id v42 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
    [v41 setQueryGenerationFromToken:v42 error:0];

    v170 = [a1[12] home];
    id v171 = v19;
    if (!v170)
    {
      v78 = (void *)MEMORY[0x230FBD990]();
      v79 = a1;
      v80 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v81 = v169 = v13;
        [v177 shortDescription];
        id v82 = v10;
        v83 = v20;
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v81;
        __int16 v183 = 2114;
        v184 = v84;
        _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_ERROR, "%{public}@Unable to apply home data for %{public}@, home has been removed", buf, 0x16u);

        id v20 = v83;
        id v10 = v82;

        v13 = v169;
      }

      if (a6)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:2];
        uint64_t v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v26 = 0;
      }
      goto LABEL_118;
    }
    id v43 = [MEMORY[0x263EFF910] now];
    [a1[12] setLastSyncTimestamp:v43];

    v167 = v20;
    v168 = v13;
    if (v20)
    {
      id v44 = [a1[12] lastSyncToken];
      char v45 = [a1 changeToken:v20 isAheadOf:v44];

      if (v45)
      {
        v46 = (void *)MEMORY[0x230FBD990]([a1[12] setLastSyncToken:v20]);
        v165 = a1;
        v47 = HMFGetOSLogHandle();
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
        if (!v174)
        {
          if (v48)
          {
            v127 = HMFGetLogIdentifier();
            [v177 shortDescription];
            v128 = v13;
            v129 = (__CFString *)objc_claimAutoreleasedReturnValue();
            HMDShortDescriptionForToken(v20);
            id v130 = v10;
            v132 = v131 = v20;
            *(_DWORD *)buf = 138543874;
            v182 = v127;
            __int16 v183 = 2112;
            v184 = v129;
            __int16 v185 = 2114;
            uint64_t v186 = (uint64_t)v132;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Applying last sync token update only for %@ with change token %{public}@", buf, 0x20u);

            v13 = v128;
            v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;

            id v20 = v131;
            id v10 = v130;

            id v19 = v171;
          }

          goto LABEL_72;
        }
        id v173 = v10;
        if (v48)
        {
          id v49 = HMFGetLogIdentifier();
          id v50 = [v177 shortDescription];
          HMDShortDescriptionForToken(v20);
          v52 = id v51 = v20;
          *(_DWORD *)buf = 138543874;
          v182 = v49;
          __int16 v183 = 2112;
          v184 = v50;
          __int16 v185 = 2114;
          uint64_t v186 = (uint64_t)v52;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Applying home data changes for %@ with change token %{public}@", buf, 0x20u);

          id v20 = v51;
          id v10 = v173;
        }
        uint64_t v161 = [(__CFString *)v16 integerValue];
        id v53 = v174;
        id v54 = v10;
        v55 = [v54 objectForKeyedSubscript:@"kRemoteMessageTransportAttributionKey"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v56 = v55;
        }
        else {
          v56 = 0;
        }
        v57 = v56;

        v159 = v54;
        v163 = v57;
        if (v57)
        {
          unsigned int v58 = [(__CFString *)v57 integerValue];
          if (v58 <= 6)
          {
            if (((1 << v58) & 0x3A) != 0)
            {
              v59 = v53;
              v60 = (void *)MEMORY[0x230FBD990]();
              v61 = v165;
              v62 = v165;
              v63 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v65 = v64 = v20;
                v66 = @"Unknown";
                *(_DWORD *)buf = 138543618;
                v182 = v65;
                __int16 v183 = 2114;
                v184 = @"Unknown";
                _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Unexpected transport type: %{public}@, not generating log event", buf, 0x16u);

                v61 = v165;
                id v20 = v64;
                id v10 = v173;
              }

LABEL_111:

              v148 = +[HMDStructuredReader readerFromOPACKData:v59];
              if ([v61[3] updateRootObject:v170 fromReader:v148])
              {

                v13 = v168;
                goto LABEL_71;
              }
              v149 = (void *)MEMORY[0x230FBD990]();
              v150 = v61;
              v151 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v153 = v152 = v20;
                v154 = [v148 error];
                *(_DWORD *)buf = 138543618;
                v182 = v153;
                __int16 v183 = 2114;
                v184 = v154;
                _os_log_impl(&dword_22F52A000, v151, OS_LOG_TYPE_ERROR, "%{public}@Failed to apply home data: %{public}@", buf, 0x16u);

                v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
                id v20 = v152;
                id v10 = v173;
              }

              if (a6)
              {
                *a6 = [v148 error];
              }
              [a1[4] rollback];

              uint64_t v26 = 0;
              v13 = v168;
LABEL_118:
              id v19 = v171;
LABEL_119:

              [a1[4] refreshAllObjects];
              [*(id *)((char *)a1 + v40[745]) willAccessValueForKey:0];
              [a1[4] setQueryGenerationFromToken:0 error:0];

              goto LABEL_120;
            }
            if (((1 << v58) & 0x44) != 0)
            {
              uint64_t v133 = [(__CFString *)v57 integerValue];
LABEL_105:
              v59 = v53;
              if (v161)
              {
                v138 = [v165 logEventSubmitter];
                v139 = [HMDResidentSyncClientHomeDataLogEvent alloc];
                id v140 = v165[2];
                uint64_t v141 = [v53 length];
                id v142 = v140;
                v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
                v61 = v165;
                v143 = [(HMDResidentSyncClientHomeDataLogEvent *)v139 initWithHomeUUID:v142 encodedDataSize:v141 homeDataType:v161 transportType:v133];
                [v138 submitLogEvent:v143];
              }
              else
              {
                v144 = (void *)MEMORY[0x230FBD990]();
                v61 = v165;
                v145 = v165;
                v146 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                {
                  v147 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v182 = v147;
                  _os_log_impl(&dword_22F52A000, v146, OS_LOG_TYPE_ERROR, "%{public}@Unexpected HMDFetchHomeDataResponseType_NotModified, not generating log event", buf, 0xCu);
                }
              }
              id v20 = v167;
              goto LABEL_111;
            }
          }
          v134 = (void *)MEMORY[0x230FBD990]();
          v135 = v165;
          v136 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v137 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v182 = v137;
            __int16 v183 = 2112;
            v184 = v57;
            _os_log_impl(&dword_22F52A000, v136, OS_LOG_TYPE_ERROR, "%{public}@Unknown transport type (%@). Log it anyway", buf, 0x16u);

            v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
          }
        }
        uint64_t v133 = 0;
        goto LABEL_105;
      }
      v85 = (void *)MEMORY[0x230FBD990]();
      v86 = a1;
      v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        v88 = HMFGetLogIdentifier();
        [v177 shortDescription];
        id v89 = v10;
        v90 = v20;
        v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v88;
        __int16 v183 = 2114;
        v184 = v91;
        v92 = "%{public}@Not persisting stale home data for %{public}@ (incoming change token is not ahead of last sync)";
        v93 = v87;
        os_log_type_t v94 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_69;
      }
    }
    else
    {
      v85 = (void *)MEMORY[0x230FBD990]();
      v86 = a1;
      v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        v88 = HMFGetLogIdentifier();
        [v177 shortDescription];
        id v89 = v10;
        v90 = 0;
        v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v182 = v88;
        __int16 v183 = 2114;
        v184 = v91;
        v92 = "%{public}@Updating last sync timestamp only for %{public}@";
        v93 = v87;
        os_log_type_t v94 = OS_LOG_TYPE_INFO;
LABEL_69:
        _os_log_impl(&dword_22F52A000, v93, v94, v92, buf, 0x16u);

        id v20 = v90;
        id v10 = v89;
        v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;

        v13 = v168;
      }
    }

LABEL_71:
    id v19 = v171;
LABEL_72:
    uint64_t v95 = [*(id *)((char *)a1 + v40[745]) lastSeenToken];
    uint64_t v96 = [*(id *)((char *)a1 + v40[745]) lastSyncToken];
    v164 = (void *)v95;
    v166 = (void *)v96;
    if (v20 && [a1 changeToken:v20 isAheadOf:v95])
    {
      [*(id *)((char *)a1 + v40[745]) setLastSeenToken:v20];
    }
    else if (([a1 changeToken:v95 isAheadOf:v176] & 1) == 0 {
           && [a1 changeToken:v95 isAheadOf:v96])
    }
    {
      v97 = (void *)MEMORY[0x230FBD990]();
      v98 = a1;
      v99 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        v100 = HMFGetLogIdentifier();
        HMDShortDescriptionForToken(v164);
        v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v102 = HMDShortDescriptionForToken(v166);
        *(_DWORD *)buf = 138543874;
        v182 = v100;
        __int16 v183 = 2114;
        v184 = v101;
        __int16 v185 = 2114;
        uint64_t v186 = (uint64_t)v102;
        _os_log_impl(&dword_22F52A000, v99, OS_LOG_TYPE_DEFAULT, "%{public}@Reverting last seen token %{public}@ to last sync token %{public}@ after successful fetch", buf, 0x20u);

        v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
        v13 = v168;
      }

      [*(id *)((char *)v98 + v40[745]) setLastSeenToken:v166];
      id v19 = v171;
    }
    if (v13)
    {
      v103 = [*(id *)((char *)a1 + v40[745]) lastSyncChecksum];
      char v104 = HMFEqualObjects();

      if ((v104 & 1) == 0)
      {
        id v105 = v19;
        v106 = (void *)MEMORY[0x230FBD990]();
        v107 = a1;
        v108 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v110 = v109 = v13;
          *(_DWORD *)buf = 138543618;
          v182 = v110;
          __int16 v183 = 2114;
          v184 = v109;
          _os_log_impl(&dword_22F52A000, v108, OS_LOG_TYPE_INFO, "%{public}@Updating the lastSyncChecksum to %{public}@", buf, 0x16u);

          v13 = v109;
        }

        [v107[12] setLastSyncChecksum:v13];
        id v19 = v105;
      }
    }
    v111 = [a1[4] insertedObjects];
    uint64_t v162 = [v111 count];

    v112 = [a1[4] updatedObjects];
    uint64_t v160 = [v112 count];

    v113 = [a1[4] deletedObjects];
    uint64_t v114 = [v113 count];

    id v115 = a1[4];
    id v180 = 0;
    uint64_t v26 = [v115 save:&v180];
    id v116 = v180;
    v117 = (void *)MEMORY[0x230FBD990]();
    v118 = a1;
    v119 = HMFGetOSLogHandle();
    v120 = v119;
    if (v26)
    {
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v121 = uint64_t v179 = v114;
        v122 = [v177 shortDescription];
        HMDShortDescriptionForToken(v167);
        v123 = v156 = v117;
        *(_DWORD *)buf = 138544642;
        v182 = v121;
        __int16 v183 = 2048;
        v184 = (__CFString *)v162;
        __int16 v185 = 2048;
        uint64_t v186 = v160;
        __int16 v187 = 2048;
        uint64_t v188 = v179;
        __int16 v189 = 2112;
        v190 = v122;
        __int16 v191 = 2114;
        v192 = v123;
        _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_DEFAULT, "%{public}@Database changes saved (%tu / %tu / %tu) for %@ with change token %{public}@", buf, 0x3Eu);

        id v19 = v171;
        v117 = v156;
      }
      v13 = v168;
    }
    else
    {
      v158 = v16;
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        v124 = HMFGetLogIdentifier();
        v125 = [v177 shortDescription];
        HMDShortDescriptionForToken(v167);
        v126 = v157 = v117;
        *(_DWORD *)buf = 138544898;
        v182 = v124;
        __int16 v183 = 2048;
        v184 = (__CFString *)v162;
        __int16 v185 = 2048;
        uint64_t v186 = v160;
        __int16 v187 = 2048;
        uint64_t v188 = v114;
        __int16 v189 = 2112;
        v190 = v125;
        __int16 v191 = 2114;
        v192 = v126;
        __int16 v193 = 2114;
        id v194 = v116;
        _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_ERROR, "%{public}@Failed to save database changes (%tu / %tu / %tu) for %@ with change token %{public}@: %{public}@", buf, 0x48u);

        id v19 = v171;
        v117 = v157;
      }
      if (a6)
      {
        HMDSanitizeCoreDataError(v116);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      [a1[4] rollback];
      v13 = v168;
      id v16 = v158;
    }
    id v20 = v167;
    v40 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;

    goto LABEL_119;
  }
  id v172 = v10;
  uint64_t v31 = v20;
  id v32 = v16;
  id v33 = v19;
  v73 = (void *)MEMORY[0x230FBD990]();
  v74 = a1;
  v75 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v77 = v76 = v13;
    *(_DWORD *)buf = 138543362;
    v182 = v77;
    _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_ERROR, "%{public}@Invalid home data response, missing data payload", buf, 0xCu);

    v13 = v76;
  }

  id v39 = (void *)v175;
  if (!a6) {
    goto LABEL_55;
  }
  [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  uint64_t v26 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:
  id v19 = v33;
  id v16 = v32;
LABEL_63:
  id v20 = v31;
  id v10 = v172;
LABEL_121:

  id v12 = v176;
  id v11 = v177;
LABEL_122:

LABEL_123:
  return v26;
}

- (id)_performFetchIfRequired
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = [a1[11] anyObject];

    if (v3)
    {
LABEL_3:
      a1 = [MEMORY[0x263F42538] futureWithNoValue];
LABEL_11:
      uint64_t v1 = vars8;
      goto LABEL_12;
    }
    int v4 = [v2[12] lastSeenToken];

    if (v4)
    {
      id v5 = [v2[12] lastSeenToken];
      uint64_t v6 = [v2[12] lastSyncToken];
      char v7 = [v2 changeToken:v5 isAheadOf:v6];

      if (v7)
      {
        id v8 = @"lastSeenToken is ahead of lastSyncToken";
      }
      else
      {
        id v9 = [MEMORY[0x263EFF910] now];
        id v10 = [v2[12] lastSyncTimestamp];
        [v9 timeIntervalSinceDate:v10];
        double v12 = v11;
        double v13 = HMDHomeDataChangedMessageTimeout();

        if (v12 < v13) {
          goto LABEL_3;
        }
        id v8 = @"lastSyncTimestamp indicates data may be stale";
      }
    }
    else
    {
      id v8 = @"lastSeenToken is nil";
    }
    -[HMDResidentSyncClient _performFetchWithReason:](v2, v8);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  return a1;
}

- (uint64_t)_fetchOrCreateMetadataWithError:(uint64_t)result
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (result)
  {
    id v3 = (id *)result;
    uint64_t v4 = *(void *)(result + 16);
    uint64_t v5 = *(void *)(result + 32);
    id v27 = 0;
    uint64_t v6 = +[_MKFModel modelWithModelID:v4 context:v5 error:&v27];
    id v7 = v27;
    if (!v6)
    {
      double v11 = (void *)MEMORY[0x230FBD990]();
      double v12 = v3;
      double v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v30 = v14;
        __int16 v31 = 2114;
        id v32 = v7;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find or create resident sync metadata, home not found: %{public}@", buf, 0x16u);
      }
      if (a2) {
        *a2 = v7;
      }
      unsigned __int8 v28 = 0;
      goto LABEL_16;
    }
    uint64_t v8 = [v6 residentSyncMetadata];
    if (v8)
    {
      id v9 = (MKFResidentSyncMetadata *)v8;
      id v10 = v7;
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v3;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v30 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Creating initial resident sync metadata", buf, 0xCu);
      }
      id v9 = [[MKFResidentSyncMetadata alloc] initWithContext:v3[4]];
      [(MKFResidentSyncMetadata *)v9 setHome:v6];
      id v19 = v3[4];
      id v26 = v7;
      char v20 = [v19 save:&v26];
      id v10 = v26;

      if ((v20 & 1) == 0)
      {
        uint64_t v22 = (void *)MEMORY[0x230FBD990]();
        int v23 = v16;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v30 = v25;
          __int16 v31 = 2114;
          id v32 = v10;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to save resident sync metadata: %{public}@", buf, 0x16u);
        }
        if (a2)
        {
          HMDSanitizeCoreDataError(v10);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        [v3[4] rollback];
        char v21 = 0;
        goto LABEL_15;
      }
      [v3[4] refreshAllObjects];
      [v16[12] willAccessValueForKey:0];
      [v3[4] setQueryGenerationFromToken:0 error:0];
    }
    objc_storeStrong(v3 + 12, v9);
    char v21 = 1;
LABEL_15:
    unsigned __int8 v28 = v21;

    id v7 = v10;
LABEL_16:

    return v28;
  }
  return result;
}

- (id)retryTimer
{
  return self->_retryTimer;
}

- (void)timerDidFire:(id)a3
{
  if (self->_retryTimer == a3)
  {
    [a3 suspend];
    context = self->super._context;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __38__HMDResidentSyncClient_timerDidFire___block_invoke;
    v5[3] = &unk_264A2F7F8;
    v5[4] = self;
    [(HMDManagedObjectContext *)context performBlock:v5];
  }
}

id *__38__HMDResidentSyncClient_timerDidFire___block_invoke(uint64_t a1)
{
  result = *(id **)(a1 + 32);
  if (*((unsigned char *)result + 128)) {
    return (id *)-[HMDResidentSyncClient _performFetchIfRequired](result);
  }
  return result;
}

- (void)performResidentRequest:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [v5 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (!v9)
    {
      id v10 = [HMDRemoteHomeMessageDestination alloc];
      double v11 = [v6 destination];
      double v12 = [v11 target];
      id v7 = [(HMDRemoteHomeMessageDestination *)v10 initWithTarget:v12 homeUUID:self->super._homeUUID];
    }
    double v13 = (void *)MEMORY[0x263F42538];
    context = self->super._context;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke;
    v19[3] = &unk_264A2BEC8;
    v19[4] = self;
    id v20 = v6;
    char v21 = v7;
    id v15 = v7;
    id v16 = v6;
    id v17 = [v13 inContext:context perform:v19];
    [v16 respondWithOutcomeOf:v17];
  }
  else
  {
    uint64_t v18 = _HMFPreconditionFailure();
    __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke(v18);
  }
}

uint64_t __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 64) isCurrentDevicePrimaryResident])
  {
    uint64_t v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543618;
      id v44 = v5;
      __int16 v45 = 2112;
      v46 = v6;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@Unable to dispatch resident request '%@': this device is the primary resident", buf, 0x16u);
    }
    id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 2;
      id v10 = v8;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
      id v8 = 0;
      id v10 = 0;
      uint64_t v9 = 2;
    }
  }
  else
  {
    double v11 = [*(id *)(a1 + 40) messagePayload];
    double v12 = (void *)[v11 mutableCopy];
    double v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v10 = v14;

    id v8 = [*(id *)(*(void *)(a1 + 32) + 96) lastSyncToken];
    id v15 = -[HMDResidentSyncClient _syncDetailsWithChangeToken:](*(unsigned __int8 **)(a1 + 32), v8);
    [v10 setObject:v15 forKeyedSubscript:@"$HMDRS$"];

    id v16 = [HMDRemoteMessage alloc];
    id v17 = [*(id *)(a1 + 40) name];
    uint64_t v18 = [*(id *)(a1 + 40) qualityOfService];
    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = (void *)[v10 copy];
    char v21 = [*(id *)(a1 + 40) headers];
    [*(id *)(a1 + 40) timeout];
    LOBYTE(v37) = 1;
    uint64_t v22 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v16, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v17, v18, v19, v20, v21, 3, v37, -1, 0);

    int v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 32);
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = HMFGetLogIdentifier();
      id v27 = [*(id *)(a1 + 40) shortDescription];
      unsigned __int8 v28 = [(HMFObject *)v22 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v44 = v26;
      __int16 v45 = 2112;
      v46 = v27;
      __int16 v47 = 2112;
      BOOL v48 = v28;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Dispatching resident request '%@' using remote message: %@", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 32) + 88) addObject:v22];
    __int16 v29 = [*(id *)(*(void *)(a1 + 32) + 56) sendMessageExpectingResponse:v22];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_234;
    v40[3] = &unk_264A22EA0;
    id v30 = *(void **)(a1 + 40);
    v40[4] = *(void *)(a1 + 32);
    id v41 = v30;
    __int16 v31 = v22;
    id v42 = v31;
    id v32 = [v29 then:v40];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_239;
    v38[3] = &unk_264A2EC78;
    v38[4] = *(void *)(a1 + 32);
    uint64_t v33 = v31;
    id v39 = v33;
    id v34 = [v32 finally:v38];
    if (!v34) {
      _HMFPreconditionFailure();
    }
    id v35 = v34;

    uint64_t v9 = 3;
  }

  return v9;
}

uint64_t __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_234(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hmf_dictionaryForKey:", @"$HMDRS$");
  if (!v4)
  {
    double v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    double v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543874;
      id v27 = v14;
      __int16 v28 = 2112;
      __int16 v29 = v15;
      __int16 v30 = 2114;
      __int16 v31 = @"$HMDRS$";
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Resident response payload for '%@' is missing resident sync details key (%{public}@)", buf, 0x20u);
    }
    id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    if (v16)
    {
      id v9 = v16;
      uint64_t v10 = 2;
      id v8 = v9;
      goto LABEL_16;
    }
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
    id v9 = 0;
    id v8 = 0;
LABEL_15:
    uint64_t v10 = 2;
    goto LABEL_16;
  }
  id v5 = *(id **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 48);
  id v25 = 0;
  char v7 = -[HMDResidentSyncClient _applyAndSaveHomeDataChanges:forRequest:previousLastSeenToken:versionChecksum:error:](v5, v4, v6, 0, 0, &v25);
  id v8 = v25;
  if ((v7 & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      char v21 = [*(id *)(a1 + 40) shortDescription];
      *(_DWORD *)buf = 138543618;
      id v27 = v20;
      __int16 v28 = 2112;
      __int16 v29 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Resident response for '%@' was success but local database save failed, returning partial success error code", buf, 0x16u);
    }
    id v22 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2008 description:@"Resident request succeeded but database save failed" underlyingError:v8];
    id v9 = v22;
    if (v22)
    {
      id v23 = v22;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  id v9 = (id)[v3 mutableCopy];
  [v9 removeObjectForKey:@"$HMDRS$"];
  [v9 copy];
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

uint64_t __56__HMDResidentSyncClient_performResidentRequest_options___block_invoke_239(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
  id v2 = -[HMDResidentSyncClient _performFetchIfRequired](*(id **)(a1 + 32));
  return 1;
}

- (void)handlePrimaryResidentChanged:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    char v7 = [WeakRetained homeManager];
    id v8 = [v6 uuid];
    id v9 = [v7 sharedUserAcceptEventBuilderForHomeUuid:v8];

    [v9 markDiscoverPrimaryResidentEnd];
    [v9 markResidentSyncBegin];
  }
  uint64_t v10 = [v4 userInfo];
  double v11 = [v10 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if ([v13 isCurrentDevice])
  {
    context = self->super._context;
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    id v27 = __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke;
    __int16 v28 = &unk_264A2F7F8;
    __int16 v29 = self;
    id v15 = &v25;
LABEL_12:
    -[HMDManagedObjectContext performBlock:](context, "performBlock:", v15, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_13;
  }
  if (v13)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Primary resident changed, asking the new primary for an update", buf, 0xCu);
    }
    context = v17->super._context;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke_223;
    id v23 = &unk_264A2F7F8;
    id v24 = v17;
    id v15 = &v20;
    goto LABEL_12;
  }
LABEL_13:
}

void __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v3 = *(void **)(v1 + 112);
    if (v3)
    {
      *(void *)(v1 + 112) = 0;
    }
    id v4 = *(void **)(v1 + 120);
    if (v4)
    {
      id v5 = (id)[v4 voidResolverBlock];
      uint64_t v6 = *(void **)(v1 + 120);
      *(void *)(v1 + 120) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      *(unsigned char *)(v7 + 128) = 0;
      id v8 = *(void **)(v7 + 104);
      [v8 suspend];
    }
  }
}

id __54__HMDResidentSyncClient_handlePrimaryResidentChanged___block_invoke_223(uint64_t a1)
{
  return -[HMDResidentSyncClient _performMaybeDelayedFetchWithReason:](*(void *)(a1 + 32), @"primary resident changed");
}

- (void)performSync
{
  context = self->super._context;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__HMDResidentSyncClient_performSync__block_invoke;
  v3[3] = &unk_264A2F7F8;
  v3[4] = self;
  [(HMDManagedObjectContext *)context performBlock:v3];
}

id __36__HMDResidentSyncClient_performSync__block_invoke(uint64_t a1)
{
  return -[HMDResidentSyncClient _performFetchWithReason:](*(void *)(a1 + 32), @"sync requested");
}

- (void)stop
{
  [(HMFMessageDispatcher *)self->_dispatcher deregisterReceiver:self];
  notificationCenter = self->super._notificationCenter;
  [(NSNotificationCenter *)notificationCenter removeObserver:self];
}

- (id)start
{
  v12[2] = *MEMORY[0x263EF8340];
  context = self->super._context;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__HMDResidentSyncClient_start__block_invoke;
  v11[3] = &unk_264A22E78;
  v11[4] = self;
  id v4 = [MEMORY[0x263F42538] inContext:context perform:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
  uint64_t v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:WeakRetained userPrivilege:3 remoteAccessRequired:0];

  dispatcher = self->_dispatcher;
  v12[0] = v6;
  id v8 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v12[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  [(HMFMessageDispatcher *)dispatcher registerForMessage:@"HMDHomeDataChangedMessage" receiver:self policies:v9 selector:sel__handleHomeDataChanged_];

  [(NSNotificationCenter *)self->super._notificationCenter addObserver:self selector:sel_handlePrimaryResidentChanged_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:self->_residentDeviceManager];
  return v4;
}

HMDResidentSyncClient *__30__HMDResidentSyncClient_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, BOOL a9, void *a10, void *a11)
{
  *(void *)(*(void *)(a1 + 32) + 136) = 0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v30 = 0;
  char v13 = -[HMDResidentSyncClient _fetchOrCreateMetadataWithError:](v12, &v30);
  id v14 = v30;
  id v15 = v14;
  if ((v13 & 1) == 0)
  {
    id v19 = v14;
    id v17 = v19;
    if (v19)
    {
      id v20 = v19;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }
    uint64_t v18 = 2;
    goto LABEL_8;
  }
  -[HMDResidentSyncClient _performFetchIfRequired](*(id **)(a1 + 32));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    id v17 = v16;

    uint64_t v18 = 3;
LABEL_8:

    return (HMDResidentSyncClient *)v18;
  }
  id v22 = (HMDResidentSyncClient *)_HMFPreconditionFailure();
  return [(HMDResidentSyncClient *)v22 initWithHome:v24 codingModel:v25 dispatcher:v26 residentDeviceManager:v27 notificationCenter:v28 persistence:v29 isResidentCapable:a9 dataSource:a10 logEventSubmitter:a11];
}

- (HMDResidentSyncClient)initWithHome:(id)a3 codingModel:(id)a4 dispatcher:(id)a5 residentDeviceManager:(id)a6 notificationCenter:(id)a7 persistence:(id)a8 isResidentCapable:(BOOL)a9 dataSource:(id)a10 logEventSubmitter:(id)a11
{
  id v29 = a5;
  id v28 = a6;
  id v27 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)HMDResidentSyncClient;
  id v19 = [(HMDResidentSyncController *)&v30 initWithHome:a3 codingModel:a4 notificationCenter:a7 persistence:a8];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dispatcher, a5);
    objc_storeStrong((id *)&v20->_residentDeviceManager, a6);
    objc_storeStrong((id *)&v20->_dataSource, a10);
    v20->_residentCapable = a9;
    uint64_t v21 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    requestsInProgress = v20->_requestsInProgress;
    v20->_requestsInProgress = (NSHashTable *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F42528]) initWithMinimumTimeInterval:2 maximumTimeInterval:0 exponentialFactor:10.0 options:28800.0];
    retryTimer = v20->_retryTimer;
    v20->_retryTimer = (HMFExponentialBackoffTimer *)v23;

    [(HMFExponentialBackoffTimer *)v20->_retryTimer setDelegate:v20];
    objc_storeStrong((id *)&v20->_logEventSubmitter, a11);
    id v25 = objc_opt_new();
    [(HMDManagedObjectContext *)v20->super._context setMergePolicy:v25];

    v20->_accessDeniedCount = 0;
  }

  return v20;
}

@end
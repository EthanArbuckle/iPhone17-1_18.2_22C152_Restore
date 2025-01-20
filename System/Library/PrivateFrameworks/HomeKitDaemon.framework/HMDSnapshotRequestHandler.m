@interface HMDSnapshotRequestHandler
+ (id)logCategory;
- (HMDSnapshotFile)_saveSnapshotFile:(id *)a1;
- (HMDSnapshotRequestHandler)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 imageCacheDirectory:(id)a6 logID:(id)a7;
- (NSSet)supportedResolutions;
- (NSString)imageCacheDirectory;
- (NSString)logIdentifier;
- (void)_handleImageResourceData:(void *)a3 error:(void *)a4 requestedResolution:(void *)a5 snapshotDataTrasaction:;
- (void)_sendSnapshotRequest:(unint64_t)a3 streamingTierType:;
- (void)requestSnapshot:(id)a3 streamingTierType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setSupportedResolutions:(id)a3;
- (void)streamSnapshotHandler:(id)a3 didGetLastSnapshot:(id)a4;
- (void)streamSnapshotHandler:(id)a3 didGetNewSnapshot:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSnapshotRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedResolutions, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRecentSnapshot, 0);
  objc_storeStrong((id *)&self->_mostRecentSnapshotInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_imageCacheDirectory, 0);
}

- (void)setSupportedResolutions:(id)a3
{
}

- (NSSet)supportedResolutions
{
  return self->_supportedResolutions;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSString)imageCacheDirectory
{
  return self->_imageCacheDirectory;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    mostRecentSnapshotInvalidationTimer = self->_mostRecentSnapshotInvalidationTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    mostRecentSnapshotInvalidationTimer = 0;
  }
  if (mostRecentSnapshotInvalidationTimer == v4)
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Snapshot invalidation timer has fired, resetting the most recent snapshot", (uint8_t *)&v10, 0xCu);
    }
    if (self)
    {
      objc_storeStrong((id *)&v7->_mostRecentSnapshot, 0);
      objc_storeStrong((id *)&v7->_mostRecentSnapshotInvalidationTimer, 0);
    }
  }
}

- (void)streamSnapshotHandler:(id)a3 didGetLastSnapshot:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received last snapshot", (uint8_t *)&v13, 0xCu);
  }
  id v12 = -[HMDSnapshotRequestHandler _saveSnapshotFile:]((id *)&v9->super.super.isa, v7);
}

- (HMDSnapshotFile)_saveSnapshotFile:(id *)a1
{
  if (a1)
  {
    v3 = a1[2];
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    v5 = [HMDSnapshotFile alloc];
    id v6 = [a1 imageCacheDirectory];
    id v7 = [(HMDSnapshotFile *)v5 initWithImageDirectory:v6 snapshotData:v4];

    if (v7)
    {
      objc_storeStrong(a1 + 7, v7);
      uint64_t v8 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:2.0];
      id v9 = a1[6];
      a1[6] = (id)v8;

      [a1[6] setDelegate:a1];
      id v10 = a1[6];
      id v11 = a1[2];
      [v10 setDelegateQueue:v11];

      [a1[6] resume];
      id v12 = v7;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)streamSnapshotHandler:(id)a3 didGetNewSnapshot:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received new snapshot", (uint8_t *)&v13, 0xCu);
  }
  if (v7) {
    id v12 = -[HMDSnapshotRequestHandler _saveSnapshotFile:]((id *)&v9->super.super.isa, v7);
  }
}

- (void)requestSnapshot:(id)a3 streamingTierType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (self) {
      workQueue = self->_workQueue;
    }
    else {
      workQueue = 0;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__HMDSnapshotRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke;
    v15[3] = &unk_264A2F470;
    id v16 = v8;
    v17 = self;
    id v18 = v9;
    unint64_t v19 = a4;
    dispatch_async(workQueue, v15);
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Completion handler is nil", buf, 0xCu);
    }
  }
}

void __81__HMDSnapshotRequestHandler_requestSnapshot_streamingTierType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) snapshotCharacteristicEventUUID];

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v3)
  {
LABEL_4:
    id v4 = v3;
    v5 = [[HMDSnapshotRequest alloc] initWithCompletion:*(void *)(a1 + 48)];
    [v4 addObject:v5];

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      id v7 = *(void **)(v6 + 32);
    }
    else {
      id v7 = 0;
    }
    if ((unint64_t)[v7 count] < 2)
    {
      uint64_t v15 = [*(id *)(a1 + 40) supportedResolutions];

      if (v15)
      {
        v17 = *(void **)(a1 + 32);
        id v16 = *(id **)(a1 + 40);
        unint64_t v18 = *(void *)(a1 + 56);
        -[HMDSnapshotRequestHandler _sendSnapshotRequest:streamingTierType:](v16, v17, v18);
      }
      else
      {
        v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = *(id *)(a1 + 40);
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v61 = v28;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Need to gather supported video resolutions by the camera", buf, 0xCu);
        }
        v29 = *(void **)(a1 + 40);
        v47 = *(void **)(a1 + 56);
        id v48 = *(id *)(a1 + 32);
        if (v29)
        {
          v30 = (void *)MEMORY[0x230FBD990]();
          val = v29;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v61 = v32;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Getting Supported Configuration", buf, 0xCu);
          }
          id WeakRetained = objc_loadWeakRetained(val + 3);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v34 = WeakRetained;
          }
          else {
            v34 = 0;
          }
          id v49 = v34;

          if (v49)
          {
            v51 = [MEMORY[0x263EFF980] array];
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v35 = [v49 services];
            uint64_t v36 = [v35 countByEnumeratingWithState:&v56 objects:buf count:16];
            if (v36)
            {
              uint64_t v37 = *(void *)v57;
              uint64_t v38 = *MEMORY[0x263F356C0];
              uint64_t v39 = *MEMORY[0x263F35588];
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v57 != v37) {
                    objc_enumerationMutation(v35);
                  }
                  v41 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                  v42 = [v41 serviceType];
                  int v43 = [v42 isEqualToString:v38];

                  if (v43)
                  {
                    v44 = [v41 findCharacteristicWithType:v39];
                    if (v44)
                    {
                      v45 = +[HMDCharacteristicRequest requestWithCharacteristic:v44];
                      [v51 addObject:v45];
                    }
                  }
                }
                uint64_t v36 = [v35 countByEnumeratingWithState:&v56 objects:buf count:16];
              }
              while (v36);
            }

            objc_initWeak(&location, val);
            id v46 = val[2];
            v52[0] = MEMORY[0x263EF8330];
            v52[1] = 3221225472;
            v52[2] = __77__HMDSnapshotRequestHandler__getSupportedVideoResolutions_streamingTierType___block_invoke;
            v52[3] = &unk_264A2F4E0;
            objc_copyWeak(v54, &location);
            id v53 = v48;
            v54[1] = v47;
            [v49 readCharacteristicValues:v51 source:7 queue:v46 completionHandler:v52];

            objc_destroyWeak(v54);
            objc_destroyWeak(&location);
          }
          else
          {
            v51 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
            -[HMDSnapshotRequestHandler _handleImageResourceData:error:requestedResolution:snapshotDataTrasaction:]((uint64_t)val, 0, v51, 0, 0);
          }
        }
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        id v12 = *(void **)(a1 + 40);
        if (v12) {
          id v12 = (void *)v12[4];
        }
        int v13 = v12;
        v14 = [v13 firstObject];
        *(_DWORD *)buf = 138543618;
        v61 = v11;
        __int16 v62 = 2112;
        v63 = v14;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@There is already a request in progress so piggy backing on that: %@", buf, 0x16u);
      }
    }
    return;
  }
  if (!v3[7])
  {
LABEL_3:
    v3 = (void *)v3[4];
    goto LABEL_4;
  }
  unint64_t v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = *(id *)(a1 + 40);
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v61 = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Most recent snapshot is still valid", buf, 0xCu);
  }
  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    uint64_t v24 = *(void *)(v23 + 56);
  }
  else {
    uint64_t v24 = 0;
  }
  (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v24, 0);
}

- (void)_sendSnapshotRequest:(unint64_t)a3 streamingTierType:
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v88 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = WeakRetained;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    v87 = v7;
    if (!v7)
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      unint64_t v18 = a1;
      unint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory is no longer available, cannot handle snapshot request", buf, 0xCu);
      }
      v21 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1011];
      -[HMDSnapshotRequestHandler _handleImageResourceData:error:requestedResolution:snapshotDataTrasaction:]((uint64_t)v18, 0, v21, 0, 0);
LABEL_61:

      goto LABEL_62;
    }
    id v8 = (id)snapshotResolution;
    v85 = v8;
    v86 = a1;
    if (v8)
    {
      uint64_t v9 = [v8 unsignedIntegerValue];
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      id v12 = HMFGetOSLogHandle();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if ((unint64_t)(v9 - 1) < 0xA)
      {
        if (v13)
        {
          v14 = HMFGetLogIdentifier();
          uint64_t v15 = HMDVideoResolutionTypeAsString(v9);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Overriding the resolution requested to %@", buf, 0x16u);
        }
        id v16 = [[HMDVideoResolution alloc] initWithResolution:v9];
LABEL_37:

        id obja = (id)[v88 snapshotReason];
        id v48 = (void *)MEMORY[0x263EFF9A0];
        id v49 = v87;
        v92 = v16;
        v50 = [v48 dictionary];
        [v50 setObject:*MEMORY[0x263F357C8] forKeyedSubscript:*MEMORY[0x263F357E8]];
        v51 = [(HMDVideoResolution *)v92 imageWidth];
        [v50 setObject:v51 forKeyedSubscript:*MEMORY[0x263F357D8]];

        v52 = [(HMDVideoResolution *)v92 imageHeight];

        [v50 setObject:v52 forKeyedSubscript:*MEMORY[0x263F357D0]];
        id v53 = v50;
        id v54 = v49;
        v55 = [v54 bridge];

        if (v55)
        {
          long long v56 = [v54 hapInstanceId];
          if (v56)
          {
            [v53 setObject:v56 forKeyedSubscript:*MEMORY[0x263F35418]];
          }
          else
          {
            long long v57 = (void *)MEMORY[0x230FBD990]();
            long long v58 = v86;
            long long v59 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              v60 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v60;
              _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the HAP instance id (aid) for bridged accessory.", buf, 0xCu);
            }
          }
        }
        long long v107 = 0u;
        long long v108 = 0u;
        memset(v106, 0, sizeof(v106));
        v61 = objc_msgSend(v54, "services", v84);
        uint64_t v62 = [v61 countByEnumeratingWithState:v106 objects:buf count:16];
        if (v62)
        {
          uint64_t v63 = **(void **)&v106[16];
          uint64_t v64 = *MEMORY[0x263F0D658];
LABEL_46:
          uint64_t v65 = 0;
          while (1)
          {
            if (**(void **)&v106[16] != v63) {
              objc_enumerationMutation(v61);
            }
            v66 = *(void **)(*(void *)&v106[8] + 8 * v65);
            v67 = [v66 type];
            char v68 = [v67 isEqualToString:v64];

            if (v68) {
              break;
            }
            if (v62 == ++v65)
            {
              uint64_t v62 = [v61 countByEnumeratingWithState:v106 objects:buf count:16];
              if (v62) {
                goto LABEL_46;
              }
              goto LABEL_52;
            }
          }
          v71 = [v66 findCharacteristicWithType:*MEMORY[0x263F0C160]];
          BOOL v70 = v71 == 0;

          v72 = [v66 findCharacteristicWithType:@"00000225-0000-1000-8000-0026BB765291"];
          BOOL v69 = v72 == 0;

          if (v70 || v69) {
            goto LABEL_54;
          }
          v77 = [NSNumber numberWithUnsignedInteger:obja];
          [v53 setObject:v77 forKeyedSubscript:*MEMORY[0x263F357E0]];
        }
        else
        {
LABEL_52:

          BOOL v69 = 1;
          BOOL v70 = 1;
LABEL_54:
          v73 = (void *)MEMORY[0x230FBD990]();
          v74 = v86;
          v75 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            v76 = HMFGetLogIdentifier();
            *(_DWORD *)v99 = 138543874;
            *(void *)&v99[4] = v76;
            *(_WORD *)&v99[12] = 1024;
            *(_DWORD *)&v99[14] = v70;
            *(_WORD *)&v99[18] = 1024;
            *(_DWORD *)&v99[20] = v69;
            _os_log_impl(&dword_22F52A000, v75, OS_LOG_TYPE_INFO, "%{public}@Either event snapshot active characteristic (%d) or periodic snapshot active characteristic (%d) is not present", v99, 0x18u);
          }
        }

        v78 = (void *)[v53 copy];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v103 = __Block_byref_object_copy__273009;
        v104 = __Block_byref_object_dispose__273010;
        id v105 = (id)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.snapshot-request"];
        v79 = (void *)MEMORY[0x230FBD990]([v88 markMilestoneFor:@"SentSnapshotRequestToAccessory"]);
        v80 = v86;
        HMFGetOSLogHandle();
        v81 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          v82 = HMFGetLogIdentifier();
          *(_DWORD *)v106 = 138543618;
          *(void *)&v106[4] = v82;
          *(_WORD *)&v106[12] = 2112;
          *(void *)&v106[14] = v78;
          _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_INFO, "%{public}@Sending snapshot request to accessory with options: %@", v106, 0x16u);
        }
        id v83 = v80[2];
        v93[0] = MEMORY[0x263EF8330];
        v93[1] = 3221225472;
        v93[2] = __68__HMDSnapshotRequestHandler__sendSnapshotRequest_streamingTierType___block_invoke;
        v93[3] = &unk_264A2F498;
        id v94 = v88;
        id v95 = v54;
        v96 = v80;
        v21 = v92;
        v97 = v21;
        v98 = buf;
        [v95 requestResource:v78 queue:v83 completionHandler:v93];

        _Block_object_dispose(buf, 8);
        goto LABEL_61;
      }
      if (v13)
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not overriding the resolution requested to %tu", buf, 0x16u);
      }
    }
    unint64_t v84 = a3;
    if (a3 > 4)
    {
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v23 = +[HMDVideoResolution arrayWithResolutions:](HMDVideoResolution, "arrayWithResolutions:", qword_264A2F500[a3], a3, v85, a1, v7);
    }
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    v91 = v86;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = HMFGetLogIdentifier();
      HMDStreamingTierTypeAsString(v84);
      v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      v103 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Resolutions in order of preference: %@ for tier: %@", buf, 0x20u);
    }
    long long v107 = 0u;
    long long v108 = 0u;
    memset(v106, 0, sizeof(v106));
    id obj = v23;
    uint64_t v28 = [obj countByEnumeratingWithState:v106 objects:buf count:16];
    if (v28)
    {
      uint64_t v29 = **(void **)&v106[16];
      uint64_t v30 = MEMORY[0x263EF8330];
LABEL_24:
      uint64_t v31 = 0;
      while (1)
      {
        if (**(void **)&v106[16] != v29) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*(void *)&v106[8] + 8 * v31);
        uint64_t v33 = objc_msgSend(v32, "resolutionType", v84);
        v34 = [v91 supportedResolutions];
        *(void *)v99 = v30;
        *(void *)&v99[8] = 3221225472;
        *(void *)&v99[16] = __58__HMDSnapshotRequestHandler__supportedResolutionWithType___block_invoke;
        v100 = &__block_descriptor_40_e28_B16__0__HMDVideoResolution_8l;
        v101[0] = v33;
        v35 = objc_msgSend(v34, "na_firstObjectPassingTest:", v99);

        if (v35) {
          break;
        }
        if (v28 == ++v31)
        {
          uint64_t v28 = [obj countByEnumeratingWithState:v106 objects:buf count:16];
          if (v28) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }
      id v16 = v32;

      if (!v16) {
        goto LABEL_34;
      }
      uint64_t v36 = (void *)MEMORY[0x230FBD990]();
      uint64_t v37 = v91;
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = HMFGetLogIdentifier();
        v40 = HMDVideoResolutionTypeAsString([(HMDVideoResolution *)v16 resolutionType]);
        v41 = [v37 supportedResolutions];
        v42 = HMDStreamingTierTypeAsString(v84);
        *(_DWORD *)v99 = 138544130;
        *(void *)&v99[4] = v39;
        *(_WORD *)&v99[12] = 2112;
        *(void *)&v99[14] = v40;
        *(_WORD *)&v99[22] = 2112;
        v100 = v41;
        LOWORD(v101[0]) = 2112;
        *(void *)((char *)v101 + 2) = v42;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Found preferred resolution: %@ in supported resolutions: %@ for tier: %@", v99, 0x2Au);
      }
    }
    else
    {
LABEL_30:

LABEL_34:
      id v16 = [[HMDVideoResolution alloc] initWithResolution:1];
      uint64_t v36 = (void *)MEMORY[0x230FBD990]();
      int v43 = v91;
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v44 = HMFGetLogIdentifier();
        v45 = [v43 supportedResolutions];
        id v46 = HMDStreamingTierTypeAsString(v84);
        v47 = HMDVideoResolutionTypeAsString([(HMDVideoResolution *)v16 resolutionType]);
        *(_DWORD *)v99 = 138544130;
        *(void *)&v99[4] = v44;
        *(_WORD *)&v99[12] = 2112;
        *(void *)&v99[14] = v45;
        *(_WORD *)&v99[22] = 2112;
        v100 = v46;
        LOWORD(v101[0]) = 2112;
        *(void *)((char *)v101 + 2) = v47;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Didn't find preferred resolution in supported resolutions: %@ for tier: %@. Defaulting to resolution: %@", v99, 0x2Au);
      }
    }

    goto LABEL_37;
  }
LABEL_62:
}

- (void)_handleImageResourceData:(void *)a3 error:(void *)a4 requestedResolution:(void *)a5 snapshotDataTrasaction:
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = v12;
  uint64_t v39 = v9;
  if (a1)
  {
    id v13 = v12;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v9)
    {
      if ([v9 length])
      {
        v14 = [[HMDCameraSnapshotData alloc] initWithSnapshotData:v9 videoResolution:v11 snapshotDataTrasaction:v13];
        uint64_t v15 = -[HMDSnapshotRequestHandler _saveSnapshotFile:]((id *)a1, v14);
        if (!v15)
        {
          id v16 = (void *)MEMORY[0x230FBD990]();
          id v17 = (id)a1;
          unint64_t v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            unint64_t v19 = v37 = v16;
            *(_DWORD *)buf = 138543362;
            id v46 = v19;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to save snapshot file", buf, 0xCu);

            id v16 = v37;
          }

          uint64_t v20 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1038];

          id v10 = (id)v20;
        }
        v21 = v11;
      }
      else
      {
        id v26 = (void *)MEMORY[0x230FBD990]();
        id v27 = (id)a1;
        uint64_t v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v46 = v29;
          __int16 v47 = 2112;
          id v48 = v11;
          _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory sent 0 length data for snapshot request of resolution %@", buf, 0x16u);
        }
        v21 = v11;

        uint64_t v30 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1037];

        uint64_t v15 = 0;
        id v10 = (id)v30;
      }
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = (id)a1;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v46 = v25;
        __int16 v47 = 2112;
        id v48 = v11;
        __int16 v49 = 2112;
        id v50 = v10;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Accessory failed to send data for snapshot request of resolution %@: %@", buf, 0x20u);
      }
      v21 = v11;

      uint64_t v15 = 0;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v31 = *(id *)(a1 + 32);
    uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = [*(id *)(*((void *)&v40 + 1) + 8 * i) completion];
          ((void (**)(void, void *, id))v36)[2](v36, v15, v10);
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v33);
    }

    [*(id *)(a1 + 32) removeAllObjects];
  }
  else
  {
    v21 = v11;
  }
}

void __68__HMDSnapshotRequestHandler__sendSnapshotRequest_streamingTierType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [*(id *)(a1 + 32) markMilestoneFor:@"ReceivedSnapshotFromAccessory"];
  }
  [*(id *)(a1 + 40) updateActiveDisconnectOnIdleTimeout:20.0];
  -[HMDSnapshotRequestHandler _handleImageResourceData:error:requestedResolution:snapshotDataTrasaction:](*(void *)(a1 + 48), v6, v5, *(void **)(a1 + 56), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
}

BOOL __58__HMDSnapshotRequestHandler__supportedResolutionWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resolutionType] == *(void *)(a1 + 32);
}

void __77__HMDSnapshotRequestHandler__getSupportedVideoResolutions_streamingTierType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v77 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response for supported configurations", buf, 0xCu);
  }
  id v9 = *(void **)(a1 + 32);
  unint64_t v51 = *(void *)(a1 + 48);
  id v10 = v3;
  id v11 = v9;
  id v12 = v11;
  if (v6)
  {
    v55 = v6;
    __int16 v49 = v11;
    id v50 = v10;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v63;
      uint64_t v17 = *MEMORY[0x263F35588];
      uint64_t v53 = *(void *)v63;
      id v54 = v13;
      uint64_t v52 = *MEMORY[0x263F35588];
      do
      {
        uint64_t v18 = 0;
        uint64_t v56 = v15;
        do
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v13);
          }
          unint64_t v19 = *(void **)(*((void *)&v62 + 1) + 8 * v18);
          uint64_t v20 = [v19 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v58 = v18;
            uint64_t v22 = [v19 value];
            id v23 = [v19 request];
            uint64_t v24 = [v23 characteristic];
            v25 = [v24 type];
            int v26 = [v25 isEqualToString:v17];

            if (v26)
            {
              long long v57 = v22;
              id v27 = [(HAPTLVBase *)[HMDSupportedVideoStreamConfiguration alloc] initWithTLVData:v22];
              uint64_t v28 = [MEMORY[0x263EFF9C0] set];
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              v61 = v27;
              id obj = [(HMDSupportedVideoStreamConfiguration *)v27 codecConfigurations];
              uint64_t v29 = [obj countByEnumeratingWithState:&v70 objects:buf count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v60 = *(void *)v71;
                do
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v71 != v60) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v32 = *(void *)(*((void *)&v70 + 1) + 8 * i);
                    uint64_t v33 = [(HMDSupportedVideoStreamConfiguration *)v61 codecConfigurations];
                    uint64_t v34 = [v33 objectForKeyedSubscript:v32];

                    long long v68 = 0u;
                    long long v69 = 0u;
                    long long v66 = 0u;
                    long long v67 = 0u;
                    v35 = [v34 videoAttributes];
                    uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v75 count:16];
                    if (v36)
                    {
                      uint64_t v37 = v36;
                      uint64_t v38 = *(void *)v67;
                      do
                      {
                        for (uint64_t j = 0; j != v37; ++j)
                        {
                          if (*(void *)v67 != v38) {
                            objc_enumerationMutation(v35);
                          }
                          long long v40 = *(void **)(*((void *)&v66 + 1) + 8 * j);
                          long long v41 = [v40 videoResolution];

                          if (v41)
                          {
                            long long v42 = [v40 videoResolution];
                            [v28 addObject:v42];
                          }
                        }
                        uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v75 count:16];
                      }
                      while (v37);
                    }
                  }
                  uint64_t v30 = [obj countByEnumeratingWithState:&v70 objects:buf count:16];
                }
                while (v30);
              }

              [v55 setSupportedResolutions:v28];
              uint64_t v16 = v53;
              id v13 = v54;
              uint64_t v17 = v52;
              uint64_t v15 = v56;
              uint64_t v22 = v57;
            }

            uint64_t v18 = v58;
          }
          ++v18;
        }
        while (v18 != v15);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v15);
    }

    long long v43 = (void *)MEMORY[0x230FBD990]();
    id v6 = v55;
    id v44 = v55;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      id v46 = HMFGetLogIdentifier();
      __int16 v47 = [v44 supportedResolutions];
      *(_DWORD *)buf = 138543618;
      v77 = v46;
      __int16 v78 = 2112;
      v79 = v47;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Supported resolutions are: %@", buf, 0x16u);
    }
    id v48 = (id *)v44;
    id v12 = v49;
    -[HMDSnapshotRequestHandler _sendSnapshotRequest:streamingTierType:](v48, v49, v51);
    id v10 = v50;
  }
}

- (HMDSnapshotRequestHandler)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 imageCacheDirectory:(id)a6 logID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDSnapshotRequestHandler;
  uint64_t v17 = [(HMDSnapshotRequestHandler *)&v22 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    uint64_t v19 = [MEMORY[0x263EFF980] array];
    pendingRequests = v18->_pendingRequests;
    v18->_pendingRequests = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v18->_logIdentifier, a7);
    objc_storeStrong((id *)&v18->_streamSnapshotHandler, a5);
    objc_storeStrong((id *)&v18->_imageCacheDirectory, a6);
    [(HMDCameraStreamSnapshotHandler *)v18->_streamSnapshotHandler addDelegate:v18];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_273068 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_273068, &__block_literal_global_273069);
  }
  v2 = (void *)logCategory__hmf_once_v1_273070;
  return v2;
}

void __40__HMDSnapshotRequestHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_273070;
  logCategory__hmf_once_v1_273070 = v0;
}

@end
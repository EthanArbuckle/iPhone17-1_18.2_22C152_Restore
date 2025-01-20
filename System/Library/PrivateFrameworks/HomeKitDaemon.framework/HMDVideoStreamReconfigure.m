@interface HMDVideoStreamReconfigure
+ (id)logCategory;
- (HMDVideoStreamReconfigure)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5;
- (id)logIdentifier;
- (void)_addReconfigureEvent:(uint64_t)a1;
- (void)_processDownlinkQuality;
- (void)downlinkQualityChanged:(id)a3;
- (void)setDowngradeDebouceTimer:(uint64_t)a1;
- (void)setUpgradeDebouceTimer:(uint64_t)a1;
- (void)timerDidFire:(id)a3;
- (void)updateReconfigurationMode:(BOOL)a3;
@end

@implementation HMDVideoStreamReconfigure

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_downgradeDebouceTimer, 0);
  objc_storeStrong((id *)&self->_upgradeDebouceTimer, 0);
  objc_storeStrong((id *)&self->_reconfigureEvents, 0);
  objc_storeStrong((id *)&self->_downlinkQualityInfo, 0);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (self->_upgradeDebouceTimer != v4)
    {
      downgradeDebouceTimer = self->_downgradeDebouceTimer;
LABEL_4:
      if (downgradeDebouceTimer == v4)
      {
        v6 = (void *)MEMORY[0x230FBD990]();
        v7 = self;
        v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = HMFGetLogIdentifier();
          int v23 = 138543362;
          v24 = v9;
          _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Downgrade debouce timer has fired, calling network has deteriorated", (uint8_t *)&v23, 0xCu);
        }
        -[HMDVideoStreamReconfigure setDowngradeDebouceTimer:]((uint64_t)v7, 0);
        if (self)
        {
          dispatch_assert_queue_V2((dispatch_queue_t)v7->_workQueue);
          v7->_reconfigurationMode = 1;
          -[HMDVideoStreamReconfigure _addReconfigureEvent:]((uint64_t)v7, 2);
          v10 = (void *)MEMORY[0x230FBD990]();
          v11 = v7;
          v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = HMFGetLogIdentifier();
            int v23 = 138543362;
            v24 = v13;
            _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamReconfigureDidNetworkDeteriorate", (uint8_t *)&v23, 0xCu);
          }
          id WeakRetained = objc_loadWeakRetained(v11 + 8);
          if (objc_opt_respondsToSelector()) {
            [WeakRetained videoStreamReconfigureDidNetworkDeteriorate:v11];
          }
LABEL_20:

          goto LABEL_21;
        }
      }
      goto LABEL_21;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    downgradeDebouceTimer = 0;
    if (v4) {
      goto LABEL_4;
    }
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    int v23 = 138543362;
    v24 = v18;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Upgrade debouce timer has fired, calling network has improved", (uint8_t *)&v23, 0xCu);
  }
  -[HMDVideoStreamReconfigure setUpgradeDebouceTimer:]((uint64_t)v16, 0);
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)v16->_workQueue);
    v16->_reconfigurationMode = 1;
    -[HMDVideoStreamReconfigure _addReconfigureEvent:]((uint64_t)v16, 1);
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = v16;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamReconfigureDidNetworkImprove", (uint8_t *)&v23, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained(v20 + 8);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained videoStreamReconfigureDidNetworkImprove:v20];
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)setUpgradeDebouceTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setDowngradeDebouceTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_addReconfigureEvent:(uint64_t)a1
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
  if ([*(id *)(a1 + 24) count] == 10) {
    [*(id *)(a1 + 24) removeObjectAtIndex:0];
  }
  v4 = [[HMDVideoStreamReconfigureEvent alloc] initWithEventType:a2];
  [*(id *)(a1 + 24) addObject:v4];
}

- (void)downlinkQualityChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    v5 = (void *)[v4 copy];
    objc_storeStrong((id *)&self->_downlinkQualityInfo, v5);

    if (self->_reconfigurationMode)
    {
      v6 = (void *)MEMORY[0x230FBD990]();
      v7 = self;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Not processing the downlink quality change yet, since the stream is in reconfiguration mode", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      -[HMDVideoStreamReconfigure _processDownlinkQuality]((uint64_t)self);
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
}

- (void)_processDownlinkQuality
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
  id v2 = *(id *)(a1 + 16);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = (id)a1;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v82 = v6;
    __int16 v83 = 2112;
    uint64_t v84 = (uint64_t)v2;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Downlink quality changed with %@", buf, 0x16u);
  }
  v80 = objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x263F21040]);
  v7 = objc_msgSend(v2, "hmf_numberForKey:", *MEMORY[0x263F21038]);
  int v8 = objc_msgSend(v2, "hmf_BOOLForKey:", *MEMORY[0x263F21028]);
  int v9 = objc_msgSend(v2, "hmf_BOOLForKey:", *MEMORY[0x263F21030]);
  if (*((void *)v4 + 4) && (v8 & 1) == 0)
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    v11 = (id *)v4;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v82 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Upgrade debounce timer is set, but not operating at maximum anymore, resetting the timer", buf, 0xCu);
    }
    objc_storeStrong(v11 + 4, 0);
  }
  if (*((void *)v4 + 5)) {
    char v14 = v9;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = (id *)v4;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v82 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Downgrade debounce timer is set, but not operating at minimum anymore, resetting the timer", buf, 0xCu);
    }
    objc_storeStrong(v16 + 5, 0);
  }
  if (v9)
  {
    char v19 = [v80 isEqualToNumber:v7];
    uint64_t v20 = *((void *)v4 + 5);
    if (v19)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = (id *)v4;
      int v23 = HMFGetOSLogHandle();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v24)
        {
          uint64_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v82 = v25;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Downgrade debounce timer is already scheduled", buf, 0xCu);
        }
        v26 = v21;
LABEL_28:
        goto LABEL_53;
      }
      if (v24)
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v82 = v41;
        __int16 v83 = 2048;
        uint64_t v84 = videoAttributesDowngradeDebouceTimer;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Starting downgrade debouce timer with interval %llu seconds", buf, 0x16u);
      }
      id v42 = objc_alloc(MEMORY[0x263F42658]);
      v43 = (void *)[v42 initWithTimeInterval:0 options:(double)(unint64_t)videoAttributesDowngradeDebouceTimer];
      objc_storeStrong(v22 + 5, v43);

      [v22[5] setDelegate:v22];
      id v44 = v22[5];
      id v45 = v22[6];
      [v44 setDelegateQueue:v45];

      uint64_t v46 = 5;
      goto LABEL_52;
    }
    if (!v20) {
      goto LABEL_53;
    }
    v33 = (void *)MEMORY[0x230FBD990]();
    v34 = (char *)v4;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v82 = v36;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Downgrade debounce timer is set, but optimal and operating bitrates arent matching, resetting the timer", buf, 0xCu);
    }
    uint64_t v37 = 40;
    goto LABEL_37;
  }
  if (v8)
  {
    char v27 = [v80 isEqualToNumber:v7];
    uint64_t v28 = *((void *)v4 + 4);
    if (v27)
    {
      if (v28)
      {
        uint64_t v29 = MEMORY[0x230FBD990]();
        id v30 = v4;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v82 = v32;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Upgrade debounce timer is already scheduled", buf, 0xCu);
        }
        v26 = (void *)v29;
        goto LABEL_28;
      }
      v79 = v7;
      double v47 = (double)(unint64_t)videoAttributesUpgradeDebouceTimer;
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v4 + 6));
      if ((unint64_t)[*((id *)v4 + 3) count] >= 4)
      {
        id v48 = *((id *)v4 + 3);
        v49 = objc_msgSend(v48, "objectAtIndex:", objc_msgSend(v48, "count") - 1);

        id v50 = *((id *)v4 + 3);
        v51 = objc_msgSend(v50, "objectAtIndex:", objc_msgSend(v50, "count") - 2);

        id v52 = *((id *)v4 + 3);
        v53 = objc_msgSend(v52, "objectAtIndex:", objc_msgSend(v52, "count") - 3);

        v54 = (void *)MEMORY[0x230FBD990]();
        id v55 = v4;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v58 = v57 = v51;
          *(_DWORD *)buf = 138544130;
          v82 = v58;
          __int16 v83 = 2112;
          uint64_t v84 = (uint64_t)v49;
          __int16 v85 = 2112;
          v86 = v57;
          __int16 v87 = 2112;
          v88 = v53;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@reconfigure_1: %@, reconfigure_2: %@, reconfigure_3: %@", buf, 0x2Au);

          v51 = v57;
        }

        v7 = v79;
        if ([v49 eventType] == 2
          && [v51 eventType] == 1
          && [v53 eventType] == 2
          && ([v53 timestamp],
              v59 = v51,
              v60 = objc_claimAutoreleasedReturnValue(),
              [v60 timeIntervalSinceNow],
              double v62 = fabs(v61),
              v60,
              v51 = v59,
              v62 < 120.0))
        {
          v78 = v49;
          v70 = (void *)MEMORY[0x230FBD990]();
          id v71 = v55;
          v72 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            v73 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v73;
            __int16 v83 = 2048;
            uint64_t v84 = *(void *)&v62;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@Downgrade-Upgrade-Downgrade has happened within %lf seconds", buf, 0x16u);

            v51 = v59;
          }

          v74 = (void *)MEMORY[0x230FBD990]();
          id v75 = v71;
          v76 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            v77 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v77;
            __int16 v83 = 2048;
            uint64_t v84 = 0x405E000000000000;
            _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_INFO, "%{public}@A Flip flop has been detected, so upgrade is going to be backed off by %lf seconds", buf, 0x16u);
          }
          double v47 = 120.0;
        }
        else
        {
        }
      }
      v63 = (void *)MEMORY[0x230FBD990]();
      v22 = (id *)v4;
      v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v82 = v65;
        __int16 v83 = 2048;
        uint64_t v84 = *(void *)&v47;
        _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_INFO, "%{public}@Starting upgrade debouce timer with interval %lf seconds", buf, 0x16u);
      }
      v66 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:v47];
      objc_storeStrong(v22 + 4, v66);

      [v22[4] setDelegate:v22];
      id v67 = v22[4];
      id v68 = v22[6];
      [v67 setDelegateQueue:v68];

      uint64_t v46 = 4;
LABEL_52:
      [v22[v46] resume];
      goto LABEL_53;
    }
    if (!v28) {
      goto LABEL_53;
    }
    v38 = (void *)MEMORY[0x230FBD990]();
    v34 = (char *)v4;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v82 = v40;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Upgrade debounce timer is set, but optimal and operating bitrates arent matching, resetting the timer", buf, 0xCu);
    }
    uint64_t v37 = 32;
LABEL_37:
    objc_storeStrong((id *)&v34[v37], 0);
  }
LABEL_53:

  v69 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = 0;
}

- (void)updateReconfigurationMode:(BOOL)a3
{
  id v4 = self;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self) {
    self = (HMDVideoStreamReconfigure *)self->_workQueue;
  }
  dispatch_assert_queue_V2(&self->super.super);
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = v4;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = HMFBooleanToString();
    int v10 = HMFBooleanToString();
    int v15 = 138543874;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating reconfiguration mode from %@ to %@", (uint8_t *)&v15, 0x20u);
  }
  if (v4)
  {
    v6->_reconfigurationMode = a3;
    if (v6->_downlinkQualityInfo)
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = v6;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        char v14 = HMFGetLogIdentifier();
        int v15 = 138543362;
        v16 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Downlink quality info is present, processing it", (uint8_t *)&v15, 0xCu);
      }
      -[HMDVideoStreamReconfigure _processDownlinkQuality]((uint64_t)v12);
    }
  }
}

- (id)logIdentifier
{
  if (self) {
    self = (HMDVideoStreamReconfigure *)self->_sessionID;
  }
  return [(HMFObject *)self description];
}

- (HMDVideoStreamReconfigure)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDVideoStreamReconfigure;
  uint64_t v12 = [(HMDVideoStreamReconfigure *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionID, a3);
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    reconfigureEvents = v13->_reconfigureEvents;
    v13->_reconfigureEvents = (NSMutableArray *)v14;
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_14753 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_14753, &__block_literal_global_14754);
  }
  id v2 = (void *)logCategory__hmf_once_v1_14755;
  return v2;
}

void __40__HMDVideoStreamReconfigure_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_14755;
  logCategory__hmf_once_v1_14755 = v0;
}

@end
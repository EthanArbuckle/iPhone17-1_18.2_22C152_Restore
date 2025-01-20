@interface HMDUserPresenceFeeder
+ (id)logCategory;
- (BOOL)_updatePresenceToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6 fmfStatus:(id)a7;
- (BOOL)isAccountStatusFetchInProgress;
- (HMDUserPresenceFeed)lastSentFeed;
- (HMDUserPresenceFeedSession)currentFeedSession;
- (HMDUserPresenceFeeder)init;
- (NSString)timerID;
- (id)_sendPresenceAuthStatusForUser:(id)a3 presenceAuthStatus:(id)a4 presenceRegionStatus:(id)a5 presenceComputeStatus:(id)a6 reason:(id)a7;
- (int64_t)ckAccountStatus;
- (unint64_t)presenceRegionStatus;
- (void)_handleLocationAuthorizationChangedNotification:(id)a3;
- (void)_handlePrivilegeUpdate:(id)a3;
- (void)_registerForMessages;
- (void)_sendPresenceReport:(unint64_t)a3;
- (void)_sendPresenceUpdateToResident:(id)a3;
- (void)_sendPresenceUpdateToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6;
- (void)_sendPresenceUpdateToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6 fmfStatus:(id)a7;
- (void)_startRefreshTimer;
- (void)_updatePresenceComputeStatus:(id)a3;
- (void)accountAvailabilityChanged:(id)a3;
- (void)configure:(id)a3 messageDispatcher:(id)a4;
- (void)didEndFeedSession:(id)a3;
- (void)fetchCKAccountStatusAndSendPresenceReport;
- (void)fmfStatusUpdateNotification:(id)a3;
- (void)handleHomeDataLoadedNotification:(id)a3;
- (void)handleResidentDeviceConfirmed:(id)a3;
- (void)handleTimerFiredNotification:(id)a3;
- (void)homeDataProcessed;
- (void)notifyDidArriveHome;
- (void)notifyDidEnterHomeRegion;
- (void)notifyDidLeaveHome;
- (void)notifyDidLeaveHomeRegion;
- (void)presenceAuthChanged;
- (void)presenceAuthStatusChangedForUser:(id)a3 presenceAuthStatus:(id)a4;
- (void)residentChanged;
- (void)sendInitialPresenceUpdate;
- (void)setCkAccountStatus:(int64_t)a3;
- (void)setCurrentFeedSession:(id)a3;
- (void)setIsAccountStatusFetchInProgress:(BOOL)a3;
- (void)setLastSentFeed:(id)a3;
- (void)setPresenceRegionStatus:(unint64_t)a3;
@end

@implementation HMDUserPresenceFeeder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSentFeed, 0);
  objc_storeStrong((id *)&self->_currentFeedSession, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (void)setIsAccountStatusFetchInProgress:(BOOL)a3
{
  self->_isAccountStatusFetchInProgress = a3;
}

- (BOOL)isAccountStatusFetchInProgress
{
  return self->_isAccountStatusFetchInProgress;
}

- (void)setCkAccountStatus:(int64_t)a3
{
  self->_ckAccountStatus = a3;
}

- (int64_t)ckAccountStatus
{
  return self->_ckAccountStatus;
}

- (void)setLastSentFeed:(id)a3
{
}

- (HMDUserPresenceFeed)lastSentFeed
{
  return self->_lastSentFeed;
}

- (void)setCurrentFeedSession:(id)a3
{
}

- (HMDUserPresenceFeedSession)currentFeedSession
{
  return self->_currentFeedSession;
}

- (unint64_t)presenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (NSString)timerID
{
  return self->_timerID;
}

- (void)notifyDidLeaveHomeRegion
{
  v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDUserPresenceFeeder_notifyDidLeaveHomeRegion__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __49__HMDUserPresenceFeeder_notifyDidLeaveHomeRegion__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Did leave home region", (uint8_t *)&v8, 0xCu);
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  v7 = [*(id *)(a1 + 32) home];
  [v6 postNotificationName:@"HMDHomeRegionExitedNotificationKey" object:v7];
}

- (void)notifyDidEnterHomeRegion
{
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMDUserPresenceFeeder_notifyDidEnterHomeRegion__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __49__HMDUserPresenceFeeder_notifyDidEnterHomeRegion__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Did enter home region", (uint8_t *)&v8, 0xCu);
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  v7 = [*(id *)(a1 + 32) home];
  [v6 postNotificationName:@"HMDHomeRegionEnteredNotificationKey" object:v7];
}

- (void)notifyDidLeaveHome
{
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDUserPresenceFeeder_notifyDidLeaveHome__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__HMDUserPresenceFeeder_notifyDidLeaveHome__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Did leave home", (uint8_t *)&v9, 0xCu);
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  v7 = [*(id *)(a1 + 32) home];
  [v6 postNotificationName:@"HMDHomeDidLeaveHomeNotificationKey" object:v7];

  return [*(id *)(a1 + 32) setPresenceRegionStatus:2];
}

- (void)notifyDidArriveHome
{
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMDUserPresenceFeeder_notifyDidArriveHome__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__HMDUserPresenceFeeder_notifyDidArriveHome__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Did arrive home", (uint8_t *)&v9, 0xCu);
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  v7 = [*(id *)(a1 + 32) home];
  [v6 postNotificationName:@"HMDHomeDidArriveHomeNotificationKey" object:v7];

  return [*(id *)(a1 + 32) setPresenceRegionStatus:1];
}

- (void)didEndFeedSession:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUserPresenceFeeder *)self currentFeedSession];

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  int v8 = HMFGetOSLogHandle();
  int v9 = v8;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v11;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ is complete", (uint8_t *)&v24, 0x16u);
    }
    [(HMDUserPresenceFeeder *)v7 setCurrentFeedSession:0];
    v12 = [HMDUserPresenceFeed alloc];
    v13 = [v4 user];
    v14 = [v4 presenceAuthStatus];
    v15 = [v4 presenceComputeStatus];
    v16 = [v4 presenceRegionStatus];
    v17 = [v4 reason];
    v18 = [(HMDUserPresenceFeed *)v12 initWithUser:v13 presenceAuthStatus:v14 presenceComputeStatus:v15 presenceRegion:v16 reason:v17];
    [(HMDUserPresenceFeeder *)v7 setLastSentFeed:v18];

    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = v7;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [(HMDUserPresenceFeeder *)v20 lastSentFeed];
      int v24 = 138543618;
      v25 = v22;
      __int16 v26 = 2112;
      id v27 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating last sent feed to %@", (uint8_t *)&v24, 0x16u);
    }
    [(HMDUserPresenceFeeder *)v20 _startRefreshTimer];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v10;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ is not tracked", (uint8_t *)&v24, 0x16u);
    }
  }
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDLocationAuthorizationKey");

  if (v6)
  {
    [v6 integerValue];
    v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = HMDLocationAuthorizationAsString();
      int v16 = 138543618;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Latest Location Authorization is %@", (uint8_t *)&v16, 0x16u);
    }
    [(HMDUserPresenceFeeder *)v8 _sendPresenceReport:5];
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@No location authorization key in the message", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_updatePresenceComputeStatus:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomePresenceBase *)self home];
  v6 = [v5 presenceComputeStatus];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    int v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = [v5 presenceComputeStatus];
      int v29 = 138543618;
      v30 = v11;
      __int16 v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Presence compute status is not changing from %@", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    v13 = [HMDHomeModel alloc];
    v14 = [v5 uuid];
    v15 = [v5 homeManager];
    int v16 = [v15 uuid];
    v17 = [(HMDBackingStoreModelObject *)v13 initWithObjectChangeType:2 uuid:v14 parentUUID:v16];

    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [v5 presenceComputeStatus];
      int v29 = 138543874;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v22;
      __int16 v33 = 2112;
      id v34 = v4;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Presence compute status is changing from %@ to %@", (uint8_t *)&v29, 0x20u);
    }
    v23 = [v4 number];
    [(HMDHomeModel *)v17 setPresenceComputeStatus:v23];

    int v24 = [MEMORY[0x263F42568] messageWithName:@"kPresenceComputeStatusUpdate" messagePayload:0];
    v25 = [v5 backingStore];
    __int16 v26 = [v24 name];
    id v27 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v28 = [v25 transaction:v26 options:v27];

    [v28 add:v17 withMessage:v24];
    [v28 run];
  }
}

- (id)_sendPresenceAuthStatusForUser:(id)a3 presenceAuthStatus:(id)a4 presenceRegionStatus:(id)a5 presenceComputeStatus:(id)a6 reason:(id)a7
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  v12 = a3;
  id v103 = a4;
  v13 = (HMDUserPresenceFeed *)a5;
  v14 = (HMDUserPresenceFeed *)a6;
  id v15 = a7;
  int v16 = [(HMDHomePresenceBase *)self home];
  v17 = [v16 homeManager];
  __int16 v18 = [v17 messageDispatcher];

  v19 = [v16 residentDeviceManager];
  uint64_t v20 = [v19 primaryResidentDevice];

  v21 = [v20 device];
  if (!v21)
  {
    v101 = v13;
    v30 = v12;
    __int16 v31 = (void *)MEMORY[0x230FBD990]();
    v32 = self;
    __int16 v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v34 = v20;
      uint64_t v35 = v18;
      id v36 = v15;
      v38 = v37 = v14;
      *(_DWORD *)buf = 138543618;
      v105 = v38;
      __int16 v106 = 2112;
      id v107 = 0;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Primary resident device %@ is not set, not notifying", buf, 0x16u);

      v14 = v37;
      id v15 = v36;
      __int16 v18 = v35;
      uint64_t v20 = v34;
      v21 = 0;
    }

    int v29 = [MEMORY[0x263F087E8] hmErrorWithCode:91];
    v12 = v30;
    goto LABEL_10;
  }
  if ([v20 supportsSharedEventTriggerActivation])
  {
    v96 = v14;
    v22 = +[HMDLostModeManager sharedManager];
    int v23 = [v22 isLost];

    v101 = v13;
    if (v23)
    {
      int v24 = v12;
      v25 = (void *)MEMORY[0x230FBD990]();
      __int16 v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v105 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Device Lost. Not sending presence feed", buf, 0xCu);
      }
      int v29 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      v12 = v24;
      v14 = v96;
LABEL_10:
      v13 = v101;
      goto LABEL_36;
    }
    v49 = [(HMDUserPresenceFeeder *)self currentFeedSession];

    v95 = v21;
    if (v49)
    {
      os_log_t loga = v12;
      v50 = (void *)MEMORY[0x230FBD990]();
      v51 = self;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = v91 = v50;
        [(HMDUserPresenceFeeder *)v51 currentFeedSession];
        v55 = v54 = v21;
        *(_DWORD *)buf = 138543618;
        v105 = v53;
        __int16 v106 = 2112;
        id v107 = v55;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@There is currently %@ active", buf, 0x16u);

        v21 = v54;
        v13 = v101;

        v50 = v91;
      }

      v56 = [(HMDUserPresenceFeeder *)v51 currentFeedSession];
      v57 = [v56 presenceAuthStatus];
      if (HMFEqualObjects())
      {
        v58 = [(HMDUserPresenceFeeder *)v51 currentFeedSession];
        v59 = [v58 presenceRegionStatus];
        int v92 = HMFEqualObjects();

        v21 = v95;
        v13 = v101;

        if (v92)
        {
          v60 = (void *)MEMORY[0x230FBD990]();
          v61 = v51;
          v62 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            v64 = [(HMDUserPresenceFeeder *)v61 currentFeedSession];
            *(_DWORD *)buf = 138543618;
            v105 = v63;
            __int16 v106 = 2112;
            id v107 = v64;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Current feed session %@ already contains same auth and region status, ignoring", buf, 0x16u);

            v21 = v95;
            v13 = v101;
          }

          int v29 = 0;
          v14 = v96;
          v12 = loga;
          goto LABEL_36;
        }
      }
      else
      {
      }
      v65 = (void *)MEMORY[0x230FBD990]();
      v66 = v51;
      v67 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v93 = v65;
        v69 = v68 = v13;
        *(_DWORD *)buf = 138544130;
        v105 = v69;
        __int16 v106 = 2112;
        id v107 = v103;
        __int16 v108 = 2112;
        v109 = v68;
        __int16 v110 = 2112;
        v111 = v21;
        _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_INFO, "%{public}@Current feed session is different than newer one. [presenceAuth = %@], [presenceRegion : %@], [resident: %@]", buf, 0x2Au);

        v13 = v68;
        v65 = v93;
      }

      v12 = loga;
    }
    v14 = v96;
    if ([v15 value] == 11)
    {
      v70 = [[HMDUserPresenceFeed alloc] initWithUser:v12 presenceAuthStatus:v103 presenceComputeStatus:v96 presenceRegion:v13 reason:v15];
      v71 = [(HMDUserPresenceFeeder *)self lastSentFeed];
      int v72 = [v71 isEqual:v70];

      if (v72)
      {
        v73 = (void *)MEMORY[0x230FBD990]();
        v74 = self;
        v75 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v76 = v94 = v73;
          [(HMDUserPresenceFeeder *)v74 lastSentFeed];
          v77 = logb = v75;
          *(_DWORD *)buf = 138543874;
          v105 = v76;
          __int16 v106 = 2112;
          id v107 = v77;
          __int16 v108 = 2112;
          v109 = v70;
          _os_log_impl(&dword_22F52A000, logb, OS_LOG_TYPE_INFO, "%{public}@Last feed %@ is same as the new feed %@", buf, 0x20u);

          v75 = logb;
          v73 = v94;
        }

LABEL_35:

        int v29 = 0;
        v13 = v101;
        v21 = v95;
        goto LABEL_36;
      }

      v13 = v101;
    }
    v78 = [HMDUserPresenceFeedSession alloc];
    [(HMDHomePresenceBase *)self workQueue];
    v80 = v79 = v13;
    uint64_t v81 = [(HMDHomePresenceBase *)self presenceMonitorMessageTargetUUID];
    v82 = v79;
    v83 = (void *)v81;
    v84 = [(HMDUserPresenceFeedSession *)v78 initWithDelegate:self workQueue:v80 targetUUID:v81 messageDispatcher:v18 user:v12 presenceAuthStatus:v103 presenceComputeStatus:v96 presenceRegionStatus:v82 reason:v15];
    [(HMDUserPresenceFeeder *)self setCurrentFeedSession:v84];

    v85 = MEMORY[0x230FBD990]();
    v86 = self;
    v87 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v88 = os_log_t logc = v85;
      v89 = [(HMDUserPresenceFeeder *)v86 currentFeedSession];
      *(_DWORD *)buf = 138543874;
      v105 = v88;
      __int16 v106 = 2112;
      id v107 = v89;
      __int16 v108 = 2112;
      v109 = v96;
      _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_INFO, "%{public}@Created new feed session %@ with new computed status : %@", buf, 0x20u);

      v85 = logc;
    }

    v70 = [(HMDUserPresenceFeeder *)v86 currentFeedSession];
    [(HMDUserPresenceFeed *)v70 send];
    goto LABEL_35;
  }
  os_log_t log = v12;
  v39 = (void *)MEMORY[0x230FBD990]();
  v40 = self;
  v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v102 = v13;
    v42 = v16;
    v43 = v21;
    v44 = v20;
    v45 = v18;
    id v46 = v15;
    v48 = v47 = v14;
    *(_DWORD *)buf = 138543618;
    v105 = v48;
    __int16 v106 = 2112;
    id v107 = v43;
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Primary resident device %@ is not capable of presence status, not notifying", buf, 0x16u);

    v14 = v47;
    id v15 = v46;
    __int16 v18 = v45;
    uint64_t v20 = v44;
    v21 = v43;
    int v16 = v42;
    v13 = v102;
  }

  int v29 = [MEMORY[0x263F087E8] hmErrorWithCode:92];
  v12 = log;
LABEL_36:

  return v29;
}

- (BOOL)_updatePresenceToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6 fmfStatus:(id)a7
{
  BOOL v9 = a5;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = [MEMORY[0x263F0E8C8] authWithValue:1];
  switch([v13 value])
  {
    case 0:
      uint64_t v15 = MEMORY[0x230FBD990]();
      int v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v79 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@FMF Device status is unknown, cannot send report", buf, 0xCu);
      }
      v19 = (void *)v15;
      goto LABEL_30;
    case 1:
      id v77 = v13;
      v21 = [MEMORY[0x263F0E8D0] computeWithValue:3];
      uint64_t v20 = 0;
      if (v9) {
        goto LABEL_42;
      }
      goto LABEL_39;
    case 2:
      id v77 = v13;
      if ([v14 value] == 1)
      {
        v22 = +[HMDLocation sharedManager];
        uint64_t v23 = [v22 locationAuthorized];

        int v24 = (void *)MEMORY[0x230FBD990]();
        v25 = self;
        __int16 v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v27 = v76 = v24;
          uint64_t v28 = HMDLocationAuthorizationAsString();
          *(_DWORD *)buf = 138543618;
          v79 = v27;
          __int16 v80 = 2112;
          uint64_t v81 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Current Location Authorization : %@", buf, 0x16u);

          int v24 = v76;
        }

        if (v23 == 1)
        {
          v21 = [MEMORY[0x263F0E8D0] computeWithValue:4];
          uint64_t v20 = +[HMDUserPresenceRegion regionWithValue:[(HMDUserPresenceFeeder *)v25 presenceRegionStatus]];
          goto LABEL_36;
        }
        if (!v23)
        {
          int v29 = (void *)MEMORY[0x230FBD990]();
          v30 = v25;
          __int16 v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v79 = v32;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Looks like we are still waiting for location authorization status from Core Location. Till we determine that let's not send the presence update.", buf, 0xCu);
          }
          goto LABEL_52;
        }
        v49 = (void *)MEMORY[0x263F0E8D0];
        uint64_t v50 = 2;
      }
      else
      {
        v45 = (void *)MEMORY[0x230FBD990]();
        id v46 = self;
        v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v79 = v48;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@We do not have presence authorization for this user.", buf, 0xCu);
        }
        v49 = (void *)MEMORY[0x263F0E8D0];
        uint64_t v50 = 1;
      }
      v21 = objc_msgSend(v49, "computeWithValue:", v50, v76);
      uint64_t v20 = 0;
LABEL_36:
      v58 = (void *)MEMORY[0x230FBD990]();
      v59 = self;
      v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v76 = v12;
        v62 = id v61 = v11;
        *(_DWORD *)buf = 138543618;
        v79 = v62;
        __int16 v80 = 2112;
        uint64_t v81 = v21;
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@This is the FMF device. Presence compute status : %@", buf, 0x16u);

        id v11 = v61;
        id v12 = v76;
      }

      if (!v9)
      {
LABEL_39:
        if (objc_msgSend(v14, "value", v76) == 1 && objc_msgSend(v21, "value") == 4 && !objc_msgSend(v20, "value"))
        {
          v70 = (void *)MEMORY[0x230FBD990]();
          v71 = self;
          int v72 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v73 = v12;
            v75 = id v74 = v11;
            *(_DWORD *)buf = 138543362;
            v79 = v75;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@Presence region status is still unknown, bailing out as a later update will be sent", buf, 0xCu);

            id v11 = v74;
            id v12 = v73;
          }

LABEL_52:
          BOOL v57 = 0;
          goto LABEL_47;
        }
      }
LABEL_42:
      v63 = -[HMDUserPresenceFeeder _sendPresenceAuthStatusForUser:presenceAuthStatus:presenceRegionStatus:presenceComputeStatus:reason:](self, "_sendPresenceAuthStatusForUser:presenceAuthStatus:presenceRegionStatus:presenceComputeStatus:reason:", v11, v14, v20, v21, v12, v76);
      if (v21) {
        [(HMDUserPresenceFeeder *)self _updatePresenceComputeStatus:v21];
      }
      v64 = (void *)MEMORY[0x230FBD990]();
      v65 = self;
      v66 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v68 = id v67 = v11;
        *(_DWORD *)buf = 138544130;
        v79 = v68;
        __int16 v80 = 2112;
        uint64_t v81 = v67;
        __int16 v82 = 2112;
        v83 = v14;
        __int16 v84 = 2112;
        v85 = v63;
        _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_INFO, "%{public}@Sending status update of presence for user: %@, auth: %@ resulted in %@", buf, 0x2Au);

        id v11 = v67;
      }

      BOOL v57 = v63 == 0;

LABEL_47:
      id v13 = v77;
LABEL_48:

      return v57;
    case 3:
      id v77 = v13;
      __int16 v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = self;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v36 = v12;
        v38 = id v37 = v11;
        *(_DWORD *)buf = 138543362;
        v79 = v38;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@There is an FMF device, but this device is not the FMF device", buf, 0xCu);

        id v11 = v37;
        id v12 = v36;
      }

      if (v9)
      {
        if ([v14 value] == 1)
        {
          v39 = (void *)MEMORY[0x230FBD990]();
          v40 = v34;
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v42 = v12;
            v44 = id v43 = v11;
            *(_DWORD *)buf = 138543362;
            v79 = v44;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Presence-auth is changing to authorized", buf, 0xCu);

            id v11 = v43;
            id v12 = v42;
          }

          v21 = 0;
        }
        else
        {
          v21 = [MEMORY[0x263F0E8D0] computeWithValue:1];
        }
        uint64_t v20 = 0;
        goto LABEL_42;
      }
      uint64_t v51 = MEMORY[0x230FBD990]();
      v52 = v34;
      v53 = HMFGetOSLogHandle();
      id v13 = v77;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v54 = v12;
        v56 = id v55 = v11;
        *(_DWORD *)buf = 138543362;
        v79 = v56;
        _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@There is an FMF device, but this device is not the FMF device. Presence-auth is authorized, the FMF device will send the message.", buf, 0xCu);

        id v11 = v55;
        id v12 = v54;
      }

      v19 = (void *)v51;
LABEL_30:
      BOOL v57 = 0;
      goto LABEL_48;
    default:
      id v77 = v13;
      uint64_t v20 = 0;
      v21 = 0;
      if (v9) {
        goto LABEL_42;
      }
      goto LABEL_39;
  }
}

- (void)_sendPresenceUpdateToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6 fmfStatus:(id)a7
{
  BOOL v9 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = [(HMDUserPresenceFeeder *)self _updatePresenceToResidentForUser:v12 presenceAuthStatus:v13 authChanging:v9 reason:v14 fmfStatus:v15];
  v17 = (void *)MEMORY[0x230FBD990]();
  __int16 v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    v21 = HMFBooleanToString();
    int v26 = 138543618;
    id v27 = v20;
    __int16 v28 = 2112;
    int v29 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Presence update to resident ended in success: %@", (uint8_t *)&v26, 0x16u);
  }
  if (!v16)
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v18;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Resetting current feed session as the presence update to resident did not go through", (uint8_t *)&v26, 0xCu);
    }
    [(HMDUserPresenceFeeder *)v23 setCurrentFeedSession:0];
  }
}

- (void)_sendPresenceUpdateToResidentForUser:(id)a3 presenceAuthStatus:(id)a4 authChanging:(BOOL)a5 reason:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v28 = v16;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Status update of presence for user: %@, auth: %@", buf, 0x20u);
  }
  if (v10)
  {
    v17 = +[HMDFMFHandler sharedHandler];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke;
    v22[3] = &unk_264A1AA20;
    v22[4] = v14;
    id v23 = v10;
    id v24 = v11;
    BOOL v26 = a5;
    id v25 = v12;
    [v17 queryFMFStatusWithCompletion:v22];
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v14;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v28 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Cannot send the presence update as the user is nil", buf, 0xCu);
    }
  }
}

void __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke_2;
  v7[3] = &unk_264A25E60;
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __101__HMDUserPresenceFeeder__sendPresenceUpdateToResidentForUser_presenceAuthStatus_authChanging_reason___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Device Status is %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _sendPresenceUpdateToResidentForUser:*(void *)(a1 + 48) presenceAuthStatus:*(void *)(a1 + 56) authChanging:*(unsigned __int8 *)(a1 + 72) reason:*(void *)(a1 + 64) fmfStatus:*(void *)(a1 + 40)];
}

- (void)_sendPresenceUpdateToResident:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomePresenceBase *)self home];
  id v7 = [v5 currentUser];

  uint64_t v6 = [v7 presenceAuthStatus];
  [(HMDUserPresenceFeeder *)self _sendPresenceUpdateToResidentForUser:v7 presenceAuthStatus:v6 authChanging:0 reason:v4];
}

- (void)_sendPresenceReport:(unint64_t)a3
{
  id v4 = +[HMDUserPresenceUpdateReason reasonWithValue:a3];
  [(HMDUserPresenceFeeder *)self _sendPresenceUpdateToResident:v4];
}

- (void)residentChanged
{
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMDUserPresenceFeeder_residentChanged__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __40__HMDUserPresenceFeeder_residentChanged__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Trying to send report after resident changed", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _sendPresenceReport:8];
}

- (void)sendInitialPresenceUpdate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomePresenceBase *)self workQueue];

  if (v3)
  {
    id v4 = [(HMDHomePresenceBase *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HMDUserPresenceFeeder_sendInitialPresenceUpdate__block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    uint64_t v6 = self;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not send the initial presence as the presence feeder is not yet configured.", buf, 0xCu);
    }
  }
}

uint64_t __50__HMDUserPresenceFeeder_sendInitialPresenceUpdate__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 32) home];
    int v7 = [v6 currentUser];
    int v9 = 138543618;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending the initial presence report for %@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) _sendPresenceReport:3];
}

- (void)_handlePrivilegeUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"kUserUUIDKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    int v9 = [(HMDHomePresenceBase *)self workQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__HMDUserPresenceFeeder__handlePrivilegeUpdate___block_invoke;
    v14[3] = &unk_264A2F820;
    v14[4] = self;
    v14[5] = v8;
    dispatch_async(v9, v14);
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@User privilege changed but the userInfo does not have the required key inside it.", buf, 0xCu);
    }
  }
}

void __48__HMDUserPresenceFeeder__handlePrivilegeUpdate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 currentUser];
  id v4 = [v3 uuid];
  char v5 = HMFEqualObjects();

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@User privilege changed: Updating presence map", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) _sendPresenceReport:12];
  }
  else
  {
    if (v9)
    {
      __int16 v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Not going to update the presence for [%@] as it is not the current user in the home", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)handleResidentDeviceConfirmed:(id)a3
{
  id v4 = [(HMDHomePresenceBase *)self home];
  char v5 = [v4 residentDeviceManager];
  uint64_t v6 = [v5 primaryResidentDevice];

  if (v6)
  {
    [(HMDUserPresenceFeeder *)self residentChanged];
  }
}

- (void)presenceAuthChanged
{
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMDUserPresenceFeeder_presenceAuthChanged__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__HMDUserPresenceFeeder_presenceAuthChanged__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Trying to send report after presence auth changed", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _sendPresenceReport:9];
}

- (void)presenceAuthStatusChangedForUser:(id)a3 presenceAuthStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDUserPresenceFeeder_presenceAuthStatusChangedForUser_presenceAuthStatus___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__HMDUserPresenceFeeder_presenceAuthStatusChangedForUser_presenceAuthStatus___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  id v4 = +[HMDUserPresenceUpdateReason reasonWithValue:9];
  [v1 _sendPresenceUpdateToResidentForUser:v2 presenceAuthStatus:v3 authChanging:1 reason:v4];
}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4 = [a3 userInfo];
  char v5 = objc_msgSend(v4, "hmf_stringForKey:", @"HMD.BGTM.NK");

  id v6 = [(HMDUserPresenceFeeder *)self timerID];
  int v7 = HMFEqualObjects();

  if (v7)
  {
    id v8 = [(HMDHomePresenceBase *)self workQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__HMDUserPresenceFeeder_handleTimerFiredNotification___block_invoke;
    v9[3] = &unk_264A2F820;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

uint64_t __54__HMDUserPresenceFeeder_handleTimerFiredNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Timer fired with ID: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) _sendPresenceReport:7];
}

- (void)_startRefreshTimer
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserPresenceFeeder *)self timerID];
  id v4 = (void *)MEMORY[0x230FBD990]();
  char v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting the refresh timer with ID: %@", buf, 0x16u);
  }
  int v8 = +[HMDBackgroundTaskManager sharedManager];
  [v8 cancelTaskWithIdentifier:v3 onObserver:v5];

  id v9 = [MEMORY[0x263EFF910] date];
  __int16 v10 = [v9 dateComponents];

  uint64_t v11 = [v10 minute];
  [v10 setMinute:presenceFeedRefreshInMinutes + v11];
  uint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v13 = [v12 dateFromComponents:v10];

  id v14 = +[HMDBackgroundTaskManager sharedManager];
  id v21 = 0;
  char v15 = [v14 scheduleTaskWithIdentifier:v3 fireDate:v13 onObserver:v5 selector:sel_handleTimerFiredNotification_ error:&v21];
  id v16 = v21;

  if ((v15 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    __int16 v18 = v5;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = v3;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);
    }
  }
}

- (void)setPresenceRegionStatus:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v5 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = HMDUserPresenceRegionStatusAsString(v6->_presenceRegionStatus);
    __int16 v10 = HMDUserPresenceRegionStatusAsString(a3);
    int v14 = 138543874;
    char v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating presence status from %@ to %@", (uint8_t *)&v14, 0x20u);
  }
  unint64_t presenceRegionStatus = v6->_presenceRegionStatus;
  if (presenceRegionStatus == a3)
  {
    uint64_t v12 = 3;
  }
  else
  {
    if (presenceRegionStatus) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 3;
    }
    v6->_unint64_t presenceRegionStatus = a3;
  }
  id v13 = +[HMDUserPresenceUpdateReason reasonWithValue:v12];
  [(HMDUserPresenceFeeder *)v6 _sendPresenceUpdateToResident:v13];
}

- (void)handleHomeDataLoadedNotification:(id)a3
{
  id v4 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDUserPresenceFeeder_handleHomeDataLoadedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __58__HMDUserPresenceFeeder_handleHomeDataLoadedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received home data loaded notification, sending presence report", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _sendPresenceReport:3];
}

- (void)homeDataProcessed
{
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDUserPresenceFeeder_homeDataProcessed__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __42__HMDUserPresenceFeeder_homeDataProcessed__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Home data has been processed, trying to send presence report", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _sendPresenceReport:11];
}

- (void)fmfStatusUpdateNotification:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDHomePresenceBase *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMDUserPresenceFeeder_fmfStatusUpdateNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__HMDUserPresenceFeeder_fmfStatusUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = +[HMDFMF fmfStatusWithDict:v2];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received FMF status update notification with %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) _sendPresenceReport:4];
}

- (void)fetchCKAccountStatusAndSendPresenceReport
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomePresenceBase *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDUserPresenceFeeder *)self isAccountStatusFetchInProgress])
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@CK Account fetch status already in progress. Not calling it again.", buf, 0xCu);
    }
  }
  else
  {
    [(HMDUserPresenceFeeder *)self setIsAccountStatusFetchInProgress:1];
    objc_initWeak((id *)buf, self);
    int v8 = getCKContainer();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__HMDUserPresenceFeeder_fetchCKAccountStatusAndSendPresenceReport__block_invoke;
    v9[3] = &unk_264A1A9F8;
    objc_copyWeak(&v10, (id *)buf);
    [v8 accountStatusWithCompletionHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __66__HMDUserPresenceFeeder_fetchCKAccountStatusAndSendPresenceReport__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = WeakRetained;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = [NSNumber numberWithInteger:a2];
    int v22 = 138543874;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@CK accountStatus completed with %@, %@", (uint8_t *)&v22, 0x20u);
  }
  if (v8)
  {
    uint64_t v12 = [v8 setIsAccountStatusFetchInProgress:0];
    if (v5)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990](v12);
      id v14 = v8;
      char v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = HMFGetLogIdentifier();
        int v22 = 138543618;
        id v23 = v16;
        __int16 v24 = 2112;
        id v25 = v5;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@CK accountStatus failed with error: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    else if ([v8 ckAccountStatus] != a2)
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]([v8 setCkAccountStatus:a2]);
      id v18 = v8;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "ckAccountStatus"));
        int v22 = 138543618;
        id v23 = v20;
        __int16 v24 = 2112;
        id v25 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating the CK account status to %@. Sending the presence report", (uint8_t *)&v22, 0x16u);
      }
      [v18 _sendPresenceReport:10];
    }
  }
}

- (void)accountAvailabilityChanged:(id)a3
{
  id v4 = [(HMDHomePresenceBase *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HMDUserPresenceFeeder_accountAvailabilityChanged___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __52__HMDUserPresenceFeeder_accountAvailabilityChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchCKAccountStatusAndSendPresenceReport];
}

- (void)_registerForMessages
{
  v5.receiver = self;
  v5.super_class = (Class)HMDUserPresenceFeeder;
  [(HMDHomePresenceBase *)&v5 _registerForMessages];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleLocationAuthorizationChangedNotification_ name:@"HMDLocationAuthorizationChangedNotification" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_fmfStatusUpdateNotification_ name:@"HMDFMFStatusUpdateNotification" object:0];
}

- (void)configure:(id)a3 messageDispatcher:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HMDUserPresenceFeeder;
  id v6 = a3;
  [(HMDHomePresenceBase *)&v15 configure:v6 messageDispatcher:a4];
  int v7 = NSString;
  id v8 = [(HMDHomePresenceBase *)self presenceMonitorMessageTargetUUID];
  uint64_t v9 = [v8 UUIDString];
  id v10 = [v7 stringWithFormat:@"presence.feeder/%@", v9];
  timerID = self->_timerID;
  self->_timerID = v10;

  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v13 = [v6 residentDeviceManager];

  [v12 addObserver:self selector:sel_handleResidentDeviceConfirmed_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification" object:v13];
  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__handlePrivilegeUpdate_ name:@"HMDUserPrivilegeDidChangeNotification" object:0];
}

- (HMDUserPresenceFeeder)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDUserPresenceFeeder;
  result = [(HMDUserPresenceFeeder *)&v3 init];
  if (result)
  {
    result->_unint64_t presenceRegionStatus = 0;
    result->_ckAccountStatus = 0;
    result->_isAccountStatusFetchInProgress = 0;
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t49 != -1) {
    dispatch_once(&logCategory__hmf_once_t49, &__block_literal_global_52096);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v50;
  return v2;
}

void __36__HMDUserPresenceFeeder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v50;
  logCategory__hmf_once_uint64_t v50 = v0;
}

@end
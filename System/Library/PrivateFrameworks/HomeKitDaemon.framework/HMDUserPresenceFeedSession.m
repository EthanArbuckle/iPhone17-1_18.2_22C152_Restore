@interface HMDUserPresenceFeedSession
+ (id)logCategory;
- (BOOL)isActivityStateEnabled;
- (HMDUser)user;
- (HMDUserPresenceFeedRetryTimer)statusUpdateRetryTimer;
- (HMDUserPresenceFeedSession)initWithDelegate:(id)a3 workQueue:(id)a4 targetUUID:(id)a5 messageDispatcher:(id)a6 user:(id)a7 presenceAuthStatus:(id)a8 presenceComputeStatus:(id)a9 presenceRegionStatus:(id)a10 reason:(id)a11;
- (HMDUserPresenceFeedSessionDelegate)delegate;
- (HMDUserPresenceRegion)presenceRegionStatus;
- (HMDUserPresenceUpdateReason)reason;
- (HMFMessageDispatcher)messageDispatcher;
- (HMUserPresenceAuthorization)presenceAuthStatus;
- (HMUserPresenceCompute)presenceComputeStatus;
- (NSDate)statusChangeDate;
- (NSString)logIdentifierString;
- (NSUUID)sessionID;
- (NSUUID)targetUUID;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (void)_callDelegate;
- (void)_handleStatusUpdateMessageError:(id)a3 responseTime:(double)a4;
- (void)_send;
- (void)dealloc;
- (void)send;
- (void)setLogIdentifierString:(id)a3;
- (void)setReason:(id)a3;
- (void)setStatusUpdateRetryTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDUserPresenceFeedSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifierString, 0);
  objc_storeStrong((id *)&self->_statusUpdateRetryTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_statusChangeDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_presenceRegionStatus, 0);
  objc_storeStrong((id *)&self->_presenceComputeStatus, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)isActivityStateEnabled
{
  return self->_activityStateEnabled;
}

- (void)setLogIdentifierString:(id)a3
{
}

- (NSString)logIdentifierString
{
  return self->_logIdentifierString;
}

- (void)setStatusUpdateRetryTimer:(id)a3
{
}

- (HMDUserPresenceFeedRetryTimer)statusUpdateRetryTimer
{
  return self->_statusUpdateRetryTimer;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (NSDate)statusChangeDate
{
  return self->_statusChangeDate;
}

- (void)setReason:(id)a3
{
}

- (HMDUserPresenceUpdateReason)reason
{
  return self->_reason;
}

- (HMDUserPresenceRegion)presenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (HMUserPresenceCompute)presenceComputeStatus
{
  return self->_presenceComputeStatus;
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  return self->_presenceAuthStatus;
}

- (HMDUser)user
{
  return self->_user;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (NSUUID)targetUUID
{
  return self->_targetUUID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDUserPresenceFeedSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserPresenceFeedSessionDelegate *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDUserPresenceFeedSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDUserPresenceFeedSession *)self statusUpdateRetryTimer];
  id v7 = [v6 retryTimer];

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Retrying to send the report to the resident", (uint8_t *)&v12, 0xCu);
    }
    [(HMDUserPresenceFeedSession *)v9 _send];
  }
}

- (void)_callDelegate
{
  v3 = [(HMDUserPresenceFeedSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPresenceFeedSession *)self delegate];
  if ([v4 conformsToProtocol:&unk_26E4E5068]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    [v6 didEndFeedSession:self];
  }
}

- (void)_handleStatusUpdateMessageError:(id)a3 responseTime:(double)a4
{
  id v7 = [(HMDUserPresenceFeedSession *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (a3)
  {
    v8 = [(HMDUserPresenceFeedSession *)self statusUpdateRetryTimer];
    objc_msgSend(v8, "setRetryCount:", objc_msgSend(v8, "retryCount") + 1);

    id v10 = [(HMDUserPresenceFeedSession *)self statusUpdateRetryTimer];
    v9 = [(HMDUserPresenceFeedSession *)self workQueue];
    [v10 startWithDelegate:self delegateQueue:v9 responseTime:a4];
  }
  else
  {
    [(HMDUserPresenceFeedSession *)self _callDelegate];
  }
}

- (void)_send
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  v3 = [(HMDUserPresenceFeedSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPresenceFeedSession *)self user];
  v5 = [v4 home];

  id v6 = [v5 residentDeviceManager];
  id v7 = [v6 primaryResidentDevice];

  v8 = [v7 device];
  if (v8)
  {
    v9 = +[HMDLostModeManager sharedManager];
    int v10 = [v9 isLost];

    if (v10)
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      int v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v87 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Device Lost. Not sending presence update", buf, 0xCu);
      }
      v15 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
      [(HMDUserPresenceFeedSession *)v12 _handleStatusUpdateMessageError:v15 responseTime:0.0];
    }
    else
    {
      v20 = [(HMDUserPresenceFeedSession *)self presenceAuthStatus];

      if (v20)
      {
        v21 = [(HMDUserPresenceFeedSession *)self reason];
        uint64_t v22 = [v21 value];

        if (v22 == 2)
        {
          v23 = [(HMDUserPresenceFeedSession *)self statusChangeDate];
          if (v23)
          {
            v24 = [MEMORY[0x263EFF910] date];
            v25 = [(HMDUserPresenceFeedSession *)self statusChangeDate];
            [v24 timeIntervalSinceDate:v25];
            double v27 = v26;

            if (v27 > 120.0)
            {
              v28 = +[HMDUserPresenceUpdateReason reasonWithValue:6];
              [(HMDUserPresenceFeedSession *)self setReason:v28];

              v29 = (void *)MEMORY[0x230FBD990]();
              v30 = self;
              v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                v32 = HMFGetLogIdentifier();
                v33 = [(HMDUserPresenceFeedSession *)v30 reason];
                *(_DWORD *)buf = 138543618;
                id v87 = v32;
                __int16 v88 = 2112;
                id v89 = v33;
                _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Resetting the reason to %@ as it is well past the validity period", buf, 0x16u);
              }
            }
          }
        }
        v34 = [MEMORY[0x263EFF9A0] dictionary];
        v35 = [(HMDUserPresenceFeedSession *)self user];
        v36 = [v35 uuid];
        v37 = [v36 UUIDString];
        [v34 setObject:v37 forKeyedSubscript:@"kUserPresenceUserKey"];

        v38 = NSNumber;
        v39 = [(HMDUserPresenceFeedSession *)self presenceAuthStatus];
        v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "value"));
        [v34 setObject:v40 forKeyedSubscript:@"kUserPresenceAuthStatusKey"];

        v41 = [(HMDUserPresenceFeedSession *)self presenceAuthStatus];
        [v41 addToPayload:v34];

        v42 = [(HMDUserPresenceFeedSession *)self presenceRegionStatus];
        [v42 addToPayload:v34];

        v43 = [(HMDUserPresenceFeedSession *)self reason];
        [v43 addToPayload:v34];

        if ([v8 isCurrentDevice])
        {
          v44 = (void *)MEMORY[0x230FBD990]();
          v45 = self;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v87 = v47;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@This device is the resident device itself", buf, 0xCu);
          }
          v48 = [MEMORY[0x263F08A00] defaultCenter];
          v49 = [(HMDUserPresenceFeedSession *)v45 delegate];
          [v48 postNotificationName:@"HMDUserPresenceUpdateLocalNotification" object:v49 userInfo:v34];

          [(HMDUserPresenceFeedSession *)v45 _callDelegate];
        }
        else
        {
          if ([(HMDUserPresenceFeedSession *)self isActivityStateEnabled]) {
            [v34 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kUserPresenceIsActivityStateEnabledKey"];
          }
          if ([v7 isReachableByIDS])
          {
            uint64_t v55 = -1;
          }
          else
          {
            v56 = (void *)MEMORY[0x230FBD990]();
            v57 = self;
            v58 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              v59 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v87 = v59;
              __int16 v88 = 2112;
              id v89 = v7;
              _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Restricting message to local transports as the primary resident is likely not reachable over IDS: %@", buf, 0x16u);
            }
            uint64_t v55 = 14;
          }
          v60 = [HMDRemoteHomeMessageDestination alloc];
          v61 = [(HMDUserPresenceFeedSession *)self targetUUID];
          v62 = [v5 uuid];
          v63 = [(HMDRemoteHomeMessageDestination *)v60 initWithTarget:v61 homeUUID:v62];

          v64 = (void *)[v34 copy];
          v80 = +[HMDRemoteMessage secureMessageWithName:@"kRemoteUpdateUserPresenceNotificationKey" qualityOfService:17 destination:v63 messagePayload:v64 restriction:v55];

          v65 = [MEMORY[0x263EFF910] date];
          v66 = [v80 identifier];
          objc_initWeak(&location, self);
          v81[0] = MEMORY[0x263EF8330];
          v81[1] = 3221225472;
          v81[2] = __35__HMDUserPresenceFeedSession__send__block_invoke;
          v81[3] = &unk_264A2E890;
          objc_copyWeak(&v84, &location);
          id v79 = v66;
          id v82 = v79;
          id v77 = v65;
          id v83 = v77;
          context = (void *)MEMORY[0x230FBD990]([v80 setResponseHandler:v81]);
          v67 = self;
          HMFGetOSLogHandle();
          v68 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            v74 = v63;
            HMFGetLogIdentifier();
            id v69 = (id)objc_claimAutoreleasedReturnValue();
            v76 = [(HMDUserPresenceFeedSession *)v67 presenceAuthStatus];
            v75 = [(HMDUserPresenceFeedSession *)v67 presenceRegionStatus];
            v70 = [(HMDUserPresenceFeedSession *)v67 reason];
            v71 = [(HMDUserPresenceFeedSession *)v67 user];
            v72 = [v71 uuid];
            *(_DWORD *)buf = 138544898;
            id v87 = v69;
            __int16 v88 = 2114;
            id v89 = v79;
            __int16 v90 = 2112;
            v91 = v8;
            __int16 v92 = 2114;
            v93 = v76;
            __int16 v94 = 2114;
            v95 = v75;
            __int16 v96 = 2114;
            v97 = v70;
            __int16 v98 = 2114;
            v99 = v72;
            _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Sending message with identifier %{public}@ to inform presence status to resident: [%@], with : auth: %{public}@, region: %{public}@, reason: %{public}@, UUID: %{public}@", buf, 0x48u);

            v63 = v74;
          }

          v73 = [(HMDUserPresenceFeedSession *)v67 messageDispatcher];
          [v73 sendMessage:v80 completionHandler:0];

          objc_destroyWeak(&v84);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        v50 = (void *)MEMORY[0x230FBD990]();
        v51 = self;
        v52 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v87 = v53;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Presence authorization is nil, cannot send report.", buf, 0xCu);
        }
        v54 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        [(HMDUserPresenceFeedSession *)v51 _handleStatusUpdateMessageError:v54 responseTime:0.0];
      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v87 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@No HMDDevice found for HMDResidenceDevice. Not sending the presence update.", buf, 0xCu);
    }
  }
}

void __35__HMDUserPresenceFeedSession__send__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 32);
      int v12 = [v9 presenceAuthStatus];
      [v9 presenceRegionStatus];
      v13 = id v24 = v5;
      [v9 reason];
      uint64_t v14 = v23 = v6;
      [v9 user];
      v15 = uint64_t v22 = v8;
      v16 = [v15 uuid];
      *(_DWORD *)buf = 138544898;
      v29 = v11;
      __int16 v30 = 2114;
      uint64_t v31 = v21;
      __int16 v32 = 2114;
      v33 = v12;
      __int16 v34 = 2114;
      v35 = v13;
      __int16 v36 = 2114;
      v37 = v14;
      __int16 v38 = 2114;
      v39 = v16;
      __int16 v40 = 2114;
      id v41 = v24;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ to inform presence status has been sent with : auth: %{public}@, region: %{public}@, reason: %{public}@, UUID: %{public}@, error: %{public}@", buf, 0x48u);

      v8 = v22;
      id v6 = v23;

      id v5 = v24;
    }

    v17 = [MEMORY[0x263EFF910] date];
    [v17 timeIntervalSinceDate:*(void *)(a1 + 40)];
    uint64_t v19 = v18;
    v20 = [v9 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__HMDUserPresenceFeedSession__send__block_invoke_33;
    block[3] = &unk_264A2E458;
    block[4] = v9;
    id v26 = v5;
    uint64_t v27 = v19;
    dispatch_async(v20, block);
  }
}

uint64_t __35__HMDUserPresenceFeedSession__send__block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStatusUpdateMessageError:*(void *)(a1 + 40) responseTime:*(double *)(a1 + 48)];
}

- (void)send
{
  v3 = [(HMDUserPresenceFeedSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMDUserPresenceFeedSession_send__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__HMDUserPresenceFeedSession_send__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _send];
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v19 = [(HMDUserPresenceFeedSession *)self sessionID];
  id v4 = (void *)[v3 initWithName:@"SID" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  id v6 = [(HMDUserPresenceFeedSession *)self presenceAuthStatus];
  id v7 = (void *)[v5 initWithName:@"PAS" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  id v9 = [(HMDUserPresenceFeedSession *)self presenceRegionStatus];
  int v10 = (void *)[v8 initWithName:@"PRS" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  int v12 = [(HMDUserPresenceFeedSession *)self reason];
  v13 = (void *)[v11 initWithName:@"RSN" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  v15 = [(HMDUserPresenceFeedSession *)self statusUpdateRetryTimer];
  v16 = (void *)[v14 initWithName:@"RT" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v17;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDUserPresenceFeedSession *)v4 sessionID];
    id v8 = [v7 UUIDString];
    *(_DWORD *)buf = 138543618;
    id v11 = v6;
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating session %@", buf, 0x16u);
  }
  v9.receiver = v4;
  v9.super_class = (Class)HMDUserPresenceFeedSession;
  [(HMDUserPresenceFeedSession *)&v9 dealloc];
}

- (HMDUserPresenceFeedSession)initWithDelegate:(id)a3 workQueue:(id)a4 targetUUID:(id)a5 messageDispatcher:(id)a6 user:(id)a7 presenceAuthStatus:(id)a8 presenceComputeStatus:(id)a9 presenceRegionStatus:(id)a10 reason:(id)a11
{
  id v17 = a3;
  id v42 = a4;
  id v41 = a5;
  id v40 = a6;
  id obj = a7;
  id v18 = a7;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v19 = a11;
  v43.receiver = self;
  v43.super_class = (Class)HMDUserPresenceFeedSession;
  v20 = [(HMDUserPresenceFeedSession *)&v43 init];
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x263F08C38] UUID];
    sessionID = v20->_sessionID;
    v20->_sessionID = (NSUUID *)v21;

    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v20->_targetUUID, a5);
    objc_storeStrong((id *)&v20->_messageDispatcher, a6);
    objc_storeStrong((id *)&v20->_user, obj);
    objc_storeStrong((id *)&v20->_presenceAuthStatus, a8);
    objc_storeStrong((id *)&v20->_presenceComputeStatus, a9);
    objc_storeStrong((id *)&v20->_presenceRegionStatus, a10);
    objc_storeStrong((id *)&v20->_reason, a11);
    uint64_t v23 = [v19 value];
    if (v23 == 2)
    {
      id v24 = [MEMORY[0x263EFF910] date];
    }
    else
    {
      id v24 = 0;
    }
    id v25 = v19;
    objc_storeStrong((id *)&v20->_statusChangeDate, v24);
    if (v23 == 2) {

    }
    id v26 = objc_alloc_init(HMDUserPresenceFeedRetryTimer);
    statusUpdateRetryTimer = v20->_statusUpdateRetryTimer;
    v20->_statusUpdateRetryTimer = v26;

    v28 = NSString;
    v29 = [v18 home];
    __int16 v30 = [v29 name];
    uint64_t v31 = [(NSUUID *)v20->_sessionID UUIDString];
    uint64_t v32 = [v28 stringWithFormat:@"%@/%@", v30, v31];
    logIdentifierString = v20->_logIdentifierString;
    v20->_logIdentifierString = (NSString *)v32;

    __int16 v34 = +[HMDFeaturesDataSource defaultDataSource];
    v20->_activityStateEnabled = [v34 isUserActivityStateDetectionFeatureEnabled];

    id v19 = v25;
  }

  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_72322 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_72322, &__block_literal_global_72323);
  }
  v2 = (void *)logCategory__hmf_once_v11_72324;
  return v2;
}

void __41__HMDUserPresenceFeedSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v11_72324;
  logCategory__hmf_once_v11_72324 = v0;
}

@end
@interface HMDSharedHomeUpdateSession
+ (id)logCategory;
- (HMDSharedHomeUpdateSession)initWithHome:(id)a3 delegate:(id)a4 workQueue:(id)a5 messagePayload:(id)a6 messageDispatcher:(id)a7;
- (HMDSharedHomeUpdateSessionDelegate)delegate;
- (NSString)description;
- (NSString)homeIdentifier;
- (NSUUID)sessionID;
- (id)dumpState;
- (id)logIdentifier;
- (void)_callDelegate;
- (void)_requestDataSync;
- (void)dealloc;
- (void)requestDataSync;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSharedHomeUpdateSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messagePayload, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDSharedHomeUpdateSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDSharedHomeUpdateSessionDelegate *)WeakRetained;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (id)dumpState
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self) {
    unint64_t retryCount = self->_retryCount;
  }
  else {
    unint64_t retryCount = 0;
  }
  v5 = [NSNumber numberWithUnsignedInteger:retryCount];
  [v3 setObject:v5 forKeyedSubscript:@"Retry Count"];

  v6 = (void *)[v3 copy];
  return v6;
}

- (void)timerDidFire:(id)a3
{
  v6 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    timer = self->_timer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    timer = 0;
  }
  v5 = v6;
  if (timer == v6)
  {
    -[HMDSharedHomeUpdateSession _requestDataSync]((uint64_t)self);
    v5 = v6;
  }
}

- (void)_requestDataSync
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (*(void *)(a1 + 64) < 3uLL)
    {
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        id v7 = v6;
        v8 = [v7 sharedHomeSourceVersion];
        v9 = [v7 primaryResident];
        v10 = [v7 residentDeviceManager];
        v11 = [v10 availableResidentDevices];
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __45__HMDSharedHomeUpdateSession__selectResident__block_invoke;
        v38 = &unk_264A2CFA8;
        id v39 = v8;
        id v12 = v8;
        v13 = objc_msgSend(v11, "hmf_objectsPassingTest:", buf);

        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __45__HMDSharedHomeUpdateSession__selectResident__block_invoke_2;
        v35[3] = &unk_264A2CFD0;
        id v36 = v9;
        id v14 = v9;
        v15 = [v13 sortedArrayUsingComparator:v35];
        v16 = [v15 lastObject];
      }
      else
      {
        v16 = 0;
      }
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = (id *)(id)a1;
      v19 = HMFGetOSLogHandle();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v16)
      {
        if (v20)
        {
          v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2112;
          v38 = v16;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending sync request session %@ with resident %@", buf, 0x20u);
        }
        v22 = [HMDRemoteDeviceMessageDestination alloc];
        id v23 = *(id *)(a1 + 32);
        v24 = [v23 uuid];
        v25 = [v16 device];

        v26 = [(HMDRemoteDeviceMessageDestination *)v22 initWithTarget:v24 device:v25];
        v27 = +[HMDRemoteMessage secureMessageWithName:@"kRequestHomeDataSyncRequestKey" destination:v26 messagePayload:v18[5]];
        objc_initWeak((id *)buf, v18);
        uint64_t v30 = MEMORY[0x263EF8330];
        uint64_t v31 = 3221225472;
        v32 = __46__HMDSharedHomeUpdateSession__requestDataSync__block_invoke;
        v33 = &unk_264A2D490;
        objc_copyWeak(&v34, (id *)buf);
        [v27 setResponseHandler:&v30];
        id v28 = v18[6];
        objc_msgSend(v28, "sendMessage:completionHandler:", v27, 0, v30, v31, v32, v33);

        ++*(void *)(a1 + 64);
        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v20)
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v29;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@No valid residents, cannot continue", buf, 0xCu);
        }
        -[HMDSharedHomeUpdateSession _callDelegate](v18);
      }
    }
    else
    {
      v2 = (void *)MEMORY[0x230FBD990]();
      v3 = (id)a1;
      v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v5;
        _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Retry count has maxed out, cannot continue", buf, 0xCu);
      }
      -[HMDSharedHomeUpdateSession _callDelegate](v3);
    }
  }
}

- (void)_callDelegate
{
  v2 = [a1 delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = a1[3];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __43__HMDSharedHomeUpdateSession__callDelegate__block_invoke;
    v4[3] = &unk_264A2F820;
    id v5 = v2;
    v6 = a1;
    dispatch_async(v3, v4);
  }
}

void __46__HMDSharedHomeUpdateSession__requestDataSync__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)MEMORY[0x230FBD990]();
    id v2 = WeakRetained;
    v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = HMFGetLogIdentifier();
      id v5 = [NSNumber numberWithDouble:*((double *)v2 + 9)];
      *(_DWORD *)buf = 138543618;
      v18 = v4;
      __int16 v19 = 2112;
      BOOL v20 = v5;
      _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@Starting the retry timer with %@ seconds", buf, 0x16u);
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:*((double *)v2 + 9)];
    id v7 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v6;

    [*((id *)v2 + 7) setDelegate:v2];
    v8 = (void *)*((void *)v2 + 7);
    id v9 = *((id *)v2 + 3);
    [v8 setDelegateQueue:v9];

    uint64_t v10 = [*((id *)v2 + 7) resume];
    *((double *)v2 + 9) = *((double *)v2 + 9) + (double)(unint64_t)(60 * requestHomeDataSyncRetryPeriodInMinutes);
    v11 = (void *)MEMORY[0x230FBD990](v10);
    id v12 = v2;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      v15 = [NSNumber numberWithDouble:*((double *)v2 + 9)];
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      BOOL v20 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Bumped the next timer's value to %@", buf, 0x16u);
    }
  }
}

uint64_t __45__HMDSharedHomeUpdateSession__selectResident__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 device];
  id v5 = [v4 version];

  if ([v5 isGreaterThanVersion:*(void *)(a1 + 32)]) {
    uint64_t v6 = [v3 isReachable];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __45__HMDSharedHomeUpdateSession__selectResident__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 device];
  v8 = [v7 version];
  id v9 = [v6 device];
  uint64_t v10 = [v9 version];
  uint64_t v11 = [v8 compare:v10];

  if (!v11)
  {
    if ([*(id *)(a1 + 32) isEqual:v5])
    {
      uint64_t v11 = 1;
    }
    else if ([*(id *)(a1 + 32) isEqual:v6])
    {
      uint64_t v11 = -1;
    }
    else
    {
      id v12 = [v5 identifier];
      v13 = [v12 UUIDString];
      id v14 = [v6 identifier];
      v15 = [v14 UUIDString];
      uint64_t v11 = [v13 compare:v15];
    }
  }

  return v11;
}

void __43__HMDSharedHomeUpdateSession__callDelegate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
  [v1 didCompleteHomeUpdateSession:v2 withError:v3];
}

- (void)requestDataSync
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HMDSharedHomeUpdateSession_requestDataSync__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __45__HMDSharedHomeUpdateSession_requestDataSync__block_invoke(uint64_t a1)
{
}

- (NSString)homeIdentifier
{
  id v3 = NSString;
  if (self) {
    home = self->_home;
  }
  else {
    home = 0;
  }
  id v5 = home;
  id v6 = [(HMDHome *)v5 name];
  if (self) {
    id v7 = self->_home;
  }
  else {
    id v7 = 0;
  }
  v8 = [(HMDHome *)v7 uuid];
  id v9 = [v8 UUIDString];
  uint64_t v10 = [v3 stringWithFormat:@"%@/%@", v6, v9];

  return (NSString *)v10;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = [(HMDSharedHomeUpdateSession *)self sessionID];
  id v5 = (void *)v4;
  if (self) {
    unint64_t retryCount = self->_retryCount;
  }
  else {
    unint64_t retryCount = 0;
  }
  id v7 = [v3 stringWithFormat:@"[HMDSharedHomeUpdateSession: %@, %tu]", v4, retryCount];

  return (NSString *)v7;
}

- (id)logIdentifier
{
  id v3 = NSString;
  uint64_t v4 = [(HMDSharedHomeUpdateSession *)self homeIdentifier];
  id v5 = [(HMDSharedHomeUpdateSession *)self sessionID];
  id v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];

  return v7;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating the session", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDSharedHomeUpdateSession;
  [(HMDSharedHomeUpdateSession *)&v7 dealloc];
}

- (HMDSharedHomeUpdateSession)initWithHome:(id)a3 delegate:(id)a4 workQueue:(id)a5 messagePayload:(id)a6 messageDispatcher:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDSharedHomeUpdateSession;
  v18 = [(HMDSharedHomeUpdateSession *)&v23 init];
  __int16 v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_home, a3);
    uint64_t v20 = [MEMORY[0x263F08C38] UUID];
    sessionID = v19->_sessionID;
    v19->_sessionID = (NSUUID *)v20;

    v19->_unint64_t retryCount = 0;
    v19->_currentTimerValue = (double)(unint64_t)(60 * requestHomeDataSyncRetryPeriodInMinutes);
    objc_storeWeak((id *)&v19->_delegate, v14);
    objc_storeStrong((id *)&v19->_workQueue, a5);
    objc_storeStrong((id *)&v19->_messagePayload, a6);
    objc_storeStrong((id *)&v19->_messageDispatcher, a7);
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_254166 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_254166, &__block_literal_global_254167);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v2_254168;
  return v2;
}

void __41__HMDSharedHomeUpdateSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_254168;
  logCategory__hmf_once_v2_254168 = v0;
}

@end
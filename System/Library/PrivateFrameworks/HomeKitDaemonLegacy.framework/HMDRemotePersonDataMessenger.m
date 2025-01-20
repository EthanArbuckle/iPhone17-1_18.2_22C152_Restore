@interface HMDRemotePersonDataMessenger
+ (id)logCategory;
- (HMDHome)home;
- (HMDPersonDataSource)dataSource;
- (HMDRemotePersonDataMessenger)initWithUUID:(id)a3 home:(id)a4 workQueue:(id)a5;
- (HMFTimer)notifyResidentsOfUpdatedDataDebounceTimer;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)notifyResidentsOfUpdatedDataDebounceTimerFactory;
- (void)_notifyResidentsOfUpdatedFaceClassificationDependentData;
- (void)_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData;
- (void)configureWithDataSource:(id)a3 home:(id)a4;
- (void)handlePerformCloudPullMessage:(id)a3;
- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4;
- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotifyResidentsOfUpdatedDataDebounceTimer:(id)a3;
- (void)setNotifyResidentsOfUpdatedDataDebounceTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDRemotePersonDataMessenger

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyResidentsOfUpdatedDataDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_notifyResidentsOfUpdatedDataDebounceTimer, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setNotifyResidentsOfUpdatedDataDebounceTimerFactory:(id)a3
{
}

- (id)notifyResidentsOfUpdatedDataDebounceTimerFactory
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setNotifyResidentsOfUpdatedDataDebounceTimer:(id)a3
{
}

- (HMFTimer)notifyResidentsOfUpdatedDataDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPersonDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPersonDataSource *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a4;
  v6 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1E4F7A0F0];
  v8 = [(HMDRemotePersonDataMessenger *)self workQueue];
  v9 = [v7 schedulerWithDispatchQueue:v8];
  v10 = [v5 reschedule:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HMDRemotePersonDataMessenger_handleUpdatedSettings_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_1E6A17A58;
  v12[4] = self;
  id v11 = (id)[v10 addSuccessBlock:v12];
}

uint64_t __73__HMDRemotePersonDataMessenger_handleUpdatedSettings_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData];
}

- (void)handleRemovedFaceCropWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a4;
  v6 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1E4F7A0F0];
  v8 = [(HMDRemotePersonDataMessenger *)self workQueue];
  v9 = [v7 schedulerWithDispatchQueue:v8];
  v10 = [v5 reschedule:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HMDRemotePersonDataMessenger_handleRemovedFaceCropWithUUID_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_1E6A17A58;
  v12[4] = self;
  id v11 = (id)[v10 addSuccessBlock:v12];
}

uint64_t __81__HMDRemotePersonDataMessenger_handleRemovedFaceCropWithUUID_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData];
}

- (void)handleRemovedPersonWithUUID:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a4;
  v6 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1E4F7A0F0];
  v8 = [(HMDRemotePersonDataMessenger *)self workQueue];
  v9 = [v7 schedulerWithDispatchQueue:v8];
  v10 = [v5 reschedule:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__HMDRemotePersonDataMessenger_handleRemovedPersonWithUUID_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_1E6A17A58;
  v12[4] = self;
  id v11 = (id)[v10 addSuccessBlock:v12];
}

uint64_t __79__HMDRemotePersonDataMessenger_handleRemovedPersonWithUUID_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData];
}

- (void)handleUpdatedPersonFaceCrop:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a4;
  v6 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1E4F7A0F0];
  v8 = [(HMDRemotePersonDataMessenger *)self workQueue];
  v9 = [v7 schedulerWithDispatchQueue:v8];
  v10 = [v5 reschedule:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__HMDRemotePersonDataMessenger_handleUpdatedPersonFaceCrop_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_1E6A17A58;
  v12[4] = self;
  id v11 = (id)[v10 addSuccessBlock:v12];
}

uint64_t __79__HMDRemotePersonDataMessenger_handleUpdatedPersonFaceCrop_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData];
}

- (void)handleUpdatedPerson:(id)a3 mirrorOutputFuture:(id)a4
{
  id v5 = a4;
  v6 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1E4F7A0F0];
  v8 = [(HMDRemotePersonDataMessenger *)self workQueue];
  v9 = [v7 schedulerWithDispatchQueue:v8];
  v10 = [v5 reschedule:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__HMDRemotePersonDataMessenger_handleUpdatedPerson_mirrorOutputFuture___block_invoke;
  v12[3] = &unk_1E6A17A58;
  v12[4] = self;
  id v11 = (id)[v10 addSuccessBlock:v12];
}

uint64_t __71__HMDRemotePersonDataMessenger_handleUpdatedPerson_mirrorOutputFuture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData];
}

- (void)configureWithDataSource:(id)a3 home:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (!v6) {
    _HMFPreconditionFailure();
  }
  [(HMDRemotePersonDataMessenger *)self setDataSource:v6];
  v9 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:0 remoteAccessRequired:0];
  v10 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v10, "setRoles:", objc_msgSend(v10, "roles") | 4);
  id v11 = [v7 msgDispatcher];
  v13[0] = v9;
  v13[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v11 registerForMessage:@"HMDRemotePersonDataMessengerPerformCloudPullMessage" receiver:self policies:v12 selector:sel_handlePerformCloudPullMessage_];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDRemotePersonDataMessenger *)self notifyResidentsOfUpdatedDataDebounceTimer];

  if (v6 == v4)
  {
    [(HMDRemotePersonDataMessenger *)self setNotifyResidentsOfUpdatedDataDebounceTimer:0];
    [(HMDRemotePersonDataMessenger *)self _notifyResidentsOfUpdatedFaceClassificationDependentData];
  }
}

- (id)logIdentifier
{
  v2 = [(HMDRemotePersonDataMessenger *)self messageTargetUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);
  }
  v10 = [(HMDRemotePersonDataMessenger *)v7 dataSource];
  id v11 = [v10 performCloudPull];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__HMDRemotePersonDataMessenger_handlePerformCloudPullMessage___block_invoke;
  v14[3] = &unk_1E6A17A30;
  id v15 = v4;
  id v12 = v4;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

uint64_t __62__HMDRemotePersonDataMessenger_handlePerformCloudPullMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)_notifyResidentsOfUpdatedFaceClassificationDependentData
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDRemotePersonDataMessenger *)self home];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 owner];
    id v7 = [v6 account];

    if (v7)
    {
      v8 = [v7 handles];
      v9 = [v8 firstObject];

      if (v9)
      {
        v10 = [HMDRemoteAccountMessageDestination alloc];
        id v11 = [(HMDRemotePersonDataMessenger *)self messageTargetUUID];
        id v12 = [(HMDRemoteAccountMessageDestination *)v10 initWithTarget:v11 handle:v9 multicast:1];

        [(HMDRemoteAccountMessageDestination *)v12 setRestrictToResidentCapable:1];
        id v13 = [[HMDRemoteMessage alloc] initWithName:@"HMDRemotePersonDataMessengerPerformCloudPullMessage" destination:v12 payload:0 type:3 timeout:1 secure:0.0];
        v14 = (void *)MEMORY[0x1D9452090]();
        id v15 = self;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier();
          uint64_t v18 = [(HMFObject *)v13 shortDescription];
          int v32 = 138543618;
          v33 = v17;
          __int16 v34 = 2112;
          v35 = v18;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending message to notify resident devices of updated face-classification-dependent data: %@", (uint8_t *)&v32, 0x16u);
        }
        v19 = [v5 msgDispatcher];
        [v19 sendMessage:v13];
      }
      else
      {
        v28 = (void *)MEMORY[0x1D9452090]();
        v29 = self;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          int v32 = 138543362;
          v33 = v31;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@No account handles found on owner account when notifying resident devices of updated face-classification-dependent data", (uint8_t *)&v32, 0xCu);
        }
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D9452090]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        int v32 = 138543362;
        v33 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Owner account was nil when notifying resident devices of updated face-classification-dependent data", (uint8_t *)&v32, 0xCu);
      }
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = HMFGetLogIdentifier();
      int v32 = 138543362;
      v33 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference was nil when notifying resident devices of updated face-classification-dependent data", (uint8_t *)&v32, 0xCu);
    }
  }
}

- (void)_startDebounceTimerToNotifyResidentsOfUpdatedFaceClassificationDependentData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDRemotePersonDataMessenger *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDRemotePersonDataMessenger *)self notifyResidentsOfUpdatedDataDebounceTimer];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting timer to notify resident devices of updated face-classification-dependent data", (uint8_t *)&v15, 0xCu);
    }
    v9 = [(HMDRemotePersonDataMessenger *)v6 notifyResidentsOfUpdatedDataDebounceTimerFactory];
    v10 = v9[2](v9, 0, 10.0);
    [(HMDRemotePersonDataMessenger *)v6 setNotifyResidentsOfUpdatedDataDebounceTimer:v10];

    id v11 = [(HMDRemotePersonDataMessenger *)v6 notifyResidentsOfUpdatedDataDebounceTimer];
    [v11 setDelegate:v6];

    id v12 = [(HMDRemotePersonDataMessenger *)v6 workQueue];
    id v13 = [(HMDRemotePersonDataMessenger *)v6 notifyResidentsOfUpdatedDataDebounceTimer];
    [v13 setDelegateQueue:v12];

    v14 = [(HMDRemotePersonDataMessenger *)v6 notifyResidentsOfUpdatedDataDebounceTimer];
    [v14 resume];
  }
}

- (HMDRemotePersonDataMessenger)initWithUUID:(id)a3 home:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v11 = v10;
  if (!v10)
  {
LABEL_9:
    uint64_t v17 = _HMFPreconditionFailure();
    return (HMDRemotePersonDataMessenger *)__60__HMDRemotePersonDataMessenger_initWithUUID_home_workQueue___block_invoke(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDRemotePersonDataMessenger;
  id v12 = [(HMDRemotePersonDataMessenger *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    objc_storeWeak((id *)&v12->_home, v9);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    id notifyResidentsOfUpdatedDataDebounceTimerFactory = v12->_notifyResidentsOfUpdatedDataDebounceTimerFactory;
    v12->_id notifyResidentsOfUpdatedDataDebounceTimerFactory = &__block_literal_global_180172;
  }
  return v12;
}

id __60__HMDRemotePersonDataMessenger_initWithUUID_home_workQueue___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_180185 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_180185, &__block_literal_global_16_180186);
  }
  v2 = (void *)logCategory__hmf_once_v7_180187;
  return v2;
}

uint64_t __43__HMDRemotePersonDataMessenger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_180187;
  logCategory__hmf_once_v7_180187 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
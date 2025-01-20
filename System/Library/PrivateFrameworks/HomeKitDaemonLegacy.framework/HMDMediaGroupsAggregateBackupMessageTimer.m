@interface HMDMediaGroupsAggregateBackupMessageTimer
+ (id)logCategory;
- (HMDMediaGroupsAggregateBackupMessageTimer)initWithParticipantAccessoryUUID:(id)a3;
- (HMDMediaGroupsAggregateBackupMessageTimer)initWithParticipantAccessoryUUID:(id)a3 timerProvider:(id)a4;
- (HMDMediaGroupsAggregateBackupMessageTimer)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (HMDMediaGroupsAggregateBackupMessageTimerDelegate)delegate;
- (HMDTimerProvider)timerProvider;
- (HMFTimer)timer;
- (NSUUID)currentMessageIdentifier;
- (NSUUID)participantAccessoryUUID;
- (double)nextTimeInterval;
- (id)logIdentifier;
- (unint64_t)attemptCount;
- (void)markAttemptWithMessageIdentifier:(id)a3;
- (void)setAttemptCount:(unint64_t)a3;
- (void)setCurrentMessageIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerProvider:(id)a3;
- (void)startRetryTimer;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDMediaGroupsAggregateBackupMessageTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_currentMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_participantAccessoryUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_attemptCount = a3;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimerProvider:(id)a3
{
}

- (HMDTimerProvider)timerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timerProvider);
  return (HMDTimerProvider *)WeakRetained;
}

- (void)setCurrentMessageIdentifier:(id)a3
{
}

- (NSUUID)currentMessageIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)participantAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupsAggregateBackupMessageTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupsAggregateBackupMessageTimerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsAggregateBackupMessageTimer *)self participantAccessoryUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregateBackupMessageTimer *)self timer];

  if (v5 == v4)
  {
    v6 = [(HMDMediaGroupsAggregateBackupMessageTimer *)self delegate];
    v7 = v6;
    if (v6)
    {
      [v6 didFireTimerForMediaGroupsAggregateBackupMessageTimer:self];
    }
    else
    {
      v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of triggered timer due to no delegate", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (HMDMediaGroupsAggregateBackupMessageTimer)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a4 options:a3];
  return (HMDMediaGroupsAggregateBackupMessageTimer *)v4;
}

- (double)nextTimeInterval
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(HMDMediaGroupsAggregateBackupMessageTimer *)self attemptCount];
  if (v2 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = v2;
  }
  v5[0] = vdupq_n_s64(0x404E000000000000uLL);
  v5[1] = xmmword_1D54D3740;
  uint64_t v6 = 0x409C200000000000;
  if (v3 > 5) {
    return 86400.0;
  }
  else {
    return *((double *)v5 + v3 - 1);
  }
}

- (void)startRetryTimer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDMediaGroupsAggregateBackupMessageTimer attemptCount](v4, "attemptCount"));
    int v20 = 138543618;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting timer with attempts: %@", (uint8_t *)&v20, 0x16u);
  }
  if ([(HMDMediaGroupsAggregateBackupMessageTimer *)v4 attemptCount] < 0x24)
  {
    int v12 = [(HMDMediaGroupsAggregateBackupMessageTimer *)v4 timerProvider];
    if (v12)
    {
      [(HMDMediaGroupsAggregateBackupMessageTimer *)v4 nextTimeInterval];
      v13 = objc_msgSend(v12, "timerWithTimeInterval:options:", 2);
      [(HMDMediaGroupsAggregateBackupMessageTimer *)v4 setTimer:v13];

      uint64_t v14 = [(HMDMediaGroupsAggregateBackupMessageTimer *)v4 timer];
      [v14 setDelegate:v4];

      v15 = [(HMDMediaGroupsAggregateBackupMessageTimer *)v4 timer];
      [v15 resume];
    }
    else
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      v17 = v4;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to start new timer due to no timer provider", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = v4;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v11;
      __int16 v22 = 2112;
      v23 = &unk_1F2DC8860;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create retry timer due to reaching the max attempt count: %@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)markAttemptWithMessageIdentifier:(id)a3
{
  [(HMDMediaGroupsAggregateBackupMessageTimer *)self setCurrentMessageIdentifier:a3];
  unint64_t v4 = [(HMDMediaGroupsAggregateBackupMessageTimer *)self attemptCount] + 1;
  [(HMDMediaGroupsAggregateBackupMessageTimer *)self setAttemptCount:v4];
}

- (HMDMediaGroupsAggregateBackupMessageTimer)initWithParticipantAccessoryUUID:(id)a3 timerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDMediaGroupsAggregateBackupMessageTimer;
  v9 = [(HMDMediaGroupsAggregateBackupMessageTimer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_timerProvider, v8);
    objc_storeStrong((id *)&v10->_participantAccessoryUUID, a3);
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    currentMessageIdentifier = v10->_currentMessageIdentifier;
    v10->_currentMessageIdentifier = (NSUUID *)v11;

    v10->_attemptCount = 0;
  }

  return v10;
}

- (HMDMediaGroupsAggregateBackupMessageTimer)initWithParticipantAccessoryUUID:(id)a3
{
  return [(HMDMediaGroupsAggregateBackupMessageTimer *)self initWithParticipantAccessoryUUID:a3 timerProvider:self];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_107386 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_107386, &__block_literal_global_107387);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v5_107388;
  return v2;
}

uint64_t __56__HMDMediaGroupsAggregateBackupMessageTimer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_107388;
  logCategory__hmf_once_v5_107388 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
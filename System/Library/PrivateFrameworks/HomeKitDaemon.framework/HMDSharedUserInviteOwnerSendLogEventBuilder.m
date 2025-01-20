@interface HMDSharedUserInviteOwnerSendLogEventBuilder
+ (id)logCategory;
- (BOOL)isReady;
- (HMDHome)home;
- (HMDSharedUserInviteOwnerSendLogEvent)inviteLogEvent;
- (HMDSharedUserInviteOwnerSendLogEventBuilder)initWithHome:(id)a3 sessionIdentifier:(id)a4 invitationType:(unint64_t)a5;
- (HMDSharedUserInviteOwnerSendLogEventBuilder)initWithHome:(id)a3 sessionIdentifier:(id)a4 invitationType:(unint64_t)a5 logEventSubmitter:(id)a6 currentUpTicksBlock:(id)a7 submissionTimerFactory:(id)a8;
- (void)cancel;
- (void)markAddUserBegin;
- (void)markAddUserEnd;
- (void)markCreateShareBegin;
- (void)markCreateShareEnd;
- (void)markSendInviteBegin;
- (void)markSendInviteEnd;
- (void)markUserAlreadyAddedToShare;
- (void)submit;
@end

@implementation HMDSharedUserInviteOwnerSendLogEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteLogEvent, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDSharedUserInviteOwnerSendLogEvent)inviteLogEvent
{
  return (HMDSharedUserInviteOwnerSendLogEvent *)objc_getProperty(self, a2, 112, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)submit
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (!self->super.submitted)
  {
    v3 = (void *)MEMORY[0x230FBD990]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = HMFGetLogIdentifier();
      v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      v8 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      v9 = [v8 error];
      *(_DWORD *)buf = 138543874;
      v14 = v6;
      __int16 v15 = 2112;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Submitting shared user send invite latency log event %@ error:%@", buf, 0x20u);
    }
    v12.receiver = v4;
    v12.super_class = (Class)HMDSharedUserInviteOwnerSendLogEventBuilder;
    [(HMDSharedUserInviteLogEventBuilder *)&v12 submit];
    v10 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 home];
    v11 = v10;
    if (v10) {
      [v10 removeSharedUserEventBuilder:v4];
    }
  }
}

- (BOOL)isReady
{
  os_unfair_lock_assert_owner(&self->super._lock);
  v12.receiver = self;
  v12.super_class = (Class)HMDSharedUserInviteOwnerSendLogEventBuilder;
  BOOL v3 = [(HMDSharedUserInviteLogEventBuilder *)&v12 isReady];
  if (v3)
  {
    v4 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)self inviteLogEvent];
    v5 = [v4 error];

    if (v5)
    {
LABEL_3:
      LOBYTE(v3) = 1;
      return v3;
    }
    v6 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)self inviteLogEvent];
    if ([v6 createShareMS] >= 1)
    {
      v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)self inviteLogEvent];
      if ([v7 addUserToShareMS] >= 1)
      {
        v8 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)self inviteLogEvent];
        if ([v8 sendInvitationMS] > 0)
        {
          v9 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)self inviteLogEvent];
          uint64_t v10 = [v9 totalInvitationCreateAndSendMS];

          if (v10 >= 1) {
            goto LABEL_3;
          }
LABEL_12:
          LOBYTE(v3) = 0;
          return v3;
        }
      }
    }

    goto LABEL_12;
  }
  return v3;
}

- (void)cancel
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@cancel", buf, 0xCu);
  }
  v9.receiver = v4;
  v9.super_class = (Class)HMDSharedUserInviteOwnerSendLogEventBuilder;
  [(HMDSharedUserInviteLogEventBuilder *)&v9 cancel];
  v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 home];
  v8 = v7;
  if (v7) {
    [v7 removeSharedUserEventBuilder:v4];
  }
}

- (void)markSendInviteEnd
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markSendInviteEnd", (uint8_t *)&v21, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->sendInvitationBeginTime)
    {
      v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      BOOL v8 = [v7 sendInvitationMS] == -1;

      if (v8)
      {
        objc_super v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t sendInvitationBeginTime = v4->sendInvitationBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
        v13 = v12;
        if (v10 == sendInvitationBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - sendInvitationBeginTime;
        }
        [v12 setSendInvitationMS:v14];

        __int16 v15 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v16 = v15[2]();
        unint64_t eventCreatedTime = v4->super.eventCreatedTime;
        v18 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
        uint64_t v19 = v18;
        if (v16 == eventCreatedTime) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = v16 - eventCreatedTime;
        }
        [v18 setTotalInvitationCreateAndSendMS:v20];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markSendInviteBegin
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markSendInviteBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->sendInvitationBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t sendInvitationBeginTime = v8[2]();

    objc_super v9 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
    [v9 setSendInvitationMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markUserAlreadyAddedToShare
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markUserAlreadyAddedToShare", (uint8_t *)&v12, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
    char v8 = [v7 userAlreadyAddedToShare];

    if ((v8 & 1) == 0)
    {
      objc_super v9 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      [v9 setUserAlreadyAddedToShare:1];

      int v10 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      [v10 setCreateShareMS:1];

      v11 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      [v11 setAddUserToShareMS:1];

      [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markAddUserEnd
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAddUserEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->addUserToShareBeginTime)
    {
      v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      BOOL v8 = [v7 addUserToShareMS] == -1;

      if (v8)
      {
        objc_super v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t addUserToShareBeginTime = v4->addUserToShareBeginTime;
        int v12 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
        v13 = v12;
        if (v10 == addUserToShareBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - addUserToShareBeginTime;
        }
        [v12 setAddUserToShareMS:v14];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markAddUserBegin
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAddUserBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->addUserToShareBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t addUserToShareBeginTime = v8[2]();

    objc_super v9 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
    [v9 setAddUserToShareMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markCreateShareEnd
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreateShareEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->createShareBeginTime)
    {
      v7 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
      BOOL v8 = [v7 createShareMS] == -1;

      if (v8)
      {
        objc_super v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t createShareBeginTime = v4->createShareBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
        v13 = v12;
        if (v10 == createShareBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - createShareBeginTime;
        }
        [v12 setCreateShareMS:v14];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markCreateShareBegin
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreateShareBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->createShareBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t createShareBeginTime = v8[2]();

    objc_super v9 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)v4 inviteLogEvent];
    [v9 setCreateShareMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMDSharedUserInviteOwnerSendLogEventBuilder)initWithHome:(id)a3 sessionIdentifier:(id)a4 invitationType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = +[HMDMetricsManager sharedLogEventSubmitter];
  v11 = [(HMDSharedUserInviteOwnerSendLogEventBuilder *)self initWithHome:v9 sessionIdentifier:v8 invitationType:a5 logEventSubmitter:v10 currentUpTicksBlock:&__block_literal_global_81548 submissionTimerFactory:&__block_literal_global_4];

  return v11;
}

id __93__HMDSharedUserInviteOwnerSendLogEventBuilder_initWithHome_sessionIdentifier_invitationType___block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:300.0];
  return v0;
}

__uint64_t __93__HMDSharedUserInviteOwnerSendLogEventBuilder_initWithHome_sessionIdentifier_invitationType___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

- (HMDSharedUserInviteOwnerSendLogEventBuilder)initWithHome:(id)a3 sessionIdentifier:(id)a4 invitationType:(unint64_t)a5 logEventSubmitter:(id)a6 currentUpTicksBlock:(id)a7 submissionTimerFactory:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [HMDSharedUserInviteOwnerSendLogEvent alloc];
  uint64_t v20 = [v14 uuid];
  int v21 = [(HMDSharedUserInviteLogEvent *)v19 initWithHomeUUID:v20];

  if (v21)
  {
    v22 = [v14 homeManager];
    uint64_t v23 = [v14 wifiManager];
    v27.receiver = self;
    v27.super_class = (Class)HMDSharedUserInviteOwnerSendLogEventBuilder;
    v24 = [(HMDSharedUserInviteLogEventBuilder *)&v27 initWithLogEvent:v21 homeManager:v22 sessionIdentifier:v15 invitationType:a5 logEventSubmitter:v16 wifiManager:v23 currentUpTicksBlock:v17 submissionTimerFactory:v18];

    if (v24)
    {
      objc_storeWeak((id *)&v24->_home, v14);
      objc_storeStrong((id *)&v24->_inviteLogEvent, v21);
    }
    self = v24;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_81558 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_81558, &__block_literal_global_14_81559);
  }
  v2 = (void *)logCategory__hmf_once_v17_81560;
  return v2;
}

void __58__HMDSharedUserInviteOwnerSendLogEventBuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17_81560;
  logCategory__hmf_once_v17_81560 = v0;
}

@end
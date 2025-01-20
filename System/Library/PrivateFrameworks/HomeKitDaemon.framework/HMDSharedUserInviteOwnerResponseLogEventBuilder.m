@interface HMDSharedUserInviteOwnerResponseLogEventBuilder
+ (id)logCategory;
- (BOOL)isReady;
- (HMDSharedUserInviteOwnerResponseLogEventBuilder)initWithHome:(id)a3 sessionIdentifier:(id)a4 invitationType:(unint64_t)a5;
- (void)cancel;
- (void)markAddUserToHomeBegin;
- (void)markAddUserToHomeEnd;
- (void)markAuthenticateUserBegin;
- (void)markAuthenticateUserEnd;
- (void)markJoiningReverseShareBegin;
- (void)markJoiningReverseShareEnd;
- (void)submit;
@end

@implementation HMDSharedUserInviteOwnerResponseLogEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseLogEvent, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (void)submit
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (!self->super.submitted)
  {
    v3 = (void *)MEMORY[0x230FBD990]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = HMFGetLogIdentifier();
      id Property = objc_getProperty(v4, v7, 112, 1);
      v10 = objc_msgSend(objc_getProperty(v4, v9, 112, 1), "error");
      *(_DWORD *)buf = 138543874;
      v15 = v6;
      __int16 v16 = 2112;
      id v17 = Property;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Submitting shared user response latency log event %@ error:%@", buf, 0x20u);
    }
    v13.receiver = v4;
    v13.super_class = (Class)HMDSharedUserInviteOwnerResponseLogEventBuilder;
    [(HMDSharedUserInviteLogEventBuilder *)&v13 submit];
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_home);
    v12 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained removeSharedUserResponseEventBuilder:v4];
    }
  }
}

- (BOOL)isReady
{
  os_unfair_lock_assert_owner(&self->super._lock);
  v14.receiver = self;
  v14.super_class = (Class)HMDSharedUserInviteOwnerResponseLogEventBuilder;
  BOOL v3 = [(HMDSharedUserInviteLogEventBuilder *)&v14 isReady];
  if (v3)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 112, 1);
    }
    else {
      id Property = 0;
    }
    v6 = [Property error];

    LOBYTE(v3) = v6
              || (!self ? (id v8 = 0) : (id v8 = objc_getProperty(self, v7, 112, 1)),
                  [v8 authenticateUserMS] >= 1
               && (!self ? (id v10 = 0) : (id v10 = objc_getProperty(self, v9, 112, 1)),
                   [v10 joiningReverseShareMS] >= 1
                && (!self ? (id v12 = 0) : (id v12 = objc_getProperty(self, v11, 112, 1)),
                    [v12 addUserToHomeMS] > 0)));
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
  v9.super_class = (Class)HMDSharedUserInviteOwnerResponseLogEventBuilder;
  [(HMDSharedUserInviteLogEventBuilder *)&v9 cancel];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_home);
    id v8 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained removeSharedUserResponseEventBuilder:v4];
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)markAddUserToHomeEnd
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v24 = 138543362;
    v25 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAddUserToHomeEnd", (uint8_t *)&v24, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->addUserToHomeBeginTime)
    {
      id v8 = objc_getProperty(v4, v7, 112, 1);
      BOOL v9 = [v8 addUserToHomeMS] == -1;

      if (v9)
      {
        id v10 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v11 = v10[2]();
        unint64_t addUserToHomeBeginTime = v4->addUserToHomeBeginTime;
        id v14 = objc_getProperty(v4, v13, 112, 1);
        v15 = v14;
        if (v11 == addUserToHomeBeginTime) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v11 - addUserToHomeBeginTime;
        }
        [v14 setAddUserToHomeMS:v16];

        id v17 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v18 = v17[2]();
        unint64_t eventCreatedTime = v4->super.eventCreatedTime;
        id v21 = objc_getProperty(v4, v20, 112, 1);
        v22 = v21;
        if (v18 == eventCreatedTime) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = v18 - eventCreatedTime;
        }
        [v21 setTotalOwnerResidentResponseMS:v23];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markAddUserToHomeBegin
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAddUserToHomeBegin", (uint8_t *)&v11, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->addUserToHomeBeginTime)
  {
    id v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t addUserToHomeBeginTime = v8[2]();

    id v10 = objc_getProperty(v4, v9, 112, 1);
    [v10 setAddUserToHomeMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markJoiningReverseShareEnd
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markJoiningReverseShareEnd", (uint8_t *)&v17, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->joiningReverseShareBeginTime)
    {
      id v8 = objc_getProperty(v4, v7, 112, 1);
      BOOL v9 = [v8 joiningReverseShareMS] == -1;

      if (v9)
      {
        id v10 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v11 = v10[2]();
        unint64_t joiningReverseShareBeginTime = v4->joiningReverseShareBeginTime;
        id v14 = objc_getProperty(v4, v13, 112, 1);
        v15 = v14;
        if (v11 == joiningReverseShareBeginTime) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v11 - joiningReverseShareBeginTime;
        }
        [v14 setJoiningReverseShareMS:v16];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markJoiningReverseShareBegin
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markJoiningReverseShareBegin", (uint8_t *)&v11, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->joiningReverseShareBeginTime)
  {
    id v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t joiningReverseShareBeginTime = v8[2]();

    id v10 = objc_getProperty(v4, v9, 112, 1);
    [v10 setJoiningReverseShareMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markAuthenticateUserEnd
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAuthenticateUserEnd", (uint8_t *)&v17, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->authenticateUserBeginTime)
    {
      id v8 = objc_getProperty(v4, v7, 112, 1);
      BOOL v9 = [v8 authenticateUserMS] == -1;

      if (v9)
      {
        id v10 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v11 = v10[2]();
        unint64_t authenticateUserBeginTime = v4->authenticateUserBeginTime;
        id v14 = objc_getProperty(v4, v13, 112, 1);
        v15 = v14;
        if (v11 == authenticateUserBeginTime) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v11 - authenticateUserBeginTime;
        }
        [v14 setAuthenticateUserMS:v16];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markAuthenticateUserBegin
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAuthenticateUserBegin", (uint8_t *)&v11, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->authenticateUserBeginTime)
  {
    id v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t authenticateUserBeginTime = v8[2]();

    id v10 = objc_getProperty(v4, v9, 112, 1);
    [v10 setAuthenticateUserMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMDSharedUserInviteOwnerResponseLogEventBuilder)initWithHome:(id)a3 sessionIdentifier:(id)a4 invitationType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  id v14 = &__block_literal_global_162125;
  id v15 = &__block_literal_global_4_162126;
  if (self)
  {
    uint64_t v16 = [HMDSharedUserInviteOwnerResponseLogEvent alloc];
    int v17 = [v11 uuid];
    uint64_t v18 = [(HMDSharedUserInviteOwnerResponseLogEvent *)v16 initWithHomeUUID:v17];

    if (v18)
    {
      uint64_t v19 = [v11 homeManager];
      SEL v20 = [v11 wifiManager];
      v24.receiver = self;
      v24.super_class = (Class)HMDSharedUserInviteOwnerResponseLogEventBuilder;
      id v21 = [(HMDSharedUserInviteLogEventBuilder *)&v24 initWithLogEvent:v18 homeManager:v19 sessionIdentifier:v12 invitationType:a5 logEventSubmitter:v13 wifiManager:v20 currentUpTicksBlock:&__block_literal_global_162125 submissionTimerFactory:&__block_literal_global_4_162126];

      if (v21)
      {
        objc_storeWeak((id *)&v21->_home, v11);
        objc_storeStrong((id *)&v21->_responseLogEvent, v18);
      }
      self = v21;
      v22 = self;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __97__HMDSharedUserInviteOwnerResponseLogEventBuilder_initWithHome_sessionIdentifier_invitationType___block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:300.0];
  return v0;
}

__uint64_t __97__HMDSharedUserInviteOwnerResponseLogEventBuilder_initWithHome_sessionIdentifier_invitationType___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_162137 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_162137, &__block_literal_global_14_162138);
  }
  v2 = (void *)logCategory__hmf_once_v15_162139;
  return v2;
}

void __62__HMDSharedUserInviteOwnerResponseLogEventBuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v15_162139;
  logCategory__hmf_once_v15_162139 = v0;
}

@end
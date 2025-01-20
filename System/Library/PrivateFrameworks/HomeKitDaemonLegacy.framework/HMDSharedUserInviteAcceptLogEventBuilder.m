@interface HMDSharedUserInviteAcceptLogEventBuilder
+ (id)logCategory;
- (BOOL)isReady;
- (HMDHomeManager)homeManager;
- (HMDSharedUserInviteAcceptLogEvent)acceptLogEvent;
- (HMDSharedUserInviteAcceptLogEventBuilder)initWithHomeUUID:(id)a3 homeManager:(id)a4 sessionIdentifier:(id)a5 invitationType:(unint64_t)a6 logEventSubmitter:(id)a7 wifiManager:(id)a8 currentUpTicksBlock:(id)a9 submissionTimerFactory:(id)a10;
- (HMDSharedUserInviteAcceptLogEventBuilder)initWithHomeUUID:(id)a3 homeManager:(id)a4 sessionIdentifier:(id)a5 invitationType:(unint64_t)a6 wifiManager:(id)a7;
- (void)markAddUserBegin;
- (void)markAddUserEnd;
- (void)markCreateMKFCKSharedUserDataRootBegin;
- (void)markCreateMKFCKSharedUserDataRootEnd;
- (void)markCreateReverseShareBegin;
- (void)markCreateReverseShareEnd;
- (void)markCreatedHome;
- (void)markDiscoverPrimaryResidentBegin;
- (void)markDiscoverPrimaryResidentEnd;
- (void)markJoinOwnerShareBegin;
- (void)markJoinOwnerShareEnd;
- (void)markResidentSyncBegin;
- (void)markResidentSyncEnd;
- (void)markSendAcceptanceToOwnerBegin;
- (void)markSendAcceptanceToOwnerEnd;
- (void)submit;
@end

@implementation HMDSharedUserInviteAcceptLogEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptLogEvent, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (HMDSharedUserInviteAcceptLogEvent)acceptLogEvent
{
  return (HMDSharedUserInviteAcceptLogEvent *)objc_getProperty(self, a2, 144, 1);
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)submit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (!self->super.submitted)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = HMFGetLogIdentifier();
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      v8 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      v9 = [v8 error];
      *(_DWORD *)buf = 138543874;
      v15 = v6;
      __int16 v16 = 2112;
      v17 = v7;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Submitting shared user accept latency log event %@ error:%@", buf, 0x20u);
    }
    v13.receiver = v4;
    v13.super_class = (Class)HMDSharedUserInviteAcceptLogEventBuilder;
    [(HMDSharedUserInviteLogEventBuilder *)&v13 submit];
    v10 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 homeManager];
    v11 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    v12 = [v11 homeUUID];
    [v10 removeSharedUserAcceptEventBuilderForHomeUuid:v12];
  }
}

- (BOOL)isReady
{
  os_unfair_lock_assert_owner(&self->super._lock);
  v18.receiver = self;
  v18.super_class = (Class)HMDSharedUserInviteAcceptLogEventBuilder;
  BOOL v3 = [(HMDSharedUserInviteLogEventBuilder *)&v18 isReady];
  if (v3)
  {
    v4 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
    v5 = [v4 error];

    if (v5)
    {
LABEL_3:
      LOBYTE(v3) = 1;
      return v3;
    }
    v6 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
    if ([v6 joinOwnerShareMS] >= 1)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
      if ([v7 createMKFCKSharedUserDataRootMS] >= 1)
      {
        v8 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
        if ([v8 createReverseShareMS] > 0)
        {
          v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
          if ([v9 addUserToShareMS] < 1)
          {
            BOOL v15 = 1;
          }
          else
          {
            v10 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
            if ([v10 sendAcceptanceToOwnerMS] < 1)
            {
              BOOL v15 = 1;
            }
            else
            {
              v11 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
              if ([v11 totalInvitationAcceptanceMS] < 1)
              {
                BOOL v15 = 1;
              }
              else
              {
                v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
                if ([v12 createHomeMS] < 1)
                {
                  BOOL v15 = 1;
                }
                else
                {
                  objc_super v13 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
                  if ([v13 discoverPrimaryResidentMS] < 1)
                  {
                    BOOL v15 = 1;
                  }
                  else
                  {
                    v17 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
                    if ([v17 residentSyncDataReceivedMS] < 1)
                    {
                      BOOL v15 = 1;
                    }
                    else
                    {
                      v14 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self acceptLogEvent];
                      BOOL v15 = [v14 sharedUserTotalMS] < 1;
                    }
                  }
                }
              }
            }
          }

          if (!v15) {
            goto LABEL_3;
          }
LABEL_17:
          LOBYTE(v3) = 0;
          return v3;
        }
      }
    }

    goto LABEL_17;
  }
  return v3;
}

- (void)markResidentSyncEnd
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markResidentSyncEnd", (uint8_t *)&v21, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->residentSyncBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 residentSyncDataReceivedMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t residentSyncBeginTime = v4->residentSyncBeginTime;
        v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
        if (v10 == residentSyncBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - residentSyncBeginTime;
        }
        [v12 setResidentSyncDataReceivedMS:v14];

        BOOL v15 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v16 = v15[2]();
        unint64_t eventCreatedTime = v4->super.eventCreatedTime;
        objc_super v18 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        v19 = v18;
        if (v16 == eventCreatedTime) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = v16 - eventCreatedTime;
        }
        [v18 setSharedUserTotalMS:v20];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markResidentSyncBegin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markResidentSyncBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->residentSyncBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t residentSyncBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setResidentSyncDataReceivedMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markDiscoverPrimaryResidentEnd
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markDiscoverPrimaryResidentEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->discoverPrimaryResidentBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 discoverPrimaryResidentMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t discoverPrimaryResidentBeginTime = v4->discoverPrimaryResidentBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
        if (v10 == discoverPrimaryResidentBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - discoverPrimaryResidentBeginTime;
        }
        [v12 setDiscoverPrimaryResidentMS:v14];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markDiscoverPrimaryResidentBegin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markDiscoverPrimaryResidentBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->discoverPrimaryResidentBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t discoverPrimaryResidentBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setDiscoverPrimaryResidentMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markCreatedHome
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreatedHome", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    BOOL v8 = [v7 createHomeMS] == 0;

    if (v8)
    {
      v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
      uint64_t v10 = v9[2]();
      unint64_t joinOwnerShareBeginTime = v4->joinOwnerShareBeginTime;
      uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      objc_super v13 = v12;
      if (v10 == joinOwnerShareBeginTime) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v10 - joinOwnerShareBeginTime;
      }
      [v12 setCreateHomeMS:v14];

      [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markSendAcceptanceToOwnerEnd
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markSendAcceptanceToOwnerEnd", (uint8_t *)&v21, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->sendAcceptanceToOwnerBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 sendAcceptanceToOwnerMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t sendAcceptanceToOwnerBeginTime = v4->sendAcceptanceToOwnerBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
        if (v10 == sendAcceptanceToOwnerBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - sendAcceptanceToOwnerBeginTime;
        }
        [v12 setSendAcceptanceToOwnerMS:v14];

        int v15 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v16 = v15[2]();
        unint64_t eventCreatedTime = v4->super.eventCreatedTime;
        objc_super v18 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        v19 = v18;
        if (v16 == eventCreatedTime) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = v16 - eventCreatedTime;
        }
        [v18 setTotalInvitationAcceptanceMS:v20];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markSendAcceptanceToOwnerBegin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markSendAcceptanceToOwnerBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->sendAcceptanceToOwnerBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t sendAcceptanceToOwnerBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setSendAcceptanceToOwnerMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markAddUserEnd
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAddUserEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->addUserToShareBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 addUserToShareMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t addUserToShareBeginTime = v4->addUserToShareBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markAddUserBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->addUserToShareBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t addUserToShareBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setAddUserToShareMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markCreateReverseShareEnd
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreateReverseShareEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->createReverseShareBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 createReverseShareMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t createReverseShareBeginTime = v4->createReverseShareBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
        if (v10 == createReverseShareBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - createReverseShareBeginTime;
        }
        [v12 setCreateReverseShareMS:v14];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markCreateReverseShareBegin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreateReverseShareBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->createReverseShareBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t createReverseShareBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setCreateReverseShareMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markCreateMKFCKSharedUserDataRootEnd
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreateMKFCKSharedUserDataRootEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->createMKFCKSharedUserDataRootBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 createMKFCKSharedUserDataRootMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t createMKFCKSharedUserDataRootBeginTime = v4->createMKFCKSharedUserDataRootBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
        if (v10 == createMKFCKSharedUserDataRootBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - createMKFCKSharedUserDataRootBeginTime;
        }
        [v12 setCreateMKFCKSharedUserDataRootMS:v14];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markCreateMKFCKSharedUserDataRootBegin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markCreateMKFCKSharedUserDataRootBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->createMKFCKSharedUserDataRootBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t createMKFCKSharedUserDataRootBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setCreateMKFCKSharedUserDataRootMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markJoinOwnerShareEnd
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markJoinOwnerShareEnd", (uint8_t *)&v15, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted)
  {
    if (v4->joinOwnerShareBeginTime)
    {
      v7 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
      BOOL v8 = [v7 joinOwnerShareMS] == -1;

      if (v8)
      {
        v9 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
        uint64_t v10 = v9[2]();
        unint64_t joinOwnerShareBeginTime = v4->joinOwnerShareBeginTime;
        uint64_t v12 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
        objc_super v13 = v12;
        if (v10 == joinOwnerShareBeginTime) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v10 - joinOwnerShareBeginTime;
        }
        [v12 setJoinOwnerShareMS:v14];

        [(HMDSharedUserInviteLogEventBuilder *)v4 submitIfReady];
      }
    }
  }
  os_unfair_lock_unlock(&v4->super._lock);
}

- (void)markJoinOwnerShareBegin
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@markJoinOwnerShareBegin", (uint8_t *)&v10, 0xCu);
  }
  p_lock = &v4->super._lock;
  os_unfair_lock_lock_with_options();
  if (!v4->super.submitted && !v4->joinOwnerShareBeginTime)
  {
    BOOL v8 = [(HMDSharedUserInviteLogEventBuilder *)v4 currentUpTicksBlock];
    v4->unint64_t joinOwnerShareBeginTime = v8[2]();

    v9 = [(HMDSharedUserInviteAcceptLogEventBuilder *)v4 acceptLogEvent];
    [v9 setJoinOwnerShareMS:-1];
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMDSharedUserInviteAcceptLogEventBuilder)initWithHomeUUID:(id)a3 homeManager:(id)a4 sessionIdentifier:(id)a5 invitationType:(unint64_t)a6 wifiManager:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v17 = [(HMDSharedUserInviteAcceptLogEventBuilder *)self initWithHomeUUID:v15 homeManager:v14 sessionIdentifier:v13 invitationType:a6 logEventSubmitter:v16 wifiManager:v12 currentUpTicksBlock:&__block_literal_global_177556 submissionTimerFactory:&__block_literal_global_4_177557];

  return v17;
}

id __118__HMDSharedUserInviteAcceptLogEventBuilder_initWithHomeUUID_homeManager_sessionIdentifier_invitationType_wifiManager___block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:8 options:900.0];
  return v0;
}

__uint64_t __118__HMDSharedUserInviteAcceptLogEventBuilder_initWithHomeUUID_homeManager_sessionIdentifier_invitationType_wifiManager___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

- (HMDSharedUserInviteAcceptLogEventBuilder)initWithHomeUUID:(id)a3 homeManager:(id)a4 sessionIdentifier:(id)a5 invitationType:(unint64_t)a6 logEventSubmitter:(id)a7 wifiManager:(id)a8 currentUpTicksBlock:(id)a9 submissionTimerFactory:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a3;
  v22 = [[HMDSharedUserInviteAcceptLogEvent alloc] initWithHomeUUID:v21];

  if (v22)
  {
    v28.receiver = self;
    v28.super_class = (Class)HMDSharedUserInviteAcceptLogEventBuilder;
    uint64_t v23 = [(HMDSharedUserInviteLogEventBuilder *)&v28 initWithLogEvent:v22 homeManager:v15 sessionIdentifier:v16 invitationType:a6 logEventSubmitter:v17 wifiManager:v18 currentUpTicksBlock:v19 submissionTimerFactory:v20];
    p_isa = (id *)&v23->super.super.isa;
    if (v23)
    {
      objc_storeWeak((id *)&v23->_homeManager, v15);
      objc_storeStrong(p_isa + 18, v22);
    }
    self = p_isa;
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
  if (logCategory__hmf_once_t31_177567 != -1) {
    dispatch_once(&logCategory__hmf_once_t31_177567, &__block_literal_global_12_177568);
  }
  v2 = (void *)logCategory__hmf_once_v32_177569;
  return v2;
}

uint64_t __55__HMDSharedUserInviteAcceptLogEventBuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32_177569;
  logCategory__hmf_once_v32_177569 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
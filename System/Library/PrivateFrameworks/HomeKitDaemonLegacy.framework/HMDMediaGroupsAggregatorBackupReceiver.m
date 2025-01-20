@interface HMDMediaGroupsAggregatorBackupReceiver
+ (id)logCategory;
- (HMDMediaGroupsAggregatorBackupReceiver)init;
- (HMDMediaGroupsAggregatorBackupReceiverDelegate)delegate;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4;
- (void)handleGroupsBackupDataMessage:(id)a3;
- (void)registerForMessagesWithHome:(id)a3 messageDispatcher:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation HMDMediaGroupsAggregatorBackupReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupsAggregatorBackupReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupsAggregatorBackupReceiverDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsAggregatorBackupReceiver *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleGroupsBackupDataMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v27 = 138543618;
    v28 = v8;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling backup group data message: %@", (uint8_t *)&v27, 0x16u);
  }
  v9 = [v4 messagePayload];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "hmf_arrayForKey:", @"HMDMediaGroupsBackupDataKey");
    if (v11)
    {
      v12 = [(HMDMediaGroupsAggregatorBackupReceiver *)v6 delegate];
      if (v12)
      {
        v13 = v12;
        [v12 didReceiveBackupData:v11 forBackupReceiver:v6];
        [v4 respondWithSuccess];
      }
      else
      {
        v22 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
        v23 = (void *)MEMORY[0x1D9452090]();
        v24 = v6;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          int v27 = 138543618;
          v28 = v26;
          __int16 v29 = 2112;
          id v30 = v22;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify delegate of received backup due to unconfigured delegate error: %@", (uint8_t *)&v27, 0x16u);
        }
        [v4 respondWithError:v22];

        v13 = 0;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      v18 = (void *)MEMORY[0x1D9452090]();
      v19 = v6;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        int v27 = 138543874;
        v28 = v21;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to decode group backup data payload: %@ error: %@", (uint8_t *)&v27, 0x20u);
      }
      [v4 respondWithError:v13];
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v27 = 138543874;
      v28 = v17;
      __int16 v29 = 2112;
      id v30 = v4;
      __int16 v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from group backup data message: %@ error: %@", (uint8_t *)&v27, 0x20u);
    }
    [v4 respondWithError:v11];
  }
}

- (void)registerForMessagesWithHome:(id)a3 messageDispatcher:(id)a4
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v9 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v10 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v7 userPrivilege:3 remoteAccessRequired:0];

  v12[0] = v8;
  v12[1] = v9;
  v12[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  [v6 registerForMessage:@"HMDMediaGroupsBackupDataMessage" receiver:self policies:v11 selector:sel_handleGroupsBackupDataMessage_];
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [v8 uuid];
  [(HMDMediaGroupsAggregatorBackupReceiver *)self setIdentifier:v7];

  [(HMDMediaGroupsAggregatorBackupReceiver *)self registerForMessagesWithHome:v8 messageDispatcher:v6];
}

- (HMDMediaGroupsAggregatorBackupReceiver)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDMediaGroupsAggregatorBackupReceiver;
  v2 = [(HMDMediaGroupsAggregatorBackupReceiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_158174 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_158174, &__block_literal_global_158175);
  }
  v2 = (void *)logCategory__hmf_once_v5_158176;
  return v2;
}

uint64_t __53__HMDMediaGroupsAggregatorBackupReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_158176;
  logCategory__hmf_once_v5_158176 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
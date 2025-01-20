@interface HMDMediaGroupsAggregatorBackupSender
+ (id)logCategory;
- (HMDMediaGroupsAggregateBackupMessageTimerProvider)backupTimerProvider;
- (HMDMediaGroupsAggregatorBackupSender)initWithIdentifier:(id)a3;
- (HMDMediaGroupsAggregatorBackupSender)initWithIdentifier:(id)a3 backupTimerProvider:(id)a4;
- (HMDMediaGroupsAggregatorBackupSenderDataSource)dataSource;
- (NSUUID)identifier;
- (id)backupGroupsForParticipantAccessoryUUID:(id)a3;
- (id)backupTimerForParticipantAccessoryUUID:(id)a3;
- (id)logIdentifier;
- (id)mediaGroupsAggregateBackupMessageTimerWithParticipantAccessoryUUID:(id)a3;
- (id)receiverForParticipantAccessoryUUID:(id)a3;
- (id)routerParticipantAccessoryUUID:(id)a3;
- (void)_sendBackupToFirstPartyParticipantAccessoryUUID:(id)a3 backupGroups:(id)a4;
- (void)_sendBackupToParticipantAccessoryUUID:(id)a3;
- (void)clearCachedData;
- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3;
- (void)createNewBackupTimerForParticipantAccessoryUUID:(id)a3;
- (void)didFireTimerForMediaGroupsAggregateBackupMessageTimer:(id)a3;
- (void)locallyRouteGroupsBackupDataMessage:(id)a3 toParticipantAccessoryUUID:(id)a4;
- (void)markAttemptForParticipantAccessoryUUID:(id)a3 withMessageIdentifier:(id)a4;
- (void)removeBackupTimerWithParticipantAccessoryUUID:(id)a3;
- (void)routeBackedUpGroupsMessage:(id)a3 toParticipantAccessoryUUID:(id)a4;
- (void)sendBackupToParticipantAccessoryUUID:(id)a3;
- (void)setBackUpTimer:(id)a3;
- (void)setBackupTimerProvider:(id)a3;
- (void)setDataSource:(id)a3;
- (void)startBackupTimerWithParticipantAccessoryUUID:(id)a3 dueToFailedMessageIdentifier:(id)a4;
@end

@implementation HMDMediaGroupsAggregatorBackupSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_backupTimerProvider);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backupTimers, 0);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBackupTimerProvider:(id)a3
{
}

- (HMDMediaGroupsAggregateBackupMessageTimerProvider)backupTimerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backupTimerProvider);
  return (HMDMediaGroupsAggregateBackupMessageTimerProvider *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaGroupsAggregatorBackupSenderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupsAggregatorBackupSenderDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsAggregatorBackupSender *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)mediaGroupsAggregateBackupMessageTimerWithParticipantAccessoryUUID:(id)a3
{
  id v3 = a3;
  v4 = [[HMDMediaGroupsAggregateBackupMessageTimer alloc] initWithParticipantAccessoryUUID:v3];

  return v4;
}

- (void)didFireTimerForMediaGroupsAggregateBackupMessageTimer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 participantAccessoryUUID];
  id v6 = [(HMDMediaGroupsAggregatorBackupSender *)self backupTimerForParticipantAccessoryUUID:v5];

  if (v6 && v6 == v4)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [v4 participantAccessoryUUID];
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Backup timer fired for participant accessory uuid: %@", (uint8_t *)&v13, 0x16u);
    }
    v12 = [v4 participantAccessoryUUID];
    [(HMDMediaGroupsAggregatorBackupSender *)v8 _sendBackupToParticipantAccessoryUUID:v12];
  }
}

- (void)markAttemptForParticipantAccessoryUUID:(id)a3 withMessageIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDMediaGroupsAggregatorBackupSender *)self backupTimerForParticipantAccessoryUUID:v6];
  v9 = v8;
  if (v8)
  {
    [v8 markAttemptWithMessageIdentifier:v7];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      __int16 v15 = v13;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to mark backup timer attempt due to no timer for accessory UUID: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)startBackupTimerWithParticipantAccessoryUUID:(id)a3 dueToFailedMessageIdentifier:(id)a4
{
  id v6 = a4;
  id v8 = [(HMDMediaGroupsAggregatorBackupSender *)self backupTimerForParticipantAccessoryUUID:a3];
  id v7 = [v8 currentMessageIdentifier];
  LODWORD(self) = objc_msgSend(v7, "hmf_isEqualToUUID:", v6);

  if (self) {
    [v8 startRetryTimer];
  }
}

- (void)removeBackupTimerWithParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_backupTimers removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)backupTimerForParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_backupTimers objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)setBackUpTimer:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  backupTimers = self->_backupTimers;
  id v6 = [v7 participantAccessoryUUID];
  [(NSMutableDictionary *)backupTimers setObject:v7 forKey:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)createNewBackupTimerForParticipantAccessoryUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMediaGroupsAggregatorBackupSender *)self backupTimerProvider];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mediaGroupsAggregateBackupMessageTimerWithParticipantAccessoryUUID:v4];
    [v7 setDelegate:self];
    [(HMDMediaGroupsAggregatorBackupSender *)self setBackUpTimer:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new backup timer due to no provider", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)receiverForParticipantAccessoryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMediaGroupsAggregatorBackupSender *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 receiverForParticipantAccessoryUUID:v4 mediaGroupsAggregatorBackupSender:self];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get receiver for participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)routerParticipantAccessoryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMediaGroupsAggregatorBackupSender *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 routerForParticipantAccessoryUUID:v4 mediaGroupsAggregatorBackupSender:self];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get router for participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)backupGroupsForParticipantAccessoryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDMediaGroupsAggregatorBackupSender *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 backupGroupsForParticipantAccessoryUUID:v4 mediaGroupsAggregatorBackupSender:self];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get backup groups for participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)locallyRouteGroupsBackupDataMessage:(id)a3 toParticipantAccessoryUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaGroupsAggregatorBackupSender *)self receiverForParticipantAccessoryUUID:v7];
  v9 = v8;
  if (v8)
  {
    [v8 handleGroupsBackupDataMessage:v6];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to locally route due to no receiver for groups backup data message: %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    [v6 respondWithError:v14];
  }
}

- (void)routeBackedUpGroupsMessage:(id)a3 toParticipantAccessoryUUID:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = [v6 name];
    int v13 = [v6 identifier];
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@(%@)", buf, 0x20u);
  }
  uint64_t v14 = [(HMDMediaGroupsAggregatorBackupSender *)v9 routerParticipantAccessoryUUID:v7];
  if (v14)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__HMDMediaGroupsAggregatorBackupSender_routeBackedUpGroupsMessage_toParticipantAccessoryUUID___block_invoke;
    v20[3] = &unk_1E6A155D0;
    v20[4] = v9;
    id v21 = v7;
    [v14 routeMessage:v6 localHandler:v20];
  }
  else
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v9;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to route backup group data due to no router found for participant accessory UUID: %@", buf, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    [v6 respondWithError:v19];
  }
}

uint64_t __94__HMDMediaGroupsAggregatorBackupSender_routeBackedUpGroupsMessage_toParticipantAccessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) locallyRouteGroupsBackupDataMessage:a2 toParticipantAccessoryUUID:*(void *)(a1 + 40)];
}

- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_backupTimers removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)clearCachedData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  backupTimers = self->_backupTimers;
  self->_backupTimers = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void)_sendBackupToFirstPartyParticipantAccessoryUUID:(id)a3 backupGroups:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27 = @"HMDMediaGroupsBackupDataKey";
  v28[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  id v9 = objc_alloc(MEMORY[0x1E4F65488]);
  v10 = [(HMDMediaGroupsAggregatorBackupSender *)self identifier];
  v11 = (void *)[v9 initWithTarget:v10];

  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMDMediaGroupsBackupDataMessage" destination:v11 payload:v8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  __int16 v24 = __Block_byref_object_copy__42272;
  id v25 = __Block_byref_object_dispose__42273;
  id v26 = [v12 identifier];
  [(HMDMediaGroupsAggregatorBackupSender *)self markAttemptForParticipantAccessoryUUID:v6 withMessageIdentifier:v22[5]];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __101__HMDMediaGroupsAggregatorBackupSender__sendBackupToFirstPartyParticipantAccessoryUUID_backupGroups___block_invoke;
  __int16 v17 = &unk_1E6A0A660;
  id v18 = self;
  id v13 = v6;
  id v19 = v13;
  v20 = &v21;
  [v12 setResponseHandler:&v14];
  -[HMDMediaGroupsAggregatorBackupSender routeBackedUpGroupsMessage:toParticipantAccessoryUUID:](self, "routeBackedUpGroupsMessage:toParticipantAccessoryUUID:", v12, v13, v14, v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
}

void __101__HMDMediaGroupsAggregatorBackupSender__sendBackupToFirstPartyParticipantAccessoryUUID_backupGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      int v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Groups backup data message responded with error: %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 32) startBackupTimerWithParticipantAccessoryUUID:*(void *)(a1 + 40) dueToFailedMessageIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else
  {
    [*(id *)(a1 + 32) removeBackupTimerWithParticipantAccessoryUUID:*(void *)(a1 + 40)];
  }
}

- (void)_sendBackupToParticipantAccessoryUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending backup group data message to participant accessory uuid: %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [(HMDMediaGroupsAggregatorBackupSender *)v6 backupGroupsForParticipantAccessoryUUID:v4];
  if (v9)
  {
    [(HMDMediaGroupsAggregatorBackupSender *)v6 _sendBackupToFirstPartyParticipantAccessoryUUID:v4 backupGroups:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = v6;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get backup groups to send for participant accessory uuid: %@", (uint8_t *)&v14, 0x16u);
    }
    [(HMDMediaGroupsAggregatorBackupSender *)v11 removeBackupTimerWithParticipantAccessoryUUID:v4];
  }
}

- (void)sendBackupToParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  [(HMDMediaGroupsAggregatorBackupSender *)self createNewBackupTimerForParticipantAccessoryUUID:v4];
  [(HMDMediaGroupsAggregatorBackupSender *)self _sendBackupToParticipantAccessoryUUID:v4];
}

- (HMDMediaGroupsAggregatorBackupSender)initWithIdentifier:(id)a3 backupTimerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    uint64_t v15 = (HMDMediaGroupsAggregatorBackupSender *)_HMFPreconditionFailure();
    return [(HMDMediaGroupsAggregatorBackupSender *)v15 initWithIdentifier:v17];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDMediaGroupsAggregatorBackupSender;
  v10 = [(HMDMediaGroupsAggregatorBackupSender *)&v18 init];
  int v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_identifier, a3);
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    backupTimers = v11->_backupTimers;
    v11->_backupTimers = (NSMutableDictionary *)v12;

    objc_storeWeak((id *)&v11->_backupTimerProvider, v9);
  }

  return v11;
}

- (HMDMediaGroupsAggregatorBackupSender)initWithIdentifier:(id)a3
{
  return [(HMDMediaGroupsAggregatorBackupSender *)self initWithIdentifier:a3 backupTimerProvider:self];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17 != -1) {
    dispatch_once(&logCategory__hmf_once_t17, &__block_literal_global_42290);
  }
  v2 = (void *)logCategory__hmf_once_v18;
  return v2;
}

uint64_t __51__HMDMediaGroupsAggregatorBackupSender_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18;
  logCategory__hmf_once_objc_super v18 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
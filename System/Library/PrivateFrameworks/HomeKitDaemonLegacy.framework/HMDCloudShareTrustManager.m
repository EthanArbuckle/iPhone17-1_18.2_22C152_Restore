@interface HMDCloudShareTrustManager
+ (id)logCategory;
- (BOOL)canUseUntrustedAccountHandlesForParticipantManager:(id)a3;
- (BOOL)isFromOwner;
- (BOOL)isOwnedTrust;
- (BOOL)isTrustConfigured;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (CloudShareTrustManagerTrustStatusCounts)trustStatusCounts;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMBShareUserID)ownerCloudShareID;
- (HMDCloudShareMessenger)cloudShareMessenger;
- (HMDCloudShareParticipantsManager)cloudShareParticipantsManager;
- (HMDCloudShareTrustManager)initWithDatabase:(id)a3 isOwnedTrust:(BOOL)a4 queue:(id)a5 shareMessenger:(id)a6 ownerCloudShareID:(id)a7 logEventSubmitter:(id)a8 dailyScheduler:(id)a9;
- (HMDCloudShareTrustManagerDataSource)dataSource;
- (HMDCloudShareTrustManagerDelegate)delegate;
- (HMDCloudShareTrustManagerMetricsEventDispatcher)metricsEventDispatcher;
- (HMDDatabase)database;
- (HMFTimer)requestInviteTimer;
- (OS_dispatch_queue)queue;
- (id)attributeDescriptions;
- (id)homeForCloudShareTrustManagerMetricsEventDispatcher:(id)a3;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)logIdentifier;
- (id)participantsManagerFactory;
- (id)requestInviteTimerFactory;
- (int64_t)configureState;
- (void)_cancelRequestInviteTimer;
- (void)_configure;
- (void)_configureOwnerCloudShareIDWithCloudZone:(id)a3;
- (void)_configureWithFetchZoneResult:(id)a3 error:(id)a4;
- (void)_configureWithOwnedZone;
- (void)_configureWithSharedZone;
- (void)_didCreateZone;
- (void)_didRemoveZone;
- (void)_finishConfigure;
- (void)_homeDidBecomeTrustZoneCapable:(id)a3;
- (void)_requestShareInvitationForSharedZone;
- (void)_startRequestInviteTimer;
- (void)cloudZone:(id)a3 didRemoveParticipantWithClientIdentifier:(id)a4;
- (void)cloudZone:(id)a3 didUpdateParticipantWithClientIdentifier:(id)a4;
- (void)configure;
- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)discoverUntrustedUsers;
- (void)homeDidBecomeTrustZoneCapable:(id)a3;
- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5;
- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5;
- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5;
- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5;
- (void)removeTrust;
- (void)sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5;
- (void)setCloudShareParticipantsManager:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setConfigureState:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalZone:(id)a3;
- (void)setMetricsEventDispatcher:(id)a3;
- (void)setOwnerCloudShareID:(id)a3;
- (void)setParticipantsManagerFactory:(id)a3;
- (void)setRequestInviteTimer:(id)a3;
- (void)setRequestInviteTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateCloudShareIDForAllUsers;
- (void)updateCloudShareIDForUser:(id)a3;
- (void)updateCurrentUserCloudShareID;
@end

@implementation HMDCloudShareTrustManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestInviteTimerFactory, 0);
  objc_storeStrong(&self->_participantsManagerFactory, 0);
  objc_storeStrong((id *)&self->_ownerCloudShareID, 0);
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_storeStrong((id *)&self->_requestInviteTimer, 0);
  objc_storeStrong((id *)&self->_cloudShareParticipantsManager, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_cloudShareMessenger, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setRequestInviteTimerFactory:(id)a3
{
}

- (id)requestInviteTimerFactory
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setParticipantsManagerFactory:(id)a3
{
}

- (id)participantsManagerFactory
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setOwnerCloudShareID:(id)a3
{
}

- (HMBShareUserID)ownerCloudShareID
{
  return (HMBShareUserID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMetricsEventDispatcher:(id)a3
{
}

- (HMDCloudShareTrustManagerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDCloudShareTrustManagerMetricsEventDispatcher *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRequestInviteTimer:(id)a3
{
}

- (HMFTimer)requestInviteTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudShareParticipantsManager:(id)a3
{
}

- (HMDCloudShareParticipantsManager)cloudShareParticipantsManager
{
  return (HMDCloudShareParticipantsManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isOwnedTrust
{
  return self->_ownedTrust;
}

- (HMDCloudShareMessenger)cloudShareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 56, 1);
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCloudShareTrustManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCloudShareTrustManagerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDCloudShareTrustManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCloudShareTrustManagerDataSource *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCloudShareTrustManager *)self requestInviteTimer];

  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      v12 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Request invite timer fired", (uint8_t *)&v21, 0xCu);
    }
    if ([(HMDCloudShareTrustManager *)v8 configureState] == 2
      || [(HMDCloudShareTrustManager *)v8 configureState] == 3)
    {
      v13 = (void *)MEMORY[0x1D9452090]();
      v14 = v8;
      v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
LABEL_12:

        [(HMDCloudShareTrustManager *)v14 _cancelRequestInviteTimer];
        goto LABEL_13;
      }
      v16 = HMFGetLogIdentifier();
      v17 = HMDCloudShareTrustManagerConfigureStateAsString([(HMDCloudShareTrustManager *)v14 configureState]);
      int v21 = 138543618;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Canceling request invite timer due to trust manager configure state: %@", (uint8_t *)&v21, 0x16u);
    }
    else
    {
      v18 = [(HMDCloudShareTrustManager *)v8 requestInviteTimer];
      [v18 timeInterval];
      double v20 = v19;

      if (v20 < 86400.0)
      {
        [(HMDCloudShareTrustManager *)v8 _configure];
        goto LABEL_13;
      }
      v13 = (void *)MEMORY[0x1D9452090]();
      v14 = v8;
      v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      v16 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Canceling request invite timer due to reaching max interval time", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_12;
  }
  if (v10)
  {
    v11 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received timer did fire call from unknown timer: %@", (uint8_t *)&v21, 0x16u);
  }
LABEL_13:
}

- (void)_cancelRequestInviteTimer
{
  v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  [(HMDCloudShareTrustManager *)self setRequestInviteTimer:0];
}

- (void)_startRequestInviteTimer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareTrustManager *)self requestInviteTimer];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v19 = 138543362;
      double v20 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Request invite timer already started", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    v9 = [(HMDCloudShareTrustManager *)self requestInviteTimerFactory];
    BOOL v10 = v9[2](v9, 3, 30.0, 86400.0);
    [(HMDCloudShareTrustManager *)self setRequestInviteTimer:v10];

    v11 = [(HMDCloudShareTrustManager *)self requestInviteTimer];
    [v11 setDelegate:self];

    v12 = [(HMDCloudShareTrustManager *)self queue];
    v13 = [(HMDCloudShareTrustManager *)self requestInviteTimer];
    [v13 setDelegateQueue:v12];

    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      double v20 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Starting request invite timer", (uint8_t *)&v19, 0xCu);
    }
    v18 = [(HMDCloudShareTrustManager *)v15 requestInviteTimer];
    [v18 resume];
  }
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCloudShareTrustManager *)self isOwnedTrust];
  id v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"isOwnedTrust" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = HMDCloudShareTrustManagerConfigureStateAsString([(HMDCloudShareTrustManager *)self configureState]);
  v8 = (void *)[v6 initWithName:@"configureState" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v10 = [(HMDCloudShareTrustManager *)self ownerCloudShareID];
  v11 = (void *)[v9 initWithName:@"ownerCloudShareID" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)logIdentifier
{
  id v3 = [(HMDCloudShareTrustManager *)self dataSource];
  id v4 = [v3 zoneNameForCloudShareTrustManager:self];

  return v4;
}

- (void)_didRemoveZone
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Trust zone has been removed", (uint8_t *)&v10, 0xCu);
  }
  v8 = [(HMDCloudShareTrustManager *)v5 metricsEventDispatcher];
  [v8 submitTrustZoneRemovedEvent];

  id v9 = [(HMDCloudShareTrustManager *)v5 delegate];
  [v9 didRemoveTrustZoneInCloudShareTrustManager:v5];

  [(HMDCloudShareTrustManager *)v5 setConfigureState:3];
  [(HMDCloudShareTrustManager *)v5 setCloudZone:0];
  [(HMDCloudShareTrustManager *)v5 setLocalZone:0];
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = [(HMDCloudShareTrustManager *)self dataSource];
  id v9 = [v8 zoneNameForCloudShareTrustManager:self];

  LODWORD(v8) = [v7 isEqualToString:v9];
  if (v8 && [(HMDCloudShareTrustManager *)self isOwnedTrust] == v5)
  {
    int v10 = [(HMDCloudShareTrustManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__HMDCloudShareTrustManager_database_didRemoveZoneWithName_isPrivate___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v10, block);
  }
}

uint64_t __70__HMDCloudShareTrustManager_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didRemoveZone];
}

- (void)_didCreateZone
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  BOOL v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Trust zone has been created", (uint8_t *)&v13, 0xCu);
  }
  v8 = [(HMDCloudShareTrustManager *)v5 metricsEventDispatcher];
  [v8 submitTrustZoneCreatedEvent];

  if ([(HMDCloudShareTrustManager *)v5 configureState] == 3)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    int v10 = v5;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Forcing trust from removed to unconfigured state due to a zone creation notification", (uint8_t *)&v13, 0xCu);
    }
    os_unfair_lock_lock_with_options();
    v10->_configureState = 0;
    os_unfair_lock_unlock(&v10->_lock);
  }
  [(HMDCloudShareTrustManager *)v5 _configure];
}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = [(HMDCloudShareTrustManager *)self dataSource];
  id v9 = [v8 zoneNameForCloudShareTrustManager:self];

  LODWORD(v8) = [v7 isEqualToString:v9];
  if (v8 && [(HMDCloudShareTrustManager *)self isOwnedTrust] == v5)
  {
    int v10 = [(HMDCloudShareTrustManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__HMDCloudShareTrustManager_database_didCreateZoneWithName_isPrivate___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v10, block);
  }
}

uint64_t __70__HMDCloudShareTrustManager_database_didCreateZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCreateZone];
}

- (id)homeForCloudShareTrustManagerMetricsEventDispatcher:(id)a3
{
  id v4 = [(HMDCloudShareTrustManager *)self dataSource];
  BOOL v5 = [v4 homeForCloudShareTrustManager:self];

  return v5;
}

- (CloudShareTrustManagerTrustStatusCounts)trustStatusCounts
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = [(HMDCloudShareTrustManager *)self dataSource];
  BOOL v5 = [v4 homeForCloudShareTrustManager:self];

  v33 = v5;
  id v6 = [v5 users];
  uint64_t v32 = [v6 count];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v10 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isOwner", v32) & 1) == 0)
        {
          v14 = [(HMDCloudShareTrustManager *)self cloudShareParticipantsManager];
          uint64_t v15 = [v14 participatingUsers];
          char v16 = [v15 containsObject:v13];

          if (v16)
          {
            v17 = [(HMDCloudShareTrustManager *)self cloudShareParticipantsManager];
            int v18 = [v17 isAcceptedParticipatingUser:v13];

            int v19 = [v13 cloudShareID];

            if (v18)
            {
              ++v37;
              if (v19) {
                ++v36;
              }
              else {
                ++v35;
              }
            }
            else
            {
              ++v40;
              uint64_t v20 = v38;
              if (v19) {
                uint64_t v20 = v38 + 1;
              }
              uint64_t v38 = v20;
              v39 += [v13 hasDeviceWithHomeKitVersionGreaterThanVersion:@"6.2"];
            }
          }
          else
          {
            ++v10;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v10 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
  }

  uint64_t v21 = 1;
  if (((v32 - 1) & ~((v32 - 1) >> 63)) != 1) {
    uint64_t v21 = 2;
  }
  if (v32 - 1 <= 0) {
    int64_t v22 = 0;
  }
  else {
    int64_t v22 = v21;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HMDCloudShareTrustManager_trustStatusCounts__block_invoke;
  aBlock[3] = &__block_descriptor_40_e11_Q24__0Q8Q16l;
  aBlock[4] = (v32 - 1) & ~((v32 - 1) >> 63);
  __int16 v23 = (uint64_t (**)(void *, void, uint64_t))_Block_copy(aBlock);
  unint64_t v24 = v23[2](v23, v37, 100);
  unint64_t v25 = v23[2](v23, v36, 100);
  unint64_t v26 = v23[2](v23, v38, 0);
  unint64_t v27 = v23[2](v23, v39, 0);
  unint64_t v28 = v23[2](v23, v10, 0);
  unint64_t v29 = v23[2](v23, v40, 0);
  unint64_t v30 = v23[2](v23, v35, 0);
  retstr->var0 = v22;
  retstr->var1 = v24;
  retstr->var2 = v25;
  retstr->var3 = v26;
  retstr->var4 = v27;
  retstr->var5 = v28;
  retstr->var6 = v29;
  retstr->var7 = v30;

  return result;
}

unint64_t __46__HMDCloudShareTrustManager_trustStatusCounts__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    return (unint64_t)((double)a2 * 100.0 / (double)v3);
  }
  return a3;
}

- (BOOL)isFromOwner
{
  uint64_t v3 = [(HMDCloudShareTrustManager *)self dataSource];
  id v4 = [v3 homeForCloudShareTrustManager:self];

  BOOL v5 = [v4 currentUser];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 isOwner];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)canUseUntrustedAccountHandlesForParticipantManager:(id)a3
{
  return 1;
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  uint64_t v8 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v8);

  [(HMDCloudShareTrustManager *)self sendShareInvitation:v9 toUser:0 device:v7];
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  uint64_t v8 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v8);

  [(HMDCloudShareTrustManager *)self sendShareInvitation:v9 toUser:v7 device:0];
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(HMDCloudShareTrustManager *)self configureState] == 3)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v8 = [(HMDCloudShareTrustManager *)self dataSource];
    char v7 = [v8 cloudShareTrustManager:self shouldShareTrustWithUser:v5];
  }
  return v7;
}

- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  int v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v45 = v15;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Received trust zone invitation", buf, 0xCu);
  }
  char v16 = (void *)MEMORY[0x1E4F28DC0];
  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  id v43 = 0;
  int v18 = [v16 _strictlyUnarchivedObjectOfClasses:v17 fromData:v9 error:&v43];
  id v19 = v43;

  if (v18)
  {
    uint64_t v20 = [(HMDCloudShareTrustManager *)v13 database];
    uint64_t v21 = [v20 acceptInvitation:v18];
    int64_t v22 = (void *)MEMORY[0x1E4F7A0F0];
    [(HMDCloudShareTrustManager *)v13 queue];
    v24 = __int16 v23 = v10;
    [v22 schedulerWithDispatchQueue:v24];
    id v38 = v19;
    id v25 = v9;
    v27 = id v26 = v8;
    unint64_t v28 = [v21 reschedule:v27];

    id v10 = v23;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke;
    v41[3] = &unk_1E6A17D78;
    v41[4] = v13;
    id v29 = v23;
    id v42 = v29;
    id v30 = (id)[v28 addFailureBlock:v41];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke_40;
    v39[3] = &unk_1E6A08B30;
    v39[4] = v13;
    id v31 = v29;
    id v8 = v26;
    id v9 = v25;
    id v19 = v38;
    id v40 = v31;
    id v32 = (id)[v28 addSuccessBlock:v39];
  }
  else
  {
    v33 = (void *)MEMORY[0x1D9452090]();
    v34 = v13;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v45 = v36;
      __int16 v46 = 2112;
      id v47 = v19;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize trust zone invitation data, error: %@", buf, 0x16u);
    }
    uint64_t v37 = [(HMDCloudShareTrustManager *)v34 metricsEventDispatcher];
    [v37 submitFailureEventWithEventErrorCode:9 error:v19];

    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v19);
  }
}

void __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    char v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Trust zone invitation was not accepted: %@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) metricsEventDispatcher];
  [v8 submitFailureEventWithEventErrorCode:11 error:v3];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Trust zone invitation was accepted", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) _configure];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    char v16 = [v9 shortDescription];
    v17 = [v10 shortDescription];
    int v19 = 138543874;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    int64_t v22 = v16;
    __int16 v23 = 2112;
    unint64_t v24 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Received invitation request from user %@ and device %@", (uint8_t *)&v19, 0x20u);
  }
  int v18 = [(HMDCloudShareTrustManager *)v13 cloudShareParticipantsManager];
  [v18 inviteUser:v9 usingDevice:v10];
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trust zone updated unknown model: %@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [(HMDCloudShareTrustManager *)v9 metricsEventDispatcher];
  [v12 submitFailureEventWithEventErrorCode:8];

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trust zone deleted unknown model: %@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [(HMDCloudShareTrustManager *)v9 metricsEventDispatcher];
  [v12 submitFailureEventWithEventErrorCode:7];

  return 0;
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trust zone created unknown model: %@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [(HMDCloudShareTrustManager *)v9 metricsEventDispatcher];
  [v12 submitFailureEventWithEventErrorCode:6];

  return 0;
}

- (void)cloudZone:(id)a3 didRemoveParticipantWithClientIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust zone removed participant with client identifier: %@", (uint8_t *)&v13, 0x16u);
  }
  id v12 = [(HMDCloudShareTrustManager *)v9 delegate];
  [v12 cloudShareTrustManager:v9 didRemoveUserWithUUID:v7];
}

- (void)cloudZone:(id)a3 didUpdateParticipantWithClientIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v23 = v11;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust zone updated participant with client identifier: %@", buf, 0x16u);
  }
  id v12 = [(HMDCloudShareTrustManager *)v9 dataSource];
  int v13 = [v12 homeForCloudShareTrustManager:v9];

  int v14 = [v13 userWithUUID:v7];
  if (v14)
  {
    __int16 v15 = [(HMDCloudShareTrustManager *)v9 queue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__HMDCloudShareTrustManager_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke;
    v20[3] = &unk_1E6A197C8;
    v20[4] = v9;
    id v21 = v14;
    dispatch_async(v15, v20);
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = v9;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v19;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find user with UUID matching updated participant client identifier: %@", buf, 0x16u);
    }
  }
}

uint64_t __80__HMDCloudShareTrustManager_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCloudShareIDForUser:*(void *)(a1 + 40)];
}

- (void)setConfigureState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_configureState == 3)
  {
    os_unfair_lock_unlock(p_lock);
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = HMDCloudShareTrustManagerConfigureStateAsString(a3);
      int v12 = 138543618;
      int v13 = v9;
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cannot change from removed state to: %@", (uint8_t *)&v12, 0x16u);
    }
    __int16 v11 = [(HMDCloudShareTrustManager *)v7 metricsEventDispatcher];
    [v11 submitFailureEventWithEventErrorCode:5];
  }
  else
  {
    self->_configureState = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (int64_t)configureState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t configureState = self->_configureState;
  os_unfair_lock_unlock(p_lock);
  return configureState;
}

- (void)_homeDidBecomeTrustZoneCapable:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Owner is now capable of establishing trust zones", (uint8_t *)&v15, 0xCu);
  }
  id v10 = [(HMDCloudShareTrustManager *)v7 requestInviteTimer];

  if (v10)
  {
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = v7;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping reconfigure since a request invite timer exists", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    [(HMDCloudShareTrustManager *)v7 _configure];
  }
}

- (void)homeDidBecomeTrustZoneCapable:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudShareTrustManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDCloudShareTrustManager_homeDidBecomeTrustZoneCapable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __59__HMDCloudShareTrustManager_homeDidBecomeTrustZoneCapable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _homeDidBecomeTrustZoneCapable:*(void *)(a1 + 40)];
}

- (void)sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  __int16 v11 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v40 = 0;
  int v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v40];
  id v13 = v40;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke;
    aBlock[3] = &unk_1E6A0F9D0;
    aBlock[4] = self;
    unint64_t v14 = (unint64_t)v9;
    id v39 = (id)v14;
    int v15 = _Block_copy(aBlock);
    if (!(v14 | v10)) {
      _HMFPreconditionFailure();
    }
    uint64_t v16 = v15;
    if (v14)
    {
      id v35 = v9;
      id v36 = v13;
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        id v21 = [(id)v14 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v42 = v20;
        __int16 v43 = 2112;
        id v44 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending trust zone invitation to user: %@", buf, 0x16u);
      }
      int64_t v22 = [(HMDCloudShareTrustManager *)v18 cloudShareMessenger];
      __int16 v23 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.0"];
      __int16 v24 = [MEMORY[0x1E4F1CAD0] set];
      [v22 sendShareInvitationData:v12 toUser:v14 minimumHomeKitVersion:v23 requiredSupportedFeatures:v24 completion:v16];

      id v9 = v35;
      id v13 = v36;
    }
    else
    {
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = self;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = id v37 = v13;
        v34 = [(id)v10 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v42 = v33;
        __int16 v43 = 2112;
        id v44 = v34;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Sending trust zone invitation to device: %@", buf, 0x16u);

        id v13 = v37;
      }

      int64_t v22 = [(HMDCloudShareTrustManager *)v31 cloudShareMessenger];
      [v22 sendShareInvitationData:v12 toDevice:v10 completion:v16];
    }

    goto LABEL_15;
  }
  id v25 = (void *)MEMORY[0x1D9452090]();
  uint64_t v26 = self;
  unint64_t v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    unint64_t v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v42 = v28;
    __int16 v43 = 2112;
    id v44 = v13;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize trust zone invitation: %@", buf, 0x16u);
  }
  id v29 = [(HMDCloudShareTrustManager *)v26 metricsEventDispatcher];
  [v29 submitFailureEventWithEventErrorCode:10 error:v13];

LABEL_16:
}

void __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      __int16 v11 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)buf = 138543618;
      v33 = v10;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Trust zone invitation was accepted by user with id: %@", buf, 0x16u);
    }
    int v12 = [*(id *)(a1 + 40) cloudShareID];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = *(id *)(a1 + 32);
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        uint64_t v17 = [*(id *)(a1 + 40) uuid];
        *(_DWORD *)buf = 138543618;
        v33 = v16;
        __int16 v34 = 2112;
        id v35 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@User already has cloud share ID. Skip cloud pull. user id: %@", buf, 0x16u);
      }
    }
    else
    {
      id v21 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Fetch due to new participant"];
      int64_t v22 = [*(id *)(a1 + 32) cloudZone];
      __int16 v23 = [v22 performCloudPullWithOptions:v21];
      __int16 v24 = (void *)MEMORY[0x1E4F7A0F0];
      id v25 = [*(id *)(a1 + 32) queue];
      uint64_t v26 = [v24 schedulerWithDispatchQueue:v25];
      unint64_t v27 = [v23 reschedule:v26];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_29;
      v31[3] = &unk_1E6A197F0;
      v31[4] = *(void *)(a1 + 32);
      id v28 = (id)[v27 addFailureBlock:v31];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_30;
      v30[3] = &unk_1E6A19708;
      v30[4] = *(void *)(a1 + 32);
      id v29 = (id)[v27 addSuccessBlock:v30];
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Trust zone invitation was not accepted by user with id: %@ error: %@", buf, 0x20u);
    }
    uint64_t v20 = [*(id *)(a1 + 32) metricsEventDispatcher];
    [v20 submitFailureEventWithEventErrorCode:11 error:v5];
  }
}

void __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    unint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cloud pull fail with error:%@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) metricsEventDispatcher];
  [v8 submitFailureEventWithEventErrorCode:12 error:v3];
}

void __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud pull was successful", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) updateCloudShareIDForAllUsers];
}

- (void)discoverUntrustedUsers
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self dataSource];
  id v37 = self;
  id v4 = [v3 homeForCloudShareTrustManager:self];

  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = [v4 users];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v12 = [v11 cloudShareID];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          char v14 = [v11 isOwner];

          if ((v14 & 1) == 0) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v8);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  int v15 = [(HMDCloudShareTrustManager *)v37 cloudZone];
  uint64_t v16 = [v15 participants];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v42 + 1) + 8 * j) clientIdentifier];
        int64_t v22 = [v4 userWithUUID:v21];

        if (v22) {
          [v5 removeObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v18);
  }
  __int16 v36 = v4;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        id v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = v37;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          id v32 = HMFGetLogIdentifier();
          v33 = [v28 uuid];
          *(_DWORD *)buf = 138543618;
          v51 = v32;
          __int16 v52 = 2112;
          v53 = v33;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Discovered untrusted user with id: %@", buf, 0x16u);
        }
        __int16 v34 = [(HMDCloudShareTrustManager *)v30 delegate];
        id v35 = [v28 uuid];
        [v34 cloudShareTrustManager:v30 didRemoveUserWithUUID:v35];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v25);
  }
}

- (void)updateCloudShareIDForUser:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (([v4 isOwner] & 1) == 0)
  {
    id v6 = [v4 cloudShareID];

    if (!v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      uint64_t v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        __int16 v11 = [v4 shortDescription];
        *(_DWORD *)buf = 138543618;
        unint64_t v27 = v10;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud share ID for shared user: %@", buf, 0x16u);
      }
      uint64_t v12 = [(HMDCloudShareTrustManager *)v8 cloudZone];
      uint64_t v13 = [v4 uuid];
      char v14 = [v12 fetchCloudShareIDForShareParticipantClientIdentifier:v13];
      int v15 = (void *)MEMORY[0x1E4F7A0F0];
      uint64_t v16 = [(HMDCloudShareTrustManager *)v8 queue];
      uint64_t v17 = [v15 schedulerWithDispatchQueue:v16];
      uint64_t v18 = [v14 reschedule:v17];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke;
      v24[3] = &unk_1E6A196E0;
      v24[4] = v8;
      id v19 = v4;
      id v25 = v19;
      id v20 = (id)[v18 addFailureBlock:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke_22;
      v22[3] = &unk_1E6A08B08;
      v22[4] = v8;
      id v23 = v19;
      id v21 = (id)[v18 addSuccessBlock:v22];
    }
  }
}

void __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [*(id *)(a1 + 40) shortDescription];
    int v10 = 138543874;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud share ID for %@: %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = [*(id *)(a1 + 32) metricsEventDispatcher];
  [v9 submitFailureEventWithEventErrorCode:4 error:v3];
}

void __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [*(id *)(a1 + 40) shortDescription];
    int v9 = 138543874;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Received cloud share ID for %@: %@", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 40) updateCloudShareID:v3];
}

- (void)updateCloudShareIDForAllUsers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareTrustManager *)self dataSource];
  id v5 = [v4 homeForCloudShareTrustManager:self];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = objc_msgSend(v5, "users", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HMDCloudShareTrustManager *)self updateCloudShareIDForUser:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)updateCurrentUserCloudShareID
{
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareTrustManager *)self cloudZone];
  id v5 = [v4 fetchCurrentParticipantCloudShareID];
  id v6 = (void *)MEMORY[0x1E4F7A0F0];
  uint64_t v7 = [(HMDCloudShareTrustManager *)self queue];
  uint64_t v8 = [v6 schedulerWithDispatchQueue:v7];
  uint64_t v9 = [v5 reschedule:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke;
  v13[3] = &unk_1E6A197F0;
  v13[4] = self;
  id v10 = (id)[v9 addFailureBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke_21;
  v12[3] = &unk_1E6A08AE0;
  v12[4] = self;
  id v11 = (id)[v9 addSuccessBlock:v12];
}

void __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch cloud share id for current user, error: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setConfigureState:0];
  [*(id *)(a1 + 32) setLocalZone:0];
  [*(id *)(a1 + 32) setCloudZone:0];
  uint64_t v8 = [*(id *)(a1 + 32) metricsEventDispatcher];
  [v8 submitFailureEventWithEventErrorCode:4 error:v3];
}

void __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 homeForCloudShareTrustManager:*(void *)(a1 + 32)];

  id v6 = [v5 currentUser];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received current user cloud share id: %@", (uint8_t *)&v11, 0x16u);
  }
  [v6 updateCloudShareID:v3];
}

- (void)removeTrust
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCloudShareTrustManager *)self configureState] == 3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      id v8 = HMDCloudShareTrustManagerConfigureStateAsString([(HMDCloudShareTrustManager *)v5 configureState]);
      *(_DWORD *)buf = 138543618;
      id v31 = v7;
      __int16 v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping remove trust due to configure state: %@", buf, 0x16u);
    }
  }
  else
  {
    [(HMDCloudShareTrustManager *)self setConfigureState:3];
    int v9 = [(HMDCloudShareTrustManager *)self cloudShareMessenger];
    [v9 unconfigure];

    id v10 = [(HMDCloudShareTrustManager *)self dataSource];
    int v11 = [v10 zoneNameForCloudShareTrustManager:self];

    BOOL v12 = [(HMDCloudShareTrustManager *)self isOwnedTrust];
    __int16 v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v16)
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing owned cloud share trust", buf, 0xCu);
      }
      uint64_t v18 = [(HMDCloudShareTrustManager *)v14 database];
      uint64_t v19 = [v18 removePrivateZonesWithName:v11];
    }
    else
    {
      if (v16)
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v20;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing shared cloud share trust", buf, 0xCu);
      }
      uint64_t v18 = [(HMDCloudShareTrustManager *)v14 database];
      uint64_t v19 = [v18 removeSharedZonesWithName:v11];
    }
    id v21 = (void *)v19;
    int64_t v22 = (void *)MEMORY[0x1E4F7A0F0];
    id v23 = [(HMDCloudShareTrustManager *)v14 queue];
    uint64_t v24 = [v22 schedulerWithDispatchQueue:v23];
    id v25 = [v21 reschedule:v24];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __40__HMDCloudShareTrustManager_removeTrust__block_invoke;
    v29[3] = &unk_1E6A197F0;
    v29[4] = v14;
    id v26 = (id)[v25 addFailureBlock:v29];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__HMDCloudShareTrustManager_removeTrust__block_invoke_19;
    v28[3] = &unk_1E6A19708;
    v28[4] = v14;
    id v27 = (id)[v25 addSuccessBlock:v28];
  }
}

void __40__HMDCloudShareTrustManager_removeTrust__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed cloud share trust removal, error: %@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) metricsEventDispatcher];
  [v8 submitFailureEventWithEventErrorCode:3 error:v3];
}

void __40__HMDCloudShareTrustManager_removeTrust__block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud share trust has been removed", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) setCloudZone:0];
  [*(id *)(a1 + 32) setLocalZone:0];
  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 didRemoveTrustZoneInCloudShareTrustManager:*(void *)(a1 + 32)];
}

- (BOOL)isTrustConfigured
{
  return [(HMDCloudShareTrustManager *)self configureState] == 2;
}

- (void)_finishConfigure
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  [(HMDCloudShareTrustManager *)self setConfigureState:2];
  id v4 = [(HMDCloudShareTrustManager *)self delegate];
  [v4 didFinishConfiguringForCloudShareTrustManager:self];

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Trust manager finished configuring", (uint8_t *)&v9, 0xCu);
  }
  if ([(HMDCloudShareTrustManager *)v6 isOwnedTrust])
  {
    [(HMDCloudShareTrustManager *)v6 updateCloudShareIDForAllUsers];
    [(HMDCloudShareTrustManager *)v6 discoverUntrustedUsers];
  }
  else
  {
    [(HMDCloudShareTrustManager *)v6 updateCurrentUserCloudShareID];
  }
}

- (void)_configureOwnerCloudShareIDWithCloudZone:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching trust owner cloud share id", buf, 0xCu);
  }
  id v10 = [v4 fetchOwnerParticipantCloudShareID];
  uint64_t v11 = (void *)MEMORY[0x1E4F7A0F0];
  id v12 = [(HMDCloudShareTrustManager *)v7 queue];
  uint64_t v13 = [v11 schedulerWithDispatchQueue:v12];
  id v14 = [v10 reschedule:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke;
  v18[3] = &unk_1E6A197F0;
  v18[4] = v7;
  id v15 = (id)[v14 addFailureBlock:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke_17;
  v17[3] = &unk_1E6A08AE0;
  v17[4] = v7;
  id v16 = (id)[v14 addSuccessBlock:v17];
}

void __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not read owner cloud share id in trust zone, error: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setConfigureState:0];
  [*(id *)(a1 + 32) setCloudShareParticipantsManager:0];
  [*(id *)(a1 + 32) setLocalZone:0];
  [*(id *)(a1 + 32) setCloudZone:0];
  id v8 = [*(id *)(a1 + 32) metricsEventDispatcher];
  [v8 submitFailureEventWithEventErrorCode:4 error:v3];
}

void __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 cloudShareTrustManager:*(void *)(a1 + 32) didFetchOwnerCloudShareID:v3];

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Read trust zone owner cloud share ID: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setOwnerCloudShareID:v3];
  [*(id *)(a1 + 32) _finishConfigure];
}

- (void)_configureWithFetchZoneResult:(id)a3 error:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long v38 = 138543362;
      *(void *)&v38[4] = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Did fetch trust cloud zone", v38, 0xCu);
    }
    id v14 = [v6 cloudZone];
    [(HMDCloudShareTrustManager *)v10 setCloudZone:v14];

    if ([(HMDCloudShareTrustManager *)v10 isOwnedTrust])
    {
      id v15 = [(HMDCloudShareTrustManager *)v10 cloudZone];
      id v16 = (id)[v15 registerSubscriptionForExternalRecordType:0];
    }
    uint64_t v17 = [v6 localZone];
    [(HMDCloudShareTrustManager *)v10 setLocalZone:v17];

    uint64_t v18 = [(HMDCloudShareTrustManager *)v10 localZone];
    [v18 startUp];

    if ([(HMDCloudShareTrustManager *)v10 isOwnedTrust])
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v10;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)long long v38 = 138543362;
        *(void *)&v38[4] = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting participant manager to share trust zone", v38, 0xCu);
      }
      id v23 = [(HMDCloudShareTrustManager *)v20 dataSource];
      uint64_t v24 = [v23 homeForCloudShareTrustManager:v20];

      id v25 = [(HMDCloudShareTrustManager *)v20 participantsManagerFactory];
      id v26 = [(HMDCloudShareTrustManager *)v20 queue];
      id v27 = [v6 cloudZone];
      __int16 v28 = ((void (**)(void, void *, void *, void *))v25)[2](v25, v26, v27, v24);
      [(HMDCloudShareTrustManager *)v20 setCloudShareParticipantsManager:v28];

      id v29 = [(HMDCloudShareTrustManager *)v20 cloudShareParticipantsManager];
      [v29 setDataSource:v20];

      uint64_t v30 = [(HMDCloudShareTrustManager *)v20 cloudShareParticipantsManager];
      [v30 setDelegate:v20];

      id v31 = [(HMDCloudShareTrustManager *)v20 cloudShareParticipantsManager];
      [v31 configure];

      __int16 v32 = [(HMDCloudShareTrustManager *)v20 cloudShareParticipantsManager];
      [v32 updateShareParticipants];
    }
    v33 = [v6 cloudZone];
    [(HMDCloudShareTrustManager *)v10 _configureOwnerCloudShareIDWithCloudZone:v33];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      BOOL v35 = [(HMDCloudShareTrustManager *)v10 isOwnedTrust];
      __int16 v36 = @"Shared Zone";
      *(_DWORD *)long long v38 = 138543874;
      *(void *)&v38[4] = v34;
      *(_WORD *)&v38[12] = 2112;
      if (v35) {
        __int16 v36 = @"Owned Zone";
      }
      *(void *)&v38[14] = v36;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to open trust zone: %@, error: %@", v38, 0x20u);
    }
    [(HMDCloudShareTrustManager *)v10 setConfigureState:0];
    v33 = [(HMDCloudShareTrustManager *)v10 metricsEventDispatcher];
    if ([(HMDCloudShareTrustManager *)v10 isOwnedTrust]) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = 2;
    }
    objc_msgSend(v33, "submitFailureEventWithEventErrorCode:error:", v37, v7, *(_OWORD *)v38);
  }
}

- (void)_requestShareInvitationForSharedZone
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareTrustManager *)self dataSource];
  if ([v4 isOwnerCapableForTrustManager:self])
  {
    id v5 = [(HMDCloudShareTrustManager *)self ownerCloudShareID];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = HMFGetLogIdentifier();
        int v21 = 138543362;
        int64_t v22 = v9;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@We have a cloud share ID for the owner, but we aren't invited to the share", (uint8_t *)&v21, 0xCu);
      }
    }
    [(HMDCloudShareTrustManager *)self _startRequestInviteTimer];
    id v10 = [v4 ownerForCloudShareTrustManager:self];
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [v10 uuid];
      int v21 = 138543618;
      int64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Requesting trust zone share invitation from trust owner with id: %@", (uint8_t *)&v21, 0x16u);
    }
    id v16 = [(HMDCloudShareTrustManager *)v12 cloudShareMessenger];
    [v16 requestShareInvitationDataFromUser:v10];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      int64_t v22 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping request for trust invitation due to owner being incapable of setting up trust", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)_configureWithSharedZone
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareTrustManager *)self database];
  id v5 = (id)[v4 registerSharedSubscriptionForExternalRecordType:0];

  id v6 = [(HMDCloudShareTrustManager *)self database];
  id v7 = [(HMDCloudShareTrustManager *)self dataSource];
  id v8 = [v7 zoneNameForCloudShareTrustManager:self];
  int v9 = [v6 existingSharedZoneIDWithName:v8];

  id v10 = (void *)MEMORY[0x1D9452090]();
  __int16 v11 = self;
  id v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Got zoneID for shared trust zone: %@", buf, 0x16u);
    }
    id v15 = [(HMDCloudShareTrustManager *)v11 database];
    id v16 = objc_alloc_init(MEMORY[0x1E4F69E50]);
    id v20 = 0;
    uint64_t v17 = [v15 sharedZonesWithID:v9 configuration:v16 delegate:v11 error:&v20];
    id v18 = v20;

    [(HMDCloudShareTrustManager *)v11 _configureWithFetchZoneResult:v17 error:v18];
  }
  else
  {
    if (v13)
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int64_t v22 = v19;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@No shared trust zone exists yet", buf, 0xCu);
    }
    [(HMDCloudShareTrustManager *)v11 _requestShareInvitationForSharedZone];
    [(HMDCloudShareTrustManager *)v11 setConfigureState:0];
  }
}

- (void)_configureWithOwnedZone
{
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x1E4F69ED0]);
  [v4 setShouldRebuildOnManateeKeyLoss:1];
  id v5 = [(HMDCloudShareTrustManager *)self database];
  id v6 = [(HMDCloudShareTrustManager *)self dataSource];
  id v7 = [v6 zoneNameForCloudShareTrustManager:self];
  id v10 = 0;
  id v8 = [v5 privateZonesWithName:v7 configuration:v4 delegate:self error:&v10];
  id v9 = v10;

  [(HMDCloudShareTrustManager *)self _configureWithFetchZoneResult:v8 error:v9];
}

- (void)_configure
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCloudShareTrustManager *)self configureState])
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = HMDCloudShareTrustManagerConfigureStateAsString([(HMDCloudShareTrustManager *)v5 configureState]);
      int v17 = 138543618;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping cloud share trust configure. Trust already in configure state: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    [(HMDCloudShareTrustManager *)self setConfigureState:1];
    id v9 = [(HMDCloudShareTrustManager *)self cloudShareMessenger];
    [v9 configure];

    BOOL v10 = [(HMDCloudShareTrustManager *)self isOwnedTrust];
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v14)
      {
        id v15 = HMFGetLogIdentifier();
        int v17 = 138543362;
        id v18 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring cloud share trust with owned trust", (uint8_t *)&v17, 0xCu);
      }
      [(HMDCloudShareTrustManager *)v12 _configureWithOwnedZone];
    }
    else
    {
      if (v14)
      {
        id v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        id v18 = v16;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring cloud share trust with shared trust", (uint8_t *)&v17, 0xCu);
      }
      [(HMDCloudShareTrustManager *)v12 _configureWithSharedZone];
    }
  }
}

- (void)configure
{
  id v3 = [(HMDCloudShareTrustManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v6 = [(HMDCloudShareTrustManager *)self dataSource];
  id v4 = [v6 homeForCloudShareTrustManager:self];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_homeDidBecomeTrustZoneCapable_ name:@"HMDHomeOwnerBecameTrustZoneCapableNotification" object:v4];

  [(HMDCloudShareTrustManager *)self _configure];
}

- (HMDCloudShareTrustManager)initWithDatabase:(id)a3 isOwnedTrust:(BOOL)a4 queue:(id)a5 shareMessenger:(id)a6 ownerCloudShareID:(id)a7 logEventSubmitter:(id)a8 dailyScheduler:(id)a9
{
  id v30 = a3;
  id v29 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)HMDCloudShareTrustManager;
  id v20 = [(HMDCloudShareTrustManager *)&v31 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_queue, a5);
    v21->_ownedTrust = a4;
    objc_storeStrong((id *)&v21->_ownerCloudShareID, a7);
    objc_storeStrong((id *)&v21->_database, a3);
    -[HMDDatabase addDelegate:](v21->_database, "addDelegate:", v21, v29, v30);
    v21->_int64_t configureState = 0;
    objc_storeStrong((id *)&v21->_cloudShareMessenger, a6);
    [(HMDCloudShareMessenger *)v21->_cloudShareMessenger setDelegate:v21];
    id participantsManagerFactory = v21->_participantsManagerFactory;
    v21->_id participantsManagerFactory = &__block_literal_global_25923;

    id requestInviteTimerFactory = v21->_requestInviteTimerFactory;
    v21->_id requestInviteTimerFactory = &__block_literal_global_3_25924;

    if (v18 && v19)
    {
      uint64_t v24 = [HMDCloudShareTrustManagerMetricsEventDispatcher alloc];
      uint64_t v25 = [v16 messageTargetUUID];
      uint64_t v26 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)v24 initWithIdentifier:v25 logEventSubmitter:v18 dailyScheduler:v19 dataSource:v21];
      metricsEventDispatcher = v21->_metricsEventDispatcher;
      v21->_metricsEventDispatcher = (HMDCloudShareTrustManagerMetricsEventDispatcher *)v26;
    }
    [(HMDCloudShareTrustManagerMetricsEventDispatcher *)v21->_metricsEventDispatcher registerForDailyTrustManagerEvents];
  }

  return v21;
}

id __131__HMDCloudShareTrustManager_initWithDatabase_isOwnedTrust_queue_shareMessenger_ownerCloudShareID_logEventSubmitter_dailyScheduler___block_invoke_2(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65428]) initWithMinimumTimeInterval:a4 maximumTimeInterval:0 exponentialFactor:a1 options:a2];
  return v4;
}

HMDCloudShareParticipantsManager *__131__HMDCloudShareTrustManager_initWithDatabase_isOwnedTrust_queue_shareMessenger_ownerCloudShareID_logEventSubmitter_dailyScheduler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  id v9 = [[HMDCloudShareParticipantsManager alloc] initWithQueue:v8 cloudZone:v7 home:v6];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t54 != -1) {
    dispatch_once(&logCategory__hmf_once_t54, &__block_literal_global_44);
  }
  v2 = (void *)logCategory__hmf_once_v55;
  return v2;
}

uint64_t __40__HMDCloudShareTrustManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v55;
  logCategory__hmf_once_v55 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
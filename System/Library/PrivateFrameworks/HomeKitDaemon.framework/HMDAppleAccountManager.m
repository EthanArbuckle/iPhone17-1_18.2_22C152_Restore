@interface HMDAppleAccountManager
+ (HMDAppleAccountManager)sharedManager;
+ (id)logCategory;
- (ACAccountStore)accountStore;
- (BOOL)didProcessAccountSignOut;
- (BOOL)isCurrentDeviceDataOwnerForDevice:(id)a3;
- (BOOL)isLoggedInToPrimaryAccount;
- (BOOL)isModelCurrentAccount:(id)a3;
- (BOOL)isMonitoring;
- (BOOL)isRapportIdentitiesChangedNotificationTokenValid;
- (BOOL)isServiceActive;
- (BOOL)shouldAccount:(id)a3 pushbackModel:(id)a4 actions:(id)a5;
- (BOOL)shouldCacheAccount:(id)a3;
- (BOOL)shouldDevice:(id)a3 processModel:(id)a4 actions:(id)a5;
- (BOOL)shouldSyncAccount:(id)a3;
- (BOOL)shouldSyncDevice:(id)a3;
- (HMDAPSConnection)pushConnection;
- (HMDAccount)account;
- (HMDAccount)lastSignedOutAccount;
- (HMDAccountChangeObserver)accountChangeObserver;
- (HMDAccountRegistry)accountRegistry;
- (HMDAppleAccountContext)accountContext;
- (HMDAppleAccountManager)init;
- (HMDAppleAccountManager)initWithIDSService:(id)a3 activityBroadcaster:(id)a4;
- (HMDAppleAccountManager)initWithIDSService:(id)a3 activityBroadcaster:(id)a4 dataSource:(id)a5;
- (HMDAppleAccountSettings)settings;
- (HMDBackingStore)backingStore;
- (HMDCloudCache)cloudCache;
- (HMDDevice)device;
- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster;
- (HMDIDSService)service;
- (HMFExponentialBackoffTimer)accountChangeBackoffTimer;
- (HMFFuture)currentDeviceSettled;
- (HMFFuture)deviceAccountSettled;
- (HMFFuture)idsDevicesUpdated;
- (HMFPromise)currentDeviceSettledPromise;
- (HMFPromise)deviceAccountSettledPromise;
- (HMFPromise)idsDevicesUpdatedPromise;
- (HMFTimer)devicesChangeBackoffTimer;
- (NSData)pendingPushToken;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)idsDeviceForIDSIdentifier:(id)a3;
- (id)primaryHandleForAccount:(id)a3;
- (int)rapportIdentitiesChangedNotificationToken;
- (int64_t)IDSAccountRegistrationError;
- (int64_t)IDSAccountRegistrationStatus;
- (void)__deviceAddedToCurrentAccount:(id)a3;
- (void)__deviceRemovedFromCurrentAccount:(id)a3;
- (void)__handleMigrationUpdated:(id)a3;
- (void)__handleModifiedAccount:(id)a3;
- (void)__handleRemovedAccountMessage:(id)a3;
- (void)__handleRemovedAccountWithCompletion:(id)a3;
- (void)__handleUpdatedName:(id)a3;
- (void)__localDataReset:(id)a3;
- (void)__updateMergeIDOnAccount;
- (void)_deregisterForRapportNotifications;
- (void)_registerForRapportNotifications;
- (void)_updatePushToken:(id)a3;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)account:(id)a3 isActiveChanged:(BOOL)a4;
- (void)accountChangeObserver:(id)a3 observedDeletedAccount:(id)a4;
- (void)configureWithAccountRegistry:(id)a3;
- (void)configureWithBackingStore:(id)a3;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)processAccountModel:(id)a3 message:(id)a4;
- (void)processAccountModelRemove:(id)a3 message:(id)a4;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setAccountRegistry:(id)a3;
- (void)setCloudCache:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setPendingPushToken:(id)a3;
- (void)setRapportIdentitiesChangedNotificationToken:(int)a3;
- (void)setRapportIdentitiesChangedNotificationTokenValid:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
- (void)updateSenderCorrelationIdentifier:(id)a3;
@end

@implementation HMDAppleAccountManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDevicesUpdated, 0);
  objc_storeStrong((id *)&self->_currentDeviceSettled, 0);
  objc_storeStrong((id *)&self->_deviceAccountSettled, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_idsDevicesUpdatedPromise, 0);
  objc_storeStrong((id *)&self->_currentDeviceSettledPromise, 0);
  objc_storeStrong((id *)&self->_deviceAccountSettledPromise, 0);
  objc_storeStrong((id *)&self->_activityBroadcaster, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingPushToken, 0);
  objc_storeStrong((id *)&self->_devicesChangeBackoffTimer, 0);
  objc_storeStrong((id *)&self->_accountChangeBackoffTimer, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_lastSignedOutAccount, 0);
  objc_storeStrong((id *)&self->_accountContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMFFuture)idsDevicesUpdated
{
  return self->_idsDevicesUpdated;
}

- (HMFFuture)currentDeviceSettled
{
  return self->_currentDeviceSettled;
}

- (HMFFuture)deviceAccountSettled
{
  return self->_deviceAccountSettled;
}

- (void)setCloudCache:(id)a3
{
}

- (HMDCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (HMFPromise)idsDevicesUpdatedPromise
{
  return self->_idsDevicesUpdatedPromise;
}

- (HMFPromise)currentDeviceSettledPromise
{
  return self->_currentDeviceSettledPromise;
}

- (HMFPromise)deviceAccountSettledPromise
{
  return self->_deviceAccountSettledPromise;
}

- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster
{
  return self->_activityBroadcaster;
}

- (HMDIDSService)service
{
  return self->_service;
}

- (void)setPendingPushToken:(id)a3
{
}

- (NSData)pendingPushToken
{
  return self->_pendingPushToken;
}

- (void)setRapportIdentitiesChangedNotificationTokenValid:(BOOL)a3
{
  self->_rapportIdentitiesChangedNotificationTokenValid = a3;
}

- (BOOL)isRapportIdentitiesChangedNotificationTokenValid
{
  return self->_rapportIdentitiesChangedNotificationTokenValid;
}

- (void)setRapportIdentitiesChangedNotificationToken:(int)a3
{
  self->_rapportIdentitiesChangedNotificationToken = a3;
}

- (int)rapportIdentitiesChangedNotificationToken
{
  return self->_rapportIdentitiesChangedNotificationToken;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (HMFTimer)devicesChangeBackoffTimer
{
  return self->_devicesChangeBackoffTimer;
}

- (HMFExponentialBackoffTimer)accountChangeBackoffTimer
{
  return self->_accountChangeBackoffTimer;
}

- (HMDAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDAPSConnection)pushConnection
{
  return self->_pushConnection;
}

- (HMDAccount)lastSignedOutAccount
{
  return self->_lastSignedOutAccount;
}

- (BOOL)didProcessAccountSignOut
{
  return self->_didProcessAccountSignOut;
}

- (BOOL)isLoggedInToPrimaryAccount
{
  return self->_loggedIn;
}

- (void)accountChangeObserver:(id)a3 observedDeletedAccount:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification of removed account %@", buf, 0x16u);
  }
  queue = v9->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke;
  v14[3] = &unk_264A2F820;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(queue, v14);
}

void __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke_2;
  v2[3] = &unk_264A2F370;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "__handleRemovedAccountWithCompletion:", v2);
}

void __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Resolving current device settled promise due to sign out", (uint8_t *)&v14, 0xCu);
  }
  v8 = [*(id *)(a1 + 32) currentDeviceSettledPromise];
  [v8 fulfillWithNoValue];

  v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Completed handling of removed account %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAppleAccountManager *)self service];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification that devices changed on the current account", (uint8_t *)&v15, 0xCu);
    }
    int v14 = [(HMDAppleAccountManager *)v11 devicesChangeBackoffTimer];
    [v14 resume];
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAppleAccountManager *)self service];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification that the current account changed", buf, 0xCu);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v14 = objc_msgSend(v6, "accounts", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          [v19 addDelegate:v11 queue:v11->_queue];
          [v19 addRegistrationDelegate:v11 queue:v11->_queue];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [(HMDAppleAccountManager *)v11 accountChangeBackoffTimer];
    [v20 resume];

    v21 = [(HMDAppleAccountManager *)v11 accountChangeBackoffTimer];
    [v21 reset];
  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification that aliases changed", (uint8_t *)&v14, 0xCu);
  }
  v12 = [(HMDAppleAccountManager *)v9 accountChangeBackoffTimer];
  [v12 resume];

  uint64_t v13 = [(HMDAppleAccountManager *)v9 accountChangeBackoffTimer];
  [v13 reset];
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HMDAppleAccountManager *)self service];
  id v7 = [v6 accounts];
  int v8 = [v7 containsObject:v5];

  if (v8)
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that account is active changed", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v13 = [(HMDAppleAccountManager *)v10 accountChangeBackoffTimer];
    [v13 resume];

    int v14 = [(HMDAppleAccountManager *)v10 accountChangeBackoffTimer];
    [v14 reset];
  }
}

- (void)timerDidFire:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = [(HMDAppleAccountManager *)self accountChangeBackoffTimer];
  int v5 = [v8 isEqual:v4];

  if (v5)
  {
    __updateAccount(self, 1);
  }
  else
  {
    id v6 = [(HMDAppleAccountManager *)self devicesChangeBackoffTimer];
    int v7 = [v8 isEqual:v6];

    if (v7) {
      __updateDevices(self, 1);
    }
  }
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)[MEMORY[0x263F0E2B8] UUID];
}

- (void)_updatePushToken:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3)
  {
    int v5 = [(HMDAppleAccountManager *)self account];
    if (v5)
    {
      id v6 = v5;
      __updateCurrentDevice(self, v5);
      int v5 = v6;
    }
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [MEMORY[0x263F42610] defaultFormatter];
    uint64_t v13 = [v12 privateStringForObjectValue:v7];
    *(_DWORD *)buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received push token: %@", buf, 0x16u);
  }
  queue = v9->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__HMDAppleAccountManager_connection_didReceivePublicToken___block_invoke;
  v16[3] = &unk_264A2F820;
  v16[4] = v9;
  id v17 = v7;
  id v15 = v7;
  dispatch_async(queue, v16);
}

uint64_t __59__HMDAppleAccountManager_connection_didReceivePublicToken___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) isMonitoring];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  int v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that the push token changed", (uint8_t *)&v11, 0xCu);
    }
    return [*(id *)(a1 + 32) _updatePushToken:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      uint64_t v10 = [*(id *)(a1 + 40) length];
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@We got the push token before the apple account manager is started. Will process this token once it starts up. token length: %lu", (uint8_t *)&v11, 0x16u);
    }
    return [*(id *)(a1 + 32) setPendingPushToken:*(void *)(a1 + 40)];
  }
}

- (HMDAppleAccountSettings)settings
{
  return (HMDAppleAccountSettings *)+[HMDAppleAccountSettings sharedSettings];
}

- (void)processAccountModelRemove:(id)a3 message:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAppleAccountManager *)self account];

  if (!v8)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object model received", buf, 0xCu);
LABEL_9:
    }
LABEL_10:

    goto LABEL_11;
  }
  int v9 = [(HMDAppleAccountManager *)self account];
  uint64_t v10 = [v9 modelIdentifier];
  int v11 = [v6 uuid];
  char v12 = HMFEqualObjects();

  if ((v12 & 1) == 0)
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Account update does not match current account identifier", buf, 0xCu);
    }
    v30 = [[HMDAssertionLogEvent alloc] initWithReason:@"Account update does not match current account identifier"];
    v31 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v31 submitLogEvent:v30];
  }
  __int16 v13 = [v6 uuid];
  uint64_t v14 = [(HMDAppleAccountManager *)self account];
  uint64_t v15 = [v14 modelIdentifier];
  char v16 = objc_msgSend(v13, "hmf_isEqualToUUID:", v15);

  if ((v16 & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      v21 = [(HMDAppleAccountManager *)v18 account];
      uint64_t v22 = [v21 modelIdentifier];
      long long v23 = [v22 UUIDString];
      long long v24 = [v6 uuid];
      [v24 UUIDString];
      long long v25 = v32 = v17;
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      __int16 v35 = 2112;
      v36 = v23;
      __int16 v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Account update does not match current account identifier -- current identifier: %@, received identifier: %@", buf, 0x20u);

      id v17 = v32;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  __setAccount(self, 0, 1);
LABEL_11:
}

- (void)processAccountModel:(id)a3 message:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAppleAccountManager *)self account];

  if (v8)
  {
    int v9 = [(HMDAppleAccountManager *)self account];
    uint64_t v10 = [v9 modelIdentifier];
    int v11 = [v6 uuid];
    char v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      uint64_t v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v31;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Account update does not match current account identifier", buf, 0xCu);
      }
      v32 = [[HMDAssertionLogEvent alloc] initWithReason:@"Account update does not match current account identifier"];
      v33 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v33 submitLogEvent:v32];
    }
    __int16 v13 = [v6 uuid];
    uint64_t v14 = [(HMDAppleAccountManager *)self account];
    uint64_t v15 = [v14 modelIdentifier];
    char v16 = objc_msgSend(v13, "hmf_isEqualToUUID:", v15);

    if (v16)
    {
      id v17 = [(HMDAppleAccountManager *)self account];
      [v17 transactionObjectUpdated:0 newValues:v6 message:v7];
    }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      __int16 v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        long long v23 = [(HMDAppleAccountManager *)v20 account];
        long long v24 = [v23 modelIdentifier];
        long long v25 = [v24 UUIDString];
        v26 = [v6 uuid];
        [v26 UUIDString];
        v27 = v34 = v19;
        *(_DWORD *)buf = 138543874;
        v36 = v22;
        __int16 v37 = 2112;
        v38 = v25;
        __int16 v39 = 2112;
        v40 = v27;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Account update does not match current account identifier -- current identifier: %@, received identifier: %@", buf, 0x20u);

        id v19 = v34;
      }
    }
  }
  else
  {
    uint64_t v18 = [[HMDAccount alloc] initWithObjectModel:v6];
    if (v18) {
      __setAccount(self, v18, 1);
    }
  }
}

- (BOOL)isModelCurrentAccount:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDAppleAccountManager *)self accountContext];
  if (v5)
  {
    id v6 = +[HMDAccountIdentifier accountIdentifierForAppleAccountContext:v5];
    id v7 = [v4 identifier];

    if (v7)
    {
      id v8 = [v4 identifier];
      char v9 = HMFEqualObjects();
    }
    else
    {
      id v8 = [v6 identifier];
      uint64_t v10 = [v4 uuid];
      char v9 = HMFEqualObjects();
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)primaryHandleForAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(HMDAppleAccountManager *)self account];
    if ([v4 isEqual:v5])
    {
      id v6 = [(HMDAppleAccountManager *)self service];
      id v7 = objc_msgSend(v6, "hmd_preferredHandle");

      id v8 = [v4 handles];
      int v9 = [v8 containsObject:v7];

      if (v9) {
        id v10 = v7;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isCurrentDeviceDataOwnerForDevice:(id)a3
{
  return [a3 isCurrentDevice];
}

- (BOOL)shouldDevice:(id)a3 processModel:(id)a4 actions:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    objc_opt_class();
    int v11 = objc_opt_isKindOfClass() & 1;
    if (v11) {
      char v12 = v9;
    }
    else {
      char v12 = 0;
    }
    id v13 = v12;
    id v14 = v9;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      char v16 = v14;
    }
    else {
      char v16 = 0;
    }
    id v17 = v16;

    if (!v11 && (isKindOfClass & 1) == 0) {
      goto LABEL_25;
    }
    if ([v10 source] == 2 && objc_msgSend(v8, "isCurrentDevice"))
    {
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = v8;
      __int16 v20 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_24:

LABEL_25:
        BOOL v27 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v21 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v21;
      uint64_t v22 = "%{public}@The cloud updated our current device, dropping change.";
    }
    else
    {
      if ([v10 source]
        || [(HMDAppleAccountManager *)self isCurrentDeviceDataOwnerForDevice:v8]
        || ![v8 isCloudTracked])
      {
        BOOL v27 = 1;
        goto LABEL_27;
      }
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v28 = v8;
      __int16 v20 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      v21 = HMFGetLogIdentifier();
      int v30 = 138543362;
      v31 = v21;
      uint64_t v22 = "%{public}@This device is tracked by a cloud model, dropping change.";
    }
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v30, 0xCu);

    goto LABEL_24;
  }
  long long v23 = (void *)MEMORY[0x230FBD990]();
  long long v24 = self;
  long long v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    int v30 = 138543362;
    v31 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Manager cannot confirm account model process due to nil parameter.", (uint8_t *)&v30, 0xCu);
  }
  BOOL v27 = 0;
LABEL_28:

  return v27;
}

- (BOOL)shouldAccount:(id)a3 pushbackModel:(id)a4 actions:(id)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    if ([(HMDAppleAccountManager *)self shouldSyncAccount:v8])
    {
      id v11 = v9;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        id v13 = v11;
      }
      else {
        id v13 = 0;
      }
      id v52 = v13;

      id v14 = v11;
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();
      if (v15) {
        char v16 = v14;
      }
      else {
        char v16 = 0;
      }
      id v51 = v16;

      if (isKindOfClass)
      {
        id v17 = [(HMDAppleAccountManager *)self service];
        char v18 = objc_msgSend(v17, "hmd_isActive");

        if ((v18 & 1) == 0)
        {
          __int16 v37 = (void *)MEMORY[0x230FBD990]();
          v38 = self;
          __int16 v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v40 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v63 = v40;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Not pushing back account handles while inactive", buf, 0xCu);
          }
          goto LABEL_53;
        }
        if ([v10 source] != 2)
        {
LABEL_53:
          BOOL v30 = 0;
          goto LABEL_54;
        }
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = [v8 handles];
        id v19 = (id)[obj countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v19)
        {
          id v47 = v10;
          uint64_t v20 = *(void *)v58;
          while (2)
          {
            for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v58 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              long long v23 = objc_msgSend(v22, "modelIdentifier", v47);
              long long v24 = [v52 uuid];
              int v25 = objc_msgSend(v23, "hmf_isEqualToUUID:", v24);

              if (v25)
              {
                id v19 = v22;
                goto LABEL_41;
              }
            }
            id v19 = (id)[obj countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v19) {
              continue;
            }
            break;
          }
LABEL_41:
          id v10 = v47;
        }

        if ([v19 isLocallyTracked])
        {
          uint64_t v41 = (void *)MEMORY[0x230FBD990]();
          v42 = self;
          v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v63 = v44;
            __int16 v64 = 2112;
            id v65 = v19;
            v45 = "%{public}@This handle is locally tracked, pushing back -- accountHandle: %@";
LABEL_50:
            _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, v45, buf, 0x16u);

            goto LABEL_51;
          }
          goto LABEL_51;
        }
      }
      else
      {
        if ((v15 & 1) == 0 || [v10 source] != 2) {
          goto LABEL_53;
        }
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id obja = [v8 devices];
        id v19 = (id)[obja countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v19)
        {
          id v48 = v10;
          uint64_t v31 = *(void *)v54;
          while (2)
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v54 != v31) {
                objc_enumerationMutation(obja);
              }
              v33 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
              v34 = objc_msgSend(v33, "modelIdentifier", v48);
              __int16 v35 = [v51 uuid];
              int v36 = objc_msgSend(v34, "hmf_isEqualToUUID:", v35);

              if (v36)
              {
                id v19 = v33;
                goto LABEL_46;
              }
            }
            id v19 = (id)[obja countByEnumeratingWithState:&v53 objects:v61 count:16];
            if (v19) {
              continue;
            }
            break;
          }
LABEL_46:
          id v10 = v48;
        }

        if ([v19 isCurrentDevice])
        {
          uint64_t v41 = (void *)MEMORY[0x230FBD990]();
          v42 = self;
          v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v63 = v44;
            __int16 v64 = 2112;
            id v65 = v19;
            v45 = "%{public}@This is our current device, pushing back -- device: %@";
            goto LABEL_50;
          }
LABEL_51:

          BOOL v30 = 1;
LABEL_54:

          goto LABEL_55;
        }
      }

      goto LABEL_53;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    BOOL v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v63 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Manager cannot confirm account model process due to nil parameter.", buf, 0xCu);
    }
  }
  BOOL v30 = 0;
LABEL_55:

  return v30;
}

- (BOOL)shouldSyncDevice:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  BOOL v8 = v4
    && ([v4 account],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = [(HMDAppleAccountManager *)self shouldSyncAccount:v6],
        v6,
        v7)
    && [(HMDAppleAccountManager *)self isCurrentDeviceDataOwnerForDevice:v5];

  return v8;
}

- (BOOL)shouldSyncAccount:(id)a3
{
  id v4 = a3;
  BOOL v7 = 0;
  if (v4)
  {
    int v5 = [(HMDAppleAccountManager *)self account];
    char v6 = HMFEqualObjects();

    if (v6) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)shouldCacheAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAppleAccountManager *)self account];

  return v5 == v4;
}

- (id)idsDeviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAppleAccountManager *)self service];
  char v6 = [v5 devices];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__HMDAppleAccountManager_idsDeviceForIDSIdentifier___block_invoke;
  v10[3] = &unk_264A22518;
  id v11 = v4;
  id v7 = v4;
  BOOL v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __52__HMDAppleAccountManager_idsDeviceForIDSIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIDOverride];
  id v4 = [*(id *)(a1 + 32) UUIDString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (HMDDevice)device
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v2 = [(HMDAppleAccountManager *)self account];
  id v3 = [v2 devices];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isCurrentDevice])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (HMDDevice *)v4;
}

- (void)__deviceRemovedFromCurrentAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDAppleAccountManager___deviceRemovedFromCurrentAccount___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__HMDAppleAccountManager___deviceRemovedFromCurrentAccount___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int v6 = [v5 isCurrentDevice];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) device];

    if (!v7)
    {
      id v8 = *(void **)(a1 + 40);
      __handleUpdatedDevice_156371(v8, 0);
    }
  }
}

- (void)__deviceAddedToCurrentAccount:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDAppleAccountManager___deviceAddedToCurrentAccount___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__HMDAppleAccountManager___deviceAddedToCurrentAccount___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  int v6 = [v5 isCurrentDevice];
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v7 device];
    __handleUpdatedDevice_156371(v7, v8);
  }
}

- (int64_t)IDSAccountRegistrationError
{
  char v2 = [(HMDAppleAccountManager *)self service];
  int64_t v3 = objc_msgSend(v2, "hmd_registrationError");

  return v3;
}

- (int64_t)IDSAccountRegistrationStatus
{
  char v2 = [(HMDAppleAccountManager *)self service];
  int64_t v3 = objc_msgSend(v2, "hmd_registrationStatus");

  return v3;
}

- (BOOL)isServiceActive
{
  char v2 = [(HMDAppleAccountManager *)self service];
  char v3 = objc_msgSend(v2, "hmd_isActive");

  return v3;
}

- (void)updateSenderCorrelationIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAppleAccountManager *)self account];
  int v6 = v5;
  if (v5)
  {
    id v7 = [v5 senderCorrelationIdentifier];
    id v8 = v7;
    if (v7 && [v7 isEqual:v4])
    {
      long long v9 = (void *)MEMORY[0x230FBD990]();
      long long v10 = self;
      long long v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v24 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@MergeID is the same, not updating", buf, 0xCu);
      }
    }
    else
    {
      id v13 = (void *)MEMORY[0x230FBD990]([v6 setSenderCorrelationIdentifier:v4]);
      uint64_t v14 = self;
      char v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        char v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v24 = v16;
        __int16 v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updated mergeID for currentAccount : %@. Also going to ask IDS about the mergeID.", buf, 0x16u);
      }
      id v17 = [(HMDAppleAccountManager *)v14 messageReceiveQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__HMDAppleAccountManager_updateSenderCorrelationIdentifier___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = v14;
      dispatch_async(v17, block);
    }
  }
  else
  {
    char v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v24 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Current account went away, not updating", buf, 0xCu);
    }
  }
}

uint64_t __60__HMDAppleAccountManager_updateSenderCorrelationIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__updateMergeIDOnAccount");
}

- (void)__updateMergeIDOnAccount
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  char v3 = [(HMDAppleAccountManager *)self account];
  id v4 = [v3 handles];
  id v5 = [v4 firstObject];

  int v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      long long v10 = HMFGetLogIdentifier();
      long long v11 = [v3 shortDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Trying to update mergeID on currentAccount: %@", buf, 0x16u);
    }
    long long v12 = [v5 value];
    if ([v12 _appearsToBeEmail])
    {
      uint64_t v13 = MEMORY[0x230FBC250](v12);
    }
    else if ([v12 _appearsToBeBusinessID])
    {
      uint64_t v13 = MEMORY[0x230FBC230](v12);
    }
    else
    {
      uint64_t v13 = IDSCopyIDForPhoneNumber();
    }
    char v15 = (void *)v13;

    if (v15)
    {
      char v16 = [MEMORY[0x263F4A058] sharedInstance];
      uint64_t v29 = v15;
      id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
      char v18 = +[HMDIDSServiceManager sharedIDSServiceName];
      id v19 = [NSString stringGUID];
      queue = v7->_queue;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke;
      v26[3] = &unk_264A224F0;
      v26[4] = v7;
      id v27 = v15;
      id v28 = v3;
      [v16 currentRemoteDevicesForDestinations:v17 service:v18 listenerID:v19 queue:queue completionBlock:v26];
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v7;
      long long v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        long long v24 = HMFGetLogIdentifier();
        __int16 v25 = [v5 value];
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v24;
        __int16 v32 = 2112;
        v33 = v25;
        __int16 v34 = 2112;
        __int16 v35 = v5;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine destination with handle value: %@, account handle: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v14;
      __int16 v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Account is missing a handle so cannot update mergeID: %@", buf, 0x16u);
    }
  }
}

void __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_2;
  v5[3] = &unk_264A224C8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [a2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_3;
  v8[3] = &unk_264A224A0;
  id v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = a4;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
}

void __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 senderCorrelationIdentifier];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) account];
    [v8 setSenderCorrelationIdentifier:v7];

    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = [*(id *)(a1 + 48) identifier];
      int v20 = 138544130;
      v21 = v12;
      __int16 v22 = 2112;
      long long v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Found mergeID %@ for destination %@, new attribute %@", (uint8_t *)&v20, 0x2Au);
    }
    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
  else
  {
    char v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      char v18 = HMFGetLogIdentifier();
      id v19 = [*(id *)(a1 + 32) account];
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      long long v23 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Did not get the mergeID after querying IDS: %@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (HMDAccount)account
{
  [(HMDAppleAccountManager *)self accountRegistry];

  os_unfair_recursive_lock_lock_with_options();
  char v3 = self->_account;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDAppleAccountContext)accountContext
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = self->_accountContext;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)__handleMigrationUpdated:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HMDAppleAccountManager___handleMigrationUpdated___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__HMDAppleAccountManager___handleMigrationUpdated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v2 = [MEMORY[0x263F42648] systemInfo];
  char v3 = [v2 isMigrating];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      long long v12 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that migration completed", (uint8_t *)&v11, 0xCu);
    }
    id v8 = [*(id *)(a1 + 32) accountChangeBackoffTimer];
    [v8 resume];

    id v9 = [*(id *)(a1 + 32) accountChangeBackoffTimer];
    [v9 reset];

    id v10 = [*(id *)(a1 + 32) devicesChangeBackoffTimer];
    [v10 resume];
  }
}

- (void)__handleUpdatedName:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F424D8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__HMDAppleAccountManager___handleUpdatedName___block_invoke;
    v9[3] = &unk_264A2F820;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(queue, v9);
  }
}

void __46__HMDAppleAccountManager___handleUpdatedName___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) device];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 name];
    char v5 = HMFEqualObjects();

    if ((v5 & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 32);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = HMFGetLogIdentifier();
        uint64_t v10 = *(void *)(a1 + 40);
        int v18 = 138543618;
        id v19 = v9;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updating name: %@", (uint8_t *)&v18, 0x16u);
      }
      int v11 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:1 mustPush:0];
      long long v12 = [*(id *)(a1 + 32) backingStore];
      uint64_t v13 = [v12 transaction:@"Update Device Name" options:v11];

      uint64_t v14 = [HMDDeviceModel alloc];
      char v15 = [v3 modelIdentifier];
      id v16 = [v3 modelParentIdentifier];
      id v17 = [(HMDBackingStoreModelObject *)v14 initWithObjectChangeType:2 uuid:v15 parentUUID:v16];

      [(HMDDeviceModel *)v17 setName:*(void *)(a1 + 40)];
      [v13 add:v17];
      [v13 run];
    }
  }
}

- (void)__handleRemovedAccountWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = [(HMDAppleAccountManager *)self isMonitoring];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v39 = 138543362;
      v40 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification account was removed", (uint8_t *)&v39, 0xCu);
    }
    int v11 = [MEMORY[0x263EFB210] defaultStore];
    long long v12 = objc_msgSend(v11, "aa_primaryAppleAccount");

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = v7;
      char v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        id v16 = HMFGetLogIdentifier();
        int v39 = 138543362;
        v40 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_FAULT, "%{public}@Got primary iCloud account removed notification even though user is still signed in", (uint8_t *)&v39, 0xCu);
      }
      id v17 = (void *)MEMORY[0x230FBD990]();
      int v18 = v14;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v39 = 138543362;
        v40 = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Got primary iCloud account removed notification even though user is still signed in", (uint8_t *)&v39, 0xCu);
      }
      uint64_t v21 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2721];
      v4[2](v4, v21);
    }
    else
    {
      +[HMDPersistentStore resetConfiguration:2];
      uint64_t v24 = os_unfair_recursive_lock_lock_with_options();
      uint64_t v25 = (void *)MEMORY[0x230FBD990](v24);
      __int16 v26 = v7;
      HMFGetOSLogHandle();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        account = v26->_account;
        int v39 = 138543618;
        v40 = v28;
        __int16 v41 = 2112;
        v42 = account;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Current account: %@", (uint8_t *)&v39, 0x16u);
      }
      accountContext = v26->_accountContext;
      v26->_accountContext = 0;

      v26->_loggedIn = 0;
      uint64_t v31 = v26->_account;
      if (v31) {
        __removeAccount(v26, v26->_account);
      }
      __int16 v32 = (void *)MEMORY[0x230FBD990]();
      v33 = v26;
      HMFGetOSLogHandle();
      __int16 v34 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v35 = HMFGetLogIdentifier();
        int v39 = 138543362;
        v40 = v35;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Primary apple account is removed & logged out", (uint8_t *)&v39, 0xCu);
      }
      os_unfair_recursive_lock_unlock();
      if (!v31)
      {
        uint64_t v36 = +[HMDMainDriver driver];
        __int16 v37 = [v36 homeManager];
        [v37 _eraseLocalHomeConfigurationAfterSignOut];
      }
      v38 = [(HMDAppleAccountManager *)v33 settings];
      [v38 synchronize];

      v4[2](v4, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v39 = 138543362;
      v40 = v22;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring account notification", (uint8_t *)&v39, 0xCu);
    }
    long long v23 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v4[2](v4, v23);
  }
}

- (void)__handleRemovedAccountMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HMDAppleAccountManager___handleRemovedAccountMessage___block_invoke;
  v6[3] = &unk_264A2F3E8;
  id v7 = v4;
  id v5 = v4;
  [(HMDAppleAccountManager *)self __handleRemovedAccountWithCompletion:v6];
}

uint64_t __56__HMDAppleAccountManager___handleRemovedAccountMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)__handleModifiedAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAppleAccountManager *)self isMonitoring];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification account was modified", (uint8_t *)&v20, 0xCu);
    }
    __updateAccountContext(v7);
    int v11 = [(HMDAppleAccountManager *)v7 settings];
    [v11 synchronize];

    if (([v4 BOOLForKey:@"kPrimaryAccountWasModifiedRequestKey"] & 1) == 0)
    {
      long long v12 = [(HMDAppleAccountManager *)v7 account];

      if (!v12)
      {
        uint64_t v13 = __createAccount(v7);
        if (v13)
        {
          __addAccount(v7, v13);
        }
        else
        {
          char v15 = (void *)MEMORY[0x230FBD990]();
          id v16 = v7;
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v18 = HMFGetLogIdentifier();
            int v20 = 138543362;
            uint64_t v21 = v18;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create account", (uint8_t *)&v20, 0xCu);
          }
        }
      }
    }
    id v19 = [(HMDAppleAccountManager *)v7 notificationCenter];
    [v19 postNotificationName:@"HMDAppleAccountManagerAccountModifiedNotification" object:v7];

    [v4 respondWithPayload:0];
    [(HMDAppleAccountManager *)v7 __updateMergeIDOnAccount];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring account notification", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)__localDataReset:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDAppleAccountManager___localDataReset___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__HMDAppleAccountManager___localDataReset___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isMonitoring])
  {
    char v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Repushing account transactions", (uint8_t *)&v16, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) account];
    if (v6 || (__createAccount(*(void **)(a1 + 32)), (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = [*(id *)(a1 + 32) accountContext];

      if (v7)
      {
        __addAccount(*(void **)(a1 + 32), v6);
LABEL_14:

        return;
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = HMFGetLogIdentifier();
        int v16 = 138543362;
        id v17 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-create account", (uint8_t *)&v16, 0xCu);
      }
      id v6 = 0;
    }
    long long v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      char v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot add account after local reset", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
}

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HMDAppleAccountManager_stop__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __30__HMDAppleAccountManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isMonitoring])
  {
    char v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v20 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setMonitoring:0];
    [*(id *)(a1 + 32) _deregisterForRapportNotifications];
    id v6 = [*(id *)(a1 + 32) service];
    [v6 removeDelegate:*(void *)(a1 + 32)];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "service", 0);
    id v8 = [v7 accounts];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v13 removeDelegate:*(void *)(a1 + 32)];
          [v13 removeRegistrationDelegate:*(void *)(a1 + 32)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)start
{
  [(HMDAppleAccountManager *)self backingStore];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMDAppleAccountManager_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __31__HMDAppleAccountManager_start__block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) isMonitoring];
  if ((result & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", (uint8_t *)&buf, 0xCu);
    }
    [*(id *)(a1 + 32) setMonitoring:1];
    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = +[HMDMessageDispatcher defaultDispatcher];
      uint64_t v10 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
      *(void *)&long long buf = v10;
      uint64_t v60 = *MEMORY[0x263F0B8B8];
      uint64_t v11 = v60;
      long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
      id v13 = +[HMDXPCiCloudSwitchMessagePolicy policyWithBundleIdentifiers:v12];
      *((void *)&buf + 1) = v13;
      long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&buf count:2];
      [v9 registerForMessage:@"kPrimaryAccountWasModifiedRequestKey" receiver:v8 policies:v14 selector:sel___handleModifiedAccount_];

      long long v15 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
      uint64_t v58 = v11;
      v59[0] = v15;
      long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
      long long v17 = +[HMDXPCiCloudSwitchMessagePolicy policyWithBundleIdentifiers:v16];
      v59[1] = v17;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
      [v9 registerForMessage:@"kPrimaryAccountWasDeletedRequestKey" receiver:v8 policies:v18 selector:sel___handleRemovedAccountMessage_];

      id v19 = [v8 notificationCenter];
      uint64_t v20 = *MEMORY[0x263F424E0];
      uint64_t v21 = [MEMORY[0x263F42648] systemInfo];
      [v19 addObserver:v8 selector:sel___handleUpdatedName_ name:v20 object:v21];

      uint64_t v22 = [v8 notificationCenter];
      uint64_t v23 = *MEMORY[0x263F424D0];
      uint64_t v24 = [MEMORY[0x263F42648] systemInfo];
      [v22 addObserver:v8 selector:sel___handleMigrationUpdated_ name:v23 object:v24];

      uint64_t v25 = [v8 notificationCenter];
      [v25 addObserver:v8 selector:sel___localDataReset_ name:@"HMDBackingStoreLocalDataReset" object:0];

      __int16 v26 = *(void **)(a1 + 32);
    }
    else
    {
      __int16 v26 = 0;
    }
    id v27 = [v26 service];
    [v27 addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v28 = [*(id *)(a1 + 32) activityBroadcaster];
    [v28 configureWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "service", 0);
    BOOL v30 = [v29 accounts];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v30);
          }
          __int16 v35 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          [v35 addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
          [v35 addRegistrationDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v32);
    }

    __updateAccountContext(*(void **)(a1 + 32));
    uint64_t v36 = [*(id *)(a1 + 32) account];
    __int16 v37 = [*(id *)(a1 + 32) accountContext];

    if (v37)
    {
      v38 = *(void **)(a1 + 32);
      if (v36)
      {
        __updateAccount(v38, 0);
        __updateDevices(*(void **)(a1 + 32), 0);
      }
      else
      {
        int v39 = __createAccount(v38);
        if (v39)
        {
          __addAccount(*(void **)(a1 + 32), v39);
        }
        else
        {
          v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = *(id *)(a1 + 32);
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = HMFGetLogIdentifier();
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v43;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to create account", (uint8_t *)&buf, 0xCu);
          }
        }
      }
    }
    else if (v36)
    {
      __removeAccount(*(void **)(a1 + 32), v36);
    }

    v44 = [*(id *)(a1 + 32) pendingPushToken];

    if (v44)
    {
      v45 = (void *)MEMORY[0x230FBD990]();
      id v46 = *(id *)(a1 + 32);
      id v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v48;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@We might have a missed the didReceivePublicToken earlier. Let's set the token first.", (uint8_t *)&buf, 0xCu);
      }
      v49 = *(void **)(a1 + 32);
      v50 = [v49 pendingPushToken];
      [v49 _updatePushToken:v50];

      [*(id *)(a1 + 32) setPendingPushToken:0];
    }
    objc_msgSend(*(id *)(a1 + 32), "__updateMergeIDOnAccount");
    id v51 = [*(id *)(a1 + 32) notificationCenter];
    [v51 postNotificationName:@"HMDAppleAccountManagerResolved" object:*(void *)(a1 + 32)];

    id v52 = [*(id *)(a1 + 32) deviceAccountSettledPromise];
    [v52 fulfillWithNoValue];

    return [*(id *)(a1 + 32) _registerForRapportNotifications];
  }
  return result;
}

- (void)setAccountRegistry:(id)a3
{
  id v4 = (HMDAccountRegistry *)a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  BOOL v5 = v4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_accountRegistry)
  {
LABEL_7:
    _HMFPreconditionFailure();
    __break(1u);
    return;
  }
  self->_accountRegistry = v5;
  os_unfair_recursive_lock_unlock();
}

- (HMDAccountRegistry)accountRegistry
{
  os_unfair_recursive_lock_lock_with_options();
  accountRegistry = self->_accountRegistry;
  if (accountRegistry)
  {
    id v4 = accountRegistry;
    os_unfair_recursive_lock_unlock();
    return v4;
  }
  else
  {
    uint64_t result = (HMDAccountRegistry *)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

- (void)configureWithAccountRegistry:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HMDAppleAccountManager *)self setAccountRegistry:v4];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__156480;
  uint64_t v21 = __Block_byref_object_dispose__156481;
  id v22 = 0;
  BOOL v5 = [v4 fetchAccountsWithLocalFlag:1];
  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v6 = [v5 firstObject];
    id v7 = (void *)v18[5];
    v18[5] = v6;
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__HMDAppleAccountManager_configureWithAccountRegistry___block_invoke;
    v14[3] = &unk_264A22478;
    long long v16 = &v17;
    v14[4] = self;
    id v15 = v4;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  }
  if (v18[5])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    HMFGetOSLogHandle();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = v18[5];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Using local account %@ fetched from the database.", buf, 0x16u);
    }
    id v13 = [(HMDAppleAccountManager *)v9 deviceAccountSettledPromise];
    [v13 fulfillWithNoValue];

    __setAccount(v9, (void *)v18[5], 0);
  }

  _Block_object_dispose(&v17, 8);
}

void __55__HMDAppleAccountManager_configureWithAccountRegistry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x230FBD990](v6);
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@More than one account found. Removing %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) removeAccount:v4];
  }
  else
  {
    objc_storeStrong(v6, a2);
  }
}

- (HMDBackingStore)backingStore
{
  os_unfair_recursive_lock_lock_with_options();
  backingStore = self->_backingStore;
  if (backingStore)
  {
    id v4 = backingStore;
    os_unfair_recursive_lock_unlock();
    return v4;
  }
  else
  {
    uint64_t result = (HMDBackingStore *)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

- (void)configureWithBackingStore:(id)a3
{
  id v4 = (HMDBackingStore *)a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_backingStore)
  {
LABEL_7:
    _HMFPreconditionFailure();
    __break(1u);
    return;
  }
  self->_backingStore = v5;
  os_unfair_recursive_lock_unlock();
}

- (ACAccountStore)accountStore
{
  char v2 = self->_accountStore;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_deregisterForRapportNotifications
{
  if ([(HMDAppleAccountManager *)self isRapportIdentitiesChangedNotificationTokenValid])
  {
    notify_cancel([(HMDAppleAccountManager *)self rapportIdentitiesChangedNotificationToken]);
    [(HMDAppleAccountManager *)self setRapportIdentitiesChangedNotificationTokenValid:0];
  }
}

- (void)_registerForRapportNotifications
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (![(HMDAppleAccountManager *)self isRapportIdentitiesChangedNotificationTokenValid])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __58__HMDAppleAccountManager__registerForRapportNotifications__block_invoke;
    uint64_t v16 = &unk_264A28768;
    objc_copyWeak(&v17, &location);
    uint64_t v4 = notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_rapportIdentitiesChangedNotificationToken, queue, &v13);
    int v8 = v4;
    if (v4)
    {
      id v9 = (void *)MEMORY[0x230FBD990](v4, v5, v6, v7);
      uint64_t v10 = self;
      HMFGetOSLogHandle();
      uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v20 = v12;
        __int16 v21 = 2080;
        id v22 = "com.apple.rapport.identitiesChanged";
        __int16 v23 = 1024;
        int v24 = v8;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for %s: %d", buf, 0x1Cu);
      }
    }
    else
    {
      -[HMDAppleAccountManager setRapportIdentitiesChangedNotificationTokenValid:](self, "setRapportIdentitiesChangedNotificationTokenValid:", 1, v13, v14, v15, v16);
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __58__HMDAppleAccountManager__registerForRapportNotifications__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = WeakRetained;
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      int v8 = v5;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that rapport identity changed, update current device", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = [v3 account];
    if (v6) {
      __updateCurrentDevice(v3, v6);
    }
  }
}

- (HMDAppleAccountManager)initWithIDSService:(id)a3 activityBroadcaster:(id)a4 dataSource:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v50.receiver = self;
    v50.super_class = (Class)HMDAppleAccountManager;
    int v12 = [(HMDAppleAccountManager *)&v50 init];
    if (v12)
    {
      uint64_t v13 = HMFGetOSLogHandle();
      logger = v12->_logger;
      v12->_logger = (OS_os_log *)v13;

      v12->_loggedIn = 0;
      uint64_t v15 = [v11 queue];
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v15;

      objc_storeStrong((id *)&v12->_service, a3);
      objc_storeStrong((id *)&v12->_activityBroadcaster, a4);
      id v17 = [v11 accountChangeObserver];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v19 = v18;

      accountChangeObserver = v12->_accountChangeObserver;
      v12->_accountChangeObserver = v19;
      __int16 v21 = v19;

      uint64_t v22 = [v11 apsConnection];
      pushConnection = v12->_pushConnection;
      v12->_pushConnection = (HMDAPSConnection *)v22;

      [(HMDAPSConnection *)v12->_pushConnection setDelegate:v12];
      uint64_t v24 = [v11 notificationCenter];
      notificationCenter = v12->_notificationCenter;
      v12->_notificationCenter = (NSNotificationCenter *)v24;

      uint64_t v26 = [v11 accountStore];
      accountStore = v12->_accountStore;
      v12->_accountStore = (HMDACAccountStore *)v26;

      uint64_t v28 = [objc_alloc(MEMORY[0x263F42528]) initWithMinimumTimeInterval:3 maximumTimeInterval:1 exponentialFactor:1.0 options:86400.0];
      accountChangeBackoffTimer = v12->_accountChangeBackoffTimer;
      v12->_accountChangeBackoffTimer = (HMFExponentialBackoffTimer *)v28;

      BOOL v30 = [(HMDAppleAccountManager *)v12 accountChangeBackoffTimer];
      [v30 setDelegate:v12];

      uint64_t v31 = [(HMDAppleAccountManager *)v12 accountChangeBackoffTimer];
      [v31 setDelegateQueue:v12->_queue];

      uint64_t v32 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:2 options:15.0];
      devicesChangeBackoffTimer = v12->_devicesChangeBackoffTimer;
      v12->_devicesChangeBackoffTimer = (HMFTimer *)v32;

      __int16 v34 = [(HMDAppleAccountManager *)v12 devicesChangeBackoffTimer];
      [v34 setDelegate:v12];

      __int16 v35 = [(HMDAppleAccountManager *)v12 devicesChangeBackoffTimer];
      [v35 setDelegateQueue:v12->_queue];

      *(void *)id obj = 0;
      uint64_t v36 = [MEMORY[0x263F42538] futureWithPromise:obj];
      deviceAccountSettled = v12->_deviceAccountSettled;
      v12->_deviceAccountSettled = (HMFFuture *)v36;

      objc_storeStrong((id *)&v12->_deviceAccountSettledPromise, *(id *)obj);
      id v49 = 0;
      uint64_t v38 = [MEMORY[0x263F42538] futureWithPromise:&v49];
      currentDeviceSettled = v12->_currentDeviceSettled;
      v12->_currentDeviceSettled = (HMFFuture *)v38;

      objc_storeStrong((id *)&v12->_currentDeviceSettledPromise, v49);
      id v48 = 0;
      uint64_t v40 = [MEMORY[0x263F42538] futureWithPromise:&v48];
      idsDevicesUpdated = v12->_idsDevicesUpdated;
      v12->_idsDevicesUpdated = (HMFFuture *)v40;

      objc_storeStrong((id *)&v12->_idsDevicesUpdatedPromise, v48);
      __updateAccountContext(v12);
    }
    v42 = v12;
    uint64_t v43 = v42;
  }
  else
  {
    v44 = (void *)MEMORY[0x230FBD990]();
    v42 = self;
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      id v46 = HMFGetLogIdentifier();
      *(_DWORD *)id obj = 138543362;
      *(void *)&obj[4] = v46;
      _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Service is required", obj, 0xCu);
    }
    uint64_t v43 = 0;
  }

  return v43;
}

- (HMDAppleAccountManager)initWithIDSService:(id)a3 activityBroadcaster:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  HMDispatchQueueNameString();
  id v8 = objc_claimAutoreleasedReturnValue();
  id v9 = (const char *)[v8 UTF8String];
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create(v9, v10);

  int v12 = [[HMDAppleAccountManagerDefaultDataSource alloc] initWithQueue:v11];
  uint64_t v13 = [(HMDAppleAccountManager *)self initWithIDSService:v7 activityBroadcaster:v6 dataSource:v12];

  return v13;
}

- (HMDAppleAccountManager)init
{
  char v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107_156512 != -1) {
    dispatch_once(&logCategory__hmf_once_t107_156512, &__block_literal_global_156513);
  }
  char v2 = (void *)logCategory__hmf_once_v108_156514;
  return v2;
}

void __37__HMDAppleAccountManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v108_156514;
  logCategory__hmf_once_v108_156514 = v0;
}

+ (HMDAppleAccountManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__HMDAppleAccountManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_156519 != -1) {
    dispatch_once(&sharedManager_onceToken_156519, block);
  }
  char v2 = (void *)sharedManager_accountManager;
  return (HMDAppleAccountManager *)v2;
}

void __39__HMDAppleAccountManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v2 = +[HMDIDSServiceManager sharedManager];
  uint64_t v3 = +[HMDDeviceCapabilities deviceCapabilities];
  int v4 = [v3 isResidentCapable];

  if (v4)
  {
    uint64_t v5 = [v2 activityBroadcaster];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [HMDAppleAccountManager alloc];
  id v7 = [v2 service];
  uint64_t v8 = [(HMDAppleAccountManager *)v6 initWithIDSService:v7 activityBroadcaster:v5];
  id v9 = (void *)sharedManager_accountManager;
  sharedManager_accountManager = v8;

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 32);
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating an HMDAppleAccountManager", (uint8_t *)&v14, 0xCu);
  }
}

@end
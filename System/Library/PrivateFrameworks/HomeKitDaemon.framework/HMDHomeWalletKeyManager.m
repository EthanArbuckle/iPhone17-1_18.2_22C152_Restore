@interface HMDHomeWalletKeyManager
+ (id)allowedClassesForWalletKeySettings;
+ (id)homekitErrorWithPassLibraryErrorCode:(int64_t)a3;
+ (id)logCategory;
+ (id)responsePayloadForPairedWatchesWithMessageName:(id)a3 responsePayloadByDevice:(id)a4 error:(id)a5;
- (BOOL)canAutoAddWalletKeyWithError:(id *)a3;
- (BOOL)canSuspendWalletKey;
- (BOOL)hasHomeKeyInWallet;
- (BOOL)isHomeBeingRemoved;
- (BOOL)isWalletKeyRollForHH2InProgress;
- (BOOL)isWalletKeyUpdateOperationInProgress;
- (BOOL)shouldEnableExpressModeAfterMigration;
- (BOOL)shouldRollWalletKeyAfterMigration;
- (HAPKeyStore)keychainStore;
- (HMDApplicationRegistry)applicationRegistry;
- (HMDBulletinBoard)bulletinBoard;
- (HMDFileManager)fileManager;
- (HMDHome)home;
- (HMDHomeKeySetupWalletLogEvent)logEvent;
- (HMDHomeWalletDataSource)dataSource;
- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4;
- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 fileManager:(id)a5 passLibrary:(id)a6 notificationCenter:(id)a7 watchManager:(id)a8 keychainStore:(id)a9 lostModeManager:(id)a10 dataSource:(id)a11 bulletinBoard:(id)a12 applicationRegistry:(id)a13 systemInfo:(id)a14 isoCredentialFactory:(id)a15;
- (HMDLostModeManager)lostModeManager;
- (HMDWalletPassLibrary)passLibrary;
- (HMDWatchManager)watchManager;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFSystemInfo)systemInfo;
- (NAFuture)addWalletKeyFuture;
- (NSMutableArray)pendingUpdateWalletKeyOperations;
- (NSNotificationCenter)notificationCenter;
- (NSString)passSerialNumber;
- (NSUUID)currentUserUUID;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)createPassDirectoryWithResourceFilesWithFlow:(id)a3;
- (id)createPassDirectoryWithoutResourceFilesWithFlow:(id)a3;
- (id)deviceCredentialKeyForAccessory:(id)a3 fromPaymentApplications:(id)a4;
- (id)fetchWalletKeyColorOptionWithFlow:(id)a3;
- (id)isoCredentialACWGFactory;
- (id)isoCredentialFactory;
- (id)logIdentifier;
- (id)passSerialNumberWithUserUUID:(id)a3;
- (id)paymentApplicationsForWalletKey:(id)a3 validateNFCInfo:(BOOL)a4 defaultPaymentApplication:(id)a5 doesAnyAccessorySupportACB:(BOOL)a6 flow:(id)a7;
- (id)updatePassJSONAtURL:(id)a3 withWalletKey:(id)a4 options:(int64_t)a5 validateNFCInfo:(BOOL)a6 flow:(id)a7;
- (id)walletKeyByAddingAccessCodeToWalletKey:(id)a3;
- (id)walletKeySettingsFileURL;
- (void)_replaceWalletKeyAfterHH2Migration;
- (void)accessoryManager:(id)a3 didUpdateWalletKeyColor:(int64_t)a4;
- (void)addISOCredentialV0WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)addISOCredentialV1WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)addISOCredentialWithPassAtURL:(id)a3 walletKey:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)addIssuerKeysToMatterAccessoriesWithFlow:(id)a3;
- (void)addWalletKey:(id)a3 withOptions:(int64_t)a4 assertion:(id)a5 flow:(id)a6;
- (void)addWalletKeyWithOptions:(int64_t)a3 isOnboarding:(BOOL)a4 flow:(id)a5 completion:(id)a6;
- (void)addWalletKeyWithOptions:(int64_t)a3 nfcReaderKey:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)auditExistingWalletKeysForDuplicatesWithFlow:(id)a3;
- (void)autoAddWalletKeyWithFlow:(id)a3;
- (void)autoAddWalletKeyWithReason:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)configureWalletPaymentApplicationsWithNFCReaderKey:(id)a3 serialNumber:(id)a4 homeUniqueIdentifier:(id)a5 homeGRK:(id)a6 flow:(id)a7 completion:(id)a8;
- (void)configureWithHome:(id)a3;
- (void)createExpressModeSetUpBulletin;
- (void)createPassDirectoryWithWalletKey:(id)a3 options:(int64_t)a4 shouldSkipResourceFiles:(BOOL)a5 shouldCreateZipArchive:(BOOL)a6 validateNFCInfo:(BOOL)a7 flow:(id)a8 completion:(id)a9;
- (void)didAddCurrentUserWithUUID:(id)a3;
- (void)enableExpressWithOptions:(int64_t)a3 flow:(id)a4 completion:(id)a5;
- (void)enqueueWalletKeyUpdateOperation:(id)a3 flow:(id)a4;
- (void)fetchExpressEnablementConflictingPassDescriptionWithFlow:(id)a3 completion:(id)a4;
- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4;
- (void)fetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4;
- (void)fetchPayloadForAddWalletKeyRemoteMessageWithFlow:(id)a3 completion:(id)a4;
- (void)fetchShouldAutoEnableExpressWithCompletion:(id)a3;
- (void)fetchShouldSuppressWalletNotificationWithCompletion:(id)a3;
- (void)fetchWalletKeyColorOptionWithFlow:(id)a3 completion:(id)a4;
- (void)handleAccessCodeChanged;
- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3;
- (void)handleAccessorySupportsWalleyKeyDidChangeNotification:(id)a3;
- (void)handleAddWalletKeyMessage:(id)a3;
- (void)handleApplicationInstalled:(id)a3;
- (void)handleApplicationUninstalled:(id)a3;
- (void)handleEnableExpressForWalletKeyMessage:(id)a3;
- (void)handleFetchAvailableWalletKeyEncodedPKPassMessage:(id)a3;
- (void)handleFetchDeviceStateMessage:(id)a3;
- (void)handleFetchMissingWalletKeysMessage:(id)a3;
- (void)handleFetchWalletKeyColorMessage:(id)a3;
- (void)handleHomeAccessoryRemovedNotification:(id)a3;
- (void)handleHomeAddedAccessoryNotification:(id)a3;
- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3;
- (void)handleHomeHasOnboardedForWalletKeyChangeNotification:(id)a3;
- (void)handleHomeManagerHasFinishedStartingUp:(id)a3;
- (void)handleHomeNameChangedNotification:(id)a3;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)handleHomeWasRemoved;
- (void)handleHomeWillBeRemoved;
- (void)handleLostModeManagerDidExitLostModeWithAuthCompleteNotification;
- (void)handleLostModeUpdated;
- (void)handleMessageForPairedWatches:(id)a3;
- (void)handleNFCReaderKeyUpdatedForWalletKey:(id)a3 flow:(id)a4;
- (void)handlePassUpdatedWithResult:(int64_t)a3 paymentApps:(id)a4 addedPaymentApps:(id)a5 pass:(id)a6 accessoryToSync:(id)a7 showSetupBulletinOnAdd:(BOOL)a8 showExpressBulletinOnAddForWatch:(BOOL)a9 error:(id)a10 flow:(id)a11;
- (void)handlePendingWalletKeyUpdateOperationsWithFlow:(id)a3;
- (void)handlePersistWalletKeyAddOptionsRemoteMessage:(id)a3;
- (void)handleRestoreMissingWalletKeysMessage:(id)a3;
- (void)handleSetHomeKeyExpressSettingsMessage:(id)a3;
- (void)handleSystemInfoMigrationUpdatedNotification:(id)a3;
- (void)handleUserScheduleDidChangeNotification:(id)a3;
- (void)passLibrary:(id)a3 didAddPassWithSerialNumber:(id)a4 typeIdentifier:(id)a5;
- (void)passLibrary:(id)a3 didRemovePassWithSerialNumber:(id)a4 typeIdentifier:(id)a5;
- (void)recoverDueToUUIDChangeOfUser:(id)a3 fromOldUUID:(id)a4;
- (void)removeDuplicateWalletKeysForUser:(id)a3 flow:(id)a4;
- (void)removeWalletKeyMigrationSettingsFileFromDisk;
- (void)removeWalletKeyOnboardingBulletin;
- (void)replaceWalletKeyAfterHH2MigrationIfNecessary;
- (void)sendMessageWithName:(id)a3 payload:(id)a4 toWatches:(id)a5 completion:(id)a6;
- (void)setAddWalletKeyFuture:(id)a3;
- (void)setCurrentUserUUID:(id)a3;
- (void)setHome:(id)a3;
- (void)setIsHomeBeingRemoved:(BOOL)a3;
- (void)setIsWalletKeyRollForHH2InProgress:(BOOL)a3;
- (void)setIsWalletKeyUpdateOperationInProgress:(BOOL)a3;
- (void)setLogEvent:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)showExpressEnabledNotificationForWalletKey:(id)a3;
- (void)syncDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5;
- (void)syncDeviceCredentialKeyForAccessory:(id)a3 paymentApplications:(id)a4 flow:(id)a5;
- (void)unconfigure;
- (void)updateDeviceStateWithCanAddWalletKey:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateDeviceStateWithExpressEnablementConflictingPassDescription:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateDeviceStateWithWalletKey:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateWalletKeyAccessCodeFieldWithReason:(id)a3;
- (void)updateWalletKeyByConfiguringEndpointsWithFlow:(id)a3;
- (void)updateWalletKeyStateToState:(int64_t)a3 flow:(id)a4;
- (void)updateWalletKeyWithReason:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateWalletKeyWithReason:(id)a3 syncDeviceKeyToAccessory:(id)a4 flow:(id)a5 completion:(id)a6;
@end

@implementation HMDHomeWalletKeyManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong((id *)&self->_currentUserUUID, 0);
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_applicationRegistry, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_pendingUpdateWalletKeyOperations, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lostModeManager, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
  objc_storeStrong(&self->_isoCredentialACWGFactory, 0);
  objc_storeStrong(&self->_isoCredentialFactory, 0);
  objc_storeStrong((id *)&self->_addWalletKeyFuture, 0);
  objc_storeStrong((id *)&self->_watchManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)setIsWalletKeyRollForHH2InProgress:(BOOL)a3
{
  self->_isWalletKeyRollForHH2InProgress = a3;
}

- (BOOL)isWalletKeyRollForHH2InProgress
{
  return self->_isWalletKeyRollForHH2InProgress;
}

- (void)setLogEvent:(id)a3
{
}

- (HMDHomeKeySetupWalletLogEvent)logEvent
{
  return (HMDHomeKeySetupWalletLogEvent *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCurrentUserUUID:(id)a3
{
}

- (NSUUID)currentUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 160, 1);
}

- (HMFSystemInfo)systemInfo
{
  return (HMFSystemInfo *)objc_getProperty(self, a2, 152, 1);
}

- (HMDApplicationRegistry)applicationRegistry
{
  return (HMDApplicationRegistry *)objc_getProperty(self, a2, 144, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIsHomeBeingRemoved:(BOOL)a3
{
  self->_isHomeBeingRemoved = a3;
}

- (BOOL)isHomeBeingRemoved
{
  return self->_isHomeBeingRemoved;
}

- (void)setIsWalletKeyUpdateOperationInProgress:(BOOL)a3
{
  self->_isWalletKeyUpdateOperationInProgress = a3;
}

- (BOOL)isWalletKeyUpdateOperationInProgress
{
  return self->_isWalletKeyUpdateOperationInProgress;
}

- (NSMutableArray)pendingUpdateWalletKeyOperations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 120, 1);
}

- (HMDLostModeManager)lostModeManager
{
  return (HMDLostModeManager *)objc_getProperty(self, a2, 112, 1);
}

- (HAPKeyStore)keychainStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 104, 1);
}

- (id)isoCredentialACWGFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (id)isoCredentialFactory
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setAddWalletKeyFuture:(id)a3
{
}

- (NAFuture)addWalletKeyFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 80, 1);
}

- (HMDWatchManager)watchManager
{
  return (HMDWatchManager *)objc_getProperty(self, a2, 72, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMDWalletPassLibrary)passLibrary
{
  return (HMDWalletPassLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)removeDuplicateWalletKeysForUser:(id)a3 flow:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(HMDHomeWalletKeyManager *)self home];
  if (([v9 isOwnerUser] & 1) == 0)
  {
    uint64_t v10 = [v9 currentUser];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [v9 currentUser];
      int v13 = [v12 isRestrictedGuest];

      if (v13)
      {
        v14 = (void *)MEMORY[0x230FBD990]();
        v15 = self;
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = HMFGetLogIdentifier();
          v18 = [v7 UUID];
          *(_DWORD *)buf = 138543618;
          v23 = v17;
          __int16 v24 = 2112;
          v25 = v18;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing duplicate wallet keys", buf, 0x16u);
        }
        v19 = [v9 findAdditionalUUIDsForUser:v6];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __65__HMDHomeWalletKeyManager_removeDuplicateWalletKeysForUser_flow___block_invoke;
        v20[3] = &unk_264A1CD78;
        v20[4] = v15;
        id v21 = v7;
        objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
      }
    }
  }
}

void __65__HMDHomeWalletKeyManager_removeDuplicateWalletKeysForUser_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) passSerialNumberWithUserUUID:v3];
  v5 = [*(id *)(a1 + 32) passSerialNumber];
  int v6 = [v5 isEqual:v4];

  if (!v6)
  {
    v16 = [*(id *)(a1 + 32) passLibrary];
    int v17 = [v16 removePassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v4 flow:*(void *)(a1 + 40)];

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (!v18) {
        goto LABEL_11;
      }
      uint64_t v10 = HMFGetLogIdentifier();
      v11 = [*(id *)(a1 + 40) UUID];
      int v19 = 138544130;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2112;
      id v26 = v3;
      v12 = "%{public}@[Flow: %@] Removed duplicate wallet key with serial number: %@ for user uuid: %@";
    }
    else
    {
      if (!v18) {
        goto LABEL_11;
      }
      uint64_t v10 = HMFGetLogIdentifier();
      v11 = [*(id *)(a1 + 40) UUID];
      int v19 = 138544130;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2112;
      id v26 = v3;
      v12 = "%{public}@[Flow: %@] Did not find wallet key with serial number: %@ for user uuid: %@";
    }
    int v13 = v9;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 42;
    goto LABEL_10;
  }
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    v11 = [*(id *)(a1 + 40) UUID];
    int v19 = 138543874;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v3;
    v12 = "%{public}@[Flow: %@] Duplicate user's wallet key serial number matches to current user's key, user uuid: %@";
    int v13 = v9;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 32;
LABEL_10:
    _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v19, v15);
  }
LABEL_11:
}

- (void)auditExistingWalletKeysForDuplicatesWithFlow:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDHomeWalletKeyManager *)self home];
  v5 = [v6 currentUser];
  [(HMDHomeWalletKeyManager *)self removeDuplicateWalletKeysForUser:v5 flow:v4];
}

- (BOOL)canSuspendWalletKey
{
  v2 = [(HMDHomeWalletKeyManager *)self home];
  char v3 = [v2 hasAnyAccessoryWithWalletKeySupport] ^ 1;

  return v3;
}

- (void)handleHomeHasOnboardedForWalletKeyChangeNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomeWalletKeyManager *)self home];
  char v6 = [v5 hasOnboardedForWalletKey];

  id v7 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v7 UUID];
    int v13 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    __int16 v24 = 2112;
    __int16 v25 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Home has onboarded flag changed to %@", buf, 0x20u);
  }
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    [(HMDHomeWalletKeyManager *)v9 updateWalletKeyWithReason:@"onboarded for wallet key" flow:v7 completion:0];
  }
  else
  {
    BOOL v14 = [(HMDHomeWalletKeyManager *)v9 canSuspendWalletKey];
    uint32_t v15 = [(HMDHomeWalletKeyManager *)v9 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke;
    block[3] = &unk_264A26DE8;
    char v18 = v6;
    BOOL v19 = v14;
    block[4] = v9;
    id v17 = v7;
    dispatch_async(v15, block);
  }
}

void __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) removeWalletKeyOnboardingBulletin];
    char v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke_2;
    v6[3] = &unk_264A1A008;
    v6[4] = v3;
    id v7 = v2;
    [v3 autoAddWalletKeyWithReason:@"onboarded for wallet key" flow:v7 completion:v6];
  }
  else if (*(unsigned char *)(a1 + 49))
  {
    [*(id *)(a1 + 32) updateWalletKeyStateToState:6 flow:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 auditExistingWalletKeysForDuplicatesWithFlow:v5];
  }
}

void __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 domain];
  if (v8 == @"HMDHomeAutoAddWalletKeyErrorDomain")
  {
    if ([v6 code] == 3)
    {
      [*(id *)(a1 + 32) _replaceWalletKeyAfterHH2Migration];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      BOOL v14 = [*(id *)(a1 + 40) UUID];
      int v17 = 138543874;
      char v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when home has onboarded for wallet key: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      v16 = [*(id *)(a1 + 40) UUID];
      int v17 = 138543618;
      char v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when home onboarded for wallet key", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
LABEL_12:
}

- (void)updateWalletKeyByConfiguringEndpointsWithFlow:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    v9 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating wallet key by configuring endpoints", buf, 0x16u);
  }
  id v10 = [(HMDHomeWalletKeyManager *)v6 home];
  if (v10)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      v11 = [v10 acwgGroupResolvingKey];
    }
    else
    {
      v11 = 0;
    }
    int v17 = [(HMDHomeWalletKeyManager *)v6 passSerialNumber];
    char v18 = (void *)MEMORY[0x230FBD990]();
    __int16 v19 = v6;
    v20 = HMFGetOSLogHandle();
    __int16 v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        uint64_t v23 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        __int16 v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generating nfc info for existing wallet key", buf, 0x16u);
      }
      __int16 v24 = [v10 nfcReaderKey];
      __int16 v25 = [v10 spiClientIdentifier];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke;
      v28[3] = &unk_264A2E1A0;
      v28[4] = v19;
      id v29 = v4;
      [(HMDHomeWalletKeyManager *)v19 configureWalletPaymentApplicationsWithNFCReaderKey:v24 serialNumber:v17 homeUniqueIdentifier:v25 homeGRK:v11 flow:v29 completion:v28];
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        v31 = v26;
        __int16 v32 = 2112;
        v33 = v27;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update home key, serial number is nil", buf, 0x16u);
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = v6;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint32_t v15 = HMFGetLogIdentifier();
      v16 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home is nil", buf, 0x16u);
    }
  }
}

void __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1239;
    block[3] = &unk_264A2F2F8;
    id v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v15 = v8;
    id v16 = v5;
    dispatch_async(v7, block);
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      char v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to generate nfc info, when handling home did update nfc reader key", buf, 0x16u);
    }
  }
}

void __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1239(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] UUID];
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    __int16 v12 = 2112;
    int v13 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating existing wallet key with nfc info", buf, 0x16u);
  }
  id v7 = a1[4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1240;
  v8[3] = &unk_264A1A788;
  v8[4] = v7;
  id v9 = a1[6];
  [v7 enqueueWalletKeyUpdateOperation:v8 flow:a1[5]];
}

id __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_1240(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  id v5 = [*(id *)(a1 + 32) walletKeyByAddingAccessCodeToWalletKey:a2];
  id v6 = (void *)[v5 mutableCopy];
  [v6 setNfcInfos:*(void *)(a1 + 40)];
  id v7 = (void *)[v6 copy];

  return v7;
}

- (void)handleNFCReaderKeyUpdatedForWalletKey:(id)a3 flow:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v57 = a4;
  id v7 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    __int16 v12 = [v57 UUID];
    *(_DWORD *)buf = 138543618;
    v66 = v11;
    __int16 v67 = 2112;
    v68 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling NFC reader key updated for wallet key", buf, 0x16u);
  }
  int v13 = [(HMDHomeWalletKeyManager *)v9 home];
  uint64_t v14 = [v13 nfcReaderKey];
  id v15 = [v14 identifier];

  id v16 = [v13 nfcReaderKey];
  int v17 = [v16 publicKey];
  char v18 = +[HMDNIST256Utilities identifier16BytesForKey:v17];

  id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
  v20 = [v6 nfcInfos];
  uint64_t v21 = [v20 firstObject];
  id v22 = [v21 pairedReaderIdentifier];
  v56 = objc_msgSend(v19, "hmf_initWithHexadecimalString:options:", v22, 0);

  uint64_t v23 = [v6 nfcInfos];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke;
  v62[3] = &unk_264A1A7F8;
  id v24 = v15;
  id v63 = v24;
  id v25 = v18;
  id v64 = v25;
  LODWORD(v21) = objc_msgSend(v23, "na_any:", v62);

  uint64_t v26 = (void *)MEMORY[0x230FBD990]();
  uint64_t v27 = v9;
  v28 = HMFGetOSLogHandle();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v29)
    {
      v30 = HMFGetLogIdentifier();
      v31 = [v57 UUID];
      *(_DWORD *)buf = 138544386;
      v66 = v30;
      __int16 v67 = 2112;
      v68 = v31;
      __int16 v69 = 2112;
      id v70 = v56;
      __int16 v71 = 2112;
      id v72 = v24;
      __int16 v73 = 2112;
      id v74 = v25;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader identifier of the existing wallet key: %@ matches with what exists in home. uaReaderGroupIdentifier: %@, v2ReaderGroupIdentifier: %@", buf, 0x34u);
    }
  }
  else
  {
    if (v29)
    {
      __int16 v32 = HMFGetLogIdentifier();
      v33 = [v57 UUID];
      *(_DWORD *)buf = 138544386;
      v66 = v32;
      __int16 v67 = 2112;
      v68 = v33;
      __int16 v69 = 2112;
      id v70 = v56;
      __int16 v71 = 2112;
      id v72 = v24;
      __int16 v73 = 2112;
      id v74 = v25;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader identifier of existing wallet key: %@ doesn't match with home uaReaderGroupIdentifier: %@ or v2ReaderGroupIdentifier: %@", buf, 0x34u);
    }
    uint64_t v34 = [(HMDHomeWalletKeyManager *)v27 dataSource];
    v35 = objc_msgSend(v24, "hmf_hexadecimalRepresentation");
    v36 = [v34 numberValueFromNoBackupStoreWithKey:v35];

    if (v36)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      v38 = v27;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        v41 = [v57 UUID];
        *(_DWORD *)buf = 138543874;
        v66 = v40;
        __int16 v67 = 2112;
        v68 = v41;
        __int16 v69 = 2112;
        id v70 = v36;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing and re-adding wallet key with default options: %@", buf, 0x20u);
      }
      v42 = [(HMDHomeWalletKeyManager *)v38 passLibrary];
      v43 = [v6 typeIdentifier];
      v44 = [v6 serialNumber];
      char v45 = [v42 removePassWithTypeIdentifier:v43 serialNumber:v44 flow:v57];

      if (v45)
      {
        objc_initWeak((id *)buf, v38);
        uint64_t v46 = [v36 integerValue];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke_1238;
        v58[3] = &unk_264A1A168;
        objc_copyWeak(&v61, (id *)buf);
        id v59 = v57;
        id v60 = v6;
        [(HMDHomeWalletKeyManager *)v38 addWalletKeyWithOptions:v46 isOnboarding:0 flow:v59 completion:v58];

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v51 = (void *)MEMORY[0x230FBD990]();
        v52 = v38;
        v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = HMFGetLogIdentifier();
          v55 = [v57 UUID];
          *(_DWORD *)buf = 138543874;
          v66 = v54;
          __int16 v67 = 2112;
          v68 = v55;
          __int16 v69 = 2112;
          id v70 = v6;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove wallet key: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      if (!_os_feature_enabled_impl()
        || (isInternalBuild() & 1) == 0
        && !CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
      {
        v47 = [(HMDHomeWalletKeyManager *)v27 passLibrary];
        v48 = [v6 nfcInfos];
        v49 = [v48 firstObject];
        v50 = [v49 subCredentialIdentifier];
        [v47 deleteKeyMaterialForSubCredentialId:v50];
      }
      [(HMDHomeWalletKeyManager *)v27 updateWalletKeyByConfiguringEndpointsWithFlow:v57];
    }
  }
}

uint64_t __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFF8F8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 pairedReaderIdentifier];

  id v7 = objc_msgSend(v5, "hmf_initWithHexadecimalString:options:", v6, 0);

  if ([v7 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v7 isEqual:*(void *)(a1 + 40)];
  }

  return v8;
}

void __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke_1238(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v13 = [*(id *)(a1 + 32) UUID];
      uint64_t v14 = *(void **)(a1 + 40);
      int v16 = 138543874;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added wallet key: %@", (uint8_t *)&v16, 0x20u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 32) UUID];
    int v16 = 138543874;
    int v17 = v12;
    __int16 v18 = 2112;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add wallet key: %@", (uint8_t *)&v16, 0x20u);

    goto LABEL_6;
  }
}

- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling HomeDidUpdateNFCReaderKeyNotification", buf, 0x16u);
  }
  v11 = [(HMDHomeWalletKeyManager *)v7 home];
  __int16 v12 = [v11 nfcReaderKey];

  if (v12)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [(HMDHomeWalletKeyManager *)v7 updateWalletKeyWithReason:@"NFC reader key updated" flow:v5 completion:0];
    }
    else
    {
      __int16 v18 = [(HMDHomeWalletKeyManager *)v7 workQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke;
      v19[3] = &unk_264A2F820;
      v19[4] = v7;
      id v20 = v5;
      dispatch_async(v18, v19);
    }
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      int v17 = [v5 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling nfc reader key update because it set to nil on home", buf, 0x16u);
    }
  }
}

void __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_2;
  v3[3] = &unk_264A1A008;
  v3[4] = v2;
  id v4 = v1;
  [v2 autoAddWalletKeyWithReason:@"NFC reader key updated" flow:v4 completion:v3];
}

void __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    uint64_t v8 = [v6 domain];
    if (v8 == @"HMDHomeAutoAddWalletKeyErrorDomain")
    {
      if ([v6 code] == 3)
      {
        [*(id *)(a1 + 32) _replaceWalletKeyAfterHH2Migration];
        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v14 = [v6 domain];
    id v15 = v14;
    if (v14 == (void *)*MEMORY[0x263F0C710])
    {
      uint64_t v17 = [v6 code];

      if (v17 == 1)
      {
        __int16 v18 = (void *)MEMORY[0x230FBD990]();
        id v19 = *(id *)(a1 + 32);
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          uint64_t v22 = [*(id *)(a1 + 40) UUID];
          int v28 = 138543874;
          BOOL v29 = v21;
          __int16 v30 = 2112;
          v31 = v22;
          __int16 v32 = 2112;
          id v33 = v5;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key already exists: %@, when handling home did update nfc reader key", (uint8_t *)&v28, 0x20u);
        }
        uint64_t v16 = [*(id *)(a1 + 32) handleNFCReaderKeyUpdatedForWalletKey:v5 flow:*(void *)(a1 + 40)];
      }
    }
    else
    {
    }
    __int16 v23 = (void *)MEMORY[0x230FBD990](v16);
    id v24 = *(id *)(a1 + 32);
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = [*(id *)(a1 + 40) UUID];
      int v28 = 138543874;
      BOOL v29 = v26;
      __int16 v30 = 2112;
      v31 = v27;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when NFC reader key was updated: %@", (uint8_t *)&v28, 0x20u);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v13 = [*(id *)(a1 + 40) UUID];
      int v28 = 138543618;
      BOOL v29 = v12;
      __int16 v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when NFC reader key was updated", (uint8_t *)&v28, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
LABEL_18:
}

- (void)handleUserScheduleDidChangeNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 uuid];
  id v9 = [(HMDHomeWalletKeyManager *)self home];
  id v10 = [v9 currentUser];
  v11 = [v10 uuid];
  int v12 = HMFEqualObjects();

  if (v12)
  {
    int v13 = [MEMORY[0x263F42530] internalOnlyInitializer];
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      __int16 v18 = [v13 UUID];
      id v19 = [v7 uuid];
      *(_DWORD *)buf = 138543874;
      int v28 = v17;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      __int16 v31 = 2112;
      __int16 v32 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling user schedule did change for user: %@", buf, 0x20u);
    }
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [(HMDHomeWalletKeyManager *)v15 updateWalletKeyWithReason:@"user schedule changed" flow:v13 completion:0];
    }
    else
    {
      BOOL v20 = [(HMDHomeWalletKeyManager *)v15 canSuspendWalletKey];
      id v21 = [(HMDHomeWalletKeyManager *)v15 workQueue];
      if (v20)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke;
        block[3] = &unk_264A2F820;
        block[4] = v15;
        id v26 = v13;
        dispatch_async(v21, block);

        uint64_t v22 = v26;
      }
      else
      {
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_1232;
        v23[3] = &unk_264A2F820;
        v23[4] = v15;
        id v24 = v13;
        dispatch_async(v21, v23);

        uint64_t v22 = v24;
      }
    }
  }
}

uint64_t __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Suspending home key", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) updateWalletKeyStateToState:6 flow:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) auditExistingWalletKeysForDuplicatesWithFlow:*(void *)(a1 + 40)];
}

void __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_1232(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_2;
  v3[3] = &unk_264A1A008;
  v3[4] = v2;
  id v4 = v1;
  [v2 autoAddWalletKeyWithReason:@"user schedule changed" flow:v4 completion:v3];
}

void __67__HMDHomeWalletKeyManager_handleUserScheduleDidChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    int v8 = [v6 domain];
    id v9 = v8;
    if (v8 == (void *)*MEMORY[0x263F0C710])
    {
      uint64_t v15 = [v6 code];

      if (v15 == 1)
      {
        uint64_t v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = *(id *)(a1 + 32);
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          BOOL v20 = [*(id *)(a1 + 40) UUID];
          int v25 = 138543618;
          id v26 = v19;
          __int16 v27 = 2112;
          int v28 = v20;
          id v21 = "%{public}@[Flow: %@] Home key already exists in wallet";
          uint64_t v22 = v18;
          os_log_type_t v23 = OS_LOG_TYPE_INFO;
          uint32_t v24 = 22;
LABEL_12:
          _os_log_impl(&dword_22F52A000, v22, v23, v21, (uint8_t *)&v25, v24);
        }
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      BOOL v20 = [*(id *)(a1 + 40) UUID];
      int v25 = 138543874;
      id v26 = v19;
      __int16 v27 = 2112;
      int v28 = v20;
      __int16 v29 = 2112;
      id v30 = v6;
      id v21 = "%{public}@[Flow: %@] Failed to add home key with error: %@";
      uint64_t v22 = v18;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 32;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  __int16 v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    uint64_t v14 = [*(id *)(a1 + 40) UUID];
    int v25 = 138543618;
    id v26 = v13;
    __int16 v27 = 2112;
    int v28 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key", (uint8_t *)&v25, 0x16u);
  }
  [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
LABEL_14:
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [MEMORY[0x263F42530] internalOnlyInitializer];
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v9 UUID];
      uint64_t v15 = [v8 shortDescription];
      *(_DWORD *)buf = 138543874;
      int v28 = v13;
      __int16 v29 = 2112;
      id v30 = v14;
      __int16 v31 = 2112;
      __int16 v32 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling accessory removed: %@", buf, 0x20u);
    }
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [(HMDHomeWalletKeyManager *)v11 updateWalletKeyWithReason:@"accessory removed" flow:v9 completion:0];
    }
    else if ([(HMDHomeWalletKeyManager *)v11 canSuspendWalletKey])
    {
      uint64_t v16 = [(HMDHomeWalletKeyManager *)v11 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = v11;
      id v25 = v9;
      id v26 = v8;
      dispatch_async(v16, block);
    }
    else
    {
      id v17 = [(HMDHomeWalletKeyManager *)v11 passLibrary];
      __int16 v18 = [(HMDHomeWalletKeyManager *)v11 passSerialNumber];
      id v19 = [v17 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v18 flow:v9];

      if (v19)
      {
        BOOL v20 = [(HMDHomeWalletKeyManager *)v11 workQueue];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke_1228;
        v21[3] = &unk_264A2F820;
        id v22 = v8;
        os_log_type_t v23 = v11;
        dispatch_async(v20, v21);
      }
    }
  }
}

uint64_t __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] UUID];
    id v7 = [a1[6] shortDescription];
    int v9 = 138543874;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Suspending home key when accessory was removed: %@", (uint8_t *)&v9, 0x20u);
  }
  [a1[4] updateWalletKeyStateToState:6 flow:a1[5]];
  return [a1[4] auditExistingWalletKeysForDuplicatesWithFlow:a1[5]];
}

uint64_t __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke_1228(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) supportsAccessCode];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 updateWalletKeyAccessCodeFieldWithReason:@"accessory removed"];
  }
  return result;
}

- (void)handleAccessorySupportsWalleyKeyDidChangeNotification:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 home];
  int v9 = [(HMDHomeWalletKeyManager *)self home];

  if (v8 != v9)
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v8 uuid];
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v13;
      __int16 v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling wallet key support change for accessory in other home: %@", buf, 0x16u);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (([v7 supportsWalletKey] & 1) == 0)
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v7 shortDescription];
      __int16 v27 = [v7 supportsMatterWalletKey];
      [v27 BOOLValue];
      os_log_type_t v23 = HMFBooleanToString();
      [v7 supportsACWGProvisioning];
      HMFBooleanToString();
      uint32_t v24 = v28 = v10;
      [v7 supportsACWGUWB];
      id v25 = HMFBooleanToString();
      *(_DWORD *)buf = 138544386;
      uint64_t v34 = v21;
      __int16 v35 = 2112;
      v36 = v22;
      __int16 v37 = 2112;
      v38 = v23;
      __int16 v39 = 2112;
      v40 = v24;
      __int16 v41 = 2112;
      v42 = v25;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling wallet key support change, since support was disabled for accessory: %@, supportsMatterWalletKey: %@, supportsACWGProvisioning: %@, supportsACWGUWB: %@", buf, 0x34u);

      __int16 v10 = v28;
    }
    goto LABEL_16;
  }
  uint64_t v15 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = self;
  __int16 v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    BOOL v20 = [v15 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v19;
    __int16 v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling AccessorySupportsWalletKeyDidChangeNotification", buf, 0x16u);
  }
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    [(HMDHomeWalletKeyManager *)v17 updateWalletKeyWithReason:@"wallet key support added" syncDeviceKeyToAccessory:v7 flow:v15 completion:&__block_literal_global_1223];
  }
  else
  {
    id v26 = [(HMDHomeWalletKeyManager *)v17 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_2;
    block[3] = &unk_264A2E610;
    block[4] = v17;
    id v30 = v7;
    id v31 = v15;
    id v32 = v4;
    dispatch_async(v26, block);
  }
LABEL_17:
}

void __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_2(id *a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  id v35 = 0;
  char v3 = [v2 canAutoAddWalletKeyWithError:&v35];
  id v4 = v35;
  id v5 = v4;
  if (v3)
  {
    id v6 = a1[4];
    id v7 = a1[6];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_1224;
    v31[3] = &unk_264A1A7D0;
    v31[4] = v6;
    id v32 = v7;
    id v33 = a1[7];
    id v34 = a1[5];
    [v6 autoAddWalletKeyWithReason:@"wallet key support added" flow:v32 completion:v31];
  }
  else
  {
    id v8 = [v4 domain];
    if (v8 == @"HMDHomeAutoAddWalletKeyErrorDomain")
    {
      if ([v5 code] == 3)
      {
        [a1[4] _replaceWalletKeyAfterHH2Migration];
        goto LABEL_21;
      }
    }
    else
    {
    }
    if ([a1[5] wasUpdatedWithServiceType:@"00000266-0000-1000-8000-0026BB765291"]
      && ([a1[5] hasPostedBulletinForWalletKeyOnboarding] & 1) == 0)
    {
      uint64_t v15 = [a1[4] home];
      if ([v15 isAdminUser]
        && ([a1[4] dataSource],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 isWatch],
            v16,
            (v17 & 1) == 0))
      {
        uint32_t v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = a1[4];
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          __int16 v27 = HMFGetLogIdentifier();
          int v28 = [a1[6] UUID];
          __int16 v29 = [a1[5] shortDescription];
          *(_DWORD *)buf = 138543874;
          __int16 v37 = v27;
          __int16 v38 = 2112;
          __int16 v39 = v28;
          __int16 v40 = 2112;
          __int16 v41 = v29;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home hasn't onboarded, creating lock onboarding bulletin after accessory was updated with wallet key support: %@", buf, 0x20u);
        }
        [a1[5] updateHasPostedBulletinForWalletKeyOnboarding:1];
        id v30 = [a1[4] bulletinBoard];
        [v30 insertLockOnboardingBulletinForHome:v15 serviceType:@"00000266-0000-1000-8000-0026BB765291"];
      }
      else
      {
        __int16 v18 = (void *)MEMORY[0x230FBD990]();
        id v19 = a1[4];
        BOOL v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = HMFGetLogIdentifier();
          id v22 = [a1[6] UUID];
          os_log_type_t v23 = [a1[5] shortDescription];
          *(_DWORD *)buf = 138543874;
          __int16 v37 = v21;
          __int16 v38 = 2112;
          __int16 v39 = v22;
          __int16 v40 = 2112;
          __int16 v41 = v23;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not creating lock onboarding bulletin on non-admin or watch after accessory was updated with wallet key support: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      int v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = a1[4];
      __int16 v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        __int16 v13 = [a1[6] UUID];
        uint64_t v14 = [a1[5] shortDescription];
        *(_DWORD *)buf = 138543874;
        __int16 v37 = v12;
        __int16 v38 = 2112;
        __int16 v39 = v13;
        __int16 v40 = 2112;
        __int16 v41 = v14;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home hasn't onboarded, not handling wallet key support update for accessory: %@", buf, 0x20u);
      }
    }
  }
LABEL_21:
}

void __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_1224(id *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = [v6 domain];
    int v9 = v8;
    if (v8 != (void *)*MEMORY[0x263F0C710])
    {

LABEL_13:
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = a1[4];
      int v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        id v30 = [a1[5] UUID];
        id v31 = [a1[6] name];
        id v32 = [a1[7] shortDescription];
        int v33 = 138544386;
        id v34 = v29;
        __int16 v35 = 2112;
        v36 = v30;
        __int16 v37 = 2112;
        __int16 v38 = v31;
        __int16 v39 = 2112;
        __int16 v40 = v32;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key when handling notification: %@ for accessory %@:%@", (uint8_t *)&v33, 0x34u);
      }
      goto LABEL_16;
    }
    uint64_t v17 = [v6 code];

    if (v17 != 1) {
      goto LABEL_13;
    }
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1[4];
    BOOL v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [a1[5] UUID];
      os_log_type_t v23 = [a1[6] name];
      uint32_t v24 = [a1[7] shortDescription];
      int v33 = 138544130;
      id v34 = v21;
      __int16 v35 = 2112;
      v36 = v22;
      __int16 v37 = 2112;
      __int16 v38 = v23;
      __int16 v39 = 2112;
      __int16 v40 = v24;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home key already exists in wallet when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
    }
    [a1[4] syncDeviceCredentialKeyForAccessory:a1[7] paymentApplications:MEMORY[0x263EFFA68] flow:a1[5]];
    if ([a1[7] wasUpdatedWithServiceType:@"00000266-0000-1000-8000-0026BB765291"]
      && ([a1[7] hasPostedBulletinForWalletKeyOnboarding] & 1) == 0)
    {
      [a1[7] updateHasPostedBulletinForWalletKeyOnboarding:1];
      id v25 = [a1[4] bulletinBoard];
      [v25 insertWalletKeySupportAddedBulletinForAccessory:a1[7]];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1[4];
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [a1[5] UUID];
      uint64_t v15 = [a1[6] name];
      uint64_t v16 = [a1[7] shortDescription];
      int v33 = 138544130;
      id v34 = v13;
      __int16 v35 = 2112;
      v36 = v14;
      __int16 v37 = 2112;
      __int16 v38 = v15;
      __int16 v39 = 2112;
      __int16 v40 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
    }
    [a1[4] createExpressModeSetUpBulletin];
  }
LABEL_16:
}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"HMDNotificationAddedAccessoryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    if ([v8 supportsWalletKey])
    {
      int v9 = [MEMORY[0x263F42530] internalOnlyInitializer];
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = HMFGetLogIdentifier();
        uint64_t v14 = [v9 UUID];
        *(_DWORD *)buf = 138543618;
        id v26 = v13;
        __int16 v27 = 2112;
        int v28 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling accessory added", buf, 0x16u);
      }
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
      {
        [(HMDHomeWalletKeyManager *)v11 updateWalletKeyWithReason:@"accessory added" syncDeviceKeyToAccessory:v8 flow:v9 completion:&__block_literal_global_1218];
      }
      else
      {
        BOOL v20 = [(HMDHomeWalletKeyManager *)v11 workQueue];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_2;
        v21[3] = &unk_264A2E610;
        void v21[4] = v11;
        id v22 = v9;
        id v23 = v4;
        id v24 = v8;
        dispatch_async(v20, v21);
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __int16 v18 = HMFGetLogIdentifier();
        id v19 = [v8 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v26 = v18;
        __int16 v27 = 2112;
        int v28 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Added accessory does not support wallet key: %@", buf, 0x16u);
      }
    }
  }
}

void __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_2(uint64_t a1)
{
  char v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_3;
  v4[3] = &unk_264A1A7D0;
  v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 autoAddWalletKeyWithReason:@"accessory added" flow:v5 completion:v4];
}

void __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 domain];
  int v9 = v8;
  if (v8 == (void *)*MEMORY[0x263F0C710])
  {
    uint64_t v10 = [v6 code];

    if (v10 == 1)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = a1[4];
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = [a1[5] UUID];
        uint64_t v16 = [a1[6] name];
        uint64_t v17 = [a1[7] shortDescription];
        int v33 = 138544130;
        id v34 = v14;
        __int16 v35 = 2112;
        v36 = v15;
        __int16 v37 = 2112;
        __int16 v38 = v16;
        __int16 v39 = 2112;
        __int16 v40 = v17;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home key already exists in wallet when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
      }
      if ([a1[7] supportsAccessCode]) {
        [a1[4] updateWalletKeyAccessCodeFieldWithReason:@"accessory added"];
      }
      [a1[4] syncDeviceCredentialKeyForAccessory:a1[7] paymentApplications:MEMORY[0x263EFFA68] flow:a1[5]];
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (v6)
  {
    __int16 v18 = [v6 domain];
    if (v18 == @"HMDHomeAutoAddWalletKeyErrorDomain")
    {
      if ([v6 code] == 3)
      {
        [a1[4] _replaceWalletKeyAfterHH2Migration];
        goto LABEL_20;
      }
    }
    else
    {
    }
    id v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = a1[4];
    int v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      id v30 = [a1[5] UUID];
      id v31 = [a1[6] name];
      id v32 = [a1[7] shortDescription];
      int v33 = 138544386;
      id v34 = v29;
      __int16 v35 = 2112;
      v36 = v30;
      __int16 v37 = 2112;
      __int16 v38 = v31;
      __int16 v39 = 2112;
      __int16 v40 = v32;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key when handling notification: %@ for accessory %@:%@", (uint8_t *)&v33, 0x34u);
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1[4];
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [a1[5] UUID];
      id v24 = [a1[6] name];
      id v25 = [a1[7] shortDescription];
      int v33 = 138544130;
      id v34 = v22;
      __int16 v35 = 2112;
      v36 = v23;
      __int16 v37 = 2112;
      __int16 v38 = v24;
      __int16 v39 = 2112;
      __int16 v40 = v25;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
    }
    [a1[4] createExpressModeSetUpBulletin];
  }
LABEL_20:
}

- (void)handleHomeNameChangedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:@"home name changed" flow:0 completion:0];
  }
  else
  {
    id v8 = [MEMORY[0x263F42530] internalOnlyInitializer];
    int v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      __int16 v13 = [v8 UUID];
      *(_DWORD *)buf = 138543618;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home name changed notification", buf, 0x16u);
    }
    uint64_t v14 = [(HMDHomeWalletKeyManager *)v10 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v17 = v4;
    __int16 v18 = v10;
    id v19 = v8;
    id v15 = v8;
    dispatch_async(v14, block);
  }
}

void __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  char v3 = objc_msgSend(v2, "hmf_stringForKey:", @"HMDHomeNameNotificationKey");

  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke_2;
  int v9 = &unk_264A1A788;
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = v3;
  id v4 = v3;
  id v5 = _Block_copy(&v6);
  objc_msgSend(*(id *)(a1 + 40), "enqueueWalletKeyUpdateOperation:flow:", v5, *(void *)(a1 + 48), v6, v7, v8, v9, v10);
}

id __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if ([v3 state] == 6 || objc_msgSend(v3, "state") == 1)
  {
    id v5 = (void *)[v3 mutableCopy];
    [v5 setHomeName:*(void *)(a1 + 40)];
    [v5 setWalletKeyDescription:*(void *)(a1 + 40)];
    uint64_t v6 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)handleHomeWillBeRemoved
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!_os_feature_enabled_impl()
    || (isInternalBuild() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    id v3 = [(HMDHomeWalletKeyManager *)self home];
    if (v3)
    {
      [(HMDHomeWalletKeyManager *)self removeWalletKeyMigrationSettingsFileFromDisk];
      [(HMDHomeWalletKeyManager *)self setIsHomeBeingRemoved:1];
      id v4 = [MEMORY[0x263F42530] internalOnlyInitializer];
      id v5 = (void *)MEMORY[0x230FBD990]();
      uint64_t v6 = self;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v9 = [v4 UUID];
        int v14 = 138543874;
        id v15 = v8;
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v3;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home will be removed: %@", (uint8_t *)&v14, 0x20u);
      }
      [(HMDHomeWalletKeyManager *)v6 updateWalletKeyStateToState:10 flow:v4];
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        id v15 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home was nil in handleHomeWillBeRemoved", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)handleHomeWasRemoved
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    id v3 = [(HMDHomeWalletKeyManager *)self home];
    if (v3)
    {
      id v4 = [MEMORY[0x263F42530] internalOnlyInitializer];
      id v5 = (void *)MEMORY[0x230FBD990]();
      uint64_t v6 = self;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v9 = [v4 UUID];
        int v21 = 138543874;
        __int16 v22 = v8;
        __int16 v23 = 2112;
        uint64_t v24 = v9;
        __int16 v25 = 2112;
        id v26 = v3;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home was removed: %@", (uint8_t *)&v21, 0x20u);
      }
      uint64_t v10 = +[HMDPassUpdater shared];
      [v10 removeOrphanedPassesWithFlow:v4 completionHandler:&__block_literal_global_1206];

      id v11 = +[HMDPassUpdater shared];
      id v12 = [v3 uuid];
      [v11 removeOrphanedHomeKeyMiscInfoIncludingHomeUUID:v12 withFlow:v4 completionHandler:&__block_literal_global_1208_48321];

      __int16 v13 = (void *)MEMORY[0x230FBD990]([(HMDHomeWalletKeyManager *)v6 removeWalletKeyMigrationSettingsFileFromDisk]);
      int v14 = v6;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = HMFGetLogIdentifier();
        int v21 = 138543362;
        __int16 v22 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Resetting dismissed UWB onboarding flag and clearing client wallet key UUID", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      __int16 v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        int v21 = 138543362;
        __int16 v22 = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Home was nil in handleHomeWasRemoved", (uint8_t *)&v21, 0xCu);
      }
    }
  }
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4 = a3;
  if (!_os_feature_enabled_impl()
    || (isInternalBuild() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__HMDHomeWalletKeyManager_handleHomeUserRemovedNotification___block_invoke;
    v6[3] = &unk_264A2F820;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

void __61__HMDHomeWalletKeyManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"HMDUserNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 40);
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    int v17 = 138543874;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification user removed: %@", (uint8_t *)&v17, 0x20u);
  }
  id v12 = *(void **)(a1 + 40);
  __int16 v13 = [v5 uuid];
  int v14 = [v12 passSerialNumberWithUserUUID:v13];

  id v15 = [*(id *)(a1 + 40) passSerialNumber];
  int v16 = [v15 isEqual:v14];

  if (v16) {
    [*(id *)(a1 + 40) updateWalletKeyStateToState:10 flow:v6];
  }
  [*(id *)(a1 + 40) removeDuplicateWalletKeysForUser:v5 flow:v6];
}

- (void)handleLostModeManagerDidExitLostModeWithAuthCompleteNotification
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [v3 UUID];
    *(_DWORD *)buf = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    int v16 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification did exit lost mode with auth complete notification", buf, 0x16u);
  }
  int v9 = [(HMDHomeWalletKeyManager *)v5 workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__HMDHomeWalletKeyManager_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification__block_invoke;
  v11[3] = &unk_264A2F820;
  v11[4] = v5;
  id v12 = v3;
  id v10 = v3;
  dispatch_async(v9, v11);
}

uint64_t __91__HMDHomeWalletKeyManager_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification__block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 updateWalletKeyWithReason:@"Exited lost mode with auth" flow:v3 completion:0];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v5 updateWalletKeyStateToState:1 flow:v6];
  }
}

- (void)handleLostModeUpdated
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDHomeWalletKeyManager *)self lostModeManager];
  char v4 = [v3 isLost];

  id v5 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    id v11 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification lost mode updated to: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDHomeWalletKeyManager_handleLostModeUpdated__block_invoke;
  block[3] = &unk_264A2DFC8;
  char v16 = v4;
  void block[4] = v7;
  id v15 = v5;
  id v13 = v5;
  dispatch_async(v12, block);
}

uint64_t __48__HMDHomeWalletKeyManager_handleLostModeUpdated__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      id v2 = *(void **)(v1 + 32);
      uint64_t v3 = *(void *)(v1 + 40);
      return [v2 updateWalletKeyWithReason:@"Entered lost mode" flow:v3 completion:0];
    }
    else
    {
      char v4 = *(void **)(v1 + 32);
      uint64_t v5 = *(void *)(v1 + 40);
      return [v4 updateWalletKeyStateToState:7 flow:v5];
    }
  }
  return result;
}

- (void)handleApplicationUninstalled:(id)a3
{
  char v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 bundleIdentifier];

  id v8 = (id)*MEMORY[0x263F0C7A8];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:@"Home App was uninstalled" flow:0 completion:0];
    }
    else
    {
      id v10 = [(HMDHomeWalletKeyManager *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__HMDHomeWalletKeyManager_handleApplicationUninstalled___block_invoke;
      block[3] = &unk_264A2F7F8;
      void block[4] = self;
      dispatch_async(v10, block);
    }
  }
}

uint64_t __56__HMDHomeWalletKeyManager_handleApplicationUninstalled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyAccessCodeFieldWithReason:@"home app uninstalled"];
}

- (void)handleApplicationInstalled:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 bundleIdentifier];
  id v9 = (id)*MEMORY[0x263F0C7A8];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      id v11 = @"Home App was installed";
LABEL_14:
      [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:v11 flow:0 completion:0];
      goto LABEL_21;
    }
    int v14 = [MEMORY[0x263F42530] internalOnlyInitializer];
    id v15 = (void *)MEMORY[0x230FBD990]();
    char v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      __int16 v19 = [v14 UUID];
      *(_DWORD *)buf = 138543618;
      int v33 = v18;
      __int16 v34 = 2112;
      __int16 v35 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key because Home App was installed", buf, 0x16u);
    }
    uint64_t v20 = [(HMDHomeWalletKeyManager *)v16 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = v16;
    dispatch_async(v20, block);
  }
  else
  {
    id v12 = [v7 bundleIdentifier];
    int v13 = [v12 isEqualToString:@"com.apple.Passbook"];

    if (v13)
    {
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
      {
        id v11 = @"Wallet app installed";
        goto LABEL_14;
      }
      __int16 v21 = [MEMORY[0x263F42530] internalOnlyInitializer];
      id v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        id v26 = [v21 UUID];
        *(_DWORD *)buf = 138543618;
        int v33 = v25;
        __int16 v34 = 2112;
        __int16 v35 = v26;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Auto adding wallet key after wallet app installed", buf, 0x16u);
      }
      uint64_t v27 = [(HMDHomeWalletKeyManager *)v23 workQueue];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke_1191;
      v29[3] = &unk_264A2F820;
      v29[4] = v23;
      id v30 = v21;
      id v28 = v21;
      dispatch_async(v27, v29);
    }
  }
LABEL_21:
}

uint64_t __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyAccessCodeFieldWithReason:@"home app installed"];
}

uint64_t __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke_1191(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoAddWalletKeyWithFlow:*(void *)(a1 + 40)];
}

- (void)handleSystemInfoMigrationUpdatedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeWalletKeyManager *)self systemInfo];
  int v6 = [v5 isMigrating];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Not handling migration updated notification, migration is in progress", buf, 0xCu);
    }
  }
  else
  {
    id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDHomeWalletKeyManager_handleSystemInfoMigrationUpdatedNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

void __72__HMDHomeWalletKeyManager_handleSystemInfoMigrationUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Auto adding wallet key after device migration has finished", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) autoAddWalletKeyWithFlow:v2];
}

- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  id v7 = v6;

  int v8 = [v7 home];
  id v9 = [(HMDHomeWalletKeyManager *)self home];

  if (v8 == v9)
  {
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:@"accessory supports access code changed" flow:0 completion:0];
    }
    else
    {
      uint64_t v15 = [(HMDHomeWalletKeyManager *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__HMDHomeWalletKeyManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke;
      block[3] = &unk_264A2F7F8;
      void block[4] = self;
      dispatch_async(v15, block);
    }
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      int v14 = [v8 uuid];
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling access code support change for accessory in other home: %@", buf, 0x16u);
    }
  }
}

uint64_t __82__HMDHomeWalletKeyManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyAccessCodeFieldWithReason:@"supports access code changed"];
}

- (void)accessoryManager:(id)a3 didUpdateWalletKeyColor:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    int v8 = NSString;
    id v9 = HMHomeWalletKeyColorAsString();
    __int16 v10 = [v8 stringWithFormat:@"Wallet key color did update to %@", v9];
    [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:v10 flow:0 completion:0];
  }
  else
  {
    id v11 = [MEMORY[0x263F42530] internalOnlyInitializer];
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      char v16 = [v11 UUID];
      uint64_t v17 = HMHomeWalletKeyColorAsString();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      __int16 v25 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling wallet key color did update delegate callback: %@", buf, 0x20u);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HMDHomeWalletKeyManager_accessoryManager_didUpdateWalletKeyColor___block_invoke;
    aBlock[3] = &unk_264A1A760;
    aBlock[4] = v13;
    aBlock[5] = a4;
    __int16 v18 = _Block_copy(aBlock);
    [(HMDHomeWalletKeyManager *)v13 enqueueWalletKeyUpdateOperation:v18 flow:v11];
  }
}

id __68__HMDHomeWalletKeyManager_accessoryManager_didUpdateWalletKeyColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if ([v3 state] == 1)
  {
    uint64_t v5 = (void *)[v3 mutableCopy];
    [v5 setColor:*(void *)(a1 + 40)];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)passLibrary:(id)a3 didRemovePassWithSerialNumber:(id)a4 typeIdentifier:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  if (v12
    && [v9 isEqualToString:v12]
    && [v10 isEqualToString:@"paymentpass.com.apple.dev1"])
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message that home key was removed from wallet", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x263F42590] entitledMessageWithName:*MEMORY[0x263F0C810] messagePayload:0];
    id v18 = objc_alloc(MEMORY[0x263F42570]);
    __int16 v19 = [(HMDHomeWalletKeyManager *)v14 uuid];
    uint64_t v20 = (void *)[v18 initWithTarget:v19];

    [v17 setDestination:v20];
    [v17 setRequiresWalletKeyEntitlement];
    uint64_t v21 = [(HMDHomeWalletKeyManager *)v14 messageDispatcher];
    [v21 sendMessage:v17];

    __int16 v22 = [(HMDHomeWalletKeyManager *)v14 pendingUpdateWalletKeyOperations];
    [v22 removeAllObjects];

    uint64_t v23 = [(HMDHomeWalletKeyManager *)v14 home];
    __int16 v24 = [v23 nfcReaderKeyManager];
    __int16 v25 = [v24 accessoryManager];
    [v25 handleWalletKeyRemoved];
  }
}

- (void)passLibrary:(id)a3 didAddPassWithSerialNumber:(id)a4 typeIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  if (v12
    && [v9 isEqualToString:v12]
    && [v10 isEqualToString:@"paymentpass.com.apple.dev1"])
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = HMFGetLogIdentifier();
      int v34 = 138543362;
      __int16 v35 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message that home key was added in wallet", (uint8_t *)&v34, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x263F42590] entitledMessageWithName:*MEMORY[0x263F0C800] messagePayload:0];
    id v18 = objc_alloc(MEMORY[0x263F42570]);
    __int16 v19 = [(HMDHomeWalletKeyManager *)v14 uuid];
    uint64_t v20 = (void *)[v18 initWithTarget:v19];

    [v17 setDestination:v20];
    [v17 setRequiresWalletKeyEntitlement];
    uint64_t v21 = [(HMDHomeWalletKeyManager *)v14 messageDispatcher];
    [v21 sendMessage:v17];
  }
  __int16 v22 = [(HMDHomeWalletKeyManager *)self passLibrary];
  uint64_t v23 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
  __int16 v24 = [v22 walletKeyWithTypeIdentifier:v10 serialNumber:v9 flow:v23];

  if (v24)
  {
    __int16 v25 = [(HMDHomeWalletKeyManager *)self home];
    int v26 = [v25 nfcReaderKey];

    if (v26)
    {
      uint64_t v27 = [(HMDHomeWalletKeyManager *)self dataSource];
      uint64_t v28 = [v26 identifier];
      uint64_t v29 = objc_msgSend(v28, "hmf_hexadecimalRepresentation");
      [v27 persistNumberValueToNoBackupStore:0 withKey:v29];
    }
    else
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = self;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v33 = HMFGetLogIdentifier();
        int v34 = 138543362;
        __int16 v35 = v33;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not persisting settings because could not find reader key after pass was added", (uint8_t *)&v34, 0xCu);
      }
    }
  }
}

- (id)logIdentifier
{
  id v2 = [(HMDHomeWalletKeyManager *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)showExpressEnabledNotificationForWalletKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDHomeWalletKeyManager *)self dataSource];
  int v7 = [v6 isWatch];

  if (v7)
  {
    id v8 = [(HMDHomeWalletKeyManager *)self passLibrary];
    id v9 = [v4 typeIdentifier];
    id v10 = [v4 serialNumber];
    id v11 = [v8 passUniqueIDOfWalletKeyWithTypeIdentifier:v9 serialNumber:v10];

    if (v11)
    {
      uint64_t v12 = [(HMDHomeWalletKeyManager *)self dataSource];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __70__HMDHomeWalletKeyManager_showExpressEnabledNotificationForWalletKey___block_invoke;
      v17[3] = &unk_264A2F3E8;
      v17[4] = self;
      [v12 showExpressEnabledUserNotificationForWalletKeyWithPassUniqueID:v11 completion:v17];
    }
    else
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      int v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pass unique id of wallet key: %@", buf, 0x16u);
      }
    }
  }
}

void __70__HMDHomeWalletKeyManager_showExpressEnabledNotificationForWalletKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  int v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      id v9 = "%{public}@Failed to show express enabled user notification: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    int v14 = v8;
    id v9 = "%{public}@Successfully showed express enabled user notification";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)autoAddWalletKeyWithReason:(id)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  os_log_type_t v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint32_t v12 = (void *)MEMORY[0x230FBD990]();
  int v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    id v16 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    __int16 v39 = v15;
    __int16 v40 = 2112;
    __int16 v41 = v16;
    __int16 v42 = 2112;
    id v43 = v8;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Auto adding wallet key with reason: %@", buf, 0x20u);
  }
  uint64_t v17 = [(HMDHomeWalletKeyManager *)v13 home];
  id v18 = [v17 homeManager];
  __int16 v19 = [v18 homeUUIDsWithAutoAddWalletKeySuppressed];
  __int16 v20 = [v17 uuid];
  int v21 = [v19 containsObject:v20];

  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v13;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      int v26 = [v9 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v25;
      __int16 v40 = 2112;
      __int16 v41 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot auto add wallet key because it is suppressed", buf, 0x16u);
    }
    id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
LABEL_12:
    v10[2](v10, 0, v27);
    goto LABEL_13;
  }
  id v37 = 0;
  BOOL v28 = [(HMDHomeWalletKeyManager *)v13 canAutoAddWalletKeyWithError:&v37];
  id v27 = v37;
  if (!v28)
  {
    uint64_t v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = v13;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      int v33 = [v9 UUID];
      *(_DWORD *)buf = 138544130;
      __int16 v39 = v32;
      __int16 v40 = 2112;
      __int16 v41 = v33;
      __int16 v42 = 2112;
      id v43 = v8;
      __int16 v44 = 2112;
      id v45 = v27;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot auto add wallet key for reason: %@ with error: %@", buf, 0x2Au);
    }
    goto LABEL_12;
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke;
  v34[3] = &unk_264A23E20;
  v34[4] = v13;
  id v35 = v9;
  uint64_t v36 = v10;
  [(HMDHomeWalletKeyManager *)v13 fetchShouldSuppressWalletNotificationWithCompletion:v34];

LABEL_13:
}

void __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke(id *a1, char a2)
{
  id v4 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = a1[4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_2;
  v6[3] = &unk_264A1A738;
  void v6[4] = v5;
  char v9 = a2;
  id v7 = a1[5];
  id v8 = a1[6];
  [v5 fetchShouldAutoEnableExpressWithCompletion:v6];
}

void __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_3;
  v6[3] = &unk_264A22980;
  char v9 = *(unsigned char *)(a1 + 56);
  char v10 = a2;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);
}

uint64_t __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 57)) {
    uint64_t v1 = *(unsigned __int8 *)(a1 + 56) | 2;
  }
  else {
    uint64_t v1 = *(unsigned __int8 *)(a1 + 56);
  }
  return [*(id *)(a1 + 32) addWalletKeyWithOptions:v1 isOnboarding:0 flow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)handlePassUpdatedWithResult:(int64_t)a3 paymentApps:(id)a4 addedPaymentApps:(id)a5 pass:(id)a6 accessoryToSync:(id)a7 showSetupBulletinOnAdd:(BOOL)a8 showExpressBulletinOnAddForWatch:(BOOL)a9 error:(id)a10 flow:(id)a11
{
  BOOL v33 = a8;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  id v21 = a11;
  uint64_t v22 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v22);

  uint64_t v23 = [(HMDHomeWalletKeyManager *)self home];
  if (v23)
  {
    if (a3 != 2)
    {
      if ((objc_msgSend(v17, "hmf_isEmpty") & 1) == 0)
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __172__HMDHomeWalletKeyManager_handlePassUpdatedWithResult_paymentApps_addedPaymentApps_pass_accessoryToSync_showSetupBulletinOnAdd_showExpressBulletinOnAddForWatch_error_flow___block_invoke;
        v35[3] = &unk_264A1A710;
        v35[4] = self;
        id v36 = v21;
        objc_msgSend(v17, "na_each:", v35);
      }
      if (v19)
      {
        __int16 v24 = [(HMDHomeWalletKeyManager *)self deviceCredentialKeyForAccessory:v19 fromPaymentApplications:v17];

        if (!v24) {
          [(HMDHomeWalletKeyManager *)self syncDeviceCredentialKeyForAccessory:v19 paymentApplications:v16 flow:v21];
        }
      }
      id v25 = v16;
      int v26 = [[HMDHomeWalletKey alloc] initWithPKPass:v18 flow:v21];
      if (!a3)
      {
        if (a9) {
          [(HMDHomeWalletKeyManager *)self showExpressEnabledNotificationForWalletKey:v26];
        }
        if (v33) {
          [(HMDHomeWalletKeyManager *)self createExpressModeSetUpBulletin];
        }
      }

      id v16 = v25;
    }
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    BOOL v28 = self;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = id v32 = v27;
      [v21 UUID];
      v31 = id v34 = v16;
      *(_DWORD *)buf = 138543618;
      __int16 v38 = v30;
      __int16 v39 = 2112;
      __int16 v40 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home is nil", buf, 0x16u);

      id v16 = v34;
      id v27 = v32;
    }
  }
}

void __172__HMDHomeWalletKeyManager_handlePassUpdatedWithResult_paymentApps_addedPaymentApps_pass_accessoryToSync_showSetupBulletinOnAdd_showExpressBulletinOnAddForWatch_error_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 subcredentials];
  id v5 = [v4 anyObject];
  id v8 = [v5 transactionKey];

  uint64_t v6 = [v3 paymentType];
  if (v6 == 1004)
  {
    [*(id *)(a1 + 32) syncDeviceCredentialKey:v8 ofType:1 flow:*(void *)(a1 + 40)];
  }
  else if (v6 == 1003)
  {
    id v7 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v8];
    [*(id *)(a1 + 32) syncDeviceCredentialKey:v7 ofType:0 flow:*(void *)(a1 + 40)];
  }
}

- (void)updateWalletKeyWithReason:(id)a3 syncDeviceKeyToAccessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    int v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      [v12 UUID];
      id v18 = v10;
      v20 = id v19 = v11;
      *(_DWORD *)buf = 138543874;
      v53 = v17;
      __int16 v54 = 2112;
      v55 = v20;
      __int16 v56 = 2112;
      id v57 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating wallet key with reason: %@", buf, 0x20u);

      id v11 = v19;
      id v10 = v18;
    }
    id v21 = v12;
  }
  else
  {
    id v21 = [MEMORY[0x263F42530] internalOnlyInitializer];
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v45 = v13;
      int v26 = v25 = v11;
      id v27 = [v21 UUID];
      *(_DWORD *)buf = 138543874;
      v53 = v26;
      __int16 v54 = 2112;
      v55 = v27;
      __int16 v56 = 2112;
      id v57 = v10;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key with reason: %@", buf, 0x20u);

      id v11 = v25;
      id v13 = v45;
    }
  }
  BOOL v28 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  if (v28)
  {
    uint64_t v29 = [(HMDHomeWalletKeyManager *)self home];
    if (v29)
    {
      id v30 = +[HMDPassUpdater shared];
      id v31 = [(HMDHomeWalletKeyManager *)self uuid];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke;
      v48[3] = &unk_264A1A6E8;
      v48[4] = self;
      id v49 = v11;
      id v50 = v21;
      id v51 = v13;
      [v30 updatePassForHomeUUID:v31 isOnboarding:0 optionsNumber:0 flow:v50 completionHandler:v48];
    }
    else
    {
      id v47 = v11;
      __int16 v39 = (void *)MEMORY[0x230FBD990]();
      __int16 v40 = self;
      uint64_t v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v42 = v44 = v39;
        id v43 = [v21 UUID];
        *(_DWORD *)buf = 138543618;
        v53 = v42;
        __int16 v54 = 2112;
        v55 = v43;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Nil home", buf, 0x16u);

        __int16 v39 = v44;
      }

      id v11 = v47;
    }
  }
  else
  {
    id v32 = (void *)MEMORY[0x230FBD990]();
    BOOL v33 = self;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = HMFGetLogIdentifier();
      [v21 UUID];
      id v46 = v13;
      id v36 = v10;
      v38 = id v37 = v11;
      *(_DWORD *)buf = 138543618;
      v53 = v35;
      __int16 v54 = 2112;
      v55 = v38;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No pass serial number", buf, 0x16u);

      id v11 = v37;
      id v10 = v36;
      id v13 = v46;
    }
  }
}

void __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke_2;
  block[3] = &unk_264A1A6C0;
  uint64_t v29 = a2;
  id v16 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v25 = v16;
  id v26 = v14;
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v15, block);
}

void __94__HMDHomeWalletKeyManager_updateWalletKeyWithReason_syncDeviceKeyToAccessory_flow_completion___block_invoke_2(uint64_t a1)
{
  LOBYTE(v5) = 1;
  [*(id *)(a1 + 32) handlePassUpdatedWithResult:*(void *)(a1 + 96) paymentApps:*(void *)(a1 + 40) addedPaymentApps:*(void *)(a1 + 48) pass:*(void *)(a1 + 56) accessoryToSync:*(void *)(a1 + 64) showSetupBulletinOnAdd:1 showExpressBulletinOnAddForWatch:v5 error:*(void *)(a1 + 72) flow:*(void *)(a1 + 80)];
  uint64_t v2 = *(void *)(a1 + 72);
  id v3 = _Block_copy(*(const void **)(a1 + 88));
  if (v2)
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v4 = 3;
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v4 = *(void *)(a1 + 96);
  }
  id v6 = v3;
  (*((void (**)(void *, uint64_t, void))v3 + 2))(v3, v4, *(void *)(a1 + 72));
  id v3 = v6;
LABEL_7:
}

- (void)updateWalletKeyWithReason:(id)a3 flow:(id)a4 completion:(id)a5
{
}

- (void)fetchShouldAutoEnableExpressWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void))a3;
  uint64_t v4 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(HMDHomeWalletKeyManager *)self dataSource];
  char v6 = [v5 isWatch];

  if (v6)
  {
    id v7 = [(HMDHomeWalletKeyManager *)self dataSource];
    [v7 canNotifyAboutExpressModeWithCompletion:v8];
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)updateWalletKeyAccessCodeFieldWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key access code field with reason: %@", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDHomeWalletKeyManager_updateWalletKeyAccessCodeFieldWithReason___block_invoke;
  aBlock[3] = &unk_264A1A698;
  aBlock[4] = v8;
  id v12 = _Block_copy(aBlock);
  [(HMDHomeWalletKeyManager *)v8 enqueueWalletKeyUpdateOperation:v12 flow:v6];
}

id __68__HMDHomeWalletKeyManager_updateWalletKeyAccessCodeFieldWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if ([v3 state] == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 32) walletKeyByAddingAccessCodeToWalletKey:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)fetchShouldSuppressWalletNotificationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [(HMDHomeWalletKeyManager *)self dataSource];
  int v7 = [v6 isWatch];

  if (v7)
  {
    v4[2](v4, 1);
  }
  else
  {
    id v8 = [(HMDHomeWalletKeyManager *)self applicationRegistry];
    id v9 = (id)*MEMORY[0x263F0C7A8];
    id v10 = [v8 applicationInfoForBundleIdentifier:v9];

    if (v10)
    {
      id v11 = [(HMDHomeWalletKeyManager *)self bulletinBoard];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke;
      v12[3] = &unk_264A1A670;
      v12[4] = self;
      id v13 = v4;
      [v11 fetchAreUserNotificationsEnabledWithCompletion:v12];
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

void __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke_2;
  v5[3] = &unk_264A1B858;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)deviceCredentialKeyForAccessory:(id)a3 fromPaymentApplications:(id)a4
{
  id v5 = a4;
  if ([a3 supportsACWGProvisioning])
  {
    id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_1161);

    char v7 = [v6 subcredentials];
    id v8 = [v7 anyObject];
    id v9 = [v8 transactionKey];
  }
  else
  {
    id v10 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_1163);

    id v11 = [v10 subcredentials];
    id v12 = [v11 anyObject];
    id v6 = [v12 transactionKey];

    if (v6)
    {
      id v9 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v6];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

BOOL __83__HMDHomeWalletKeyManager_deviceCredentialKeyForAccessory_fromPaymentApplications___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 paymentType] == 1003;
}

BOOL __83__HMDHomeWalletKeyManager_deviceCredentialKeyForAccessory_fromPaymentApplications___block_invoke(uint64_t a1, void *a2)
{
  return [a2 paymentType] == 1004;
}

- (void)syncDeviceCredentialKeyForAccessory:(id)a3 paymentApplications:(id)a4 flow:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  id v13 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    [v13 UUID];
    __int16 v18 = v41 = v9;
    [v10 UUID];
    id v19 = v40 = v14;
    [v8 uuid];
    uint64_t v20 = v13;
    id v21 = v8;
    id v22 = v12;
    id v24 = v23 = v10;
    *(_DWORD *)buf = 138544130;
    id v51 = v17;
    __int16 v52 = 2112;
    v53 = v18;
    __int16 v54 = 2112;
    v55 = v19;
    __int16 v56 = 2112;
    id v57 = v24;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] Syncing device credential key to accessory: %@", buf, 0x2Au);

    id v10 = v23;
    id v12 = v22;
    id v8 = v21;
    id v13 = v20;

    id v14 = v40;
    id v9 = v41;
  }
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    id v25 = [(HMDHomeWalletKeyManager *)v15 deviceCredentialKeyForAccessory:v8 fromPaymentApplications:v9];
    if (v25)
    {
      id v26 = [(HMDHomeWalletKeyManager *)v15 home];
      id v27 = [v26 nfcReaderKeyManager];
      id v28 = [v27 accessoryManager];
      id v42 = v10;
      uint64_t v29 = [v8 supportsACWGProvisioning];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke;
      v47[3] = &unk_264A2E210;
      v47[4] = v15;
      id v48 = v13;
      id v49 = v8;
      uint64_t v30 = v29;
      id v10 = v42;
      [v28 configureAccessory:v49 withDeviceCredentialKey:v25 ofType:v30 flow:v48 completion:v47];
    }
    else
    {
      id v32 = (void *)MEMORY[0x230FBD990]();
      BOOL v33 = v15;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        [v13 UUID];
        v36 = id v43 = v10;
        [v8 uuid];
        id v37 = v13;
        __int16 v39 = v38 = v9;
        *(_DWORD *)buf = 138544130;
        id v51 = v35;
        __int16 v52 = 2112;
        v53 = v36;
        __int16 v54 = 2112;
        v55 = v39;
        __int16 v56 = 2112;
        id v57 = v38;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to find device credential key for accessory: %@ in payment applications: %@", buf, 0x2Au);

        id v9 = v38;
        id v13 = v37;

        id v10 = v43;
        id v25 = 0;
      }
    }
  }
  else
  {
    id v31 = [(HMDHomeWalletKeyManager *)v15 passLibrary];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1157;
    v44[3] = &unk_264A1A628;
    v44[4] = v15;
    id v45 = v13;
    id v46 = v8;
    [v31 fetchTransactionKeyForPassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 completion:v44];
  }
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [a1[5] UUID];
      id v10 = [a1[6] shortDescription];
      int v15 = 138544130;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      id v11 = "%{public}@[Flow: %@] Failed to configured accessory with device credential key %@:%@";
      id v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v15, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [a1[5] UUID];
    id v10 = [a1[6] shortDescription];
    int v15 = 138543874;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    id v11 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@";
    id v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 32;
    goto LABEL_6;
  }
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1157(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    char v7 = [a1[4] workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1158;
    v13[3] = &unk_264A2E610;
    v13[4] = a1[4];
    id v14 = a1[6];
    id v15 = v5;
    id v16 = a1[5];
    dispatch_async(v7, v13);
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch the transaction key: %@", buf, 0x20u);
    }
  }
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_1158(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 nfcReaderKeyManager];
  id v4 = [v3 accessoryManager];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:*(void *)(a1 + 48)];
  char v7 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_2;
  v8[3] = &unk_264A2E210;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 40);
  [v4 configureAccessory:v5 withDeviceCredentialKey:v6 ofType:0 flow:v9 completion:v8];
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_2(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [a1[5] UUID];
      id v10 = [a1[6] shortDescription];
      int v15 = 138544130;
      id v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      id v11 = "%{public}@[Flow: %@] Failed to configured accessory with device credential key %@:%@";
      id v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v15, v14);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [a1[5] UUID];
    id v10 = [a1[6] shortDescription];
    int v15 = 138543874;
    id v16 = v8;
    __int16 v17 = 2112;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    id v11 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@";
    id v12 = v7;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 32;
    goto LABEL_6;
  }
}

- (void)updateWalletKeyStateToState:(int64_t)a3 flow:(id)a4
{
  id v6 = a4;
  char v7 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMDHomeWalletKeyManager_updateWalletKeyStateToState_flow___block_invoke;
  aBlock[3] = &unk_264A1A600;
  id v11 = v6;
  int64_t v12 = a3;
  aBlock[4] = self;
  id v8 = v6;
  id v9 = _Block_copy(aBlock);
  [(HMDHomeWalletKeyManager *)self enqueueWalletKeyUpdateOperation:v9 flow:v8];
}

id __60__HMDHomeWalletKeyManager_updateWalletKeyStateToState_flow___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7 == 10 || v7 == 6)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int64_t v12 = HMFGetLogIdentifier();
      os_log_type_t v13 = [*(id *)(a1 + 40) UUID];
      uint64_t v14 = *(void *)(a1 + 48);
      int v26 = 138543874;
      id v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      __int16 v30 = 2048;
      uint64_t v31 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing home key from wallet since updated state is: %ld", (uint8_t *)&v26, 0x20u);
    }
    int v15 = 0;
    *a3 = 1;
  }
  else
  {
    uint64_t v17 = [v5 state];
    if (v17 == *(void *)(a1 + 48))
    {
      uint64_t v18 = v17;
      __int16 v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        uint64_t v23 = [*(id *)(a1 + 40) UUID];
        uint64_t v24 = *(void *)(a1 + 48);
        int v26 = 138544130;
        id v27 = v22;
        __int16 v28 = 2112;
        uint64_t v29 = v23;
        __int16 v30 = 2048;
        uint64_t v31 = v18;
        __int16 v32 = 2048;
        uint64_t v33 = v24;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not updating wallet key since existing wallet key state: %lu matches final state: %lu", (uint8_t *)&v26, 0x2Au);
      }
      int v15 = 0;
    }
    else
    {
      id v25 = (void *)[v5 mutableCopy];
      [v25 setState:*(void *)(a1 + 48)];
      int v15 = [*(id *)(a1 + 32) walletKeyByAddingAccessCodeToWalletKey:v25];
    }
  }

  return v15;
}

- (id)walletKeyByAddingAccessCodeToWalletKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDHomeWalletKeyManager *)self home];
  uint64_t v7 = (void *)[v4 mutableCopy];
  id v8 = [v6 currentUser];
  id v9 = [v8 accessCode];

  uint64_t v10 = [v4 state];
  if (v10 == 1 && v9 && ([v6 hasAnyAccessoryWithWalletKeyAndAccessCodeSupport] & 1) != 0)
  {
    [v7 setAccessCode:v9];
    uint64_t v11 = [(HMDHomeWalletKeyManager *)self applicationRegistry];
    id v12 = (id)*MEMORY[0x263F0C7A8];
    os_log_type_t v13 = [(id)v11 applicationInfoForBundleIdentifier:v12];

    uint64_t v14 = [(HMDHomeWalletKeyManager *)self dataSource];
    LOBYTE(v11) = [v14 isWatch];

    if ((v11 & 1) == 0 && v13)
    {
      int v15 = [NSURL URLWithString:@"com.apple.Home-private://userLockSettings"];
      id v16 = [v6 contextSPIUniqueIdentifier];
      uint64_t v17 = [v16 UUIDString];
      uint64_t v18 = [v15 URLByAppendingPathComponent:v17];

      [v7 setChangeAccessCodeHomeAppCustomURL:v18];
      goto LABEL_9;
    }
  }
  else
  {
    [v7 setAccessCode:0];
  }
  [v7 setChangeAccessCodeHomeAppCustomURL:0];
LABEL_9:
  __int16 v19 = (void *)[v7 copy];

  return v19;
}

- (id)passSerialNumberWithUserUUID:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E390];
  id v5 = a3;
  id v6 = [(HMDHomeWalletKeyManager *)self uuid];
  uint64_t v7 = [v4 passSerialNumberWithHomeUUID:v6 userUUID:v5];

  return v7;
}

- (id)paymentApplicationsForWalletKey:(id)a3 validateNFCInfo:(BOOL)a4 defaultPaymentApplication:(id)a5 doesAnyAccessorySupportACB:(BOOL)a6 flow:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  int v15 = [v12 nfcInfos];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke;
  v21[3] = &unk_264A1A5D8;
  BOOL v25 = a4;
  void v21[4] = self;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  BOOL v26 = a6;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  __int16 v19 = objc_msgSend(v15, "na_map:", v21);

  return v19;
}

id __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 64))
  {
LABEL_6:
    id v9 = (void *)[*(id *)(a1 + 48) mutableCopy];
    uint64_t v10 = [v4 paymentCredentialType];
    uint64_t v11 = @"Aliro";
    if (v10 != 1) {
      uint64_t v11 = 0;
    }
    if (v10) {
      id v12 = v11;
    }
    else {
      id v12 = @"UnifiedAccess";
    }
    [v9 setObject:v12 forKeyedSubscript:@"paymentType"];
    id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
    [v9 setObject:v13 forKeyedSubscript:@"state"];

    id v14 = [v4 secureElementIdentifier];
    [v9 setObject:v14 forKeyedSubscript:@"secureElementIdentifier"];

    int v15 = [v4 applicationIdentifier];
    [v9 setObject:v15 forKeyedSubscript:@"applicationIdentifier"];

    id v16 = [*(id *)(a1 + 56) serialNumber];
    [v9 setObject:v16 forKeyedSubscript:@"DPANIdentifier"];

    id v17 = [*(id *)(a1 + 56) serialNumber];
    id v18 = [*(id *)(a1 + 56) serialNumber];
    __int16 v19 = objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v18, "length") - 4);
    [v9 setObject:v19 forKeyedSubscript:@"DPANSuffix"];

    id v20 = [MEMORY[0x263EFF9A0] dictionary];
    __int16 v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
    [v20 setObject:v21 forKeyedSubscript:@"state"];

    id v22 = [v4 subCredentialIdentifier];
    [v20 setObject:v22 forKeyedSubscript:@"identifier"];

    id v23 = [v4 pairedReaderIdentifier];
    [v20 setObject:v23 forKeyedSubscript:@"pairedReaderIdentifier"];

    id v24 = [v9 objectForKeyedSubscript:@"automaticSelectionCriteria"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v25 = v24;
    }
    else {
      BOOL v25 = 0;
    }
    id v26 = v25;

    id v27 = [v26 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v28 = v27;
    }
    else {
      __int16 v28 = 0;
    }
    id v29 = v28;

    if (!v29)
    {
      id v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = *(id *)(a1 + 32);
      __int16 v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v41 = HMFGetLogIdentifier();
        id v42 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        __int16 v71 = @"automaticSelectionCriteria";
        __int16 v72 = 2112;
        __int16 v73 = v9;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Automatic selection criteria key: %@ does not exist in payment application: %@", buf, 0x2Au);
      }
      id v43 = 0;
      goto LABEL_47;
    }
    id v63 = [v4 pairedReaderIdentifier];
    if (v63)
    {
      __int16 v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 32);
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        uint64_t v34 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        __int16 v71 = v63;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting paired reader identifier in automatic selection criteria: %@", buf, 0x20u);
      }
      id v35 = (void *)[v29 mutableCopy];
      __int16 v69 = v63;
      id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
      [v35 setObject:v36 forKeyedSubscript:@"readerIDs"];

      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
      {
        uint64_t v37 = [v4 paymentCredentialType];
        if (v37 == 1)
        {
          [v35 setObject:&unk_26E473F48 forKeyedSubscript:@"tcis"];
          v53 = *(unsigned char *)(a1 + 65) ? &unk_26E471050 : &unk_26E471038;
          [v20 setObject:v53 forKeyedSubscript:@"allSupportedRadioTechnologies"];
          [v20 setObject:@"aliro" forKeyedSubscript:@"isoFormat"];
        }
        else if (!v37)
        {
          [v35 setObject:&unk_26E473F30 forKeyedSubscript:@"tcis"];
          [v20 setObject:&unk_26E471038 forKeyedSubscript:@"allSupportedRadioTechnologies"];
        }
        if ([v4 paymentCredentialType] == 1)
        {
          v62 = [MEMORY[0x263EFF980] array];
          __int16 v54 = [MEMORY[0x263EFF980] array];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v71) = 0;
          v55 = [*(id *)(a1 + 32) home];
          __int16 v56 = [v55 backingStore];
          id v57 = [v56 context];
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_1118;
          v64[3] = &unk_264A2F078;
          uint64_t v58 = *(void **)(a1 + 40);
          v64[4] = *(void *)(a1 + 32);
          v64[5] = v54;
          __int16 v67 = buf;
          id v65 = v58;
          v66 = v62;
          [v57 unsafeSynchronousBlock:v64];

          int v59 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
          if (*(unsigned char *)(*(void *)&buf[8] + 24))
          {

            _Block_object_dispose(buf, 8);
LABEL_43:

            id v43 = 0;
LABEL_46:

LABEL_47:
            goto LABEL_48;
          }
          [v35 setObject:v62 forKeyedSubscript:@"associatedReaderIDs"];
          [v20 setObject:v54 forKeyedSubscript:@"aliroGroupResolvingKeys"];

          _Block_object_dispose(buf, 8);
          if (v59) {
            goto LABEL_43;
          }
        }
      }
      v68 = v35;
      id v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
      [v9 setObject:v60 forKeyedSubscript:@"automaticSelectionCriteria"];
    }
    [v9 setObject:v20 forKeyedSubscript:@"subcredential"];
    id v43 = v9;
    goto LABEL_46;
  }
  id v5 = [v3 applicationIdentifier];
  if (v5)
  {
    id v6 = [v4 secureElementIdentifier];
    if (v6)
    {
      uint64_t v7 = [v4 subCredentialIdentifier];
      if (v7)
      {
        id v8 = [v4 pairedReaderIdentifier];

        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_32;
      }
    }
  }
LABEL_32:
  __int16 v44 = (void *)MEMORY[0x230FBD990]();
  id v45 = *(id *)(a1 + 32);
  id v46 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    id v47 = HMFGetLogIdentifier();
    id v48 = [*(id *)(a1 + 40) UUID];
    id v49 = [v4 applicationIdentifier];
    id v50 = [v4 secureElementIdentifier];
    id v51 = [v4 subCredentialIdentifier];
    __int16 v52 = [v4 pairedReaderIdentifier];
    *(_DWORD *)buf = 138544642;
    *(void *)&uint8_t buf[4] = v47;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2112;
    __int16 v71 = v49;
    __int16 v72 = 2112;
    __int16 v73 = v50;
    __int16 v74 = 2112;
    uint64_t v75 = v51;
    __int16 v76 = 2112;
    v77 = v52;
    _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pass JSON because critical NFC Info is missing. applicationIdentifier: %@, secureElementIdentifier: %@, subCredentialIdentifier: %@, pairedReaderIdentifier: %@", buf, 0x3Eu);
  }
  id v43 = 0;
LABEL_48:

  return v43;
}

void __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_1118(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [v4 matCredGRK];
  id v6 = objc_msgSend(v5, "hmf_hexadecimalRepresentation");

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = [v4 matCredGRK];
    id v9 = objc_msgSend(v8, "hmf_hexadecimalRepresentation");
    [v7 addObject:v9];

    uint64_t v10 = [v4 accessories];
    uint64_t v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_1122);
    id v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_1125);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_3;
    v20[3] = &unk_264A1A5B0;
    v20[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    id v21 = v13;
    uint64_t v22 = v14;
    uint64_t v23 = *(void *)(a1 + 40);
    objc_msgSend(v12, "na_each:", v20);
  }
  else
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      __int16 v19 = [*(id *)(a1 + 48) UUID];
      *(_DWORD *)buf = 138543618;
      BOOL v25 = v18;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] matCredGRK is nil", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

void __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 preexistingMatCredRGI];
  id v5 = [v3 preexistingMatCredRPK];
  uint64_t v6 = [v3 preexistingMatCredGRK];
  uint64_t v7 = (void *)v6;
  if (v4 && v5 && v6)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      [v3 modelID];
      id v13 = v21 = v8;
      *(_DWORD *)buf = 138544642;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      uint64_t v33 = v13;
      __int16 v34 = 2112;
      id v35 = v4;
      __int16 v36 = 2112;
      uint64_t v37 = v5;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting ACWG data from other fabrics for accessory: %@, preexistingMatCredRGI: %@, preexistingMatCredRPK: %@, preexistingMatCredGRK: %@", buf, 0x3Eu);

      id v8 = v21;
    }

    uint64_t v22 = *(void **)(a1 + 48);
    v26[0] = @"readerID";
    uint64_t v14 = objc_msgSend(v4, "hmf_hexadecimalRepresentation");
    v27[0] = v14;
    v27[1] = &unk_26E471068;
    v26[1] = @"priority";
    v26[2] = @"readerCAs";
    v23[0] = @"scheme";
    v23[1] = @"publicKey";
    v24[0] = @"secp256r1";
    int v15 = objc_msgSend(v5, "hmf_hexadecimalRepresentation");
    v24[1] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    BOOL v25 = v16;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v27[2] = v17;
    id v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v22 addObject:v18];

    __int16 v19 = *(void **)(a1 + 56);
    id v20 = objc_msgSend(v7, "hmf_hexadecimalRepresentation");
    [v19 addObject:v20];
  }
}

BOOL __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 preexistingMatCredRGI];
  BOOL v3 = v2 != 0;

  return v3;
}

id __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke_1119(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26E55CBD8]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)updatePassJSONAtURL:(id)a3 withWalletKey:(id)a4 options:(int64_t)a5 validateNFCInfo:(BOOL)a6 flow:(id)a7
{
  BOOL v8 = a6;
  uint64_t v149 = *MEMORY[0x263EF8340];
  v114 = (__CFString *)a3;
  id v12 = (__CFString *)a4;
  id v113 = a7;
  id v13 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    id v18 = [v113 UUID];
    __int16 v19 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    id v138 = v17;
    __int16 v139 = 2112;
    v140 = v18;
    __int16 v141 = 2112;
    v142 = v114;
    __int16 v143 = 2112;
    v144 = v12;
    __int16 v145 = 2048;
    int64_t v146 = a5;
    __int16 v147 = 2112;
    v148 = v19;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating pass JSON at URL: %@, withWalletKey: %@, options: %ld, validateNFCInfo: %@", buf, 0x3Eu);
  }
  id v20 = [(HMDHomeWalletKeyManager *)v15 fileManager];
  id v121 = 0;
  v112 = [v20 JSONObjectWithURL:v114 error:&v121];
  v111 = (__CFString *)v121;

  if (v112)
  {
    id v21 = v112;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = v22;

    id v24 = (__CFString *)[(__CFString *)v23 mutableCopy];
    if (v24)
    {
      BOOL v25 = [NSNumber numberWithBool:a5 & 1];
      [(__CFString *)v24 setObject:v25 forKeyedSubscript:@"muteReadyForUseNotification"];

      __int16 v26 = [(__CFString *)v12 serialNumber];
      [(__CFString *)v24 setObject:v26 forKeyedSubscript:@"serialNumber"];

      id v27 = [(__CFString *)v12 typeIdentifier];
      [(__CFString *)v24 setObject:v27 forKeyedSubscript:@"passTypeIdentifier"];

      uint64_t v28 = [(__CFString *)v12 walletKeyDescription];
      [(__CFString *)v24 setObject:v28 forKeyedSubscript:@"description"];

      [(__CFString *)v24 setObject:@"appleHomeKey" forKeyedSubscript:@"liveRenderType"];
      id v29 = [(__CFString *)v12 passColorValue];
      [(__CFString *)v24 setObject:v29 forKeyedSubscript:@"homeKeyLiveType"];

      __int16 v30 = [(__CFString *)v12 labelColorValue];
      [(__CFString *)v24 setObject:v30 forKeyedSubscript:@"foregroundColor"];

      id v31 = [(__CFString *)v21 objectForKeyedSubscript:@"paymentApplications"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v32 = v31;
      }
      else {
        __int16 v32 = 0;
      }
      id v109 = v32;

      uint64_t v33 = [v109 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v34 = v33;
      }
      else {
        __int16 v34 = 0;
      }
      id v35 = v34;

      v110 = (void *)[v35 mutableCopy];
      if (v110)
      {
        uint64_t v117 = 0;
        v118 = &v117;
        uint64_t v119 = 0x2020000000;
        char v120 = 0;
        __int16 v36 = [(HMDHomeWalletKeyManager *)v15 home];
        uint64_t v37 = [v36 backingStore];
        __int16 v38 = [v37 context];
        v116[0] = MEMORY[0x263EF8330];
        v116[1] = 3221225472;
        v116[2] = __90__HMDHomeWalletKeyManager_updatePassJSONAtURL_withWalletKey_options_validateNFCInfo_flow___block_invoke;
        v116[3] = &unk_264A2F0A0;
        v116[4] = v15;
        v116[5] = &v117;
        [v38 unsafeSynchronousBlock:v116];

        id v39 = (void *)MEMORY[0x230FBD990]();
        uint64_t v40 = v15;
        HMFGetOSLogHandle();
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          id v43 = [v113 UUID];
          HMFBooleanToString();
          __int16 v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v138 = v42;
          __int16 v139 = 2112;
          v140 = v43;
          __int16 v141 = 2112;
          v142 = v44;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] doesAnyAccessorySupportACB: %@", buf, 0x20u);
        }
        id v45 = [(HMDHomeWalletKeyManager *)v40 paymentApplicationsForWalletKey:v12 validateNFCInfo:v8 defaultPaymentApplication:v110 doesAnyAccessorySupportACB:*((unsigned __int8 *)v118 + 24) flow:v113];
        id v46 = v45;
        if (v45 && !objc_msgSend(v45, "hmf_isEmpty"))
        {
          [(__CFString *)v24 setObject:v46 forKeyedSubscript:@"paymentApplications"];
          v68 = [(__CFString *)v21 objectForKeyedSubscript:@"paymentCard"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v69 = v68;
          }
          else {
            __int16 v69 = 0;
          }
          id v70 = v69;

          v108 = (void *)[v70 mutableCopy];
          if (v108)
          {
            __int16 v71 = [(__CFString *)v12 homeName];

            if (v71)
            {
              v134[1] = @"value";
              v135[0] = @"homeName";
              v134[0] = @"key";
              __int16 v72 = [(__CFString *)v12 homeName];
              v135[1] = v72;
              __int16 v73 = [NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:2];
              v136 = v73;
              __int16 v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
              [v108 setObject:v74 forKeyedSubscript:@"headerFields"];
            }
            v107 = [MEMORY[0x263EFF980] array];
            v106 = [MEMORY[0x263EFF980] array];
            uint64_t v75 = [(__CFString *)v12 accessCode];

            if (v75)
            {
              v132[0] = @"key";
              v132[1] = @"label";
              v133[0] = @"arbitrary_supplementary_field_accessCode";
              v133[1] = @"ACCESS_CODE";
              v132[2] = @"value";
              __int16 v76 = [(__CFString *)v12 accessCode];
              v133[2] = v76;
              v77 = [NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:3];
              [v106 addObject:v77];

              [v107 addObject:@"arbitrary_supplementary_field_accessCode"];
            }
            uint64_t v78 = [(__CFString *)v12 changeAccessCodeHomeAppCustomURL];

            if (v78)
            {
              v130[0] = @"key";
              v130[1] = @"value";
              v131[0] = @"arbitrary_supplementary_field_changeAccessCode";
              v131[1] = @"CHANGE_ACCESS_CODE_BUTTON";
              v130[2] = @"link";
              v79 = [(__CFString *)v12 changeAccessCodeHomeAppCustomURL];
              v80 = [v79 absoluteString];
              v131[2] = v80;
              v81 = [NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:3];
              [v106 addObject:v81];

              [v107 addObject:@"arbitrary_supplementary_field_changeAccessCode"];
            }
            if ([v107 count])
            {
              v128[0] = @"key";
              v128[1] = @"label";
              v129[0] = @"arbitrary_supplementary_field_personalPinCode";
              v129[1] = @"PERSONAL_PIN_CODE";
              v128[2] = @"link";
              v129[2] = @"wallet://card/card-id/sections?sections=access_code&authenticationRequirment=deviceOwner&title=PERSONAL_PIN_CODE_TITLE";
              v82 = [NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:3];
              [v106 addObject:v82];

              v83 = (void *)[v106 copy];
              [v108 setObject:v83 forKeyedSubscript:@"backFields"];

              v124 = @"arbitrary_supplementary_field_personalPinCode";
              v125 = @"rows";
              v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v124 count:1];
              v126 = v84;
              v85 = [NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
              v127[0] = v85;
              v122[0] = @"rows";
              v86 = (void *)[v107 copy];
              v123[0] = v86;
              v123[1] = MEMORY[0x263EFFA88];
              v122[1] = @"hidden";
              v122[2] = @"identifier";
              v123[2] = @"access_code";
              v87 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:3];
              v127[1] = v87;
              v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:2];
              [v108 setObject:v88 forKeyedSubscript:@"passDetailSections"];
            }
            [(__CFString *)v24 setObject:v108 forKeyedSubscript:@"paymentCard"];
            v89 = [(HMDHomeWalletKeyManager *)v40 fileManager];
            v115 = v111;
            char v90 = [v89 writeJSONObject:v24 toURL:v114 error:&v115];
            v91 = v115;

            v92 = (void *)MEMORY[0x230FBD990]();
            v93 = v40;
            if (v90)
            {
              HMFGetOSLogHandle();
              v94 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v95 = (id)objc_claimAutoreleasedReturnValue();
                v96 = [v113 UUID];
                *(_DWORD *)buf = 138544130;
                id v138 = v95;
                __int16 v139 = 2112;
                v140 = v96;
                __int16 v141 = 2112;
                v142 = v24;
                __int16 v143 = 2112;
                v144 = v114;
                _os_log_impl(&dword_22F52A000, v94, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wrote pass JSON dict: %@, to URL: %@", buf, 0x2Au);
              }
              __int16 v52 = (void *)[(__CFString *)v24 copy];
            }
            else
            {
              HMFGetOSLogHandle();
              v102 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v103 = (id)objc_claimAutoreleasedReturnValue();
                v104 = [v113 UUID];
                *(_DWORD *)buf = 138544130;
                id v138 = v103;
                __int16 v139 = 2112;
                v140 = v104;
                __int16 v141 = 2112;
                v142 = v114;
                __int16 v143 = 2112;
                v144 = v91;
                _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write pass JSON dict to URL %@:%@", buf, 0x2Au);
              }
              __int16 v52 = 0;
            }

            v111 = v91;
          }
          else
          {
            v97 = (void *)MEMORY[0x230FBD990]();
            v98 = v40;
            HMFGetOSLogHandle();
            v99 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v100 = (id)objc_claimAutoreleasedReturnValue();
              v101 = [v113 UUID];
              *(_DWORD *)buf = 138544130;
              id v138 = v100;
              __int16 v139 = 2112;
              v140 = v101;
              __int16 v141 = 2112;
              v142 = @"paymentCard";
              __int16 v143 = 2112;
              v144 = v21;
              _os_log_impl(&dword_22F52A000, v99, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Key payment card does not exist in pass json %@:%@", buf, 0x2Au);
            }
            __int16 v52 = 0;
          }
        }
        else
        {
          id v47 = (void *)MEMORY[0x230FBD990]();
          id v48 = v40;
          HMFGetOSLogHandle();
          id v49 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            id v51 = [v113 UUID];
            *(_DWORD *)buf = 138543618;
            id v138 = v50;
            __int16 v139 = 2112;
            v140 = v51;
            _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not create any payment applications", buf, 0x16u);
          }
          __int16 v52 = 0;
        }

        _Block_object_dispose(&v117, 8);
      }
      else
      {
        id v63 = (void *)MEMORY[0x230FBD990]();
        id v64 = v15;
        id v65 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          v66 = HMFGetLogIdentifier();
          __int16 v67 = [v113 UUID];
          *(_DWORD *)buf = 138544130;
          id v138 = v66;
          __int16 v139 = 2112;
          v140 = v67;
          __int16 v141 = 2112;
          v142 = @"paymentApplications";
          __int16 v143 = 2112;
          v144 = v24;
          _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Payment application key: %@ does not exist in pass json: %@", buf, 0x2Au);
        }
        __int16 v52 = 0;
      }
    }
    else
    {
      uint64_t v58 = (void *)MEMORY[0x230FBD990]();
      int v59 = v15;
      id v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        id v61 = HMFGetLogIdentifier();
        v62 = [v113 UUID];
        *(_DWORD *)buf = 138543874;
        id v138 = v61;
        __int16 v139 = 2112;
        v140 = v62;
        __int16 v141 = 2112;
        v142 = v21;
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] passJSONObject is not of type NSDictionary: %@", buf, 0x20u);
      }
      __int16 v52 = 0;
    }
  }
  else
  {
    v53 = (void *)MEMORY[0x230FBD990]();
    __int16 v54 = v15;
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      __int16 v56 = HMFGetLogIdentifier();
      id v57 = [v113 UUID];
      *(_DWORD *)buf = 138544130;
      id v138 = v56;
      __int16 v139 = 2112;
      v140 = v57;
      __int16 v141 = 2112;
      v142 = v114;
      __int16 v143 = 2112;
      v144 = v111;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to load pass json at URL %@:%@", buf, 0x2Au);
    }
    __int16 v52 = 0;
  }

  return v52;
}

void __90__HMDHomeWalletKeyManager_updatePassJSONAtURL_withWalletKey_options_validateNFCInfo_flow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  BOOL v3 = [v2 uuid];
  id v5 = +[HMCContext findHomeWithModelID:v3];

  id v4 = [v5 accessories];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "na_any:", &__block_literal_global_340);
}

uint64_t __90__HMDHomeWalletKeyManager_updatePassJSONAtURL_withWalletKey_options_validateNFCInfo_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26E55CBD8]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 supportsMatCredACB];
    uint64_t v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)createPassDirectoryWithWalletKey:(id)a3 options:(int64_t)a4 shouldSkipResourceFiles:(BOOL)a5 shouldCreateZipArchive:(BOOL)a6 validateNFCInfo:(BOOL)a7 flow:(id)a8 completion:(id)a9
{
  LODWORD(v40) = a7;
  HIDWORD(v40) = a6;
  BOOL v10 = a5;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v13 = a8;
  id v41 = a9;
  uint64_t v14 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  int v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    __int16 v19 = [v13 UUID];
    id v20 = HMFBooleanToString();
    id v21 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    __int16 v52 = v18;
    __int16 v53 = 2112;
    __int16 v54 = v19;
    __int16 v55 = 2112;
    id v56 = v42;
    __int16 v57 = 2048;
    int64_t v58 = a4;
    __int16 v59 = 2112;
    id v60 = v20;
    __int16 v61 = 2112;
    v62 = v21;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory with wallet key: %@, options: %ld, shouldSkipResourceFiles: %@, shouldCreateZipArchive: %@", buf, 0x3Eu);
  }
  if (v10) {
    [(HMDHomeWalletKeyManager *)v16 createPassDirectoryWithoutResourceFilesWithFlow:v13];
  }
  else {
  uint64_t v22 = [(HMDHomeWalletKeyManager *)v16 createPassDirectoryWithResourceFilesWithFlow:v13];
  }
  uint64_t v23 = v22;
  if (v22)
  {
    id v24 = [v22 URLByAppendingPathComponent:@"pass.json"];
    BOOL v25 = [(HMDHomeWalletKeyManager *)v16 updatePassJSONAtURL:v24 withWalletKey:v42 options:a4 validateNFCInfo:v40 flow:v13];
    if (v25)
    {
      objc_initWeak((id *)buf, v16);
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __147__HMDHomeWalletKeyManager_createPassDirectoryWithWalletKey_options_shouldSkipResourceFiles_shouldCreateZipArchive_validateNFCInfo_flow_completion___block_invoke;
      v43[3] = &unk_264A1A528;
      objc_copyWeak(&v48, (id *)buf);
      id v47 = v41;
      char v49 = BYTE4(v40);
      id v44 = v23;
      id v45 = v25;
      id v46 = v13;
      [(HMDHomeWalletKeyManager *)v16 addISOCredentialWithPassAtURL:v44 walletKey:v42 flow:v46 completion:v43];

      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
      id v26 = 0;
    }
    else
    {
      id v27 = (void *)MEMORY[0x230FBD990]();
      uint64_t v28 = v16;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = HMFGetLogIdentifier();
        id v31 = [v13 UUID];
        *(_DWORD *)buf = 138543874;
        __int16 v52 = v30;
        __int16 v53 = 2112;
        __int16 v54 = v31;
        __int16 v55 = 2112;
        id v56 = v24;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pass JSON at URL: %@", buf, 0x20u);
      }
      __int16 v32 = [(HMDHomeWalletKeyManager *)v28 fileManager];
      id v50 = 0;
      char v33 = [v32 removeItemAtURL:v23 error:&v50];
      id v26 = v50;

      if ((v33 & 1) == 0)
      {
        __int16 v34 = (void *)MEMORY[0x230FBD990]();
        id v35 = v28;
        __int16 v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          __int16 v38 = [v13 UUID];
          *(_DWORD *)buf = 138544130;
          __int16 v52 = v37;
          __int16 v53 = 2112;
          __int16 v54 = v38;
          __int16 v55 = 2112;
          id v56 = v23;
          __int16 v57 = 2112;
          int64_t v58 = (int64_t)v26;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);
        }
      }
      id v39 = objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", 52, v40);
      (*((void (**)(id, void, void, void *))v41 + 2))(v41, 0, 0, v39);
    }
  }
  else
  {
    id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*((void (**)(id, void, void, id))v41 + 2))(v41, 0, 0, v26);
  }
}

void __147__HMDHomeWalletKeyManager_createPassDirectoryWithWalletKey_options_shouldSkipResourceFiles_shouldCreateZipArchive_validateNFCInfo_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v5);

  if (!v3)
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_3;
    }
    uint64_t v7 = [*(id *)(a1 + 32) URLByAppendingPathExtension:@"pkpass"];
    BOOL v8 = [WeakRetained fileManager];
    uint64_t v9 = *(void *)(a1 + 32);
    id v35 = 0;
    char v10 = [v8 zipItemAtURL:v9 toURL:v7 error:&v35];
    id v11 = v35;

    id v12 = [WeakRetained fileManager];
    uint64_t v13 = *(void *)(a1 + 32);
    id v34 = 0;
    char v14 = [v12 removeItemAtURL:v13 error:&v34];
    id v15 = v34;

    if (v14)
    {
      if (v10)
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v23 = MEMORY[0x230FBD990]();
      id v24 = WeakRetained;
      BOOL v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v26 = v33 = v23;
        [*(id *)(a1 + 48) UUID];
        v28 = id v27 = v11;
        uint64_t v29 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        uint64_t v37 = v26;
        __int16 v38 = 2112;
        id v39 = v28;
        __int16 v40 = 2112;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        id v43 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create the zip file at URL %@:%@", buf, 0x2Au);

        id v11 = v27;
        uint64_t v23 = v33;
      }

      uint64_t v22 = (void *)v23;
    }
    else
    {
      uint64_t v16 = MEMORY[0x230FBD990]();
      id v17 = WeakRetained;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v19 = v32 = v11;
        id v20 = [*(id *)(a1 + 48) UUID];
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        uint64_t v37 = v19;
        __int16 v38 = 2112;
        id v39 = v20;
        __int16 v40 = 2112;
        uint64_t v41 = v21;
        __int16 v42 = 2112;
        id v43 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

        id v11 = v32;
      }

      uint64_t v22 = (void *)v16;
    }
    uint64_t v30 = *(void *)(a1 + 56);
    id v31 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void, void, void *))(v30 + 16))(v30, 0, 0, v31);

    goto LABEL_16;
  }
  uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_3:
  v6();
LABEL_17:
}

- (id)createPassDirectoryWithoutResourceFilesWithFlow:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    char v10 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    id v50 = v9;
    __int16 v51 = 2112;
    __int16 v52 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory without resources files", buf, 0x16u);
  }
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 resourceURL];

  uint64_t v13 = [v12 URLByAppendingPathComponent:@"HomeKey-Wallet.pass"];
  char v14 = [(HMDHomeWalletKeyManager *)v7 passLibrary];
  id v15 = [v14 createTemporaryPassDirectoryURL];

  uint64_t v16 = [(HMDHomeWalletKeyManager *)v7 fileManager];
  id v48 = 0;
  char v17 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:0 attributes:0 error:&v48];
  id v18 = v48;

  if (v17)
  {
    id v45 = v4;
    __int16 v19 = [v13 URLByAppendingPathComponent:@"pass.json"];
    id v20 = [v15 URLByAppendingPathComponent:@"pass.json"];
    uint64_t v21 = [(HMDHomeWalletKeyManager *)v7 fileManager];
    id v47 = v18;
    char v22 = [v21 copyItemAtURL:v19 toURL:v20 error:&v47];
    id v23 = v47;

    if (v22)
    {
      id v18 = v23;
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = v7;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v33 = v43 = v30;
        id v34 = [v45 UUID];
        *(_DWORD *)buf = 138544130;
        id v50 = v33;
        __int16 v51 = 2112;
        __int16 v52 = v34;
        __int16 v53 = 2112;
        __int16 v54 = v15;
        __int16 v55 = 2112;
        id v56 = v23;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create directory at path %@:%@", buf, 0x2Au);

        uint64_t v30 = v43;
      }

      id v35 = [(HMDHomeWalletKeyManager *)v31 fileManager];
      id v46 = v23;
      char v36 = [v35 removeItemAtURL:v15 error:&v46];
      id v18 = v46;

      if ((v36 & 1) == 0)
      {
        uint64_t v37 = (void *)MEMORY[0x230FBD990]();
        __int16 v38 = v31;
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v40 = v44 = v37;
          uint64_t v41 = [v45 UUID];
          *(_DWORD *)buf = 138544130;
          id v50 = v40;
          __int16 v51 = 2112;
          __int16 v52 = v41;
          __int16 v53 = 2112;
          __int16 v54 = v15;
          __int16 v55 = 2112;
          id v56 = v18;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

          uint64_t v37 = v44;
        }
      }
    }
    id v4 = v45;
    id v29 = v15;
  }
  else
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    BOOL v25 = v7;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      uint64_t v28 = [v4 UUID];
      *(_DWORD *)buf = 138544130;
      id v50 = v27;
      __int16 v51 = 2112;
      __int16 v52 = v28;
      __int16 v53 = 2112;
      __int16 v54 = v15;
      __int16 v55 = 2112;
      id v56 = v18;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create directory at path %@:%@", buf, 0x2Au);
    }
    id v29 = 0;
  }

  return v29;
}

- (id)createPassDirectoryWithResourceFilesWithFlow:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    char v10 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory with resources files", buf, 0x16u);
  }
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 resourceURL];

  uint64_t v13 = [v12 URLByAppendingPathComponent:@"HomeKey-Wallet.pass"];
  char v14 = [(HMDHomeWalletKeyManager *)v7 passLibrary];
  id v15 = [v14 createTemporaryPassDirectoryURL];

  uint64_t v16 = [(HMDHomeWalletKeyManager *)v7 fileManager];
  id v26 = 0;
  char v17 = [v16 copyItemAtURL:v13 toURL:v15 error:&v26];
  id v18 = v26;

  if (v17)
  {
    id v19 = v15;
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = v7;
    char v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = [v4 UUID];
      *(_DWORD *)buf = 138544386;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      id v32 = v13;
      __int16 v33 = 2112;
      id v34 = v15;
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to copy item at URL %@ to %@ : %@", buf, 0x34u);
    }
    id v19 = 0;
  }

  return v19;
}

- (void)addISOCredentialV1WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    id v15 = [v11 deviceCredentialKey];
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    char v17 = self;
    id v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        id v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v12 UUID];
        *(_DWORD *)buf = 138543618;
        id v32 = v20;
        __int16 v33 = 2112;
        id v34 = v21;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating iso credential...", buf, 0x16u);
      }
      char v22 = +[HMDACWGKeyManager shared];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke;
      v25[3] = &unk_264A1A500;
      v25[4] = v17;
      id v26 = v12;
      id v30 = v13;
      id v27 = v15;
      id v28 = v11;
      id v29 = v10;
      [v22 getIssuerKeyPairExternalRepresentationFromKeychainWithCompletionHandler:v25];
    }
    else
    {
      if (v19)
      {
        id v23 = HMFGetLogIdentifier();
        id v24 = [v12 UUID];
        *(_DWORD *)buf = 138543618;
        id v32 = v23;
        __int16 v33 = 2112;
        id v34 = v24;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding ISO credential because there is no device credential key", buf, 0x16u);
      }
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) isoCredentialACWGFactory];
    id v5 = ((void (**)(void, id, void))v4)[2](v4, v3, *(void *)(a1 + 48));

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_333;
    v13[3] = &unk_264A2BCA8;
    uint64_t v6 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    id v17 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    [v5 encodeWithCompletion:v13];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      BOOL v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to find Issuer Key in keychain", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 72);
    id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
  }
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_333(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_2;
  block[3] = &unk_264A2C9E0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v19 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV1WithPassAtURL_nfcInfo_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = NSString;
    id v3 = [*(id *)(a1 + 64) subCredentialIdentifier];
    id v4 = [v2 stringWithFormat:@"ISO18013-%@", v3];

    id v5 = [*(id *)(a1 + 72) URLByAppendingPathComponent:v4];
    id v6 = [*(id *)(a1 + 40) fileManager];
    uint64_t v7 = *(void *)(a1 + 32);
    id v27 = 0;
    char v8 = [v6 writeData:v7 toURL:v5 options:0 error:&v27];
    id v9 = v27;

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138543618;
        id v29 = v14;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created ACWG iso credential", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        id v23 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138544130;
        id v29 = v22;
        __int16 v30 = 2112;
        __int16 v31 = v23;
        __int16 v32 = 2112;
        __int16 v33 = v5;
        __int16 v34 = 2112;
        id v35 = v9;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write UA ACWG credential to file at url %@:%@", buf, 0x2Au);
      }
      id v24 = [MEMORY[0x263EFF9A0] dictionary];
      [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08608]];
      uint64_t v25 = *(void *)(a1 + 80);
      id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:52 userInfo:v24];
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      __int16 v20 = [*(id *)(a1 + 48) UUID];
      uint64_t v21 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      id v29 = v19;
      __int16 v30 = 2112;
      __int16 v31 = v20;
      __int16 v32 = 2112;
      __int16 v33 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create encoded ACWG ISO credential %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void)addISOCredentialV0WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [v11 deviceCredentialKey];
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      __int16 v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v20;
      __int16 v42 = 2112;
      id v43 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating iso credential...", buf, 0x16u);
    }
    uint64_t v22 = [(HMDHomeWalletKeyManager *)v17 keychainStore];
    id v23 = [v22 getPreferredHH2ControllerKey];

    if (v23)
    {
      id v24 = [(HMDHomeWalletKeyManager *)v17 isoCredentialFactory];
      uint64_t v25 = ((void (**)(void, void *, void *))v24)[2](v24, v23, v15);

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke;
      v35[3] = &unk_264A2BCA8;
      v35[4] = v17;
      id v36 = v12;
      id v39 = v13;
      id v37 = v11;
      id v38 = v10;
      [v25 encodeWithCompletion:v35];
    }
    else
    {
      id v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = v17;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        __int16 v31 = HMFGetLogIdentifier();
        [v12 UUID];
        __int16 v32 = v34 = v28;
        *(_DWORD *)buf = 138543874;
        uint64_t v41 = v31;
        __int16 v42 = 2112;
        id v43 = v32;
        __int16 v44 = 2112;
        uint64_t v45 = 0;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get local pairing identity %@", buf, 0x20u);

        id v28 = v34;
      }

      uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
      [v25 setObject:0 forKeyedSubscript:*MEMORY[0x263F08608]];
      __int16 v33 = [MEMORY[0x263F087E8] hmErrorWithCode:52 userInfo:v25];
      (*((void (**)(id, void *))v13 + 2))(v13, v33);
    }
  }
  else
  {
    if (v19)
    {
      id v26 = HMFGetLogIdentifier();
      id v27 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v26;
      __int16 v42 = 2112;
      id v43 = v27;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding ISO credential because there is no device credential key", buf, 0x16u);
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke_2;
  block[3] = &unk_264A2C9E0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v19 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    id v2 = NSString;
    id v3 = [*(id *)(a1 + 64) subCredentialIdentifier];
    id v4 = [v2 stringWithFormat:@"ISO18013-%@", v3];

    id v5 = [*(id *)(a1 + 72) URLByAppendingPathComponent:v4];
    id v6 = [*(id *)(a1 + 40) fileManager];
    uint64_t v7 = *(void *)(a1 + 32);
    id v27 = 0;
    char v8 = [v6 writeData:v7 toURL:v5 options:0 error:&v27];
    id v9 = v27;

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138543618;
        id v29 = v14;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created UA iso credential", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        id v23 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138544130;
        id v29 = v22;
        __int16 v30 = 2112;
        __int16 v31 = v23;
        __int16 v32 = 2112;
        __int16 v33 = v5;
        __int16 v34 = 2112;
        id v35 = v9;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write UA ISO credential to file at url %@:%@", buf, 0x2Au);
      }
      id v24 = [MEMORY[0x263EFF9A0] dictionary];
      [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x263F08608]];
      uint64_t v25 = *(void *)(a1 + 80);
      id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:52 userInfo:v24];
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      __int16 v20 = [*(id *)(a1 + 48) UUID];
      uint64_t v21 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      id v29 = v19;
      __int16 v30 = 2112;
      __int16 v31 = v20;
      __int16 v32 = 2112;
      __int16 v33 = v21;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create encoded UA ISO credential %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void)addISOCredentialWithPassAtURL:(id)a3 walletKey:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a4 nfcInfos];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke;
  void v26[3] = &unk_264A1A4D8;
  v26[4] = self;
  id v27 = v10;
  id v28 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = objc_msgSend(v13, "na_map:", v26);
  id v17 = [v16 combineAllFutures];
  id v18 = (void *)MEMORY[0x263F581B8];
  id v19 = [(HMDHomeWalletKeyManager *)self workQueue];
  __int16 v20 = [v18 schedulerWithDispatchQueue:v19];
  uint64_t v21 = [v17 reschedule:v20];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  void v24[2] = __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke_2;
  v24[3] = &unk_264A214E8;
  id v25 = v12;
  id v22 = v12;
  id v23 = (id)[v21 addCompletionBlock:v24];
}

id __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 paymentCredentialType];
  if (v5 == 1)
  {
    id v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    id v9 = [v4 errorOnlyCompletionHandlerAdapter];
    [v10 addISOCredentialV1WithPassAtURL:v11 nfcInfo:v3 flow:v12 completion:v9];
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    id v9 = [v4 errorOnlyCompletionHandlerAdapter];
    [v6 addISOCredentialV0WithPassAtURL:v7 nfcInfo:v3 flow:v8 completion:v9];
  }

LABEL_6:
  return v4;
}

uint64_t __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handlePendingWalletKeyUpdateOperationsWithFlow:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (![(HMDHomeWalletKeyManager *)self isWalletKeyUpdateOperationInProgress])
  {
    id v6 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
    char v7 = objc_msgSend(v6, "hmf_isEmpty");

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
      id v9 = (void *)[v8 copy];

      id v10 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
      [v10 removeAllObjects];

      uint64_t v11 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
      uint64_t v12 = [(HMDHomeWalletKeyManager *)self passLibrary];
      id v13 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
      id v14 = [v12 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v13 flow:v4];

      if (v14)
      {
        if (![v14 isMissingNFCInfo])
        {
          id v70 = v11;
          __int16 v72 = v14;
          id v21 = v14;
          char v81 = 0;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          __int16 v71 = v9;
          id v22 = v9;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v77 objects:v90 count:16];
          __int16 v69 = v21;
          if (v23)
          {
            uint64_t v24 = v23;
            char v25 = 0;
            uint64_t v26 = *(void *)v78;
            while (2)
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v78 != v26) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v28 = *(void *)(*((void *)&v77 + 1) + 8 * i);
                buf[0] = 0;
                id v29 = (*(void (**)(void))(v28 + 16))();
                __int16 v30 = v29;
                if (v81)
                {

                  goto LABEL_24;
                }
                if (v29)
                {
                  v25 |= buf[0] != 0;
                  id v31 = v29;

                  id v21 = v31;
                }
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v77 objects:v90 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }
          else
          {
            char v25 = 0;
          }
LABEL_24:

          if (v81)
          {
            __int16 v32 = [(HMDHomeWalletKeyManager *)self passLibrary];
            uint64_t v11 = v70;
            char v33 = [v32 removePassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v70 flow:v4];

            __int16 v34 = (void *)MEMORY[0x230FBD990]();
            id v35 = self;
            uint64_t v36 = HMFGetOSLogHandle();
            id v37 = v36;
            id v9 = v71;
            id v14 = v72;
            if (v33)
            {
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                id v38 = HMFGetLogIdentifier();
                id v39 = [v4 UUID];
                *(_DWORD *)buf = 138543618;
                v83 = v38;
                __int16 v84 = 2112;
                v85 = v39;
                _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully removed home key fom wallet", buf, 0x16u);
              }
              if (_os_feature_enabled_impl()
                && ((isInternalBuild() & 1) != 0
                 || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
              {
                __int16 v40 = (void *)MEMORY[0x230FBD990]();
                uint64_t v41 = v35;
                __int16 v42 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  id v43 = HMFGetLogIdentifier();
                  __int16 v44 = [v4 UUID];
                  *(_DWORD *)buf = 138543618;
                  v83 = v43;
                  __int16 v84 = 2112;
                  v85 = v44;
                  _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resetting dismissed UWB onboarding flag and clearing client wallet key UUID", buf, 0x16u);
                }
                uint64_t v45 = [(HMDHomeWalletKeyManager *)v41 home];
                [v45 resetHomeKeyMiscInfo];
              }
            }
            else
            {
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                __int16 v54 = HMFGetLogIdentifier();
                __int16 v55 = [v4 UUID];
                *(_DWORD *)buf = 138543618;
                v83 = v54;
                __int16 v84 = 2112;
                v85 = v55;
                _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove home key from wallet", buf, 0x16u);
              }
            }
          }
          else
          {
            int v46 = [v21 isMissingNFCInfo];
            id v47 = (void *)MEMORY[0x230FBD990]();
            id v48 = self;
            char v49 = HMFGetOSLogHandle();
            id v50 = v49;
            uint64_t v11 = v70;
            id v14 = v72;
            if (v46)
            {
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                __int16 v51 = HMFGetLogIdentifier();
                __int16 v52 = [v4 UUID];
                __int16 v53 = [v21 nfcInfos];
                *(_DWORD *)buf = 138543874;
                v83 = v51;
                __int16 v84 = 2112;
                v85 = v52;
                __int16 v86 = 2112;
                uint64_t v87 = (uint64_t)v53;
                _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update wallet key because we have lost NFC info: %@", buf, 0x20u);
              }
              id v9 = v71;
            }
            else
            {
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                id v56 = HMFGetLogIdentifier();
                uint64_t v57 = [v4 UUID];
                *(_DWORD *)buf = 138544130;
                v83 = v56;
                __int16 v84 = 2112;
                v85 = v57;
                __int16 v86 = 2112;
                uint64_t v87 = (uint64_t)v69;
                __int16 v88 = 2112;
                id v89 = v21;
                _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating home key in Wallet from %@ to %@", buf, 0x2Au);
              }
              int64_t v58 = [(HMDHomeWalletKeyManager *)v48 home];
              if (_os_feature_enabled_impl()
                && ((isInternalBuild() & 1) != 0
                 || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
              {
                __int16 v59 = [v58 clientWalletKeyUUID];

                if (!v59)
                {
                  id v60 = (void *)MEMORY[0x230FBD990]();
                  __int16 v61 = v48;
                  v62 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    __int16 v67 = HMFGetLogIdentifier();
                    v68 = v60;
                    uint64_t v63 = [v4 UUID];
                    uint64_t v64 = [v69 uuid];
                    *(_DWORD *)buf = 138543874;
                    v83 = v67;
                    __int16 v84 = 2112;
                    v85 = v63;
                    __int16 v86 = 2112;
                    uint64_t v87 = v64;
                    id v65 = (void *)v64;
                    _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key UUID for client has not been set, the existing wallet key being updated is pre-UWB, so saving the existingWalletKey as the wallet key's UUID: %@ going forward", buf, 0x20u);

                    id v60 = v68;
                  }

                  v66 = [v69 uuid];
                  [v58 saveClientWalletKeyUUIDToLocalStore:v66];
                }
              }
              [(HMDHomeWalletKeyManager *)v48 setIsWalletKeyUpdateOperationInProgress:1];
              v73[0] = MEMORY[0x263EF8330];
              v73[1] = 3221225472;
              v73[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke;
              v73[3] = &unk_264A1A4B0;
              v73[4] = v48;
              id v74 = v4;
              char v76 = v25 & 1;
              id v75 = v21;
              [(HMDHomeWalletKeyManager *)v48 createPassDirectoryWithWalletKey:v75 options:0 shouldSkipResourceFiles:0 shouldCreateZipArchive:1 validateNFCInfo:1 flow:v74 completion:v73];

              id v9 = v71;
              id v14 = v72;
            }
          }

          goto LABEL_52;
        }
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = self;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          id v19 = [v4 UUID];
          __int16 v20 = [v14 nfcInfos];
          *(_DWORD *)buf = 138543874;
          v83 = v18;
          __int16 v84 = 2112;
          v85 = v19;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v20;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Can't update wallet key because we are missing NFC info for the current wallet key. NFCInfo: %@", buf, 0x20u);

LABEL_9:
        }
      }
      else
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = self;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          id v19 = [v4 UUID];
          *(_DWORD *)buf = 138543874;
          v83 = v18;
          __int16 v84 = 2112;
          v85 = v19;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v11;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping wallet key update since key with serial number does not exist: %@", buf, 0x20u);
          goto LABEL_9;
        }
      }

LABEL_52:
    }
  }
}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v11 = [*(id *)(a1 + 32) passLibrary];
    uint64_t v12 = *(void *)(a1 + 40);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_324;
    void v27[3] = &unk_264A25E88;
    objc_copyWeak(&v32, &location);
    id v28 = v9;
    id v29 = *(id *)(a1 + 40);
    char v33 = *(unsigned char *)(a1 + 56);
    id v30 = *(id *)(a1 + 48);
    id v31 = v8;
    [v11 updatePassAtURL:v7 flow:v12 completion:v27];

    id v13 = [*(id *)(a1 + 32) fileManager];
    id v26 = 0;
    char v14 = [v13 removeItemAtURL:v7 error:&v26];
    id v15 = v26;

    if ((v14 & 1) == 0)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v20 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138544130;
        id v36 = v19;
        __int16 v37 = 2112;
        id v38 = v20;
        __int16 v39 = 2112;
        id v40 = v7;
        __int16 v41 = 2112;
        id v42 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);
      }
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 32);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      char v25 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v36 = v24;
      __int16 v37 = 2112;
      id v38 = v25;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create zipped pass: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) setIsWalletKeyUpdateOperationInProgress:0];
    [*(id *)(a1 + 32) handlePendingWalletKeyUpdateOperationsWithFlow:*(void *)(a1 + 40)];
  }
}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_324(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = WeakRetained;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update home key in Wallet :%@", buf, 0x20u);
    }
    if (v7)
    {
LABEL_5:
      uint64_t v12 = [v7 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_2;
      block[3] = &unk_264A2F820;
      void block[4] = v7;
      id v18 = *(id *)(a1 + 40);
      dispatch_async(v12, block);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      char v14 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated home key in Wallet", buf, 0x16u);
    }
    if (*(unsigned char *)(a1 + 72))
    {
      id v15 = [v7 workQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_325;
      v19[3] = &unk_264A2F2F8;
      id v20 = *(id *)(a1 + 48);
      id v21 = v7;
      id v22 = *(id *)(a1 + 40);
      dispatch_async(v15, v19);
    }
    id v16 = +[HMDHomeKeyDataRecorder sharedRecorder];
    [v16 recordUpdatedWalletKey:*(void *)(a1 + 48) passJSONDict:*(void *)(a1 + 56)];

    if (v7) {
      goto LABEL_5;
    }
  }
}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_325(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nfcInfos];
  id v3 = [v2 firstObject];
  id v4 = [v3 deviceCredentialKey];
  id v5 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v4];

  [*(id *)(a1 + 40) syncDeviceCredentialKey:v5 ofType:0 flow:*(void *)(a1 + 48)];
}

uint64_t __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsWalletKeyUpdateOperationInProgress:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 handlePendingWalletKeyUpdateOperationsWithFlow:v3];
}

- (void)enqueueWalletKeyUpdateOperation:(id)a3 flow:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
  id v10 = _Block_copy(v6);
  [v9 addObject:v10];

  if ([(HMDHomeWalletKeyManager *)self isWalletKeyUpdateOperationInProgress]
    || ([(HMDHomeWalletKeyManager *)self addWalletKeyFuture],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v7 UUID];
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key update operation in progress, update will happen later", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    [(HMDHomeWalletKeyManager *)self handlePendingWalletKeyUpdateOperationsWithFlow:v7];
  }
}

- (void)syncDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  char v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v11 UUID];
    int v17 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    char v33 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] Syncing device credential key", buf, 0x20u);
  }
  id v18 = [(HMDHomeWalletKeyManager *)v13 home];
  __int16 v19 = [v18 nfcReaderKeyManager];
  id v20 = [v19 accessoryManager];

  if (v20)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__HMDHomeWalletKeyManager_syncDeviceCredentialKey_ofType_flow___block_invoke;
    void v26[3] = &unk_264A2F370;
    v26[4] = v13;
    id v27 = v11;
    [v20 configureAllAccessoriesWithDeviceCredentialKey:v8 ofType:a4 flow:v27 completion:v26];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = v13;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      __int16 v25 = [v11 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      id v31 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessory manager found to sync device credential key", buf, 0x16u);
    }
  }
}

void __63__HMDHomeWalletKeyManager_syncDeviceCredentialKey_ofType_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) UUID];
      int v14 = 138543874;
      id v15 = v8;
      __int16 v16 = 2112;
      int v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      id v10 = "%{public}@[Flow: %@] Failed to configure accessory with device credential key: %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 40) UUID];
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    int v17 = v9;
    id v10 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)removeWalletKeyOnboardingBulletin
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self dataSource];
  char v4 = [v3 isWatch];

  if ((v4 & 1) == 0)
  {
    id v5 = [(HMDHomeWalletKeyManager *)self home];
    id v6 = v5;
    if (v5)
    {
      if ([v5 hasPostedWalletKeyOnboardingBulletinForAnyAccessory])
      {
        id v7 = [(HMDHomeWalletKeyManager *)self bulletinBoard];
        [v7 removeWalletKeyOnboardingBulletinForHome:v6];
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        uint32_t v13 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Can not remove wallet key onboarding bulletin because home is nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)createExpressModeSetUpBulletin
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self dataSource];
  int v4 = [v3 isWatch];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Not creating express mode setup bulletin on this device", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v9 = [(HMDHomeWalletKeyManager *)self home];
    if (v9)
    {
      id v10 = [(HMDHomeWalletKeyManager *)self bulletinBoard];
      [v10 insertWalletKeyExpressModeSetUpBulletinForHome:v9];
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      int v12 = self;
      uint32_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v15 = 138543362;
        __int16 v16 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Can not create express mode setup bulletin because home is nil", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)enableExpressWithOptions:(int64_t)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if ((a3 & 6) != 0)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = self;
    uint32_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = [v8 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Enabling express after adding home key", buf, 0x16u);
    }
    __int16 v16 = [(HMDHomeWalletKeyManager *)v12 passLibrary];
    uint64_t v17 = [(HMDHomeWalletKeyManager *)v12 passSerialNumber];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__HMDHomeWalletKeyManager_enableExpressWithOptions_flow_completion___block_invoke;
    v18[3] = &unk_264A2E288;
    id v19 = v10;
    [v16 setExpressSettingsWithAuthData:0 enableUWB:((unint64_t)a3 >> 2) & 1 enableNFCExpress:((unint64_t)a3 >> 1) & 1 passTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v17 flow:v8 completion:v18];
  }
  else
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

uint64_t __68__HMDHomeWalletKeyManager_enableExpressWithOptions_flow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addWalletKey:(id)a3 withOptions:(int64_t)a4 assertion:(id)a5 flow:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint32_t v13 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    __int16 v18 = [v12 UUID];
    id v19 = HMHomeAddWalletKeyOptionsDescription();
    *(_DWORD *)buf = 138544130;
    __int16 v37 = v17;
    __int16 v38 = 2112;
    __int16 v39 = v18;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    uint64_t v43 = v19;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key: %@ with options: %@", buf, 0x2Au);
  }
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    uint64_t v20 = [MEMORY[0x263F08C38] UUID];
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    __int16 v22 = v15;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      [v12 UUID];
      __int16 v25 = v30 = v21;
      *(_DWORD *)buf = 138543874;
      __int16 v37 = v24;
      __int16 v38 = 2112;
      __int16 v39 = v25;
      __int16 v40 = 2112;
      id v41 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] New Wallet key in process of adding, creating client wallet key uuid: %@", buf, 0x20u);

      uint64_t v21 = v30;
    }

    id v26 = [(HMDHomeWalletKeyManager *)v22 home];
    [v26 saveClientWalletKeyUUIDToLocalStore:v20];
  }
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke;
  v31[3] = &unk_264A1A488;
  v31[4] = v15;
  id v32 = v12;
  id v33 = v11;
  id v34 = v10;
  int64_t v35 = a4;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  [(HMDHomeWalletKeyManager *)v15 createPassDirectoryWithWalletKey:v27 options:a4 shouldSkipResourceFiles:0 shouldCreateZipArchive:1 validateNFCInfo:1 flow:v29 completion:v31];
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v31 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v9);

  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v10 = [*(id *)(a1 + 32) passLibrary];
    uint64_t v11 = *(void *)(a1 + 40);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_320;
    v33[3] = &unk_264A1A460;
    objc_copyWeak(v40, &location);
    id v34 = *(id *)(a1 + 40);
    id v35 = *(id *)(a1 + 48);
    id v36 = v8;
    id v12 = v7;
    id v37 = v12;
    id v38 = *(id *)(a1 + 56);
    id v13 = v31;
    uint64_t v14 = *(void **)(a1 + 64);
    id v39 = v13;
    v40[1] = v14;
    [v10 addPassAtURL:v12 flow:v11 completion:v33];

    int v15 = [*(id *)(a1 + 32) fileManager];
    id v32 = 0;
    LOBYTE(v11) = [v15 removeItemAtURL:v12 error:&v32];
    id v16 = v32;

    if ((v11 & 1) == 0)
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = v17;
        HMFGetLogIdentifier();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138544130;
        id v43 = v20;
        __int16 v44 = 2112;
        uint64_t v45 = v21;
        __int16 v46 = 2112;
        id v47 = v12;
        __int16 v48 = 2112;
        id v49 = v16;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);

        uint64_t v17 = v30;
      }
    }
    __int16 v22 = objc_msgSend(*(id *)(a1 + 32), "logEvent", v30);
    [v22 submitSuccess];

    objc_destroyWeak(v40);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 32);
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      id v27 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v43 = v26;
      __int16 v44 = 2112;
      uint64_t v45 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create zipped pass", buf, 0x16u);
    }
    [*(id *)(a1 + 48) invalidate];
    id v28 = [*(id *)(a1 + 32) addWalletKeyFuture];
    id v29 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v28 finishWithError:v29];
  }
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_320(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (!*(void *)(a1 + 48))
    {
      uint64_t v11 = +[HMDHomeKeyDataRecorder sharedRecorder];
      [v11 recordAddedWalletKey:*(void *)(a1 + 64) passJSONDict:*(void *)(a1 + 72)];
      uint64_t v19 = *(void *)(a1 + 88);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_322;
      v21[3] = &unk_264A2E610;
      uint64_t v20 = *(void *)(a1 + 32);
      id v22 = *(id *)(a1 + 40);
      id v23 = WeakRetained;
      id v24 = *(id *)(a1 + 64);
      id v25 = *(id *)(a1 + 32);
      [WeakRetained enableExpressWithOptions:v19 flow:v20 completion:v21];

      id v18 = v22;
      goto LABEL_11;
    }
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) UUID];
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to add home key in wallet at URL %@:%@", buf, 0x2Au);
    }
    [*(id *)(a1 + 40) invalidate];
    uint64_t v11 = [v6 addWalletKeyFuture];
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [*(id *)(a1 + 32) UUID];
      *(_DWORD *)buf = 138543618;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to add home key in wallet at URL, object got invalidated", buf, 0x16u);
    }
    [*(id *)(a1 + 40) invalidate];
    uint64_t v11 = [0 addWalletKeyFuture];
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = 23;
  }
  id v18 = [v12 hmErrorWithCode:v13];
  [v11 finishWithError:v18];
LABEL_11:
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_322(id *a1)
{
  [a1[4] invalidate];
  id v2 = [a1[5] addWalletKeyFuture];
  [v2 finishWithResult:a1[6]];

  id v3 = [a1[5] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_2;
  block[3] = &unk_264A2F2F8;
  id v4 = a1[6];
  id v5 = a1[5];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[7];
  dispatch_async(v3, block);
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nfcInfos];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_3;
  v4[3] = &unk_264A1A438;
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  objc_msgSend(v2, "na_each:", v4);
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 paymentCredentialType];
  if (v3 == 1)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    id v5 = [v11 deviceCredentialKey];
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v10;
    id v8 = v5;
    uint64_t v9 = 1;
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    id v4 = [v11 deviceCredentialKey];
    id v5 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:v4];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = 0;
  }
  [v6 syncDeviceCredentialKey:v8 ofType:v9 flow:v7];

LABEL_6:
}

- (void)configureWalletPaymentApplicationsWithNFCReaderKey:(id)a3 serialNumber:(id)a4 homeUniqueIdentifier:(id)a5 homeGRK:(id)a6 flow:(id)a7 completion:(id)a8
{
  id v11 = a8;
  id v12 = a7;
  id v13 = a3;
  id v16 = [(HMDHomeWalletKeyManager *)self passLibrary];
  uint64_t v14 = [v13 publicKeyExternalRepresentation];
  int v15 = [v13 identifier];

  [v16 generateHomeKeyNFCInfoWithReaderPublicKey:v14 readerIdentifier:v15 flow:v12 completion:v11];
}

- (void)addWalletKeyWithOptions:(int64_t)a3 nfcReaderKey:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v60 = a4;
  id v62 = a5;
  id v61 = a6;
  uint64_t v10 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v15 = [v62 UUID];
    *(_DWORD *)buf = 138544130;
    id v78 = v14;
    __int16 v79 = 2112;
    long long v80 = v15;
    __int16 v81 = 2048;
    int64_t v82 = a3;
    __int16 v83 = 2112;
    id v84 = v60;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key with options: %ld, readerKey: %@", buf, 0x2Au);
  }
  id v16 = [(HMDHomeWalletKeyManager *)v12 home];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = [v16 name];
    if (v18)
    {
      int64_t v58 = [(HMDHomeWalletKeyManager *)v12 passSerialNumber];
      if (v58)
      {
        uint64_t v19 = [(HMDHomeWalletKeyManager *)v12 addWalletKeyFuture];

        if (!v19)
        {
          id v20 = objc_alloc_init(MEMORY[0x263F58190]);
          [(HMDHomeWalletKeyManager *)v12 setAddWalletKeyFuture:v20];
        }
        uint64_t v21 = [(HMDHomeWalletKeyManager *)v12 addWalletKeyFuture];
        objc_initWeak(&location, v12);
        id v22 = [(HMDHomeWalletKeyManager *)v12 addWalletKeyFuture];
        id v23 = (void *)MEMORY[0x263F581B8];
        id v24 = [(HMDHomeWalletKeyManager *)v12 workQueue];
        id v25 = [v23 schedulerWithDispatchQueue:v24];
        id v26 = [v22 reschedule:v25];
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke;
        v71[3] = &unk_264A1A370;
        objc_copyWeak(v75, &location);
        id v56 = v62;
        id v72 = v56;
        id v74 = v61;
        id v57 = v21;
        id v73 = v57;
        v75[1] = (id)a3;
        id v27 = (id)[v26 addCompletionBlock:v71];

        __int16 v28 = v57;
        if (v19)
        {
          id v29 = (void *)MEMORY[0x230FBD990]();
          __int16 v30 = v12;
          HMFGetOSLogHandle();
          uint64_t v31 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            id v33 = [v56 UUID];
            *(_DWORD *)buf = 138543618;
            id v78 = v32;
            __int16 v79 = 2112;
            long long v80 = v33;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Add wallet key is already in progress", buf, 0x16u);

            __int16 v28 = v57;
          }
        }
        else
        {
          if (_os_feature_enabled_impl()
            && ((isInternalBuild() & 1) != 0
             || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
          {
            id v49 = [v17 acwgGroupResolvingKey];
          }
          else
          {
            id v49 = 0;
          }
          uint64_t v50 = (void *)MEMORY[0x230FBD990]();
          __int16 v51 = v12;
          HMFGetOSLogHandle();
          __int16 v52 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v53 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v54 = [v56 UUID];
            *(_DWORD *)buf = 138543618;
            id v78 = v53;
            __int16 v79 = 2112;
            long long v80 = v54;
            _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching home key supported", buf, 0x16u);

            __int16 v28 = v57;
          }

          v63[0] = MEMORY[0x263EF8330];
          v63[1] = 3221225472;
          v63[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_310;
          v63[3] = &unk_264A1A410;
          v63[4] = v51;
          id v64 = v56;
          id v65 = v60;
          id v66 = v58;
          id v67 = v17;
          id v55 = v49;
          id v68 = v55;
          id v69 = v18;
          int64_t v70 = a3;
          [(HMDHomeWalletKeyManager *)v51 fetchHomeKeySupportedWithFlow:v64 completion:v63];
        }
        objc_destroyWeak(v75);
        objc_destroyWeak(&location);
      }
      else
      {
        __int16 v44 = (void *)MEMORY[0x230FBD990]();
        uint64_t v45 = v12;
        __int16 v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          id v47 = HMFGetLogIdentifier();
          __int16 v48 = [v62 UUID];
          *(_DWORD *)buf = 138543618;
          id v78 = v47;
          __int16 v79 = 2112;
          long long v80 = v48;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, serial number is nil", buf, 0x16u);
        }
        __int16 v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        (*((void (**)(id, void, void *))v61 + 2))(v61, 0, v28);
      }
    }
    else
    {
      id v39 = (void *)MEMORY[0x230FBD990]();
      __int16 v40 = v12;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        __int16 v42 = HMFGetLogIdentifier();
        id v43 = [v62 UUID];
        *(_DWORD *)buf = 138543618;
        id v78 = v42;
        __int16 v79 = 2112;
        long long v80 = v43;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, no name configured for home", buf, 0x16u);
      }
      __int16 v59 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, void, void *))v61 + 2))(v61, 0, v59);
    }
  }
  else
  {
    uint64_t v34 = (void *)MEMORY[0x230FBD990]();
    id v35 = v12;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      id v38 = [v62 UUID];
      *(_DWORD *)buf = 138543618;
      id v78 = v37;
      __int16 v79 = 2112;
      long long v80 = v38;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, home is nil", buf, 0x16u);
    }
    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v61 + 2))(v61, 0, v18);
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained addWalletKeyFuture];
    uint64_t v10 = *(void **)(a1 + 40);

    if (v9 == v10)
    {
      [v8 setAddWalletKeyFuture:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      if (v5 && (*(unsigned char *)(a1 + 64) & 2) != 0) {
        [v8 showExpressEnabledNotificationForWalletKey:v5];
      }
      [v8 handlePendingWalletKeyUpdateOperationsWithFlow:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      if (v5)
      {
        id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
        (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
      }
      else
      {
        (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v6);
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 32) UUID];
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Self became nil while waiting for add wallet key future to finish", (uint8_t *)&v17, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_310(uint64_t a1, char a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v28 = v10;
      __int16 v29 = 2112;
      __int16 v30 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Acquiring wallet provisioning assertion", buf, 0x16u);
    }
    id v12 = [*(id *)(a1 + 32) passLibrary];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_314;
    v19[3] = &unk_264A1A3E8;
    id v13 = *(void **)(a1 + 40);
    void v19[4] = *(void *)(a1 + 32);
    id v20 = v13;
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    id v24 = *(id *)(a1 + 72);
    id v14 = *(id *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 88);
    id v25 = v14;
    uint64_t v26 = v15;
    [v12 acquireAssertionOfType:1 withReason:@"Adding Home Key" completion:v19];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      __int16 v28 = v16;
      __int16 v29 = 2112;
      __int16 v30 = v17;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Adding home key in wallet is not supported: %@", buf, 0x20u);
    }
    id v18 = [*(id *)(a1 + 32) addWalletKeyFuture];
    [v18 finishWithError:v5];
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_314(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      id v13 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generating home key nfc info with reader key: %@", buf, 0x20u);
    }
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    int v17 = [*(id *)(a1 + 64) spiClientIdentifier];
    uint64_t v18 = *(void *)(a1 + 72);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_315;
    void v26[3] = &unk_264A1A3C0;
    __int16 v19 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    id v27 = v19;
    id v28 = v5;
    id v29 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 80);
    uint64_t v21 = *(void *)(a1 + 88);
    id v30 = v20;
    uint64_t v31 = v21;
    [v14 configureWalletPaymentApplicationsWithNFCReaderKey:v15 serialNumber:v16 homeUniqueIdentifier:v17 homeGRK:v18 flow:v27 completion:v26];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v22;
      __int16 v34 = 2112;
      id v35 = v23;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not add home key in wallet, failed to acquire assertion: %@", buf, 0x20u);
    }
    id v24 = [*(id *)(a1 + 32) addWalletKeyFuture];
    id v25 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v24 finishWithError:v25];
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_315(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v12;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generated NFC info: %@", buf, 0x20u);
    }
    id v13 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_316;
    block[3] = &unk_264A2BAA0;
    id v14 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v22 = v14;
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    id v15 = v5;
    uint64_t v16 = *(void *)(a1 + 72);
    id v25 = v15;
    uint64_t v27 = v16;
    id v26 = *(id *)(a1 + 48);
    dispatch_async(v13, block);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      uint64_t v18 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate nfc info for home key: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) invalidate];
    __int16 v19 = [*(id *)(a1 + 32) addWalletKeyFuture];
    id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v19 finishWithError:v20];
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_316(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchWalletKeyColorOptionWithFlow:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_2;
  v7[3] = &unk_264A1A398;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  id v5 = *(void **)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  id v10 = v3;
  uint64_t v13 = v4;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v6 = (id)[v2 addSuccessBlock:v7];
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [HMDHomeWalletKey alloc];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = [v4 integerValue];

  id v10 = [(HMDHomeWalletKey *)v6 initWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v7 state:1 walletKeyDescription:v8 homeName:v8 color:v9 nfcInfos:*(void *)(a1 + 56)];
  id v11 = [*(id *)(a1 + 32) walletKeyByAddingAccessCodeToWalletKey:v10];

  [*(id *)(a1 + 32) addWalletKey:v11 withOptions:*(void *)(a1 + 80) assertion:*(void *)(a1 + 64) flow:*(void *)(a1 + 72)];
}

- (id)fetchWalletKeyColorOptionWithFlow:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchWalletKeyColorOption", buf, 0x16u);
  }
  id v11 = objc_alloc_init(MEMORY[0x263F58190]);
  id v12 = [(HMDHomeWalletKeyManager *)v7 home];
  uint64_t v13 = [v12 nfcReaderKeyManager];
  id v14 = [v13 accessoryManager];

  if (v14)
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __61__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow___block_invoke;
    void v26[3] = &unk_264A29098;
    v26[4] = v7;
    id v27 = v4;
    id v15 = v11;
    id v28 = v15;
    [v14 fetchWalletKeyColorWithFlow:v27 completion:v26];
    uint64_t v16 = v28;
    id v17 = v15;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    __int16 v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      id v22 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v30 = v21;
      __int16 v31 = 2112;
      __int16 v32 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessory manager found, using default wallet key color", buf, 0x16u);
    }
    id v23 = NSNumber;
    id v17 = [(HMDHomeWalletKeyManager *)v19 dataSource];
    id v24 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v17, "walletKeyColor"));
    [v11 finishWithResult:v24];
  }
  return v11;
}

void __61__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1[4];
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [a1[5] UUID];
      [v5 integerValue];
      id v14 = HMHomeWalletKeyColorAsString();
      int v21 = 138543874;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetch wallet key color: %@", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    if (v11)
    {
      id v15 = HMFGetLogIdentifier();
      uint64_t v16 = [a1[5] UUID];
      id v17 = [a1[4] dataSource];
      [v17 walletKeyColor];
      uint64_t v18 = HMHomeWalletKeyColorAsString();
      int v21 = 138544130;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch wallet key color: %@, using default wallet key color: %@", (uint8_t *)&v21, 0x2Au);
    }
    __int16 v19 = NSNumber;
    id v20 = [a1[4] dataSource];
    objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "walletKeyColor"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  [a1[6] finishWithResult:v5];
}

- (void)fetchWalletKeyColorOptionWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchWalletKeyColorOptionWithFlow:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke_2;
  v4[3] = &unk_264A2E260;
  id v5 = *(id *)(a1 + 48);
  id v3 = (id)[v2 addSuccessBlock:v4];
}

uint64_t __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  BOOL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v6 UUID];
    int v28 = 138543618;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    __int16 v31 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetch or create reader key", (uint8_t *)&v28, 0x16u);
  }
  id v14 = [(HMDHomeWalletKeyManager *)v10 home];
  id v15 = v14;
  if (!v14)
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v10;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = [v6 UUID];
      int v28 = 138543618;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      __int16 v31 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, home is nil", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    goto LABEL_12;
  }
  if (([v14 hasAnyAccessoryWithWalletKeySupport] & 1) == 0)
  {
    __int16 v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = v10;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      __int16 v27 = [v6 UUID];
      int v28 = 138543618;
      uint64_t v29 = v26;
      __int16 v30 = 2112;
      __int16 v31 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home doesn't have any accessory that supports wallet key", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:48 userInfo:0];
LABEL_12:
    uint64_t v16 = (void *)v22;
    v7[2](v7, 0, v22);
    goto LABEL_13;
  }
  uint64_t v16 = [v15 nfcReaderKeyManager];
  [v16 fetchOrCreateReaderKeyWithRequiresPrivateKey:0 flow:v6 completion:v7];
LABEL_13:
}

- (void)addWalletKeyWithOptions:(int64_t)a3 isOnboarding:(BOOL)a4 flow:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a5;
  BOOL v11 = (void (**)(id, void *, void *))a6;
  id v12 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    id v17 = [v10 UUID];
    *(_DWORD *)buf = 138543874;
    id v49 = v16;
    __int16 v50 = 2112;
    __int16 v51 = v17;
    __int16 v52 = 2048;
    int64_t v53 = a3;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key with options: %ld", buf, 0x20u);
  }
  uint64_t v18 = [(HMDHomeWalletKeyManager *)v14 passSerialNumber];
  if (v18)
  {
    __int16 v19 = [(HMDHomeWalletKeyManager *)v14 passLibrary];
    id v20 = [v19 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v18 flow:v10];

    if (v20)
    {
      int v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = v14;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = HMFGetLogIdentifier();
        __int16 v25 = [v10 UUID];
        *(_DWORD *)buf = 138543874;
        id v49 = v24;
        __int16 v50 = 2112;
        __int16 v51 = v25;
        __int16 v52 = 2112;
        int64_t v53 = (int64_t)v20;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home Key already exists in Wallet: %@", buf, 0x20u);
      }
      id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
      v11[2](v11, v20, v26);
    }
    else
    {
      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
      {
        uint64_t v32 = +[HMDPassUpdater shared];
        uint64_t v33 = [(HMDHomeWalletKeyManager *)v14 uuid];
        uint64_t v34 = [NSNumber numberWithInteger:a3];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke;
        v44[3] = &unk_264A1A320;
        v44[4] = v14;
        int64_t v47 = a3;
        id v45 = v10;
        __int16 v46 = v11;
        [v32 updatePassForHomeUUID:v33 isOnboarding:v7 optionsNumber:v34 flow:v45 completionHandler:v44];

        id v35 = v45;
      }
      else
      {
        __int16 v36 = [(HMDHomeWalletKeyManager *)v14 logEvent];

        if (!v36)
        {
          id v37 = [HMDHomeKeySetupWalletLogEvent alloc];
          uint64_t v38 = [(HMDHomeWalletKeyManager *)v14 workQueue];
          id v39 = [(HMDHomeKeySetupWalletLogEvent *)v37 initWithQueue:v38];
          [(HMDHomeWalletKeyManager *)v14 setLogEvent:v39];
        }
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        id v40[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke_3;
        v40[3] = &unk_264A1A348;
        v40[4] = v14;
        id v41 = v10;
        __int16 v42 = v11;
        int64_t v43 = a3;
        [(HMDHomeWalletKeyManager *)v14 fetchOrCreateReaderKeyWithFlow:v41 completion:v40];

        id v35 = v41;
      }

      id v20 = 0;
    }
  }
  else
  {
    __int16 v27 = (void *)MEMORY[0x230FBD990]();
    int v28 = v14;
    uint64_t v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = HMFGetLogIdentifier();
      __int16 v31 = [v10 UUID];
      *(_DWORD *)buf = 138543874;
      id v49 = v30;
      __int16 v50 = 2112;
      __int16 v51 = v31;
      __int16 v52 = 2112;
      int64_t v53 = 0;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Could not find passSerialNumber: %@", buf, 0x20u);
    }
    id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v11[2](v11, 0, v20);
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke_2;
  block[3] = &unk_264A1A2F8;
  uint64_t v16 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v29 = a2;
  uint64_t v30 = v17;
  id v26 = v14;
  id v27 = v16;
  id v28 = *(id *)(a1 + 48);
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(v15, block);
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    [*(id *)(a1 + 32) addWalletKeyWithOptions:*(void *)(a1 + 56) nfcReaderKey:v5 flow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      int v13 = 138543874;
      id v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or create reader key: %@", (uint8_t *)&v13, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke_2(uint64_t a1)
{
  LOBYTE(v2) = (*(_DWORD *)(a1 + 96) & 2) != 0;
  [*(id *)(a1 + 32) handlePassUpdatedWithResult:*(void *)(a1 + 88) paymentApps:*(void *)(a1 + 40) addedPaymentApps:*(void *)(a1 + 48) pass:*(void *)(a1 + 56) accessoryToSync:0 showSetupBulletinOnAdd:0 showExpressBulletinOnAddForWatch:v2 error:*(void *)(a1 + 64) flow:*(void *)(a1 + 72)];
  id v3 = [[HMDHomeWalletKey alloc] initWithPKPass:*(void *)(a1 + 56) flow:*(void *)(a1 + 72)];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)fetchPayloadForAddWalletKeyRemoteMessageWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__HMDHomeWalletKeyManager_fetchPayloadForAddWalletKeyRemoteMessageWithFlow_completion___block_invoke;
  v10[3] = &unk_264A1A2D0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(HMDHomeWalletKeyManager *)self fetchOrCreateReaderKeyWithFlow:v7 completion:v10];
}

void __87__HMDHomeWalletKeyManager_fetchPayloadForAddWalletKeyRemoteMessageWithFlow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    id v11 = 0;
    uint64_t v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v11];
    id v9 = v11;
    if (v8)
    {
      id v12 = @"HMDHomeWalletKeyManagerRemoteMessageKeyNFCReaderKey";
      v13[0] = v8;
      id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)sendMessageWithName:(id)a3 payload:(id)a4 toWatches:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v29 = a4;
  id v11 = a5;
  id v26 = a6;
  id v12 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  int v13 = dispatch_group_create();
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  char v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2810000000;
  v51[3] = "";
  int v52 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__48522;
  v48[4] = __Block_byref_object_dispose__48523;
  id v49 = 0;
  id v28 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v11;
  uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v45;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * v16);
        dispatch_group_enter(v13);
        id v18 = [HMDRemoteDeviceMessageDestination alloc];
        uint64_t v19 = [(HMDHomeWalletKeyManager *)self uuid];
        id v20 = [(HMDRemoteDeviceMessageDestination *)v18 initWithTarget:v19 device:v17];

        id v21 = [[HMDRemoteMessage alloc] initWithName:v10 qualityOfService:25 destination:v20 payload:v29 type:0 timeout:1 secure:10.0];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke;
        v36[3] = &unk_264A1A280;
        v36[4] = self;
        v36[5] = v17;
        id v37 = v10;
        __int16 v40 = v51;
        id v41 = v53;
        __int16 v42 = v50;
        int64_t v43 = v48;
        id v38 = v28;
        id v39 = v13;
        [(HMDRemoteMessage *)v21 setResponseHandler:v36];
        uint64_t v22 = [(HMDHomeWalletKeyManager *)self messageDispatcher];
        [v22 sendMessage:v21];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  id v23 = [(HMDHomeWalletKeyManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke_303;
  block[3] = &unk_264A1A2A8;
  id v31 = v28;
  uint64_t v32 = self;
  id v33 = v26;
  uint64_t v34 = v50;
  id v35 = v48;
  id v24 = v26;
  id v25 = v28;
  dispatch_group_notify(v13, v23, block);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);
}

void __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v26 = 138544130;
      id v27 = v11;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Watch: %@ failed to handle message %@:%@ ", (uint8_t *)&v26, 0x2Au);
    }
    uint64_t v14 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 72) + 8) + 32);
    os_unfair_lock_lock_with_options();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v16 = 2008;
    }
    else
    {
      uint64_t v25 = [v5 code];
      uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
      if (v25 == 1)
      {
        if (*(void *)(v15 + 24) != 52) {
          *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v5 code];
        }
        goto LABEL_18;
      }
      uint64_t v16 = 52;
    }
    *(void *)(v15 + 24) = v16;
LABEL_18:
    [*(id *)(a1 + 56) setObject:v5 forKey:*(void *)(a1 + 40)];
    goto LABEL_19;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    int v26 = 138543874;
    id v27 = v17;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Watch: %@ successfully handled message %@", (uint8_t *)&v26, 0x20u);
  }
  uint64_t v14 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 72) + 8) + 32);
  os_unfair_lock_lock_with_options();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  uint64_t v20 = *(void *)(*(void *)(a1 + 88) + 8);
  if (*(void *)(v20 + 24)) {
    *(void *)(v20 + 24) = 2008;
  }
  id v21 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (!v21)
  {
    uint64_t v22 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    uint64_t v23 = *(void *)(*(void *)(a1 + 96) + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    id v21 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  }
  [v21 setObject:v6 forKey:*(void *)(a1 + 40)];
LABEL_19:
  os_unfair_lock_unlock(v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke_303(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    id v3 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 32), 0);
    if (v3)
    {
      [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263F0CF58]];
    }
    else
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = *(id *)(a1 + 40);
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = HMFGetLogIdentifier();
        int v9 = 138543362;
        id v10 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode error by device", (uint8_t *)&v9, 0xCu);
      }
    }
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) userInfo:v2];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)updateDeviceStateWithExpressEnablementConflictingPassDescription:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke;
  v15[3] = &unk_264A1A258;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [(HMDHomeWalletKeyManager *)self fetchExpressEnablementConflictingPassDescriptionWithFlow:v14 completion:v15];
}

void __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke_2;
  v12[3] = &unk_264A2DF78;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v9;
  id v18 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 48);
  id v17 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && [v2 code] != 2)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 48) UUID];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflicting pass description: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v11 = (id)[*(id *)(a1 + 56) mutableCopy];
    [v11 setExpressEnablementConflictingPassDescription:*(void *)(a1 + 64)];
    uint64_t v3 = *(void *)(a1 + 72);
    id v4 = (void *)[v11 copy];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
  }
}

- (void)updateDeviceStateWithWalletKey:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  if (v12)
  {
    id v13 = [(HMDHomeWalletKeyManager *)self passLibrary];
    __int16 v14 = [v13 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 flow:v9];

    if (v14)
    {
      id v15 = [(HMDHomeWalletKeyManager *)self passLibrary];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke;
      v16[3] = &unk_264A1A230;
      v16[4] = self;
      id v17 = v9;
      id v20 = v10;
      id v18 = v14;
      id v19 = v8;
      [v15 fetchIsExpressEnabledForPassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 flow:v17 completion:v16];
    }
    else
    {
      (*((void (**)(id, id, void))v10 + 2))(v10, v8, 0);
    }
  }
  else
  {
    __int16 v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke_2;
  block[3] = &unk_264A1A208;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v9;
  id v15 = v10;
  id v18 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  char v19 = a2;
  char v20 = a3;
  id v17 = *(id *)(a1 + 56);
  id v11 = v7;
  dispatch_async(v8, block);
}

void __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 48) UUID];
      uint64_t v7 = *(void *)(a1 + 32);
      int v26 = 138543874;
      id v27 = v5;
      __int16 v28 = 2112;
      uint64_t v29 = v6;
      __int16 v30 = 2112;
      uint64_t v31 = v7;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express setting of existing pass: %@", (uint8_t *)&v26, 0x20u);
    }
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    id v10 = *(void **)(a1 + 56);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 81);
    id v13 = [*(id *)(a1 + 40) home];
    uint64_t v14 = [v13 clientWalletKeyUUID];
    uint64_t v9 = [v10 xpcWalletKeyWithExpressEnabled:v11 uwbEnabled:v12 clientWalletKeyUUID:v14];

    if (v9)
    {
      id v15 = (void *)[*(id *)(a1 + 64) mutableCopy];
      [v15 setWalletKey:v9];
      uint64_t v16 = *(void *)(a1 + 72);
      id v17 = (void *)[v15 copy];
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
    }
    else
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = *(id *)(a1 + 40);
      char v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = HMFGetLogIdentifier();
        uint64_t v22 = [*(id *)(a1 + 48) UUID];
        uint64_t v23 = *(void *)(a1 + 56);
        int v26 = 138543874;
        id v27 = v21;
        __int16 v28 = 2112;
        uint64_t v29 = v22;
        __int16 v30 = 2112;
        uint64_t v31 = v23;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create xpc wallet key with wallet key: %@", (uint8_t *)&v26, 0x20u);
      }
      uint64_t v24 = *(void *)(a1 + 72);
      uint64_t v25 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v25);

      uint64_t v9 = 0;
    }
  }
}

- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDHomeWalletKeyManager *)self passLibrary];
  char v10 = [v9 isWalletVisible];

  if (v10)
  {
    uint64_t v11 = [(HMDHomeWalletKeyManager *)self passLibrary];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    void v13[2] = __68__HMDHomeWalletKeyManager_fetchHomeKeySupportedWithFlow_completion___block_invoke;
    v13[3] = &unk_264A1A1E0;
    v13[4] = self;
    id v14 = v7;
    [v11 fetchHomeKeySupportedWithFlow:v6 completion:v13];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0CF50] code:8 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __68__HMDHomeWalletKeyManager_fetchHomeKeySupportedWithFlow_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = a3;
    id v6 = objc_opt_class();
    uint64_t v7 = [v5 code];

    uint64_t v4 = [v6 homekitErrorWithPassLibraryErrorCode:v7];
  }
  id v8 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateDeviceStateWithCanAddWalletKey:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke;
  v14[3] = &unk_264A27A68;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(HMDHomeWalletKeyManager *)self fetchHomeKeySupportedWithFlow:v10 completion:v14];
}

void __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1[4] workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke_2;
  v9[3] = &unk_264A2B340;
  id v7 = a1[5];
  char v13 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = a1[6];
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v4 setCanAddWalletKey:*(unsigned __int8 *)(a1 + 56)];
  if (!*(unsigned char *)(a1 + 56)) {
    objc_msgSend(v4, "setCanAddWalletKeyErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  }
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = (void *)[v4 copy];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)fetchExpressEnablementConflictingPassDescriptionWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  if (v9)
  {
    id v10 = [(HMDHomeWalletKeyManager *)self passLibrary];
    id v11 = [v10 secureElementIdentifier];

    if (v11)
    {
      id v12 = [(HMDHomeWalletKeyManager *)self home];
      char v13 = [v12 name];

      id v33 = +[HMDHomeWalletKeySecureElementInfo createForExpressConflictCheckWithSecureElementIdentifier:v11];
      id v14 = [HMDHomeWalletKey alloc];
      id v15 = [(HMDHomeWalletKeyManager *)self dataSource];
      id v16 = v6;
      uint64_t v17 = [v15 walletKeyColor];
      id v37 = v33;
      [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
      id v18 = v7;
      v20 = id v19 = v9;
      uint64_t v21 = v17;
      id v6 = v16;
      uint64_t v22 = [(HMDHomeWalletKey *)v14 initWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v19 state:1 walletKeyDescription:v13 homeName:v13 color:v21 nfcInfos:v20];

      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke;
      v34[3] = &unk_264A1A1B8;
      v34[4] = self;
      id v35 = v16;
      id v36 = v18;
      id v9 = v19;
      id v7 = v18;
      [(HMDHomeWalletKeyManager *)self createPassDirectoryWithWalletKey:v22 options:0 shouldSkipResourceFiles:1 shouldCreateZipArchive:0 validateNFCInfo:0 flow:v35 completion:v34];
    }
    else
    {
      __int16 v28 = (void *)MEMORY[0x230FBD990]();
      uint64_t v29 = self;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        uint64_t v32 = [v6 UUID];
        *(_DWORD *)buf = 138543618;
        id v39 = v31;
        __int16 v40 = 2112;
        id v41 = v32;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express enablement conflicting pass description, secure element identifier is nil", buf, 0x16u);
      }
      char v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    uint64_t v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = HMFGetLogIdentifier();
      id v27 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      id v39 = v26;
      __int16 v40 = 2112;
      id v41 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express enablement conflicting pass description, wallet key serial number is nil", buf, 0x16u);
    }
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    id v11 = [a1[4] passLibrary];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke_296;
    v19[3] = &unk_264A1A190;
    id v20 = a1[6];
    [v11 fetchExpressEnablementConflictingPassDescriptionForPassAtURL:v7 completion:v19];

    id v12 = v20;
  }
  else
  {
    char v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1[4];
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass creation failed: %@", buf, 0x20u);
    }
    id v18 = (void (**)(id, void, void *))a1[6];
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    v18[2](v18, 0, v12);
  }
}

uint64_t __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke_296(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canAutoAddWalletKeyWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [(HMDHomeWalletKeyManager *)self systemInfo];
  int v6 = [v5 isMigrating];

  if (!v6)
  {
    id v8 = [(HMDHomeWalletKeyManager *)self home];
    id v9 = [v8 nfcReaderKey];
    id v10 = [v9 identifier];
    id v11 = objc_msgSend(v10, "hmf_hexadecimalRepresentation");

    if (v11
      && ([(HMDHomeWalletKeyManager *)self dataSource],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 numberValueFromNoBackupStoreWithKey:v11],
          char v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13)
      || ([v8 hasOnboardedForWalletKey] & 1) != 0)
    {
      if ([(HMDHomeWalletKeyManager *)self isHomeBeingRemoved])
      {
        if (a3)
        {
          *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"HMDHomeAutoAddWalletKeyErrorDomain" code:4 userInfo:0];
        }
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          int v21 = 138543362;
          uint64_t v22 = v17;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Cannot auto add wallet key because home is currently being removed", (uint8_t *)&v21, 0xCu);
        }
        goto LABEL_20;
      }
      if (![(HMDHomeWalletKeyManager *)self shouldRollWalletKeyAfterMigration])
      {
        BOOL v7 = 1;
        goto LABEL_22;
      }
      if (!a3) {
        goto LABEL_20;
      }
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = 3;
    }
    else
    {
      if (!a3)
      {
LABEL_20:
        BOOL v7 = 0;
        goto LABEL_22;
      }
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = 2;
    }
    [v18 errorWithDomain:@"HMDHomeAutoAddWalletKeyErrorDomain" code:v19 userInfo:0];
    BOOL v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    return v7;
  }
  if (!a3) {
    return 0;
  }
  [MEMORY[0x263F087E8] errorWithDomain:@"HMDHomeAutoAddWalletKeyErrorDomain" code:1 userInfo:0];
  BOOL v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)addIssuerKeysToMatterAccessoriesWithFlow:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F42530] internalOnlyInitializer];
  int v6 = (void *)MEMORY[0x230FBD990]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    id v11 = [v4 UUID];
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v9;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] addIssuerKeysToMatterAccessories", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v7 home];
  if ([v12 hasAnyResident])
  {
    char v13 = (void *)MEMORY[0x263F42590];
    uint64_t v28 = *MEMORY[0x263F42000];
    id v14 = HMFEncodedRootObject();
    uint64_t v29 = v14;
    id v15 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v16 = [v13 entitledMessageWithName:@"HMDHomeWalletKeyAccessoryManagerAddIssuerKeysToAccessoriesMessage" messagePayload:v15];

    uint64_t v17 = [v12 nfcReaderKeyManager];
    id v18 = [v17 accessoryManager];
    uint64_t v19 = [v18 messageTargetUUID];

    id v20 = (void *)[objc_alloc(MEMORY[0x263F42570]) initWithTarget:v19];
    int v21 = (void *)MEMORY[0x230FBD990]([v16 setDestination:v20]);
    uint64_t v22 = v7;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      uint64_t v24 = v27 = v4;
      __int16 v25 = [v5 UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      id v33 = v25;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] sending message: %@", buf, 0x20u);

      id v4 = v27;
    }

    id v26 = [(HMDHomeWalletKeyManager *)v22 workQueue];
    [v12 redispatchToResidentMessage:v16 target:v19 responseQueue:v26];
  }
  else
  {
    id v16 = [v12 nfcReaderKeyManager];
    uint64_t v19 = [v16 accessoryManager];
    [v19 addIssuerKeysToMatterAccessoriesWithFlow:v5];
  }
}

- (void)handleRestoreMissingWalletKeysMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling RestoreMissingWalletKeysMessage: %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [(HMDHomeWalletKeyManager *)v6 home];
  id v10 = [v9 nfcReaderKeyManager];
  id v11 = [v10 accessoryManager];
  id v12 = [v11 messageTargetUUID];

  char v13 = [(HMDHomeWalletKeyManager *)v6 workQueue];
  [v9 redispatchToResidentMessage:v4 target:v12 responseQueue:v13];
}

- (void)handleFetchMissingWalletKeysMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling FetchMissingWalletKeysMessage: %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [(HMDHomeWalletKeyManager *)v6 home];
  id v10 = [v9 nfcReaderKeyManager];
  id v11 = [v10 accessoryManager];
  id v12 = [v11 messageTargetUUID];

  char v13 = [(HMDHomeWalletKeyManager *)v6 workQueue];
  [v9 redispatchToResidentMessage:v4 target:v12 responseQueue:v13];
}

- (void)handlePersistWalletKeyAddOptionsRemoteMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x230FBD990]();
  BOOL v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543874;
    __int16 v25 = v9;
    __int16 v26 = 2112;
    id v27 = v4;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remote message to add wallet key: %@ payload: %@", buf, 0x20u);
  }
  uint64_t v23 = objc_opt_class();
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  id v12 = [v4 unarchivedObjectForKey:@"HMDHomeWalletKeyManagerRemoteMessageKeyNFCReaderKey" ofClasses:v11];

  if (v12)
  {
    char v13 = [(HMDHomeWalletKeyManager *)v7 dataSource];
    int v14 = [NSNumber numberWithInteger:3];
    id v15 = [v12 identifier];
    __int16 v16 = objc_msgSend(v15, "hmf_hexadecimalRepresentation");
    [v13 persistNumberValueToNoBackupStore:v14 withKey:v16];

    [v4 respondWithPayload:MEMORY[0x263EFFA78]];
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v7;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v20;
      __int16 v26 = 2112;
      id v27 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing nfc reader key in the message payload: %@", buf, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v4 respondWithError:v22];
  }
}

- (void)handleAddWalletKeyMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  BOOL v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    id v12 = [v4 messagePayload];
    *(_DWORD *)buf = 138544130;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    id v26 = v4;
    __int16 v27 = 2112;
    __int16 v28 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message to add wallet key %@ payload: %@", buf, 0x2Au);
  }
  char v13 = [v4 numberForKey:*MEMORY[0x263F0C798]];
  uint64_t v14 = [v13 integerValue];

  objc_initWeak((id *)buf, v8);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__HMDHomeWalletKeyManager_handleAddWalletKeyMessage___block_invoke;
  v17[3] = &unk_264A1A168;
  objc_copyWeak(&v20, (id *)buf);
  id v15 = v4;
  id v18 = v15;
  id v16 = v6;
  id v19 = v16;
  [(HMDHomeWalletKeyManager *)v8 addWalletKeyWithOptions:v14 isOnboarding:1 flow:v16 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __53__HMDHomeWalletKeyManager_handleAddWalletKeyMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (v6)
  {
    [*(id *)(a1 + 32) respondWithError:v6];
  }
  else
  {
    id v9 = [WeakRetained home];
    id v10 = [v5 uuid];
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& ([v9 clientWalletKeyUUID], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      id v12 = [v9 clientWalletKeyUUID];

      char v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = v8;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        [v5 uuid];
        id v17 = v22 = v13;
        *(_DWORD *)buf = 138543874;
        id v26 = v16;
        __int16 v27 = 2112;
        __int16 v28 = v12;
        __int16 v29 = 2112;
        uint64_t v30 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Client Wallet Key UUID saved to local store, using it: %@ instead of %@", buf, 0x20u);

        char v13 = v22;
      }
    }
    else
    {
      id v12 = v10;
    }
    id v18 = *(void **)(a1 + 32);
    uint64_t v23 = *MEMORY[0x263F0CFA8];
    uint64_t v24 = v12;
    id v19 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v18 respondWithPayload:v19];

    id v20 = [v9 nfcReaderKeyManager];
    int v21 = [v20 accessoryManager];
    [v21 configureNFCReaderKeyForAllAccessoriesWithReason:@"Add wallet key message"];

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterTTU", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      [v8 addIssuerKeysToMatterAccessoriesWithFlow:*(void *)(a1 + 40)];
    }
  }
}

- (void)handleMessageForPairedWatches:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  BOOL v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v66 = v10;
    __int16 v67 = 2112;
    id v68 = v11;
    __int16 v69 = 2112;
    uint64_t v70 = (uint64_t)v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message for watch: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v8 watchManager];
  char v13 = v12;
  if (v12)
  {
    id v14 = [v12 connectedWatches];
    id v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_274);
    uint64_t v16 = [v15 count];
    uint64_t v17 = [v14 count];
    if (v16)
    {
      int64_t v53 = v15;
      id v18 = [v13 watches];
      uint64_t v19 = [v18 count];

      if (v16 == v19)
      {
        id v20 = 0;
      }
      else
      {
        __int16 v51 = v6;
        __int16 v29 = (void *)MEMORY[0x230FBD990]();
        uint64_t v30 = v8;
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = HMFGetLogIdentifier();
          [v51 UUID];
          id v33 = v49 = v29;
          *(_DWORD *)buf = 138544130;
          id v66 = v32;
          __int16 v67 = 2112;
          id v68 = v33;
          __int16 v69 = 2048;
          uint64_t v70 = v16;
          __int16 v71 = 2048;
          uint64_t v72 = v19;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Connected supported watch count: %lu is not equal to paired watch count: %lu", buf, 0x2Au);

          __int16 v29 = v49;
        }

        id v20 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2008];
        id v6 = v51;
      }
      id v28 = objc_alloc_init(MEMORY[0x263F58190]);
      __int16 v34 = [v4 name];
      int v35 = [v34 isEqualToString:*MEMORY[0x263F0C7A0]];

      if (v35)
      {
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_276;
        v62[3] = &unk_264A23A78;
        id v63 = v28;
        id v64 = v4;
        [(HMDHomeWalletKeyManager *)v8 fetchPayloadForAddWalletKeyRemoteMessageWithFlow:v6 completion:v62];

        uint64_t v36 = @"HMDHomeWalletKeyManagerPersistWalletKeyAddOptionsRemoteMessage";
      }
      else
      {
        id v37 = [v4 name];
        int v38 = [v37 isEqualToString:*MEMORY[0x263F0CF60]];

        if (v38)
        {
          [v28 finishWithResult:MEMORY[0x263EFFA78]];
          uint64_t v36 = @"HMDHomeWalletKeyManagerFetchWalletKeyDeviceStateRemoteMessage";
        }
        else
        {
          int v52 = v6;
          id v39 = (void *)MEMORY[0x230FBD990]();
          __int16 v40 = v8;
          id v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v42 = v50 = v39;
            int64_t v43 = [v52 UUID];
            *(_DWORD *)buf = 138543874;
            id v66 = v42;
            __int16 v67 = 2112;
            id v68 = v43;
            __int16 v69 = 2112;
            uint64_t v70 = (uint64_t)v4;
            _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Message is not supported for paired watches: %@", buf, 0x20u);

            id v39 = v50;
          }

          long long v44 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
          [v28 finishWithError:v44];

          uint64_t v36 = 0;
          id v6 = v52;
        }
      }
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_278;
      v60[3] = &unk_264A2F3E8;
      id v45 = v4;
      id v61 = v45;
      id v46 = (id)[v28 addFailureBlock:v60];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_2;
      v55[3] = &unk_264A1A140;
      v55[4] = v8;
      uint64_t v56 = v36;
      id v15 = v53;
      id v57 = v53;
      id v58 = v20;
      id v59 = v45;
      id v47 = v20;
      id v48 = (id)[v28 addSuccessBlock:v55];
    }
    else
    {
      uint64_t v21 = v17;
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = v8;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v26 = v25 = v6;
        [v25 UUID];
        __int16 v27 = v54 = v15;
        *(_DWORD *)buf = 138544130;
        id v66 = v26;
        __int16 v67 = 2112;
        id v68 = v27;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v4;
        __int16 v71 = 2048;
        uint64_t v72 = v21;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling message for paired watches:%@ connected watches count is %lu but none are supported", buf, 0x2Au);

        id v15 = v54;
        id v6 = v25;
      }

      id v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v28];
    }
  }
  else
  {
    id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v14];
  }
}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_276(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v6 = (id)[a2 mutableCopy];
    id v3 = [*(id *)(a1 + 40) messagePayload];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) messagePayload];
      [v6 addEntriesFromDictionary:v4];
    }
    [*(id *)(a1 + 32) finishWithResult:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "finishWithError:");
  }
}

uint64_t __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_278(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_3;
  v11[3] = &unk_264A1A118;
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  id v14 = *(id *)(a1 + 64);
  [v6 sendMessageWithName:v7 payload:v4 toWatches:v8 completion:v11];
}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v13 = a3;
  if (!v13) {
    id v13 = a1[4];
  }
  id v5 = a2;
  id v6 = objc_opt_class();
  uint64_t v7 = [a1[6] name];
  uint64_t v8 = [v6 responsePayloadForPairedWatchesWithMessageName:v7 responsePayloadByDevice:v5 error:v13];

  id v9 = [a1[6] name];
  LOBYTE(v5) = [v9 isEqualToString:*MEMORY[0x263F0C7A0]];

  if ((v5 & 1) != 0 && ([v13 code] == 2008 || !v13))
  {
    uint64_t v10 = [a1[5] home];
    id v11 = [v10 nfcReaderKeyManager];
    id v12 = [v11 accessoryManager];
    [v12 configureNFCReaderKeyForAllAccessoriesWithReason:@"Handle message for paired watches"];

    [a1[6] respondWithPayload:v8 error:v13];
  }
  else
  {
    [a1[6] respondWithPayload:v8 error:v13];
  }
}

BOOL __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 productInfo];
  id v3 = [v2 softwareVersion];
  id v4 = v3;
  if (v3) {
    [v3 operatingSystemVersion];
  }
  BOOL v5 = HMFOperatingSystemVersionCompare() != 1;

  return v5;
}

- (void)handleSetHomeKeyExpressSettingsMessage:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v46 = v10;
    __int16 v47 = 2112;
    id v48 = v11;
    __int16 v49 = 2112;
    id v50 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling set express settings message: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v8 passSerialNumber];
  if (v12)
  {
    uint64_t v13 = *MEMORY[0x263F0CCB8];
    uint64_t v14 = [v4 dataForKey:*MEMORY[0x263F0CCB8]];
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = [v4 numberForKey:*MEMORY[0x263F0CCC8]];
      uint64_t v17 = [v16 BOOLValue];

      id v18 = [v4 numberForKey:*MEMORY[0x263F0CCC0]];
      uint64_t v19 = [v18 BOOLValue];

      if (_os_feature_enabled_impl()
        && ((isInternalBuild() & 1) != 0
         || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
      {
        id v20 = +[HMDPassUpdater shared];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        id v40[2] = __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke;
        v40[3] = &unk_264A1A0D0;
        v40[4] = v8;
        id v41 = v6;
        id v42 = v4;
        char v43 = v19;
        char v44 = v17;
        [v20 setExpressSettingsForPassSerialNumber:v12 enableNFCExpress:v19 enableUWB:v17 authData:v15 flow:v41 completionHandler:v40];

        uint64_t v21 = v41;
      }
      else
      {
        __int16 v34 = [(HMDHomeWalletKeyManager *)v8 passLibrary];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke_271;
        v35[3] = &unk_264A1A0D0;
        v35[4] = v8;
        id v36 = v6;
        id v37 = v4;
        char v38 = v19;
        char v39 = v17;
        [v34 setExpressSettingsWithAuthData:v15 enableUWB:v17 enableNFCExpress:v19 passTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 flow:v36 completion:v35];

        uint64_t v21 = v36;
      }
    }
    else
    {
      __int16 v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = v8;
      __int16 v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        uint64_t v31 = [v6 UUID];
        __int16 v32 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        id v46 = v30;
        __int16 v47 = 2112;
        id v48 = v31;
        __int16 v49 = 2112;
        id v50 = v32;
        __int16 v51 = 2112;
        uint64_t v52 = v13;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings, missing key is payload %@:%@", buf, 0x2Au);
      }
      id v33 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v33];

      id v15 = 0;
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v8;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      id v26 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      id v46 = v25;
      __int16 v47 = 2112;
      id v48 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings, serial number is nil", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v15];
  }
}

void __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [a1[5] UUID];
      int v14 = 138543874;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings for home key: %@", (uint8_t *)&v14, 0x20u);
    }
    [a1[6] respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      id v12 = HMFBooleanToString();
      uint64_t v13 = HMFBooleanToString();
      int v14 = 138544130;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully set express settings for home key. isNFCExpressEnabled: %@, isUWBEnabled: %@", (uint8_t *)&v14, 0x2Au);
    }
    [a1[6] respondWithPayload:MEMORY[0x263EFFA78]];
  }
}

void __66__HMDHomeWalletKeyManager_handleSetHomeKeyExpressSettingsMessage___block_invoke_271(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [a1[5] UUID];
      int v14 = 138543874;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express settings for home key: %@", (uint8_t *)&v14, 0x20u);
    }
    [a1[6] respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      id v12 = HMFBooleanToString();
      uint64_t v13 = HMFBooleanToString();
      int v14 = 138544130;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully set express settings for home key. isNFCExpressEnabled: %@, isUWBEnabled: %@", (uint8_t *)&v14, 0x2Au);
    }
    [a1[6] respondWithPayload:MEMORY[0x263EFFA78]];
  }
}

- (void)handleEnableExpressForWalletKeyMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v33 = v10;
    __int16 v34 = 2112;
    int v35 = v11;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message to enable express: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v8 passSerialNumber];
  if (v12)
  {
    uint64_t v13 = *MEMORY[0x263F0CCB8];
    uint64_t v14 = [v4 dataForKey:*MEMORY[0x263F0CCB8]];
    if (v14)
    {
      id v15 = (void *)v14;
      __int16 v16 = [(HMDHomeWalletKeyManager *)v8 passLibrary];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __66__HMDHomeWalletKeyManager_handleEnableExpressForWalletKeyMessage___block_invoke;
      v29[3] = &unk_264A2E210;
      v29[4] = v8;
      id v30 = v6;
      id v31 = v4;
      [v16 enableExpressWithAuthData:v15 passTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 flow:v30 completion:v29];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = v8;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        id v26 = [v6 UUID];
        __int16 v27 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        id v33 = v25;
        __int16 v34 = 2112;
        int v35 = v26;
        __int16 v36 = 2112;
        id v37 = v27;
        __int16 v38 = 2112;
        uint64_t v39 = v13;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express, missing key is payload %@:%@", buf, 0x2Au);
      }
      id v28 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v28];

      id v15 = 0;
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    __int16 v18 = v8;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      id v33 = v20;
      __int16 v34 = 2112;
      int v35 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express, serial number is nil", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v15];
  }
}

void __66__HMDHomeWalletKeyManager_handleEnableExpressForWalletKeyMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [a1[5] UUID];
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express for home key: %@", (uint8_t *)&v12, 0x20u);
    }
    [a1[6] respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully enabled express for home key", (uint8_t *)&v12, 0x16u);
    }
    [a1[6] respondWithPayload:MEMORY[0x263EFFA78]];
  }
}

- (void)handleFetchAvailableWalletKeyEncodedPKPassMessage:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v58 = v10;
    __int16 v59 = 2112;
    id v60 = v11;
    __int16 v61 = 2112;
    id v62 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] handleFetchAvailableWalletKeyEncodedPKPassMessage: %@", buf, 0x20u);
  }
  int v12 = [v4 messagePayload];
  uint64_t v13 = objc_msgSend(v12, "hmf_setForKey:", *MEMORY[0x263F0CF90]);
  __int16 v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_261);

  id v15 = [(HMDHomeWalletKeyManager *)v8 home];
  if (([v15 hasAnyAccessoryWithWalletKeySupport] & 1) != 0
    || ([v14 containsObject:&unk_26E471008] & 1) != 0)
  {
    __int16 v16 = [(HMDHomeWalletKeyManager *)v8 passSerialNumber];
    if (!v16)
    {
      __int16 v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = v8;
      __int16 v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = HMFGetLogIdentifier();
        id v31 = [v6 UUID];
        *(_DWORD *)buf = 138543618;
        id v58 = v30;
        __int16 v59 = 2112;
        id v60 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, serial number is nil", buf, 0x16u);
      }
      id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v17];
      goto LABEL_24;
    }
    id v17 = [v15 name];
    if (v17)
    {
      uint64_t v18 = [(HMDHomeWalletKeyManager *)v8 passLibrary];
      id v19 = [v18 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v16 flow:v6];

      if (!v19 || ([v14 containsObject:&unk_26E471020] & 1) != 0)
      {
        __int16 v20 = [HMDHomeWalletKey alloc];
        uint64_t v21 = [(HMDHomeWalletKeyManager *)v8 dataSource];
        uint64_t v22 = [v21 walletKeyColor];
        +[HMDHomeWalletKeySecureElementInfo createForEasyProvisioning];
        uint64_t v23 = v50 = v14;
        uint64_t v56 = v23;
        [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
        __int16 v49 = v15;
        v25 = uint64_t v24 = v6;
        id v26 = [(HMDHomeWalletKey *)v20 initWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v16 state:1 walletKeyDescription:v17 homeName:v17 color:v22 nfcInfos:v25];

        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke_267;
        void v53[3] = &unk_264A1A0A8;
        v53[4] = v8;
        id v54 = v24;
        id v55 = v4;
        id v6 = v24;
        id v15 = v49;
        __int16 v14 = v50;
        [(HMDHomeWalletKeyManager *)v8 createPassDirectoryWithWalletKey:v26 options:0 shouldSkipResourceFiles:0 shouldCreateZipArchive:1 validateNFCInfo:0 flow:v54 completion:v53];

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
      char v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = v8;
      id v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        __int16 v47 = HMFGetLogIdentifier();
        [v6 UUID];
        id v48 = v52 = v44;
        *(_DWORD *)buf = 138543618;
        id v58 = v47;
        __int16 v59 = 2112;
        id v60 = v48;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass already exists", buf, 0x16u);

        char v44 = v52;
      }

      id v42 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = 1;
    }
    else
    {
      id v37 = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v8;
      uint64_t v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        [v6 UUID];
        id v41 = v51 = v37;
        *(_DWORD *)buf = 138543618;
        id v58 = v40;
        __int16 v59 = 2112;
        id v60 = v41;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, no name configured for home", buf, 0x16u);

        id v37 = v51;
      }

      id v42 = (void *)MEMORY[0x263F087E8];
      uint64_t v43 = 2;
    }
    id v26 = [v42 hmErrorWithCode:v43];
    [v4 respondWithError:v26];
    goto LABEL_23;
  }
  __int16 v32 = (void *)MEMORY[0x230FBD990]();
  id v33 = v8;
  __int16 v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    int v35 = HMFGetLogIdentifier();
    __int16 v36 = [v6 UUID];
    *(_DWORD *)buf = 138543618;
    id v58 = v35;
    __int16 v59 = 2112;
    id v60 = v36;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] No accessory in home supports wallet key", buf, 0x16u);
  }
  __int16 v16 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  [v4 respondWithError:v16];
LABEL_25:
}

void __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke_267(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    id v11 = [a1[4] fileManager];
    id v36 = v9;
    int v12 = [v11 fileHandleForReadingFromURL:v7 error:&v36];
    id v13 = v36;

    if (v12)
    {
      __int16 v14 = [a1[4] fileManager];
      id v35 = v13;
      char v15 = [v14 removeItemAtURL:v7 error:&v35];
      id v16 = v35;

      if ((v15 & 1) == 0)
      {
        id v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = a1[4];
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          __int16 v20 = HMFGetLogIdentifier();
          uint64_t v21 = [a1[5] UUID];
          *(_DWORD *)buf = 138544130;
          uint64_t v40 = v20;
          __int16 v41 = 2112;
          id v42 = v21;
          __int16 v43 = 2112;
          id v44 = v7;
          __int16 v45 = 2112;
          id v46 = v16;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);
        }
      }
      uint64_t v37 = *MEMORY[0x263F0C898];
      __int16 v38 = v12;
      uint64_t v22 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      [a1[6] respondWithPayload:v22];
      id v13 = v16;
    }
    else
    {
      __int16 v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = a1[4];
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = HMFGetLogIdentifier();
        id v33 = [a1[5] UUID];
        *(_DWORD *)buf = 138544130;
        uint64_t v40 = v32;
        __int16 v41 = 2112;
        id v42 = v33;
        __int16 v43 = 2112;
        id v44 = v7;
        __int16 v45 = 2112;
        id v46 = v13;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, file handle creation failed for file %@:%@", buf, 0x2Au);
      }
      id v34 = a1[6];
      uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v34 respondWithError:v22];
    }

    id v9 = v13;
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = a1[4];
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      __int16 v27 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v26;
      __int16 v41 = 2112;
      id v42 = v27;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass creation failed: %@", buf, 0x20u);
    }
    id v28 = a1[6];
    int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v28 respondWithError:v12];
  }
}

id __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
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

- (void)handleFetchWalletKeyColorMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v24 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling FetchWalletKeyColorMessage", buf, 0xCu);
  }
  uint64_t v10 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = v7;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    char v15 = [v10 UUID];
    *(_DWORD *)buf = 138543618;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling FetchWalletKeyColorMessage", buf, 0x16u);
  }
  id v16 = [(HMDHomeWalletKeyManager *)v12 fetchWalletKeyColorOptionWithFlow:v10];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__HMDHomeWalletKeyManager_handleFetchWalletKeyColorMessage___block_invoke;
  v20[3] = &unk_264A1FDA8;
  v20[4] = v12;
  id v21 = v10;
  id v22 = v4;
  id v17 = v4;
  id v18 = v10;
  id v19 = (id)[v16 addSuccessBlock:v20];
}

void __60__HMDHomeWalletKeyManager_handleFetchWalletKeyColorMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [a1[5] UUID];
    *(_DWORD *)buf = 138543874;
    id v13 = v7;
    __int16 v14 = 2112;
    char v15 = v8;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding to FetchWalletKeyColorMessage with color: %@", buf, 0x20u);
  }
  uint64_t v10 = *MEMORY[0x263F0C8C0];
  id v11 = v3;
  id v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [a1[6] respondWithPayload:v9];
}

- (void)handleFetchDeviceStateMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] handleFetchDeviceStateMessage: %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F0E3E8]);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke;
  v15[3] = &unk_264A1A080;
  v15[4] = v8;
  id v16 = v6;
  id v17 = v4;
  id v13 = v4;
  id v14 = v6;
  [(HMDHomeWalletKeyManager *)v8 updateDeviceStateWithCanAddWalletKey:v12 flow:v14 completion:v15];
}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_2;
  v8[3] = &unk_264A1A058;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  [v6 updateDeviceStateWithWalletKey:v4 flow:v7 completion:v8];
}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_3;
    v10[3] = &unk_264A1A058;
    v10[4] = v8;
    id v11 = v9;
    id v12 = *(id *)(a1 + 40);
    [v8 updateDeviceStateWithExpressEnablementConflictingPassDescription:v5 flow:v11 completion:v10];
  }
  else
  {
    [*(id *)(a1 + 40) respondWithError:v6];
  }
}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v25 = 0;
    uint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v25];
    id v8 = v25;
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[4];
    id v11 = HMFGetOSLogHandle();
    id v12 = v11;
    if (v7)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        id v14 = [a1[5] UUID];
        *(_DWORD *)buf = 138543874;
        __int16 v29 = v13;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding with wallet key device state: %@", buf, 0x20u);
      }
      id v15 = a1[6];
      uint64_t v26 = *MEMORY[0x263F0CF80];
      uint64_t v27 = v7;
      id v16 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [v15 respondWithPayload:v16];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        id v23 = [a1[5] UUID];
        *(_DWORD *)buf = 138544130;
        __int16 v29 = v22;
        __int16 v30 = 2112;
        id v31 = v23;
        __int16 v32 = 2112;
        id v33 = v5;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to encode wallet key device state %@:%@", buf, 0x2Au);
      }
      id v24 = a1[6];
      id v16 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v24 respondWithError:v16];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1[4];
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      id v21 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      __int16 v29 = v20;
      __int16 v30 = 2112;
      id v31 = v21;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update device state with express conflict. Error: %@", buf, 0x20u);
    }
    [a1[6] respondWithError:v6];
  }
}

- (void)unconfigure
{
  id v3 = [(HMDHomeWalletKeyManager *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDHomeWalletKeyManager *)self notificationCenter];
  [v4 removeObserver:self];
}

- (void)autoAddWalletKeyWithFlow:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:@"autoAddWalletKey API invocation" flow:v4 completion:0];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__HMDHomeWalletKeyManager_autoAddWalletKeyWithFlow___block_invoke;
    v6[3] = &unk_264A1A008;
    void v6[4] = self;
    id v7 = v4;
    [(HMDHomeWalletKeyManager *)self autoAddWalletKeyWithReason:@"autoAddWalletKey API invocation" flow:v7 completion:v6];
  }
}

void __52__HMDHomeWalletKeyManager_autoAddWalletKeyWithFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 domain];
  id v9 = v8;
  if (v8 == (void *)*MEMORY[0x263F0C710])
  {
    uint64_t v10 = [v6 code];

    if (v10 == 1)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        id v15 = [*(id *)(a1 + 40) UUID];
        int v21 = 138543874;
        __int16 v22 = v14;
        __int16 v23 = 2112;
        id v24 = v15;
        __int16 v25 = 2112;
        id v26 = v5;
        id v16 = "%{public}@[Flow: %@] Did not auto add wallet key, it already exists: %@";
LABEL_16:
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v21, 0x20u);
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  else
  {
  }
  id v17 = [v6 domain];
  if (v17 == @"HMDHomeAutoAddWalletKeyErrorDomain")
  {
    if ([v6 code] == 3)
    {
      [*(id *)(a1 + 32) _replaceWalletKeyAfterHH2Migration];
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  BOOL v18 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v18)
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) UUID];
      int v21 = 138543874;
      __int16 v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      id v26 = v6;
      id v16 = "%{public}@[Flow: %@] Failed to auto add wallet key: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v18)
  {
    id v19 = HMFGetLogIdentifier();
    __int16 v20 = [*(id *)(a1 + 40) UUID];
    int v21 = 138543874;
    __int16 v22 = v19;
    __int16 v23 = 2112;
    id v24 = v20;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully auto added wallet key: %@", (uint8_t *)&v21, 0x20u);
  }
  [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
LABEL_18:
}

- (NSString)passSerialNumber
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self home];
  id v4 = [v3 currentUser];
  id v5 = [v4 uuid];

  if (v5) {
    goto LABEL_5;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@currentUser is nil, so using cached currentUserUUID: %@", (uint8_t *)&v12, 0x16u);
  }
  id v5 = [(HMDHomeWalletKeyManager *)v7 currentUserUUID];
  if (v5)
  {
LABEL_5:
    uint64_t v10 = [(HMDHomeWalletKeyManager *)self passSerialNumberWithUserUUID:v5];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return (NSString *)v10;
}

- (BOOL)hasHomeKeyInWallet
{
  id v3 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  id v4 = [(HMDHomeWalletKeyManager *)self passLibrary];
  id v5 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
  id v6 = [v4 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v3 flow:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)handleAccessCodeChanged
{
  id v3 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    [(HMDHomeWalletKeyManager *)self updateWalletKeyWithReason:@"access code changed" flow:0 completion:0];
  }
  else
  {
    [(HMDHomeWalletKeyManager *)self updateWalletKeyAccessCodeFieldWithReason:@"access code changed"];
  }
}

- (void)recoverDueToUUIDChangeOfUser:(id)a3 fromOldUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke;
  block[3] = &unk_264A2F2F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Recovering due to uuid change of user: %@, old uuid: %@", buf, 0x2Au);
  }
  if ([*(id *)(a1 + 40) isCurrentUser])
  {
    id v10 = [*(id *)(a1 + 40) uuid];
    [*(id *)(a1 + 32) setCurrentUserUUID:v10];
  }
  id v11 = [*(id *)(a1 + 32) passSerialNumberWithUserUUID:*(void *)(a1 + 48)];
  id v12 = [*(id *)(a1 + 32) passLibrary];
  char v13 = [v12 removePassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v11 flow:v2];

  if (v13)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    __int16 v14 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke_246;
    v20[3] = &unk_264A1A030;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v2;
    [v14 addWalletKeyWithOptions:1 isOnboarding:0 flow:v21 completion:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      BOOL v18 = HMFGetLogIdentifier();
      id v19 = [v2 UUID];
      *(_DWORD *)buf = 138543618;
      id v24 = v18;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not recovering due to user UUID change because no home key exists in Wallet", buf, 0x16u);
    }
  }
}

void __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke_246(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      char v13 = [*(id *)(a1 + 32) UUID];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to recover due to user UUID change: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      uint64_t v15 = [*(id *)(a1 + 32) UUID];
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully recovered due to user UUID change", (uint8_t *)&v16, 0x16u);
    }
    [v9 createExpressModeSetUpBulletin];
  }
}

- (void)_replaceWalletKeyAfterHH2Migration
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomeWalletKeyManager *)self home];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 currentUser];
    if (v6)
    {
      if ([v5 hasAnyAccessoryWithWalletKeySupport])
      {
        if (![(HMDHomeWalletKeyManager *)self isWalletKeyRollForHH2InProgress])
        {
          id v17 = [MEMORY[0x263F42530] internalOnlyInitializer];
          __int16 v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = self;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = HMFGetLogIdentifier();
            uint64_t v22 = [v17 UUID];
            *(_DWORD *)buf = 138543618;
            uint64_t v37 = v21;
            __int16 v38 = 2112;
            uint64_t v39 = v22;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Deleting and re-adding wallet key because we just upgraded to HH2", buf, 0x16u);
          }
          __int16 v23 = [(HMDHomeWalletKeyManager *)v19 passLibrary];
          id v24 = [(HMDHomeWalletKeyManager *)v19 passSerialNumber];
          char v25 = [v23 removePassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v24 flow:v17];

          if ((v25 & 1) == 0)
          {
            id v26 = (void *)MEMORY[0x230FBD990]();
            __int16 v27 = v19;
            uint64_t v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              __int16 v29 = HMFGetLogIdentifier();
              uint64_t v30 = [v17 UUID];
              *(_DWORD *)buf = 138543618;
              uint64_t v37 = v29;
              __int16 v38 = 2112;
              uint64_t v39 = v30;
              _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not remove pass because no home key exists in Wallet", buf, 0x16u);
            }
          }
          if ([(HMDHomeWalletKeyManager *)v19 shouldEnableExpressModeAfterMigration])
          {
            uint64_t v31 = 3;
          }
          else
          {
            uint64_t v31 = 1;
          }
          [(HMDHomeWalletKeyManager *)v19 setIsWalletKeyRollForHH2InProgress:1];
          objc_initWeak((id *)buf, v19);
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __61__HMDHomeWalletKeyManager__replaceWalletKeyAfterHH2Migration__block_invoke;
          v33[3] = &unk_264A1A030;
          objc_copyWeak(&v35, (id *)buf);
          id v32 = v17;
          id v34 = v32;
          [(HMDHomeWalletKeyManager *)v19 addWalletKeyWithOptions:v31 isOnboarding:0 flow:v32 completion:v33];

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);

          goto LABEL_27;
        }
        id v7 = (void *)MEMORY[0x230FBD990]();
        uint64_t v8 = self;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = v10;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@HH2 key roll is already in progress", buf, 0xCu);
        }
      }
      else
      {
        id v7 = (void *)MEMORY[0x230FBD990]();
        uint64_t v8 = self;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = v16;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Can not migrate home key to HH2 because home does not have any accessory that supports wallet key", buf, 0xCu);
        }
      }
    }
    else
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      uint64_t v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v15;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@No current user yet", buf, 0xCu);
      }
    }

LABEL_27:

    goto LABEL_28;
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  char v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    __int16 v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@home is unexpectedly nil; cannot replace wallet key after HH2 migration",
      buf,
      0xCu);
  }
LABEL_28:
}

void __61__HMDHomeWalletKeyManager__replaceWalletKeyAfterHH2Migration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x230FBD990]([WeakRetained setIsWalletKeyRollForHH2InProgress:0]);
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      char v13 = [*(id *)(a1 + 32) UUID];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to re-add wallet pass after update to HH2 with error: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      uint64_t v15 = [*(id *)(a1 + 32) UUID];
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added new wallet key after update to HH2, removing settings from disk", (uint8_t *)&v16, 0x16u);
    }
    [v9 removeWalletKeyMigrationSettingsFileFromDisk];
  }
}

- (void)replaceWalletKeyAfterHH2MigrationIfNecessary
{
  id v3 = [(HMDHomeWalletKeyManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDHomeWalletKeyManager_replaceWalletKeyAfterHH2MigrationIfNecessary__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __71__HMDHomeWalletKeyManager_replaceWalletKeyAfterHH2MigrationIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldRollWalletKeyAfterMigration];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _replaceWalletKeyAfterHH2Migration];
  }
  return result;
}

- (void)handleHomeManagerHasFinishedStartingUp:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F42530] internalOnlyInitializer];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    __int16 v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling HMDHomeManagerHasFinishedStartingUpNotification", (uint8_t *)&v11, 0x16u);
  }
  if (_os_feature_enabled_impl()
    && ((isInternalBuild() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
  {
    [(HMDHomeWalletKeyManager *)v7 updateWalletKeyWithReason:@"home data loaded" flow:v5 completion:0];
  }
  else
  {
    [(HMDHomeWalletKeyManager *)v7 replaceWalletKeyAfterHH2MigrationIfNecessary];
  }
}

- (void)removeWalletKeyMigrationSettingsFileFromDisk
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self walletKeySettingsFileURL];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v16 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing wallet key express mode settings from disk", buf, 0xCu);
  }
  uint64_t v8 = [(HMDHomeWalletKeyManager *)v5 fileManager];
  id v14 = 0;
  [v8 removeItemAtURL:v3 error:&v14];
  id v9 = v14;

  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = v5;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v16 = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing wallet key migration settings file from disk : %@", buf, 0x16u);
    }
  }
}

- (BOOL)shouldEnableExpressModeAfterMigration
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self walletKeySettingsFileURL];
  id v4 = [(HMDHomeWalletKeyManager *)self fileManager];
  if ([v4 fileExistsAtURL:v3])
  {
    id v35 = 0;
    id v5 = [v4 dataWithContentsOfURL:v3 options:2 error:&v35];
    id v6 = v35;
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263F08928];
      uint64_t v8 = [(id)objc_opt_class() allowedClassesForWalletKeySettings];
      id v34 = v6;
      id v9 = [v7 unarchivedObjectOfClasses:v8 fromData:v5 error:&v34];
      id v10 = v34;

      if (v9)
      {
        id v11 = v9;
        objc_opt_class();
        int v12 = objc_opt_isKindOfClass() & 1;
        if (v12) {
          __int16 v13 = v11;
        }
        else {
          __int16 v13 = 0;
        }
        id v33 = v13;

        if (v12)
        {
          id v14 = [v11 objectForKeyedSubscript:@"HMDHomeWalletKeySettingsExpressModeEnabledForMigrationCodingKey"];
          uint64_t v15 = (void *)MEMORY[0x230FBD990]();
          int v16 = self;
          __int16 v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v37 = v18;
            __int16 v38 = 2112;
            id v39 = v14;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found express mode enabled: %@ for migration", buf, 0x16u);
          }
          char v19 = [v14 BOOLValue];
        }
        else
        {
          uint64_t v28 = (void *)MEMORY[0x230FBD990]();
          __int16 v29 = self;
          uint64_t v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v37 = v31;
            __int16 v38 = 2112;
            id v39 = v11;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);
          }
          char v19 = 0;
        }
      }
      else
      {
        id v24 = (void *)MEMORY[0x230FBD990]();
        char v25 = self;
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          __int16 v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v37 = v27;
          __int16 v38 = 2112;
          id v39 = v10;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);
        }
        char v19 = 0;
      }

      id v6 = v10;
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v37 = v23;
        __int16 v38 = 2112;
        id v39 = v3;
        __int16 v40 = 2112;
        id v41 = v6;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from wallet key settings file %@: %@", buf, 0x20u);
      }
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)shouldRollWalletKeyAfterMigration
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeWalletKeyManager *)self walletKeySettingsFileURL];
  id v4 = [(HMDHomeWalletKeyManager *)self fileManager];
  if ([v4 fileExistsAtURL:v3])
  {
    id v33 = 0;
    id v5 = [v4 dataWithContentsOfURL:v3 options:2 error:&v33];
    id v6 = v33;
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263F08928];
      uint64_t v8 = [(id)objc_opt_class() allowedClassesForWalletKeySettings];
      id v32 = v6;
      id v9 = [v7 unarchivedObjectOfClasses:v8 fromData:v5 error:&v32];
      id v10 = v32;

      if (v9)
      {
        id v11 = v9;
        objc_opt_class();
        int v12 = objc_opt_isKindOfClass() & 1;
        if (v12) {
          __int16 v13 = v11;
        }
        else {
          __int16 v13 = 0;
        }
        id v31 = v13;

        id v14 = (void *)MEMORY[0x230FBD990]();
        uint64_t v15 = self;
        int v16 = HMFGetOSLogHandle();
        __int16 v17 = v16;
        if (v12)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v35 = v18;
            __int16 v36 = 2112;
            id v37 = v11;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found wallet key settings for migration: %@", buf, 0x16u);
          }
          char v19 = [v11 objectForKeyedSubscript:@"HMDHomeWalletKeySettingsNeedsKeyRollAfterMigration"];
          char v20 = [v19 BOOLValue];
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            __int16 v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v35 = v29;
            __int16 v36 = 2112;
            id v37 = v11;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);
          }
          char v20 = 0;
        }
      }
      else
      {
        char v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v35 = v28;
          __int16 v36 = 2112;
          id v37 = v10;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);
        }
        char v20 = 0;
      }

      id v6 = v10;
    }
    else
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      uint64_t v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v35 = v24;
        __int16 v36 = 2112;
        id v37 = v3;
        __int16 v38 = 2112;
        id v39 = v6;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from wallet key settings file %@: %@", buf, 0x20u);
      }
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (id)walletKeySettingsFileURL
{
  id v3 = NSString;
  id v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  id v5 = [(HMDHomeWalletKeyManager *)self home];
  id v6 = [v5 uuid];
  id v7 = [v3 stringWithFormat:@"%@/HMDHomeWalletKeySetting-%@.plist", v4, v6];

  uint64_t v8 = [NSURL fileURLWithPath:v7];

  return v8;
}

- (void)didAddCurrentUserWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuid];
  [(HMDHomeWalletKeyManager *)self setCurrentUserUUID:v5];

  if (([v4 isOwner] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F42530] internalOnlyInitializer];
    id v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v6 UUID];
      int v12 = [v4 uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      char v19 = v11;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Did add current user: %@", buf, 0x20u);
    }
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [(HMDHomeWalletKeyManager *)v8 updateWalletKeyWithReason:@"Current user added" flow:v6 completion:0];
    }
    else
    {
      __int16 v13 = [(HMDHomeWalletKeyManager *)v8 workQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke;
      v14[3] = &unk_264A2F820;
      v14[4] = v8;
      id v15 = v6;
      dispatch_async(v13, v14);
    }
  }
}

void __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 hapAccessories];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_229);

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) passLibrary];
    id v6 = [*(id *)(a1 + 32) passSerialNumber];
    id v7 = [v5 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v6 flow:*(void *)(a1 + 40)];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v12 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543618;
        __int16 v23 = v11;
        __int16 v24 = 2112;
        char v25 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key exists", buf, 0x16u);
      }
    }
    else
    {
      char v19 = *(void **)(a1 + 32);
      __int16 v18 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_233;
      v20[3] = &unk_264A1A008;
      void v20[4] = v19;
      id v21 = v18;
      [v19 autoAddWalletKeyWithReason:@"did add current user" flow:v21 completion:v20];
    }
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      __int16 v17 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v16;
      __int16 v24 = 2112;
      char v25 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessories support wallet key", buf, 0x16u);
    }
  }
}

void __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v6 domain];
  if (v8 == @"HMDHomeAutoAddWalletKeyErrorDomain")
  {
    if ([v6 code] == 3)
    {
      [*(id *)(a1 + 32) _replaceWalletKeyAfterHH2Migration];
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  id v11 = HMFGetOSLogHandle();
  int v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 40) UUID];
      int v17 = 138543874;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      __int16 v20 = v14;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when current user was added: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = [*(id *)(a1 + 40) UUID];
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      __int16 v20 = v16;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when current user was added", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
LABEL_12:
}

uint64_t __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsWalletKey];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    char v90 = v8;
    __int16 v91 = 2112;
    id v92 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  id v9 = [v4 msgDispatcher];
  [(HMDHomeWalletKeyManager *)v6 setMessageDispatcher:v9];

  [(HMDHomeWalletKeyManager *)v6 setHome:v4];
  id v10 = [v4 currentUser];
  id v11 = [v10 uuid];
  [(HMDHomeWalletKeyManager *)v6 setCurrentUserUUID:v11];

  int v12 = [v4 nfcReaderKeyManager];
  __int16 v13 = [v12 accessoryManager];
  [v13 setDelegate:v6];

  id v14 = +[HMDXPCMessagePolicy policyWithEntitlements:131077];
  id v15 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v88 = v14;
  int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
  [v15 registerForMessage:*MEMORY[0x263F0C790] receiver:v6 policies:v16 selector:sel_handleAddWalletKeyMessage_];

  int v17 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  uint64_t v87 = v14;
  __int16 v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
  [v17 registerForMessage:*MEMORY[0x263F0C7A0] receiver:v6 policies:v18 selector:sel_handleMessageForPairedWatches_];

  __int16 v19 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v86 = v14;
  __int16 v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v86 count:1];
  [v19 registerForMessage:*MEMORY[0x263F0C820] receiver:v6 policies:v20 selector:sel_handleEnableExpressForWalletKeyMessage_];

  __int16 v21 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  uint64_t v85 = v14;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
  [v21 registerForMessage:*MEMORY[0x263F0CE18] receiver:v6 policies:v22 selector:sel_handleSetHomeKeyExpressSettingsMessage_];

  uint64_t v23 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v23, "setRoles:", objc_msgSend(v23, "roles") | 1);
  __int16 v24 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:5 remoteAccessRequired:0];
  char v25 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  v84[0] = v23;
  v84[1] = v24;
  uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
  [v25 registerForMessage:@"HMDHomeWalletKeyManagerPersistWalletKeyAddOptionsRemoteMessage" receiver:v6 policies:v26 selector:sel_handlePersistWalletKeyAddOptionsRemoteMessage_];

  __int16 v27 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  v83[0] = v23;
  v83[1] = v24;
  uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:2];
  [v27 registerForMessage:@"HMDHomeWalletKeyManagerFetchWalletKeyDeviceStateRemoteMessage" receiver:v6 policies:v28 selector:sel_handleFetchDeviceStateMessage_];

  __int16 v29 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  int64_t v82 = v14;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
  [v29 registerForMessage:*MEMORY[0x263F0C890] receiver:v6 policies:v30 selector:sel_handleFetchAvailableWalletKeyEncodedPKPassMessage_];

  id v31 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v81 = v14;
  id v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
  [v31 registerForMessage:*MEMORY[0x263F0C8B8] receiver:v6 policies:v32 selector:sel_handleFetchWalletKeyColorMessage_];

  id v33 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  long long v80 = v14;
  uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v80 count:1];
  [v33 registerForMessage:*MEMORY[0x263F0CF68] receiver:v6 policies:v34 selector:sel_handleFetchDeviceStateMessage_];

  id v35 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v79 = v14;
  __int16 v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  [v35 registerForMessage:*MEMORY[0x263F0CF60] receiver:v6 policies:v36 selector:sel_handleMessageForPairedWatches_];

  id v37 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  id v78 = v14;
  __int16 v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
  [v37 registerForMessage:*MEMORY[0x263F0CF70] receiver:v6 policies:v38 selector:sel_handleFetchMissingWalletKeysMessage_];

  id v39 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  long long v77 = v14;
  uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  [v39 registerForMessage:*MEMORY[0x263F0CFB0] receiver:v6 policies:v40 selector:sel_handleRestoreMissingWalletKeysMessage_];

  id v41 = [(HMDHomeWalletKeyManager *)v6 passLibrary];
  [v41 setDelegate:v6];

  uint64_t v42 = [(HMDHomeWalletKeyManager *)v6 passLibrary];
  [v42 start];

  __int16 v43 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v43 addObserver:v6 selector:sel_handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v4];

  id v44 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v44 addObserver:v6 selector:sel_handleHomeNameChangedNotification_ name:@"HMDHomeNameChangedNotification" object:v4];

  __int16 v45 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v45 addObserver:v6 selector:sel_handleHomeAddedAccessoryNotification_ name:@"HMDNotificationHomeAddedAccessory" object:v4];

  id v46 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v46 addObserver:v6 selector:sel_handleHomeAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:v4];

  uint64_t v47 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v47 addObserver:v6 selector:sel_handleAccessorySupportsWalleyKeyDidChangeNotification_ name:@"HMDAccessorySupportsWalletKeyDidChangeNotification" object:0];

  id v48 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v48 addObserver:v6 selector:sel_handleHomeDidUpdateNFCReaderKeyNotification_ name:@"HMDHomeDidUpdateNFCReaderKeyNotification" object:v4];

  __int16 v49 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  id v50 = [(HMDHomeWalletKeyManager *)v6 lostModeManager];
  [v49 addObserver:v6 selector:sel_handleLostModeUpdated name:@"HMDLostModeManagerUpdatedNotification" object:v50];

  __int16 v51 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v51 addObserver:v6 selector:sel_handleHomeHasOnboardedForWalletKeyChangeNotification_ name:@"HMDHomeHasOnboardedForWalletKeyChangeNotification" object:v4];

  uint64_t v52 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  uint64_t v53 = [(HMDHomeWalletKeyManager *)v6 lostModeManager];
  [v52 addObserver:v6 selector:sel_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification name:@"HMDLostModeManagerDidExitLostModeWithAuthCompleteNotification" object:v53];

  id v54 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v54 addObserver:v6 selector:sel_handleApplicationInstalled_ name:@"HMDApplicationInstalledNotification" object:0];

  id v55 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v55 addObserver:v6 selector:sel_handleAccessorySupportsAccessCodeDidChangeNotification_ name:@"HMDAccessorySupportsAccessCodeDidChangeNotification" object:0];

  uint64_t v56 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v56 addObserver:v6 selector:sel_handleApplicationUninstalled_ name:@"HMDApplicationUninstalledNotification" object:0];

  id v57 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  id v58 = [(HMDHomeWalletKeyManager *)v6 systemInfo];
  [v57 addObserver:v6 selector:sel_handleSystemInfoMigrationUpdatedNotification_ name:*MEMORY[0x263F424D0] object:v58];

  __int16 v59 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v59 addObserver:v6 selector:sel_handleUserScheduleDidChangeNotification_ name:@"HMDUserScheduleDidChangeNotification" object:0];

  id v60 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v60 addObserver:v6 selector:sel_handleHomeManagerHasFinishedStartingUp_ name:@"HMDHomeManagerHasFinishedStartingUpNotification" object:0];

  objc_initWeak(&location, v6);
  __int16 v61 = [(HMDHomeWalletKeyManager *)v6 dataSource];
  id v62 = [(HMDHomeWalletKeyManager *)v6 workQueue];
  uint64_t v71 = MEMORY[0x263EF8330];
  uint64_t v72 = 3221225472;
  uint64_t v73 = __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke;
  id v74 = &unk_264A2C170;
  objc_copyWeak(&v75, &location);
  LOBYTE(v34) = [v61 registerForPasscodeChangeNotificationWithQueue:v62 callback:&v71];

  if ((v34 & 1) == 0)
  {
    __int16 v67 = (void *)MEMORY[0x230FBD990](v63, v64, v65, v66);
    id v68 = v6;
    HMFGetOSLogHandle();
    __int16 v69 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      uint64_t v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v90 = v70;
      _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for passcode change notification", buf, 0xCu);
    }
  }
  [(HMDHomeWalletKeyManager *)v6 handleLostModeUpdated];
  objc_destroyWeak(&v75);
  objc_destroyWeak(&location);
}

void __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v3);

    id v4 = [MEMORY[0x263F42530] internalOnlyInitializer];
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v2;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling passcode changed", buf, 0x16u);
    }
    if (_os_feature_enabled_impl()
      && ((isInternalBuild() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)))
    {
      [v6 updateWalletKeyWithReason:@"passcode changed" flow:v4 completion:0];
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke_221;
      v10[3] = &unk_264A1A008;
      v10[4] = v6;
      id v11 = v4;
      [v6 autoAddWalletKeyWithReason:@"passcode changed" flow:v11 completion:v10];
    }
  }
}

void __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      __int16 v13 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543874;
      int v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key because passcode changed: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543618;
      int v17 = v14;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key because passcode changed", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
}

- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 fileManager:(id)a5 passLibrary:(id)a6 notificationCenter:(id)a7 watchManager:(id)a8 keychainStore:(id)a9 lostModeManager:(id)a10 dataSource:(id)a11 bulletinBoard:(id)a12 applicationRegistry:(id)a13 systemInfo:(id)a14 isoCredentialFactory:(id)a15
{
  id v44 = a3;
  id v43 = a4;
  id v33 = a5;
  id v42 = a5;
  id v41 = a6;
  id v34 = a7;
  id v40 = a7;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v36 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v45.receiver = self;
  v45.super_class = (Class)HMDHomeWalletKeyManager;
  __int16 v24 = [(HMDHomeWalletKeyManager *)&v45 init];
  char v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, a3);
    objc_storeStrong((id *)&v25->_workQueue, a4);
    objc_storeStrong((id *)&v25->_fileManager, v33);
    objc_storeStrong((id *)&v25->_passLibrary, a6);
    objc_storeStrong((id *)&v25->_notificationCenter, v34);
    objc_storeStrong((id *)&v25->_watchManager, a8);
    uint64_t v26 = _Block_copy(v23);
    id isoCredentialFactory = v25->_isoCredentialFactory;
    v25->_id isoCredentialFactory = v26;

    objc_storeStrong((id *)&v25->_keychainStore, a9);
    objc_storeStrong((id *)&v25->_lostModeManager, a10);
    objc_storeStrong((id *)&v25->_dataSource, a11);
    uint64_t v28 = [MEMORY[0x263EFF980] array];
    pendingUpdateWalletKeyOperations = v25->_pendingUpdateWalletKeyOperations;
    v25->_pendingUpdateWalletKeyOperations = (NSMutableArray *)v28;

    objc_storeStrong((id *)&v25->_bulletinBoard, a12);
    objc_storeStrong((id *)&v25->_applicationRegistry, a13);
    objc_storeStrong((id *)&v25->_systemInfo, a14);
    id isoCredentialACWGFactory = v25->_isoCredentialACWGFactory;
    v25->_id isoCredentialACWGFactory = &__block_literal_global_153_48672;
  }
  return v25;
}

HMDHomeWalletKeyISOCredentialACWG *__213__HMDHomeWalletKeyManager_initWithUUID_workQueue_fileManager_passLibrary_notificationCenter_watchManager_keychainStore_lostModeManager_dataSource_bulletinBoard_applicationRegistry_systemInfo_isoCredentialFactory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[HMDHomeWalletKeyISOCredentialACWG alloc] initWithIssuerKeyPairExternalRepresentation:v5 deviceCredentialPublicKeyExternalRepresentation:v4];

  return v6;
}

- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v15 = objc_alloc_init(HMDFileManager);
  int v17 = [[HMDWalletPassLibrary alloc] initWithWorkQueue:v5];
  int v16 = [MEMORY[0x263F08A00] defaultCenter];
  id v7 = +[HMDWatchManager sharedManager];
  __int16 v14 = [MEMORY[0x263F35AD0] systemStore];
  uint64_t v8 = +[HMDLostModeManager sharedManager];
  id v9 = objc_alloc_init(HMDHomeWalletDataSource);
  id v10 = +[HMDBulletinBoard sharedBulletinBoard];
  id v11 = +[HMDApplicationRegistry sharedRegistry];
  int v12 = [MEMORY[0x263F42648] systemInfo];
  __int16 v19 = [(HMDHomeWalletKeyManager *)self initWithUUID:v6 workQueue:v5 fileManager:v15 passLibrary:v17 notificationCenter:v16 watchManager:v7 keychainStore:v14 lostModeManager:v8 dataSource:v9 bulletinBoard:v10 applicationRegistry:v11 systemInfo:v12 isoCredentialFactory:&__block_literal_global_48679];

  return v19;
}

HMDHomeWalletKeyISOCredential *__50__HMDHomeWalletKeyManager_initWithUUID_workQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[HMDHomeWalletKeyISOCredential alloc] initWithHAPPairingIdentity:v5 deviceCredentialKeyExternalRepresentation:v4];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t212 != -1) {
    dispatch_once(&logCategory__hmf_once_t212, &__block_literal_global_1167);
  }
  id v2 = (void *)logCategory__hmf_once_v213;
  return v2;
}

void __38__HMDHomeWalletKeyManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v213;
  logCategory__hmf_once_v213 = v0;
}

+ (id)homekitErrorWithPassLibraryErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_2303E3DA0[a3 - 1];
  }
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0CF50] code:v3 userInfo:0];
  return v4;
}

+ (id)responsePayloadForPairedWatchesWithMessageName:(id)a3 responsePayloadByDevice:(id)a4 error:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 code];
  int v11 = [v7 isEqual:*MEMORY[0x263F0CF60]];
  if (v9) {
    BOOL v12 = v10 == 2008;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (v11) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v9) {
      id v15 = 0;
    }
    else {
      id v15 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    id v44 = v9;
    id v46 = v7;
    int v16 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v45 = v8;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v64 count:16];
    uint64_t v47 = v16;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v53;
      uint64_t v21 = *MEMORY[0x263F0CF80];
      uint64_t v48 = *MEMORY[0x263F0CF80];
      do
      {
        uint64_t v22 = 0;
        uint64_t v50 = v19;
        do
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * v22);
          __int16 v24 = [v17 objectForKey:v23];
          char v25 = [v24 objectForKey:v21];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v26 = v25;
          }
          else {
            uint64_t v26 = 0;
          }
          id v27 = v26;

          if (v27)
          {
            uint64_t v28 = (void *)MEMORY[0x263F08928];
            uint64_t v29 = objc_opt_class();
            id v51 = 0;
            uint64_t v30 = [v28 unarchivedObjectOfClass:v29 fromData:v27 error:&v51];
            id v31 = v51;
            if (v30)
            {
              [v16 setObject:v30 forKey:v23];
            }
            else
            {
              uint64_t v32 = v20;
              id v33 = (void *)MEMORY[0x230FBD990]();
              id v34 = a1;
              id v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                id v36 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                __int16 v59 = v36;
                __int16 v60 = 2112;
                id v61 = v27;
                __int16 v62 = 2112;
                id v63 = v31;
                _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode wallet key device state %@:%@", buf, 0x20u);

                int v16 = v47;
              }

              uint64_t v20 = v32;
              uint64_t v21 = v48;
              uint64_t v19 = v50;
            }
          }
          ++v22;
        }
        while (v19 != v22);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v64 count:16];
      }
      while (v19);
    }

    uint64_t v37 = encodeRootObjectForIncomingXPCMessage(v16, 0);
    id v38 = (void *)v37;
    if (v37)
    {
      uint64_t v56 = *MEMORY[0x263F0CF88];
      uint64_t v57 = v37;
      id v15 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v9 = v44;
    }
    else
    {
      id v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = a1;
      id v41 = HMFGetOSLogHandle();
      id v9 = v44;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v59 = v42;
        __int16 v60 = 2112;
        id v61 = 0;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to encoded wallet key device state by device %@", buf, 0x16u);

        int v16 = v47;
      }

      id v15 = 0;
    }

    id v8 = v45;
    id v7 = v46;
  }

  return v15;
}

+ (id)allowedClassesForWalletKeySettings
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

@end
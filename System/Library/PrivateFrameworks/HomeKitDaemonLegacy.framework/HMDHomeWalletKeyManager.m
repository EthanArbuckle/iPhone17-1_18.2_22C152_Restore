@interface HMDHomeWalletKeyManager
+ (id)homekitErrorWithPassLibraryErrorCode:(int64_t)a3;
+ (id)logCategory;
+ (id)responsePayloadForPairedWatchesWithMessageName:(id)a3 responsePayloadByDevice:(id)a4 error:(id)a5;
- (BOOL)canAutoAddWalletKeyWithError:(id *)a3;
- (BOOL)canSuspendWalletKey;
- (BOOL)hasHomeKeyInWallet;
- (BOOL)isHomeBeingRemoved;
- (BOOL)isWalletKeyRollForHH2InProgress;
- (BOOL)isWalletKeyUpdateOperationInProgress;
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
- (id)fetchWalletKeyColorOptionWithFlow:(id)a3;
- (id)isoCredentialFactory;
- (id)logIdentifier;
- (id)passSerialNumberWithUserUUID:(id)a3;
- (id)paymentApplicationsForWalletKey:(id)a3 validateNFCInfo:(BOOL)a4 defaultPaymentApplication:(id)a5 doesAnyAccessorySupportACB:(BOOL)a6 flow:(id)a7;
- (id)updatePassJSONAtURL:(id)a3 withWalletKey:(id)a4 options:(int64_t)a5 validateNFCInfo:(BOOL)a6 flow:(id)a7;
- (id)walletKeyByAddingAccessCodeToWalletKey:(id)a3;
- (id)walletKeySettingsFileURL;
- (void)_storeWalletKeyMigrationSettingsToDisk:(BOOL)a3;
- (void)accessoryManager:(id)a3 didUpdateWalletKeyColor:(int64_t)a4;
- (void)addISOCredentialV0WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)addISOCredentialV1WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)addISOCredentialWithPassAtURL:(id)a3 walletKey:(id)a4 flow:(id)a5 completion:(id)a6;
- (void)addWalletKey:(id)a3 withOptions:(int64_t)a4 assertion:(id)a5 flow:(id)a6;
- (void)addWalletKeyWithOptions:(int64_t)a3 isOnboarding:(BOOL)a4 flow:(id)a5 completion:(id)a6;
- (void)addWalletKeyWithOptions:(int64_t)a3 nfcReaderKey:(id)a4 flow:(id)a5 completion:(id)a6;
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
- (void)handleHomeNameChangedNotification:(id)a3;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)handleHomeWillBeRemoved;
- (void)handleLostModeManagerDidExitLostModeWithAuthCompleteNotification;
- (void)handleLostModeUpdated;
- (void)handleMessageForPairedWatches:(id)a3;
- (void)handleNFCReaderKeyUpdatedForWalletKey:(id)a3 flow:(id)a4;
- (void)handlePendingWalletKeyUpdateOperationsWithFlow:(id)a3;
- (void)handlePersistWalletKeyAddOptionsRemoteMessage:(id)a3;
- (void)handleRestoreMissingWalletKeysMessage:(id)a3;
- (void)handleSystemInfoMigrationUpdatedNotification:(id)a3;
- (void)passLibrary:(id)a3 didAddPassWithSerialNumber:(id)a4 typeIdentifier:(id)a5;
- (void)passLibrary:(id)a3 didRemovePassWithSerialNumber:(id)a4 typeIdentifier:(id)a5;
- (void)recoverDueToUUIDChangeOfUser:(id)a3 fromOldUUID:(id)a4;
- (void)removeWalletKeyOnboardingBulletin;
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
- (void)storeWalletKeyMigrationSettingsToDisk;
- (void)syncDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5;
- (void)syncDeviceCredentialKeyForAccessory:(id)a3 paymentApplications:(id)a4 flow:(id)a5;
- (void)unconfigure;
- (void)updateDeviceStateWithCanAddWalletKey:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateDeviceStateWithExpressEnablementConflictingPassDescription:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateDeviceStateWithWalletKey:(id)a3 flow:(id)a4 completion:(id)a5;
- (void)updateWalletKeyAccessCodeFieldWithReason:(id)a3;
- (void)updateWalletKeyByConfiguringEndpointsWithFlow:(id)a3;
- (void)updateWalletKeyStateToState:(int64_t)a3 flow:(id)a4;
@end

@implementation HMDHomeWalletKeyManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t164 != -1) {
    dispatch_once(&logCategory__hmf_once_t164, &__block_literal_global_314_33368);
  }
  v2 = (void *)logCategory__hmf_once_v165;
  return v2;
}

uint64_t __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke_267(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke_2;
  v12[3] = &unk_1E6A18640;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 code] != 2)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      v9 = [*(id *)(a1 + 48) UUID];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflicting pass description: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v11 = (id)[*(id *)(a1 + 56) mutableCopy];
    [v11 setExpressEnablementConflictingPassDescription:*(void *)(a1 + 64)];
    uint64_t v3 = *(void *)(a1 + 72);
    v4 = (void *)[v11 copy];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
  }
}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v25 = 0;
    v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v25];
    id v8 = v25;
    v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1[4];
    id v11 = HMFGetOSLogHandle();
    v12 = v11;
    if (v7)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        __int16 v14 = [a1[5] UUID];
        *(_DWORD *)buf = 138543874;
        v29 = v13;
        __int16 v30 = 2112;
        v31 = v14;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding with wallet key device state: %@", buf, 0x20u);
      }
      id v15 = a1[6];
      uint64_t v26 = *MEMORY[0x1E4F2D810];
      v27 = v7;
      __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [v15 respondWithPayload:v16];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [a1[5] UUID];
        *(_DWORD *)buf = 138544130;
        v29 = v22;
        __int16 v30 = 2112;
        v31 = v23;
        __int16 v32 = 2112;
        id v33 = v5;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to encode wallet key device state %@:%@", buf, 0x2Au);
      }
      id v24 = a1[6];
      __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v24 respondWithError:v16];
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = a1[4];
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      v29 = v20;
      __int16 v30 = 2112;
      v31 = v21;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update device state with express conflict. Error: %@", buf, 0x20u);
    }
    [a1[6] respondWithError:v6];
  }
}

- (NSString)passSerialNumber
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDHomeWalletKeyManager *)self home];
  v4 = [v3 currentUser];
  id v5 = [v4 uuid];

  if (v5) {
    goto LABEL_5;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@currentUser is nil, so using cached currentUserUUID: %@", (uint8_t *)&v12, 0x16u);
  }
  id v5 = [(HMDHomeWalletKeyManager *)v7 currentUserUUID];
  if (v5)
  {
LABEL_5:
    id v10 = [(HMDHomeWalletKeyManager *)self passSerialNumberWithUserUUID:v5];
  }
  else
  {
    id v10 = 0;
  }
  return (NSString *)v10;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)passSerialNumberWithUserUUID:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F2E7F8];
  id v5 = a3;
  id v6 = [(HMDHomeWalletKeyManager *)self uuid];
  v7 = [v4 passSerialNumberWithHomeUUID:v6 userUUID:v5];

  return v7;
}

- (id)logIdentifier
{
  v2 = [(HMDHomeWalletKeyManager *)self uuid];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)createPassDirectoryWithoutResourceFilesWithFlow:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    id v10 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    v50 = v9;
    __int16 v51 = 2112;
    v52 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory without resources files", buf, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v12 = [v11 resourceURL];

  id v13 = [v12 URLByAppendingPathComponent:@"HomeKey-Wallet.pass"];
  __int16 v14 = [(HMDHomeWalletKeyManager *)v7 passLibrary];
  uint64_t v15 = [v14 createTemporaryPassDirectoryURL];

  uint64_t v16 = [(HMDHomeWalletKeyManager *)v7 fileManager];
  id v48 = 0;
  char v17 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:0 attributes:0 error:&v48];
  id v18 = v48;

  if (v17)
  {
    v45 = v4;
    v19 = [v13 URLByAppendingPathComponent:@"pass.json"];
    v20 = [v15 URLByAppendingPathComponent:@"pass.json"];
    v21 = [(HMDHomeWalletKeyManager *)v7 fileManager];
    id v47 = v18;
    char v22 = [v21 copyItemAtURL:v19 toURL:v20 error:&v47];
    id v23 = v47;

    if (v22)
    {
      id v18 = v23;
    }
    else
    {
      __int16 v30 = (void *)MEMORY[0x1D9452090]();
      v31 = v7;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v33 = v43 = v30;
        __int16 v34 = [v45 UUID];
        *(_DWORD *)buf = 138544130;
        v50 = v33;
        __int16 v51 = 2112;
        v52 = v34;
        __int16 v53 = 2112;
        v54 = v15;
        __int16 v55 = 2112;
        id v56 = v23;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create directory at path %@:%@", buf, 0x2Au);

        __int16 v30 = v43;
      }

      id v35 = [(HMDHomeWalletKeyManager *)v31 fileManager];
      id v46 = v23;
      char v36 = [v35 removeItemAtURL:v15 error:&v46];
      id v18 = v46;

      if ((v36 & 1) == 0)
      {
        v37 = (void *)MEMORY[0x1D9452090]();
        v38 = v31;
        v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = v44 = v37;
          v41 = [v45 UUID];
          *(_DWORD *)buf = 138544130;
          v50 = v40;
          __int16 v51 = 2112;
          v52 = v41;
          __int16 v53 = 2112;
          v54 = v15;
          __int16 v55 = 2112;
          id v56 = v18;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

          v37 = v44;
        }
      }
    }
    id v4 = v45;
    id v29 = v15;
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v7;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v4 UUID];
      *(_DWORD *)buf = 138544130;
      v50 = v27;
      __int16 v51 = 2112;
      v52 = v28;
      __int16 v53 = 2112;
      v54 = v15;
      __int16 v55 = 2112;
      id v56 = v18;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create directory at path %@:%@", buf, 0x2Au);
    }
    id v29 = 0;
  }

  return v29;
}

- (id)updatePassJSONAtURL:(id)a3 withWalletKey:(id)a4 options:(int64_t)a5 validateNFCInfo:(BOOL)a6 flow:(id)a7
{
  BOOL v127 = a6;
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v11 = (__CFString *)a3;
  v130 = (__CFString *)a4;
  id v129 = a7;
  int v12 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    char v17 = [v129 UUID];
    id v18 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    v149 = v16;
    __int16 v150 = 2112;
    v151 = v17;
    __int16 v152 = 2112;
    v153 = v11;
    __int16 v154 = 2112;
    v155 = v130;
    __int16 v156 = 2048;
    int64_t v157 = a5;
    __int16 v158 = 2112;
    v159 = v18;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating pass JSON at URL: %@, withWalletKey: %@, options: %ld, validateNFCInfo: %@", buf, 0x3Eu);
  }
  v19 = [(HMDHomeWalletKeyManager *)v14 fileManager];
  id v132 = 0;
  v20 = [v19 JSONObjectWithURL:v11 error:&v132];
  v21 = (__CFString *)v132;

  if (v20)
  {
    char v22 = v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    id v25 = (__CFString *)[(__CFString *)v24 mutableCopy];
    if (v25)
    {
      uint64_t v26 = [NSNumber numberWithBool:a5 & 1];
      [(__CFString *)v25 setObject:v26 forKeyedSubscript:@"muteReadyForUseNotification"];

      v27 = [(__CFString *)v130 serialNumber];
      [(__CFString *)v25 setObject:v27 forKeyedSubscript:@"serialNumber"];

      v28 = [(__CFString *)v130 typeIdentifier];
      [(__CFString *)v25 setObject:v28 forKeyedSubscript:@"passTypeIdentifier"];

      id v29 = [(__CFString *)v130 walletKeyDescription];
      [(__CFString *)v25 setObject:v29 forKeyedSubscript:@"description"];

      [(__CFString *)v25 setObject:@"appleHomeKey" forKeyedSubscript:@"liveRenderType"];
      __int16 v30 = [(__CFString *)v130 passColorValue];
      [(__CFString *)v25 setObject:v30 forKeyedSubscript:@"homeKeyLiveType"];

      v31 = [(__CFString *)v130 labelColorValue];
      v125 = v25;
      [(__CFString *)v25 setObject:v31 forKeyedSubscript:@"foregroundColor"];

      __int16 v32 = [(__CFString *)v22 objectForKeyedSubscript:@"paymentApplications"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }
      id v34 = v33;

      id v35 = v34;
      char v36 = [v34 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v37 = v36;
      }
      else {
        v37 = 0;
      }
      id v38 = v37;

      uint64_t v39 = [v38 mutableCopy];
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = v14;
      v42 = HMFGetOSLogHandle();
      v43 = v42;
      v126 = (void *)v39;
      if (v39)
      {
        v124 = v21;
        v44 = v35;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v45 = HMFGetLogIdentifier();
          [v129 UUID];
          v47 = id v46 = v11;
          HMFBooleanToString();
          id v48 = v44;
          v49 = v20;
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v149 = v45;
          __int16 v150 = 2112;
          v151 = v47;
          __int16 v152 = 2112;
          v153 = v50;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] doesAnyAccessorySupportACB: %@", buf, 0x20u);

          id v11 = v46;
          v20 = v49;
          v44 = v48;
        }
        __int16 v51 = [(HMDHomeWalletKeyManager *)v41 paymentApplicationsForWalletKey:v130 validateNFCInfo:v127 defaultPaymentApplication:v126 doesAnyAccessorySupportACB:0 flow:v129];
        v52 = v51;
        if (v51 && !objc_msgSend(v51, "hmf_isEmpty"))
        {
          v119 = v41;
          v121 = v20;
          v128 = v11;
          [(__CFString *)v125 setObject:v52 forKeyedSubscript:@"paymentApplications"];
          v77 = [(__CFString *)v22 objectForKeyedSubscript:@"paymentCard"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v78 = v77;
          }
          else {
            v78 = 0;
          }
          id v79 = v78;

          v80 = (void *)[v79 mutableCopy];
          v120 = v80;
          if (v80)
          {
            v81 = [(__CFString *)v130 homeName];

            if (v81)
            {
              v145[1] = @"value";
              v146[0] = @"homeName";
              v145[0] = @"key";
              v82 = [(__CFString *)v130 homeName];
              v146[1] = v82;
              v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:2];
              v147 = v83;
              v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
              [v80 setObject:v84 forKeyedSubscript:@"headerFields"];
            }
            v85 = [MEMORY[0x1E4F1CA48] array];
            v86 = [MEMORY[0x1E4F1CA48] array];
            v87 = [(__CFString *)v130 accessCode];

            v123 = v85;
            if (v87)
            {
              v143[0] = @"key";
              v143[1] = @"label";
              v144[0] = @"arbitrary_supplementary_field_accessCode";
              v144[1] = @"ACCESS_CODE";
              v143[2] = @"value";
              v88 = [(__CFString *)v130 accessCode];
              v144[2] = v88;
              v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v144 forKeys:v143 count:3];
              [v86 addObject:v89];

              v85 = v123;
              [v123 addObject:@"arbitrary_supplementary_field_accessCode"];
            }
            v122 = v86;
            v90 = [(__CFString *)v130 changeAccessCodeHomeAppCustomURL];

            if (v90)
            {
              v141[0] = @"key";
              v141[1] = @"value";
              v142[0] = @"arbitrary_supplementary_field_changeAccessCode";
              v142[1] = @"CHANGE_ACCESS_CODE_BUTTON";
              v141[2] = @"link";
              v91 = [(__CFString *)v130 changeAccessCodeHomeAppCustomURL];
              v92 = [v91 absoluteString];
              v142[2] = v92;
              v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:3];
              [v86 addObject:v93];

              v85 = v123;
              [v123 addObject:@"arbitrary_supplementary_field_changeAccessCode"];
            }
            if (objc_msgSend(v85, "count", v44))
            {
              v139[0] = @"key";
              v139[1] = @"label";
              v140[0] = @"arbitrary_supplementary_field_personalPinCode";
              v140[1] = @"PERSONAL_PIN_CODE";
              v139[2] = @"link";
              v140[2] = @"wallet://card/card-id/sections?sections=access_code&authenticationRequirment=deviceOwner&title=PERSONAL_PIN_CODE_TITLE";
              v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:v139 count:3];
              [v86 addObject:v94];

              v95 = (void *)[v86 copy];
              [v80 setObject:v95 forKeyedSubscript:@"backFields"];

              v135 = @"arbitrary_supplementary_field_personalPinCode";
              v136 = @"rows";
              v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
              v137 = v96;
              v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
              v138[0] = v97;
              v133[0] = @"rows";
              v98 = (void *)[v85 copy];
              v134[0] = v98;
              v134[1] = MEMORY[0x1E4F1CC38];
              v133[1] = @"hidden";
              v133[2] = @"identifier";
              v134[2] = @"access_code";
              v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:3];
              v138[1] = v99;
              v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
              [v80 setObject:v100 forKeyedSubscript:@"passDetailSections"];
            }
            [(__CFString *)v125 setObject:v80 forKeyedSubscript:@"paymentCard"];
            v101 = [(HMDHomeWalletKeyManager *)v119 fileManager];
            v131 = v124;
            char v102 = [v101 writeJSONObject:v125 toURL:v128 error:&v131];
            v103 = v131;

            v104 = (void *)MEMORY[0x1D9452090]();
            v105 = v119;
            v106 = HMFGetOSLogHandle();
            v107 = v106;
            if (v102)
            {
              v20 = v121;
              v44 = v118;
              if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
              {
                v108 = HMFGetLogIdentifier();
                v109 = [v129 UUID];
                *(_DWORD *)buf = 138544130;
                v149 = v108;
                __int16 v150 = 2112;
                v151 = v109;
                __int16 v152 = 2112;
                v153 = v125;
                __int16 v154 = 2112;
                v155 = v128;
                _os_log_impl(&dword_1D49D5000, v107, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wrote pass JSON dict: %@, to URL: %@", buf, 0x2Au);
              }
              v62 = v125;
              v61 = (void *)[(__CFString *)v125 copy];
              id v11 = v128;
            }
            else
            {
              v20 = v121;
              v44 = v118;
              if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
              {
                v115 = HMFGetLogIdentifier();
                v116 = [v129 UUID];
                *(_DWORD *)buf = 138544130;
                v149 = v115;
                __int16 v150 = 2112;
                v151 = v116;
                __int16 v152 = 2112;
                v153 = v128;
                __int16 v154 = 2112;
                v155 = v103;
                _os_log_impl(&dword_1D49D5000, v107, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write pass JSON dict to URL %@:%@", buf, 0x2Au);
              }
              v61 = 0;
              id v11 = v128;
              v62 = v125;
            }

            v124 = v103;
          }
          else
          {
            v110 = (void *)MEMORY[0x1D9452090]();
            v111 = v119;
            v112 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
            {
              v113 = HMFGetLogIdentifier();
              v114 = [v129 UUID];
              *(_DWORD *)buf = 138544130;
              v149 = v113;
              __int16 v150 = 2112;
              v151 = v114;
              __int16 v152 = 2112;
              v153 = @"paymentCard";
              __int16 v154 = 2112;
              v155 = v22;
              _os_log_impl(&dword_1D49D5000, v112, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Key payment card does not exist in pass json %@:%@", buf, 0x2Au);
            }
            v61 = 0;
            id v11 = v128;
            v20 = v121;
            v62 = v125;
          }
        }
        else
        {
          __int16 v53 = (void *)MEMORY[0x1D9452090]();
          v54 = v41;
          __int16 v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = id v56 = v11;
            [v129 UUID];
            v58 = v44;
            v60 = v59 = v20;
            *(_DWORD *)buf = 138543618;
            v149 = v57;
            __int16 v150 = 2112;
            v151 = v60;
            _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not create any payment applications", buf, 0x16u);

            v20 = v59;
            v44 = v58;

            id v11 = v56;
          }

          v61 = 0;
          v62 = v125;
        }

        v21 = v124;
      }
      else
      {
        v44 = v35;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v74 = HMFGetLogIdentifier();
          [v129 UUID];
          v76 = v75 = v21;
          *(_DWORD *)buf = 138544130;
          v149 = v74;
          __int16 v150 = 2112;
          v151 = v76;
          __int16 v152 = 2112;
          v153 = @"paymentApplications";
          __int16 v154 = 2112;
          v155 = v125;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Payment application key: %@ does not exist in pass json: %@", buf, 0x2Au);

          v21 = v75;
          v44 = v35;
        }
        v61 = 0;
        v62 = v125;
      }
    }
    else
    {
      v62 = 0;
      v68 = (void *)MEMORY[0x1D9452090]();
      v69 = v14;
      v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v72 = v71 = v21;
        v73 = [v129 UUID];
        *(_DWORD *)buf = 138543874;
        v149 = v72;
        __int16 v150 = 2112;
        v151 = v73;
        __int16 v152 = 2112;
        v153 = v22;
        _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] passJSONObject is not of type NSDictionary: %@", buf, 0x20u);

        v21 = v71;
      }

      v61 = 0;
    }
  }
  else
  {
    v63 = (void *)MEMORY[0x1D9452090]();
    v64 = v14;
    v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = HMFGetLogIdentifier();
      v67 = [v129 UUID];
      *(_DWORD *)buf = 138544130;
      v149 = v66;
      __int16 v150 = 2112;
      v151 = v67;
      __int16 v152 = 2112;
      v153 = v11;
      __int16 v154 = 2112;
      v155 = v21;
      _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to load pass json at URL %@:%@", buf, 0x2Au);
    }
    v61 = 0;
  }

  return v61;
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 16, 1);
}

id __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_6;
  }
  uint64_t v5 = [v3 applicationIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 secureElementIdentifier];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v4 subCredentialIdentifier];
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = [v4 pairedReaderIdentifier];

        if (v11)
        {
LABEL_6:
          int v12 = (void *)[*(id *)(a1 + 48) mutableCopy];
          uint64_t v13 = [v4 paymentCredentialType];
          __int16 v14 = @"Aliro";
          if (v13 != 1) {
            __int16 v14 = 0;
          }
          if (v13) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = @"UnifiedAccess";
          }
          [v12 setObject:v15 forKeyedSubscript:@"paymentType"];
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
          [v12 setObject:v16 forKeyedSubscript:@"state"];

          char v17 = [v4 secureElementIdentifier];
          [v12 setObject:v17 forKeyedSubscript:@"secureElementIdentifier"];

          id v18 = [v4 applicationIdentifier];
          [v12 setObject:v18 forKeyedSubscript:@"applicationIdentifier"];

          v19 = [*(id *)(a1 + 56) serialNumber];
          [v12 setObject:v19 forKeyedSubscript:@"DPANIdentifier"];

          v20 = [*(id *)(a1 + 56) serialNumber];
          v21 = [*(id *)(a1 + 56) serialNumber];
          char v22 = objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v21, "length") - 4);
          [v12 setObject:v22 forKeyedSubscript:@"DPANSuffix"];

          id v23 = [MEMORY[0x1E4F1CA60] dictionary];
          id v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
          [v23 setObject:v24 forKeyedSubscript:@"state"];

          id v25 = [v4 subCredentialIdentifier];
          [v23 setObject:v25 forKeyedSubscript:@"identifier"];

          uint64_t v26 = [v4 pairedReaderIdentifier];
          [v23 setObject:v26 forKeyedSubscript:@"pairedReaderIdentifier"];

          v27 = [v12 objectForKeyedSubscript:@"automaticSelectionCriteria"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v28 = v27;
          }
          else {
            v28 = 0;
          }
          id v29 = v28;

          __int16 v30 = [v29 firstObject];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v31 = v30;
          }
          else {
            v31 = 0;
          }
          id v32 = v31;

          if (v32)
          {
            id v33 = [v4 pairedReaderIdentifier];
            if (v33)
            {
              id v34 = (void *)MEMORY[0x1D9452090]();
              id v35 = *(id *)(a1 + 32);
              char v36 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                v37 = HMFGetLogIdentifier();
                id v38 = [*(id *)(a1 + 40) UUID];
                *(_DWORD *)buf = 138543874;
                v61 = v37;
                __int16 v62 = 2112;
                v63 = v38;
                __int16 v64 = 2112;
                v65 = v33;
                _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting paired reader identifier in automatic selection criteria: %@", buf, 0x20u);
              }
              uint64_t v39 = (void *)[v32 mutableCopy];
              v59 = v33;
              v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
              [v39 setObject:v40 forKeyedSubscript:@"readerIDs"];

              v58 = v39;
              v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
              [v12 setObject:v41 forKeyedSubscript:@"automaticSelectionCriteria"];
            }
            [v12 setObject:v23 forKeyedSubscript:@"subcredential"];
            id v42 = v12;
          }
          else
          {
            v43 = (void *)MEMORY[0x1D9452090]();
            id v44 = *(id *)(a1 + 32);
            v45 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              id v46 = HMFGetLogIdentifier();
              id v47 = [*(id *)(a1 + 40) UUID];
              *(_DWORD *)buf = 138544130;
              v61 = v46;
              __int16 v62 = 2112;
              v63 = v47;
              __int16 v64 = 2112;
              v65 = @"automaticSelectionCriteria";
              __int16 v66 = 2112;
              v67 = v12;
              _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Automatic selection criteria key: %@ does not exist in payment application: %@", buf, 0x2Au);
            }
            id v42 = 0;
          }

          goto LABEL_32;
        }
        goto LABEL_29;
      }
    }
  }
LABEL_29:
  id v48 = (void *)MEMORY[0x1D9452090]();
  id v49 = *(id *)(a1 + 32);
  v50 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    __int16 v51 = HMFGetLogIdentifier();
    v52 = [*(id *)(a1 + 40) UUID];
    __int16 v53 = [v4 applicationIdentifier];
    v54 = [v4 secureElementIdentifier];
    __int16 v55 = [v4 subCredentialIdentifier];
    id v56 = [v4 pairedReaderIdentifier];
    *(_DWORD *)buf = 138544642;
    v61 = v51;
    __int16 v62 = 2112;
    v63 = v52;
    __int16 v64 = 2112;
    v65 = v53;
    __int16 v66 = 2112;
    v67 = v54;
    __int16 v68 = 2112;
    v69 = v55;
    __int16 v70 = 2112;
    v71 = v56;
    _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pass JSON because critical NFC Info is missing. applicationIdentifier: %@, secureElementIdentifier: %@, subCredentialIdentifier: %@, pairedReaderIdentifier: %@", buf, 0x3Eu);
  }
  id v42 = 0;
LABEL_32:

  return v42;
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
    uint64_t v9 = [v4 errorOnlyCompletionHandlerAdapter];
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
    uint64_t v9 = [v4 errorOnlyCompletionHandlerAdapter];
    [v6 addISOCredentialV0WithPassAtURL:v7 nfcInfo:v3 flow:v8 completion:v9];
  }

LABEL_6:
  return v4;
}

- (id)paymentApplicationsForWalletKey:(id)a3 validateNFCInfo:(BOOL)a4 defaultPaymentApplication:(id)a5 doesAnyAccessorySupportACB:(BOOL)a6 flow:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  __int16 v14 = [v11 nfcInfos];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __133__HMDHomeWalletKeyManager_paymentApplicationsForWalletKey_validateNFCInfo_defaultPaymentApplication_doesAnyAccessorySupportACB_flow___block_invoke;
  v20[3] = &unk_1E6A095C0;
  BOOL v24 = a4;
  v20[4] = self;
  id v21 = v13;
  id v22 = v12;
  id v23 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = objc_msgSend(v14, "na_map:", v20);

  return v18;
}

- (void)fetchExpressEnablementConflictingPassDescriptionWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  if (v9)
  {
    id v10 = [(HMDHomeWalletKeyManager *)self passLibrary];
    id v11 = [v10 secureElementIdentifier];

    if (v11)
    {
      id v12 = [(HMDHomeWalletKeyManager *)self home];
      id v13 = [v12 name];

      id v33 = +[HMDHomeWalletKeySecureElementInfo createForExpressConflictCheckWithSecureElementIdentifier:v11];
      __int16 v14 = [HMDHomeWalletKey alloc];
      id v15 = [(HMDHomeWalletKeyManager *)self dataSource];
      id v16 = v6;
      uint64_t v17 = [v15 walletKeyColor];
      v37 = v33;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      id v18 = v7;
      v20 = v19 = v9;
      uint64_t v21 = v17;
      id v6 = v16;
      id v22 = [(HMDHomeWalletKey *)v14 initWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v19 state:1 walletKeyDescription:v13 homeName:v13 color:v21 nfcInfos:v20];

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke;
      v34[3] = &unk_1E6A092A0;
      v34[4] = self;
      id v35 = v16;
      id v36 = v18;
      uint64_t v9 = v19;
      id v7 = v18;
      [(HMDHomeWalletKeyManager *)self createPassDirectoryWithWalletKey:v22 options:0 shouldSkipResourceFiles:1 shouldCreateZipArchive:0 validateNFCInfo:0 flow:v35 completion:v34];
    }
    else
    {
      v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = self;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        id v32 = [v6 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v31;
        __int16 v40 = 2112;
        v41 = v32;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express enablement conflicting pass description, secure element identifier is nil", buf, 0x16u);
      }
      id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    BOOL v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      v27 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v39 = v26;
      __int16 v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express enablement conflicting pass description, wallet key serial number is nil", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
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
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke;
      v16[3] = &unk_1E6A092F0;
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
    __int16 v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_3;
    v10[3] = &unk_1E6A09168;
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

- (void)updateDeviceStateWithExpressEnablementConflictingPassDescription:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__HMDHomeWalletKeyManager_updateDeviceStateWithExpressEnablementConflictingPassDescription_flow_completion___block_invoke;
  v15[3] = &unk_1E6A09318;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [(HMDHomeWalletKeyManager *)self fetchExpressEnablementConflictingPassDescriptionWithFlow:v14 completion:v15];
}

- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDHomeWalletKeyManager *)self passLibrary];
  char v10 = [v9 isWalletVisible];

  if (v10)
  {
    id v11 = [(HMDHomeWalletKeyManager *)self passLibrary];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__HMDHomeWalletKeyManager_fetchHomeKeySupportedWithFlow_completion___block_invoke;
    v13[3] = &unk_1E6A092C8;
    v13[4] = self;
    id v14 = v7;
    [v11 fetchHomeKeySupportedWithFlow:v6 completion:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D7E0] code:8 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (HMDWalletPassLibrary)passLibrary
{
  return (HMDWalletPassLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (void)handleFetchDeviceStateMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] handleFetchDeviceStateMessage: %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F2E848]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke;
  v15[3] = &unk_1E6A09190;
  v15[4] = v8;
  id v16 = v6;
  id v17 = v4;
  id v13 = v4;
  id v14 = v6;
  [(HMDHomeWalletKeyManager *)v8 updateDeviceStateWithCanAddWalletKey:v12 flow:v14 completion:v15];
}

- (void)updateDeviceStateWithCanAddWalletKey:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke;
  v14[3] = &unk_1E6A13888;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(HMDHomeWalletKeyManager *)self fetchHomeKeySupportedWithFlow:v10 completion:v14];
}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (void)addISOCredentialV0WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [v11 deviceCredentialKey];
  id v16 = (void *)MEMORY[0x1D9452090]();
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
      v45 = v20;
      __int16 v46 = 2112;
      id v47 = v21;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating iso credential...", buf, 0x16u);
    }
    __int16 v22 = [(HMDHomeWalletKeyManager *)v17 keychainStore];
    id v43 = 0;
    id v23 = [v22 getLocalPairingIdentity:&v43];
    id v24 = v43;

    if (v23)
    {
      [(HMDHomeWalletKeyManager *)v17 isoCredentialFactory];
      id v25 = v10;
      uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v27 = ((void (**)(void, void *, void *))v26)[2](v26, v23, v15);

      id v10 = v25;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke;
      v38[3] = &unk_1E6A09598;
      v38[4] = v17;
      id v39 = v12;
      id v42 = v13;
      id v40 = v11;
      id v41 = v25;
      [v27 encodeWithCompletion:v38];
    }
    else
    {
      id v37 = v10;
      __int16 v30 = (void *)MEMORY[0x1D9452090]();
      v31 = v17;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        [v12 UUID];
        id v34 = v36 = v30;
        *(_DWORD *)buf = 138543874;
        v45 = v33;
        __int16 v46 = 2112;
        id v47 = v34;
        __int16 v48 = 2112;
        id v49 = v24;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get local pairing identity %@", buf, 0x20u);

        __int16 v30 = v36;
      }

      v27 = [MEMORY[0x1E4F1CA60] dictionary];
      [v27 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      id v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52 userInfo:v27];
      (*((void (**)(id, void *))v13 + 2))(v13, v35);

      id v10 = v37;
    }
  }
  else
  {
    if (v19)
    {
      v28 = HMFGetLogIdentifier();
      id v29 = [v12 UUID];
      *(_DWORD *)buf = 138543618;
      v45 = v28;
      __int16 v46 = 2112;
      id v47 = v29;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding ISO credential because there is no device credential key", buf, 0x16u);
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
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

void __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HMDHomeWalletKeyManager_handleFetchDeviceStateMessage___block_invoke_2;
  v8[3] = &unk_1E6A09168;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  [v6 updateDeviceStateWithWalletKey:v4 flow:v7 completion:v8];
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

void __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1[4] workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HMDHomeWalletKeyManager_updateDeviceStateWithCanAddWalletKey_flow_completion___block_invoke_2;
  v9[3] = &unk_1E6A16328;
  id v7 = a1[5];
  char v13 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = a1[6];
  id v8 = v5;
  dispatch_async(v6, v9);
}

+ (id)homekitErrorWithPassLibraryErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1D54D3908[a3 - 1];
  }
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D7E0] code:v3 userInfo:0];
  return v4;
}

void __147__HMDHomeWalletKeyManager_createPassDirectoryWithWalletKey_options_shouldSkipResourceFiles_shouldCreateZipArchive_validateNFCInfo_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v5);

  if (!v3)
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_3;
    }
    id v7 = [*(id *)(a1 + 32) URLByAppendingPathExtension:@"pkpass"];
    id v8 = [WeakRetained fileManager];
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
      uint64_t v23 = MEMORY[0x1D9452090]();
      id v24 = WeakRetained;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v26 = v33 = v23;
        [*(id *)(a1 + 48) UUID];
        v28 = id v27 = v11;
        uint64_t v29 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        id v37 = v26;
        __int16 v38 = 2112;
        id v39 = v28;
        __int16 v40 = 2112;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        id v43 = v27;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create the zip file at URL %@:%@", buf, 0x2Au);

        id v11 = v27;
        uint64_t v23 = v33;
      }

      __int16 v22 = (void *)v23;
    }
    else
    {
      uint64_t v16 = MEMORY[0x1D9452090]();
      id v17 = WeakRetained;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = id v32 = v11;
        __int16 v20 = [*(id *)(a1 + 48) UUID];
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        id v37 = v19;
        __int16 v38 = 2112;
        id v39 = v20;
        __int16 v40 = 2112;
        uint64_t v41 = v21;
        __int16 v42 = 2112;
        id v43 = v15;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);

        id v11 = v32;
      }

      __int16 v22 = (void *)v16;
    }
    uint64_t v30 = *(void *)(a1 + 56);
    v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void, void, void *))(v30 + 16))(v30, 0, 0, v31);

    goto LABEL_16;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_3:
  v6();
LABEL_17:
}

void __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  char v10 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    id v11 = [a1[4] passLibrary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__HMDHomeWalletKeyManager_fetchExpressEnablementConflictingPassDescriptionWithFlow_completion___block_invoke_267;
    v19[3] = &unk_1E6A09278;
    id v20 = a1[6];
    [v11 fetchExpressEnablementConflictingPassDescriptionForPassAtURL:v7 completion:v19];

    id v12 = v20;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = a1[4];
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      id v17 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      __int16 v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass creation failed: %@", buf, 0x20u);
    }
    id v18 = (void (**)(id, void, void *))a1[6];
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    v18[2](v18, 0, v12);
  }
}

- (void)createPassDirectoryWithWalletKey:(id)a3 options:(int64_t)a4 shouldSkipResourceFiles:(BOOL)a5 shouldCreateZipArchive:(BOOL)a6 validateNFCInfo:(BOOL)a7 flow:(id)a8 completion:(id)a9
{
  LODWORD(v40) = a7;
  HIDWORD(v40) = a6;
  BOOL v10 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v13 = a8;
  id v41 = a9;
  id v14 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)MEMORY[0x1D9452090]();
  uint64_t v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    BOOL v19 = [v13 UUID];
    id v20 = HMFBooleanToString();
    uint64_t v21 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    v52 = v18;
    __int16 v53 = 2112;
    v54 = v19;
    __int16 v55 = 2112;
    id v56 = v42;
    __int16 v57 = 2048;
    int64_t v58 = a4;
    __int16 v59 = 2112;
    v60 = v20;
    __int16 v61 = 2112;
    __int16 v62 = v21;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory with wallet key: %@, options: %ld, shouldSkipResourceFiles: %@, shouldCreateZipArchive: %@", buf, 0x3Eu);
  }
  if (v10) {
    [(HMDHomeWalletKeyManager *)v16 createPassDirectoryWithoutResourceFilesWithFlow:v13];
  }
  else {
  __int16 v22 = [(HMDHomeWalletKeyManager *)v16 createPassDirectoryWithResourceFilesWithFlow:v13];
  }
  __int16 v23 = v22;
  if (v22)
  {
    id v24 = [v22 URLByAppendingPathComponent:@"pass.json"];
    __int16 v25 = [(HMDHomeWalletKeyManager *)v16 updatePassJSONAtURL:v24 withWalletKey:v42 options:a4 validateNFCInfo:v40 flow:v13];
    if (v25)
    {
      objc_initWeak((id *)buf, v16);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __147__HMDHomeWalletKeyManager_createPassDirectoryWithWalletKey_options_shouldSkipResourceFiles_shouldCreateZipArchive_validateNFCInfo_flow_completion___block_invoke;
      v43[3] = &unk_1E6A15D90;
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
      uint64_t v27 = (void *)MEMORY[0x1D9452090]();
      v28 = v16;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        v31 = [v13 UUID];
        *(_DWORD *)buf = 138543874;
        v52 = v30;
        __int16 v53 = 2112;
        v54 = v31;
        __int16 v55 = 2112;
        id v56 = v24;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pass JSON at URL: %@", buf, 0x20u);
      }
      id v32 = [(HMDHomeWalletKeyManager *)v28 fileManager];
      id v50 = 0;
      char v33 = [v32 removeItemAtURL:v23 error:&v50];
      id v26 = v50;

      if ((v33 & 1) == 0)
      {
        id v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = v28;
        id v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          id v37 = HMFGetLogIdentifier();
          __int16 v38 = [v13 UUID];
          *(_DWORD *)buf = 138544130;
          v52 = v37;
          __int16 v53 = 2112;
          v54 = v38;
          __int16 v55 = 2112;
          id v56 = v23;
          __int16 v57 = 2112;
          int64_t v58 = (int64_t)v26;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove item at URL %@:%@", buf, 0x2Au);
        }
      }
      id v39 = objc_msgSend(MEMORY[0x1E4F28C58], "hmErrorWithCode:", 52, v40);
      (*((void (**)(id, void, void, void *))v41 + 2))(v41, 0, 0, v39);
    }
  }
  else
  {
    id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    (*((void (**)(id, void, void, id))v41 + 2))(v41, 0, 0, v26);
  }
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)addISOCredentialWithPassAtURL:(id)a3 walletKey:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a4 nfcInfos];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke;
  v26[3] = &unk_1E6A09548;
  v26[4] = self;
  id v27 = v10;
  id v28 = v11;
  id v14 = v11;
  id v15 = v10;
  uint64_t v16 = objc_msgSend(v13, "na_map:", v26);
  id v17 = [v16 combineAllFutures];
  id v18 = (void *)MEMORY[0x1E4F7A0F0];
  BOOL v19 = [(HMDHomeWalletKeyManager *)self workQueue];
  id v20 = [v18 schedulerWithDispatchQueue:v19];
  uint64_t v21 = [v17 reschedule:v20];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__HMDHomeWalletKeyManager_addISOCredentialWithPassAtURL_walletKey_flow_completion___block_invoke_2;
  v24[3] = &unk_1E6A09570;
  id v25 = v12;
  id v22 = v12;
  id v23 = (id)[v21 addCompletionBlock:v24];
}

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
  return (HMDHomeKeySetupWalletLogEvent *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentUserUUID:(id)a3
{
}

- (NSUUID)currentUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (HMFSystemInfo)systemInfo
{
  return (HMFSystemInfo *)objc_getProperty(self, a2, 144, 1);
}

- (HMDApplicationRegistry)applicationRegistry
{
  return (HMDApplicationRegistry *)objc_getProperty(self, a2, 136, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 128, 1);
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
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (HMDLostModeManager)lostModeManager
{
  return (HMDLostModeManager *)objc_getProperty(self, a2, 104, 1);
}

- (HAPKeyStore)keychainStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 96, 1);
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

- (void)setHome:(id)a3
{
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)canSuspendWalletKey
{
  uint64_t v2 = [(HMDHomeWalletKeyManager *)self home];
  if ([v2 hasOnboardedForWalletKey]) {
    LOBYTE(v3) = 0;
  }
  else {
    int v3 = [v2 hasAnyAccessoryWithWalletKeySupport] ^ 1;
  }

  return v3;
}

- (void)handleHomeHasOnboardedForWalletKeyChangeNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self home];
  char v6 = [v5 hasOnboardedForWalletKey];

  id v7 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 UUID];
    id v13 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Home has onboarded flag changed to %@", buf, 0x20u);
  }
  BOOL v14 = [(HMDHomeWalletKeyManager *)v9 canSuspendWalletKey];
  id v15 = [(HMDHomeWalletKeyManager *)v9 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke;
  block[3] = &unk_1E6A12C78;
  char v19 = v6;
  BOOL v20 = v14;
  block[4] = v9;
  id v18 = v7;
  id v16 = v7;
  dispatch_async(v15, block);
}

void __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) removeWalletKeyOnboardingBulletin];
    int v3 = *(void **)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke_2;
    v6[3] = &unk_1E6A09118;
    v6[4] = v3;
    id v7 = v2;
    [v3 autoAddWalletKeyWithReason:@"onboarded for wallet key" flow:v7 completion:v6];
  }
  else if (*(unsigned char *)(a1 + 49))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 updateWalletKeyStateToState:6 flow:v5];
  }
}

void __80__HMDHomeWalletKeyManager_handleHomeHasOnboardedForWalletKeyChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      char v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when home has onboarded for wallet key: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      char v19 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when home onboarded for wallet key", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
}

- (void)updateWalletKeyByConfiguringEndpointsWithFlow:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating wallet key by configuring endpoints", buf, 0x16u);
  }
  id v10 = [(HMDHomeWalletKeyManager *)v6 home];
  if (v10)
  {
    id v11 = [(HMDHomeWalletKeyManager *)v6 passSerialNumber];
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = v6;
    BOOL v14 = HMFGetOSLogHandle();
    id v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = HMFGetLogIdentifier();
        id v17 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v16;
        __int16 v31 = 2112;
        id v32 = v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generating nfc info for existing wallet key", buf, 0x16u);
      }
      __int16 v18 = [v10 nfcReaderKey];
      char v19 = [v10 spiClientIdentifier];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke;
      v27[3] = &unk_1E6A18B30;
      v27[4] = v13;
      id v28 = v4;
      [(HMDHomeWalletKeyManager *)v13 configureWalletPaymentApplicationsWithNFCReaderKey:v18 serialNumber:v11 homeUniqueIdentifier:v19 homeGRK:0 flow:v28 completion:v27];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        id v26 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v25;
        __int16 v31 = 2112;
        id v32 = v26;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update home key, serial number is nil", buf, 0x16u);
      }
    }
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = v6;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      id v24 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      id v32 = v24;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home is nil", buf, 0x16u);
    }
  }
}

void __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_359;
    block[3] = &unk_1E6A19668;
    id v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v15 = v8;
    id v16 = v5;
    dispatch_async(v7, block);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v12;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to generate nfc info, when handling home did update nfc reader key", buf, 0x16u);
    }
  }
}

void __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_359(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] UUID];
    *(_DWORD *)buf = 138543618;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating existing wallet key with nfc info", buf, 0x16u);
  }
  id v7 = a1[4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_360;
  v8[3] = &unk_1E6A096D8;
  v8[4] = v7;
  id v9 = a1[6];
  [v7 enqueueWalletKeyUpdateOperation:v8 flow:a1[5]];
}

id __73__HMDHomeWalletKeyManager_updateWalletKeyByConfiguringEndpointsWithFlow___block_invoke_360(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
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
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v57 = a4;
  id v7 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    __int16 v12 = [v57 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v66 = v11;
    __int16 v67 = 2112;
    __int16 v68 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling NFC reader key updated for wallet key", buf, 0x16u);
  }
  id v13 = [(HMDHomeWalletKeyManager *)v9 home];
  uint64_t v14 = [v13 nfcReaderKey];
  id v15 = [v14 identifier];

  id v16 = [v13 nfcReaderKey];
  id v17 = [v16 publicKey];
  __int16 v18 = +[HMDNIST256Utilities identifier16BytesForKey:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  __int16 v20 = [v6 nfcInfos];
  uint64_t v21 = [v20 firstObject];
  uint64_t v22 = [v21 pairedReaderIdentifier];
  id v56 = objc_msgSend(v19, "hmf_initWithHexadecimalString:options:", v22, 0);

  __int16 v23 = [v6 nfcInfos];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke;
  v62[3] = &unk_1E6A09728;
  id v24 = v15;
  id v63 = v24;
  id v25 = v18;
  id v64 = v25;
  LODWORD(v21) = objc_msgSend(v23, "na_any:", v62);

  id v26 = (void *)MEMORY[0x1D9452090]();
  uint64_t v27 = v9;
  id v28 = HMFGetOSLogHandle();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v29)
    {
      uint64_t v30 = HMFGetLogIdentifier();
      __int16 v31 = [v57 UUID];
      *(_DWORD *)buf = 138544386;
      __int16 v66 = v30;
      __int16 v67 = 2112;
      __int16 v68 = v31;
      __int16 v69 = 2112;
      id v70 = v56;
      __int16 v71 = 2112;
      id v72 = v24;
      __int16 v73 = 2112;
      id v74 = v25;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader identifier of the existing wallet key: %@ matches with what exists in home. uaReaderGroupIdentifier: %@, v2ReaderGroupIdentifier: %@", buf, 0x34u);
    }
  }
  else
  {
    if (v29)
    {
      id v32 = HMFGetLogIdentifier();
      uint64_t v33 = [v57 UUID];
      *(_DWORD *)buf = 138544386;
      __int16 v66 = v32;
      __int16 v67 = 2112;
      __int16 v68 = v33;
      __int16 v69 = 2112;
      id v70 = v56;
      __int16 v71 = 2112;
      id v72 = v24;
      __int16 v73 = 2112;
      id v74 = v25;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader identifier of existing wallet key: %@ doesn't match with home uaReaderGroupIdentifier: %@ or v2ReaderGroupIdentifier: %@", buf, 0x34u);
    }
    id v34 = [(HMDHomeWalletKeyManager *)v27 dataSource];
    id v35 = objc_msgSend(v24, "hmf_hexadecimalRepresentation");
    id v36 = [v34 numberValueFromNoBackupStoreWithKey:v35];

    if (v36)
    {
      id v37 = (void *)MEMORY[0x1D9452090]();
      __int16 v38 = v27;
      id v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        id v41 = [v57 UUID];
        *(_DWORD *)buf = 138543874;
        __int16 v66 = v40;
        __int16 v67 = 2112;
        __int16 v68 = v41;
        __int16 v69 = 2112;
        id v70 = v36;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing and re-adding wallet key with default options: %@", buf, 0x20u);
      }
      id v42 = [(HMDHomeWalletKeyManager *)v38 passLibrary];
      id v43 = [v6 typeIdentifier];
      id v44 = [v6 serialNumber];
      char v45 = [v42 removePassWithTypeIdentifier:v43 serialNumber:v44 flow:v57];

      if (v45)
      {
        objc_initWeak((id *)buf, v38);
        uint64_t v46 = [v36 integerValue];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke_350;
        v58[3] = &unk_1E6A09750;
        objc_copyWeak(&v61, (id *)buf);
        id v59 = v57;
        id v60 = v6;
        [(HMDHomeWalletKeyManager *)v38 addWalletKeyWithOptions:v46 isOnboarding:0 flow:v59 completion:v58];

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        __int16 v51 = (void *)MEMORY[0x1D9452090]();
        v52 = v38;
        __int16 v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = HMFGetLogIdentifier();
          __int16 v55 = [v57 UUID];
          *(_DWORD *)buf = 138543874;
          __int16 v66 = v54;
          __int16 v67 = 2112;
          __int16 v68 = v55;
          __int16 v69 = 2112;
          id v70 = v6;
          _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove wallet key: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      if (!_os_feature_enabled_impl()
        || (isInternalBuild() & 1) == 0
        && !CFPreferencesGetAppBooleanValue(@"UWBUnlock", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
      {
        id v47 = [(HMDHomeWalletKeyManager *)v27 passLibrary];
        id v48 = [v6 nfcInfos];
        char v49 = [v48 firstObject];
        id v50 = [v49 subCredentialIdentifier];
        [v47 deleteKeyMaterialForSubCredentialId:v50];
      }
      [(HMDHomeWalletKeyManager *)v27 updateWalletKeyByConfiguringEndpointsWithFlow:v57];
    }
  }
}

uint64_t __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
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

void __70__HMDHomeWalletKeyManager_handleNFCReaderKeyUpdatedForWalletKey_flow___block_invoke_350(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 32) UUID];
      uint64_t v14 = *(void **)(a1 + 40);
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added wallet key: %@", (uint8_t *)&v16, 0x20u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 32) UUID];
    int v16 = 138543874;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add wallet key: %@", (uint8_t *)&v16, 0x20u);

    goto LABEL_6;
  }
}

- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v6 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling HomeDidUpdateNFCReaderKeyNotification", buf, 0x16u);
  }
  id v11 = [(HMDHomeWalletKeyManager *)v7 home];
  __int16 v12 = [v11 nfcReaderKey];

  if (v12)
  {
    id v13 = [(HMDHomeWalletKeyManager *)v7 workQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke;
    v19[3] = &unk_1E6A197C8;
    void v19[4] = v7;
    id v20 = v5;
    dispatch_async(v13, v19);
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v7;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      __int16 v18 = [v5 UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling nfc reader key update because it set to nil on home", buf, 0x16u);
    }
  }
}

void __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_2;
  v3[3] = &unk_1E6A09118;
  v3[4] = v2;
  id v4 = v1;
  [v2 autoAddWalletKeyWithReason:@"NFC reader key updated" flow:v4 completion:v3];
}

void __71__HMDHomeWalletKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    uint64_t v8 = [v6 domain];
    id v9 = v8;
    if (v8 == (void *)*MEMORY[0x1E4F2D140])
    {
      uint64_t v16 = [v6 code];

      if (v16 == 1)
      {
        id v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = *(id *)(a1 + 32);
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          id v21 = [*(id *)(a1 + 40) UUID];
          int v27 = 138543874;
          id v28 = v20;
          __int16 v29 = 2112;
          uint64_t v30 = v21;
          __int16 v31 = 2112;
          id v32 = v5;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key already exists: %@, when handling home did update nfc reader key", (uint8_t *)&v27, 0x20u);
        }
        uint64_t v10 = [*(id *)(a1 + 32) handleNFCReaderKeyUpdatedForWalletKey:v5 flow:*(void *)(a1 + 40)];
      }
    }
    else
    {
    }
    uint64_t v22 = (void *)MEMORY[0x1D9452090](v10);
    id v23 = *(id *)(a1 + 32);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      id v26 = [*(id *)(a1 + 40) UUID];
      int v27 = 138543874;
      id v28 = v25;
      __int16 v29 = 2112;
      uint64_t v30 = v26;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when NFC reader key was updated: %@", (uint8_t *)&v27, 0x20u);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      id v15 = [*(id *)(a1 + 40) UUID];
      int v27 = 138543618;
      id v28 = v14;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when NFC reader key was updated", (uint8_t *)&v27, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
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
    id v9 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v9 UUID];
      id v15 = [v8 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling accessory removed: %@", buf, 0x20u);
    }
    if ([(HMDHomeWalletKeyManager *)v11 canSuspendWalletKey])
    {
      uint64_t v16 = [(HMDHomeWalletKeyManager *)v11 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke;
      block[3] = &unk_1E6A19668;
      block[4] = v11;
      id v25 = v9;
      id v26 = v8;
      dispatch_async(v16, block);
    }
    else
    {
      id v17 = [(HMDHomeWalletKeyManager *)v11 passLibrary];
      id v18 = [(HMDHomeWalletKeyManager *)v11 passSerialNumber];
      id v19 = [v17 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v18 flow:v9];

      if (v19)
      {
        id v20 = [(HMDHomeWalletKeyManager *)v11 workQueue];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke_341;
        v21[3] = &unk_1E6A197C8;
        id v22 = v8;
        id v23 = v11;
        dispatch_async(v20, v21);
      }
    }
  }
}

uint64_t __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] UUID];
    id v7 = [a1[6] shortDescription];
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Suspending home key when accessory was removed: %@", (uint8_t *)&v9, 0x20u);
  }
  return [a1[4] updateWalletKeyStateToState:6 flow:a1[5]];
}

uint64_t __66__HMDHomeWalletKeyManager_handleHomeAccessoryRemovedNotification___block_invoke_341(uint64_t a1)
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    __int16 v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v8 uuid];
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      __int16 v31 = v14;
      uint64_t v15 = "%{public}@Not handling wallet key support change for accessory in other home: %@";
LABEL_13:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, v15, buf, 0x16u);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (([v7 supportsWalletKey] & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    __int16 v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v7 shortDescription];
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      __int16 v31 = v14;
      uint64_t v15 = "%{public}@Not handling wallet key support change, since support was disabled for accessory: %@";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v16 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    id v21 = [v16 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v20;
    __int16 v30 = 2112;
    __int16 v31 = v21;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling AccessorySupportsWalletKeyDidChangeNotification", buf, 0x16u);
  }
  id v22 = [(HMDHomeWalletKeyManager *)v18 workQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke;
  v24[3] = &unk_1E6A18668;
  void v24[4] = v18;
  id v25 = v7;
  id v26 = v16;
  id v27 = v4;
  id v23 = v16;
  dispatch_async(v22, v24);

LABEL_15:
}

void __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v33 = 0;
  char v3 = [v2 canAutoAddWalletKeyWithError:&v33];
  id v4 = v33;
  if (v3)
  {
    id v5 = a1[4];
    id v6 = a1[6];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_340;
    v29[3] = &unk_1E6A09700;
    v29[4] = v5;
    id v30 = v6;
    id v31 = a1[7];
    id v32 = a1[5];
    [v5 autoAddWalletKeyWithReason:@"wallet key support added" flow:v30 completion:v29];
  }
  else if ([a1[5] wasUpdatedWithServiceType:@"00000266-0000-1000-8000-0026BB765291"]&& (objc_msgSend(a1[5], "hasPostedBulletinForWalletKeyOnboarding") & 1) == 0)
  {
    __int16 v13 = [a1[4] home];
    if ([v13 isAdminUser]
      && ([a1[4] dataSource],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 isWatch],
          v14,
          (v15 & 1) == 0))
    {
      id v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = a1[4];
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = [a1[6] UUID];
        id v27 = [a1[5] shortDescription];
        *(_DWORD *)buf = 138543874;
        id v35 = v25;
        __int16 v36 = 2112;
        id v37 = v26;
        __int16 v38 = 2112;
        id v39 = v27;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home hasn't onboarded, creating lock onboarding bulletin after accessory was updated with wallet key support: %@", buf, 0x20u);
      }
      [a1[5] updateHasPostedBulletinForWalletKeyOnboarding:1];
      id v28 = [a1[4] bulletinBoard];
      [v28 insertLockOnboardingBulletinForHome:v13 serviceType:@"00000266-0000-1000-8000-0026BB765291"];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = a1[4];
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        id v20 = [a1[6] UUID];
        id v21 = [a1[5] shortDescription];
        *(_DWORD *)buf = 138543874;
        id v35 = v19;
        __int16 v36 = 2112;
        id v37 = v20;
        __int16 v38 = 2112;
        id v39 = v21;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not creating lock onboarding bulletin on non-admin or watch after accessory was updated with wallet key support: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1[4];
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      __int16 v11 = [a1[6] UUID];
      id v12 = [a1[5] shortDescription];
      *(_DWORD *)buf = 138543874;
      id v35 = v10;
      __int16 v36 = 2112;
      id v37 = v11;
      __int16 v38 = 2112;
      id v39 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home hasn't onboarded, not handling wallet key support update for accessory: %@", buf, 0x20u);
    }
  }
}

void __81__HMDHomeWalletKeyManager_handleAccessorySupportsWalleyKeyDidChangeNotification___block_invoke_340(id *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = [v6 domain];
    int v9 = v8;
    if (v8 != (void *)*MEMORY[0x1E4F2D140])
    {

LABEL_13:
      id v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = a1[4];
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        id v30 = [a1[5] UUID];
        id v31 = [a1[6] name];
        id v32 = [a1[7] shortDescription];
        int v33 = 138544386;
        id v34 = v29;
        __int16 v35 = 2112;
        __int16 v36 = v30;
        __int16 v37 = 2112;
        __int16 v38 = v31;
        __int16 v39 = 2112;
        uint64_t v40 = v32;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key when handling notification: %@ for accessory %@:%@", (uint8_t *)&v33, 0x34u);
      }
      goto LABEL_16;
    }
    uint64_t v17 = [v6 code];

    if (v17 != 1) {
      goto LABEL_13;
    }
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = a1[4];
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [a1[5] UUID];
      id v23 = [a1[6] name];
      id v24 = [a1[7] shortDescription];
      int v33 = 138544130;
      id v34 = v21;
      __int16 v35 = 2112;
      __int16 v36 = v22;
      __int16 v37 = 2112;
      __int16 v38 = v23;
      __int16 v39 = 2112;
      uint64_t v40 = v24;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home key already exists in wallet when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
    }
    [a1[4] syncDeviceCredentialKeyForAccessory:a1[7] paymentApplications:MEMORY[0x1E4F1CBF0] flow:a1[5]];
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
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = a1[4];
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [a1[5] UUID];
      char v15 = [a1[6] name];
      uint64_t v16 = [a1[7] shortDescription];
      int v33 = 138544130;
      id v34 = v13;
      __int16 v35 = 2112;
      __int16 v36 = v14;
      __int16 v37 = 2112;
      __int16 v38 = v15;
      __int16 v39 = 2112;
      uint64_t v40 = v16;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key when handling notification: %@ for accessory: %@", (uint8_t *)&v33, 0x2Au);
    }
    [a1[4] createExpressModeSetUpBulletin];
  }
LABEL_16:
}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
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
      int v9 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = HMFGetLogIdentifier();
        uint64_t v14 = [v9 UUID];
        *(_DWORD *)buf = 138543618;
        id v27 = v13;
        __int16 v28 = 2112;
        __int16 v29 = v14;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling accessory added", buf, 0x16u);
      }
      char v15 = [(HMDHomeWalletKeyManager *)v11 workQueue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke;
      v22[3] = &unk_1E6A18668;
      v22[4] = v11;
      id v23 = v9;
      id v24 = v4;
      id v25 = v8;
      id v16 = v9;
      dispatch_async(v15, v22);
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = HMFGetLogIdentifier();
        id v21 = [v8 shortDescription];
        *(_DWORD *)buf = 138543618;
        id v27 = v20;
        __int16 v28 = 2112;
        __int16 v29 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Added accessory does not support wallet key: %@", buf, 0x16u);
      }
    }
  }
}

void __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke(uint64_t a1)
{
  char v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_2;
  v4[3] = &unk_1E6A09700;
  v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 autoAddWalletKeyWithReason:@"accessory added" flow:v5 completion:v4];
}

void __64__HMDHomeWalletKeyManager_handleHomeAddedAccessoryNotification___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 domain];
  int v9 = v8;
  if (v8 != (void *)*MEMORY[0x1E4F2D140])
  {

    goto LABEL_9;
  }
  uint64_t v10 = [v6 code];

  if (v10 != 1)
  {
LABEL_9:
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = a1[4];
    id v20 = HMFGetOSLogHandle();
    id v21 = v20;
    if (v6)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [a1[5] UUID];
        id v24 = [a1[6] name];
        id v25 = [a1[7] shortDescription];
        int v30 = 138544386;
        id v31 = v22;
        __int16 v32 = 2112;
        int v33 = v23;
        __int16 v34 = 2112;
        __int16 v35 = v24;
        __int16 v36 = 2112;
        __int16 v37 = v25;
        __int16 v38 = 2112;
        id v39 = v6;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key when handling notification: %@ for accessory %@:%@", (uint8_t *)&v30, 0x34u);
      }
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        id v27 = [a1[5] UUID];
        __int16 v28 = [a1[6] name];
        __int16 v29 = [a1[7] shortDescription];
        int v30 = 138544130;
        id v31 = v26;
        __int16 v32 = 2112;
        int v33 = v27;
        __int16 v34 = 2112;
        __int16 v35 = v28;
        __int16 v36 = 2112;
        __int16 v37 = v29;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key when handling notification: %@ for accessory: %@", (uint8_t *)&v30, 0x2Au);
      }
      [a1[4] createExpressModeSetUpBulletin];
    }
    goto LABEL_16;
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = a1[4];
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    char v15 = [a1[5] UUID];
    id v16 = [a1[6] name];
    uint64_t v17 = [a1[7] shortDescription];
    int v30 = 138544130;
    id v31 = v14;
    __int16 v32 = 2112;
    int v33 = v15;
    __int16 v34 = 2112;
    __int16 v35 = v16;
    __int16 v36 = 2112;
    __int16 v37 = v17;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home key already exists in wallet when handling notification: %@ for accessory: %@", (uint8_t *)&v30, 0x2Au);
  }
  if ([a1[7] supportsAccessCode]) {
    [a1[4] updateWalletKeyAccessCodeFieldWithReason:@"accessory added"];
  }
  [a1[4] syncDeviceCredentialKeyForAccessory:a1[7] paymentApplications:MEMORY[0x1E4F1CBF0] flow:a1[5]];
LABEL_16:
}

- (void)handleHomeNameChangedNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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

  id v8 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  int v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    __int16 v13 = [v8 UUID];
    *(_DWORD *)buf = 138543618;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home name changed notification", buf, 0x16u);
  }
  uint64_t v14 = [(HMDHomeWalletKeyManager *)v10 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke;
  block[3] = &unk_1E6A19668;
  id v18 = v4;
  id v19 = v10;
  id v20 = v8;
  id v15 = v8;
  id v16 = v4;
  dispatch_async(v14, block);
}

void __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  char v3 = objc_msgSend(v2, "hmf_stringForKey:", @"HMDHomeNameNotificationKey");

  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __61__HMDHomeWalletKeyManager_handleHomeNameChangedNotification___block_invoke_2;
  int v9 = &unk_1E6A096D8;
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeWalletKeyManager *)self home];
  if (v3)
  {
    [(HMDHomeWalletKeyManager *)self setIsHomeBeingRemoved:1];
    id v4 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = [v4 UUID];
      int v14 = 138543874;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home will be removed: %@", (uint8_t *)&v14, 0x20u);
    }
    [(HMDHomeWalletKeyManager *)v6 updateWalletKeyStateToState:10 flow:v4];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home was nil in handleHomeWillBeRemoved", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDHomeWalletKeyManager_handleHomeUserRemovedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDHomeWalletKeyManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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

  id v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification user removed: %@", (uint8_t *)&v17, 0x20u);
  }
  id v12 = *(void **)(a1 + 40);
  __int16 v13 = [v5 uuid];
  int v14 = [v12 passSerialNumberWithUserUUID:v13];

  id v15 = [*(id *)(a1 + 40) passSerialNumber];
  int v16 = [v15 isEqual:v14];

  if (v16) {
    [*(id *)(a1 + 40) updateWalletKeyStateToState:10 flow:v6];
  }
}

- (void)handleLostModeManagerDidExitLostModeWithAuthCompleteNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [v3 UUID];
    *(_DWORD *)buf = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    int v16 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification did exit lost mode with auth complete notification", buf, 0x16u);
  }
  int v9 = [(HMDHomeWalletKeyManager *)v5 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__HMDHomeWalletKeyManager_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification__block_invoke;
  v11[3] = &unk_1E6A197C8;
  v11[4] = v5;
  id v12 = v3;
  id v10 = v3;
  dispatch_async(v9, v11);
}

uint64_t __91__HMDHomeWalletKeyManager_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyStateToState:1 flow:*(void *)(a1 + 40)];
}

- (void)handleLostModeUpdated
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeWalletKeyManager *)self lostModeManager];
  char v4 = [v3 isLost];

  id v5 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
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
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling notification lost mode updated to: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v7 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDHomeWalletKeyManager_handleLostModeUpdated__block_invoke;
  block[3] = &unk_1E6A18708;
  char v16 = v4;
  void block[4] = v7;
  id v15 = v5;
  id v13 = v5;
  dispatch_async(v12, block);
}

uint64_t __48__HMDHomeWalletKeyManager_handleLostModeUpdated__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) updateWalletKeyStateToState:7 flow:*(void *)(result + 40)];
  }
  return result;
}

- (void)handleApplicationUninstalled:(id)a3
{
  char v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 bundleIdentifier];

  id v8 = (id)*MEMORY[0x1E4F2D1C8];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [(HMDHomeWalletKeyManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDHomeWalletKeyManager_handleApplicationUninstalled___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v10, block);
  }
}

uint64_t __56__HMDHomeWalletKeyManager_handleApplicationUninstalled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyAccessCodeFieldWithReason:@"home app uninstalled"];
}

- (void)handleApplicationInstalled:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
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

  id v8 = [v7 bundleIdentifier];
  id v9 = (id)*MEMORY[0x1E4F2D1C8];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      char v16 = [v11 UUID];
      *(_DWORD *)buf = 138543618;
      id v31 = v15;
      __int16 v32 = 2112;
      int v33 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key because Home App was installed", buf, 0x16u);
    }
    uint64_t v17 = [(HMDHomeWalletKeyManager *)v13 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = v13;
    dispatch_async(v17, block);
LABEL_12:

    goto LABEL_13;
  }
  __int16 v18 = [v7 bundleIdentifier];
  int v19 = [v18 isEqualToString:@"com.apple.Passbook"];

  if (v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    __int16 v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v20 UUID];
      *(_DWORD *)buf = 138543618;
      id v31 = v24;
      __int16 v32 = 2112;
      int v33 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Auto adding wallet key after wallet app installed", buf, 0x16u);
    }
    id v26 = [(HMDHomeWalletKeyManager *)v22 workQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke_328;
    v27[3] = &unk_1E6A197C8;
    v27[4] = v22;
    __int16 v28 = v20;
    id v11 = v20;
    dispatch_async(v26, v27);

    uint64_t v17 = v28;
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyAccessCodeFieldWithReason:@"home app installed"];
}

uint64_t __54__HMDHomeWalletKeyManager_handleApplicationInstalled___block_invoke_328(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoAddWalletKeyWithFlow:*(void *)(a1 + 40)];
}

- (void)handleSystemInfoMigrationUpdatedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self systemInfo];
  int v6 = [v5 isMigrating];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v14 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Not handling migration updated notification, migration is in progress", buf, 0xCu);
    }
  }
  else
  {
    id v11 = [(HMDHomeWalletKeyManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDHomeWalletKeyManager_handleSystemInfoMigrationUpdatedNotification___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

void __72__HMDHomeWalletKeyManager_handleSystemInfoMigrationUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Auto adding wallet key after device migration has finished", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) autoAddWalletKeyWithFlow:v2];
}

- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
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
    uint64_t v15 = [(HMDHomeWalletKeyManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__HMDHomeWalletKeyManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(v15, block);
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = [v8 uuid];
      *(_DWORD *)buf = 138543618;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling access code support change for accessory in other home: %@", buf, 0x16u);
    }
  }
}

uint64_t __82__HMDHomeWalletKeyManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWalletKeyAccessCodeFieldWithReason:@"supports access code changed"];
}

- (void)accessoryManager:(id)a3 didUpdateWalletKeyColor:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  int v8 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v9 = (void *)MEMORY[0x1D9452090]();
  __int16 v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    id v13 = [v8 UUID];
    int v14 = HMHomeWalletKeyColorAsString();
    *(_DWORD *)buf = 138543874;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling wallet key color did update delegate callback: %@", buf, 0x20u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HMDHomeWalletKeyManager_accessoryManager_didUpdateWalletKeyColor___block_invoke;
  v16[3] = &unk_1E6A096B0;
  v16[4] = v10;
  void v16[5] = a4;
  uint64_t v15 = _Block_copy(v16);
  [(HMDHomeWalletKeyManager *)v10 enqueueWalletKeyUpdateOperation:v15 flow:v8];
}

id __68__HMDHomeWalletKeyManager_accessoryManager_didUpdateWalletKeyColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if ([v3 state] == 1)
  {
    id v5 = (void *)[v3 mutableCopy];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
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
    id v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message that home key was removed from wallet", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2D200] messagePayload:0];
    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    __int16 v19 = [(HMDHomeWalletKeyManager *)v14 uuid];
    uint64_t v20 = (void *)[v18 initWithTarget:v19];

    [v17 setDestination:v20];
    [v17 setRequiresWalletKeyEntitlement];
    __int16 v21 = [(HMDHomeWalletKeyManager *)v14 messageDispatcher];
    [v21 sendMessage:v17];

    id v22 = [(HMDHomeWalletKeyManager *)v14 pendingUpdateWalletKeyOperations];
    [v22 removeAllObjects];

    uint64_t v23 = [(HMDHomeWalletKeyManager *)v14 home];
    id v24 = [v23 nfcReaderKeyManager];
    uint64_t v25 = [v24 accessoryManager];
    [v25 handleWalletKeyRemoved];
  }
}

- (void)passLibrary:(id)a3 didAddPassWithSerialNumber:(id)a4 typeIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
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
    id v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = HMFGetLogIdentifier();
      int v34 = 138543362;
      __int16 v35 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message that home key was added in wallet", (uint8_t *)&v34, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2D1F0] messagePayload:0];
    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    __int16 v19 = [(HMDHomeWalletKeyManager *)v14 uuid];
    uint64_t v20 = (void *)[v18 initWithTarget:v19];

    [v17 setDestination:v20];
    [v17 setRequiresWalletKeyEntitlement];
    __int16 v21 = [(HMDHomeWalletKeyManager *)v14 messageDispatcher];
    [v21 sendMessage:v17];
  }
  id v22 = [(HMDHomeWalletKeyManager *)self passLibrary];
  uint64_t v23 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  id v24 = [v22 walletKeyWithTypeIdentifier:v10 serialNumber:v9 flow:v23];

  if (v24)
  {
    uint64_t v25 = [(HMDHomeWalletKeyManager *)self home];
    int v26 = [v25 nfcReaderKey];

    if (v26)
    {
      id v27 = [(HMDHomeWalletKeyManager *)self dataSource];
      uint64_t v28 = [v26 identifier];
      __int16 v29 = objc_msgSend(v28, "hmf_hexadecimalRepresentation");
      [v27 persistNumberValueToNoBackupStore:0 withKey:v29];
    }
    else
    {
      int v30 = (void *)MEMORY[0x1D9452090]();
      id v31 = self;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v33 = HMFGetLogIdentifier();
        int v34 = 138543362;
        __int16 v35 = v33;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not persisting settings because could not find reader key after pass was added", (uint8_t *)&v34, 0xCu);
      }
    }
  }
}

- (void)showExpressEnabledNotificationForWalletKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
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
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__HMDHomeWalletKeyManager_showExpressEnabledNotificationForWalletKey___block_invoke;
      v17[3] = &unk_1E6A197F0;
      v17[4] = self;
      [v12 showExpressEnabledUserNotificationForWalletKeyWithPassUniqueID:v11 completion:v17];
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      int v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pass unique id of wallet key: %@", buf, 0x16u);
      }
    }
  }
}

void __70__HMDHomeWalletKeyManager_showExpressEnabledNotificationForWalletKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v13, v12);
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  os_log_type_t v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint32_t v12 = (void *)MEMORY[0x1D9452090]();
  int v13 = self;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    id v16 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    id v39 = v15;
    __int16 v40 = 2112;
    __int16 v41 = v16;
    __int16 v42 = 2112;
    id v43 = v8;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Auto adding wallet key with reason: %@", buf, 0x20u);
  }
  uint64_t v17 = [(HMDHomeWalletKeyManager *)v13 home];
  id v18 = [v17 homeManager];
  __int16 v19 = [v18 homeUUIDsWithAutoAddWalletKeySuppressed];
  __int16 v20 = [v17 uuid];
  int v21 = [v19 containsObject:v20];

  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    uint64_t v23 = v13;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      int v26 = [v9 UUID];
      *(_DWORD *)buf = 138543618;
      id v39 = v25;
      __int16 v40 = 2112;
      __int16 v41 = v26;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot auto add wallet key because it is suppressed", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
LABEL_12:
    v10[2](v10, 0, v27);
    goto LABEL_13;
  }
  id v37 = 0;
  BOOL v28 = [(HMDHomeWalletKeyManager *)v13 canAutoAddWalletKeyWithError:&v37];
  id v27 = v37;
  if (!v28)
  {
    __int16 v29 = (void *)MEMORY[0x1D9452090]();
    int v30 = v13;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      int v33 = [v9 UUID];
      *(_DWORD *)buf = 138544130;
      id v39 = v32;
      __int16 v40 = 2112;
      __int16 v41 = v33;
      __int16 v42 = 2112;
      id v43 = v8;
      __int16 v44 = 2112;
      id v45 = v27;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot auto add wallet key for reason: %@ with error: %@", buf, 0x2Au);
    }
    goto LABEL_12;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke;
  v34[3] = &unk_1E6A10900;
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
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_2;
  v6[3] = &unk_1E6A09688;
  v6[4] = v5;
  char v9 = a2;
  id v7 = a1[5];
  id v8 = a1[6];
  [v5 fetchShouldAutoEnableExpressWithCompletion:v6];
}

void __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HMDHomeWalletKeyManager_autoAddWalletKeyWithReason_flow_completion___block_invoke_3;
  v6[3] = &unk_1E6A0F878;
  char v9 = *(unsigned char *)(a1 + 56);
  char v10 = a2;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
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

- (void)fetchShouldAutoEnableExpressWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void))a3;
  id v4 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDHomeWalletKeyManager *)self dataSource];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  char v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    char v10 = HMFGetLogIdentifier();
    os_log_type_t v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    __int16 v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Updating wallet key access code field with reason: %@", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDHomeWalletKeyManager_updateWalletKeyAccessCodeFieldWithReason___block_invoke;
  aBlock[3] = &unk_1E6A09660;
  aBlock[4] = v8;
  uint32_t v12 = _Block_copy(aBlock);
  [(HMDHomeWalletKeyManager *)v8 enqueueWalletKeyUpdateOperation:v12 flow:v6];
}

id __68__HMDHomeWalletKeyManager_updateWalletKeyAccessCodeFieldWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if ([v3 state] == 1)
  {
    id v5 = [*(id *)(a1 + 32) walletKeyByAddingAccessCodeToWalletKey:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)fetchShouldSuppressWalletNotificationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
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
    id v9 = (id)*MEMORY[0x1E4F2D1C8];
    char v10 = [v8 applicationInfoForBundleIdentifier:v9];

    if (v10)
    {
      os_log_type_t v11 = [(HMDHomeWalletKeyManager *)self bulletinBoard];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke;
      v12[3] = &unk_1E6A09638;
      void v12[4] = self;
      int v13 = v4;
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
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke_2;
  v5[3] = &unk_1E6A0A490;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __79__HMDHomeWalletKeyManager_fetchShouldSuppressWalletNotificationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)syncDeviceCredentialKeyForAccessory:(id)a3 paymentApplications:(id)a4 flow:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  uint32_t v12 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  int v13 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  int v14 = (void *)MEMORY[0x1D9452090]();
  __int16 v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    uint64_t v17 = v26 = v9;
    [v13 UUID];
    uint64_t v25 = v12;
    v19 = __int16 v18 = v10;
    uint64_t v20 = [v18 UUID];
    int v21 = [v8 uuid];
    *(_DWORD *)buf = 138544130;
    id v31 = v17;
    __int16 v32 = 2112;
    int v33 = v19;
    __int16 v34 = 2112;
    id v35 = v20;
    __int16 v36 = 2112;
    id v37 = v21;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] Syncing device credential key to accessory: %@", buf, 0x2Au);

    id v10 = v18;
    uint32_t v12 = v25;

    id v9 = v26;
  }

  uint64_t v22 = [(HMDHomeWalletKeyManager *)v15 passLibrary];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke;
  v27[3] = &unk_1E6A09610;
  v27[4] = v15;
  id v28 = v13;
  id v29 = v8;
  id v23 = v8;
  id v24 = v13;
  [v22 fetchTransactionKeyForPassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 completion:v27];
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    char v7 = [a1[4] workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_311;
    v13[3] = &unk_1E6A18668;
    v13[4] = a1[4];
    id v14 = a1[6];
    id v15 = v5;
    id v16 = a1[5];
    dispatch_async(v7, v13);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = a1[4];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v11 = HMFGetLogIdentifier();
      uint32_t v12 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch the transaction key: %@", buf, 0x20u);
    }
  }
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_311(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 nfcReaderKeyManager];
  id v4 = [v3 accessoryManager];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = +[HMDHomeNFCReaderKey publicKeyWithPublicKeyExternalRepresentation:*(void *)(a1 + 48)];
  char v7 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_2;
  v8[3] = &unk_1E6A18BA0;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 40);
  [v4 configureAccessory:v5 withDeviceCredentialKey:v6 ofType:0 flow:v9 completion:v8];
}

void __88__HMDHomeWalletKeyManager_syncDeviceCredentialKeyForAccessory_paymentApplications_flow___block_invoke_2(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
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
      os_log_type_t v11 = "%{public}@[Flow: %@] Failed to configured accessory with device credential key %@:%@";
      uint32_t v12 = v7;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 42;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v12, v13, v11, (uint8_t *)&v15, v14);
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
    os_log_type_t v11 = "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@";
    uint32_t v12 = v7;
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

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMDHomeWalletKeyManager_updateWalletKeyStateToState_flow___block_invoke;
  aBlock[3] = &unk_1E6A095E8;
  id v11 = v6;
  int64_t v12 = a3;
  aBlock[4] = self;
  id v8 = v6;
  id v9 = _Block_copy(aBlock);
  [(HMDHomeWalletKeyManager *)self enqueueWalletKeyUpdateOperation:v9 flow:v8];
}

id __60__HMDHomeWalletKeyManager_updateWalletKeyStateToState_flow___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7 == 10 || v7 == 6)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
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
      id v29 = v13;
      __int16 v30 = 2048;
      uint64_t v31 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing home key from wallet since updated state is: %ld", (uint8_t *)&v26, 0x20u);
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
      __int16 v19 = (void *)MEMORY[0x1D9452090]();
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
        id v29 = v23;
        __int16 v30 = 2048;
        uint64_t v31 = v18;
        __int16 v32 = 2048;
        uint64_t v33 = v24;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not updating wallet key since existing wallet key state: %lu matches final state: %lu", (uint8_t *)&v26, 0x2Au);
      }
      int v15 = 0;
    }
    else
    {
      uint64_t v25 = (void *)[v5 mutableCopy];
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
    id v12 = (id)*MEMORY[0x1E4F2D1C8];
    os_log_type_t v13 = [(id)v11 applicationInfoForBundleIdentifier:v12];

    uint64_t v14 = [(HMDHomeWalletKeyManager *)self dataSource];
    LOBYTE(v11) = [v14 isWatch];

    if ((v11 & 1) == 0 && v13)
    {
      int v15 = [MEMORY[0x1E4F1CB10] URLWithString:@"com.apple.Home-private://userLockSettings"];
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

- (id)createPassDirectoryWithResourceFilesWithFlow:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v28 = v9;
    __int16 v29 = 2112;
    __int16 v30 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating pass directory with resources files", buf, 0x16u);
  }
  uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v12 = [v11 resourceURL];

  os_log_type_t v13 = [v12 URLByAppendingPathComponent:@"HomeKey-Wallet.pass"];
  uint64_t v14 = [(HMDHomeWalletKeyManager *)v7 passLibrary];
  int v15 = [v14 createTemporaryPassDirectoryURL];

  id v16 = [(HMDHomeWalletKeyManager *)v7 fileManager];
  id v26 = 0;
  char v17 = [v16 copyItemAtURL:v13 toURL:v15 error:&v26];
  id v18 = v26;

  if (v17)
  {
    id v19 = v15;
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = v7;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v4 UUID];
      *(_DWORD *)buf = 138544386;
      __int16 v28 = v23;
      __int16 v29 = 2112;
      __int16 v30 = v24;
      __int16 v31 = 2112;
      __int16 v32 = v13;
      __int16 v33 = 2112;
      uint64_t v34 = v15;
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to copy item at URL %@ to %@ : %@", buf, 0x34u);
    }
    id v19 = 0;
  }

  return v19;
}

- (void)addISOCredentialV1WithPassAtURL:(id)a3 nfcInfo:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v8 = (void (**)(id, void))a6;
  uint64_t v7 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8[2](v8, 0);
}

void __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HMDHomeWalletKeyManager_addISOCredentialV0WithPassAtURL_nfcInfo_flow_completion___block_invoke_2;
  block[3] = &unk_1E6A17668;
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
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

    id v10 = (void *)MEMORY[0x1D9452090]();
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
        __int16 v29 = v14;
        __int16 v30 = 2112;
        __int16 v31 = v15;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created UA iso credential", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        uint64_t v23 = [*(id *)(a1 + 48) UUID];
        *(_DWORD *)buf = 138544130;
        __int16 v29 = v22;
        __int16 v30 = 2112;
        __int16 v31 = v23;
        __int16 v32 = 2112;
        __int16 v33 = v5;
        __int16 v34 = 2112;
        id v35 = v9;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to write UA ISO credential to file at url %@:%@", buf, 0x2Au);
      }
      uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
      [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      uint64_t v25 = *(void *)(a1 + 80);
      id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52 userInfo:v24];
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 40);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = [*(id *)(a1 + 48) UUID];
      __int16 v21 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      __int16 v31 = v20;
      __int16 v32 = 2112;
      __int16 v33 = v21;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create encoded UA ISO credential %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

- (void)handlePendingWalletKeyUpdateOperationsWithFlow:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (![(HMDHomeWalletKeyManager *)self isWalletKeyUpdateOperationInProgress])
  {
    id v6 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
    char v7 = objc_msgSend(v6, "hmf_isEmpty");

    if ((v7 & 1) == 0)
    {
      char v8 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
      id v9 = (void *)[v8 copy];

      id v10 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
      [v10 removeAllObjects];

      id v11 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
      id v12 = [(HMDHomeWalletKeyManager *)self passLibrary];
      id v13 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
      uint64_t v14 = [v12 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v13 flow:v4];

      if (!v14)
      {
        id v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = self;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          id v19 = [v4 UUID];
          *(_DWORD *)buf = 138543874;
          __int16 v67 = v18;
          __int16 v68 = 2112;
          __int16 v69 = v19;
          __int16 v70 = 2112;
          __int16 v71 = v11;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping wallet key update since key with serial number does not exist: %@", buf, 0x20u);
          goto LABEL_9;
        }
LABEL_10:

LABEL_40:

        goto LABEL_41;
      }
      if ([v14 isMissingNFCInfo])
      {
        id v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = self;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          id v19 = [v4 UUID];
          id v20 = [v14 nfcInfos];
          *(_DWORD *)buf = 138543874;
          __int16 v67 = v18;
          __int16 v68 = 2112;
          __int16 v69 = v19;
          __int16 v70 = 2112;
          __int16 v71 = v20;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Can't update wallet key because we are missing NFC info for the current wallet key. NFCInfo: %@", buf, 0x20u);

LABEL_9:
          goto LABEL_10;
        }
        goto LABEL_10;
      }
      v54 = v11;
      id v56 = v14;
      id v21 = v14;
      char v65 = 0;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      __int16 v55 = v9;
      id v22 = v9;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v61 objects:v74 count:16];
      id v53 = v21;
      if (v23)
      {
        uint64_t v24 = v23;
        char v25 = 0;
        uint64_t v26 = *(void *)v62;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v62 != v26) {
              objc_enumerationMutation(v22);
            }
            uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            buf[0] = 0;
            __int16 v29 = (*(void (**)(void))(v28 + 16))();
            __int16 v30 = v29;
            if (v65)
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
          uint64_t v24 = [v22 countByEnumeratingWithState:&v61 objects:v74 count:16];
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

      if (!v65)
      {
        int v43 = [v21 isMissingNFCInfo];
        __int16 v44 = (void *)MEMORY[0x1D9452090]();
        id v45 = self;
        uint64_t v46 = HMFGetOSLogHandle();
        id v47 = v46;
        id v11 = v54;
        uint64_t v14 = v56;
        if (v43)
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            id v48 = HMFGetLogIdentifier();
            char v49 = [v4 UUID];
            id v50 = [v21 nfcInfos];
            *(_DWORD *)buf = 138543874;
            __int16 v67 = v48;
            __int16 v68 = 2112;
            __int16 v69 = v49;
            __int16 v70 = 2112;
            __int16 v71 = v50;
            _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update wallet key because we have lost NFC info: %@", buf, 0x20u);
          }
          id v9 = v55;
        }
        else
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            __int16 v51 = HMFGetLogIdentifier();
            v52 = [v4 UUID];
            *(_DWORD *)buf = 138544130;
            __int16 v67 = v51;
            __int16 v68 = 2112;
            __int16 v69 = v52;
            __int16 v70 = 2112;
            __int16 v71 = v53;
            __int16 v72 = 2112;
            id v73 = v21;
            _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Updating home key in Wallet from %@ to %@", buf, 0x2Au);
          }
          [(HMDHomeWalletKeyManager *)v45 setIsWalletKeyUpdateOperationInProgress:1];
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke;
          v57[3] = &unk_1E6A09520;
          v57[4] = v45;
          id v58 = v4;
          char v60 = v25 & 1;
          id v59 = v21;
          [(HMDHomeWalletKeyManager *)v45 createPassDirectoryWithWalletKey:v59 options:0 shouldSkipResourceFiles:0 shouldCreateZipArchive:1 validateNFCInfo:1 flow:v58 completion:v57];

          id v9 = v55;
          uint64_t v14 = v56;
        }
        goto LABEL_39;
      }
      __int16 v32 = [(HMDHomeWalletKeyManager *)self passLibrary];
      id v11 = v54;
      char v33 = [v32 removePassWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v54 flow:v4];

      __int16 v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = self;
      uint64_t v36 = HMFGetOSLogHandle();
      uint64_t v37 = v36;
      id v9 = v55;
      uint64_t v14 = v56;
      if (v33)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v38 = HMFGetLogIdentifier();
          id v39 = [v4 UUID];
          *(_DWORD *)buf = 138543618;
          __int16 v67 = v38;
          __int16 v68 = 2112;
          __int16 v69 = v39;
          __int16 v40 = "%{public}@[Flow: %@] Successfully removed home key fom wallet";
          __int16 v41 = v37;
          os_log_type_t v42 = OS_LOG_TYPE_INFO;
LABEL_34:
          _os_log_impl(&dword_1D49D5000, v41, v42, v40, buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = HMFGetLogIdentifier();
        id v39 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        __int16 v67 = v38;
        __int16 v68 = 2112;
        __int16 v69 = v39;
        __int16 v40 = "%{public}@[Flow: %@] Failed to remove home key from wallet";
        __int16 v41 = v37;
        os_log_type_t v42 = OS_LOG_TYPE_ERROR;
        goto LABEL_34;
      }

LABEL_39:

      goto LABEL_40;
    }
  }
LABEL_41:
}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = [*(id *)(a1 + 32) passLibrary];
    uint64_t v12 = *(void *)(a1 + 40);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_292;
    v27[3] = &unk_1E6A11EA0;
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
      id v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        id v20 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138544130;
        id v36 = v19;
        __int16 v37 = 2112;
        uint64_t v38 = v20;
        __int16 v39 = 2112;
        id v40 = v7;
        __int16 v41 = 2112;
        id v42 = v15;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);
      }
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = *(id *)(a1 + 32);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      char v25 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      id v36 = v24;
      __int16 v37 = 2112;
      uint64_t v38 = v25;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create zipped pass: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 32) setIsWalletKeyUpdateOperationInProgress:0];
    [*(id *)(a1 + 32) handlePendingWalletKeyUpdateOperationsWithFlow:*(void *)(a1 + 40)];
  }
}

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_292(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = WeakRetained;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update home key in Wallet :%@", buf, 0x20u);
    }
    if (v7)
    {
LABEL_5:
      uint64_t v12 = [v7 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_2;
      block[3] = &unk_1E6A197C8;
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
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated home key in Wallet", buf, 0x16u);
    }
    if (*(unsigned char *)(a1 + 72))
    {
      id v15 = [v7 workQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_293;
      v19[3] = &unk_1E6A19668;
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

void __74__HMDHomeWalletKeyManager_handlePendingWalletKeyUpdateOperationsWithFlow___block_invoke_293(uint64_t a1)
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDHomeWalletKeyManager *)self pendingUpdateWalletKeyOperations];
  id v10 = _Block_copy(v6);
  [v9 addObject:v10];

  if ([(HMDHomeWalletKeyManager *)self isWalletKeyUpdateOperationInProgress]
    || ([(HMDHomeWalletKeyManager *)self addWalletKeyFuture],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key update operation in progress, update will happen later", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    [(HMDHomeWalletKeyManager *)self handlePendingWalletKeyUpdateOperationsWithFlow:v7];
  }
}

- (void)syncDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[ChildFlow: %@ Parent: %@] Syncing device credential key", buf, 0x20u);
  }
  id v18 = [(HMDHomeWalletKeyManager *)v13 home];
  __int16 v19 = [v18 nfcReaderKeyManager];
  id v20 = [v19 accessoryManager];

  if (v20)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__HMDHomeWalletKeyManager_syncDeviceCredentialKey_ofType_flow___block_invoke;
    v26[3] = &unk_1E6A196E0;
    v26[4] = v13;
    id v27 = v11;
    [v20 configureAllAccessoriesWithDeviceCredentialKey:v8 ofType:a4 flow:v27 completion:v26];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessory manager found to sync device credential key", buf, 0x16u);
    }
  }
}

void __63__HMDHomeWalletKeyManager_syncDeviceCredentialKey_ofType_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
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
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v14, v13);
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
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)removeWalletKeyOnboardingBulletin
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
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
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        uint32_t v13 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Can not remove wallet key onboarding bulletin because home is nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)createExpressModeSetUpBulletin
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeWalletKeyManager *)self dataSource];
  int v4 = [v3 isWatch];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Not creating express mode setup bulletin on this device", (uint8_t *)&v15, 0xCu);
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
      id v11 = (void *)MEMORY[0x1D9452090]();
      int v12 = self;
      uint32_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v15 = 138543362;
        __int16 v16 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Can not create express mode setup bulletin because home is nil", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)enableExpressWithOptions:(int64_t)a3 flow:(id)a4 completion:(id)a5
{
  char v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if ((v6 & 2) != 0)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = self;
    uint32_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = [v8 UUID];
      *(_DWORD *)buf = 138543618;
      id v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Enabling express after adding home key", buf, 0x16u);
    }
    __int16 v16 = [(HMDHomeWalletKeyManager *)v12 passLibrary];
    uint64_t v17 = [(HMDHomeWalletKeyManager *)v12 passSerialNumber];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__HMDHomeWalletKeyManager_enableExpressWithOptions_flow_completion___block_invoke;
    v18[3] = &unk_1E6A18F68;
    v18[4] = v12;
    id v19 = v8;
    id v20 = v10;
    [v16 enableExpressWithAuthData:0 passTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v17 flow:v19 completion:v18];
  }
  else
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

void __68__HMDHomeWalletKeyManager_enableExpressWithOptions_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  char v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) UUID];
      int v17 = 138543874;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v3;
      id v10 = "%{public}@[Flow: %@] Failed to enable express for home key: %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v17, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 40) UUID];
    int v17 = 138543618;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    id v10 = "%{public}@[Flow: %@] Successfully enabled express for home key";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, v15, v16);
}

- (void)addWalletKey:(id)a3 withOptions:(int64_t)a4 assertion:(id)a5 flow:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint32_t v13 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = (void *)MEMORY[0x1D9452090]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    __int16 v18 = [v12 UUID];
    __int16 v19 = HMHomeAddWalletKeyOptionsDescription();
    *(_DWORD *)buf = 138544130;
    uint64_t v29 = v17;
    __int16 v30 = 2112;
    id v31 = v18;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v19;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key: %@ with options: %@", buf, 0x2Au);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke;
  v23[3] = &unk_1E6A094F8;
  v23[4] = v15;
  id v24 = v12;
  id v25 = v11;
  id v26 = v10;
  int64_t v27 = a4;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  [(HMDHomeWalletKeyManager *)v15 createPassDirectoryWithWalletKey:v20 options:a4 shouldSkipResourceFiles:0 shouldCreateZipArchive:1 validateNFCInfo:1 flow:v22 completion:v23];
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
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
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_288;
    v33[3] = &unk_1E6A094D0;
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

    uint64_t v15 = [*(id *)(a1 + 32) fileManager];
    id v32 = 0;
    LOBYTE(v11) = [v15 removeItemAtURL:v12 error:&v32];
    id v16 = v32;

    if ((v11 & 1) == 0)
    {
      int v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      __int16 v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = v17;
        HMFGetLogIdentifier();
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138544130;
        id v43 = v20;
        __int16 v44 = 2112;
        id v45 = v21;
        __int16 v46 = 2112;
        id v47 = v12;
        __int16 v48 = 2112;
        id v49 = v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);

        int v17 = v30;
      }
    }
    id v22 = objc_msgSend(*(id *)(a1 + 32), "logEvent", v30);
    [v22 submitSuccess];

    objc_destroyWeak(v40);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      int64_t v27 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v43 = v26;
      __int16 v44 = 2112;
      id v45 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create zipped pass", buf, 0x16u);
    }
    [*(id *)(a1 + 48) invalidate];
    id v28 = [*(id *)(a1 + 32) addWalletKeyFuture];
    uint64_t v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v28 finishWithError:v29];
  }
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (!*(void *)(a1 + 48))
    {
      uint64_t v11 = +[HMDHomeKeyDataRecorder sharedRecorder];
      [v11 recordAddedWalletKey:*(void *)(a1 + 64) passJSONDict:*(void *)(a1 + 72)];
      uint64_t v19 = *(void *)(a1 + 88);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_290;
      v21[3] = &unk_1E6A18668;
      uint64_t v20 = *(void *)(a1 + 32);
      id v22 = *(id *)(a1 + 40);
      id v23 = WeakRetained;
      id v24 = *(id *)(a1 + 64);
      id v25 = *(id *)(a1 + 32);
      [WeakRetained enableExpressWithOptions:v19 flow:v20 completion:v21];

      id v18 = v22;
      goto LABEL_11;
    }
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) UUID];
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      int64_t v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to add home key in wallet at URL %@:%@", buf, 0x2Au);
    }
    [*(id *)(a1 + 40) invalidate];
    uint64_t v11 = [v6 addWalletKeyFuture];
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = [*(id *)(a1 + 32) UUID];
      *(_DWORD *)buf = 138543618;
      int64_t v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to add home key in wallet at URL, object got invalidated", buf, 0x16u);
    }
    [*(id *)(a1 + 40) invalidate];
    uint64_t v11 = [0 addWalletKeyFuture];
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 23;
  }
  id v18 = [v12 hmErrorWithCode:v13];
  [v11 finishWithError:v18];
LABEL_11:
}

void __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_290(id *a1)
{
  [a1[4] invalidate];
  id v2 = [a1[5] addWalletKeyFuture];
  [v2 finishWithResult:a1[6]];

  id v3 = [a1[5] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_2;
  block[3] = &unk_1E6A19668;
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
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__HMDHomeWalletKeyManager_addWalletKey_withOptions_assertion_flow___block_invoke_3;
  v4[3] = &unk_1E6A094A8;
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
  uint64_t v15 = [v13 identifier];

  [v16 generateHomeKeyNFCInfoWithReaderPublicKey:v14 readerIdentifier:v15 flow:v12 completion:v11];
}

- (void)addWalletKeyWithOptions:(int64_t)a3 nfcReaderKey:(id)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v56 = a4;
  id v58 = a5;
  id v57 = a6;
  uint64_t v10 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v58 UUID];
    *(_DWORD *)buf = 138544130;
    id v74 = v14;
    __int16 v75 = 2112;
    v76 = v15;
    __int16 v77 = 2048;
    int64_t v78 = a3;
    __int16 v79 = 2112;
    id v80 = v56;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key with options: %ld, readerKey: %@", buf, 0x2Au);
  }
  id v16 = [(HMDHomeWalletKeyManager *)v12 home];
  int v17 = v16;
  if (v16)
  {
    id v18 = [v16 name];
    if (v18)
    {
      v54 = [(HMDHomeWalletKeyManager *)v12 passSerialNumber];
      if (v54)
      {
        uint64_t v19 = [(HMDHomeWalletKeyManager *)v12 addWalletKeyFuture];

        if (!v19)
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
          [(HMDHomeWalletKeyManager *)v12 setAddWalletKeyFuture:v20];
        }
        id v21 = [(HMDHomeWalletKeyManager *)v12 addWalletKeyFuture];
        objc_initWeak(&location, v12);
        id v22 = [(HMDHomeWalletKeyManager *)v12 addWalletKeyFuture];
        id v23 = (void *)MEMORY[0x1E4F7A0F0];
        id v24 = [(HMDHomeWalletKeyManager *)v12 workQueue];
        id v25 = [v23 schedulerWithDispatchQueue:v24];
        id v26 = [v22 reschedule:v25];
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke;
        v67[3] = &unk_1E6A093E0;
        objc_copyWeak(v71, &location);
        id v52 = v58;
        id v68 = v52;
        id v70 = v57;
        id v53 = v21;
        id v69 = v53;
        v71[1] = (id)a3;
        id v27 = (id)[v26 addCompletionBlock:v67];

        __int16 v28 = v53;
        uint64_t v29 = (void *)MEMORY[0x1D9452090]();
        __int16 v30 = v12;
        if (v19)
        {
          HMFGetOSLogHandle();
          uint64_t v31 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            id v33 = [v52 UUID];
            *(_DWORD *)buf = 138543618;
            id v74 = v32;
            __int16 v75 = 2112;
            v76 = v33;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Add wallet key is already in progress", buf, 0x16u);

            __int16 v28 = v53;
          }
        }
        else
        {
          HMFGetOSLogHandle();
          id v49 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v51 = [v52 UUID];
            *(_DWORD *)buf = 138543618;
            id v74 = v50;
            __int16 v75 = 2112;
            v76 = v51;
            _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching home key supported", buf, 0x16u);

            __int16 v28 = v53;
          }

          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_279;
          v59[3] = &unk_1E6A09480;
          v59[4] = v30;
          id v60 = v52;
          id v61 = v56;
          id v62 = v54;
          id v63 = v17;
          id v64 = 0;
          id v65 = v18;
          int64_t v66 = a3;
          [(HMDHomeWalletKeyManager *)v30 fetchHomeKeySupportedWithFlow:v60 completion:v59];
        }
        objc_destroyWeak(v71);
        objc_destroyWeak(&location);
      }
      else
      {
        __int16 v44 = (void *)MEMORY[0x1D9452090]();
        id v45 = v12;
        __int16 v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          id v47 = HMFGetLogIdentifier();
          __int16 v48 = [v58 UUID];
          *(_DWORD *)buf = 138543618;
          id v74 = v47;
          __int16 v75 = 2112;
          v76 = v48;
          _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, serial number is nil", buf, 0x16u);
        }
        __int16 v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*((void (**)(id, void, void *))v57 + 2))(v57, 0, v28);
      }
    }
    else
    {
      id v39 = (void *)MEMORY[0x1D9452090]();
      id v40 = v12;
      __int16 v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        id v43 = [v58 UUID];
        *(_DWORD *)buf = 138543618;
        id v74 = v42;
        __int16 v75 = 2112;
        v76 = v43;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, no name configured for home", buf, 0x16u);
      }
      __int16 v55 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      (*((void (**)(id, void, void *))v57 + 2))(v57, 0, v55);
    }
  }
  else
  {
    uint64_t v34 = (void *)MEMORY[0x1D9452090]();
    id v35 = v12;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      id v38 = [v58 UUID];
      *(_DWORD *)buf = 138543618;
      id v74 = v37;
      __int16 v75 = 2112;
      v76 = v38;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, home is nil", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v57 + 2))(v57, 0, v18);
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
        id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
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
    id v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = [*(id *)(a1 + 32) UUID];
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Self became nil while waiting for add wallet key future to finish", (uint8_t *)&v17, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_279(uint64_t a1, char a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Acquiring wallet provisioning assertion", buf, 0x16u);
    }
    id v12 = [*(id *)(a1 + 32) passLibrary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_283;
    v19[3] = &unk_1E6A09458;
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
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Adding home key in wallet is not supported: %@", buf, 0x20u);
    }
    id v18 = [*(id *)(a1 + 32) addWalletKeyFuture];
    [v18 finishWithError:v5];
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generating home key nfc info with reader key: %@", buf, 0x20u);
    }
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    int v17 = [*(id *)(a1 + 64) spiClientIdentifier];
    uint64_t v18 = *(void *)(a1 + 72);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_284;
    v26[3] = &unk_1E6A09430;
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not add home key in wallet, failed to acquire assertion: %@", buf, 0x20u);
    }
    id v24 = [*(id *)(a1 + 32) addWalletKeyFuture];
    id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v24 finishWithError:v25];
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Generated NFC info: %@", buf, 0x20u);
    }
    id v13 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_285;
    block[3] = &unk_1E6A16AE0;
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate nfc info for home key: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) invalidate];
    __int16 v19 = [*(id *)(a1 + 32) addWalletKeyFuture];
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v19 finishWithError:v20];
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_285(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchWalletKeyColorOptionWithFlow:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_nfcReaderKey_flow_completion___block_invoke_2;
  v7[3] = &unk_1E6A09408;
  void v7[4] = *(void *)(a1 + 32);
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
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchWalletKeyColorOption", buf, 0x16u);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v12 = [(HMDHomeWalletKeyManager *)v7 home];
  uint64_t v13 = [v12 nfcReaderKeyManager];
  id v14 = [v13 accessoryManager];

  if (v14)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow___block_invoke;
    v26[3] = &unk_1E6A14730;
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
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessory manager found, using default wallet key color", buf, 0x16u);
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetch wallet key color: %@", (uint8_t *)&v21, 0x20u);
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
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch wallet key color: %@, using default wallet key color: %@", (uint8_t *)&v21, 0x2Au);
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
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
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke_2;
  v4[3] = &unk_1E6A18BF0;
  id v5 = *(id *)(a1 + 48);
  id v3 = (id)[v2 addSuccessBlock:v4];
}

uint64_t __72__HMDHomeWalletKeyManager_fetchWalletKeyColorOptionWithFlow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetch or create reader key", (uint8_t *)&v28, 0x16u);
  }
  id v14 = [(HMDHomeWalletKeyManager *)v10 home];
  id v15 = v14;
  if (!v14)
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key, home is nil", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    goto LABEL_12;
  }
  if (([v14 hasAnyAccessoryWithWalletKeySupport] & 1) == 0)
  {
    __int16 v23 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home doesn't have any accessory that supports wallet key", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 userInfo:0];
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
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = (void (**)(id, void *, void *))a6;
  BOOL v11 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    uint64_t v16 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    id v40 = v15;
    __int16 v41 = 2112;
    id v42 = v16;
    __int16 v43 = 2048;
    int64_t v44 = a3;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Adding wallet key with options: %ld", buf, 0x20u);
  }
  id v17 = [(HMDHomeWalletKeyManager *)v13 passSerialNumber];
  if (v17)
  {
    uint64_t v18 = [(HMDHomeWalletKeyManager *)v13 passLibrary];
    __int16 v19 = [v18 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v17 flow:v9];

    if (v19)
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      int v21 = v13;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = HMFGetLogIdentifier();
        id v24 = [v9 UUID];
        *(_DWORD *)buf = 138543874;
        id v40 = v23;
        __int16 v41 = 2112;
        id v42 = v24;
        __int16 v43 = 2112;
        int64_t v44 = (int64_t)v19;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Home Key already exists in Wallet: %@", buf, 0x20u);
      }
      __int16 v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
      v10[2](v10, v19, v25);
    }
    else
    {
      __int16 v31 = [(HMDHomeWalletKeyManager *)v13 logEvent];

      if (!v31)
      {
        uint64_t v32 = [HMDHomeKeySetupWalletLogEvent alloc];
        uint64_t v33 = [(HMDHomeWalletKeyManager *)v13 workQueue];
        uint64_t v34 = [(HMDHomeKeySetupWalletLogEvent *)v32 initWithQueue:v33];
        [(HMDHomeWalletKeyManager *)v13 setLogEvent:v34];
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke;
      v35[3] = &unk_1E6A093B8;
      v35[4] = v13;
      id v36 = v9;
      id v37 = v10;
      int64_t v38 = a3;
      [(HMDHomeWalletKeyManager *)v13 fetchOrCreateReaderKeyWithFlow:v36 completion:v35];

      __int16 v19 = 0;
    }
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D9452090]();
    __int16 v27 = v13;
    int v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      __int16 v30 = [v9 UUID];
      *(_DWORD *)buf = 138543874;
      id v40 = v29;
      __int16 v41 = 2112;
      id v42 = v30;
      __int16 v43 = 2112;
      int64_t v44 = 0;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Could not find passSerialNumber: %@", buf, 0x20u);
    }
    __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    v10[2](v10, 0, v19);
  }
}

void __80__HMDHomeWalletKeyManager_addWalletKeyWithOptions_isOnboarding_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    [*(id *)(a1 + 32) addWalletKeyWithOptions:*(void *)(a1 + 56) nfcReaderKey:v5 flow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) UUID];
      int v13 = 138543874;
      id v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or create reader key: %@", (uint8_t *)&v13, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchPayloadForAddWalletKeyRemoteMessageWithFlow:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__HMDHomeWalletKeyManager_fetchPayloadForAddWalletKeyRemoteMessageWithFlow_completion___block_invoke;
  v10[3] = &unk_1E6A09390;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(HMDHomeWalletKeyManager *)self fetchOrCreateReaderKeyWithFlow:v7 completion:v10];
}

void __87__HMDHomeWalletKeyManager_fetchPayloadForAddWalletKeyRemoteMessageWithFlow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    id v11 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v11];
    id v9 = v11;
    if (v8)
    {
      id v12 = @"HMDHomeWalletKeyManagerRemoteMessageKeyNFCReaderKey";
      v13[0] = v8;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
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
  v51[3] = &unk_1D5667A7F;
  int v52 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__33230;
  v48[4] = __Block_byref_object_dispose__33231;
  id v49 = 0;
  int v28 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
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

        int v21 = [[HMDRemoteMessage alloc] initWithName:v10 qualityOfService:25 destination:v20 payload:v29 type:0 timeout:1 secure:10.0];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke;
        v36[3] = &unk_1E6A09340;
        v36[4] = self;
        v36[5] = v17;
        id v37 = v10;
        id v40 = v51;
        __int16 v41 = v53;
        id v42 = v50;
        __int16 v43 = v48;
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

  __int16 v23 = [(HMDHomeWalletKeyManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke_273;
  block[3] = &unk_1E6A09368;
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
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
      __int16 v27 = v11;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Watch: %@ failed to handle message %@:%@ ", (uint8_t *)&v26, 0x2Au);
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
    __int16 v27 = v17;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Watch: %@ successfully handled message %@", (uint8_t *)&v26, 0x20u);
  }
  uint64_t v14 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 72) + 8) + 32);
  os_unfair_lock_lock_with_options();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  uint64_t v20 = *(void *)(*(void *)(a1 + 88) + 8);
  if (*(void *)(v20 + 24)) {
    *(void *)(v20 + 24) = 2008;
  }
  int v21 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (!v21)
  {
    uint64_t v22 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v23 = *(void *)(*(void *)(a1 + 96) + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    int v21 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  }
  [v21 setObject:v6 forKey:*(void *)(a1 + 40)];
LABEL_19:
  os_unfair_lock_unlock(v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __76__HMDHomeWalletKeyManager_sendMessageWithName_payload_toWatches_completion___block_invoke_273(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
    id v3 = encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 32), 0);
    if (v3)
    {
      [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F2D7E8]];
    }
    else
    {
      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = *(id *)(a1 + 40);
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = HMFGetLogIdentifier();
        int v9 = 138543362;
        id v10 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode error by device", (uint8_t *)&v9, 0xCu);
      }
    }
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) userInfo:v2];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke_2;
  block[3] = &unk_1E6A164B0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  id v16 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 48);
  char v17 = a2;
  id v15 = *(id *)(a1 + 56);
  id v9 = v5;
  dispatch_async(v6, block);
}

void __74__HMDHomeWalletKeyManager_updateDeviceStateWithWalletKey_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 48) UUID];
      uint64_t v7 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express setting of existing pass: %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v8 = *(void *)(a1 + 72);
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 56) xpcWalletKeyWithExpressEnabled:*(unsigned __int8 *)(a1 + 80)];
    if (v10)
    {
      id v9 = (void *)v10;
      id v11 = (void *)[*(id *)(a1 + 64) mutableCopy];
      [v11 setWalletKey:v9];
      uint64_t v12 = *(void *)(a1 + 72);
      id v13 = (void *)[v11 copy];
      (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 40);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        char v17 = HMFGetLogIdentifier();
        uint64_t v18 = [*(id *)(a1 + 48) UUID];
        uint64_t v19 = *(void *)(a1 + 56);
        int v22 = 138543874;
        uint64_t v23 = v17;
        __int16 v24 = 2112;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create xpc wallet key with wallet key: %@", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v20 = *(void *)(a1 + 72);
      int v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);

      id v9 = 0;
    }
  }
}

- (BOOL)canAutoAddWalletKeyWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDHomeWalletKeyManager *)self systemInfo];
  int v6 = [v5 isMigrating];

  if (!v6)
  {
    uint64_t v8 = [(HMDHomeWalletKeyManager *)self home];
    id v9 = [v8 nfcReaderKey];
    uint64_t v10 = [v9 identifier];
    id v11 = objc_msgSend(v10, "hmf_hexadecimalRepresentation");

    if (v11
      && ([(HMDHomeWalletKeyManager *)self dataSource],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [v12 numberValueFromNoBackupStoreWithKey:v11],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          v13)
      || ([v8 hasOnboardedForWalletKey] & 1) != 0)
    {
      if ([(HMDHomeWalletKeyManager *)self isHomeBeingRemoved])
      {
        if (a3)
        {
          *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDHomeAutoAddWalletKeyErrorDomain" code:4 userInfo:0];
        }
        id v14 = (void *)MEMORY[0x1D9452090]();
        id v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          char v17 = HMFGetLogIdentifier();
          int v19 = 138543362;
          uint64_t v20 = v17;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Cannot auto add wallet key because home is currently being removed", (uint8_t *)&v19, 0xCu);
        }
        goto LABEL_17;
      }
      BOOL v7 = 1;
    }
    else
    {
      if (!a3)
      {
LABEL_17:
        BOOL v7 = 0;
        goto LABEL_18;
      }
      [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDHomeAutoAddWalletKeyErrorDomain" code:2 userInfo:0];
      BOOL v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_18:

    return v7;
  }
  if (!a3) {
    return 0;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDHomeAutoAddWalletKeyErrorDomain" code:1 userInfo:0];
  BOOL v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)handleRestoreMissingWalletKeysMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  int v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling RestoreMissingWalletKeysMessage: %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [(HMDHomeWalletKeyManager *)v6 home];
  uint64_t v10 = [v9 nfcReaderKeyManager];
  id v11 = [v10 accessoryManager];
  uint64_t v12 = [v11 messageTargetUUID];

  id v13 = [(HMDHomeWalletKeyManager *)v6 workQueue];
  [v9 redispatchToResidentMessage:v4 target:v12 responseQueue:v13];
}

- (void)handleFetchMissingWalletKeysMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  int v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling FetchMissingWalletKeysMessage: %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [(HMDHomeWalletKeyManager *)v6 home];
  uint64_t v10 = [v9 nfcReaderKeyManager];
  id v11 = [v10 accessoryManager];
  uint64_t v12 = [v11 messageTargetUUID];

  id v13 = [(HMDHomeWalletKeyManager *)v6 workQueue];
  [v9 redispatchToResidentMessage:v4 target:v12 responseQueue:v13];
}

- (void)handlePersistWalletKeyAddOptionsRemoteMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  BOOL v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    id v27 = v4;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remote message to add wallet key: %@ payload: %@", buf, 0x20u);
  }
  uint64_t v23 = objc_opt_class();
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v12 = [v4 unarchivedObjectForKey:@"HMDHomeWalletKeyManagerRemoteMessageKeyNFCReaderKey" ofClasses:v11];

  if (v12)
  {
    id v13 = [(HMDHomeWalletKeyManager *)v7 dataSource];
    int v14 = [NSNumber numberWithInteger:3];
    id v15 = [v12 identifier];
    __int16 v16 = objc_msgSend(v15, "hmf_hexadecimalRepresentation");
    [v13 persistNumberValueToNoBackupStore:v14 withKey:v16];

    [v4 respondWithPayload:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = v7;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      id v27 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Missing nfc reader key in the message payload: %@", buf, 0x16u);
    }
    int v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:27];
    [v4 respondWithError:v22];
  }
}

- (void)handleAddWalletKeyMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    uint64_t v12 = [v4 messagePayload];
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    int v22 = v11;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message to add wallet key %@ payload: %@", buf, 0x2Au);
  }
  id v13 = [v4 numberForKey:*MEMORY[0x1E4F2D1B8]];
  uint64_t v14 = [v13 integerValue];

  objc_initWeak((id *)buf, v8);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__HMDHomeWalletKeyManager_handleAddWalletKeyMessage___block_invoke;
  v16[3] = &unk_1E6A09140;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v4;
  id v17 = v15;
  [(HMDHomeWalletKeyManager *)v8 addWalletKeyWithOptions:v14 isOnboarding:1 flow:v6 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __53__HMDHomeWalletKeyManager_handleAddWalletKeyMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (v6)
  {
    [*(id *)(a1 + 32) respondWithError:v6];
  }
  else
  {
    id v9 = [WeakRetained home];
    uint64_t v10 = [v5 uuid];
    id v11 = *(void **)(a1 + 32);
    uint64_t v15 = *MEMORY[0x1E4F2D838];
    v16[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [v11 respondWithPayload:v12];

    id v13 = [v9 nfcReaderKeyManager];
    uint64_t v14 = [v13 accessoryManager];
    [v14 configureNFCReaderKeyForAllAccessoriesWithReason:@"Add wallet key message"];
  }
}

- (void)handleMessageForPairedWatches:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    int64_t v66 = v10;
    __int16 v67 = 2112;
    id v68 = v11;
    __int16 v69 = 2112;
    uint64_t v70 = (uint64_t)v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message for watch: %@", buf, 0x20u);
  }
  uint64_t v12 = [(HMDHomeWalletKeyManager *)v8 watchManager];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 connectedWatches];
    uint64_t v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_250);
    uint64_t v16 = [v15 count];
    uint64_t v17 = [v14 count];
    if (v16)
    {
      id v53 = v15;
      id v18 = [v13 watches];
      uint64_t v19 = [v18 count];

      if (v16 == v19)
      {
        uint64_t v20 = 0;
      }
      else
      {
        __int16 v51 = v6;
        uint64_t v29 = (void *)MEMORY[0x1D9452090]();
        uint64_t v30 = v8;
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = HMFGetLogIdentifier();
          [v51 UUID];
          id v33 = v49 = v29;
          *(_DWORD *)buf = 138544130;
          int64_t v66 = v32;
          __int16 v67 = 2112;
          id v68 = v33;
          __int16 v69 = 2048;
          uint64_t v70 = v16;
          __int16 v71 = 2048;
          uint64_t v72 = v19;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Connected supported watch count: %lu is not equal to paired watch count: %lu", buf, 0x2Au);

          uint64_t v29 = v49;
        }

        uint64_t v20 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2008];
        id v6 = v51;
      }
      id v28 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      uint64_t v34 = [v4 name];
      int v35 = [v34 isEqualToString:*MEMORY[0x1E4F2D1C0]];

      if (v35)
      {
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_252;
        v62[3] = &unk_1E6A192B8;
        id v63 = v28;
        id v64 = v4;
        [(HMDHomeWalletKeyManager *)v8 fetchPayloadForAddWalletKeyRemoteMessageWithFlow:v6 completion:v62];

        id v36 = @"HMDHomeWalletKeyManagerPersistWalletKeyAddOptionsRemoteMessage";
      }
      else
      {
        id v37 = [v4 name];
        int v38 = [v37 isEqualToString:*MEMORY[0x1E4F2D7F0]];

        if (v38)
        {
          [v28 finishWithResult:MEMORY[0x1E4F1CC08]];
          id v36 = @"HMDHomeWalletKeyManagerFetchWalletKeyDeviceStateRemoteMessage";
        }
        else
        {
          int v52 = v6;
          id v39 = (void *)MEMORY[0x1D9452090]();
          id v40 = v8;
          __int16 v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v42 = v50 = v39;
            __int16 v43 = [v52 UUID];
            *(_DWORD *)buf = 138543874;
            int64_t v66 = v42;
            __int16 v67 = 2112;
            id v68 = v43;
            __int16 v69 = 2112;
            uint64_t v70 = (uint64_t)v4;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Message is not supported for paired watches: %@", buf, 0x20u);

            id v39 = v50;
          }

          long long v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
          [v28 finishWithError:v44];

          id v36 = 0;
          id v6 = v52;
        }
      }
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_254;
      v60[3] = &unk_1E6A197F0;
      id v45 = v4;
      id v61 = v45;
      id v46 = (id)[v28 addFailureBlock:v60];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_2;
      v55[3] = &unk_1E6A09250;
      v55[4] = v8;
      uint64_t v56 = v36;
      uint64_t v15 = v53;
      id v57 = v53;
      id v58 = v20;
      id v59 = v45;
      id v47 = v20;
      id v48 = (id)[v28 addSuccessBlock:v55];
    }
    else
    {
      uint64_t v21 = v17;
      int v22 = (void *)MEMORY[0x1D9452090]();
      __int16 v23 = v8;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = __int16 v25 = v6;
        [v25 UUID];
        uint64_t v27 = v54 = v15;
        *(_DWORD *)buf = 138544130;
        int64_t v66 = v26;
        __int16 v67 = 2112;
        id v68 = v27;
        __int16 v69 = 2112;
        uint64_t v70 = (uint64_t)v4;
        __int16 v71 = 2048;
        uint64_t v72 = v21;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling message for paired watches:%@ connected watches count is %lu but none are supported", buf, 0x2Au);

        uint64_t v15 = v54;
        id v6 = v25;
      }

      id v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v28];
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v14];
  }
}

void __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_252(uint64_t a1, void *a2)
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

uint64_t __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_254(uint64_t a1, uint64_t a2)
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
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_3;
  v11[3] = &unk_1E6A09228;
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
  id v5 = a3;
  if (!v5) {
    id v5 = a1[4];
  }
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [a1[6] name];
  id v9 = [v7 responsePayloadForPairedWatchesWithMessageName:v8 responsePayloadByDevice:v6 error:v5];

  uint64_t v10 = [a1[6] name];
  LOBYTE(v6) = [v10 isEqualToString:*MEMORY[0x1E4F2D1C0]];

  if ((v6 & 1) != 0 && ([v5 code] == 2008 || !v5))
  {
    id v11 = [a1[5] home];
    id v12 = [v11 nfcReaderKeyManager];
    uint64_t v13 = [v12 accessoryManager];
    [v13 configureNFCReaderKeyForAllAccessoriesWithReason:@"Handle message for paired watches"];

    id v14 = [v11 homeManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_4;
    v15[3] = &unk_1E6A19668;
    id v16 = a1[6];
    id v17 = v9;
    id v18 = v5;
    [v14 sendHomeDataToAllWatchesWithCompletion:v15];
  }
  else
  {
    [a1[6] respondWithPayload:v9 error:v5];
  }
}

uint64_t __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithPayload:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

BOOL __57__HMDHomeWalletKeyManager_handleMessageForPairedWatches___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 productInfo];
  id v3 = [v2 softwareVersion];
  id v4 = v3;
  if (v3) {
    [v3 operatingSystemVersion];
  }
  BOOL v5 = HMFOperatingSystemVersionCompare() != 1;

  return v5;
}

- (void)handleEnableExpressForWalletKeyMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling message to enable express: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeWalletKeyManager *)v8 passSerialNumber];
  if (v12)
  {
    uint64_t v13 = *MEMORY[0x1E4F2D5E8];
    uint64_t v14 = [v4 dataForKey:*MEMORY[0x1E4F2D5E8]];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      id v16 = [(HMDHomeWalletKeyManager *)v8 passLibrary];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __66__HMDHomeWalletKeyManager_handleEnableExpressForWalletKeyMessage___block_invoke;
      v29[3] = &unk_1E6A18BA0;
      v29[4] = v8;
      id v30 = v6;
      id v31 = v4;
      [v16 enableExpressWithAuthData:v15 passTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v12 flow:v30 completion:v29];
    }
    else
    {
      int v22 = (void *)MEMORY[0x1D9452090]();
      __int16 v23 = v8;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        __int16 v26 = [v6 UUID];
        uint64_t v27 = [v4 messagePayload];
        *(_DWORD *)buf = 138544130;
        id v33 = v25;
        __int16 v34 = 2112;
        int v35 = v26;
        __int16 v36 = 2112;
        id v37 = v27;
        __int16 v38 = 2112;
        uint64_t v39 = v13;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express, missing key is payload %@:%@", buf, 0x2Au);
      }
      id v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v4 respondWithError:v28];

      uint64_t v15 = 0;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = v8;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      id v33 = v20;
      __int16 v34 = 2112;
      int v35 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express, serial number is nil", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v4 respondWithError:v15];
  }
}

void __66__HMDHomeWalletKeyManager_handleEnableExpressForWalletKeyMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
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
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to enable express for home key: %@", (uint8_t *)&v12, 0x20u);
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
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully enabled express for home key", (uint8_t *)&v12, 0x16u);
    }
    [a1[6] respondWithPayload:MEMORY[0x1E4F1CC08]];
  }
}

- (void)handleFetchAvailableWalletKeyEncodedPKPassMessage:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] handleFetchAvailableWalletKeyEncodedPKPassMessage: %@", buf, 0x20u);
  }
  int v12 = [v4 messagePayload];
  uint64_t v13 = objc_msgSend(v12, "hmf_setForKey:", *MEMORY[0x1E4F2D820]);
  __int16 v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_239);

  uint64_t v15 = [(HMDHomeWalletKeyManager *)v8 home];
  if (([v15 hasAnyAccessoryWithWalletKeySupport] & 1) != 0
    || ([v14 containsObject:&unk_1F2DC79D8] & 1) != 0)
  {
    __int16 v16 = [(HMDHomeWalletKeyManager *)v8 passSerialNumber];
    if (!v16)
    {
      uint64_t v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = v8;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v30 = HMFGetLogIdentifier();
        id v31 = [v6 UUID];
        *(_DWORD *)buf = 138543618;
        id v58 = v30;
        __int16 v59 = 2112;
        id v60 = v31;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, serial number is nil", buf, 0x16u);
      }
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v17];
      goto LABEL_24;
    }
    id v17 = [v15 name];
    if (v17)
    {
      uint64_t v18 = [(HMDHomeWalletKeyManager *)v8 passLibrary];
      uint64_t v19 = [v18 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v16 flow:v6];

      if (!v19 || ([v14 containsObject:&unk_1F2DC79F0] & 1) != 0)
      {
        uint64_t v20 = [HMDHomeWalletKey alloc];
        uint64_t v21 = [(HMDHomeWalletKeyManager *)v8 dataSource];
        uint64_t v22 = [v21 walletKeyColor];
        +[HMDHomeWalletKeySecureElementInfo createForEasyProvisioning];
        __int16 v23 = v50 = v14;
        uint64_t v56 = v23;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        id v49 = v15;
        v25 = id v24 = v6;
        __int16 v26 = [(HMDHomeWalletKey *)v20 initWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v16 state:1 walletKeyDescription:v17 homeName:v17 color:v22 nfcInfos:v25];

        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke_245;
        void v53[3] = &unk_1E6A091E0;
        v53[4] = v8;
        id v54 = v24;
        id v55 = v4;
        id v6 = v24;
        uint64_t v15 = v49;
        __int16 v14 = v50;
        [(HMDHomeWalletKeyManager *)v8 createPassDirectoryWithWalletKey:v26 options:0 shouldSkipResourceFiles:0 shouldCreateZipArchive:1 validateNFCInfo:0 flow:v54 completion:v53];

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
      long long v44 = (void *)MEMORY[0x1D9452090]();
      id v45 = v8;
      id v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v47 = HMFGetLogIdentifier();
        [v6 UUID];
        id v48 = v52 = v44;
        *(_DWORD *)buf = 138543618;
        id v58 = v47;
        __int16 v59 = 2112;
        id v60 = v48;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass already exists", buf, 0x16u);

        long long v44 = v52;
      }

      id v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = 1;
    }
    else
    {
      id v37 = (void *)MEMORY[0x1D9452090]();
      __int16 v38 = v8;
      uint64_t v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        [v6 UUID];
        v41 = __int16 v51 = v37;
        *(_DWORD *)buf = 138543618;
        id v58 = v40;
        __int16 v59 = 2112;
        id v60 = v41;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, no name configured for home", buf, 0x16u);

        id v37 = v51;
      }

      id v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = 2;
    }
    __int16 v26 = [v42 hmErrorWithCode:v43];
    [v4 respondWithError:v26];
    goto LABEL_23;
  }
  __int16 v32 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] No accessory in home supports wallet key", buf, 0x16u);
  }
  __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  [v4 respondWithError:v16];
LABEL_25:
}

void __77__HMDHomeWalletKeyManager_handleFetchAvailableWalletKeyEncodedPKPassMessage___block_invoke_245(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
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
        id v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = a1[4];
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          uint64_t v21 = [a1[5] UUID];
          *(_DWORD *)buf = 138544130;
          uint64_t v40 = v20;
          __int16 v41 = 2112;
          id v42 = v21;
          __int16 v43 = 2112;
          id v44 = v7;
          __int16 v45 = 2112;
          id v46 = v16;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove file at URL %@:%@", buf, 0x2Au);
        }
      }
      uint64_t v37 = *MEMORY[0x1E4F2D248];
      __int16 v38 = v12;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      [a1[6] respondWithPayload:v22];
      id v13 = v16;
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1D9452090]();
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
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, file handle creation failed for file %@:%@", buf, 0x2Au);
      }
      id v34 = a1[6];
      uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v34 respondWithError:v22];
    }

    id v9 = v13;
  }
  else
  {
    __int16 v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = a1[4];
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      uint64_t v27 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v26;
      __int16 v41 = 2112;
      id v42 = v27;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch encoded PKPass, pass creation failed: %@", buf, 0x20u);
    }
    id v28 = a1[6];
    int v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v24 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling FetchWalletKeyColorMessage", buf, 0xCu);
  }
  uint64_t v10 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v11 = (void *)MEMORY[0x1D9452090]();
  int v12 = v7;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = HMFGetLogIdentifier();
    char v15 = [v10 UUID];
    *(_DWORD *)buf = 138543618;
    id v24 = v14;
    __int16 v25 = 2112;
    __int16 v26 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling FetchWalletKeyColorMessage", buf, 0x16u);
  }
  id v16 = [(HMDHomeWalletKeyManager *)v12 fetchWalletKeyColorOptionWithFlow:v10];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__HMDHomeWalletKeyManager_handleFetchWalletKeyColorMessage___block_invoke;
  v20[3] = &unk_1E6A091B8;
  v20[4] = v12;
  id v21 = v10;
  id v22 = v4;
  id v17 = v4;
  id v18 = v10;
  id v19 = (id)[v16 addSuccessBlock:v20];
}

void __60__HMDHomeWalletKeyManager_handleFetchWalletKeyColorMessage___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding to FetchWalletKeyColorMessage with color: %@", buf, 0x20u);
  }
  uint64_t v10 = *MEMORY[0x1E4F2D270];
  id v11 = v3;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [a1[6] respondWithPayload:v9];
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

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDHomeWalletKeyManager_autoAddWalletKeyWithFlow___block_invoke;
  v7[3] = &unk_1E6A09118;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMDHomeWalletKeyManager *)self autoAddWalletKeyWithReason:@"autoAddWalletKey API invocation" flow:v6 completion:v7];
}

void __52__HMDHomeWalletKeyManager_autoAddWalletKeyWithFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v6 domain];
  id v9 = v8;
  if (v8 == (void *)*MEMORY[0x1E4F2D140])
  {
    uint64_t v10 = [v6 code];

    if (v10 == 1)
    {
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = *(id *)(a1 + 32);
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = HMFGetLogIdentifier();
        char v15 = [*(id *)(a1 + 40) UUID];
        int v20 = 138543874;
        id v21 = v14;
        __int16 v22 = 2112;
        __int16 v23 = v15;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v16 = "%{public}@[Flow: %@] Did not auto add wallet key, it already exists: %@";
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v20, 0x20u);
      }
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
  }
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  id v13 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v17)
    {
      __int16 v14 = HMFGetLogIdentifier();
      char v15 = [*(id *)(a1 + 40) UUID];
      int v20 = 138543874;
      id v21 = v14;
      __int16 v22 = 2112;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v16 = "%{public}@[Flow: %@] Failed to auto add wallet key: %@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    uint64_t v18 = HMFGetLogIdentifier();
    id v19 = [*(id *)(a1 + 40) UUID];
    int v20 = 138543874;
    id v21 = v18;
    __int16 v22 = 2112;
    __int16 v23 = v19;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully auto added wallet key: %@", (uint8_t *)&v20, 0x20u);
  }
  [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
LABEL_14:
}

- (BOOL)hasHomeKeyInWallet
{
  id v3 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
  id v4 = [(HMDHomeWalletKeyManager *)self passLibrary];
  id v5 = [MEMORY[0x1E4F65430] untrackedPlaceholderFlow];
  id v6 = [v4 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v3 flow:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)handleAccessCodeChanged
{
  id v3 = [(HMDHomeWalletKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDHomeWalletKeyManager *)self updateWalletKeyAccessCodeFieldWithReason:@"access code changed"];
}

- (void)recoverDueToUUIDChangeOfUser:(id)a3 fromOldUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeWalletKeyManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke;
  block[3] = &unk_1E6A19668;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    __int16 v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Recovering due to uuid change of user: %@, old uuid: %@", buf, 0x2Au);
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
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke_225;
    v20[3] = &unk_1E6A09140;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v2;
    [v14 addWalletKeyWithOptions:1 isOnboarding:0 flow:v21 completion:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    char v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 32);
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = [v2 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not recovering due to user UUID change because no home key exists in Wallet", buf, 0x16u);
    }
  }
}

void __68__HMDHomeWalletKeyManager_recoverDueToUUIDChangeOfUser_fromOldUUID___block_invoke_225(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
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
      BOOL v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to recover due to user UUID change: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      char v15 = [*(id *)(a1 + 32) UUID];
      int v16 = 138543618;
      BOOL v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully recovered due to user UUID change", (uint8_t *)&v16, 0x16u);
    }
    [v9 createExpressModeSetUpBulletin];
  }
}

- (void)_storeWalletKeyMigrationSettingsToDisk:(BOOL)a3
{
  BOOL v3 = a3;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  v32[0] = @"HMDHomeWalletKeySettingsNeedsKeyRollAfterMigration";
  v32[1] = @"HMDHomeWalletKeySettingsExpressModeEnabledForMigrationCodingKey";
  v33[0] = MEMORY[0x1E4F1CC38];
  id v6 = [NSNumber numberWithBool:v3];
  v33[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v11;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving wallet key settings to disk, %@", buf, 0x16u);
  }
  id v25 = 0;
  id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v25];
  id v13 = v25;
  if (v12)
  {
    __int16 v14 = [(HMDHomeWalletKeyManager *)v9 walletKeySettingsFileURL];
    char v15 = [v14 path];
    int v16 = +[HMDPersistentStore writeData:v12 toStorePath:v15 dataLabel:@"WalletKeySettings"];

    BOOL v17 = (void *)MEMORY[0x1D9452090]();
    __int16 v18 = v9;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v27 = v20;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      uint64_t v31 = v14;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Saved [%@] bytes to [%@]", buf, 0x20u);
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = v9;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v24;
      __int16 v28 = 2112;
      id v29 = v13;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving: %@", buf, 0x16u);
    }
  }
}

- (void)storeWalletKeyMigrationSettingsToDisk
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HMDHomeWalletKeyManager *)self hasHomeKeyInWallet])
  {
    BOOL v3 = [(HMDHomeWalletKeyManager *)self passLibrary];
    id v4 = [(HMDHomeWalletKeyManager *)self passSerialNumber];
    uint64_t v5 = [v3 isExpressModeEnabledForPassUniqueIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v4];

    [(HMDHomeWalletKeyManager *)self _storeWalletKeyMigrationSettingsToDisk:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [(HMDHomeWalletKeyManager *)v7 home];
      id v11 = [v10 shortDescription];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      char v15 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Not storing wallet key settings on disk because home: %@ does not have wallet key", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (id)walletKeySettingsFileURL
{
  BOOL v3 = NSString;
  id v4 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  uint64_t v5 = [(HMDHomeWalletKeyManager *)self home];
  id v6 = [v5 uuid];
  id v7 = [v3 stringWithFormat:@"%@/HMDHomeWalletKeySetting-%@.plist", v4, v6];

  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];

  return v8;
}

- (void)didAddCurrentUserWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  [(HMDHomeWalletKeyManager *)self setCurrentUserUUID:v5];

  if (([v4 isOwner] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v6 UUID];
      int v12 = [v4 uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v10;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Did add current user: %@", buf, 0x20u);
    }
    id v13 = [(HMDHomeWalletKeyManager *)v8 workQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke;
    v15[3] = &unk_1E6A197C8;
    void v15[4] = v8;
    id v16 = v6;
    id v14 = v6;
    dispatch_async(v13, v15);
  }
}

void __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) home];
  BOOL v3 = [v2 hapAccessories];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_208);

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) passLibrary];
    id v6 = [*(id *)(a1 + 32) passSerialNumber];
    id v7 = [v5 walletKeyWithTypeIdentifier:@"paymentpass.com.apple.dev1" serialNumber:v6 flow:*(void *)(a1 + 40)];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v12 = [*(id *)(a1 + 40) UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v11;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet key exists", buf, 0x16u);
      }
    }
    else
    {
      __int16 v19 = *(void **)(a1 + 32);
      __int16 v18 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_212;
      v20[3] = &unk_1E6A09118;
      void v20[4] = v19;
      id v21 = v18;
      [v19 autoAddWalletKeyWithReason:@"did add current user" flow:v21 completion:v20];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    char v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      BOOL v17 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      id v25 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No accessories support wallet key", buf, 0x16u);
    }
  }
}

void __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543874;
      BOOL v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pass when current user was added: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      char v15 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543618;
      BOOL v17 = v14;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pass when current user was added", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
}

uint64_t __53__HMDHomeWalletKeyManager_didAddCurrentUserWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 supportsWalletKey];
}

- (void)configureWithHome:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int64_t v78 = v8;
    __int16 v79 = 2112;
    id v80 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  id v9 = [v4 msgDispatcher];
  [(HMDHomeWalletKeyManager *)v6 setMessageDispatcher:v9];

  [(HMDHomeWalletKeyManager *)v6 setHome:v4];
  id v10 = [v4 currentUser];
  id v11 = [v10 uuid];
  [(HMDHomeWalletKeyManager *)v6 setCurrentUserUUID:v11];

  int v12 = [v4 nfcReaderKeyManager];
  id v13 = [v12 accessoryManager];
  [v13 setDelegate:v6];

  id v14 = +[HMDXPCMessagePolicy policyWithEntitlements:131077];
  char v15 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  v76 = v14;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  [v15 registerForMessage:*MEMORY[0x1E4F2D1B0] receiver:v6 policies:v16 selector:sel_handleAddWalletKeyMessage_];

  BOOL v17 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v75 = v14;
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  [v17 registerForMessage:*MEMORY[0x1E4F2D1C0] receiver:v6 policies:v18 selector:sel_handleMessageForPairedWatches_];

  __int16 v19 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  id v74 = v14;
  __int16 v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  [v19 registerForMessage:*MEMORY[0x1E4F2D208] receiver:v6 policies:v20 selector:sel_handleEnableExpressForWalletKeyMessage_];

  id v21 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v21, "setRoles:", objc_msgSend(v21, "roles") | 1);
  uint64_t v22 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:0];
  uint64_t v23 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  v73[0] = v21;
  v73[1] = v22;
  __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  [v23 registerForMessage:@"HMDHomeWalletKeyManagerPersistWalletKeyAddOptionsRemoteMessage" receiver:v6 policies:v24 selector:sel_handlePersistWalletKeyAddOptionsRemoteMessage_];

  id v25 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  v72[0] = v21;
  v72[1] = v22;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  [v25 registerForMessage:@"HMDHomeWalletKeyManagerFetchWalletKeyDeviceStateRemoteMessage" receiver:v6 policies:v26 selector:sel_handleFetchDeviceStateMessage_];

  __int16 v27 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v71 = v14;
  __int16 v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  [v27 registerForMessage:*MEMORY[0x1E4F2D240] receiver:v6 policies:v28 selector:sel_handleFetchAvailableWalletKeyEncodedPKPassMessage_];

  id v29 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  uint64_t v70 = v14;
  __int16 v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  [v29 registerForMessage:*MEMORY[0x1E4F2D268] receiver:v6 policies:v30 selector:sel_handleFetchWalletKeyColorMessage_];

  uint64_t v31 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v69 = v14;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  [v31 registerForMessage:*MEMORY[0x1E4F2D7F8] receiver:v6 policies:v32 selector:sel_handleFetchDeviceStateMessage_];

  id v33 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  id v68 = v14;
  id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  [v33 registerForMessage:*MEMORY[0x1E4F2D7F0] receiver:v6 policies:v34 selector:sel_handleMessageForPairedWatches_];

  id v35 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  __int16 v67 = v14;
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  [v35 registerForMessage:*MEMORY[0x1E4F2D800] receiver:v6 policies:v36 selector:sel_handleFetchMissingWalletKeysMessage_];

  uint64_t v37 = [(HMDHomeWalletKeyManager *)v6 messageDispatcher];
  int64_t v66 = v14;
  __int16 v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  [v37 registerForMessage:*MEMORY[0x1E4F2D840] receiver:v6 policies:v38 selector:sel_handleRestoreMissingWalletKeysMessage_];

  uint64_t v39 = [(HMDHomeWalletKeyManager *)v6 passLibrary];
  [v39 setDelegate:v6];

  uint64_t v40 = [(HMDHomeWalletKeyManager *)v6 passLibrary];
  [v40 start];

  __int16 v41 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v41 addObserver:v6 selector:sel_handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v4];

  id v42 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v42 addObserver:v6 selector:sel_handleHomeNameChangedNotification_ name:@"HMDHomeNameChangedNotification" object:v4];

  __int16 v43 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v43 addObserver:v6 selector:sel_handleHomeAddedAccessoryNotification_ name:@"HMDNotificationHomeAddedAccessory" object:v4];

  id v44 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v44 addObserver:v6 selector:sel_handleHomeAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:v4];

  __int16 v45 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v45 addObserver:v6 selector:sel_handleAccessorySupportsWalleyKeyDidChangeNotification_ name:@"HMDAccessorySupportsWalletKeyDidChangeNotification" object:0];

  id v46 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v46 addObserver:v6 selector:sel_handleHomeDidUpdateNFCReaderKeyNotification_ name:@"HMDHomeDidUpdateNFCReaderKeyNotification" object:v4];

  uint64_t v47 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  id v48 = [(HMDHomeWalletKeyManager *)v6 lostModeManager];
  [v47 addObserver:v6 selector:sel_handleLostModeUpdated name:@"HMDLostModeManagerUpdatedNotification" object:v48];

  id v49 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v49 addObserver:v6 selector:sel_handleHomeHasOnboardedForWalletKeyChangeNotification_ name:@"HMDHomeHasOnboardedForWalletKeyChangeNotification" object:v4];

  id v50 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  __int16 v51 = [(HMDHomeWalletKeyManager *)v6 lostModeManager];
  [v50 addObserver:v6 selector:sel_handleLostModeManagerDidExitLostModeWithAuthCompleteNotification name:@"HMDLostModeManagerDidExitLostModeWithAuthCompleteNotification" object:v51];

  int v52 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v52 addObserver:v6 selector:sel_handleApplicationInstalled_ name:@"HMDApplicationInstalledNotification" object:0];

  id v53 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v53 addObserver:v6 selector:sel_handleAccessorySupportsAccessCodeDidChangeNotification_ name:@"HMDAccessorySupportsAccessCodeDidChangeNotification" object:0];

  id v54 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  [v54 addObserver:v6 selector:sel_handleApplicationUninstalled_ name:@"HMDApplicationUninstalledNotification" object:0];

  id v55 = [(HMDHomeWalletKeyManager *)v6 notificationCenter];
  uint64_t v56 = [(HMDHomeWalletKeyManager *)v6 systemInfo];
  [v55 addObserver:v6 selector:sel_handleSystemInfoMigrationUpdatedNotification_ name:*MEMORY[0x1E4F653D0] object:v56];

  objc_initWeak(&location, v6);
  id v57 = [(HMDHomeWalletKeyManager *)v6 dataSource];
  id v58 = [(HMDHomeWalletKeyManager *)v6 workQueue];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke;
  v63[3] = &unk_1E6A16E40;
  objc_copyWeak(&v64, &location);
  LOBYTE(v32) = [v57 registerForPasscodeChangeNotificationWithQueue:v58 callback:v63];

  if ((v32 & 1) == 0)
  {
    __int16 v59 = (void *)MEMORY[0x1D9452090]();
    id v60 = v6;
    HMFGetOSLogHandle();
    __int16 v61 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      id v62 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int64_t v78 = v62;
      _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for passcode change notification", buf, 0xCu);
    }
  }
  [(HMDHomeWalletKeyManager *)v6 handleLostModeUpdated];
  objc_destroyWeak(&v64);
  objc_destroyWeak(&location);
}

void __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained workQueue];
    dispatch_assert_queue_V2(v3);

    id v4 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v2;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      id v14 = v8;
      __int16 v15 = 2112;
      int v16 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling passcode changed", buf, 0x16u);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke_203;
    v11[3] = &unk_1E6A09118;
    void v11[4] = v6;
    id v12 = v4;
    id v10 = v4;
    [v6 autoAddWalletKeyWithReason:@"passcode changed" flow:v10 completion:v11];
  }
}

void __45__HMDHomeWalletKeyManager_configureWithHome___block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543874;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add home key because passcode changed: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      __int16 v15 = [*(id *)(a1 + 40) UUID];
      int v16 = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added home key because passcode changed", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) createExpressModeSetUpBulletin];
  }
}

- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 fileManager:(id)a5 passLibrary:(id)a6 notificationCenter:(id)a7 watchManager:(id)a8 keychainStore:(id)a9 lostModeManager:(id)a10 dataSource:(id)a11 bulletinBoard:(id)a12 applicationRegistry:(id)a13 systemInfo:(id)a14 isoCredentialFactory:(id)a15
{
  id v43 = a3;
  id v42 = a4;
  id v32 = a5;
  id v41 = a5;
  id v40 = a6;
  id v33 = a7;
  id v39 = a7;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v35 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v44.receiver = self;
  v44.super_class = (Class)HMDHomeWalletKeyManager;
  __int16 v24 = [(HMDHomeWalletKeyManager *)&v44 init];
  id v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, a3);
    objc_storeStrong((id *)&v25->_workQueue, a4);
    objc_storeStrong((id *)&v25->_fileManager, v32);
    objc_storeStrong((id *)&v25->_passLibrary, a6);
    objc_storeStrong((id *)&v25->_notificationCenter, v33);
    objc_storeStrong((id *)&v25->_watchManager, a8);
    uint64_t v26 = _Block_copy(v23);
    id isoCredentialFactory = v25->_isoCredentialFactory;
    v25->_id isoCredentialFactory = v26;

    objc_storeStrong((id *)&v25->_keychainStore, a9);
    objc_storeStrong((id *)&v25->_lostModeManager, a10);
    objc_storeStrong((id *)&v25->_dataSource, a11);
    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    pendingUpdateWalletKeyOperations = v25->_pendingUpdateWalletKeyOperations;
    v25->_pendingUpdateWalletKeyOperations = (NSMutableArray *)v28;

    objc_storeStrong((id *)&v25->_bulletinBoard, a12);
    objc_storeStrong((id *)&v25->_applicationRegistry, a13);
    objc_storeStrong((id *)&v25->_systemInfo, a14);
  }

  return v25;
}

- (HMDHomeWalletKeyManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  __int16 v15 = objc_alloc_init(HMDFileManager);
  uint64_t v17 = [[HMDWalletPassLibrary alloc] initWithWorkQueue:v5];
  int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = +[HMDWatchManager sharedManager];
  id v14 = [MEMORY[0x1E4F5BE48] systemStore];
  uint64_t v8 = +[HMDLostModeManager sharedManager];
  id v9 = objc_alloc_init(HMDHomeWalletDataSource);
  id v10 = +[HMDBulletinBoard sharedBulletinBoard];
  id v11 = +[HMDApplicationRegistry sharedRegistry];
  id v12 = [MEMORY[0x1E4F65570] systemInfo];
  __int16 v19 = [(HMDHomeWalletKeyManager *)self initWithUUID:v6 workQueue:v5 fileManager:v15 passLibrary:v17 notificationCenter:v16 watchManager:v7 keychainStore:v14 lostModeManager:v8 dataSource:v9 bulletinBoard:v10 applicationRegistry:v11 systemInfo:v12 isoCredentialFactory:&__block_literal_global_33350];

  return v19;
}

HMDHomeWalletKeyISOCredential *__50__HMDHomeWalletKeyManager_initWithUUID_workQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[HMDHomeWalletKeyISOCredential alloc] initWithHAPPairingIdentity:v5 deviceCredentialKeyExternalRepresentation:v4];

  return v6;
}

uint64_t __38__HMDHomeWalletKeyManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v165;
  logCategory__hmf_once_v165 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)responsePayloadForPairedWatchesWithMessageName:(id)a3 responsePayloadByDevice:(id)a4 error:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 code];
  int v11 = [v7 isEqual:*MEMORY[0x1E4F2D7F0]];
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
      __int16 v15 = 0;
    }
    else {
      __int16 v15 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    id v44 = v9;
    id v46 = v7;
    int v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
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
      uint64_t v21 = *MEMORY[0x1E4F2D810];
      uint64_t v48 = *MEMORY[0x1E4F2D810];
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
          id v25 = [v24 objectForKey:v21];

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
            uint64_t v28 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v29 = objc_opt_class();
            id v51 = 0;
            __int16 v30 = [v28 unarchivedObjectOfClass:v29 fromData:v27 error:&v51];
            id v31 = v51;
            if (v30)
            {
              [v16 setObject:v30 forKey:v23];
            }
            else
            {
              uint64_t v32 = v20;
              id v33 = (void *)MEMORY[0x1D9452090]();
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
                _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode wallet key device state %@:%@", buf, 0x20u);

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
      uint64_t v56 = *MEMORY[0x1E4F2D818];
      uint64_t v57 = v37;
      __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v9 = v44;
    }
    else
    {
      id v39 = (void *)MEMORY[0x1D9452090]();
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
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to encoded wallet key device state by device %@", buf, 0x16u);

        int v16 = v47;
      }

      __int16 v15 = 0;
    }

    id v8 = v45;
    id v7 = v46;
  }

  return v15;
}

@end
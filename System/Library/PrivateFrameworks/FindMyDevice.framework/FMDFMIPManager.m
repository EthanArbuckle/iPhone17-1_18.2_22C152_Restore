@interface FMDFMIPManager
+ (id)sharedInstance;
- (BOOL)_checkLostModeInSharedContainer;
- (BOOL)_isRunningAsMobileUser;
- (BOOL)_quickFetchFMIPEnabledstate;
- (BOOL)isLostModeActive;
- (BOOL)isManagedLostModeActive;
- (BOOL)lockdownShouldDisableDevicePairing;
- (BOOL)lockdownShouldDisableDeviceRestore;
- (BOOL)lostModeIsActive;
- (BOOL)needsLostModeExitAuth;
- (FMDFMIPManager)init;
- (NSURL)managedLostModeFileURL;
- (NSURL)needsLocateAckLostModeFileURL;
- (OS_dispatch_queue)serialQueue;
- (id)_postWipePrefPath;
- (id)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4;
- (id)enableFMIPInContext:(unint64_t)a3;
- (id)enableLostModeWithInfo:(id)a3;
- (id)fmipAccount;
- (id)getManagedLostModeFileURL;
- (id)getNeedsLocateAckLostModeFileURL;
- (id)lostModeInfo;
- (id)newErrorForCode:(int)a3 message:(id)a4;
- (id)pathsToPreserveAcrossWipe;
- (unint64_t)_managedLostModeType;
- (unint64_t)_needsAckLostModeType;
- (void)_disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 completion:(id)a5;
- (void)_forceFMWUpgradeAlertWithCompletion:(id)a3;
- (void)_getAccessoriesWithFilter:(id)a3 completion:(id)a4;
- (void)_initiateLostModeExitAuthForIDSDeviceID:(id)a3 withCompletion:(id)a4;
- (void)_managedLostModeType;
- (void)_needsAckLostModeType;
- (void)_stopAlarm;
- (void)_updateManagedLostModeWithInfo:(id)a3 completion:(id)a4;
- (void)_updateNeedsLocateAckLostModeWithInfo:(id)a3 completion:(id)a4;
- (void)activationLockAuthInfoWithCompletion:(id)a3;
- (void)activationLockInfoFromDeviceWithCompletion:(id)a3;
- (void)activationLockVersionWithCompletion:(id)a3;
- (void)addNotificationRequest:(id)a3 completion:(id)a4;
- (void)attemptUCRTHealing:(id)a3 completion:(id)a4;
- (void)audioAccessorySerialNumbersWithCompletion:(id)a3;
- (void)clearData:(unint64_t)a3 completion:(id)a4;
- (void)clearMaskedAppleIDWithCompletion:(id)a3;
- (void)clearOfflineFindingInfoWithCompletion:(id)a3;
- (void)deviceActivationDidSucceed;
- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4;
- (void)didAddLocalFindableAccessory:(id)a3 completion:(id)a4;
- (void)didChangeFMIPAccountInfo:(id)a3;
- (void)didReceiveLostModeExitAuthToken:(id)a3;
- (void)didRemoveLocalFindableAccessory:(id)a3 completion:(id)a4;
- (void)disableBiometricIDForLostModeWithCompletion:(id)a3;
- (void)disableFMIPForAccount:(id)a3 pairedDeviceWithUDID:(id)a4 withCompletion:(id)a5;
- (void)disableFMIPUsingToken:(id)a3 forPairedDeviceWithUDID:(id)a4 withCompletion:(id)a5;
- (void)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 completion:(id)a5;
- (void)disableLocationDisplayWithCompletion:(id)a3;
- (void)disableLostMode;
- (void)disableManagedLostModeWithLocatedMessage:(id)a3 completion:(id)a4;
- (void)enableActivationLockWithCompletion:(id)a3;
- (void)enableManagedLostModeWithInfo:(id)a3 completion:(id)a4;
- (void)enableRepairWithContext:(id)a3 completion:(id)a4;
- (void)fetchAPNSTokenWithCompletion:(id)a3;
- (void)fetchAccessoryConfigurations:(id)a3;
- (void)fetchOfflineFindingInfoWithCompletion:(id)a3;
- (void)fmipAccount;
- (void)fmipAccountWithCompletion:(id)a3;
- (void)fmipStateWithCompletion:(id)a3;
- (void)getAccessoriesWithCompletion:(id)a3;
- (void)getConnectedAccessoriesDiscoveryIds:(id)a3;
- (void)initiateLostModeExitAuthForIDSDeviceID:(id)a3 withCompletion:(id)a4;
- (void)initiateLostModeExitAuthWithCompletion:(id)a3;
- (void)isActivationLockAllowedWithCompletion:(id)a3;
- (void)isActivationLockEnabledWithCompletion:(id)a3;
- (void)isActivationLockedWithCompletion:(id)a3;
- (void)lostModeInfo;
- (void)lowBatteryLocateEnabledWithCompletion:(id)a3;
- (void)markAsMissingSupportedForPairedDeviceWithUDID:(id)a3 withCompletion:(id)a4;
- (void)markPairedDeviceWithUDID:(id)a3 asMissingUsingToken:(id)a4 withCompletion:(id)a5;
- (void)pairingCheckWith:(id)a3 completion:(id)a4;
- (void)playSoundWithMessage:(id)a3 completion:(id)a4;
- (void)playSoundWithOptions:(id)a3 completion:(id)a4;
- (void)registerDeviceForPairingLock:(id)a3 completion:(id)a4;
- (void)removeAccessoryWithDiscoveryId:(id)a3 completion:(id)a4;
- (void)removeNotificationWithIdentifier:(id)a3 completion:(id)a4;
- (void)requireDisableLocationWithCompletion:(id)a3;
- (void)setDailyLocateReportEnabled:(BOOL)a3;
- (void)setLowBatteryLocateEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setManagedLostModeFileURL:(id)a3;
- (void)setNeedsLocateAckLostModeFileURL:(id)a3;
- (void)setPhoneNumber:(id)a3 toAccessoryWithDiscoveryId:(id)a4 completion:(id)a5;
- (void)setSerialQueue:(id)a3;
- (void)showDailyLocateReport;
- (void)signatureHeadersWithData:(id)a3 completion:(id)a4;
- (void)soundStoppedForAccessoryIdentifier:(id)a3;
- (void)startLocationMonitoring:(id)a3;
- (void)startLocationMonitoringWithContext:(id)a3 completion:(id)a4;
- (void)startLocationMonitoringWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5;
- (void)startLocationMonitoringWithOptions:(id)a3 completion:(id)a4;
- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7;
- (void)stopLocationMonitoring:(id)a3;
- (void)stopLocationMonitoringWithContext:(id)a3 completion:(id)a4;
- (void)stopLocationMonitoringWithOptions:(id)a3 completion:(id)a4;
- (void)stopPlayingSoundForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5;
- (void)stopSoundMessageWithCompletion:(id)a3;
- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4;
- (void)updateMaskedAppleIDWith:(id)a3 completion:(id)a4;
- (void)updatePairingLockInfo:(id)a3 completion:(id)a4;
- (void)updatedConfigReceived:(id)a3 completion:(id)a4;
- (void)userDidAckManagedLostModeLocateWithCompletion:(id)a3;
- (void)userNotifiedOfActivationLockForAllPairedDevices;
- (void)userNotifiedOfActivationLockForPairedDevices:(id)a3;
- (void)waitForRoutableAccessory:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation FMDFMIPManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance__instance;

  return v2;
}

uint64_t __32__FMDFMIPManager_sharedInstance__block_invoke()
{
  sharedInstance__instance = objc_alloc_init(FMDFMIPManager);

  return MEMORY[0x1F41817F8]();
}

- (FMDFMIPManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPManager;
  v2 = [(FMDFMIPManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.FindMyDevice.FMDFMIPManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)getConnectedAccessoriesDiscoveryIds:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F2350]();
  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[FMDFMIPManager getConnectedAccessoriesDiscoveryIds:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  objc_super v6 = +[FMNSXPCConnectionCache sharedCache];
  v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_161;
  v13[3] = &unk_1E689C250;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 getConnectedAccessoriesDiscoveryIds:v13];
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = LogCategory_Unspecified();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_41_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = a2;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "FMIP state : %ld", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)fmipStateWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[FMDFMIPManager fmipStateWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  objc_super v6 = +[FMNSXPCConnectionCache sharedCache];
  v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  uint64_t v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_41;
  v13[3] = &unk_1E689C0B0;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 getFMIPStateUsingCallback:v13];
}

uint64_t __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_161(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (BOOL)lostModeIsActive
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    v21 = "-[FMDFMIPManager lostModeIsActive]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v20, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  if ([(FMDFMIPManager *)self _isRunningAsMobileUser])
  {
    [MEMORY[0x1E4F61550] synchronizeDomain:kFMDPublicNotBackedUpPrefDomain];
    id v5 = [MEMORY[0x1E4F61550] dictionaryForKey:@"FMIPLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];
    objc_super v6 = v5;
    if (v5)
    {
      v7 = [v5 objectForKey:@"lostModeEnabled"];
      char v8 = [v7 BOOLValue];

      if (v8) {
        goto LABEL_11;
      }
    }
    id v9 = [MEMORY[0x1E4F61550] dictionaryForKey:@"ClientLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = [v9 objectForKey:@"lostModeEnabled"];
      char v12 = [v11 BOOLValue];

      if (v12) {
        goto LABEL_11;
      }
    }
    [MEMORY[0x1E4F61550] synchronizeDomain:kFMDPostWipePrefDomain];
    v13 = [MEMORY[0x1E4F61550] dictionaryForKey:@"FMIPWipeLostModeInfo" inDomain:kFMDPostWipePrefDomain];
    if (v13)
    {
      id v14 = v13;
      id v15 = [v13 objectForKey:@"lostModeEnabled"];
      char v16 = [v15 BOOLValue];

      if (v16) {
        goto LABEL_11;
      }
    }
    if ([(FMDFMIPManager *)self _managedLostModeType]) {
LABEL_11:
    }
      BOOL v17 = 1;
    else {
      BOOL v17 = [(FMDFMIPManager *)self _needsAckLostModeType] != 0;
    }
    v18 = LogCategory_Unspecified();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109120;
      LODWORD(v21) = v17;
      _os_log_impl(&dword_1D0E93000, v18, OS_LOG_TYPE_DEFAULT, "lostModeIsActive = %d", (uint8_t *)&v20, 8u);
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  return v17;
}

- (BOOL)isManagedLostModeActive
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    char v8 = "-[FMDFMIPManager isManagedLostModeActive]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  BOOL v5 = [(FMDFMIPManager *)self _managedLostModeType] == 3;
  return v5;
}

- (BOOL)isLostModeActive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[FMDFMIPManager isLostModeActive]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  BOOL v5 = [(FMDFMIPManager *)self _checkLostModeInSharedContainer];
  objc_super v6 = LogCategory_Unspecified();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v5) {
      int v7 = @"YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[FMDFMIPManager isLostModeActive]";
    __int16 v11 = 2112;
    char v12 = v7;
    _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "%s : %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (unint64_t)_managedLostModeType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(FMDFMIPManager *)self getManagedLostModeFileURL];
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[FMDFMIPManager _managedLostModeType]();
  }

  id v15 = 0;
  v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fm_dictionaryWithContentsOfURL:error:", v2, &v15);
  id v5 = v15;
  objc_super v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "fm_isFileNotFoundError") & 1) == 0)
    {
      int v7 = LogCategory_Unspecified();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v17 = (unint64_t)v6;
        _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Could not read managed lost mode file %@", buf, 0xCu);
      }
      unint64_t v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    int v9 = LogCategory_Unspecified();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FMDFMIPManager _managedLostModeType]();
    }

    uint64_t v10 = [v4 objectForKey:@"lostModeEnabled"];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      char v12 = [v4 objectForKey:@"lostModeType"];
      int v7 = v12;
      if (v12) {
        unint64_t v8 = [v12 integerValue];
      }
      else {
        unint64_t v8 = 3;
      }
      uint64_t v13 = LogCategory_Unspecified();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v17 = v8;
        _os_log_impl(&dword_1D0E93000, v13, OS_LOG_TYPE_DEFAULT, "Managed lost mode type? %lu", buf, 0xCu);
      }

      goto LABEL_18;
    }
  }
  unint64_t v8 = 0;
LABEL_19:

  return v8;
}

- (unint64_t)_needsAckLostModeType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(FMDFMIPManager *)self getNeedsLocateAckLostModeFileURL];
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[FMDFMIPManager _needsAckLostModeType]();
  }

  id v14 = 0;
  v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fm_dictionaryWithContentsOfURL:error:", v2, &v14);
  id v5 = v14;
  objc_super v6 = v5;
  if (!v5)
  {
    int v9 = LogCategory_Unspecified();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FMDFMIPManager _needsAckLostModeType]();
    }

    uint64_t v10 = [v4 objectForKey:@"lostModeEnabled"];
    int v11 = [v10 BOOLValue];

    if (v11)
    {
      char v12 = [v4 objectForKey:@"lostModeType"];
      unint64_t v8 = [v12 integerValue];

      int v7 = LogCategory_Unspecified();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v16 = v8;
        _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "NeedsLocateAck lost mode type? %lu", buf, 0xCu);
      }
      goto LABEL_13;
    }
LABEL_14:
    unint64_t v8 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "fm_isFileNotFoundError")) {
    goto LABEL_14;
  }
  int v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v16 = (unint64_t)v6;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Could not read NeedsLocateAck lost mode file %@", buf, 0xCu);
  }
  unint64_t v8 = 0;
LABEL_13:

LABEL_15:
  return v8;
}

- (id)lostModeInfo
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[FMDFMIPManager lostModeInfo]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v5 = 0;
  if ([(FMDFMIPManager *)self _isRunningAsMobileUser])
  {
    objc_super v6 = [(FMDFMIPManager *)self getManagedLostModeFileURL];
    id v44 = 0;
    int v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fm_dictionaryWithContentsOfURL:error:", v6, &v44);
    unint64_t v8 = (char *)v44;
    int v9 = v8;
    if (v7)
    {
      uint64_t v10 = LogCategory_Unspecified();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0E93000, v10, OS_LOG_TYPE_DEFAULT, "Checking if device is in managed lost mode", buf, 2u);
      }

      int v11 = [v7 objectForKey:@"lostModeEnabled"];
      char v12 = [v11 BOOLValue];

      if (v12)
      {
        uint64_t v13 = [v7 objectForKey:@"lostModeType"];
        uint64_t v14 = [v13 integerValue];

        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 3;
        }
        goto LABEL_36;
      }
    }
    else if (v8 && (objc_msgSend(v8, "fm_isFileNotFoundError") & 1) == 0)
    {
      unint64_t v16 = LogCategory_Unspecified();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v9;
        _os_log_impl(&dword_1D0E93000, v16, OS_LOG_TYPE_DEFAULT, "Could not read managed lost mode file %@", buf, 0xCu);
      }
    }
    uint64_t v17 = LogCategory_Unspecified();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0E93000, v17, OS_LOG_TYPE_DEFAULT, "Checking if device is in fmip lost mode", buf, 2u);
    }

    [MEMORY[0x1E4F61550] synchronizeDomain:kFMDPublicNotBackedUpPrefDomain];
    uint64_t v18 = [MEMORY[0x1E4F61550] dictionaryForKey:@"FMIPLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];

    if (v18)
    {
      v19 = [v18 objectForKey:@"lostModeEnabled"];
      char v20 = [v19 BOOLValue];

      if (v20)
      {
        uint64_t v15 = 1;
        int v7 = v18;
LABEL_36:
        v34 = LogCategory_Unspecified();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0E93000, v34, OS_LOG_TYPE_DEFAULT, "Device is in lost mode", buf, 2u);
        }

        id v5 = objc_alloc_init(FMDLostModeInfo);
        [(FMDLostModeInfo *)v5 setLostModeEnabled:1];
        v35 = [v7 objectForKey:@"lostModeMessage"];
        [(FMDLostModeInfo *)v5 setMessage:v35];

        v36 = [v7 objectForKey:@"lostModeOwnerNumber"];
        [(FMDLostModeInfo *)v5 setPhoneNumber:v36];

        v37 = [v7 objectForKey:@"lostModeFacetimeCapable"];
        -[FMDLostModeInfo setFacetimeCapable:](v5, "setFacetimeCapable:", [v37 BOOLValue]);

        v38 = [v7 objectForKey:@"lostModeFootnoteTextPrefKey"];
        [(FMDLostModeInfo *)v5 setFootnoteText:v38];

        v39 = [v7 objectForKey:@"disableSlideToUnlock"];
        -[FMDLostModeInfo setDisableSlideToUnlock:](v5, "setDisableSlideToUnlock:", [v39 BOOLValue]);

        [(FMDLostModeInfo *)v5 setLostModeType:v15];
        goto LABEL_39;
      }
    }
    v21 = LogCategory_Unspecified();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0E93000, v21, OS_LOG_TYPE_DEFAULT, "Checking if device is in client lost mode", buf, 2u);
    }

    int v7 = [MEMORY[0x1E4F61550] dictionaryForKey:@"ClientLostModeInfo" inDomain:kFMDPublicNotBackedUpPrefDomain];

    if (v7)
    {
      uint64_t v22 = [v7 objectForKey:@"lostModeEnabled"];
      char v23 = [v22 BOOLValue];

      if (v23)
      {
        uint64_t v15 = 2;
        goto LABEL_36;
      }
    }
    v24 = LogCategory_Unspecified();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0E93000, v24, OS_LOG_TYPE_DEFAULT, "Checking if device is in wipe lost mode", buf, 2u);
    }

    [MEMORY[0x1E4F61550] synchronizeDomain:kFMDPostWipePrefDomain];
    v25 = [MEMORY[0x1E4F61550] dictionaryForKey:@"FMIPWipeLostModeInfo" inDomain:kFMDPostWipePrefDomain];

    if (v25)
    {
      v26 = [v25 objectForKey:@"lostModeEnabled"];
      char v27 = [v26 BOOLValue];

      if (v27)
      {
        uint64_t v15 = 4;
        int v7 = v25;
        goto LABEL_36;
      }
    }
    v28 = [(FMDFMIPManager *)self getNeedsLocateAckLostModeFileURL];
    id v43 = 0;
    int v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fm_dictionaryWithContentsOfURL:error:", v28, &v43);
    id v29 = v43;

    if (v7)
    {
      v30 = LogCategory_Unspecified();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0E93000, v30, OS_LOG_TYPE_DEFAULT, "Checking if device is in needsLocateAck lost mode", buf, 2u);
      }

      v31 = [v7 objectForKey:@"lostModeEnabled"];
      char v32 = [v31 BOOLValue];

      if (v32)
      {
        v33 = [v7 objectForKey:@"lostModeType"];
        uint64_t v15 = [v33 integerValue];

        if (v15) {
          goto LABEL_36;
        }
LABEL_51:
        id v5 = 0;
LABEL_39:
        v40 = LogCategory_Unspecified();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          [(FMDFMIPManager *)v5 lostModeInfo];
        }

        goto LABEL_42;
      }
    }
    else if (v29 && (objc_msgSend(v29, "fm_isFileNotFoundError") & 1) == 0)
    {
      v42 = LogCategory_Unspecified();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = (const char *)v29;
        _os_log_impl(&dword_1D0E93000, v42, OS_LOG_TYPE_DEFAULT, "Could not read needsLocateAck lost mode file %@", buf, 0xCu);
      }
    }
    goto LABEL_51;
  }
LABEL_42:

  return v5;
}

- (id)enableLostModeWithInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F2350]();
  objc_super v6 = LogCategory_Unspecified();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v4 description];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[FMDFMIPManager enableLostModeWithInfo:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "%s with lost mode info %@", buf, 0x16u);
  }
  fmdFMIPLastOperationResult = 0;
  unint64_t v8 = [NSString stringWithUTF8String:"-[FMDFMIPManager enableLostModeWithInfo:]"];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F61568]) initWithDescription:v8 andTimeout:5.0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v10 = +[FMNSXPCConnectionCache sharedCache];
  int v11 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  char v12 = [v10 resumeConnectionWithConfiguration:v11];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke;
  v25[3] = &unk_1E689BFA0;
  char v27 = buf;
  id v13 = v9;
  id v26 = v13;
  [v12 addFailureBlock:v25];
  uint64_t v14 = [v12 remoteObjectProxy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_15;
  v21[3] = &unk_1E689BFC8;
  v24 = buf;
  id v15 = v13;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  [v14 enableLostModeWithInfo:v4 usingCallback:v21];
  [v15 wait];
  if ([v15 timeoutOccurred]) {
    id v17 = [(FMDFMIPManager *)self newErrorForCode:4 message:@"timed out"];
  }
  else {
    id v17 = *(id *)(*(void *)&buf[8] + 40);
  }
  uint64_t v18 = v17;
  if (v17)
  {
    fmdFMIPLastOperationResult = [v17 code];
    v19 = LogCategory_Unspecified();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FMDFMIPManager enableLostModeWithInfo:]();
    }
  }
  _Block_object_dispose(buf, 8);

  return v18;
}

void __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  [*(id *)(a1 + 32) signal];
}

void __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_15(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
  [*(id *)(a1 + 40) invalidate];
}

- (void)disableLostMode
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F2350](self, a2);
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v12 = "-[FMDFMIPManager disableLostMode]";
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = +[FMNSXPCConnectionCache sharedCache];
  id v5 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v6 = [v4 resumeConnectionWithConfiguration:v5];

  [v6 addFailureBlock:&__block_literal_global_21];
  int v7 = [v6 remoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__FMDFMIPManager_disableLostMode__block_invoke_22;
  v9[3] = &unk_1E689C010;
  id v10 = v6;
  id v8 = v6;
  [v7 disableLostModeUsingCallback:v9];
}

void __33__FMDFMIPManager_disableLostMode__block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __33__FMDFMIPManager_disableLostMode__block_invoke_cold_1();
  }
}

void __33__FMDFMIPManager_disableLostMode__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "disableLostMode completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (void)enableManagedLostModeWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[FMDFMIPManager enableManagedLostModeWithInfo:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  if ([v6 lostModeEnabled])
  {
    [v6 setDisableSlideToUnlock:1];
    [v6 setLostModeType:3];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke;
    v21[3] = &unk_1E689C038;
    id v22 = v7;
    [(FMDFMIPManager *)self _updateManagedLostModeWithInfo:v6 completion:v21];
    int v9 = v22;
LABEL_9:

    goto LABEL_10;
  }
  id v10 = LogCategory_Unspecified();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[FMDFMIPManager enableManagedLostModeWithInfo:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  if (v7)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    v19 = kFMDErrorDomain;
    uint64_t v23 = *MEMORY[0x1E4F28588];
    v24 = @"You have passed in lostModeEnabled as NO. This is invalid";
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    char v20 = (void *)[v18 initWithDomain:v19 code:0 userInfo:v9];
    (*((void (**)(id, void *))v7 + 2))(v7, v20);

    goto LABEL_9;
  }
LABEL_10:
}

void __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_Unspecified();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_INFO, "Managed lost mode info updated", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.fmip.lostmode.enable", 0, 0, 1u);
}

- (void)disableManagedLostModeWithLocatedMessage:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v31 = "-[FMDFMIPManager disableManagedLostModeWithLocatedMessage:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  int v9 = [(FMDFMIPManager *)self lostModeInfo];
  if ([v9 lostModeType] == 3)
  {
    [(FMDFMIPManager *)self _stopAlarm];
    if (v6)
    {
      id v10 = objc_alloc_init(FMDLostModeInfo);
      [(FMDLostModeInfo *)v10 setMessage:v6];
      [(FMDLostModeInfo *)v10 setLostModeType:5];
      [(FMDLostModeInfo *)v10 setLostModeEnabled:1];
      [(FMDLostModeInfo *)v10 setDisableSlideToUnlock:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke;
      v24[3] = &unk_1E689C060;
      id v27 = v7;
      id v25 = v9;
      id v26 = self;
      [(FMDFMIPManager *)self _updateNeedsLocateAckLostModeWithInfo:v10 completion:v24];
    }
    else
    {
      [v9 setLostModeEnabled:0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_32;
      v22[3] = &unk_1E689C038;
      uint64_t v23 = (FMDLostModeInfo *)v7;
      [(FMDFMIPManager *)self _updateManagedLostModeWithInfo:v9 completion:v22];
      id v10 = v23;
    }
    goto LABEL_11;
  }
  uint64_t v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[FMDFMIPManager disableManagedLostModeWithLocatedMessage:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  if (v7)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    char v20 = kFMDErrorDomain;
    uint64_t v28 = *MEMORY[0x1E4F28588];
    id v29 = @"Device is not in managed lost mode. Cannot disable it.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v21 = (void *)[v19 initWithDomain:v20 code:2 userInfo:v10];
    (*((void (**)(id, void *))v7 + 2))(v7, v21);

LABEL_11:
  }
}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setLostModeEnabled:0];
    uint64_t v6 = *(void *)(a1 + 32);
    int v5 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2;
    v7[3] = &unk_1E689C038;
    id v8 = *(id *)(a1 + 48);
    [v5 _updateManagedLostModeWithInfo:v6 completion:v7];
  }
}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_INFO, "Managed lost mode info updated to disabled", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.fmip.lostmode.enable", 0, 0, 1u);
}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_INFO, "Managed lost mode info updated to disabled", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.fmip.lostmode.enable", 0, 0, 1u);
}

- (void)userDidAckManagedLostModeLocateWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[FMDFMIPManager userDidAckManagedLostModeLocateWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  uint64_t v6 = [(FMDFMIPManager *)self lostModeInfo];
  if ([v6 lostModeType] == 5)
  {
    [(FMDFMIPManager *)self _stopAlarm];
    [v6 setLostModeEnabled:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke;
    v19[3] = &unk_1E689C038;
    id v20 = v4;
    [(FMDFMIPManager *)self _updateNeedsLocateAckLostModeWithInfo:v6 completion:v19];
    id v7 = v20;
LABEL_9:

    goto LABEL_10;
  }
  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[FMDFMIPManager userDidAckManagedLostModeLocateWithCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  if (v4)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = kFMDErrorDomain;
    uint64_t v21 = *MEMORY[0x1E4F28588];
    id v22 = @"Device is not waiting for locate ack. Invalid state.";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v18 = (void *)[v16 initWithDomain:v17 code:2 userInfo:v7];
    (*((void (**)(id, void *))v4 + 2))(v4, v18);

    goto LABEL_9;
  }
LABEL_10:
}

void __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LogCategory_Unspecified();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_INFO, "NeedsLocateAck lost mode info updated to disabled", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.fmip.lostmode.enable", 0, 0, 1u);
}

- (void)playSoundWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25F2350]();
  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[FMDFMIPManager playSoundWithOptions:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v9 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v11 = [v9 resumeConnectionWithConfiguration:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke;
  v19[3] = &unk_1E689BE48;
  id v12 = v6;
  id v20 = v12;
  [v11 addFailureBlock:v19];
  uint64_t v13 = [v11 remoteObjectProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_36;
  v16[3] = &unk_1E689C088;
  id v14 = v12;
  id v17 = v11;
  id v18 = v14;
  id v15 = v11;
  [v13 playSoundWithOptions:v5 completion:v16];
}

void __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

uint64_t __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_36(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)deviceActivationDidSucceed
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F2350](self, a2);
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[FMDFMIPManager deviceActivationDidSucceed]";
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v4 = +[FMNSXPCConnectionCache sharedCache];
  id v5 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v6 = [v4 resumeConnectionWithConfiguration:v5];

  [v6 addFailureBlock:&__block_literal_global_38];
  id v7 = [v6 remoteObjectProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_39;
  v9[3] = &unk_1E689C010;
  id v10 = v6;
  id v8 = v6;
  [v7 deviceActivationDidSucceedUsingCallback:v9];
}

void __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_cold_1();
  }
}

void __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "deviceActivationDidSucceed completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (BOOL)lockdownShouldDisableDeviceRestore
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F2350](self, a2);
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[FMDFMIPManager lockdownShouldDisableDeviceRestore]";
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v4 = +[FMDFMIPSharedStateManager sharedInstance];
  int v5 = [v4 fmipActive];

  id v6 = LogCategory_Unspecified();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_9;
    }
    LOWORD(v12) = 0;
    id v8 = "FMiP is active. Returning YES to block restore.";
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    LOWORD(v12) = 0;
    id v8 = "FMiP inactive. Returning NO to allow restore.";
  }
  _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 2u);
LABEL_9:

  uint64_t v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v5) {
      id v10 = @"YES";
    }
    int v12 = 136315394;
    uint64_t v13 = "-[FMDFMIPManager lockdownShouldDisableDeviceRestore]";
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_1D0E93000, v9, OS_LOG_TYPE_DEFAULT, "%s : %@", (uint8_t *)&v12, 0x16u);
  }

  return v5;
}

- (BOOL)lockdownShouldDisableDevicePairing
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[FMDFMIPManager lockdownShouldDisableDevicePairing]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  BOOL v5 = [(FMDFMIPManager *)self _checkLostModeInSharedContainer];
  id v6 = LogCategory_Unspecified();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"NO";
    if (v5) {
      BOOL v7 = @"YES";
    }
    int v9 = 136315394;
    id v10 = "-[FMDFMIPManager lockdownShouldDisableDevicePairing]";
    __int16 v11 = 2112;
    int v12 = v7;
    _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "%s : %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)_checkLostModeInSharedContainer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[FMDFMIPSharedStateManager sharedInstance];
  uint64_t v3 = [v2 lostModeType];

  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "FMiP shared info has lost mode type - %lu", (uint8_t *)&v6, 0xCu);
  }

  return (unint64_t)(v3 - 1) < 3;
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_cold_1();
  }

  BOOL v5 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (a2 == 3) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 4;
    }
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v5);
  }
}

- (void)fmipAccountWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  BOOL v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[FMDFMIPManager fmipAccountWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v8 = [v6 resumeConnectionWithConfiguration:v7];

  objc_initWeak((id *)buf, v3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  id v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_43;
  v13[3] = &unk_1E689C0D8;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 getFmipAccountUsingCallback:v13];

  objc_destroyWeak((id *)buf);
}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = MEMORY[0x1D25F2500](*(void *)(a1 + 32));
  BOOL v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v3);
  }
}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = LogCategory_Unspecified();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_43_cold_1();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "FMIP account name : %@, dsid: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (id)fmipAccount
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FMDFMIPManager fmipAccount]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  uint64_t v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x3032000000;
  v29[2] = __Block_byref_object_copy__0;
  v29[3] = __Block_byref_object_dispose__0;
  id v30 = 0;
  BOOL v5 = [NSString stringWithUTF8String:"-[FMDFMIPManager fmipAccount]"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F61568]) initWithDescription:v5 andTimeout:5.0];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __29__FMDFMIPManager_fmipAccount__block_invoke;
  uint64_t v17 = &unk_1E689C100;
  id v19 = &v22;
  p_long long buf = &buf;
  uint64_t v21 = &v28;
  id v7 = v6;
  id v18 = v7;
  [(FMDFMIPManager *)self fmipAccountWithCompletion:&v14];
  [v7 wait];
  if ([v7 timeoutOccurred]) {
    id v8 = [(FMDFMIPManager *)self newErrorForCode:4 message:@"timed out"];
  }
  else {
    id v8 = (id)v23[5];
  }
  id v9 = v8;
  if (v8)
  {
    fmdFMIPLastOperationResult = [v8 code];
    id v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FMDFMIPManager fmipAccount]();
    }
  }
  else
  {
    id v10 = LogCategory_Unspecified();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(FMDFMIPManager *)(uint64_t)&buf + 8 fmipAccount];
    }
  }

  if (*(void *)(*((void *)&buf + 1) + 40) && *(void *)(v29[0] + 40))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v12 = objc_msgSend(v11, "initWithObjectsAndKeys:", *(void *)(*((void *)&buf + 1) + 40), @"username", *(void *)(v29[0] + 40), @"personID", 0, v14, v15, v16, v17);
  }
  else
  {
    uint64_t v12 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&buf, 8);

  return v12;
}

void __29__FMDFMIPManager_fmipAccount__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v15 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  [*(id *)(a1 + 32) signal];
}

- (void)didChangeFMIPAccountInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  BOOL v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v14 = "-[FMDFMIPManager didChangeFMIPAccountInfo:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  id v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v8 = [v6 resumeConnectionWithConfiguration:v7];

  [v8 addFailureBlock:&__block_literal_global_46];
  uint64_t v9 = [v8 remoteObjectProxy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_47;
  v11[3] = &unk_1E689C010;
  id v12 = v8;
  id v10 = v8;
  [v9 didChangeFMIPAccountInfo:v3 usingCallback:v11];
}

void __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_cold_1();
  }
}

void __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "didChangeFMIPAccountInfo completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (id)enableFMIPInContext:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)MEMORY[0x1D25F2350](self, a2);
  id v6 = LogCategory_Unspecified();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[FMDFMIPManager enableFMIPInContext:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "%s in context %lu", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v7 = [NSString stringWithUTF8String:"-[FMDFMIPManager enableFMIPInContext:]"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F61568]) initWithDescription:v7 andTimeout:5.0];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__0;
  id v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  uint64_t v9 = +[FMNSXPCConnectionCache sharedCache];
  id v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __38__FMDFMIPManager_enableFMIPInContext___block_invoke;
  v24[3] = &unk_1E689BFA0;
  id v26 = buf;
  id v12 = v8;
  id v25 = v12;
  [v11 addFailureBlock:v24];
  int v13 = [v11 remoteObjectProxy];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__FMDFMIPManager_enableFMIPInContext___block_invoke_48;
  v20[3] = &unk_1E689BFC8;
  uint64_t v23 = buf;
  id v14 = v12;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  [v13 enableFMIPInContext:a3 usingCallback:v20];
  [v14 wait];
  if ([v14 timeoutOccurred]) {
    id v16 = [(FMDFMIPManager *)self newErrorForCode:4 message:@"timed out"];
  }
  else {
    id v16 = *(id *)(*(void *)&buf[8] + 40);
  }
  uint64_t v17 = v16;
  if (v16)
  {
    fmdFMIPLastOperationResult = [v16 code];
    id v18 = LogCategory_Unspecified();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[FMDFMIPManager enableFMIPInContext:]();
    }
  }
  _Block_object_dispose(buf, 8);

  return v17;
}

void __38__FMDFMIPManager_enableFMIPInContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__FMDFMIPManager_enableFMIPInContext___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  [*(id *)(a1 + 32) signal];
}

void __38__FMDFMIPManager_enableFMIPInContext___block_invoke_48(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
  [*(id *)(a1 + 40) invalidate];
}

- (id)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "non-nil";
    if (!v6) {
      id v8 = "nil";
    }
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[FMDFMIPManager disableFMIPUsingToken:inContext:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s with %s token", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F61568]) initWithDescription:@"disableFMIPUsingToken:inContext:" andTimeout:20.0];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __50__FMDFMIPManager_disableFMIPUsingToken_inContext___block_invoke;
  id v21 = &unk_1E689C128;
  uint64_t v23 = buf;
  id v10 = v9;
  id v22 = v10;
  [(FMDFMIPManager *)self _disableFMIPUsingToken:v6 inContext:a4 completion:&v18];
  objc_msgSend(v10, "wait", v18, v19, v20, v21);
  if ([v10 timeoutOccurred])
  {
    id v11 = [(FMDFMIPManager *)self newErrorForCode:4 message:@"timed out"];
    id v12 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v11;
  }
  else
  {
    uint64_t v13 = *(void *)&buf[8];
    id v14 = *(id *)(*(void *)&buf[8] + 40);
    id v12 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }

  id v15 = *(void **)(*(void *)&buf[8] + 40);
  if (v15) {
    fmdFMIPLastOperationResult = 12;
  }
  id v16 = v15;

  _Block_object_dispose(buf, 8);

  return v16;
}

void __50__FMDFMIPManager_disableFMIPUsingToken_inContext___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

- (void)disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = LogCategory_Unspecified();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "non-nil";
    if (!v9) {
      id v11 = "nil";
    }
    int v12 = 136315394;
    uint64_t v13 = "-[FMDFMIPManager disableFMIPUsingToken:inContext:completion:]";
    __int16 v14 = 2080;
    id v15 = v11;
    _os_log_impl(&dword_1D0E93000, v10, OS_LOG_TYPE_DEFAULT, "%s with %s token", (uint8_t *)&v12, 0x16u);
  }

  [(FMDFMIPManager *)self _disableFMIPUsingToken:v9 inContext:a4 completion:v8];
}

- (void)disableFMIPUsingToken:(id)a3 forPairedDeviceWithUDID:(id)a4 withCompletion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D25F2350]();
  id v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = "non-nil";
    id v27 = "-[FMDFMIPManager disableFMIPUsingToken:forPairedDeviceWithUDID:withCompletion:]";
    *(_DWORD *)long long buf = 136315650;
    if (!v7) {
      int v12 = "nil";
    }
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2080;
    uint64_t v31 = v12;
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "%s for paired device %@ with %s token", buf, 0x20u);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v13 = LogCategory_Unspecified();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v27) = v7 != 0;
    _os_log_impl(&dword_1D0E93000, v13, OS_LOG_TYPE_DEFAULT, "disableFMIPUsingToken: token present: %i", buf, 8u);
  }

  __int16 v14 = +[FMNSXPCConnectionCache sharedCache];
  id v15 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v16 = [v14 resumeConnectionWithConfiguration:v15];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke;
  v24[3] = &unk_1E689BE48;
  id v17 = v9;
  id v25 = v17;
  [v16 addFailureBlock:v24];
  uint64_t v18 = [v16 remoteObjectProxy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_54;
  v21[3] = &unk_1E689C088;
  id v19 = v17;
  id v22 = v16;
  id v23 = v19;
  id v20 = v16;
  [v18 disableFMIPUsingToken:v7 forPairedDeviceWithUDID:v8 usingCallback:v21];
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_54_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[FMDFMIPManager disableFMIPUsingToken:forPairedDeviceWithUDID:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)disableFMIPForAccount:(id)a3 pairedDeviceWithUDID:(id)a4 withCompletion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D25F2350]();
  id v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v7 oneTimeRemoveAuthToken];
    uint64_t v13 = "non-nil";
    __int16 v28 = "-[FMDFMIPManager disableFMIPForAccount:pairedDeviceWithUDID:withCompletion:]";
    *(_DWORD *)long long buf = 136315650;
    if (!v12) {
      uint64_t v13 = "nil";
    }
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2080;
    uint64_t v32 = v13;
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "%s for paired device %@ with %s token", buf, 0x20u);
  }
  fmdFMIPLastOperationResult = 0;
  __int16 v14 = LogCategory_Unspecified();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v28) = v7 != 0;
    _os_log_impl(&dword_1D0E93000, v14, OS_LOG_TYPE_DEFAULT, "disableFMIPForAccount: Account present: %i", buf, 8u);
  }

  id v15 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v16 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v17 = [v15 resumeConnectionWithConfiguration:v16];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke;
  v25[3] = &unk_1E689BE48;
  id v18 = v9;
  id v26 = v18;
  [v17 addFailureBlock:v25];
  id v19 = [v17 remoteObjectProxy];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_55;
  v22[3] = &unk_1E689C088;
  id v20 = v18;
  id v23 = v17;
  id v24 = v20;
  id v21 = v17;
  [v19 disableFMIPForAccount:v7 pairedDeviceWithUDID:v8 usingCallback:v22];
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_55_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[FMDFMIPManager disableFMIPForAccount:pairedDeviceWithUDID:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)markAsMissingSupportedForPairedDeviceWithUDID:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1D25F2350]();
  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v22 = "-[FMDFMIPManager markAsMissingSupportedForPairedDeviceWithUDID:withCompletion:]";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%s for paired device %@", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v9 = +[FMNSXPCConnectionCache sharedCache];
  id v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke;
  v19[3] = &unk_1E689BE48;
  id v12 = v6;
  id v20 = v12;
  [v11 addFailureBlock:v19];
  uint64_t v13 = [v11 remoteObjectProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_56;
  v16[3] = &unk_1E689C150;
  id v14 = v12;
  id v17 = v11;
  id v18 = v14;
  id v15 = v11;
  [v13 markAsMissingSupportedForPairedDeviceWithUDID:v5 usingCallback:v16];
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = LogCategory_Unspecified();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_56_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[FMDFMIPManager markAsMissingSupportedForPairedDeviceWithUDID:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)markPairedDeviceWithUDID:(id)a3 asMissingUsingToken:(id)a4 withCompletion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1D25F2350]();
  uint64_t v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "non-nil";
    id v27 = "-[FMDFMIPManager markPairedDeviceWithUDID:asMissingUsingToken:withCompletion:]";
    *(_DWORD *)long long buf = 136315650;
    if (!v8) {
      id v12 = "nil";
    }
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2080;
    __int16 v31 = v12;
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "%s for paired device %@ with %s token", buf, 0x20u);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v13 = LogCategory_Unspecified();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v27) = v8 != 0;
    _os_log_impl(&dword_1D0E93000, v13, OS_LOG_TYPE_DEFAULT, "markPairedDeviceWithUDID: token present: %i", buf, 8u);
  }

  id v14 = +[FMNSXPCConnectionCache sharedCache];
  id v15 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v16 = [v14 resumeConnectionWithConfiguration:v15];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke;
  v24[3] = &unk_1E689BE48;
  id v17 = v9;
  id v25 = v17;
  [v16 addFailureBlock:v24];
  id v18 = [v16 remoteObjectProxy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_58;
  v21[3] = &unk_1E689C088;
  id v19 = v17;
  id v22 = v16;
  id v23 = v19;
  id v20 = v16;
  [v18 markPairedDeviceWithUDID:v7 asMissingUsingToken:v8 callback:v21];
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_58_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[FMDFMIPManager markPairedDeviceWithUDID:asMissingUsingToken:withCompletion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)isActivationLockAllowedWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v19 = "-[FMDFMIPManager isActivationLockAllowedWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  int v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  id v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_59;
  v13[3] = &unk_1E689C150;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 isActivationLockAllowedUsingCallback:v13];
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = LogCategory_Unspecified();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_59_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "ActivationLockAllowed : %d", (uint8_t *)v9, 8u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)isActivationLockEnabledWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v19 = "-[FMDFMIPManager isActivationLockEnabledWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  int v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  uint64_t v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_60;
  v13[3] = &unk_1E689C150;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 isActivationLockEnabledUsingCallback:v13];
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = LogCategory_Unspecified();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_60_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "ActivationLockEnabled : %d", (uint8_t *)v9, 8u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)isActivationLockedWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v19 = "-[FMDFMIPManager isActivationLockedWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  int v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  uint64_t v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_61;
  v13[3] = &unk_1E689C150;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 isActivationLockedUsingCallback:v13];
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = LogCategory_Unspecified();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_61_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "ActivationLocked : %d", (uint8_t *)v9, 8u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)enableActivationLockWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v19 = "-[FMDFMIPManager enableActivationLockWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  int v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  uint64_t v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_62;
  v13[3] = &unk_1E689C088;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 enableActivationLockUsingCallback:v13];
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = LogCategory_Unspecified();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_62_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (BOOL)needsLostModeExitAuth
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25F2350](self, a2);
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[FMDFMIPManager needsLostModeExitAuth]";
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  if ([(FMDFMIPManager *)self _isRunningAsMobileUser])
  {
    [MEMORY[0x1E4F61550] synchronizeDomain:kFMDNotBackedUpPrefDomain];
    int v5 = [MEMORY[0x1E4F61550] BOOLForKey:@"needsLostModeExitAuth" inDomain:kFMDNotBackedUpPrefDomain];
    uint64_t v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      LODWORD(v9) = v5;
      _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "needsLostModeExitAuth = %d", (uint8_t *)&v8, 8u);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)didReceiveLostModeExitAuthToken:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  int v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "non-nil";
    if (!v3) {
      uint64_t v6 = "nil";
    }
    *(_DWORD *)long long buf = 136315394;
    uint64_t v16 = "-[FMDFMIPManager didReceiveLostModeExitAuthToken:]";
    __int16 v17 = 2080;
    id v18 = v6;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s with %s token", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  int v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v16) = v3 != 0;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "didReceiveLostModeExitAuthToken: token present: %i", buf, 8u);
  }

  int v8 = +[FMNSXPCConnectionCache sharedCache];
  id v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v10 = [v8 resumeConnectionWithConfiguration:v9];

  [v10 addFailureBlock:&__block_literal_global_64];
  id v11 = [v10 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_65;
  v13[3] = &unk_1E689C010;
  id v14 = v10;
  id v12 = v10;
  [v11 didReceiveLostModeExitAuthToken:v3 usingCallback:v13];
}

void __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_cold_1();
  }
}

void __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "didReceiveLostModeExitAuthToken completed. Error : %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
}

- (void)initiateLostModeExitAuthWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1D25F2350]();
  id v6 = LogCategory_Unspecified();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[FMDFMIPManager initiateLostModeExitAuthWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  [(FMDFMIPManager *)self _initiateLostModeExitAuthForIDSDeviceID:0 withCompletion:v4];
}

- (void)initiateLostModeExitAuthForIDSDeviceID:(id)a3 withCompletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1D25F2350]();
  uint64_t v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[FMDFMIPManager initiateLostModeExitAuthForIDSDeviceID:withCompletion:]";
    _os_log_impl(&dword_1D0E93000, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  [(FMDFMIPManager *)self _initiateLostModeExitAuthForIDSDeviceID:v6 withCompletion:v7];
}

- (void)lowBatteryLocateEnabledWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D25F2350]();
  int v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v19 = "-[FMDFMIPManager lowBatteryLocateEnabledWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v6 = +[FMNSXPCConnectionCache sharedCache];
  id v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  int v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_66;
  v13[3] = &unk_1E689C150;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 lowBatteryLocateEnabledUsingCallback:v13];
}

void __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

void __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = LogCategory_Unspecified();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "NO";
    if (a2) {
      id v7 = "YES";
    }
    int v9 = 136315394;
    int v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1D0E93000, v6, OS_LOG_TYPE_DEFAULT, "lowBatteryLocateEnabled : %s, Error : %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)setLowBatteryLocateEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1D25F2350]();
  id v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "NO";
    if (v4) {
      uint64_t v8 = "YES";
    }
    *(_DWORD *)long long buf = 136315394;
    id v22 = "-[FMDFMIPManager setLowBatteryLocateEnabled:withCompletion:]";
    __int16 v23 = 2080;
    id v24 = v8;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s enabled %s", buf, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
  int v9 = +[FMNSXPCConnectionCache sharedCache];
  int v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  __int16 v11 = [v9 resumeConnectionWithConfiguration:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke;
  v19[3] = &unk_1E689BE48;
  id v12 = v5;
  id v20 = v12;
  [v11 addFailureBlock:v19];
  uint64_t v13 = [v11 remoteObjectProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_69;
  v16[3] = &unk_1E689C088;
  id v14 = v12;
  id v17 = v11;
  id v18 = v14;
  id v15 = v11;
  [v13 setLowBatteryLocateEnabled:v4 usingCallback:v16];
}

void __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "setLowBatteryLocateEnabled completed. Error : %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)userNotifiedOfActivationLockForAllPairedDevices
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D25F2350](self, a2);
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[FMDFMIPManager userNotifiedOfActivationLockForAllPairedDevices]";
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
}

- (void)userNotifiedOfActivationLockForPairedDevices:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = (void *)MEMORY[0x1D25F2350]();
  uint64_t v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[FMDFMIPManager userNotifiedOfActivationLockForPairedDevices:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s for paired devices %@", (uint8_t *)&v6, 0x16u);
  }

  fmdFMIPLastOperationResult = 0;
}

- (id)pathsToPreserveAcrossWipe
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(FMDFMIPManager *)self _postWipePrefPath];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (void)signatureHeadersWithData:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25F2350]();
  __int16 v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v22 = "-[FMDFMIPManager signatureHeadersWithData:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v9 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  __int16 v11 = [v9 resumeConnectionWithConfiguration:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke;
  v19[3] = &unk_1E689BE48;
  id v12 = v6;
  id v20 = v12;
  [v11 addFailureBlock:v19];
  uint64_t v13 = [v11 remoteObjectProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_71;
  v16[3] = &unk_1E689C178;
  id v14 = v12;
  id v17 = v11;
  id v18 = v14;
  id v15 = v11;
  [v13 signatureHeadersWithData:v5 completion:v16];
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = LogCategory_Unspecified();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_71_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)startPlayingSoundForAccessory:(id)a3 duration:(double)a4 rampUpDuration:(double)a5 channels:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = +[FMNSXPCConnectionCache sharedCache];
  id v15 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  uint64_t v16 = [v14 resumeConnectionWithConfiguration:v15];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke;
  v27[3] = &unk_1E689BE48;
  id v17 = v12;
  id v28 = v17;
  [v16 addFailureBlock:v27];
  id v18 = [v16 remoteObjectProxy];
  uint64_t v19 = LogCategory_Unspecified();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    *(_DWORD *)long long buf = 138412290;
    uint64_t v30 = v20;
    _os_log_impl(&dword_1D0E93000, v19, OS_LOG_TYPE_DEFAULT, "accessory %@", buf, 0xCu);
  }

  id v21 = +[FMDGenericAudioAccessory copyAccessory:v11];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_74;
  v24[3] = &unk_1E689C088;
  id v25 = v16;
  id v26 = v17;
  id v22 = v16;
  id v23 = v17;
  [v18 startPlayingSoundForAccessory:v21 duration:v13 rampUpDuration:v24 channels:a4 completion:a5];
}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_74_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "playSoundForAccessory sound started", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)stopPlayingSoundForAccessory:(id)a3 rampDownDuration:(double)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v10 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke;
  v20[3] = &unk_1E689BE48;
  id v12 = v7;
  id v21 = v12;
  [v11 addFailureBlock:v20];
  id v13 = [v11 remoteObjectProxy];
  id v14 = +[FMDGenericAudioAccessory copyAccessory:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_75;
  v17[3] = &unk_1E689C088;
  id v18 = v11;
  id v19 = v12;
  id v15 = v11;
  id v16 = v12;
  [v13 stopPlayingForAccessory:v14 rampDownDuration:v17 completion:a4];
}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_75_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "stopSoundForAccessory sound did stop", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)waitForRoutableAccessory:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v10 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke;
  v22[3] = &unk_1E689BE48;
  id v12 = v7;
  id v23 = v12;
  [v11 addFailureBlock:v22];
  id v13 = [v11 remoteObjectProxy];
  id v14 = +[FMDGenericAudioAccessory copyAccessory:v8];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_76;
  v18[3] = &unk_1E689C1A0;
  id v20 = v11;
  id v21 = v12;
  id v19 = v14;
  id v15 = v11;
  id v16 = v12;
  id v17 = v14;
  [v13 waitForRoutableAccessory:v17 timeout:v18 completion:a4];
}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_76_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "Accessory became routable %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  [*(id *)(a1 + 40) invalidate];
}

- (void)soundStoppedForAccessoryIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[FMDFMIPManager soundStoppedForAccessoryIdentifier:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v8 = [v6 resumeConnectionWithConfiguration:v7];

  [v8 addFailureBlock:&__block_literal_global_78];
  uint64_t v9 = [v8 remoteObjectProxy];
  [v9 soundStoppedForAccessoryIdentifier:v3];
  [v8 invalidate];
}

void __53__FMDFMIPManager_soundStoppedForAccessoryIdentifier___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __53__FMDFMIPManager_soundStoppedForAccessoryIdentifier___block_invoke_cold_1();
  }
}

- (void)clearData:(unint64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1D25F2350]();
  uint64_t v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v18 = "-[FMDFMIPManager clearData:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  int v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v10 = [v8 resumeConnectionWithConfiguration:v9];

  [v10 addFailureBlock:&__block_literal_global_80];
  id v11 = [v10 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__FMDFMIPManager_clearData_completion___block_invoke_81;
  v14[3] = &unk_1E689C088;
  id v12 = v5;
  id v15 = v10;
  id v16 = v12;
  id v13 = v10;
  [v11 clearData:a3 completion:v14];
}

void __39__FMDFMIPManager_clearData_completion___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __39__FMDFMIPManager_clearData_completion___block_invoke_cold_1();
  }
}

uint64_t __39__FMDFMIPManager_clearData_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)audioAccessorySerialNumbersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke_2;
  v6[3] = &unk_1E689C208;
  id v7 = v4;
  id v5 = v4;
  [(FMDFMIPManager *)self _getAccessoriesWithFilter:&__block_literal_global_84 completion:v6];
}

uint64_t __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F2707870];
}

void __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "fm_map:", &__block_literal_global_153);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__FMDFMIPManager_audioAccessorySerialNumbersWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 audioAccessoryInfo];
}

- (void)getAccessoriesWithCompletion:(id)a3
{
}

uint64_t __47__FMDFMIPManager_getAccessoriesWithCompletion___block_invoke()
{
  return 1;
}

- (void)attemptUCRTHealing:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[FMDFMIPManager attemptUCRTHealing:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  int v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v10 = [v8 resumeConnectionWithConfiguration:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__FMDFMIPManager_attemptUCRTHealing_completion___block_invoke;
  v13[3] = &unk_1E689BE48;
  id v14 = v5;
  id v11 = v5;
  [v10 addFailureBlock:v13];
  id v12 = [v10 remoteObjectProxy];
  [v12 attemptUCRTHealing:v6 completion:v11];
}

void __48__FMDFMIPManager_attemptUCRTHealing_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__FMDFMIPManager_attemptUCRTHealing_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)fetchAccessoryConfigurations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v19 = "-[FMDFMIPManager fetchAccessoryConfigurations:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v6 = +[FMNSXPCConnectionCache sharedCache];
  id v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  int v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_158;
  v13[3] = &unk_1E689C088;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 fetchAccessoryConfigurations:v13];
}

void __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

uint64_t __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_158(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)removeAccessoryWithDiscoveryId:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25F2350]();
  int v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v22 = "-[FMDFMIPManager removeAccessoryWithDiscoveryId:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v9 = +[FMNSXPCConnectionCache sharedCache];
  int v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke;
  v19[3] = &unk_1E689BE48;
  id v12 = v6;
  id v20 = v12;
  [v11 addFailureBlock:v19];
  id v13 = [v11 remoteObjectProxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_159;
  v16[3] = &unk_1E689C088;
  id v14 = v12;
  id v17 = v11;
  id v18 = v14;
  id v15 = v11;
  [v13 removeAccessoryWithDiscoveryId:v5 completion:v16];
}

void __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

uint64_t __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_159(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)setPhoneNumber:(id)a3 toAccessoryWithDiscoveryId:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = (void *)MEMORY[0x1D25F2350]();
  id v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v25 = "-[FMDFMIPManager setPhoneNumber:toAccessoryWithDiscoveryId:completion:]";
    _os_log_impl(&dword_1D0E93000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v12 = +[FMNSXPCConnectionCache sharedCache];
  id v13 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v14 = [v12 resumeConnectionWithConfiguration:v13];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke;
  v22[3] = &unk_1E689BE48;
  id v15 = v9;
  id v23 = v15;
  [v14 addFailureBlock:v22];
  id v16 = [v14 remoteObjectProxy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_160;
  v19[3] = &unk_1E689C088;
  id v17 = v15;
  id v20 = v14;
  id v21 = v17;
  id v18 = v14;
  [v16 setPhoneNumber:v7 toAccessoryWithDiscoveryId:v8 completion:v19];
}

void __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

uint64_t __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_160(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

void __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, MEMORY[0x1E4F1CBF0], v3);
  }
}

- (void)registerDeviceForPairingLock:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[FMDFMIPManager registerDeviceForPairingLock:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v8 = +[FMNSXPCConnectionCache sharedCache];
  id v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  id v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_163;
  v15[3] = &unk_1E689C278;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 registerDeviceForPairingLock:v6 completion:v15];
}

void __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0);
  }
}

uint64_t __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_163(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)updatePairingLockInfo:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[FMDFMIPManager updatePairingLockInfo:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v8 = +[FMNSXPCConnectionCache sharedCache];
  id v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  id v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_165;
  v15[3] = &unk_1E689C088;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 updatePairingLockInfo:v6 completion:v15];
}

void __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

uint64_t __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_165(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)pairingCheckWith:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v21 = "-[FMDFMIPManager pairingCheckWith:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v8 = +[FMNSXPCConnectionCache sharedCache];
  id v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  id v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_166;
  v15[3] = &unk_1E689C2A0;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 pairingCheckWith:v6 completion:v15];
}

void __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0);
  }
}

uint64_t __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_166(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)_getAccessoriesWithFilter:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1D25F2350]();
  id v8 = LogCategory_Unspecified();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v24 = "-[FMDFMIPManager _getAccessoriesWithFilter:completion:]";
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v9 = +[FMNSXPCConnectionCache sharedCache];
  int v10 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v11 = [v9 resumeConnectionWithConfiguration:v10];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke;
  v21[3] = &unk_1E689BE48;
  id v12 = v6;
  id v22 = v12;
  [v11 addFailureBlock:v21];
  id v13 = [v11 remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_168;
  v17[3] = &unk_1E689C2C8;
  id v14 = v5;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  id v18 = v11;
  id v16 = v11;
  [v13 getAccessoriesWithCompletion:v17];
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, MEMORY[0x1E4F1CBF0]);
  }
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Unspecified();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_168_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1D0E93000, v8, OS_LOG_TYPE_DEFAULT, "Accessories %@", (uint8_t *)&v11, 0xCu);
  }

  id v9 = objc_msgSend(v6, "fm_filter:", *(void *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v9);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)_forceFMWUpgradeAlertWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[FMDFMIPManager _forceFMWUpgradeAlertWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v6 = +[FMNSXPCConnectionCache sharedCache];
  id v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v8 = [v6 resumeConnectionWithConfiguration:v7];

  [v8 addFailureBlock:&__block_literal_global_170];
  id v9 = [v8 remoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_171;
  v12[3] = &unk_1E689C088;
  id v10 = v3;
  id v13 = v8;
  id v14 = v10;
  id v11 = v8;
  [v9 _forceFMWUpgradeAlertUsingCallback:v12];
}

void __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_cold_1();
  }
}

uint64_t __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_171(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

- (void)_stopAlarm
{
  uint64_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D0E93000, v2, OS_LOG_TYPE_DEFAULT, "Exiting Lost Mode, request to stop the Play Sound.", v4, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.fmip.lostmode.stopAlarm", 0, 0, 1u);
}

- (id)newErrorForCode:(int)a3 message:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 alloc];
  id v8 = kFMDErrorDomain;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F28588]];

  id v10 = (void *)[v7 initWithDomain:v8 code:a3 userInfo:v9];
  return v10;
}

- (BOOL)_isRunningAsMobileUser
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uid_t v2 = geteuid();
  id v3 = getpwnam((const char *)[@"mobile" cStringUsingEncoding:4]);
  if (v3) {
    unsigned int pw_uid = v3->pw_uid;
  }
  else {
    unsigned int pw_uid = 501;
  }
  if (v2 != pw_uid)
  {
    fmdFMIPLastOperationResult = 10;
    id v5 = LogCategory_Unspecified();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218498;
      uint64_t v8 = v2;
      __int16 v9 = 2112;
      id v10 = @"mobile";
      __int16 v11 = 2048;
      uint64_t v12 = pw_uid;
      _os_log_error_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_ERROR, "Called from unsupported user (%lu). This can only be called from user %@(%lu)", (uint8_t *)&v7, 0x20u);
    }
  }
  return v2 == pw_uid;
}

- (void)_updateManagedLostModeWithInfo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v8 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  __int16 v9 = [v7 resumeConnectionWithConfiguration:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke;
  v17[3] = &unk_1E689BE48;
  id v10 = v5;
  id v18 = v10;
  [v9 addFailureBlock:v17];
  __int16 v11 = [v9 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_172;
  v14[3] = &unk_1E689C088;
  id v15 = v9;
  id v16 = v10;
  id v12 = v9;
  id v13 = v10;
  [v11 updateManagedLostModeInfo:v6 completion:v14];
}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_172(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_172_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "updateManagedLostModeInfo completed", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)_updateNeedsLocateAckLostModeWithInfo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v8 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  __int16 v9 = [v7 resumeConnectionWithConfiguration:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke;
  v17[3] = &unk_1E689BE48;
  id v10 = v5;
  id v18 = v10;
  [v9 addFailureBlock:v17];
  __int16 v11 = [v9 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_173;
  v14[3] = &unk_1E689C088;
  id v15 = v9;
  id v16 = v10;
  id v12 = v9;
  id v13 = v10;
  [v11 updateNeedsLocateAckLostModeInfo:v6 completion:v14];
}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_173(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_173_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "updateNeedsLocateAckLostModeInfo completed", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)_initiateLostModeExitAuthForIDSDeviceID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  fmdFMIPLastOperationResult = 0;
  id v6 = a3;
  int v7 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v8 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  __int16 v9 = [v7 resumeConnectionWithConfiguration:v8];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke;
  v20[3] = &unk_1E689BE48;
  id v10 = v5;
  id v21 = v10;
  [v9 addFailureBlock:v20];
  __int16 v11 = [v9 remoteObjectProxy];
  id v12 = [MEMORY[0x1E4F28B50] mainBundle];
  id v13 = [v12 bundleIdentifier];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_175;
  v17[3] = &unk_1E689C088;
  id v18 = v9;
  id v19 = v10;
  id v14 = v9;
  id v15 = v10;
  id v16 = (void *)MEMORY[0x1D25F2500](v17);
  [v11 initiateLostModeExitAuthForApp:v13 idsDeviceID:v6 usingCallback:v16];
}

void __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "initiateLostModeExitAuth completed. Error : %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)_disableFMIPUsingToken:(id)a3 inContext:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  __int16 v9 = (void *)MEMORY[0x1D25F2350]();
  fmdFMIPLastOperationResult = 0;
  id v10 = LogCategory_Unspecified();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v10, OS_LOG_TYPE_DEFAULT, "Disabling FMIP...", buf, 2u);
  }

  if ([v7 length])
  {
    __int16 v11 = +[FMNSXPCConnectionCache sharedCache];
    id v12 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
    id v13 = [v11 resumeConnectionWithConfiguration:v12];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke;
    v21[3] = &unk_1E689BE48;
    id v14 = v8;
    id v22 = v14;
    [v13 addFailureBlock:v21];
    id v15 = [v13 remoteObjectProxy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_176;
    v18[3] = &unk_1E689C088;
    id v19 = v13;
    id v20 = v14;
    id v16 = v13;
    [v15 disableFMIPUsingToken:v7 inContext:a4 usingCallback:v18];
  }
  else
  {
    uint64_t v17 = LogCategory_Unspecified();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FMDFMIPManager _disableFMIPUsingToken:inContext:completion:](v17);
    }

    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:1 userInfo:0];
    if (v8) {
      (*((void (**)(id, id))v8 + 2))(v8, v16);
    }
  }
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_176(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = LogCategory_Unspecified();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_176_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (id)getManagedLostModeFileURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke;
  v5[3] = &unk_1E689C2F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 32) managedLostModeFileURL];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F61560]);
    uint64_t v5 = (void *)[v4 initWithIdentifier:FMDManagedSystemGroupContainerIdentifier];
    uint64_t v6 = [v5 url];
    id v7 = objc_msgSend(v6, "fm_preferencesPathURLForDomain:", kFMDManagedLostModePrefDomain);
    [*(id *)(a1 + 32) setManagedLostModeFileURL:v7];
  }
  uint64_t v8 = [*(id *)(a1 + 32) managedLostModeFileURL];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)getNeedsLocateAckLostModeFileURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke;
  v5[3] = &unk_1E689C2F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke_cold_1(a1, v2);
  }

  id v3 = [*(id *)(a1 + 32) needsLocateAckLostModeFileURL];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F61560]);
    uint64_t v5 = (void *)[v4 initWithIdentifier:FMDManagedSystemGroupContainerIdentifier];
    uint64_t v6 = [v5 url];
    id v7 = objc_msgSend(v6, "fm_preferencesPathURLForDomain:", kFMDNeedsLocateAckLostModePrefDomain);
    [*(id *)(a1 + 32) setNeedsLocateAckLostModeFileURL:v7];
  }
  uint64_t v8 = [*(id *)(a1 + 32) needsLocateAckLostModeFileURL];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)playSoundWithMessage:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v8 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  uint64_t v9 = [v7 resumeConnectionWithConfiguration:v8];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke;
  v19[3] = &unk_1E689BE48;
  id v10 = v6;
  id v20 = v10;
  [v9 addFailureBlock:v19];
  id v11 = [v9 remoteObjectProxy];
  id v12 = LogCategory_Unspecified();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1D0E93000, v12, OS_LOG_TYPE_DEFAULT, "message %@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_178;
  v16[3] = &unk_1E689C088;
  id v17 = v9;
  id v18 = v10;
  id v14 = v9;
  id v15 = v10;
  [v11 startPlayingSoundForMessage:v5 completion:v16];
}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_178(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_178_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "playSoundWithMessage sound started", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)stopSoundMessageWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[FMNSXPCConnectionCache sharedCache];
  id v5 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  uint64_t v6 = [v4 resumeConnectionWithConfiguration:v5];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v7 = v3;
  id v17 = v7;
  [v6 addFailureBlock:v16];
  uint64_t v8 = [v6 remoteObjectProxy];
  uint64_t v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v9, OS_LOG_TYPE_DEFAULT, "stop message sound", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_179;
  v12[3] = &unk_1E689C088;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v8 stopSoundMessageWithCompletion:v12];
}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_179(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_179_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "stopSoundMessageWithCompletion sound stopped", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v8 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v9 = [v7 resumeConnectionWithConfiguration:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke;
  v12[3] = &unk_1E689BE48;
  id v13 = v5;
  id v10 = v5;
  [v9 addFailureBlock:v12];
  id v11 = [v9 remoteObjectProxy];
  [v11 deviceEligibleForRepairWithContext:v6 completion:v10];
}

void __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)enableRepairWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v8 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v9 = [v7 resumeConnectionWithConfiguration:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke;
  v12[3] = &unk_1E689BE48;
  id v13 = v5;
  id v10 = v5;
  [v9 addFailureBlock:v12];
  id v11 = [v9 remoteObjectProxy];
  [v11 enableRepairWithContext:v6 completion:v10];
}

void __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)activationLockInfoFromDeviceWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: activationLockInfoWithCompletion", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 activationLockInfoFromDeviceWithCompletion:v8];
}

void __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)storeOfflineFindingInfo:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMNSXPCConnectionCache sharedCache];
  id v8 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v9 = [v7 resumeConnectionWithConfiguration:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke;
  v12[3] = &unk_1E689BE48;
  id v13 = v5;
  id v10 = v5;
  [v9 addFailureBlock:v12];
  id v11 = [v9 remoteObjectProxy];
  [v11 storeOfflineFindingInfo:v6 completion:v10];
}

void __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)fetchOfflineFindingInfoWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: fetchOfflineFindingInfoWithCompletion", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 fetchOfflineFindingInfoWithCompletion:v8];
}

void __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)clearOfflineFindingInfoWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[FMNSXPCConnectionCache sharedCache];
  id v5 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v6 = [v4 resumeConnectionWithConfiguration:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke;
  v9[3] = &unk_1E689BE48;
  id v10 = v3;
  id v7 = v3;
  [v6 addFailureBlock:v9];
  id v8 = [v6 remoteObjectProxy];
  [v8 clearOfflineFindingInfoWithCompletion:v7];
}

void __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)activationLockAuthInfoWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: activationLockAuthInfo", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__FMDFMIPManager_activationLockAuthInfoWithCompletion___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 activationLockAuthInfoWithCompletion:v8];
}

void __55__FMDFMIPManager_activationLockAuthInfoWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)fetchAPNSTokenWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework: fetchAPNSTokenWithCompletion", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 fetchAPNSTokenWithCompletion:v8];
}

void __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
  }
}

- (void)startLocationMonitoring:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework: startLocationMonitoring", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__FMDFMIPManager_startLocationMonitoring___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 startLocationMonitoring:v8];
}

void __42__FMDFMIPManager_startLocationMonitoring___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __42__FMDFMIPManager_startLocationMonitoring___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)stopLocationMonitoring:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework: stopLocationMonitoring", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__FMDFMIPManager_stopLocationMonitoring___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 stopLocationMonitoring:v8];
}

void __41__FMDFMIPManager_stopLocationMonitoring___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __41__FMDFMIPManager_stopLocationMonitoring___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)updatedConfigReceived:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Framework: updatedConfigReceived", buf, 2u);
  }

  id v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v10 = [v8 resumeConnectionWithConfiguration:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke;
  v13[3] = &unk_1E689BE48;
  id v14 = v5;
  id v11 = v5;
  [v10 addFailureBlock:v13];
  id v12 = [v10 remoteObjectProxy];
  [v12 updatedConfigReceived:v6 completion:v11];
}

void __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)startLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Framework: startLocationMonitoringWith %@", buf, 0xCu);
  }

  id v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v10 = [v8 resumeConnectionWithConfiguration:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke;
  v13[3] = &unk_1E689BE48;
  id v14 = v6;
  id v11 = v6;
  [v10 addFailureBlock:v13];
  id v12 = [v10 remoteObjectProxy];
  [v12 startLocationMonitoringWithContext:v5 completion:v11];
}

void __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)startLocationMonitoringWithContext:(id)a3 forcePublish:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v7;
    __int16 v19 = 1024;
    BOOL v20 = v6;
    _os_log_impl(&dword_1D0E93000, v9, OS_LOG_TYPE_DEFAULT, "Framework: startLocationMonitoringWith %@ forcePublish %d", buf, 0x12u);
  }

  id v10 = +[FMNSXPCConnectionCache sharedCache];
  id v11 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v12 = [v10 resumeConnectionWithConfiguration:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__FMDFMIPManager_startLocationMonitoringWithContext_forcePublish_completion___block_invoke;
  v15[3] = &unk_1E689BE48;
  id v16 = v8;
  id v13 = v8;
  [v12 addFailureBlock:v15];
  id v14 = [v12 remoteObjectProxy];
  [v14 startLocationMonitoringWithContext:v7 forcePublish:v6 completion:v13];
}

void __77__FMDFMIPManager_startLocationMonitoringWithContext_forcePublish_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)stopLocationMonitoringWithContext:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Framework: stopLocationMonitoringWith %@", buf, 0xCu);
  }

  id v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v10 = [v8 resumeConnectionWithConfiguration:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke;
  v13[3] = &unk_1E689BE48;
  id v14 = v6;
  id v11 = v6;
  [v10 addFailureBlock:v13];
  id v12 = [v10 remoteObjectProxy];
  [v12 stopLocationMonitoringWithContext:v5 completion:v11];
}

void __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)startLocationMonitoringWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(FMDSecureLocationContext);
  id v8 = [v7 objectForKeyedSubscript:@"mode"];
  [(FMDSecureLocationContext *)v10 setMode:v8];

  uint64_t v9 = [v7 objectForKeyedSubscript:@"findMyId"];

  [(FMDSecureLocationContext *)v10 setFindMyId:v9];
  [(FMDFMIPManager *)self startLocationMonitoringWithContext:v10 completion:v6];
}

- (void)stopLocationMonitoringWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(FMDSecureLocationContext);
  id v8 = [v7 objectForKeyedSubscript:@"mode"];
  [(FMDSecureLocationContext *)v10 setMode:v8];

  uint64_t v9 = [v7 objectForKeyedSubscript:@"findMyId"];

  [(FMDSecureLocationContext *)v10 setFindMyId:v9];
  [(FMDFMIPManager *)self stopLocationMonitoringWithContext:v10 completion:v6];
}

- (void)didAddLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Framework: didAddLocalFindableAccessory", buf, 2u);
  }

  id v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v10 = [v8 resumeConnectionWithConfiguration:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke;
  v13[3] = &unk_1E689BE48;
  id v14 = v5;
  id v11 = v5;
  [v10 addFailureBlock:v13];
  id v12 = [v10 remoteObjectProxy];
  [v12 didAddLocalFindableAccessory:v6 completion:v11];
}

void __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)didRemoveLocalFindableAccessory:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Framework: didRemoveLocalFindableAccessory", buf, 2u);
  }

  id v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v10 = [v8 resumeConnectionWithConfiguration:v9];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke;
  v13[3] = &unk_1E689BE48;
  id v14 = v5;
  id v11 = v5;
  [v10 addFailureBlock:v13];
  id v12 = [v10 remoteObjectProxy];
  [v12 didRemoveLocalFindableAccessory:v6 completion:v11];
}

void __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_SecureLocations();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)requireDisableLocationWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_DisableLocationDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework: requireDisableLocationWithCompletion", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 requireDisableLocationWithCompletion:v8];
}

void __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_DisableLocationDisplay();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, -1, v3);
  }
}

- (void)disableLocationDisplayWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_DisableLocationDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework: disableLocationDisplayWithCompletion", buf, 2u);
  }

  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v7 = [v5 resumeConnectionWithConfiguration:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke;
  v10[3] = &unk_1E689BE48;
  id v11 = v3;
  id v8 = v3;
  [v7 addFailureBlock:v10];
  uint64_t v9 = [v7 remoteObjectProxy];
  [v9 disableLocationDisplayWithCompletion:v8];
}

void __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_DisableLocationDisplay();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (NSURL)managedLostModeFileURL
{
  return self->_managedLostModeFileURL;
}

- (void)setManagedLostModeFileURL:(id)a3
{
}

- (NSURL)needsLocateAckLostModeFileURL
{
  return self->_needsLocateAckLostModeFileURL;
}

- (void)setNeedsLocateAckLostModeFileURL:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_needsLocateAckLostModeFileURL, 0);

  objc_storeStrong((id *)&self->_managedLostModeFileURL, 0);
}

- (BOOL)_quickFetchFMIPEnabledstate
{
  uid_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"];

  return v3;
}

- (id)_postWipePrefPath
{
  uid_t v2 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
    uint64_t v4 = objc_msgSend(v3, "fm_preferencesPathURLForDomain:", kFMDPostWipePrefDomain);
    id v5 = [v4 path];
  }
  else
  {
    id v6 = LogCategory_Unspecified();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[FMDFMIPManager(Private) _postWipePrefPath](v6);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)disableBiometricIDForLostModeWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v19 = "-[FMDFMIPManager(Private) disableBiometricIDForLostModeWithCompletion:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  id v6 = +[FMNSXPCConnectionCache sharedCache];
  id v7 = +[FMNSXPCConnectionConfiguration helperConfiguration];
  id v8 = [v6 resumeConnectionWithConfiguration:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke;
  v16[3] = &unk_1E689BE48;
  id v9 = v3;
  id v17 = v9;
  [v8 addFailureBlock:v16];
  id v10 = [v8 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6;
  v13[3] = &unk_1E689C088;
  id v11 = v9;
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 disableBiometricIDWithCompletion:v13];
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[FMDFMIPManager(Private) disableBiometricIDForLostModeWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)setDailyLocateReportEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1D25F2350](self, a2);
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[FMDFMIPManager(Private) setDailyLocateReportEnabled:]";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  int v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  id v8 = [v6 resumeConnectionWithConfiguration:v7];

  [v8 addFailureBlock:&__block_literal_global_4];
  uint64_t v9 = [v8 remoteObjectProxy];
  [v9 setDailyLocateReportEnabled:v3];
}

void __55__FMDFMIPManager_Private__setDailyLocateReportEnabled___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __55__FMDFMIPManager_Private__setDailyLocateReportEnabled___block_invoke_cold_1();
  }
}

- (void)showDailyLocateReport
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uid_t v2 = (void *)MEMORY[0x1D25F2350](self, a2);
  BOOL v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[FMDFMIPManager(Private) showDailyLocateReport]";
    _os_log_impl(&dword_1D0E93000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v4 = +[FMNSXPCConnectionCache sharedCache];
  id v5 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v6 = [v4 resumeConnectionWithConfiguration:v5];

  [v6 addFailureBlock:&__block_literal_global_9];
  int v7 = [v6 remoteObjectProxy];
  [v7 showDailyLocateReport];
}

void __48__FMDFMIPManager_Private__showDailyLocateReport__block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __48__FMDFMIPManager_Private__showDailyLocateReport__block_invoke_cold_1();
  }
}

- (void)addNotificationRequest:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  int v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[FMDFMIPManager(Private) addNotificationRequest:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration userNotificationConfiguration];
  uint64_t v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  uint64_t v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_10;
  v15[3] = &unk_1E689C088;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 addNotificationRequest:v6 completion:v15];
}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_cold_1();
  }

  BOOL v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_10_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[FMDFMIPManager(Private) addNotificationRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)removeNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  int v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[FMDFMIPManager(Private) removeNotificationWithIdentifier:completion:]";
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  int v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration userNotificationConfiguration];
  uint64_t v10 = [v8 resumeConnectionWithConfiguration:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E689BE48;
  id v11 = v5;
  id v19 = v11;
  [v10 addFailureBlock:v18];
  uint64_t v12 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_11;
  v15[3] = &unk_1E689C088;
  id v16 = v10;
  id v17 = v11;
  id v13 = v10;
  id v14 = v11;
  [v12 removeNotificationWithIdentifier:v6 completion:v15];
}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uid_t v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_cold_1();
  }

  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = LogCategory_Unspecified();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_11_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[FMDFMIPManager(Private) removeNotificationWithIdentifier:completion:]_block_invoke";
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

- (void)activationLockVersionWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D25F2350]();
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1D0E93000, v5, OS_LOG_TYPE_DEFAULT, "Framework (Private) : activationLockVersionWithCompletion", v10, 2u);
  }

  fmdFMIPLastOperationResult = 0;
  uint64_t v6 = +[FMNSXPCConnectionCache sharedCache];
  int v7 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v8 = [v6 resumeConnectionWithConfiguration:v7];

  [v8 addFailureBlock:&__block_literal_global_13];
  uint64_t v9 = [v8 remoteObjectProxy];
  [v9 activationLockVersionWithCompletion:v3];
}

void __63__FMDFMIPManager_Private__activationLockVersionWithCompletion___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__FMDFMIPManager_Private__activationLockVersionWithCompletion___block_invoke_cold_1();
  }
}

- (void)updateMaskedAppleIDWith:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1D0E93000, v7, OS_LOG_TYPE_DEFAULT, "Framework (Private) : updateMaskedAppleID", v12, 2u);
  }

  fmdFMIPLastOperationResult = 0;
  int v8 = +[FMNSXPCConnectionCache sharedCache];
  uint64_t v9 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  uint64_t v10 = [v8 resumeConnectionWithConfiguration:v9];

  [v10 addFailureBlock:&__block_literal_global_15];
  id v11 = [v10 remoteObjectProxy];
  [v11 updateMaskedAppleIDWith:v6 completion:v5];
}

void __62__FMDFMIPManager_Private__updateMaskedAppleIDWith_completion___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __62__FMDFMIPManager_Private__updateMaskedAppleIDWith_completion___block_invoke_cold_1();
  }
}

- (void)clearMaskedAppleIDWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = LogCategory_Unspecified();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1D0E93000, v4, OS_LOG_TYPE_DEFAULT, "Framework (Private) : clearMaskedAppleID", v9, 2u);
  }

  fmdFMIPLastOperationResult = 0;
  id v5 = +[FMNSXPCConnectionCache sharedCache];
  id v6 = +[FMNSXPCConnectionConfiguration fmipConfiguration];
  int v7 = [v5 resumeConnectionWithConfiguration:v6];

  [v7 addFailureBlock:&__block_literal_global_17_0];
  int v8 = [v7 remoteObjectProxy];
  [v8 clearMaskedAppleIDWithCompletion:v3];
}

void __60__FMDFMIPManager_Private__clearMaskedAppleIDWithCompletion___block_invoke()
{
  v0 = LogCategory_Unspecified();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __60__FMDFMIPManager_Private__clearMaskedAppleIDWithCompletion___block_invoke_cold_1();
  }
}

- (void)_managedLostModeType
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1D0E93000, v0, v1, "Reading Managed Lost Mode file from: %@", v2);
}

- (void)_needsAckLostModeType
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1D0E93000, v0, v1, "Reading NeedsLocateAck Lost Mode file from: %@", v2);
}

- (void)lostModeInfo
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1D0E93000, a2, v4, "lostModeInfo = %@", v5);
}

- (void)enableLostModeWithInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s: error - %@", v2, v3, v4, v5, 2u);
}

void __41__FMDFMIPManager_enableLostModeWithInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for enableLostModeWithInfo: %li", v2, v3, v4, v5, v6);
}

void __33__FMDFMIPManager_disableLostMode__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for disableLostMode %li", v2, v3, v4, v5, v6);
}

- (void)enableManagedLostModeWithInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__FMDFMIPManager_enableManagedLostModeWithInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error updating managed lost mode info : %@", v2, v3, v4, v5, v6);
}

- (void)disableManagedLostModeWithLocatedMessage:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__FMDFMIPManager_disableManagedLostModeWithLocatedMessage_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error updating managed lost mode info to disabled : %@", v2, v3, v4, v5, v6);
}

- (void)userDidAckManagedLostModeLocateWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__FMDFMIPManager_userDidAckManagedLostModeLocateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error updating NeedsLocateAck lost mode into to disabled : %@", v2, v3, v4, v5, v6);
}

void __50__FMDFMIPManager_playSoundWithOptions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for playSoundWithOptions:completion: %li", v2, v3, v4, v5, v6);
}

void __44__FMDFMIPManager_deviceActivationDidSucceed__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for deviceActivationDidSucceed %li", v2, v3, v4, v5, v6);
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for fmipStateWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __42__FMDFMIPManager_fmipStateWithCompletion___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error fetching the FMIP state : %@", v2, v3, v4, v5, v6);
}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for fmipAccountWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __44__FMDFMIPManager_fmipAccountWithCompletion___block_invoke_43_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error fetching the FMIP account : %@", v2, v3, v4, v5, v6);
}

- (void)fmipAccount
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s: error - %@", v2, v3, v4, v5, 2u);
}

void __43__FMDFMIPManager_didChangeFMIPAccountInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for didChangeFMIPAccountInfo: %li", v2, v3, v4, v5, v6);
}

- (void)enableFMIPInContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s: error - %@", v2, v3, v4, v5, 2u);
}

void __38__FMDFMIPManager_enableFMIPInContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for enableFMIPInContext: %li", v2, v3, v4, v5, v6);
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for disableFMIPUsingToken:forPairedDeviceWithUDID:withCompletion: %li", v2, v3, v4, v5, v6);
}

void __79__FMDFMIPManager_disableFMIPUsingToken_forPairedDeviceWithUDID_withCompletion___block_invoke_54_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for disableFMIPForAccount:pairedDeviceWithUDID:withCompletion: %li", v2, v3, v4, v5, v6);
}

void __76__FMDFMIPManager_disableFMIPForAccount_pairedDeviceWithUDID_withCompletion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for markAsMissingSupportedForPairedDeviceWithUDID:withCompletion: %li", v2, v3, v4, v5, v6);
}

void __79__FMDFMIPManager_markAsMissingSupportedForPairedDeviceWithUDID_withCompletion___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for markPairedDeviceWithUDID:asMissingUsingToken:withCompletion:completion: %li", v2, v3, v4, v5, v6);
}

void __78__FMDFMIPManager_markPairedDeviceWithUDID_asMissingUsingToken_withCompletion___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for isActivationLockAllowedWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __56__FMDFMIPManager_isActivationLockAllowedWithCompletion___block_invoke_59_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error fetching ActivationLockAllowed : %@", v2, v3, v4, v5, v6);
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for isActivationLockEnabledWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __56__FMDFMIPManager_isActivationLockEnabledWithCompletion___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error fetching ActivationLockEnabled : %@", v2, v3, v4, v5, v6);
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for isActivationLockedWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __51__FMDFMIPManager_isActivationLockedWithCompletion___block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error fetching the ActivationLocked : %@", v2, v3, v4, v5, v6);
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for enableActivationLockWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __53__FMDFMIPManager_enableActivationLockWithCompletion___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error enabling activaton lock : %@", v2, v3, v4, v5, v6);
}

void __50__FMDFMIPManager_didReceiveLostModeExitAuthToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for didReceiveLostModeExitAuthToken: %li", v2, v3, v4, v5, v6);
}

void __56__FMDFMIPManager_lowBatteryLocateEnabledWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for lowBatteryLocateEnabledWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __60__FMDFMIPManager_setLowBatteryLocateEnabled_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for setLowBatteryLocateEnabled:withCompletion: %li", v2, v3, v4, v5, v6);
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for signatureHeadersWithData:completion: %li", v2, v3, v4, v5, v6);
}

void __54__FMDFMIPManager_signatureHeadersWithData_completion___block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error completing signature generation : %@", v2, v3, v4, v5, v6);
}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion: %li", v2, v3, v4, v5, v6);
}

void __92__FMDFMIPManager_startPlayingSoundForAccessory_duration_rampUpDuration_channels_completion___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "playSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for stopPlayingSoundForAccessory:rampDownDuration:completion %li", v2, v3, v4, v5, v6);
}

void __75__FMDFMIPManager_stopPlayingSoundForAccessory_rampDownDuration_completion___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "stopSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for waitForRoutableAccessory:timeout:completion: %li", v2, v3, v4, v5, v6);
}

void __62__FMDFMIPManager_waitForRoutableAccessory_timeout_completion___block_invoke_76_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "waitForRoutableAccessory encountered an error : %@", v2, v3, v4, v5, v6);
}

void __53__FMDFMIPManager_soundStoppedForAccessoryIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for soundStoppedForAccessoryIdentifier: %li", v2, v3, v4, v5, v6);
}

void __39__FMDFMIPManager_clearData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for clearData:completion: %li", v2, v3, v4, v5, v6);
}

void __48__FMDFMIPManager_attemptUCRTHealing_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for attemptUCRTHealing: %li", v2, v3, v4, v5, v6);
}

void __47__FMDFMIPManager_fetchAccessoryConfigurations___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for fetchAccessoryConfigurations: %li", v2, v3, v4, v5, v6);
}

void __60__FMDFMIPManager_removeAccessoryWithDiscoveryId_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for removeAccessoryWithDiscoveryId: %li", v2, v3, v4, v5, v6);
}

void __71__FMDFMIPManager_setPhoneNumber_toAccessoryWithDiscoveryId_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for setPhoneNumber: %li", v2, v3, v4, v5, v6);
}

void __54__FMDFMIPManager_getConnectedAccessoriesDiscoveryIds___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error whle trying to get connected accessories %li", v2, v3, v4, v5, v6);
}

void __58__FMDFMIPManager_registerDeviceForPairingLock_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "XPC error for %s: %li", v2, v3, v4, v5, 2u);
}

void __51__FMDFMIPManager_updatePairingLockInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "XPC error for %s: %li", v2, v3, v4, v5, 2u);
}

void __46__FMDFMIPManager_pairingCheckWith_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "XPC error for %s: %li", v2, v3, v4, v5, 2u);
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for getAccessoriesWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __55__FMDFMIPManager__getAccessoriesWithFilter_completion___block_invoke_168_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "Error getting the accessory list : %@", v2, v3, v4, v5, v6);
}

void __54__FMDFMIPManager__forceFMWUpgradeAlertWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for _forceFMWUpgradeAlertWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for _updateManagedLostModeWithInfo: %li", v2, v3, v4, v5, v6);
}

void __60__FMDFMIPManager__updateManagedLostModeWithInfo_completion___block_invoke_172_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "updateManagedLostModeInfo encountered an error : %@", v2, v3, v4, v5, v6);
}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for _updateNeedsLocateAckLostModeWithInfo: %li", v2, v3, v4, v5, v6);
}

void __67__FMDFMIPManager__updateNeedsLocateAckLostModeWithInfo_completion___block_invoke_173_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "updateNeedsLocateAckLostModeInfo encountered an error : %@", v2, v3, v4, v5, v6);
}

void __73__FMDFMIPManager__initiateLostModeExitAuthForIDSDeviceID_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for _initiateLostModeExitAuthForIDSDeviceID:withCompletion: %li", v2, v3, v4, v5, v6);
}

- (void)_disableFMIPUsingToken:(os_log_t)log inContext:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0E93000, log, OS_LOG_TYPE_ERROR, "Token to disable FMiP cannot be nil", v1, 2u);
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for _disableFMIPUsingToken:inContext:completion: %li", v2, v3, v4, v5, v6);
}

void __62__FMDFMIPManager__disableFMIPUsingToken_inContext_completion___block_invoke_176_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "_disableFMIPUsingToken:inContext:completion: encountered an error : %@", v2, v3, v4, v5, v6);
}

void __43__FMDFMIPManager_getManagedLostModeFileURL__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) managedLostModeFileURL];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1D0E93000, a2, v4, "Static URL %@", v5);
}

void __50__FMDFMIPManager_getNeedsLocateAckLostModeFileURL__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) needsLocateAckLostModeFileURL];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1D0E93000, a2, v4, "Static URL %@", v5);
}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for playSoundWithMessage:completion: %li", v2, v3, v4, v5, v6);
}

void __50__FMDFMIPManager_playSoundWithMessage_completion___block_invoke_178_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "playSoundWithMessage encountered an error : %@", v2, v3, v4, v5, v6);
}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for stopSoundMessageWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __49__FMDFMIPManager_stopSoundMessageWithCompletion___block_invoke_179_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "stopSoundMessageWithCompletion encountered an error : %@", v2, v3, v4, v5, v6);
}

void __64__FMDFMIPManager_deviceEligibleForRepairWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for deviceEligibleForRepairWithContext:completion: %li", v2, v3, v4, v5, v6);
}

void __53__FMDFMIPManager_enableRepairWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for enableRepairWithContext:completion: %li", v2, v3, v4, v5, v6);
}

void __61__FMDFMIPManager_activationLockInfoFromDeviceWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for activationLockInfoWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __53__FMDFMIPManager_storeOfflineFindingInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for storeOfflineFindingInfo: %li", v2, v3, v4, v5, v6);
}

void __56__FMDFMIPManager_fetchOfflineFindingInfoWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for fetchOfflineFindingInfoWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __56__FMDFMIPManager_clearOfflineFindingInfoWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for clearOfflineFindingInfoWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __47__FMDFMIPManager_fetchAPNSTokenWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for fetchAPNSTokenWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __42__FMDFMIPManager_startLocationMonitoring___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for startLocationMonitoring: %li", v2, v3, v4, v5, v6);
}

void __41__FMDFMIPManager_stopLocationMonitoring___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for stopLocationMonitoring: %li", v2, v3, v4, v5, v6);
}

void __51__FMDFMIPManager_updatedConfigReceived_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for updatedConfigReceived: %li", v2, v3, v4, v5, v6);
}

void __64__FMDFMIPManager_startLocationMonitoringWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for startLocationMonitoringWithContext: %li", v2, v3, v4, v5, v6);
}

void __63__FMDFMIPManager_stopLocationMonitoringWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for stopLocationMonitoringWithContext: %li", v2, v3, v4, v5, v6);
}

void __58__FMDFMIPManager_didAddLocalFindableAccessory_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for didAddLocalFindableAccessory: %li", v2, v3, v4, v5, v6);
}

void __61__FMDFMIPManager_didRemoveLocalFindableAccessory_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for didRemoveLocalFindableAccessory: %li", v2, v3, v4, v5, v6);
}

void __55__FMDFMIPManager_requireDisableLocationWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for requireDisableLocationWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __55__FMDFMIPManager_disableLocationDisplayWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for disableLocationDisplayWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for disableBiometricIDForLostModeWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __71__FMDFMIPManager_Private__disableBiometricIDForLostModeWithCompletion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __55__FMDFMIPManager_Private__setDailyLocateReportEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for setDailyLocateReportEnabled: %li", v2, v3, v4, v5, v6);
}

void __48__FMDFMIPManager_Private__showDailyLocateReport__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for showDailyLocateReport: %li", v2, v3, v4, v5, v6);
}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for addNotificationRequest: %li", v2, v3, v4, v5, v6);
}

void __61__FMDFMIPManager_Private__addNotificationRequest_completion___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for removeNotificationWithIdentifier: %li", v2, v3, v4, v5, v6);
}

void __71__FMDFMIPManager_Private__removeNotificationWithIdentifier_completion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1D0E93000, v0, v1, "%s encountered an error : %@", v2, v3, v4, v5, 2u);
}

void __63__FMDFMIPManager_Private__activationLockVersionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for activationLockVersionWithCompletion: %li", v2, v3, v4, v5, v6);
}

void __62__FMDFMIPManager_Private__updateMaskedAppleIDWith_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for updateMaskedAppleID: %li", v2, v3, v4, v5, v6);
}

void __60__FMDFMIPManager_Private__clearMaskedAppleIDWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0E93000, v0, v1, "XPC error for clearMaskedAppleID: %li", v2, v3, v4, v5, v6);
}

@end
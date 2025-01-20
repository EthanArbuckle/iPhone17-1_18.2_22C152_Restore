@interface AKCDPFactory
+ (BOOL)cdpAccountIsHSA2EnabledForAltDSID:(id)a3;
+ (BOOL)cdpAccountIsICDPEnabledForDSID:(id)a3;
+ (BOOL)cdpAccountIsOTEnabledForAltDSID:(id)a3;
+ (BOOL)isEligibleToArmDeviceForPCSAuth;
+ (BOOL)isWalrusEnabled;
+ (BOOL)isWebAccessEnabled;
+ (id)accountRecoveryControllerWithPresentingViewController:(id)a3;
+ (id)cdpErrorDomain;
+ (id)cdpIDMSRecordMIDKey;
+ (id)cdpIDMSRecordPRKKey;
+ (id)cdpStateUIController;
+ (id)cdpUIControllerWithPresentingViewController:(id)a3;
+ (id)contextForAltDSID:(id)a3;
+ (id)contextWithAuthResults:(id)a3;
+ (id)followUpController;
+ (id)followUpRepairContext;
+ (id)recoveryControllerWithContext:(id)a3;
+ (id)stateControllerWithContext:(id)a3;
+ (id)walrusStatusLiveValue;
+ (id)webAccessChangeControllerForTargetStatus:(unint64_t)a3;
+ (id)webAccessStatusLiveValue;
+ (unint64_t)walrusStatus;
+ (unint64_t)webAccessStatus;
+ (void)walrusStatus;
+ (void)webAccessStatus;
- (BOOL)isCDPEnabledForDSID:(id)a3;
- (BOOL)isHSA2EnabledForAltDSID:(id)a3;
- (BOOL)isManateeAvailable;
- (BOOL)isUserVisibleKeychainSyncEnabled;
- (void)isManateeAvailable;
@end

@implementation AKCDPFactory

+ (id)contextForAltDSID:(id)a3
{
  id v3 = a3;
  CDPContextClass = (void *)CoreCDPLibraryCore();
  if (CDPContextClass) {
    CDPContextClass = getCDPContextClass();
  }
  v5 = [CDPContextClass contextForAccountWithAltDSID:v3];

  return v5;
}

+ (id)contextWithAuthResults:(id)a3
{
  id v3 = a3;
  CDPContextClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPContextClass) {
    CDPContextClass = (objc_class *)getCDPContextClass();
  }
  v5 = (void *)[[CDPContextClass alloc] initWithAuthenticationResults:v3];

  return v5;
}

+ (id)stateControllerWithContext:(id)a3
{
  id v3 = a3;
  CDPStateControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPStateControllerClass) {
    CDPStateControllerClass = (objc_class *)getCDPStateControllerClass();
  }
  v5 = (void *)[[CDPStateControllerClass alloc] initWithContext:v3];

  return v5;
}

+ (id)recoveryControllerWithContext:(id)a3
{
  id v3 = a3;
  CDPContextClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPContextClass) {
    CDPContextClass = (objc_class *)getCDPContextClass();
  }
  id v5 = objc_alloc_init(CDPContextClass);
  v6 = [v3 authContext];
  v7 = [v6 altDSID];
  [v5 setAltDSID:v7];

  v8 = NSNumber;
  v9 = [v3 authContext];
  v10 = [v9 DSID];
  v11 = objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
  [v5 setDsid:v11];

  v12 = [v3 authContext];
  v13 = [v12 username];
  [v5 setAppleID:v13];

  v14 = [v3 decodedRecoveryPETString];
  [v5 setPasswordEquivToken:v14];

  objc_msgSend(v5, "setIdmsMasterKeyRecovery:", objc_msgSend(v3, "supportsMasterKeyRecovery"));
  objc_msgSend(v5, "setMandatesRecoveryKey:", objc_msgSend(v3, "mandatesRecoveryKey"));
  objc_msgSend(v5, "setIdmsRecovery:", objc_msgSend(v5, "idmsMasterKeyRecovery") ^ 1);
  [v5 setGuestMode:1];
  v15 = [v3 authContext];

  v16 = [v15 telemetryFlowID];
  [v5 setTelemetryFlowID:v16];

  CDPRecoveryControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPRecoveryControllerClass) {
    CDPRecoveryControllerClass = (objc_class *)getCDPRecoveryControllerClass();
  }
  v18 = (void *)[[CDPRecoveryControllerClass alloc] initWithContext:v5];

  return v18;
}

+ (id)followUpRepairContext
{
  CDPFollowUpContextClass = (void *)CoreCDPLibraryCore();
  if (CDPFollowUpContextClass) {
    CDPFollowUpContextClass = getCDPFollowUpContextClass();
  }

  return (id)[CDPFollowUpContextClass contextForStateRepair];
}

+ (id)followUpController
{
  CDPFollowUpControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPFollowUpControllerClass) {
    CDPFollowUpControllerClass = (objc_class *)getCDPFollowUpControllerClass();
  }
  id v3 = objc_alloc_init(CDPFollowUpControllerClass);

  return v3;
}

+ (BOOL)cdpAccountIsICDPEnabledForDSID:(id)a3
{
  id v3 = a3;
  CDPAccountClass = (void *)CoreCDPLibraryCore();
  if (CDPAccountClass) {
    CDPAccountClass = getCDPAccountClass();
  }
  char v5 = [CDPAccountClass isICDPEnabledForDSID:v3];

  return v5;
}

+ (BOOL)cdpAccountIsHSA2EnabledForAltDSID:(id)a3
{
  id v3 = a3;
  CDPAccountClass = (void *)CoreCDPLibraryCore();
  if (CDPAccountClass) {
    CDPAccountClass = getCDPAccountClass();
  }
  char v5 = [CDPAccountClass isHSA2Enabled:v3];

  return v5;
}

+ (BOOL)cdpAccountIsOTEnabledForAltDSID:(id)a3
{
  id v3 = a3;
  CDPAccountClass = (void *)CoreCDPLibraryCore();
  if (CDPAccountClass) {
    CDPAccountClass = getCDPAccountClass();
  }
  char v5 = [CDPAccountClass sharedInstance];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = +[AKCDPFactory contextForAltDSID:v3];
    if (v7)
    {
      v8 = (void *)CoreCDPLibraryCore();
      if (v8) {
        v8 = getCDPAccountClass();
      }
      v9 = [v8 sharedInstance];
      char v10 = [v9 isOTEnabledForContext:v7];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)cdpErrorDomain
{
  v2 = (void *)CoreCDPLibraryCore();
  if (v2)
  {
    v2 = getCDPStateErrorDomain();
  }

  return v2;
}

+ (unint64_t)walrusStatus
{
  if (walrusStatus_once != -1) {
    dispatch_once(&walrusStatus_once, &__block_literal_global_39);
  }
  id v8 = 0;
  uint64_t v2 = [(id)walrusStatus_stateController walrusStatus:&v8];
  id v3 = v8;
  if (v3)
  {
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[AKCDPFactory walrusStatus](v3);
    }
  }
  uint64_t v5 = 1;
  if (v2 == 2) {
    uint64_t v5 = 2;
  }
  if (v2) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

uint64_t __28__AKCDPFactory_walrusStatus__block_invoke()
{
  CDPWalrusStateControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPWalrusStateControllerClass) {
    CDPWalrusStateControllerClass = (objc_class *)getCDPWalrusStateControllerClass();
  }
  walrusStatus_stateController = (uint64_t)objc_alloc_init(CDPWalrusStateControllerClass);

  return MEMORY[0x1F41817F8]();
}

+ (id)walrusStatusLiveValue
{
  if (walrusStatusLiveValue_once != -1) {
    dispatch_once(&walrusStatusLiveValue_once, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)walrusStatusLiveValue_value;

  return v2;
}

void __37__AKCDPFactory_walrusStatusLiveValue__block_invoke()
{
  if (CoreCDPLibraryCore()
    && (getCDPWalrusStateChangeNotification(), v0 = objc_claimAutoreleasedReturnValue(), v0, v0))
  {
    uint64_t v1 = +[AKLiveValue liveValueWithSyncProducer:&__block_literal_global_51];
    uint64_t v2 = (void *)walrusStatusLiveValue_value;
    walrusStatusLiveValue_value = v1;

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__12;
    v28 = __Block_byref_object_dispose__12;
    id v29 = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = CoreCDPLibraryCore();
    if (v4)
    {
      uint64_t v5 = getCDPWalrusStateChangeNotification();
    }
    else
    {
      uint64_t v5 = 0;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_53;
    v23[3] = &unk_1E5761A80;
    v23[4] = &v24;
    v14 = [v3 addObserverForName:v5 object:0 queue:0 usingBlock:v23];
    if (v4) {

    }
    v15 = (void *)walrusStatusLiveValue_value;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_55;
    v20[3] = &unk_1E5761AA8;
    id v16 = v3;
    id v21 = v16;
    id v17 = v14;
    id v22 = v17;
    uint64_t v18 = [v15 newTriggerWithCleanup:v20];
    v19 = (void *)v25[5];
    v25[5] = v18;

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    unint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_48()
{
  v0 = NSNumber;
  unint64_t v1 = +[AKCDPFactory walrusStatus];

  return [v0 numberWithUnsignedInteger:v1];
}

void __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Received walrus state change notification, triggering value value update: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

+ (BOOL)isWalrusEnabled
{
  return [a1 walrusStatus] == 1;
}

+ (unint64_t)webAccessStatus
{
  uint64_t v2 = (void *)webAccessStatus_stateController;
  if (!webAccessStatus_stateController)
  {
    CDPWebAccessStateControllerClass = (objc_class *)CoreCDPLibraryCore();
    if (CDPWebAccessStateControllerClass) {
      CDPWebAccessStateControllerClass = (objc_class *)getCDPWebAccessStateControllerClass();
    }
    id v4 = objc_alloc_init(CDPWebAccessStateControllerClass);
    uint64_t v5 = (void *)webAccessStatus_stateController;
    webAccessStatus_stateController = (uint64_t)v4;

    uint64_t v2 = (void *)webAccessStatus_stateController;
  }
  id v12 = 0;
  uint64_t v6 = [v2 webAccessStatus:&v12];
  id v7 = v12;
  if (v7)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[AKCDPFactory webAccessStatus](v7);
    }
  }
  uint64_t v9 = 1;
  if (v6 == 2) {
    uint64_t v9 = 2;
  }
  if (v6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = 0;
  }

  return v10;
}

+ (id)webAccessStatusLiveValue
{
  if (webAccessStatusLiveValue_once != -1) {
    dispatch_once(&webAccessStatusLiveValue_once, &__block_literal_global_58);
  }
  uint64_t v2 = (void *)webAccessStatusLiveValue_value;

  return v2;
}

void __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke()
{
  if (CoreCDPLibraryCore()
    && (getCDPWebAccessStateChangeNotification(), v0 = objc_claimAutoreleasedReturnValue(), v0, v0))
  {
    uint64_t v1 = +[AKLiveValue liveValueWithSyncProducer:&__block_literal_global_61];
    uint64_t v2 = (void *)webAccessStatusLiveValue_value;
    webAccessStatusLiveValue_value = v1;

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__12;
    v28 = __Block_byref_object_dispose__12;
    id v29 = 0;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = CoreCDPLibraryCore();
    if (v4)
    {
      uint64_t v5 = getCDPWebAccessStateChangeNotification();
    }
    else
    {
      uint64_t v5 = 0;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_2;
    v23[3] = &unk_1E5761A80;
    v23[4] = &v24;
    v14 = [v3 addObserverForName:v5 object:0 queue:0 usingBlock:v23];
    if (v4) {

    }
    v15 = (void *)webAccessStatusLiveValue_value;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_62;
    v20[3] = &unk_1E5761AA8;
    id v16 = v3;
    id v21 = v16;
    id v17 = v14;
    id v22 = v17;
    uint64_t v18 = [v15 newTriggerWithCleanup:v20];
    v19 = (void *)v25[5];
    v25[5] = v18;

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    uint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_59()
{
  v0 = NSNumber;
  unint64_t v1 = +[AKCDPFactory webAccessStatus];

  return [v0 numberWithUnsignedInteger:v1];
}

void __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Received web access state change notification, triggering value value update: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_62(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

+ (BOOL)isWebAccessEnabled
{
  return [a1 webAccessStatus] == 1;
}

+ (BOOL)isEligibleToArmDeviceForPCSAuth
{
  int v3 = [a1 isWalrusEnabled];
  if (v3)
  {
    LOBYTE(v3) = [a1 isWebAccessEnabled];
  }
  return v3;
}

+ (id)webAccessChangeControllerForTargetStatus:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v11 = (void *)CoreCDPUILibraryCore();
    if (v11) {
      uint64_t v11 = getCDPUIStatusChangeControllerClass();
    }
    uint64_t v12 = 2;
  }
  else if (a3 == 1)
  {
    uint64_t v11 = (void *)CoreCDPUILibraryCore();
    if (v11) {
      uint64_t v11 = getCDPUIStatusChangeControllerClass();
    }
    uint64_t v12 = 1;
  }
  else
  {
    if (a3) {
      goto LABEL_16;
    }
    int v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[AKCDPFactory webAccessChangeControllerForTargetStatus:](v3, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = (void *)CoreCDPUILibraryCore();
    if (v11) {
      uint64_t v11 = getCDPUIStatusChangeControllerClass();
    }
    uint64_t v12 = 0;
  }
  a1 = [v11 controllerWithTargetWebAccessStatus:v12];
LABEL_16:

  return a1;
}

+ (id)cdpIDMSRecordMIDKey
{
  uint64_t v2 = (void *)CoreCDPLibraryCore();
  if (v2)
  {
    uint64_t v2 = getCDPIDMSRecordMIDKey();
  }

  return v2;
}

+ (id)cdpIDMSRecordPRKKey
{
  uint64_t v2 = (void *)CoreCDPLibraryCore();
  if (v2)
  {
    uint64_t v2 = getCDPIDMSPasswordResetKey();
  }

  return v2;
}

+ (id)accountRecoveryControllerWithPresentingViewController:(id)a3
{
  id v3 = a3;
  CDPUIAccountRecoveryControllerClass = (objc_class *)CoreCDPUILibraryCore();
  if (CDPUIAccountRecoveryControllerClass) {
    CDPUIAccountRecoveryControllerClass = (objc_class *)getCDPUIAccountRecoveryControllerClass();
  }
  uint64_t v5 = (void *)[[CDPUIAccountRecoveryControllerClass alloc] initWithPresentingViewController:v3];

  return v5;
}

+ (id)cdpStateUIController
{
  return 0;
}

+ (id)cdpUIControllerWithPresentingViewController:(id)a3
{
  id v3 = a3;
  CDPUIControllerClass = (objc_class *)CoreCDPUILibraryCore();
  if (CDPUIControllerClass) {
    CDPUIControllerClass = (objc_class *)getCDPUIControllerClass();
  }
  uint64_t v5 = (void *)[[CDPUIControllerClass alloc] initWithPresentingViewController:v3];

  return v5;
}

- (BOOL)isUserVisibleKeychainSyncEnabled
{
  CDPKeychainSyncClass = (void *)CoreCDPLibraryCore();
  if (CDPKeychainSyncClass) {
    CDPKeychainSyncClass = getCDPKeychainSyncClass();
  }

  return [CDPKeychainSyncClass isUserVisibleKeychainSyncEnabled];
}

- (BOOL)isCDPEnabledForDSID:(id)a3
{
  return +[AKCDPFactory cdpAccountIsICDPEnabledForDSID:a3];
}

- (BOOL)isManateeAvailable
{
  CDPStateControllerClass = (objc_class *)CoreCDPLibraryCore();
  if (CDPStateControllerClass) {
    CDPStateControllerClass = (objc_class *)getCDPStateControllerClass();
  }
  id v3 = objc_alloc_init(CDPStateControllerClass);
  id v8 = 0;
  char v4 = [v3 isManateeAvailable:&v8];
  id v5 = v8;
  if (v5)
  {
    uint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(AKCDPFactory *)(uint64_t)v5 isManateeAvailable];
    }
  }
  return v4;
}

- (BOOL)isHSA2EnabledForAltDSID:(id)a3
{
  return +[AKCDPFactory cdpAccountIsHSA2EnabledForAltDSID:a3];
}

+ (void)walrusStatus
{
  unint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Failed to fetch walrus status with error: %@", v4, v5, v6, v7, 2u);
}

void __37__AKCDPFactory_walrusStatusLiveValue__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)webAccessStatus
{
  unint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_0_3(&dword_193494000, v2, v3, "Failed to fetch web access status with error: %@", v4, v5, v6, v7, 2u);
}

void __40__AKCDPFactory_webAccessStatusLiveValue__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)webAccessChangeControllerForTargetStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isManateeAvailable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Keychain sync is not enabled. Failed with error %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
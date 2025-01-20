@interface ASFeatureManager
+ (ASFeatureManager)sharedManager;
+ (BOOL)shouldAllowAddingNewPasswords;
- (ASFeatureManager)init;
- (BOOL)_shouldApplyPasskeyQuirks;
- (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3;
- (BOOL)canRequestEnterpriseAttestationForRelyingParty:(id)a3;
- (BOOL)isAirDropPasswordsAvailable;
- (BOOL)isClientEntitledForInternalTestingWithAuditToken:(id *)a3;
- (BOOL)isDeviceConfiguredToAllowPasskeys;
- (BOOL)shouldUseFallbackUIForRelyingParty:(id)a3;
- (id)_fetchCurrentManagedConfiguration;
- (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3;
- (void)_fetchCurrentManagedConfiguration;
@end

@implementation ASFeatureManager

+ (ASFeatureManager)sharedManager
{
  if (sharedManager_onceToken[0] != -1) {
    dispatch_once(sharedManager_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedManager_sharedInstance;

  return (ASFeatureManager *)v2;
}

uint64_t __33__ASFeatureManager_sharedManager__block_invoke()
{
  sharedManager_sharedInstance = objc_alloc_init(ASFeatureManager);

  return MEMORY[0x270F9A758]();
}

- (ASFeatureManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)ASFeatureManager;
  v2 = [(ASFeatureManager *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AuthenticationServicesCore.ASFeatureManager", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x263F66278]);
    v7 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariCoreBundle");
    v8 = [v7 URLForResource:@"WBSAutoFillQuirks" withExtension:@"plist"];
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = objc_msgSend(v9, "safari_autoFillQuirksDownloadDirectoryURL");
    uint64_t v11 = [v6 initWithBuiltInQuirksURL:v8 downloadsDirectoryURL:v10 resourceName:@"AutoFillQuirks" resourceVersion:@"1" updateDateDefaultsKey:*MEMORY[0x263F66508] updateInterval:86400.0];
    quirksManager = v2->_quirksManager;
    v2->_quirksManager = (WBSAutoFillQuirksManager *)v11;

    [(WBSAutoFillQuirksManager *)v2->_quirksManager setShouldAttemptToDownloadConfiguration:0];
    [(WBSAutoFillQuirksManager *)v2->_quirksManager beginLoadingQuirksFromDisk];
    v13 = v2;
  }
  return v2;
}

- (BOOL)isAirDropPasswordsAvailable
{
  return [MEMORY[0x263F662A0] isAirDropPasswordsEnabled];
}

- (BOOL)isDeviceConfiguredToAllowPasskeys
{
  id v2 = objc_alloc_init(MEMORY[0x263F10468]);
  char v3 = [v2 canEvaluatePolicy:2 error:0];

  return v3;
}

- (BOOL)arePasskeysDisallowedForRelyingParty:(id)a3
{
  id v4 = a3;
  if ([(ASFeatureManager *)self _shouldApplyPasskeyQuirks]
    && ![(ASFeatureManager *)self shouldUseFallbackUIForRelyingParty:v4])
  {
    char v5 = [(WBSAutoFillQuirksManager *)self->_quirksManager arePasskeysDisallowedForRelyingParty:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseFallbackUIForRelyingParty:(id)a3
{
  id v4 = a3;
  if ([(ASFeatureManager *)self _shouldApplyPasskeyQuirks]) {
    char v5 = [(WBSAutoFillQuirksManager *)self->_quirksManager shouldUseFallbackUIForRelyingParty:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isClientEntitledForInternalTestingWithAuditToken:(id *)a3
{
  int v3 = [MEMORY[0x263F662A0] isInternalInstall];
  if (v3) {
    LOBYTE(v3) = WBSAuditTokenHasEntitlement();
  }
  return v3;
}

- (BOOL)canRequestEnterpriseAttestationForRelyingParty:(id)a3
{
  id v4 = a3;
  char v5 = [(ASFeatureManager *)self _fetchCurrentManagedConfiguration];
  char v6 = [v5 isConfiguredForEnterpriseAttestationForRelyingParty:v4];

  return v6;
}

- (id)entepriseAttestationIdentityPersistentReferenceForRelyingParty:(id)a3
{
  id v4 = a3;
  char v5 = [(ASFeatureManager *)self _fetchCurrentManagedConfiguration];
  char v6 = [v5 entepriseAttestationIdentityPersistentReferenceForRelyingParty:v4];

  return v6;
}

+ (BOOL)shouldAllowAddingNewPasswords
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getWBUFeatureManagerClass_softClass;
  uint64_t v9 = getWBUFeatureManagerClass_softClass;
  if (!getWBUFeatureManagerClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getWBUFeatureManagerClass_block_invoke;
    v5[3] = &unk_26439F4C8;
    v5[4] = &v6;
    __getWBUFeatureManagerClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 shouldAllowAddingNewPasswords];
}

- (BOOL)_shouldApplyPasskeyQuirks
{
  id v2 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
  char v3 = [v2 BOOLForKey:@"DisablePasskeysSiteSpecificHacks"] ^ 1;

  return v3;
}

- (id)_fetchCurrentManagedConfiguration
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = objc_msgSend(v2, "as_authenticationServicesManagedConfigurationURL");
  id v9 = 0;
  id v4 = +[ASManagedConfiguration loadFromDiskWithPlistURL:v3 error:&v9];
  id v5 = v9;

  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(ASFeatureManager *)v7 _fetchCurrentManagedConfiguration];
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quirksManager, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_fetchCurrentManagedConfiguration
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  char v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_219326000, v3, OS_LOG_TYPE_FAULT, "Could not not load managed configuration: %{public}@.", (uint8_t *)&v5, 0xCu);
}

@end
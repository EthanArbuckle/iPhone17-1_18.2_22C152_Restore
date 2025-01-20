@interface AADataclassManager
+ (AADataclassManager)sharedManager;
+ (id)dataclassBundleMap;
- (AAAccountStoreProxyProtocol)storeProxy;
- (AADataclassManager)init;
- (AADataclassManager)initWithAccountStore:(id)a3;
- (ACAccountStore)store;
- (BOOL)_appStatusRestrictsProvisioningForDataclass:(id)a3;
- (BOOL)_hideDataclassWhenAppRemoved:(id)a3;
- (BOOL)_isRestrictedForDataclass:(id)a3 account:(id)a4;
- (BOOL)_shouldProvisionNotesForAccount:(id)a3;
- (BOOL)_shouldProvisionRemindersForAccount:(id)a3;
- (BOOL)_shouldShowDataclassWhenAppIsRemoved:(id)a3;
- (BOOL)_shouldVerifyAccountSave;
- (BOOL)canAutoEnableDataclass:(id)a3 forAccount:(id)a4;
- (BOOL)isDataclassActionSafeForAutoEnablement:(id)a3;
- (BOOL)isSystemAppMCRestrictedOrRemovedForDataclass:(id)a3 forAccount:(id)a4;
- (BOOL)isSystemAppRestrictedOrRemovedForDataclass:(id)a3;
- (BOOL)policyRestrictsDataclass:(id)a3;
- (BOOL)shouldProvisionDataclass:(id)a3 forAccount:(id)a4;
- (id)_filteredDataclassesForAccountClass:(id)a3;
- (id)_nonVisibleServiceDataclass;
- (id)_userVisibleDataclasses;
- (id)allowListedDataclassesForAppleAccountClassBasic;
- (id)allowListedDataclassesForAppleAccountClassFull;
- (id)appBundleIdentifierForDataclass:(id)a3;
- (id)denyListedMacOSDataclasses;
- (id)filterDataclassesForPossibleAutoEnablementForAccount:(id)a3;
- (id)filteredServerProvidedFeatures:(id)a3 forAccount:(id)a4;
- (void)_buildAutoEnableableDataclassesAndActionsForAccount:(id)a3 dataclassesForEnablement:(id)a4 completion:(id)a5;
- (void)_shouldVerifyAccountSave;
- (void)enableDataclassesWithoutLocalDataDataclassActionsForAccount:(id)a3 completion:(id)a4;
- (void)enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:(id)a3 fromAccount:(id)a4 completion:(id)a5;
- (void)setStore:(id)a3;
- (void)setStoreProxy:(id)a3;
@end

@implementation AADataclassManager

- (id)allowListedDataclassesForAppleAccountClassBasic
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F17578];
  v8[0] = *MEMORY[0x1E4F17568];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F175F0];
  v8[2] = *MEMORY[0x1E4F175C8];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E4F17610];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  v6 = [v2 setWithArray:v5];

  return v6;
}

- (id)allowListedDataclassesForAppleAccountClassFull
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v2 = [(AADataclassManager *)self allowListedDataclassesForAppleAccountClassBasic];
  uint64_t v3 = *MEMORY[0x1E4F17548];
  v9[0] = *MEMORY[0x1E4F17528];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F17560];
  v9[2] = *MEMORY[0x1E4F17550];
  v9[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F17640];
  v9[4] = *MEMORY[0x1E4F17608];
  v9[5] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  v7 = [v2 setByAddingObjectsFromArray:v6];

  return v7;
}

- (id)_userVisibleDataclasses
{
  v18[22] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F17528];
  v18[0] = *MEMORY[0x1E4F175A0];
  v18[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F17628];
  v18[2] = *MEMORY[0x1E4F175D8];
  v18[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F17568];
  v18[4] = *MEMORY[0x1E4F17530];
  v18[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F17588];
  v18[6] = *MEMORY[0x1E4F17578];
  v18[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F17598];
  v18[8] = *MEMORY[0x1E4F175A8];
  v18[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F175C0];
  v18[10] = *MEMORY[0x1E4F17590];
  v18[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F175E8];
  v18[12] = *MEMORY[0x1E4F175C8];
  v18[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F17600];
  v18[14] = *MEMORY[0x1E4F175F0];
  v18[15] = v10;
  uint64_t v11 = *MEMORY[0x1E4F17630];
  v18[16] = *MEMORY[0x1E4F17610];
  v18[17] = v11;
  uint64_t v12 = *MEMORY[0x1E4F17640];
  v18[18] = *MEMORY[0x1E4F17638];
  v18[19] = v12;
  uint64_t v13 = *MEMORY[0x1E4F175B0];
  v18[20] = *MEMORY[0x1E4F175F8];
  v18[21] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:22];
  v15 = [v2 setWithArray:v14];

  if (+[AAPreferences isMomentsDataclassEnabled]
    && +[AADeviceModelHelper isDeviceiPhone])
  {
    uint64_t v16 = [v15 setByAddingObject:*MEMORY[0x1E4F175E0]];

    v15 = (void *)v16;
  }

  return v15;
}

- (id)_nonVisibleServiceDataclass
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = *MEMORY[0x1E4F175B8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)denyListedMacOSDataclasses
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F175A0];
  v8[0] = *MEMORY[0x1E4F17528];
  v8[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v5 = [v2 setWithArray:v4];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v6 = [v5 setByAddingObject:*MEMORY[0x1E4F175D8]];

    uint64_t v5 = (void *)v6;
  }

  return v5;
}

- (id)_filteredDataclassesForAccountClass:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"primary"])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"AADataclassManager.m" lineNumber:198 description:@"AAAccountClassPrimary does not have filtered dataclasses. All dataclasses are valid"];
  }
  if ([v5 isEqualToString:@"basic"])
  {
    uint64_t v6 = [(AADataclassManager *)self allowListedDataclassesForAppleAccountClassBasic];
LABEL_7:
    uint64_t v7 = (void *)v6;
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"full"])
  {
    uint64_t v6 = [(AADataclassManager *)self allowListedDataclassesForAppleAccountClassFull];
    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

- (id)filteredServerProvidedFeatures:(id)a3 forAccount:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AADataclassManager.m", 210, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_26:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"AADataclassManager.m", 211, @"Invalid parameter not satisfying: %@", @"serverProvidedFeatures" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_26;
  }
LABEL_3:
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = *MEMORY[0x1E4F17628];
  if (([v10 containsObject:*MEMORY[0x1E4F17628]] & 1) == 0
    && [v10 containsObject:*MEMORY[0x1E4F17640]]
    && (objc_msgSend(v8, "aa_isManagedAppleID") & 1) == 0)
  {
    [v10 addObject:v11];
  }
  uint64_t v12 = objc_msgSend(v8, "aa_accountClass");
  char v13 = [v12 isEqualToString:@"basic"];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = *MEMORY[0x1E4F17608];
    if (([v10 containsObject:*MEMORY[0x1E4F17608]] & 1) == 0)
    {
      if ([v10 containsObject:*MEMORY[0x1E4F17640]]) {
        [v10 addObject:v14];
      }
    }
  }
  v15 = [MEMORY[0x1E4F1CA80] setWithArray:MEMORY[0x1E4F1CBF0]];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          -[AADataclassManager filteredServerProvidedFeatures:forAccount:]();
        }
        if ([(AADataclassManager *)self shouldProvisionDataclass:v21 forAccount:v8])
        {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  return v15;
}

+ (AADataclassManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedManager_sharedManager;

  return (AADataclassManager *)v2;
}

uint64_t __35__AADataclassManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = objc_alloc_init(AADataclassManager);

  return MEMORY[0x1F41817F8]();
}

- (AADataclassManager)init
{
  uint64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v4 = [(AADataclassManager *)self initWithAccountStore:v3];

  return v4;
}

- (AADataclassManager)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AADataclassManager;
  uint64_t v6 = [(AADataclassManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    id v8 = objc_alloc_init(AAAccountStoreProxy);
    storeProxy = v7->_storeProxy;
    v7->_storeProxy = (AAAccountStoreProxyProtocol *)v8;
  }
  return v7;
}

+ (id)dataclassBundleMap
{
  if (dataclassBundleMap_onceToken != -1) {
    dispatch_once(&dataclassBundleMap_onceToken, &__block_literal_global_106);
  }
  v2 = (void *)dataclassBundleMap_bundleIdentifierDictionary;

  return v2;
}

void __40__AADataclassManager_dataclassBundleMap__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:@"com.apple.mobilesafari" forKeyedSubscript:*MEMORY[0x1E4F17530]];
  [v2 setObject:@"com.apple.mobilecal" forKeyedSubscript:*MEMORY[0x1E4F17568]];
  [v2 setObject:@"com.apple.MobileAddressBook" forKeyedSubscript:*MEMORY[0x1E4F17578]];
  [v2 setObject:@"com.apple.freeform" forKeyedSubscript:*MEMORY[0x1E4F17598]];
  [v2 setObject:@"com.apple.Home" forKeyedSubscript:*MEMORY[0x1E4F175A8]];
  [v2 setObject:@"com.apple.mobilemail" forKeyedSubscript:*MEMORY[0x1E4F175C8]];
  [v2 setObject:@"com.apple.news" forKeyedSubscript:*MEMORY[0x1E4F175E8]];
  [v2 setObject:@"com.apple.mobilenotes" forKeyedSubscript:*MEMORY[0x1E4F175F0]];
  [v2 setObject:@"com.apple.reminders" forKeyedSubscript:*MEMORY[0x1E4F17610]];
  [v2 setObject:@"com.apple.stocks" forKeyedSubscript:*MEMORY[0x1E4F17638]];
  [v2 setObject:@"com.apple.MobileSMS" forKeyedSubscript:*MEMORY[0x1E4F175D8]];
  [v2 setObject:@"com.apple.Health" forKeyedSubscript:*MEMORY[0x1E4F175A0]];
  [v2 setObject:@"com.apple.DocumentsApp" forKeyedSubscript:*MEMORY[0x1E4F17640]];
  [v2 setObject:@"com.apple.GenerativePlaygroundApp" forKeyedSubscript:*MEMORY[0x1E4F175B0]];
  uint64_t v0 = [v2 copy];
  v1 = (void *)dataclassBundleMap_bundleIdentifierDictionary;
  dataclassBundleMap_bundleIdentifierDictionary = v0;
}

- (id)appBundleIdentifierForDataclass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AADataclassManager dataclassBundleMap];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (BOOL)_isRestrictedForDataclass:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 isEqualToString:*MEMORY[0x1E4F17528]];
  if (v6 && v7 && !objc_msgSend(v6, "aa_isAccountClass:", @"primary"))
  {
    BOOL v10 = 0;
  }
  else
  {
    if (_isRestrictedForDataclass_account__onceToken != -1) {
      dispatch_once(&_isRestrictedForDataclass_account__onceToken, &__block_literal_global_109);
    }
    id v8 = [(id)_isRestrictedForDataclass_account__dataclassToFeatureDictionary objectForKeyedSubscript:v5];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F74230] sharedConnection];
      BOOL v10 = [v9 BOOLRestrictionForFeature:v8] == 2;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

void __56__AADataclassManager__isRestrictedForDataclass_account___block_invoke()
{
  v16[11] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F73FA0];
  uint64_t v1 = *MEMORY[0x1E4F175D0];
  v15[0] = *MEMORY[0x1E4F175B8];
  v15[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F74108];
  v16[0] = v0;
  v16[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F74150];
  uint64_t v4 = *MEMORY[0x1E4F17628];
  v15[2] = *MEMORY[0x1E4F17618];
  v15[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F73F88];
  v16[2] = v3;
  v16[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F73F98];
  uint64_t v7 = *MEMORY[0x1E4F17588];
  v15[4] = *MEMORY[0x1E4F17528];
  v15[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F74000];
  v16[4] = v6;
  v16[5] = v8;
  uint64_t v9 = *MEMORY[0x1E4F74060];
  uint64_t v10 = *MEMORY[0x1E4F175A8];
  v15[6] = *MEMORY[0x1E4F175A0];
  v15[7] = v10;
  uint64_t v11 = *MEMORY[0x1E4F74070];
  v16[6] = v9;
  v16[7] = v11;
  uint64_t v12 = *MEMORY[0x1E4F17640];
  v15[8] = *MEMORY[0x1E4F175E8];
  v15[9] = v12;
  v16[8] = *MEMORY[0x1E4F740F0];
  v16[9] = v0;
  v15[10] = *MEMORY[0x1E4F175B0];
  v16[10] = *MEMORY[0x1E4F74090];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:11];
  uint64_t v14 = (void *)_isRestrictedForDataclass_account__dataclassToFeatureDictionary;
  _isRestrictedForDataclass_account__dataclassToFeatureDictionary = v13;
}

- (BOOL)policyRestrictsDataclass:(id)a3
{
  return +[AACloudPolicyRestrictions policyRestrictsDataclass:a3];
}

- (BOOL)isSystemAppRestrictedOrRemovedForDataclass:(id)a3
{
  return [(AADataclassManager *)self isSystemAppMCRestrictedOrRemovedForDataclass:a3 forAccount:0];
}

- (BOOL)isSystemAppMCRestrictedOrRemovedForDataclass:(id)a3 forAccount:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(AADataclassManager *)self _isRestrictedForDataclass:v6 account:a4])
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "%@ is not available due to restrictions.", (uint8_t *)&v10, 0xCu);
    }

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = [(AADataclassManager *)self _appStatusRestrictsProvisioningForDataclass:v6];
  }

  return v8;
}

- (BOOL)_appStatusRestrictsProvisioningForDataclass:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AADataclassManager *)self appBundleIdentifierForDataclass:v4];
  if (!v5)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AADataclassManager _appStatusRestrictsProvisioningForDataclass:]();
    }
    goto LABEL_13;
  }
  id v6 = +[AAAppStateProvider appStateForBundleID:v5];
  if ([v6 isInstalled])
  {
    if ([v6 isRestricted])
    {
      uint64_t v7 = _AALogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        BOOL v8 = "%@ is not available with a restricted app.";
LABEL_11:
        _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  if (![(AADataclassManager *)self _hideDataclassWhenAppRemoved:v4]) {
    goto LABEL_13;
  }
  uint64_t v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    BOOL v8 = "%@ is not available when its app is removed.";
    goto LABEL_11;
  }
LABEL_12:

  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (BOOL)_hideDataclassWhenAppRemoved:(id)a3
{
  return ![(AADataclassManager *)self _shouldShowDataclassWhenAppIsRemoved:a3];
}

- (BOOL)_shouldShowDataclassWhenAppIsRemoved:(id)a3
{
  uint64_t v3 = _shouldShowDataclassWhenAppIsRemoved__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_shouldShowDataclassWhenAppIsRemoved__onceToken, &__block_literal_global_115);
  }
  char v5 = [(id)_shouldShowDataclassWhenAppIsRemoved__dataclassesToKeep containsObject:v4];

  return v5;
}

void __59__AADataclassManager__shouldShowDataclassWhenAppIsRemoved___block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F17578];
  v5[0] = *MEMORY[0x1E4F17568];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F175A8];
  v5[2] = *MEMORY[0x1E4F175A0];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F17640];
  v5[4] = *MEMORY[0x1E4F17610];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  id v4 = (void *)_shouldShowDataclassWhenAppIsRemoved__dataclassesToKeep;
  _shouldShowDataclassWhenAppIsRemoved__dataclassesToKeep = v3;
}

- (BOOL)canAutoEnableDataclass:(id)a3 forAccount:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"AADataclassManager.m", 463, @"Invalid parameter not satisfying: %@", @"dataclass" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"AADataclassManager.m", 464, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

LABEL_3:
  int v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Checking if we need to auto-enable: %@", buf, 0xCu);
  }

  if (!objc_msgSend(v9, "aa_isPrimaryEmailVerified")) {
    goto LABEL_17;
  }
  int v11 = [(AADataclassManager *)self _userVisibleDataclasses];
  if ([v11 containsObject:v7])
  {
  }
  else
  {
    id v12 = [(AADataclassManager *)self _nonVisibleServiceDataclass];
    int v13 = [v12 containsObject:v7];

    if (!v13)
    {
LABEL_17:
      int v14 = 0;
      goto LABEL_18;
    }
  }
  if ([(AADataclassManager *)self _isRestrictedForDataclass:v7 account:v9]
    || [v7 isEqualToString:*MEMORY[0x1E4F17528]]
    && +[AAPreferences isRunningInStoreDemoMode]
    || ([v7 isEqualToString:*MEMORY[0x1E4F17588]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F17600]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F175D0]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F17618]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4F175D8]] & 1) != 0)
  {
    goto LABEL_17;
  }
  uint64_t v18 = *MEMORY[0x1E4F175C8];
  if ([v7 isEqualToString:*MEMORY[0x1E4F175C8]])
  {
    uint64_t v19 = +[AADataclassManager sharedManager];
    int v20 = [v19 isSystemAppMCRestrictedOrRemovedForDataclass:v18 forAccount:v9];

    int v14 = (objc_msgSend(v9, "aa_needsEmailConfiguration") | v20) ^ 1;
  }
  else
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4F175A0]]
      && +[AADeviceModelHelper isDeviceiPad])
    {
      uint64_t v21 = _AALogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "Health Dataclass. Setting auto-enable for iPad to false.", buf, 2u);
      }

      goto LABEL_17;
    }
    int v14 = 1;
  }
LABEL_18:
  if (objc_msgSend(v9, "aa_isManagedAppleID"))
  {
    if ((v14 & ~objc_msgSend(v9, "aa_serverDisabledDataclass:", v7) & 1) == 0)
    {
LABEL_20:
      v15 = _AALogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Skipping auto-enable for %@", buf, 0xCu);
      }
      BOOL v16 = 0;
      goto LABEL_27;
    }
  }
  else if (!v14)
  {
    goto LABEL_20;
  }
  v15 = _AALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v7;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "Auto-enabling dataclass: %@", buf, 0xCu);
  }
  BOOL v16 = 1;
LABEL_27:

  return v16;
}

- (BOOL)shouldProvisionDataclass:(id)a3 forAccount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AADataclassManager.m", 520, @"Invalid parameter not satisfying: %@", @"dataclass" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_22:
    BOOL v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AADataclassManager.m", 521, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_22;
  }
LABEL_3:
  if (!-[AADataclassManager isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:](self, "isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:", v7, v9)&& (![v7 isEqualToString:*MEMORY[0x1E4F175E0]]|| +[AAPreferences isMomentsDataclassEnabled](AAPreferences, "isMomentsDataclassEnabled")&& +[AADeviceModelHelper isDeviceiPhone](AADeviceModelHelper, "isDeviceiPhone")))
  {
    int v10 = objc_msgSend(v9, "aa_accountClass");
    if ([v10 isEqualToString:@"primary"])
    {
      BOOL v11 = 1;
LABEL_19:

      goto LABEL_20;
    }
    id v12 = [(AADataclassManager *)self _filteredDataclassesForAccountClass:v10];
    if ([v12 containsObject:v7])
    {
      if ([v7 isEqualToString:*MEMORY[0x1E4F175F0]])
      {
        BOOL v13 = [(AADataclassManager *)self _shouldProvisionNotesForAccount:v9];
      }
      else
      {
        if (![v7 isEqualToString:*MEMORY[0x1E4F17610]])
        {
          BOOL v11 = 1;
          goto LABEL_18;
        }
        BOOL v13 = [(AADataclassManager *)self _shouldProvisionRemindersForAccount:v9];
      }
      BOOL v11 = v13;
    }
    else
    {
      BOOL v11 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_shouldProvisionNotesForAccount:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AADataclassManager.m", 578, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  id v6 = objc_msgSend(v5, "aa_accountClass");
  if ([v6 isEqualToString:@"primary"])
  {

LABEL_10:
    BOOL v10 = 1;
    goto LABEL_11;
  }
  id v7 = objc_msgSend(v5, "aa_accountClass");
  char v8 = [v7 isEqualToString:@"full"];

  if ((v8 & 1) != 0 || !objc_msgSend(v5, "aa_isNotesMigrated")) {
    goto LABEL_10;
  }
  BOOL v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AADataclassManager _shouldProvisionNotesForAccount:]();
  }

  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_shouldProvisionRemindersForAccount:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"AADataclassManager.m", 596, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  id v6 = objc_msgSend(v5, "aa_accountClass");
  if ([v6 isEqualToString:@"primary"])
  {

LABEL_10:
    BOOL v10 = 1;
    goto LABEL_11;
  }
  id v7 = objc_msgSend(v5, "aa_accountClass");
  char v8 = [v7 isEqualToString:@"full"];

  if ((v8 & 1) != 0 || !objc_msgSend(v5, "aa_isRemindersMigrated")) {
    goto LABEL_10;
  }
  BOOL v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AADataclassManager _shouldProvisionRemindersForAccount:]();
  }

  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(AADataclassManager *)self filterDataclassesForPossibleAutoEnablementForAccount:v6];
  if ([v8 count])
  {
    [(AADataclassManager *)self enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:v8 fromAccount:v6 completion:v7];
  }
  else
  {
    BOOL v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[AADataclassManager enableDataclassesWithoutLocalDataDataclassActionsForAccount:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "%s - There are no auto-enableable dataclasses for account %@. Proceeding with save.", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__1;
    uint64_t v19 = __Block_byref_object_dispose__1;
    id v20 = (id)os_transaction_create();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    BOOL v13 = __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke;
    int v14 = &unk_1E5A48B40;
    id v15 = v7;
    BOOL v16 = buf;
    BOOL v10 = (void *)MEMORY[0x1A622F430](&v11);
    -[AAAccountStoreProxyProtocol saveAccount:onAccountStore:withCompletionHandler:](self->_storeProxy, "saveAccount:onAccountStore:withCompletionHandler:", v6, self->_store, v10, v11, v12, v13, v14);

    _Block_object_dispose(buf, 8);
  }
}

void __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _AALogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Save without auto-enableable dataclasses successful completed.", v10, 2u);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:(id)a3 fromAccount:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    BOOL v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AADataclassManager.m", 638, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"AADataclassManager.m", 637, @"Invalid parameter not satisfying: %@", @"dataclasses" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"AADataclassManager.m", 639, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to auto-enable dataclasses for account (%@): %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke;
  v18[3] = &unk_1E5A48B90;
  objc_copyWeak(&v21, (id *)buf);
  id v13 = v11;
  id v20 = v13;
  v18[4] = self;
  id v14 = v10;
  id v19 = v14;
  [(AADataclassManager *)self _buildAutoEnableableDataclassesAndActionsForAccount:v14 dataclassesForEnablement:v9 completion:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"dataclasses"];
    uint64_t v8 = [v5 objectForKeyedSubscript:@"dataclassActions"];
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Filtered dataclasses: %@", (uint8_t *)&buf, 0xCu);
    }

    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "Filtered dataclass actions: %@", (uint8_t *)&buf, 0xCu);
    }

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t v12 = [*(id *)(a1 + 32) _shouldVerifyAccountSave];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      id v33 = (id)os_transaction_create();
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      id v23 = __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_126;
      __int16 v24 = &unk_1E5A48B68;
      id v14 = *(void **)(a1 + 40);
      uint64_t v13 = a1 + 40;
      id v25 = v14;
      id v15 = v8;
      id v26 = v15;
      id v27 = *(id *)(v13 + 8);
      p_long long buf = &buf;
      BOOL v16 = (void *)MEMORY[0x1A622F430](&v21);
      objc_msgSend(WeakRetained[2], "saveAccount:onAccountStore:withDataclassActions:doVerify:completion:", *(void *)v13, WeakRetained[1], v15, v12, v16, v21, v22, v23, v24);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v18 = _AALogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_2(v18);
      }

      uint64_t v19 = *(void *)(a1 + 48);
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AASignInErrors" code:-8015 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
    }
  }
  else
  {
    uint64_t v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_126(void *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    if (a2) {
      id v7 = @"YES";
    }
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Account save with dataclass actions had success (%@) for account (%@) with dataclass actions: %@", (uint8_t *)&v13, 0x20u);
  }

  if (v5)
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_126_cold_1();
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v11 = *(void *)(a1[7] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

- (void)_buildAutoEnableableDataclassesAndActionsForAccount:(id)a3 dataclassesForEnablement:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  v29 = (void *)[v9 mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v40;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v8, "setEnabled:forDataclass:", 1, *(void *)(*((void *)&v39 + 1) + 8 * v15++), v29);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v13);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v17 = objc_msgSend(v8, "aa_isPrimaryEmailVerified");
  store = self->_store;
  id v38 = 0;
  uint64_t v19 = [(ACAccountStore *)store dataclassActionsForAccountSave:v8 error:&v38];
  id v20 = v38;
  uint64_t v21 = v20;
  if (v19)
  {
    uint64_t v22 = _AALogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v44 = v19;
      _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "We have potential dataclass actions: %@", buf, 0xCu);
    }

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __110__AADataclassManager__buildAutoEnableableDataclassesAndActionsForAccount_dataclassesForEnablement_completion___block_invoke;
    id v33 = &unk_1E5A48BB8;
    uint64_t v34 = self;
    id v35 = v23;
    __int16 v24 = v29;
    id v36 = v29;
    id v37 = v8;
    id v25 = v23;
    [v19 enumerateKeysAndObjectsUsingBlock:&v30];
    id v26 = (void *)[v25 copy];
    [v16 setObject:v26 forKeyedSubscript:@"dataclassActions"];

    goto LABEL_12;
  }
  __int16 v24 = v29;
  if (!v20)
  {
LABEL_12:
    if (v17 != objc_msgSend(v8, "aa_isPrimaryEmailVerified", v29, v30, v31, v32, v33, v34)) {
      objc_msgSend(v8, "aa_setPrimaryEmailVerified:", 1);
    }
    id v27 = (void *)[v24 copy];
    [v16 setObject:v27 forKeyedSubscript:@"dataclasses"];

    v10[2](v10, v16, 0);
    goto LABEL_19;
  }
  long long v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[AADataclassManager _buildAutoEnableableDataclassesAndActionsForAccount:dataclassesForEnablement:completion:]();
  }

  ((void (**)(id, id, void *))v10)[2](v10, 0, v21);
LABEL_19:
}

void __110__AADataclassManager__buildAutoEnableableDataclassesAndActionsForAccount_dataclassesForEnablement_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [v6 count];
    id v8 = _AALogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 == 1)
    {
      if (v9)
      {
        id v10 = [v6 objectAtIndexedSubscript:0];
        int v14 = 134218242;
        uint64_t v15 = [v10 type];
        __int16 v16 = 2112;
        uint64_t v17 = (uint64_t)v5;
        _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Action %lu available for %@", (uint8_t *)&v14, 0x16u);
      }
      id v11 = [v6 firstObject];
      if ([a1[4] isDataclassActionSafeForAutoEnablement:v11])
      {
        [a1[5] setObject:v11 forKey:v5];
      }
      else
      {
        uint64_t v12 = _ACLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v11 type];
          int v14 = 138412546;
          uint64_t v15 = (uint64_t)v5;
          __int16 v16 = 2048;
          uint64_t v17 = v13;
          _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "\"Not enabling dataclass %@ as only action %lu is not safe for auto enablement.\"", (uint8_t *)&v14, 0x16u);
        }

        [a1[6] removeObject:v5];
        [a1[7] setEnabled:0 forDataclass:v5];
      }
    }
    else
    {
      if (v9)
      {
        int v14 = 138412290;
        uint64_t v15 = (uint64_t)v5;
        _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Unable to auto-enable dataclass %@ as enablement requires a user decision.", (uint8_t *)&v14, 0xCu);
      }

      [a1[6] removeObject:v5];
      [a1[7] setEnabled:0 forDataclass:v5];
    }
  }
}

- (BOOL)isDataclassActionSafeForAutoEnablement:(id)a3
{
  return [a3 isSafeForAutoEnablement];
}

- (id)filterDataclassesForPossibleAutoEnablementForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 provisionedDataclasses];
  id v5 = [v4 allObjects];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__AADataclassManager_filterDataclassesForPossibleAutoEnablementForAccount___block_invoke;
  v9[3] = &unk_1E5A48BE0;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = objc_msgSend(v5, "aaf_filter:", v9);

  return v7;
}

uint64_t __75__AADataclassManager_filterDataclassesForPossibleAutoEnablementForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isProvisionedForDataclass:v3]
    && ([*(id *)(a1 + 32) isEnabledForDataclass:v3] & 1) == 0)
  {
    id v5 = +[AADataclassManager sharedManager];
    uint64_t v4 = [v5 canAutoEnableDataclass:v3 forAccount:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldVerifyAccountSave
{
  if (![MEMORY[0x1E4F46FF0] deviceIsAudioAccessory]) {
    return 1;
  }
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.HPSetup"];

  if (!v4) {
    return 1;
  }
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AADataclassManager _shouldVerifyAccountSave](v5);
  }

  return 0;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (AAAccountStoreProxyProtocol)storeProxy
{
  return self->_storeProxy;
}

- (void)setStoreProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeProxy, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)filteredServerProvidedFeatures:forAccount:.cold.1()
{
}

- (void)_appStatusRestrictsProvisioningForDataclass:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Nil bundle ID passed. No reason to consider restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
}

- (void)_shouldProvisionNotesForAccount:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Notes is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
}

- (void)_shouldProvisionRemindersForAccount:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1A11D8000, v0, v1, "Reminders is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
}

void __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to save account without auto-enableable dataclasses with error: %@", v2, v3, v4, v5, v6);
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Unable to build list of dataclasses and actions for enablement %@", v2, v3, v4, v5, v6);
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "AADataclassManager failed to maintain ref to self.", v1, 2u);
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_126_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Encountered error when saving with dataclass actions: %@", v2, v3, v4, v5, v6);
}

- (void)_buildAutoEnableableDataclassesAndActionsForAccount:dataclassesForEnablement:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to get dataclass actions for account, error: %@", v2, v3, v4, v5, v6);
}

- (void)_shouldVerifyAccountSave
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "HomePod setup sign in detected. Do not verify our account save.", v1, 2u);
}

@end
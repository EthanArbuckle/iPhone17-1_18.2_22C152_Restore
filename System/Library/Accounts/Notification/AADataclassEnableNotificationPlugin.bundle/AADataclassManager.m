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
- (void)enableDataclassesWithoutLocalDataDataclassActionsForAccount:(id)a3 completion:(id)a4;
- (void)enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:(id)a3 fromAccount:(id)a4 completion:(id)a5;
- (void)setStore:(id)a3;
- (void)setStoreProxy:(id)a3;
@end

@implementation AADataclassManager

- (id)allowListedDataclassesForAppleAccountClassBasic
{
  v9[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263EFAC60];
  v9[0] = *MEMORY[0x263EFAC50];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFACE8];
  v9[2] = *MEMORY[0x263EFACB8];
  v9[3] = v4;
  v9[4] = *MEMORY[0x263EFAD08];
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v9, 5);
  v7 = objc_msgSend_setWithArray_(v2, v6, (uint64_t)v5);

  return v7;
}

- (id)allowListedDataclassesForAppleAccountClassFull
{
  v12[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_allowListedDataclassesForAppleAccountClassBasic(self, a2, v2);
  uint64_t v4 = *MEMORY[0x263EFAC38];
  v12[0] = *MEMORY[0x263EFAC20];
  v12[1] = v4;
  uint64_t v5 = *MEMORY[0x263EFAC48];
  v12[2] = *MEMORY[0x263EFAC40];
  v12[3] = v5;
  uint64_t v6 = *MEMORY[0x263EFAD48];
  v12[4] = *MEMORY[0x263EFAD00];
  v12[5] = v6;
  v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v7, (uint64_t)v12, 6);
  v10 = objc_msgSend_setByAddingObjectsFromArray_(v3, v9, (uint64_t)v8);

  return v10;
}

- (id)_userVisibleDataclasses
{
  v24[22] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263EFAC20];
  v24[0] = *MEMORY[0x263EFAC90];
  v24[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFAD30];
  v24[2] = *MEMORY[0x263EFACC8];
  v24[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFAC50];
  v24[4] = *MEMORY[0x263EFAC28];
  v24[5] = v5;
  uint64_t v6 = *MEMORY[0x263EFAC78];
  v24[6] = *MEMORY[0x263EFAC60];
  v24[7] = v6;
  uint64_t v7 = *MEMORY[0x263EFAC88];
  v24[8] = *MEMORY[0x263EFAC98];
  v24[9] = v7;
  uint64_t v8 = *MEMORY[0x263EFACB0];
  v24[10] = *MEMORY[0x263EFAC80];
  v24[11] = v8;
  uint64_t v9 = *MEMORY[0x263EFACE0];
  v24[12] = *MEMORY[0x263EFACB8];
  v24[13] = v9;
  uint64_t v10 = *MEMORY[0x263EFACF8];
  v24[14] = *MEMORY[0x263EFACE8];
  v24[15] = v10;
  uint64_t v11 = *MEMORY[0x263EFAD38];
  v24[16] = *MEMORY[0x263EFAD08];
  v24[17] = v11;
  uint64_t v12 = *MEMORY[0x263EFAD48];
  v24[18] = *MEMORY[0x263EFAD40];
  v24[19] = v12;
  uint64_t v13 = *MEMORY[0x263EFACA0];
  v24[20] = *MEMORY[0x263EFACF0];
  v24[21] = v13;
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v24, 22);
  v16 = objc_msgSend_setWithArray_(v2, v15, (uint64_t)v14);

  if (objc_msgSend_isMomentsDataclassEnabled(MEMORY[0x263F25918], v17, v18)
    && objc_msgSend_isDeviceiPhone(AADeviceModelHelper, v19, v20))
  {
    uint64_t v22 = objc_msgSend_setByAddingObject_(v16, v21, *MEMORY[0x263EFACD0]);

    v16 = (void *)v22;
  }
  return v16;
}

- (id)_nonVisibleServiceDataclass
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  v7[0] = *MEMORY[0x263EFACA8];
  uint64_t v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v7, 1);
  uint64_t v5 = objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);

  return v5;
}

- (id)denyListedMacOSDataclasses
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263EFAC90];
  v10[0] = *MEMORY[0x263EFAC20];
  v10[1] = v3;
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v10, 2);
  uint64_t v6 = objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_setByAddingObject_(v6, v7, *MEMORY[0x263EFACC8]);

    uint64_t v6 = (void *)v8;
  }
  return v6;
}

- (id)_filteredDataclassesForAccountClass:(id)a3
{
  id v5 = a3;
  if (objc_msgSend_isEqualToString_(v5, v6, *MEMORY[0x263F25618]))
  {
    v16 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"AADataclassManager.m", 198, @"AAAccountClassPrimary does not have filtered dataclasses. All dataclasses are valid");
  }
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263F25608]))
  {
    uint64_t v11 = objc_msgSend_allowListedDataclassesForAppleAccountClassBasic(self, v9, v10);
LABEL_7:
    v14 = (void *)v11;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x263F25610]))
  {
    uint64_t v11 = objc_msgSend_allowListedDataclassesForAppleAccountClassFull(self, v12, v13);
    goto LABEL_7;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)filteredServerProvidedFeatures:(id)a3 forAccount:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v10 = a4;
  if (!v10)
  {
    v35 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, self, @"AADataclassManager.m", 210, @"Invalid parameter not satisfying: %@", @"account");

    if (v7) {
      goto LABEL_3;
    }
LABEL_26:
    v37 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, self, @"AADataclassManager.m", 211, @"Invalid parameter not satisfying: %@", @"serverProvidedFeatures");

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_26;
  }
LABEL_3:
  uint64_t v11 = objc_msgSend_setWithSet_(MEMORY[0x263EFFA08], v8, (uint64_t)v7);
  v14 = objc_msgSend_mutableCopy(v11, v12, v13);

  uint64_t v15 = *MEMORY[0x263EFAD30];
  if ((objc_msgSend_containsObject_(v14, v16, *MEMORY[0x263EFAD30]) & 1) == 0
    && objc_msgSend_containsObject_(v14, v17, *MEMORY[0x263EFAD48])
    && (objc_msgSend_aa_isManagedAppleID(v10, v17, v18) & 1) == 0)
  {
    objc_msgSend_addObject_(v14, v17, v15);
  }
  v19 = objc_msgSend_aa_accountClass(v10, v17, v18);
  char isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x263F25608]);

  if ((isEqualToString & 1) == 0)
  {
    uint64_t v23 = *MEMORY[0x263EFAD00];
    if ((objc_msgSend_containsObject_(v14, v22, *MEMORY[0x263EFAD00]) & 1) == 0)
    {
      if (objc_msgSend_containsObject_(v14, v22, *MEMORY[0x263EFAD48])) {
        objc_msgSend_addObject_(v14, v22, v23);
      }
    }
  }
  v24 = objc_msgSend_setWithArray_(MEMORY[0x263EFF9C0], v22, MEMORY[0x263EFFA68]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v14;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v39, v43, 16);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          sub_24053A82C();
        }
        if (objc_msgSend_shouldProvisionDataclass_forAccount_(self, v32, v31, v10)) {
          objc_msgSend_addObject_(v24, v33, v31);
        }
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v33, (uint64_t)&v39, v43, 16);
    }
    while (v28);
  }

  return v24;
}

+ (AADataclassManager)sharedManager
{
  if (qword_268C87D70 != -1) {
    dispatch_once(&qword_268C87D70, &unk_26F49FC90);
  }
  uint64_t v2 = (void *)qword_268C87D68;
  return (AADataclassManager *)v2;
}

- (AADataclassManager)init
{
  uint64_t v4 = objc_msgSend_defaultStore(MEMORY[0x263EFB210], a2, v2);
  uint64_t v6 = (AADataclassManager *)objc_msgSend_initWithAccountStore_(self, v5, (uint64_t)v4);

  return v6;
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
    uint64_t v8 = (AAAccountStoreProxyProtocol *)objc_alloc_init(MEMORY[0x263F25760]);
    storeProxy = v7->_storeProxy;
    v7->_storeProxy = v8;
  }
  return v7;
}

+ (id)dataclassBundleMap
{
  if (qword_268C87D80 != -1) {
    dispatch_once(&qword_268C87D80, &unk_26F49FCB0);
  }
  uint64_t v2 = (void *)qword_268C87D78;
  return v2;
}

- (id)appBundleIdentifierForDataclass:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_dataclassBundleMap(AADataclassManager, v4, v5);
  uint64_t v8 = objc_msgSend_objectForKey_(v6, v7, (uint64_t)v3);

  return v8;
}

- (BOOL)_isRestrictedForDataclass:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x263EFAC20]);
  if (v6 && isEqualToString && !objc_msgSend_aa_isAccountClass_(v6, v9, *MEMORY[0x263F25618]))
  {
    BOOL v15 = 0;
  }
  else
  {
    if (qword_268C87D90 != -1) {
      dispatch_once(&qword_268C87D90, &unk_26F49FCD0);
    }
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_((void *)qword_268C87D88, v9, (uint64_t)v5);
    if (v12)
    {
      uint64_t v13 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v10, v11);
      BOOL v15 = objc_msgSend_BOOLRestrictionForFeature_(v13, v14, (uint64_t)v12) == 2;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (BOOL)policyRestrictsDataclass:(id)a3
{
  return MEMORY[0x270F9A6D0](AACloudPolicyRestrictions, sel_policyRestrictsDataclass_, a3);
}

- (BOOL)isSystemAppRestrictedOrRemovedForDataclass:(id)a3
{
  return objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(self, a2, (uint64_t)a3, 0);
}

- (BOOL)isSystemAppMCRestrictedOrRemovedForDataclass:(id)a3 forAccount:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend__isRestrictedForDataclass_account_(self, v7, (uint64_t)v6, a4))
  {
    uint64_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_240535000, v9, OS_LOG_TYPE_DEFAULT, "%@ is not available due to restrictions.", (uint8_t *)&v12, 0xCu);
    }

    char v10 = 1;
  }
  else
  {
    char v10 = objc_msgSend__appStatusRestrictsProvisioningForDataclass_(self, v8, (uint64_t)v6);
  }

  return v10;
}

- (BOOL)_appStatusRestrictsProvisioningForDataclass:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_appBundleIdentifierForDataclass_(self, v5, (uint64_t)v4);
  if (!v7)
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_24053A858();
    }
    goto LABEL_13;
  }
  uint64_t v8 = objc_msgSend_appStateForBundleID_(AAAppStateProvider, v6, (uint64_t)v7);
  if (objc_msgSend_isInstalled(v8, v9, v10))
  {
    if (objc_msgSend_isRestricted(v8, v11, v12))
    {
      id v13 = _AALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        uint64_t v14 = "%@ is not available with a restricted app.";
LABEL_11:
        _os_log_impl(&dword_240535000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
LABEL_13:
    BOOL v15 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend__hideDataclassWhenAppRemoved_(self, v11, (uint64_t)v4)) {
    goto LABEL_13;
  }
  id v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    uint64_t v14 = "%@ is not available when its app is removed.";
    goto LABEL_11;
  }
LABEL_12:

  BOOL v15 = 1;
LABEL_14:

  return v15;
}

- (BOOL)_hideDataclassWhenAppRemoved:(id)a3
{
  return objc_msgSend__shouldShowDataclassWhenAppIsRemoved_(self, a2, (uint64_t)a3) ^ 1;
}

- (BOOL)_shouldShowDataclassWhenAppIsRemoved:(id)a3
{
  uint64_t v3 = qword_268C87DA0;
  id v5 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_268C87DA0, &unk_26F49FCF0);
  }
  char v6 = objc_msgSend_containsObject_((void *)qword_268C87D98, v4, (uint64_t)v5);

  return v6;
}

- (BOOL)canAutoEnableDataclass:(id)a3 forAccount:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v39 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, @"AADataclassManager.m", 463, @"Invalid parameter not satisfying: %@", @"dataclass");

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v41 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, @"AADataclassManager.m", 464, @"Invalid parameter not satisfying: %@", @"account");

LABEL_3:
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v7;
    _os_log_impl(&dword_240535000, v12, OS_LOG_TYPE_DEFAULT, "Checking if we need to auto-enable: %@", buf, 0xCu);
  }

  if (!objc_msgSend_aa_isPrimaryEmailVerified(v11, v13, v14)) {
    goto LABEL_17;
  }
  int v17 = objc_msgSend__userVisibleDataclasses(self, v15, v16);
  if (objc_msgSend_containsObject_(v17, v18, (uint64_t)v7))
  {
  }
  else
  {
    v21 = objc_msgSend__nonVisibleServiceDataclass(self, v19, v20);
    int v23 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v7);

    if (!v23)
    {
LABEL_17:
      int v25 = 0;
      goto LABEL_18;
    }
  }
  if ((objc_msgSend__isRestrictedForDataclass_account_(self, v15, (uint64_t)v7, v11) & 1) != 0
    || objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFAC20])
    && (objc_msgSend_isRunningInStoreDemoMode(MEMORY[0x263F25918], v15, v24) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFAC78]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFACF8]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFACC0]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFAD28]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFACC8]) & 1) != 0)
  {
    goto LABEL_17;
  }
  uint64_t v30 = *MEMORY[0x263EFACB8];
  if (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x263EFACB8]))
  {
    v33 = objc_msgSend_sharedManager(AADataclassManager, v31, v32);
    int isSystemAppMCRestrictedOrRemovedForDataclass_forAccount = objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(v33, v34, v30, v11);

    int v25 = (objc_msgSend_aa_needsEmailConfiguration(v11, v36, v37) | isSystemAppMCRestrictedOrRemovedForDataclass_forAccount) ^ 1;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v7, v31, *MEMORY[0x263EFAC90])
      && objc_msgSend_isDeviceiPad(AADeviceModelHelper, v15, v16))
    {
      v38 = _AALogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240535000, v38, OS_LOG_TYPE_DEFAULT, "Health Dataclass. Setting auto-enable for iPad to false.", buf, 2u);
      }

      goto LABEL_17;
    }
    int v25 = 1;
  }
LABEL_18:
  if (objc_msgSend_aa_isManagedAppleID(v11, v15, v16))
  {
    if ((v25 & ~objc_msgSend_aa_serverDisabledDataclass_(v11, v26, (uint64_t)v7) & 1) == 0)
    {
LABEL_20:
      uint64_t v27 = _AALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v7;
        _os_log_impl(&dword_240535000, v27, OS_LOG_TYPE_DEFAULT, "Skipping auto-enable for %@", buf, 0xCu);
      }
      BOOL v28 = 0;
      goto LABEL_27;
    }
  }
  else if (!v25)
  {
    goto LABEL_20;
  }
  uint64_t v27 = _AALogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v7;
    _os_log_impl(&dword_240535000, v27, OS_LOG_TYPE_DEFAULT, "Auto-enabling dataclass: %@", buf, 0xCu);
  }
  BOOL v28 = 1;
LABEL_27:

  return v28;
}

- (BOOL)shouldProvisionDataclass:(id)a3 forAccount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = v8;
  if (!v7)
  {
    BOOL v28 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"AADataclassManager.m", 520, @"Invalid parameter not satisfying: %@", @"dataclass");

    if (v11) {
      goto LABEL_3;
    }
LABEL_22:
    uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, self, @"AADataclassManager.m", 521, @"Invalid parameter not satisfying: %@", @"account");

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_22;
  }
LABEL_3:
  if ((objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(self, v9, (uint64_t)v7, v11) & 1) == 0
    && (!objc_msgSend_isEqualToString_(v7, v12, *MEMORY[0x263EFACD0])
     || objc_msgSend_isMomentsDataclassEnabled(MEMORY[0x263F25918], v13, v14)
     && objc_msgSend_isDeviceiPhone(AADeviceModelHelper, v15, v16)))
  {
    int v17 = objc_msgSend_aa_accountClass(v11, v13, v14);
    if (objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x263F25618]))
    {
      BOOL v20 = 1;
LABEL_19:

      goto LABEL_20;
    }
    v21 = objc_msgSend__filteredDataclassesForAccountClass_(self, v19, (uint64_t)v17);
    if (objc_msgSend_containsObject_(v21, v22, (uint64_t)v7))
    {
      if (objc_msgSend_isEqualToString_(v7, v23, *MEMORY[0x263EFACE8]))
      {
        char shouldProvisionNotesForAccount = objc_msgSend__shouldProvisionNotesForAccount_(self, v24, (uint64_t)v11);
      }
      else
      {
        if (!objc_msgSend_isEqualToString_(v7, v24, *MEMORY[0x263EFAD08]))
        {
          BOOL v20 = 1;
          goto LABEL_18;
        }
        char shouldProvisionNotesForAccount = objc_msgSend__shouldProvisionRemindersForAccount_(self, v26, (uint64_t)v11);
      }
      BOOL v20 = shouldProvisionNotesForAccount;
    }
    else
    {
      BOOL v20 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  BOOL v20 = 0;
LABEL_20:

  return v20;
}

- (BOOL)_shouldProvisionNotesForAccount:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    BOOL v20 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"AADataclassManager.m", 578, @"Invalid parameter not satisfying: %@", @"account");
  }
  id v8 = objc_msgSend_aa_accountClass(v7, v5, v6);
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x263F25618]))
  {

LABEL_10:
    BOOL v18 = 1;
    goto LABEL_11;
  }
  uint64_t v12 = objc_msgSend_aa_accountClass(v7, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x263F25610]);

  if ((isEqualToString & 1) != 0 || !objc_msgSend_aa_isNotesMigrated(v7, v15, v16)) {
    goto LABEL_10;
  }
  int v17 = _AALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_24053A8C0();
  }

  BOOL v18 = 0;
LABEL_11:

  return v18;
}

- (BOOL)_shouldProvisionRemindersForAccount:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    BOOL v20 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"AADataclassManager.m", 596, @"Invalid parameter not satisfying: %@", @"account");
  }
  id v8 = objc_msgSend_aa_accountClass(v7, v5, v6);
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x263F25618]))
  {

LABEL_10:
    BOOL v18 = 1;
    goto LABEL_11;
  }
  uint64_t v12 = objc_msgSend_aa_accountClass(v7, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x263F25610]);

  if ((isEqualToString & 1) != 0 || !objc_msgSend_aa_isRemindersMigrated(v7, v15, v16)) {
    goto LABEL_10;
  }
  int v17 = _AALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_24053A928();
  }

  BOOL v18 = 0;
LABEL_11:

  return v18;
}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_msgSend_filterDataclassesForPossibleAutoEnablementForAccount_(self, v8, (uint64_t)v6);
  if (objc_msgSend_count(v9, v10, v11))
  {
    objc_msgSend_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion_(self, v12, (uint64_t)v9, v6, v7);
  }
  else
  {
    id v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[AADataclassManager enableDataclassesWithoutLocalDataDataclassActionsForAccount:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_240535000, v13, OS_LOG_TYPE_DEFAULT, "%s - There are no auto-enableable dataclasses for account %@. Proceeding with save.", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    int v23 = sub_2405394DC;
    uint64_t v24 = sub_2405394EC;
    id v25 = (id)os_transaction_create();
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    BOOL v18 = sub_2405394F4;
    uint64_t v19 = &unk_2650BF7F0;
    id v20 = v7;
    v21 = buf;
    uint64_t v14 = (void *)MEMORY[0x2455EAC00](&v16);
    objc_msgSend_saveAccount_onAccountStore_withCompletionHandler_(self->_storeProxy, v15, (uint64_t)v6, self->_store, v14, v16, v17, v18, v19);

    _Block_object_dispose(buf, 8);
  }
}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:(id)a3 fromAccount:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    id v20 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"AADataclassManager.m", 638, @"Invalid parameter not satisfying: %@", @"account");

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  BOOL v18 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v11, v12);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"AADataclassManager.m", 637, @"Invalid parameter not satisfying: %@", @"dataclasses");

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v11, v12);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"AADataclassManager.m", 639, @"Invalid parameter not satisfying: %@", @"completion");

LABEL_4:
  uint64_t v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl(&dword_240535000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to auto-enable dataclasses for account (%@): %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_240539884;
  v24[3] = &unk_2650BF840;
  objc_copyWeak(&v27, (id *)buf);
  id v15 = v13;
  id v26 = v15;
  v24[4] = self;
  id v16 = v10;
  id v25 = v16;
  objc_msgSend__buildAutoEnableableDataclassesAndActionsForAccount_dataclassesForEnablement_completion_(self, v17, (uint64_t)v16, v9, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)_buildAutoEnableableDataclassesAndActionsForAccount:(id)a3 dataclassesForEnablement:(id)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  uint64_t v45 = objc_msgSend_mutableCopy(v9, v11, v12);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v13 = v9;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v55, v61, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v56;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v56 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_setEnabled_forDataclass_(v8, v16, 1, *(void *)(*((void *)&v55 + 1) + 8 * v19++), v45);
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v55, v61, 16);
    }
    while (v17);
  }

  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int isPrimaryEmailVerified = objc_msgSend_aa_isPrimaryEmailVerified(v8, v21, v22);
  store = self->_store;
  id v54 = 0;
  id v26 = objc_msgSend_dataclassActionsForAccountSave_error_(store, v25, (uint64_t)v8, &v54);
  id v27 = v54;
  __int16 v30 = v27;
  if (v26)
  {
    id v31 = _AALogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v26;
      _os_log_impl(&dword_240535000, v31, OS_LOG_TYPE_DEFAULT, "We have potential dataclass actions: %@", buf, 0xCu);
    }

    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v46 = MEMORY[0x263EF8330];
    uint64_t v47 = 3221225472;
    v48 = sub_24053A07C;
    v49 = &unk_2650BF868;
    v50 = self;
    id v51 = v32;
    v33 = v45;
    id v52 = v45;
    id v53 = v8;
    id v34 = v32;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v35, (uint64_t)&v46);
    v38 = objc_msgSend_copy(v34, v36, v37);
    objc_msgSend_setObject_forKeyedSubscript_(v20, v39, (uint64_t)v38, @"dataclassActions");

    goto LABEL_12;
  }
  v33 = v45;
  if (!v27)
  {
LABEL_12:
    if (isPrimaryEmailVerified != objc_msgSend_aa_isPrimaryEmailVerified(v8, v28, v29, v45, v46, v47, v48, v49, v50))objc_msgSend_aa_setPrimaryEmailVerified_(v8, v40, 1); {
    long long v42 = objc_msgSend_copy(v33, v40, v41);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v20, v43, (uint64_t)v42, @"dataclasses");

    v10[2](v10, v20, 0);
    goto LABEL_19;
  }
  id v44 = _AALogSystem();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    sub_24053AB0C();
  }

  ((void (**)(id, id, void *))v10)[2](v10, 0, v30);
LABEL_19:
}

- (BOOL)isDataclassActionSafeForAutoEnablement:(id)a3
{
  return MEMORY[0x270F9A6D0](a3, sel_isSafeForAutoEnablement, a3);
}

- (id)filterDataclassesForPossibleAutoEnablementForAccount:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_provisionedDataclasses(v3, v4, v5);
  id v9 = objc_msgSend_allObjects(v6, v7, v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_24053A384;
  v14[3] = &unk_2650BF720;
  id v15 = v3;
  id v10 = v3;
  uint64_t v12 = objc_msgSend_aaf_filter_(v9, v11, (uint64_t)v14);

  return v12;
}

- (BOOL)_shouldVerifyAccountSave
{
  if (!objc_msgSend_deviceIsAudioAccessory(MEMORY[0x263F202D8], a2, v2)) {
    return 1;
  }
  uint64_t v5 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v3, v4);
  uint64_t v8 = objc_msgSend_bundleIdentifier(v5, v6, v7);
  int isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"com.apple.HPSetup");

  if (!isEqualToString) {
    return 1;
  }
  uint64_t v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_24053AB74(v11);
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

@end
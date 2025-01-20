@interface CNFRegController
+ (id)controllerForServiceType:(int64_t)a3;
- (BOOL)__ensureSingleAppleIDAccountExistsWithLogin:(id)a3;
- (BOOL)_accountHasValidatedLocale:(id)a3;
- (BOOL)_accountIsAuthenticated:(id)a3;
- (BOOL)_addAliases:(id)a3 toAccount:(id)a4 validate:(BOOL)a5;
- (BOOL)_aliasIsDevicePhoneNumber:(id)a3;
- (BOOL)_aliasIsTemporaryDeviceAlias:(id)a3;
- (BOOL)_isValidCallerIDAlias:(id)a3 forAccount:(id)a4;
- (BOOL)_shouldFilterOutAlias:(id)a3 onAccount:(id)a4;
- (BOOL)accountIsAuthenticating;
- (BOOL)addAlias:(id)a3;
- (BOOL)addAlias:(id)a3 toAccount:(id)a4;
- (BOOL)canRemoveAlias:(id)a3;
- (BOOL)deviceCanTakeNetworkAction;
- (BOOL)deviceHasSaneNetworkConnection;
- (BOOL)hasAlias:(id)a3;
- (BOOL)hasAliasNamed:(id)a3;
- (BOOL)hasFailedLogin;
- (BOOL)hasFailedLoginDueToBadLogin;
- (BOOL)hasSystemAccount;
- (BOOL)iMessageAccountMatchesiCloudAccount:(id)a3;
- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser;
- (BOOL)isConnected;
- (BOOL)isServiceEnabled;
- (BOOL)isServiceSupported;
- (BOOL)removeAlias:(id)a3 fromAccount:(id)a4;
- (BOOL)serviceSupportsDeviceAliasEnablement;
- (BOOL)setAliases:(id)a3 onAccount:(id)a4;
- (BOOL)setDisplayAlias:(id)a3;
- (BOOL)shouldHandleAccountNotification:(id)a3;
- (BOOL)shouldShowAlertForError:(id)a3;
- (BOOL)unvalidateAlias:(id)a3;
- (BOOL)validateAlias:(id)a3;
- (CNFRegController)init;
- (CNFRegController)initWithServiceType:(int64_t)a3;
- (IDSPhoneSubscriptionSelector)phoneSubscriptionSelector;
- (IMAccount)systemAccount;
- (IMServiceImpl)firstService;
- (NSArray)_temporaryDeviceAliases;
- (NSArray)accounts;
- (NSArray)aliases;
- (NSArray)allAvailableAliases;
- (NSArray)appleIDAccounts;
- (NSArray)emailAliases;
- (NSArray)failedAccounts;
- (NSArray)phoneAccounts;
- (NSArray)services;
- (NSArray)useableAliases;
- (NSArray)vettedAliases;
- (NSDictionary)cachedCallerIDMap;
- (NSSet)serviceNames;
- (id)__filter_activeAccountsPredicate;
- (id)__filter_appleIDAccountPredicate;
- (id)__filter_failedAccountsPredicate;
- (id)__filter_inactiveAccountsPredicate;
- (id)__filter_operationalPredicate;
- (id)__filter_phoneAccountPredicate;
- (id)__filter_signInCompletePredicate;
- (id)__filter_signedInPredicate;
- (id)__filter_validatedAliasPredicate;
- (id)__filter_validatedProfilePredicate;
- (id)_accountForAlias:(id)a3 accounts:(id)a4;
- (id)_accountsPassingTests:(id)a3 message:(id)a4;
- (id)_aliasComparator;
- (id)_aliasesForAccount:(id)a3;
- (id)_aliasesFromAccounts:(id)a3 passingTest:(id)a4;
- (id)_aliasesPassingTest:(id)a3;
- (id)_allAvailableAliasesForAccount:(id)a3;
- (id)_createAccountWithLogin:(id)a3 foundExisting:(BOOL *)a4;
- (id)_guessedDisplayAliasFromAccounts:(id)a3;
- (id)_logName;
- (id)_logSpace;
- (id)_predicatesWithFilter:(int64_t)a3;
- (id)_vettedAliasesForAccount:(id)a3;
- (id)accountActivationChangedBlock;
- (id)accountAddedBlock;
- (id)accountAuthorizationChangedBlock;
- (id)accountForAlias:(id)a3;
- (id)accountRegistrationBlock;
- (id)accountRemovedBlock;
- (id)accountWithLogin:(id)a3;
- (id)accountsWithFilter:(int64_t)a3;
- (id)accountsWithFilter:(int64_t)a3 message:(id)a4;
- (id)activeAccounts;
- (id)aliasAddedBlock;
- (id)aliasNamed:(id)a3;
- (id)aliasRemovedBlock;
- (id)aliasStatusChangedBlock;
- (id)aliasSummaryString:(BOOL *)a3;
- (id)aliasesForAccounts:(id)a3;
- (id)allAvailableAliasesForAccounts:(id)a3;
- (id)beginAccountSetupWithAccount:(id)a3;
- (id)beginAccountSetupWithLogin:(id)a3 authID:(id)a4 authToken:(id)a5 regionInfo:(id)a6 foundExisting:(BOOL *)a7;
- (id)beginAccountSetupWithLogin:(id)a3 password:(id)a4 foundExisting:(BOOL *)a5;
- (id)callerIdChangedBlock;
- (id)displayAccount;
- (id)displayAlias;
- (id)firstAccount;
- (id)guessedAccountName;
- (id)guessedAlias;
- (id)guessedDisplayAlias;
- (id)localPhoneNumberSentinelAlias;
- (id)loginForAccount:(id)a3;
- (id)networkSettingsURLAllowingCellular:(BOOL)a3;
- (id)profileChangedBlock;
- (id)profileStatusChangedBlock;
- (id)resetBlock;
- (id)serviceDidBecomeUnsupportedBlock;
- (id)usableDeviceAliases;
- (id)useableAliasesForAccounts:(id)a3;
- (id)vettedAliasesChangedBlock;
- (id)vettedAliasesForAccounts:(id)a3;
- (id)willLaunchURLBlock;
- (int64_t)_phoneSubscriptionSlotMatchingLabel:(id)a3;
- (int64_t)_phoneSubscriptionSlotMatchingPhoneNumber:(id)a3;
- (int64_t)serviceType;
- (int64_t)systemAccountType;
- (unint64_t)accountState;
- (unint64_t)accountState:(id)a3;
- (unint64_t)accountStateForAccount:(id)a3;
- (void)__updateSystemAccount;
- (void)_clearAccountCache;
- (void)_clearCachedTemporaryDeviceAliases;
- (void)_clearFilterCache;
- (void)_decrementLogIndent;
- (void)_handleCallerIDChanged;
- (void)_handleCallerIDChangedForResume:(id)a3;
- (void)_incrementLogIndent;
- (void)_postCallerIDChanged;
- (void)_purgeExcessAccounts;
- (void)_showNetworkAlertWithMessage:(id)a3 andViewController:(id)a4;
- (void)_signOutAccount:(id)a3;
- (void)_startListeningForCallerIDChanges;
- (void)_startWiFiAlertWatchTimer;
- (void)_stopListeningForCallerIDChanges;
- (void)_stopWiFiAlertWatchTimer;
- (void)_wifiAlertWatchTimerFired:(id)a3;
- (void)accountActivationStateChanged:(id)a3;
- (void)accountAdded:(id)a3;
- (void)accountRegistrationChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)activateAccounts;
- (void)activateAccountsExcludingAccounts:(id)a3;
- (void)addDeviceAlias:(id)a3;
- (void)aliasStatusChanged:(id)a3;
- (void)aliasesChanged:(id)a3;
- (void)authorizationCredentialsChanged:(id)a3;
- (void)callerIdChanged:(id)a3;
- (void)clearAllCaches;
- (void)connect;
- (void)connect:(BOOL)a3;
- (void)deactivateAccounts;
- (void)dealloc;
- (void)deviceCapabilityChanged:(id)a3;
- (void)disableDeviceAlias:(id)a3;
- (void)enablePhoneNumberRegistration;
- (void)handleAliasAdded:(id)a3;
- (void)handleAliasRemoved:(id)a3;
- (void)nukeAllCallerIDSettings;
- (void)openURL:(id)a3;
- (void)profileChanged:(id)a3;
- (void)profileValidationStateChanged:(id)a3;
- (void)refreshSystemAccount;
- (void)removeAllHandlers;
- (void)removeDeviceAlias:(id)a3;
- (void)resetNetworkFirstRunAlert;
- (void)setAccountActivationChangedBlock:(id)a3;
- (void)setAccountAddedBlock:(id)a3;
- (void)setAccountAuthorizationChangedBlock:(id)a3;
- (void)setAccountRegistrationBlock:(id)a3;
- (void)setAccountRemovedBlock:(id)a3;
- (void)setAliasAddedBlock:(id)a3;
- (void)setAliasRemovedBlock:(id)a3;
- (void)setAliasStatusChangedBlock:(id)a3;
- (void)setCallerIdChangedBlock:(id)a3;
- (void)setPhoneSubscriptionSelector:(id)a3;
- (void)setProfileChangedBlock:(id)a3;
- (void)setProfileStatusChangedBlock:(id)a3;
- (void)setResetBlock:(id)a3;
- (void)setServiceDidBecomeUnsupportedBlock:(id)a3;
- (void)setServiceEnabled:(BOOL)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setServices:(id)a3;
- (void)setVettedAliasesChangedBlock:(id)a3;
- (void)setWillLaunchURLBlock:(id)a3;
- (void)set_temporaryDeviceAliases:(id)a3;
- (void)showNetworkAlert:(id)a3;
- (void)showNetworkAlertIfNecessary:(id)a3;
- (void)showNetworkFirstRunAlert:(id)a3;
- (void)showSetupFaceTimeOverCellularAlertForServiceProviderName:(id)a3 serviceProviderPhoneNumber:(id)a4 serviceProviderURL:(id)a5 completion:(id)a6;
- (void)showSetupFaceTimeOverCellularAlertWithCompletion:(id)a3;
- (void)startListeningForAccountChanges;
- (void)startRequiringWifi;
- (void)stopListeningForAccountChanges;
- (void)stopRequiringWifi;
- (void)vettedAliasesChanged:(id)a3;
@end

@implementation CNFRegController

+ (id)controllerForServiceType:(int64_t)a3
{
  v5 = FTCServiceNameForServiceType();
  v6 = v5;
  if (v5 && [v5 length])
  {
    v7 = (void *)controllerForServiceType__serviceMap;
    if (!controllerForServiceType__serviceMap)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v9 = (void *)controllerForServiceType__serviceMap;
      controllerForServiceType__serviceMap = (uint64_t)v8;

      v7 = (void *)controllerForServiceType__serviceMap;
    }
    v10 = [v7 objectForKey:v6];
    if (!v10)
    {
      v10 = (void *)[objc_alloc((Class)a1) initWithServiceType:a3];
      [(id)controllerForServiceType__serviceMap setObject:v10 forKey:v6];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CNFRegController)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CNFRegController.m" lineNumber:103 description:@"Do not call init directly. Call +controllerForServices: instead"];

  return 0;
}

- (CNFRegController)initWithServiceType:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)CNFRegController;
  v22 = [(CNFRegController *)&v27 init];
  if (v22)
  {
    v4 = [MEMORY[0x263F4A868] sharedInstance];
    [v4 addListener:v22];

    v22->_systemAccountType = -1;
    [(CNFRegController *)v22 setServiceType:a3];
    [(CNFRegController *)v22 _purgeExcessAccounts];
    v21 = FTCServiceNameForServiceType();
    v20 = [NSString stringWithFormat:@"%@RegController", v21];
    v5 = [MEMORY[0x263F4A568] sharedInstance];
    [v5 addListenerID:v20 capabilities:*MEMORY[0x263F4A888]];

    v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    v19 = [MEMORY[0x263F4A610] serviceWithInternalName:v21];
    if (v19)
    {
      objc_msgSend(v6, "addObject:");
    }
    else
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v30 = (int64_t)v21;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Error loading service with name : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v30 = a3;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Initializing with service type: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          int64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v14 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v30 = v13;
            _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "  => Service: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
            IMLogString();
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    [(CNFRegController *)v22 setServices:v9];
    id v15 = [(CNFRegController *)v22 accounts];
    [(CNFRegController *)v22 connect];
    [(CNFRegController *)v22 _startListeningForCallerIDChanges];
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.conference.regcontroller.springboardnetworkflags", 0);
    springboardNetworkFlagQueue = v22->_springboardNetworkFlagQueue;
    v22->_springboardNetworkFlagQueue = (OS_dispatch_queue *)v16;
  }
  return v22;
}

- (IMServiceImpl)firstService
{
  v3 = [(CNFRegController *)self services];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(CNFRegController *)self services];
    v6 = [v5 objectAtIndex:0];
  }
  else
  {
    v6 = 0;
  }
  return (IMServiceImpl *)v6;
}

- (NSSet)serviceNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(CNFRegController *)self services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) internalName];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)dealloc
{
  [(CNFRegController *)self _stopWiFiAlertWatchTimer];
  v3 = [MEMORY[0x263F4A868] sharedInstance];
  [v3 removeListener:self];

  [(CNFRegController *)self stopListeningForAccountChanges];
  [(CNFRegController *)self _stopListeningForCallerIDChanges];
  v4.receiver = self;
  v4.super_class = (Class)CNFRegController;
  [(CNFRegController *)&v4 dealloc];
}

- (IDSPhoneSubscriptionSelector)phoneSubscriptionSelector
{
  phoneSubscriptionSelector = self->_phoneSubscriptionSelector;
  if (!phoneSubscriptionSelector)
  {
    objc_super v4 = (IDSPhoneSubscriptionSelector *)objc_alloc_init(MEMORY[0x263F4A080]);
    uint64_t v5 = self->_phoneSubscriptionSelector;
    self->_phoneSubscriptionSelector = v4;

    phoneSubscriptionSelector = self->_phoneSubscriptionSelector;
  }
  return phoneSubscriptionSelector;
}

- (NSArray)accounts
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  accounts = self->_accounts;
  if (!accounts)
  {
    long long v24 = self;
    objc_super v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(CNFRegController *)self firstService];
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v5;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Reloading the account list for service: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v22 = [(CNFRegController *)v24 firstService];
      IMLogString();
    }
    CNFRegLogIndent();
    uint64_t v6 = [MEMORY[0x263F4A520] sharedInstance];
    uint64_t v7 = [(CNFRegController *)v24 firstService];
    long long v23 = [v6 accountsForService:v7];

    if ([v23 count])
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v23;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            long long v14 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = CNFRegStringForAccount(v13);
              *(_DWORD *)buf = 138412290;
              uint64_t v31 = v15;
              _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Found account: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              v22 = CNFRegStringForAccount(v13);
              IMLogString();
            }
            uint64_t v16 = objc_msgSend(v13, "uniqueID", v22);
            char v17 = [v16 isEqualToString:@"PlaceholderAccount"];

            if ((v17 & 1) == 0) {
              [v8 addObject:v13];
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      uint64_t v18 = [v8 copy];
      v19 = v24->_accounts;
      v24->_accounts = (NSArray *)v18;
    }
    else
    {
      v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_DEFAULT, "Could not find any accounts to use", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    CNFRegLogOutdent();

    accounts = v24->_accounts;
  }
  return accounts;
}

- (id)firstAccount
{
  v2 = [(CNFRegController *)self accounts];
  v3 = v2;
  if (v2 && [v2 count])
  {
    objc_super v4 = [v3 objectAtIndex:0];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)accountWithLogin:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(CNFRegController *)self accounts];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v12 = [(CNFRegController *)self loginForAccount:v11];
          int v13 = [v12 isEqualToString:v5];

          if (v13)
          {
            id v14 = v11;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_14:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)_purgeExcessAccounts
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  int64_t v2 = [(CNFRegController *)self serviceType];
  if (v2)
  {
    if (v2 != 1) {
      return;
    }
    long long v27 = [MEMORY[0x263F4A608] iMessageService];
  }
  else
  {
    long long v27 = [MEMORY[0x263F4A608] facetimeService];
  }
  if (v27)
  {
    v29 = [MEMORY[0x263F4A520] sharedInstance];
    v3 = [v29 accountsForService:v27];
    id v4 = (void *)[v3 mutableCopy];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    int64_t v30 = v4;
    uint64_t v5 = (void *)[v4 copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v9 accountType] == 2) {
            [v30 removeObject:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v6);
    }

    if ((unint64_t)[v30 count] < 2) {
      goto LABEL_50;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = v30;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (!v11)
    {

      goto LABEL_32;
    }
    long long v12 = 0;
    long long v28 = 0;
    int v13 = 0;
    uint64_t v14 = *(void *)v36;
LABEL_18:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(v10);
      }
      long long v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
      if ([v16 isOperational]) {
        break;
      }
      if ([v16 isRegistered])
      {
        long long v17 = v28;
        long long v18 = v12;
        long long v28 = v16;
        goto LABEL_26;
      }
      long long v17 = v12;
      long long v18 = v16;
      if ([v16 isActive]) {
        goto LABEL_26;
      }
LABEL_27:
      if (v11 == ++v15)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v46 count:16];
        if (!v11)
        {

          if (v13)
          {
            [v10 removeObject:v13];
            goto LABEL_37;
          }
          if (v28)
          {
            objc_msgSend(v10, "removeObject:");
            int v13 = 0;
            goto LABEL_37;
          }
          if (v12)
          {
            [v10 removeObject:v12];
            int v13 = 0;
            long long v28 = 0;
LABEL_37:
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v20 = v10;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v45 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v32 != v22) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * j);
                  long long v25 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v44 = v24;
                    _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, "Deleting excess account: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (IMShouldLog())
                    {
                      uint64_t v26 = v24;
                      IMLogString();
                    }
                  }
                  objc_msgSend(v29, "deleteAccount:", v24, v26);
                }
                uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v45 count:16];
              }
              while (v21);
            }

LABEL_50:
            return;
          }
LABEL_32:
          [v10 removeObjectAtIndex:0];
          int v13 = 0;
          long long v28 = 0;
          long long v12 = 0;
          goto LABEL_37;
        }
        goto LABEL_18;
      }
    }
    long long v17 = v13;
    long long v18 = v12;
    int v13 = v16;
LABEL_26:
    id v19 = v16;

    long long v12 = v18;
    goto LABEL_27;
  }
}

- (BOOL)__ensureSingleAppleIDAccountExistsWithLogin:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v22 = self;
    uint64_t v5 = [(CNFRegController *)self appleIDAccounts];
    uint64_t v6 = (void *)[v5 copy];

    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [v6 count];
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Checking for extra Apple ID accounts, found %lu total", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v21 = (void *)[v6 count];
      IMLogString();
    }
    CNFRegLogIndent();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    char v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "login", v21);
          char v15 = [v14 isEqualToIgnoringCase:v4];

          if (v15)
          {
            long long v16 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              long long v17 = CNFRegStringForAccount(v13);
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = (uint64_t)v17;
              _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "Not nuking account because of matching login: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              uint64_t v21 = CNFRegStringForAccount(v13);
              IMLogString();
            }
            char v9 = 1;
          }
          else
          {
            long long v18 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = CNFRegStringForAccount(v13);
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = (uint64_t)v19;
              _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Nuking non-matching account: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              uint64_t v21 = CNFRegStringForAccount(v13);
              IMLogString();
            }
            -[CNFRegController _signOutAccount:](v22, "_signOutAccount:", v13, v21);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    CNFRegLogOutdent();
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (id)_createAccountWithLogin:(id)a3 foundExisting:(BOOL *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && [v6 length])
  {
    if (![(CNFRegController *)self isConnected]) {
      [(CNFRegController *)self connect:1];
    }
    long long v37 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v8 = [v7 stringByTrimmingCharactersInSet:v37];
    char v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = (uint64_t)v8;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Creating account with login: '%@'", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v35 = v8;
      IMLogString();
    }
    CNFRegLogIndent();
    if ([v8 length])
    {
      uint64_t v36 = IMGenerateLoginID();

      uint64_t v10 = [(CNFRegController *)self accounts];
      uint64_t v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v44 = v12;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Checking %lu existing accounts for duplicates", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        long long v35 = (void *)[v10 count];
        IMLogString();
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v39;
LABEL_18:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
          long long v18 = objc_msgSend(v17, "login", v35);
          id v19 = MEMORY[0x223C3A250]();

          if ([v7 isEqualToString:v19]) {
            break;
          }

          if (v14 == ++v16)
          {
            uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
            if (v14) {
              goto LABEL_18;
            }
            goto LABEL_24;
          }
        }
        uint64_t v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          long long v23 = CNFRegStringForAccount(v17);
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = (uint64_t)v23;
          _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_DEFAULT, "Re-activating previously dormant account: %@", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          long long v35 = CNFRegStringForAccount(v17);
          IMLogString();
        }
        id v24 = v17;

        BOOL v20 = 1;
        if (v24) {
          goto LABEL_55;
        }
      }
      else
      {
LABEL_24:

        BOOL v20 = 0;
      }
      long long v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, "No existing accounts found. Creating.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      CNFRegLogIndent();
      id v26 = objc_alloc(MEMORY[0x263F4A518]);
      long long v27 = [(CNFRegController *)self firstService];
      id v24 = (id)[v26 initWithService:v27];

      [v24 setLogin:v36];
      [v24 setAutoLogin:1];
      long long v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = CNFRegStringForAccount(v24);
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = (uint64_t)v29;
        _os_log_impl(&dword_21ED18000, v28, OS_LOG_TYPE_DEFAULT, "Created account: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        long long v35 = CNFRegStringForAccount(v24);
        IMLogString();
      }
      uint64_t v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v30, OS_LOG_TYPE_DEFAULT, "Adding account to controller", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      long long v31 = objc_msgSend(MEMORY[0x263F4A520], "sharedInstance", v35);
      char v32 = [v31 addAccount:v24];

      if ((v32 & 1) == 0)
      {
        CNFRegLogIndent();
        long long v33 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v33, OS_LOG_TYPE_DEFAULT, "WARNING: Failed to add account to controller", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }

        CNFRegLogOutdent();
        id v24 = 0;
      }
      CNFRegLogOutdent();
LABEL_55:
      if (a4) {
        *a4 = v20;
      }
      -[CNFRegController __ensureSingleAppleIDAccountExistsWithLogin:](self, "__ensureSingleAppleIDAccountExistsWithLogin:", v36, v35);
      [v24 removeObjectForKey:@"AccountSignedOut"];
      [v24 writeSettings];
      CNFRegLogOutdent();
      id v21 = v24;

      id v8 = (void *)v36;
    }
    else
    {
      CNFRegLogOutdent();
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)beginAccountSetupWithLogin:(id)a3 authID:(id)a4 authToken:(id)a5 regionInfo:(id)a6 foundExisting:(BOOL *)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12) {
    goto LABEL_17;
  }
  uint64_t v16 = [v12 length];
  long long v17 = 0;
  if (!v13) {
    goto LABEL_18;
  }
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v18 = [v13 length];
  long long v17 = 0;
  if (!v14 || !v18) {
    goto LABEL_18;
  }
  if (![v14 length])
  {
LABEL_17:
    long long v17 = 0;
    goto LABEL_18;
  }
  long long v17 = [(CNFRegController *)self _createAccountWithLogin:v12 foundExisting:a7];
  CNFRegLogIndent();
  if (v17)
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [v17 login];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      id v30 = v14;
      _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "Setting auth token (authID:'%@'   account:'%@'): %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v24 = [v17 login];
      id v25 = v14;
      id v23 = v13;
      IMLogString();
    }
    objc_msgSend(v17, "updateAuthorizationCredentials:token:", v13, v14, v23, v24, v25);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v30) = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __89__CNFRegController_beginAccountSetupWithLogin_authID_authToken_regionInfo_foundExisting___block_invoke;
    v26[3] = &unk_2644F07E0;
    long long v28 = buf;
    id v21 = v17;
    id v27 = v21;
    [v15 enumerateKeysAndObjectsUsingBlock:v26];
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      [v21 writeSettings];
    }
    [(CNFRegController *)self activateAccounts];

    _Block_object_dispose(buf, 8);
  }
  CNFRegLogOutdent();
LABEL_18:

  return v17;
}

uint64_t __89__CNFRegController_beginAccountSetupWithLogin_authID_authToken_regionInfo_foundExisting___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) setProfileValue:a3 forKey:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

- (id)beginAccountSetupWithLogin:(id)a3 password:(id)a4 foundExisting:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v10 = [v8 length];
  uint64_t v11 = 0;
  if (!v9 || !v10) {
    goto LABEL_14;
  }
  if (![v9 length])
  {
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [(CNFRegController *)self _createAccountWithLogin:v8 foundExisting:a5];
  CNFRegLogIndent();
  if (v11)
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Clearing auth credentials prior to setting password", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [v11 updateAuthorizationCredentials:0 token:0];
    [v11 setTemporaryPassword:v9];
    id v13 = [MEMORY[0x263F4A520] sharedInstance];
    [v13 activateAccount:v11];

    [v11 authenticateAccount];
    id v14 = [MEMORY[0x263EFFA08] setWithObject:v11];
    [(CNFRegController *)self activateAccountsExcludingAccounts:v14];
  }
  CNFRegLogOutdent();
LABEL_14:

  return v11;
}

- (id)beginAccountSetupWithAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Setting up account: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v13 = v4;
      IMLogString();
    }
    objc_msgSend(v4, "setAutoLogin:", 1, v13);
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Adding account to controller", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    uint64_t v7 = [MEMORY[0x263F4A520] sharedInstance];
    char v8 = [v7 addAccount:v4];

    id v9 = v4;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: Failed to add account to controller", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }

      id v9 = 0;
    }
    uint64_t v11 = [v9 login];
    [(CNFRegController *)self __ensureSingleAppleIDAccountExistsWithLogin:v11];

    [v9 removeObjectForKey:@"AccountSignedOut"];
    [v9 writeSettings];
    [(CNFRegController *)self activateAccounts];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_signOutAccount:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = CNFRegStringForAccount(v4);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v6;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Signing out account: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    BOOL v20 = CNFRegStringForAccount(v4);
    IMLogString();
  }
  CNFRegLogIndent();
  if (v4)
  {
    *(unsigned char *)&self->_controllerFlags |= 0x40u;
    [(CNFRegController *)self clearAllCaches];
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering account", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    objc_msgSend(v4, "unregisterAccount", v20);
    [v4 setBool:1 forKey:@"AccountSignedOut"];
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    id v9 = [v4 aliases];
    uint64_t v10 = (void *)[v8 initWithArray:v9];

    if ([v4 accountType] == 1)
    {
      uint64_t v11 = (void *)*MEMORY[0x263F4A8D8];
      id v12 = [(id)*MEMORY[0x263F4A8D8] lowercaseString];
      char v13 = [v10 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        id v14 = [v11 lowercaseString];
        [v10 addObject:v14];
      }
    }
    [v4 removeAliases:v10];
    [v4 writeSettings];
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Deactivating account", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    uint64_t v16 = [MEMORY[0x263F4A520] sharedInstance];
    [v16 deactivateAccount:v4];

    long long v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "Clearing auth credentials", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [v4 updateAuthorizationCredentials:0 token:0];
    uint64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Deleting account", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    id v19 = [MEMORY[0x263F4A520] sharedInstance];
    [v19 deleteAccount:v4];

    *(unsigned char *)&self->_controllerFlags &= ~0x40u;
  }
  CNFRegLogOutdent();
}

- (id)loginForAccount:(id)a3
{
  if (a3)
  {
    v3 = [a3 login];
    id v4 = MEMORY[0x223C3A250]();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_clearAccountCache
{
  self->_accounts = 0;
  MEMORY[0x270F9A758]();
}

- (void)clearAllCaches
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Clearing all caches", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogIndent();
  [(CNFRegController *)self _clearAccountCache];
  [(CNFRegController *)self _clearFilterCache];
  CNFRegLogOutdent();
}

- (void)activateAccountsExcludingAccounts:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v23 = self;
  *(unsigned char *)&self->_controllerFlags |= 0x80u;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Activating all accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (![(CNFRegController *)v23 isConnected])
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Not connected, connecting", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(CNFRegController *)v23 connect:1];
  }
  [(CNFRegController *)v23 setServiceEnabled:1];
  [(CNFRegController *)v23 enablePhoneNumberRegistration];
  uint64_t v22 = [(CNFRegController *)v23 accounts];
  if ([v22 count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v22, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v22;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v12, v21) & 1) == 0)
          {
            if ([v12 CNFRegIsSignedOut])
            {
              char v13 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v34 = v12;
                _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Skipping activation of signed out account: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
              {
                id v21 = v12;
                IMLogString();
              }
            }
            else
            {
              [v7 addObject:v12];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v9);
    }

    id v14 = [MEMORY[0x263F4A520] sharedInstance];
    [v14 activateAccounts:v7];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          if ((objc_msgSend(v19, "CNFRegSignInComplete", v21) & 1) == 0) {
            [v19 registerAccount];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }
  }
  else
  {
    BOOL v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_DEFAULT, "No accounts to activate", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  *(unsigned char *)&v23->_controllerFlags &= ~0x80u;
}

- (void)enablePhoneNumberRegistration
{
  int64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Enabling PhoneNumber Registration", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  v3 = dispatch_get_global_queue(21, 0);
  IDSRegistrationControlEnableRegistrationType();
}

void __49__CNFRegController_enablePhoneNumberRegistration__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "PhoneNumber Permission enable failed with error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)activateAccounts
{
}

- (void)deactivateAccounts
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(unsigned char *)&self->_controllerFlags |= 0x80u;
  int64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Deactivating all accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogBacktrace();
  if (![(CNFRegController *)self isConnected])
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "  => Not connected, connecting", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(CNFRegController *)self connect:1];
  }
  char v13 = [(CNFRegController *)self accounts];
  if ([v13 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v13;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v8 CNFRegIsSignedOut] & 1) == 0
            && [v8 BOOLForKey:@"AccountSignedOut"])
          {
            uint64_t v9 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              BOOL v20 = v8;
              _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "  => Mismatch of state - clearing signedOut flag on account %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              id v12 = v8;
              IMLogString();
            }
            objc_msgSend(v8, "removeObjectForKey:", @"AccountSignedOut", v12);
            [v8 writeSettings];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v5);
    }

    uint64_t v10 = [MEMORY[0x263F4A520] sharedInstance];
    [v10 deactivateAccounts:v4];
  }
  else
  {
    uint64_t v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "  => No accounts to deactivate", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  [(CNFRegController *)self setServiceEnabled:0];
  *(unsigned char *)&self->_controllerFlags &= ~0x80u;
}

- (id)_accountForAlias:(id)a3 accounts:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v8 = 0;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          char v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 hasAlias:v5])
          {
            id v14 = v13;

            uint64_t v8 = v14;
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (id)accountForAlias:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegController *)self accounts];
  id v6 = [(CNFRegController *)self _accountForAlias:v4 accounts:v5];

  return v6;
}

- (BOOL)_aliasIsDevicePhoneNumber:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ![v3 _appearsToBePhoneNumber])
  {
    BOOL v17 = 0;
    goto LABEL_26;
  }
  id v5 = v4;
  id v6 = _IDSCopyMyPhoneNumbers();
  if (![v6 count])
  {
    BOOL v12 = 0;
    goto LABEL_25;
  }
  active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  id v20 = v5;
  uint64_t v8 = (const void *)CFPhoneNumberCreate();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v19 = v6;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v10)
  {
    BOOL v12 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  BOOL v12 = 0;
  uint64_t v13 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v9);
      }
      long long v15 = (const void *)CFPhoneNumberCreate();
      long long v16 = v15;
      if (v8 && v15)
      {
        BOOL v12 = CFEqual(v8, v15) != 0;
      }
      else if (!v15)
      {
        goto LABEL_14;
      }
      CFRelease(v16);
LABEL_14:
      if (v12) {
        goto LABEL_21;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v11);
LABEL_21:

  if (v8) {
    CFRelease(v8);
  }
  id v6 = v19;
  id v5 = v20;
  if (active) {
    CFRelease(active);
  }
LABEL_25:

  BOOL v17 = v12;
LABEL_26:

  return v17;
}

- (BOOL)_aliasIsTemporaryDeviceAlias:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 _appearsToBePhoneNumber])
  {
    BOOL v18 = 0;
    goto LABEL_27;
  }
  id v6 = v5;
  id v7 = [(CNFRegController *)self _temporaryDeviceAliases];
  if (![v7 count])
  {
    BOOL v13 = 0;
    goto LABEL_26;
  }
  long long v22 = v5;
  active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  id v21 = v6;
  id v9 = (const void *)CFPhoneNumberCreate();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v7;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v11)
  {
    BOOL v13 = 0;
    goto LABEL_21;
  }
  uint64_t v12 = v11;
  BOOL v13 = 0;
  uint64_t v14 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v10);
      }
      long long v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) URI];
      [v16 unprefixedURI];
      BOOL v17 = (const void *)CFPhoneNumberCreate();

      if (v9 && v17)
      {
        BOOL v13 = CFEqual(v9, v17) != 0;
      }
      else if (!v17)
      {
        goto LABEL_14;
      }
      CFRelease(v17);
LABEL_14:
      if (v13) {
        goto LABEL_21;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v12);
LABEL_21:

  if (v9) {
    CFRelease(v9);
  }
  id v5 = v22;
  id v7 = v20;
  if (active) {
    CFRelease(active);
  }
  id v6 = v21;
LABEL_26:

  BOOL v18 = v13;
LABEL_27:

  return v18;
}

- (void)_clearCachedTemporaryDeviceAliases
{
  self->__temporaryDeviceAliases = 0;
  MEMORY[0x270F9A758]();
}

- (NSArray)_temporaryDeviceAliases
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  temporaryDeviceAliases = self->__temporaryDeviceAliases;
  if (!temporaryDeviceAliases)
  {
    id v4 = [(CNFRegController *)self phoneSubscriptionSelector];
    id v10 = 0;
    id v5 = [v4 unselectedTemporaryPhoneAliasesWithError:&v10];
    id v6 = v10;
    id v7 = self->__temporaryDeviceAliases;
    self->__temporaryDeviceAliases = v5;

    if (v6)
    {
      uint64_t v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Error fetching temporary aliases %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }

    temporaryDeviceAliases = self->__temporaryDeviceAliases;
  }
  return temporaryDeviceAliases;
}

- (id)localPhoneNumberSentinelAlias
{
  int64_t v2 = [(CNFRegController *)self appleIDAccounts];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
    if (v3)
    {
      id v4 = [CNFRegAlias alloc];
      id v5 = [(CNFRegAlias *)v4 initWithAccount:v3 alias:*MEMORY[0x263F4A8D8]];
      id v6 = CNFRegLocalPhoneNumberDisplayString();
      [(CNFRegAlias *)v5 setDisplayName:v6];

      goto LABEL_6;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

- (BOOL)_shouldFilterOutAlias:(id)a3 onAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 typeForAlias:v6] == 2
    && [v7 accountType] != 2
    && ([MEMORY[0x263F3BB18] sharedInstance],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 supportsSMSIdentification],
        v8,
        v9)
    && ([(CNFRegController *)self _aliasIsDevicePhoneNumber:v6]
     || [(CNFRegController *)self _aliasIsTemporaryDeviceAlias:v6]
     || ([v6 isEqualToIgnoringCase:*MEMORY[0x263F4A8D8]] & 1) != 0))
  {
    char v10 = 1;
  }
  else
  {
    char v10 = [v6 isEqualToIgnoringCase:*MEMORY[0x263F4A8D8]];
  }

  return v10;
}

- (id)_aliasesForAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  id v6 = [v4 aliases];
  id v7 = (void *)_IDSCopyOrderedAliasStrings();

  if (!v7 || ![v7 count])
  {

LABEL_16:
    id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    goto LABEL_17;
  }
  id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!-[CNFRegController _shouldFilterOutAlias:onAccount:](self, "_shouldFilterOutAlias:onAccount:", v14, v5, (void)v17))
        {
          long long v15 = [[CNFRegAlias alloc] initWithAccount:v5 alias:v14];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (!v8) {
    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (id)_vettedAliasesForAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 accountType] != 1) {
    goto LABEL_17;
  }
  id v6 = [v5 vettedAliases];
  id v7 = v6;
  if (!v6 || ![v6 count])
  {

LABEL_17:
    id v8 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    goto LABEL_18;
  }
  id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (!-[CNFRegController _shouldFilterOutAlias:onAccount:](self, "_shouldFilterOutAlias:onAccount:", v14, v5, (void)v17))
        {
          long long v15 = [[CNFRegAlias alloc] initWithAccount:v5 alias:v14];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (!v8) {
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

- (id)_allAvailableAliasesForAccount:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
LABEL_49:
    id v34 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    goto LABEL_50;
  }
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [v4 vettedAliases];
  id v7 = (void *)_IDSCopyOrderedAliasStrings();

  id v8 = [v4 aliases];
  id v9 = (void *)_IDSCopyOrderedAliasStrings();

  uint64_t v10 = [v4 accountType];
  if (v10 == 1
    || !v10
    && ([MEMORY[0x263F3BB18] sharedInstance],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isTelephonyDevice],
        v11,
        (v12 & 1) == 0))
  {
    v43 = v9;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v16 = v7;
    id v22 = v7;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v58 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          if (![(CNFRegController *)self _aliasIsDevicePhoneNumber:v27]
            && ![(CNFRegController *)self _aliasIsTemporaryDeviceAlias:v27])
          {
            [v5 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v57 objects:v64 count:16];
      }
      while (v24);
    }
    goto LABEL_26;
  }
  uint64_t v13 = [v4 accountType];
  if (v13 == 2
    || !v13
    && ([MEMORY[0x263F3BB18] sharedInstance],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isTelephonyDevice],
        v14,
        v15))
  {
    v43 = v9;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v16 = v7;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v54 != v20) {
            objc_enumerationMutation(v17);
          }
          [v5 addObject:*(void *)(*((void *)&v53 + 1) + 8 * j)];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v19);
    }
LABEL_26:
    id v7 = v16;

    id v9 = v43;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v28 = v9;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v50 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * k);
        if (([v5 containsObject:v33] & 1) == 0) {
          [v5 addObject:v33];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v30);
  }

  if ([v5 count])
  {
    uint64_t v44 = v7;
    id v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v35 = v5;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v46;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v45 + 1) + 8 * m);
          if (![(CNFRegController *)self _shouldFilterOutAlias:v40 onAccount:v4])
          {
            long long v41 = [[CNFRegAlias alloc] initWithAccount:v4 alias:v40];
            [v34 addObject:v41];
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v45 objects:v61 count:16];
      }
      while (v37);
    }

    id v7 = v44;
  }
  else
  {
    id v34 = 0;
  }

  if (!v34) {
    goto LABEL_49;
  }
LABEL_50:

  return v34;
}

- (id)_aliasesFromAccounts:(id)a3 passingTest:(id)a4
{
  id v6 = a4;
  id v7 = [(CNFRegController *)self aliasesForAccounts:a3];
  id v8 = v7;
  if (!v7
    || ![v7 count]
    || ([v8 CNFRegArrayPassingTest:v6], (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = [MEMORY[0x263EFF8C0] array];
  }

  return v9;
}

- (id)_aliasesPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegController *)self accounts];
  id v6 = [(CNFRegController *)self _aliasesFromAccounts:v5 passingTest:v4];

  return v6;
}

- (id)_aliasComparator
{
  return &__block_literal_global_202;
}

uint64_t __36__CNFRegController__aliasComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v6 type];
  if (v8 == [v7 type])
  {
    id v9 = [v6 alias];
    uint64_t v10 = [v7 alias];
    uint64_t v11 = [v9 compare:v10];
  }
  else if ([v6 type])
  {
    if ([v6 type] == 2)
    {
      uint64_t v11 = -1;
    }
    else
    {
      uint64_t v12 = [v7 type];
      if (v12) {
        uint64_t v11 = v12 == 2;
      }
      else {
        uint64_t v11 = -1;
      }
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (id)aliasesForAccounts:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[CNFRegController _aliasesForAccount:](self, "_aliasesForAccount:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(CNFRegController *)self _aliasComparator];
  [v5 sortUsingComparator:v12];

  return v5;
}

- (id)vettedAliasesForAccounts:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "accountType", (void)v15) == 1)
        {
          uint64_t v12 = [(CNFRegController *)self _vettedAliasesForAccount:v11];
          [v5 addObjectsFromArray:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [(CNFRegController *)self _aliasComparator];
  [v5 sortUsingComparator:v13];

  return v5;
}

- (id)allAvailableAliasesForAccounts:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CNFRegController *)self _clearCachedTemporaryDeviceAliases];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(CNFRegController *)self _allAvailableAliasesForAccount:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v8);
  }
  id v28 = v6;

  uint64_t v30 = self;
  [(CNFRegController *)self usableDeviceAliases];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v42;
    uint64_t v36 = *MEMORY[0x263F4A288];
    id v32 = v5;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v14 = v5;
        uint64_t v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v49, 16, v28);
        if (!v15)
        {

LABEL_25:
          [v14 addObject:v13];
          continue;
        }
        uint64_t v16 = v15;
        uint64_t v35 = j;
        uint64_t v17 = *(void *)v38;
        while (2)
        {
          for (uint64_t k = 0; k != v16; ++k)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * k);
            uint64_t v20 = [v19 account];
            id v21 = [v20 objectForKey:v36];

            id v22 = [v19 alias];
            uint64_t v23 = [v13 alias];
            if ([v22 isEqualToString:v23])
            {

LABEL_27:
              id v5 = v32;
              uint64_t j = v35;
              goto LABEL_28;
            }
            uint64_t v24 = [v13 deviceAliasIdentifier];
            char v25 = [v21 isEqualToString:v24];

            if (v25) {
              goto LABEL_27;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v16) {
            continue;
          }
          break;
        }

        id v5 = v32;
        uint64_t j = v35;
        if ((v25 & 1) == 0) {
          goto LABEL_25;
        }
LABEL_28:
        ;
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v34);
  }
  long long v26 = [(CNFRegController *)v30 _aliasComparator];
  [v5 sortUsingComparator:v26];

  return v5;
}

- (id)useableAliasesForAccounts:(id)a3
{
  return [(CNFRegController *)self _aliasesFromAccounts:a3 passingTest:&__block_literal_global_205];
}

BOOL __46__CNFRegController_useableAliasesForAccounts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 account];
  int v4 = [v3 CNFRegSignInComplete];

  BOOL v5 = v4 && [v2 validationStatus] == 3;
  return v5;
}

- (id)usableDeviceAliases
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  if ([(CNFRegController *)self serviceSupportsDeviceAliasEnablement])
  {
    [(CNFRegController *)self _clearCachedTemporaryDeviceAliases];
    id v3 = [MEMORY[0x263F4A1F0] sharedInstance];
    id v67 = 0;
    long long v46 = [v3 currentSIMsWithError:&v67];
    long long v47 = (__CFString *)v67;

    if (v47)
    {
      int v4 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v47;
        _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Error fetching SIMs %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      id v5 = (id)MEMORY[0x263EFFA68];
    }
    else
    {
      id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v6 = [(CNFRegController *)self phoneSubscriptionSelector];
      id v66 = 0;
      uint64_t v52 = [v6 selectedSubscriptionsWithError:&v66];
      id v45 = v66;

      [(CNFRegController *)self _temporaryDeviceAliases];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v63 != v8) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            uint64_t v11 = [CNFRegAlias alloc];
            uint64_t v12 = [v10 URI];
            uint64_t v13 = [v12 unprefixedURI];
            id v14 = [v10 valueForKey:@"selected"];
            uint64_t v15 = -[CNFRegAlias initWithAlias:type:selected:deviceAliasIdentifier:](v11, "initWithAlias:type:selected:deviceAliasIdentifier:", v13, 2, [v14 BOOLValue], @"temp");

            [(CNFRegAlias *)v15 setIsTemporary:1];
            uint64_t v16 = [v10 expirationDate];
            [(CNFRegAlias *)v15 set_expirationDate:v16];

            [v53 addObject:v15];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
        }
        while (v7);
      }

      uint64_t v17 = [MEMORY[0x263F3BB18] sharedInstance];
      if ([v17 isInDualPhoneIdentityMode])
      {
        int v48 = 1;
      }
      else
      {
        long long v18 = [MEMORY[0x263F3BB68] sharedInstance];
        int v48 = [v18 isDeviceInManualPhoneSelectionMode];
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v49 = v46;
      uint64_t v19 = [v49 countByEnumeratingWithState:&v58 objects:v75 count:16];
      if (v19)
      {
        uint64_t v51 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v59 != v51) {
              objc_enumerationMutation(v49);
            }
            id v21 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v22 = v52;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v74 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v55;
              while (2)
              {
                for (uint64_t k = 0; k != v23; ++k)
                {
                  if (*(void *)v55 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  long long v26 = *(void **)(*((void *)&v54 + 1) + 8 * k);
                  uint64_t v27 = [v21 slot];
                  uint64_t v28 = [v26 subscriptionSlot];
                  uint64_t v29 = v28 == 2;
                  if (!v28) {
                    uint64_t v29 = 2;
                  }
                  if (v27 == v29)
                  {
                    uint64_t v30 = 1;
                    goto LABEL_37;
                  }
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v74 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }
            uint64_t v30 = 0;
LABEL_37:

            uint64_t v31 = [v21 phoneNumber];
            id v32 = [v21 label];
            uint64_t v33 = [v21 SIMIdentifier];
            uint64_t v34 = v31;
            if (v31) {
              goto LABEL_41;
            }
            int v35 = v48;
            if (!v32) {
              int v35 = 0;
            }
            uint64_t v34 = v32;
            if (v35 == 1)
            {
LABEL_41:
              uint64_t v36 = [[CNFRegAlias alloc] initWithAlias:v34 type:2 selected:v30 deviceAliasIdentifier:v33];
              [v53 addObject:v36];
            }
          }
          uint64_t v19 = [v49 countByEnumeratingWithState:&v58 objects:v75 count:16];
        }
        while (v19);
      }

      long long v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        long long v38 = [MEMORY[0x263F3BB18] sharedInstance];
        if ([v38 isInDualPhoneIdentityMode]) {
          long long v39 = @"YES";
        }
        else {
          long long v39 = @"NO";
        }
        long long v40 = [MEMORY[0x263F3BB68] sharedInstance];
        if ([v40 isDeviceInManualPhoneSelectionMode]) {
          long long v41 = @"YES";
        }
        else {
          long long v41 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v69 = v39;
        __int16 v70 = 2112;
        v71 = v41;
        __int16 v72 = 2112;
        id v73 = v53;
        _os_log_impl(&dword_21ED18000, v37, OS_LOG_TYPE_DEFAULT, "Getting usable device aliases {isInDualPhoneIdentityMode: %@, isDeviceInManualPhoneSelectionMode: %@, aliases: %@}", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        long long v42 = [MEMORY[0x263F3BB18] sharedInstance];
        [v42 isInDualPhoneIdentityMode];
        long long v43 = [MEMORY[0x263F3BB68] sharedInstance];
        [v43 isDeviceInManualPhoneSelectionMode];
        IMLogString();
      }
      id v5 = v53;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  return v5;
}

- (NSArray)aliases
{
  id v3 = [(CNFRegController *)self accounts];
  int v4 = [(CNFRegController *)self aliasesForAccounts:v3];

  return (NSArray *)v4;
}

- (NSArray)vettedAliases
{
  id v3 = [(CNFRegController *)self accounts];
  int v4 = [(CNFRegController *)self vettedAliasesForAccounts:v3];

  return (NSArray *)v4;
}

- (NSArray)allAvailableAliases
{
  id v3 = [(CNFRegController *)self accounts];
  int v4 = [(CNFRegController *)self allAvailableAliasesForAccounts:v3];

  return (NSArray *)v4;
}

- (NSArray)useableAliases
{
  id v3 = [(CNFRegController *)self accounts];
  int v4 = [(CNFRegController *)self useableAliasesForAccounts:v3];

  return (NSArray *)v4;
}

- (NSArray)emailAliases
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Getting email aliases", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogIndent();
  int v4 = [(CNFRegController *)self _aliasesPassingTest:&__block_literal_global_230];
  CNFRegLogOutdent();
  return (NSArray *)v4;
}

BOOL __32__CNFRegController_emailAliases__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (BOOL)hasAliasNamed:(id)a3
{
  id v3 = [(CNFRegController *)self accountForAlias:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAlias:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegController *)self accounts];
  id v6 = [v4 account];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (id)aliasNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegController *)self accountForAlias:v4];
  if (v5) {
    id v6 = [[CNFRegAlias alloc] initWithAccount:v5 alias:v4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_addAliases:(id)a3 toAccount:(id)a4 validate:(BOOL)a5
{
  BOOL v32 = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v6 = a4;
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = CNFRegStringForAccount(v6);
    *(_DWORD *)buf = 138412546;
    id v42 = v33;
    __int16 v43 = 2112;
    long long v44 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to add aliases: %@ to account: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v6);
    uint64_t v30 = v28 = v33;
    IMLogString();
  }
  uint64_t v9 = objc_msgSend(v33, "count", v28, v30);
  BOOL v10 = 0;
  if (v6 && v9)
  {
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v33, "count"));
    int v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v33, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v33;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v12)
    {
      char v14 = 1;
      goto LABEL_30;
    }
    uint64_t v13 = *(void *)v37;
    char v14 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v6, "hasAlias:", v16, v29, v31))
        {
          if ([v6 validationStatusForAlias:v16] != 3) {
            [v34 addObject:v16];
          }
        }
        else
        {
          id v17 = v6;
          uint64_t v18 = [v17 accountType];
          if (v18)
          {

            if (v18 == 1) {
              goto LABEL_18;
            }
          }
          else
          {
            uint64_t v19 = [MEMORY[0x263F3BB18] sharedInstance];
            uint64_t v20 = [v19 isTelephonyDevice];

            if ((v20 & 1) == 0)
            {
LABEL_18:
              [v35 addObject:v16];
              continue;
            }
          }
          id v21 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = CNFRegStringForAccount(v17);
            *(_DWORD *)buf = 138412546;
            id v42 = v16;
            __int16 v43 = 2112;
            long long v44 = v22;
            _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Not allowed to add alias '%@' to phone account: %@", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            CNFRegStringForAccount(v17);
            uint64_t v31 = v29 = v16;
            IMLogString();
          }
          char v14 = 0;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v12)
      {
LABEL_30:

        if ([v35 count])
        {
          uint64_t v23 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v35;
            _os_log_impl(&dword_21ED18000, v23, OS_LOG_TYPE_DEFAULT, "Adding aliases: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v29 = v35;
            IMLogString();
          }
          if (objc_msgSend(v6, "addAliases:", v35, v29))
          {
            [v34 addObjectsFromArray:v35];
          }
          else
          {
            uint64_t v24 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              char v25 = CNFRegStringForAccount(v6);
              *(_DWORD *)buf = 138412290;
              id v42 = v25;
              _os_log_impl(&dword_21ED18000, v24, OS_LOG_TYPE_DEFAULT, "Could not add aliases to account: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
            {
              uint64_t v29 = CNFRegStringForAccount(v6);
              IMLogString();
            }
            char v14 = 0;
          }
        }
        if (v32 && [v34 count])
        {
          long long v26 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v34;
            _os_log_impl(&dword_21ED18000, v26, OS_LOG_TYPE_DEFAULT, "Validating aliases: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v29 = v34;
            IMLogString();
          }
          v14 &= objc_msgSend(v6, "validateAliases:", v34, v29);
        }

        BOOL v10 = v14 & 1;
        break;
      }
    }
  }

  return v10;
}

- (BOOL)addAlias:(id)a3 toAccount:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  uint64_t v8 = [v6 arrayWithObject:a3];
  LOBYTE(self) = [(CNFRegController *)self _addAliases:v8 toAccount:v7 validate:1];

  return (char)self;
}

- (BOOL)addAlias:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(CNFRegController *)self accounts];
  id v6 = (id)[v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(id *)(*((void *)&v20 + 1) + 8 * i);
      BOOL v10 = v9;
      if (!v9) {
        goto LABEL_11;
      }
      uint64_t v11 = [v9 accountType];
      if (!v11)
      {
        uint64_t v13 = [MEMORY[0x263F3BB18] sharedInstance];
        char v14 = [v13 isTelephonyDevice];

        if ((v14 & 1) == 0)
        {

LABEL_16:
          id v6 = v10;
          goto LABEL_17;
        }
LABEL_11:

        continue;
      }
      uint64_t v12 = v11;

      if (v12 == 1) {
        goto LABEL_16;
      }
    }
    id v6 = (id)[v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_17:

  BOOL v15 = [(CNFRegController *)self addAlias:v4 toAccount:v6];
  if (!v15)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __29__CNFRegController_addAlias___block_invoke;
    v17[3] = &unk_2644F0868;
    id v18 = v4;
    id v19 = v6;
    CNFRegLogIndent();
    __29__CNFRegController_addAlias___block_invoke((uint64_t)v17);
    CNFRegLogOutdent();
  }
  return v15;
}

void __29__CNFRegController_addAlias___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = CNFRegStringForAccount(*(void **)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Could not add alias '%@' to account: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
    {
      id v5 = CNFRegStringForAccount(*(void **)(a1 + 40));
      IMLogString();
    }
  }
}

- (BOOL)removeAlias:(id)a3 fromAccount:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v7 aliases];
    *(_DWORD *)buf = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Removing alias: %@ from account: %@ (current aliases: %@)", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v11 = CNFRegStringForAccount(v7);
    [v7 aliases];
    long long v23 = v21 = v11;
    id v20 = v6;
    IMLogString();
  }
  uint64_t v12 = [(CNFRegController *)self accounts];
  int v13 = [v12 containsObject:v7];

  if (v13)
  {
    char v14 = [v7 removeAlias:v6];
  }
  else
  {
    BOOL v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegStringForAccount(v7);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [(CNFRegController *)self accounts];
      *(_DWORD *)buf = 138412546;
      id v25 = v16;
      __int16 v26 = 2112;
      id v27 = v17;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Skipped alias removal from account: %@ because account isn't in list of accounts: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v18 = CNFRegStringForAccount(v7);
      long long v22 = [(CNFRegController *)self accounts];
      IMLogString();
    }
    char v14 = 0;
  }

  return v14;
}

- (BOOL)canRemoveAlias:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 type] == 2)
  {
    LOBYTE(v5) = 0;
  }
  else if (CNFRegSupportsLocalPhoneNumberSentinelAlias())
  {
    id v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = [v4 account];
    id v7 = [v5 arrayWithObject:v6];
    __int16 v8 = [(CNFRegController *)self vettedAliasesForAccounts:v7];
    LOBYTE(v5) = [v8 count] != 0;
  }
  else if ([v4 validationStatus] == 3)
  {
    id v9 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v10 = [v4 account];
    uint64_t v11 = [v9 arrayWithObject:v10];
    uint64_t v12 = [(CNFRegController *)self aliasesForAccounts:v11];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v12;
    id v5 = (void *)[v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v13);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "alias", (void)v21);
          id v18 = [v4 alias];
          char v19 = [v17 isEqualToIgnoringCase:v18];

          if ((v19 & 1) == 0 && [v16 type] != 2 && objc_msgSend(v16, "validationStatus") == 3)
          {
            LOBYTE(v5) = 1;
            goto LABEL_19;
          }
        }
        id v5 = (void *)[v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

- (BOOL)setAliases:(id)a3 onAccount:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = CNFRegStringForAccount(v7);
    *(_DWORD *)buf = 138412546;
    id v46 = v6;
    __int16 v47 = 2112;
    int v48 = v9;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to set aliases: %@ on account: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v7);
    v32 = id v30 = v6;
    IMLogString();
  }
  uint64_t v10 = objc_msgSend(v6, "count", v30, v32);
  BOOL v11 = 0;
  if (v7 && v10)
  {
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObject:v7];
    int v35 = [(CNFRegController *)self aliasesForAccounts:v12];

    id v13 = (void *)[v6 mutableCopy];
    if ([v35 count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v14 = v35;
      BOOL v15 = 0;
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v14);
            }
            char v19 = [*(id *)(*((void *)&v40 + 1) + 8 * i) alias];
            if (v19
              && ![(CNFRegController *)self _shouldFilterOutAlias:v19 onAccount:v7])
            {
              if ([v6 containsObject:v19])
              {
                [v13 removeObject:v19];
              }
              else
              {
                if (!v15)
                {
                  BOOL v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
                }
                [v15 addObject:v19];
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v51 count:16];
        }
        while (v16);
      }

      id v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v46 = v14;
        __int16 v47 = 2112;
        int v48 = v13;
        __int16 v49 = 2112;
        long long v50 = v15;
        _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_DEFAULT, "Account already has aliases: %@\nAdding: %@\nRemoving: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        id v33 = v13;
        uint64_t v34 = v15;
        id v31 = v14;
        IMLogString();
      }
      if (objc_msgSend(v13, "count", v31, v33, v34)) {
        BOOL v21 = [(CNFRegController *)self _addAliases:v13 toAccount:v7 validate:0];
      }
      else {
        BOOL v21 = 1;
      }
      if ([v15 count]) {
        [v7 removeAliases:v15];
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v22 = v6;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v37;
        LOBYTE(v25) = 1;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v22);
            }
            int v25 = ([v7 validationStatusForAlias:*(void *)(*((void *)&v36 + 1) + 8 * j)] == 3) & v25;
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v23);
      }
      else
      {
        int v25 = 1;
      }

      char v27 = [v7 validateAliases:v22];
      if (v25)
      {
        __int16 v28 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v28, OS_LOG_TYPE_DEFAULT, "All aliases on account are validated, kicking off a registration", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        [v7 registerAccount];
      }

      BOOL v11 = v21 & v27;
    }
    else
    {
      BOOL v11 = [(CNFRegController *)self _addAliases:v6 toAccount:v7 validate:1];
    }
  }
  return v11;
}

- (BOOL)validateAlias:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegController *)self accounts];
  id v6 = [v4 account];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    __int16 v8 = [v4 account];
    id v9 = [v4 alias];
    char v10 = [v8 validateAlias:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)unvalidateAlias:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFRegController *)self accounts];
  id v6 = [v4 account];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    __int16 v8 = [v4 account];
    id v9 = [v4 alias];
    char v10 = [v8 unvalidateAlias:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)_phoneSubscriptionSlotMatchingPhoneNumber:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F4A1F0] sharedInstance];
  id v24 = 0;
  char v19 = [v4 currentSIMsWithError:&v24];
  id v5 = v24;

  if (v5)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Error fetching SIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  else
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v19;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Fetched IDSCTSIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v19;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          if (v3)
          {
            uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            id v13 = (void *)MEMORY[0x263F4A1F0];
            id v14 = [v12 phoneNumber];
            LOBYTE(v13) = [v13 isPhoneNumber:v14 equivalentToExistingPhoneNumber:v3];

            if (v13)
            {
              uint64_t v16 = [v12 slot];
              uint64_t v17 = 1;
              if (v16 == 1) {
                uint64_t v17 = 2;
              }
              if (v16 == 2) {
                int64_t v15 = 0;
              }
              else {
                int64_t v15 = v17;
              }

              goto LABEL_29;
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  int64_t v15 = 0;
LABEL_29:

  return v15;
}

- (int64_t)_phoneSubscriptionSlotMatchingLabel:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F4A1F0] sharedInstance];
  id v24 = 0;
  id v5 = [v4 currentSIMsWithError:&v24];
  id v6 = v24;

  if (v6)
  {
    int v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching SIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  else
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Fetched IDSCTSIMs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          if (v3)
          {
            id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            id v14 = [v13 label];
            char v15 = IMAreObjectsLogicallySame();

            if (v15)
            {
              uint64_t v17 = [v13 slot];
              uint64_t v18 = 1;
              if (v17 == 1) {
                uint64_t v18 = 2;
              }
              if (v17 == 2) {
                int64_t v16 = 0;
              }
              else {
                int64_t v16 = v18;
              }

              goto LABEL_29;
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  int64_t v16 = 0;
LABEL_29:

  return v16;
}

- (void)addDeviceAlias:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isDeviceAlias] & 1) != 0)
  {
    if ([v5 isTemporaryPhoneNumberAlias])
    {
      id v6 = [(CNFRegController *)self phoneSubscriptionSelector];
      id v7 = objc_alloc(MEMORY[0x263F4A258]);
      id v8 = [v5 alias];
      id v9 = (void *)[v7 initWithUnprefixedURI:v8];
      id v25 = 0;
      [v6 enableTemporaryPhoneAlias:v9 withError:&v25];
      id v10 = v25;

      uint64_t v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Enabled temp alias after user add {enableError: %@}", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }

      goto LABEL_28;
    }
    id v13 = [v5 alias];
    int64_t v14 = [(CNFRegController *)self _phoneSubscriptionSlotMatchingPhoneNumber:v13];

    if (v14) {
      goto LABEL_22;
    }
    char v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Tried adding an alias that we can't find the slot for -- trying label {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v23 = v5;
      IMLogString();
    }
    int64_t v16 = objc_msgSend(v5, "alias", v23);
    int64_t v14 = [(CNFRegController *)self _phoneSubscriptionSlotMatchingLabel:v16];

    if (v14)
    {
LABEL_22:
      uint64_t v17 = [MEMORY[0x263F4A078] phoneSubscriptionWithSubscriptionSlot:v14];
      uint64_t v18 = [(CNFRegController *)self phoneSubscriptionSelector];
      id v24 = 0;
      char v19 = [v18 selectSubscription:v17 withError:&v24];
      id v20 = v24;

      long long v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v20;
        __int16 v28 = 2112;
        uint64_t v29 = v19;
        _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Selected subscriptions after user add {error: %@, currentlySelected: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }

      goto LABEL_28;
    }
    long long v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_DEFAULT, "Tried adding an alias that we can't find the slot for -- failing! {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_14:
    }
      IMLogString();
  }
  else
  {
    uint64_t v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Tried adding an alias that didn't belong to this system!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      goto LABEL_14;
    }
  }
LABEL_28:
}

- (void)removeDeviceAlias:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (([v4 isPhoneNumberAliasOnPhoneNumberAccount] & 1) != 0
     || ([v5 isTemporaryPhoneNumberAlias] & 1) != 0))
  {
    if ([v5 isTemporaryPhoneNumberAlias])
    {
      id v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Removing a temporary alias {alias: %@}", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        uint64_t v26 = v5;
        IMLogString();
      }
      id v7 = [(CNFRegController *)self phoneSubscriptionSelector];
      id v8 = objc_alloc(MEMORY[0x263F4A258]);
      id v9 = [v5 alias];
      id v10 = (void *)[v8 initWithUnprefixedURI:v9];
      id v28 = 0;
      int v11 = [v7 removeTemporaryPhoneAlias:v10 withError:&v28];
      id v12 = v28;

      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v14 = @"NO";
        *(_DWORD *)buf = 138412802;
        id v30 = v5;
        __int16 v31 = 2112;
        if (v11) {
          int64_t v14 = @"YES";
        }
        BOOL v32 = v14;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Removed a temporary alias {alias: %@, success: %@, error: %@}", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }

      goto LABEL_36;
    }
    int64_t v16 = [v5 alias];
    int64_t v17 = [(CNFRegController *)self _phoneSubscriptionSlotMatchingPhoneNumber:v16];

    if (v17) {
      goto LABEL_30;
    }
    uint64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Tried removing an alias that we can't find the slot for -- trying label {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v26 = v5;
      IMLogString();
    }
    char v19 = objc_msgSend(v5, "alias", v26);
    int64_t v17 = [(CNFRegController *)self _phoneSubscriptionSlotMatchingLabel:v19];

    if (v17)
    {
LABEL_30:
      id v20 = [MEMORY[0x263F4A078] phoneSubscriptionWithSubscriptionSlot:v17];
      long long v21 = [(CNFRegController *)self phoneSubscriptionSelector];
      id v27 = 0;
      long long v22 = [v21 unselectSubscription:v20 withError:&v27];
      id v23 = v27;

      id v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v23;
        __int16 v31 = 2112;
        BOOL v32 = v22;
        _os_log_impl(&dword_21ED18000, v24, OS_LOG_TYPE_DEFAULT, "Selected subscriptions after user remove {error: %@, currentlySelected: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }

      goto LABEL_36;
    }
    id v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, "Tried removing an alias that we can't find the slot for -- failing! {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_22:
    }
      IMLogString();
  }
  else
  {
    char v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Tried removing an alias that didn't belong to this system!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      goto LABEL_22;
    }
  }
LABEL_36:
}

- (void)disableDeviceAlias:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && [v4 isPhoneNumberAliasOnPhoneNumberAccount]
    && ([v5 isTemporaryPhoneNumberAlias] & 1) != 0)
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      char v19 = v5;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Disabling a temporary alias {alias: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      int64_t v16 = v5;
      IMLogString();
    }
    id v7 = [(CNFRegController *)self phoneSubscriptionSelector];
    id v8 = objc_alloc(MEMORY[0x263F4A258]);
    id v9 = [v5 alias];
    id v10 = (void *)[v8 initWithUnprefixedURI:v9];
    id v17 = 0;
    int v11 = [v7 disableTemporaryPhoneAlias:v10 withError:&v17];
    id v12 = v17;

    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = @"NO";
      *(_DWORD *)buf = 138412802;
      char v19 = v5;
      __int16 v20 = 2112;
      if (v11) {
        int64_t v14 = @"YES";
      }
      long long v21 = v14;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Disabled a temporary alias {alias: %@, success: %@, error: %@}", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  else
  {
    char v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Tried disable an alias that can't be disabled!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (id)aliasSummaryString:(BOOL *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = [(CNFRegController *)self _aliasesPassingTest:&__block_literal_global_313];
  uint64_t v5 = [v4 count];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v19 + 1) + 8 * i) type] == 2) {
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  if (v5 == 1)
  {
    id v12 = [v6 objectAtIndex:0];
    int64_t v14 = [v12 displayName];
  }
  else
  {
    if (v5)
    {
      char v15 = NSString;
      id v12 = CommunicationsSetupUIBundle();
      id v13 = CNFRegStringTableName();
      if (v9) {
        int64_t v16 = @"ALIAS_SUMMARY_ADDRESSES_COUNT";
      }
      else {
        int64_t v16 = @"ALIAS_SUMMARY_EMAIL_ADDRESSES_COUNT";
      }
      id v17 = [v12 localizedStringForKey:v16 value:&stru_26D05D4F8 table:v13];
      int64_t v14 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v5);
    }
    else
    {
      id v12 = CommunicationsSetupUIBundle();
      id v13 = CNFRegStringTableName();
      int64_t v14 = [v12 localizedStringForKey:@"ALIAS_SUMMARY_NO_ADDRESSES" value:&stru_26D05D4F8 table:v13];
    }
  }
  if (a3) {
    *a3 = 0;
  }

  return v14;
}

BOOL __39__CNFRegController_aliasSummaryString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 account];
  BOOL v4 = [v3 isOperational] && objc_msgSend(v2, "validationStatus") == 3;

  return v4;
}

- (BOOL)_accountIsAuthenticated:(id)a3
{
  return a3 && [a3 registrationStatus] > 2;
}

- (BOOL)_accountHasValidatedLocale:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  if ([v3 accountType] == 2
    || [v4 accountType] == 1 && objc_msgSend(v4, "profileValidationStatus") == 3)
  {
    goto LABEL_3;
  }
  uint64_t v6 = [v4 accountType];
  if (v6 == 2) {
    goto LABEL_3;
  }
  if (v6 == 1)
  {
LABEL_10:
    BOOL v5 = [v4 profileValidationStatus] == 3;
    goto LABEL_12;
  }
  if (v6)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = [MEMORY[0x263F3BB18] sharedInstance];
  char v8 = [v7 isTelephonyDevice];

  if ((v8 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_3:
  BOOL v5 = 1;
LABEL_12:

  return v5;
}

- (unint64_t)accountState:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = a3;
  uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v36)
  {
    unint64_t v3 = 0;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        BOOL v5 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v5, "CNFRegIsSignedOut", v28, v29, v30, v31, v32))
        {
          uint64_t v6 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = CNFRegStringForAccount(v5);
            *(_DWORD *)buf = 138412290;
            id v42 = v7;
            _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring account state for signed out account: {%@}", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            id v28 = CNFRegStringForAccount(v5);
            IMLogString();
          }
        }
        else
        {
          BOOL v8 = [(CNFRegController *)self _accountIsAuthenticated:v5];
          BOOL v9 = [(CNFRegController *)self _accountHasValidatedLocale:v5];
          int v10 = [v5 CNFRegSignInComplete];
          int v11 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            CNFRegStringForAccount(v5);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            int v13 = [v5 isActive];
            if (v10) {
              int64_t v14 = @"YES";
            }
            else {
              int64_t v14 = @"NO";
            }
            *(_DWORD *)buf = 138413314;
            id v42 = v12;
            if (v9) {
              char v15 = @"YES";
            }
            else {
              char v15 = @"NO";
            }
            __int16 v43 = 2112;
            if (v8) {
              int64_t v16 = @"YES";
            }
            else {
              int64_t v16 = @"NO";
            }
            long long v44 = v16;
            if (v13) {
              id v17 = @"YES";
            }
            else {
              id v17 = @"NO";
            }
            __int16 v45 = 2112;
            id v46 = v15;
            __int16 v47 = 2112;
            int v48 = v14;
            __int16 v49 = 2112;
            long long v50 = v17;
            _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Account state for account: {%@}   authenticated:%@   validLocale:%@   signInComplete:%@   active:%@", buf, 0x34u);
          }
          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v18 = CNFRegStringForAccount(v5);
            if (v8) {
              long long v19 = @"YES";
            }
            else {
              long long v19 = @"NO";
            }
            if (v9) {
              long long v20 = @"YES";
            }
            else {
              long long v20 = @"NO";
            }
            if (v10) {
              long long v21 = @"YES";
            }
            else {
              long long v21 = @"NO";
            }
            int v22 = [v5 isActive];
            id v23 = @"NO";
            if (v22) {
              id v23 = @"YES";
            }
            __int16 v31 = v21;
            BOOL v32 = v23;
            uint64_t v29 = v19;
            id v30 = v20;
            id v28 = v18;
            IMLogString();
          }
          unint64_t v24 = v3 | v8;
          if (v9) {
            v24 |= 2uLL;
          }
          if (v10) {
            unint64_t v3 = v24 | 4;
          }
          else {
            unint64_t v3 = v24;
          }
          if ((v10 & v9) == 1)
          {
            int v25 = [v5 isActive];
            uint64_t v26 = 1610612736;
            if (v25) {
              uint64_t v26 = 0x40000000;
            }
            v3 |= v26;
          }
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v36);
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)accountStateForAccount:(id)a3
{
  if (a3)
  {
    BOOL v4 = (objc_class *)MEMORY[0x263EFF8C0];
    id v5 = a3;
    uint64_t v6 = objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(CNFRegController *)self accountState:v6];

  return v7;
}

- (unint64_t)accountState
{
  unint64_t v3 = [(CNFRegController *)self accounts];
  unint64_t v4 = [(CNFRegController *)self accountState:v3];

  return v4;
}

- (BOOL)accountIsAuthenticating
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(CNFRegController *)self accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) registrationStatus] == 2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasFailedLogin
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(CNFRegController *)self accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) registrationStatus] == -1;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)hasFailedLoginDueToBadLogin
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CNFRegController *)self hasFailedLogin];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(CNFRegController *)self accounts];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 registrationStatus] == -1 && objc_msgSend(v10, "registrationFailureReason") == 3) {
            char v7 = 1;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      char v7 = 0;
    }

    LOBYTE(v3) = v7 & 1;
  }
  return v3;
}

- (BOOL)iMessageAccountMatchesiCloudAccount:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(CNFRegController *)self accounts];
  char v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v10 = [v9 authorizationID];
        long long v11 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = [v9 login];
          *(_DWORD *)buf = 138412802;
          id v24 = v4;
          __int16 v25 = 2112;
          uint64_t v26 = v10;
          __int16 v27 = 2112;
          id v28 = v12;
          _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Check DSID of account, iCloud DSID: %@, iMessage account DSID : %@ for %@", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          [v9 login];
          v17 = int64_t v16 = v10;
          id v15 = v4;
          IMLogString();
        }
        char v13 = objc_msgSend(v10, "isEqualToString:", v4, v15, v16, v17);

        v5 |= v13;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v6);
  }

  return v5 & 1;
}

- (BOOL)shouldShowAlertForError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    if ([v4 code] == 20 || objc_msgSend(v5, "code") == 26)
    {
      uint64_t v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v11 = v5;
        _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Suppresssing alert for error %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog()) {
        goto LABEL_16;
      }
    }
    else
    {
      if ([v5 code] != 14)
      {
        BOOL v7 = ![(CNFRegController *)self isAccountKeyCDPSyncingOrWaitingForUser];
        goto LABEL_17;
      }
      uint64_t v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v11 = v5;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Suppresssing alert for error %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog()) {
        goto LABEL_16;
      }
    }
    IMLogString();
LABEL_16:
    LOBYTE(v7) = 0;
    goto LABEL_17;
  }
  LOBYTE(v7) = 1;
LABEL_17:

  return v7;
}

- (void)startListeningForAccountChanges
{
  if ((*(unsigned char *)&self->_controllerFlags & 1) == 0)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_accountAdded_ name:*MEMORY[0x263F4A3C8] object:0];
    [v3 addObserver:self selector:sel_accountRemoved_ name:*MEMORY[0x263F4A3D0] object:0];
    [v3 addObserver:self selector:sel_accountRegistrationChanged_ name:*MEMORY[0x263F4A458] object:0];
    [v3 addObserver:self selector:sel_callerIdChanged_ name:*MEMORY[0x263F4A3E0] object:0];
    [v3 addObserver:self selector:sel_aliasesChanged_ name:*MEMORY[0x263F4A3A8] object:0];
    [v3 addObserver:self selector:sel_vettedAliasesChanged_ name:*MEMORY[0x263F4A460] object:0];
    [v3 addObserver:self selector:sel_aliasStatusChanged_ name:*MEMORY[0x263F4A358] object:0];
    [v3 addObserver:self selector:sel_profileChanged_ name:*MEMORY[0x263F4A3F8] object:0];
    [v3 addObserver:self selector:sel_profileValidationStateChanged_ name:*MEMORY[0x263F4A408] object:0];
    [v3 addObserver:self selector:sel_authorizationCredentialsChanged_ name:*MEMORY[0x263F4A3B8] object:0];
    [v3 addObserver:self selector:sel_authorizationCredentialsChanged_ name:*MEMORY[0x263F4A3C0] object:0];
    [v3 addObserver:self selector:sel_accountActivationStateChanged_ name:*MEMORY[0x263F4A348] object:0];
    [v3 addObserver:self selector:sel_accountActivationStateChanged_ name:*MEMORY[0x263F4A3D8] object:0];
    [v3 addObserver:self selector:sel_deviceCapabilityChanged_ name:*MEMORY[0x263F3BB08] object:0];
    *(unsigned char *)&self->_controllerFlags |= 1u;
  }
}

- (void)stopListeningForAccountChanges
{
  if (*(unsigned char *)&self->_controllerFlags)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3D0] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3C8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A458] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3E0] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3A8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A460] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A358] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A500] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A508] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3F8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A408] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3B8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3C0] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A348] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F4A3D8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F3BB08] object:0];
    *(unsigned char *)&self->_controllerFlags &= ~1u;
  }
}

- (BOOL)shouldHandleAccountNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v5 = [(CNFRegController *)self services];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          long long v10 = [v4 service];

          if (v10 == v9)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)accountAdded:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5]
    && (*(unsigned char *)&self->_controllerFlags & 0x40) == 0)
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      long long v14 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account added : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v12 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    CNFRegLogIndent();
    [(CNFRegController *)self clearAllCaches];
    uint64_t v8 = [(CNFRegController *)self accountAddedBlock];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      long long v10 = [(CNFRegController *)self accountAddedBlock];
      long long v11 = (void (**)(void, void))[v10 copy];

      ((void (**)(void, void *))v11)[2](v11, v5);
    }
    CNFRegLogOutdent();
  }
}

- (void)accountRemoved:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      long long v14 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account removed : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v12 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    CNFRegLogIndent();
    [(CNFRegController *)self clearAllCaches];
    uint64_t v8 = [(CNFRegController *)self accountRemovedBlock];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      long long v10 = [(CNFRegController *)self accountRemovedBlock];
      long long v11 = (void (**)(void, void))[v10 copy];

      ((void (**)(void, void *))v11)[2](v11, v5);
    }
    CNFRegLogOutdent();
  }
}

- (void)accountRegistrationChanged:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  uint64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v5;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account registration changed : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    long long v40 = v5;
    IMLogString();
  }
  if (-[CNFRegController shouldHandleAccountNotification:](self, "shouldHandleAccountNotification:", v5, v40))
  {
    CNFRegLogIndent();
    [(CNFRegController *)self _clearFilterCache];
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CNFRegNonLocStringForRegistrationStatus([v5 registrationStatus]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "registrationFailureReason"));
      *(_DWORD *)buf = 138412546;
      id v54 = v8;
      __int16 v55 = 2112;
      long long v56 = v9;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Registration status: %@ failureReason: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v10 = CNFRegNonLocStringForRegistrationStatus([v5 registrationStatus]);
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "registrationFailureReason"));
      v47 = long long v41 = v10;
      IMLogString();
    }
    if (objc_msgSend(v5, "registrationStatus", v41, v47) == -1)
    {
      uint64_t v52 = [v4 userInfo];
      __int16 v49 = [v52 objectForKey:*MEMORY[0x263F4A450]];
      CNFRegLogIndent();
      long long v12 = [v52 objectForKey:*MEMORY[0x263F4A440]];
      long long v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v12;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Server error message : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        id v42 = v12;
        IMLogString();
      }
      uint64_t v51 = objc_msgSend(v52, "objectForKey:", *MEMORY[0x263F4A448], v42);
      long long v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v51;
        _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Server error title : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        __int16 v43 = v51;
        IMLogString();
      }
      long long v50 = objc_msgSend(v52, "objectForKey:", *MEMORY[0x263F4A438], v43);
      uint64_t v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v50;
        _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Server error button : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        long long v44 = v50;
        IMLogString();
      }
      int64_t v16 = objc_msgSend(v52, "objectForKey:", *MEMORY[0x263F4A420], v44);
      uint64_t v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v16;
        _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "Server error action dictionary : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        __int16 v45 = v16;
        IMLogString();
      }
      uint64_t v18 = objc_msgSend(v16, "objectForKey:", *MEMORY[0x263F4A428], v45);
      BOOL v19 = [v18 integerValue] == 1;

      if (v19)
      {
        long long v20 = [v16 objectForKey:*MEMORY[0x263F4A418]];
        long long v21 = [v16 objectForKey:*MEMORY[0x263F4A430]];
        long long v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v54 = v20;
          __int16 v55 = 2112;
          long long v56 = v21;
          _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_DEFAULT, "Server error action button title : %@  url string : %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          id v46 = v20;
          int v48 = v21;
          IMLogString();
        }
      }
      else
      {
        long long v20 = 0;
        long long v21 = 0;
      }
      CNFRegLogOutdent();
      id v23 = v12;
      id v24 = v23;
      if (!v23 || (__int16 v25 = v23, ![v23 length]))
      {
        uint64_t v26 = objc_msgSend(v49, "integerValue", v46, v48);
        __int16 v27 = [(CNFRegController *)self loginForAccount:v5];
        __int16 v25 = CNFRegStringForRegistrationFailure(v26, v27);

        id v28 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v25;
          _os_log_impl(&dword_21ED18000, v28, OS_LOG_TYPE_DEFAULT, "Using CNFRegStringForRegistrationFailure string : %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          id v46 = v25;
          IMLogString();
        }
      }
      uint64_t v29 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v46);
      [v29 setObject:v25 forKey:*MEMORY[0x263F08320]];
      if (v51 && [v51 length]) {
        [v29 setObject:v51 forKey:@"cnf-customTitle"];
      }
      if (v50 && [v50 length]) {
        [v29 setObject:v50 forKey:@"cnf-customButton"];
      }
      if (v20 && [v20 length] && v21 && objc_msgSend(v21, "length"))
      {
        [v29 setObject:v20 forKey:@"cnf-customActionTitle"];
        [v29 setObject:v21 forKey:@"cnf-customActionURLString"];
      }
      long long v11 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.conference.registration", objc_msgSend(v49, "integerValue"), v29);
    }
    else
    {
      long long v11 = 0;
    }
    if (![v5 CNFRegSignInComplete]) {
      goto LABEL_69;
    }
    id v30 = v5;
    __int16 v31 = v30;
    if (!v30) {
      goto LABEL_68;
    }
    uint64_t v32 = [v30 accountType];
    if (v32)
    {

      if (v32 != 1) {
        goto LABEL_69;
      }
    }
    else
    {
      __int16 v33 = [MEMORY[0x263F3BB18] sharedInstance];
      char v34 = [v33 isTelephonyDevice];

      if (v34)
      {
LABEL_68:

LABEL_69:
        uint64_t v36 = [(CNFRegController *)self accountRegistrationBlock];
        BOOL v37 = v36 == 0;

        if (!v37)
        {
          long long v38 = [(CNFRegController *)self accountRegistrationBlock];
          long long v39 = (void (**)(void, void, void))[v38 copy];

          ((void (**)(void, void *, void *))v39)[2](v39, v5, v11);
        }
        CNFRegLogOutdent();

        goto LABEL_72;
      }
    }
    uint64_t v35 = (void *)MEMORY[0x263EFFA40];
    __int16 v31 = [(CNFRegController *)self loginForAccount:v31];
    [v35 setCNFRegSavedAccountName:v31];
    goto LABEL_68;
  }
LABEL_72:
}

- (void)callerIdChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 displayName];
      *(_DWORD *)buf = 138412290;
      long long v14 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account display name changed to: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v12 = [v5 displayName];
      IMLogString();
    }
    id v8 = [(CNFRegController *)self callerIdChangedBlock];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      long long v10 = [(CNFRegController *)self callerIdChangedBlock];
      long long v11 = (void (**)(void))[v10 copy];

      v11[2](v11);
    }
  }
}

- (void)profileChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account profile changed : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      int64_t v16 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 profileValueForKey:*MEMORY[0x263F4A400]];
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v9;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "  Region ID : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      int64_t v16 = [v5 profileValueForKey:*MEMORY[0x263F4A400]];
      IMLogString();
    }
    long long v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [v5 profileValueForKey:*MEMORY[0x263F4A3F0]];
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v11;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "  Base number : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      int64_t v16 = [v5 profileValueForKey:*MEMORY[0x263F4A3F0]];
      IMLogString();
    }
    long long v12 = [(CNFRegController *)self profileChangedBlock];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      long long v14 = [(CNFRegController *)self profileChangedBlock];
      uint64_t v15 = (void (**)(void, void))[v14 copy];

      ((void (**)(void, void *))v15)[2](v15, v5);
    }
  }
}

- (void)profileValidationStateChanged:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = [v5 profileValidationStatus];
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      __int16 v25 = v8;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Account profile validation state changed : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v23 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    CNFRegLogIndent();
    [(CNFRegController *)self _clearFilterCache];
    BOOL v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = CNFRegNonLocStringForProfileValidationStatus(v6);
      *(_DWORD *)buf = 138412290;
      __int16 v25 = v10;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Profile status changed to %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v23 = CNFRegNonLocStringForProfileValidationStatus(v6);
      IMLogString();
    }
    if (v6 == -1)
    {
      id v12 = (id)*MEMORY[0x263F4A410];
      BOOL v13 = [v4 userInfo];
      long long v14 = [v13 objectForKey:v12];

      uint64_t v15 = [v14 integerValue];
      int64_t v16 = CNFRegStringForProfileValidationFailure(v15);
      uint64_t v17 = [NSDictionary dictionaryWithObject:v16 forKey:*MEMORY[0x263F08320]];
      long long v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.conference.registration" code:v15 userInfo:v17];
      uint64_t v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v25 = v16;
        _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Profile error: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        id v23 = v16;
        IMLogString();
      }
    }
    else
    {
      long long v11 = 0;
    }
    uint64_t v19 = [(CNFRegController *)self profileStatusChangedBlock];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
      long long v21 = [(CNFRegController *)self profileStatusChangedBlock];
      long long v22 = (void (**)(void, void, void))[v21 copy];

      ((void (**)(void, void *, void *))v22)[2](v22, v5, v11);
    }
    CNFRegLogOutdent();
  }
}

- (void)authorizationCredentialsChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      long long v14 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account authorization credentials changed : %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v12 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    [(CNFRegController *)self _clearFilterCache];
    id v8 = [(CNFRegController *)self accountAuthorizationChangedBlock];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      long long v10 = [(CNFRegController *)self accountAuthorizationChangedBlock];
      long long v11 = (void (**)(void, void, void))[v10 copy];

      ((void (**)(void, void *, void))v11)[2](v11, v5, 0);
    }
  }
}

- (void)accountActivationStateChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v5 isActive];
      uint64_t v8 = CNFRegStringForAccount(v5);
      BOOL v9 = (void *)v8;
      long long v10 = @"NO";
      if (v7) {
        long long v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Account activation state changed (isActive:%@): %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      [v5 isActive];
      uint64_t v15 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    CNFRegLogIndent();
    [(CNFRegController *)self _clearFilterCache];
    long long v11 = [(CNFRegController *)self accountActivationChangedBlock];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      BOOL v13 = [(CNFRegController *)self accountActivationChangedBlock];
      long long v14 = (void (**)(void, void))[v13 copy];

      ((void (**)(void, void *))v14)[2](v14, v5);
    }
    CNFRegLogOutdent();
  }
}

- (void)aliasStatusChanged:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      __int16 v47 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Received alias status change for account: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      char v34 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    CNFRegLogIndent();
    uint64_t v8 = [v4 userInfo];
    BOOL v9 = [v8 objectForKey:*MEMORY[0x263F4A350]];
    [(CNFRegController *)self _clearFilterCache];
    if (v9)
    {
      uint64_t v10 = [v5 validationStatusForAlias:v9];
      long long v11 = [v8 objectForKey:*MEMORY[0x263F4A3E8]];
      uint64_t v12 = [v11 integerValue];

      if (!v12 && v10 == 1) {
        goto LABEL_56;
      }
      BOOL v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        CNFRegNonLocStringForAliasValidationStatus(v12);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = CNFRegNonLocStringForAliasValidationStatus(v10);
        *(_DWORD *)buf = 138412802;
        __int16 v47 = v9;
        __int16 v48 = 2112;
        id v49 = v14;
        __int16 v50 = 2112;
        uint64_t v51 = v15;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Alias {%@} status changed from [%@] to [%@]", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        int64_t v16 = CNFRegNonLocStringForAliasValidationStatus(v12);
        CNFRegNonLocStringForAliasValidationStatus(v10);
        v38 = uint64_t v36 = v16;
        char v34 = v9;
        IMLogString();
      }
      if (v10 == -1)
      {
        uint64_t v19 = [v4 userInfo];
        id v42 = [v19 objectForKey:*MEMORY[0x263F4A398]];

        __int16 v43 = [v8 objectForKey:*MEMORY[0x263F4A388]];
        __int16 v45 = [v8 objectForKey:*MEMORY[0x263F4A390]];
        uint64_t v20 = [v8 objectForKey:*MEMORY[0x263F4A380]];
        long long v44 = [v8 objectForKey:*MEMORY[0x263F4A368]];
        long long v21 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v47 = v44;
          _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Server error action dictionary : %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          char v34 = v44;
          IMLogString();
        }
        long long v22 = objc_msgSend(v44, "objectForKey:", *MEMORY[0x263F4A370], v34, v36, v38);
        BOOL v23 = [v22 integerValue] == 1;

        if (v23)
        {
          id v24 = [v44 objectForKey:*MEMORY[0x263F4A360]];
          long long v41 = [v44 objectForKey:*MEMORY[0x263F4A378]];
          __int16 v25 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v47 = v24;
            __int16 v48 = 2112;
            id v49 = v41;
            _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, "Server error action button title : %@  url string : %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v35 = v24;
            BOOL v37 = v41;
            IMLogString();
          }
        }
        else
        {
          id v24 = 0;
          long long v41 = 0;
        }
        if (!v43 && !v45 && !v20) {
          goto LABEL_40;
        }
        CNFRegLogIndent();
        uint64_t v26 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          __int16 v47 = v43;
          __int16 v48 = 2112;
          id v49 = v45;
          __int16 v50 = 2112;
          uint64_t v51 = v20;
          __int16 v52 = 2112;
          id v53 = v24;
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          long long v39 = v20;
          long long v40 = v24;
          uint64_t v35 = v43;
          BOOL v37 = v45;
          IMLogString();
        }
        CNFRegLogOutdent();
        id v27 = v43;
        if (!v27 || (id v28 = v27, ![v27 length]))
        {
LABEL_40:
          id v28 = CNFRegStringForAliasValidationFailure(objc_msgSend(v42, "integerValue", v35, v37, v39, v40));
        }
        uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
        [v29 setObject:v28 forKey:*MEMORY[0x263F08320]];
        if (v45 && [v45 length]) {
          [v29 setObject:v45 forKey:@"cnf-customTitle"];
        }
        if (v20 && [v20 length]) {
          [v29 setObject:v20 forKey:@"cnf-customButton"];
        }
        if (v24 && [v24 length] && v41 && objc_msgSend(v41, "length"))
        {
          [v29 setObject:v24 forKey:@"cnf-customActionTitle"];
          [v29 setObject:v41 forKey:@"cnf-customActionURLString"];
        }
        uint64_t v17 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.conference.registration", objc_msgSend(v42, "integerValue", v35), v29);
      }
      else
      {
        uint64_t v17 = 0;
      }
      __int16 v18 = [[CNFRegAlias alloc] initWithAccount:v5 alias:v9];
      id v30 = [(CNFRegController *)self aliasStatusChangedBlock];
      BOOL v31 = v30 == 0;

      if (!v31)
      {
        uint64_t v32 = [(CNFRegController *)self aliasStatusChangedBlock];
        __int16 v33 = (void (**)(void, void, void))[v32 copy];

        ((void (**)(void, CNFRegAlias *, void *))v33)[2](v33, v18, v17);
      }
    }
    else
    {
      uint64_t v17 = 0;
      __int16 v18 = 0;
    }
    CNFRegLogOutdent();

LABEL_56:
  }
}

- (void)handleAliasAdded:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = [(CNFRegController *)self aliasAddedBlock];

    if (v4)
    {
      char v5 = [(CNFRegController *)self aliasAddedBlock];
      uint64_t v6 = (void (**)(void, void))[v5 copy];

      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

- (void)handleAliasRemoved:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = [(CNFRegController *)self aliasRemovedBlock];

    if (v4)
    {
      char v5 = [(CNFRegController *)self aliasRemovedBlock];
      uint64_t v6 = (void (**)(void, void))[v5 copy];

      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

- (void)aliasesChanged:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v4 = [v22 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v4])
  {
    char v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v37 = v4;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Aliases changed for account : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v20 = v4;
      IMLogString();
    }
    CNFRegLogIndent();
    [(CNFRegController *)self _clearFilterCache];
    long long v21 = [v22 userInfo];
    uint64_t v6 = [v21 objectForKey:*MEMORY[0x263F4A3A0]];
    BOOL v23 = [v21 objectForKey:*MEMORY[0x263F4A3B0]];
    if ((!v6 || ![v6 count]) && (!v23 || !objc_msgSend(v23, "count")))
    {
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "WARNING: Received alias changed notification but did not have any changed aliases", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v12 = [[CNFRegAlias alloc] initWithAccount:v4 alias:v11];
          BOOL v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v37 = v11;
            _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "  Added : %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v20 = v11;
            IMLogString();
          }
          -[CNFRegController handleAliasAdded:](self, "handleAliasAdded:", v12, v20);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v24 = v23;
    uint64_t v14 = [v24 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v24);
          }
          uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          __int16 v18 = [[CNFRegAlias alloc] initWithAccount:v4 alias:v17];
          uint64_t v19 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            BOOL v37 = v17;
            _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "  Removed : %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          {
            uint64_t v20 = v17;
            IMLogString();
          }
          -[CNFRegController handleAliasRemoved:](self, "handleAliasRemoved:", v18, v20);
        }
        uint64_t v14 = [v24 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v14);
    }

    CNFRegLogOutdent();
  }
}

- (void)vettedAliasesChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 object];
  if ([(CNFRegController *)self shouldHandleAccountNotification:v5])
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = CNFRegStringForAccount(v5);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Vetted aliases changed for: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v12 = CNFRegStringForAccount(v5);
      IMLogString();
    }
    uint64_t v8 = [(CNFRegController *)self vettedAliasesChangedBlock];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      uint64_t v10 = [(CNFRegController *)self vettedAliasesChangedBlock];
      long long v11 = (void (**)(void, void))[v10 copy];

      ((void (**)(void, void *))v11)[2](v11, v5);
    }
  }
}

- (void)removeAllHandlers
{
  [(CNFRegController *)self setAccountRegistrationBlock:0];
  [(CNFRegController *)self setAccountAddedBlock:0];
  [(CNFRegController *)self setAccountRemovedBlock:0];
  [(CNFRegController *)self setCallerIdChangedBlock:0];
  [(CNFRegController *)self setAliasStatusChangedBlock:0];
  [(CNFRegController *)self setAliasAddedBlock:0];
  [(CNFRegController *)self setAliasRemovedBlock:0];
  [(CNFRegController *)self setVettedAliasesChangedBlock:0];
  [(CNFRegController *)self setResetBlock:0];
  [(CNFRegController *)self setServiceDidBecomeUnsupportedBlock:0];
  [(CNFRegController *)self setProfileChangedBlock:0];
  [(CNFRegController *)self setProfileStatusChangedBlock:0];
  [(CNFRegController *)self setAccountAuthorizationChangedBlock:0];
  [(CNFRegController *)self setAccountActivationChangedBlock:0];
}

- (void)setServiceEnabled:(BOOL)a3
{
  if ((*(unsigned char *)&self->_controllerFlags & 0x80000000) == 0)
  {
    if (a3)
    {
      [(CNFRegController *)self activateAccounts];
    }
    else
    {
      id v4 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v5 = 0;
        _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Deactivating all accounts due to serviceEnabled being set to NO", v5, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      [(CNFRegController *)self deactivateAccounts];
    }
  }
}

- (BOOL)isServiceEnabled
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = [(CNFRegController *)self activeAccounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v27;
    uint64_t v5 = *MEMORY[0x263F4A8D8];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v7 accountType] == 2)
        {
          uint64_t v19 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)long long v31 = v7;
            _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "Using account %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
            IMLogString();
          }
LABEL_31:
          BOOL v14 = 1;
          goto LABEL_33;
        }
        if ([v7 accountType] == 1)
        {
          if (![v7 canSendMessages]) {
            goto LABEL_31;
          }
          if ([v7 isRegistered]) {
            goto LABEL_31;
          }
          if ([v7 isActive])
          {
            uint64_t v8 = [v7 aliases];
            BOOL v9 = [v8 count] == 0;

            if (v9) {
              goto LABEL_31;
            }
          }
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v10 = [v7 aliases];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v10);
                }
                if (![*(id *)(*((void *)&v22 + 1) + 8 * j) isEqualToIgnoringCase:v5]
                  || [v7 isActive])
                {
                  uint64_t v15 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)long long v31 = v7;
                    _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Using account %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
                    IMLogString();
                  }

                  goto LABEL_31;
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v33 count:16];
      BOOL v14 = 0;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_33:

  int64_t v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [(CNFRegController *)self activeAccounts];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v31 = v14;
    *(_WORD *)&v31[4] = 2112;
    *(void *)&v31[6] = v17;
    _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "isServiceEnabled = %d (based on accounts %@)", buf, 0x12u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v20 = [(CNFRegController *)self activeAccounts];
    IMLogString();
  }
  return v14;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(CNFRegController *)self failedAccounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) isAccountKeyCDPSyncingOrWaitingForUser];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isServiceSupported
{
  uint64_t v3 = [MEMORY[0x263F3BB18] sharedInstance];
  int64_t v4 = [(CNFRegController *)self serviceType];
  if (v4)
  {
    if (v4 == 2)
    {
      char v5 = [v3 callingAvailable];
    }
    else
    {
      if (v4 != 1)
      {
        BOOL v6 = 0;
        goto LABEL_9;
      }
      char v5 = [v3 iMessageAvailable];
    }
  }
  else
  {
    char v5 = [v3 faceTimeAvailable];
  }
  BOOL v6 = v5;
LABEL_9:

  return v6;
}

- (BOOL)serviceSupportsDeviceAliasEnablement
{
  id v2 = [MEMORY[0x263F3BB18] sharedInstance];
  char v3 = [v2 supportsSMS];

  return v3;
}

- (BOOL)isConnected
{
  id v2 = [MEMORY[0x263F4A568] sharedInstance];
  char v3 = [v2 isConnected];

  return v3;
}

- (void)connect:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNFRegController *)self startListeningForAccountChanges];
  if (v3)
  {
    id v4 = [MEMORY[0x263F4A568] sharedInstance];
    [v4 blockUntilConnected];
  }
}

- (void)connect
{
}

- (void)deviceCapabilityChanged:(id)a3
{
  if (![(CNFRegController *)self isServiceSupported])
  {
    id v4 = [(CNFRegController *)self serviceDidBecomeUnsupportedBlock];

    if (v4)
    {
      char v5 = [(CNFRegController *)self serviceDidBecomeUnsupportedBlock];
      BOOL v6 = (void (**)(void))[v5 copy];

      v6[2]();
    }
  }
}

- (void)_postCallerIDChanged
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Posting caller ID change notification", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.ft.CallerID.changed", 0, 0, 1u);
}

- (void)_handleCallerIDChangedForResume:(id)a3
{
  id v4 = a3;
  char v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Application resumed, nuking caller ID caches", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegController *)self _nukeCallerIDCache];
}

- (void)_handleCallerIDChanged
{
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Caller ID changed remotely, nuking caches", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegController *)self _nukeCallerIDCache];
  id v4 = [(CNFRegController *)self callerIdChangedBlock];

  if (v4)
  {
    char v5 = [(CNFRegController *)self callerIdChangedBlock];
    BOOL v6 = (void (**)(void))[v5 copy];

    v6[2](v6);
  }
}

- (void)nukeAllCallerIDSettings
{
  BOOL v3 = [MEMORY[0x263F4A610] facetimeService];
  IMSetPreferredAccountForService();

  id v4 = [MEMORY[0x263F4A610] iMessageService];
  IMSetPreferredAccountForService();

  char v5 = [MEMORY[0x263F4A610] callService];
  IMSetPreferredAccountForService();

  [(CNFRegController *)self _nukeCallerIDCache];
  [(CNFRegController *)self _postCallerIDChanged];
}

- (void)_startListeningForCallerIDChanges
{
  if ((*(unsigned char *)&self->_controllerFlags & 2) == 0)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__handleCallerIDChangedForResume_ name:*MEMORY[0x263F833B8] object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__handleCallerIDChanged name:*MEMORY[0x263F4A4D8] object:0];

    *(unsigned char *)&self->_controllerFlags |= 2u;
  }
}

- (void)_stopListeningForCallerIDChanges
{
  if ((*(unsigned char *)&self->_controllerFlags & 2) != 0)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F833B8] object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F4A4D8] object:0];

    *(unsigned char *)&self->_controllerFlags &= ~2u;
  }
}

- (id)displayAccount
{
  id v2 = [(CNFRegController *)self firstService];
  BOOL v3 = IMPreferredAccountForService();

  return v3;
}

- (id)displayAlias
{
  BOOL v3 = [(CNFRegController *)self firstService];
  id v4 = IMPreferredAccountForService();
  char v5 = v4;
  if (!v4
    || ([v4 displayName], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v7 = (void *)v6,
        uint64_t v8 = [[CNFRegAlias alloc] initWithAccount:v5 alias:v6], v7, !v8))
  {
    long long v9 = [MEMORY[0x263F4A520] sharedInstance];
    long long v10 = [(CNFRegController *)self firstService];
    long long v11 = [v9 operationalAccountsForService:v10];

    if ([v11 count])
    {
      uint64_t v8 = [(CNFRegController *)self guessedDisplayAlias];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  long long v12 = [(CNFRegAlias *)v8 account];
  BOOL v13 = [(CNFRegAlias *)v8 alias];
  [v12 setDisplayName:v13];

  return v8;
}

- (BOOL)setDisplayAlias:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Request to set the display alias: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogIndent();
  uint64_t v6 = [(CNFRegController *)self accounts];
  id v7 = [v4 account];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    long long v9 = [v4 account];
    long long v10 = [v4 account];
    long long v11 = [v10 service];
    IMSetPreferredAccountForService();

    [(CNFRegController *)self _postCallerIDChanged];
    long long v12 = [v4 account];
    BOOL v13 = [v4 alias];
    [v12 setDisplayName:v13];
  }
  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Not setting because the alias's account is not in our list of managed accounts", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  CNFRegLogOutdent();

  return 0;
}

- (id)_logName
{
  logName = self->_logName;
  if (!logName)
  {
    id v4 = [NSString alloc];
    [(CNFRegController *)self serviceType];
    char v5 = FTCServiceNameForServiceType();
    uint64_t v6 = (NSString *)[v4 initWithFormat:@"Controller[%@]", v5];
    id v7 = self->_logName;
    self->_logName = v6;

    logName = self->_logName;
  }
  return logName;
}

- (id)_logSpace
{
  if (self->_logIndent)
  {
    BOOL v3 = (__CFString *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:2 * self->_logIndent];
    if (self->_logIndent)
    {
      unint64_t v4 = 0;
      do
      {
        [(__CFString *)v3 appendString:@"  "];
        ++v4;
      }
      while (v4 < self->_logIndent);
    }
    [(__CFString *)v3 appendString:@"=> "];
  }
  else
  {
    BOOL v3 = &stru_26D05D4F8;
  }
  return v3;
}

- (void)_incrementLogIndent
{
}

- (void)_decrementLogIndent
{
  unint64_t logIndent = self->_logIndent;
  if (logIndent) {
    self->_unint64_t logIndent = logIndent - 1;
  }
}

- (id)accountRegistrationBlock
{
  return self->_accountRegistrationBlock;
}

- (void)setAccountRegistrationBlock:(id)a3
{
}

- (id)accountAddedBlock
{
  return self->_accountAddedBlock;
}

- (void)setAccountAddedBlock:(id)a3
{
}

- (id)accountRemovedBlock
{
  return self->_accountRemovedBlock;
}

- (void)setAccountRemovedBlock:(id)a3
{
}

- (id)callerIdChangedBlock
{
  return self->_callerIdChangedBlock;
}

- (void)setCallerIdChangedBlock:(id)a3
{
}

- (id)aliasStatusChangedBlock
{
  return self->_aliasStatusChangedBlock;
}

- (void)setAliasStatusChangedBlock:(id)a3
{
}

- (id)aliasAddedBlock
{
  return self->_aliasAddedBlock;
}

- (void)setAliasAddedBlock:(id)a3
{
}

- (id)aliasRemovedBlock
{
  return self->_aliasRemovedBlock;
}

- (void)setAliasRemovedBlock:(id)a3
{
}

- (id)vettedAliasesChangedBlock
{
  return self->_vettedAliasesChangedBlock;
}

- (void)setVettedAliasesChangedBlock:(id)a3
{
}

- (id)resetBlock
{
  return self->_resetBlock;
}

- (void)setResetBlock:(id)a3
{
}

- (id)serviceDidBecomeUnsupportedBlock
{
  return self->_serviceDidBecomeUnsupportedBlock;
}

- (void)setServiceDidBecomeUnsupportedBlock:(id)a3
{
}

- (id)profileChangedBlock
{
  return self->_profileChangedBlock;
}

- (void)setProfileChangedBlock:(id)a3
{
}

- (id)profileStatusChangedBlock
{
  return self->_profileStatusChangedBlock;
}

- (void)setProfileStatusChangedBlock:(id)a3
{
}

- (id)accountAuthorizationChangedBlock
{
  return self->_accountAuthorizationChangedBlock;
}

- (void)setAccountAuthorizationChangedBlock:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (id)accountActivationChangedBlock
{
  return self->_accountActivationChangedBlock;
}

- (void)setAccountActivationChangedBlock:(id)a3
{
}

- (id)willLaunchURLBlock
{
  return self->_willLaunchURLBlock;
}

- (void)setWillLaunchURLBlock:(id)a3
{
}

- (void)setPhoneSubscriptionSelector:(id)a3
{
}

- (void)set_temporaryDeviceAliases:(id)a3
{
}

- (NSDictionary)cachedCallerIDMap
{
  return self->_cachedCallerIDMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCallerIDMap, 0);
  objc_storeStrong((id *)&self->__temporaryDeviceAliases, 0);
  objc_storeStrong((id *)&self->_phoneSubscriptionSelector, 0);
  objc_storeStrong((id *)&self->_systemAccount, 0);
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_wifiAlertWatchTimer, 0);
  objc_storeStrong(&self->_serviceDidBecomeUnsupportedBlock, 0);
  objc_storeStrong(&self->_resetBlock, 0);
  objc_storeStrong((id *)&self->_springboardNetworkFlagQueue, 0);
  objc_storeStrong(&self->_willLaunchURLBlock, 0);
  objc_storeStrong(&self->_accountActivationChangedBlock, 0);
  objc_storeStrong(&self->_accountAuthorizationChangedBlock, 0);
  objc_storeStrong(&self->_profileStatusChangedBlock, 0);
  objc_storeStrong(&self->_profileChangedBlock, 0);
  objc_storeStrong(&self->_vettedAliasesChangedBlock, 0);
  objc_storeStrong(&self->_aliasAddedBlock, 0);
  objc_storeStrong(&self->_aliasRemovedBlock, 0);
  objc_storeStrong(&self->_aliasStatusChangedBlock, 0);
  objc_storeStrong(&self->_accountRemovedBlock, 0);
  objc_storeStrong(&self->_accountAddedBlock, 0);
  objc_storeStrong(&self->_callerIdChangedBlock, 0);
  objc_storeStrong(&self->_accountRegistrationBlock, 0);
  objc_storeStrong((id *)&self->_accountFilterCache, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

- (void)showSetupFaceTimeOverCellularAlertWithCompletion:(id)a3
{
  id v10 = a3;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE50];
  uint64_t v6 = (void *)CFPreferencesCopyValue(@"CarrierName", @"com.apple.carrier", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v7 = (void *)CFPreferencesCopyValue(@"TetheringPhoneNumber", @"com.apple.carrier", v4, v5);
  int v8 = (void *)CFPreferencesCopyValue(@"TetheringURL", @"com.apple.carrier", v4, v5);
  if (v8) {
    long long v9 = (void *)[objc_alloc(NSURL) initWithString:v8];
  }
  else {
    long long v9 = 0;
  }
  [(CNFRegController *)self showSetupFaceTimeOverCellularAlertForServiceProviderName:v6 serviceProviderPhoneNumber:v7 serviceProviderURL:v9 completion:v10];
}

- (void)showSetupFaceTimeOverCellularAlertForServiceProviderName:(id)a3 serviceProviderPhoneNumber:(id)a4 serviceProviderURL:(id)a5 completion:(id)a6
{
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v58 = self;
  CNFRegSetStringTableForServiceType([(CNFRegController *)self serviceType]);
  BOOL v13 = CommunicationsSetupUIBundle();
  uint64_t v14 = CNFRegStringTableName();
  uint64_t v15 = [v13 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v14];

  uint64_t v16 = [v10 length];
  long long v59 = v11;
  if (v11 || v16)
  {
    uint64_t v28 = [v10 length];
    if (v11)
    {
      id v17 = v10;
      long long v26 = (void *)v15;
      if (!v28)
      {
        long long v33 = NSString;
        long long v24 = CommunicationsSetupUIBundle();
        long long v25 = CNFStringKeyForNetwork(@"FACETIME_SETTINGS_SETUP_CELLULAR_NO_NUMBER");
        long long v27 = CNFRegStringTableName();
        long long v30 = [v24 localizedStringForKey:v25 value:&stru_26D05D4F8 table:v27];
        uint64_t v34 = [v59 absoluteString];
        long long v23 = objc_msgSend(v33, "stringWithFormat:", v30, v34);

        goto LABEL_11;
      }
      [v10 length];
    }
    else
    {
      id v17 = v10;
      long long v26 = (void *)v15;
      if (v28)
      {
        long long v29 = NSString;
        long long v24 = CommunicationsSetupUIBundle();
        long long v25 = CNFStringKeyForNetwork(@"FACETIME_SETTINGS_SETUP_CELLULAR_NO_URL");
        long long v27 = CNFRegStringTableName();
        long long v30 = [v24 localizedStringForKey:v25 value:&stru_26D05D4F8 table:v27];
        long long v23 = objc_msgSend(v29, "stringWithFormat:", v30, v60, v10);
LABEL_11:

        goto LABEL_12;
      }
    }
    long long v31 = NSString;
    long long v24 = CommunicationsSetupUIBundle();
    long long v25 = CNFStringKeyForNetwork(@"FACETIME_SETTINGS_SETUP_CELLULAR_ALL_INFO");
    long long v27 = CNFRegStringTableName();
    long long v30 = [v24 localizedStringForKey:v25 value:&stru_26D05D4F8 table:v27];
    long long v32 = [v59 absoluteString];
    long long v23 = objc_msgSend(v31, "stringWithFormat:", v30, v60, v17, v32);

    goto LABEL_11;
  }
  id v17 = v10;
  uint64_t v18 = NSString;
  uint64_t v19 = CommunicationsSetupUIBundle();
  uint64_t v20 = CNFStringKeyForNetwork(@"FACETIME_SETTINGS_SETUP_CELLULAR_NO_INFO");
  long long v21 = CNFRegStringTableName();
  long long v22 = [v19 localizedStringForKey:v20 value:&stru_26D05D4F8 table:v21];
  long long v23 = objc_msgSend(v18, "stringWithFormat:", v22, v60);

  long long v24 = CommunicationsSetupUIBundle();
  long long v25 = CNFRegStringTableName();
  long long v26 = [v24 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v25];
  long long v27 = (void *)v15;
LABEL_12:

  uint64_t v35 = (void *)MEMORY[0x263F82418];
  uint64_t v36 = CommunicationsSetupUIBundle();
  BOOL v37 = CNFRegStringTableName();
  uint64_t v38 = [v36 localizedStringForKey:@"FACETIME_SETTINGS_SETUP_CELLULAR_TITLE" value:&stru_26D05D4F8 table:v37];
  long long v39 = [v35 alertControllerWithTitle:v38 message:v23 preferredStyle:1];

  long long v40 = (void *)MEMORY[0x263F82400];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke;
  v67[3] = &unk_2644F0890;
  id v41 = v12;
  id v68 = v41;
  id v42 = [v40 actionWithTitle:v26 style:1 handler:v67];
  [v39 addAction:v42];

  if ([v17 length])
  {
    __int16 v43 = [MEMORY[0x263F3BB18] sharedInstance];
    int v44 = [v43 isTelephonyDevice];

    if (v44)
    {
      __int16 v45 = (void *)MEMORY[0x263F82400];
      id v46 = CommunicationsSetupUIBundle();
      __int16 v47 = CNFRegStringTableName();
      __int16 v48 = [v46 localizedStringForKey:@"FACETIME_SETTINGS_MAKE_PHONE_CALL" value:&stru_26D05D4F8 table:v47];
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_2;
      v64[3] = &unk_2644F08B8;
      v64[4] = v58;
      id v65 = v17;
      id v66 = v41;
      id v49 = [v45 actionWithTitle:v48 style:0 handler:v64];
      [v39 addAction:v49];
    }
  }
  if (v59)
  {
    __int16 v50 = (void *)MEMORY[0x263F82400];
    uint64_t v51 = CommunicationsSetupUIBundle();
    __int16 v52 = CNFRegStringTableName();
    id v53 = [v51 localizedStringForKey:@"FACETIME_SETTINGS_VISIT_WEBSITE" value:&stru_26D05D4F8 table:v52];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_3;
    v61[3] = &unk_2644F08B8;
    v61[4] = v58;
    id v62 = v59;
    id v63 = v41;
    uint64_t v54 = [v50 actionWithTitle:v53 style:0 handler:v61];
    [v39 addAction:v54];
  }
  __int16 v55 = [MEMORY[0x263F82438] sharedApplication];
  long long v56 = [v55 keyWindow];
  uint64_t v57 = [v56 rootViewController];

  [v57 presentViewController:v39 animated:1 completion:0];
}

uint64_t __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  BOOL v3 = [NSURL telephonyURLWithDestinationID:a1[5]];
  [v2 openURL:v3];

  uint64_t result = a1[6];
  if (result)
  {
    CFStringRef v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __142__CNFRegController_Alerts__showSetupFaceTimeOverCellularAlertForServiceProviderName_serviceProviderPhoneNumber_serviceProviderURL_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) openURL:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)__filter_appleIDAccountPredicate
{
  if (__filter_appleIDAccountPredicate_once != -1) {
    dispatch_once(&__filter_appleIDAccountPredicate_once, &__block_literal_global_3);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_appleIDAccountPredicate_predicate);
  return v2;
}

uint64_t __63__CNFRegController_Filtering____filter_appleIDAccountPredicate__block_invoke()
{
  __filter_appleIDAccountPredicate_predicate = [&__block_literal_global_43 copy];
  return MEMORY[0x270F9A758]();
}

BOOL __63__CNFRegController_Filtering____filter_appleIDAccountPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 accountType];
    if (!v4)
    {
      CFStringRef v5 = [MEMORY[0x263F3BB18] sharedInstance];
      int v6 = [v5 isTelephonyDevice];

      if (v6) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 1;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4 == 1;
}

- (id)__filter_phoneAccountPredicate
{
  if (__filter_phoneAccountPredicate_once != -1) {
    dispatch_once(&__filter_phoneAccountPredicate_once, &__block_literal_global_45);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_phoneAccountPredicate_predicate);
  return v2;
}

uint64_t __61__CNFRegController_Filtering____filter_phoneAccountPredicate__block_invoke()
{
  __filter_phoneAccountPredicate_predicate = [&__block_literal_global_47 copy];
  return MEMORY[0x270F9A758]();
}

BOOL __61__CNFRegController_Filtering____filter_phoneAccountPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 accountType];
    if (!v4)
    {
      CFStringRef v5 = [MEMORY[0x263F3BB18] sharedInstance];
      int v6 = [v5 isTelephonyDevice];

      if (v6) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 1;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4 == 2;
}

- (id)__filter_activeAccountsPredicate
{
  if (__filter_activeAccountsPredicate_once != -1) {
    dispatch_once(&__filter_activeAccountsPredicate_once, &__block_literal_global_49);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_activeAccountsPredicate_predicate);
  return v2;
}

uint64_t __63__CNFRegController_Filtering____filter_activeAccountsPredicate__block_invoke()
{
  __filter_activeAccountsPredicate_predicate = [&__block_literal_global_51 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __63__CNFRegController_Filtering____filter_activeAccountsPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (id)__filter_inactiveAccountsPredicate
{
  if (__filter_inactiveAccountsPredicate_once != -1) {
    dispatch_once(&__filter_inactiveAccountsPredicate_once, &__block_literal_global_53);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_inactiveAccountsPredicate_predicate);
  return v2;
}

uint64_t __65__CNFRegController_Filtering____filter_inactiveAccountsPredicate__block_invoke()
{
  __filter_inactiveAccountsPredicate_predicate = [&__block_literal_global_55 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __65__CNFRegController_Filtering____filter_inactiveAccountsPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isActive] ^ 1;
}

- (id)__filter_failedAccountsPredicate
{
  if (__filter_failedAccountsPredicate_once != -1) {
    dispatch_once(&__filter_failedAccountsPredicate_once, &__block_literal_global_57);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_failedAccountsPredicate_predicate);
  return v2;
}

uint64_t __63__CNFRegController_Filtering____filter_failedAccountsPredicate__block_invoke()
{
  __filter_failedAccountsPredicate_predicate = [&__block_literal_global_59 copy];
  return MEMORY[0x270F9A758]();
}

BOOL __63__CNFRegController_Filtering____filter_failedAccountsPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 registrationStatus] == -1;
}

- (id)__filter_validatedAliasPredicate
{
  if (__filter_validatedAliasPredicate_once != -1) {
    dispatch_once(&__filter_validatedAliasPredicate_once, &__block_literal_global_61);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_validatedAliasPredicate_predicate);
  return v2;
}

uint64_t __63__CNFRegController_Filtering____filter_validatedAliasPredicate__block_invoke()
{
  __filter_validatedAliasPredicate_predicate = [&__block_literal_global_63 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __63__CNFRegController_Filtering____filter_validatedAliasPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if ([v2 canSendMessages])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    BOOL v3 = objc_msgSend(v2, "aliases", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if ([v2 validationStatusForAlias:*(void *)(*((void *)&v8 + 1) + 8 * i)] == 3)
          {
            uint64_t v4 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (id)__filter_signInCompletePredicate
{
  if (__filter_signInCompletePredicate_once != -1) {
    dispatch_once(&__filter_signInCompletePredicate_once, &__block_literal_global_65);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_signInCompletePredicate_predicate);
  return v2;
}

uint64_t __63__CNFRegController_Filtering____filter_signInCompletePredicate__block_invoke()
{
  __filter_signInCompletePredicate_predicate = [&__block_literal_global_67 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __63__CNFRegController_Filtering____filter_signInCompletePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 CNFRegSignInComplete];
}

- (id)__filter_validatedProfilePredicate
{
  if (__filter_validatedProfilePredicate_once != -1) {
    dispatch_once(&__filter_validatedProfilePredicate_once, &__block_literal_global_69);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_validatedProfilePredicate_predicate);
  return v2;
}

uint64_t __65__CNFRegController_Filtering____filter_validatedProfilePredicate__block_invoke()
{
  __filter_validatedProfilePredicate_predicate = [&__block_literal_global_71 copy];
  return MEMORY[0x270F9A758]();
}

BOOL __65__CNFRegController_Filtering____filter_validatedProfilePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = v2;
  BOOL v7 = !v2
    || (uint64_t v4 = [v2 accountType], v4 != 1)
    && (v4
     || ([MEMORY[0x263F3BB18] sharedInstance],
         uint64_t v5 = objc_claimAutoreleasedReturnValue(),
         char v6 = [v5 isTelephonyDevice],
         v5,
         (v6 & 1) != 0))
    || [v3 profileValidationStatus] == 3;

  return v7;
}

- (id)__filter_signedInPredicate
{
  if (__filter_signedInPredicate_once != -1) {
    dispatch_once(&__filter_signedInPredicate_once, &__block_literal_global_73);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_signedInPredicate_predicate);
  return v2;
}

uint64_t __57__CNFRegController_Filtering____filter_signedInPredicate__block_invoke()
{
  __filter_signedInPredicate_predicate = [&__block_literal_global_76 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __57__CNFRegController_Filtering____filter_signedInPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 CNFRegIsSignedOut] ^ 1;
}

- (id)__filter_operationalPredicate
{
  if (__filter_operationalPredicate_once != -1) {
    dispatch_once(&__filter_operationalPredicate_once, &__block_literal_global_78);
  }
  id v2 = (void *)MEMORY[0x223C3AA40](__filter_operationalPredicate_predicate);
  return v2;
}

uint64_t __60__CNFRegController_Filtering____filter_operationalPredicate__block_invoke()
{
  __filter_operationalPredicate_predicate = [&__block_literal_global_80 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t __60__CNFRegController_Filtering____filter_operationalPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOperational]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 canSendMessages] ^ 1;
  }

  return v3;
}

- (void)_clearFilterCache
{
  self->_accountFilterCache = 0;
  MEMORY[0x270F9A758]();
}

- (id)accountsWithFilter:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CNFRegController *)self _predicatesWithFilter:a3];
  if (!self->_accountFilterCache)
  {
    long long v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accountFilterCache = self->_accountFilterCache;
    self->_accountFilterCache = v8;
  }
  long long v10 = [NSNumber numberWithInteger:a3];
  long long v11 = [(NSMutableDictionary *)self->_accountFilterCache objectForKey:v10];
  if (!v11)
  {
    long long v11 = [(CNFRegController *)self _accountsPassingTests:v7 message:v6];
    if (v11) {
      [(NSMutableDictionary *)self->_accountFilterCache setObject:v11 forKey:v10];
    }
  }

  return v11;
}

- (id)accountsWithFilter:(int64_t)a3
{
  return [(CNFRegController *)self accountsWithFilter:a3 message:0];
}

- (id)_accountsPassingTests:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = [(CNFRegController *)self accounts];
  BOOL v7 = v6;
  if (!v6
    || ![v6 count]
    || ([v7 CNFRegArrayPassingTests:v5], (long long v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v8 = [MEMORY[0x263EFF8C0] array];
  }

  return v8;
}

- (id)_predicatesWithFilter:(int64_t)a3
{
  if (!a3)
  {
    id v5 = 0;
    goto LABEL_24;
  }
  int v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((v3 & 4) != 0)
  {
    id v6 = [(CNFRegController *)self __filter_appleIDAccountPredicate];
    [v5 addObject:v6];

    if ((v3 & 8) == 0)
    {
LABEL_4:
      if ((v3 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_4;
  }
  BOOL v7 = [(CNFRegController *)self __filter_phoneAccountPredicate];
  [v5 addObject:v7];

  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  long long v8 = [(CNFRegController *)self __filter_activeAccountsPredicate];
  [v5 addObject:v8];

  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  long long v9 = [(CNFRegController *)self __filter_inactiveAccountsPredicate];
  [v5 addObject:v9];

  if ((v3 & 0x2000) == 0)
  {
LABEL_7:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  long long v10 = [(CNFRegController *)self __filter_failedAccountsPredicate];
  [v5 addObject:v10];

  if ((v3 & 0x4000) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  long long v11 = [(CNFRegController *)self __filter_validatedAliasPredicate];
  [v5 addObject:v11];

  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  id v12 = [(CNFRegController *)self __filter_signInCompletePredicate];
  [v5 addObject:v12];

  if ((v3 & 0x800) == 0)
  {
LABEL_10:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v14 = [(CNFRegController *)self __filter_signedInPredicate];
    [v5 addObject:v14];

    if ((v3 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v13 = [(CNFRegController *)self __filter_validatedProfilePredicate];
  [v5 addObject:v13];

  if ((v3 & 0x8000) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((v3 & 0x10000) != 0)
  {
LABEL_23:
    uint64_t v15 = [(CNFRegController *)self __filter_operationalPredicate];
    [v5 addObject:v15];
  }
LABEL_24:
  return v5;
}

- (NSArray)phoneAccounts
{
  return (NSArray *)[(CNFRegController *)self accountsWithFilter:8 message:@"Getting list of phone accounts"];
}

- (NSArray)appleIDAccounts
{
  return (NSArray *)[(CNFRegController *)self accountsWithFilter:4 message:@"Getting list of apple ID accounts"];
}

- (id)activeAccounts
{
  return [(CNFRegController *)self accountsWithFilter:1 message:@"Getting list of active accounts"];
}

- (NSArray)failedAccounts
{
  return (NSArray *)[(CNFRegController *)self accountsWithFilter:0x2000 message:@"Getting list of failed accounts"];
}

- (id)guessedAccountName
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v3 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithEffectiveBundleID:@"com.apple.account.Madrid"];
  uint64_t v4 = objc_msgSend(v3, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:", 0);

  if (v4)
  {
    id v5 = @"CNFRegAccountTypeIdentifieriMessage";
  }
  else
  {
    id v6 = (void *)[objc_alloc((Class)CUTWeakLinkClass()) initWithEffectiveBundleID:@"com.apple.account.FaceTime"];
    uint64_t v4 = objc_msgSend(v6, "aa_recommendedAppleIDForAccountSignInWithTypeIdentifier:", 0);

    id v5 = @"CNFRegAccountTypeIdentifierFaceTime";
  }
  long long v22 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v7 = [(CNFRegController *)self accounts];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        if (!v4)
        {
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (v11)
          {
            uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) accountType];
            if (v12 == 1
              || !v12
              && ([MEMORY[0x263F3BB18] sharedInstance],
                  uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                  char v14 = [v13 isTelephonyDevice],
                  v13,
                  (v14 & 1) == 0))
            {
              uint64_t v15 = [(CNFRegController *)self loginForAccount:v11];
              if (v15)
              {

                long long v22 = @"a previous login";
                uint64_t v4 = (void *)v15;
                goto LABEL_22;
              }
            }
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (v4) {
    goto LABEL_22;
  }
  uint64_t v4 = [MEMORY[0x263EFFA40] CNFRegSavedAccountName];
  if (v4)
  {
    uint64_t v16 = @"a previously successful account name";
LABEL_20:
    long long v22 = v16;
LABEL_22:
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v4;
      __int16 v29 = 2112;
      long long v30 = v22;
      _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "Guessed account name (%@) from %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    goto LABEL_27;
  }
  if (CNFRegGetSSAccountStoreClass())
  {
    uint64_t v19 = [CNFRegGetSSAccountStoreClass() defaultStore];
    uint64_t v20 = [v19 activeAccount];
    uint64_t v4 = [v20 accountName];

    if (v4)
    {
      uint64_t v16 = @"iTunes";
      goto LABEL_20;
    }
  }
  long long v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Could not guess account name", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v4 = 0;
LABEL_27:
  return v4;
}

- (id)guessedAlias
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v3 = [(CNFRegController *)self accounts];
  if ([v3 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v4 = [(CNFRegController *)self aliases];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v8 type] == 1 && objc_msgSend(v8, "validationStatus") != 3)
          {
            uint64_t v5 = [v8 alias];
            uint64_t v9 = @"an un-registered alias";
            goto LABEL_14;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    uint64_t v9 = 0;
LABEL_14:
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v5 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        if (!v5)
        {
          char v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if (v14)
          {
            uint64_t v15 = [*(id *)(*((void *)&v23 + 1) + 8 * j) accountType];
            if (v15 == 1
              || !v15
              && ([MEMORY[0x263F3BB18] sharedInstance],
                  uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                  char v17 = [v16 isTelephonyDevice],
                  v16,
                  (v17 & 1) == 0))
            {
              uint64_t v18 = [v14 login];
              uint64_t v19 = MEMORY[0x223C3A250]();

              if (v19 && [v19 length])
              {
                uint64_t v9 = @"an account login";
                goto LABEL_32;
              }
            }
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = (void *)v5;
LABEL_32:

  if (v9 && v19)
  {
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v9;
      _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_DEFAULT, "Guessed alias (%@) from %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_43:
    }
      IMLogString();
  }
  else
  {
    long long v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Could not guess alias", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      goto LABEL_43;
    }
  }

  return v19;
}

- (BOOL)_isValidCallerIDAlias:(id)a3 forAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if ([v6 hasAlias:v5]) {
      BOOL v8 = [v7 validationStatusForAlias:v5] == 3;
    }
    else {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)_guessedDisplayAliasFromAccounts:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = a3;
  uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v34 != v25)
        {
          uint64_t v5 = v4;
          objc_enumerationMutation(obj);
          uint64_t v4 = v5;
        }
        uint64_t v27 = v4;
        id v6 = *(void **)(*((void *)&v33 + 1) + 8 * v4);
        if ([v6 isActive])
        {
          BOOL v7 = [v6 aliases];
          BOOL v8 = [v7 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v10)
          {
            uint64_t v11 = 0;
            uint64_t v12 = *(void *)v30;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v30 != v12) {
                  objc_enumerationMutation(v9);
                }
                char v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                if ([(CNFRegController *)self _isValidCallerIDAlias:v14 forAccount:v6])
                {
                  if ([v6 typeForAlias:v14] == 2)
                  {
                    id v20 = v14;

                    uint64_t v11 = v20;
                    goto LABEL_28;
                  }
                  uint64_t v15 = [v6 loginDisplayString];
                  int v16 = [v15 isEqualToString:v14];

                  if (v11) {
                    int v17 = v16;
                  }
                  else {
                    int v17 = 1;
                  }
                  if (v17 == 1)
                  {
                    id v18 = v14;

                    uint64_t v11 = v18;
                  }
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v10) {
                continue;
              }
              break;
            }
LABEL_28:

            if (v11)
            {
              long long v22 = [[CNFRegAlias alloc] initWithAccount:v6 alias:v11];

              goto LABEL_39;
            }
          }
          else
          {
          }
        }
        else
        {
          uint64_t v19 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "Account is inactive. Skipping.", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
            IMLogString();
          }
        }
        long long v21 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "Could not find an alias", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        uint64_t v4 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }
  long long v22 = 0;
LABEL_39:

  return v22;
}

- (id)guessedDisplayAlias
{
  int v3 = [(CNFRegController *)self accountsWithFilter:65544];
  uint64_t v4 = [(CNFRegController *)self _guessedDisplayAliasFromAccounts:v3];

  if (!v4)
  {
    uint64_t v5 = [(CNFRegController *)self accountsWithFilter:65540];
    uint64_t v4 = [(CNFRegController *)self _guessedDisplayAliasFromAccounts:v5];
  }
  return v4;
}

- (void)openURL:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(CNFRegController *)self willLaunchURLBlock];

  if (v4)
  {
    uint64_t v5 = [(CNFRegController *)self willLaunchURLBlock];
    id v6 = (void (**)(void, void))[v5 copy];

    ((void (**)(void, id))v6)[2](v6, v8);
  }
  BOOL v7 = [MEMORY[0x263F01880] defaultWorkspace];
  [v7 openSensitiveURL:v8 withOptions:0];
}

- (BOOL)deviceHasSaneNetworkConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F3BB40] sharedInstance];
  int v3 = [v2 networkReachable];
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (v3) {
      uint64_t v5 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Device has reachable network : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (v3)
  {
    int v3 = [v2 networkActive];
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = @"NO";
      if (v3) {
        BOOL v7 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Device has active network : %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }

  return v3;
}

- (BOOL)deviceCanTakeNetworkAction
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(CNFRegController *)self deviceHasSaneNetworkConnection])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "- (BOOL)deviceCanTakeNetworkAction: Network not enabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    unint64_t v5 = [(CNFRegController *)self serviceType];
    if (v5 > 2) {
      id v6 = 0;
    }
    else {
      id v6 = off_2644F09A8[v5];
    }
    BOOL v7 = [MEMORY[0x263F4A848] sharedInstance];
    int v8 = [v7 isWiFiEnabled];
    int v9 = [v7 isDataSwitchEnabled];
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"NO";
      if (v8) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      if (v9) {
        uint64_t v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      long long v30 = v12;
      __int16 v31 = 2112;
      long long v32 = v11;
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "isWifiEnabled: %@, isCellularEnabled %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v13 = @"NO";
      if (v8) {
        char v14 = @"YES";
      }
      else {
        char v14 = @"NO";
      }
      if (v9) {
        uint64_t v13 = @"YES";
      }
      uint64_t v27 = v14;
      long long v28 = v13;
      IMLogString();
    }
    if ((v8 | v9) == 1)
    {
      uint64_t v15 = [MEMORY[0x263F3BB18] sharedInstance];
      int v16 = [v15 wifiAllowedForBundleId:v6];

      if ([(CNFRegController *)self serviceType] == 1)
      {
        int v17 = 1;
      }
      else
      {
        id v18 = [MEMORY[0x263F3BB18] sharedInstance];
        int v17 = [v18 nonWifiAvailableForBundleId:v6];
      }
      uint64_t v19 = objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance", v27, v28);
      int v20 = [v19 wifiAllowedForBundleId:@"com.apple.Preferences"];

      int v3 = (v16 | v17) & (v20 ^ 1);
      long long v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v22 = @"NO";
        if (v3) {
          long long v23 = @"YES";
        }
        else {
          long long v23 = @"NO";
        }
        if (v16) {
          long long v24 = @"YES";
        }
        else {
          long long v24 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        long long v30 = v23;
        if (v17) {
          uint64_t v25 = @"YES";
        }
        else {
          uint64_t v25 = @"NO";
        }
        __int16 v31 = 2112;
        long long v32 = v24;
        __int16 v33 = 2112;
        long long v34 = v25;
        if (v20) {
          long long v22 = @"YES";
        }
        __int16 v35 = 2112;
        long long v36 = v22;
        _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_DEFAULT, "- (BOOL)deviceCanTakeNetworkAction networkEnabled: %@, wifiAllowedForBundle %@, nonWifiAllowedForBundle %@, wifiAllowedForPreferences %@", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)networkSettingsURLAllowingCellular:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(CNFRegController *)self serviceType];
  if (v4 > 2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = off_2644F09A8[v4];
  }
  id v6 = [MEMORY[0x263F4A848] sharedInstance];
  int v7 = MGGetBoolAnswer();
  int v8 = @"prefs:root=WIFI";
  if (v7)
  {
    int v9 = [v6 isWiFiEnabled];
    uint64_t v10 = [MEMORY[0x263F3BB18] sharedInstance];
    int v11 = [v10 wifiAllowedForBundleId:v5];

    uint64_t v12 = @"prefs:root=WIFI&path=WIRELESS_APP_DATA_USAGE_ID";
    if (v11) {
      uint64_t v12 = @"prefs:root=WIFI";
    }
    if (v9) {
      int v8 = v12;
    }
  }
  if (v3)
  {
    uint64_t v13 = [MEMORY[0x263F3BB18] sharedInstance];
    int v14 = [v13 supportsCellularData];

    if (v14)
    {
      uint64_t v15 = [MEMORY[0x263F4A848] sharedInstance];
      int v16 = [v15 isAirplaneModeEnabled];

      uint64_t SIMStatus = CTSIMSupportGetSIMStatus();
      if (SIMStatus == *MEMORY[0x263F03078]) {
        int v18 = 1;
      }
      else {
        int v18 = v16;
      }
      if (!v18) {
        int v8 = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
      }
      if (v7 && SIMStatus != *MEMORY[0x263F03078])
      {
        int v19 = [v6 isDataSwitchEnabled];
        int v20 = [MEMORY[0x263F3BB18] sharedInstance];
        int v21 = [v20 nonWifiAvailableForBundleId:v5];

        long long v22 = @"prefs:root=MOBILE_DATA_SETTINGS_ID&path=WIRELESS_APP_DATA_USAGE_ID";
        if (v21) {
          long long v22 = v8;
        }
        if (v19) {
          int v8 = v22;
        }
        else {
          int v8 = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
        }
      }
    }
  }
  long long v23 = (void *)[objc_alloc(NSURL) initWithString:v8];

  return v23;
}

- (void)_showNetworkAlertWithMessage:(id)a3 andViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = CommunicationsSetupUIBundle();
  int v9 = CNFRegStringTableName();
  uint64_t v10 = [v8 localizedStringForKey:@"FACETIME_NETWORK_ERROR_TITLE" value:&stru_26D05D4F8 table:v9];

  int v11 = CommunicationsSetupUIBundle();
  uint64_t v12 = CNFRegStringTableName();
  uint64_t v13 = [v11 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v12];

  int v14 = CommunicationsSetupUIBundle();
  uint64_t v15 = CNFRegStringTableName();
  int v16 = [v14 localizedStringForKey:@"FACETIME_NETWORK_SETTINGS_BUTTON" value:&stru_26D05D4F8 table:v15];

  int v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v7 preferredStyle:1];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __76__CNFRegController_Network___showNetworkAlertWithMessage_andViewController___block_invoke;
  v22[3] = &unk_2644F0988;
  v22[4] = self;
  int v18 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:v22];
  [v17 addAction:v18];

  int v19 = [MEMORY[0x263F82400] actionWithTitle:v13 style:0 handler:0];
  [v17 addAction:v19];

  if (!v6)
  {
    int v20 = [MEMORY[0x263F82438] sharedApplication];
    int v21 = [v20 keyWindow];
    id v6 = [v21 rootViewController];
  }
  [v6 presentViewController:v17 animated:1 completion:0];
}

void __76__CNFRegController_Network___showNetworkAlertWithMessage_andViewController___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 networkSettingsURLAllowingCellular:1];
  [v1 openURL:v2];
}

- (void)showNetworkAlert:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263F3BB18] sharedInstance];
  int v6 = [v5 supportsCellularData];
  int v7 = [v5 supportsWiFi];
  int v8 = [v5 supportsWLAN];
  int v9 = v8;
  if (v6)
  {
    if ((v7 & 1) == 0)
    {
      uint64_t v10 = [@"FACETIME_NETWORK_ERROR_CELL" stringByAppendingString:@"_NO_WIFI"];
      goto LABEL_9;
    }
    if (v8)
    {
      uint64_t v10 = [@"FACETIME_NETWORK_ERROR_CELL" stringByAppendingString:@"_WLAN"];
LABEL_9:
      int v11 = (__CFString *)v10;
      goto LABEL_11;
    }
    int v11 = @"FACETIME_NETWORK_ERROR_CELL";
  }
  else if (v8)
  {
    int v11 = @"FACETIME_NETWORK_ERROR_WLAN";
  }
  else
  {
    int v11 = @"FACETIME_NETWORK_ERROR_WIFI";
  }
LABEL_11:
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v23 = v11;
    _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Showing network alert with key: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = @"NO";
    if (v6) {
      int v14 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    long long v23 = v14;
    _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "    isCellular:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = @"NO";
    if (v7) {
      int v16 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    long long v23 = v16;
    _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "  supportsWifi:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  int v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = @"NO";
    if (v9) {
      int v18 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    long long v23 = v18;
    _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "  supportsWLAN:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  int v19 = CommunicationsSetupUIBundle();
  int v20 = CNFRegStringTableName();
  int v21 = [v19 localizedStringForKey:v11 value:&stru_26D05D4F8 table:v20];
  [(CNFRegController *)self _showNetworkAlertWithMessage:v21 andViewController:v4];

  *(unsigned char *)&self->_controllerFlags |= 0x20u;
}

- (void)showNetworkAlertIfNecessary:(id)a3
{
  id v4 = a3;
  if (![(CNFRegController *)self deviceCanTakeNetworkAction]) {
    [(CNFRegController *)self showNetworkAlert:v4];
  }
}

- (void)showNetworkFirstRunAlert:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_controllerFlags & 0x20) == 0)
  {
    unint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Showing first-run wifi alert", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(CNFRegController *)self showNetworkAlertIfNecessary:v4];
    *(unsigned char *)&self->_controllerFlags |= 0x20u;
  }
}

- (void)resetNetworkFirstRunAlert
{
  char controllerFlags = *(unsigned char *)&self->_controllerFlags & 0xDF;
  *(unsigned char *)&self->_char controllerFlags = controllerFlags;
  if (self->_requiredWifiCount >= 1)
  {
    [(CNFRegController *)self _startWiFiAlertWatchTimer];
    char controllerFlags = (char)self->_controllerFlags;
  }
  *(unsigned char *)&self->_char controllerFlags = controllerFlags & 0xEF;
}

- (void)_wifiAlertWatchTimerFired:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (NSTimer *)a3;
  if (self->_wifiAlertWatchTimer == v4)
  {
    unint64_t v5 = [MEMORY[0x263F3BB40] sharedInstance];
    int v6 = [v5 validNetworkEnabled];
    int v7 = [v5 willSearchForNetwork];
    int v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = @"NO";
      if (v6) {
        uint64_t v10 = @"YES";
      }
      else {
        uint64_t v10 = @"NO";
      }
      if (v7) {
        int v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      int v18 = v10;
      __int16 v19 = 2112;
      int v20 = v9;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEBUG, "Network alert timer fired, enabled=%@, searching=%@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      int v11 = @"NO";
      if (v6) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      if (v7) {
        int v11 = @"YES";
      }
      uint64_t v15 = v12;
      int v16 = v11;
      IMLogString();
    }
    if ((v6 & v7 & 1) == 0)
    {
      uint64_t v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Stopping wifi alert watch timer due to completion", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      [(NSTimer *)self->_wifiAlertWatchTimer invalidate];
      wifiAlertWatchTimer = self->_wifiAlertWatchTimer;
      self->_wifiAlertWatchTimer = 0;

      [(CNFRegController *)self showNetworkFirstRunAlert:0];
    }
  }
}

- (void)_startWiFiAlertWatchTimer
{
  if (self->_wifiAlertWatchTimer) {
    return;
  }
  if ((*(unsigned char *)&self->_controllerFlags & 0x10) != 0)
  {
    id v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Not starting wifi alert because we're already responding to a WiFi picker", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      goto LABEL_14;
    }
  }
  else if ([(CNFRegController *)self deviceCanTakeNetworkAction])
  {
    BOOL v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Not starting wifi alert watch timer due to valid network route", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_14:
    }
      IMLogString();
  }
  else
  {
    unint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Starting wifi alert watch timer", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    int v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__wifiAlertWatchTimerFired_ selector:0 userInfo:1 repeats:1.0];
    wifiAlertWatchTimer = self->_wifiAlertWatchTimer;
    self->_wifiAlertWatchTimer = v6;

    *(unsigned char *)&self->_controllerFlags |= 0x10u;
  }
}

- (void)_stopWiFiAlertWatchTimer
{
  if (self->_wifiAlertWatchTimer)
  {
    BOOL v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Stopping wifi alert watch timer", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(NSTimer *)self->_wifiAlertWatchTimer invalidate];
    wifiAlertWatchTimer = self->_wifiAlertWatchTimer;
    self->_wifiAlertWatchTimer = 0;
  }
  *(unsigned char *)&self->_controllerFlags &= ~0x10u;
}

- (void)startRequiringWifi
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t requiredWifiCount = self->_requiredWifiCount;
    *(_DWORD *)buf = 134217984;
    int64_t v10 = requiredWifiCount;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Turning on wifi requirement with state [%ld]", buf, 0xCu);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && IMShouldLog()) {
    IMLogString();
  }
  int64_t v5 = self->_requiredWifiCount;
  if (!v5)
  {
    int v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "  Saving original network state for later", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    uint64_t v7 = SBSSpringBoardServerPort();
    MEMORY[0x223C3A3F0](v7, &self->_originalCellFlag, &self->_originalWifiFlag);
    int v8 = (id *)MEMORY[0x263F83300];
    self->_originalUsesBackgroundNetworuint64_t k = [(id)*MEMORY[0x263F83300] usesBackgroundNetwork];
    dispatch_async((dispatch_queue_t)self->_springboardNetworkFlagQueue, &__block_literal_global_4);
    [*v8 setUsesBackgroundNetwork:1];
    [(CNFRegController *)self _startWiFiAlertWatchTimer];
    int64_t v5 = self->_requiredWifiCount;
  }
  self->_int64_t requiredWifiCount = v5 + 1;
}

uint64_t __47__CNFRegController_Network__startRequiringWifi__block_invoke()
{
  v0 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_21ED18000, v0, OS_LOG_TYPE_DEFAULT, "Async setting app network flags: 1, 1", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v1 = SBSSpringBoardServerPort();
  return MEMORY[0x223C3A420](v1, 1, 1);
}

- (void)stopRequiringWifi
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t requiredWifiCount = self->_requiredWifiCount;
    *(_DWORD *)buf = 134217984;
    int64_t v12 = requiredWifiCount;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "Turning off wifi requirement with state [%ld]", buf, 0xCu);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && IMShouldLog()) {
    IMLogString();
  }
  int64_t v5 = self->_requiredWifiCount;
  if (v5 == 1)
  {
    int v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "  Setting network back to its original state", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    springboardNetworkFlagQueue = self->_springboardNetworkFlagQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__CNFRegController_Network__stopRequiringWifi__block_invoke;
    block[3] = &unk_2644F04A0;
    block[4] = self;
    dispatch_async(springboardNetworkFlagQueue, block);
    [(id)*MEMORY[0x263F83300] setUsesBackgroundNetwork:self->_originalUsesBackgroundNetwork];
    [(CNFRegController *)self _stopWiFiAlertWatchTimer];
    int64_t v5 = self->_requiredWifiCount;
  }
  BOOL v8 = v5 < 1;
  int64_t v9 = v5 - 1;
  if (!v8) {
    self->_int64_t requiredWifiCount = v9;
  }
}

uint64_t __46__CNFRegController_Network__stopRequiringWifi__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(v3 + 185);
    LODWORD(v3) = *(unsigned __int8 *)(v3 + 184);
    *(_DWORD *)buf = 67109376;
    int v8 = v4;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Async setting app network flags: %d %d", buf, 0xEu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  uint64_t v5 = SBSSpringBoardServerPort();
  return MEMORY[0x223C3A420](v5, *(unsigned __int8 *)(*(void *)(a1 + 32) + 185), *(unsigned __int8 *)(*(void *)(a1 + 32) + 184));
}

- (void)__updateSystemAccount
{
  if (self->_systemAccountType == -1)
  {
    uint64_t v3 = [(CNFRegController *)self appleIDAccounts];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = 0;
      int64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F4A520] sharedInstance];
      int v8 = [(CNFRegController *)self firstService];
      objc_msgSend(v7, "__iCloudSystemAccountForService:", v8);
      uint64_t v5 = (IMAccount *)objc_claimAutoreleasedReturnValue();

      int64_t v6 = v5 != 0;
    }
    self->_systemAccountType = v6;
    systemAccount = self->_systemAccount;
    self->_systemAccount = v5;
  }
}

- (BOOL)hasSystemAccount
{
  return self->_systemAccountType > 0;
}

- (IMAccount)systemAccount
{
  [(CNFRegController *)self __updateSystemAccount];
  systemAccount = self->_systemAccount;
  return systemAccount;
}

- (int64_t)systemAccountType
{
  return self->_systemAccountType;
}

- (void)refreshSystemAccount
{
  systemAccount = self->_systemAccount;
  self->_systemAccount = 0;

  self->_systemAccountType = -1;
}

- (void)accountRegistrationChanged:(void *)a1 .cold.1(void *a1)
{
  objc_end_catch();
}

- (void)accountRegistrationChanged:(void *)a1 .cold.7(void *a1)
{
  objc_end_catch();
}

@end
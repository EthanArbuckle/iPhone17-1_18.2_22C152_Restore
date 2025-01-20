@interface IDSDAccountController
+ (BOOL)isDefaultPairedDeviceFromID:(id)a3 accountUniqueID:(id)a4 serviceName:(id)a5;
+ (IDSDAccountController)sharedInstance;
- (BOOL)_isAccountInfoRegistered:(id)a3;
- (BOOL)_loadAndEnableStoredAccounts;
- (BOOL)accountsLoaded;
- (BOOL)hasActiveSMSAccount;
- (BOOL)hasForcedReRegistered;
- (BOOL)hasHardDeregistered;
- (BOOL)hasiCloudAccount;
- (BOOL)isEnabledAccount:(id)a3;
- (BOOL)isLoading;
- (BOOL)isLocalSetupEnabled;
- (BOOL)isTraditionalLocalSetupEnabled;
- (BOOL)isiCloudHSA2;
- (BOOL)isiCloudSignedIn;
- (BOOL)isiTunesSignedIn;
- (CUTDeferredTaskQueue)storeAccountTask;
- (IDSDAccountController)init;
- (IDSDAccountController)initWithServiceController:(id)a3 registrationController:(id)a4 systemAccountAdapter:(id)a5 deviceSupport:(id)a6;
- (IDSDAccountControllerDelegate)delegate;
- (NSArray)accounts;
- (NSSet)enabledAccounts;
- (id)_createAccountWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5;
- (id)_inUseProfileIDs;
- (id)_inUseUsernames;
- (id)_legacyAccountsOnService:(id)a3;
- (id)_preferencesOnDomain:(id)a3;
- (id)_strippedAccountInfo:(id)a3;
- (id)accountOnService:(id)a3 withAliasURI:(id)a4;
- (id)accountOnService:(id)a3 withLoginID:(id)a4;
- (id)accountOnService:(id)a3 withVettedAliasURI:(id)a4;
- (id)accountUniqueIDsWithType:(int)a3;
- (id)accountWithServiceName:(id)a3 aliasURI:(id)a4;
- (id)accountWithServiceName:(id)a3 loginID:(id)a4;
- (id)accountWithServiceName:(id)a3 myID:(id)a4;
- (id)accountWithUniqueID:(id)a3;
- (id)accountsOfAdHocType:(unsigned int)a3;
- (id)accountsOnService:(id)a3;
- (id)accountsOnService:(id)a3 withType:(int)a4;
- (id)accountsWithType:(int)a3;
- (id)appleIDAccountOnService:(id)a3;
- (id)cloudPairedIDForDeviceID:(id)a3;
- (id)daemon;
- (id)deviceCertificateForService:(id)a3 uri:(id)a4;
- (id)deviceIDForPushToken:(id)a3;
- (id)deviceNameForDeviceID:(id)a3;
- (id)enabledAccountsOnService:(id)a3;
- (id)existingAccountOnService:(id)a3 withType:(int)a4 loginID:(id)a5;
- (id)localAccountOnService:(id)a3;
- (id)primaryAccountForAdHocAccount:(id)a3;
- (id)propertiesForDeviceWithUniqueID:(id)a3;
- (id)publicKeyForDeviceID:(id)a3;
- (id)pushTokenForDeviceID:(id)a3;
- (id)registeredAccountsOnService:(id)a3;
- (id)registeredLocalURIsOnService:(id)a3;
- (id)registrationListener;
- (id)threadSafeServiceWithAccountUniqueID:(id)a3;
- (id)userDefaults;
- (void)_addAccount:(id)a3;
- (void)_addAccountDuringInitialSetup:(id)a3;
- (void)_attachOrphanedPhoneAliases:(id)a3 toRecipientAccounts:(id)a4 withAccountsToEnable:(id)a5;
- (void)_cleanUpAccountCredentialForRemovedAccount:(id)a3;
- (void)_cleanUpAccountCredentialStore;
- (void)_cleanupLegacyAccounts;
- (void)_cleanupLegacyLocalAccounts;
- (void)_cleanupLocalAccounts;
- (void)_disableAccountWithUniqueID:(id)a3;
- (void)_disablePrimaryAccountWithUniqueID:(id)a3 userAction:(BOOL)a4;
- (void)_enableAccountWithUniqueID:(id)a3;
- (void)_forceDisableAccountWithUniqueID:(id)a3;
- (void)_forceDisablePrimaryAccountWithUniqueID:(id)a3;
- (void)_kickRemoteCacheWipe;
- (void)_loadAndEnableStoredLegacyAccounts;
- (void)_migrateLegacyAccounts;
- (void)_migrateLegacyAccounts1;
- (void)_migrateLegacyAccounts2;
- (void)_persistAccounts:(id)a3;
- (void)_refreshLocalAccounts;
- (void)_registerForAllRegistrationsSucceeded;
- (void)_registerStateToSysdiagnoseWithLogTitle:(id)a3 queue:(id)a4 block:(id)a5;
- (void)_removeAccount:(id)a3;
- (void)_removePrimaryAccount:(id)a3;
- (void)_resumeGDRReAuthenticateIfNecessary;
- (void)_servicesChanged;
- (void)_servicesRemoved:(id)a3;
- (void)_setupAdHocAccounts;
- (void)_setupAdHocAccountsForPrimaryAccount:(id)a3;
- (void)_setupForLocal;
- (void)_setupLinkedAccounts;
- (void)_setupLocalAccounts;
- (void)_storeAccounts;
- (void)_updateDeviceProperties;
- (void)addAccount:(id)a3;
- (void)addPrimaryAccount:(id)a3;
- (void)authKitAccountUpdate:(id)a3;
- (void)dealloc;
- (void)delayedSaveSettings;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isCloudConnected:(BOOL)a5;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isNearby:(BOOL)a5;
- (void)disableAccountWithUniqueID:(id)a3;
- (void)disablePrimaryAccountWithUniqueID:(id)a3;
- (void)enableAccountWithUniqueID:(id)a3;
- (void)enablePrimaryAccountWithUniqueID:(id)a3;
- (void)forceDisableAccountWithUniqueID:(id)a3;
- (void)forceRemoveAccount:(id)a3;
- (void)hardDeregister;
- (void)issueDependentIDQueriesWithCompletionBlock:(id)a3;
- (void)issueGetDependentAndGetHandlesRequest;
- (void)issueGetDependentRequest;
- (void)issueGetDependentRequestForAccount:(id)a3;
- (void)loadDeviceProperties;
- (void)loadStoredAccounts;
- (void)removeAccount:(id)a3;
- (void)saveDevicePropertiesWithOldKeys:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasHardDeregistered:(BOOL)a3;
- (void)setNSUUID:(id)a3 onDeviceWithUniqueID:(id)a4;
- (void)setupLocalAccountForService:(id)a3;
- (void)startLocalSetup;
- (void)stopLocalSetup;
- (void)triggerFinalDeregister;
- (void)updateDevicePropertiesWithDevices:(id)a3;
- (void)updateExpiredDependent;
@end

@implementation IDSDAccountController

- (id)accountsOnService:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_accountIDMap;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[NSMutableDictionary objectForKey:](self->_accountIDMap, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        id v13 = [v12 service];

        if (v13 == v4) {
          [v6 addObject:v12];
        }
      }
      id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (IDSDAccountController)sharedInstance
{
  if (qword_100A4A840 != -1) {
    dispatch_once(&qword_100A4A840, &stru_100983E28);
  }
  v2 = (void *)qword_100A4A848;

  return (IDSDAccountController *)v2;
}

+ (BOOL)isDefaultPairedDeviceFromID:(id)a3 accountUniqueID:(id)a4 serviceName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isEqualToIgnoringCase:IDSDefaultPairedDevice])
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found default paired ID", buf, 2u);
    }

    DLCSessionLogWithLevel();
    BOOL v11 = 1;
  }
  else
  {
    id v30 = 0;
    id v12 = [v7 _stripPotentialTokenURIWithToken:&v30];
    id v13 = v30;
    if ([v7 hasPrefix:@"device:"])
    {
      v14 = [v7 _stripFZIDPrefix];
    }
    else
    {
      v14 = 0;
    }
    if ([v13 length] || objc_msgSend(v14, "length"))
    {
      long long v15 = +[IDSDAccountController sharedInstance];
      long long v16 = [v15 accountWithUniqueID:v8];

      if (v16)
      {
        long long v17 = [v16 defaultPairedDependentRegistration];
        long long v18 = v17;
        if (v17)
        {
          v19 = [v17 objectForKey:IDSDevicePropertyPushToken];
          v20 = v19;
          if (v19 && [v19 isEqualToData:v13])
          {
            v21 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "This is the default paired device", buf, 2u);
            }

            DLCSessionLogWithLevel();
            BOOL v11 = 1;
          }
          else
          {
            v23 = [v18 objectForKey:IDSDevicePropertyIdentifierOverride];
            if ([v14 length] && objc_msgSend(v14, "isEqualToIgnoringCase:", v23))
            {
              v24 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "This is the default paired device", buf, 2u);
              }

              BOOL v11 = 1;
            }
            else
            {
              v27 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "This is not the default paired device", buf, 2u);
              }

              BOOL v11 = 0;
            }
            DLCSessionLogWithLevel();
          }
        }
        else
        {
          v25 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [v16 smallDescription];
            *(_DWORD *)buf = 138412290;
            id v32 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Did not find a default paired device on this account %@", buf, 0xCu);
          }
          v20 = [v16 smallDescription];
          DLCSessionLogWithLevel();
          BOOL v11 = 0;
        }
      }
      else
      {
        v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Did not find an account with that ID", buf, 2u);
        }

        DLCSessionLogWithLevel();
        BOOL v11 = 0;
      }
    }
    else
    {
      v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Did not find fromToken or FromDeviceUniqueID in %@", buf, 0xCu);
      }

      DLCSessionLogWithLevel();
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (id)daemon
{
  return +[IDSDaemon sharedInstance];
}

- (id)registrationListener
{
  return +[IDSDRegistrationListener sharedInstance];
}

- (id)userDefaults
{
  return +[IDSDependencyProvider userDefaults];
}

- (IDSDAccountController)initWithServiceController:(id)a3 registrationController:(id)a4 systemAccountAdapter:(id)a5 deviceSupport:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)IDSDAccountController;
  long long v15 = [(IDSDAccountController *)&v40 init];
  if (v15)
  {
    long long v16 = +[IMSystemMonitor sharedInstance];
    [v16 addListener:v15];

    if (!v15->_enabledAccounts)
    {
      long long v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      enabledAccounts = v15->_enabledAccounts;
      v15->_enabledAccounts = v17;
    }
    if (!v15->_accountIDMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      accountIDMap = v15->_accountIDMap;
      v15->_accountIDMap = (NSMutableDictionary *)Mutable;
    }
    v15->_accountsLoaded = 0;
    v21 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    accountIDMapLock = v15->_accountIDMapLock;
    v15->_accountIDMapLock = v21;

    v23 = +[IDSUTunDeliveryController sharedInstance];
    [v23 addConnectivityDelegate:v15];

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("ids_authkit", v24);
    authkitQueue = v15->_authkitQueue;
    v15->_authkitQueue = (OS_dispatch_queue *)v25;

    objc_storeStrong((id *)&v15->_serviceController, a3);
    objc_storeStrong((id *)&v15->_registrationController, a4);
    objc_storeStrong((id *)&v15->_systemAccountAdapter, a5);
    objc_storeStrong((id *)&v15->_deviceSupport, a6);
    id v27 = objc_alloc((Class)CUTDeferredTaskQueue);
    v28 = im_primary_queue();
    v29 = (CUTDeferredTaskQueue *)[v27 initWithCapacity:1 queue:v28 block:&stru_100983E68];
    storeAccountTask = v15->_storeAccountTask;
    v15->_storeAccountTask = v29;

    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v15 selector:"_servicesRemoved:" name:@"_kIDSDServiceControllerServicesRemovedNotification" object:0];
    [v31 addObserver:v15 selector:"_servicesChanged" name:@"_kIDSDServiceControllerServicesChangedNotification" object:0];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v15);
    id v32 = im_primary_queue();
    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_1001548B8;
    v37 = &unk_100981DF0;
    objc_copyWeak(&v38, &location);
    [(IDSDAccountController *)v15 _registerStateToSysdiagnoseWithLogTitle:@"IDS-List" queue:v32 block:&v34];

    [(IDSDAccountController *)v15 _registerForAllRegistrationsSucceeded];
    [(IDSDAccountController *)v15 loadDeviceProperties];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v15;
}

- (void)_registerStateToSysdiagnoseWithLogTitle:(id)a3 queue:(id)a4 block:(id)a5
{
}

- (IDSDAccountController)init
{
  v3 = +[IDSDServiceController sharedInstance];
  id v4 = +[IDSRegistrationController sharedInstance];
  v5 = [IDSSystemAccountAdapter alloc];
  id v6 = im_primary_queue();
  id v7 = [(IDSSystemAccountAdapter *)v5 initWithQueue:v6];
  id v8 = +[FTDeviceSupport sharedInstance];
  id v9 = [(IDSDAccountController *)self initWithServiceController:v3 registrationController:v4 systemAccountAdapter:v7 deviceSupport:v8];

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[IMSystemMonitor sharedInstance];
  [v4 removeListener:self];

  v5 = +[IDSUTunDeliveryController sharedInstance];
  [v5 removeConnectivityDelegate:self];

  [(IDSDAccountController *)self _storeAccounts];
  v6.receiver = self;
  v6.super_class = (Class)IDSDAccountController;
  [(IDSDAccountController *)&v6 dealloc];
}

- (NSArray)accounts
{
  [(IDSDAccountController *)self loadStoredAccounts];
  accountIDMap = self->_accountIDMap;

  return (NSArray *)[(NSMutableDictionary *)accountIDMap allValues];
}

- (NSSet)enabledAccounts
{
  [(IDSDAccountController *)self loadStoredAccounts];
  enabledAccounts = self->_enabledAccounts;

  return (NSSet *)enabledAccounts;
}

- (void)hardDeregister
{
  v2 = +[IMRGLog registration];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Hard deregister requested", v4, 2u);
  }

  v3 = +[IDSRegistrationCenter sharedInstance];
  [v3 sendHardDeregisterCompletionBlock:&stru_100983EC8];
}

- (void)triggerFinalDeregister
{
  if (!self->_hasHardDeregistered)
  {
    v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggering final deregister", buf, 2u);
    }

    [(IDSDAccountController *)self setHasHardDeregistered:1];
    id v4 = [(IDSDAccountController *)self accounts];
    id v5 = [v4 _copyForEnumerating];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "accountType", (void)v12) != 2
            && ([v11 isAdHocAccount] & 1) == 0)
          {
            [(IDSDAccountController *)self removeAccount:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_removeAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    accountIDMap = self->_accountIDMap;
    id v7 = [v4 uniqueID];
    id v8 = [(NSMutableDictionary *)accountIDMap objectForKey:v7];

    uint64_t v9 = +[IMRGLog registration];
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing account %@", (uint8_t *)&v18, 0xCu);
      }

      [v4 setIsBeingRemoved:1];
      [v4 cleanupAccount];
      id v11 = [v4 uniqueID];
      [(IDSDAccountController *)self _disableAccountWithUniqueID:v11];

      [(NSRecursiveLock *)self->_accountIDMapLock lock];
      long long v12 = self->_accountIDMap;
      long long v13 = [v4 uniqueID];
      [(NSMutableDictionary *)v12 removeObjectForKey:v13];

      [(NSRecursiveLock *)self->_accountIDMapLock unlock];
      [(IDSDAccountController *)self delayedSaveSettings];
      long long v14 = +[IDSDaemon sharedInstance];
      long long v15 = [v4 service];
      long long v16 = [v15 pushTopic];
      uint64_t v10 = [v14 broadcasterForTopic:v16 ignoreServiceListener:1 messageContext:0];

      long long v17 = [v4 accountSetupInfo];
      [v10 accountRemoved:v17];

      [(IDSDAccountController *)self _cleanUpAccountCredentialForRemovedAccount:v4];
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      sub_1007135A8(v4);
    }
  }
}

- (void)_removePrimaryAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 isAdHocAccount])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v5 uniqueID];
        *(_DWORD *)buf = 138412290;
        v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tried to remove ad hoc account directly, ignoring... { uniqueID: %@ }", buf, 0xCu);
      }
    }
    else
    {
      id v8 = objc_alloc_init((Class)NSMutableArray);
      [v8 addObject:v5];
      uint64_t v9 = [v5 adHocAccounts];
      [v8 addObjectsFromArray:v9];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v8;
      id v10 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v6);
            }
            -[IDSDAccountController _removeAccount:](self, "_removeAccount:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          }
          id v11 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
  }
  else
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tried to remove a nil account, ignoring...", buf, 2u);
    }
  }
}

- (id)_inUseUsernames
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(IDSDAccountController *)self accounts];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) loginID];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_inUseProfileIDs
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(IDSDAccountController *)self accounts];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) dsID];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_cleanUpAccountCredentialForRemovedAccount:(id)a3
{
  id v12 = a3;
  id v5 = [v12 loginID];
  id v6 = [v12 dsID];
  uint64_t v7 = +[FTPasswordManager sharedInstance];
  id v8 = [(IDSDAccountController *)self _inUseUsernames];
  uint64_t v9 = [v8 allObjects];
  id v10 = [(IDSDAccountController *)self _inUseProfileIDs];
  long long v11 = [v10 allObjects];
  [v7 cleanUpAccountsWithUsername:v5 orProfileID:v6 basedOnInUseUsernames:v9 profileIDs:v11 completionBlock:0];
}

- (void)_cleanUpAccountCredentialStore
{
  id v3 = +[FTPasswordManager sharedInstance];
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100156788;
  v5[3] = &unk_100983EF0;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001567D8;
  v4[3] = &unk_100983EF0;
  [v3 cleanUpAccountsBasedOnInUseUsernamesBlock:v5 profileIDBlock:v4 completionBlock:0];
}

- (void)_addAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v10 = +[IMRGLog warning];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      long long v11 = "Tried to add a nil account, ignoring...";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v23, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  accountIDMap = self->_accountIDMap;
  uint64_t v7 = [v4 uniqueID];
  id v8 = [(NSMutableDictionary *)accountIDMap objectForKey:v7];

  uint64_t v9 = +[IMRGLog registration];
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10071362C(v5);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding account %@", (uint8_t *)&v23, 0xCu);
  }

  [(NSRecursiveLock *)self->_accountIDMapLock lock];
  id v12 = self->_accountIDMap;
  long long v13 = [v5 uniqueID];
  [(NSMutableDictionary *)v12 setObject:v5 forKey:v13];

  [(NSRecursiveLock *)self->_accountIDMapLock unlock];
  [(IDSDAccountController *)self delayedSaveSettings];
  if (![v5 isTemporary]
    || ([v5 expirationDate], long long v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    long long v15 = [(IDSDAccountController *)self daemon];
    long long v16 = [v5 service];
    long long v17 = [v16 pushTopic];
    int v18 = [v15 broadcasterForTopic:v17 ignoreServiceListener:1 messageContext:0];

    id v19 = [v5 accountSetupInfo];
    [v18 accountAdded:v19];
LABEL_12:

    goto LABEL_13;
  }
  int v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v5 uniqueID];
    int v23 = 138412290;
    v24 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Delaying broadcast for unprovisioned temporary account %@", (uint8_t *)&v23, 0xCu);
    goto LABEL_12;
  }
LABEL_13:

  v20 = [v5 service];
  v21 = [v20 pushTopic];
  unsigned int v22 = [v21 isEqualToIgnoringCase:@"com.apple.private.alloy.accountssync"];

  if (v22)
  {
    id v10 = +[IMRGLog accountsDebugging];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      long long v11 = "Broadcaster for account added";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)addPrimaryAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([v4 isAdHocAccount])
    {
      id v6 = +[IMRGLog warning];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v4 uniqueID];
        int v16 = 138412290;
        long long v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tried to add ad hoc account directly, ignoring... { uniqueID: %@ }", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      accountIDMap = self->_accountIDMap;
      uint64_t v9 = [v4 uniqueID];
      id v10 = [(NSMutableDictionary *)accountIDMap objectForKey:v9];

      if (v10)
      {
        id v6 = +[IMRGLog registration];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          sub_1007136B0(v4);
        }
      }
      else
      {
        long long v11 = [v4 service];
        id v12 = [v4 accountType];
        long long v13 = [v4 loginID];
        id v6 = [(IDSDAccountController *)self existingAccountOnService:v11 withType:v12 loginID:v13];

        if (v6)
        {
          long long v14 = +[IMRGLog registration];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 138412290;
            long long v17 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  ** Found existing matching account, removing: %@", (uint8_t *)&v16, 0xCu);
          }

          long long v15 = [v6 linkedAccounts];
          objc_msgSend(v15, "__imForEach:", &stru_100983F10);

          [(IDSDAccountController *)self _removeAccount:v6];
        }
        [(IDSDAccountController *)self _addAccount:v4];
        [(IDSDAccountController *)self _setupAdHocAccountsForPrimaryAccount:v4];
      }
    }
  }
  else
  {
    id v6 = +[IMRGLog warning];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tried to add a nil primary account, ignoring...", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueID];
    uint64_t v7 = +[FTDeviceSupport sharedInstance];
    id v8 = [v7 deviceInformationString];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client requested add account with unique ID %@ (Environment: %@)", (uint8_t *)&v9, 0x16u);
  }
  [(IDSDAccountController *)self addPrimaryAccount:v4];
}

- (void)removeAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueID];
    uint64_t v7 = +[FTDeviceSupport sharedInstance];
    id v8 = [v7 deviceInformationString];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client requested remove account with unique ID %@ (Environment: %@)", (uint8_t *)&v9, 0x16u);
  }
  [(IDSDAccountController *)self _removePrimaryAccount:v4];
}

- (void)forceRemoveAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 smallDescription];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Force removing account {account: %@}", (uint8_t *)&v8, 0xCu);
  }
  if (v4)
  {
    if ([v4 isAdHocAccount]) {
      [(IDSDAccountController *)self _removeAccount:v4];
    }
    else {
      [(IDSDAccountController *)self _removePrimaryAccount:v4];
    }
  }
  else
  {
    uint64_t v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tried to remove a nil account, ignoring...", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)disablePrimaryAccountWithUniqueID:(id)a3
{
}

- (void)_disablePrimaryAccountWithUniqueID:(id)a3 userAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = [(IDSDAccountController *)self accountWithUniqueID:v6];
    int v8 = v7;
    if (v7)
    {
      if (![v7 isAdHocAccount])
      {
        if (v4) {
          [v8 setIsUserDisabled:1];
        }
        id v11 = objc_alloc_init((Class)NSMutableArray);
        [v11 addObject:v8];
        id v12 = [v8 adHocAccounts];
        [v11 addObjectsFromArray:v12];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        int v9 = v11;
        id v13 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v13)
        {
          id v15 = v13;
          int v16 = 0;
          uint64_t v17 = *(void *)v33;
          *(void *)&long long v14 = 138412290;
          long long v27 = v14;
          while (2)
          {
            int v18 = 0;
            id v19 = v16;
            do
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v9);
              }
              int v16 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * (void)v18), "uniqueID", v27);

              if ([(NSMutableSet *)self->_enabledAccounts containsObject:v16])
              {

                long long v30 = 0u;
                long long v31 = 0u;
                long long v28 = 0u;
                long long v29 = 0u;
                v21 = v9;
                id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v29;
                  do
                  {
                    for (i = 0; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v29 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      v26 = [*(id *)(*((void *)&v28 + 1) + 8 * i) uniqueID];
                      [(IDSDAccountController *)self _disableAccountWithUniqueID:v26];
                    }
                    id v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
                  }
                  while (v23);
                }
                goto LABEL_33;
              }
              v20 = +[IMRGLog registration];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v27;
                id v39 = v16;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Account with unique ID %@ is already disabled, ignoring...", buf, 0xCu);
              }

              int v18 = (char *)v18 + 1;
              id v19 = v16;
            }
            while (v15 != v18);
            id v15 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        else
        {
          int v16 = 0;
        }
LABEL_33:

        goto LABEL_34;
      }
      int v9 = +[IMRGLog warning];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v6;
        id v10 = "Tried to disable ad hoc account directly, ignoring... { uniqueID: %@ }";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      }
    }
    else
    {
      int v9 = +[IMRGLog warning];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v6;
        id v10 = "Tried to disable a primary account we don't know about, ignoring... { uniqueID: %@ }";
        goto LABEL_10;
      }
    }
LABEL_34:

    goto LABEL_35;
  }
  int v8 = +[IMRGLog warning];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tried to disable a primary account with no unique ID, ignoring...", buf, 2u);
  }
LABEL_35:
}

- (void)_forceDisablePrimaryAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IDSDAccountController *)self accountWithUniqueID:v4];
    id v6 = v5;
    if (v5)
    {
      if (![v5 isAdHocAccount])
      {
        [v6 setIsUserDisabled:1];
        id v9 = objc_alloc_init((Class)NSMutableArray);
        [v9 addObject:v6];
        id v10 = [v6 adHocAccounts];
        [v9 addObjectsFromArray:v10];

        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v7 = v9;
        id v11 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v7);
              }
              id v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "uniqueID", (void)v16);
              [(IDSDAccountController *)self _forceDisableAccountWithUniqueID:v15];
            }
            id v12 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v12);
        }

        goto LABEL_19;
      }
      uint64_t v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v4;
        int v8 = "Tried to disable ad hoc account directly, ignoring... { uniqueID: %@ }";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v4;
        int v8 = "Tried to disable a primary account we don't know about, ignoring... { uniqueID: %@ }";
        goto LABEL_10;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  id v6 = +[IMRGLog warning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tried to disable a primary account with no unique ID, ignoring...", buf, 2u);
  }
LABEL_20:
}

- (void)_forceDisableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IDSDAccountController *)self accountWithUniqueID:v4];
    if (v5)
    {
      if ([(NSMutableSet *)self->_enabledAccounts containsObject:v4])
      {
        id v6 = +[IMRGLog registration];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = [v5 loginID];
          int v8 = [v5 service];
          id v9 = [v8 identifier];
          id v10 = +[FTDeviceSupport sharedInstance];
          id v11 = [v10 deviceInformationString];
          int v23 = 138413314;
          uint64_t v24 = v4;
          __int16 v25 = 2112;
          v26 = v7;
          __int16 v27 = 2112;
          long long v28 = v9;
          __int16 v29 = 2112;
          long long v30 = v11;
          __int16 v31 = 2112;
          long long v32 = self;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Force disable account with uniqueID %@ login ID %@ service %@ called (Environment: %@) %@", (uint8_t *)&v23, 0x34u);
        }
        [(NSMutableSet *)self->_enabledAccounts removeObject:v4];
      }
      [v5 deactivateRegistration];
      [v5 resetErrorState];
      id v12 = [v5 service];
      uint64_t v13 = [v12 identifier];

      long long v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Clearing service's cache {serviceIdentifier: %@}", (uint8_t *)&v23, 0xCu);
      }

      id v15 = +[IDSPeerIDManager sharedInstance];
      [v15 forgetPeerTokensForService:v13];

      long long v16 = +[IDSIDStatusQueryController sharedInstance];
      [v16 removeCachedEntriesForService:v13];

      long long v17 = +[IDSDaemon sharedInstance];
      long long v18 = [v5 service];
      long long v19 = [v18 pushTopic];
      v20 = [v17 broadcasterForTopic:v19 ignoreServiceListener:1 messageContext:0];

      v21 = [v5 service];
      id v22 = [v21 identifier];
      [v20 accountDisabled:v4 onService:v22];
    }
    else
    {
      uint64_t v13 = +[IMRGLog warning];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Tried to force disable an account we don't know about, ignoring...", (uint8_t *)&v23, 2u);
      }
    }
  }
  else
  {
    id v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tried to force disable an account with no unique ID, ignoring...", (uint8_t *)&v23, 2u);
    }
  }
}

- (void)_disableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IDSDAccountController *)self accountWithUniqueID:v4];
    if (!v5)
    {
      uint64_t v13 = +[IMRGLog warning];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Tried to disable an account we don't know about, ignoring...", (uint8_t *)&v23, 2u);
      }
      goto LABEL_16;
    }
    if (([(NSMutableSet *)self->_enabledAccounts containsObject:v4] & 1) == 0)
    {
      uint64_t v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100713734();
      }
      goto LABEL_16;
    }
    if ([(NSMutableSet *)self->_enabledAccounts containsObject:v4])
    {
      id v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v5 loginID];
        int v8 = [v5 service];
        id v9 = [v8 identifier];
        id v10 = +[FTDeviceSupport sharedInstance];
        id v11 = [v10 deviceInformationString];
        int v23 = 138413314;
        uint64_t v24 = v4;
        __int16 v25 = 2112;
        v26 = v7;
        __int16 v27 = 2112;
        long long v28 = v9;
        __int16 v29 = 2112;
        long long v30 = v11;
        __int16 v31 = 2112;
        long long v32 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disable account with uniqueID %@ login ID %@ service %@ called (Environment: %@) %@", (uint8_t *)&v23, 0x34u);
      }
      [(NSMutableSet *)self->_enabledAccounts removeObject:v4];
      [v5 deactivateRegistration];
      id v12 = [v5 service];
      uint64_t v13 = [v12 identifier];

      long long v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Clearing service's cache {serviceIdentifier: %@}", (uint8_t *)&v23, 0xCu);
      }

      id v15 = +[IDSPeerIDManager sharedInstance];
      [v15 forgetPeerTokensForService:v13];

      long long v16 = +[IDSIDStatusQueryController sharedInstance];
      [v16 removeCachedEntriesForService:v13];

      long long v17 = +[IDSDaemon sharedInstance];
      long long v18 = [v5 service];
      long long v19 = [v18 pushTopic];
      v20 = [v17 broadcasterForTopic:v19 ignoreServiceListener:1 messageContext:0];

      v21 = [v5 service];
      id v22 = [v21 identifier];
      [v20 accountDisabled:v4 onService:v22];

LABEL_16:
    }
  }
  else
  {
    id v5 = +[IMRGLog warning];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tried to disable an account with no unique ID, ignoring...", (uint8_t *)&v23, 2u);
    }
  }
}

- (void)enablePrimaryAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IDSDAccountController *)self accountWithUniqueID:v4];
    id v6 = v5;
    if (v5)
    {
      if ([v5 isAdHocAccount])
      {
        uint64_t v7 = +[IMRGLog warning];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          objc_super v40 = v4;
          int v8 = "Tried to enable ad hoc account directly, ignoring.. { uniqueID: %@ }";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        }
      }
      else
      {
        id v9 = +[IDSRestrictions sharedInstance];
        [v9 refreshStateForAccount:v6];

        id v10 = +[IDSRestrictions sharedInstance];
        unsigned int v11 = [v10 shouldDisableAccount:v6];

        if (!v11)
        {
          [v6 setIsUserDisabled:0];
          id v12 = objc_alloc_init((Class)NSMutableArray);
          [v12 addObject:v6];
          uint64_t v13 = [v6 adHocAccounts];
          [v12 addObjectsFromArray:v13];

          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v7 = v12;
          id v14 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v14)
          {
            id v16 = v14;
            long long v17 = 0;
            uint64_t v18 = *(void *)v34;
            *(void *)&long long v15 = 138412290;
            long long v28 = v15;
            while (2)
            {
              long long v19 = 0;
              v20 = v17;
              do
              {
                if (*(void *)v34 != v18) {
                  objc_enumerationMutation(v7);
                }
                long long v17 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)v19), "uniqueID", v28);

                if (![(NSMutableSet *)self->_enabledAccounts containsObject:v17])
                {

                  long long v31 = 0u;
                  long long v32 = 0u;
                  long long v29 = 0u;
                  long long v30 = 0u;
                  id v22 = v7;
                  id v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
                  if (v23)
                  {
                    id v24 = v23;
                    uint64_t v25 = *(void *)v30;
                    do
                    {
                      for (i = 0; i != v24; i = (char *)i + 1)
                      {
                        if (*(void *)v30 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        __int16 v27 = [*(id *)(*((void *)&v29 + 1) + 8 * i) uniqueID];
                        [(IDSDAccountController *)self _enableAccountWithUniqueID:v27];
                      }
                      id v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
                    }
                    while (v24);
                  }
                  goto LABEL_34;
                }
                v21 = +[IMRGLog registration];
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v28;
                  objc_super v40 = v17;
                  _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Account with unique ID %@ is already enabled, ignoring...", buf, 0xCu);
                }

                long long v19 = (char *)v19 + 1;
                v20 = v17;
              }
              while (v16 != v19);
              id v16 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
          else
          {
            long long v17 = 0;
          }
LABEL_34:

          goto LABEL_35;
        }
        uint64_t v7 = +[IMRGLog warning];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          objc_super v40 = v6;
          int v8 = "Tried to enable a restricted account, ignoring.. { account: %@ }";
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v7 = +[IMRGLog warning];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v40 = v4;
        int v8 = "Tried to enable a primary account we don't know about, ignoring... { uniqueID: %@ }";
        goto LABEL_13;
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  id v6 = +[IMRGLog warning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tried to enable a primary account with no unique ID, ignoring...", buf, 2u);
  }
LABEL_36:
}

- (void)_enableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v6 = [(IDSDAccountController *)self accountWithUniqueID:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      int v8 = [v6 serviceType];
      id v9 = [v7 accountType];
      if ([(IDSRegistrationController *)self->_registrationController systemSupportsServiceType:v8 accountType:v9 isTemporary:[v7 isTemporary]])
      {
        if ([(NSMutableSet *)self->_enabledAccounts containsObject:v4])
        {
          id v10 = +[IMRGLog registration];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_1007137A0();
          }
        }
        else
        {
          v48 = v8;
          v49 = v5;
          v50 = v7;
          if (([(NSMutableSet *)self->_enabledAccounts containsObject:v4] & 1) == 0)
          {
            v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = [v7 loginID];
              id v22 = [v7 service];
              id v23 = [v22 identifier];
              id v24 = +[FTDeviceSupport sharedInstance];
              uint64_t v25 = [v24 deviceInformationString];
              *(_DWORD *)buf = 138413314;
              v65 = v4;
              __int16 v66 = 2112;
              v67 = v21;
              __int16 v68 = 2112;
              v69 = v23;
              __int16 v70 = 2112;
              v71 = v25;
              __int16 v72 = 2112;
              v73 = self;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enable account with uniqueID %@ login ID %@ service %@ called (Environment: %@) %@", buf, 0x34u);

              uint64_t v7 = v50;
            }

            [(NSMutableSet *)self->_enabledAccounts addObject:v4];
            [v7 activateRegistration];
            v26 = [(IDSDAccountController *)self daemon];
            __int16 v27 = [v7 service];
            long long v28 = [v27 pushTopic];
            long long v29 = [v26 broadcasterForTopic:v28 ignoreServiceListener:1 messageContext:0];

            long long v30 = [v7 service];
            long long v31 = [v30 identifier];
            [v29 accountEnabled:v4 onService:v31];
          }
          id v53 = objc_alloc_init((Class)NSMutableSet);
          v52 = [v7 service];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v32 = self->_enabledAccounts;
          id v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v58 objects:v63 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v59;
            do
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v59 != v35) {
                  objc_enumerationMutation(v32);
                }
                v37 = *(NSObject **)(*((void *)&v58 + 1) + 8 * i);
                if (([v37 isEqualToIgnoringCase:v4] & 1) == 0
                  && v9)
                {
                  id v38 = [(IDSDAccountController *)self accountWithUniqueID:v37];
                  if ([v38 accountType] == v9)
                  {
                    id v39 = [v38 service];

                    if (v39 == v52)
                    {
                      objc_super v40 = +[IMRGLog registration];
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v65 = v37;
                        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, " Will disable similar account with accountID: %@", buf, 0xCu);
                      }

                      [v53 addObject:v37];
                    }
                  }
                }
              }
              id v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v58 objects:v63 count:16];
            }
            while (v34);
          }
          v51 = v4;

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v41 = v53;
          id v42 = [v41 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v55;
            do
            {
              for (j = 0; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v55 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = *(NSObject **)(*((void *)&v54 + 1) + 8 * (void)j);
                v47 = +[IMRGLog registration];
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v46;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "   Forcing account to disable: %@", buf, 0xCu);
                }

                [(IDSDAccountController *)self _disableAccountWithUniqueID:v46];
              }
              id v43 = [v41 countByEnumeratingWithState:&v54 objects:v62 count:16];
            }
            while (v43);
          }

          uint64_t v7 = v50;
          id v4 = v51;
          int v8 = v48;
          id v5 = v49;
        }
      }
      else
      {
        id v12 = +[IMRGLog registration];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v65 = v8;
          __int16 v66 = 1024;
          LODWORD(v67) = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tried to enable an account with unsupported type -- ignoring and disabling... { serviceType: %@, accountType: %d }", buf, 0x12u);
        }

        uint64_t v13 = +[IDSDaemon sharedInstance];
        id v14 = [v7 service];
        long long v15 = [v14 pushTopic];
        id v16 = [v13 broadcasterForTopic:v15 ignoreServiceListener:1 messageContext:0];

        long long v17 = [v7 service];
        uint64_t v18 = [v17 identifier];
        [v16 accountDisabled:v4 onService:v18];
      }
    }
    else
    {
      int v8 = +[IMRGLog warning];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tried to enable an account we don't know about, ignoring...", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = +[IMRGLog warning];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tried to enable an account with no unique ID, ignoring...", buf, 2u);
    }
  }
}

- (void)enableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = +[FTDeviceSupport sharedInstance];
    int v8 = [v7 deviceInformationString];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client requested enable account with unique ID %@ (Environment: %@)", (uint8_t *)&v9, 0x16u);
  }
  [(IDSDAccountController *)self enablePrimaryAccountWithUniqueID:v4];
}

- (void)disableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[FTDeviceSupport sharedInstance];
    uint64_t v7 = [v6 deviceInformationString];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client requested disable account with unique ID %@ (Environment: %@)", (uint8_t *)&v8, 0x16u);
  }
  [(IDSDAccountController *)self _disablePrimaryAccountWithUniqueID:v4 userAction:1];
}

- (void)forceDisableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[FTDeviceSupport sharedInstance];
    uint64_t v7 = [v6 deviceInformationString];
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client requested force disable account with unique ID %@ (Environment: %@)", (uint8_t *)&v8, 0x16u);
  }
  [(IDSDAccountController *)self _forceDisablePrimaryAccountWithUniqueID:v4];
}

- (id)accountOnService:(id)a3 withAliasURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20 = v6;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v8 = [(IDSDAccountController *)self accountsOnService:v6];
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v19 = v12;
            _IDSLogV();
          }
          if (objc_msgSend(v12, "isEnabled", v19, v20))
          {
            if ([v12 hasAliasURI:v7])
            {
              id v16 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v12;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Account matches: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
              id v15 = v12;
              goto LABEL_30;
            }
          }
          else
          {
            id v14 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_30:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)accountOnService:(id)a3 withVettedAliasURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20 = v6;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v8 = [(IDSDAccountController *)self accountsOnService:v6];
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v19 = v12;
            _IDSLogV();
          }
          if (objc_msgSend(v12, "isEnabled", v19, v20))
          {
            if ([v12 hasVettedAliasURI:v7])
            {
              id v16 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v12;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Account matches: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
              id v15 = v12;
              goto LABEL_30;
            }
          }
          else
          {
            id v14 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_30:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)accountOnService:(id)a3 withLoginID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v23 = v7;
  if (v7)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(IDSDAccountController *)self accountsOnService:v7];
    id v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v30 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v22 = v12;
            _IDSLogV();
          }
          if (objc_msgSend(v12, "isEnabled", v22, v23))
          {
            id v14 = [v8 length];
            if (!v14)
            {
              id v4 = [v12 loginID];
              if (![v4 length])
              {

LABEL_29:
                v20 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v30 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Account matches: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                id v19 = v12;
                goto LABEL_35;
              }
            }
            BOOL v15 = v14 == 0;
            id v16 = [v12 loginID];
            unsigned int v17 = [v16 isEqualToIgnoringCase:v8];

            if (v15)
            {

              if (v17) {
                goto LABEL_29;
              }
            }
            else if (v17)
            {
              goto LABEL_29;
            }
          }
          else
          {
            uint64_t v18 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v19 = 0;
LABEL_35:
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)localAccountOnService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = -[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0);
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 accountType] == 2)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
    id v6 = 0;
  }

  return v6;
}

- (id)appleIDAccountOnService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = -[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0);
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 accountType] == 1)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
    id v6 = 0;
  }

  return v6;
}

- (id)accountsOnService:(id)a3 withType:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = -[IDSDAccountController accountsOnService:](self, "accountsOnService:", v6, 0);
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v14 accountType] == a4) {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)accountWithServiceName:(id)a3 aliasURI:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  long long v27 = v6;
  if ([v6 length])
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v6;
      __int16 v35 = 2112;
      id v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Finding account with service name %@ aliasURI %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v23 = v6;
      id v25 = v26;
      _IDSLogV();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = [(IDSDAccountController *)self accounts];
    id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v13 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v24 = v12;
            _IDSLogV();
          }
          if (objc_msgSend(v12, "isEnabled", v24))
          {
            long long v14 = [v12 service];
            BOOL v15 = [v14 identifier];
            if ([v15 isEqualToIgnoringCase:v27])
            {
              unsigned int v16 = [v12 hasAliasURI:v26];

              if (v16)
              {
                v20 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Account matches !", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                id v19 = v12;

                goto LABEL_41;
              }
            }
            else
            {
            }
          }
          else
          {
            long long v17 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    long long v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Found no match", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  id v19 = 0;
LABEL_41:

  return v19;
}

- (id)accountWithServiceName:(id)a3 loginID:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  long long v27 = v6;
  if ([v6 length])
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v35 = v27;
      __int16 v36 = 2112;
      id v37 = v26;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Finding account with service name %@ loginID %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v23 = v27;
      id v25 = v26;
      _IDSLogV();
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(IDSDAccountController *)self accounts];
    id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v12 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v35 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            long long v24 = v11;
            _IDSLogV();
          }
          if (objc_msgSend(v11, "isEnabled", v24))
          {
            long long v13 = [v11 service];
            long long v14 = [v13 identifier];
            if ([v14 isEqualToIgnoringCase:v27])
            {
              BOOL v15 = [v11 loginID];
              int v16 = IMAreEmailsLogicallyTheSame();

              if (v16)
              {
                v20 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Account matches !", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                id v19 = v11;

                goto LABEL_41;
              }
            }
            else
            {
            }
          }
          else
          {
            long long v17 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Found no match", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  id v19 = 0;
LABEL_41:

  return v19;
}

- (id)accountWithUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_accountIDMap objectForKey:v4];
    if (!v5)
    {
      id v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "  => No account found for unique ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)accountWithServiceName:(id)a3 myID:(id)a4
{
  id v6 = a3;
  id v41 = a4;
  id v43 = v6;
  if (![v6 length])
  {
    id v18 = 0;
    goto LABEL_73;
  }
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = v6;
    __int16 v56 = 2112;
    id v57 = v41;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Finding account with service name %@ myID %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v37 = v6;
    id v39 = v41;
    _IDSLogV();
  }
  if (objc_msgSend(v41, "hasPrefix:", @"P:", v37, v39))
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [(IDSDAccountController *)self accounts];
    id v8 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v49;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v49 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if ([v11 isEnabled])
          {
            uint64_t v12 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v55 = v11;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v38 = v11;
              _IDSLogV();
            }
            long long v13 = objc_msgSend(v11, "service", v38);
            long long v14 = [v13 identifier];
            if ([v14 isEqualToIgnoringCase:v43])
            {
              id v38 = [v11 loginID];
              BOOL v15 = +[NSString stringWithFormat:@"P:%@"];
              unsigned int v16 = [v41 isEqualToString:v15];

              if (v16)
              {
                long long v29 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Account matches!", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                id v31 = v11;
                goto LABEL_70;
              }
            }
            else
            {
            }
          }
          else
          {
            long long v17 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v18 = 0;
  }
  else
  {
    if (![v41 hasPrefix:@"D:"])
    {
      long long v32 = +[IMRGLog warning];
      id v33 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        sub_10071380C();
        id v18 = 0;
        id v33 = v32;
      }
      else
      {
        id v18 = 0;
      }
      goto LABEL_72;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [(IDSDAccountController *)self accounts];
    id v18 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v45;
      uint64_t v40 = kIDSServiceDefaultsAuthorizationIDKey;
      while (2)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          long long v22 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v55 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v38 = v21;
            _IDSLogV();
          }
          if (objc_msgSend(v21, "isEnabled", v38))
          {
            id v23 = [v21 service];
            long long v24 = [v23 identifier];
            if ([v24 isEqualToIgnoringCase:v43])
            {
              id v25 = [v21 accountInfo];
              id v26 = [v25 objectForKey:v40];
              unsigned int v27 = [v41 isEqualToString:v26];

              if (v27)
              {
                id v34 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Account matches!", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                id v31 = v21;
LABEL_70:
                id v18 = v31;
                goto LABEL_71;
              }
            }
            else
            {
            }
          }
          else
          {
            long long v28 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
LABEL_71:
  id v33 = obj;
LABEL_72:

LABEL_73:

  return v18;
}

- (id)accountsWithType:(int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(IDSDAccountController *)self accounts];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 accountType] == a3) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)accountUniqueIDsWithType:(int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(IDSDAccountController *)self accounts];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 accountType] == a3)
        {
          uint64_t v12 = [v11 uniqueID];
          [v5 addObject:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEnabledAccount:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:");
  }
  else {
    return 0;
  }
}

- (id)primaryAccountForAdHocAccount:(id)a3
{
  id v4 = a3;
  if ([v4 isAdHocAccount])
  {
    id v5 = [(IDSDAccountController *)self accounts];
    id v6 = [v5 _copyForEnumerating];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "adHocAccounts", (void)v14);
          if ([v12 containsObject:v4])
          {
            id v8 = v11;

            goto LABEL_13;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (id)existingAccountOnService:(id)a3 withType:(int)a4 loginID:(id)a5
{
  id v6 = *(void **)&a4;
  id v8 = a3;
  id v38 = a5;
  uint64_t v9 = 0;
  if (!v8 || !v6) {
    goto LABEL_39;
  }
  id v34 = self;
  id v35 = v8;
  uint64_t v10 = [(IDSDAccountController *)self accountsOnService:v8 withType:v6];
  id v11 = [v10 _copyForEnumerating];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (!v12)
  {
    id v14 = 0;
    uint64_t v9 = 0;
    goto LABEL_31;
  }
  id v13 = v12;
  id v14 = 0;
  char v15 = 0;
  uint64_t v9 = 0;
  uint64_t v16 = *(void *)v44;
  int v37 = (int)v6;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v44 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      if (v9)
      {
        uint64_t v19 = +[IMRGLog registration];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = [v18 smallDescription];
          *(_DWORD *)buf = 138412290;
          long long v49 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "  => Found **extra** account %@, deleting...", buf, 0xCu);

          LODWORD(v6) = v37;
        }

        char v15 = 1;
      }
      if (v6 != 2)
      {
        v20 = [v18 loginID];
        id v21 = [v20 length];
        if (v38 || v21)
        {
          id v6 = [v18 loginID];
          unsigned __int8 v22 = [v6 isEqualToIgnoringCase:v38];

          LODWORD(v6) = v37;
          if ((v22 & 1) == 0)
          {
            id v26 = +[IMRGLog registration];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v27 = [v18 smallDescription];
              *(_DWORD *)buf = 138412546;
              long long v49 = v27;
              __int16 v50 = 2112;
              id v51 = v38;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => Found **mismatched** account %@ ID %@, deleting...", buf, 0x16u);
            }
            goto LABEL_24;
          }
        }
        else
        {
        }
      }
      if ((v15 & 1) == 0)
      {
        id v23 = v18;

        long long v24 = +[IMRGLog registration];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v23 smallDescription];
          *(_DWORD *)buf = 138412290;
          long long v49 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "  => Found existing account %@", buf, 0xCu);
        }
        char v15 = 0;
        uint64_t v9 = v23;
        continue;
      }
LABEL_24:
      if (!v14) {
        id v14 = objc_alloc_init((Class)NSMutableArray);
      }
      [v14 addObject:v18];
      char v15 = 1;
    }
    id v13 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  }
  while (v13);
LABEL_31:

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = v14;
  id v29 = [v28 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v28);
        }
        [(IDSDAccountController *)v34 _removeAccount:*(void *)(*((void *)&v39 + 1) + 8 * (void)j)];
      }
      id v30 = [v28 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v30);
  }

  id v8 = v35;
LABEL_39:

  return v9;
}

- (id)threadSafeServiceWithAccountUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSRecursiveLock *)self->_accountIDMapLock lock];
    id v5 = [(NSMutableDictionary *)self->_accountIDMap objectForKey:v4];
    id v6 = [v5 service];
    if (v6)
    {
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        id v13 = v6;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "  => (Thread Safe) Found service: %p (for UID: %@)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v10 = v6;
        id v11 = v4;
        _IDSLogV();
      }
    }
    else
    {
      id v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "  => (Thread Safe) No service found for unique ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v10 = v4;
        _IDSLogV();
      }
    }
    [(NSRecursiveLock *)self->_accountIDMapLock unlock];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)registeredLocalURIsOnService:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDServiceController sharedInstance];
  id v6 = [v5 serviceWithIdentifier:v4];
  id v7 = [(IDSDAccountController *)self registeredAccountsOnService:v6];

  id v8 = objc_alloc_init((Class)NSMutableSet);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "prefixedURIStringsFromRegistration", (void)v18);
        id v15 = objc_msgSend(v14, "__imArrayByApplyingBlock:", &stru_100983F30);
        if (v15) {
          [v8 addObjectsFromArray:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [v8 allObjects];

  return v16;
}

- (void)setupLocalAccountForService:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDAccountController *)self existingAccountOnService:v4 withType:2 loginID:0];
  if (!v5)
  {
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 identifier];
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, " => Creating a local account for service %@", buf, 0xCu);
    }
    id v8 = [IDSDAccount alloc];
    id v9 = +[NSString stringGUID];
    id v10 = [(IDSDAccount *)v8 initWithLoginID:&stru_10099BE78 service:v4 uniqueID:v9 accountType:2 accountConfig:0];

    [(IDSDAccountController *)self addPrimaryAccount:v10];
    id v11 = [(IDSDAccount *)v10 uniqueID];
    [(IDSDAccountController *)self enablePrimaryAccountWithUniqueID:v11];

    uint64_t v12 = [(IDSDAccount *)v10 linkedAccounts];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10015BF90;
    v13[3] = &unk_1009822F8;
    v13[4] = self;
    objc_msgSend(v12, "__imForEach:", v13);
  }
}

- (void)_setupLocalAccounts
{
  v2 = +[IMRGLog registration];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up local accounts", buf, 2u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = +[IDSDServiceController sharedInstance];
  id obj = [v3 allServices];

  id v4 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [v7 identifier];
        if (![v7 adHocServiceType])
        {
          unsigned int v9 = [v8 isEqualToIgnoringCase:@"com.apple.madrid"];
          unsigned int v10 = [v8 isEqualToIgnoringCase:@"com.apple.private.alloy.sms"];
          unsigned int v11 = [v8 isEqualToIgnoringCase:@"com.apple.ess"];
          unsigned int v12 = [v8 isEqualToIgnoringCase:@"com.apple.private.ac"];
          unsigned int v13 = [v8 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"];
          if (((v9 | v10 | v11 | v12 | [v8 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"] | v13) & 1) == 0)-[IDSDAccountController setupLocalAccountForService:](self, "setupLocalAccountForService:", v7); {
        }
          }
      }
      id v4 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  __int16 v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finished setting up local accounts", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport();
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_refreshLocalAccounts
{
  v2 = +[IMRGLog registration];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refreshing local accounts", buf, 2u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = +[IDSDServiceController sharedInstance];
  id v4 = [v3 allServices];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v10 = [v9 identifier];
        if (![v9 adHocServiceType])
        {
          unsigned __int8 v11 = [v10 isEqualToIgnoringCase:@"com.apple.madrid"];
          unsigned __int8 v12 = [v10 isEqualToIgnoringCase:@"com.apple.private.alloy.sms"];
          unsigned __int8 v13 = [v10 isEqualToIgnoringCase:@"com.apple.ess"];
          unsigned __int8 v14 = [v10 isEqualToIgnoringCase:@"com.apple.private.ac"];
          unsigned __int8 v15 = [v10 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"];
          unsigned __int8 v16 = [v10 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];
          if ((v11 & 1) == 0 && (v12 & 1) == 0 && (v13 & 1) == 0 && (v14 & 1) == 0 && (v16 & 1) == 0 && (v15 & 1) == 0)
          {
            long long v17 = [(IDSDAccountController *)self existingAccountOnService:v9 withType:2 loginID:0];
            [(IDSDAccountController *)self _setupAdHocAccountsForPrimaryAccount:v17];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)_cleanupLocalAccounts
{
  id v3 = [(IDSDAccountController *)self accounts];
  id v4 = [v3 _copyForEnumerating];

  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (!v6)
  {
    unsigned __int8 v9 = 0;
    id v10 = 0;
    goto LABEL_30;
  }
  id v8 = v6;
  unsigned __int8 v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v34;
  *(void *)&long long v7 = 138412290;
  long long v27 = v7;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v34 != v11) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if ((objc_msgSend(v13, "isAdHocAccount", v27) & 1) == 0) {
        [v13 refreshAdHocServiceNames];
      }
      if ([v13 accountType] != 2)
      {
        unsigned __int8 v16 = [v13 service];
        unsigned int v17 = [v16 adHocServiceType];

        if (v17 == 2)
        {
          long long v18 = +[IMRGLog registration];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            long long v19 = [v13 smallDescription];
            *(_DWORD *)buf = v27;
            long long v39 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up account for local service %@", buf, 0xCu);
          }
          [v5 addObject:v13];
          if (v9)
          {
            unsigned __int8 v9 = 1;
            goto LABEL_18;
          }
          unsigned __int8 v9 = [v13 isRegistered];
          if (v10) {
            continue;
          }
        }
        else
        {
LABEL_18:
          if (v10) {
            continue;
          }
        }
LABEL_19:
        if (([v13 isAdHocAccount] & 1) != 0
          || ![v13 isRegistered])
        {
          id v10 = 0;
        }
        else
        {
          long long v20 = +[IMRGLog registration];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            long long v39 = v13;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using %@ to trigger a re-register", buf, 0xCu);
          }

          id v10 = v13;
        }
        continue;
      }
      unsigned __int8 v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v15 = [v13 smallDescription];
        *(_DWORD *)buf = v27;
        long long v39 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cleaning up local account %@", buf, 0xCu);
      }
      [v5 addObject:v13];
      if (!v10) {
        goto LABEL_19;
      }
    }
    id v8 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  }
  while (v8);
LABEL_30:

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v21 = [v5 allObjects];
  id v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        [(IDSDAccountController *)self _removeAccount:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
      }
      id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  if ((v9 & (v10 != 0)) == 1)
  {
    id v26 = +[IMRGLog registration];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "One of the local accounts was registered in the cloud, triggering a re-register to update", buf, 2u);
    }

    [v10 registerAccount];
  }
}

- (id)_strippedAccountInfo:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v3];

  [v4 removeObjectForKey:kIDSServiceDefaultsAccountTypeKey];
  [v4 removeObjectForKey:kIDSServiceDefaultsHasEverRegistered];
  [v4 removeObjectForKey:kIDSServiceDefaultsRegistrationInfoKey];
  [v4 removeObjectForKey:kIDSServiceDefaultsUniqueIDKey];

  return v4;
}

- (BOOL)_isAccountInfoRegistered:(id)a3
{
  id v3 = [a3 objectForKey:kIDSServiceDefaultsRegistrationInfoKey];
  id v4 = [v3 objectForKey:kIDSServiceDefaultsRegistrationInfoStatusKey];
  unsigned int v5 = [v4 intValue];

  return v5 == 5;
}

- (void)_setupForLocal
{
  [(IDSDAccountController *)self _setupLocalAccounts];

  [(IDSDAccountController *)self _setupUsingRemoteInfo];
}

- (BOOL)isLocalSetupEnabled
{
  v2 = +[IDSPairingManager sharedInstance];
  unsigned __int8 v3 = [v2 isCurrentDevicePairedOrPairing];

  return v3;
}

- (BOOL)isTraditionalLocalSetupEnabled
{
  v2 = +[IDSPairingManager sharedInstance];
  unsigned __int8 v3 = [v2 isTraditionalDevicePairedOrPairing];

  return v3;
}

- (void)startLocalSetup
{
  unsigned __int8 v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting local setup", v6, 2u);
  }

  [(IDSDAccountController *)self setHasHardDeregistered:0];
  [(IDSDAccountController *)self _setupForLocal];
  [(IDSDAccountController *)self _setupAdHocAccounts];
  id v4 = +[IDSDaemon sharedInstance];
  [v4 updateTopics];

  unsigned int v5 = +[IDSUTunDeliveryController sharedInstance];
  [v5 localAccountSetupCompleted];
}

- (void)stopLocalSetup
{
  unsigned __int8 v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping local setup", v5, 2u);
  }

  [(IDSDAccountController *)self _cleanupLocalAccounts];
  id v4 = +[IDSDaemon sharedInstance];
  [v4 updateTopics];

  [(IDSDAccountController *)self setHasHardDeregistered:0];
}

- (void)_setupAdHocAccountsForPrimaryAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = (id *)IMRGLog_ptr;
    if ([v4 isAdHocAccount])
    {
      v92 = +[IMRGLog registration];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
        sub_100713880(v4);
      }
      goto LABEL_128;
    }
    v94 = self;
    long long v7 = [v4 service];
    id v8 = +[IDSDServiceController sharedInstance];
    v92 = v7;
    unsigned __int8 v9 = [v7 identifier];
    id v10 = [v8 adHocServicesForIdentifier:v9];
    id v11 = [v10 _copyForEnumerating];

    id v12 = [v11 count];
    unsigned __int8 v13 = +[IMRGLog registration];
    unsigned __int8 v14 = v13;
    if (!v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100713904();
      }
      goto LABEL_127;
    }
    v88 = v5;
    unsigned __int8 v15 = &off_100793000;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = [v4 smallDescription];
      *(_DWORD *)buf = 138412290;
      v124 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, " * Setting up adhoc accounts for %@", buf, 0xCu);
    }
    unsigned __int8 v14 = [v4 loginID];
    unsigned int v105 = [v4 accountType];
    v101 = [v4 userUniqueIdentifier];
    unsigned int v17 = [v4 registration];
    v86 = [v17 adHocServiceNames];

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v87 = v11;
    id obj = v11;
    long long v18 = v94;
    id v97 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
    if (v97)
    {
      uint64_t v96 = *(void *)v116;
      uint64_t v90 = kIDSServiceDefaultsPrimaryAccountKey;
      uint64_t v91 = kIDSServiceDefaultsPrimaryServiceNameKey;
      uint64_t v89 = kIDSServiceDefaultsUserUniqueIdentifier;
      v93 = v4;
      v103 = v14;
      do
      {
        for (i = 0; i != v97; i = (char *)i + 1)
        {
          if (*(void *)v116 != v96) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v15 = *(NSObject **)(*((void *)&v115 + 1) + 8 * i);
          v100 = v15;
          if ([v15 adHocServiceType] == 2
            && ![(IDSDAccountController *)v18 isLocalSetupEnabled]
            || [v15 adHocServiceType] == 5
            && ![(IDSDAccountController *)v18 isLocalSetupEnabled])
          {
            goto LABEL_109;
          }
          v98 = i;
          v99 = v17;
          unsigned __int8 v15 = [v15 enabledOnlyWhenPaired];
          long long v20 = +[IDSPairingManager sharedInstance];
          unsigned int v21 = [v20 isCurrentDeviceTinkerConfiguredWatch];

          if ([v100 enabledOnlyOnStandaloneDevices])
          {
            id v22 = +[FTDeviceSupport sharedInstance];
            if ([v22 deviceType] == (id)6) {
              int v23 = v21 ^ 1;
            }
            else {
              int v23 = 0;
            }
          }
          else
          {
            int v23 = 0;
          }
          unsigned int v24 = [v100 disabledOnTinkerWatch] & v21;
          if (v15)
          {
            if ((![(IDSDAccountController *)v18 isTraditionalLocalSetupEnabled] | v23 | v24)) {
              goto LABEL_29;
            }
          }
          else if ((v23 | v24) == 1)
          {
LABEL_29:
            unsigned __int8 v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v25 = @"NO";
              if (v21) {
                CFStringRef v26 = @"YES";
              }
              else {
                CFStringRef v26 = @"NO";
              }
              *(_DWORD *)buf = 138413058;
              v124 = v100;
              if (v23) {
                CFStringRef v27 = @"YES";
              }
              else {
                CFStringRef v27 = @"NO";
              }
              __int16 v125 = 2112;
              if (v24) {
                CFStringRef v25 = @"YES";
              }
              CFStringRef v126 = v26;
              __int16 v127 = 2112;
              CFStringRef v128 = v27;
              __int16 v129 = 2112;
              CFStringRef v130 = v25;
              id v28 = v15;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cannot enable adhoc service {service: %@, isTinker: %@, cannotEnableOnTraditionalWatch: %@, cannotEnableOnTinkerWatch: %@}", buf, 0x2Au);
            }
            else
            {
              id v28 = v15;
            }
            i = v98;
            goto LABEL_108;
          }
          if (!v105)
          {
            i = v98;
            unsigned int v17 = v99;
            if (([v100 wantsPhoneNumberAccount] & 1) == 0) {
              goto LABEL_109;
            }
LABEL_42:
            if ([v100 adHocServiceType] == 2)
            {
              long long v29 = [v100 pushTopic];
              unsigned __int8 v15 = [v29 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

              unsigned int v17 = v99;
              if (!v15) {
                goto LABEL_109;
              }
            }
            BOOL v104 = v105 != 0;
            if ([v100 adHocServiceType] == 5) {
              goto LABEL_109;
            }
            goto LABEL_45;
          }
          i = v98;
          unsigned int v17 = v99;
          if (v105 == 1) {
            goto LABEL_42;
          }
          BOOL v104 = 0;
LABEL_45:
          long long v30 = [(IDSDAccountController *)v18 accountsOnService:v100 withType:v105];
          id v31 = [v30 _copyForEnumerating];

          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v32 = v31;
          id v33 = [v32 countByEnumeratingWithState:&v111 objects:v122 count:16];
          if (!v33)
          {

            v106 = 0;
LABEL_83:
            long long v18 = v94;
            id v57 = [IDSDAccount alloc];
            long long v58 = +[NSString stringGUID];
            long long v59 = [v4 accountInfo];
            long long v60 = [v4 uniqueID];
            long long v61 = [(IDSDAccount *)v57 initAdHocAccountWithLoginID:v14 service:v100 uniqueID:v58 accountType:v105 accountConfig:v59 primaryAccount:v60];

            id v6 = (id *)IMRGLog_ptr;
            v62 = +[IMRGLog registration];
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = [v61 smallDescription];
              *(_DWORD *)buf = 138412290;
              v124 = v63;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "  => Created ad hoc account %@", buf, 0xCu);
            }
            id v28 = v61;
            [(IDSDAccountController *)v94 _addAccount:v61];
            goto LABEL_91;
          }
          id v34 = v33;
          long long v35 = 0;
          v106 = 0;
          char v36 = 0;
          uint64_t v37 = *(void *)v112;
          unsigned int v38 = v105;
          id v102 = v32;
          do
          {
            for (j = 0; j != v34; j = (char *)j + 1)
            {
              if (*(void *)v112 != v37) {
                objc_enumerationMutation(v102);
              }
              long long v40 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
              if (v38)
              {
                unsigned int v41 = 1;
                if (!v35) {
                  goto LABEL_58;
                }
              }
              else
              {
                long long v42 = [*(id *)(*((void *)&v111 + 1) + 8 * (void)j) userUniqueIdentifier];
                unsigned int v41 = [v42 isEqualToString:v101];

                if (!v35) {
                  goto LABEL_58;
                }
              }
              if (v41)
              {
                long long v43 = [*v6 registration];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  long long v44 = [v40 smallDescription];
                  *(_DWORD *)buf = 138412290;
                  v124 = v44;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "  => Found **extra** adhoc account %@, deleting...", buf, 0xCu);

                  id v6 = (id *)IMRGLog_ptr;
                }

                char v36 = 1;
              }
LABEL_58:
              if (v104)
              {
                long long v45 = [v40 loginID];
                if ([v45 length] || -[NSObject length](v103, "length"))
                {
                  long long v46 = [v40 loginID];
                  unsigned __int8 v47 = [v46 isEqualToIgnoringCase:v103];

                  id v6 = (id *)IMRGLog_ptr;
                  if ((v47 & 1) == 0)
                  {
                    long long v48 = +[IMRGLog registration];
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                    {
                      long long v49 = [v40 smallDescription];
                      *(_DWORD *)buf = 138412546;
                      v124 = v49;
                      __int16 v125 = 2112;
                      CFStringRef v126 = (const __CFString *)v103;
                      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "  => Found **mismatched** adhoc account %@ primary ID %@, deleting...", buf, 0x16u);

                      id v6 = (id *)IMRGLog_ptr;
                    }

LABEL_67:
                    unsigned int v38 = v105;
                    id v50 = v106;
                    if (!v106) {
                      id v50 = objc_alloc_init((Class)NSMutableArray);
                    }
                    v106 = v50;
                    [v50 addObject:v40];
                    char v36 = 1;
                    continue;
                  }
                }
                else
                {
                }
              }
              if (v36) {
                goto LABEL_67;
              }
              if (v41)
              {
                id v51 = [*v6 registration];
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
                  sub_100713970(v120, v40, &v121, v51);
                }

                v52 = v40;
                char v36 = 0;
                long long v35 = v52;
              }
              else
              {
                char v36 = 0;
              }
              unsigned int v38 = v105;
            }
            id v34 = [v102 countByEnumeratingWithState:&v111 objects:v122 count:16];
          }
          while (v34);

          unsigned __int8 v14 = v103;
          if (!v35)
          {
            id v4 = v93;
            goto LABEL_83;
          }
          id v4 = v93;
          id v53 = [v93 uniqueID];
          long long v54 = [v92 identifier];
          id v55 = [v35 primaryAccount];
          long long v18 = v94;
          id v28 = v35;
          if (v55 != v93)
          {

            goto LABEL_87;
          }
          v64 = [v35 primaryAccountUniqueID];
          unsigned __int8 v65 = [v64 isEqualToIgnoringCase:v53];

          if ((v65 & 1) == 0)
          {
LABEL_87:
            [v35 setObject:v54 forKey:v91];
            [v35 setObject:v53 forKey:v90];
            [v35 setObject:v101 forKey:v89];
            __int16 v66 = +[IMRGLog registration];
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              v67 = [v35 smallDescription];
              *(_DWORD *)buf = 138412290;
              v124 = v67;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "  => Updating primary account info for %@", buf, 0xCu);
            }
            [(IDSDAccountController *)v94 delayedSaveSettings];
          }

          id v6 = (id *)IMRGLog_ptr;
LABEL_91:
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v68 = v106;
          id v69 = [v68 countByEnumeratingWithState:&v107 objects:v119 count:16];
          if (v69)
          {
            id v70 = v69;
            uint64_t v71 = *(void *)v108;
            do
            {
              for (k = 0; k != v70; k = (char *)k + 1)
              {
                if (*(void *)v108 != v71) {
                  objc_enumerationMutation(v68);
                }
                [(IDSDAccountController *)v18 _removeAccount:*(void *)(*((void *)&v107 + 1) + 8 * (void)k)];
              }
              id v70 = [v68 countByEnumeratingWithState:&v107 objects:v119 count:16];
            }
            while (v70);
          }

          unsigned __int8 v15 = [v4 isEnabled];
          i = v98;
          if (v15 != [v28 isEnabled])
          {
            unsigned int v73 = [v4 isEnabled];
            v74 = +[IMRGLog registration];
            BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
            if (v73)
            {
              if (v75)
              {
                v76 = [v28 smallDescription];
                *(_DWORD *)buf = 138412290;
                v124 = v76;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "  * Enabling account: %@", buf, 0xCu);
              }
              unsigned __int8 v15 = [v28 uniqueID];
              [(IDSDAccountController *)v18 _enableAccountWithUniqueID:v15];
            }
            else
            {
              if (v75)
              {
                v77 = [v28 smallDescription];
                *(_DWORD *)buf = 138412290;
                v124 = v77;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "  * Disabling account: %@", buf, 0xCu);
              }
              unsigned __int8 v15 = [v28 uniqueID];
              [(IDSDAccountController *)v18 _disableAccountWithUniqueID:v15];
            }
          }
LABEL_108:
          unsigned int v17 = v99;

LABEL_109:
        }
        id v97 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
      }
      while (v97);
    }

    [v4 refreshAdHocServiceNames];
    id v11 = v87;
    unsigned int v5 = v88;
    if (!v86)
    {
      unsigned int v17 = [v4 registration];
      uint64_t v78 = [v17 adHocServiceNames];
      if (!v78)
      {

LABEL_126:
LABEL_127:

LABEL_128:
        goto LABEL_129;
      }
      unsigned __int8 v15 = v78;
    }
    v79 = [v4 registration];
    v80 = [v79 adHocServiceNames];
    unsigned __int8 v81 = [v86 isEqualToArray:v80];

    if (!v86)
    {
    }
    if ((v81 & 1) == 0 && [v4 isRegistered])
    {
      v82 = +[IMRGLog registration];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "  => Triggering a re-register for primary account", buf, 2u);
      }

      v83 = +[IMRGLog registration];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        v84 = [v4 registration];
        v85 = [v84 adHocServiceNames];
        *(_DWORD *)buf = 138412546;
        v124 = v86;
        __int16 v125 = 2112;
        CFStringRef v126 = v85;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, " current service names %@ new service names %@", buf, 0x16u);
      }
      [v4 registerAccount];
    }
    goto LABEL_126;
  }
LABEL_129:
}

- (void)_setupAdHocAccounts
{
  unsigned __int8 v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up ad hoc accounts", buf, 2u);
  }

  id v4 = [(IDSDAccountController *)self accounts];
  id v5 = [v4 _copyForEnumerating];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isAdHocAccount", (void)v13) & 1) == 0) {
          [(IDSDAccountController *)self _setupAdHocAccountsForPrimaryAccount:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = +[IMRGLog registration];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " => Done setting up ad hoc accounts", buf, 2u);
  }
}

- (void)_setupLinkedAccounts
{
  v2 = (id *)IMRGLog_ptr;
  unsigned __int8 v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up linked accounts, if necessary", buf, 2u);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v4 = [(IDSDAccountController *)self accounts];
  id v5 = [v4 _copyForEnumerating];

  id obj = v5;
  id v44 = [v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v57;
    *(void *)&long long v6 = 138412546;
    long long v41 = v6;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v57 != v43) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        objc_msgSend(v8, "service", v41);
        uint64_t v9 = (IDSDAccount *)objc_claimAutoreleasedReturnValue();
        id v10 = +[IDSDServiceController sharedInstance];
        id v11 = [v10 linkedServicesForService:v9];

        if ([v11 count])
        {
          unsigned __int8 v47 = i;
          id v12 = [*v2 registration];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v41;
            v62 = v9;
            __int16 v63 = 2112;
            v64 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " Service: %@  has linked services: %@", buf, 0x16u);
          }
          long long v46 = v9;

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v45 = v11;
          id v49 = v11;
          id v13 = [v49 countByEnumeratingWithState:&v52 objects:v60 count:16];
          long long v14 = self;
          if (v13)
          {
            id v15 = v13;
            uint64_t v50 = *(void *)v53;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v53 != v50) {
                  objc_enumerationMutation(v49);
                }
                unsigned int v17 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
                if ([v17 disabledOnTinkerWatch])
                {
                  long long v18 = +[IDSPairingManager sharedInstance];
                  unsigned __int8 v19 = [v18 isCurrentDeviceTinkerConfiguredWatch];

                  if (v19) {
                    continue;
                  }
                }
                long long v20 = [v8 linkedAccounts];
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472;
                v51[2] = sub_10015E33C;
                v51[3] = &unk_100983F58;
                v51[4] = v17;
                unsigned int v21 = objc_msgSend(v20, "__imArrayByFilteringWithBlock:", v51);
                id v22 = [v21 firstObject];

                if (v22)
                {
                  int v23 = [*v2 registration];
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " We already have linked accounts, let's just double check the activation", buf, 2u);
                  }

                  unsigned int v24 = [v8 isEnabled];
                  if (v24 != [(IDSDAccount *)v22 isEnabled])
                  {
                    CFStringRef v25 = [*v2 registration];
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " * They're not the same, let's fix that", buf, 2u);
                    }

                    unsigned int v26 = [v8 isEnabled];
                    CFStringRef v27 = [*v2 registration];
                    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                    if (v26)
                    {
                      if (v28)
                      {
                        *(_DWORD *)buf = 138412290;
                        v62 = v22;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " * Enabling account: %@", buf, 0xCu);
                      }

                      long long v29 = [(IDSDAccount *)v22 uniqueID];
                      [(IDSDAccountController *)v14 enableAccountWithUniqueID:v29];

                      if ([v8 accountType] != 2) {
                        [(IDSDAccount *)v22 registerAccount];
                      }
                    }
                    else
                    {
                      if (v28)
                      {
                        *(_DWORD *)buf = 138412290;
                        v62 = v22;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " * Disabling account: %@", buf, 0xCu);
                      }

                      long long v39 = [(IDSDAccount *)v22 uniqueID];
                      [(IDSDAccountController *)v14 disableAccountWithUniqueID:v39];
                    }
                  }
                }
                else if ([v8 accountType] == 1)
                {
                  long long v30 = [IDSDAccount alloc];
                  id v31 = [v8 loginID];
                  +[NSString stringGUID];
                  v33 = id v32 = v2;
                  id v34 = [v8 accountType];
                  long long v35 = [v8 accountInfo];
                  id v22 = [(IDSDAccount *)v30 initWithLoginID:v31 service:v17 uniqueID:v33 accountType:v34 accountConfig:v35];

                  v2 = v32;
                  char v36 = [*v32 registration];
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v62 = v22;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "  Creating a linked account: %@", buf, 0xCu);
                  }

                  long long v14 = self;
                  [(IDSDAccountController *)self addAccount:v22];
                  if ([v8 isEnabled])
                  {
                    uint64_t v37 = [*v2 registration];
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "  ... and enabling it", buf, 2u);
                    }

                    unsigned int v38 = [(IDSDAccount *)v22 uniqueID];
                    [(IDSDAccountController *)self enableAccountWithUniqueID:v38];

                    [(IDSDAccount *)v22 registerAccount];
                  }
                }
                else
                {
                  id v22 = 0;
                }
              }
              id v15 = [v49 countByEnumeratingWithState:&v52 objects:v60 count:16];
            }
            while (v15);
          }

          uint64_t v9 = v46;
          i = v47;
          id v11 = v45;
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v44);
  }

  long long v40 = [*v2 registration];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, " => Done setting up linked accounts", buf, 2u);
  }
}

- (void)_migrateLegacyAccounts
{
  [(IDSDAccountController *)self _migrateLegacyAccounts1];

  [(IDSDAccountController *)self _migrateLegacyAccounts2];
}

- (void)_migrateLegacyAccounts1
{
  v2 = self;
  unsigned __int8 v3 = [(IDSDAccountController *)self userDefaults];
  unsigned int v4 = [v3 appBoolForKey:@"ImportedLegacyIMAccounts"];

  if (v4)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not importing legacy accounts, we've already done this", buf, 2u);
    }
  }
  else
  {
    long long v6 = [(IDSDAccountController *)v2 userDefaults];
    [v6 setAppBool:1 forKey:@"ImportedLegacyIMAccounts"];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v7 = +[IDSDServiceController sharedInstance];
    id v5 = [v7 allServices];

    id v48 = [v5 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v52;
      uint64_t v43 = kIDSServiceDefaultsAccounts;
      uint64_t v42 = kIDSServiceDefaultsEnabledAccounts;
      id v44 = v5;
      long long v41 = v2;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v52 != v47) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(NSObject **)(*((void *)&v51 + 1) + 8 * i);
          id v10 = [v9 identifier];
          unsigned __int8 v11 = [v10 isEqualToIgnoringCase:@"com.apple.madrid"];
          id v12 = @"com.apple.imservice.iMessage";
          if ((v11 & 1) == 0)
          {
            unsigned int v13 = [v10 isEqualToIgnoringCase:@"com.apple.ess"];
            id v12 = @"com.apple.imservice.FaceTime";
            if (!v13) {
              id v12 = 0;
            }
          }
          long long v14 = v12;

          if ([(__CFString *)v14 length])
          {
            id v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v56 = v14;
              __int16 v57 = 2112;
              long long v58 = v9;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Importing from domain %@ => %@", buf, 0x16u);
            }

            long long v16 = [(IDSDAccountController *)v2 userDefaults];
            unsigned int v17 = [v9 preferencesDomain];
            id v18 = [v16 copyKeyListForAppID:v17];

            unsigned __int8 v19 = [(IDSDAccountController *)v2 userDefaults];
            long long v20 = [v9 preferencesDomain];
            unsigned int v21 = [v19 copyMultipleForCurrentKeys:v18 appID:v20];

            id v22 = [v21 objectForKey:@"Accounts"];
            id v23 = [v22 count];

            if (v23)
            {
              unsigned int v24 = +[IMRGLog registration];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                long long v56 = v9;
                __int16 v57 = 2112;
                long long v58 = v21;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping service import: %@, we already have accounts: %@", buf, 0x16u);
              }
            }
            else
            {
              CFStringRef v25 = [(IDSDAccountController *)v2 userDefaults];
              unsigned int v24 = [v25 copyKeyListForAppID:v14];

              unsigned int v26 = +[IMRGLog registration];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v56 = v24;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Legacy Keys: %@", buf, 0xCu);
              }

              if ([v24 count])
              {
                CFStringRef v27 = [(IDSDAccountController *)v2 userDefaults];
                BOOL v28 = [v27 copyMultipleForCurrentKeys:v24 appID:v14];

                long long v29 = +[IMRGLog registration];
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v56 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Legacy Preferences: %@", buf, 0xCu);
                }

                long long v30 = v28;
                long long v46 = [v28 objectForKey:@"Accounts"];
                id v31 = [v46 count];
                id v32 = +[IMRGLog registration];
                BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
                if (v31)
                {
                  if (v33)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Importing accounts...", buf, 2u);
                  }

                  id v32 = objc_alloc_init((Class)NSMutableDictionary);
                  id v34 = objc_alloc_init((Class)NSMutableDictionary);
                  v49[0] = _NSConcreteStackBlock;
                  v49[1] = 3221225472;
                  v49[2] = sub_10015EA80;
                  v49[3] = &unk_100980928;
                  id v50 = v34;
                  id v45 = v34;
                  [v46 enumerateKeysAndObjectsUsingBlock:v49];
                  [v32 setObject:v45 forKey:v43];
                  long long v35 = [v30 objectForKey:@"ActiveAccounts"];
                  [v32 setObject:v35 forKey:v42];

                  char v36 = [(IDSDAccountController *)v41 userDefaults];
                  uint64_t v37 = [v9 preferencesDomain];
                  [v36 setMultiple:v32 remove:0 appID:v37];

                  unsigned int v38 = [(IDSDAccountController *)v41 userDefaults];
                  long long v39 = [v9 preferencesDomain];
                  [v38 synchronizeAppID:v39];

                  v2 = v41;
                  long long v40 = v46;
                }
                else
                {
                  if (v33)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "  => Nothing interesting in the accounts, moving along", buf, 2u);
                  }
                  long long v40 = v46;
                }

                id v5 = v44;
              }
            }
          }
        }
        id v48 = [v5 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v48);
    }
  }
}

- (void)_migrateLegacyAccounts2
{
  unsigned __int8 v3 = [(IDSDAccountController *)self userDefaults];
  unsigned int v4 = [v3 appBoolForKey:@"ImportedLegacyIDSAccounts2"];

  if (v4)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not importing legacy accounts, we've already done this", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    id v5 = +[NSMutableDictionary dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v6 = [(IDSDServiceController *)self->_serviceController allServices];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v17;
      *(void *)&long long v8 = 138412546;
      long long v15 = v8;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = -[IDSDAccountController _legacyAccountsOnService:](self, "_legacyAccountsOnService:", v11, v15);
          unsigned int v13 = [v11 preferencesDomain];
          [v5 setObject:v12 forKeyedSubscript:v13];
        }
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    long long v14 = [(IDSDAccountController *)self userDefaults];
    [v14 setAppBool:1 forKey:@"ImportedLegacyIDSAccounts2"];

    [(IDSDAccountController *)self _persistAccounts:v5];
  }
}

- (id)_legacyAccountsOnService:(id)a3
{
  unsigned int v4 = a3;
  id v5 = [v4 preferencesDomain];
  if ([v5 length])
  {
    long long v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      CFStringRef v25 = v5;
      __int16 v26 = 2112;
      CFStringRef v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Importing from domain %@ => %@", (uint8_t *)&v24, 0x16u);
    }

    id v7 = [(IDSDAccountController *)self _preferencesOnDomain:v5];
    long long v8 = (const void *)kIDSServiceDefaultsAccounts;
    uint64_t v9 = [v7 objectForKeyedSubscript:kIDSServiceDefaultsAccounts];
    id v10 = [v9 count];

    if (v10)
    {
      unsigned __int8 v11 = [(IDSDAccountController *)self _preferencesOnDomain:@"com.apple.identityservicesd"];
      id v12 = [v11 objectForKeyedSubscript:@"services"];
      unsigned int v13 = [v4 preferencesDomain];
      long long v14 = [v12 objectForKeyedSubscript:v13];

      long long v15 = [v14 objectForKeyedSubscript:v8];
      id v16 = [v15 count];

      if (v16)
      {
        long long v17 = +[IMRGLog registration];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412546;
          CFStringRef v25 = v4;
          __int16 v26 = 2112;
          CFStringRef v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping service import: %@, we already have accounts: %@", (uint8_t *)&v24, 0x16u);
        }
        id v18 = 0;
      }
      else
      {
        long long v19 = (const void *)kIDSServiceDefaultsEnabledAccounts;
        long long v17 = [v7 objectForKeyedSubscript:kIDSServiceDefaultsEnabledAccounts];
        if (![v17 count])
        {
          long long v20 = +[IMRGLog registration];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 138412290;
            CFStringRef v25 = v5;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Migrating legacy account found no enabled accounts { legacyDomain : %@ }", (uint8_t *)&v24, 0xCu);
          }
        }
        unsigned int v21 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v22 = [v7 objectForKeyedSubscript:v8];
        if (v22)
        {
          CFDictionarySetValue(v21, v8, v22);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1007139E8();
        }

        if (v17) {
          CFDictionarySetValue(v21, v19, v17);
        }
        id v18 = [(__CFDictionary *)v21 copy];
      }
    }
    else
    {
      long long v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Nothing interesting in the accounts, moving along", (uint8_t *)&v24, 2u);
      }
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_persistAccounts:(id)a3
{
  id v4 = a3;
  long long v6 = +[IMRGLog registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persisting %@ accounts", (uint8_t *)&v11, 0xCu);
  }
  long long v8 = JWEncodeDictionary();
  id v9 = [v8 _FTCopyOptionallyGzippedData];

  id v10 = [(IDSDAccountController *)self userDefaults];
  [v10 setValue:v9 forKey:@"services" appID:@"com.apple.identityservicesd"];
}

- (id)_preferencesOnDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDAccountController *)self userDefaults];
  id v6 = [v5 copyKeyListForAppID:v4];

  if (v6)
  {
    id v7 = [(IDSDAccountController *)self userDefaults];
    id v8 = [v7 copyMultipleForCurrentKeys:v6 appID:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)hasForcedReRegistered
{
  unsigned __int8 v3 = [(IDSDAccountController *)self userDefaults];
  id v4 = [v3 appValueForKey:@"ReRegisteredForDevicesHash"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = _IDSServiceDictionaryRepresentableHash();
    unsigned int v6 = [v4 isEqualToString:v5];
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      *(_DWORD *)id v16 = 138412802;
      if (v6) {
        CFStringRef v8 = @"YES";
      }
      *(void *)&v16[4] = v8;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      long long v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Computed force register hash {matched: %@, old: %@, new: %@}", v16, 0x20u);
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  id v9 = [(IDSDAccountController *)self userDefaults];
  id v10 = [v9 appValueForKey:@"ReRegisteredForDevices"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v10 integerValue];
    BOOL v12 = v11 == (id)sub_10015F4AC();
  }
  else
  {
    BOOL v12 = 0;
  }
  unsigned int v13 = [(IDSDAccountController *)self userDefaults];
  unsigned __int8 v14 = [v13 appBoolForKey:@"ReRegisterForAliasRepair"];

  return v12 & ~v14 & v6;
}

- (void)_cleanupLegacyAccounts
{
  unsigned __int8 v3 = [(IDSDAccountController *)self userDefaults];
  unsigned __int8 v4 = [v3 appBoolForKey:@"DidCleanLegacyAccountPrefs"];

  if ((v4 & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(IDSDServiceController *)self->_serviceController allServices];
    id v5 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v8 = [*(id *)(*((void *)&v23 + 1) + 8 * i) preferencesDomain];
          id v9 = [(IDSDAccountController *)self userDefaults];
          id v10 = [v9 copyKeyListForAppID:v8];

          id v11 = [(IDSDAccountController *)self userDefaults];
          [v11 setMultiple:0 remove:v10 appID:v8];

          BOOL v12 = NSHomeDirectory();
          unsigned int v13 = +[NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", v12, v8];
          unsigned __int8 v14 = +[NSFileManager defaultManager];
          id v22 = 0;
          unsigned int v15 = [v14 removeItemAtPath:v13 error:&v22];
          id v16 = v22;

          __int16 v17 = +[IMRGLog registration];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412802;
            CFStringRef v18 = @"NO";
            if (v15) {
              CFStringRef v18 = @"YES";
            }
            BOOL v28 = v13;
            __int16 v29 = 2112;
            CFStringRef v30 = v18;
            __int16 v31 = 2112;
            id v32 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Deleting legacy account prefs {path: %@, success: %@, error: %@}", buf, 0x20u);
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v6);
    }

    __int16 v19 = [(IDSDAccountController *)self userDefaults];
    [v19 setAppBool:1 forKey:@"DidCleanLegacyAccountPrefs"];
  }
}

- (void)_cleanupLegacyLocalAccounts
{
  unsigned __int8 v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SU cleanup", buf, 2u);
  }

  id v31 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v4 = [(IDSDAccountController *)self userDefaults];
  unsigned __int8 v5 = [v4 appBoolForKey:@"MigratedToNewDisabledState"];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v33 = self;
  id v6 = [(IDSDAccountController *)self accounts];
  id v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        BOOL v12 = [v11 service];
        unsigned int v13 = [v12 pushTopic];

        if ([v13 isEqualToIgnoringCase:@"com.apple.private.alloy.willow"]
          && ![v11 accountType])
        {
          [v31 addObject:v11];
          if (v5) {
            goto LABEL_15;
          }
        }
        else if (v5)
        {
          goto LABEL_15;
        }
        if (([v11 isAdHocAccount] & 1) == 0)
        {
          unsigned __int8 v14 = [v11 uniqueID];
          unsigned __int8 v15 = [(IDSDAccountController *)v33 isEnabledAccount:v14];

          if ((v15 & 1) == 0) {
            [v11 setIsUserDisabled:1];
          }
        }
LABEL_15:
        id v16 = [v11 service];
        if ([v16 adHocServiceType] == 5)
        {
          unsigned int v17 = [v11 accountType];

          if (v17 != 2) {
            [v31 addObject:v11];
          }
        }
        else
        {
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  CFStringRef v18 = v33;
  if ((v5 & 1) == 0)
  {
    __int16 v19 = [(IDSDAccountController *)v33 userDefaults];
    [v19 setAppBool:1 forKey:@"MigratedToNewDisabledState"];
  }
  long long v37 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  id v20 = v31;
  id v21 = [v20 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    uint64_t v32 = 138412290;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        long long v26 = +[IMRGLog internalCleanup];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v27 = [v25 smallDescription];
          *(_DWORD *)int buf = v32;
          uint64_t v43 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removing account %@", buf, 0xCu);

          CFStringRef v18 = v33;
        }

        [(IDSDAccountController *)v18 _removeAccount:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v22);
  }

  unsigned __int8 v28 = [(IDSDAccountController *)v18 hasForcedReRegistered];
  __int16 v29 = +[IMRGLog registration];
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v28)
  {
    if (v30)
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "We've already re-registered, ignoring...", buf, 2u);
    }
  }
  else
  {
    if (v30)
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v43) = 60;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Scheduling a re-register in %d seconds", buf, 8u);
    }

    im_dispatch_after_primary_queue();
  }
  im_dispatch_after_primary_queue();
}

- (void)_servicesChanged
{
  if ([(IDSDAccountController *)self isLocalSetupEnabled])
  {
    [(IDSDAccountController *)self _refreshLocalAccounts];
  }
}

- (void)_servicesRemoved:(id)a3
{
  unsigned __int8 v4 = [a3 userInfo];
  unsigned __int8 v5 = [v4 objectForKey:@"RemovedServices"];

  id v6 = +[IMRGLog sub_services];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    uint64_t v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "All services to remove: %@", buf, 0xCu);
  }

  if ([v5 count])
  {
    id v7 = [(NSMutableDictionary *)self->_accountIDMap allKeys];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = [(NSMutableDictionary *)self->_accountIDMap objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v11)];
          unsigned int v13 = [v12 service];
          unsigned __int8 v14 = [v13 identifier];
          unsigned int v15 = [v5 containsObject:v14];

          if (v15) {
            [(IDSDAccountController *)self _removeAccount:v12];
          }

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    id v16 = +[IDSDaemonPriorityQueueController sharedInstance];
    [v16 performBlockSyncPriority:&stru_100983F78];
  }
}

- (void)loadStoredAccounts
{
  if (!self->_accountsLoaded)
  {
    *(_WORD *)&self->_accountsLoaded = 257;
    [(IDSDAccountController *)self _migrateLegacyAccounts];
    unsigned __int8 v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 136315138;
      id v11 = "-[IDSDAccountController loadStoredAccounts]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v9 = "-[IDSDAccountController loadStoredAccounts]";
      _IDSLogV();
    }
    [(NSMutableSet *)self->_enabledAccounts removeAllObjects];
    if (![(IDSDAccountController *)self _loadAndEnableStoredAccounts]) {
      [(IDSDAccountController *)self _loadAndEnableStoredLegacyAccounts];
    }
    self->_isLoading = 0;
    [(IDSDAccountController *)self _cleanupLegacyAccounts];
    [(IDSDAccountController *)self _cleanupLegacyLocalAccounts];
    [(IDSDAccountController *)self _setupLinkedAccounts];
    unsigned int v4 = [(IDSDAccountController *)self isLocalSetupEnabled];
    unsigned __int8 v5 = +[IMRGLog registration];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting up local", buf, 2u);
      }

      [(IDSDAccountController *)self startLocalSetup];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not setting up local", buf, 2u);
      }

      [(IDSDAccountController *)self _cleanupLocalAccounts];
      [(IDSDAccountController *)self _setupAdHocAccounts];
      id v7 = [(IDSDAccountController *)self daemon];
      [v7 updateTopics];
    }
    [(IDSDAccountController *)self _cleanUpAccountCredentialStore];
    [(IDSDAccountController *)self _resumeGDRReAuthenticateIfNecessary];
    id v8 = [(IDSDAccountController *)self delegate];
    [v8 accountControllerDidFinishLoadingAccounts:self];
  }
}

- (id)_createAccountWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[IDSDAccount alloc] initWithDictionary:v9 service:v8 uniqueID:v7];

  return v10;
}

- (void)_addAccountDuringInitialSetup:(id)a3
{
  accountIDMapLock = self->_accountIDMapLock;
  id v5 = a3;
  [(NSRecursiveLock *)accountIDMapLock lock];
  accountIDMap = self->_accountIDMap;
  id v7 = [v5 uniqueID];
  [(NSMutableDictionary *)accountIDMap setObject:v5 forKey:v7];

  id v8 = self->_accountIDMapLock;

  [(NSRecursiveLock *)v8 unlock];
}

- (void)_attachOrphanedPhoneAliases:(id)a3 toRecipientAccounts:(id)a4 withAccountsToEnable:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v24 = a5;
  if ([v7 count])
  {
    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
      *(_DWORD *)int buf = 138412290;
      long long v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Dropped aliases { count: %@ }", buf, 0xCu);
    }
    id v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
      *(_DWORD *)int buf = 138412290;
      long long v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Donor accounts { count: %@ }", buf, 0xCu);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v8;
    id v25 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v25)
    {
      uint64_t v23 = *(void *)v32;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v13;
          unsigned __int8 v14 = [v24 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * v13)];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v15 = v7;
          id v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v28;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v15);
                }
                long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                id v21 = +[IMRGLog registration];
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)int buf = 138412546;
                  long long v36 = v20;
                  __int16 v37 = 2112;
                  long long v38 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Adding %@ to %@", buf, 0x16u);
                }

                [v14 addAliases:v20];
              }
              id v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }
            while (v17);
          }

          uint64_t v13 = v26 + 1;
        }
        while ((id)(v26 + 1) != v25);
        id v25 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v25);
    }
  }
}

- (BOOL)_loadAndEnableStoredAccounts
{
  unsigned __int8 v3 = [(IDSDAccountController *)self userDefaults];
  id v4 = [v3 copyValueForKey:@"services" appID:@"com.apple.identityservicesd"];

  long long v60 = v4;
  id v5 = v4;
  BOOL v6 = self;
  id v7 = [v5 _FTOptionallyDecompressData];
  unsigned __int8 v65 = JWDecodeDictionary();

  id v71 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [(IDSDServiceController *)self->_serviceController allServices];
  id v9 = +[IMRGLog registration];
  p_isa = (id *)&v6->super.isa;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    *(_DWORD *)int buf = 138412290;
    v101 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Loaded services { count: %@ }", buf, 0xCu);

    BOOL v6 = (IDSDAccountController *)p_isa;
  }

  id v11 = [(IDSDAccountController *)v6 userDefaults];
  unsigned __int8 v73 = [v11 appBoolForKey:@"performed-user-intent-migrate"];

  BOOL v12 = p_isa;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v8;
  uint64_t v13 = (id *)IMRGLog_ptr;
  id v66 = [obj countByEnumeratingWithState:&v94 objects:v109 count:16];
  if (v66)
  {
    uint64_t v64 = *(void *)v95;
    uint64_t v62 = kIDSServiceDefaultsEnabledAccounts;
    uint64_t v63 = kIDSServiceDefaultsAccounts;
    do
    {
      for (i = 0; i != v66; i = (char *)i + 1)
      {
        if (*(void *)v95 != v64) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(NSObject **)(*((void *)&v94 + 1) + 8 * i);
        v80 = v15;
        id v17 = [v15 preferencesDomain];
        uint64_t v18 = [v65 objectForKeyedSubscript:v17];

        long long v19 = [v18 objectForKeyedSubscript:v63];
        v74 = [v18 objectForKeyedSubscript:v62];
        uint64_t v13 = (id *)IMRGLog_ptr;
        if (v18)
        {
          v67 = v18;
          id v68 = v16;
          id v69 = i;
          id v70 = objc_alloc_init((Class)NSMutableArray);
          id v72 = objc_alloc_init((Class)NSMutableArray);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id v81 = [v19 allKeys];
          id v20 = [v81 countByEnumeratingWithState:&v90 objects:v108 count:16];
          v79 = v19;
          if (!v20) {
            goto LABEL_50;
          }
          id v21 = v20;
          id v22 = v19;
          uint64_t v23 = *(void *)v91;
          while (1)
          {
            id v24 = 0;
            do
            {
              if (*(void *)v91 != v23) {
                objc_enumerationMutation(v81);
              }
              id v25 = *(void **)(*((void *)&v90 + 1) + 8 * (void)v24);
              uint64_t v26 = [v22 objectForKeyedSubscript:v25];
              if (v26)
              {
                long long v27 = [v12 accountWithUniqueID:v25];
                if (v27)
                {
                  long long v28 = [*v13 warning];
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  {
                    long long v29 = [v27 accountSetupInfo];
                    *(_DWORD *)int buf = 138412802;
                    v101 = v25;
                    __int16 v102 = 2112;
                    v103 = v29;
                    __int16 v104 = 2112;
                    *(void *)unsigned int v105 = v26;
                    _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "We already have an existing account with for this uniqueID -- not loading { uniqueID: %@, existingAccountInfo: %@, newAccountInfo: %@ }", buf, 0x20u);

                    uint64_t v13 = (id *)IMRGLog_ptr;
                  }
                  goto LABEL_37;
                }
                long long v30 = [v12 _createAccountWithDictionary:v26 service:v80 uniqueID:v25];
                long long v28 = v30;
                if (!v30)
                {
                  long long v31 = [*v13 warning];
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)int buf = 138412802;
                    v101 = v25;
                    __int16 v102 = 2112;
                    v103 = v80;
                    __int16 v104 = 2112;
                    *(void *)unsigned int v105 = v26;
                    _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Failed to create account { uniqueID: %@, service: %@, accountInfo: %@ }", buf, 0x20u);
                  }
                  goto LABEL_36;
                }
                long long v31 = [v30 serviceType];
                id v32 = [v28 accountType];
                if (objc_msgSend(v12[9], "systemSupportsServiceType:accountType:isTemporary:", v31, v32, -[NSObject isTemporary](v28, "isTemporary")))
                {
                  if (v32
                    || ([v80 wantsPhoneNumberAccount] & 1) != 0)
                  {
                    if ([v80 disabledOnTinkerWatch])
                    {
                      long long v33 = +[IDSPairingManager sharedInstance];
                      unsigned int loga = [v33 isCurrentDeviceTinkerConfiguredWatch];

                      BOOL v12 = p_isa;
                      if (loga)
                      {
                        log = +[IMRGLog warning];
                        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)int buf = 138413314;
                          v101 = v25;
                          __int16 v102 = 2112;
                          v103 = v80;
                          __int16 v104 = 2112;
                          *(void *)unsigned int v105 = v31;
                          *(_WORD *)&v105[8] = 1024;
                          *(_DWORD *)&v105[10] = v32;
                          __int16 v106 = 2112;
                          long long v107 = v26;
                          _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Tried to load a tinker disabled account -- dropping! { uniqueID: %@, service: %@, serviceType: %@, accountType: %d, accountInfo: %@ }", buf, 0x30u);
                        }

                        goto LABEL_35;
                      }
                    }
                    if ((v73 & 1) == 0) {
                      [v28 loadAliasUserIntentMetadataIfNeeded];
                    }
                    if (v32 == 1) {
                      [v72 addObject:v25];
                    }
                    [v12 _addAccountDuringInitialSetup:v28];
                    uint64_t v13 = (id *)IMRGLog_ptr;
                    if ([v74 containsObject:v25]) {
                      [v71 setObject:v28 forKeyedSubscript:v25];
                    }
LABEL_36:

                    id v22 = v79;
LABEL_37:

                    goto LABEL_38;
                  }
                  __int16 v37 = +[IMRGLog warning];
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int buf = 138413058;
                    v101 = v25;
                    __int16 v102 = 2112;
                    v103 = v31;
                    __int16 v104 = 1024;
                    *(_DWORD *)unsigned int v105 = 0;
                    *(_WORD *)&v105[4] = 2112;
                    *(void *)&v105[6] = v26;
                    _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Tried to load a phone number account for a service that does not support phone number accounts -- dropping! { uniqueID: %@, serviceType: %@, accountType: %d, accountInfo: %@ }", buf, 0x26u);
                  }
                }
                else
                {
                  if (!v32)
                  {
                    long long v34 = [v28 aliases];
                    os_log_t logb = (os_log_t)[v34 count];

                    if (logb)
                    {
                      long long v35 = [v28 aliases];
                      [v70 addObject:v35];
                    }
                  }
                  long long v36 = +[IMRGLog warning];
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int buf = 138413058;
                    v101 = v25;
                    __int16 v102 = 2112;
                    v103 = v31;
                    __int16 v104 = 1024;
                    *(_DWORD *)unsigned int v105 = v32;
                    *(_WORD *)&v105[4] = 2112;
                    *(void *)&v105[6] = v26;
                    _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Tried to load account on a device that does not support this service/account type -- dropping! { uniqueID: %@, serviceType: %@, accountType: %d, accountInfo: %@ }", buf, 0x26u);
                  }

                  BOOL v12 = p_isa;
                }
LABEL_35:
                uint64_t v13 = (id *)IMRGLog_ptr;
                goto LABEL_36;
              }
LABEL_38:

              id v24 = (char *)v24 + 1;
            }
            while (v21 != v24);
            id v38 = [v81 countByEnumeratingWithState:&v90 objects:v108 count:16];
            id v21 = v38;
            if (!v38)
            {
LABEL_50:

              if (([v80 shouldAutoRegisterAllHandles] & 1) == 0) {
                [v12 _attachOrphanedPhoneAliases:v70 toRecipientAccounts:v72 withAccountsToEnable:v71];
              }

              id v16 = v68;
              i = v69;
              uint64_t v18 = v67;
              long long v19 = v79;
              break;
            }
          }
        }
      }
      id v66 = [obj countByEnumeratingWithState:&v94 objects:v109 count:16];
    }
    while (v66);
  }

  long long v39 = [*v13 registration];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    long long v40 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [p_isa[1] count]);
    *(_DWORD *)int buf = 138412290;
    v101 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Loaded accounts { count: %@ }", buf, 0xCu);
  }
  long long v41 = +[IMRGLog registration];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_100713A78();
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v42 = v71;
  id v43 = [v42 countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v87;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v87 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v86 + 1) + 8 * (void)j);
        [p_isa _enableAccountWithUniqueID:v47];
      }
      id v44 = [v42 countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v44);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v49 = [v42 allValues];
  id v50 = [v49 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v83;
    do
    {
      for (k = 0; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v83 != v52) {
          objc_enumerationMutation(v49);
        }
        long long v54 = *(void **)(*((void *)&v82 + 1) + 8 * (void)k);
        [v54 _cleanupAccount];
      }
      id v51 = [v49 countByEnumeratingWithState:&v82 objects:v98 count:16];
    }
    while (v51);
  }

  if ((v73 & 1) == 0)
  {
    long long v56 = [p_isa userDefaults];
    [v56 setAppBool:1 forKey:@"performed-user-intent-migrate"];

    __int16 v57 = +[IMRGLog registration];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Performed one time user intent migration on upgrade", buf, 2u);
    }
  }
  BOOL v58 = [p_isa[1] count] != 0;

  return v58;
}

- (void)_loadAndEnableStoredLegacyAccounts
{
  v2 = self;
  unsigned __int8 v3 = [(IDSDServiceController *)self->_serviceController allServices];
  id v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
    *(_DWORD *)int buf = 138412290;
    __int16 v102 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loaded services { count: %@ }", buf, 0xCu);
  }
  v74 = +[NSMutableSet set];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v95;
    uint64_t v64 = kIDSServiceDefaultsAccounts;
    uint64_t v63 = kIDSServiceDefaultsEnabledAccounts;
    v76 = v2;
    uint64_t v66 = *(void *)v95;
    id v67 = v6;
    do
    {
      uint64_t v10 = 0;
      id v71 = v8;
      do
      {
        if (*(void *)v95 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(NSObject **)(*((void *)&v94 + 1) + 8 * (void)v10);
        BOOL v12 = [v11 preferencesDomain];
        id v13 = [v12 length];

        if (v13)
        {
          if (![v11 hadStandalonePreferences]) {
            goto LABEL_59;
          }
          unsigned __int8 v14 = [v11 legacyPreferencesDomain];
          id v15 = objc_alloc((Class)NSMutableArray);
          id v16 = v11;
          id v17 = [v11 preferencesDomain];
          id v18 = objc_msgSend(v15, "initWithObjects:", v17, 0);

          if (v14) {
            [v18 addObject:v14];
          }
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id obj = v18;
          id v19 = [obj countByEnumeratingWithState:&v90 objects:v107 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v91;
LABEL_14:
            uint64_t v22 = 0;
            while (1)
            {
              if (*(void *)v91 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(NSObject **)(*((void *)&v90 + 1) + 8 * v22);
              id v24 = [(IDSDAccountController *)v2 userDefaults];
              id v25 = [v24 copyKeyListForAppID:v23];

              if (v25) {
                break;
              }
              if (v20 == (id)++v22)
              {
                id v20 = [obj countByEnumeratingWithState:&v90 objects:v107 count:16];
                uint64_t v9 = v66;
                id v6 = v67;
                id v8 = v71;
                if (!v20) {
                  goto LABEL_57;
                }
                goto LABEL_14;
              }
            }
            id v69 = v14;
            id v70 = v10;
            uint64_t v26 = [(IDSDAccountController *)v2 userDefaults];
            id v72 = v25;
            id v27 = [v26 copyMultipleForCurrentKeys:v25 appID:v23];

            long long v28 = [v27 objectForKeyedSubscript:v64];
            id v68 = v27;
            BOOL v75 = [v27 objectForKeyedSubscript:v63];
            long long v29 = +[IMRGLog registration];
            long long v30 = v28;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              long long v54 = [v28 allKeys];
              *(_DWORD *)int buf = 138412802;
              __int16 v102 = v23;
              __int16 v103 = 2112;
              uint64_t v104 = (uint64_t)v54;
              __int16 v105 = 2112;
              __int16 v106 = v75;
              _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Defaults dictionary loaded { domain: %@, accounts: %@, enabledAccounts: %@ }", buf, 0x20u);

              long long v28 = v30;
            }
            unsigned __int8 v65 = v23;

            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v77 = [v28 allKeys];
            id v31 = [v77 countByEnumeratingWithState:&v86 objects:v100 count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v87;
              do
              {
                long long v34 = 0;
                do
                {
                  if (*(void *)v87 != v33) {
                    objc_enumerationMutation(v77);
                  }
                  long long v35 = *(NSObject **)(*((void *)&v86 + 1) + 8 * (void)v34);
                  long long v36 = [v28 objectForKeyedSubscript:v35];
                  __int16 v37 = [(IDSDAccountController *)v2 accountWithUniqueID:v35];
                  id v38 = [[IDSDAccount alloc] initWithDictionary:v36 service:v16 uniqueID:v35];
                  long long v39 = v38;
                  if (v36)
                  {
                    if (v37)
                    {
                      long long v40 = +[IMRGLog warning];
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                      {
                        uint64_t v41 = [v37 accountSetupInfo];
                        *(_DWORD *)int buf = 138412802;
                        __int16 v102 = v35;
                        __int16 v103 = 2112;
                        uint64_t v104 = v41;
                        id v42 = (void *)v41;
                        __int16 v105 = 2112;
                        __int16 v106 = v36;
                        _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "We already have an existing account with for this uniqueID -- not loading { uniqueID: %@, existingAccountInfo: %@, newAccountInfo: %@ }", buf, 0x20u);
                      }
LABEL_34:

                      v2 = v76;
                      goto LABEL_35;
                    }
                    if (!v38)
                    {
                      long long v40 = +[IMRGLog warning];
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)int buf = 138412802;
                        __int16 v102 = v35;
                        __int16 v103 = 2112;
                        uint64_t v104 = (uint64_t)v16;
                        __int16 v105 = 2112;
                        __int16 v106 = v36;
                        _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "Failed to create account { service: %@, uniqueID: %@, dicitonary: %@ }", buf, 0x20u);
                      }
                      goto LABEL_34;
                    }
                    [(IDSDAccountController *)v2 _addAccountDuringInitialSetup:v38];
                    if ([v75 containsObject:v35]) {
                      [v74 addObject:v35];
                    }
                  }
LABEL_35:

                  long long v34 = (char *)v34 + 1;
                  long long v28 = v30;
                }
                while (v32 != v34);
                id v43 = [v77 countByEnumeratingWithState:&v86 objects:v100 count:16];
                id v32 = v43;
              }
              while (v43);
            }

            unsigned __int8 v14 = v69;
            uint64_t v10 = v70;
            id v44 = v72;
            if (v69
              && [v65 isEqualToString:v69]
              && [v72 count])
            {
              uint64_t v45 = +[IMRGLog registration];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)int buf = 138412290;
                __int16 v102 = v69;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Clearing legacy domain { domain: %@ }", buf, 0xCu);
              }

              long long v84 = 0u;
              long long v85 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              id v46 = v72;
              id v47 = [v46 countByEnumeratingWithState:&v82 objects:v99 count:16];
              if (v47)
              {
                id v48 = v47;
                uint64_t v49 = *(void *)v83;
                do
                {
                  for (i = 0; i != v48; i = (char *)i + 1)
                  {
                    if (*(void *)v83 != v49) {
                      objc_enumerationMutation(v46);
                    }
                    uint64_t v51 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                    uint64_t v52 = [(IDSDAccountController *)v2 userDefaults];
                    [v52 setValue:0 forKey:v51 appID:v69];
                  }
                  id v48 = [v46 countByEnumeratingWithState:&v82 objects:v99 count:16];
                }
                while (v48);
              }

              long long v53 = [(IDSDAccountController *)v2 userDefaults];
              [v53 synchronizeAppID:v69];

              id v44 = v72;
              long long v28 = v30;
            }

            uint64_t v9 = v66;
            id v6 = v67;
            id v8 = v71;
          }
LABEL_57:
        }
        else
        {
          unsigned __int8 v14 = +[IMRGLog registration];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            __int16 v102 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Bad preference domain { service: %@ }", buf, 0xCu);
          }
        }

LABEL_59:
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [v6 countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v8);
  }

  long long v55 = +[IMRGLog registration];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    long long v56 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)v2->_accountIDMap count]];
    *(_DWORD *)int buf = 138412290;
    __int16 v102 = v56;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Loaded legacy accounts { count: %@ }", buf, 0xCu);
  }
  __int16 v57 = +[IMRGLog registration];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int buf = 138412290;
    __int16 v102 = v74;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Enabling legacy accounts { accounts: %@ }", buf, 0xCu);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  BOOL v58 = v74;
  id v59 = [v58 countByEnumeratingWithState:&v78 objects:v98 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v79;
    do
    {
      for (j = 0; j != v60; j = (char *)j + 1)
      {
        if (*(void *)v79 != v61) {
          objc_enumerationMutation(v58);
        }
        [(IDSDAccountController *)v2 _enableAccountWithUniqueID:*(void *)(*((void *)&v78 + 1) + 8 * (void)j)];
      }
      id v60 = [v58 countByEnumeratingWithState:&v78 objects:v98 count:16];
    }
    while (v60);
  }
}

- (BOOL)isLoading
{
  return !self->_accountsLoaded || self->_isLoading;
}

- (BOOL)accountsLoaded
{
  return self->_accountsLoaded;
}

- (void)delayedSaveSettings
{
  [(CUTDeferredTaskQueue *)self->_storeAccountTask cancelPendingExecutions];
  [(CUTDeferredTaskQueue *)self->_storeAccountTask enqueueExecutionWithTarget:self afterDelay:5.0];
}

- (void)_storeAccounts
{
  if ([(IDSDAccountController *)self isLoading])
  {
    unsigned __int8 v3 = +[IMRGLog registration];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waiting on accounts to load, the account controller isn't ready yet", buf, 2u);
    }
  }
  else
  {
    unsigned __int8 v3 = objc_alloc_init((Class)NSMutableDictionary);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = [(IDSDServiceController *)self->_serviceController allServices];
    id v29 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v29)
    {
      uint64_t v26 = kIDSServiceDefaultsAccounts;
      uint64_t v27 = *(void *)v41;
      uint64_t v25 = kIDSServiceDefaultsEnabledAccounts;
      long long v28 = v3;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v4;
          id v5 = *(void **)(*((void *)&v40 + 1) + 8 * v4);
          long long v34 = +[NSMutableDictionary dictionary];
          long long v35 = +[NSMutableArray array];
          long long v30 = +[NSMutableDictionary dictionary];
          id v31 = v5;
          id v6 = [(IDSDAccountController *)self accountsOnService:v5];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v7 = v6;
          id v8 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v37;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v37 != v10) {
                  objc_enumerationMutation(v7);
                }
                BOOL v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                unsigned __int8 v14 = [v12 accountInfo];
                if (v14)
                {
                  id v15 = [v12 uniqueID];

                  if (v15)
                  {
                    id v16 = [v12 uniqueID];
                    [v34 setObject:v14 forKeyedSubscript:v16];
                  }
                }
                id v17 = [v12 uniqueID];
                unsigned int v18 = [(IDSDAccountController *)self isEnabledAccount:v17];

                if (v18)
                {
                  id v19 = [v12 uniqueID];
                  [v35 addObject:v19];
                }
              }
              id v9 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v9);
          }

          [v30 setObject:v34 forKeyedSubscript:v26];
          [v30 setObject:v35 forKeyedSubscript:v25];
          id v20 = [v34 count];
          uint64_t v21 = [v31 preferencesDomain];
          if (v20) {
            uint64_t v22 = v30;
          }
          else {
            uint64_t v22 = 0;
          }
          unsigned __int8 v3 = v28;
          [v28 setObject:v22 forKeyedSubscript:v21];

          uint64_t v4 = v33 + 1;
        }
        while ((id)(v33 + 1) != v29);
        id v29 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v29);
    }

    [(IDSDAccountController *)self _persistAccounts:v3];
  }
}

- (id)enabledAccountsOnService:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_accountIDMap;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = -[NSMutableDictionary objectForKey:](self->_accountIDMap, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        id v13 = [v12 service];
        if (v13 == v4)
        {
          unsigned int v14 = [v12 isEnabled];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        else
        {
        }
      }
      id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)registeredAccountsOnService:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v4 adHocServiceType] != 5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = -[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v12 isRegistered]) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }

  return v6;
}

- (id)accountsOfAdHocType:(unsigned int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_accountIDMap;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_accountIDMap objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        BOOL v12 = [v11 service];
        unsigned int v13 = [v12 adHocServiceType];

        if (v13 == a3)
        {
          long long v14 = [v11 uniqueID];
          [v5 addObject:v14];
        }
      }
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)hasActiveSMSAccount
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSDAccountController *)self accounts];
  unsigned __int8 v3 = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = ((char *)i + 1))
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (![v6 accountType]
          && [v6 isEnabled]
          && [v6 registrationStatus] == 5
          && ([v6 isAdHocAccount] & 1) == 0)
        {
          unsigned __int8 v3 = +[IMRGLog registration];
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            unsigned int v13 = v6;
            _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "  ** Found active SMS based account: %@", buf, 0xCu);
          }

          LOBYTE(v3) = 1;
          goto LABEL_16;
        }
      }
      unsigned __int8 v3 = [v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return (char)v3;
}

- (void)issueDependentIDQueriesWithCompletionBlock:(id)a3
{
  id v23 = a3;
  im_assert_primary_base_queue();
  uint64_t v4 = [(IDSDAccountController *)self accounts];
  id v5 = [v4 _copyForEnumerating];

  group = dispatch_group_create();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 1;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    uint64_t v24 = kIDSServiceDefaultsSentinelAlias;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (([v9 isAdHocAccount] & 1) == 0
          && [v9 isEnabled]
          && [v9 isRegistered]
          && ([v9 shouldRegisterUsingDSHandle] & 1) == 0)
        {
          long long v11 = [v9 prefixedURIStringsFromRegistration];
          BOOL v12 = [v11 firstObject];

          if ([v12 isEqualToIgnoringCase:v24])
          {

            BOOL v12 = 0;
          }
          unsigned int v13 = [v9 registration];
          long long v14 = [v13 registrationCert];

          long long v15 = [v9 service];
          long long v16 = [v15 identifier];

          if (v12 && v14 && v16)
          {
            dispatch_group_enter(group);
            long long v17 = +[IDSURI URIWithPrefixedURI:v12 withServiceLoggingHint:v16];
            long long v18 = +[IDSPeerIDManager sharedInstance];
            long long v43 = v17;
            long long v19 = +[NSArray arrayWithObjects:&v43 count:1];
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_10016319C;
            v31[3] = &unk_100983FA0;
            uint64_t v33 = v41;
            long long v34 = v39;
            id v32 = group;
            LOBYTE(v22) = 0;
            [v18 startQueryForURIs:v19 fromIdentity:v14 fromURI:v17 fromService:v16 forSending:0 forRefresh:0 isForced:v22 reason:@"GDRQuery" completionBlock:v31];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v6);
  }

  long long v20 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001631D4;
  block[3] = &unk_100983FC8;
  id v28 = v23;
  id v29 = v41;
  long long v30 = v39;
  id v21 = v23;
  dispatch_group_notify(group, v20, block);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)issueGetDependentRequest
{
  v2 = [(IDSDAccountController *)self accounts];
  id v3 = [v2 _copyForEnumerating];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v14) & 1) == 0)
        {
          long long v10 = [v9 registration];
          long long v11 = [v10 dependentRegistrationResponseCode];
          id v12 = [v11 integerValue];

          if ([v9 isEnabled])
          {
            if ([v9 isRegistered]) {
              BOOL v13 = v12 == 0;
            }
            else {
              BOOL v13 = 0;
            }
            if (v13) {
              [v9 _issueDependentCheck];
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_resumeGDRReAuthenticateIfNecessary
{
  v2 = [(IDSDAccountController *)self accounts];
  id v3 = [v2 _copyForEnumerating];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v10) & 1) == 0) {
          [v9 gdrReAuthenticateIfNecessary];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)updateExpiredDependent
{
  v2 = [(IDSDAccountController *)self accounts];
  id v3 = [v2 _copyForEnumerating];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v13) & 1) == 0
          && [v9 isEnabled]
          && [v9 isRegistered])
        {
          long long v10 = [v9 registration];
          long long v11 = [v10 dependentRegistrationsTTL];

          if (v11)
          {
            [v11 timeIntervalSinceNow];
            if (v12 < 1.0) {
              [v9 _issueDependentCheck];
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)issueGetDependentRequestForAccount:(id)a3
{
  id v3 = a3;
  if (([v3 isAdHocAccount] & 1) == 0
    && [v3 isEnabled]
    && [v3 isRegistered])
  {
    [v3 _issueDependentCheck];
  }
}

- (void)issueGetDependentAndGetHandlesRequest
{
  v2 = [(IDSDAccountController *)self accounts];
  id v3 = [v2 _copyForEnumerating];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v10) & 1) == 0
          && [v9 isEnabled]
          && [v9 isRegistered])
        {
          [v9 _issueDependentCheck];
          [v9 _updateHandles:1];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)hasiCloudAccount
{
  id v3 = +[IDSDServiceController sharedInstance];
  id v4 = [v3 iCloudService];
  id v5 = [(IDSDAccountController *)self appleIDAccountOnService:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)isiCloudSignedIn
{
  v2 = [(IDSSystemAccountAdapter *)self->_systemAccountAdapter iCloudSystemAccountWithError:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isiTunesSignedIn
{
  v2 = [(IDSSystemAccountAdapter *)self->_systemAccountAdapter iTunesSystemAccountWithError:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_registerForAllRegistrationsSucceeded
{
  BOOL v3 = [(IDSDAccountController *)self registrationListener];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100163940;
  v5[3] = &unk_100983FF0;
  v5[4] = self;
  id v4 = [v3 addBlockForRegistrationCompletion:v5];
}

- (void)_kickRemoteCacheWipe
{
  BOOL v3 = [(IDSDAccountController *)self userDefaults];
  id v4 = [v3 appValueForKey:@"triggeredRemoteSessionVersion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (uint64_t)[v4 integerValue];
    if (v5 >= 1)
    {
      id v6 = +[IMRGLog registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 134218498;
        uint64_t v33 = v5;
        __int16 v34 = 2048;
        uint64_t v35 = 1;
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)&off_1009D2C08;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not triggering remote session update, already updated {appIntegerValue: %llu, latestVersion: %llu, interestingServices: %@}", buf, 0x20u);
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v7 = +[IDSServerBag sharedInstanceForBagType:0];
  id v6 = [v7 objectForKey:@"ids-upgrade-triggered-reg-update-msg"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue] & 1) == 0)
  {
    long long v19 = +[IMRGLog registration];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138413058;
      uint64_t v33 = (uint64_t)v6;
      __int16 v34 = 2048;
      uint64_t v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = 1;
      __int16 v38 = 2112;
      long long v39 = &off_1009D2C20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not triggering remote session update, server bag disabled {bagDisabledValue: %@, appIntegerValue: %llu, latestVersion: %llu, interestingServices: %@}", buf, 0x2Au);
    }
  }
  else
  {
    long long v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 134218498;
      uint64_t v33 = v5;
      __int16 v34 = 2048;
      uint64_t v35 = 1;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)&off_1009D2C38;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Triggering remote session update {appIntegerValue: %llu, latestVersion: %llu, interestingServices: %@}", buf, 0x20u);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = [&off_1009D2C50 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(&off_1009D2C50);
          }
          long long v13 = [(IDSDServiceController *)self->_serviceController serviceWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * (void)v12)];
          if (v13)
          {
            long long v14 = [(IDSDAccountController *)self accountsOnService:v13];
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v23;
              do
              {
                long long v18 = 0;
                do
                {
                  if (*(void *)v23 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  [*(id *)(*((void *)&v22 + 1) + 8 * (void)v18) _updateSessionsForAllRegisteredURIs];
                  long long v18 = (char *)v18 + 1;
                }
                while (v16 != v18);
                id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v16);
            }
          }
          long long v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        id v10 = [&off_1009D2C50 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }
    long long v19 = [(IDSDAccountController *)self userDefaults];
    [v19 setAppValue:&off_1009D16F8 forKey:@"triggeredRemoteSessionVersion"];
    id v6 = v20;
    id v4 = v21;
  }

LABEL_28:
}

- (id)cloudPairedIDForDeviceID:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_deviceProperties objectForKey:a3];
  id v4 = [v3 objectForKey:@"nsuuid"];

  return v4;
}

- (id)deviceIDForPushToken:(id)a3
{
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v20 = self;
  id obj = self->_accountIDMap;
  id v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v23 = [(NSMutableDictionary *)v20->_accountIDMap objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v6 = [v23 dependentRegistrations];
        id v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v25;
          while (2)
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v25 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
              uint64_t v11 = [v10 _dataForKey:@"push-token"];
              unsigned int v12 = [v11 isEqualToData:v4];

              if (v12)
              {
                long long v14 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  id v15 = [v10 _dictionaryForKey:@"private-device-data"];
                  *(_DWORD *)int buf = 138412290;
                  uint64_t v33 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "       found push token in: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  long long v18 = [v10 _dictionaryForKey:@"private-device-data"];
                  _IDSLogV();
                }
                id v16 = objc_msgSend(v10, "_dictionaryForKey:", @"private-device-data", v18);
                long long v13 = [v16 _stringForKey:IDSPrivateDeviceDataUniqueID];

                goto LABEL_24;
              }
            }
            id v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
      id v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      long long v13 = 0;
    }
    while (v21);
  }
  else
  {
    long long v13 = 0;
  }
LABEL_24:

  return v13;
}

- (id)pushTokenForDeviceID:(id)a3
{
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = self->_accountIDMap;
  id v23 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v23)
  {
    uint64_t v6 = *(void *)v32;
    uint64_t v7 = IDSPrivateDeviceDataUniqueID;
    long long v25 = v5;
    uint64_t v21 = *(void *)v32;
    long long v22 = self;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v24 = v8;
        id v9 = -[NSMutableDictionary objectForKey:](self->_accountIDMap, "objectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * v8), v21, v22);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v26 = v9;
        id v10 = [v9 dependentRegistrations];
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              id v16 = [v15 _dictionaryForKey:@"private-device-data"];
              uint64_t v17 = [v16 _stringForKey:v7];
              unsigned __int8 v18 = [v17 isEqualToIgnoringCase:v4];

              if (v18)
              {
                uint64_t v19 = [v15 _dataForKey:@"push-token"];

                uint64_t v5 = v25;
                goto LABEL_19;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v24 + 1;
        uint64_t v5 = v25;
        uint64_t v6 = v21;
        self = v22;
      }
      while ((id)(v24 + 1) != v23);
      uint64_t v19 = 0;
      id v23 = [(NSMutableDictionary *)v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_19:

  return v19;
}

- (id)deviceNameForDeviceID:(id)a3
{
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = self->_accountIDMap;
  id v23 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v23)
  {
    uint64_t v6 = *(void *)v32;
    uint64_t v7 = IDSPrivateDeviceDataUniqueID;
    long long v25 = v5;
    uint64_t v21 = *(void *)v32;
    long long v22 = self;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v24 = v8;
        id v9 = -[NSMutableDictionary objectForKey:](self->_accountIDMap, "objectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * v8), v21, v22);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v26 = v9;
        id v10 = [v9 dependentRegistrations];
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              id v16 = [v15 _dictionaryForKey:@"private-device-data"];
              uint64_t v17 = [v16 _stringForKey:v7];
              unsigned __int8 v18 = [v17 isEqualToIgnoringCase:v4];

              if (v18)
              {
                uint64_t v19 = [v15 _stringForKey:IDSDevicePropertyName];

                uint64_t v5 = v25;
                goto LABEL_19;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v24 + 1;
        uint64_t v5 = v25;
        uint64_t v6 = v21;
        self = v22;
      }
      while ((id)(v24 + 1) != v23);
      uint64_t v19 = 0;
      id v23 = [(NSMutableDictionary *)v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_19:

  return v19;
}

- (id)publicKeyForDeviceID:(id)a3
{
  id v29 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = self->_accountIDMap;
  id v25 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v25)
  {
    uint64_t v5 = *(void *)v35;
    uint64_t v6 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v7 = IDSPrivateDeviceDataUniqueID;
    long long v27 = v4;
    uint64_t v23 = *(void *)v35;
    uint64_t v24 = self;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v26 = v8;
        id v9 = [(NSMutableDictionary *)self->_accountIDMap objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * v8)];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v28 = v9;
        id v10 = [v9 dependentRegistrations];
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v31;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v16 = [v15 _dictionaryForKey:v6];
              uint64_t v17 = [v16 _stringForKey:v7];
              unsigned __int8 v18 = [v17 isEqualToIgnoringCase:v29];

              if (v18)
              {
                uint64_t v21 = [v15 _dictionaryForKey:IDSDevicePropertyClientData];
                long long v20 = [v21 _dataForKey:_IDSIdentityClientDataMessageProtectionIdentityKey];

                p_super = &v27->super.super;
                goto LABEL_20;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v26 + 1;
        id v4 = v27;
        uint64_t v5 = v23;
        self = v24;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [(NSMutableDictionary *)v27 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v25);
  }

  p_super = +[IMRGLog registration];
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v29;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "No public key found {deviceID: %@}", buf, 0xCu);
  }
  long long v20 = 0;
LABEL_20:

  return v20;
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  uint64_t v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    int v12 = 138412546;
    CFStringRef v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received connected change to %@ for device with uniqueID %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = +[IDSDevicePropertiesStateNotifier sharedInstance];
  id v10 = v9;
  if (v5) {
    uint64_t v11 = kIDSDeviceStatePropertiesIsConnected;
  }
  else {
    uint64_t v11 = 0;
  }
  [v9 setState:v11 forProperty:kIDSDeviceStatePropertiesIsConnected deviceUniqueID:v6];
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isNearby:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  uint64_t v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    int v12 = 138412546;
    CFStringRef v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received nearby change to %@ for device with uniqueID %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = +[IDSDevicePropertiesStateNotifier sharedInstance];
  id v10 = v9;
  if (v5) {
    uint64_t v11 = kIDSDeviceStatePropertiesIsNearby;
  }
  else {
    uint64_t v11 = 0;
  }
  [v9 setState:v11 forProperty:kIDSDeviceStatePropertiesIsNearby deviceUniqueID:v6];
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isCloudConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  uint64_t v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v5) {
      CFStringRef v8 = @"YES";
    }
    int v12 = 138412546;
    CFStringRef v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received cloud connected change to %@ for device with uniqueID %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = +[IDSDevicePropertiesStateNotifier sharedInstance];
  id v10 = v9;
  if (v5) {
    uint64_t v11 = kIDSDeviceStatePropertiesIsCloudConnected;
  }
  else {
    uint64_t v11 = 0;
  }
  [v9 setState:v11 forProperty:kIDSDeviceStatePropertiesIsCloudConnected deviceUniqueID:v6];
}

- (void)setNSUUID:(id)a3 onDeviceWithUniqueID:(id)a4
{
  id v6 = (NSMutableDictionary *)a3;
  id v7 = a4;
  if ([v7 length])
  {
    deviceProperties = self->_deviceProperties;
    if (!deviceProperties)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      id v10 = self->_deviceProperties;
      self->_deviceProperties = Mutable;

      deviceProperties = self->_deviceProperties;
    }
    uint64_t v11 = [(NSMutableDictionary *)deviceProperties objectForKey:v7];
    int v12 = (__CFDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v11];
    CFStringRef v13 = v12;
    if (v6) {
      CFDictionarySetValue(v12, IDSDevicePropertyNSUUID, v6);
    }
    else {
      [(__CFDictionary *)v12 removeObjectForKey:IDSDevicePropertyNSUUID];
    }
    [(NSMutableDictionary *)self->_deviceProperties setObject:v13 forKey:v7];
    id v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_deviceProperties;
      *(_DWORD *)int buf = 138412290;
      __int16 v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "New properties after set %@", buf, 0xCu);
    }
    id v29 = v13;
    long long v31 = v11;

    [(IDSDAccountController *)self saveDevicePropertiesWithOldKeys:0];
    if (v6)
    {
      uint64_t v17 = +[IDSUTunDeliveryController sharedInstance];
      [v17 deviceWithUniqueID:v7 updatedUUID:v6];
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    unsigned __int8 v18 = +[IDSDServiceController sharedInstance];
    uint64_t v19 = [v18 allServices];

    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v25 = +[IDSDaemon sharedInstance];
          uint64_t v26 = [v24 pushTopic];
          long long v27 = [v25 broadcasterForTopic:v26 messageContext:0];

          [v27 device:v7 nsuuidChanged:v6];
        }
        id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v21);
    }

    long long v28 = +[IMRGLog registration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138412290;
      __int16 v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Finished broadcasting nsuuid %@ to all services", buf, 0xCu);
    }

    __int16 v14 = v31;
  }
  else
  {
    __int16 v14 = +[IMRGLog warning];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100713AE4();
    }
  }
}

- (id)propertiesForDeviceWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [(NSMutableDictionary *)self->_deviceProperties objectForKey:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateDeviceProperties
{
  BOOL v3 = +[IDSDServiceController sharedInstance];
  uint64_t v8 = [v3 serviceWithIdentifier:@"com.apple.private.alloy.icloudpairing"];

  id v4 = (void *)v8;
  if (v8)
  {
    BOOL v5 = -[IDSDAccountController accountsOnService:](self, "accountsOnService:");
    if (![v5 count])
    {
      id v6 = [(NSMutableDictionary *)self->_deviceProperties allKeys];
      deviceProperties = self->_deviceProperties;
      self->_deviceProperties = 0;

      [(IDSDAccountController *)self saveDevicePropertiesWithOldKeys:v6];
    }

    id v4 = (void *)v8;
  }
}

- (void)updateDevicePropertiesWithDevices:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    uint64_t v10 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v11 = IDSPrivateDeviceDataUniqueID;
    do
    {
      int v12 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v13 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v12) objectForKey:v10];
        __int16 v14 = [v13 _stringForKey:v11];
        if (v14) {
          [v5 addObject:v14];
        }

        int v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v8);
  }

  id v15 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:self->_deviceProperties];
  id v16 = objc_alloc((Class)NSMutableSet);
  uint64_t v17 = [(NSMutableDictionary *)self->_deviceProperties allKeys];
  id v18 = [v16 initWithArray:v17];

  uint64_t v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device Properties - Current UniqueIDs: %@", buf, 0xCu);
  }

  id v20 = +[IMRGLog registration];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device Properties - New Unique IDs: %@", buf, 0xCu);
  }

  [v18 minusSet:v5];
  id v21 = +[IMRGLog registration];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Device Properties - Old Unique IDs: %@", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v18;
  id v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", *(void *)(*((void *)&v29 + 1) + 8 * (void)v26), (void)v29);
        uint64_t v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v24);
  }

  deviceProperties = self->_deviceProperties;
  self->_deviceProperties = v15;

  long long v28 = [v22 allObjects];
  [(IDSDAccountController *)self saveDevicePropertiesWithOldKeys:v28];
}

- (void)saveDevicePropertiesWithOldKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(IDSDAccountController *)self userDefaults];
    [v5 setMultiple:0 remove:v4 appID:@"com.apple.ids.deviceproperties"];
  }
  if ([(NSMutableDictionary *)self->_deviceProperties count])
  {
    id v6 = [(IDSDAccountController *)self userDefaults];
    [v6 setMultiple:self->_deviceProperties remove:0 appID:@"com.apple.ids.deviceproperties"];
  }
  id v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    deviceProperties = self->_deviceProperties;
    *(_DWORD *)int buf = 138412546;
    long long v36 = deviceProperties;
    __int16 v37 = 2112;
    CFStringRef v38 = @"com.apple.ids.deviceproperties";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving device properties settings: %@   (domain: %@)", buf, 0x16u);
  }

  uint64_t v9 = [(IDSDAccountController *)self userDefaults];
  [v9 synchronizeAppID:@"com.apple.ids.deviceproperties"];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v10);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        int v12 = +[IDSDServiceController sharedInstance];
        CFStringRef v13 = [v12 allServices];

        id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v17);
              uint64_t v19 = +[IDSDaemon sharedInstance];
              id v20 = [v18 pushTopic];
              id v21 = [v19 broadcasterForTopic:v20 messageContext:0];

              [v21 device:v11 nsuuidChanged:0];
              uint64_t v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            id v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v15);
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v24);
      id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
}

- (void)loadDeviceProperties
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading device properties", buf, 2u);
  }

  id v4 = [(IDSDAccountController *)self userDefaults];
  id v5 = [v4 copyKeyListForAppID:@"com.apple.ids.deviceproperties"];

  deviceProperties = self->_deviceProperties;
  self->_deviceProperties = 0;

  id v7 = &off_100793000;
  if (v5)
  {
    [(IDSDAccountController *)self userDefaults];
    v9 = id v8 = self;
    id v10 = [v9 copyMultipleForCurrentKeys:v5 appID:@"com.apple.ids.deviceproperties"];

    if (v10)
    {
      long long v41 = v5;
      char v40 = v10;
      uint64_t v11 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v10];
      int v12 = v8->_deviceProperties;
      v8->_deviceProperties = v11;

      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      CFStringRef v13 = v8->_deviceProperties;
      id v14 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
      self = v8;
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v49;
        uint64_t v42 = IDSDevicePropertyNSUUID;
        id v18 = IMRGLog_ptr;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v49 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v20 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            id v21 = -[NSMutableDictionary objectForKey:](self->_deviceProperties, "objectForKey:", v20, context);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_13;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_13;
            }
            [v21 objectForKey:v42];
            long long v43 = v16;
            id v22 = v15;
            uint64_t v23 = v17;
            id v24 = v18;
            long long v25 = v13;
            long long v27 = v26 = self;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            self = v26;
            CFStringRef v13 = v25;
            id v18 = v24;
            uint64_t v17 = v23;
            id v15 = v22;
            uint64_t v16 = v43;
            if ((isKindOfClass & 1) == 0)
            {
LABEL_13:
              if (!v16) {
                uint64_t v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableArray);
              }
              [(NSMutableDictionary *)v16 addObject:v20];
            }
          }
          id v15 = [(NSMutableDictionary *)v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v15);
      }
      else
      {
        uint64_t v16 = 0;
      }

      id v7 = &off_100793000;
      if ([(NSMutableDictionary *)v16 count])
      {
        long long v29 = +[IMRGLog registration];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          long long v53 = v16;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, " => Loaded device properties -- found bad keys! {keysToDelete: %@}", buf, 0xCu);
        }

        [(NSMutableDictionary *)self->_deviceProperties removeObjectsForKeys:v16];
        long long v30 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100165DF4;
        block[3] = &unk_10097E440;
        void block[4] = self;
        id v47 = v16;
        dispatch_async(v30, block);
      }

      long long v31 = +[IMRGLog registration];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        long long v32 = self->_deviceProperties;
        *(_DWORD *)int buf = 138412290;
        long long v53 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " => Loaded device properties %@", buf, 0xCu);
      }

      id v5 = 0;
    }
    else
    {
      self = v8;
    }
  }
  else
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => No device properties loaded", buf, 2u);
    }
  }

  if (!self->_deviceProperties)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    long long v34 = self->_deviceProperties;
    self->_deviceProperties = Mutable;
  }
  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  long long v36 = self->_deviceProperties;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = *((void *)v7 + 477);
  v44[2] = sub_100165E00;
  v44[3] = &unk_100984018;
  id v37 = v35;
  id v45 = v37;
  [(NSMutableDictionary *)v36 enumerateKeysAndObjectsUsingBlock:v44];
  if ([v37 count])
  {
    CFStringRef v38 = +[IDSUTunDeliveryController sharedInstance];
    [v38 setDeviceUniqueIDToCBUUID:v37];
  }
}

- (BOOL)isiCloudHSA2
{
  BOOL v3 = [(IDSDServiceController *)self->_serviceController iCloudService];
  id v4 = [(IDSDAccountController *)self appleIDAccountOnService:v3];

  if (v4 && [v4 accountType] == 1)
  {
    id v5 = [v4 dsID];
    id v6 = [v4 loginID];
    id v7 = (void *)IMWeakLinkClass();
    if ([v7 isAccountsFrameworkAvailable])
    {
      id v8 = [v7 sharedInstance];
      if (v8)
      {
        uint64_t v9 = sub_100148D9C(v5);
        id v10 = [v8 authKitAccountWithDSID:v9];
        if (v10) {
          goto LABEL_11;
        }
        id v15 = 0;
        id v10 = [v8 authKitAccountWithAppleID:v6 error:&v15];
        id v11 = v15;
        if (v11)
        {
          int v12 = +[IMRGLog registration];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            id v17 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error fetching authkit account with AppleID. { error: %@ }", buf, 0xCu);
          }
        }
        if (v10)
        {
LABEL_11:
          id v13 = [v8 securityLevelForAccount:v10];
        }
        else
        {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13 == (id)4;
}

- (void)authKitAccountUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 registrationStatus];
  id v6 = [v4 serviceType];
  id v7 = [v4 profileID];

  BOOL v8 = (unint64_t)(v5 - 1) < 0xFFFFFFFFFFFFFFFELL;
  if (v7)
  {
    uint64_t v9 = sub_100148D9C(v7);
    if (v9)
    {
      if ([v6 isEqualToIgnoringCase:@"iMessage"]) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 0;
      }
      if ([v6 isEqualToIgnoringCase:@"FaceTime"]) {
        uint64_t v10 = 5;
      }
      if (v10)
      {
        authkitQueue = self->_authkitQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001661C8;
        block[3] = &unk_100984040;
        id v13 = v9;
        uint64_t v14 = v10;
        BOOL v15 = v8;
        dispatch_async(authkitQueue, block);
      }
    }
  }
}

- (id)deviceCertificateForService:(id)a3 uri:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IDSDAccountController *)self accountWithServiceName:v6 aliasURI:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 primaryRegistration];
    id v11 = [v10 registrationCert];

    if (v11) {
      goto LABEL_9;
    }
    int v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      id v13 = "Couldn't find device certificate (service: %@)  (uri: %@)";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    int v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      id v13 = "Couldn't find account (service %@)  (uri: %@)";
      goto LABEL_7;
    }
  }

  id v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)hasHardDeregistered
{
  return self->_hasHardDeregistered;
}

- (void)setHasHardDeregistered:(BOOL)a3
{
  self->_hasHardDeregistered = a3;
}

- (IDSDAccountControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (CUTDeferredTaskQueue)storeAccountTask
{
  return self->_storeAccountTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccountTask, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_systemAccountAdapter, 0);
  objc_storeStrong((id *)&self->_authkitQueue, 0);
  objc_storeStrong((id *)&self->_accountIDMapLock, 0);
  objc_storeStrong((id *)&self->_deviceProperties, 0);
  objc_storeStrong((id *)&self->_enabledAccounts, 0);

  objc_storeStrong((id *)&self->_accountIDMap, 0);
}

@end
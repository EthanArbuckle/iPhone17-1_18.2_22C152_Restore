@interface IDSAccountSync
+ (double)retryTimeForKey:(id)a3 attempts:(int64_t)a4;
+ (id)sharedInstance;
+ (id)usefulLoggingDescriptionAccountInfos:(id)a3;
- (IDSAccountSync)init;
- (IDSAccountSync)initWithPairingManager:(id)a3 serviceController:(id)a4 accountController:(id)a5 pushHandler:(id)a6 userDefaults:(id)a7 remoteCredential:(id)a8;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSPairingManager)pairingManager;
- (IDSPushHandler)pushHandler;
- (IDSRemoteCredential)syncCredential;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)currentInFlightSyncAttempts;
- (id)_constructAccountInfo:(id)a3;
- (id)_sendAccountSyncMessage:(id)a3 withPersistentKey:(id)a4;
- (id)constructRAResponseDictionary:(id)a3;
- (void)_addPhoneNumbersToAccount:(id)a3 withNonPreferredPhoneAccounts:(id)a4;
- (void)_noteShouldSynchronizeServices:(id)a3;
- (void)_noteShouldSynchronizeTinkerDeviceInfo;
- (void)_registerAccountsWithRemoteInfo:(id)a3;
- (void)_startRetryForKey:(id)a3 withAction:(id)a4;
- (void)_stopAllPendingActions;
- (void)_syncTinkerDeviceInfo;
- (void)_updatePreferredAccountWithAccountInfo:(id)a3 withAccountSyncCommand:(unsigned int)a4;
- (void)_updateTinkerDeviceWithURIs:(id)a3 pushToken:(id)a4;
- (void)incomingSyncMessage:(id)a3;
- (void)kickAnyUnfinishedSynchronization;
- (void)noteShouldFetchRemoteAccountInfoForAllServices;
- (void)noteShouldSynchronizeAllServices;
- (void)noteShouldSynchronizePreferredAccount;
- (void)noteShouldSynchronizeTinkerDeviceInfo;
- (void)resetAndResynchronizeEverything;
- (void)saveTracking;
- (void)setAccountController:(id)a3;
- (void)setCurrentInFlightSyncAttempts:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setSyncCredential:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)stopAnyUnfinishedSynchronization;
- (void)synchronizeAccountsWithRemoteInfo:(id)a3 service:(id)a4;
@end

@implementation IDSAccountSync

+ (id)sharedInstance
{
  if (qword_100A4A668 != -1) {
    dispatch_once(&qword_100A4A668, &stru_1009820C8);
  }
  v2 = (void *)qword_100A4A670;

  return v2;
}

- (IDSAccountSync)init
{
  id v3 = objc_alloc_init((Class)IDSRemoteCredential);
  [v3 setWantsRetries:1];
  v4 = +[IDSPairingManager sharedInstance];
  v5 = +[IDSDServiceController sharedInstance];
  v6 = +[IDSDAccountController sharedInstance];
  v7 = +[IDSPushHandler sharedInstance];
  v8 = +[IMUserDefaults sharedDefaults];
  v9 = [(IDSAccountSync *)self initWithPairingManager:v4 serviceController:v5 accountController:v6 pushHandler:v7 userDefaults:v8 remoteCredential:v3];

  return v9;
}

- (IDSAccountSync)initWithPairingManager:(id)a3 serviceController:(id)a4 accountController:(id)a5 pushHandler:(id)a6 userDefaults:(id)a7 remoteCredential:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)IDSAccountSync;
  v18 = [(IDSAccountSync *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pairingManager, a3);
    objc_storeStrong((id *)&v19->_serviceController, a4);
    objc_storeStrong((id *)&v19->_accountController, a5);
    objc_storeStrong((id *)&v19->_pushHandler, a6);
    objc_storeStrong((id *)&v19->_userDefaults, a7);
    objc_storeStrong((id *)&v19->_syncCredential, a8);
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentInFlightSyncAttempts = v19->_currentInFlightSyncAttempts;
    v19->_currentInFlightSyncAttempts = v20;
  }
  return v19;
}

- (void)saveTracking
{
  id v5 = [(IDSAccountSync *)self userDefaults];
  id v3 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
  v4 = [v3 allKeys];
  [v5 setAppValue:v4 forKey:@"AccountSyncSyncedServices"];
}

- (void)stopAnyUnfinishedSynchronization
{
}

- (void)kickAnyUnfinishedSynchronization
{
  id v3 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "beginning watch<>phone account synchronization", buf, 2u);
  }

  if (![(NSMutableDictionary *)self->_currentInFlightSyncAttempts count])
  {
    v4 = [(IDSAccountSync *)self userDefaults];
    id v5 = [v4 appValueForKey:@"AccountSyncSyncedServices"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 count])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000F533C;
      v12[3] = &unk_10097E990;
      v12[4] = self;
      v6 = objc_msgSend(v5, "__imArrayByApplyingBlock:", v12);
      v7 = +[IMRGLog accountSync];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded syncing services {serviceInstances : %@}", buf, 0xCu);
      }

      [(IDSAccountSync *)self _noteShouldSynchronizeServices:v6];
      if ([v5 containsObject:@"PreferredAccount"])
      {
        v8 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Should continue syncing preferred account", buf, 2u);
        }

        [(IDSAccountSync *)self noteShouldSynchronizePreferredAccount];
      }
      if ([v5 containsObject:@"FetchRemote"])
      {
        v9 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Should continue fetching remote account", buf, 2u);
        }

        [(IDSAccountSync *)self noteShouldFetchRemoteAccountInfoForAllServices];
      }
      if ([v5 containsObject:@"TinkerDeviceInfo"])
      {
        v10 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Should continue syncing tinker device info", buf, 2u);
        }

        [(IDSAccountSync *)self noteShouldSynchronizeTinkerDeviceInfo];
      }
    }
    else
    {
      v11 = +[IMRGLog accountSync];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No readable saved syncing services -- returning", buf, 2u);
      }
    }
  }
}

+ (double)retryTimeForKey:(id)a3 attempts:(int64_t)a4
{
  int64_t v5 = 60 * a4;
  if (60 * a4 >= 3600) {
    int64_t v5 = 3600;
  }
  double v6 = (double)v5;
  if ([a3 isEqualToString:@"TinkerDeviceInfo"])
  {
    int64_t v7 = 5 * a4 * a4;
    if ((double)v7 < v6) {
      return (double)v7;
    }
  }
  return v6;
}

- (void)_startRetryForKey:(id)a3 withAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
  v9 = [v8 objectForKeyedSubscript:v6];
  [v9 stop];

  v10 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
  [v10 setObject:0 forKeyedSubscript:v6];

  v11 = [IDSBlockRetryHandler alloc];
  v12 = im_primary_queue();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000F5608;
  v22[3] = &unk_1009820F0;
  id v23 = v6;
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1000F5620;
  v20 = &unk_100982118;
  id v21 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = [(IDSBlockRetryHandler *)v11 initWithQueue:v12 backoffProvider:v22 block:&v17];

  id v16 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
  [v16 setObject:v15 forKeyedSubscript:v14];

  [(IDSAccountSync *)self saveTracking];
  [(IDSBlockRetryHandler *)v15 start];
}

- (void)_stopAllPendingActions
{
  id v3 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
    int64_t v5 = [v4 allKeys];
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping all pending account sync actions { pending: %@ }", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        v12 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
        id v13 = [v12 objectForKeyedSubscript:v11];
        [v13 stop];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v14 = [(IDSAccountSync *)self currentInFlightSyncAttempts];
  [v14 removeAllObjects];

  [(IDSAccountSync *)self saveTracking];
}

- (id)_sendAccountSyncMessage:(id)a3 withPersistentKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringGUID];
  uint64_t v9 = +[NSString stringWithFormat:@"com.apple.identityservice.accountsync-%@", v7];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F5994;
  v17[3] = &unk_100982168;
  objc_copyWeak(&v23, &location);
  id v10 = v6;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v21 = self;
  id v13 = v7;
  id v22 = v13;
  [(IDSAccountSync *)self _startRetryForKey:v13 withAction:v17];
  id v14 = v22;
  id v15 = v11;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v15;
}

- (void)resetAndResynchronizeEverything
{
  v2 = +[IDSAccountSync sharedInstance];
  [v2 stopAnyUnfinishedSynchronization];

  id v3 = +[IDSAccountSync sharedInstance];
  [v3 noteShouldSynchronizeAllServices];

  v4 = +[IDSAccountSync sharedInstance];
  [v4 noteShouldSynchronizePreferredAccount];

  id v5 = +[IDSAccountSync sharedInstance];
  [v5 noteShouldSynchronizeTinkerDeviceInfo];
}

- (void)noteShouldSynchronizeTinkerDeviceInfo
{
}

- (void)noteShouldSynchronizeAllServices
{
  id v3 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Note should sync all services", v6, 2u);
  }

  v4 = [(IDSAccountSync *)self serviceController];
  id v5 = [v4 allServices];
  [(IDSAccountSync *)self _noteShouldSynchronizeServices:v5];
}

- (void)noteShouldSynchronizePreferredAccount
{
  id v3 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v4 = [v3 isPaired];

  if ((v4 & 1) == 0)
  {
    id v7 = +[IMRGLog accountSync];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    objc_super v26 = [(IDSAccountSync *)self pairingManager];
    v27 = [v26 pairedDeviceUniqueID];
    *(_DWORD *)buf = 138412290;
    v78 = v27;
    v28 = "Not syncing preferred account because device %@ is not paired";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

    goto LABEL_51;
  }
  id v5 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v6 = [v5 activePairedDeviceHasPairingType:0];

  id v7 = +[IMRGLog accountSync];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (!v8) {
      goto LABEL_51;
    }
    objc_super v26 = [(IDSAccountSync *)self pairingManager];
    v27 = [v26 pairedDeviceUniqueID];
    *(_DWORD *)buf = 138412290;
    v78 = v27;
    v28 = "Not syncing preferred account because device %@ is tinker paired";
    goto LABEL_21;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Note should sync preferred account, Syncing iMessage account now", buf, 2u);
  }

  uint64_t v9 = IMPreferredAccountMap();
  id v7 = [v9 objectForKey:@"iMessage"];

  id v10 = [(IDSAccountSync *)self accountController];
  id v11 = [v7 objectForKeyedSubscript:@"guid"];
  id v12 = [v10 accountWithUniqueID:v11];

  if ([v12 isEnabled]
    && [v12 accountType] != 2
    && ([v12 accountInfo], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    v59 = v7;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v14 = [v12 service];
    id v15 = [(IDSAccountSync *)self _constructAccountInfo:v14];

    id obj = v15;
    id v16 = [v15 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v68;
      uint64_t v19 = kIDSServiceDefaultsUniqueIDKey;
LABEL_10:
      id v20 = 0;
      while (1)
      {
        if (*(void *)v68 != v18) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v20);
        id v22 = [v21 objectForKeyedSubscript:v19];
        id v23 = v12;
        id v24 = [v12 uniqueID];
        unsigned __int8 v25 = [v22 isEqualToString:v24];

        if (v25) {
          break;
        }
        id v20 = (char *)v20 + 1;
        id v12 = v23;
        if (v17 == v20)
        {
          id v17 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (v17) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
      v29 = v21;

      id v12 = v23;
      if (v29) {
        goto LABEL_26;
      }
    }
    else
    {
LABEL_16:
    }
    v29 = [v12 accountInfo];
LABEL_26:
    v74[0] = IDSAccountSyncKeyCommand;
    v74[1] = IDSAccountSyncKeyAccountInfo;
    v75[0] = &off_1009D0FD8;
    v75[1] = v29;
    v30 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
    v31 = [(IDSAccountSync *)self _sendAccountSyncMessage:v30 withPersistentKey:@"PreferredAccount"];
    v32 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v12 uniqueID];
      *(_DWORD *)buf = 138412546;
      v78 = v31;
      __int16 v79 = 2112;
      v80 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Syncing preferred account for iMessage {guid: %@, uniqueID: %@}", buf, 0x16u);
    }
    id v7 = v59;
  }
  else
  {
    v29 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[IDSAccountSync noteShouldSynchronizePreferredAccount]";
      __int16 v79 = 2112;
      v80 = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: invalid iMessage account %@", buf, 0x16u);
    }
  }

  v34 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Note should sync preferred account, Syncing FaceTime account now", buf, 2u);
  }

  v35 = IMPreferredAccountMap();
  v36 = [v35 objectForKey:@"FaceTime"];

  v37 = [(IDSAccountSync *)self accountController];
  v38 = [v36 objectForKeyedSubscript:@"guid"];
  v39 = [v37 accountWithUniqueID:v38];

  if ([v39 isEnabled]
    && [v39 accountType] != 2
    && ([v39 accountInfo], v40 = objc_claimAutoreleasedReturnValue(), v40, v40))
  {
    v57 = v39;
    v58 = v36;
    id obja = v12;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v41 = [v39 service];
    v42 = [(IDSAccountSync *)self _constructAccountInfo:v41];

    id v60 = v42;
    id v43 = [v42 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v64;
      uint64_t v46 = kIDSServiceDefaultsUniqueIDKey;
LABEL_36:
      uint64_t v47 = 0;
      while (1)
      {
        if (*(void *)v64 != v45) {
          objc_enumerationMutation(v60);
        }
        v48 = *(void **)(*((void *)&v63 + 1) + 8 * v47);
        v49 = [v48 objectForKeyedSubscript:v46];
        v50 = [obja uniqueID];
        unsigned __int8 v51 = [v49 isEqualToString:v50];

        if (v51) {
          break;
        }
        if (v44 == (id)++v47)
        {
          id v44 = [v60 countByEnumeratingWithState:&v63 objects:v73 count:16];
          if (v44) {
            goto LABEL_36;
          }
          goto LABEL_42;
        }
      }
      v52 = v48;

      v39 = v57;
      if (v52) {
        goto LABEL_47;
      }
    }
    else
    {
LABEL_42:

      v39 = v57;
    }
    v52 = [v39 accountInfo];
LABEL_47:
    v71[0] = IDSAccountSyncKeyCommand;
    v71[1] = IDSAccountSyncKeyAccountInfo;
    v72[0] = &off_1009D0FF0;
    v72[1] = v52;
    v53 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
    v54 = [(IDSAccountSync *)self _sendAccountSyncMessage:v53 withPersistentKey:@"PreferredAccount"];
    v55 = +[IMRGLog accountSync];
    id v12 = obja;
    v36 = v58;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = [v39 uniqueID];
      *(_DWORD *)buf = 138412546;
      v78 = v54;
      __int16 v79 = 2112;
      v80 = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Syncing preferred account for FaceTime {guid: %@, uniqueID: %@}", buf, 0x16u);
    }
  }
  else
  {
    v52 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[IDSAccountSync noteShouldSynchronizePreferredAccount]";
      __int16 v79 = 2112;
      v80 = v12;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s: invalid FaceTime account %@", buf, 0x16u);
    }
  }

LABEL_51:
}

- (void)noteShouldFetchRemoteAccountInfoForAllServices
{
  id v3 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v4 = [v3 isPaired];

  if (v4)
  {
    id v5 = [(IDSAccountSync *)self pairingManager];
    unsigned __int8 v6 = [v5 activePairedDeviceHasPairingType:0];

    if (v6)
    {
      id v7 = objc_alloc_init((Class)NSMutableSet);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      BOOL v8 = [(IDSAccountSync *)self serviceController];
      uint64_t v9 = [v8 allServices];

      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if ([v13 shouldSyncAccounts])
            {
              id v14 = [v13 pushTopic];
              [v7 addObject:v14];
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      id v15 = +[IMRGLog accountSync];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching remote account info {servicesToSync: %@}", buf, 0xCu);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000F6994;
      v21[3] = &unk_100982190;
      objc_copyWeak(&v24, (id *)buf);
      id v16 = v7;
      id v22 = v16;
      id v23 = self;
      [(IDSAccountSync *)self _startRetryForKey:@"FetchRemote" withAction:v21];

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v16 = +[IMRGLog accountSync];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(IDSAccountSync *)self pairingManager];
        id v20 = [v19 pairedDeviceUniqueID];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not fetching remote account info because device %@ is tinker paired", buf, 0xCu);
      }
    }
  }
  else
  {
    id v16 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(IDSAccountSync *)self pairingManager];
      uint64_t v18 = [v17 pairedDeviceUniqueID];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not fetching remote account info because device %@ is not paired", buf, 0xCu);
    }
  }
}

- (void)_noteShouldSynchronizeTinkerDeviceInfo
{
  id v3 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v4 = [v3 isPaired];

  if ((v4 & 1) == 0)
  {
    id v7 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(IDSAccountSync *)self pairingManager];
      uint64_t v9 = [v8 pairedDeviceUniqueID];
      int v11 = 138412290;
      id v12 = v9;
      id v10 = "Not syncing tinker info because device %@ is not paired";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
LABEL_11:

    return;
  }
  id v5 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v6 = [v5 activePairedDeviceHasPairingType:1];

  if ((v6 & 1) == 0)
  {
    id v7 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(IDSAccountSync *)self pairingManager];
      uint64_t v9 = [v8 pairedDeviceUniqueID];
      int v11 = 138412290;
      id v12 = v9;
      id v10 = "Not syncing tinker info because device %@ is not tinker paired";
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  [(IDSAccountSync *)self _syncTinkerDeviceInfo];
}

- (void)_noteShouldSynchronizeServices:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v6 = [v5 isPaired];

  if ((v6 & 1) == 0)
  {
    id v23 = +[IMRGLog accountSync];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    id v24 = [(IDSAccountSync *)self pairingManager];
    long long v25 = [v24 pairedDeviceUniqueID];
    *(_DWORD *)buf = 138412290;
    v37 = v25;
    long long v26 = "Not syncing services because device %@ is not paired";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);

    goto LABEL_21;
  }
  id v7 = [(IDSAccountSync *)self pairingManager];
  unsigned __int8 v8 = [v7 activePairedDeviceHasPairingType:0];

  if ((v8 & 1) == 0)
  {
    id v23 = +[IMRGLog accountSync];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    id v24 = [(IDSAccountSync *)self pairingManager];
    long long v25 = [v24 pairedDeviceUniqueID];
    *(_DWORD *)buf = 138412290;
    v37 = v25;
    long long v26 = "Not syncing services because device %@ is tinker paired";
    goto LABEL_19;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    id v27 = v4;
    uint64_t v11 = *(void *)v33;
    uint64_t v31 = IDSAccountSyncKeyCommand;
    uint64_t v30 = IDSAccountSyncKeyService;
    uint64_t v29 = IDSAccountSyncKeyAccountInfo;
    id v12 = obj;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v12);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = [(IDSAccountSync *)self _constructAccountInfo:v14];
        if (v15)
        {
          v43[0] = &off_1009D1008;
          v42[0] = v31;
          v42[1] = v30;
          id v16 = [v14 identifier];
          v42[2] = v29;
          v43[1] = v16;
          v43[2] = v15;
          id v17 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

          uint64_t v18 = [v14 identifier];
          uint64_t v19 = [(IDSAccountSync *)self _sendAccountSyncMessage:v17 withPersistentKey:v18];

          id v20 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v14 identifier];
            id v22 = [(id)objc_opt_class() usefulLoggingDescriptionAccountInfos:v15];
            *(_DWORD *)buf = 138412802;
            v37 = v21;
            __int16 v38 = 2112;
            v39 = v19;
            __int16 v40 = 2112;
            v41 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Syncing account changes to paired device {serviceIdentifier : %@, guid: %@, accountInfo : %@}", buf, 0x20u);

            id v12 = obj;
          }
        }
      }
      id v10 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v10);
    id v23 = v12;
    id v4 = v27;
  }
  else
  {
    id v23 = obj;
  }
LABEL_21:
}

- (id)constructRAResponseDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Constructing RA response dictionary for services: %@", buf, 0xCu);
  }

  unsigned __int8 v6 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(const void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [(IDSAccountSync *)self serviceController];
        id v14 = [v13 serviceWithPushTopic:v12];

        id v15 = [(IDSAccountSync *)self _constructAccountInfo:v14];
        if (v15) {
          CFDictionarySetValue(v6, v12, v15);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_constructAccountInfo:(id)a3
{
  id v4 = a3;
  if (![v4 shouldSyncAccounts])
  {
    id v10 = 0;
    goto LABEL_59;
  }
  id v5 = [(IDSAccountSync *)self pairingManager];
  unsigned int v6 = [v5 pairedDeviceServiceMinCompatibilityVersion];
  id v7 = [v4 accountSyncMinCompatibilityVersion];

  if ((unint64_t)v7 <= v6)
  {
    uint64_t v11 = [v4 identifier];
    unsigned int v12 = [v11 isEqualToString:@"com.apple.madrid"];

    if (v12)
    {
      id v13 = IMPreferredAccountMap();
      id v14 = [v13 objectForKey:@"iMessage"];
      uint64_t v47 = [v14 objectForKey:@"guid"];
    }
    else
    {
      uint64_t v47 = 0;
    }
    id v15 = objc_alloc_init((Class)NSMutableArray);
    id v48 = objc_alloc_init((Class)NSMutableArray);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v45 = self;
    id v16 = [(IDSAccountSync *)self accountController];
    uint64_t v46 = v4;
    long long v17 = [v16 accountsOnService:v4];

    id v18 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v18)
    {
      id v19 = v18;
      id v44 = v15;
      long long v20 = 0;
      id v21 = 0;
      char v22 = 0;
      uint64_t v23 = *(void *)v50;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(v17);
          }
          long long v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ([v25 isEnabled]
            && [v25 isRegistered]
            && [v25 accountType] != 2)
          {
            if ([v25 accountType])
            {
              uint64_t v26 = [v25 accountInfo];

              long long v20 = (void *)v26;
            }
            else
            {
              if (v21
                || v47
                && ([v25 uniqueID],
                    id v27 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v28 = [v27 isEqualToString:v47],
                    v27,
                    !v28))
              {
                [v48 addObject:v25];
              }
              else
              {
                id v21 = [v25 accountInfo];
              }
              char v22 = 1;
            }
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v19);

      id v15 = v44;
      uint64_t v29 = v48;
      if (v21)
      {
LABEL_33:
        id v31 = [v21 mutableCopy];
        if (!v20) {
          [(IDSAccountSync *)v45 _addPhoneNumbersToAccount:v31 withNonPreferredPhoneAccounts:v29];
        }
        [v15 addObject:v31];

        char v32 = 0;
        if (!v20) {
          goto LABEL_47;
        }
        goto LABEL_39;
      }
    }
    else
    {

      char v22 = 0;
      long long v20 = 0;
      uint64_t v29 = v48;
    }
    if ([v29 count])
    {
      uint64_t v30 = [v29 firstObject];
      id v21 = [v30 accountInfo];

      [v29 removeFirstObject];
      if (v21) {
        goto LABEL_33;
      }
    }
    else
    {
      id v21 = 0;
    }
    char v32 = 1;
    if (!v20)
    {
LABEL_47:
      id v4 = v46;
      if ([v46 shouldNotSyncPhoneNumberAccounts]
        && (([v15 count] == (id)1) & v22) == 1)
      {
        __int16 v40 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v46;
          __int16 v55 = 2112;
          id v56 = v15;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Trying to sync only phone number account, but this is disallowed by the service. { service : %@, accountInfo : %@ }", buf, 0x16u);
        }

        [v15 removeAllObjects];
      }
      else if (v22)
      {
        ct_green_tea_logger_create_static();
        v41 = getCTGreenTeaOsLogHandle();
        v42 = v41;
        if (v41 && os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Transmitting phone number", buf, 2u);
        }
      }
      id v10 = v15;

      id v8 = v47;
      goto LABEL_58;
    }
LABEL_39:
    id v33 = [v20 mutableCopy];
    [(IDSAccountSync *)v45 _addPhoneNumbersToAccount:v33 withNonPreferredPhoneAccounts:v29];
    if ((v32 & 1) == 0)
    {
      uint64_t v34 = kIDSServiceDefaultsDisplayNameKey;
      long long v35 = [v20 objectForKeyedSubscript:kIDSServiceDefaultsDisplayNameKey];
      v36 = [v21 objectForKeyedSubscript:kIDSServiceDefaultsAliasesKey];
      v37 = objc_msgSend(v36, "__imArrayByApplyingBlock:", &stru_1009821B0);
      __int16 v38 = [v37 firstObject];

      if (![v35 length] && objc_msgSend(v38, "length"))
      {
        [v33 setObject:v38 forKey:v34];
        v39 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting callerID for Apple ID account to phone number {phoneNumber: %@}", buf, 0xCu);
        }
      }
      uint64_t v29 = v48;
    }
    [v15 addObject:v33];

    goto LABEL_47;
  }
  id v8 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 pushTopic];
    *(_DWORD *)buf = 138412290;
    v54 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping %@, paired device doesn't support syncing of that service", buf, 0xCu);
  }
  id v10 = 0;
LABEL_58:

LABEL_59:

  return v10;
}

- (void)_addPhoneNumbersToAccount:(id)a3 withNonPreferredPhoneAccounts:(id)a4
{
  id v5 = a3;
  unsigned int v6 = objc_msgSend(a4, "__imArrayByApplyingBlock:", &stru_1009821F0);
  if ([v6 count])
  {
    uint64_t v21 = kIDSServiceDefaultsAliasesKey;
    id v7 = objc_msgSend(v5, "objectForKey:");
    id v22 = [v7 mutableCopy];

    uint64_t v20 = kIDSServiceDefaultsVettedAliasesKey;
    id v8 = objc_msgSend(v5, "objectForKey:");
    id v9 = [v8 mutableCopy];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      uint64_t v14 = kIDSServiceDefaultsAliasKey;
      uint64_t v15 = kIDSServiceDefaultsAliasStatusKey;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          [v9 addObject:v17];
          v29[0] = v14;
          v29[1] = v15;
          v30[0] = v17;
          v30[1] = &off_1009D1020;
          id v18 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
          [v22 addObject:v18];
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v12);
    }

    [v5 setObject:v22 forKey:v21];
    [v5 setObject:v9 forKey:v20];
    id v19 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Adding additional phone numbers to sync {phoneNumbersToAdd: %@}", buf, 0xCu);
    }
  }
}

- (void)_syncTinkerDeviceInfo
{
  id v3 = [(IDSAccountSync *)self serviceController];
  id v4 = [v3 iCloudService];

  id v5 = [(IDSAccountSync *)self accountController];
  unsigned int v6 = [v5 appleIDAccountOnService:v4];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = objc_msgSend(v6, "prefixedURIStringsFromRegistration", 0);
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 _appearsToBeEmail]) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(IDSAccountSync *)self pushHandler];
  uint64_t v15 = [v14 pushToken];

  if ([v7 count] && v15)
  {
    v32[0] = &off_1009D1038;
    v31[0] = IDSAccountSyncKeyCommand;
    v31[1] = IDSAccountSyncKeyiCloudURIs;
    id v16 = [v7 allObjects];
    v31[2] = IDSAccountSyncKeyPushToken;
    v32[1] = v16;
    v32[2] = v15;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

    id v18 = [(IDSAccountSync *)self _sendAccountSyncMessage:v17 withPersistentKey:@"TinkerDeviceInfo"];
    id v19 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      long long v26 = v18;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Syncing tinker device info to paired device { guid : %@, uris : %@, pushToken : %@ }", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v17 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v7 count];
      *(_DWORD *)buf = 138412546;
      long long v26 = v15;
      __int16 v27 = 2048;
      id v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Don't have tinker device info to sync { token : %@, accounts_count : %ld }", buf, 0x16u);
    }
  }
}

- (void)incomingSyncMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyCommand];
  unsigned int v6 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[IDSLogFormatter descriptionForDictionary:v4 options:5];
    int v21 = 138412546;
    long long v22 = v5;
    __int16 v23 = 2112;
    long long v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Incoming account sync message {command: %@, message: %@}", (uint8_t *)&v21, 0x16u);
  }
  if (v5)
  {
    switch([v5 unsignedIntValue])
    {
      case 1u:
        id v8 = [(IDSAccountSync *)self pairingManager];
        unsigned int v9 = [v8 activePairedDeviceHasPairingType:0];

        if (v9)
        {
          id v10 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyAccountInfo];
          uint64_t v11 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyService];
          [(IDSAccountSync *)self synchronizeAccountsWithRemoteInfo:v10 service:v11];
          goto LABEL_13;
        }
        id v10 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          goto LABEL_26;
        }
        break;
      case 2u:
        id v12 = [(IDSAccountSync *)self pairingManager];
        unsigned int v13 = [v12 activePairedDeviceHasPairingType:0];

        if (v13)
        {
          id v10 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyAccountInfo];
          uint64_t v14 = self;
          uint64_t v15 = v10;
          uint64_t v16 = 2;
          goto LABEL_16;
        }
        id v10 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          goto LABEL_26;
        }
        break;
      case 3u:
        uint64_t v17 = [(IDSAccountSync *)self pairingManager];
        unsigned int v18 = [v17 activePairedDeviceHasPairingType:1];

        if (v18)
        {
          id v10 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyiCloudURIs];
          uint64_t v11 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyPushToken];
          [(IDSAccountSync *)self _updateTinkerDeviceWithURIs:v10 pushToken:v11];
LABEL_13:
        }
        else
        {
          id v10 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
            sub_1007103A8();
          }
        }
        break;
      case 4u:
        id v19 = [(IDSAccountSync *)self pairingManager];
        unsigned int v20 = [v19 activePairedDeviceHasPairingType:0];

        if (v20)
        {
          id v10 = [v4 objectForKeyedSubscript:IDSAccountSyncKeyAccountInfo];
          uint64_t v14 = self;
          uint64_t v15 = v10;
          uint64_t v16 = 4;
LABEL_16:
          [(IDSAccountSync *)v14 _updatePreferredAccountWithAccountInfo:v15 withAccountSyncCommand:v16];
        }
        else
        {
          id v10 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
LABEL_26:
          }
            sub_100710374();
        }
        break;
      default:
        id v10 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100710334();
        }
        break;
    }
  }
  else
  {
    id v10 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007102F4();
    }
  }
}

- (void)synchronizeAccountsWithRemoteInfo:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSAccountSync *)self accountController];
  v57 = self;
  unsigned int v9 = [(IDSAccountSync *)self serviceController];
  id v10 = [v9 serviceWithPushTopic:v7];
  uint64_t v11 = [v8 accountsOnService:v10];

  id v12 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = +[IDSAccountSync usefulLoggingDescriptionAccountInfos:v6];
    *(_DWORD *)buf = 138412546;
    id v76 = v7;
    __int16 v77 = 2112;
    v78 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Synchronizing accounts {service: %@, accountInfo: %@}", buf, 0x16u);
  }
  if ([v6 count])
  {
    id v54 = v6;
    id v56 = v7;
    objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_100982250);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v53 = v11;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v16)
    {
      id v17 = v16;
      char v18 = 0;
      uint64_t v19 = *(void *)v64;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v64 != v19) {
            objc_enumerationMutation(v15);
          }
          int v21 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          long long v22 = [v21 loginID];
          __int16 v23 = [v22 lowercaseString];
          unsigned __int8 v24 = [v14 containsObject:v23];

          if ((v24 & 1) == 0)
          {
            if ([v21 accountType] == 1
              && ([v21 service],
                  long long v25 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v26 = [v25 iCloudBasedService],
                  v25,
                  v26))
            {
              __int16 v27 = +[IMRGLog accountSync];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v76 = v21;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "This is an AppleID account on an iCloud based service, not removing account %@", buf, 0xCu);
              }
            }
            else
            {
              id v28 = +[IMRGLog accountSync];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v29 = [v21 smallDescription];
                *(_DWORD *)buf = 138412290;
                id v76 = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removing account %@", buf, 0xCu);
              }
              __int16 v27 = [(IDSAccountSync *)v57 accountController];
              [v27 removeAccount:v21];
              char v18 = 1;
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v17);
    }
    else
    {
      char v18 = 0;
    }

    id v6 = v54;
    [(IDSAccountSync *)v57 _registerAccountsWithRemoteInfo:v54];
    id v7 = v56;
    if (![v56 isEqualToIgnoringCase:@"com.apple.madrid"] || (v18 & 1) == 0) {
      goto LABEL_55;
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v42 = [(IDSAccountSync *)v57 serviceController];
    id v43 = [v42 allServices];

    id v44 = [v43 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v60;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(v43);
          }
          id v48 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
          if (([v48 useiMessageCallerID] & 1) == 0)
          {
            long long v49 = [v48 pushTopic];
            unsigned int v50 = [v49 isEqualToIgnoringCase:@"com.apple.madrid"];

            if (!v50) {
              continue;
            }
          }
          memset(v58, 0, sizeof(v58));
          long long v51 = [(IDSAccountSync *)v57 accountController];
          long long v52 = [v51 accountsOnService:v48 withType:1];

          if ([v52 countByEnumeratingWithState:v58 objects:v71 count:16]) {
            [**((id **)&v58[0] + 1) clearDisplayName];
          }
        }
        id v45 = [v43 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v45);
    }

LABEL_54:
    id v7 = v56;
LABEL_55:
    uint64_t v11 = v53;
    goto LABEL_56;
  }
  uint64_t v30 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No accounts, disabling all", buf, 2u);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v14 = v11;
  id v31 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v31)
  {
    id v32 = v31;
    v53 = v11;
    id v55 = v6;
    id v56 = v7;
    uint64_t v33 = *(void *)v68;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v68 != v33) {
          objc_enumerationMutation(v14);
        }
        long long v35 = *(void **)(*((void *)&v67 + 1) + 8 * (void)k);
        if ([v35 accountType] == 1
          && ([v35 service],
              v36 = objc_claimAutoreleasedReturnValue(),
              unsigned int v37 = [v36 iCloudBasedService],
              v36,
              v37))
        {
          __int16 v38 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v35;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "This is an AppleID account on an iCloud based service, not disabling account %@", buf, 0xCu);
          }
        }
        else
        {
          v39 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v40 = [v35 smallDescription];
            *(_DWORD *)buf = 138412290;
            id v76 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Disabling account %@", buf, 0xCu);
          }
          __int16 v38 = [(IDSAccountSync *)v57 accountController];
          v41 = [v35 uniqueID];
          [v38 disableAccountWithUniqueID:v41];
        }
      }
      id v32 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v32);
    id v6 = v55;
    goto LABEL_54;
  }
LABEL_56:
}

- (void)_registerAccountsWithRemoteInfo:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    v39 = +[IMRGLog accountSync];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "No accounts in account info, ignoring...", buf, 2u);
    }
    goto LABEL_71;
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = v4;
  id v103 = [obj countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (!v103)
  {
    v39 = 0;
    id v5 = 0;
    goto LABEL_69;
  }
  id v89 = v4;
  id v5 = 0;
  v94 = 0;
  uint64_t v101 = *(void *)v111;
  uint64_t v6 = kIDSServiceDefaultsAccountTypeKey;
  uint64_t v7 = kIDSServiceDefaultsRegistrationInfoKey;
  uint64_t v99 = kIDSServiceDefaultsRegistrationInfoStatusKey;
  uint64_t v92 = kIDSServiceDefaultsLoginAsKey;
  uint64_t v96 = kIDSServiceDefaultsHasEverRegistered;
  uint64_t v95 = kIDSServiceDefaultsUniqueIDKey;
  uint64_t v91 = kIDSServiceDefaultsAliasesKey;
  uint64_t v90 = kIDSServiceDefaultsServiceNameKey;
  v93 = self;
  do
  {
    for (i = 0; i != v103; i = (char *)i + 1)
    {
      if (*(void *)v111 != v101) {
        objc_enumerationMutation(obj);
      }
      unsigned int v9 = *(void **)(*((void *)&v110 + 1) + 8 * i);
      id v10 = [v9 objectForKeyedSubscript:v6];
      unsigned int v11 = [v10 intValue];

      id v12 = [v9 objectForKeyedSubscript:v7];
      unsigned int v13 = [v12 objectForKeyedSubscript:v99];
      unsigned int v14 = [v13 intValue];

      if (v14 == 5)
      {
        id v15 = [v9 mutableCopy];
        [v15 removeObjectForKey:v6];
        [v15 removeObjectForKey:v96];
        [v15 removeObjectForKey:v7];
        [v15 removeObjectForKey:v95];
        if (v11)
        {
          if (v11 != 1) {
            goto LABEL_32;
          }
          id v16 = v94;
          uint64_t v17 = (uint64_t)v5;
          v94 = v15;
        }
        else
        {
          uint64_t v19 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v20 = objc_opt_class();
            v122 = v15;
            int v21 = +[NSArray arrayWithObjects:&v122 count:1];
            long long v22 = [v20 usefulLoggingDescriptionAccountInfos:v21];
            *(_DWORD *)buf = 138412290;
            uint64_t v119 = (uint64_t)v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found valid phone number account %@", buf, 0xCu);
          }
          __int16 v23 = [v15 objectForKeyedSubscript:v91];
          unsigned __int8 v24 = objc_msgSend(v23, "__imArrayByApplyingBlock:", &stru_100982270);
          uint64_t v17 = [v24 firstObject];

          long long v25 = +[IMRGLog accountSync];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v119 = v17;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Retrieved phone number alias %@", buf, 0xCu);
          }

          id v16 = [v15 objectForKeyedSubscript:v90];
          unsigned int v26 = [(IDSAccountSync *)self serviceController];
          __int16 v27 = [v26 serviceWithIdentifier:v16];

          if (v27 && ![v27 shouldNotSyncPhoneNumberAccounts])
          {
            id v31 = [(IDSAccountSync *)self accountController];
            id v32 = [v31 existingAccountOnService:v27 withType:2 loginID:0];

            if (!v32)
            {
              uint64_t v33 = +[IMRGLog accountSync];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Didn't find a local account, setting one up", buf, 2u);
              }

              uint64_t v34 = [(IDSAccountSync *)self accountController];
              [v34 setupLocalAccountForService:v27];

              long long v35 = [(IDSAccountSync *)self accountController];
              id v32 = [v35 localAccountOnService:v27];
            }
            v36 = [(IDSAccountSync *)self accountController];
            unsigned int v37 = [v32 uniqueID];
            [v36 enablePrimaryAccountWithUniqueID:v37];

            __int16 v38 = +[IMRGLog accountSync];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v119 = (uint64_t)v32;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Updating local account {localAccount: %@}", buf, 0xCu);
            }

            [v32 _updateAccountWithAccountInfo:v15];
            self = v93;
          }
          else
          {
            id v28 = +[IMRGLog accountSync];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v29 = [v27 shouldNotSyncPhoneNumberAccounts];
              *(_DWORD *)buf = 138412546;
              CFStringRef v30 = @"NO";
              if (v29) {
                CFStringRef v30 = @"YES";
              }
              uint64_t v119 = (uint64_t)v16;
              __int16 v120 = 2112;
              CFStringRef v121 = v30;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Can't find eligible service, bailing { serviceName : %@, shouldNotSyncPhoneNumberAccounts: %@ }", buf, 0x16u);
            }
          }
        }

        id v5 = (void *)v17;
      }
      else
      {
        id v15 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          char v18 = [v9 objectForKey:v92];
          *(_DWORD *)buf = 138412290;
          uint64_t v119 = (uint64_t)v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Account info for %@ is not registered, ignoring...", buf, 0xCu);

          self = v93;
        }
      }
LABEL_32:
    }
    id v103 = [obj countByEnumeratingWithState:&v110 objects:v123 count:16];
  }
  while (v103);

  v39 = v94;
  if (v94)
  {
    uint64_t v40 = [v94 objectForKeyedSubscript:v90];
    v41 = [(IDSAccountSync *)self serviceController];
    id obj = (id)v40;
    v42 = [v41 serviceWithIdentifier:v40];

    LODWORD(v41) = [v42 iCloudBasedService];
    id v43 = +[IMRGLog accountSync];
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    id v4 = v89;
    if (v41)
    {
      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "This is an iCloud based service, ignoring Apple ID account", buf, 2u);
      }
    }
    else
    {
      v104 = v42;
      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Found valid apple ID account, cleaning up sentinel alias", buf, 2u);
      }

      id v45 = [v94 objectForKeyedSubscript:v91];
      uint64_t v46 = objc_msgSend(v45, "__imArrayByFilteringWithBlock:", &stru_1009822B0);
      id v43 = [v46 mutableCopy];

      uint64_t v47 = kIDSServiceDefaultsVettedAliasesKey;
      id v48 = [v94 objectForKeyedSubscript:kIDSServiceDefaultsVettedAliasesKey];
      long long v49 = objc_msgSend(v48, "__imArrayByFilteringWithBlock:", &stru_1009822D0);
      id v50 = [v49 mutableCopy];

      if (v5)
      {
        v116[0] = kIDSServiceDefaultsAliasKey;
        v116[1] = kIDSServiceDefaultsAliasStatusKey;
        v117[0] = v5;
        v117[1] = &off_1009D1020;
        long long v51 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:2];
        [v43 addObject:v51];

        [v50 addObject:v5];
      }
      [v94 setObject:v43 forKeyedSubscript:v91];
      [v94 setObject:v50 forKeyedSubscript:v47];
      long long v52 = +[IMRGLog accountSync];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = objc_opt_class();
        v115 = v94;
        id v54 = +[NSArray arrayWithObjects:&v115 count:1];
        id v55 = [v53 usefulLoggingDescriptionAccountInfos:v54];
        *(_DWORD *)buf = 138412290;
        uint64_t v119 = (uint64_t)v55;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Found valid Apple ID account, creating real account with remote info %@", buf, 0xCu);
      }
      id v56 = [v94 objectForKey:v92];
      v57 = [(IDSAccountSync *)v93 accountController];
      v58 = [v57 accountWithServiceName:obj loginID:v56];

      if (v58)
      {
        long long v59 = +[IMRGLog accountSync];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v119 = (uint64_t)obj;
          __int16 v120 = 2112;
          CFStringRef v121 = v56;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Found existing account for service %@ and loginID %@", buf, 0x16u);
        }

        [(IDSDAccount *)v58 _updateAccountWithAccountInfo:v94];
      }
      else
      {
        id v102 = v50;
        long long v60 = [IDSDAccount alloc];
        long long v61 = +[NSString stringGUID];
        long long v62 = v56;
        v58 = [(IDSDAccount *)v60 initWithLoginID:v56 service:v104 uniqueID:v61 accountType:1 accountConfig:v94];

        long long v63 = [(IDSAccountSync *)v93 accountController];
        [v63 addPrimaryAccount:v58];

        long long v64 = [(IDSAccountSync *)v93 accountController];
        long long v65 = [(IDSDAccount *)v58 uniqueID];
        [v64 enablePrimaryAccountWithUniqueID:v65];

        long long v66 = [(IDSDAccount *)v58 linkedAccounts];
        id v67 = [v66 count];

        if (v67)
        {
          id v50 = v102;
        }
        else
        {
          v100 = v43;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v68 = +[IDSDServiceController sharedInstance];
          v97 = v58;
          long long v69 = [(IDSDAccount *)v58 service];
          long long v70 = [v68 linkedServicesForService:v69];

          id v71 = [v70 countByEnumeratingWithState:&v106 objects:v114 count:16];
          p_cache = &OBJC_METACLASS___IDSIMLFanoutFactoryComponent.cache;
          if (v71)
          {
            id v73 = v71;
            uint64_t v74 = *(void *)v107;
            do
            {
              for (j = 0; j != v73; j = (char *)j + 1)
              {
                if (*(void *)v107 != v74) {
                  objc_enumerationMutation(v70);
                }
                uint64_t v76 = *(void *)(*((void *)&v106 + 1) + 8 * (void)j);
                __int16 v77 = p_cache;
                id v78 = objc_alloc((Class)(p_cache + 508));
                __int16 v79 = +[NSString stringGUID];
                id v80 = [v78 initWithLoginID:v62 service:v76 uniqueID:v79 accountType:1 accountConfig:v94];

                v81 = +[IMRGLog accountSync];
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v119 = (uint64_t)v80;
                  _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "  Creating a linked account: %@", buf, 0xCu);
                }

                v82 = [(IDSAccountSync *)v93 accountController];
                [v82 addPrimaryAccount:v80];

                v83 = [(IDSAccountSync *)v93 accountController];
                v84 = [v80 uniqueID];
                [v83 enablePrimaryAccountWithUniqueID:v84];

                p_cache = v77;
              }
              id v73 = [v70 countByEnumeratingWithState:&v106 objects:v114 count:16];
            }
            while (v73);
          }

          id v4 = v89;
          v39 = v94;
          id v43 = v100;
          id v50 = v102;
          v58 = v97;
        }
        id v56 = v62;
      }
      v85 = [(IDSAccountSync *)v93 accountController];
      v86 = [(IDSDAccount *)v58 uniqueID];
      [v85 enablePrimaryAccountWithUniqueID:v86];

      v87 = [(IDSDAccount *)v58 linkedAccounts];
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_1000F99D8;
      v105[3] = &unk_1009822F8;
      v105[4] = v93;
      objc_msgSend(v87, "__imForEach:", v105);

      if (![(IDSDAccount *)v58 isRegistered])
      {
        [(IDSDAccount *)v58 registerAccount];
        v88 = [(IDSDAccount *)v58 linkedAccounts];
        objc_msgSend(v88, "__imForEach:", &stru_100982338);
      }
      v42 = v104;
    }

LABEL_69:
  }
  else
  {
    id v4 = v89;
  }

LABEL_71:
}

- (void)_updatePreferredAccountWithAccountInfo:(id)a3 withAccountSyncCommand:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:kIDSServiceDefaultsDisplayNameKey];
  uint64_t v52 = kIDSServiceDefaultsAccountTypeKey;
  v53 = v6;
  id v8 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v54 = [v8 intValue];

  unsigned int v9 = (id *)IMRGLog_ptr;
  id v10 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v76 = v53;
    unsigned int v11 = +[NSArray arrayWithObjects:&v76 count:1];
    id v12 = +[IDSAccountSync usefulLoggingDescriptionAccountInfos:v11];
    *(_DWORD *)buf = 138412546;
    id v78 = v7;
    __int16 v79 = 2112;
    id v80 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Incoming preferred account update {incomingDisplayName: %@, incomingAccountInfo: %@}", buf, 0x16u);
  }
  if ([v7 length])
  {
    id v55 = self;
    if (a4 == 4)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v34 = [(IDSAccountSync *)self serviceController];
      unsigned int v14 = [v34 allServices];

      id v35 = [v14 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v61;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v61 != v37) {
              objc_enumerationMutation(v14);
            }
            v39 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if ([v39 useFaceTimeCallerID])
            {
              uint64_t v40 = [*v9 accountSync];
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v41 = [v39 serviceName];
                *(_DWORD *)buf = 138412290;
                id v78 = v41;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Service: %@ wants to use the FaceTime CallerID, attempting to update it", buf, 0xCu);
              }
              v42 = [(IDSAccountSync *)self accountController];
              id v43 = [v42 accountsOnService:v39 withType:1];

              if ([v43 count])
              {
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                id v44 = v43;
                id v45 = [v44 countByEnumeratingWithState:&v56 objects:v72 count:16];
                if (v45)
                {
                  id v46 = v45;
                  uint64_t v47 = *(void *)v57;
                  do
                  {
                    for (j = 0; j != v46; j = (char *)j + 1)
                    {
                      if (*(void *)v57 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) setDisplayName:v7];
                    }
                    id v46 = [v44 countByEnumeratingWithState:&v56 objects:v72 count:16];
                  }
                  while (v46);
                }

                self = v55;
                unsigned int v9 = (id *)IMRGLog_ptr;
              }
            }
          }
          id v36 = [v14 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }
        while (v36);
      }
LABEL_53:
    }
    else if (a4 == 2)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      unsigned int v13 = [(IDSAccountSync *)self serviceController];
      unsigned int v14 = [v13 allServices];

      id v15 = [v14 countByEnumeratingWithState:&v68 objects:v75 count:16];
      if (!v15) {
        goto LABEL_53;
      }
      id v16 = v15;
      uint64_t v17 = *(void *)v69;
      uint64_t v51 = kIDSServiceDefaultsHasEverRegistered;
      uint64_t v50 = kIDSServiceDefaultsRegistrationInfoKey;
      uint64_t v49 = kIDSServiceDefaultsUniqueIDKey;
      while (1)
      {
        char v18 = 0;
        do
        {
          if (*(void *)v69 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v18);
          if ((objc_msgSend(v19, "useiMessageCallerID", v49) & 1) != 0
            || ([v19 pushTopic],
                unsigned int v20 = objc_claimAutoreleasedReturnValue(),
                unsigned int v21 = [v20 isEqualToIgnoringCase:@"com.apple.madrid"],
                v20,
                v21))
          {
            long long v22 = [*v9 accountSync];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v23 = [v19 serviceName];
              *(_DWORD *)buf = 138412290;
              id v78 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Service: %@ also wants to use the iMessage CallerID, attempting to update it", buf, 0xCu);
            }
            unsigned __int8 v24 = [(IDSAccountSync *)self accountController];
            long long v25 = [v24 accountsOnService:v19 withType:1];

            if ([v25 count])
            {
              long long v66 = 0u;
              long long v67 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              id v26 = v25;
              id v27 = [v26 countByEnumeratingWithState:&v64 objects:v74 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v65;
                do
                {
                  for (k = 0; k != v28; k = (char *)k + 1)
                  {
                    if (*(void *)v65 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [*(id *)(*((void *)&v64 + 1) + 8 * (void)k) setDisplayName:v7];
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v64 objects:v74 count:16];
                }
                while (v28);
                self = v55;
                unsigned int v9 = (id *)IMRGLog_ptr;
              }
LABEL_24:
            }
            else if (!v54 && ([v19 shouldNotSyncPhoneNumberAccounts] & 1) == 0)
            {
              id v31 = [(IDSAccountSync *)self accountController];
              id v26 = [v31 localAccountOnService:v19];

              id v32 = [v53 mutableCopy];
              [v32 removeObjectForKey:v52];
              [v32 removeObjectForKey:v51];
              [v32 removeObjectForKey:v50];
              [v32 removeObjectForKey:v49];
              [v26 _updateAccountWithAccountInfo:v32];

              goto LABEL_24;
            }
          }
          char v18 = (char *)v18 + 1;
        }
        while (v18 != v16);
        id v33 = [v14 countByEnumeratingWithState:&v68 objects:v75 count:16];
        id v16 = v33;
        if (!v33) {
          goto LABEL_53;
        }
      }
    }
  }
}

- (void)_updateTinkerDeviceWithURIs:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming tinker device info { uris: %@, pushToken: %@ }", (uint8_t *)&v10, 0x16u);
  }

  unsigned int v9 = [(IDSAccountSync *)self pairingManager];
  [v9 updatePairedDeviceiCloudURIs:v6 pushToken:v7];
}

+ (id)usefulLoggingDescriptionAccountInfos:(id)a3
{
  v10[0] = kIDSServiceDefaultsAccountTypeKey;
  v10[1] = kIDSServiceDefaultsVettedAliasesKey;
  v10[2] = kIDSServiceDefaultsAliasesKey;
  v10[3] = kIDSServiceDefaultsLoginAsKey;
  v10[4] = kIDSServiceDefaultsRegistrationInfoKey;
  id v3 = a3;
  +[NSArray arrayWithObjects:v10 count:5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FA31C;
  v8[3] = &unk_100982388;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v9;
  id v5 = objc_msgSend(v3, "__imArrayByApplyingBlock:", v8);

  id v6 = +[IDSLogFormatter descriptionForArray:v5 options:0];

  return v6;
}

- (IDSRemoteCredential)syncCredential
{
  return self->_syncCredential;
}

- (void)setSyncCredential:(id)a3
{
}

- (NSMutableDictionary)currentInFlightSyncAttempts
{
  return self->_currentInFlightSyncAttempts;
}

- (void)setCurrentInFlightSyncAttempts:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);
  objc_storeStrong((id *)&self->_currentInFlightSyncAttempts, 0);

  objc_storeStrong((id *)&self->_syncCredential, 0);
}

@end
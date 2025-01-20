@interface GEODefaultsServer
+ (id)_acceptableKeys;
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (BOOL)_validatePeer:(id)a3 canSetKey:(id)a4 error:(id *)a5;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEODefaultsServer)initWithDaemon:(id)a3;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_configKeysChanged:(id)a3;
- (void)_experimentChanged:(id)a3;
- (void)_expiringKeysChanged:(id)a3;
- (void)_networkDefaultsChanged:(id)a3;
- (void)_notifyChangedKeys:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5 triggerWatchSync:(BOOL)a6;
- (void)_notifyListenersOfKeysChange:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5;
- (void)addChangeListenerForWithRequest:(id)a3;
- (void)clearExpiredKeyWithRequest:(id)a3;
- (void)dealloc;
- (void)getAllExpiringKeysWithRequest:(id)a3;
- (void)getAllValuesInStoreWithRequest:(id)a3;
- (void)getCompanionSyncValuesForKeysWithRequest:(id)a3;
- (void)getConfigValueForKeyWithRequest:(id)a3;
- (void)migrageEntitledKeyWithRequest:(id)a3;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)removeChangeListenerForWithRequest:(id)a3;
- (void)resetAllDefaultsWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setAllValuesInStoreWithRequest:(id)a3;
- (void)setConfigValueForKeyWithRequest:(id)a3;
- (void)setExpiringKeyWithRequest:(id)a3;
- (void)updateNetworkDefaultsWithMessage:(id)a3;
@end

@implementation GEODefaultsServer

- (void)peerDidConnect:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

- (void)updateNetworkDefaultsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = GEOGetUserDefaultsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Updating network defaults", buf, 2u);
  }

  v5 = [v3 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"reason"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = (uint64_t)[v6 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 4;
  }
  v8 = +[GEONetworkDefaults sharedNetworkDefaults];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A7F8;
  v10[3] = &unk_100071468;
  id v11 = v3;
  id v9 = v3;
  [v8 updateNetworkDefaultsWithReason:v7 completionHandler:v10];
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 <= 1944)
  {
    if (v13 > 1850)
    {
      switch(v13)
      {
        case 1851:
          uint64_t v34 = objc_opt_class();
          v35 = sub_100008DBC(@"defaults", v10, v11, v34, v12);
          v16 = v35;
          BOOL v14 = v35 != 0;
          if (v35)
          {
            [v35 setSignpostId:a6];
            [(GEODefaultsServer *)self getAllExpiringKeysWithRequest:v16];
            goto LABEL_44;
          }
          goto LABEL_45;
        case 1854:
          uint64_t v36 = objc_opt_class();
          v37 = sub_100008DBC(@"defaults", v10, v11, v36, v12);
          v16 = v37;
          BOOL v14 = v37 != 0;
          if (v37)
          {
            [v37 setSignpostId:a6];
            [(GEODefaultsServer *)self migrageEntitledKeyWithRequest:v16];
            goto LABEL_44;
          }
          goto LABEL_45;
        case 1933:
          uint64_t v20 = objc_opt_class();
          v21 = sub_100008DBC(@"defaults", v10, v11, v20, v12);
          v16 = v21;
          BOOL v14 = v21 != 0;
          if (v21)
          {
            [v21 setSignpostId:a6];
            [(GEODefaultsServer *)self getAllValuesInStoreWithRequest:v16];
            goto LABEL_44;
          }
          goto LABEL_45;
      }
    }
    else
    {
      switch(v13)
      {
        case 1467:
          uint64_t v26 = objc_opt_class();
          v27 = sub_100008DBC(@"defaults", v10, v11, v26, v12);
          v16 = v27;
          BOOL v14 = v27 != 0;
          if (v27)
          {
            [v27 setSignpostId:a6];
            [(GEODefaultsServer *)self setExpiringKeyWithRequest:v16];
            goto LABEL_44;
          }
          goto LABEL_45;
        case 1537:
          uint64_t v28 = objc_opt_class();
          v29 = sub_100008DBC(@"defaults", v10, v11, v28, v12);
          v16 = v29;
          BOOL v14 = v29 != 0;
          if (v29)
          {
            [v29 setSignpostId:a6];
            [(GEODefaultsServer *)self clearExpiredKeyWithRequest:v16];
            goto LABEL_44;
          }
          goto LABEL_45;
        case 1652:
          id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
          v16 = v17;
          BOOL v14 = v17 != 0;
          if (v17)
          {
            [v17 setSignpostId:a6];
            [(GEODefaultsServer *)self resetAllDefaultsWithMessage:v16];
            goto LABEL_44;
          }
LABEL_45:

          break;
      }
    }
  }
  else if (v13 <= 2030)
  {
    switch(v13)
    {
      case 1945:
        uint64_t v30 = objc_opt_class();
        v31 = sub_100008DBC(@"defaults", v10, v11, v30, v12);
        v16 = v31;
        BOOL v14 = v31 != 0;
        if (v31)
        {
          [v31 setSignpostId:a6];
          [(GEODefaultsServer *)self setAllValuesInStoreWithRequest:v16];
          goto LABEL_44;
        }
        goto LABEL_45;
      case 2012:
        uint64_t v32 = objc_opt_class();
        v33 = sub_100008DBC(@"defaults", v10, v11, v32, v12);
        v16 = v33;
        BOOL v14 = v33 != 0;
        if (v33)
        {
          [v33 setSignpostId:a6];
          [(GEODefaultsServer *)self addChangeListenerForWithRequest:v16];
          goto LABEL_44;
        }
        goto LABEL_45;
      case 2019:
        uint64_t v18 = objc_opt_class();
        v19 = sub_100008DBC(@"defaults", v10, v11, v18, v12);
        v16 = v19;
        BOOL v14 = v19 != 0;
        if (v19)
        {
          [v19 setSignpostId:a6];
          [(GEODefaultsServer *)self getConfigValueForKeyWithRequest:v16];
          goto LABEL_44;
        }
        goto LABEL_45;
    }
  }
  else if (v13 > 2368)
  {
    if (v13 == 2369)
    {
      uint64_t v38 = objc_opt_class();
      v39 = sub_100008DBC(@"defaults", v10, v11, v38, v12);
      v16 = v39;
      BOOL v14 = v39 != 0;
      if (v39)
      {
        [v39 setSignpostId:a6];
        [(GEODefaultsServer *)self removeChangeListenerForWithRequest:v16];
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    if (v13 == 2996)
    {
      uint64_t v22 = objc_opt_class();
      v23 = sub_100008DBC(@"defaults", v10, v11, v22, v12);
      v16 = v23;
      BOOL v14 = v23 != 0;
      if (v23)
      {
        [v23 setSignpostId:a6];
        [(GEODefaultsServer *)self getCompanionSyncValuesForKeysWithRequest:v16];
        goto LABEL_44;
      }
      goto LABEL_45;
    }
  }
  else
  {
    if (v13 == 2031)
    {
      uint64_t v24 = objc_opt_class();
      v25 = sub_100008DBC(@"defaults", v10, v11, v24, v12);
      v16 = v25;
      BOOL v14 = v25 != 0;
      if (v25)
      {
        [v25 setSignpostId:a6];
        [(GEODefaultsServer *)self setConfigValueForKeyWithRequest:v16];
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    if (v13 == 2213)
    {
      id v15 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v15;
      BOOL v14 = v15 != 0;
      if (v15)
      {
        [v15 setSignpostId:a6];
        [(GEODefaultsServer *)self updateNetworkDefaultsWithMessage:v16];
LABEL_44:
        BOOL v14 = 1;
        goto LABEL_45;
      }
      goto LABEL_45;
    }
  }

  return v14;
}

- (void)addChangeListenerForWithRequest:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

- (void)getAllValuesInStoreWithRequest:(id)a3
{
  id v3 = a3;
  id v7 = [objc_alloc((Class)GEOConfigGetAllValueInStoreReply) initWithRequest:v3];
  [v3 keyOptions];
  id v4 = _GEOGetAllValuesInStore();
  v5 = [v3 preferredAuditToken];

  v6 = GEOConfig_pruneEntitledKeysForAuditToken();
  [v7 setKeyStringsAndValues:v6];

  [v7 send];
}

- (void)getAllExpiringKeysWithRequest:(id)a3
{
  id v3 = a3;
  id v8 = [objc_alloc((Class)GEOConfigGetExpiringKeysReply) initWithRequest:v3];
  id v4 = _GEOConfigProxy();
  id v5 = [v3 keyOptions];

  v6 = [v4 configExpiryForOptions:v5];

  id v7 = [v6 getAllExpiringKeys];
  [v8 setExpiringKeys:v7];

  [v8 send];
}

+ (id)identifier
{
  return @"defaults";
}

+ (unint64_t)launchMode
{
  return 2;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077768;
}

+ (id)_acceptableKeys
{
  if (qword_100084890 != -1) {
    dispatch_once(&qword_100084890, &stru_1000727E8);
  }
  v2 = (void *)qword_100084888;

  return v2;
}

- (GEODefaultsServer)initWithDaemon:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)GEODefaultsServer;
  id v3 = [(GEODefaultsServer *)&v19 initWithDaemon:a3];
  if (v3)
  {
    uint64_t v4 = geo_isolater_create();
    peersIsolater = v3->_peersIsolater;
    v3->_peersIsolater = (geo_isolater *)v4;

    v6 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:517 valueOptions:0 capacity:10];
    peerHelpers = v3->_peerHelpers;
    v3->_peerHelpers = v6;

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"_networkDefaultsChanged:" name:GEONetworkDefaultsDidChangeInternalNotificationName object:0];

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"_experimentChanged:" name:@"GEOExperimentInfoChangedInternalNotification" object:0];

    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"_configKeysChanged:" name:_GEOConfigKeysChangedNotification object:0];

    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v3 selector:"_expiringKeysChanged:" name:_GEOConfigExpireChangedNotification object:0];

    int out_token = 0;
    id v12 = [(GEODefaultsServer *)v3 daemon];
    int v13 = [v12 serverQueue];
    notify_register_dispatch("com.apple.GeoServices.PreferencesSync.SettingsChanged", &out_token, v13, &stru_100072828);

    global_queue = (void *)geo_get_global_queue();
    uint64_t v15 = GEORegisterPListStateCaptureAtFrequency();
    stateCaptureHandle = v3->_stateCaptureHandle;
    v3->_stateCaptureHandle = (geo_state_capture_handle *)v15;
  }
  return v3;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEODefaultsServer;
  [(GEODefaultsServer *)&v4 dealloc];
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  if (sub_100022B80())
  {
    v2 = [sub_100022D94() sharedScheduler];
    CFStringRef v3 = (const __CFString *)GEOUpdateNetworkDefaultsTaskIdentifier;
    objc_super v4 = [v2 taskRequestForIdentifier:GEOUpdateNetworkDefaultsTaskIdentifier];
    if (v4)
    {
      id v5 = GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NetworkDefaults background task is already scheduled (%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      id v5 = [objc_alloc((Class)sub_10002300C()) initWithIdentifier:v3];
      [v5 setPriority:2];
      [v5 setRequiresExternalPower:0];
      [v5 setRequiresNetworkConnectivity:1];
      [v5 setNetworkDownloadSize:10240];
      [v5 setPreventsDeviceSleep:1];
      [v5 setPowerBudgeted:1];
      [v5 setInterval:21600.0];
      id v10 = 0;
      unsigned __int8 v6 = [v2 submitTaskRequest:v5 error:&v10];
      id v7 = (__CFString *)v10;
      if ((v6 & 1) == 0)
      {
        id v8 = GEOGetUserDefaultsLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v9 = @"Unknown";
          if (v7) {
            CFStringRef v9 = v7;
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v12 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to submit repeating task with error: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (BOOL)_validatePeer:(id)a3 canSetKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![v8 length])
  {
    unsigned __int8 v10 = 0;
    goto LABEL_9;
  }
  CFStringRef v9 = +[GEODefaultsServer _acceptableKeys];
  unsigned __int8 v10 = [v9 containsObject:v8];
  if (v10) {
    goto LABEL_8;
  }
  unsigned __int8 v11 = [v7 hasEntitlement:@"com.apple.geoservices.setanydefault"];

  if ((v11 & 1) == 0
    && (![v8 isEqualToString:GEOAddressCorrectionAuthorizationStatusKey]
     || ([v7 hasEntitlement:@"com.apple.CoreRoutine.preferences"] & 1) == 0))
  {
    CFStringRef v9 = +[NSString stringWithFormat:@"Cannot set value for invalid key: %@, missing entitlement?", v8];
    *a5 = +[NSError GEOErrorWithCode:-10 reason:v9];
LABEL_8:

    goto LABEL_9;
  }
  unsigned __int8 v10 = 1;
LABEL_9:

  return v10;
}

- (void)resetAllDefaultsWithMessage:(id)a3
{
  id v3 = a3;
  _GEOResetAllDefaults();
  [v3 sendReply:&__NSDictionary0__struct];
}

- (void)_networkDefaultsChanged:(id)a3
{
}

- (void)_experimentChanged:(id)a3
{
}

- (void)_configKeysChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];

  if (v5 != self)
  {
    unsigned __int8 v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"options"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (id v8 = [v7 integerValue]) != 0)
    {
      id v9 = v8;
      unsigned __int8 v10 = [v4 userInfo];
      unsigned __int8 v11 = [v10 objectForKeyedSubscript:@"keys"];
      [(GEODefaultsServer *)self _notifyListenersOfKeysChange:v11 options:v9 postInternalNotification:0];
    }
    else
    {
      BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v12) {
        sub_10004CF3C(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

- (void)_expiringKeysChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:@"keys"];

  if ([v6 count])
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"options"];
    id v9 = [v8 unsignedIntegerValue];

    if (v9)
    {
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x3032000000;
      v43 = sub_1000326FC;
      v44 = sub_10003270C;
      id v45 = 0;
      uint64_t v34 = _NSConcreteStackBlock;
      uint64_t v35 = 3221225472;
      uint64_t v36 = sub_100032714;
      v37 = &unk_1000714B8;
      uint64_t v38 = self;
      v39 = &v40;
      geo_isolate_sync();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = (id)v41[5];
      id v11 = [v10 countByEnumeratingWithState:&v30 objects:v46 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v31;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v10);
            }
            sub_100032788(*(void **)(*((void *)&v30 + 1) + 8 * (void)v13), v6, (int)v9);
            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v10 countByEnumeratingWithState:&v30 objects:v46 count:16];
        }
        while (v11);
      }

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v22) {
        sub_10004CF3C(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v14) {
      sub_10004CF78(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (void)_notifyChangedKeys:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5 triggerWatchSync:(BOOL)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = [v9 userInfo];
  id v17 = [v10 objectForKeyedSubscript:NSKeyValueChangeOldKey];

  id v11 = [v9 userInfo];

  uint64_t v12 = [v11 objectForKeyedSubscript:NSKeyValueChangeNewKey];

  uint64_t v13 = +[GEOCountryConfiguration sharedConfiguration];
  BOOL v14 = [v13 countryCode];
  uint64_t v15 = GEOCalculateChangedKeys();

  uint64_t v16 = [v15 allObjects];
  [(GEODefaultsServer *)self _notifyListenersOfKeysChange:v16 options:a4 postInternalNotification:v6];
}

- (void)_notifyListenersOfKeysChange:(id)a3 options:(unint64_t)a4 postInternalNotification:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  id v8 = a3;
  if ([v8 count])
  {
    if (v5) {
      _GEOConfigPostKeysChangedNotification();
    }
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = sub_1000326FC;
    uint64_t v27 = sub_10003270C;
    id v28 = 0;
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_100032B30;
    uint64_t v20 = &unk_1000714B8;
    uint64_t v21 = self;
    BOOL v22 = &v23;
    geo_isolate_sync();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = (id)v24[5];
    id v10 = [v9 countByEnumeratingWithState:&v13 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          sub_100032BA4(*(void **)(*((void *)&v13 + 1) + 8 * (void)v12), v8, v6);
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v13 objects:v29 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (void)clearExpiredKeyWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 keyString];
  [v3 keyOptions];

  _GEOConfigClearExpiredKey();
}

- (void)setAllValuesInStoreWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 peer];
  unsigned __int8 v5 = [v4 hasEntitlement:@"com.apple.geoservices.setanydefault"];

  if (v5)
  {
    [v3 keyOptions];
    int v6 = [v3 keyStringsAndValues];
    _GEOSetAllValuesInStore();

    id v7 = +[GEOResourceManifestManager modernManager];
    [v7 updateManifestIfNecessary:0];
  }
  else
  {
    id v7 = GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      CFStringRef v9 = @"com.apple.geoservices.setanydefault";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Missing entitlement: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)getCompanionSyncValuesForKeysWithRequest:(id)a3
{
  id v3 = a3;
  id v7 = [objc_alloc((Class)GEOConfigGetCompanionSyncValuesForKeysReply) initWithRequest:v3];
  id v4 = [v3 keyStrings];

  unsigned __int8 v5 = +[NSSet setWithArray:v4];
  int v6 = GEOGetValuesForKeysForCompanionSync();
  [v7 setKeyStringsAndValues:v6];

  [v7 send];
}

- (void)setExpiringKeyWithRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 peer];
  int v6 = [v4 keyString];
  uint64_t v12 = 0;
  LODWORD(self) = [(GEODefaultsServer *)self _validatePeer:v5 canSetKey:v6 error:&v12];

  if (self)
  {
    id v7 = _GEOConfigProxy();
    int v8 = objc_msgSend(v7, "configExpiryForOptions:", objc_msgSend(v4, "keyOptions"));

    CFStringRef v9 = [v4 keyString];
    id v10 = [v4 expireTime];
    uint64_t v11 = [v4 expireOSVersion];
    [v8 setConfigKeyExpiry:v9 date:v10 osVersion:v11];
  }
}

- (void)runBackgroundTask:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  GEOBackgroundTaskReportReportTaskInitiated();

  unsigned __int8 v5 = [v3 identifier];
  unsigned int v6 = [v5 isEqual:GEOMapsAuthBackgroundTaskIdentifier];

  if (v6)
  {
    id v7 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    [v7 refreshFromTask:v3];
  }
  else
  {
    int v8 = [v3 identifier];
    unsigned int v9 = [v8 isEqual:GEOUpdateNetworkDefaultsTaskIdentifier];

    if (v9)
    {
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2810000000;
      v21[3] = &unk_10006C519;
      v21[4] = 0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000331B4;
      v18[3] = &unk_1000714B8;
      uint64_t v20 = v21;
      id v10 = v3;
      id v19 = v10;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100033250;
      v16[3] = &unk_1000714E0;
      uint64_t v11 = objc_retainBlock(v18);
      id v17 = v11;
      [v10 setExpirationHandler:v16];
      uint64_t v12 = +[GEONetworkDefaults sharedNetworkDefaults];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000332A0;
      v14[3] = &unk_100072630;
      long long v13 = v11;
      id v15 = v13;
      [v12 updateIfNecessary:v14];

      _Block_object_dispose(v21, 8);
    }
  }
}

- (void)removeChangeListenerForWithRequest:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

- (void)getConfigValueForKeyWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOConfigStorageGetValueForKeyReply) initWithRequest:v3];
  unsigned __int8 v5 = [v3 keyString];
  unsigned int v6 = [v3 preferredAuditToken];
  char v7 = GEOConfig_validateEntitlementForKey();
  id v8 = 0;

  if (v7)
  {
    id v9 = [v3 keyOptions];
    id v10 = _GEOConfigProxy();
    uint64_t v11 = [v10 configStoreForOptions:v9];

    *(void *)buf = 0;
    uint64_t v12 = [v3 countryCode];
    long long v13 = [v11 getConfigValueForKey:v5 countryCode:v12 options:v9 source:buf];
    [v4 setKeyValue:v13];

    [v4 setKeySource:*(void *)buf];
    [v4 send];
  }
  else
  {
    long long v14 = GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Not allowing access (read): %@", buf, 0xCu);
    }

    [v4 setError:v8];
    [v4 send];
  }
}

- (void)setConfigValueForKeyWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOConfigStorageSetValueForKeyReply) initWithRequest:v4];
  unsigned int v6 = [v4 keyString];
  int v7 = GEOConfig_keyRequiresEntitlement();
  if (v7)
  {
    id v8 = [v4 preferredAuditToken];
    v26[1] = 0;
    char v9 = GEOConfig_validateEntitlementForKey();
    id v10 = 0;

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v10;
        uint64_t v12 = "Not allowing access (write): %@";
        long long v13 = v11;
        uint32_t v14 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v15 = v10;
  long long v16 = [v4 peer];
  v26[0] = v10;
  unsigned __int8 v17 = [(GEODefaultsServer *)self _validatePeer:v16 canSetKey:v6 error:v26];
  id v10 = v26[0];

  if ((v17 & 1) == 0)
  {
    uint64_t v11 = GEOGetUserDefaultsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = v6;
      __int16 v29 = 2114;
      v30[0] = v10;
      uint64_t v12 = "Could not validate peer's ability to set key: \"%{public}@\" - %{public}@";
      long long v13 = v11;
      uint32_t v14 = 22;
      goto LABEL_18;
    }
LABEL_19:

    [v5 setError:v10];
    [v5 send];
    goto LABEL_20;
  }
  id v18 = [v4 keyOptions];
  id v19 = _GEOConfigProxy();
  uint64_t v20 = [v19 configStoreForOptions:v18];

  uint64_t v21 = [v20 getConfigValueForKey:v6 countryCode:0 options:v18 source:0];
  uint64_t v22 = [v4 keyValue];
  uint64_t v23 = (void *)v22;
  if (v21) {
    int v24 = 0;
  }
  else {
    int v24 = v7;
  }
  if (v24 == 1 && v22) {
    GEOConfig_createEntitledKeyPathForKey();
  }
  uint64_t v25 = GEOGetUserDefaultsLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v6;
    __int16 v29 = 1024;
    LODWORD(v30[0]) = v18;
    WORD2(v30[0]) = 2112;
    *(void *)((char *)v30 + 6) = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Setting value for key: %@ (%#x) = %@", buf, 0x1Cu);
  }

  [v20 setConfigValue:v23 forKey:v6 options:v18 synchronous:1];
  [v5 send];

LABEL_20:
}

- (void)migrageEntitledKeyWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = _GEOConfigProxy();
  objc_msgSend(v4, "configStoreForOptions:", objc_msgSend(v3, "keyOptions"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v3 keyString];
  [v3 keyOptions];

  id v6 = (id)GEOConfig_migrateEntitledKey();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerHelpers, 0);
  objc_storeStrong((id *)&self->_peersIsolater, 0);

  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  return (id)_GEOGetDefaultsForStateCapture(self, a2, a3);
}

@end
@interface CHIDSServiceDelegate
- (CHIDSServiceDelegate)initWithDatabase:(id)a3;
- (NSArray)bootstrappedDeviceUuids;
- (NSString)persistedDeviceListKey;
- (void)checkForBootstrapDeviceChanges;
- (void)dealloc;
- (void)devicesChanged:(id)a3 shouldRemoveUnregisteredDevices:(BOOL)a4;
- (void)handleTransactionData:(id)a3 withConfigurationData:(id)a4;
- (void)rememberBootstrappedDevices:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setBootstrappedDeviceUuids:(id)a3;
- (void)setPersistedDeviceListKey:(id)a3;
- (void)setupBootstrappedDevices;
- (void)startInitialSync;
- (void)startReunionSync;
- (void)update:(id)a3;
@end

@implementation CHIDSServiceDelegate

- (CHIDSServiceDelegate)initWithDatabase:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CHIDSServiceDelegate;
  v6 = [(CHIDSServiceDelegate *)&v22 initWithName:"IDSService"];
  v7 = v6;
  if (v6)
  {
    v8 = [(CHIDSServiceDelegate *)v6 logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v24 = @"com.apple.private.alloy.callhistorysync";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating service with identifier %{public}@", buf, 0xCu);
    }

    v9 = +[NSString stringWithFormat:@"%@.devices", @"com.apple.private.alloy.callhistorysync"];
    [(CHIDSServiceDelegate *)v7 setPersistedDeviceListKey:v9];

    uint64_t v10 = objc_opt_new();
    peerDevices = v7->_peerDevices;
    v7->_peerDevices = (NSMutableDictionary *)v10;

    v7->_configuration = sub_100020994();
    objc_storeStrong((id *)&v7->_database, a3);
    v12 = [[CHPairedSyncCoordinator alloc] initWithDelegate:v7];
    coordinator = v7->_coordinator;
    v7->_coordinator = v12;

    v14 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.callhistorysync"];
    service = v7->_service;
    v7->_service = v14;

    v16 = v7->_service;
    v17 = [(CHIDSServiceDelegate *)v7 queue];
    [(IDSService *)v16 addDelegate:v7 queue:v17];

    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100049810);
    [(CHIDSServiceDelegate *)v7 setupBootstrappedDevices];
    v18 = [(CHIDSServiceDelegate *)v7 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DE58;
    block[3] = &unk_100048BC8;
    v21 = v7;
    dispatch_async(v18, block);
  }
  return v7;
}

- (void)dealloc
{
  [(IDSService *)self->_service removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)CHIDSServiceDelegate;
  [(CHIDSServiceDelegate *)&v3 dealloc];
}

- (void)update:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E4A4;
  v4[3] = &unk_1000490D8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CHIDSServiceDelegate *)v5 execute:v4];
}

- (void)setupBootstrappedDevices
{
  if (self->_configuration == 1)
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [(CHIDSServiceDelegate *)self persistedDeviceListKey];
    v13 = v4;
    v14 = &__NSArray0__struct;
    id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v3 registerDefaults:v5];

    id v6 = [(CHIDSServiceDelegate *)self persistedDeviceListKey];
    v7 = [v3 arrayForKey:v6];
    [(CHIDSServiceDelegate *)self setBootstrappedDeviceUuids:v7];

    v8 = [(CHIDSServiceDelegate *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(CHIDSServiceDelegate *)self bootstrappedDeviceUuids];
      int v11 = 134217984;
      id v12 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initial set of bootstrapped uuids %lu", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v10 = [(CHIDSServiceDelegate *)self bootstrappedDeviceUuids];
    sub_10001E7E0(v10);
  }
}

- (void)rememberBootstrappedDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(CHIDSServiceDelegate *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remembering %lu bootstrapped devices", (uint8_t *)&v8, 0xCu);
  }

  sub_10001E7E0(v4);
  [(CHIDSServiceDelegate *)self setBootstrappedDeviceUuids:v4];
  id v6 = +[NSUserDefaults standardUserDefaults];
  v7 = [(CHIDSServiceDelegate *)self persistedDeviceListKey];
  [v6 setObject:v4 forKey:v7];

  [v6 synchronize];
}

- (void)checkForBootstrapDeviceChanges
{
  id v3 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_configuration == 1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v21 = objc_opt_new();
    obj = self->_peerDevices;
    id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (!v4) {
      goto LABEL_19;
    }
    id v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&long long v5 = 138543362;
    long long v19 = v5;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), v19);
        uint64_t v10 = [v9 device];
        int v11 = [v10 uniqueIDOverride];
        id v12 = [(CHIDSServiceDelegate *)self bootstrappedDeviceUuids];
        unsigned int v13 = [v12 containsObject:v11];

        if (v13)
        {
          [v21 addObject:v11];
          v14 = [(CHIDSServiceDelegate *)self logHandle];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v10 name];
            v16 = [v10 modelIdentifier];
            *(_DWORD *)buf = 138412802;
            v27 = v11;
            __int16 v28 = 2112;
            v29 = v15;
            __int16 v30 = 2112;
            v31 = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Already sent bootstrap data store device(%@) to name(%@) model(%@)", buf, 0x20u);
          }
LABEL_16:

          goto LABEL_17;
        }
        unsigned int v17 = [(CHPairedSyncCoordinator *)self->_coordinator isSessionActive];
        v14 = [(CHIDSServiceDelegate *)self logHandle];
        BOOL v18 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (!v17)
        {
          if (v18)
          {
            *(_DWORD *)buf = v19;
            v27 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Delaying bootstrapping of device %{public}@ until Paired Sync Coordinator starts", buf, 0xCu);
          }
          goto LABEL_16;
        }
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Paired Sync Coordinator already requested a full sync, starting sync now", buf, 2u);
        }

        [v21 addObject:v11];
        [v9 sendBootstrapDataStoreWithService:self->_service];
LABEL_17:
      }
      id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (!v6)
      {
LABEL_19:

        [(CHIDSServiceDelegate *)self rememberBootstrappedDevices:v21];
        return;
      }
    }
  }
}

- (void)handleTransactionData:(id)a3 withConfigurationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CHIDSServiceDelegate *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "handling transaction data", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v7 intValue] == 1 && self->_configuration == 1)
      {
        id v9 = [(CHIDSServiceDelegate *)self logHandle];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Dropping transaction from peer IDS device configured as server", v29, 2u);
        }
      }
      else
      {
        id v9 = [objc_alloc((Class)PBDataReader) initWithData:v6];
        long long v24 = objc_opt_new();
        sub_10000B564(v24, (uint64_t)v9);
        long long v25 = sub_100027B74(v24);
        v26 = objc_opt_new();
        [v26 setObject:v25 forKeyedSubscript:@"kCHRemoteTransactionsKey"];
        id v27 = [objc_alloc((Class)NSNumber) initWithInt:2];
        [v26 setObject:v27 forKeyedSubscript:@"kCHSyncSourceKey"];

        __int16 v28 = +[NSNotificationCenter defaultCenter];
        [v28 postNotificationName:@"kCallHistoryMergeRemoteTransactionsNotification" object:0 userInfo:v26];
      }
    }
    else
    {
      id v9 = [(CHIDSServiceDelegate *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002EF7C(v9, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    id v9 = [(CHIDSServiceDelegate *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002EFF4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v17);

  uint64_t v18 = [(CHIDSServiceDelegate *)self logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 138544386;
    id v39 = v12;
    __int16 v40 = 2114;
    id v41 = v13;
    __int16 v42 = 2114;
    id v43 = v14;
    __int16 v44 = 2114;
    id v45 = v15;
    __int16 v46 = 2114;
    id v47 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received service %{public}@ account %{public}@ incoming message: %{public}@ fromID: %{public}@ context: %{public}@", (uint8_t *)&v38, 0x34u);
  }

  if (self->_configuration)
  {
    uint64_t v19 = [v14 objectForKeyedSubscript:@"ProtobufTransactions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v19;
    }
    else
    {
      uint64_t v22 = [(CHIDSServiceDelegate *)self logHandle];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10002F0D8((uint64_t)v14, v22, v23, v24, v25, v26, v27, v28);
      }

      id v20 = 0;
    }
    v29 = [v14 objectForKeyedSubscript:@"Configuration"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v30 = v29;
      uint64_t v21 = v30;
      if (v20 && v30) {
        [(CHIDSServiceDelegate *)self handleTransactionData:v20 withConfigurationData:v30];
      }
    }
    else
    {
      v31 = [(CHIDSServiceDelegate *)self logHandle];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10002F06C((uint64_t)v14, v31, v32, v33, v34, v35, v36, v37);
      }

      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = [(CHIDSServiceDelegate *)self logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDS service disabled, dropping message!", (uint8_t *)&v38, 2u);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CHIDSServiceDelegate *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    peerDevices = self->_peerDevices;
    if (peerDevices)
    {
      id v9 = [(NSMutableDictionary *)peerDevices count];
      if (v5)
      {
LABEL_4:
        id v10 = [v5 count];
LABEL_7:
        int v11 = 134218240;
        id v12 = v9;
        __int16 v13 = 2048;
        id v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device registration change: had %lu devices, now have %lu devices", (uint8_t *)&v11, 0x16u);
        goto LABEL_8;
      }
    }
    else
    {
      id v9 = 0;
      if (v5) {
        goto LABEL_4;
      }
    }
    id v10 = 0;
    goto LABEL_7;
  }
LABEL_8:

  [(CHIDSServiceDelegate *)self devicesChanged:v5 shouldRemoveUnregisteredDevices:1];
  [(CHIDSServiceDelegate *)self checkForBootstrapDeviceChanges];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CHIDSServiceDelegate *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Nearby devices changed", v8, 2u);
  }

  [(CHIDSServiceDelegate *)self devicesChanged:v5 shouldRemoveUnregisteredDevices:0];
  [(CHIDSServiceDelegate *)self checkForBootstrapDeviceChanges];
}

- (void)devicesChanged:(id)a3 shouldRemoveUnregisteredDevices:(BOOL)a4
{
  id v67 = a3;
  id v5 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v6 = self->_peerDevices;
  id v69 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (!v69)
  {

    v63 = 0;
    goto LABEL_29;
  }
  v63 = 0;
  uint64_t v65 = *(void *)v79;
  *(void *)&long long v7 = 138543618;
  long long v61 = v7;
  v66 = self;
  obj = v6;
  do
  {
    for (i = 0; i != v69; i = (char *)i + 1)
    {
      if (*(void *)v79 != v65) {
        objc_enumerationMutation(obj);
      }
      id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_peerDevices, "objectForKeyedSubscript:", *(void *)(*((void *)&v78 + 1) + 8 * i), v61);
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v10 = v67;
      id v11 = [v10 countByEnumeratingWithState:&v74 objects:v87 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v75;
        while (2)
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v75 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
            id v16 = [v9 device];
            uint64_t v17 = [v16 uniqueIDOverride];
            uint64_t v18 = [v15 uniqueIDOverride];
            unsigned __int8 v19 = [v17 isEqualToString:v18];

            if (v19)
            {
              self = v66;
              goto LABEL_23;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v74 objects:v87 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      if (!a4)
      {
        [v9 setStatus:0];
        self = v66;
        id v10 = [(CHIDSServiceDelegate *)v66 logHandle];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        uint64_t v23 = [v9 device];
        uint64_t v24 = [v23 uniqueIDOverride];
        uint64_t v28 = sub_1000280D0([v9 status]);
        *(_DWORD *)buf = v61;
        v84 = v24;
        __int16 v85 = 2082;
        v86 = v28;
        uint64_t v25 = v10;
        uint64_t v26 = "Device %{public}@ disappeared, set status to %{public}s";
        uint32_t v27 = 22;
        goto LABEL_22;
      }
      self = v66;
      id v20 = v63;
      if (!v63) {
        id v20 = objc_opt_new();
      }
      uint64_t v21 = [v9 device];
      uint64_t v22 = [v21 uniqueIDOverride];
      v63 = v20;
      [v20 addObject:v22];

      id v10 = [(CHIDSServiceDelegate *)v66 logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v9 device];
        uint64_t v24 = [v23 uniqueIDOverride];
        *(_DWORD *)buf = 138543362;
        v84 = v24;
        uint64_t v25 = v10;
        uint64_t v26 = "Device %{public}@ unregistered, removing from bootstrap list";
        uint32_t v27 = 12;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
      }
LABEL_23:
    }
    id v69 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v78 objects:v88 count:16];
  }
  while (v69);

  if (v63) {
    -[NSMutableDictionary removeObjectsForKeys:](self->_peerDevices, "removeObjectsForKeys:");
  }
  else {
    v63 = 0;
  }
LABEL_29:
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v29 = v67;
  id v30 = [v29 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = (mach_header_64 *)&_mh_execute_header;
    uint64_t v33 = *(void *)v71;
    do
    {
      uint64_t v34 = 0;
      id v68 = v31;
      do
      {
        if (*(void *)v71 != v33) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v34);
        if ([v35 isDefaultPairedDevice])
        {
          peerDevices = self->_peerDevices;
          uint64_t v37 = [v35 uniqueIDOverride];
          int v38 = [(NSMutableDictionary *)peerDevices objectForKeyedSubscript:v37];

          if (v38)
          {
            if ([v38 status])
            {
              id v39 = [(CHIDSServiceDelegate *)self logHandle];
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v40 = [v35 uniqueIDOverride];
                id v41 = sub_1000280D0([v38 status]);
                *(_DWORD *)buf = 138543618;
                v84 = v40;
                __int16 v85 = 2082;
                v86 = v41;
                __int16 v42 = v32;
                id v43 = v39;
                __int16 v44 = "Device %{public}@ status remaining at %{public}s";
                goto LABEL_50;
              }
              goto LABEL_51;
            }
            if (![v35 isNearby])
            {
              id v39 = [(CHIDSServiceDelegate *)self logHandle];
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v40 = [v35 uniqueIDOverride];
                v60 = sub_1000280D0([v38 status]);
                *(_DWORD *)buf = 138543618;
                v84 = v40;
                __int16 v85 = 2082;
                v86 = v60;
                __int16 v42 = v32;
                id v43 = v39;
                __int16 v44 = "Device %{public}@ is NOT nearby, leaving status as %{public}s";
LABEL_50:
                _os_log_impl(v42, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0x16u);
              }
LABEL_51:

              goto LABEL_52;
            }
            [v38 setStatus:2];
            v57 = [(CHIDSServiceDelegate *)self logHandle];
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = [v35 uniqueIDOverride];
              v59 = sub_1000280D0([v38 status]);
              *(_DWORD *)buf = 138543618;
              v84 = v58;
              __int16 v85 = 2082;
              v86 = v59;
              _os_log_impl(v32, v57, OS_LOG_TYPE_DEFAULT, "Device %{public}@ is nearby, changing status to %{public}s", buf, 0x16u);
            }
            [v38 flushTransactionsWithService:self->_service];
          }
          else
          {
            uint64_t v47 = v33;
            id v48 = v29;
            v49 = [(CHIDSServiceDelegate *)self logHandle];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = [v35 uniqueIDOverride];
              *(_DWORD *)buf = 138543362;
              v84 = v50;
              _os_log_impl(v32, v49, OS_LOG_TYPE_DEFAULT, "Adding new peer device %{public}@", buf, 0xCu);
            }
            v51 = [[CHIDSPeerDevice alloc] initWithDevice:v35 withPairedSyncCoordinator:self->_coordinator withConfiguration:self->_configuration];
            service = self->_service;
            [(CHIDSServiceDelegate *)self queue];
            v54 = v53 = v32;
            [(IDSService *)service addDelegate:v51 queue:v54];

            uint64_t v32 = v53;
            v55 = self->_peerDevices;
            v56 = [v35 uniqueIDOverride];
            [(NSMutableDictionary *)v55 setObject:v51 forKey:v56];

            id v29 = v48;
            uint64_t v33 = v47;
            id v31 = v68;
          }
        }
        else
        {
          int v38 = [(CHIDSServiceDelegate *)self logHandle];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            id v45 = [v35 name];
            __int16 v46 = [v35 uniqueIDOverride];
            *(_DWORD *)buf = 138543618;
            v84 = v45;
            __int16 v85 = 2114;
            v86 = v46;
            _os_log_impl(v32, v38, OS_LOG_TYPE_DEFAULT, "Skipping device (not default-paired) name(%{public}@) id(%{public}@)", buf, 0x16u);
          }
        }
LABEL_52:

        uint64_t v34 = (char *)v34 + 1;
      }
      while (v31 != v34);
      id v31 = [v29 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v31);
  }

  sub_10001E160(self->_peerDevices);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  long long v7 = [(CHIDSServiceDelegate *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "activeAccountsChanged: %lu", buf, 0xCu);
  }

  id v8 = v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:buf count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    *(void *)&long long v10 = 138412802;
    long long v21 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v13);
        id v15 = +[CHLogServer sharedInstance];
        id v16 = [v15 logHandleForDomain:"IDSService"];

        uint64_t v17 = v16;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v14 loginID];
          unsigned __int8 v19 = [v14 serviceName];
          unsigned int v20 = [v14 isActive];
          *(_DWORD *)uint64_t v26 = v21;
          uint32_t v27 = v18;
          __int16 v28 = 2112;
          id v29 = v19;
          __int16 v30 = 1024;
          unsigned int v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "loginID(%@) serviceName(%@) isActive(%d)", v26, 0x1Cu);
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v22 objects:buf count:16];
    }
    while (v11);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  id v11 = [(CHIDSServiceDelegate *)self queue];
  dispatch_assert_queue_V2(v11);

  int configuration = self->_configuration;
  uint64_t v13 = [(CHIDSServiceDelegate *)self logHandle];
  id v14 = v13;
  if (configuration == 2)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      id v17 = v9;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "incomingResourceAtURL(%{public}@) from %{public}@", (uint8_t *)&v16, 0x16u);
    }

    id v14 = os_transaction_create();
    if ([(CallHistoryDBClientHandle *)self->_database moveCallRecordsFromDatabaseAtURL:v9])
    {
      id v15 = [(CHIDSServiceDelegate *)self logHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Successfully migrated bootstrap data store", (uint8_t *)&v16, 2u);
      }
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_10002F144((uint64_t)v9, (unsigned int *)&self->_configuration, v14);
  }
}

- (void)startInitialSync
{
  id v3 = [(CHIDSServiceDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020190;
  block[3] = &unk_100048BC8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)startReunionSync
{
  id v3 = [(CHIDSServiceDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002063C;
  block[3] = &unk_100048BC8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (NSString)persistedDeviceListKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPersistedDeviceListKey:(id)a3
{
}

- (NSArray)bootstrappedDeviceUuids
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBootstrappedDeviceUuids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootstrappedDeviceUuids, 0);
  objc_storeStrong((id *)&self->_persistedDeviceListKey, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_peerDevices, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
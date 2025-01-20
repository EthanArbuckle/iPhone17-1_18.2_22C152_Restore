@interface ACCExternalAccessorySessionManager
+ (id)sharedManager;
+ (unsigned)_generateSessionID;
+ (void)initializeSessionClose;
- (ACCExternalAccessorySessionManager)init;
- (BOOL)_accessoryCloseSessionForEASessionUUID:(id)a3 informAccessory:(BOOL)a4;
- (BOOL)_continueOpenSessionForSingleSessionPerEAProtocol:(id)a3 fromPrimaryAccessoryUUID:(id)a4 fromClient:(id)a5;
- (BOOL)_eaProtocolHasValidMatchActionForOpeningSession:(id)a3;
- (BOOL)_isSessionOpenForProtocol:(id)a3 filterPrimaryUUID:(id)a4 filterClientBundleID:(id)a5;
- (BOOL)_sessionUUIDClientSupportsBackgroundEA:(id)a3;
- (BOOL)accessoryCloseSessionforEASessionID:(unsigned __int16)a3;
- (BOOL)closeSessionsForPrimaryAccessoryUUID:(id)a3;
- (BOOL)eaClientHasOpenEASession:(id)a3;
- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forEndpointUUID:(id)a4;
- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forSessionID:(unsigned __int16)a4;
- (BOOL)openSocketFromAccessoryToApp:(id)a3;
- (BOOL)openSocketFromAppToAccessory:(id)a3;
- (BOOL)outgoingEADataFromClientAvailable:(id)a3;
- (NSLock)openEASessionsLock;
- (NSMutableDictionary)openEASessionHandlers;
- (NSMutableDictionary)openEASessionUUIDsForEndpointUUID;
- (NSMutableDictionary)pidForOpenSessionUUID;
- (NSMutableSet)openEASessions;
- (NSSet)sessionUUIDs;
- (__CFData)returnAppToAccessoryDataForSession:(id)a3 maxBufferSize:(unsigned int)a4;
- (id)_accessoryForPrimaryUUID:(id)a3;
- (id)_appBundleIDForSessionUUID:(id)a3;
- (id)_clientsOwningSessionForProtocol:(id)a3 withAccessoryUUID:(id)a4;
- (id)_copySessionInfoDictionaryForSessionUUID:(id)a3;
- (id)_eaSessionUUIDsOwnedByClientBundleID:(id)a3;
- (id)_internalCloseSessionForEASessionUUID:(id)a3 informAccessory:(BOOL)a4;
- (id)_sessionInfoMatchingProtocol:(id)a3 withPrimaryAccessoryUUID:(id)a4;
- (id)closeSessionForEASessionUUID:(id)a3;
- (id)createSessionForProtocol:(id)a3 fromPrimaryAccessoryUUID:(id)a4 fromClient:(id)a5 result:(BOOL *)a6;
- (id)eaSessionUUIDForEndpointUUID:(id)a3;
- (id)eaSessionUUIDForSessionID:(unsigned __int16)a3;
- (id)sessionInfoDictionaryForSessionUUID:(id)a3;
- (unsigned)readAppToAccessoryDataForSession:(id)a3 maxBufferSize:(unsigned int)a4 dataBuffer:(__CFData *)a5;
- (void)_eaNativeDataArrived:(id)a3;
- (void)_handleApplicationStateChange:(id)a3;
- (void)_sendSessionCloseNotification;
- (void)_sendSessionOpenNotification;
- (void)setOpenEASessionHandlers:(id)a3;
- (void)setOpenEASessionUUIDsForEndpointUUID:(id)a3;
- (void)setOpenEASessions:(id)a3;
- (void)setOpenEASessionsLock:(id)a3;
- (void)setPidForOpenSessionUUID:(id)a3;
- (void)startIncomingDataNotificationsForEASessionUUID:(id)a3;
- (void)stopIncomingDataNotificationsForEASessionUUID:(id)a3;
@end

@implementation ACCExternalAccessorySessionManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__ACCExternalAccessorySessionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_6 != -1) {
    dispatch_once(&sharedManager_once_6, block);
  }
  v2 = (void *)sharedManager_sharedInstance_6;

  return v2;
}

uint64_t __51__ACCExternalAccessorySessionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_6 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

+ (unsigned)_generateSessionID
{
  if ((_generateSessionID_sessionID + 1) >> 16) {
    int v2 = 0;
  }
  else {
    int v2 = _generateSessionID_sessionID + 1;
  }
  _generateSessionID_sessionID = v2;
  return v2;
}

- (ACCExternalAccessorySessionManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)ACCExternalAccessorySessionManager;
  int v2 = [(ACCExternalAccessorySessionManager *)&v16 init];
  if (v2)
  {
    signal(13, (void (__cdecl *)(int))1);
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    openEASessionsLock = v2->_openEASessionsLock;
    v2->_openEASessionsLock = v3;

    [(NSLock *)v2->_openEASessionsLock setName:@"com.apple.accessoryd.openEASessions.lock"];
    uint64_t v5 = +[NSMutableSet set];
    openEASessions = v2->_openEASessions;
    v2->_openEASessions = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    openEASessionHandlers = v2->_openEASessionHandlers;
    v2->_openEASessionHandlers = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    openEASessionUUIDsForEndpointUUID = v2->_openEASessionUUIDsForEndpointUUID;
    v2->_openEASessionUUIDsForEndpointUUID = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    pidForOpenSessionUUID = v2->_pidForOpenSessionUUID;
    v2->_pidForOpenSessionUUID = (NSMutableDictionary *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_eaNativeDataArrived:" name:ACCTransportEANative_DataArrivedNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_handleApplicationStateChange:" name:@"ACCPlatformApplicationNotificationStateChanged" object:0];
  }
  return v2;
}

- (BOOL)_continueOpenSessionForSingleSessionPerEAProtocol:(id)a3 fromPrimaryAccessoryUUID:(id)a4 fromClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ACCExternalAccessorySessionManager *)self _isSessionOpenForProtocol:v8 filterPrimaryUUID:v9 filterClientBundleID:0])
  {
    uint64_t v11 = [v10 bundleID];
    unsigned int v12 = [(ACCExternalAccessorySessionManager *)self _isSessionOpenForProtocol:v8 filterPrimaryUUID:v9 filterClientBundleID:v11];

    if (v12)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        v13 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v13 = &_os_log_default;
        id v17 = &_os_log_default;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v10 bundleID];
        int v26 = 138412546;
        id v27 = v18;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "The same EA client %@ already has an open session for protocol %@", (uint8_t *)&v26, 0x16u);
      }
      goto LABEL_16;
    }
    v13 = [(ACCExternalAccessorySessionManager *)self _clientsOwningSessionForProtocol:v8 withAccessoryUUID:v9];
    if (![v13 count])
    {
LABEL_16:
      BOOL v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v15 = [v13 firstObject];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      objc_super v16 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v16 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Client currently owning EA session for protocol %@ is %@", (uint8_t *)&v26, 0x16u);
    }

    v20 = [v10 bundleID];
    if (platform_system_isApplicationInForeground(v20))
    {
    }
    else
    {
      unsigned __int8 v21 = platform_system_isApplicationInForeground(v15);

      if (v21)
      {
        BOOL v14 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    v22 = [(ACCExternalAccessorySessionManager *)self _sessionInfoMatchingProtocol:v8 withPrimaryAccessoryUUID:v9];
    if ([v22 count])
    {
      v23 = [v22 firstObject];
      v24 = [v23 objectForKey:kACCExternalAccessorySessionUUIDKey];
      [(ACCExternalAccessorySessionManager *)self _accessoryCloseSessionForEASessionUUID:v24 informAccessory:1];
    }
    BOOL v14 = 1;
    goto LABEL_29;
  }
  BOOL v14 = 1;
LABEL_31:

  return v14;
}

- (id)createSessionForProtocol:(id)a3 fromPrimaryAccessoryUUID:(id)a4 fromClient:(id)a5 result:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(ACCExternalAccessorySessionManager *)self _accessoryForPrimaryUUID:v11];
  BOOL v14 = [v13 externalAccessoryProtocolInformationForProtocolName:v10];
  if (!v14)
  {
LABEL_17:
    id v17 = 0;
    goto LABEL_18;
  }
  if (![(ACCExternalAccessorySessionManager *)self _eaProtocolHasValidMatchActionForOpeningSession:v14])goto LABEL_8; {
  if (([v13 supportsMultipleSessionsPerProtocol] & 1) == 0)
  }
  {
    if ([(ACCExternalAccessorySessionManager *)self _continueOpenSessionForSingleSessionPerEAProtocol:v10 fromPrimaryAccessoryUUID:v11 fromClient:v12])
    {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  v15 = [v12 bundleID];
  unsigned __int8 v16 = [(ACCExternalAccessorySessionManager *)self _isSessionOpenForProtocol:v10 filterPrimaryUUID:v11 filterClientBundleID:v15];

  if (v16)
  {
LABEL_8:
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v25 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v25 = &_os_log_default;
      id v26 = &_os_log_default;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v12 bundleID];
      *(_DWORD *)buf = 138412546;
      v80 = v27;
      __int16 v81 = 2112;
      id v82 = v10;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Client %@ can't open session for protocol %@!", buf, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_5:
  v73 = a6;
  id v17 = +[NSMutableDictionary dictionary];
  v18 = +[NSUUID UUID];
  uint64_t v19 = [v18 UUIDString];

  uint64_t v20 = kACCExternalAccessoryProtocolTypeKey;
  unsigned __int8 v21 = [v14 objectForKey:kACCExternalAccessoryProtocolTypeKey];
  unsigned int v71 = [v21 unsignedIntValue];

  v78 = (void *)v19;
  [v17 setObject:v19 forKey:kACCExternalAccessorySessionUUIDKey];
  uint64_t v22 = kACCExternalAccessoryProtocolIndexKey;
  v23 = [v14 objectForKey:kACCExternalAccessoryProtocolIndexKey];
  v77 = v23;
  if (v23)
  {
    id v24 = [v23 copy];
    [v17 setObject:v24 forKey:v22];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v29 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v29 = &_os_log_default;
      id v30 = &_os_log_default;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ACCExternalAccessorySessionManager createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:]1();
    }
  }
  v31 = [v12 bundleID];
  id v32 = [v31 copy];
  [v17 setObject:v32 forKey:kACCExternalAccessoryClientBundleIDKey];

  if (gLogObjects && gNumLogObjects >= 10)
  {
    v33 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v33 = &_os_log_default;
    id v34 = &_os_log_default;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "current EA protocol dict %@", buf, 0xCu);
  }

  uint64_t v35 = +[ACCExternalAccessorySessionManager _generateSessionID];
  uint64_t v36 = +[NSNumber numberWithUnsignedInt:v35];
  v75 = (void *)v36;
  unsigned int v70 = v35;
  if (v36)
  {
    [v17 setObject:v36 forKey:kACCExternalAccessorySessionIDKey];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v37 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v37 = &_os_log_default;
      id v38 = &_os_log_default;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ACCExternalAccessorySessionManager createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:].cold.8();
    }
  }
  id v39 = [v10 copy];
  [v17 setObject:v39 forKey:kACCExternalAccessoryProtocolNameKey];

  id v40 = [v11 copy];
  [v17 setObject:v40 forKey:kACCExternalAccessoryPrimaryUUID];

  v41 = [v14 objectForKey:v20];
  [v17 setObject:v41 forKey:v20];

  uint64_t v42 = kACCExternalAccessoryProtocolEndpointUUIDKey;
  v43 = [v14 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey];
  [v17 setObject:v43 forKey:v42];

  v44 = [v13 EAAccessoryDictionary];
  uint64_t v45 = kACCExternalAccessoryLegacyConnectionIDKey;
  v46 = [v44 objectForKey:kACCExternalAccessoryLegacyConnectionIDKey];

  v76 = v46;
  [v17 setObject:v46 forKey:v45];
  uint64_t v47 = kACCExternalAccessorySessionUsesSocketInterfaceKey;
  uint64_t v48 = [v14 objectForKey:kACCExternalAccessorySessionUsesSocketInterfaceKey];
  v74 = (void *)v48;
  if (v48)
  {
    [v17 setObject:v48 forKey:v47];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v49 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v49 = &_os_log_default;
      id v50 = &_os_log_default;
    }
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionManager createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:].cold.6();
    }

    if (!v71)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        v51 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v51 = &_os_log_default;
        id v52 = &_os_log_default;
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "protocolType for socket interface is iAP, create ACCExternalAccessorySessionBasic", buf, 2u);
      }

      v53 = -[ACCExternalAccessorySessionBasic initWithEASessionUUID:protocolID:legacyConnectionID:sessionID:]([ACCExternalAccessorySessionBasic alloc], "initWithEASessionUUID:protocolID:legacyConnectionID:sessionID:", v78, [v77 unsignedShortValue], objc_msgSend(v46, "unsignedLongLongValue"), v70);
      v72 = v53;
      if (v53)
      {
        v54 = v53;
        v55 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
        [v55 setObject:v54 forKey:v78];

        v56 = [(ACCExternalAccessorySessionManager *)self openEASessionUUIDsForEndpointUUID];
        v57 = [v56 objectForKeyedSubscript:v11];

        if (v57)
        {
          [v57 addObject:v78];
        }
        else
        {
          v57 = +[NSMutableArray array];
          [v57 addObject:v78];
          v58 = [(ACCExternalAccessorySessionManager *)self openEASessionUUIDsForEndpointUUID];
          [v58 setObject:v57 forKey:v11];
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 10)
        {
          v57 = *(id *)(gLogObjects + 72);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v57 = &_os_log_default;
          id v59 = &_os_log_default;
        }
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
          -[ACCExternalAccessorySessionManager createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:]();
        }
      }
    }
  }
  v60 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 clientCapabilities]);
  [v17 setObject:v60 forKey:kACCExternalAccessoryCapabilitiesKey];
  v61 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
  v62 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v12 clientPid]);
  [v61 setObject:v62 forKey:v78];

  if (gLogObjects && gNumLogObjects >= 10)
  {
    v63 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v63 = &_os_log_default;
    id v64 = &_os_log_default;
  }
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = v17;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Finished Create EA Session %@", buf, 0xCu);
  }

  v65 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v65 lock];

  v66 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  [v66 addObject:v17];

  v67 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  unsigned int v68 = [v67 count];

  v69 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v69 unlock];

  if (v68 == 1) {
    platform_system_startObservingApplicationState();
  }

  if (v17)
  {
    BOOL *v73 = 1;
    [(ACCExternalAccessorySessionManager *)self _sendSessionOpenNotification];
  }
LABEL_18:

  return v17;
}

- (id)_internalCloseSessionForEASessionUUID:(id)a3 informAccessory:(BOOL)a4
{
  BOOL v33 = a4;
  id v5 = a3;
  v6 = [(ACCExternalAccessorySessionManager *)self sessionInfoDictionaryForSessionUUID:v5];
  uint64_t v7 = [v6 objectForKey:kACCExternalAccessoryProtocolNameKey];
  id v8 = [v6 objectForKey:kACCExternalAccessoryPrimaryUUID];
  if ([(ACCExternalAccessorySessionManager *)self _isSessionOpenForProtocol:v7 filterPrimaryUUID:0 filterClientBundleID:0])
  {
    id v9 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
    id v10 = [v9 objectForKey:v5];

    if (v10)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v11 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v11 = &_os_log_default;
        id v14 = &_os_log_default;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "removing ACCExternalAccessorySessionBasic for eaSessionUUID %@", (uint8_t *)&buf, 0xCu);
      }

      [v10 closeDataPipes];
      v15 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
      [v15 removeObjectForKey:v5];
    }
    unsigned __int8 v16 = [(ACCExternalAccessorySessionManager *)self openEASessionUUIDsForEndpointUUID];
    id v17 = [v16 objectForKey:v8];

    if (v17)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v38 = 0x3032000000;
      id v39 = __Block_byref_object_copy__3;
      id v40 = __Block_byref_object_dispose__3;
      id v41 = 0;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = __92__ACCExternalAccessorySessionManager__internalCloseSessionForEASessionUUID_informAccessory___block_invoke;
      v34[3] = &unk_100218600;
      id v35 = v5;
      p_long long buf = &buf;
      [v17 enumerateObjectsUsingBlock:v34];
      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        if (gLogObjects && gNumLogObjects >= 10)
        {
          v18 = *(id *)(gLogObjects + 72);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v18 = &_os_log_default;
          id v19 = &_os_log_default;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[ACCExternalAccessorySessionManager _internalCloseSessionForEASessionUUID:informAccessory:]((uint64_t)&buf + 8, (uint64_t)v17, v18);
        }

        [v17 removeObject:*(void *)(*((void *)&buf + 1) + 40)];
      }

      _Block_object_dispose(&buf, 8);
    }
    id v13 = [v6 copy];
    uint64_t v20 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
    [v20 lock];

    unsigned __int8 v21 = [(ACCExternalAccessorySessionManager *)self openEASessions];
    [v21 removeObject:v6];

    uint64_t v22 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
    [v22 unlock];

    if (v33)
    {
      v23 = [v13 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey];
      id v24 = [v23 copy];

      platform_externalAccessory_closeExternalAccessorySession(v24, v13);
    }
    v25 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
    id v26 = [v25 objectForKey:v5];

    if (v26)
    {
      id v27 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
      [v27 removeObjectForKey:v5];
    }
    [(ACCExternalAccessorySessionManager *)self _sendSessionCloseNotification];
    __int16 v28 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
    [v28 lock];

    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v29 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v29 = &_os_log_default;
      id v30 = &_os_log_default;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionManager _internalCloseSessionForEASessionUUID:informAccessory:]((uint64_t)v5, self, v29);
    }

    v31 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
    [v31 unlock];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v10 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionManager _internalCloseSessionForEASessionUUID:informAccessory:].cold.6();
    }
    id v13 = 0;
  }

  return v13;
}

void __92__ACCExternalAccessorySessionManager__internalCloseSessionForEASessionUUID_informAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)closeSessionForEASessionUUID:(id)a3
{
  return [(ACCExternalAccessorySessionManager *)self _internalCloseSessionForEASessionUUID:a3 informAccessory:1];
}

- (BOOL)openSocketFromAccessoryToApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessorySessionManager *)self sessionInfoDictionaryForSessionUUID:v4];
  v6 = [v5 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey];
  platform_externalAccessory_openSocketFromAccessoryToApp(v6, v5);
  id v7 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
  id v8 = [v7 objectForKey:v4];

  if (v8) {
    [v8 openPipeToApp];
  }

  return 1;
}

- (BOOL)openSocketFromAppToAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(ACCExternalAccessorySessionManager *)self sessionInfoDictionaryForSessionUUID:v4];
  v6 = [v5 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey];
  platform_externalAccessory_openSocketFromAppToAccessory(v6, v5);
  id v7 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
  id v8 = [v7 objectForKey:v4];

  if (v8) {
    [v8 openPipeFromApp];
  }

  return 1;
}

- (BOOL)outgoingEADataFromClientAvailable:(id)a3
{
  v3 = [(ACCExternalAccessorySessionManager *)self sessionInfoDictionaryForSessionUUID:a3];
  id v4 = [v3 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey];
  char v5 = platform_externalAccessory_outgoingEADataFromClientAvailable(v4, (uint64_t)v3);

  return v5;
}

- (unsigned)readAppToAccessoryDataForSession:(id)a3 maxBufferSize:(unsigned int)a4 dataBuffer:(__CFData *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
  id v10 = [v9 objectForKey:v8];

  if (v10) {
    unsigned int v11 = [v10 readEASessionDataFromApp:a5 maxReadSize:v6];
  }
  else {
    unsigned int v11 = 0;
  }

  return v11;
}

- (__CFData)returnAppToAccessoryDataForSession:(id)a3 maxBufferSize:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
  id v8 = [v7 objectForKey:v6];

  if (v8) {
    id v9 = (__CFData *)[v8 returnEASessionDataFromApp:v4];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (void)stopIncomingDataNotificationsForEASessionUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
  id v7 = [v5 objectForKey:v4];

  id v6 = v7;
  if (v7)
  {
    [v7 stopIncomingDataNotifications];
    id v6 = v7;
  }
}

- (void)startIncomingDataNotificationsForEASessionUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
  id v7 = [v5 objectForKey:v4];

  id v6 = v7;
  if (v7)
  {
    [v7 startIncomingDataNotifications];
    id v6 = v7;
  }
}

- (BOOL)closeSessionsForPrimaryAccessoryUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionUUIDsForEndpointUUID];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [v6 copy];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __75__ACCExternalAccessorySessionManager_closeSessionsForPrimaryAccessoryUUID___block_invoke;
    v10[3] = &unk_100218B38;
    v10[4] = self;
    [v7 enumerateObjectsUsingBlock:v10];
    id v8 = [(ACCExternalAccessorySessionManager *)self openEASessionUUIDsForEndpointUUID];
    [v8 removeObjectForKey:v4];
  }
  return v6 != 0;
}

id __75__ACCExternalAccessorySessionManager_closeSessionsForPrimaryAccessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) closeSessionForEASessionUUID:a2];
}

- (BOOL)accessoryCloseSessionforEASessionID:(unsigned __int16)a3
{
  v3 = self;
  id v4 = [(ACCExternalAccessorySessionManager *)self eaSessionUUIDForSessionID:a3];
  LOBYTE(v3) = [(ACCExternalAccessorySessionManager *)v3 _accessoryCloseSessionForEASessionUUID:v4 informAccessory:0];

  return (char)v3;
}

- (BOOL)_accessoryCloseSessionForEASessionUUID:(id)a3 informAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if ([(ACCExternalAccessorySessionManager *)self _sessionUUIDClientSupportsBackgroundEA:v6])
    {
      id v7 = [(ACCExternalAccessorySessionManager *)self _appBundleIDForSessionUUID:v6];
      id v8 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
      id v9 = [v8 objectForKey:v6];
      platform_system_toggleProcessAssertionForBundleID((uint64_t)v7, (uint64_t)[v9 intValue]);
    }
    id v10 = +[ACCExternalAccessorySessionManager sharedManager];
    unsigned int v11 = [v10 _internalCloseSessionForEASessionUUID:v6 informAccessory:v4];

    if (v11)
    {
      id v12 = +[ACCExternalAccessoryServer sharedServer];
      unsigned int v13 = [v12 accessoryClosingExternalAccessorySession:v6];

      if (gLogObjects) {
        BOOL v14 = gNumLogObjects <= 9;
      }
      else {
        BOOL v14 = 1;
      }
      int v15 = !v14;
      if (v13)
      {
        if (v15)
        {
          unsigned __int8 v16 = *(id *)(gLogObjects + 72);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          unsigned __int8 v16 = &_os_log_default;
          id v22 = &_os_log_default;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          id v26 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_accessoryCloseSessionForEASessionUUID: Successfully closed eaSessionUUID %@", (uint8_t *)&v25, 0xCu);
        }
        BOOL v19 = 1;
        goto LABEL_48;
      }
      if (v15)
      {
        unsigned __int8 v16 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned __int8 v16 = &_os_log_default;
        id v23 = &_os_log_default;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_47:
        BOOL v19 = 0;
LABEL_48:

        goto LABEL_49;
      }
      int v25 = 138412290;
      id v26 = v6;
      unsigned __int8 v21 = "ERROR - _accessoryCloseSessionForEASessionUUID: Unable to close eaSessionUUID %@";
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        unsigned __int8 v16 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned __int8 v16 = &_os_log_default;
        id v20 = &_os_log_default;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_47;
      }
      int v25 = 138412290;
      id v26 = v6;
      unsigned __int8 v21 = "ERROR - _accessoryCloseSessionforEASessionID: Accessory failed to close session eaSessionUUID %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, 0xCu);
    goto LABEL_47;
  }
  if (gLogObjects) {
    BOOL v17 = gNumLogObjects < 10;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v11 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  else
  {
    unsigned int v11 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ERROR - _accessoryCloseSessionforEASessionID: No eaSessionUUID", (uint8_t *)&v25, 2u);
  }
  BOOL v19 = 0;
LABEL_49:

  return v19;
}

- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forSessionID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(ACCExternalAccessorySessionManager *)self eaSessionUUIDForSessionID:v4];
  if (v7)
  {
    id v8 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
    id v9 = [v8 objectForKey:v7];

    if (v9)
    {
      [v9 sendEABufferDataToApp:v6];
      unsigned __int8 v10 = 0;
    }
    else
    {
      unsigned int v11 = +[ACCExternalAccessoryServer sharedServer];
      unsigned __int8 v10 = [v11 handleIncomingExternalAccessoryData:v6 forEASessionIdentifier:v7];
    }
    if ([(ACCExternalAccessorySessionManager *)self _sessionUUIDClientSupportsBackgroundEA:v7])
    {
      id v12 = [(ACCExternalAccessorySessionManager *)self _appBundleIDForSessionUUID:v7];
      unsigned int v13 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
      BOOL v14 = [v13 objectForKey:v7];
      platform_system_toggleProcessAssertionForBundleID((uint64_t)v12, (uint64_t)[v14 intValue]);
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)handleIncomingExternalAccessoryData:(id)a3 forEndpointUUID:(id)a4
{
  id v6 = a3;
  id v7 = [(ACCExternalAccessorySessionManager *)self eaSessionUUIDForEndpointUUID:a4];
  if (v7)
  {
    if ([(ACCExternalAccessorySessionManager *)self _sessionUUIDClientSupportsBackgroundEA:v7])
    {
      id v8 = [(ACCExternalAccessorySessionManager *)self _appBundleIDForSessionUUID:v7];
      id v9 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
      unsigned __int8 v10 = [v9 objectForKey:v7];
      platform_system_toggleProcessAssertionForBundleID((uint64_t)v8, (uint64_t)[v10 intValue]);
    }
    unsigned int v11 = [(ACCExternalAccessorySessionManager *)self openEASessionHandlers];
    id v12 = [v11 objectForKey:v7];

    if (v12)
    {
      [v12 sendEABufferDataToApp:v6];
      unsigned __int8 v13 = 0;
    }
    else
    {
      BOOL v14 = +[ACCExternalAccessoryServer sharedServer];
      unsigned __int8 v13 = [v14 handleIncomingExternalAccessoryData:v6 forEASessionIdentifier:v7];
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)_sessionInfoMatchingProtocol:(id)a3 withPrimaryAccessoryUUID:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  id v25 = +[NSMutableArray array];
  if (v6)
  {
    id v7 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
    [v7 lock];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = self;
    id v8 = [(ACCExternalAccessorySessionManager *)self openEASessions];
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = kACCExternalAccessoryProtocolNameKey;
      uint64_t v13 = kACCExternalAccessoryPrimaryUUID;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          int v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          unsigned __int8 v16 = [v15 objectForKey:v12];
          id v17 = [v16 caseInsensitiveCompare:v6];

          if (!v17)
          {
            id v18 = [v15 objectForKey:v13];
            unsigned int v19 = [v18 isEqualToString:v26];

            if (v19) {
              [v25 addObject:v15];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }

    id v20 = [(ACCExternalAccessorySessionManager *)v24 openEASessionsLock];
    [v20 unlock];

    if (gLogObjects && gNumLogObjects >= 10)
    {
      unsigned __int8 v21 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned __int8 v21 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionManager _sessionInfoMatchingProtocol:withPrimaryAccessoryUUID:]();
    }
  }

  return v25;
}

- (BOOL)_isSessionOpenForProtocol:(id)a3 filterPrimaryUUID:(id)a4 filterClientBundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  if (!v8)
  {
    BOOL v23 = 0;
    goto LABEL_31;
  }
  id v10 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v10 lock];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v11 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (!v11)
  {
    BOOL v23 = 0;
    goto LABEL_30;
  }
  id v12 = v11;
  long long v28 = self;
  LOBYTE(v13) = 0;
  uint64_t v14 = *(void *)v34;
  uint64_t v15 = kACCExternalAccessoryProtocolNameKey;
  uint64_t v29 = kACCExternalAccessoryPrimaryUUID;
  uint64_t v30 = kACCExternalAccessoryClientBundleIDKey;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v18 = [v17 objectForKey:v15];
      id v19 = [v18 caseInsensitiveCompare:v8];

      if (v19) {
        continue;
      }
      if (v9)
      {
        id v20 = [v17 objectForKey:v29];
        unsigned int v13 = [v20 isEqualToString:v9];

        if (!v32)
        {
          if (v13) {
            goto LABEL_20;
          }
          continue;
        }
      }
      else if (!v32)
      {
        goto LABEL_20;
      }
      unsigned __int8 v21 = [v17 objectForKey:v30];
      id v22 = [v21 caseInsensitiveCompare:v32];

      if (v9)
      {
        if (((v22 == 0) & v13) != 0) {
          goto LABEL_20;
        }
      }
      else if (!v22)
      {
LABEL_20:
        if (gLogObjects && gNumLogObjects >= 10)
        {
          id v24 = *(id *)(gLogObjects + 72);
          self = v28;
        }
        else
        {
          self = v28;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          id v24 = &_os_log_default;
          id v25 = &_os_log_default;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138413058;
          id v38 = v8;
          __int16 v39 = 2112;
          CFStringRef v40 = @"yes";
          __int16 v41 = 2112;
          id v42 = v9;
          __int16 v43 = 2112;
          id v44 = v32;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "sessionOpenForProtocol %@ = %@, primaryAccUUID %@, clientBundleID %@", buf, 0x2Au);
        }

        BOOL v23 = 1;
        goto LABEL_30;
      }
    }
    id v12 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  BOOL v23 = 0;
  self = v28;
LABEL_30:

  id v26 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v26 unlock];

LABEL_31:
  return v23;
}

- (id)_clientsOwningSessionForProtocol:(id)a3 withAccessoryUUID:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  id v25 = +[NSMutableArray array];
  id v7 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v7 lock];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v23 = self;
  id v8 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    uint64_t v12 = kACCExternalAccessoryProtocolNameKey;
    uint64_t v26 = kACCExternalAccessoryPrimaryUUID;
    uint64_t v24 = kACCExternalAccessoryClientBundleIDKey;
    do
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v13);
        uint64_t v15 = [v14 objectForKey:v12];
        if ([v15 caseInsensitiveCompare:v6]) {
          goto LABEL_7;
        }
        unsigned __int8 v16 = [v14 objectForKey:v26];
        id v17 = [v16 caseInsensitiveCompare:v27];

        if (!v17)
        {
          uint64_t v15 = [v14 objectForKey:v24];
          [v25 addObject:v15];
LABEL_7:
        }
        unsigned int v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v18 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v10 = v18;
    }
    while (v18);
  }

  if (gLogObjects && gNumLogObjects >= 10)
  {
    id v19 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v19 = &_os_log_default;
    id v20 = &_os_log_default;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessorySessionManager _clientsOwningSessionForProtocol:withAccessoryUUID:]();
  }

  unsigned __int8 v21 = [(ACCExternalAccessorySessionManager *)v23 openEASessionsLock];
  [v21 unlock];

  return v25;
}

- (BOOL)eaClientHasOpenEASession:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self _eaSessionUUIDsOwnedByClientBundleID:v4];
  id v6 = [v5 count];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 10;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 1024;
    BOOL v14 = v6 != 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "client %@ has openEASession: %d", (uint8_t *)&v11, 0x12u);
  }

  return v6 != 0;
}

- (id)_eaSessionUUIDsOwnedByClientBundleID:(id)a3
{
  id v4 = a3;
  id v22 = +[NSMutableArray array];
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v5 lock];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unsigned __int8 v21 = self;
  id v6 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    uint64_t v10 = kACCExternalAccessoryClientBundleIDKey;
    uint64_t v11 = kACCExternalAccessorySessionUUIDKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v14 = [v13 objectForKey:v10];
        id v15 = [v14 caseInsensitiveCompare:v4];

        if (!v15)
        {
          unsigned __int8 v16 = [v13 objectForKey:v11];
          [v22 addObject:v16];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  if (gLogObjects && gNumLogObjects >= 10)
  {
    id v17 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessorySessionManager _eaSessionUUIDsOwnedByClientBundleID:]();
  }

  id v19 = [(ACCExternalAccessorySessionManager *)v21 openEASessionsLock];
  [v19 unlock];

  return v22;
}

- (id)_accessoryForPrimaryUUID:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = +[ACCExternalAccessoryServer sharedServer];
  char v5 = [v4 eaAccessories];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 primaryEndpointUUID];
        unsigned int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v6 = v9;
          if (gLogObjects && gNumLogObjects >= 10)
          {
            id v12 = *(id *)(gLogObjects + 72);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            id v12 = &_os_log_default;
            id v13 = &_os_log_default;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[ACCExternalAccessorySessionManager _accessoryForPrimaryUUID:](v6, v12);
          }

          goto LABEL_19;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  return v6;
}

- (BOOL)_eaProtocolHasValidMatchActionForOpeningSession:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 objectForKey:kACCExternalAccessoryMatchActionKey];
    id v6 = v5;
    if (v5 && [v5 unsignedShortValue] - 5 >= 0xFFFFFFFE)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v8 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[ACCExternalAccessorySessionManager _eaProtocolHasValidMatchActionForOpeningSession:]();
      }

      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)_copySessionInfoDictionaryForSessionUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v5 lock];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v19 = self;
  id v6 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = kACCExternalAccessorySessionUUIDKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v14 = [v13 objectForKey:v11];
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v16 = [v13 copy];

          id v9 = v16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  long long v17 = [(ACCExternalAccessorySessionManager *)v19 openEASessionsLock];
  [v17 unlock];

  return v9;
}

- (id)sessionInfoDictionaryForSessionUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v5 lock];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v19 = self;
  id v6 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    uint64_t v11 = kACCExternalAccessorySessionUUIDKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v14 = [v13 objectForKey:v11];
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v16 = v13;

          id v9 = v16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  long long v17 = [(ACCExternalAccessorySessionManager *)v19 openEASessionsLock];
  [v17 unlock];

  return v9;
}

- (id)eaSessionUUIDForSessionID:(unsigned __int16)a3
{
  id v4 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v5 lock];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = kACCExternalAccessorySessionIDKey;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 objectForKey:v10];
        unsigned int v14 = [v13 isEqualToNumber:v4];

        if (v14)
        {
          id v16 = [v12 objectForKey:kACCExternalAccessorySessionUUIDKey];
          id v15 = [v16 copy];

          if (gLogObjects && gNumLogObjects >= 10)
          {
            long long v17 = *(id *)(gLogObjects + 72);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            long long v17 = &_os_log_default;
            id v18 = &_os_log_default;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[ACCExternalAccessorySessionManager eaSessionUUIDForSessionID:]();
          }

          goto LABEL_19;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_19:

  id v19 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v19 unlock];

  return v15;
}

- (id)eaSessionUUIDForEndpointUUID:(id)a3
{
  id v4 = a3;
  char v5 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v5 lock];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(ACCExternalAccessorySessionManager *)self openEASessions];
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = kACCExternalAccessoryProtocolEndpointUUIDKey;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 objectForKey:v10];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          id v16 = [v12 objectForKey:kACCExternalAccessorySessionUUIDKey];
          id v15 = [v16 copy];

          if (gLogObjects && gNumLogObjects >= 10)
          {
            long long v17 = *(id *)(gLogObjects + 72);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            long long v17 = &_os_log_default;
            id v18 = &_os_log_default;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[ACCExternalAccessorySessionManager eaSessionUUIDForEndpointUUID:]();
          }

          goto LABEL_19;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_19:

  id v19 = [(ACCExternalAccessorySessionManager *)self openEASessionsLock];
  [v19 unlock];

  return v15;
}

- (id)_appBundleIDForSessionUUID:(id)a3
{
  id v3 = [(ACCExternalAccessorySessionManager *)self sessionInfoDictionaryForSessionUUID:a3];
  id v4 = [v3 objectForKey:kACCExternalAccessoryClientBundleIDKey];

  return v4;
}

- (BOOL)_sessionUUIDClientSupportsBackgroundEA:(id)a3
{
  id v3 = [(ACCExternalAccessorySessionManager *)self sessionInfoDictionaryForSessionUUID:a3];
  id v4 = [v3 objectForKey:kACCExternalAccessoryCapabilitiesKey];
  unint64_t v5 = ((unint64_t)[v4 unsignedLongLongValue] >> 4) & 1;

  return v5;
}

- (void)_eaNativeDataArrived:(id)a3
{
  id v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:ACCTransportEANative_EASessionUUID];

  if (v8
    && [(ACCExternalAccessorySessionManager *)self _sessionUUIDClientSupportsBackgroundEA:v8])
  {
    unint64_t v5 = [(ACCExternalAccessorySessionManager *)self _appBundleIDForSessionUUID:v8];
    id v6 = [(ACCExternalAccessorySessionManager *)self pidForOpenSessionUUID];
    id v7 = [v6 objectForKey:v8];
    platform_system_toggleProcessAssertionForBundleID((uint64_t)v5, (uint64_t)[v7 intValue]);
  }
}

- (void)_handleApplicationStateChange:(id)a3
{
  id v4 = [a3 userInfo];
  long long v21 = [v4 objectForKey:@"ACCPlatformApplicationStateDisplayIDKey"];
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v27 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "handling app state change notification %@", buf, 0xCu);
  }

  id v8 = [v4 objectForKey:@"ACCPlatformApplicationStateKey"];
  if ([v8 unsignedIntValue] == 2)
  {
    long long v20 = v4;
    uint64_t v9 = [(ACCExternalAccessorySessionManager *)self _eaSessionUUIDsOwnedByClientBundleID:v21];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (![(ACCExternalAccessorySessionManager *)self _sessionUUIDClientSupportsBackgroundEA:v14])
          {
            uint64_t v15 = gLogObjects;
            int v16 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v17 = gNumLogObjects < 10;
            }
            else {
              BOOL v17 = 1;
            }
            if (v17)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 134218240;
                uint64_t v27 = v15;
                __int16 v28 = 1024;
                LODWORD(v29) = v16;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v18 = &_os_log_default;
              id v19 = &_os_log_default;
            }
            else
            {
              id v19 = *(id *)(gLogObjects + 72);
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v27 = (uint64_t)v21;
              __int16 v28 = 2112;
              uint64_t v29 = v14;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Client %@ suspended, doesn't support background EA. Close EA session for eaSessionUUID %@", buf, 0x16u);
            }

            [(ACCExternalAccessorySessionManager *)self _accessoryCloseSessionForEASessionUUID:v14 informAccessory:1];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v11);
    }

    id v4 = v20;
  }
}

- (void)_sendSessionOpenNotification
{
  if (!_totalNumberOpenEASessions++)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 10;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v5 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    else
    {
      BOOL v5 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created first EA Native Session, post notification", (uint8_t *)&v10, 2u);
    }

    EASessionStatus = -1;
    if (notify_register_check("com.apple.accessories.ea.sessionStatusChanged", &EASessionStatus))
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v6 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v6 = &_os_log_default;
        id v8 = &_os_log_default;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        id v11 = "com.apple.accessories.ea.sessionStatusChanged";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      notify_set_state(EASessionStatus, 1uLL);
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v7 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v7 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        id v11 = "com.apple.accessories.ea.sessionStatusChanged";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Post notification %s with state 1!", (uint8_t *)&v10, 0xCu);
      }

      notify_post("com.apple.accessories.ea.sessionStatusChanged");
    }
  }
}

- (void)_sendSessionCloseNotification
{
  if (!--_totalNumberOpenEASessions)
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 10;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v4 = &_os_log_default;
      id v3 = &_os_log_default;
    }
    else
    {
      id v4 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No more EA Sessions, post notification", (uint8_t *)&v9, 2u);
    }

    EASessionStatus = -1;
    if (notify_register_check("com.apple.accessories.ea.sessionStatusChanged", &EASessionStatus))
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        BOOL v5 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        BOOL v5 = &_os_log_default;
        id v7 = &_os_log_default;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        int v10 = "com.apple.accessories.ea.sessionStatusChanged";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      notify_set_state(EASessionStatus, 0);
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v6 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v6 = &_os_log_default;
        id v8 = &_os_log_default;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        int v10 = "com.apple.accessories.ea.sessionStatusChanged";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Post notification %s with state 0!", (uint8_t *)&v9, 0xCu);
      }

      notify_post("com.apple.accessories.ea.sessionStatusChanged");
    }
  }
}

+ (void)initializeSessionClose
{
  if (initializeSessionClose_onceToken != -1) {
    dispatch_once(&initializeSessionClose_onceToken, &__block_literal_global_23);
  }
  EASessionStatus = -1;
  if (notify_register_check("com.apple.accessories.ea.sessionStatusChanged", &EASessionStatus))
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      BOOL v2 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v2 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "com.apple.accessories.ea.sessionStatusChanged";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    notify_set_state(EASessionStatus, 0);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v3 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v3 = &_os_log_default;
      id v5 = &_os_log_default;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "com.apple.accessories.ea.sessionStatusChanged";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Post initial notification %s with state 0!", (uint8_t *)&v6, 0xCu);
    }

    notify_post("com.apple.accessories.ea.sessionStatusChanged");
  }
}

void __60__ACCExternalAccessorySessionManager_initializeSessionClose__block_invoke(id a1)
{
  _totalNumberOpenEASessions = 0;
}

- (NSSet)sessionUUIDs
{
  return self->_sessionUUIDs;
}

- (NSLock)openEASessionsLock
{
  return self->_openEASessionsLock;
}

- (void)setOpenEASessionsLock:(id)a3
{
}

- (NSMutableSet)openEASessions
{
  return self->_openEASessions;
}

- (void)setOpenEASessions:(id)a3
{
}

- (NSMutableDictionary)openEASessionHandlers
{
  return self->_openEASessionHandlers;
}

- (void)setOpenEASessionHandlers:(id)a3
{
}

- (NSMutableDictionary)openEASessionUUIDsForEndpointUUID
{
  return self->_openEASessionUUIDsForEndpointUUID;
}

- (void)setOpenEASessionUUIDsForEndpointUUID:(id)a3
{
}

- (NSMutableDictionary)pidForOpenSessionUUID
{
  return self->_pidForOpenSessionUUID;
}

- (void)setPidForOpenSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidForOpenSessionUUID, 0);
  objc_storeStrong((id *)&self->_openEASessionUUIDsForEndpointUUID, 0);
  objc_storeStrong((id *)&self->_openEASessionHandlers, 0);
  objc_storeStrong((id *)&self->_openEASessions, 0);
  objc_storeStrong((id *)&self->_openEASessionsLock, 0);

  objc_storeStrong((id *)&self->_sessionUUIDs, 0);
}

- (void)createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "Couldn't create ea session information dictionary", v2, v3, v4, v5, v6);
}

- (void)createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:.cold.6()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "EA Session uses socket", v1, 2u);
}

- (void)createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:.cold.8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "sessionIDNum is nil", v2, v3, v4, v5, v6);
}

- (void)createSessionForProtocol:fromPrimaryAccessoryUUID:fromClient:result:.cold.11()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "protocolIndex is nil", v2, v3, v4, v5, v6);
}

- (void)_internalCloseSessionForEASessionUUID:(NSObject *)a3 informAccessory:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 openEASessions];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "after removing eaSessionUUID %@, openEASessions for ACCExternalAccessorySessionManager is now %@", (uint8_t *)&v6, 0x16u);
}

- (void)_internalCloseSessionForEASessionUUID:(NSObject *)a3 informAccessory:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, a2, a3, "Removing storedEASessionUUID %@ from openEASessionUUIDsForPrimaryAccessoryUUID %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

- (void)_internalCloseSessionForEASessionUUID:informAccessory:.cold.6()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "ACCExternalAccessorySessionManager: EASession closed already for sessionUUID %@", v1, 0xCu);
}

- (void)_sessionInfoMatchingProtocol:withPrimaryAccessoryUUID:.cold.1()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "_copySessionInfoDictionaryForProtocol %@ = %@");
}

- (void)_clientsOwningSessionForProtocol:withAccessoryUUID:.cold.1()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "Clients owning session for protocol %@: %@");
}

- (void)_eaSessionUUIDsOwnedByClientBundleID:.cold.1()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "EASessionUUIDs for clientBundleID %@: %@");
}

- (void)_accessoryForPrimaryUUID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 EAName];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found accEA name %@", v4, 0xCu);
}

- (void)_eaProtocolHasValidMatchActionForOpeningSession:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "eaMatchAction is noEASessionUse, can't open session for %@", v1, 0xCu);
}

- (void)eaSessionUUIDForSessionID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Found sessionDict %@ for sessionID %d", v2, 0x12u);
}

- (void)eaSessionUUIDForEndpointUUID:.cold.1()
{
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "Found sessionDict %@ for endpointUUID %@");
}

@end
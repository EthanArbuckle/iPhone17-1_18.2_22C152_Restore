@interface ACCPlatformLocationManager
+ (id)sharedManager;
- (ACCPlatformLocationManager)init;
- (BOOL)bLocationStarted;
- (BOOL)bNMEAFilterListNew;
- (BOOL)isSentenceArrayValidForUUID:(id)a3;
- (BOOL)isSentenceTypeSupported:(int)a3 forUUID:(id)a4;
- (BOOL)resetLocationEndpointUUID:(id)a3;
- (BOOL)sendGPRMCDataStatus:(BOOL)a3 valueV:(BOOL)a4 valueX:(BOOL)a5 forUUID:(id)a6;
- (BOOL)setLocationEndpointUUID:(id)a3 withSupportedNMEASentences:(__CFArray *)a4;
- (BOOL)setNMEAFilterList:(id)a3 forUUID:(id)a4;
- (BOOL)startLocationUpdatesForUUID:(id)a3;
- (BOOL)stopLocationUpdatesForUUID:(id)a3;
- (NSArray)supportedNMEASentencesArray;
- (NSMutableArray)pNMEAFilterList;
- (NSRecursiveLock)accessLock;
- (NSString)endpointUUID;
- (OS_dispatch_queue)endpointFeatureHandlerQueue;
- (unsigned)minNMEAIntervalMs;
- (unsigned)sentenceTypesBitmask:(id)a3 forUUID:(id)a4;
- (unsigned)supportedNMEASentenceMask;
- (void)dealloc;
- (void)setAccessLock:(id)a3;
- (void)setBLocationStarted:(BOOL)a3;
- (void)setBNMEAFilterListNew:(BOOL)a3;
- (void)setEndpointFeatureHandlerQueue:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setMinNMEAIntervalMs:(unsigned int)a3;
- (void)setPNMEAFilterList:(id)a3;
- (void)setSupportedNMEASentenceMask:(unsigned int)a3;
- (void)setSupportedNMEASentencesArray:(id)a3;
@end

@implementation ACCPlatformLocationManager

+ (id)sharedManager
{
  if (sharedManager_once_7 != -1) {
    dispatch_once(&sharedManager_once_7, &__block_literal_global_30);
  }
  v2 = (void *)sharedManager_sharedInstance_7;

  return v2;
}

void __43__ACCPlatformLocationManager_sharedManager__block_invoke(id a1)
{
  sharedManager_sharedInstance_7 = objc_alloc_init(ACCPlatformLocationManager);

  _objc_release_x1();
}

- (ACCPlatformLocationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)ACCPlatformLocationManager;
  v2 = [(ACCPlatformLocationManager *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSRecursiveLock);
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = 0;

    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = 0;

    *((_WORD *)v2 + 4) = 0;
    *(void *)(v2 + 12) = 0xFA00000000;
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;

    dispatch_queue_t v8 = dispatch_queue_create("locationPlatformEndpointFeatureHandlerQ", 0);
    v9 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v8;
  }
  return (ACCPlatformLocationManager *)v2;
}

- (void)dealloc
{
  [(ACCPlatformLocationManager *)self setEndpointUUID:0];
  [(ACCPlatformLocationManager *)self setPNMEAFilterList:0];
  [(ACCPlatformLocationManager *)self setSupportedNMEASentencesArray:0];
  [(ACCPlatformLocationManager *)self setAccessLock:0];
  v3.receiver = self;
  v3.super_class = (Class)ACCPlatformLocationManager;
  [(ACCPlatformLocationManager *)&v3 dealloc];
}

- (BOOL)setLocationEndpointUUID:(id)a3 withSupportedNMEASentences:(__CFArray *)a4
{
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 8;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    v9 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    v29[0] = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#Location] setLocationEndpointUUID: %@, supportedNMEASentencesArray: %@", (uint8_t *)&v26, 0x16u);
  }

  v10 = [(ACCPlatformLocationManager *)self accessLock];
  [v10 lock];

  uint64_t v11 = [(ACCPlatformLocationManager *)self endpointUUID];
  if (v11
    && (v12 = (void *)v11,
        [(ACCPlatformLocationManager *)self supportedNMEASentencesArray],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v14 = &_os_log_default;
      id v21 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager setLocationEndpointUUID:withSupportedNMEASentences:]();
    }
    BOOL v20 = 0;
  }
  else
  {
    id v15 = [v6 copy];
    [(ACCPlatformLocationManager *)self setEndpointUUID:v15];

    id v16 = [(__CFArray *)a4 copy];
    [(ACCPlatformLocationManager *)self setSupportedNMEASentencesArray:v16];

    [(ACCPlatformLocationManager *)self setSupportedNMEASentenceMask:[(ACCPlatformLocationManager *)self sentenceTypesBitmask:a4 forUUID:v6]];
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v14 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v14 = &_os_log_default;
      id v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(ACCPlatformLocationManager *)self endpointUUID];
      unsigned int v19 = [(ACCPlatformLocationManager *)self supportedNMEASentenceMask];
      int v26 = 138412546;
      id v27 = v18;
      __int16 v28 = 1024;
      LODWORD(v29[0]) = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#Location] setLocationEndpointUUID: %@, supportedNMEASentencesMask: %u", (uint8_t *)&v26, 0x12u);
    }
    BOOL v20 = 1;
  }

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v22 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v22 = &_os_log_default;
    id v23 = &_os_log_default;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412802;
    id v27 = v6;
    __int16 v28 = 1024;
    LODWORD(v29[0]) = v20;
    WORD2(v29[0]) = 2112;
    *(void *)((char *)v29 + 6) = a4;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[#Location] setLocationEndpointUUID: %@, result %d, supportedNMEASentencesArray: %@", (uint8_t *)&v26, 0x1Cu);
  }

  v24 = [(ACCPlatformLocationManager *)self accessLock];
  [v24 unlock];

  return v20;
}

- (BOOL)resetLocationEndpointUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[#Location] resetLocationEndpointUUID: %@", (uint8_t *)&v22, 0xCu);
  }

  id v8 = [(ACCPlatformLocationManager *)self accessLock];
  [v8 lock];

  v9 = [(ACCPlatformLocationManager *)self endpointUUID];

  if (!v9)
  {
    v12 = logObjectForModule_16();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager resetLocationEndpointUUID:]();
    }
    goto LABEL_38;
  }
  if (!v4)
  {
    v12 = logObjectForModule_16();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager resetLocationEndpointUUID:](self);
    }
    goto LABEL_38;
  }
  v10 = [(ACCPlatformLocationManager *)self endpointUUID];
  unsigned __int8 v11 = [v10 isEqualToString:v4];

  if ((v11 & 1) == 0)
  {
    v12 = logObjectForModule_16();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [(ACCPlatformLocationManager *)self endpointUUID];
      int v22 = 138412546;
      id v23 = v4;
      __int16 v24 = 2112;
      *(void *)v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[#Location] not resetting location state. UUID passed does not match UUID that set it. endpointUUID: %@ self.endpointUUID: %@ ", (uint8_t *)&v22, 0x16u);
    }
LABEL_38:
    BOOL v16 = 0;
    goto LABEL_23;
  }
  [(ACCPlatformLocationManager *)self setEndpointUUID:0];
  [(ACCPlatformLocationManager *)self setSupportedNMEASentencesArray:0];
  [(ACCPlatformLocationManager *)self setSupportedNMEASentenceMask:0];
  [(ACCPlatformLocationManager *)self setBLocationStarted:0];
  [(ACCPlatformLocationManager *)self setPNMEAFilterList:0];
  [(ACCPlatformLocationManager *)self setSupportedNMEASentenceMask:0];
  [(ACCPlatformLocationManager *)self setMinNMEAIntervalMs:250];
  [(ACCPlatformLocationManager *)self setBNMEAFilterListNew:0];
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v12 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v12 = &_os_log_default;
    id v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [(ACCPlatformLocationManager *)self supportedNMEASentenceMask];
    unsigned int v15 = [(ACCPlatformLocationManager *)self bLocationStarted];
    int v22 = 138412802;
    id v23 = v4;
    __int16 v24 = 1024;
    *(_DWORD *)v25 = v14;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[#Location] resetting Location state for all endpoints. resetLocationEndpointUUID:%@ supportedNMEASentencesMask: %u, self.bLocationStarted: %d", (uint8_t *)&v22, 0x18u);
  }
  BOOL v16 = 1;
LABEL_23:

  if (gLogObjects && gNumLogObjects >= 8)
  {
    id v17 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = &_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 1024;
    *(_DWORD *)v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[#Location] resetLocationEndpointUUID: %@, result %d", (uint8_t *)&v22, 0x12u);
  }

  unsigned int v19 = [(ACCPlatformLocationManager *)self accessLock];
  [v19 unlock];

  return v16;
}

- (BOOL)startLocationUpdatesForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v65 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[#Location] startLocationUpdatesForUUID = %@", buf, 0xCu);
  }

  id v8 = [(ACCPlatformLocationManager *)self accessLock];
  [v8 lock];

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v9 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(ACCPlatformLocationManager *)self bLocationStarted];
    unsigned int v12 = [(ACCPlatformLocationManager *)self bNMEAFilterListNew];
    id v13 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
    unsigned int v14 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
    id v15 = [v14 count];
    *(_DWORD *)buf = 138413314;
    *(void *)v65 = v4;
    *(_WORD *)&v65[8] = 1024;
    *(_DWORD *)&v65[10] = v11;
    *(_WORD *)&v65[14] = 1024;
    *(_DWORD *)&v65[16] = v12;
    __int16 v66 = 2112;
    *(void *)v67 = v13;
    *(_WORD *)&v67[8] = 2048;
    *(void *)&v67[10] = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[#Location] startLocationUpdatesForUUID = %@, bLocationStarted=%d bNMEAFilterListNew=%d pNMEAFilterList=%@ [count=%lu]", buf, 0x2Cu);
  }
  if (!v4)
  {
    v38 = logObjectForModule_16();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:]();
    }
    goto LABEL_63;
  }
  BOOL v16 = [(ACCPlatformLocationManager *)self endpointUUID];
  unsigned __int8 v17 = [v16 isEqualToString:v4];

  if ((v17 & 1) == 0)
  {
    v38 = logObjectForModule_16();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_63;
  }
  if ([(ACCPlatformLocationManager *)self bLocationStarted]
    && ![(ACCPlatformLocationManager *)self bNMEAFilterListNew])
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v38 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v38 = &_os_log_default;
      id v44 = &_os_log_default;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v45 = [(ACCPlatformLocationManager *)self bLocationStarted];
      v46 = [(ACCPlatformLocationManager *)self endpointUUID];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v65 = v45;
      *(_WORD *)&v65[4] = 2112;
      *(void *)&v65[6] = v46;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[#Location] Waiting for bLocationStarted(%d), or NMEAFilterList same. skipping start location update for endpoint: %@", buf, 0x12u);
    }
    goto LABEL_63;
  }
  [(ACCPlatformLocationManager *)self setBLocationStarted:1];
  id v18 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
  id v19 = [v18 count];

  if (!v19)
  {
    v38 = logObjectForModule_16();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:](self);
    }
LABEL_63:

    id v43 = 0;
    int v36 = 0;
    goto LABEL_64;
  }
  BOOL v20 = +[NSNumber numberWithInteger:[(ACCPlatformLocationManager *)self minNMEAIntervalMs]];
  id v21 = +[NSNumber numberWithInteger:0];
  int v22 = +[NSMutableDictionary dictionaryWithObject:v20 forKey:v21];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v56 = self;
  id obj = [(ACCPlatformLocationManager *)self pNMEAFilterList];
  id v23 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v61;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(obj);
        }
        id v27 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        unsigned int v28 = [v27 nmeaIntervalParamID];
        unsigned int v29 = [v27 nmeaIntervalMinMs];
        v30 = +[NSNumber numberWithBool:1];
        v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v27 nmeaTypeParamID]);
        [v22 setObject:v30 forKey:v31];

        if (v28) {
          BOOL v32 = v29 == 0;
        }
        else {
          BOOL v32 = 1;
        }
        if (!v32)
        {
          v33 = +[NSNumber numberWithInteger:v29];
          v34 = +[NSNumber numberWithInteger:v28];
          [v22 setObject:v33 forKey:v34];
        }
      }
      id v24 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v24);
  }

  self = v56;
  v35 = [(ACCPlatformLocationManager *)v56 endpointUUID];
  int v36 = platform_power_setAccessoryPowerMode(v35, 0, 1);

  if ((v36 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v37 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v37 = &_os_log_default;
      id v39 = &_os_log_default;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.5(v56);
    }
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v40 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v40 = &_os_log_default;
    id v41 = &_os_log_default;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v65 = v4;
    *(_WORD *)&v65[8] = 2112;
    *(void *)&v65[10] = v22;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[#Location] startLocationUpdatesForUUID %@, startUpdates: attributes %@", buf, 0x16u);
  }

  endpointFeatureHandlerQueue = v56->_endpointFeatureHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke;
  block[3] = &unk_100215968;
  block[4] = v56;
  id v43 = v22;
  id v59 = v43;
  dispatch_async(endpointFeatureHandlerQueue, block);
  [(ACCPlatformLocationManager *)v56 setBNMEAFilterListNew:0];

LABEL_64:
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v47 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v47 = &_os_log_default;
    id v48 = &_os_log_default;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v49 = [(ACCPlatformLocationManager *)self bLocationStarted];
    unsigned int v50 = [(ACCPlatformLocationManager *)self bNMEAFilterListNew];
    v51 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
    v52 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
    id v53 = [v52 count];
    *(_DWORD *)buf = 138413570;
    *(void *)v65 = v4;
    *(_WORD *)&v65[8] = 1024;
    *(_DWORD *)&v65[10] = v36;
    *(_WORD *)&v65[14] = 1024;
    *(_DWORD *)&v65[16] = v49;
    __int16 v66 = 1024;
    *(_DWORD *)v67 = v50;
    *(_WORD *)&v67[4] = 2112;
    *(void *)&v67[6] = v51;
    *(_WORD *)&v67[14] = 2048;
    *(void *)&v67[16] = v53;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[#Location] startLocationUpdatesForUUID = %@, result %d, bLocationStarted=%d bNMEAFilterListNew=%d pNMEAFilterList=%@ [count=%lu]", buf, 0x32u);
  }
  v54 = [(ACCPlatformLocationManager *)self accessLock];
  [v54 unlock];

  return v36;
}

void __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
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
    id v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [*(id *)(a1 + 32) endpointUUID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412546;
    unsigned int v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#Location] startLocationUpdatesForUUID %@, invoke startUpdates: attributes %@", (uint8_t *)&v13, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 32;
  v9 = [v8 endpointUUID];
  char v10 = accFeatureHandlers_invokeHandler(v9, 35, *(void *)(v7 + 8));

  if ((v10 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned int v11 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v11 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1((id *)v7);
    }
  }
}

- (BOOL)sendGPRMCDataStatus:(BOOL)a3 valueV:(BOOL)a4 valueX:(BOOL)a5 forUUID:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  unsigned int v11 = [(ACCPlatformLocationManager *)self accessLock];
  [v11 lock];

  if (!v10)
  {
    id v18 = logObjectForModule_16();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:]();
    }
    goto LABEL_20;
  }
  id v12 = [(ACCPlatformLocationManager *)self endpointUUID];
  unsigned __int8 v13 = [v12 isEqualToString:v10];

  if ((v13 & 1) == 0)
  {
    id v18 = logObjectForModule_16();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_20;
  }
  if (![(ACCPlatformLocationManager *)self bLocationStarted])
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v18 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v18 = &_os_log_default;
      id v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager sendGPRMCDataStatus:valueV:valueX:forUUID:](self);
    }
LABEL_20:
    BOOL v19 = 0;
    goto LABEL_21;
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  id v15 = objc_alloc_init((Class)NSMutableArray);
  if (!v8)
  {
    if (!v7) {
      goto LABEL_6;
    }
LABEL_13:
    id v21 = +[NSNumber numberWithInt:1];
    [v15 addObject:v21];

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v20 = +[NSNumber numberWithInt:0];
  [v15 addObject:v20];

  if (v7) {
    goto LABEL_13;
  }
LABEL_6:
  if (v6)
  {
LABEL_7:
    uint64_t v16 = +[NSNumber numberWithInt:2];
    [v15 addObject:v16];
  }
LABEL_8:
  [v14 setObject:v15 forKey:@"GPRMCDataStatus"];
  endpointFeatureHandlerQueue = self->_endpointFeatureHandlerQueue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __72__ACCPlatformLocationManager_sendGPRMCDataStatus_valueV_valueX_forUUID___block_invoke;
  v25[3] = &unk_100215968;
  v25[4] = self;
  id v26 = v14;
  id v18 = v14;
  dispatch_async(endpointFeatureHandlerQueue, v25);

  BOOL v19 = 1;
LABEL_21:

  id v23 = [(ACCPlatformLocationManager *)self accessLock];
  [v23 unlock];

  return v19;
}

void __72__ACCPlatformLocationManager_sendGPRMCDataStatus_valueV_valueX_forUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
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
    id v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [*(id *)(a1 + 32) endpointUUID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#Location] sendGPRMCDataStatus %@, invoke sendGPRMCDataStatus: attributes %@", (uint8_t *)&v13, 0x16u);
  }
  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 32;
  v9 = [v8 endpointUUID];
  char v10 = accFeatureHandlers_invokeHandler(v9, 37, *(void *)(v7 + 8));

  if ((v10 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned int v11 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v11 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1((id *)v7);
    }
  }
}

- (BOOL)stopLocationUpdatesForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    uint64_t v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[#Location] stopLocationUpdatesForUUID = %@", buf, 0xCu);
  }

  BOOL v8 = [(ACCPlatformLocationManager *)self accessLock];
  [v8 lock];

  if (!v4)
  {
    unsigned __int8 v17 = logObjectForModule_16();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:]();
    }
    goto LABEL_27;
  }
  v9 = [(ACCPlatformLocationManager *)self endpointUUID];
  unsigned __int8 v10 = [v9 isEqualToString:v4];

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v17 = logObjectForModule_16();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_27;
  }
  if (![(ACCPlatformLocationManager *)self bLocationStarted])
  {
    unsigned __int8 v17 = logObjectForModule_16();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (![(ACCPlatformLocationManager *)self bLocationStarted])
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned __int8 v17 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned __int8 v17 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
LABEL_26:
    -[ACCPlatformLocationManager sendGPRMCDataStatus:valueV:valueX:forUUID:](self);
LABEL_27:

    int v15 = 0;
    id v13 = 0;
    goto LABEL_35;
  }
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  endpointFeatureHandlerQueue = self->_endpointFeatureHandlerQueue;
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = __57__ACCPlatformLocationManager_stopLocationUpdatesForUUID___block_invoke;
  unsigned int v28 = &unk_100215968;
  unsigned int v29 = self;
  id v13 = v11;
  id v30 = v13;
  dispatch_async(endpointFeatureHandlerQueue, &v25);
  -[ACCPlatformLocationManager setBLocationStarted:](self, "setBLocationStarted:", 0, v25, v26, v27, v28, v29);
  id v14 = [(ACCPlatformLocationManager *)self endpointUUID];
  int v15 = platform_power_setAccessoryPowerMode(v14, 0, 0);

  if ((v15 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      uint64_t v16 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v16 = &_os_log_default;
      id v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.5(self);
    }
  }
LABEL_35:
  if (gLogObjects && gNumLogObjects >= 8)
  {
    BOOL v20 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v20 = &_os_log_default;
    id v21 = &_os_log_default;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = [(ACCPlatformLocationManager *)self bLocationStarted];
    *(_DWORD *)buf = 138412802;
    id v32 = v4;
    __int16 v33 = 1024;
    int v34 = v15;
    __int16 v35 = 1024;
    unsigned int v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[#Location] stopLocationUpdatesForUUID = %@, result %d, bLocationStarted=%d", buf, 0x18u);
  }

  id v23 = [(ACCPlatformLocationManager *)self accessLock];
  [v23 unlock];

  return v15;
}

void __57__ACCPlatformLocationManager_stopLocationUpdatesForUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
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
    id v4 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [*(id *)(a1 + 32) endpointUUID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[#Location] stopLocationUpdatesForUUID %@, invoke stopUpdates: attributes %@", (uint8_t *)&v13, 0x16u);
  }
  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 32;
  v9 = [v8 endpointUUID];
  char v10 = accFeatureHandlers_invokeHandler(v9, 36, *(void *)(v7 + 8));

  if ((v10 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v11 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v11 = &_os_log_default;
      id v12 = &_os_log_default;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1((id *)v7);
    }
  }
}

- (BOOL)setNMEAFilterList:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
  id v9 = [v8 copy];

  unsigned int v10 = [(ACCPlatformLocationManager *)self minNMEAIntervalMs];
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 8;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v13 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  else
  {
    int v13 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v77 = (uint64_t)v7;
    __int16 v78 = 2112;
    *(void *)v79 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[#Location] setNMEAFilterList: %@, pFilterList %@", buf, 0x16u);
  }

  id v14 = [(ACCPlatformLocationManager *)self accessLock];
  [v14 lock];

  if (!v6)
  {
    v68 = logObjectForModule_16();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager setNMEAFilterList:forUUID:]();
    }
    goto LABEL_121;
  }
  if (!v7)
  {
    v68 = logObjectForModule_16();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:]();
    }
    goto LABEL_121;
  }
  __int16 v15 = [(ACCPlatformLocationManager *)self endpointUUID];
  unsigned __int8 v16 = [v15 isEqualToString:v7];

  if ((v16 & 1) == 0)
  {
    v68 = logObjectForModule_16();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
LABEL_121:

    BOOL v60 = 0;
    goto LABEL_106;
  }
  unsigned __int8 v17 = +[NSMutableArray array];
  [(ACCPlatformLocationManager *)self setPNMEAFilterList:v17];

  [(ACCPlatformLocationManager *)self setMinNMEAIntervalMs:250];
  unsigned int v18 = [(ACCPlatformLocationManager *)self isSentenceArrayValidForUUID:v7];
  if (gLogObjects) {
    BOOL v19 = gNumLogObjects <= 7;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  if (v18)
  {
    if (v20)
    {
      id v21 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = &_os_log_default;
      id v23 = &_os_log_default;
    }
    unsigned int v70 = v10;
    id v71 = v9;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v77 = (uint64_t)v7;
      __int16 v78 = 2112;
      *(void *)v79 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[#Location] SentenceArrayValid: %@, pFilterList %@", buf, 0x16u);
    }
    id v24 = v7;

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v25 = v6;
    id v26 = [v25 countByEnumeratingWithState:&v72 objects:v86 count:16];
    if (v26)
    {
      id v28 = v26;
      uint64_t v29 = *(void *)v73;
      *(void *)&long long v27 = 134218240;
      long long v69 = v27;
      do
      {
        id v30 = 0;
        do
        {
          if (*(void *)v73 != v29) {
            objc_enumerationMutation(v25);
          }
          id v31 = *(id *)(*((void *)&v72 + 1) + 8 * (void)v30);
          id v32 = (const char *)[v31 UTF8String];
          if (!strcmp("GPGGA", v32))
          {
            uint64_t v36 = 250;
            uint64_t v37 = 32769;
            uint64_t v38 = 1;
            uint64_t v39 = 17;
          }
          else if (!strcmp("GPRMC", v32))
          {
            uint64_t v36 = 250;
            uint64_t v37 = 32770;
            uint64_t v38 = 2;
            uint64_t v39 = 18;
          }
          else if (!strcmp("GPGSV", v32))
          {
            uint64_t v36 = 83;
            uint64_t v37 = 32771;
            uint64_t v38 = 3;
            uint64_t v39 = 19;
          }
          else if (!strcmp("PASCD", v32))
          {
            uint64_t v37 = 32772;
            uint64_t v38 = 4;
            uint64_t v39 = 20;
            uint64_t v36 = 20;
          }
          else if (!strcmp("PAGCD", v32))
          {
            uint64_t v36 = 20;
            uint64_t v37 = 32773;
            uint64_t v38 = 5;
            uint64_t v39 = 21;
          }
          else if (!strcmp("PAACD", v32))
          {
            uint64_t v36 = 20;
            uint64_t v37 = 32774;
            uint64_t v38 = 6;
            uint64_t v39 = 22;
          }
          else
          {
            if (strcmp("GPHDT", v32))
            {
              uint64_t v33 = gLogObjects;
              int v34 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 8)
              {
                __int16 v35 = (iAP2NMEAFilterParam *)*(id *)(gLogObjects + 56);
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v69;
                  uint64_t v77 = v33;
                  __int16 v78 = 1024;
                  *(_DWORD *)v79 = v34;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                __int16 v35 = (iAP2NMEAFilterParam *)&_os_log_default;
                id v41 = &_os_log_default;
              }
              if (os_log_type_enabled(&v35->super, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v77 = (uint64_t)v31;
                _os_log_impl((void *)&_mh_execute_header, &v35->super, OS_LOG_TYPE_DEFAULT, "[#Location] huh? unknown NMEAString=%@", buf, 0xCu);
              }
              goto LABEL_56;
            }
            uint64_t v36 = 250;
            uint64_t v37 = 32775;
            uint64_t v38 = 7;
            uint64_t v39 = 23;
          }
          if (-[ACCPlatformLocationManager isSentenceTypeSupported:forUUID:](self, "isSentenceTypeSupported:forUUID:", v39, v24, v69))
          {
            __int16 v35 = [[iAP2NMEAFilterParam alloc] initWithTypeParamID:v38 andIntervalParamID:v37 andIntervalMinMs:v36];
            v40 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
            [v40 addObject:v35];

            if (v36 < [(ACCPlatformLocationManager *)self minNMEAIntervalMs]) {
              [(ACCPlatformLocationManager *)self setMinNMEAIntervalMs:v36];
            }
          }
          else
          {
            __int16 v35 = 0;
          }
LABEL_56:

          id v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        id v42 = [v25 countByEnumeratingWithState:&v72 objects:v86 count:16];
        id v28 = v42;
      }
      while (v42);
    }

    id v7 = v24;
    id v9 = v71;
    unsigned int v10 = v70;
  }
  else
  {
    if (v20)
    {
      unsigned int v22 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v22 = &_os_log_default;
      id v43 = &_os_log_default;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v77 = (uint64_t)v7;
      __int16 v78 = 2112;
      *(void *)v79 = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[#Location] NOT SentenceArrayValid: %@, pFilterList %@", buf, 0x16u);
    }

    unsigned int v44 = -1;
    do
    {
      uint64_t v45 = v44 + 1;
      if (v44 <= 2)
      {
        v46 = [[iAP2NMEAFilterParam alloc] initWithTypeParamID:v45 andIntervalParamID:0 andIntervalMinMs:0];
        v47 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
        [v47 addObject:v46];

        if ([(ACCPlatformLocationManager *)self minNMEAIntervalMs] >= 0xFB) {
          [(ACCPlatformLocationManager *)self setMinNMEAIntervalMs:250];
        }
      }
      unsigned int v44 = v45;
    }
    while (v45 != 7);
  }
  id v48 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
  -[ACCPlatformLocationManager setBNMEAFilterListNew:](self, "setBNMEAFilterListNew:", [v48 isEqualToArray:v9] ^ 1);

  if (gLogObjects && gNumLogObjects >= 8)
  {
    unsigned int v49 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v49 = &_os_log_default;
    id v50 = &_os_log_default;
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v51 = [(ACCPlatformLocationManager *)self bNMEAFilterListNew];
    v52 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
    unsigned int v53 = [(ACCPlatformLocationManager *)self minNMEAIntervalMs];
    *(_DWORD *)buf = 138413570;
    uint64_t v77 = (uint64_t)v7;
    __int16 v78 = 1024;
    *(_DWORD *)v79 = v51;
    *(_WORD *)&v79[4] = 2112;
    *(void *)&v79[6] = v52;
    __int16 v80 = 2112;
    id v81 = v9;
    __int16 v82 = 1024;
    unsigned int v83 = v10;
    __int16 v84 = 1024;
    unsigned int v85 = v53;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[#Location] setNMEAFilterList: %@, bNMEAFilterListNew %d, pNMEAFilterList %@ pNMEAFilterListOld %@, minNMEAIntervalMs %d -> %d", buf, 0x32u);
  }
  if (![(ACCPlatformLocationManager *)self bNMEAFilterListNew])
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v54 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v54 = &_os_log_default;
      id v55 = &_os_log_default;
    }
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_104;
    }
    *(_WORD *)buf = 0;
    v56 = "[#Location] self.bNMEAFilterListNew is false, not starting location messages since filter is same.";
    goto LABEL_103;
  }
  if (![(ACCPlatformLocationManager *)self bLocationStarted])
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v54 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v54 = &_os_log_default;
      id v57 = &_os_log_default;
    }
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_104;
    }
    *(_WORD *)buf = 0;
    v56 = "[#Location] waiting for start location updates - skipping start location message to acc";
LABEL_103:
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v56, buf, 2u);
LABEL_104:

    goto LABEL_105;
  }
  [(ACCPlatformLocationManager *)self startLocationUpdatesForUUID:v7];
LABEL_105:
  v58 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
  id v59 = [v58 count];

  id v9 = 0;
  BOOL v60 = v59 != 0;
LABEL_106:
  if (gLogObjects && gNumLogObjects >= 8)
  {
    long long v61 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    long long v61 = &_os_log_default;
    id v62 = &_os_log_default;
  }
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    long long v63 = [(ACCPlatformLocationManager *)self pNMEAFilterList];
    id v64 = [v63 count];
    unsigned int v65 = [(ACCPlatformLocationManager *)self minNMEAIntervalMs];
    *(_DWORD *)buf = 138413058;
    uint64_t v77 = (uint64_t)v7;
    __int16 v78 = 1024;
    *(_DWORD *)v79 = v60;
    *(_WORD *)&v79[4] = 2048;
    *(void *)&v79[6] = v64;
    __int16 v80 = 1024;
    LODWORD(v81) = v65;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "[#Location] setNMEAFilterList: %@, result %d, pNMEAFilterList.count %lu minNMEAIntervalMs %u", buf, 0x22u);
  }
  __int16 v66 = [(ACCPlatformLocationManager *)self accessLock];
  [v66 unlock];

  return v60;
}

- (BOOL)isSentenceTypeSupported:(int)a3 forUUID:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(ACCPlatformLocationManager *)self endpointUUID];
    unsigned __int8 v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = [(ACCPlatformLocationManager *)self supportedNMEASentencesArray];
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v16 + 1) + 8 * i) intValue] == a3)
            {
              BOOL v14 = 1;
              goto LABEL_13;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v9 = logObjectForModule_16();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
      }
    }
  }
  else
  {
    id v9 = logObjectForModule_16();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:]();
    }
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)isSentenceArrayValidForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACCPlatformLocationManager *)self supportedNMEASentencesArray];
  if (v5
    && (id v6 = (void *)v5,
        [(ACCPlatformLocationManager *)self supportedNMEASentencesArray],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    BOOL v9 = 1;
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 8;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v12 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    else
    {
      uint64_t v12 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[#Location] no supportedNMEASentences for UUID %@, result = false", (uint8_t *)&v14, 0xCu);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (unsigned)sentenceTypesBitmask:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    BOOL v10 = logObjectForModule_16();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:]();
    }
    goto LABEL_18;
  }
  id v8 = [(ACCPlatformLocationManager *)self endpointUUID];
  unsigned __int8 v9 = [v8 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    BOOL v10 = logObjectForModule_16();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_18;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v11)
  {
LABEL_18:
    unsigned int v13 = 0;
    goto LABEL_19;
  }
  id v12 = v11;
  unsigned int v13 = 0;
  uint64_t v14 = *(void *)v20;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = (int)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "shortValue", (void)v19) - 17;
      if (v16 > 6) {
        int v17 = 0;
      }
      else {
        int v17 = dword_1001B8830[v16];
      }
      v13 |= v17;
    }
    id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v12);
LABEL_19:

  return v13;
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSMutableArray)pNMEAFilterList
{
  return self->_pNMEAFilterList;
}

- (void)setPNMEAFilterList:(id)a3
{
}

- (BOOL)bLocationStarted
{
  return self->_bLocationStarted;
}

- (void)setBLocationStarted:(BOOL)a3
{
  self->_bLocationStarted = a3;
}

- (unsigned)supportedNMEASentenceMask
{
  return self->_supportedNMEASentenceMask;
}

- (void)setSupportedNMEASentenceMask:(unsigned int)a3
{
  self->_supportedNMEASentenceMask = a3;
}

- (unsigned)minNMEAIntervalMs
{
  return self->_minNMEAIntervalMs;
}

- (void)setMinNMEAIntervalMs:(unsigned int)a3
{
  self->_minNMEAIntervalMs = a3;
}

- (BOOL)bNMEAFilterListNew
{
  return self->_bNMEAFilterListNew;
}

- (void)setBNMEAFilterListNew:(BOOL)a3
{
  self->_bNMEAFilterListNew = a3;
}

- (NSArray)supportedNMEASentencesArray
{
  return self->_supportedNMEASentencesArray;
}

- (void)setSupportedNMEASentencesArray:(id)a3
{
}

- (NSRecursiveLock)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(id)a3
{
}

- (OS_dispatch_queue)endpointFeatureHandlerQueue
{
  return self->_endpointFeatureHandlerQueue;
}

- (void)setEndpointFeatureHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointFeatureHandlerQueue, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_supportedNMEASentencesArray, 0);
  objc_storeStrong((id *)&self->_pNMEAFilterList, 0);

  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

- (void)setLocationEndpointUUID:withSupportedNMEASentences:.cold.3()
{
  OUTLINED_FUNCTION_7_11();
  BOOL v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_6(v0, v1), "endpointUUID");
  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_3_20((void *)&_mh_execute_header, v3, v4, "[#Location] did not set location endpointUUID(%@) - self.endpointUUID(%@) already set for this feature", v5, v6, v7, v8, v9);
}

- (void)resetLocationEndpointUUID:.cold.2()
{
  OUTLINED_FUNCTION_7_11();
  BOOL v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_6(v0, v1), "endpointUUID");
  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_3_20((void *)&_mh_execute_header, v3, v4, "[#Location] did not reset endpoint(%@) - self.endpointUUID(%@) already reset for this feature", v5, v6, v7, v8, v9);
}

- (void)resetLocationEndpointUUID:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 endpointUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_20((void *)&_mh_execute_header, v2, v3, "[#Location] did not reset self.endpointUUID(%@) - endpointUUID param(%@) is nil", v4, v5, v6, v7, v8);
}

- (void)startLocationUpdatesForUUID:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "[#Location] endpointUUID == nil", v2, v3, v4, v5, v6);
}

- (void)startLocationUpdatesForUUID:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 endpointUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v2, v3, "[#Location] empty filter list for endpointUUID: %@", v4, v5, v6, v7, v8);
}

- (void)startLocationUpdatesForUUID:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 endpointUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v2, v3, "[#Location] Error setting AccessoryPowerMode for endpoint: %@", v4, v5, v6, v7, v8);
}

- (void)startLocationUpdatesForUUID:.cold.8()
{
  OUTLINED_FUNCTION_7_11();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_8_6(v0, v1), "endpointUUID");
  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_3_20((void *)&_mh_execute_header, v3, v4, "[#Location] endpointUUID(%@) != self.endpointUUID(%@)", v5, v6, v7, v8, v9);
}

void __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 endpointUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v2, v3, "[#Location] accFeatureHandlers_invokeHandler returned false for endpoint: %@", v4, v5, v6, v7, v8);
}

- (void)sendGPRMCDataStatus:(void *)a1 valueV:valueX:forUUID:.cold.2(void *a1)
{
  uint64_t v1 = [a1 endpointUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v2, v3, "[#Location] feature not started for endpointUUID: %@", v4, v5, v6, v7, v8);
}

- (void)setNMEAFilterList:forUUID:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "[#Location] pFilterList == nil", v2, v3, v4, v5, v6);
}

@end
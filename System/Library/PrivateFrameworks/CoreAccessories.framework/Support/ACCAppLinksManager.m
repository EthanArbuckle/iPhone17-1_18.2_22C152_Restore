@interface ACCAppLinksManager
+ (id)sharedManager;
- (ACCAppLinksManager)init;
- (BOOL)addCarPlayAppLinksSubscriber:(id)a3 forCategories:(id)a4 forIconSize:(unsigned __int16)a5 andCertSerialNumber:(id)a6;
- (BOOL)addEAAppLinksSubscriber:(id)a3 forCategories:(id)a4 forIconSize:(unsigned __int16)a5 andCertSerialNumber:(id)a6;
- (BOOL)removeCarPlayAppLinksSubscriber:(id)a3;
- (BOOL)removeEAAppLinksSubscriber:(id)a3;
- (NSMutableDictionary)carPlayAppsSubscriberList;
- (NSMutableDictionary)eaAppsSubscriberList;
- (OS_dispatch_queue)workQ;
- (id)carPlayAppLinksStateDidChangeObserver;
- (id)requestAppLinksIconDataForBundleID:(id)a3 withIconSize:(unsigned __int16)a4;
- (id)retrieveIconInformationForAppList:(id)a3 withIconSize:(unsigned __int16)a4;
- (void)dealloc;
- (void)handleCarPlayAppLinksStateChangedForCertSerial:(id)a3;
- (void)handleEAAppLinksStateChangedForCertSerial:(id)a3;
- (void)requestAppIcons:(id)a3 forUUID:(id)a4;
- (void)setCarPlayAppLinksStateDidChangeObserver:(id)a3;
- (void)setCarPlayAppsSubscriberList:(id)a3;
- (void)setEaAppsSubscriberList:(id)a3;
- (void)setWorkQ:(id)a3;
@end

@implementation ACCAppLinksManager

+ (id)sharedManager
{
  if (sharedManager_once_0 != -1) {
    dispatch_once(&sharedManager_once_0, &__block_literal_global_9);
  }
  v2 = (void *)sharedManager_sharedInstance_0;

  return v2;
}

void __35__ACCAppLinksManager_sharedManager__block_invoke(id a1)
{
  sharedManager_sharedInstance_0 = objc_alloc_init(ACCAppLinksManager);

  _objc_release_x1();
}

- (ACCAppLinksManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)ACCAppLinksManager;
  v2 = [(ACCAppLinksManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    carPlayAppsSubscriberList = v2->_carPlayAppsSubscriberList;
    v2->_carPlayAppsSubscriberList = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    eaAppsSubscriberList = v2->_eaAppsSubscriberList;
    v2->_eaAppsSubscriberList = (NSMutableDictionary *)v5;

    id carPlayAppLinksStateDidChangeObserver = v2->_carPlayAppLinksStateDidChangeObserver;
    v2->_id carPlayAppLinksStateDidChangeObserver = 0;

    dispatch_queue_t v8 = dispatch_queue_create("AppLinksWorkQ", 0);
    workQ = v2->_workQ;
    v2->_workQ = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)dealloc
{
  [(ACCAppLinksManager *)self setCarPlayAppsSubscriberList:0];
  [(ACCAppLinksManager *)self setEaAppsSubscriberList:0];
  [(ACCAppLinksManager *)self setWorkQ:0];
  v3.receiver = self;
  v3.super_class = (Class)ACCAppLinksManager;
  [(ACCAppLinksManager *)&v3 dealloc];
}

- (BOOL)addCarPlayAppLinksSubscriber:(id)a3 forCategories:(id)a4 forIconSize:(unsigned __int16)a5 andCertSerialNumber:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v13 = 0;
  v14 = 0;
  v15 = 0;
  if (v10 && v12)
  {
    v15 = +[NSNumber numberWithUnsignedLong:platform_CarPlay_carPlayAppLinksStateForCertSerial((uint64_t)v12)];
    v14 = [[ACCAppLinksAccessory alloc] initWithUUID:v10 categories:v11 iconSize:v7 certSerial:v12 withState:v15];
    if (v14)
    {
      v16 = +[ACCAppLinksManager sharedManager];
      v17 = [v16 carPlayAppsSubscriberList];
      [v17 setObject:v14 forKey:v10];

      if (gLogObjects && gNumLogObjects >= 8)
      {
        v18 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v18 = &_os_log_default;
        id v19 = &_os_log_default;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = +[ACCAppLinksManager sharedManager];
        v21 = [v20 carPlayAppsSubscriberList];
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[#App Links] carPlayAppsSubscriberList: %@", buf, 0xCu);
      }
      v22 = +[ACCAppLinksManager sharedManager];
      v23 = [v22 carPlayAppsSubscriberList];
      BOOL v24 = [v23 count] == (id)1;

      if (v24)
      {
        v25 = +[NSDistributedNotificationCenter defaultCenter];
        v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        v30 = __97__ACCAppLinksManager_addCarPlayAppLinksSubscriber_forCategories_forIconSize_andCertSerialNumber___block_invoke;
        v31 = &unk_1002169D8;
        objc_copyWeak(&v32, &location);
        v26 = [v25 addObserverForName:@"CREnhancedIntegrationConsentDidChangeNotificationName" object:0 queue:0 usingBlock:&v28];
        -[ACCAppLinksManager setCarPlayAppLinksStateDidChangeObserver:](self, "setCarPlayAppLinksStateDidChangeObserver:", v26, v28, v29, v30, v31);

        objc_destroyWeak(&v32);
      }
      [(ACCAppLinksManager *)self handleCarPlayAppLinksStateChangedForCertSerial:v12];
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  objc_destroyWeak(&location);

  return v13;
}

void __97__ACCAppLinksManager_addCarPlayAppLinksSubscriber_forCategories_forIconSize_andCertSerialNumber___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v7 userInfo];

  if (v4)
  {
    uint64_t v5 = [v7 userInfo];
    v6 = [v5 objectForKey:@"CREnhancedIntegrationConsentDidChangeNotificationVehicleCertificateSerialKey"];

    if (v6) {
      [WeakRetained handleCarPlayAppLinksStateChangedForCertSerial:v6];
    }
  }
}

- (BOOL)removeCarPlayAppLinksSubscriber:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6 = +[ACCAppLinksManager sharedManager];
    id v7 = [v6 carPlayAppsSubscriberList];
    [v7 removeObjectForKey:v5];

    dispatch_queue_t v8 = +[ACCAppLinksManager sharedManager];
    v9 = [v8 carPlayAppsSubscriberList];
    id v10 = [v9 count];

    if (!v10)
    {
      id v11 = +[NSDistributedNotificationCenter defaultCenter];
      id v12 = [(ACCAppLinksManager *)self carPlayAppLinksStateDidChangeObserver];
      [v11 removeObserver:v12];
    }
    if (gLogObjects && gNumLogObjects >= 8)
    {
      BOOL v13 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = +[ACCAppLinksManager sharedManager];
      v16 = [v15 carPlayAppsSubscriberList];
      int v18 = 138412290;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[#App Links] carPlayAppsSubscriberList: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  return a3 != 0;
}

- (BOOL)addEAAppLinksSubscriber:(id)a3 forCategories:(id)a4 forIconSize:(unsigned __int16)a5 andCertSerialNumber:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = v12;
  BOOL v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  if (v10 && v12)
  {
    int v18 = _supportedAppLinksEAProtocols((uint64_t)v10);
    v17 = v18;
    if (v18 && [v18 count]) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    v16 = +[NSNumber numberWithUnsignedLong:v19];
    v15 = [[ACCAppLinksAccessory alloc] initWithUUID:v10 categories:v11 iconSize:v7 certSerial:v13 withState:v16];
    if (v15)
    {
      v20 = +[ACCAppLinksManager sharedManager];
      v21 = [v20 eaAppsSubscriberList];
      [v21 setObject:v15 forKey:v10];

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
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        BOOL v24 = +[ACCAppLinksManager sharedManager];
        [v24 eaAppsSubscriberList];
        id v25 = v11;
        v27 = v26 = self;
        int v31 = 138412290;
        id v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[#App Links] eaAppsSubscriberList: %@", (uint8_t *)&v31, 0xCu);

        self = v26;
        id v11 = v25;
      }

      v28 = +[ACCAppLinksManager sharedManager];
      uint64_t v29 = [v28 eaAppsSubscriberList];
      [v29 count];

      [(ACCAppLinksManager *)self handleEAAppLinksStateChangedForCertSerial:v13];
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (BOOL)removeEAAppLinksSubscriber:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[ACCAppLinksManager sharedManager];
    v6 = [v5 eaAppsSubscriberList];
    [v6 removeObjectForKey:v4];

    uint64_t v7 = +[ACCAppLinksManager sharedManager];
    dispatch_queue_t v8 = [v7 eaAppsSubscriberList];
    [v8 count];

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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = +[ACCAppLinksManager sharedManager];
      id v12 = [v11 eaAppsSubscriberList];
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[#App Links] eaAppsSubscriberList: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  return a3 != 0;
}

- (void)requestAppIcons:(id)a3 forUUID:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      id v6 = a4;
      objc_initWeak(&location, a3);
      id v13 = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&v13, v6);

      id from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, self);
      workQ = self->_workQ;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __46__ACCAppLinksManager_requestAppIcons_forUUID___block_invoke;
      v8[3] = &unk_100216A00;
      objc_copyWeak(&v9, &from);
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, &v13);
      dispatch_async(workQ, v8);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&from);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __46__ACCAppLinksManager_requestAppIcons_forUUID___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v2 = objc_loadWeakRetained(a1 + 5);
  id location = a1 + 6;
  id v29 = objc_loadWeakRetained(a1 + 6);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v2;
  id v3 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v30 = *(void *)v33;
    *(void *)&long long v4 = 134218240;
    long long v26 = v4;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v6);
        dispatch_queue_t v8 = +[NSMutableDictionary dictionary];
        id v9 = +[NSMutableDictionary dictionary];
        id v10 = [v7 objectForKey:@"CARApplicationBundleIdentifierKey"];
        id v11 = [v7 objectForKey:@"appLinksSubFeature"];
        id v12 = v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13)
        {
          int v18 = 0;
          v17 = 0;
          goto LABEL_21;
        }
        if (![v11 shortValue])
        {
          int v14 = +[ACCAppLinksManager sharedManager];
          v15 = [v14 carPlayAppsSubscriberList];
          goto LABEL_14;
        }
        if ([v12 shortValue] == 1)
        {
          int v14 = +[ACCAppLinksManager sharedManager];
          v15 = [v14 eaAppsSubscriberList];
LABEL_14:
          v16 = v15;
          v17 = [v15 objectForKey:v29];

          goto LABEL_16;
        }
        v17 = 0;
LABEL_16:
        if (![v17 iconSize])
        {
          int v18 = 0;
          goto LABEL_20;
        }
        int v18 = objc_msgSend(WeakRetained, "requestAppLinksIconDataForBundleID:withIconSize:", v10, objc_msgSend(v17, "iconSize"));
        if (v18)
        {
          [v8 setObject:v18 forKey:@"iconData"];
          uint64_t v19 = [v18 SHA256];
          [v8 setObject:v19 forKey:@"iconDataHash"];

LABEL_20:
          [v9 setObject:v8 forKey:v10];
        }
LABEL_21:
        uint64_t v20 = gLogObjects;
        int v21 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 8)
        {
          v22 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            uint64_t v38 = v20;
            __int16 v39 = 1024;
            int v40 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v23 = &_os_log_default;
          v22 = &_os_log_default;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = (uint64_t)v9;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[#App Links] requestAppIcons iconDict: %@", buf, 0xCu);
        }

        id v24 = objc_loadWeakRetained(location);
        accFeatureHandlers_invokeHandler(v24, 57, (uint64_t)v9);

        id v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      id v25 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      id v5 = v25;
    }
    while (v25);
  }
}

- (id)requestAppLinksIconDataForBundleID:(id)a3 withIconSize:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  int v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v7 = +[ACCAppLinksIconInfo sharedManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __70__ACCAppLinksManager_requestAppLinksIconDataForBundleID_withIconSize___block_invoke;
  v14[3] = &unk_100216A28;
  v16 = &v17;
  dispatch_queue_t v8 = v6;
  v15 = v8;
  [v7 getIconDataForBundleID:v5 forIconSize:v14 withReply:(double)v4];

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v10 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCAppLinksManager requestAppLinksIconDataForBundleID:withIconSize:](v10);
    }
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v12;
}

void __70__ACCAppLinksManager_requestAppLinksIconDataForBundleID_withIconSize___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)retrieveIconInformationForAppList:(id)a3 withIconSize:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  dispatch_semaphore_t v6 = +[NSMutableArray array];
  if (!v5) {
    goto LABEL_44;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v27 = v5;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v7) {
    goto LABEL_35;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v40;
  unsigned int v28 = v4;
  do
  {
    id v10 = 0;
    do
    {
      if (*(void *)v40 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v10);
      id v12 = +[NSMutableDictionary dictionaryWithDictionary:v11];
      uint64_t v13 = [v11 objectForKey:@"CARApplicationBundleIdentifierKey"];
      int v14 = (void *)v13;
      if (v12)
      {
        if (v13)
        {
          if (!v4)
          {
            uint64_t v19 = gLogObjects;
            int v20 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 50)
            {
              v16 = *(id *)(gLogObjects + 392);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v45 = v19;
                __int16 v46 = 1024;
                int v47 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v21 = &_os_log_default;
              v16 = &_os_log_default;
              uint64_t v4 = v28;
            }
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[#App Links] Accessory did not pass in valid icon height or width, skipping icon info", buf, 2u);
            }
            goto LABEL_21;
          }
          v15 = [(ACCAppLinksManager *)self requestAppLinksIconDataForBundleID:v13 withIconSize:v4];
          if (v15)
          {
            v16 = v15;
            uint64_t v17 = [v15 SHA256];
            if (v17)
            {
              int v18 = (void *)v17;
              [v12 setObject:v17 forKey:@"iconDataHash"];

LABEL_21:
              [v6 addObject:v12];
              goto LABEL_22;
            }
            id v22 = logObjectForModule_8(49);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[ACCAppLinksManager retrieveIconInformationForAppList:withIconSize:].cold.5(&v31, v32);
            }
          }
          else
          {
            v16 = logObjectForModule_8(49);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[ACCAppLinksManager retrieveIconInformationForAppList:withIconSize:].cold.4(&v33, v34);
            }
          }
        }
        else
        {
          v16 = logObjectForModule_8(49);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[ACCAppLinksManager retrieveIconInformationForAppList:withIconSize:](&v35, v36);
          }
        }
      }
      else
      {
        v16 = logObjectForModule_8(49);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[ACCAppLinksManager retrieveIconInformationForAppList:withIconSize:](&v37, v38);
        }
      }

LABEL_22:
      id v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v23 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    id v8 = v23;
  }
  while (v23);
LABEL_35:

  if (gLogObjects && gNumLogObjects >= 50)
  {
    id v24 = *(id *)(gLogObjects + 392);
    id v5 = v27;
  }
  else
  {
    id v5 = v27;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v24 = &_os_log_default;
    id v25 = &_os_log_default;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[#App Links] updatedAppList: %@", buf, 0xCu);
  }

LABEL_44:

  return v6;
}

- (void)handleCarPlayAppLinksStateChangedForCertSerial:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  workQ = self->_workQ;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69__ACCAppLinksManager_handleCarPlayAppLinksStateChangedForCertSerial___block_invoke;
  v7[3] = &unk_100216AA0;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQ, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__ACCAppLinksManager_handleCarPlayAppLinksStateChangedForCertSerial___block_invoke(uint64_t a1)
{
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  id v71 = 0;
  v52 = +[NSArray array];
  id v2 = +[NSMutableDictionary dictionary];
  id val = objc_loadWeakRetained((id *)(a1 + 48));
  if (!*(void *)(a1 + 32))
  {
    id v15 = 0;
    goto LABEL_53;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v3 = +[ACCAppLinksManager sharedManager];
  id v4 = [v3 carPlayAppsSubscriberList];

  id v5 = [v4 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (!v5)
  {
LABEL_10:

LABEL_11:
    int v14 = logObjectForModule_8(49);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#App Links] accessory NULL", buf, 2u);
    }
    id v11 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)v63;
LABEL_4:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v63 != v6) {
      objc_enumerationMutation(v4);
    }
    uint64_t v8 = *(void *)(*((void *)&v62 + 1) + 8 * v7);
    uint64_t v9 = +[ACCAppLinksManager sharedManager];
    id v10 = [v9 carPlayAppsSubscriberList];
    id v11 = [v10 objectForKey:v8];

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v11 certSerial];
    LOBYTE(v12) = [v12 isEqualToData:v13];

    if (v12) {
      break;
    }

    if (v5 == (id)++v7)
    {
      id v5 = [v4 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (v5) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  if (!v11) {
    goto LABEL_11;
  }
  v16 = [v11 certSerial];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    int v14 = logObjectForModule_8(49);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[#App Links] accessory.certSerial NULL", buf, 2u);
    }
LABEL_14:

LABEL_15:
    id v15 = v11;
    goto LABEL_53;
  }
  int v18 = [v11 certSerial];
  id v19 = (id)platform_CarPlay_carPlayAppLinksStateForCertSerial((uint64_t)v18);

  if (gLogObjects && gNumLogObjects >= 50)
  {
    int v20 = *(id *)(gLogObjects + 392);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v20 = &_os_log_default;
    id v21 = &_os_log_default;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v22 = [v11 subFeatureState];
    unsigned int v23 = [v22 unsignedIntValue];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v19;
    __int16 v73 = 1024;
    unsigned int v74 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[#App Links] currentAppLinksState: %lu, accessory.subFeatureState %d", buf, 0x12u);
  }
  if ([v11 initialUpdateSent])
  {
    if (([v11 listUpdateFailedToSend] & 1) == 0)
    {
      id v24 = [v11 subFeatureState];
      BOOL v25 = v19 == (id)[v24 unsignedIntValue];

      if (v25) {
        goto LABEL_15;
      }
    }
  }
  if ([v11 listUpdateFailedToSend])
  {
    long long v26 = [v11 carPlayRetryUpdateTimer];

    if (v26)
    {
      id v27 = [v11 carPlayRetryUpdateTimer];
      dispatch_source_cancel(v27);

      [v11 setCarPlayRetryUpdateTimer:0];
    }
    [v11 setListUpdateFailedToSend:0];
  }
  if (v19 != (id)2)
  {
    v36 = [v11 subFeatureState];
    if (v19 == [v36 unsignedLongValue])
    {
      unsigned __int8 v37 = [v11 initialUpdateSent];

      if (v37) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v38 = +[NSNumber numberWithUnsignedLong:v19];
    [v11 setSubFeatureState:v38];

    goto LABEL_52;
  }
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v11);
  id v29 = +[ACCCarPlay sharedManager];
  uint64_t v30 = [v11 certSerial];
  char v31 = [v11 categories];
  uint64_t CarPlayCategoryMaskFromCategorySet = _createCarPlayCategoryMaskFromCategorySet(v31);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = __69__ACCAppLinksManager_handleCarPlayAppLinksStateChangedForCertSerial___block_invoke_100;
  v57[3] = &unk_100216A50;
  objc_copyWeak(v61, (id *)buf);
  v60 = &v66;
  id v15 = v11;
  id v58 = v15;
  v61[1] = (id)2;
  char v33 = v28;
  v59 = v33;
  [v29 carPlayIconStateForCertSerial:v30 andAppCategories:CarPlayCategoryMaskFromCategorySet withReply:v57];

  dispatch_time_t v34 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(v33, v34)) {
    goto LABEL_50;
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    char v35 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    char v35 = &_os_log_default;
    id v39 = &_os_log_default;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    -[ACCAppLinksManager requestAppLinksIconDataForBundleID:withIconSize:](v35);
  }

  [v15 setListUpdateFailedToSend:1];
  dispatch_source_t v40 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 40) + 32));
  [v15 setCarPlayRetryUpdateTimer:v40];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  long long v41 = [v15 carPlayRetryUpdateTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __69__ACCAppLinksManager_handleCarPlayAppLinksStateChangedForCertSerial___block_invoke_102;
  handler[3] = &unk_100216A78;
  objc_copyWeak(&v55, &location);
  id v42 = v15;
  id v54 = v42;
  dispatch_source_set_event_handler(v41, handler);

  v43 = [v42 carPlayRetryUpdateTimer];
  dispatch_time_t v44 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v43, v44, 0xFFFFFFFFFFFFFFFFLL, 0);

  uint64_t v45 = [v42 carPlayRetryUpdateTimer];
  dispatch_activate((dispatch_object_t)v45);

  LOBYTE(v45) = [v42 listUpdateFailedToSend];
  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);
  if (v45)
  {
    char v46 = 0;
  }
  else
  {
LABEL_50:
    uint64_t v47 = objc_msgSend(val, "retrieveIconInformationForAppList:withIconSize:", v67[5], objc_msgSend(v15, "iconSize"));

    char v46 = 1;
    v52 = (void *)v47;
  }

  objc_destroyWeak(v61);
  objc_destroyWeak((id *)buf);

  if (v46)
  {
LABEL_52:
    [v2 setObject:v52 forKey:@"appList"];
    v48 = [v11 subFeatureState];
    [v2 setObject:v48 forKey:@"appLinksState"];

    v49 = +[NSNumber numberWithUnsignedInteger:0];
    [v2 setObject:v49 forKey:@"appLinksSubFeature"];

    v50 = [v11 uuid];
    accFeatureHandlers_invokeHandler(v50, 56, (uint64_t)v2);

    [v11 setInitialUpdateSent:1];
    id v15 = v11;
  }
LABEL_53:

  _Block_object_dispose(&v66, 8);
}

void __69__ACCAppLinksManager_handleCarPlayAppLinksStateChangedForCertSerial___block_invoke_100(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [v4 copy];

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) setListUpdateFailedToSend:0];
  uint64_t v8 = +[NSNumber numberWithUnsignedLong:*(void *)(a1 + 64)];
  [WeakRetained setSubFeatureState:v8];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __69__ACCAppLinksManager_handleCarPlayAppLinksStateChangedForCertSerial___block_invoke_102(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (gLogObjects && gNumLogObjects >= 50)
  {
    id v3 = *(id *)(gLogObjects + 392);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[#App Links] Retry sending AppLinksUpdate", v7, 2u);
  }

  id v5 = [*(id *)(a1 + 32) certSerial];
  [WeakRetained handleCarPlayAppLinksStateChangedForCertSerial:v5];

  uint64_t v6 = [*(id *)(a1 + 32) carPlayRetryUpdateTimer];
  dispatch_source_cancel(v6);

  [*(id *)(a1 + 32) setCarPlayRetryUpdateTimer:0];
}

- (void)handleEAAppLinksStateChangedForCertSerial:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  workQ = self->_workQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__ACCAppLinksManager_handleEAAppLinksStateChangedForCertSerial___block_invoke;
  block[3] = &unk_100216A78;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQ, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__ACCAppLinksManager_handleEAAppLinksStateChangedForCertSerial___block_invoke(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  id v3 = +[NSArray array];
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = +[NSMutableOrderedSet orderedSet];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (!*(void *)(a1 + 32))
  {
LABEL_14:
    unsigned int v23 = 0;
    id v24 = 0;
    goto LABEL_41;
  }
  v51 = v5;
  v52 = v4;
  v49 = v3;
  v50 = WeakRetained;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v8 = +[ACCAppLinksManager sharedManager];
  id v9 = [v8 eaAppsSubscriberList];

  id v10 = v9;
  id v11 = [v9 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (!v11)
  {
LABEL_10:

LABEL_11:
    id v22 = logObjectForModule_8(49);
    uint64_t v7 = v50;
    id v5 = v51;
    id v3 = v49;
    id v4 = v52;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[#App Links] accessory NULL", buf, 2u);
    }

    goto LABEL_14;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v63;
LABEL_4:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v63 != v13) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = *(void *)(*((void *)&v62 + 1) + 8 * v14);
    v16 = +[ACCAppLinksManager sharedManager];
    BOOL v17 = [v16 eaAppsSubscriberList];
    uint64_t v18 = [v17 objectForKey:v15];

    id v19 = (void *)v18;
    int v20 = *(void **)(a1 + 32);
    id v21 = [v19 certSerial];
    LOBYTE(v20) = [v20 isEqualToData:v21];

    if (v20) {
      break;
    }

    if (v12 == (id)++v14)
    {
      id v12 = [v10 countByEnumeratingWithState:&v62 objects:v68 count:16];
      if (v12) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }

  if (!v19) {
    goto LABEL_11;
  }
  BOOL v25 = [v19 certSerial];

  id v5 = v51;
  id v4 = v52;
  if (v25)
  {
    v48 = v19;
    long long v26 = [v19 uuid];
    id v27 = _supportedAppLinksEAProtocols((uint64_t)v26);

    if (v27)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v28 = v27;
      id v29 = [v28 countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v58;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v58 != v31) {
              objc_enumerationMutation(v28);
            }
            char v33 = (void *)platform_system_copyInstalledApplicationsForExternalAccessoryProtocol(*(void *)(*((void *)&v57 + 1) + 8 * i));
            if (v33) {
              [v51 addObjectsFromArray:v33];
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v57 objects:v67 count:16];
        }
        while (v30);
      }
    }
    uint64_t v47 = v27;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v34 = v51;
    id v35 = [v34 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v54;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v54 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
          dispatch_source_t v40 = +[NSMutableDictionary dictionary];
          [v40 setObject:v39 forKey:@"CARApplicationBundleIdentifierKey"];
          long long v41 = (void *)platform_system_copyAppNameForBundleID(v39);
          if (v41)
          {
            [v40 setObject:v41 forKey:@"CARApplicationLocalizedNameKey"];
            [v2 addObject:v40];
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v36);
    }

    id v24 = v48;
    if ([v48 initialUpdateSent])
    {
      id v5 = v51;
      id v4 = v52;
      id v3 = v49;
      uint64_t v7 = v50;
    }
    else
    {
      uint64_t v7 = v50;
      uint64_t v42 = objc_msgSend(v50, "retrieveIconInformationForAppList:withIconSize:", v2, objc_msgSend(v48, "iconSize"));

      id v4 = v52;
      [v52 setObject:v42 forKey:@"appList"];
      v43 = [v48 subFeatureState];
      [v52 setObject:v43 forKey:@"appLinksState"];

      dispatch_time_t v44 = +[NSNumber numberWithUnsignedInteger:1];
      [v52 setObject:v44 forKey:@"appLinksSubFeature"];

      uint64_t v45 = [v48 uuid];
      accFeatureHandlers_invokeHandler(v45, 56, (uint64_t)v52);

      [v48 setInitialUpdateSent:1];
      id v3 = (void *)v42;
      id v5 = v51;
    }
    unsigned int v23 = v47;
  }
  else
  {
    id v24 = v19;
    char v46 = logObjectForModule_8(49);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[#App Links] accessory.certSerial NULL", buf, 2u);
    }

    unsigned int v23 = 0;
    id v3 = v49;
    uint64_t v7 = v50;
  }
LABEL_41:
}

- (NSMutableDictionary)carPlayAppsSubscriberList
{
  return self->_carPlayAppsSubscriberList;
}

- (void)setCarPlayAppsSubscriberList:(id)a3
{
}

- (NSMutableDictionary)eaAppsSubscriberList
{
  return self->_eaAppsSubscriberList;
}

- (void)setEaAppsSubscriberList:(id)a3
{
}

- (id)carPlayAppLinksStateDidChangeObserver
{
  return self->_carPlayAppLinksStateDidChangeObserver;
}

- (void)setCarPlayAppLinksStateDidChangeObserver:(id)a3
{
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQ, 0);
  objc_storeStrong(&self->_carPlayAppLinksStateDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_eaAppsSubscriberList, 0);

  objc_storeStrong((id *)&self->_carPlayAppsSubscriberList, 0);
}

- (void)requestAppLinksIconDataForBundleID:(os_log_t)log withIconSize:.cold.1(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[#App Links] App links icon info service did not finish within %d secs. Timeout has occurred", (uint8_t *)v1, 8u);
}

- (void)retrieveIconInformationForAppList:(unsigned char *)a1 withIconSize:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_7(a1, a2);
  OUTLINED_FUNCTION_2_8((void *)&_mh_execute_header, v2, v3, "[#App Links] Failed to initialize tempDict", v4);
}

- (void)retrieveIconInformationForAppList:(unsigned char *)a1 withIconSize:(unsigned char *)a2 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_7(a1, a2);
  OUTLINED_FUNCTION_2_8((void *)&_mh_execute_header, v2, v3, "[#App Links] BundleID == NULL", v4);
}

- (void)retrieveIconInformationForAppList:(unsigned char *)a1 withIconSize:(unsigned char *)a2 .cold.4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_7(a1, a2);
  OUTLINED_FUNCTION_2_8((void *)&_mh_execute_header, v2, v3, "[#App Links] Failed to initialize iconData", v4);
}

- (void)retrieveIconInformationForAppList:(unsigned char *)a1 withIconSize:(unsigned char *)a2 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3_7(a1, a2);
  OUTLINED_FUNCTION_2_8((void *)&_mh_execute_header, v2, v3, "[#App Links] Failed to initialize hashData", v4);
}

@end
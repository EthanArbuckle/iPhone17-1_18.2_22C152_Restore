@interface ACCPlatformUSBManager
+ (id)sharedManager;
- (ACCPlatformUSBManager)init;
- (BOOL)sendUSBNotificationForEndpointUUID:(id)a3 withMode:(id)a4 andFault:(id)a5 force:(BOOL)a6;
- (BOOL)setUSBFaultMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4;
- (BOOL)setUSBModeForEndpointUUID:(id)a3 newMode:(int)a4;
- (BOOL)setUSBModeMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4;
- (NSMutableArray)usbFaultSubscribers;
- (NSMutableArray)usbModeSubscribers;
- (NSMutableDictionary)subscriberList;
- (int)getCachedUSBFaultForEndpointUUID:(id)a3;
- (int)getCachedUSBModeForEndpointUUID:(id)a3;
- (int)getUSBModeForEndpointUUID:(id)a3;
- (void)addSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4;
- (void)removeSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4;
- (void)setSubscriberList:(id)a3;
- (void)setUsbFaultSubscribers:(id)a3;
- (void)setUsbModeSubscribers:(id)a3;
- (void)updateSubscriberForEndpointUUID:(id)a3 forFeature:(id)a4;
- (void)usbFaultOccurredHandler:(id)a3;
- (void)usbModeChangedHandler:(id)a3;
@end

@implementation ACCPlatformUSBManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__ACCPlatformUSBManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_10 != -1) {
    dispatch_once(&sharedManager_once_10, block);
  }
  v2 = (void *)sharedManager_sharedInstance_10;

  return v2;
}

uint64_t __38__ACCPlatformUSBManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_10 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (ACCPlatformUSBManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACCPlatformUSBManager;
  v2 = [(ACCPlatformUSBManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __29__ACCPlatformUSBManager_init__block_invoke;
    block[3] = &unk_1002158C8;
    v6 = v2;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
  }
  return v3;
}

id __29__ACCPlatformUSBManager_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v6 = *(void *)(a1 + 32);
  objc_super v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"USBModeSubscribers"];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v11 + 16);
  v12 = *(void **)(v11 + 24);

  return [v12 setObject:v13 forKey:@"USBFaultSubscribers"];
}

- (void)addSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (__CFString *)a4;
  objc_super v7 = v6;
  if (v5 && v6)
  {
    if (v6 == @"USBModeSubscribers")
    {
      CFStringRef v33 = @"USBModeCachedState";
      v15 = _getUSBModePluginInstance();
      v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 USBModeForEndpointUUID:v5]);
      v34 = v16;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

      id v31 = v5;
      v32 = v9;
      v12 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v17 = +[ACCPlatformUSBManager sharedManager];
      v18 = [v17 usbModeSubscribers];
      [v18 addObject:v12];

      v19 = +[ACCPlatformUSBManager sharedManager];
      v20 = [v19 subscriberList];
      v21 = +[ACCPlatformUSBManager sharedManager];
      v22 = [v21 usbModeSubscribers];
      [v20 setObject:v22 forKey:@"USBModeSubscribers"];
LABEL_17:

      goto LABEL_18;
    }
    if (v6 == @"USBFaultSubscribers")
    {
      id v8 = _getUSBFaultPluginInstance();
      uint64_t v9 = v8;
      if (v8)
      {
        if ([v8 getUSBFaultStateforType:2]) {
          uint64_t v10 = 2;
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v11 = +[NSNumber numberWithInt:v10];
        CFStringRef v29 = @"USBFaultCachedState";
        if (v11)
        {
          v12 = (void *)v11;
          int v13 = 0;
          v14 = (void *)v11;
LABEL_14:
          v30 = v14;
          v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          if (v13) {

          }
          id v27 = v5;
          v28 = v19;
          v20 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          v23 = +[ACCPlatformUSBManager sharedManager];
          v24 = [v23 usbFaultSubscribers];
          [v24 addObject:v20];

          v21 = +[ACCPlatformUSBManager sharedManager];
          v22 = [v21 subscriberList];
          v25 = +[ACCPlatformUSBManager sharedManager];
          v26 = [v25 usbFaultSubscribers];
          [v22 setObject:v26 forKey:@"USBFaultSubscribers"];

          goto LABEL_17;
        }
      }
      else
      {
        CFStringRef v29 = @"USBFaultCachedState";
      }
      v14 = +[NSNull null];
      v12 = 0;
      int v13 = 1;
      goto LABEL_14;
    }
  }
LABEL_18:
}

- (void)removeSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (__CFString *)a4;
  objc_super v7 = v6;
  if (v5 && v6)
  {
    if (v6 == @"USBModeSubscribers")
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v15 = +[ACCPlatformUSBManager sharedManager];
      v16 = [v15 usbModeSubscribers];

      id v10 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v10)
      {
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v16);
            }
            v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v20 = [v19 objectForKey:v5];

            if (v20)
            {
              id v10 = v19;
              goto LABEL_24;
            }
          }
          id v10 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      v21 = +[ACCPlatformUSBManager sharedManager];
      v22 = [v21 usbModeSubscribers];
      [v22 removeObject:v10];

      v23 = +[ACCPlatformUSBManager sharedManager];
      v24 = [v23 subscriberList];
      v25 = +[ACCPlatformUSBManager sharedManager];
      v26 = [v25 usbModeSubscribers];
      CFStringRef v27 = @"USBModeSubscribers";
      goto LABEL_27;
    }
    if (v6 == @"USBFaultSubscribers")
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = +[ACCPlatformUSBManager sharedManager];
      uint64_t v9 = [v8 usbFaultSubscribers];

      id v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v31;
        while (2)
        {
          for (j = 0; j != v10; j = (char *)j + 1)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v9);
            }
            int v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
            v14 = [v13 objectForKey:v5];

            if (v14)
            {
              id v10 = v13;
              goto LABEL_26;
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_26:

      v28 = +[ACCPlatformUSBManager sharedManager];
      CFStringRef v29 = [v28 usbFaultSubscribers];
      [v29 removeObject:v10];

      v23 = +[ACCPlatformUSBManager sharedManager];
      v24 = [v23 subscriberList];
      v25 = +[ACCPlatformUSBManager sharedManager];
      v26 = [v25 usbFaultSubscribers];
      CFStringRef v27 = @"USBFaultSubscribers";
LABEL_27:
      [v24 setObject:v26 forKey:v27];
    }
  }
}

- (void)updateSubscriberForEndpointUUID:(id)a3 forFeature:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    [(ACCPlatformUSBManager *)self removeSubscriberForEndpointUUID:v7 andFeature:v6];
    [(ACCPlatformUSBManager *)self addSubscriberForEndpointUUID:v7 andFeature:v6];
  }
}

- (int)getCachedUSBModeForEndpointUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v4 = +[ACCPlatformUSBManager sharedManager];
    id v5 = [v4 usbModeSubscribers];

    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKey:v3];
          uint64_t v11 = v10;
          if (v10)
          {
            v12 = [v10 objectForKey:@"USBModeCachedState"];
            if (v12)
            {
              v14 = v12;
              int v13 = [v12 intValue];

              goto LABEL_13;
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int v13 = -1;
LABEL_13:
  }
  else
  {
    int v13 = -1;
  }

  return v13;
}

- (int)getCachedUSBFaultForEndpointUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = +[ACCPlatformUSBManager sharedManager];
    id v5 = [v4 usbModeSubscribers];

    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKey:v3];
          id v10 = v9;
          if (v9)
          {
            uint64_t v11 = [v9 objectForKey:@"USBFaultCachedState"];
            if (v11)
            {
              v12 = v11;
              LODWORD(v6) = [v11 BOOLValue];

              goto LABEL_13;
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LODWORD(v6) = 0;
  }

  return (int)v6;
}

- (BOOL)sendUSBNotificationForEndpointUUID:(id)a3 withMode:(id)a4 andFault:(id)a5 force:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = 0;
  if (v10 && v11)
  {
    unsigned int v14 = [(ACCPlatformUSBManager *)self getCachedUSBModeForEndpointUUID:v10];
    unsigned int v15 = [(ACCPlatformUSBManager *)self getCachedUSBFaultForEndpointUUID:v10];
    unsigned int v16 = [v11 intValue];
    if (v16 == -1 || (unsigned int v17 = v16, v14 == v16) && !a6 && v15 == [v12 intValue])
    {
      char v13 = 0;
    }
    else
    {
      if (v17 == 2) {
        unsigned int v18 = 1;
      }
      else {
        unsigned int v18 = -1;
      }
      if (v17 == 1) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v18;
      }
      char v13 = platform_usb_send_notification(v10, +[NSNumber numberWithInt:v19], v12);
      [(ACCPlatformUSBManager *)self updateSubscriberForEndpointUUID:v10 forFeature:@"USBModeSubscribers"];
      [(ACCPlatformUSBManager *)self updateSubscriberForEndpointUUID:v10 forFeature:@"USBFaultSubscribers"];
    }
  }

  return v13;
}

- (int)getUSBModeForEndpointUUID:(id)a3
{
  id v3 = a3;
  v4 = _getUSBModePluginInstance();
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 USBModeForEndpointUUID:v3];
    if (v6 == 2) {
      int v7 = 1;
    }
    else {
      int v7 = -1;
    }
    if (v6 >= 2) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = -1;
  }
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_bluetooth_copyNameForMacAddress_cold_2();
    }
    id v11 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  else
  {
    id v11 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = v3;
    __int16 v15 = 2112;
    unsigned int v16 = v5;
    __int16 v17 = 1024;
    int v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[#USB] getUSBModeForEndpointUUID: %@, usbModePluginInstance=%@ usbMode=%d", (uint8_t *)&v13, 0x1Cu);
  }

  return v8;
}

- (BOOL)setUSBModeForEndpointUUID:(id)a3 newMode:(int)a4
{
  id v6 = a3;
  int v7 = _getUSBModePluginInstance();
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_bluetooth_copyNameForMacAddress_cold_2();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = v6;
    __int16 v23 = 1024;
    int v24 = a4;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[#USB] setUSBModeForEndpointUUID: %@ usbModeToSet=%d, usbModePluginInstance=%@", buf, 0x1Cu);
  }

  if (!v7) {
    goto LABEL_20;
  }
  unsigned int v11 = [v7 USBModeForEndpointUUID:v6];
  unsigned int v12 = v11;
  if ((a4 != 1 || v11 != 2) && (a4 || v11 != 1))
  {
    if (a4 == 1)
    {
      __int16 v15 = v7;
      uint64_t v16 = 1;
LABEL_22:
      unsigned __int8 v14 = [v15 setUSBMode:v16 forEndpointUUID:v6];
      goto LABEL_23;
    }
    if (!a4)
    {
      __int16 v15 = v7;
      uint64_t v16 = 0;
      goto LABEL_22;
    }
LABEL_20:
    unsigned __int8 v14 = 0;
    goto LABEL_23;
  }
  int v13 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __59__ACCPlatformUSBManager_setUSBModeForEndpointUUID_newMode___block_invoke;
  block[3] = &unk_100219CB8;
  void block[4] = self;
  id v19 = v6;
  unsigned int v20 = v12;
  dispatch_async(v13, block);

  unsigned __int8 v14 = 1;
LABEL_23:

  return v14;
}

void __59__ACCPlatformUSBManager_setUSBModeForEndpointUUID_newMode___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v1 sendUSBNotificationForEndpointUUID:v2 withMode:v3 andFault:0 force:1];
}

- (BOOL)setUSBModeMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = +[NSNotificationCenter defaultCenter];
  BOOL v8 = +[ACCPlatformUSBManager sharedManager];
  if (v4)
  {
    [v7 addObserver:v8 selector:"usbModeChangedHandler:" name:ACCPlatformUSBModePlugin_USBModeDidChangeNotification object:0];

    [(ACCPlatformUSBManager *)self addSubscriberForEndpointUUID:v6 andFeature:@"USBModeSubscribers"];
  }
  else
  {
    [v7 removeObserver:v8 name:ACCPlatformUSBModePlugin_USBModeDidChangeNotification object:0];

    [(ACCPlatformUSBManager *)self removeSubscriberForEndpointUUID:v6 andFeature:@"USBModeSubscribers"];
  }

  return 1;
}

- (BOOL)setUSBFaultMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = _getUSBFaultPluginInstance();
  BOOL v8 = v7;
  if (v7)
  {
    [v7 usbFaultMonitor:v4 forUUID:v6];
    id v9 = +[NSNotificationCenter defaultCenter];
    id v10 = +[ACCPlatformUSBManager sharedManager];
    if (v4)
    {
      [v9 addObserver:v10 selector:"usbFaultOccurredHandler:" name:ACCPlatformUSBFaultPlugin_USBFaultNotification object:0];

      [(ACCPlatformUSBManager *)self addSubscriberForEndpointUUID:v6 andFeature:@"USBFaultSubscribers"];
    }
    else
    {
      [v9 removeObserver:v10 name:ACCPlatformUSBFaultPlugin_USBFaultNotification object:0];

      [(ACCPlatformUSBManager *)self removeSubscriberForEndpointUUID:v6 andFeature:@"USBFaultSubscribers"];
    }
  }

  return v8 != 0;
}

- (void)usbModeChangedHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v8 = [v5 objectForKey:ACCPlatformUSBModePlugin_USBMode];

  id v6 = [v4 userInfo];

  int v7 = [v6 objectForKey:ACCPlatformUSBModePlugin_ConnectionUUID];

  [(ACCPlatformUSBManager *)self sendUSBNotificationForEndpointUUID:v7 withMode:v8 andFault:0 force:0];
}

- (void)usbFaultOccurredHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v10 = [v5 objectForKey:ACCPlatformUSBFaultPlugin_USBFaultNotification_ConnectionUUIDKey];

  id v6 = [v4 userInfo];

  int v7 = [v6 objectForKey:ACCPlatformUSBFaultPlugin_USBFaultNotification_FaultTypeKey];

  id v8 = _getUSBModePluginInstance();
  id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 USBModeForEndpointUUID:v10] != 0);
  [(ACCPlatformUSBManager *)self sendUSBNotificationForEndpointUUID:v10 withMode:v9 andFault:v7 force:0];
}

- (NSMutableArray)usbModeSubscribers
{
  return self->_usbModeSubscribers;
}

- (void)setUsbModeSubscribers:(id)a3
{
}

- (NSMutableArray)usbFaultSubscribers
{
  return self->_usbFaultSubscribers;
}

- (void)setUsbFaultSubscribers:(id)a3
{
}

- (NSMutableDictionary)subscriberList
{
  return self->_subscriberList;
}

- (void)setSubscriberList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriberList, 0);
  objc_storeStrong((id *)&self->_usbFaultSubscribers, 0);

  objc_storeStrong((id *)&self->_usbModeSubscribers, 0);
}

@end
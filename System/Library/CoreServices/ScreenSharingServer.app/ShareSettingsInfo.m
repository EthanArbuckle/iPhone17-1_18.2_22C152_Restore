@interface ShareSettingsInfo
+ (id)gatherSystemInfo;
@end

@implementation ShareSettingsInfo

+ (id)gatherSystemInfo
{
  id v312 = objc_alloc_init((Class)NSMutableDictionary);
  if (sub_100035448())
  {
    id v2 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "gather system info", buf, 2u);
    }
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 119, "+[ShareSettingsInfo gatherSystemInfo]", 7, 0, "gather system info");
  v3 = +[NSProcessInfo processInfo];
  unsigned int v4 = [v3 isLowPowerModeEnabled];

  if (v4)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "low power", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 213, "GetMiscFlags", 7, 0, "low power");
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v6 = TMIsAutomaticTimeEnabled();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "time server enabled %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 681, "DateTimeServerEnabled", 7, 0, "time server enabled %d", v6);
  if (v6)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "date and time server", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 219, "GetMiscFlags", 7, 0, "date and time server");
    uint64_t v5 = v5 | 8;
  }
  unsigned int v7 = +[CLLocationManager locationServicesEnabled];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "location services enabled %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 688, "LocationServicesEnabled", 7, 0, "location services enabled %d", v7);
  if (v7)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "location services", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 225, "GetMiscFlags", 7, 0, "location services");
    uint64_t v5 = v5 | 2;
  }
  v8 = objc_opt_new();
  unsigned int v9 = [v8 crossAppTrackingAllowed];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cross-app tracking enabled %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 697, "CrossAppTrackingEnabled", 7, 0, "cross-app tracking enabled %d", v9);

  if (v9)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cross-app tracking", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 231, "GetMiscFlags", 7, 0, "cross-app tracking");
    uint64_t v5 = v5 | 4;
  }
  v10 = +[BluetoothManager sharedInstance];
  unsigned int v11 = [v10 available];

  BOOL v12 = sub_100035448();
  if (v11)
  {
    if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BT is already available", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 820, "BluetoothEnabled", 7, 0, "BT is already available");
    v13 = +[BluetoothManager sharedInstance];
    unsigned int v14 = [v13 enabled];
  }
  else
  {
    if (v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BT not yet available, checking SCDynamicStore", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 825, "BluetoothEnabled", 7, 0, "BT not yet available, checking SCDynamicStore");
    v15 = SCDynamicStoreCreate(0, @"com.apple.ScreenSharing", 0, 0);
    v16 = v15;
    if (v15)
    {
      v17 = (void *)SCDynamicStoreCopyValue(v15, @"com.apple.MobileBluetooth");
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v17 description];
        id v19 = [v18 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SCDynamicStore shows: %s", buf, 0xCu);
      }
      id v20 = [v17 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 829, "BluetoothEnabled", 7, 0, "SCDynamicStore shows: %s", (const char *)[v20 UTF8String]);

      v21 = [v17 objectForKey:@"Powered"];
      v22 = v21;
      if (v21) {
        unsigned int v14 = [v21 BOOLValue];
      }
      else {
        unsigned int v14 = 0;
      }
      CFRelease(v16);
    }
    else
    {
      if (sub_100035448())
      {
        BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v23) {
          sub_10003751C(v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 838, "BluetoothEnabled", 3, 0, "unable to access SCDynamicStore");
      unsigned int v14 = 0;
    }
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bluetooth enabled: %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 842, "BluetoothEnabled", 7, 0, "Bluetooth enabled: %d", v14);
  if (v14)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bluetooth enabled", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 237, "GetMiscFlags", 7, 0, "bluetooth enabled");
    uint64_t v5 = v5 | 0x80;
  }
  id v31 = objc_alloc_init((Class)CWFInterface);
  [v31 activate];
  unsigned int v32 = [v31 powerOn];

  if (v32)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Wifi power state", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 244, "GetMiscFlags", 7, 0, "Wifi power state");
    uint64_t v5 = v5 | 0x40;
  }
  v33 = dispatch_get_global_queue(0, 0);
  id v34 = [objc_alloc((Class)IDSSignInController) initWithQueue:v33];
  unsigned int v35 = [v34 isFaceTimeEnabled];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v35;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FaceTimeEnabled returning %d", buf, 8u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 870, "FaceTimeEnabled", 7, 0, "FaceTimeEnabled returning %d", v35);

  if (v35)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FaceTime enabled", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 251, "GetMiscFlags", 7, 0, "FaceTime enabled");
    uint64_t v5 = v5 | 0x100;
  }
  id v36 = objc_alloc_init((Class)RadiosPreferences);
  unsigned int v37 = [v36 airplaneMode];

  if (v37)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Share Settings - Airplane mode is on", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 256, "GetMiscFlags", 7, 0, "Share Settings - Airplane mode is on");
    uint64_t v5 = v5 | 0x20;
  }
  id v38 = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  [v38 modeValue];
  int IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

  if (IsAutomatic)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Share Settings - Automatic appearance is on", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 261, "GetMiscFlags", 7, 0, "Share Settings - Automatic appearance is on");
    uint64_t v5 = v5 | 0x10;
  }
  v311 = +[NSNumber numberWithUnsignedInt:v5];
  [v312 setObject:v311 forKeyedSubscript:@"iOS-Misc"];
  v40 = +[DNDStateService serviceForClientIdentifier:@"com.apple.screensharingserver"];
  *(void *)&long long v337 = 0;
  v41 = [v40 queryCurrentStateWithError:&v337];
  id v42 = (id)v337;
  if (v42)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = [v42 code];
      id v44 = [v42 description];
      id v45 = [v44 UTF8String];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v45;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dnd state error code %ld  %s", buf, 0x16u);
    }
    id v46 = [v42 code];
    id v47 = [v42 description];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 599, "IsDNDEnabled", 7, 0, "dnd state error code %ld  %s", v46, (const char *)[v47 UTF8String]);
  }
  if (v41)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v48 = [v41 isActive];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v48;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dnd active %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 602, "IsDNDEnabled", 7, 0, "dnd active %d", [v41 isActive]);
    if ([v41 isActive]) {
      int v49 = 2;
    }
    else {
      int v49 = 0;
    }
    unsigned int v328 = v49;
  }
  else
  {
    unsigned int v328 = 0;
  }

  v50 = +[DNDModeConfigurationService serviceForClientIdentifier:@"com.apple.screensharingserver"];
  v51 = v50;
  if (v50)
  {
    id v336 = 0;
    id v324 = [v50 modeConfigurationsReturningError:&v336];
    id v52 = v336;
    if (v52)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v53 = [v52 description];
        id v54 = [v53 UTF8String];
        *(_DWORD *)v344 = 136315138;
        id v345 = v54;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error getting the mode configs %s", v344, 0xCu);
      }
      id v55 = [v52 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 623, "IsDNDScheduled", 7, 0, "Error getting the mode configs %s", (const char *)[v55 UTF8String]);

      int v56 = 0;
    }
    else
    {
      long long v342 = 0u;
      long long v343 = 0u;
      memset(v341, 0, sizeof(v341));
      obj = [v324 allValues];
      id v319 = [obj countByEnumeratingWithState:v341 objects:buf count:16];
      if (v319)
      {
        uint64_t v317 = **(void **)&v341[16];
        do
        {
          for (i = 0; i != v319; i = (char *)i + 1)
          {
            if (**(void **)&v341[16] != v317) {
              objc_enumerationMutation(obj);
            }
            v58 = [*(id *)(*(void *)&v341[8] + 8 * i) triggers];
            if ([v58 count])
            {
              long long v334 = 0u;
              long long v335 = 0u;
              long long v332 = 0u;
              long long v333 = 0u;
              id v59 = v58;
              id v60 = [v59 countByEnumeratingWithState:&v332 objects:&v337 count:16];
              if (v60)
              {
                uint64_t v61 = *(void *)v333;
                while (2)
                {
                  for (j = 0; j != v60; j = (char *)j + 1)
                  {
                    if (*(void *)v333 != v61) {
                      objc_enumerationMutation(v59);
                    }
                    v63 = *(void **)(*((void *)&v332 + 1) + 8 * (void)j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && [v63 isEnabled])
                    {

                      int v56 = 1;
                      goto LABEL_131;
                    }
                  }
                  id v60 = [v59 countByEnumeratingWithState:&v332 objects:&v337 count:16];
                  if (v60) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
          id v319 = [obj countByEnumeratingWithState:v341 objects:buf count:16];
          int v56 = 0;
        }
        while (v319);
      }
      else
      {
        int v56 = 0;
      }
LABEL_131:

      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v344 = 67109120;
        LODWORD(v345) = v56;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IsDNDScheduled = %d", v344, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 648, "IsDNDScheduled", 7, 0, "IsDNDScheduled = %d", v56);
    }

    if (v56) {
      v328 |= 1u;
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v344 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to get the mode service", v344, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 616, "IsDNDScheduled", 7, 0, "Unable to get the mode service");
  }
  v64 = +[DNDSettingsService serviceForClientIdentifier:@"com.apple.screensharingserver"];
  *(void *)&long long v337 = 0;
  v65 = [v64 behaviorSettingsReturningError:&v337];
  id v66 = (id)v337;
  if (v66)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v67 = [v66 code];
      id v68 = [v66 description];
      id v69 = [v68 UTF8String];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v69;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error getting behavior settings error = %ld  %s", buf, 0x16u);
    }
    id v70 = [v66 code];
    id v71 = [v66 description];
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 662, "IsDNDLockScreenOnly", 7, 0, "Error getting behavior settings error = %ld  %s", v70, (const char *)[v71 UTF8String]);

    BOOL v72 = 1;
  }
  else
  {
    [v65 interruptionBehaviorSetting];
    uint64_t v73 = DNDResolvedInterruptionBehaviorSetting();
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v73;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "behaviorSettings %ld InterruptWhenDeviceIsUnlocked %ld", buf, 0x16u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 667, "IsDNDLockScreenOnly", 7, 0, "behaviorSettings %ld InterruptWhenDeviceIsUnlocked %ld", v73, 2);
    BOOL v72 = v73 != 2;
  }

  if (v72) {
    uint64_t v74 = v328;
  }
  else {
    uint64_t v74 = v328 | 4;
  }
  v310 = +[NSNumber numberWithUnsignedInt:v74];
  [v312 setObject:v310 forKeyedSubscript:@"iOS-DND"];
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v75 = _AXSVoiceOverTouchEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v75;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "VoiceOverEnabled %d", buf, 8u);
  }
  int v76 = _AXSVoiceOverTouchEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 357, "GetAccessibilityFlags", 7, 0, "VoiceOverEnabled %d", v76);
  int v77 = _AXSVoiceOverTouchEnabled();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v78 = _AXSZoomTouchEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v78;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_AXSZoomTouchEnabled %d", buf, 8u);
  }
  int v79 = _AXSZoomTouchEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 361, "GetAccessibilityFlags", 7, 0, "_AXSZoomTouchEnabled %d", v79);
  int v80 = _AXSZoomTouchEnabled();
  v81 = (void *)_AXSTripleClickCopyOptions();
  unsigned int v82 = [v81 containsObject:&off_100056B18];

  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v83 = _AXSAssistiveTouchEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v83;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AssistiveTouchEnabled %d", buf, 8u);
  }
  int v84 = _AXSAssistiveTouchEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 368, "GetAccessibilityFlags", 7, 0, "AssistiveTouchEnabled %d", v84);
  int v85 = _AXSAssistiveTouchEnabled();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v86 = _AXSAssistiveTouchEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v86;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_AXSAssistiveTouchEnabled %d", buf, 8u);
  }
  int v87 = _AXSAssistiveTouchEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 372, "GetAccessibilityFlags", 7, 0, "_AXSAssistiveTouchEnabled %d", v87);
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v88 = _AXSCommandAndControlEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v88;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CommandAndControlEnabled() %d", buf, 8u);
  }
  int v89 = _AXSCommandAndControlEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 373, "GetAccessibilityFlags", 7, 0, "CommandAndControlEnabled() %d", v89);
  int v90 = _AXSCommandAndControlEnabled();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v91 = _AXSGuidedAccessEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v91;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "GuidedAccessEnabled %d", buf, 8u);
  }
  int v92 = _AXSGuidedAccessEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 377, "GetAccessibilityFlags", 7, 0, "GuidedAccessEnabled %d", v92);
  int v93 = _AXSGuidedAccessEnabled();
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v94 = _AXSAutoBrightnessEnabled();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v94;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Share settings - AutoBrightnessEnabled: %d", buf, 8u);
  }
  unsigned int v95 = v77 != 0;
  if (v80) {
    v95 |= 2u;
  }
  if (v82) {
    v95 |= 4u;
  }
  if (v85) {
    v95 |= 8u;
  }
  if (v90) {
    v95 |= 0x10u;
  }
  if (v93) {
    unsigned int v96 = v95 | 0x20;
  }
  else {
    unsigned int v96 = v95;
  }
  int v97 = _AXSAutoBrightnessEnabled();
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 385, "GetAccessibilityFlags", 7, 0, "Share settings - AutoBrightnessEnabled: %d", v97);
  if (_AXSAutoBrightnessEnabled()) {
    uint64_t v98 = v96 | 0x40;
  }
  else {
    uint64_t v98 = v96;
  }
  v309 = +[NSNumber numberWithUnsignedInt:v98];
  [v312 setObject:v309 forKeyedSubscript:@"iOS-Access"];
  id v99 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  *(void *)&long long v337 = 0;
  *((void *)&v337 + 1) = &v337;
  *(void *)&long long v338 = 0x2020000000;
  DWORD2(v338) = 1;
  if (v99)
  {
    v100 = dispatch_group_create();
    id v101 = objc_alloc((Class)NSSet);
    id v102 = objc_msgSend(v101, "initWithObjects:", off_10005C5A0, 0);
    dispatch_group_enter(v100);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100033254;
    v347 = &unk_100054DA0;
    v349 = &v337;
    v103 = v100;
    v348 = v103;
    [v99 getLocalPolicies:v102 completion:buf];
    dispatch_time_t v104 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v103, v104))
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v341 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out trying to get cellular data state", v341, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 785, "MailUseCellularData", 7, 0, "Timed out trying to get cellular data state");
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to contact the CoreTelephonyClient", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 790, "MailUseCellularData", 7, 0, "Failed to contact the CoreTelephonyClient");
  }
  int v307 = *(_DWORD *)(*((void *)&v337 + 1) + 24);
  _Block_object_dispose(&v337, 8);

  id v105 = objc_alloc_init((Class)ACAccountStore);
  uint64_t v306 = ACAccountDataclassMail;
  v106 = objc_msgSend(v105, "accountIdentifiersEnabledForDataclass:");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v107 = [v106 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v107;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "accounts size %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 481, "GetMailAccountsInfo", 7, 0, "accounts size %ld", [v106 count]);
  long long v339 = 0u;
  long long v340 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  id v329 = v106;
  id v108 = [v329 countByEnumeratingWithState:&v337 objects:buf count:16];
  if (v108)
  {
    int v315 = 0;
    int v318 = 0;
    int v313 = 0;
    uint64_t v109 = *(void *)v338;
    id v325 = (id)ACAccountTypeIdentifierSMTP;
    do
    {
      for (k = 0; k != v108; k = (char *)k + 1)
      {
        if (*(void *)v338 != v109) {
          objc_enumerationMutation(v329);
        }
        v111 = [v105 accountWithIdentifier:*(void *)(*((void *)&v337 + 1) + 8 * (void)k)];
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v112 = [v111 accountType];
          id v113 = [v112 identifier];
          id v114 = [v113 UTF8String];
          *(_DWORD *)v341 = 136315138;
          *(void *)&v341[4] = v114;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "id %s", v341, 0xCu);
        }
        v115 = [v111 accountType];
        id v116 = [v115 identifier];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 487, "GetMailAccountsInfo", 7, 0, "id %s", (const char *)[v116 UTF8String]);

        v117 = [v111 enabledDataclasses];
        if ([v117 containsObject:@"com.apple.Dataclass.Mail"])
        {
          v118 = [v111 accountType];
          v119 = [v118 identifier];
          unsigned int v120 = [v119 isEqualToString:v325];

          BOOL v121 = sub_100035448();
          if (v120)
          {
            if (v121 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v122 = [v111 accountDescription];
              id v123 = [v122 UTF8String];
              *(_DWORD *)v341 = 136315138;
              *(void *)&v341[4] = v123;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s ignore this smtp account", v341, 0xCu);
            }
            id v124 = [v111 accountDescription];
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 493, "GetMailAccountsInfo", 7, 0, "%s ignore this smtp account", (const char *)[v124 UTF8String]);
          }
          else
          {
            if (v121 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v125 = [v111 accountDescription];
              id v126 = [v125 UTF8String];
              v127 = [v111 accountType];
              id v128 = [v127 identifier];
              id v129 = [v128 UTF8String];
              *(_DWORD *)v341 = 136315394;
              *(void *)&v341[4] = v126;
              *(_WORD *)&v341[12] = 2080;
              *(void *)&v341[14] = v129;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s identifier %s contains mail", v341, 0x16u);
            }
            id v130 = [v111 accountDescription];
            v131 = (const char *)[v130 UTF8String];
            v132 = [v111 accountType];
            id v133 = [v132 identifier];
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 497, "GetMailAccountsInfo", 7, 0, "%s identifier %s contains mail", v131, (const char *)[v133 UTF8String]);

            v134 = [v111 accountType];
            v135 = [v134 identifier];
            LODWORD(v132) = [v135 isEqualToString:@"com.apple.account.Yahoo"];

            if (v132)
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v341 = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Yahoo mail account", v341, 2u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 501, "GetMailAccountsInfo", 7, 0, "Yahoo mail account");
              int v318 = 1;
            }
            else
            {
              v136 = [v111 accountType];
              v137 = [v136 identifier];
              unsigned int v138 = [v137 isEqualToString:@"com.apple.account.Google"];

              if (v138)
              {
                if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v341 = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Gmail mail account", v341, 2u);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 506, "GetMailAccountsInfo", 7, 0, "Gmail mail account");
                int v315 = 1;
              }
              else
              {
                v139 = [v111 accountType];
                v140 = [v139 identifier];
                int v141 = [v140 isEqualToString:@"com.apple.account.OnMyDevice"];

                if ((v141 & 1) == 0)
                {
                  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v341 = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "other mail account", v341, 2u);
                  }
                  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 511, "GetMailAccountsInfo", 7, 0, "other mail account");
                  int v313 = 1;
                }
              }
            }
          }
        }
      }
      id v108 = [v329 countByEnumeratingWithState:&v337 objects:buf count:16];
    }
    while (v108);
  }
  else
  {
    int v315 = 0;
    int v318 = 0;
    int v313 = 0;
  }

  id v330 = objc_alloc_init((Class)ACAccountStore);
  uint64_t v305 = ACAccountDataclassContacts;
  v142 = objc_msgSend(v330, "accountIdentifiersEnabledForDataclass:");
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v143 = [v142 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v143;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "accounts size %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 547, "GetContactsAccountsInfo", 7, 0, "accounts size %ld", [v142 count]);
  long long v339 = 0u;
  long long v340 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  id v326 = v142;
  id v144 = [v326 countByEnumeratingWithState:&v337 objects:buf count:16];
  if (v144)
  {
    int v316 = 0;
    int obja = 0;
    int v314 = 0;
    uint64_t v145 = *(void *)v338;
    do
    {
      for (m = 0; m != v144; m = (char *)m + 1)
      {
        if (*(void *)v338 != v145) {
          objc_enumerationMutation(v326);
        }
        v147 = [v330 accountWithIdentifier:*(void *)(*((void *)&v337 + 1) + 8 * (void)m)];
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v148 = [v147 accountType];
          id v149 = [v148 identifier];
          id v150 = [v149 UTF8String];
          *(_DWORD *)v341 = 136315138;
          *(void *)&v341[4] = v150;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "id %s", v341, 0xCu);
        }
        v151 = [v147 accountType];
        id v152 = [v151 identifier];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 551, "GetContactsAccountsInfo", 7, 0, "id %s", (const char *)[v152 UTF8String]);

        v153 = [v147 enabledDataclasses];
        if ([v153 containsObject:@"com.apple.Dataclass.Contacts"])
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v154 = [v147 accountDescription];
            id v155 = [v154 UTF8String];
            v156 = [v147 accountType];
            id v157 = [v156 identifier];
            id v158 = [v157 UTF8String];
            *(_DWORD *)v341 = 136315394;
            *(void *)&v341[4] = v155;
            *(_WORD *)&v341[12] = 2080;
            *(void *)&v341[14] = v158;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s identifier %s contains contacts", v341, 0x16u);
          }
          id v159 = [v147 accountDescription];
          v160 = (const char *)[v159 UTF8String];
          v161 = [v147 accountType];
          id v162 = [v161 identifier];
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 555, "GetContactsAccountsInfo", 7, 0, "%s identifier %s contains contacts", v160, (const char *)[v162 UTF8String]);

          v163 = [v147 accountType];
          v164 = [v163 identifier];
          LODWORD(v162) = [v164 isEqualToString:@"com.apple.account.Yahoo"];

          if (v162)
          {
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v341 = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Yahoo contacts account", v341, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 559, "GetContactsAccountsInfo", 7, 0, "Yahoo contacts account");
            int obja = 1;
          }
          else
          {
            v165 = [v147 accountType];
            v166 = [v165 identifier];
            unsigned int v167 = [v166 isEqualToString:@"com.apple.account.Google"];

            if (v167)
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v341 = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Gmail contacts account", v341, 2u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 564, "GetContactsAccountsInfo", 7, 0, "Gmail contacts account");
              int v316 = 1;
            }
            else
            {
              v168 = [v147 accountType];
              v169 = [v168 identifier];
              int v170 = [v169 isEqualToString:@"com.apple.account.OnMyDevice"];

              if ((v170 & 1) == 0)
              {
                if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v341 = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "other contacts account", v341, 2u);
                }
                sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 569, "GetContactsAccountsInfo", 7, 0, "other contacts account");
                int v314 = 1;
              }
            }
          }
        }
      }
      id v144 = [v326 countByEnumeratingWithState:&v337 objects:buf count:16];
    }
    while (v144);
  }
  else
  {
    int v316 = 0;
    int obja = 0;
    int v314 = 0;
  }
  int v171 = v307 != 0;
  if (v315) {
    v171 |= 2u;
  }
  if (v318) {
    v171 |= 8u;
  }
  if (v313) {
    int v172 = v171 | 0x20;
  }
  else {
    int v172 = v171;
  }

  unsigned int v173 = v172 | 4;
  if (!v316) {
    unsigned int v173 = v172;
  }
  if (obja) {
    v173 |= 0x10u;
  }
  if (v314) {
    uint64_t v174 = v173 | 0x40;
  }
  else {
    uint64_t v174 = v173;
  }
  id v327 = +[NSNumber numberWithUnsignedInt:v174];
  [v312 setObject:v327 forKeyedSubscript:@"iOS-Accounts"];
  id v175 = objc_alloc_init((Class)ACAccountStore);
  v176 = objc_msgSend(v175, "aa_primaryAppleAccountWithPreloadedDataclasses");
  v177 = v176;
  if (v176)
  {
    v178 = [v176 enabledDataclasses];
    unsigned int v179 = [v178 containsObject:ACAccountDataclassUbiquity];

    v180 = [v177 enabledDataclasses];
    unsigned int v181 = [v180 containsObject:ACAccountDataclassCloudPhotos];

    if (v181) {
      int v182 = v179 | 2;
    }
    else {
      int v182 = v179;
    }
    v183 = [v177 enabledDataclasses];
    unsigned int v184 = [v183 containsObject:v306];

    if (v184) {
      v182 |= 4u;
    }
    v185 = [v177 enabledDataclasses];
    unsigned int v186 = [v185 containsObject:v305];

    if (v186) {
      v182 |= 8u;
    }
    v187 = [v177 enabledDataclasses];
    unsigned int v188 = [v187 containsObject:ACAccountDataclassCalendars];

    if (v188) {
      v182 |= 0x10u;
    }
    v189 = [v177 enabledDataclasses];
    unsigned int v190 = [v189 containsObject:ACAccountDataclassReminders];

    if (v190) {
      v182 |= 0x20u;
    }
    v191 = [v177 enabledDataclasses];
    unsigned int v192 = [v191 containsObject:ACAccountDataclassMessages];

    if (v192) {
      v182 |= 0x40u;
    }
    v193 = [v177 enabledDataclasses];
    unsigned int v194 = [v193 containsObject:ACAccountDataclassBookmarks];

    if (v194) {
      v182 |= 0x80u;
    }
    v195 = [v177 enabledDataclasses];
    unsigned int v196 = [v195 containsObject:ACAccountDataclassBackup];

    if (v196) {
      int v197 = v182 | 0x100;
    }
    else {
      int v197 = v182;
    }
    id v198 = objc_alloc_init((Class)OTConfigurationContext);
    [v198 setContext:OTDefaultContext];
    id v199 = [objc_alloc((Class)OTClique) initWithContextData:v198];
    v200 = v199;
    if (v199)
    {
      *(void *)buf = 0;
      unsigned __int8 v201 = [v199 fetchUserControllableViewsSyncingEnabled:buf];
      id v202 = *(id *)buf;
      if (v202)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100037488(v202);
        }
        id v203 = [v202 description];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 718, "CloudKeychainEnabled", 3, 0, "fetchUserControllableViewsSyncingEnabled failed %s", (const char *)[v203 UTF8String]);
      }
      if (v201) {
        v197 |= 0x200u;
      }
    }
    else
    {
      if (sub_100035448())
      {
        BOOL v205 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v205) {
          sub_10003744C(v205, v206, v207, v208, v209, v210, v211, v212);
        }
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 712, "CloudKeychainEnabled", 3, 0, "failed to create an OTClique, unable to return keychain sync info");
    }
    v213 = [v177 enabledDataclasses];
    unsigned int v214 = [v213 containsObject:ACAccountDataclassNotes];

    if (v214) {
      unsigned int v215 = v197 | 0x400;
    }
    else {
      unsigned int v215 = v197;
    }
    *(void *)&long long v337 = 0;
    *((void *)&v337 + 1) = &v337;
    *(void *)&long long v338 = 0x2020000000;
    *((void *)&v338 + 1) = 4;
    v216 = dispatch_group_create();
    dispatch_group_enter(v216);
    v217 = +[FMDFMIPManager sharedInstance];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000333F8;
    v347 = &unk_100054DC8;
    v349 = &v337;
    v218 = v216;
    v348 = v218;
    [v217 fmipStateWithCompletion:buf];

    dispatch_time_t v219 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v218, v219))
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v341 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out trying to get FMD state", v341, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 744, "FindMyDeviceEnabled", 7, 0, "Timed out trying to get FMD state");
    }
    BOOL v220 = *(void *)(*((void *)&v337 + 1) + 24) == 1;

    _Block_object_dispose(&v337, 8);
    if (v220) {
      uint64_t v204 = v215 | 0x800;
    }
    else {
      uint64_t v204 = v215;
    }
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No iCloud Account set up", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 428, "GetICloudFlags", 7, 0, "No iCloud Account set up");
    uint64_t v204 = 0;
  }

  objb = +[NSNumber numberWithUnsignedInt:v204];
  [v312 setObject:objb forKeyedSubscript:@"iOS-iCloud"];
  v221 = (const void *)_CTServerConnectionCreateWithIdentifier();
  if (!v221)
  {
    if (sub_100035448())
    {
      BOOL v225 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v225) {
        sub_100037384(v225, v226, v227, v228, v229, v230, v231, v232);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 937, "CellularDataEnabled", 3, 0, "failed to make a connection to CTServer");
    goto LABEL_338;
  }
  buf[0] = 0;
  unint64_t IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  if (IsEnabled)
  {
    int v223 = IsEnabled;
    unint64_t v224 = HIDWORD(IsEnabled);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000373C0(v223, v224);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 931, "CellularDataEnabled", 3, 0, "_CTServerConnectionGetCellularDataIsEnabled returns %d:%d", v223, v224);
    CFRelease(v221);
    goto LABEL_338;
  }
  int v260 = buf[0];
  CFRelease(v221);
  if (!v260)
  {
LABEL_338:
    uint64_t v233 = 0;
    goto LABEL_339;
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cellular Data Enabled", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 580, "GetCellularFlags", 7, 0, "Cellular Data Enabled");
  uint64_t v233 = 1;
LABEL_339:
  id v234 = objc_alloc_init((Class)CoreTelephonyClient);
  v235 = v234;
  if (v234)
  {
    *(void *)&long long v337 = 0;
    v236 = [v234 getCurrentDataServiceDescriptorSync:&v337];
    id v237 = (id)v337;
    v238 = v237;
    if (!v236 || v237)
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v257 = [v238 description];
        id v258 = [v257 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v258;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SelectedPlanDataRoamingEnabled: no data service descriptor available, error = %s", buf, 0xCu);
      }
      id v259 = [v238 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 987, "SelectedPlanDataRoamingEnabled", 6, 0, "SelectedPlanDataRoamingEnabled: no data service descriptor available, error = %s", (const char *)[v259 UTF8String]);
    }
    else
    {
      *(void *)v341 = 0;
      unsigned int v239 = [v235 getInternationalDataAccessSync:v236 error:v341];
      id v240 = *(id *)v341;
      if (v240)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000372F0(v240);
        }
        id v241 = [v240 description];
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 981, "SelectedPlanDataRoamingEnabled", 3, 0, "SelectedPlanDataRoamingEnabled: failed to get the roaming enabled value, error = %s", (const char *)[v241 UTF8String]);
      }
      if (v239)
      {
        id v242 = objc_alloc_init((Class)CoreTelephonyClient);
        v243 = v242;
        if (v242)
        {
          *(void *)buf = 0;
          v244 = [v242 getActiveContexts:buf];
          id v245 = *(id *)buf;
          if (v244)
          {
            v246 = [v244 subscriptions];
            BOOL v247 = (unint64_t)[v246 count] > 1;

            if (v247)
            {

              int v248 = 4;
LABEL_375:
              uint64_t v233 = v248 | v233;
              goto LABEL_376;
            }
          }
          else
          {
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10003725C(v245);
            }
            id v269 = [v245 description];
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 959, "isMultiSim", 3, 0, "isMultiSim: error getting activeContexts, error = %s", (const char *)[v269 UTF8String]);
          }
        }
        else
        {
          if (sub_100035448())
          {
            BOOL v261 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v261) {
              sub_100037220(v261, v262, v263, v264, v265, v266, v267, v268);
            }
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 964, "isMultiSim", 3, 0, "isMultiSim: Failed to get the CoreTelephonyClient");
        }

        int v248 = 2;
        goto LABEL_375;
      }
    }
  }
  else
  {
    if (sub_100035448())
    {
      BOOL v249 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v249) {
        sub_1000371E4(v249, v250, v251, v252, v253, v254, v255, v256);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 992, "SelectedPlanDataRoamingEnabled", 3, 0, "SelectedPlanDataRoamingEnabled: Failed to get the CoreTelephonyClient");
  }
LABEL_376:
  v320 = +[NSNumber numberWithUnsignedInt:v233];
  [v312 setObject:v320 forKeyedSubscript:@"iOS-Cellular"];
  [v312 setObject:&off_100056B00 forKeyedSubscript:@"version"];
  id v331 = (id)MGCopyAnswer();
  if ((unint64_t)[v331 length] < 0x33)
  {
    [v312 setObject:v331 forKeyedSubscript:@"ComputerName"];
  }
  else
  {
    id v270 = objc_msgSend(v331, "rangeOfComposedCharacterSequencesForRange:", 0, 50);
    v272 = objc_msgSend(v331, "substringWithRange:", v270, v271);
    [v312 setObject:v272 forKeyedSubscript:@"ComputerName"];
  }
  [v312 setObject:@"iOS" forKeyedSubscript:@"os"];
  v273 = +[NSProcessInfo processInfo];
  v274 = [v273 operatingSystemVersionString];
  [v312 setObject:v274 forKeyedSubscript:@"OSVersion"];

  v275 = (void *)MGCopyAnswer();
  [v312 setObject:v275 forKeyedSubscript:@"ComputerName"];

  v276 = (void *)MGCopyAnswer();
  [v312 setObject:v276 forKeyedSubscript:@"ComputerModel"];

  [v312 setObject:@"mobile" forKeyedSubscript:@"ShortUserName"];
  CFTypeRef v277 = sub_10003353C();
  if (v277)
  {
    [v312 setObject:v277 forKeyedSubscript:@"SerialNumber"];
    CFRelease(v277);
  }
  else
  {
    if (sub_100035448())
    {
      id v278 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to get serial number", buf, 2u);
      }
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 179, "+[ShareSettingsInfo gatherSystemInfo]", 7, 0, "unable to get serial number");
  }
  if (CKMadridSendAsSMSEnabled())
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messages - send as SMS", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 523, "GetMessagesFlags", 7, 0, "messages - send as SMS");
    uint64_t v279 = 2;
  }
  else
  {
    uint64_t v279 = 0;
  }
  if (CKMessageUnknownFilteringEnabled())
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messages - filter unknown", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 528, "GetMessagesFlags", 7, 0, "messages - filter unknown");
    uint64_t v279 = v279 | 4;
  }
  v280 = +[IMCTSubscriptionUtilities sharedInstance];
  int HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  BOOL v282 = sub_100035448();
  if (!HasMultipleSubscriptions)
  {
    if (v282 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Has a single SIM", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 895, "GetMMSEnabled", 7, 0, "Has a single SIM");
    *(void *)buf = 0;
    id v284 = [v280 ctSubscriptionInfoWithError:buf];
    id v293 = *(id *)buf;
    if (v284)
    {
      v294 = [v284 preferredOrDefaultSubscriptionContext];
      id v295 = v294;
      if (v294)
      {
        v296 = [v294 phoneNumber];
        v297 = [v295 labelID];
        unsigned int v292 = +[IMCTSMSUtilities IMMMSEnabledForPhoneNumber:v296 simID:v297];

LABEL_423:
        goto LABEL_424;
      }
    }
    else
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100037150(v293);
      }
      id v295 = [v293 description];
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 909, "GetMMSEnabled", 3, 0, "error getting the active subscription %s", (const char *)[v295 UTF8String]);
    }
    unsigned int v292 = 0;
    goto LABEL_423;
  }
  if (v282 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Has multiple SIMs", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 884, "GetMMSEnabled", 7, 0, "Has multiple SIMs");
  v283 = [v280 ctServiceSubscriptions];
  long long v339 = 0u;
  long long v340 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  id v284 = v283;
  id v285 = [v284 countByEnumeratingWithState:&v337 objects:buf count:16];
  if (v285)
  {
    uint64_t v286 = *(void *)v338;
    while (2)
    {
      for (n = 0; n != v285; n = (char *)n + 1)
      {
        if (*(void *)v338 != v286) {
          objc_enumerationMutation(v284);
        }
        v288 = *(void **)(*((void *)&v337 + 1) + 8 * (void)n);
        v289 = [v288 phoneNumber];
        v290 = [v288 labelID];
        unsigned __int8 v291 = +[IMCTSMSUtilities IMMMSEnabledForPhoneNumber:v289 simID:v290];

        if (v291)
        {
          unsigned int v292 = 1;
          goto LABEL_417;
        }
      }
      id v285 = [v284 countByEnumeratingWithState:&v337 objects:buf count:16];
      if (v285) {
        continue;
      }
      break;
    }
  }
  unsigned int v292 = 0;
LABEL_417:
  id v293 = v284;
LABEL_424:

  if (v292)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "messages - MMS enabled", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 533, "GetMessagesFlags", 7, 0, "messages - MMS enabled");
    uint64_t v279 = v279 | 8;
  }
  v298 = +[NSNumber numberWithUnsignedInt:v279];
  [v312 setObject:v298 forKeyedSubscript:@"iOS-Messages"];

  if (sub_100035448())
  {
    id v299 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v300 = [v312 description];
      id v301 = [v300 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v301;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#system info %s", buf, 0xCu);
    }
  }
  id v302 = [v312 description];
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/ShareSettingsInfo.m", 110, 186, "+[ShareSettingsInfo gatherSystemInfo]", 7, 0, "#system info %s", (const char *)[v302 UTF8String]);

  id v303 = v312;
  return v303;
}

@end
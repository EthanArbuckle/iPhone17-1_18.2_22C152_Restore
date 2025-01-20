@interface ComponentAirPodsBase
- (BOOL)_isBeatsDevice:(id)a3;
- (BOOL)spatialAudioEnabled;
- (BOOL)spatialAudioSupportedForDevice:(id)a3;
- (BluetoothManager)btManager;
- (ComponentAirPodsBase)init;
- (OS_dispatch_semaphore)btManagerAvailableSemaphore;
- (id)aacpInfoFromAccessoryInfo:(id)a3;
- (id)audioOutputForDevice:(id)a3;
- (id)budSide:(id)a3;
- (id)caseInfoFromAccessoryInfo:(id)a3;
- (id)generationStringForProductId:(unsigned int)a3;
- (id)getAutoEQStateForDevice:(id)a3;
- (id)getBatteryInfoForAddress:(id)a3;
- (id)getCBDevices;
- (id)getPairedAppleAudioDevices;
- (id)inEarStatusForDevice:(id)a3;
- (id)microphoneCalibrationResultForDevice:(id)a3;
- (id)stringForInEarStatus:(int)a3;
- (id)stringForListeningMode:(unsigned int)a3;
- (void)addEnumValueIfNotZero:(int64_t)a3 forKey:(id)a4 toDictionary:(id)a5;
- (void)addObjectIfNotNil:(id)a3 forKey:(id)a4 toDictionary:(id)a5;
- (void)setBtManager:(id)a3;
- (void)setBtManagerAvailableSemaphore:(id)a3;
@end

@implementation ComponentAirPodsBase

- (ComponentAirPodsBase)init
{
  v10.receiver = self;
  v10.super_class = (Class)ComponentAirPodsBase;
  v2 = [(ComponentAirPodsBase *)&v10 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    btManagerAvailableSemaphore = v2->_btManagerAvailableSemaphore;
    v2->_btManagerAvailableSemaphore = (OS_dispatch_semaphore *)v3;

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000386F4;
    v8[3] = &unk_100084A38;
    v9 = v2;
    v5 = objc_retainBlock(v8);
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    if (label == dispatch_queue_get_label(0))
    {
      ((void (*)(void *))v5[2])(v5);
    }
    else
    {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }
  return v2;
}

- (id)getPairedAppleAudioDevices
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = [(ComponentAirPodsBase *)self btManager];
  v6 = [v5 pairedDevices];
  [v4 addObjectsFromArray:v6];

  v7 = [(ComponentAirPodsBase *)self btManager];
  v8 = [v7 connectedDevices];
  [v4 addObjectsFromArray:v8];

  v9 = [(ComponentAirPodsBase *)self btManager];
  objc_super v10 = [v9 connectingDevices];
  [v4 addObjectsFromArray:v10];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v23;
    *(void *)&long long v13 = 138412290;
    long long v21 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (((objc_msgSend(v17, "isAppleAudioDevice", v21, (void)v22) & 1) != 0
           || [(ComponentAirPodsBase *)self _isBeatsDevice:v17])
          && ([v3 containsObject:v17] & 1) == 0)
        {
          v18 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Supported Apple Audio device found: %@", buf, 0xCu);
          }

          [v3 addObject:v17];
        }
      }
      id v14 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v14);
  }

  if (![v3 count])
  {
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "No supported Apple Audio Devices found", buf, 2u);
    }
  }

  return v3;
}

- (id)getCBDevices
{
  id v17 = 0;
  v2 = +[CBDiscovery devicesWithDiscoveryFlags:0x80000200000 error:&v17];
  id v3 = v17;
  id v4 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 serialNumber:v13];
        if (v11) {
          [v4 setObject:v10 forKey:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)audioOutputForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v3 getAdaptiveVolumeSupport])
  {
    unsigned int v5 = [v3 getAdaptiveVolumeMode];
    if (v5 == 2) {
      CFStringRef v6 = @"Disabled";
    }
    else {
      CFStringRef v6 = @"Unknown";
    }
    if (v5 == 1) {
      CFStringRef v7 = @"Enabled";
    }
    else {
      CFStringRef v7 = v6;
    }
    [v4 setObject:v7 forKeyedSubscript:@"PersonalizedVolume"];
  }
  if ([v3 getConversationDetectSupport])
  {
    unsigned int v8 = [v3 getConversationDetectMode];
    if (v8 == 2) {
      CFStringRef v9 = @"Disabled";
    }
    else {
      CFStringRef v9 = @"Unknown";
    }
    if (v8 == 1) {
      CFStringRef v10 = @"Enabled";
    }
    else {
      CFStringRef v10 = v9;
    }
    [v4 setObject:v10 forKeyedSubscript:@"ConversationAwareness"];
  }
  id v11 = +[HUAccessoryHearingSettings sharedInstance];
  id v12 = [v3 address];
  unsigned int v13 = [v11 activeHearingProtectionAvailableForAddress:v12];

  if (v13)
  {
    long long v14 = +[HUAccessoryHearingSettings sharedInstance];
    long long v15 = [v3 address];
    unsigned int v16 = [v14 activeHearingProtectionEnabledForAddress:v15];

    if (v16) {
      CFStringRef v17 = @"Enabled";
    }
    else {
      CFStringRef v17 = @"Disabled";
    }
    [v4 setObject:v17 forKeyedSubscript:@"LoudSoundReduction"];
  }

  return v4;
}

- (id)inEarStatusForDevice:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = 0;
  [v4 inEarStatusPrimary:(char *)&v9 + 4 secondary:&v9];

  CFStringRef v6 = [(ComponentAirPodsBase *)self stringForInEarStatus:HIDWORD(v9)];
  [v5 setObject:v6 forKeyedSubscript:@"primaryBud"];

  CFStringRef v7 = [(ComponentAirPodsBase *)self stringForInEarStatus:v9];
  [v5 setObject:v7 forKeyedSubscript:@"secondaryBud"];

  return v5;
}

- (id)stringForInEarStatus:(int)a3
{
  if (a3 > 4) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_100084DB0 + a3);
  }
}

- (id)budSide:(id)a3
{
  int v9 = 3;
  [a3 primaryBudSide:&v9];
  CFStringRef v3 = @"BudSideUnknown";
  CFStringRef v4 = @"roleLeft";
  if (v9 == 2) {
    CFStringRef v3 = @"roleRight";
  }
  else {
    CFStringRef v4 = @"BudSideUnknown";
  }
  if (v9 == 1) {
    CFStringRef v5 = @"roleRight";
  }
  else {
    CFStringRef v5 = v4;
  }
  if (v9 == 1) {
    CFStringRef v6 = @"roleLeft";
  }
  else {
    CFStringRef v6 = v3;
  }
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObject:v6 forKeyedSubscript:@"primaryBudRole"];
  [v7 setObject:v5 forKeyedSubscript:@"secondaryBudRole"];

  return v7;
}

- (id)stringForListeningMode:(unsigned int)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_100084DD8 + (int)(a3 - 1));
  }
}

- (id)generationStringForProductId:(unsigned int)a3
{
  if (a3 - 8194 > 0x11) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_100084DF8 + (int)(a3 - 8194));
  }
}

- (id)getBatteryInfoForAddress:(id)a3
{
  id v3 = a3;
  if (qword_1000BE140 != -1) {
    dispatch_once(&qword_1000BE140, &stru_100084D40);
  }
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(id)qword_1000BE138 connectedDevices];
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v36;
    *(void *)&long long v6 = 134218242;
    long long v26 = v6;
    uint64_t v27 = *(void *)v36;
    id v28 = v3;
    do
    {
      int v9 = 0;
      id v29 = v7;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v10 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v9);
        id v11 = [v10 identifier:v26];
        unsigned int v12 = [v11 containsString:v3];

        if (v12)
        {
          id v13 = objc_alloc_init((Class)NSMutableArray);
          switch((unint64_t)[v10 parts])
          {
            case 0uLL:
              long long v14 = v13;
              CFStringRef v15 = @"batteryLevel";
              goto LABEL_18;
            case 1uLL:
              long long v14 = v13;
              CFStringRef v15 = @"leftBudBatteryLevel";
              goto LABEL_18;
            case 2uLL:
              goto LABEL_17;
            case 3uLL:
              [v13 addObject:@"leftBudBatteryLevel"];
LABEL_17:
              long long v14 = v13;
              CFStringRef v15 = @"rightBudBatteryLevel";
              goto LABEL_18;
            case 4uLL:
              long long v14 = v13;
              CFStringRef v15 = @"caseBatteryLevel";
LABEL_18:
              [v14 addObject:v15];
              break;
            default:
              unsigned int v16 = DiagnosticLogHandleForCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                id v24 = [v10 parts];
                *(_DWORD *)buf = v26;
                id v41 = v24;
                __int16 v42 = 2112;
                id v43 = v3;
                _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unsupported battery component part %ld found for device with bluetooth address %@", buf, 0x16u);
              }

              break;
          }
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v17 = v13;
          id v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v32;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v32 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                long long v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 percentCharge]);
                [v4 setObject:v23 forKeyedSubscript:v22];
              }
              id v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v19);
          }

          uint64_t v8 = v27;
          id v3 = v28;
          id v7 = v29;
        }
        int v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)getAutoEQStateForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 gyroInformation];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4 && [v4 count])
  {
    long long v6 = [v3 gyroInformation];
    id v7 = [v6 objectForKeyedSubscript:@"GYRO_INFO_LEFT_BUD_IS_JAMMED"];

    uint64_t v8 = [v3 gyroInformation];
    int v9 = [v8 objectForKeyedSubscript:@"GYRO_INFO_RIGHT_BUD_IS_JAMMED"];

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFStringRef v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 BOOLValue]);
        [v5 setObject:v10 forKeyedSubscript:@"isLeftBudJammed"];
      }
    }
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 BOOLValue]);
        [v5 setObject:v11 forKeyedSubscript:@"isRightBudJammed"];
      }
    }
  }

  return v5;
}

- (id)aacpInfoFromAccessoryInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 objectForKeyedSubscript:@"AACPVersionInfo"];

  if ((unint64_t)[v5 count] < 0xB)
  {
    id v12 = [v5 count];
    id v13 = DiagnosticLogHandleForCategory();
    id v11 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v15 = 134218240;
        id v16 = [v5 count];
        __int16 v17 = 1024;
        int v18 = 11;
        _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "AACPVersionInfo is smaller than the expected size (%ld instead of %d). Format of array has changed and ComponentAccessoryAirPods needs to be updated", (uint8_t *)&v15, 0x12u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AACPVersionInfo is empty. Unable to surface additional information for this AirPods device.", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    long long v6 = [v5 objectAtIndexedSubscript:1];
    [v4 setObject:v6 forKeyedSubscript:@"modelNumber"];

    id v7 = [v5 objectAtIndexedSubscript:3];
    [v4 setObject:v7 forKeyedSubscript:@"systemSerialNumber"];

    uint64_t v8 = [v5 objectAtIndexedSubscript:8];
    [v4 setObject:v8 forKeyedSubscript:@"leftBudSerialNumber"];

    int v9 = [v5 objectAtIndexedSubscript:9];
    [v4 setObject:v9 forKeyedSubscript:@"rightBudSerialNumber"];

    CFStringRef v10 = [v5 objectAtIndexedSubscript:6];
    [v4 setObject:v10 forKeyedSubscript:@"hardwareRevision"];

    id v11 = [v5 objectAtIndexedSubscript:10];
    [v4 setObject:v11 forKeyedSubscript:@"firmwareVersion"];
  }

  return v4;
}

- (id)caseInfoFromAccessoryInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 objectForKeyedSubscript:@"CaseInfo"];

  if (v5)
  {
    long long v6 = [v5 objectForKeyedSubscript:@"CaseInfoVersion"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length]) {
      [v4 setObject:v6 forKeyedSubscript:@"caseFirmwareVersion"];
    }
  }

  return v4;
}

- (BOOL)spatialAudioSupportedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 getAACPCapabilityBit:64]) {
    BOOL v4 = [v3 getSpatialAudioPlatformSupport] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)spatialAudioEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"spatial-audio-accessory-feature", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)_isBeatsDevice:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 productId];
  if (v4 == 8209)
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device (%@) is a AirPods-like Beats device that does not report as an Apple Audio Device", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 == 8209;
}

- (id)microphoneCalibrationResultForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_100039C84;
  long long v26 = sub_100039C94;
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)HMServiceClient);
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100039C9C;
    v16[3] = &unk_100084D68;
    id v17 = v4;
    objc_copyWeak(&v20, &location);
    id v19 = &v22;
    int v7 = v6;
    int v18 = v7;
    [v5 setDeviceDiagnosticRecordFoundHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003A420;
    v14[3] = &unk_100084D90;
    id v8 = v7;
    int v15 = v8;
    [v5 activateWithCompletion:v14];
    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      CFStringRef v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Timed out waiting for device diagnostic record handler to be called with a record for the target AirPods", (uint8_t *)v13, 2u);
      }
    }
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  id v11 = [(id)v23[5] copy];

  _Block_object_dispose(&v22, 8);

  return v11;
}

- (void)addObjectIfNotNil:(id)a3 forKey:(id)a4 toDictionary:(id)a5
{
  if (a3) {
    [a5 setObject:a3 forKeyedSubscript:a4];
  }
}

- (void)addEnumValueIfNotZero:(int64_t)a3 forKey:(id)a4 toDictionary:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = +[NSNumber numberWithInteger:a3];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
}

- (OS_dispatch_semaphore)btManagerAvailableSemaphore
{
  return self->_btManagerAvailableSemaphore;
}

- (void)setBtManagerAvailableSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btManagerAvailableSemaphore, 0);

  objc_storeStrong((id *)&self->_btManager, 0);
}

@end
@interface ComponentSystemAirPods
- (BOOL)isPresent;
- (BluetoothDevice)device;
- (id)diagnosticsVersion;
- (id)serialNumberFromAacpInfo:(id)a3;
- (void)bluetoothManagerDidBecomeAvailable;
- (void)populateAttributes:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation ComponentSystemAirPods

- (void)bluetoothManagerDidBecomeAvailable
{
  [(ComponentAirPodsBase *)self getPairedAppleAudioDevices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "connected", (void)v12))
        {
          [(ComponentSystemAirPods *)self setDevice:v8];
          v11 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v8;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Running System Report for device: %@", buf, 0xCu);
          }

          v10 = v3;
          goto LABEL_15;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v9 = [(ComponentSystemAirPods *)self device];

  if (!v9)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No Apple Audio Devices are currently connected", buf, 2u);
    }
LABEL_15:
  }
}

- (BOOL)isPresent
{
  v2 = self;
  v3 = [(ComponentAirPodsBase *)self btManagerAvailableSemaphore];
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v3, v4);

  id v5 = [(ComponentSystemAirPods *)v2 device];
  LOBYTE(v2) = v5 != 0;

  return (char)v2;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(ComponentSystemAirPods *)self device];
  uint64_t v6 = [v5 address];
  [v4 setObject:v6 forKeyedSubscript:@"MACAddress"];

  v7 = [(ComponentSystemAirPods *)self device];
  v8 = [v7 name];
  [v4 setObject:v8 forKeyedSubscript:@"name"];

  v9 = [(ComponentSystemAirPods *)self device];
  v10 = [v9 productName];
  [v4 setObject:v10 forKeyedSubscript:@"productName"];

  v11 = [(ComponentSystemAirPods *)self device];
  long long v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 productId]);
  [v4 setObject:v12 forKeyedSubscript:@"prodId"];

  long long v13 = [(ComponentSystemAirPods *)self device];
  long long v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 connected]);
  [v4 setObject:v14 forKeyedSubscript:@"isConnected"];

  long long v15 = [(ComponentSystemAirPods *)self device];
  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isTemporaryPaired]);
  [v4 setObject:v16 forKeyedSubscript:@"isTempPaired"];

  v17 = [(ComponentSystemAirPods *)self device];
  v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 inEarDetectEnabled]);
  [v4 setObject:v18 forKeyedSubscript:@"inEarDetectEnabled"];

  v19 = [(ComponentSystemAirPods *)self device];
  v20 = -[ComponentAirPodsBase stringForListeningMode:](self, "stringForListeningMode:", [v19 listeningMode]);
  [v4 setObject:v20 forKeyedSubscript:@"listeningMode"];

  v21 = [(ComponentSystemAirPods *)self device];
  v22 = -[ComponentAirPodsBase generationStringForProductId:](self, "generationStringForProductId:", [v21 productId]);
  [v4 setObject:v22 forKeyedSubscript:@"generation"];

  v23 = [(ComponentSystemAirPods *)self diagnosticsVersion];
  [v4 setObject:v23 forKeyedSubscript:@"diagnosticsVersion"];

  v24 = +[HUAccessoryHearingSettings sharedInstance];
  v25 = [(ComponentSystemAirPods *)self device];
  v26 = [v25 address];
  unsigned int v27 = [v24 activeHearingProtectionAvailableForAddress:v26];

  v28 = [(ComponentSystemAirPods *)self device];
  if ([v28 getAdaptiveVolumeSupport])
  {
  }
  else
  {
    v29 = [(ComponentSystemAirPods *)self device];
    unsigned int v30 = [v29 getConversationDetectSupport] | v27;

    if (v30 != 1) {
      goto LABEL_5;
    }
  }
  v31 = [(ComponentSystemAirPods *)self device];
  v32 = [(ComponentAirPodsBase *)self audioOutputForDevice:v31];
  [v4 setObject:v32 forKeyedSubscript:@"Audio"];

LABEL_5:
  v33 = [(ComponentSystemAirPods *)self device];
  BOOL v34 = [(ComponentAirPodsBase *)self spatialAudioSupportedForDevice:v33];

  v35 = +[NSNumber numberWithBool:v34];
  [v4 setObject:v35 forKeyedSubscript:@"spatialAudioSupported"];

  if (v34)
  {
    v36 = +[NSNumber numberWithBool:[(ComponentAirPodsBase *)self spatialAudioEnabled]];
    [v4 setObject:v36 forKeyedSubscript:@"spatialAudioEnabled"];
  }
  v37 = [(ComponentSystemAirPods *)self device];
  v38 = [(ComponentAirPodsBase *)self inEarStatusForDevice:v37];

  if (v38 && [v38 count]) {
    [v4 setObject:v38 forKeyedSubscript:@"inEarStatus"];
  }
  v39 = [(ComponentSystemAirPods *)self device];
  v40 = [(ComponentAirPodsBase *)self budSide:v39];

  if (v40 && [v40 count]) {
    [v4 setObject:v40 forKeyedSubscript:@"BudSide"];
  }
  v41 = [(ComponentSystemAirPods *)self device];
  v42 = [v41 address];
  v43 = [(ComponentAirPodsBase *)self getBatteryInfoForAddress:v42];

  if (v43 && [v43 count]) {
    [v4 setObject:v43 forKeyedSubscript:@"batteryInfo"];
  }
  v44 = [(ComponentSystemAirPods *)self device];
  uint64_t v45 = [(ComponentAirPodsBase *)self getAutoEQStateForDevice:v44];

  v68 = (void *)v45;
  [v4 addEntriesFromDictionary:v45];
  v46 = [(ComponentSystemAirPods *)self device];
  unsigned __int8 v47 = [v46 isTemporaryPaired];

  v69 = v38;
  if (v47)
  {
    v48 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Not surfacing AACPInfo dictionary for this device because it is temp paired", buf, 2u);
    }
  }
  else
  {
    v49 = [(ComponentSystemAirPods *)self device];
    v50 = [v49 accessoryInfo];
    v51 = [(ComponentAirPodsBase *)self aacpInfoFromAccessoryInfo:v50];

    if (v51)
    {
      [v4 addEntriesFromDictionary:v51];
      v52 = [(ComponentSystemAirPods *)self serialNumberFromAacpInfo:v51];
      [v4 setObject:v52 forKeyedSubscript:@"serialNumber"];
    }
    v53 = [(ComponentSystemAirPods *)self device];
    v54 = [v53 accessoryInfo];
    v55 = [(ComponentAirPodsBase *)self caseInfoFromAccessoryInfo:v54];

    if (v55) {
      [v4 addEntriesFromDictionary:v55];
    }
  }
  v56 = [(ComponentAirPodsBase *)self getCBDevices];
  v57 = [v4 objectForKeyedSubscript:@"systemSerialNumber"];
  v58 = [(ComponentSystemAirPods *)self device];
  v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v58 isGenuineAirPods]);
  [v4 setObject:v59 forKeyedSubscript:@"authPassed"];

  if (v57)
  {
    v60 = [v56 objectForKey:v57];
    v61 = v60;
    if (v60)
    {
      v62 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v60 gapaFlags]);
      [v4 setObject:v62 forKeyedSubscript:@"authErrorCode"];

      int v63 = 1;
    }
    else
    {
      int v63 = 0;
    }
  }
  else
  {
    int v63 = 0;
    v61 = 0;
  }
  v64 = [(ComponentSystemAirPods *)self device];
  unsigned int v65 = [v64 connected];

  if (v63 && v65)
  {
    v66 = [(ComponentAirPodsBase *)self microphoneCalibrationResultForDevice:v61];
    if (v66) {
      [v4 setObject:v66 forKeyedSubscript:@"micCalibration"];
    }
  }
  else
  {
    v66 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [(ComponentSystemAirPods *)self device];
      *(_DWORD *)buf = 138412290;
      v71 = v67;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Device %@ is not connected, not attempting to read micrphone calibration data", buf, 0xCu);
    }
  }
}

- (id)serialNumberFromAacpInfo:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = @"systemSerialNumber";
  id v5 = [v3 objectForKeyedSubscript:@"systemSerialNumber"];

  if (!v5)
  {
    CFStringRef v4 = @"leftBudSerialNumber";
    uint64_t v6 = [v3 objectForKeyedSubscript:@"leftBudSerialNumber"];

    if (!v6) {
      CFStringRef v4 = @"rightBudSerialNumber";
    }
  }
  v7 = [v3 objectForKeyedSubscript:v4];

  return v7;
}

- (id)diagnosticsVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ComponentSystemAirPods diagnosticsVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v3 = +[NSBundle mainBundle];
  CFStringRef v4 = [v3 infoDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"CFBundleShortVersionString"];
  uint64_t v6 = stringOrNull(v5);

  return v6;
}

- (BluetoothDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
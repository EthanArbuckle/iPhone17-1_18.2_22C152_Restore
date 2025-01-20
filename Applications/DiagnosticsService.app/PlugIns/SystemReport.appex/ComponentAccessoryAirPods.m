@interface ComponentAccessoryAirPods
- (BOOL)isPresent;
- (NSArray)devices;
- (NSDictionary)cbDevices;
- (void)bluetoothManagerDidBecomeAvailable;
- (void)populateAttributes:(id)a3;
- (void)setCbDevices:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation ComponentAccessoryAirPods

- (void)bluetoothManagerDidBecomeAvailable
{
  v3 = [(ComponentAirPodsBase *)self getPairedAppleAudioDevices];
  [(ComponentAccessoryAirPods *)self setDevices:v3];

  id v4 = [(ComponentAirPodsBase *)self getCBDevices];
  [(ComponentAccessoryAirPods *)self setCbDevices:v4];
}

- (BOOL)isPresent
{
  v3 = [(ComponentAirPodsBase *)self btManagerAvailableSemaphore];
  dispatch_time_t v4 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v3, v4);

  v5 = [(ComponentAccessoryAirPods *)self devices];
  LOBYTE(v3) = [v5 count] != 0;

  return (char)v3;
}

- (void)populateAttributes:(id)a3
{
  id v38 = a3;
  id v41 = objc_alloc_init((Class)NSMutableArray);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(ComponentAccessoryAirPods *)self devices];
  id v42 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v44;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v6 = objc_alloc_init((Class)NSMutableDictionary);
        v7 = [v5 address];
        [v6 setObject:v7 forKeyedSubscript:@"MACAddress"];

        v8 = [v5 name];
        [v6 setObject:v8 forKeyedSubscript:@"name"];

        v9 = [v5 productName];
        [v6 setObject:v9 forKeyedSubscript:@"productName"];

        v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 productId]);
        [v6 setObject:v10 forKeyedSubscript:@"prodId"];

        v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 connected]);
        [v6 setObject:v11 forKeyedSubscript:@"isConnected"];

        v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isTemporaryPaired]);
        [v6 setObject:v12 forKeyedSubscript:@"isTempPaired"];

        v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 inEarDetectEnabled]);
        [v6 setObject:v13 forKeyedSubscript:@"inEarDetectEnabled"];

        v14 = [(ComponentAirPodsBase *)self inEarStatusForDevice:v5];
        [v6 setObject:v14 forKeyedSubscript:@"inEarStatus"];

        v15 = [(ComponentAirPodsBase *)self budSide:v5];
        [v6 setObject:v15 forKeyedSubscript:@"BudSide"];

        v16 = -[ComponentAirPodsBase generationStringForProductId:](self, "generationStringForProductId:", [v5 productId]);
        [v6 setObject:v16 forKeyedSubscript:@"generation"];

        v17 = -[ComponentAirPodsBase stringForListeningMode:](self, "stringForListeningMode:", [v5 listeningMode]);
        [v6 setObject:v17 forKeyedSubscript:@"listeningMode"];

        v18 = +[HUAccessoryHearingSettings sharedInstance];
        v19 = [v5 address];
        unsigned int v20 = [v18 activeHearingProtectionAvailableForAddress:v19];

        if (([v5 getAdaptiveVolumeSupport] & 1) != 0
          || ([v5 getConversationDetectSupport] | v20) == 1)
        {
          v21 = [(ComponentAirPodsBase *)self audioOutputForDevice:v5];
          [v6 setObject:v21 forKeyedSubscript:@"Audio"];
        }
        BOOL v22 = [(ComponentAirPodsBase *)self spatialAudioSupportedForDevice:v5];
        v23 = +[NSNumber numberWithBool:v22];
        [v6 setObject:v23 forKeyedSubscript:@"spatialAudioSupported"];

        if (v22)
        {
          v24 = +[NSNumber numberWithBool:[(ComponentAirPodsBase *)self spatialAudioEnabled]];
          [v6 setObject:v24 forKeyedSubscript:@"spatialAudioEnabled"];
        }
        v25 = [v5 address];
        v26 = [(ComponentAirPodsBase *)self getBatteryInfoForAddress:v25];

        if (v26 && [v26 count]) {
          [v6 setObject:v26 forKeyedSubscript:@"batteryInfo"];
        }
        v27 = [(ComponentAirPodsBase *)self getAutoEQStateForDevice:v5];
        [v6 addEntriesFromDictionary:v27];
        if ([v5 isTemporaryPaired])
        {
          v28 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not surfacing AACPInfo dictionary for this device because it is temp paired", buf, 2u);
          }
        }
        else
        {
          v29 = [v5 accessoryInfo];
          v28 = [(ComponentAirPodsBase *)self aacpInfoFromAccessoryInfo:v29];

          if (v28) {
            [v6 addEntriesFromDictionary:v28];
          }
          v30 = [v5 accessoryInfo];
          v31 = [(ComponentAirPodsBase *)self caseInfoFromAccessoryInfo:v30];

          if (v31) {
            [v6 addEntriesFromDictionary:v31];
          }
        }
        v32 = [v6 objectForKeyedSubscript:@"systemSerialNumber"];
        v33 = [(ComponentAccessoryAirPods *)self cbDevices];
        v34 = [v33 objectForKeyedSubscript:v32];

        v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isGenuineAirPods]);
        [v6 setObject:v35 forKeyedSubscript:@"authPassed"];

        if (v32 && v34)
        {
          v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v34 gapaFlags]);
          [v6 setObject:v36 forKeyedSubscript:@"authErrorCode"];
        }
        if ([v5 connected])
        {
          v37 = [(ComponentAirPodsBase *)self microphoneCalibrationResultForDevice:v34];
          if (v37) {
            [v6 setObject:v37 forKeyedSubscript:@"micCalibration"];
          }
        }
        else
        {
          v37 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v5;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Device %@ is not connected, not attempting to read micrphone calibration data", buf, 0xCu);
          }
        }

        [v41 addObject:v6];
      }
      id v42 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v42);
  }

  [v38 setObject:v41 forKeyedSubscript:@"AirPods"];
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSDictionary)cbDevices
{
  return self->_cbDevices;
}

- (void)setCbDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbDevices, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end
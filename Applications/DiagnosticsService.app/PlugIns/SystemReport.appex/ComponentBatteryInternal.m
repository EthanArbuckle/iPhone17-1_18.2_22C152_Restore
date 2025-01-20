@interface ComponentBatteryInternal
- (BOOL)isTrustedForUI;
- (PowerUISmartChargeClient)smartChargeClient;
- (id)accessoryCertificate;
- (id)authError;
- (id)batteryCellDisconnectCount;
- (id)batteryOptimizationMode;
- (id)deviceSupportsBatteryAuth;
- (id)generateCoreRepairData;
- (id)idsn;
- (void)populateAttributes:(id)a3;
- (void)populatePLQueryAttributes:(id)a3;
- (void)setSmartChargeClient:(id)a3;
@end

@implementation ComponentBatteryInternal

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ComponentBatteryInternal;
  [(ComponentBatteryInternalBase *)&v23 populateAttributes:v4];
  [(ComponentBatteryInternal *)self populatePLQueryAttributes:v4];
  id v5 = [objc_alloc((Class)PowerUISmartChargeClient) initWithClientName:@"com.apple.diagnostics"];
  [(ComponentBatteryInternal *)self setSmartChargeClient:v5];

  v6 = [(ComponentBatteryInternal *)self batteryCellDisconnectCount];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"batteryCellDisconnectCount"];
  }
  v7 = [(ComponentBatteryInternal *)self deviceSupportsBatteryAuth];
  [v4 setObject:v7 forKeyedSubscript:@"deviceSupportsBatteryAuth"];

  v8 = [v4 objectForKeyedSubscript:@"deviceSupportsBatteryAuth"];
  unsigned int v9 = [v8 isEqualToNumber:&__kCFBooleanTrue];

  if (v9)
  {
    v10 = +[NSNumber numberWithBool:[(ComponentBatteryInternalBase *)self authPassed]];
    [v4 setObject:v10 forKeyedSubscript:@"authPassed"];

    v11 = [(ComponentBatteryInternalBase *)self fdrValidationStatus];
    [v4 setObject:v11 forKeyedSubscript:@"fdrValidationStatus"];

    v12 = +[NSNumber numberWithBool:[(ComponentBatteryInternalBase *)self isTrusted]];
    [v4 setObject:v12 forKeyedSubscript:@"isTrusted"];

    v13 = +[NSNumber numberWithBool:[(ComponentBatteryInternal *)self isTrustedForUI]];
    CFStringRef v14 = @"isTrustedForUI";
  }
  else
  {
    v13 = [(ComponentBatteryInternalBase *)self fbsn];
    CFStringRef v14 = @"fbsn";
  }
  [v4 setObject:v13 forKeyedSubscript:v14];

  v15 = [(ComponentBatteryInternal *)self authError];
  [v4 setObject:v15 forKeyedSubscript:@"authErrorCode"];

  v16 = [(ComponentBatteryInternal *)self accessoryCertificate];
  [v4 setObject:v16 forKeyedSubscript:@"accessoryCertificate"];

  v17 = [(ComponentBatteryInternal *)self idsn];
  [v4 setObject:v17 forKeyedSubscript:@"chipId"];

  if (+[DASoftLinking isCoreRepairFrameworkAvailable])
  {
    v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CRRepairStatus isVeridianFWUpdateRequired]);
    [v4 setObject:v18 forKeyedSubscript:@"isFirmwareUpdateRequired"];
  }
  v19 = [(ComponentBatteryBase *)self generatePowerSourceData];
  [v4 addEntriesFromDictionary:v19];

  v20 = [(ComponentBatteryInternalBase *)self generateMitigationState];
  [v4 addEntriesFromDictionary:v20];

  v21 = [(ComponentBatteryInternal *)self generateCoreRepairData];
  [v4 addEntriesFromDictionary:v21];

  if ((+[CBSUtilities isCheckerBoardActive] & 1) == 0)
  {
    v22 = [(ComponentBatteryInternal *)self batteryOptimizationMode];
    [v4 setObject:v22 forKeyedSubscript:@"batteryOptimizationMode"];
  }
}

- (void)populatePLQueryAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10002DCC4;
  v40 = sub_10002DCD4;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10002DCC4;
  v34 = sub_10002DCD4;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10002DCC4;
  v28 = sub_10002DCD4;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10002DCC4;
  v22 = sub_10002DCD4;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10002DCC4;
  v16 = sub_10002DCD4;
  id v17 = 0;
  id v5 = dispatch_group_create();
  v6 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DCDC;
  block[3] = &unk_100084C30;
  block[4] = self;
  block[5] = &v36;
  dispatch_group_async(v5, v6, block);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DD28;
  v10[3] = &unk_100084C30;
  v10[4] = self;
  v10[5] = &v30;
  dispatch_group_async(v5, v6, v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DD74;
  v9[3] = &unk_100084C30;
  v9[4] = self;
  v9[5] = &v24;
  dispatch_group_async(v5, v6, v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002DDC0;
  v8[3] = &unk_100084C30;
  v8[4] = self;
  v8[5] = &v18;
  dispatch_group_async(v5, v6, v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DE0C;
  v7[3] = &unk_100084C98;
  v7[4] = &v12;
  dispatch_group_async(v5, v6, v7);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v37[5]) {
    [v4 addEntriesFromDictionary:];
  }
  if (v31[5]) {
    [v4 addEntriesFromDictionary:];
  }
  if (v25[5]) {
    [v4 addEntriesFromDictionary:];
  }
  if (v19[5]) {
    [v4 addEntriesFromDictionary:];
  }
  if ([(id)v13[5] count]) {
    [v4 setObject:v13[5] forKeyedSubscript:@"shutdownLog"];
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

- (id)batteryCellDisconnectCount
{
  uint64_t v6 = -1;
  v2 = +[DAComponentUtil getIORegistryName:@"AppleSmartBattery" property:@"BatteryCellDisconnectCount" optionalKey:0];
  v3 = v2;
  if (!v2 || ([v2 getBytes:&v6 length:8], v6 < 0))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  }

  return v4;
}

- (id)deviceSupportsBatteryAuth
{
  if (MGGetBoolAnswer()) {
    v2 = &__kCFBooleanTrue;
  }
  else {
    v2 = &__kCFBooleanFalse;
  }

  return v2;
}

- (id)authError
{
  v2 = +[DAComponentUtil getIORegistryClass:@"AppleAuthCPRelay" property:@"authError" optionalKey:0 classValidator:&stru_100084A10];
  v3 = v2;
  if (v2) {
    uint64_t v4 = *(unsigned int *)[v2 bytes];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = +[NSNumber numberWithInt:v4];

  return v5;
}

- (BOOL)isTrustedForUI
{
  v2 = +[DAComponentUtil getIORegistryClass:@"AppleAuthCPRelay" property:@"isTrustedForUI" optionalKey:0 classValidator:&stru_100084A10];
  char v5 = 0;
  [v2 getBytes:&v5 length:1];
  BOOL v3 = v5 != 0;

  return v3;
}

- (id)accessoryCertificate
{
  v2 = +[DAComponentUtil getIORegistryName:@"AppleAuthCPRelay" property:@"AccessoryCertificate" optionalKey:0 classValidator:&stru_100084A10];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  char v5 = stringOrNull(v4);

  return v5;
}

- (id)idsn
{
  v2 = +[DAComponentUtil getIORegistryName:@"AppleAuthCPRelay" property:@"IDSN" optionalKey:0 classValidator:&stru_100084A10];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  char v5 = stringOrNull(v4);

  return v5;
}

- (id)generateCoreRepairData
{
  v2 = objc_opt_new();
  BOOL v3 = dlopen("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit", 16);
  uint64_t v4 = DiagnosticLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Repair data is available for this device, populating attributes.", buf, 2u);
    }

    uint64_t v4 = getDeviceChemID();
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v2 setObject:v4 forKeyedSubscript:@"chemID"];
      }
    }
    uint64_t v6 = hasHadBatteryRepairUsingCBCC();
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v2 setObject:v6 forKeyedSubscript:@"hasHadBatteryRepairUsingCBCC"];
      }
    }
    v7 = hasHadBatteryRepair();
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v2 setObject:v7 forKeyedSubscript:@"hasHadBatteryRepair"];
      }
    }
  }
  else if (v5)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Repair data not available for this device, skipping.", v10, 2u);
  }

  id v8 = [v2 copy];

  return v8;
}

- (id)batteryOptimizationMode
{
  BOOL v3 = [(ComponentBatteryInternal *)self smartChargeClient];
  if (([v3 isMCLSupported] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v4 = [(ComponentBatteryInternal *)self smartChargeClient];
  id v21 = 0;
  id v5 = [v4 isMCLCurrentlyEnabled:&v21];
  id v6 = v21;

  if (!v5)
  {
    if (v6)
    {
      id v17 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error during retrieving MCL status: %@", buf, 0xCu);
      }
    }
LABEL_6:
    v11 = [(ComponentBatteryInternal *)self smartChargeClient];
    unsigned int v12 = [v11 isOBCSupported];

    if (v12)
    {
      v13 = [(ComponentBatteryInternal *)self smartChargeClient];
      id v19 = 0;
      uint64_t v14 = (char *)[v13 isSmartChargingCurrentlyEnabled:&v19];
      id v15 = v19;

      if ((unint64_t)(v14 - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {

        v10 = @"Optimized";
        goto LABEL_19;
      }
      if (v15)
      {
        v16 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error during retrieving OBC status: %@", buf, 0xCu);
        }
      }
    }
    v10 = @"None";
    goto LABEL_19;
  }
  v7 = [(ComponentBatteryInternal *)self smartChargeClient];
  id v20 = v6;
  unsigned int v8 = [v7 getMCLLimitWithError:&v20];
  id v9 = v20;

  if (v9)
  {

    v10 = @"ManualLimit";
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"%d%% Limit", v8];
  }
LABEL_19:

  return v10;
}

- (PowerUISmartChargeClient)smartChargeClient
{
  return self->_smartChargeClient;
}

- (void)setSmartChargeClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
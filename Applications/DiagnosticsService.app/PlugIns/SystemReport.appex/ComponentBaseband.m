@interface ComponentBaseband
- (BOOL)isPresent;
- (CoreTelephonyClient)telephonyClient;
- (NSDictionary)preflightData;
- (OS_dispatch_queue)telephonyClientQueue;
- (id)ICCID;
- (id)IMEI;
- (id)MEID;
- (id)basebandFirmwareVersion;
- (id)cellularCallStatistics;
- (id)eUICC;
- (id)eUICCChipID;
- (id)eUICCFwUpdateCurrentVersion;
- (id)eUICCFwUpdateGoldFwMac;
- (id)eUICCFwUpdateLoaderVersion;
- (id)eUICCFwUpdateOperationMode;
- (id)rffeScanData;
- (id)secondSimStatus;
- (id)secondSimTrayStatus;
- (id)serialNumber;
- (id)simStatus;
- (id)simTrayStatus;
- (void)populateAttributes:(id)a3;
- (void)setPreflightData:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTelephonyClientQueue:(id)a3;
@end

@implementation ComponentBaseband

- (BOOL)isPresent
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v3 = dispatch_get_global_queue(0, 0);
  [(ComponentBaseband *)self setTelephonyClientQueue:v3];

  id v4 = objc_alloc((Class)CoreTelephonyClient);
  v5 = [(ComponentBaseband *)self telephonyClientQueue];
  id v6 = [v4 initWithQueue:v5];
  [(ComponentBaseband *)self setTelephonyClient:v6];

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v8 = [(ComponentBaseband *)self telephonyClient];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002EFE0;
  v12[3] = &unk_100084CC0;
  v14 = &v17;
  objc_copyWeak(&v15, &location);
  v9 = v7;
  v13 = v9;
  [v8 checkRadioBootHealth:v12];

  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v9, v10);
  LOBYTE(v8) = *((unsigned char *)v18 + 24);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (void)populateAttributes:(id)a3
{
  id v23 = a3;
  id v4 = [(ComponentBaseband *)self basebandFirmwareVersion];
  [v23 setObject:v4 forKeyedSubscript:@"basebandVersion"];

  v5 = [(ComponentBaseband *)self IMEI];
  [v23 setObject:v5 forKeyedSubscript:@"imei"];

  id v6 = [(ComponentBaseband *)self MEID];
  [v23 setObject:v6 forKeyedSubscript:@"meid"];

  dispatch_semaphore_t v7 = [(ComponentBaseband *)self ICCID];
  [v23 setObject:v7 forKeyedSubscript:@"iccid"];

  v8 = [(ComponentBaseband *)self eUICCChipID];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v23 setObject:v8 forKeyedSubscript:@"eUICCChipID"];
    v9 = [(ComponentBaseband *)self eUICC];
    [v23 setObject:v9 forKeyedSubscript:@"eUICC"];

    dispatch_time_t v10 = [(ComponentBaseband *)self eUICCFwUpdateCurrentVersion];
    [v23 setObject:v10 forKeyedSubscript:@"eUICCFwUpdateCurrentVersion"];

    v11 = [(ComponentBaseband *)self eUICCFwUpdateGoldFwMac];
    [v23 setObject:v11 forKeyedSubscript:@"eUICCFwUpdateGoldFwMac"];

    v12 = [(ComponentBaseband *)self eUICCFwUpdateLoaderVersion];
    [v23 setObject:v12 forKeyedSubscript:@"eUICCFwUpdateLoaderVersion"];

    v13 = [(ComponentBaseband *)self eUICCFwUpdateOperationMode];
    [v23 setObject:v13 forKeyedSubscript:@"eUICCFwUpdateOperationMode"];
  }
  v14 = [(ComponentBaseband *)self simStatus];
  [v23 setObject:v14 forKeyedSubscript:@"simStatus"];

  id v15 = [(ComponentBaseband *)self simTrayStatus];
  [v23 setObject:v15 forKeyedSubscript:@"simTrayStatus"];

  v16 = [(ComponentBaseband *)self secondSimStatus];
  [v23 setObject:v16 forKeyedSubscript:@"secondSimStatus"];

  uint64_t v17 = [(ComponentBaseband *)self secondSimTrayStatus];
  [v23 setObject:v17 forKeyedSubscript:@"secondSimTrayStatus"];

  [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:@"hasBaseband"];
  v18 = [(ComponentBaseband *)self serialNumber];
  [v23 setObject:v18 forKeyedSubscript:@"serialNumber"];

  uint64_t v19 = +[NSNull null];
  [v23 setObject:v19 forKeyedSubscript:@"callStatistics"];

  if ((+[CBSUtilities isCheckerBoardActive] & 1) == 0)
  {
    char v20 = [(ComponentBaseband *)self cellularCallStatistics];
    [v23 setObject:v20 forKeyedSubscript:@"callStatistics"];
  }
  v21 = [(ComponentBaseband *)self rffeScanData];
  if (v21)
  {
    v22 = [(ComponentBaseband *)self rffeScanData];
    [v23 setObject:v22 forKeyedSubscript:@"rffeScanData"];
  }
}

- (id)cellularCallStatistics
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[ComponentBaseband cellularCallStatistics]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v3 = objc_opt_new();
  [v3 beginAggregation];
  id v4 = [v3 getSynchronousResult];
  v5 = dictionaryOrNull(v4);

  return v5;
}

- (id)IMEI
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband IMEI]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)MEID
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband MEID]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)ICCID
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband ICCID]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)eUICC
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    dispatch_time_t v10 = "-[ComponentBaseband eUICC]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(ComponentBaseband *)self preflightData];
  v5 = [v4 valueForKey:@"EUICCCSN"];

  if (v5)
  {
    int v6 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    int v6 = 0;
  }
  int v7 = stringOrNull(v6);

  return v7;
}

- (id)eUICCChipID
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentBaseband eUICCChipID]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(ComponentBaseband *)self preflightData];
  v5 = [v4 valueForKey:@"EUICCChipID"];
  int v6 = stringOrNull(v5);

  return v6;
}

- (id)eUICCFwUpdateCurrentVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    dispatch_time_t v10 = "-[ComponentBaseband eUICCFwUpdateCurrentVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = [v3 objectForKeyedSubscript:@"kVinylFwUpdateCurrentVersion"];
  v5 = v4;
  if (v4)
  {
    int v6 = [v4 base64EncodedStringWithOptions:0];
  }
  else
  {
    int v6 = 0;
  }
  int v7 = stringOrNull(v6);

  return v7;
}

- (id)eUICCFwUpdateGoldFwMac
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    dispatch_time_t v10 = "-[ComponentBaseband eUICCFwUpdateGoldFwMac]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = [v3 objectForKeyedSubscript:@"kVinylFwUpdateGoldFwMac"];
  v5 = v4;
  if (v4)
  {
    int v6 = [v4 base64EncodedStringWithOptions:0];
  }
  else
  {
    int v6 = 0;
  }
  int v7 = stringOrNull(v6);

  return v7;
}

- (id)eUICCFwUpdateLoaderVersion
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    dispatch_time_t v10 = "-[ComponentBaseband eUICCFwUpdateLoaderVersion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(ComponentBaseband *)self preflightData];
  v5 = [v4 objectForKeyedSubscript:@"EUICCFirmwareLoaderVersion"];

  if (v5)
  {
    int v6 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    int v6 = 0;
  }
  int v7 = stringOrNull(v6);

  return v7;
}

- (id)eUICCFwUpdateOperationMode
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentBaseband eUICCFwUpdateOperationMode]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = [v3 objectForKeyedSubscript:@"kVinylFwUpdateOperationMode"];
  v5 = [v4 description];
  int v6 = stringOrNull(v5);

  return v6;
}

- (id)simStatus
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband simStatus]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)simTrayStatus
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband simTrayStatus]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)secondSimStatus
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband secondSimStatus]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)secondSimTrayStatus
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband secondSimTrayStatus]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)basebandFirmwareVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentBaseband basebandFirmwareVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)serialNumber
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ComponentBaseband serialNumber]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();

  return v3;
}

- (id)rffeScanData
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(ComponentBaseband *)self telephonyClient];
  id v25 = 0;
  int v5 = [v4 getBasebandRadioFrequencyFrontEndScanData:&v25];
  id v6 = v25;

  if (v5 || !v6)
  {
    v22 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to get RFFE Scan Data from CoreTelephony Client: %@", buf, 0xCu);
    }
    id v23 = 0;
  }
  else
  {
    int v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 version]);
    [v3 setObject:v7 forKeyedSubscript:@"version"];

    int v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 hwPrdId]);
    [v3 setObject:v8 forKeyedSubscript:@"hwPrdId"];

    int v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 hwSku]);
    [v3 setObject:v9 forKeyedSubscript:@"hwSku"];

    dispatch_time_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 hwRev]);
    [v3 setObject:v10 forKeyedSubscript:@"hwRev"];

    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 hwHousing]);
    [v3 setObject:v11 forKeyedSubscript:@"hwHousing"];

    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 rfcInitPass]);
    [v3 setObject:v12 forKeyedSubscript:@"rfcInitPass"];

    v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 rfcHwid]);
    [v3 setObject:v13 forKeyedSubscript:@"rfcHwid"];

    v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 rfcRev]);
    [v3 setObject:v14 forKeyedSubscript:@"rfcRev"];

    id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 rfcMmwHwid]);
    [v3 setObject:v15 forKeyedSubscript:@"rfcMmwHwid"];

    v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 rfcMmwRev]);
    [v3 setObject:v16 forKeyedSubscript:@"rfcMmwRev"];

    uint64_t v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 rffeScanPass]);
    [v3 setObject:v17 forKeyedSubscript:@"rffeScanPass"];

    v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 numExpectedDevices]);
    [v3 setObject:v18 forKeyedSubscript:@"numExpectedDevices"];

    uint64_t v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 numDetectedDevices]);
    [v3 setObject:v19 forKeyedSubscript:@"numDetectedDevices"];

    char v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 numMissingDevices]);
    [v3 setObject:v20 forKeyedSubscript:@"numMissingDevices"];

    v21 = [v6 rffeScanInfo];
    v22 = v21;
    if (v21 && [v21 count]) {
      [v3 setObject:v22 forKeyedSubscript:@"rffeScanInfo"];
    }
    id v23 = v3;
  }

  return v23;
}

- (NSDictionary)preflightData
{
  return self->_preflightData;
}

- (void)setPreflightData:(id)a3
{
}

- (OS_dispatch_queue)telephonyClientQueue
{
  return self->_telephonyClientQueue;
}

- (void)setTelephonyClientQueue:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_telephonyClientQueue, 0);

  objc_storeStrong((id *)&self->_preflightData, 0);
}

@end
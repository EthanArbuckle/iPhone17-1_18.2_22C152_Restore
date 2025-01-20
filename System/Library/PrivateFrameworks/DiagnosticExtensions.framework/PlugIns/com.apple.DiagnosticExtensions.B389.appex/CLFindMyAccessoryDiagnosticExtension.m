@interface CLFindMyAccessoryDiagnosticExtension
- (CLFindMyAccessoryDiagnosticExtension)init;
- (id)attachmentsForParameters:(id)a3;
- (id)defaultDateFormatter;
- (id)logDirectory;
- (id)outputURLWithSuffix:(id)a3 forDevice:(id)a4;
- (void)checkForCompletion;
- (void)dumpLogOfType:(unint64_t)a3 fromDevice:(id)a4;
- (void)dumpLogsForBeacon:(id)a3;
- (void)fetchAllBeacons;
- (void)fetchFirmwareVersionForBeacon:(id)a3;
- (void)findMyAccessoryManager:(id)a3 didDumpLogData:(id)a4 ofType:(unint64_t)a5 fromDevice:(id)a6 withError:(id)a7;
- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didFetchFirmwareVersion:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)saveSummaryForDevice:(id)a3 withFirmwareVersionData:(id)a4;
@end

@implementation CLFindMyAccessoryDiagnosticExtension

- (CLFindMyAccessoryDiagnosticExtension)init
{
  v18.receiver = self;
  v18.super_class = (Class)CLFindMyAccessoryDiagnosticExtension;
  v2 = [(CLFindMyAccessoryDiagnosticExtension *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.DiagnosticExtension.FindMyAccessoryDiagnosticExtension", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    completionSemaphore = v2->_completionSemaphore;
    v2->_completionSemaphore = (OS_dispatch_semaphore *)v5;

    v7 = (CLFindMyAccessoryManager *)[objc_alloc((Class)CLFindMyAccessoryManager) initWithDelegate:v2 delegateQueue:v2->_queue];
    findMyAccessoryManager = v2->_findMyAccessoryManager;
    v2->_findMyAccessoryManager = v7;

    v9 = (SPBeaconManager *)objc_alloc_init((Class)SPBeaconManager);
    beaconManager = v2->_beaconManager;
    v2->_beaconManager = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    beaconMap = v2->_beaconMap;
    v2->_beaconMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingLogDumps = v2->_pendingLogDumps;
    v2->_pendingLogDumps = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingFirmwareFetches = v2->_pendingFirmwareFetches;
    v2->_pendingFirmwareFetches = v15;
  }
  return v2;
}

- (id)defaultDateFormatter
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  return v2;
}

- (id)logDirectory
{
  logDirectory = self->_logDirectory;
  if (!logDirectory)
  {
    v4 = +[NSFileManager defaultManager];
    dispatch_semaphore_t v5 = [v4 temporaryDirectory];

    v6 = [(CLFindMyAccessoryDiagnosticExtension *)self defaultDateFormatter];
    v7 = [v6 stringFromDate:self->_startDate];

    v8 = +[NSString stringWithFormat:@"findMyAccessoryManager_device_logs_%@", v7];
    v9 = [v5 URLByAppendingPathComponent:v8];
    v10 = self->_logDirectory;
    self->_logDirectory = v9;

    logDirectory = self->_logDirectory;
  }
  return logDirectory;
}

- (void)fetchAllBeacons
{
  if (qword_10000D5B8 != -1) {
    dispatch_once(&qword_10000D5B8, &stru_100008268);
  }
  dispatch_queue_t v3 = qword_10000D5C0;
  if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    v9 = &unk_1000055C7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension fetching all beacons\"}", buf, 0x12u);
  }
  beaconManager = self->_beaconManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003110;
  v5[3] = &unk_100008228;
  v5[4] = self;
  [(SPBeaconManager *)beaconManager allBeaconsOfType:SPBeaconTypeDurian completion:v5];
}

- (void)fetchFirmwareVersionForBeacon:(id)a3
{
  id v4 = a3;
  if (qword_10000D5B8 != -1) {
    dispatch_once(&qword_10000D5B8, &stru_100008268);
  }
  dispatch_semaphore_t v5 = (void *)qword_10000D5C0;
  if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v7 = [v4 identifier];
    v12[0] = 68289283;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = &unk_1000055C7;
    __int16 v15 = 2113;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Fetching firmware version from beacon\", \"beaconUUID\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
  }
  findMyAccessoryManager = self->_findMyAccessoryManager;
  v9 = [v4 identifier];
  [(CLFindMyAccessoryManager *)findMyAccessoryManager fetchFirmwareVersionFromDevice:v9];

  pendingFirmwareFetches = self->_pendingFirmwareFetches;
  v11 = [v4 identifier];
  [(NSMutableArray *)pendingFirmwareFetches addObject:v11];
}

- (void)dumpLogOfType:(unint64_t)a3 fromDevice:(id)a4
{
  id v11 = a4;
  [(CLFindMyAccessoryManager *)self->_findMyAccessoryManager dumpLogDataOfType:a3 fromDevice:v11];
  v6 = [(NSMutableDictionary *)self->_pendingLogDumps objectForKey:v11];
  int v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init((Class)NSMutableArray);
  }
  v9 = v8;

  v10 = +[NSNumber numberWithUnsignedInteger:a3];
  [v9 addObject:v10];

  [(NSMutableDictionary *)self->_pendingLogDumps setObject:v9 forKey:v11];
}

- (void)dumpLogsForBeacon:(id)a3
{
  id v4 = a3;
  if (qword_10000D5B8 != -1) {
    dispatch_once(&qword_10000D5B8, &stru_100008268);
  }
  dispatch_semaphore_t v5 = (void *)qword_10000D5C0;
  if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v7 = [v4 identifier];
    v12[0] = 68289283;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = &unk_1000055C7;
    __int16 v15 = 2113;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension requesting log dump from beacon\", \"beaconUUID\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
  }
  id v8 = [v4 identifier];
  [(CLFindMyAccessoryDiagnosticExtension *)self dumpLogOfType:0 fromDevice:v8];

  v9 = [v4 identifier];
  [(CLFindMyAccessoryDiagnosticExtension *)self dumpLogOfType:1 fromDevice:v9];

  v10 = [v4 identifier];
  [(CLFindMyAccessoryDiagnosticExtension *)self dumpLogOfType:2 fromDevice:v10];

  id v11 = [v4 identifier];
  [(CLFindMyAccessoryDiagnosticExtension *)self dumpLogOfType:3 fromDevice:v11];
}

- (void)checkForCompletion
{
  if (![(NSMutableDictionary *)self->_pendingLogDumps count]
    && ![(NSMutableArray *)self->_pendingFirmwareFetches count])
  {
    if (qword_10000D5B8 != -1) {
      dispatch_once(&qword_10000D5B8, &stru_100008268);
    }
    dispatch_queue_t v3 = qword_10000D5C0;
    if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      v6 = &unk_1000055C7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension completed dumping logs\"}", (uint8_t *)v4, 0x12u);
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
  }
}

- (id)outputURLWithSuffix:(id)a3 forDevice:(id)a4
{
  beaconMap = self->_beaconMap;
  id v7 = a4;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)beaconMap objectForKey:v7];
  v10 = [v9 name];
  id v11 = [v10 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

  v12 = [v7 UUIDString];
  __int16 v13 = +[NSString stringWithFormat:@"%@_%@", v11, v12];

  v14 = [(CLFindMyAccessoryDiagnosticExtension *)self logDirectory];
  __int16 v15 = [v14 URLByAppendingPathComponent:v13];

  v16 = +[NSFileManager defaultManager];
  v17 = [v15 path];
  [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:0];

  objc_super v18 = [v7 UUIDString];

  v19 = +[NSString stringWithFormat:@"%@_%@", v18, v8];

  v20 = [v15 URLByAppendingPathComponent:v19];

  return v20;
}

- (void)saveSummaryForDevice:(id)a3 withFirmwareVersionData:(id)a4
{
  beaconMap = self->_beaconMap;
  id v7 = a4;
  id v8 = a3;
  id v20 = [(NSMutableDictionary *)beaconMap objectForKey:v8];
  id v9 = objc_alloc((Class)CLFindMyAccessoryFirmwareVersion);
  id v10 = v7;
  id v11 = [v10 bytes];
  id v12 = [v10 length];

  id v13 = [v9 initWithBytes:v11 length:v12];
  id v14 = objc_alloc_init((Class)NSMutableString);
  __int16 v15 = [v20 name];
  [v14 appendFormat:@"Beacon Name: %@\n", v15];

  v16 = [v13 vanBurenVersion];
  [v14 appendFormat:@"VB Version: %@\n", v16];

  v17 = [v13 rtKitVersion];
  [v14 appendFormat:@"RTKit Version: %@\n", v17];

  objc_super v18 = [v13 specificationVersion];
  [v14 appendFormat:@"CL Spec Version: %@\n", v18];

  objc_msgSend(v14, "appendFormat:", @"Rose AP Version: %lu\n", objc_msgSend(v13, "roseAPVersion"));
  objc_msgSend(v14, "appendFormat:", @"Rose DSP Version: %lu\n", objc_msgSend(v13, "roseDSPVersion"));
  objc_msgSend(v14, "appendFormat:", @"Hardware Version: %lu\n", objc_msgSend(v13, "hardwareVersion"));
  objc_msgSend(v14, "appendFormat:", @"Calibration Data Version: %lu\n", objc_msgSend(v13, "calibrationDataVersion"));
  v19 = [(CLFindMyAccessoryDiagnosticExtension *)self outputURLWithSuffix:@"summary.txt" forDevice:v8];

  [v14 writeToURL:v19 atomically:1 encoding:4 error:0];
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10000D5B8 != -1) {
    dispatch_once(&qword_10000D5B8, &stru_100008268);
  }
  id v11 = qword_10000D5C0;
  if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289539;
    v12[1] = 0;
    __int16 v13 = 2082;
    id v14 = &unk_1000055C7;
    __int16 v15 = 2113;
    id v16 = v10;
    __int16 v17 = 2113;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension failed to dump logs\", \"device\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x26u);
  }
  if (v10) {
    [(NSMutableDictionary *)self->_pendingLogDumps removeObjectForKey:v10];
  }
  [(CLFindMyAccessoryDiagnosticExtension *)self checkForCompletion];
}

- (void)findMyAccessoryManager:(id)a3 didFetchFirmwareVersion:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  [(NSMutableArray *)self->_pendingFirmwareFetches removeObject:v10];
  if (v11)
  {
    if (qword_10000D5B8 != -1) {
      dispatch_once(&qword_10000D5B8, &stru_100008268);
    }
    id v12 = qword_10000D5C0;
    if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_ERROR))
    {
      int v18 = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = &unk_1000055C7;
      __int16 v22 = 2113;
      id v23 = v10;
      __int16 v24 = 2113;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian TTR extension failed to fetch firmware\", \"device\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v18, 0x26u);
    }
    if (qword_10000D5B8 != -1) {
      dispatch_once(&qword_10000D5B8, &stru_100008268);
    }
    __int16 v13 = qword_10000D5C0;
    if (os_signpost_enabled((os_log_t)qword_10000D5C0))
    {
      int v18 = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = &unk_1000055C7;
      __int16 v22 = 2113;
      id v23 = v10;
      __int16 v24 = 2113;
      id v25 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian TTR extension failed to fetch firmware", "{\"msg%{public}.0s\":\"#durian TTR extension failed to fetch firmware\", \"device\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v18, 0x26u);
    }
    [(CLFindMyAccessoryDiagnosticExtension *)self checkForCompletion];
  }
  else
  {
    id v14 = [(CLFindMyAccessoryDiagnosticExtension *)self outputURLWithSuffix:@"firmware_version.bin" forDevice:v10];
    [v9 writeToURL:v14 atomically:1];
    [(CLFindMyAccessoryDiagnosticExtension *)self saveSummaryForDevice:v10 withFirmwareVersionData:v9];
    if (qword_10000D5B8 != -1) {
      dispatch_once(&qword_10000D5B8, &stru_100008268);
    }
    __int16 v15 = (void *)qword_10000D5C0;
    if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      __int16 v17 = [v14 path];
      int v18 = 68289539;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = &unk_1000055C7;
      __int16 v22 = 2113;
      id v23 = v10;
      __int16 v24 = 2113;
      id v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension fetched firmware\", \"device\":%{private, location:escape_only}@, \"firmware_path\":%{private, location:escape_only}@}", (uint8_t *)&v18, 0x26u);
    }
    [(CLFindMyAccessoryDiagnosticExtension *)self checkForCompletion];
  }
}

- (void)findMyAccessoryManager:(id)a3 didDumpLogData:(id)a4 ofType:(unint64_t)a5 fromDevice:(id)a6 withError:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(NSMutableDictionary *)self->_pendingLogDumps objectForKey:v12];
  __int16 v15 = +[NSNumber numberWithUnsignedInteger:a5];
  [v14 removeObject:v15];

  if (![v14 count]) {
    [(NSMutableDictionary *)self->_pendingLogDumps removeObjectForKey:v12];
  }
  switch(a5)
  {
    case 0uLL:
      int v16 = 0;
      CFStringRef v17 = @"nordic_app.log";
      if (v13) {
        goto LABEL_11;
      }
      goto LABEL_20;
    case 1uLL:
      int v16 = 0;
      CFStringRef v17 = @"nordic_crash.log";
      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_11;
    case 2uLL:
      int v16 = 0;
      CFStringRef v17 = @"rose_app.log";
      if (v13) {
        goto LABEL_11;
      }
      goto LABEL_20;
    case 3uLL:
      int v16 = 0;
      CFStringRef v17 = @"rose_crash.log";
      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_11;
    default:
      CFStringRef v17 = 0;
      int v16 = 1;
      if (v13)
      {
LABEL_11:
        if (qword_10000D5B8 != -1) {
          dispatch_once(&qword_10000D5B8, &stru_100008268);
        }
        int v18 = qword_10000D5C0;
        if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = 68289795;
          *(_WORD *)v28 = 2082;
          *(void *)&v28[2] = &unk_1000055C7;
          *(_WORD *)&v28[10] = 2113;
          *(void *)&v28[12] = v12;
          *(_WORD *)&v28[20] = 2049;
          *(void *)&v28[22] = a5;
          *(_WORD *)&v28[30] = 2113;
          id v29 = v13;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian TTR extension failed to dump logs\", \"device\":%{private, location:escape_only}@, \"type\":%{private}lu, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v27, 0x30u);
        }
        if (qword_10000D5B8 != -1) {
          dispatch_once(&qword_10000D5B8, &stru_100008268);
        }
        int v19 = qword_10000D5C0;
        if (os_signpost_enabled((os_log_t)qword_10000D5C0))
        {
          uint64_t v27 = 68289795;
          *(_WORD *)v28 = 2082;
          *(void *)&v28[2] = &unk_1000055C7;
          *(_WORD *)&v28[10] = 2113;
          *(void *)&v28[12] = v12;
          *(_WORD *)&v28[20] = 2049;
          *(void *)&v28[22] = a5;
          *(_WORD *)&v28[30] = 2113;
          id v29 = v13;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian TTR extension failed to dump logs", "{\"msg%{public}.0s\":\"#durian TTR extension failed to dump logs\", \"device\":%{private, location:escape_only}@, \"type\":%{private}lu, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v27, 0x30u);
        }
      }
      else
      {
LABEL_20:
        if ([v11 length])
        {
          if (v16)
          {
            if (qword_10000D5B8 != -1) {
              dispatch_once(&qword_10000D5B8, &stru_100008268);
            }
            __int16 v20 = qword_10000D5C0;
            if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = 68289539;
              *(_WORD *)v28 = 2082;
              *(void *)&v28[2] = &unk_1000055C7;
              *(_WORD *)&v28[10] = 2113;
              *(void *)&v28[12] = v12;
              *(_WORD *)&v28[20] = 2049;
              *(void *)&v28[22] = a5;
              v21 = "{\"msg%{public}.0s\":\"#durian TTR extension collected log of unknown type\", \"device\":%{private, "
                    "location:escape_only}@, \"type\":%{private}lu}";
LABEL_30:
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v27, 0x26u);
            }
          }
          else
          {
            __int16 v22 = [(CLFindMyAccessoryDiagnosticExtension *)self outputURLWithSuffix:v17 forDevice:v12];
            [v11 writeToURL:v22 atomically:1];
            if (qword_10000D5B8 != -1) {
              dispatch_once(&qword_10000D5B8, &stru_100008268);
            }
            id v23 = (void *)qword_10000D5C0;
            if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v24 = v23;
              [v22 path];
              v26 = id v25 = v11;
              uint64_t v27 = 68289795;
              *(_WORD *)v28 = 2082;
              *(void *)&v28[2] = &unk_1000055C7;
              *(_WORD *)&v28[10] = 2113;
              *(void *)&v28[12] = v12;
              *(_WORD *)&v28[20] = 2049;
              *(void *)&v28[22] = a5;
              *(_WORD *)&v28[30] = 2113;
              id v29 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension collected log\", \"device\":%{private, location:escape_only}@, \"type\":%{private}lu, \"log_path\":%{private, location:escape_only}@}", (uint8_t *)&v27, 0x30u);

              id v11 = v25;
            }
          }
        }
        else
        {
          if (qword_10000D5B8 != -1) {
            dispatch_once(&qword_10000D5B8, &stru_100008268);
          }
          __int16 v20 = qword_10000D5C0;
          if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = 68289539;
            *(_WORD *)v28 = 2082;
            *(void *)&v28[2] = &unk_1000055C7;
            *(_WORD *)&v28[10] = 2113;
            *(void *)&v28[12] = v12;
            *(_WORD *)&v28[20] = 2049;
            *(void *)&v28[22] = a5;
            v21 = "{\"msg%{public}.0s\":\"#durian TTR extension dumped empty log\", \"device\":%{private, location:escape"
                  "_only}@, \"type\":%{private}lu}";
            goto LABEL_30;
          }
        }
      }
      [(CLFindMyAccessoryDiagnosticExtension *)self checkForCompletion];

      return;
  }
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (qword_10000D5B8 != -1) {
    dispatch_once(&qword_10000D5B8, &stru_100008268);
  }
  __int16 v5 = qword_10000D5C0;
  if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v23 = 0;
    __int16 v24 = 2082;
    id v25 = &unk_1000055C7;
    __int16 v26 = 2113;
    v27[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension called\", \"parameters\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v6 = +[NSDate date];
  startDate = self->_startDate;
  self->_startDate = v6;

  [(CLFindMyAccessoryDiagnosticExtension *)self fetchAllBeacons];
  dispatch_time_t v8 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, v8))
  {
    if (qword_10000D5B8 != -1) {
      dispatch_once(&qword_10000D5B8, &stru_100008268);
    }
    id v9 = (void *)qword_10000D5C0;
    if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_ERROR))
    {
      pendingLogDumps = self->_pendingLogDumps;
      id v11 = v9;
      LODWORD(pendingLogDumps) = [(NSMutableDictionary *)pendingLogDumps count];
      unsigned int v12 = [(NSMutableArray *)self->_pendingFirmwareFetches count];
      *(_DWORD *)buf = 68289538;
      int v23 = 0;
      __int16 v24 = 2082;
      id v25 = &unk_1000055C7;
      __int16 v26 = 1026;
      LODWORD(v27[0]) = pendingLogDumps;
      WORD2(v27[0]) = 1026;
      *(_DWORD *)((char *)v27 + 6) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian TTR extension log dump timed out\", \"pendingLogDumpsCount\":%{public}d, \"pendingFirmwareFetches\":%{public}d}", buf, 0x1Eu);
    }
    if (qword_10000D5B8 != -1) {
      dispatch_once(&qword_10000D5B8, &stru_100008268);
    }
    id v13 = (void *)qword_10000D5C0;
    if (os_signpost_enabled((os_log_t)qword_10000D5C0))
    {
      id v14 = self->_pendingLogDumps;
      __int16 v15 = v13;
      LODWORD(v14) = [(NSMutableDictionary *)v14 count];
      unsigned int v16 = [(NSMutableArray *)self->_pendingFirmwareFetches count];
      *(_DWORD *)buf = 68289538;
      int v23 = 0;
      __int16 v24 = 2082;
      id v25 = &unk_1000055C7;
      __int16 v26 = 1026;
      LODWORD(v27[0]) = v14;
      WORD2(v27[0]) = 1026;
      *(_DWORD *)((char *)v27 + 6) = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian TTR extension log dump timed out", "{\"msg%{public}.0s\":\"#durian TTR extension log dump timed out\", \"pendingLogDumpsCount\":%{public}d, \"pendingFirmwareFetches\":%{public}d}", buf, 0x1Eu);
    }
  }
  CFStringRef v17 = [(CLFindMyAccessoryDiagnosticExtension *)self logDirectory];
  int v18 = +[DEAttachmentItem attachmentWithPathURL:v17];
  v21 = v18;
  int v19 = +[NSArray arrayWithObjects:&v21 count:1];

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_logDirectory, 0);
  objc_storeStrong((id *)&self->_pendingFirmwareFetches, 0);
  objc_storeStrong((id *)&self->_pendingLogDumps, 0);
  objc_storeStrong((id *)&self->_beaconMap, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_findMyAccessoryManager, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
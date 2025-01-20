@interface PalmspringCrashlogManager
- (BOOL)autoExtract;
- (BOOL)startWithDispatchQueue:(id)a3;
- (NSDictionary)lastCrashlog;
- (NSMutableArray)extractionHistory;
- (PalmspringCrashlogManager)initWithDevice:(id)a3;
- (id)crashlogExtractedAction;
- (id)extractCrashlogWithInfoEntry:(id)a3 payload:(unsigned int)a4 err:(id *)a5;
- (id)getInfoReportWithError:(id *)a3;
- (int)clearFirmwareCrashlogWithID:(unsigned __int8)a3 error:(id *)a4;
- (int)collectErrorStatsWithError:(id *)a3;
- (int)extractCrashlogsWithError:(id *)a3;
- (int)getPayloadSize:(unsigned int *)a3 error:(id *)a4;
- (int)setCommandForReportID:(int)a3 command:(unsigned __int8)a4 error:(id *)a5;
- (int)setPayloadSize:(unsigned int)a3 error:(id *)a4;
- (int)setReadOffset:(unsigned __int8)a3 offset:(unsigned int)a4 error:(id *)a5;
- (void)dealloc;
- (void)inputReportHandler:(id)a3 timestamp:(unint64_t)a4 type:(int64_t)a5 reportID:(int64_t)a6 report:(id)a7;
- (void)setAutoExtract:(BOOL)a3;
- (void)setCrashlogExtractedAction:(id)a3;
- (void)setExtractionHistory:(id)a3;
- (void)setLastCrashlog:(id)a3;
- (void)stop;
@end

@implementation PalmspringCrashlogManager

- (PalmspringCrashlogManager)initWithDevice:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PalmspringCrashlogManager.m", 54, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)PalmspringCrashlogManager;
  v7 = [(PalmspringCrashlogManager *)&v25 init];
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    os_log_t v10 = os_log_create("com.apple.hid.AppleTopCase", (const char *)[v9 UTF8String]);
    log = v7->_log;
    v7->_log = (OS_os_log *)v10;

    v12 = v7->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_75F0(v12, a2);
    }
    objc_storeStrong((id *)&v7->_device, a3);
    [(HIDDevice *)v7->_device open];
    id v24 = 0;
    v13 = [(PalmspringCrashlogManager *)v7 getInfoReportWithError:&v24];
    id v14 = v24;
    v15 = v7->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = "supports";
      *(_DWORD *)location = 136315650;
      if (!v13) {
        v19 = "does not support";
      }
      *(void *)&location[4] = v19;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "device %s crashlogs: device %@, err %@", location, 0x20u);
      if (v13) {
        goto LABEL_8;
      }
    }
    else if (v13)
    {
LABEL_8:
      objc_initWeak((id *)location, v7);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_3D8C;
      v22[3] = &unk_C328;
      objc_copyWeak(&v23, (id *)location);
      [(HIDDevice *)v7->_device setInputReportHandler:v22];
      v7->_autoExtract = 1;
      v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      extractionHistory = v7->_extractionHistory;
      v7->_extractionHistory = v16;

      crc16_init();
      v18 = v7;
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
LABEL_14:

      goto LABEL_15;
    }
    [(HIDDevice *)v7->_device close];
    v18 = 0;
    goto LABEL_14;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (id)getInfoReportWithError:(id *)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7720(log);
  }
  unsigned int v6 = +[PalmspringCrashlogInfo maxInfoReportSize];
  v7 = (char *)&v13 - ((v6 + 15) & 0x1FFFFFFF0);
  uint64_t v13 = v6;
  if ([(HIDDevice *)self->_device getReport:v7 reportLength:&v13 withIdentifier:13 forType:2 error:a3])
  {
    v8 = [PalmspringCrashlogInfo alloc];
    id v9 = +[NSData dataWithBytes:v7 length:v13];
    os_log_t v10 = [(PalmspringCrashlogInfo *)v8 initWithData:v9];
  }
  else
  {
    v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_7698((uint64_t *)a3, v11);
    }
    os_log_t v10 = 0;
  }

  return v10;
}

- (BOOL)startWithDispatchQueue:(id)a3
{
  id v5 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    sub_7720(log);
    if (v5) {
      goto LABEL_3;
    }
  }
  else if (v5)
  {
LABEL_3:
    objc_storeStrong((id *)&self->_queue, a3);
    [(HIDDevice *)self->_device setDispatchQueue:self->_queue];
    [(HIDDevice *)self->_device activate];
    goto LABEL_7;
  }
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
    sub_77B0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
LABEL_7:

  return v5 != 0;
}

- (void)stop
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7720(log);
  }
  if (self->_queue) {
    [(HIDDevice *)self->_device cancel];
  }
}

- (void)dealloc
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7720(log);
  }
  [(HIDDevice *)self->_device close];
  v4.receiver = self;
  v4.super_class = (Class)PalmspringCrashlogManager;
  [(PalmspringCrashlogManager *)&v4 dealloc];
}

- (void)inputReportHandler:(id)a3 timestamp:(unint64_t)a4 type:(int64_t)a5 reportID:(int64_t)a6 report:(id)a7
{
  id v10 = a3;
  id v11 = a7;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7720(log);
  }
  if (a6 == 12)
  {
    uint64_t v13 = (unsigned __int8 *)[v11 bytes];
    uint64_t v14 = self->_log;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = v13[1];
      *(_DWORD *)buf = 67109120;
      int v19 = v15;
      _os_log_impl(&dword_0, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "HID Crashlog input report, info received: 0x%02x", buf, 8u);
    }
    if (self->_autoExtract)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4280;
      block[3] = &unk_C350;
      block[4] = self;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
}

- (int)extractCrashlogsWithError:(id *)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7720(log);
  }
  int v6 = -536870198;
  v41 = a3;
  v7 = [(PalmspringCrashlogManager *)self getInfoReportWithError:a3];
  if (v7)
  {
    id v42 = v7;
    unsigned int v61 = 0;
    id v60 = 0;
    unsigned int v8 = [(PalmspringCrashlogManager *)self getPayloadSize:&v61 error:&v60];
    id v9 = v60;
    if (v8) {
      unsigned int v61 = 2048;
    }
    id v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
      sub_7828(v8 == 0, (int *)&v61, (os_log_t)v10);
    }
    id v46 = objc_alloc_init((Class)NSDateFormatter);
    [v46 setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v42;
    id v45 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v57;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v57 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
          id v55 = 0;
          uint64_t v13 = [(PalmspringCrashlogManager *)self extractCrashlogWithInfoEntry:v12 payload:v61 err:&v55];
          id v14 = v55;

          int v15 = self->_log;
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v67 = v13;
            __int16 v68 = 1024;
            int v69 = 0;
            __int16 v70 = 2112;
            id v71 = v14;
            _os_log_impl(&dword_0, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Extraction of crashlog %@: result 0x%08X, err %@", buf, 0x1Cu);
          }
          v51 = v13;
          uint64_t v47 = v11;
          if (v13)
          {
            if (self->_crashlogExtractedAction)
            {
              v16 = self->_log;
              if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG)) {
                sub_77E8(&v53, v54, (os_log_t)v16);
              }
              (*((void (**)(void))self->_crashlogExtractedAction + 2))();
            }
            v64[0] = @"crashlogData";
            v17 = [v13 data];
            v65[0] = v17;
            v64[1] = @"crashlogName";
            v18 = [v13 info];
            int v19 = [v18 name];
            v65[1] = v19;
            v64[2] = @"crashlogType";
            v20 = [v13 info];
            v21 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v20 type]);
            v65[2] = v21;
            v22 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];
            [(PalmspringCrashlogManager *)self setLastCrashlog:v22];

            uint64_t v13 = v51;
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, @"com.apple.hidswdebug.AppleDeviceManagementHIDFilter.CrashlogExtracted", 0, 0, 2uLL);
            id v24 = [v12 uniqueID];
            id v52 = 0;
            uint64_t v25 = [(PalmspringCrashlogManager *)self clearFirmwareCrashlogWithID:v24 error:&v52];
            id v26 = v52;
          }
          else
          {
            id v26 = v14;
            uint64_t v25 = 3758097098;
          }
          v62[0] = @"InfoEntry";
          v48 = +[NSString stringWithFormat:@"%@", v12];
          v63[0] = v48;
          v62[1] = @"Crashlog";
          unsigned int v27 = [v13 blobVersion];
          id v28 = [v13 data];
          __int16 v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Blob version: %d, length: %lu", v27, [v28 length]);
          v63[1] = v29;
          v62[2] = @"Timestamp";
          id v30 = +[NSDate date];
          v31 = [v46 stringFromDate:v30];
          v63[2] = v31;
          v62[3] = @"Result";
          int v50 = v25;
          v32 = +[NSNumber numberWithInt:v25];
          v63[3] = v32;
          v62[4] = @"Error";
          id v49 = v26;
          v33 = [v26 description];
          v34 = +[NSString stringWithFormat:@"%@", v33];
          v63[4] = v34;
          v35 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:5];

          if ((unint64_t)[(NSMutableArray *)self->_extractionHistory count] >= 0x64)
          {
            do
              [(NSMutableArray *)self->_extractionHistory removeObjectAtIndex:0];
            while ((unint64_t)[(NSMutableArray *)self->_extractionHistory count] > 0x63);
          }
          [(NSMutableArray *)self->_extractionHistory addObject:v35];

          if (v50)
          {
            id v9 = v49;
            goto LABEL_29;
          }
          uint64_t v11 = v47 + 1;
          id v9 = v49;
        }
        while ((id)(v47 + 1) != v45);
        id v45 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }
    int v50 = 0;
LABEL_29:

    if (v41) {
      id *v41 = v9;
    }
    v36 = self->_log;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      v38 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v67 = v38;
      __int16 v68 = 1024;
      int v69 = v50;
      __int16 v70 = 2112;
      id v71 = v9;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%@ result 0x%08X, err %@", buf, 0x1Cu);
    }
    v7 = v42;
    int v6 = v50;
  }

  return v6;
}

- (id)extractCrashlogWithInfoEntry:(id)a3 payload:(unsigned int)a4 err:(id *)a5
{
  id v9 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7904(log, a2, (uint64_t)v9);
  }
  if (-[PalmspringCrashlogManager setReadOffset:offset:error:](self, "setReadOffset:offset:error:", [v9 uniqueID], 0, a5))
  {
    uint64_t v11 = 0;
    goto LABEL_36;
  }
  uint64_t v47 = &v42;
  uint64_t v12 = a4 + 1;
  id v13 = objc_alloc_init((Class)NSMutableData);
  id v14 = [v13 length];
  if ((unint64_t)v14 >= [v9 headerAndRawBlobSize])
  {
LABEL_30:
    uint64_t v11 = [[PalmspringCrashlog alloc] initWithInfoEntry:v9 data:v13];
    goto LABEL_35;
  }
  unsigned __int8 v16 = 0;
  NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
  *(void *)&long long v15 = 67109378;
  long long v45 = v15;
  *(void *)&long long v15 = 134218752;
  long long v44 = v15;
  while (1)
  {
    uint64_t v48 = v12;
    unsigned int v17 = [(HIDDevice *)self->_device getReport:(char *)&v42 - ((v12 + 15) & 0x1FFFFFFF0) reportLength:&v48 withIdentifier:12 forType:2 error:a5];
    if (v17) {
      BOOL v18 = v48 < 2;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      [v13 appendBytes:(char *)&v42 - ((v12 + 15) & 0x1FFFFFFF0) + 1 length:v48 - 1];
      v22 = self->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v43 = v48 - 1;
        id v26 = v22;
        unsigned int v27 = [v9 uniqueID];
        id v28 = [v13 length];
        unsigned int v29 = [v9 headerAndRawBlobSize];
        *(_DWORD *)buf = v44;
        *(void *)id v52 = v43;
        *(_WORD *)&v52[8] = 1024;
        *(_DWORD *)&v52[10] = v27;
        __int16 v53 = 2048;
        id v54 = v28;
        __int16 v55 = 1024;
        unsigned int v56 = v29;
        _os_log_debug_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "Extracted %ld bytes of crashlog %d (%ld / %d)", buf, 0x22u);
      }
      unsigned __int8 v16 = 0;
      goto LABEL_24;
    }
    char v19 = v17 ^ 1;
    if (!a5) {
      char v19 = 1;
    }
    if ((v19 & 1) == 0 && !*a5)
    {
      NSErrorUserInfoKey v49 = v46;
      CFStringRef v50 = @"get report for crashlog information returned no crashlog data";
      v20 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      *a5 = [objc_alloc((Class)NSError) initWithDomain:@"PalmspringCrashlogManager" code:-536870166 userInfo:v20];
    }
    ++v16;
    v21 = self->_log;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        id v25 = *a5;
      }
      else {
        id v25 = 0;
      }
      *(_DWORD *)buf = v45;
      *(_DWORD *)id v52 = v16;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v25;
      _os_log_error_impl(&dword_0, (os_log_t)v21, OS_LOG_TYPE_ERROR, "get report failed to extract crashlog data, increasing failure count: # of failures %d, err %@", buf, 0x12u);
    }
    if (v16 == 3) {
      break;
    }
    if (-[PalmspringCrashlogManager setReadOffset:offset:error:](self, "setReadOffset:offset:error:", [v9 uniqueID], objc_msgSend(v13, "length"), a5))
    {
      v38 = self->_log;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          id v41 = *a5;
        }
        else {
          id v41 = 0;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)id v52 = v41;
        _os_log_error_impl(&dword_0, (os_log_t)v38, OS_LOG_TYPE_ERROR, "Failed to set read offset back to where it was, exiting crashlog extraction: err %@", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_24:
    id v24 = [v13 length];
    if ((unint64_t)v24 >= [v9 headerAndRawBlobSize]) {
      goto LABEL_30;
    }
  }
  id v30 = self->_log;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
    sub_78CC(v30, v31, v32, v33, v34, v35, v36, v37);
  }
LABEL_34:
  uint64_t v11 = 0;
LABEL_35:

LABEL_36:

  return v11;
}

- (int)clearFirmwareCrashlogWithID:(unsigned __int8)a3 error:(id *)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7A4C(log, a2);
  }
  __int16 v12 = -500;
  unsigned __int8 v13 = a3;
  if ([(HIDDevice *)self->_device setReport:&v12 reportLength:3 withIdentifier:12 forType:2 error:a4])return 0; {
  int v9 = -536870212;
  }
  id v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_79C0(a3, (uint64_t *)a4, v10);
  }
  return v9;
}

- (int)getPayloadSize:(unsigned int *)a3 error:(id *)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    sub_7720(log);
    if (a3) {
      goto LABEL_3;
    }
  }
  else if (a3)
  {
    goto LABEL_3;
  }
  char v19 = +[NSAssertionHandler currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PalmspringCrashlogManager.m", 277, @"Invalid parameter not satisfying: %@", @"outSize" object file lineNumber description];

LABEL_3:
  int v9 = [(PalmspringCrashlogManager *)self setCommandForReportID:12 command:4 error:a4];
  if (!v9)
  {
    uint64_t v20 = 5;
    if ([(HIDDevice *)self->_device getReport:&v21 reportLength:&v20 withIdentifier:12 forType:2 error:a4])
    {
      int v9 = 0;
      *a3 = v22;
    }
    else
    {
      int v9 = -536870198;
      id v10 = self->_log;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_7AFC(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  return v9;
}

- (int)setPayloadSize:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7BBC(log, a2);
  }
  __int16 v12 = 1036;
  int v13 = v5;
  if ([(HIDDevice *)self->_device setReport:&v12 reportLength:6 withIdentifier:12 forType:2 error:a4])return 0; {
  int v9 = -536870198;
  }
  id v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
    sub_7B34((uint64_t *)a4, v5, v10);
  }
  return v9;
}

- (int)setReadOffset:(unsigned __int8)a3 offset:(unsigned int)a4 error:(id *)a5
{
  int v7 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = log;
    uint64_t v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)char v21 = v15;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)unsigned int v22 = v7;
    *(_WORD *)&void v22[4] = 1024;
    *(_DWORD *)&v22[6] = a4;
    _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "%@, crashlog ID %u, offset %u", buf, 0x18u);
  }
  __int16 v17 = -244;
  char v18 = v7;
  unsigned int v19 = a4;
  if ([(HIDDevice *)self->_device setReport:&v17 reportLength:7 withIdentifier:12 forType:2 error:a5])return 0; {
  int v11 = -536870198;
  }
  __int16 v12 = self->_log;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    if (a5) {
      id v16 = *a5;
    }
    else {
      id v16 = 0;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)char v21 = a4;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = v7;
    *(_WORD *)unsigned int v22 = 2112;
    *(void *)&v22[2] = v16;
    _os_log_error_impl(&dword_0, (os_log_t)v12, OS_LOG_TYPE_ERROR, "set report failed when trying to set read offset to %d for crashlog with ID %d: error %@", buf, 0x18u);
  }
  return v11;
}

- (int)setCommandForReportID:(int)a3 command:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = log;
    uint64_t v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)unsigned int v19 = v15;
    *(_WORD *)&v19[8] = 1024;
    *(_DWORD *)uint64_t v20 = a3;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v6;
    _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "%@, report ID %u, command %u", buf, 0x18u);
  }
  v17[0] = a3;
  v17[1] = v6;
  if ([(HIDDevice *)self->_device setReport:v17 reportLength:2 withIdentifier:a3 forType:2 error:a5])return 0; {
  int v11 = -536870212;
  }
  __int16 v12 = self->_log;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
  {
    if (a5) {
      id v16 = *a5;
    }
    else {
      id v16 = 0;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)unsigned int v19 = a3;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v6;
    *(_WORD *)uint64_t v20 = 2112;
    *(void *)&v20[2] = v16;
    _os_log_error_impl(&dword_0, (os_log_t)v12, OS_LOG_TYPE_ERROR, "set report failed to set command for report ID %d to %d: error %@", buf, 0x18u);
  }
  return v11;
}

- (int)collectErrorStatsWithError:(id *)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_7720(log);
  }
  return [(PalmspringCrashlogManager *)self setCommandForReportID:14 command:238 error:a3];
}

- (id)crashlogExtractedAction
{
  return self->_crashlogExtractedAction;
}

- (void)setCrashlogExtractedAction:(id)a3
{
}

- (BOOL)autoExtract
{
  return self->_autoExtract;
}

- (void)setAutoExtract:(BOOL)a3
{
  self->_autoExtract = a3;
}

- (NSMutableArray)extractionHistory
{
  return self->_extractionHistory;
}

- (void)setExtractionHistory:(id)a3
{
}

- (NSDictionary)lastCrashlog
{
  return self->_lastCrashlog;
}

- (void)setLastCrashlog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCrashlog, 0);
  objc_storeStrong((id *)&self->_extractionHistory, 0);
  objc_storeStrong(&self->_crashlogExtractedAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end
@interface CLConditionLedger
- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5;
- (BOOL)directoryExists:(id)a3;
- (BOOL)persistentFileReadSucceeded;
- (BOOL)readConditionsFromFile;
- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3;
- (BOOL)shouldMigrate;
- (BOOL)writeToFile;
- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5;
- (NSArray)allMonitoringIdentifiers;
- (NSDictionary)allMonitoringRecordsByIdentifier;
- (NSFileManager)defaultFileManager;
- (NSNumber)ledgerVersionNumber;
- (NSString)ledgerName;
- (NSURL)ledgerFile;
- (id)monitoringRecordForIdentifier:(id)a3;
- (void)dealloc;
- (void)deleteLedgerFile;
- (void)performMigration;
- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7;
- (void)setLedgerVersionNumber:(int)a3;
- (void)updateEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateRecord:(id)a3 identifier:(id)a4;
@end

@implementation CLConditionLedger

- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CLConditionLedger;
  v9 = [(CLConditionLedger *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerPathKey"];
    v11 = (void *)[a5 objectForKeyedSubscript:@"kCLMonitorLedgerNameKey"];
    v12 = (void *)[a5 objectForKeyedSubscript:@"kCLMonitorLedgerAccessKey"];
    uint64_t v13 = [a5 objectForKeyedSubscript:@"kCLMonitorLedgerProcessNameKey"];
    if (v11)
    {
      if (v12)
      {
LABEL_4:
        [(CLConditionLedger *)v9 setLedgerForType:a3 domain:a4 monitor:v11 client:v13 path:v10];
        v9->_recordTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v9->_encryptionKey = (NSData *)[v12 copy];
        v9->_ledgerName = (NSString *)[v11 copy];
        v9->_readSucceeded = [(CLConditionLedger *)v9 readConditionsFromFile];
        [(CLConditionLedger *)v9 performMigration];
        return v9;
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"CLConditionLedger.mm", 94, @"Monitor name is nil");
      if (v12) {
        goto LABEL_4;
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"CLConditionLedger.mm", 95, @"Key is nil to read/store %@ monitor's contents", v11);
    goto LABEL_4;
  }
  return v9;
}

- (void)dealloc
{
  if (![(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] count])[(CLConditionLedger *)self deleteLedgerFile]; {

  }
  self->_ledgerFile = 0;
  self->_encryptionKey = 0;

  self->_recordTable = 0;
  self->_ledgerName = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLConditionLedger;
  [(CLConditionLedger *)&v3 dealloc];
}

- (BOOL)persistentFileReadSucceeded
{
  return self->_readSucceeded;
}

- (BOOL)shouldMigrate
{
  return [(NSNumber *)[(CLConditionLedger *)self ledgerVersionNumber] intValue] < 1;
}

- (void)performMigration
{
  if ([(CLConditionLedger *)self shouldMigrate])
  {
    MEMORY[0x1F4181798](self, sel_setLedgerVersionNumber_);
  }
}

- (void)setLedgerVersionNumber:(int)a3
{
  self->_ledgerVersionNumber = (NSNumber *)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
}

- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([(CLConditionLedger *)self ledgerFile]) {
    return;
  }
  int v14 = _sandbox_in_a_container();
  uint64_t v15 = [NSString stringWithFormat:@"%@.monitor", a5];
  if (a3 == 1 && a4 == 1)
  {
    if (!a7) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLConditionLedger.mm", 169, @"#monitor Invalid path for custom store for %@ monitor", a5);
    }
    id v16 = (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:a7 isDirectory:1 relativeToURL:0];
    v17 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1EE006720];
    p_cache = (void **)(CLCircularRegion + 16);
    v19 = (void **)(CLCircularRegion + 16);
    goto LABEL_29;
  }
  v17 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"CoreLocation/"];
  if (a3)
  {
    p_cache = CLCircularRegion.cache;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v20 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v21 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289026;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Custom store type cannot use on NSSearchPathDirectory", "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
    }
    uint64_t v22 = 5;
  }
  else
  {
    if (v14) {
      uint64_t v22 = 9;
    }
    else {
      uint64_t v22 = 5;
    }
    p_cache = CLCircularRegion.cache;
  }
  if (a4) {
    uint64_t v23 = 8;
  }
  else {
    uint64_t v23 = 1;
  }
  id v16 = [(NSArray *)[(NSFileManager *)[(CLConditionLedger *)self defaultFileManager] URLsForDirectory:v22 inDomains:v23] firstObject];
  v19 = CLCircularRegion.cache;
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  v24 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v42 = 0;
    __int16 v43 = 2082;
    v44 = "";
    __int16 v45 = 2114;
    v46 = (const char *)a6;
    _os_log_impl(&dword_1906B8000, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor App is not sanboxed\", \"client\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  uint64_t v25 = [v16 URLByAppendingPathComponent:v17];
  if (![(CLConditionLedger *)self directoryExists:v25])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v35 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2114;
      v46 = (const char *)v25;
      __int16 v47 = 2082;
      v48 = "assert";
      __int16 v49 = 2081;
      v50 = "clDirExists";
      _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Unable to create intermediate dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v36 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2114;
      v46 = (const char *)v25;
      __int16 v47 = 2082;
      v48 = "assert";
      __int16 v49 = 2081;
      v50 = "clDirExists";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Unable to create intermediate dir", "{\"msg%{public}.0s\":\"#monitor Unable to create intermediate dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v37 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2114;
      v46 = (const char *)v25;
      __int16 v47 = 2082;
      v48 = "assert";
      __int16 v49 = 2081;
      v50 = "clDirExists";
      _os_log_impl(&dword_1906B8000, v37, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#monitor Unable to create intermediate dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
LABEL_74:
    abort_report_np();
  }
  if (v14)
  {
LABEL_29:
    unint64_t v26 = 0x1E4F29000;
    goto LABEL_35;
  }
  unint64_t v26 = 0x1E4F29000uLL;
  [v17 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@/", a6)];
  uint64_t v27 = [v16 URLByAppendingPathComponent:v17];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  v28 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v42 = 0;
    __int16 v43 = 2082;
    v44 = "";
    __int16 v45 = 2114;
    v46 = (const char *)v27;
    _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor process is not containerized\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  if (![(CLConditionLedger *)self directoryExists:v27])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v38 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2114;
      v46 = (const char *)v27;
      __int16 v47 = 2082;
      v48 = "assert";
      __int16 v49 = 2081;
      v50 = "processDirExists";
      _os_log_impl(&dword_1906B8000, v38, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Unable to create dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v39 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2114;
      v46 = (const char *)v27;
      __int16 v47 = 2082;
      v48 = "assert";
      __int16 v49 = 2081;
      v50 = "processDirExists";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Unable to create dir", "{\"msg%{public}.0s\":\"#monitor Unable to create dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v40 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2114;
      v46 = (const char *)v27;
      __int16 v47 = 2082;
      v48 = "assert";
      __int16 v49 = 2081;
      v50 = "processDirExists";
      _os_log_impl(&dword_1906B8000, v40, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#monitor Unable to create dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    goto LABEL_74;
  }
LABEL_35:
  if (!v16)
  {
    if (v19[125] != (void *)-1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v32 = p_cache[124];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2082;
      v46 = "assert";
      __int16 v47 = 2081;
      v48 = "basePath";
      _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Unable to determine the path to store conditions\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v19[125] != (void *)-1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v33 = p_cache[124];
    if (os_signpost_enabled(v33))
    {
      *(_DWORD *)buf = 68289539;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2082;
      v46 = "assert";
      __int16 v47 = 2081;
      v48 = "basePath";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Unable to determine the path to store conditions", "{\"msg%{public}.0s\":\"#monitor Unable to determine the path to store conditions\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v19[125] != (void *)-1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    v34 = p_cache[124];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v42 = 0;
      __int16 v43 = 2082;
      v44 = "";
      __int16 v45 = 2082;
      v46 = "assert";
      __int16 v47 = 2081;
      v48 = "basePath";
      _os_log_impl(&dword_1906B8000, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#monitor Unable to determine the path to store conditions\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_74;
  }
  [v17 appendString:objc_msgSend(*(id *)(v26 + 24), "stringWithFormat:", @"%@", v15)];
  v29 = (void *)[v16 URLByAppendingPathComponent:v17];
  if (v19[125] != (void *)-1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  v30 = p_cache[124];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = objc_msgSend((id)objc_msgSend(v29, "path"), "UTF8String");
    *(_DWORD *)buf = 68289282;
    int v42 = 0;
    __int16 v43 = 2082;
    v44 = "";
    __int16 v45 = 2082;
    v46 = (const char *)v31;
    _os_log_impl(&dword_1906B8000, v30, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor Conditions store\", \"path\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  self->_ledgerFile = (NSURL *)(id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend(v29, "path"), 0);
}

- (BOOL)directoryExists:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v4 = [(CLConditionLedger *)self defaultFileManager];
  if (qword_1EB272558 != -1) {
    dispatch_once(&qword_1EB272558, &unk_1EE0032F8);
  }
  if (-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a3, 0, qword_1EB272550, &v8)|| [v8 code] == 516)
  {
    return 1;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  v6 = qword_1EB2713E0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v7)
  {
    *(_DWORD *)buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = a3;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #warning unable to check for directory\", \"error\":%{public, location:escape_only}@, \"pathURL\":%{public, location:escape_only}@}", buf, 0x26u);
    return 0;
  }
  return result;
}

- (NSFileManager)defaultFileManager
{
  return (NSFileManager *)[MEMORY[0x1E4F28CB8] defaultManager];
}

- (BOOL)readConditionsFromFile
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CLConditionLedger *)self ledgerFile];
  if (!v3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    id v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v53 = 0;
      __int16 v54 = 2082;
      v55 = "";
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}", buf, 0x12u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    uint64_t v15 = qword_1EB2713E0;
    BOOL v12 = os_signpost_enabled((os_log_t)qword_1EB2713E0);
    if (!v12) {
      return v12;
    }
    *(_DWORD *)buf = 68289026;
    int v53 = 0;
    __int16 v54 = 2082;
    v55 = "";
    id v16 = "#monitor path is nil for ledger file";
    uint64_t v17 = "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}";
    v18 = v15;
    uint32_t v19 = 18;
LABEL_45:
    _os_signpost_emit_with_name_impl(&dword_1906B8000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, v19);
    goto LABEL_46;
  }
  v4 = v3;
  id v51 = 0;
  v5 = (void *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:1 error:&v51];
  if (v51 && [v51 code] != 260)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v20 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = [(NSString *)[(NSURL *)v4 path] UTF8String];
      *(_DWORD *)buf = 68289538;
      int v53 = 0;
      __int16 v54 = 2082;
      v55 = "";
      __int16 v56 = 2082;
      *(void *)v57 = v21;
      *(_WORD *)&v57[8] = 2114;
      *(void *)&v57[10] = v51;
      _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    uint64_t v22 = qword_1EB2713E0;
    BOOL v12 = os_signpost_enabled((os_log_t)qword_1EB2713E0);
    if (!v12) {
      return v12;
    }
    uint64_t v23 = [(NSString *)[(NSURL *)v4 path] UTF8String];
    *(_DWORD *)buf = 68289538;
    int v53 = 0;
    __int16 v54 = 2082;
    v55 = "";
    __int16 v56 = 2082;
    *(void *)v57 = v23;
    *(_WORD *)&v57[8] = 2114;
    *(void *)&v57[10] = v51;
    id v16 = "#monitor #Warning Unable to read the contents of file";
    uint64_t v17 = "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:es"
          "cape_only}s, \"error\":%{public, location:escape_only}@}";
LABEL_44:
    v18 = v22;
    uint32_t v19 = 38;
    goto LABEL_45;
  }
  if (!v5)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v24 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [(NSString *)[(NSURL *)v4 path] UTF8String];
      *(_DWORD *)buf = 68289282;
      int v53 = 0;
      __int16 v54 = 2082;
      v55 = "";
      __int16 v56 = 2082;
      *(void *)v57 = v25;
      _os_log_impl(&dword_1906B8000, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor no conditions were saved\", \"file\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    goto LABEL_53;
  }
  uint64_t v6 = [v5 length] - 32;
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v6];
  uint64_t v8 = [v5 bytes];
  [(NSData *)self->_encryptionKey bytes];
  [(NSData *)self->_encryptionKey length];
  uint64_t v46 = v8 + 16 + v6;
  uint64_t v47 = 16;
  uint64_t v44 = v6;
  uint64_t v45 = [v7 mutableBytes];
  int v9 = CCCryptorGCMOneshotDecrypt();
  if (!v9)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB272548, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EB272548))
    {
      v50 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v49 = objc_opt_class();
      uint64_t v48 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      qword_1EB272540 = (uint64_t)(id)objc_msgSend(v50, "setWithObjects:", v49, v48, v36, v37, v38, v39, v40, v41, v42, objc_opt_class(), 0);
      __cxa_guard_release(&qword_1EB272548);
    }
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", qword_1EB272540, v7, &v51, v44, v45, v46, v47);
    if (!v51)
    {
      uint64_t v27 = (void *)v26;
      if (v26)
      {
        v28 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v28 addEntriesFromDictionary:v27];
        if ([v27 objectForKeyedSubscript:@"kCLLedgerVersionNumber"])
        {
          self->_ledgerVersionNumber = (NSNumber *)[v27 objectForKeyedSubscript:@"kCLLedgerVersionNumber"];
          if (qword_1EB2713D8 != -1) {
            dispatch_once(&qword_1EB2713D8, &unk_1EE003318);
          }
          v29 = qword_1EB2713D0;
          if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
          {
            v30 = [(CLConditionLedger *)self ledgerVersionNumber];
            *(_DWORD *)buf = 68289282;
            int v53 = 0;
            __int16 v54 = 2082;
            v55 = "";
            __int16 v56 = 2114;
            *(void *)v57 = v30;
            _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Found ledger version number\", \"ledgerVersion\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          [v28 removeObjectForKey:@"kCLLedgerVersionNumber"];
        }
        else
        {
          self->_ledgerVersionNumber = (NSNumber *)&unk_1EE0238A8;
        }
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
        }
        v34 = qword_1EB2713E0;
        if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v35 = [v28 count];
          *(_DWORD *)buf = 68289282;
          int v53 = 0;
          __int16 v54 = 2082;
          v55 = "";
          __int16 v56 = 2050;
          *(void *)v57 = v35;
          _os_log_impl(&dword_1906B8000, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor file has conditions saved\", \"count\":%{public}ld}", buf, 0x1Cu);
        }
        [(NSMutableDictionary *)self->_recordTable addEntriesFromDictionary:v28];
LABEL_53:
        LOBYTE(v12) = 1;
        return v12;
      }
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    uint64_t v31 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      uint64_t v32 = [(NSString *)[(NSURL *)v4 path] UTF8String];
      *(_DWORD *)buf = 68289539;
      int v53 = 0;
      __int16 v54 = 2082;
      v55 = "";
      __int16 v56 = 2081;
      *(void *)v57 = v32;
      *(_WORD *)&v57[8] = 2114;
      *(void *)&v57[10] = v51;
      _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    uint64_t v22 = qword_1EB2713E0;
    BOOL v12 = os_signpost_enabled((os_log_t)qword_1EB2713E0);
    if (!v12) {
      return v12;
    }
    uint64_t v33 = [(NSString *)[(NSURL *)v4 path] UTF8String];
    *(_DWORD *)buf = 68289539;
    int v53 = 0;
    __int16 v54 = 2082;
    v55 = "";
    __int16 v56 = 2081;
    *(void *)v57 = v33;
    *(_WORD *)&v57[8] = 2114;
    *(void *)&v57[10] = v51;
    id v16 = "#monitor #Warning unable to read conditions from file";
    uint64_t v17 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:e"
          "scape_only}s, \"error\":%{public, location:escape_only}@}";
    goto LABEL_44;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  int v10 = qword_1EB2713E0;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v12) = 0;
  if (v11)
  {
    __int16 v13 = [(CLConditionLedger *)self ledgerFile];
    *(_DWORD *)buf = 68289538;
    int v53 = 0;
    __int16 v54 = 2082;
    v55 = "";
    __int16 v56 = 1026;
    *(_DWORD *)v57 = v9;
    *(_WORD *)&v57[4] = 2114;
    *(void *)&v57[6] = v13;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to decrypt the conditions\", \"error\":%{public}d, \"ledger\":%{public, location:escape_only}@}", buf, 0x22u);
LABEL_46:
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)writeToFile
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CLConditionLedger *)self ledgerFile];
  if (!v3) {
    return (char)v3;
  }
  if (![(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] count])
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE003318);
    }
    v24 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      int v37 = 0;
      __int16 v38 = 2082;
      uint64_t v39 = "";
      __int16 v40 = 2114;
      uint64_t v41 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
      _os_log_impl(&dword_1906B8000, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor nothing to write; Removing existing file\", \"file\":%{public, location:escape_only}@}",
        buf,
        0x1Cu);
    }
    [(CLConditionLedger *)self deleteLedgerFile];
    goto LABEL_26;
  }
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v4, "addEntriesFromDictionary:", -[CLConditionLedger allMonitoringRecordsByIdentifier](self, "allMonitoringRecordsByIdentifier"));
  objc_msgSend(v4, "setObject:forKey:", -[CLConditionLedger ledgerVersionNumber](self, "ledgerVersionNumber"), @"kCLLedgerVersionNumber");
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  uint64_t v35 = 0;
  uint64_t v6 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v35];
  if (v35 || (id v7 = v6) == 0)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    uint64_t v25 = qword_1EB2713E0;
    BOOL v26 = os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (v26)
    {
      uint64_t v27 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
      *(_DWORD *)buf = 68289538;
      int v37 = 0;
      __int16 v38 = 2082;
      uint64_t v39 = "";
      __int16 v40 = 2114;
      uint64_t v41 = v27;
      __int16 v42 = 2114;
      uint64_t v43 = v35;
      _os_log_impl(&dword_1906B8000, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Unable to store conditions\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
LABEL_41:
      LOBYTE(v3) = 0;
      return (char)v3;
    }
    return (char)v3;
  }
  uint64_t v8 = [v6 length] + 32;
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v8];
  int v10 = (char *)[v9 mutableBytes];
  uint64_t v11 = (uint64_t)&v10[[v7 length] + 16];
  int v12 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x10uLL, v10);
  if (v12)
  {
    int v13 = v12;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    id v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v37 = 0;
      __int16 v38 = 2082;
      uint64_t v39 = "";
      __int16 v40 = 1026;
      LODWORD(v41) = v13;
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    uint64_t v15 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289282;
      int v37 = 0;
      __int16 v38 = 2082;
      uint64_t v39 = "";
      __int16 v40 = 1026;
      LODWORD(v41) = v13;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to init random vector", "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
    }
  }
  [(NSData *)self->_encryptionKey bytes];
  [(NSData *)self->_encryptionKey length];
  [v7 bytes];
  uint64_t v34 = [v7 length];
  int v16 = CCCryptorGCMOneshotEncrypt();
  if (v16)
  {
    int v17 = v16;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
    v18 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v37 = 0;
      __int16 v38 = 2082;
      uint64_t v39 = "";
      __int16 v40 = 1026;
      LODWORD(v41) = v17;
      _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
      }
    }
    uint64_t v19 = qword_1EB2713E0;
    LODWORD(v3) = os_signpost_enabled((os_log_t)qword_1EB2713E0);
    if (v3)
    {
      *(_DWORD *)buf = 68289282;
      int v37 = 0;
      __int16 v38 = 2082;
      uint64_t v39 = "";
      __int16 v40 = 1026;
      LODWORD(v41) = v17;
      v20 = "#monitor unable to encrypt the conditions";
      uint64_t v21 = "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}";
      uint64_t v22 = v19;
      uint32_t v23 = 24;
LABEL_40:
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v20, v21, buf, v23);
      goto LABEL_41;
    }
    return (char)v3;
  }
  char v28 = objc_msgSend(v9, "writeToURL:options:error:", -[CLConditionLedger ledgerFile](self, "ledgerFile", v34, v10 + 16, v11, 16), 1073741825, &v35);
  if (!v35 && (v28 & 1) != 0)
  {
LABEL_26:
    LOBYTE(v3) = 1;
    return (char)v3;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  v29 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    v30 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
    *(_DWORD *)buf = 68289538;
    int v37 = 0;
    __int16 v38 = 2082;
    uint64_t v39 = "";
    __int16 v40 = 2114;
    uint64_t v41 = v30;
    __int16 v42 = 2114;
    uint64_t v43 = v35;
    _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
    }
  }
  uint64_t v31 = qword_1EB2713E0;
  LODWORD(v3) = os_signpost_enabled((os_log_t)qword_1EB2713E0);
  if (v3)
  {
    uint64_t v32 = [(NSURL *)[(CLConditionLedger *)self ledgerFile] path];
    *(_DWORD *)buf = 68289538;
    int v37 = 0;
    __int16 v38 = 2082;
    uint64_t v39 = "";
    __int16 v40 = 2114;
    uint64_t v41 = v32;
    __int16 v42 = 2114;
    uint64_t v43 = v35;
    v20 = "#monitor #Warning unable to write to file";
    uint64_t v21 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@,"
          " \"error\":%{public, location:escape_only}@}";
    uint64_t v22 = v31;
    uint32_t v23 = 38;
    goto LABEL_40;
  }
  return (char)v3;
}

- (void)deleteLedgerFile
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  [(NSFileManager *)[(CLConditionLedger *)self defaultFileManager] removeItemAtURL:[(CLConditionLedger *)self ledgerFile] error:&v5];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005C80);
  }
  objc_super v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CLConditionLedger *)self ledgerFile];
    *(_DWORD *)buf = 68289538;
    int v7 = 0;
    __int16 v8 = 2082;
    id v9 = "";
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor deleting\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
}

- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  [(NSMutableDictionary *)self->_recordTable setObject:a3 forKeyedSubscript:a4];
  if (!v5) {
    return 1;
  }

  return MEMORY[0x1F4181798](self, sel_writeToFile);
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  [(NSMutableDictionary *)self->_recordTable removeObjectForKey:a3];

  return MEMORY[0x1F4181798](self, sel_writeToFile);
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_recordTable, "objectForKeyedSubscript:", a4), "updateEvent:", a3);

  MEMORY[0x1F4181798](self, sel_writeToFile);
}

- (id)monitoringRecordForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_recordTable objectForKeyedSubscript:a3];
}

- (NSDictionary)allMonitoringRecordsByIdentifier
{
  return &self->_recordTable->super;
}

- (NSArray)allMonitoringIdentifiers
{
  return (NSArray *)[(NSMutableDictionary *)self->_recordTable allKeys];
}

- (NSString)ledgerName
{
  return self->_ledgerName;
}

- (NSNumber)ledgerVersionNumber
{
  return self->_ledgerVersionNumber;
}

- (NSURL)ledgerFile
{
  return self->_ledgerFile;
}

@end
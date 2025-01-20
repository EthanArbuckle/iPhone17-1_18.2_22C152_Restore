@interface CRSQLiteConnection
+ (id)connectionToNewInMemoryStore;
- (BOOL)isOpen;
- (CRSQLiteConnection)initWithPath:(id)a3;
- (CRSQLiteConnection)initWithPath:(id)a3 databaseName:(id)a4;
- (const)_vfsModuleName;
- (int)beginTransaction;
- (int)beginTransactionWithType:(int)a3;
- (int)commitTransaction;
- (int)open;
- (int)rollbackTransaction;
- (sqlite3)db;
- (sqlite3_stmt)preparedStatementForPattern:(id)a3;
- (void)close;
- (void)dealloc;
- (void)flush;
@end

@implementation CRSQLiteConnection

- (sqlite3_stmt)preparedStatementForPattern:(id)a3
{
  if (!self->_db) {
    sub_10001AF84();
  }
  value = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_10001B254((uint64_t)a3, log, v6, v7, v8, v9, v10, v11);
  }
  statementCache = self->_statementCache;
  if (!statementCache)
  {
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10001B21C(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    statementCache = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    self->_statementCache = statementCache;
  }
  int ValueIfPresent = CFDictionaryGetValueIfPresent(statementCache, a3, (const void **)&value);
  v22 = self->_log;
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (ValueIfPresent)
  {
    if (v23) {
      sub_10001B1E4(v22, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    if (v23) {
      sub_10001B1AC(v22, v24, v25, v26, v27, v28, v29, v30);
    }
    +[NSDate timeIntervalSinceReferenceDate];
    sqlite3_prepare_v2(self->_db, (const char *)[a3 UTF8String], -1, (sqlite3_stmt **)&value, 0);
    +[NSDate timeIntervalSinceReferenceDate];
    v31 = self->_log;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_10001B12C(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    if (value)
    {
      CFDictionarySetValue(self->_statementCache, a3, value);
    }
    else
    {
      CRLogSQLiteError(self->_db, (uint64_t)+[NSString stringWithFormat:@"preparing statement for query \"%@\"", a3]);
      int v39 = sqlite3_errcode(self->_db);
      if (v39 == 10)
      {
        int v50 = 0;
        sqlite3_file_control(self->_db, 0, 4, &v50);
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10001B030(&v50);
        }
      }
      else
      {
        int v40 = v39;
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_10001B0B0(v40);
        }
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  v41 = self->_log;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_10001AFB0(v41, v42, v43, v44, v45, v46, v47, v48);
  }
  return (sqlite3_stmt *)value;
}

- (void)flush
{
  [(CRSQLiteConnection *)self commitTransaction];
  CRSearchContext = self->_CRSearchContext;
  if (CRSearchContext) {
    sub_100006954((uint64_t)CRSearchContext);
  }
  CRPhoneSearchContext = self->_CRPhoneSearchContext;
  if (CRPhoneSearchContext)
  {
    [CRPhoneSearchContext flush];
  }
}

- (int)commitTransaction
{
  db = self->_db;
  if (!db) {
    sub_10001B344();
  }
  if (!self->_transactionCount) {
    return 0;
  }
  int result = sub_100004B3C(db, "COMMIT", 0, 0, 0);
  self->_transactionCount = 0;
  return result;
}

- (int)beginTransactionWithType:(int)a3
{
  db = self->_db;
  if (!db) {
    sub_10001B2C0();
  }
  unint64_t transactionCount = self->_transactionCount;
  if (transactionCount)
  {
    if (self->_transactionType != a3) {
      sub_10001B318();
    }
    goto LABEL_4;
  }
  if (a3 >= 3) {
    sub_10001B2EC();
  }
  int result = sub_100004B3C(db, (&off_10002D2A8)[a3], 0, 0, 0);
  self->_transactionType = a3;
  if (!result)
  {
    unint64_t transactionCount = self->_transactionCount;
LABEL_4:
    int result = 0;
    self->_unint64_t transactionCount = transactionCount + 1;
  }
  return result;
}

+ (id)connectionToNewInMemoryStore
{
  id v2 = [objc_alloc((Class)a1) initWithPath:@":memory:"];
  return v2;
}

- (CRSQLiteConnection)initWithPath:(id)a3
{
  if (!a3) {
    sub_10001AED4();
  }
  v6.receiver = self;
  v6.super_class = (Class)CRSQLiteConnection;
  v4 = [(CRSQLiteConnection *)&v6 init];
  if (v4)
  {
    v4->_path = (NSString *)[a3 copy];
    v4->_log = (OS_os_log *)os_log_create("com.apple.contacts.recentsd", "statement-cache");
  }
  return v4;
}

- (CRSQLiteConnection)initWithPath:(id)a3 databaseName:(id)a4
{
  if (!a4) {
    sub_10001AF00();
  }
  id v5 = [a3 stringByAppendingPathComponent:a4];
  return [(CRSQLiteConnection *)self initWithPath:v5];
}

- (void)dealloc
{
  if (self->_db) {
    sub_10001AF2C();
  }
  statementCache = self->_statementCache;
  if (statementCache) {
    CFRelease(statementCache);
  }
  ICUSearchContext = self->_ICUSearchContext;
  if (ICUSearchContext) {
    sub_10001A764(ICUSearchContext, a2);
  }
  CRSearchContext = self->_CRSearchContext;
  if (CRSearchContext) {
    sub_1000166A8((uint64_t)CRSearchContext);
  }
  CRPhoneSearchContext = self->_CRPhoneSearchContext;
  if (CRPhoneSearchContext) {

  }
  v7.receiver = self;
  v7.super_class = (Class)CRSQLiteConnection;
  [(CRSQLiteConnection *)&v7 dealloc];
}

- (const)_vfsModuleName
{
  if (qword_1000344E8 != -1) {
    dispatch_once(&qword_1000344E8, &stru_10002D240);
  }
  return (const char *)[@"CoreRecentsVFS" UTF8String];
}

- (int)open
{
  if (self->_db) {
    sub_10001AF58();
  }
  v3 = [(NSString *)self->_path UTF8String];
  v4 = [(CRSQLiteConnection *)self _vfsModuleName];
  ppDb = 0;
  [(NSString *)self->_path stringByDeletingLastPathComponent];
  if (sqlite3_open_v2(v3, &ppDb, 6, v4))
  {
    CPFileBuildDirectoriesToPath();
    if (sqlite3_open_v2(v3, &ppDb, 6, v4))
    {
      chmod(v3, 0x180u);
      int v5 = sqlite3_open_v2(v3, &ppDb, 6, v4);
      if (v5)
      {
        int v6 = v5;
        CFStringRef v7 = +[NSString stringWithFormat:@"opening database %s", v3];
LABEL_33:
        CRLogSQLiteError(ppDb, (uint64_t)v7);
        sqlite3_close(ppDb);
        return v6;
      }
    }
  }
  if (!self->_ICUSearchContext) {
    self->_ICUSearchContext = (void *)sub_10001A760(0, 3);
  }
  if (!self->_CRSearchContext) {
    self->_CRSearchContext = sub_100016694();
  }
  if (!self->_CRPhoneSearchContext) {
    self->_CRPhoneSearchContext = sub_100016B38();
  }
  int v8 = sqlite3_extended_result_codes(ppDb, 1);
  if (v8)
  {
    int v6 = v8;
    CFStringRef v7 = @"enabling extended error codes";
    goto LABEL_33;
  }
  int function = sqlite3_create_function(ppDb, "icusearch", 3, 1, self->_ICUSearchContext, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100016574, 0, 0);
  if (function)
  {
    int v6 = function;
    CFStringRef v7 = @"creating custom icusearch function";
    goto LABEL_33;
  }
  int v10 = sqlite3_create_function(ppDb, "cpsearch", 3, 1, self->_CRSearchContext, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100016700, 0, 0);
  if (v10)
  {
    int v6 = v10;
    CFStringRef v7 = @"creating custom cpsearch function";
    goto LABEL_33;
  }
  int v11 = sqlite3_create_function(ppDb, "phonesearch", 3, 1, self->_CRPhoneSearchContext, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100016B48, 0, 0);
  if (v11)
  {
    int v6 = v11;
    CFStringRef v7 = @"creating custom phonesearch function";
    goto LABEL_33;
  }
  int busy = sqlite3_busy_timeout(ppDb, 0x7FFFFFFF);
  if (busy)
  {
    int v6 = busy;
    CFStringRef v7 = @"setting busy timeout";
    goto LABEL_33;
  }
  int v13 = sub_100004B3C(ppDb, "PRAGMA page_size = 4096;", 0, 0, 0);
  if (v13)
  {
    int v6 = v13;
    CFStringRef v7 = @"setting page_size";
    goto LABEL_33;
  }
  int v14 = sub_100004B3C(ppDb, "PRAGMA auto_vacuum = 1;", 0, 0, 0);
  if (v14)
  {
    int v6 = v14;
    CFStringRef v7 = @"setting auto_vacuum";
    goto LABEL_33;
  }
  int v15 = sub_100004B3C(ppDb, "PRAGMA cache_size = 100;", 0, 0, 0);
  if (v15)
  {
    int v6 = v15;
    CFStringRef v7 = @"setting cache_size";
    goto LABEL_33;
  }
  int v16 = sub_100004B3C(ppDb, "PRAGMA journal_mode = WAL;", 0, 0, 0);
  if (v16)
  {
    int v6 = v16;
    CFStringRef v7 = @"setting journal_mode";
    goto LABEL_33;
  }
  int v17 = sub_100004B3C(ppDb, "PRAGMA foreign_keys = ON;", 0, 0, 0);
  if (v17)
  {
    int v6 = v17;
    CFStringRef v7 = @"setting foreign_keys";
    goto LABEL_33;
  }
  int v6 = 0;
  if (ppDb) {
    self->_db = ppDb;
  }
  return v6;
}

- (void)close
{
  if (self->_db)
  {
    v3 = +[CRLogging log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      db = self->_db;
      int v6 = 134217984;
      CFStringRef v7 = db;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing sqlite connection %p", (uint8_t *)&v6, 0xCu);
    }
    statementCache = self->_statementCache;
    if (statementCache) {
      CFDictionaryApplyFunction(statementCache, (CFDictionaryApplierFunction)sub_1000148D8, 0);
    }
    sqlite3_close(self->_db);
    self->_db = 0;
  }
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (int)beginTransaction
{
  return [(CRSQLiteConnection *)self beginTransactionWithType:0];
}

- (int)rollbackTransaction
{
  db = self->_db;
  if (!db) {
    sub_10001B370();
  }
  if (!self->_transactionCount) {
    return 0;
  }
  int result = sub_100004B3C(db, "ROLLBACK", 0, 0, 0);
  self->_unint64_t transactionCount = 0;
  return result;
}

- (sqlite3)db
{
  return self->_db;
}

@end
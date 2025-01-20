@interface GEOAPDebugPersistence
+ (id)sharedInstance;
- (GEOAPDebugPersistence)init;
- (GEOAPDebugPersistence)initWithDBFilePath:(id)a3;
- (void)_configureDatabase;
- (void)addInflightUploadWithBatchUUID:(id)a3 createTime:(id)a4 sessionType:(int)a5 eventCount:(unsigned int)a6 uploadSize:(unsigned int)a7 uploadPolicy:(int)a8 stageNum:(unsigned int)a9;
- (void)addUploadHistoryForBatchUUID:(id)a3 completionTime:(id)a4 latency:(unsigned int)a5 sessionType:(int)a6 eventCount:(unsigned int)a7 uploadSize:(unsigned int)a8 uploadPolicy:(int)a9 stageNum:(unsigned int)a10;
- (void)dealloc;
- (void)deleteAllHistory;
- (void)removeInflightUploadWithBatchUUID:(id)a3;
- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5;
- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4;
- (void)showUploadCounts:(id)a3;
- (void)tearDown;
@end

@implementation GEOAPDebugPersistence

+ (id)sharedInstance
{
  if (qword_100033E28 != -1) {
    dispatch_once(&qword_100033E28, &stru_100028E70);
  }
  v2 = (void *)qword_100033E20;
  return v2;
}

- (GEOAPDebugPersistence)init
{
  v3 = +[GEOAPUtils GEOAPCachePath];
  v4 = [v3 stringByAppendingPathComponent:@"APDebug.db"];

  v5 = [(GEOAPDebugPersistence *)self initWithDBFilePath:v4];
  return v5;
}

- (GEOAPDebugPersistence)initWithDBFilePath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOAPDebugPersistence;
  v6 = [(GEOAPDebugPersistence *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dbFilePath, a3);
    v8 = +[GEOKeyBagNotification sharedObject];
    v7->_firstAuthComplete = [v8 addDataDidBecomeAvailableAfterFirstUnlockObserver:v7] ^ 1;

    if (v7->_firstAuthComplete) {
      [(GEOAPDebugPersistence *)v7 _configureDatabase];
    }
  }

  return v7;
}

- (void)_configureDatabase
{
  v3 = +[GEOSQLiteDB defaultPragmas];
  id v9 = [v3 mutableCopy];

  [v9 setObject:0 forKeyedSubscript:@"foreign_keys"];
  v4 = +[NSURL URLWithString:self->_dbFilePath];
  id v5 = objc_alloc((Class)GEOSQLiteDB);
  v6 = sub_10001214C();
  v7 = (GEOSQLiteDB *)[v5 initWithQueueName:"com.apple.geo.analytics.debugdb" log:v6 databaseFileURL:v4 sqliteFlags:3145728 pragmas:v9 setupBlock:&stru_100028EB0 tearDownBlock:&stru_100028EF0];
  db = self->_db;
  self->_db = v7;

  self->_firstAuthComplete = 1;
}

- (void)dealloc
{
  [(GEOAPDebugPersistence *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)GEOAPDebugPersistence;
  [(GEOAPDebugPersistence *)&v3 dealloc];
}

- (void)tearDown
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000124EC;
  v3[3] = &unk_1000288E8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

- (void)deleteAllHistory
{
  if (sub_1000120BC((uint64_t)self))
  {
    db = self->_db;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000125B8;
    v4[3] = &unk_1000288E8;
    v4[4] = self;
    [(GEOSQLiteDB *)db executeSync:v4];
  }
}

- (void)addUploadHistoryForBatchUUID:(id)a3 completionTime:(id)a4 latency:(unsigned int)a5 sessionType:(int)a6 eventCount:(unsigned int)a7 uploadSize:(unsigned int)a8 uploadPolicy:(int)a9 stageNum:(unsigned int)a10
{
  id v16 = a3;
  id v17 = a4;
  if (sub_1000120BC((uint64_t)self))
  {
    [v17 timeIntervalSince1970];
    v19 = (void *)(uint64_t)v18;
    objc_initWeak(&location, self);
    db = self->_db;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100012744;
    v21[3] = &unk_100028F80;
    objc_copyWeak(v23, &location);
    id v22 = v16;
    v23[1] = v19;
    unsigned int v24 = a5;
    int v25 = a6;
    unsigned int v26 = a7;
    unsigned int v27 = a8;
    int v28 = a9;
    unsigned int v29 = a10;
    [(GEOSQLiteDB *)db executeAsync:v21];

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

- (void)addInflightUploadWithBatchUUID:(id)a3 createTime:(id)a4 sessionType:(int)a5 eventCount:(unsigned int)a6 uploadSize:(unsigned int)a7 uploadPolicy:(int)a8 stageNum:(unsigned int)a9
{
  id v15 = a3;
  id v16 = a4;
  if (sub_1000120BC((uint64_t)self))
  {
    [v16 timeIntervalSince1970];
    double v18 = (void *)(uint64_t)v17;
    objc_initWeak(&location, self);
    db = self->_db;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100012C0C;
    v20[3] = &unk_100028FD0;
    objc_copyWeak(v22, &location);
    id v21 = v15;
    v22[1] = v18;
    int v23 = a5;
    unsigned int v24 = a6;
    unsigned int v25 = a7;
    int v26 = a8;
    unsigned int v27 = a9;
    [(GEOSQLiteDB *)db executeAsync:v20];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

- (void)removeInflightUploadWithBatchUUID:(id)a3
{
  id v4 = a3;
  if (sub_1000120BC((uint64_t)self))
  {
    objc_initWeak(&location, self);
    db = self->_db;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100012FBC;
    v6[3] = &unk_100029020;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [(GEOSQLiteDB *)db executeAsync:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)showHistoryOfAge:(unsigned int)a3 withVisitorBlock:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSDate);
  [v10 timeIntervalSince1970];
  v12 = (void *)(vcvtmd_s64_f64(v11) - a3);
  objc_initWeak(&location, self);
  db = self->_db;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000131F8;
  v16[3] = &unk_100029070;
  objc_copyWeak(v19, &location);
  id v14 = v9;
  id v17 = v14;
  v19[1] = v12;
  id v15 = v8;
  id v18 = v15;
  [(GEOSQLiteDB *)db executeAsync:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

- (void)showInflightUploadsWithVisitorBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000135A4;
  v11[3] = &unk_1000290C0;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [(GEOSQLiteDB *)db executeAsync:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)showUploadCounts:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000138C8;
  v7[3] = &unk_100029110;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeSync:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFilePath, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
@interface GEOAPPersistence
+ (id)sharedInstance;
- (BOOL)evalModeEnabled;
- (GEOAPPersistence)init;
- (GEOAPPersistence)initWithDBFilePath:(id)a3;
- (id)selectBatchIdsForBatchUpload;
- (int64_t)_analyticsCount;
- (void)_configureDatabase;
- (void)_setupEvalStmtsOnDb:(id)a3;
- (void)_writeDailyCountElem:(id)a3;
- (void)_writeDailyCountElem:(id)a3 withStmtKey:(id)a4;
- (void)_writeDailySettingsElem:(id)a3;
- (void)_writeLogMsgQueueElem:(id)a3;
- (void)_writeMonthlyCountElem:(id)a3;
- (void)_writeRRLogElem:(id)a3;
- (void)clearAllData;
- (void)clearExpiredLogMsgsWithResultBlock:(id)a3;
- (void)clearPendingLogMsgElemsForBatchUploadWithBatchId:(unint64_t)a3;
- (void)dealloc;
- (void)flushEvalData;
- (void)processMapsAppDeletion;
- (void)selectCountsWithQueryStmtKey:(id)a3 deleteStmtKey:(id)a4 visitorBlock:(id)a5 completionBlock:(id)a6;
- (void)selectDailyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4;
- (void)selectDailySettingsWithVisitorBlock:(id)a3 completionBlock:(id)a4;
- (void)selectLogMsgsForBatchUploadWithBatchId:(unint64_t)a3 visitorBlock:(id)a4 completionBlock:(id)a5;
- (void)selectMonthlyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalDataWithVisitorBlock:(id)a3;
- (void)storeLogMsgElems:(id)a3;
- (void)tearDown;
@end

@implementation GEOAPPersistence

- (id)selectBatchIdsForBatchUpload
{
  if (sub_100005360((uint64_t)self))
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    db = self->_db;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002438;
    v9[3] = &unk_100029238;
    v9[4] = self;
    id v5 = v3;
    id v10 = v5;
    [(GEOSQLiteDB *)db executeSync:v9];
    v6 = v10;
    id v7 = v5;
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }
  return v7;
}

- (void)storeLogMsgElems:(id)a3
{
  id v4 = a3;
  if (sub_100005360((uint64_t)self) && [v4 count])
  {
    uint64_t Integer = GEOConfigGetInteger();
    db = self->_db;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100002658;
    v7[3] = &unk_100029210;
    v7[4] = self;
    uint64_t v9 = Integer;
    id v8 = v4;
    [(GEOSQLiteDB *)db executeSync:v7];
  }
}

- (void)_writeLogMsgQueueElem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 expireTime];
  [v5 timeIntervalSince1970];
  uint64_t v7 = (uint64_t)v6;

  db = self->_db;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100002B74;
  v14[3] = &unk_1000291C0;
  v14[4] = self;
  id v9 = v4;
  id v15 = v9;
  uint64_t v16 = v7;
  [(GEOSQLiteDB *)db executeStatement:@"insA" statementBlock:v14];
  if (self->_shadowEnabled)
  {
    id v10 = self->_db;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100014468;
    v11[3] = &unk_100028FF8;
    id v12 = v9;
    v13 = self;
    [(GEOSQLiteDB *)v10 executeStatement:@"insS" statementBlock:v11];
  }
}

- (BOOL)evalModeEnabled
{
  return self->_shadowEnabled;
}

+ (id)sharedInstance
{
  if (qword_100033E48 != -1) {
    dispatch_once(&qword_100033E48, &stru_100029150);
  }
  v2 = (void *)qword_100033E40;
  return v2;
}

- (int64_t)_analyticsCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  db = self->_db;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002524;
  v5[3] = &unk_1000290E8;
  v5[4] = self;
  v5[5] = &v6;
  [(GEOSQLiteDB *)db statementForKey:@"count" statementBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (GEOAPPersistence)init
{
  int64_t v3 = +[GEOAPUtils GEOAPCachePath];
  id v4 = [v3 stringByAppendingPathComponent:@"AP.db"];

  id v5 = [(GEOAPPersistence *)self initWithDBFilePath:v4];
  return v5;
}

- (GEOAPPersistence)initWithDBFilePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAPPersistence;
  uint64_t v6 = [(GEOAPPersistence *)&v9 init];
  if (v6)
  {
    v6->_shadowEnabled = GEOConfigGetBOOL();
    objc_storeStrong((id *)&v6->_dbFilePath, a3);
    uint64_t v7 = +[GEOKeyBagNotification sharedObject];
    v6->_firstAuthComplete = [v7 addDataDidBecomeAvailableAfterFirstUnlockObserver:v6] ^ 1;

    if (v6->_firstAuthComplete) {
      [(GEOAPPersistence *)v6 _configureDatabase];
    }
  }

  return v6;
}

- (void)_configureDatabase
{
  int64_t v3 = +[GEOSQLiteDB defaultPragmas];
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"foreign_keys"];
  id v5 = +[NSURL URLWithString:self->_dbFilePath];
  id v6 = objc_alloc((Class)GEOSQLiteDB);
  uint64_t v7 = sub_1000051F8();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013E60;
  v10[3] = &unk_100029178;
  v10[4] = self;
  uint64_t v8 = (GEOSQLiteDB *)[v6 initWithQueueName:"com.apple.geo.analytics.db" log:v7 databaseFileURL:v5 sqliteFlags:3145728 pragmas:v4 setupBlock:v10 tearDownBlock:&stru_100029198];
  db = self->_db;
  self->_db = v8;

  self->_firstAuthComplete = 1;
}

- (void)_setupEvalStmtsOnDb:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000142D8;
  block[3] = &unk_1000288E8;
  id v6 = a3;
  uint64_t v3 = qword_100033E50;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_100033E50, block);
  }
}

- (void)dealloc
{
  [(GEOAPPersistence *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)GEOAPPersistence;
  [(GEOAPPersistence *)&v3 dealloc];
}

- (void)tearDown
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001445C;
  v3[3] = &unk_1000288E8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

- (void)_writeDailyCountElem:(id)a3 withStmtKey:(id)a4
{
  id v6 = a3;
  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001464C;
  v9[3] = &unk_100028FF8;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [(GEOSQLiteDB *)db executeStatement:a4 statementBlock:v9];
}

- (void)_writeDailyCountElem:(id)a3
{
}

- (void)_writeMonthlyCountElem:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000051F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "writing monthly elem : %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOAPPersistence *)self _writeDailyCountElem:v4 withStmtKey:@"insMC"];
}

- (void)_writeDailySettingsElem:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014A54;
  v7[3] = &unk_100028FF8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  [(GEOSQLiteDB *)db executeStatement:@"insDS" statementBlock:v7];
}

- (void)_writeRRLogElem:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014BFC;
  v7[3] = &unk_100028FF8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOSQLiteDB *)db executeStatement:@"insS" statementBlock:v7];
}

- (void)selectLogMsgsForBatchUploadWithBatchId:(unint64_t)a3 visitorBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (sub_100005360((uint64_t)self))
  {
    db = self->_db;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100014DA8;
    v11[3] = &unk_1000292D8;
    void v11[4] = self;
    unint64_t v14 = a3;
    id v12 = v8;
    id v13 = v9;
    [(GEOSQLiteDB *)db executeSync:v11];
  }
}

- (void)selectCountsWithQueryStmtKey:(id)a3 deleteStmtKey:(id)a4 visitorBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = sub_1000051F8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[GEOAPPersistence selectCountsWithQueryStmtKey:deleteStmtKey:visitorBlock:completionBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  db = self->_db;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100015328;
  v20[3] = &unk_100029378;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  [(GEOSQLiteDB *)db executeSync:v20];
}

- (void)selectDailyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4
{
}

- (void)selectMonthlyCountsWithVisitorBlock:(id)a3 completionBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000159A4;
  v7[3] = &unk_1000293A0;
  id v8 = a3;
  id v6 = v8;
  [(GEOAPPersistence *)self selectCountsWithQueryStmtKey:@"qryMC" deleteStmtKey:@"delMC" visitorBlock:v7 completionBlock:a4];
}

- (void)selectDailySettingsWithVisitorBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  db = self->_db;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015A78;
  v11[3] = &unk_1000293F0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(GEOSQLiteDB *)db executeSync:v11];
}

- (void)clearExpiredLogMsgsWithResultBlock:(id)a3
{
  id v4 = a3;
  if (sub_100005360((uint64_t)self))
  {
    id v5 = +[NSDate date];
    [v5 timeIntervalSince1970];
    db = self->_db;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015EF0;
    v8[3] = &unk_100029440;
    v8[4] = self;
    uint64_t v10 = (uint64_t)v7;
    id v9 = v4;
    [(GEOSQLiteDB *)db executeSync:v8];
  }
}

- (void)clearPendingLogMsgElemsForBatchUploadWithBatchId:(unint64_t)a3
{
  if (sub_100005360((uint64_t)self))
  {
    db = self->_db;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000163CC;
    v6[3] = &unk_100028C10;
    v6[4] = self;
    v6[5] = a3;
    [(GEOSQLiteDB *)db executeSync:v6];
  }
}

- (void)clearAllData
{
  if (sub_100005360((uint64_t)self))
  {
    db = self->_db;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000165C0;
    v4[3] = &unk_1000288E8;
    v4[4] = self;
    [(GEOSQLiteDB *)db executeAsync:v4];
  }
}

- (void)processMapsAppDeletion
{
  if (sub_100005360((uint64_t)self))
  {
    db = self->_db;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100016688;
    v4[3] = &unk_1000288E8;
    v4[4] = self;
    [(GEOSQLiteDB *)db executeSync:v4];
    _GEOConfigRemoveValueSync();
    _GEOConfigRemoveValueSync();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbFilePath, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)setEvalMode:(BOOL)a3
{
  db = self->_db;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017234;
  v4[3] = &unk_1000294D0;
  v4[4] = self;
  BOOL v5 = a3;
  [(GEOSQLiteDB *)db executeSync:v4];
}

- (void)flushEvalData
{
  db = self->_db;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100017300;
  v3[3] = &unk_1000288E8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

- (void)showEvalDataWithVisitorBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000051F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[GEOAPPersistence(Eval) showEvalDataWithVisitorBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  db = self->_db;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000174C8;
  v9[3] = &unk_100029518;
  void v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  [(GEOSQLiteDB *)db executeSync:v9];
  id v8 = sub_1000051F8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "showEvalDataWithVisitorBlock: done", buf, 2u);
  }
}

@end
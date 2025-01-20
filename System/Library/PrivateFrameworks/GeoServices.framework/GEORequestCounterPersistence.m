@interface GEORequestCounterPersistence
+ (GEORequestCounterPersistence)sharedInstance;
- (BOOL)enabled;
- (GEORequestCounterPersistence)init;
- (GEORequestCounterPersistence)initWithDBFilePath:(id)a3 maxCountAge:(double)a4;
- (void)_purgeOlderThan:(id)a3;
- (void)_tearDown;
- (void)addPlaceCacheResultForApp:(id)a3 timestamp:(id)a4 requestTypeRaw:(int)a5 result:(unsigned __int8)a6;
- (void)countsDuring:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)externalRequestsCount:(id)a3;
- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5;
- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9;
- (void)getPlaceCacheResultsInTimeRange:(id)a3 rawCounts:(id)a4 complete:(id)a5;
- (void)incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11;
- (void)incrementForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 requestType:(int)a6 result:(unsigned __int8)a7 xmitBytes:(int64_t)a8 recvBytes:(int64_t)a9 usedInterfaces:(unint64_t)a10 withCompletion:(id)a11;
- (void)logsDuring:(id)a3 withCompletion:(id)a4;
- (void)purgeAllCounts;
- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4;
- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7;
- (void)setEnabled:(BOOL)a3;
- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4;
@end

@implementation GEORequestCounterPersistence

- (void)addPlaceCacheResultForApp:(id)a3 timestamp:(id)a4 requestTypeRaw:(int)a5 result:(unsigned __int8)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (self->_enabled)
  {
    db = self->_db;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__GEORequestCounterPersistence_addPlaceCacheResultForApp_timestamp_requestTypeRaw_result___block_invoke;
    v14[3] = &unk_1E53ECCC0;
    v14[4] = self;
    id v15 = v11;
    id v16 = v10;
    int v17 = a5;
    unsigned __int8 v18 = a6;
    [(GEOSQLiteDB *)db executeAsync:v14];
  }
}

+ (GEORequestCounterPersistence)sharedInstance
{
  if (qword_1EB2A03B8 != -1) {
    dispatch_once(&qword_1EB2A03B8, &__block_literal_global_175);
  }
  v2 = (void *)_MergedGlobals_313;

  return (GEORequestCounterPersistence *)v2;
}

void __46__GEORequestCounterPersistence_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEORequestCounterPersistence);
  v1 = (void *)_MergedGlobals_313;
  _MergedGlobals_313 = (uint64_t)v0;
}

- (GEORequestCounterPersistence)init
{
  v3 = +[GEOFilePaths pathFor:26];
  v4 = [(GEORequestCounterPersistence *)self initWithDBFilePath:v3 maxCountAge:2592000.0];

  return v4;
}

- (GEORequestCounterPersistence)initWithDBFilePath:(id)a3 maxCountAge:(double)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORequestCounterPersistence;
  v7 = [(GEORequestCounterPersistence *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_maxAge = fabs(a4);
    v9 = [[GEOSQLiteDB alloc] initWithQueueName:"com.apple.geo.requestcounter" logFacility:"GEORequestCounter" dbFilePath:v6 sqliteFlags:0 pragmas:0 setupBlock:&__block_literal_global_62];
    db = v8->_db;
    v8->_db = v9;

    id v11 = v8;
  }

  return v8;
}

uint64_t __63__GEORequestCounterPersistence_initWithDBFilePath_maxCountAge___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend(v2, "user_version");
  v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  if (v3 == 9)
  {
    setupGYBStatements(v2, 0);
  }
  else
  {
    setupGYBStatements(v2, 1);

    objc_msgSend(v2, "setUser_version:", 9);
    v4 = v2;
  }

  return 1;
}

- (void)dealloc
{
  [(GEORequestCounterPersistence *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)GEORequestCounterPersistence;
  [(GEORequestCounterPersistence *)&v3 dealloc];
}

- (void)_tearDown
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__GEORequestCounterPersistence__tearDown__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeSync:v3];
}

uint64_t __41__GEORequestCounterPersistence__tearDown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

- (void)incrementForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 requestType:(int)a6 result:(unsigned __int8)a7 xmitBytes:(int64_t)a8 recvBytes:(int64_t)a9 usedInterfaces:(unint64_t)a10 withCompletion:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a11;
  if (self->_enabled && [v17 length])
  {
    if (!v18)
    {
      id v18 = [MEMORY[0x1E4F1C9C8] date];
    }
    if (v19) {
      v21 = v19;
    }
    else {
      v21 = v18;
    }
    id v22 = v21;

    v23 = (void *)[v20 copy];
    db = self->_db;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke;
    v27[3] = &unk_1E53ECA98;
    id v18 = v18;
    id v28 = v18;
    id v19 = v22;
    id v29 = v19;
    v30 = self;
    int v36 = a6;
    unsigned __int8 v37 = a7;
    id v31 = v17;
    int64_t v33 = a8;
    int64_t v34 = a9;
    unint64_t v35 = a10;
    id v32 = v23;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke_2;
    v25[3] = &unk_1E53DB698;
    id v26 = v32;
    id v20 = v32;
    [(GEOSQLiteDB *)db executeAsync:v27 errorHandler:v25];

    goto LABEL_11;
  }
  if (v20)
  {
    (*((void (**)(id, void))v20 + 2))(v20, 0);
LABEL_11:
  }
}

void __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  id v6 = *(void **)(a1 + 56);
  uint64_t v19 = *(int *)(a1 + 96);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 100);
  uint64_t v8 = *(void *)(a1 + 88);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v9 = *(id *)(*(void *)(a1 + 48) + 8);
  id v10 = v6;
  uint64_t v33 = 0;
  int64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  int v36 = __Block_byref_object_copy__84;
  unsigned __int8 v37 = __Block_byref_object_dispose__84;
  id v38 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __reqcountdata_insert_block_invoke;
  v23 = &unk_1E53ECD60;
  id v11 = v9;
  id v24 = v11;
  id v26 = &v33;
  uint64_t v27 = v3;
  uint64_t v28 = v5;
  id v12 = v10;
  id v25 = v12;
  uint64_t v29 = v19;
  uint64_t v30 = v7;
  long long v31 = v18;
  uint64_t v32 = v8;
  [v11 executeStatement:@"reqcountdata_insert" statementBlock:&v20];
  objc_super v13 = (void *)v34[5];
  if (v13) {
    id v14 = v13;
  }

  _Block_object_dispose(&v33, 8);
  id v15 = v13;
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v15);
  }
  id v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", -*(double *)(*(void *)(a1 + 48) + 16), v18, v19, v20, v21, v22, v23);
  [*(id *)(a1 + 48) _purgeOlderThan:v17];
}

uint64_t __135__GEORequestCounterPersistence_incrementForApp_startTime_endTime_requestType_result_xmitBytes_recvBytes_usedInterfaces_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)countsDuring:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && self->_db)
  {
    if (v6)
    {
      uint64_t v8 = [v6 startDate];
      [v8 timeIntervalSinceReferenceDate];
      uint64_t v10 = v9;

      [v6 endDate];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v11 timeIntervalSinceReferenceDate];
      uint64_t v10 = v12;

      [MEMORY[0x1E4F1C9C8] distantFuture];
    objc_super v13 = };
    [v13 timeIntervalSinceReferenceDate];
    uint64_t v15 = v14;

    db = self->_db;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke;
    v19[3] = &unk_1E53ECB10;
    v19[4] = self;
    uint64_t v21 = v10;
    uint64_t v22 = v15;
    id v20 = v7;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2_74;
    v17[3] = &unk_1E53DB698;
    id v18 = v20;
    [(GEOSQLiteDB *)db executeAsync:v19 errorHandler:v17];
  }
}

void __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2;
  v21[3] = &unk_1E53ECAC0;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v4 = v2;
  id v22 = v4;
  id v5 = v3;
  id v6 = v21;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__84;
  uint64_t v27 = __Block_byref_object_dispose__84;
  id v28 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v30 = __reqcountdata_readcounts_block_invoke;
  long long v31 = &unk_1E53D9C40;
  id v7 = v5;
  id v32 = v7;
  int64_t v34 = &v23;
  long long v35 = v18;
  uint64_t v8 = v6;
  id v33 = v8;
  char v9 = [v7 statementForKey:@"reqcountdata_readcounts" statementBlock:&buf];
  uint64_t v10 = (void *)v24[5];
  if (v10) {
    id v11 = v10;
  }

  _Block_object_dispose(&v23, 8);
  id v12 = v10;
  if (v9)
  {
    objc_super v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_71;
    v19[3] = &unk_1E53ECAE8;
    id v20 = v13;
    id v14 = v13;
    [v4 enumerateKeysAndObjectsUsingBlock:v19];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = (void *)[v14 copy];
    (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
  }
  else
  {
    id v17 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "error reading request counter table (%@)", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  id v17 = a2;
  long long v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];

  if (!v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:v17];
  }
  id v20 = [NSNumber numberWithInteger:a3];
  uint64_t v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];
  id v22 = [v21 objectForKeyedSubscript:v20];

  if (!v22)
  {
    uint64_t v23 = objc_alloc_init(GEORequestCounterStatistics);
    id v24 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];
    [v24 setObject:v23 forKeyedSubscript:v20];
  }
  if (a9 <= a8) {
    double v25 = 0.0;
  }
  else {
    double v25 = a9 - a8;
  }
  id v26 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];
  uint64_t v27 = [v26 objectForKeyedSubscript:v20];

  [v27 incrementBytesTransmitted:a5];
  [v27 incrementBytesReceived:a6];
  [v27 incrementCountForResult:a4];
  [v27 incrementDuration:v25];
  [v27 addUsedInterfaces:a7];

  return 1;
}

void __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[GEORequestCounterInfo alloc] initWithDictionary:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

uint64_t __60__GEORequestCounterPersistence_countsDuring_withCompletion___block_invoke_2_74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logsDuring:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke;
  v13[3] = &unk_1E53D7F70;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_3;
  v11[3] = &unk_1E53DB698;
  id v12 = v16;
  id v9 = v16;
  id v10 = v6;
  [(GEOSQLiteDB *)db executeAsync:v13 errorHandler:v11];
}

void __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = (void *)a1[4];
  if (v3) {
    [v3 startDate];
  }
  else {
  id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;

  id v7 = (void *)a1[4];
  if (v7) {
    [v7 endDate];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;

  id v11 = *(void **)(a1[5] + 8);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  double v25 = __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_2;
  id v26 = &unk_1E53ECB38;
  id v12 = v2;
  id v27 = v12;
  id v13 = v11;
  id v14 = &v23;
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  unsigned __int8 v37 = __Block_byref_object_copy__84;
  id v38 = __Block_byref_object_dispose__84;
  id v39 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __reqcountdata_readlog_block_invoke;
  v28[3] = &unk_1E53D9C40;
  id v15 = v13;
  id v29 = v15;
  long long v31 = &v34;
  uint64_t v32 = v6;
  uint64_t v33 = v10;
  id v16 = v14;
  uint64_t v30 = v16;
  char v17 = objc_msgSend(v15, "statementForKey:statementBlock:", @"reqcountdata_readlog", v28, v23, v24, v25, v26);
  long long v18 = (void *)v35[5];
  if (v18) {
    id v19 = v18;
  }

  _Block_object_dispose(&v34, 8);
  id v20 = v18;
  if ((v17 & 1) == 0) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  uint64_t v21 = a1[6];
  id v22 = (void *)[v12 copy];
  (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v22, 0);
}

uint64_t __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  v31[8] = *MEMORY[0x1E4F143B8];
  v31[0] = a2;
  char v17 = NSNumber;
  id v18 = a2;
  id v19 = objc_msgSend(v17, "numberWithInteger:", a3, @"appID", @"type");
  v31[1] = v19;
  v30[2] = @"xmitB";
  id v20 = [NSNumber numberWithLongLong:a5];
  v31[2] = v20;
  v30[3] = @"recvB";
  uint64_t v21 = [NSNumber numberWithLongLong:a6];
  v31[3] = v21;
  v30[4] = @"result";
  id v22 = [NSNumber numberWithInteger:a4];
  v31[4] = v22;
  v30[5] = @"start";
  uint64_t v23 = [NSNumber numberWithDouble:a8];
  v31[5] = v23;
  v30[6] = @"end";
  uint64_t v24 = [NSNumber numberWithDouble:a9];
  v31[6] = v24;
  v30[7] = @"iface";
  double v25 = [NSNumber numberWithUnsignedInteger:a7];
  v31[7] = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];

  id v27 = *(void **)(a1 + 32);
  id v28 = +[GEORequestCounterLogInfo counterLogInfoWithDictionary:v26];
  [v27 addObject:v28];

  return 1;
}

uint64_t __58__GEORequestCounterPersistence_logsDuring_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_purgeOlderThan:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_db)
  {
    [v4 timeIntervalSinceReferenceDate];
    double v7 = (double)(uint64_t)v6;
    uint64_t v8 = self->_db;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__84;
    uint64_t v33 = __Block_byref_object_dispose__84;
    id v34 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v36 = __reqcountdata_prune_block_invoke;
    unsigned __int8 v37 = &unk_1E53D7A50;
    uint64_t v9 = v8;
    double v40 = v7;
    id v38 = v9;
    id v39 = &v29;
    BOOL v10 = [(GEOSQLiteDB *)v9 executeStatement:@"reqcountdata_prune" statementBlock:&buf];
    id v11 = (void *)v30[5];
    if (v11) {
      id v12 = v11;
    }

    _Block_object_dispose(&v29, 8);
    id v13 = v11;
    if (!v10)
    {
      id v14 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "something went wrong while purging old request counts: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v15 = self->_db;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__84;
    uint64_t v33 = __Block_byref_object_dispose__84;
    id v34 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v36 = __externalreqcountdata_prune_block_invoke;
    unsigned __int8 v37 = &unk_1E53D7A50;
    id v16 = v15;
    double v40 = v7;
    id v38 = v16;
    id v39 = &v29;
    BOOL v17 = [(GEOSQLiteDB *)v16 executeStatement:@"externalreqcountdata_prune" statementBlock:&buf];
    id v18 = (void *)v30[5];
    id v19 = v13;
    if (v18) {
      id v19 = v18;
    }

    _Block_object_dispose(&v29, 8);
    id v20 = v19;

    if (!v17)
    {
      uint64_t v21 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "something went wrong while purging old external request counts: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v22 = self->_db;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__84;
    uint64_t v33 = __Block_byref_object_dispose__84;
    id v34 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v36 = __placecache_prune_block_invoke;
    unsigned __int8 v37 = &unk_1E53D7A50;
    uint64_t v23 = v22;
    double v40 = v7;
    id v38 = v23;
    id v39 = &v29;
    BOOL v24 = [(GEOSQLiteDB *)v23 executeStatement:@"placecache_prune" statementBlock:&buf];
    double v25 = (void *)v30[5];
    id v26 = v20;
    if (v25) {
      id v26 = v25;
    }

    _Block_object_dispose(&v29, 8);
    id v27 = v26;

    if (!v24)
    {
      id v28 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "something went wrong while purging old place cache counts: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    id v27 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "delete request on uninitialized db; aborting request",
        (uint8_t *)&buf,
        2u);
    }
  }
}

- (void)purgeAllCounts
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__GEORequestCounterPersistence_purgeAllCounts__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v3];
}

uint64_t __46__GEORequestCounterPersistence_purgeAllCounts__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"reqcountdata_deleteall" statementBlock:&__block_literal_global_204_0];
  [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"proactivetile_deleteall" statementBlock:&__block_literal_global_206_0];
  [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"externalreqcountdata_deleteall" statementBlock:&__block_literal_global_208_0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 executeStatement:@"placecache_deleteall" statementBlock:&__block_literal_global_210_1];
}

- (void)startedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4
{
  id v6 = a3;
  if (self->_enabled)
  {
    double v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceReferenceDate];
    uint64_t v9 = (uint64_t)v8;

    db = self->_db;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__GEORequestCounterPersistence_startedProactiveTileDownloadForIdentifier_policy___block_invoke;
    v11[3] = &unk_1E53ECB60;
    void v11[4] = self;
    unsigned __int8 v14 = a4;
    id v12 = v6;
    uint64_t v13 = v9;
    [(GEOSQLiteDB *)db executeAsync:v11];
  }
}

void __81__GEORequestCounterPersistence_startedProactiveTileDownloadForIdentifier_policy___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  id v5 = v1;
  uint64_t v13 = 0;
  unsigned __int8 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__84;
  BOOL v17 = __Block_byref_object_dispose__84;
  id v18 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v20 = __proactivetile_insertstart_block_invoke;
  uint64_t v21 = &unk_1E53ECD38;
  id v6 = v4;
  id v22 = v6;
  id v7 = v5;
  id v23 = v7;
  BOOL v24 = &v13;
  uint64_t v25 = v2;
  uint64_t v26 = v3;
  char v8 = [v6 executeStatement:@"proactivetile_insertstart" statementBlock:&buf];
  uint64_t v9 = (void *)v14[5];
  if (v9) {
    id v10 = v9;
  }

  _Block_object_dispose(&v13, 8);
  id v11 = v9;
  if ((v8 & 1) == 0)
  {
    id v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "error inserting proactive tile start into db (%@)", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)finishedProactiveTileDownloadForIdentifier:(id)a3 policy:(unsigned __int8)a4 tilesConsidered:(unsigned int)a5 tileDownloadAttempts:(unsigned int)a6 successes:(unsigned int)a7 failures:(unsigned int)a8 bytesDownloaded:(unint64_t)a9
{
  id v15 = a3;
  if (self->_enabled)
  {
    id v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceReferenceDate];
    uint64_t v18 = (uint64_t)v17;

    db = self->_db;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __154__GEORequestCounterPersistence_finishedProactiveTileDownloadForIdentifier_policy_tilesConsidered_tileDownloadAttempts_successes_failures_bytesDownloaded___block_invoke;
    v20[3] = &unk_1E53ECB88;
    v20[4] = self;
    unsigned __int8 v28 = a4;
    id v21 = v15;
    uint64_t v22 = v18;
    unsigned int v24 = a5;
    unsigned int v25 = a6;
    unsigned int v26 = a7;
    unsigned int v27 = a8;
    unint64_t v23 = a9;
    [(GEOSQLiteDB *)db executeAsync:v20];
  }
}

void __154__GEORequestCounterPersistence_finishedProactiveTileDownloadForIdentifier_policy_tilesConsidered_tileDownloadAttempts_successes_failures_bytesDownloaded___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  *(void *)&long long v7 = v5;
  *((void *)&v7 + 1) = HIDWORD(v5);
  long long v8 = v7;
  *(void *)&long long v7 = v6;
  *((void *)&v7 + 1) = HIDWORD(v6);
  long long v15 = v8;
  id v9 = *(id *)(*(void *)(a1 + 32) + 8);
  id v10 = v1;
  uint64_t v25 = 0;
  unsigned int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  unsigned __int8 v28 = __Block_byref_object_copy__84;
  uint64_t v29 = __Block_byref_object_dispose__84;
  id v30 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __proactivetile_insertend_block_invoke;
  v16[3] = &unk_1E53ECD60;
  id v11 = v9;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v19 = &v25;
  uint64_t v20 = v2;
  uint64_t v21 = v4;
  long long v22 = v15;
  long long v23 = v7;
  uint64_t v24 = v3;
  [v11 executeStatement:@"proactivetile_insertend" statementBlock:v16];
  uint64_t v13 = (void *)v26[5];
  if (v13) {
    id v14 = v13;
  }

  _Block_object_dispose(&v25, 8);
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    db = self->_db;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke;
    v11[3] = &unk_1E53D7F70;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_4;
    v9[3] = &unk_1E53DB698;
    id v10 = v13;
    [(GEOSQLiteDB *)db executeAsync:v11 errorHandler:v9];
  }
}

void __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v1 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v5 = (uint64_t)v4;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_2;
  v28[3] = &unk_1E53ECBB0;
  id v6 = v2;
  id v29 = v6;
  id v7 = v1;
  id v30 = v7;
  id v8 = v3;
  id v9 = v28;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__84;
  v36[4] = __Block_byref_object_dispose__84;
  id v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __proactivetile_query_block_invoke;
  v31[3] = &unk_1E53D9BC8;
  id v10 = v8;
  id v34 = v36;
  uint64_t v35 = v5;
  id v32 = v10;
  id v11 = v9;
  id v33 = v11;
  [v10 statementForKey:@"proactivetile_query" statementBlock:v31];

  _Block_object_dispose(v36, 8);
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v18 = [GEORequestCounterProactiveTileDownloadInfo alloc];
        id v19 = [v6 objectForKeyedSubscript:v17];
        uint64_t v20 = [(GEORequestCounterProactiveTileDownloadInfo *)v18 initWithIdentifier:v17 policies:v19];

        [v12 addObject:v20];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v14);
  }

  id v23 = *(id *)(a1 + 48);
  id v21 = v12;
  geo_dispatch_async_qos();
}

uint64_t __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_2(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v16 = a2;
  uint64_t v17 = (void *)MEMORY[0x18C1203C0]();
  if (v16)
  {
    id v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a4];
    long long v25 = v17;
    if (a5 < 1)
    {
      id v19 = 0;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a5];
    }
    uint64_t v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];

    if (!v20)
    {
      id v21 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v21 forKeyedSubscript:v16];

      [*(id *)(a1 + 40) addObject:v16];
    }
    long long v22 = [[GEORequestCounterProactiveTileDownloadPolicyInfo alloc] initWithPolicy:a3 startTimestamp:v18 endTimestamp:v19 tilesConsidered:a6 successCount:a8 failureCount:a9 bytesDownloaded:a10];
    id v23 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
    [v23 addObject:v22];

    uint64_t v17 = v25;
  }

  return 1;
}

uint64_t __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  geo_dispatch_async_qos();
}

uint64_t __72__GEORequestCounterPersistence_readProactiveTileDownloadsSince_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  id v12 = a3;
  id v13 = [v12 startDate];
  [v13 timeIntervalSinceReferenceDate];
  unint64_t v15 = (unint64_t)v14;

  id v16 = [v12 endDate];

  [v16 timeIntervalSinceReferenceDate];
  unint64_t v18 = (unint64_t)v17;

  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __111__GEORequestCounterPersistence_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke;
  v20[3] = &unk_1E53ECBD8;
  v20[4] = self;
  void v20[5] = v15;
  v20[6] = v18;
  v20[7] = a4;
  v20[8] = a5;
  v20[9] = a6;
  v20[10] = a7;
  [(GEOSQLiteDB *)db executeAsync:v20];
}

void __111__GEORequestCounterPersistence_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v9 = *(_OWORD *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  long long v8 = *(_OWORD *)(a1 + 72);
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__84;
  unint64_t v15 = __Block_byref_object_dispose__84;
  id v16 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  unint64_t v18 = __routepreload_insert_block_invoke;
  id v19 = &unk_1E53ECD88;
  id v2 = v1;
  id v20 = v2;
  id v21 = &v11;
  long long v22 = v10;
  long long v23 = v9;
  long long v24 = v8;
  char v3 = [v2 executeStatement:@"routepreload_insert" statementBlock:&buf];
  id v4 = (void *)v12[5];
  if (v4) {
    id v5 = v4;
  }

  _Block_object_dispose(&v11, 8);
  id v6 = v4;
  if ((v3 & 1) == 0)
  {
    id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "error writing to route preload sessions table (%@)", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__84;
  v20[4] = __Block_byref_object_dispose__84;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  [v8 timeIntervalSinceReferenceDate];
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke;
  v15[3] = &unk_1E53ECC48;
  unint64_t v18 = v20;
  uint64_t v19 = (uint64_t)v12;
  v15[4] = self;
  id v13 = v10;
  id v16 = v13;
  id v14 = v9;
  id v17 = v14;
  [(GEOSQLiteDB *)db executeAsync:v15];

  _Block_object_dispose(v20, 8);
}

void __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2;
  v19[3] = &unk_1E53ECC00;
  uint64_t v3 = *(void *)(a1 + 64);
  void v19[4] = *(void *)(a1 + 56);
  id v4 = v2;
  id v5 = v19;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__84;
  long long v24 = __Block_byref_object_dispose__84;
  id v25 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  long long v27 = __routepreload_read_block_invoke;
  unsigned __int8 v28 = &unk_1E53D9BC8;
  id v6 = v4;
  uint64_t v31 = &v20;
  uint64_t v32 = v3;
  id v29 = v6;
  id v7 = v5;
  id v30 = v7;
  char v8 = [v6 statementForKey:@"routepreload_read" statementBlock:&buf];
  id v9 = (void *)v21[5];
  if (v9) {
    id v10 = v9;
  }

  _Block_object_dispose(&v20, 8);
  id v11 = v9;
  if ((v8 & 1) == 0)
  {
    double v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "error reading from route preload sessions table (%@)", (uint8_t *)&buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) sortUsingComparator:&__block_literal_global_112_0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2_113;
  block[3] = &unk_1E53DBFB0;
  id v13 = *(NSObject **)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v17 = v14;
  uint64_t v18 = v15;
  dispatch_async(v13, block);
}

uint64_t __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a2];
  id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)a3];
  id v17 = (void *)[v14 initWithStartDate:v15 endDate:v16];

  uint64_t v18 = [[GEORoutePreloaderStatistics alloc] initWithDateInterval:v17 transportType:a4 tilesPreloaded:a5 tilesUsed:a6 tilesMissed:a7];
  if (v18) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v18];
  }

  return 1;
}

uint64_t __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateInterval];
  id v6 = [v5 startDate];
  id v7 = [v4 dateInterval];

  char v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __89__GEORequestCounterPersistence_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke_2_113(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  id v23 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if (self->_enabled)
  {
    db = self->_db;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __143__GEORequestCounterPersistence_incrementExternalForApp_startTime_endTime_xmitBytes_recvBytes_usedInterfaces_requestType_requestSubtype_source___block_invoke;
    v24[3] = &unk_1E53ECC70;
    id v25 = v17;
    id v26 = v18;
    long long v27 = self;
    int64_t v32 = a6;
    int64_t v33 = a7;
    unint64_t v34 = a8;
    id v28 = v23;
    id v29 = v19;
    id v30 = v20;
    id v31 = v21;
    [(GEOSQLiteDB *)db executeAsync:v24 errorHandler:0];
  }
}

void __143__GEORequestCounterPersistence_incrementExternalForApp_startTime_endTime_xmitBytes_recvBytes_usedInterfaces_requestType_requestSubtype_source___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  id v6 = *(void **)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 104);
  id v7 = *(void **)(a1 + 64);
  char v8 = *(void **)(a1 + 72);
  uint64_t v9 = *(void **)(a1 + 80);
  long long v24 = *(_OWORD *)(a1 + 88);
  id v10 = *(id *)(*(void *)(a1 + 48) + 8);
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  double v40 = __Block_byref_object_copy__84;
  uint64_t v41 = __Block_byref_object_dispose__84;
  id v42 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __externalreqcountdata_insert_block_invoke;
  v26[3] = &unk_1E53ECDB0;
  id v15 = v10;
  id v27 = v15;
  int64_t v32 = &v37;
  uint64_t v33 = v3;
  uint64_t v34 = v5;
  long long v35 = v24;
  uint64_t v36 = v25;
  id v16 = v11;
  id v28 = v16;
  id v17 = v12;
  id v29 = v17;
  id v18 = v13;
  id v30 = v18;
  id v19 = v14;
  id v31 = v19;
  [v15 executeStatement:@"externalreqcountdata_insert" statementBlock:v26];
  id v20 = (void *)v38[5];
  if (v20) {
    id v21 = v20;
  }

  _Block_object_dispose(&v37, 8);
  id v22 = v20;
  id v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*(double *)(*(void *)(a1 + 48) + 16)];
  [*(id *)(a1 + 48) _purgeOlderThan:v23];
}

- (void)externalRequestsCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke;
    v7[3] = &unk_1E53D7ED0;
    v7[4] = self;
    id v8 = v4;
    [(GEOSQLiteDB *)db executeAsync:v7];
  }
}

void __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke_2;
  id v18 = &unk_1E53ECC98;
  id v4 = v2;
  id v19 = v4;
  id v5 = v3;
  id v6 = &v15;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__84;
  id v28 = __Block_byref_object_dispose__84;
  id v29 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __externalreqcountdata_readcounts_block_invoke;
  v20[3] = &unk_1E53D7C78;
  id v7 = v5;
  id v21 = v7;
  id v8 = v6;
  id v22 = v8;
  id v23 = &v24;
  char v9 = objc_msgSend(v7, "statementForKey:statementBlock:", @"externalreqcountdata_readcounts", v20, v15, v16, v17, v18);
  id v10 = (void *)v25[5];
  if (v10) {
    id v11 = v10;
  }

  _Block_object_dispose(&v24, 8);
  id v12 = v10;
  if ((v9 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = (void *)[v4 copy];
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
}

uint64_t __54__GEORequestCounterPersistence_externalRequestsCount___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, double a9, double a10)
{
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = objc_alloc_init(GEOExternalRequestCounterInfo);
  [(GEOExternalRequestCounterInfo *)v23 setAppId:v22];

  uint64_t v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a9];
  [(GEOExternalRequestCounterInfo *)v23 setStartTime:v24];

  uint64_t v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a10];
  [(GEOExternalRequestCounterInfo *)v23 setEndTime:v25];

  [(GEOExternalRequestCounterInfo *)v23 setXmitBytes:a2];
  [(GEOExternalRequestCounterInfo *)v23 setRecvBytes:a3];
  [(GEOExternalRequestCounterInfo *)v23 setUsedInterface:a4];
  [(GEOExternalRequestCounterInfo *)v23 setRequestType:v21];

  [(GEOExternalRequestCounterInfo *)v23 setRequestSubtype:v20];
  [(GEOExternalRequestCounterInfo *)v23 setSource:v19];

  [*(id *)(a1 + 32) addObject:v23];
  return 1;
}

void __90__GEORequestCounterPersistence_addPlaceCacheResultForApp_timestamp_requestTypeRaw_result___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  uint64_t v4 = v3;
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(int *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 60);
  id v8 = v2;
  id v9 = v5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__84;
  id v30 = __Block_byref_object_dispose__84;
  id v31 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __placecache_insert_block_invoke;
  id v19 = &unk_1E53ECDD8;
  id v10 = v8;
  uint64_t v23 = v4;
  id v20 = v10;
  id v22 = &v26;
  id v11 = v9;
  id v21 = v11;
  uint64_t v24 = v6;
  uint64_t v25 = v7;
  [v10 executeStatement:@"placecache_insert" statementBlock:&v16];
  id v12 = (void *)v27[5];
  if (v12) {
    id v13 = v12;
  }

  _Block_object_dispose(&v26, 8);
  id v14 = v12;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", -*(double *)(*(void *)(a1 + 32) + 16), v16, v17, v18, v19);
  [*(id *)(a1 + 32) _purgeOlderThan:v15];
}

- (void)getPlaceCacheResultsInTimeRange:(id)a3 rawCounts:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    if (v8)
    {
      id v12 = [v8 startDate];
      [v12 timeIntervalSinceReferenceDate];
      uint64_t v14 = v13;

      uint64_t v15 = [v8 endDate];
      [v15 timeIntervalSinceReferenceDate];
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v17 = 0x7FEFFFFFFFFFFFFFLL;
      uint64_t v14 = 0x10000000000000;
    }
    db = self->_db;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke;
    v19[3] = &unk_1E53ECD10;
    void v19[4] = self;
    uint64_t v22 = v14;
    uint64_t v23 = v17;
    id v20 = v9;
    id v21 = v11;
    [(GEOSQLiteDB *)db executeAsync:v19];
  }
}

void __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke_2;
  v11[3] = &unk_1E53ECCE8;
  long long v10 = *(_OWORD *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v3 = v2;
  uint64_t v4 = v11;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__84;
  uint64_t v22 = __Block_byref_object_dispose__84;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __placecache_readcounts_block_invoke;
  v13[3] = &unk_1E53D9C40;
  id v5 = v3;
  id v14 = v5;
  uint64_t v16 = &v18;
  long long v17 = v10;
  uint64_t v6 = v4;
  id v15 = v6;
  [v5 statementForKey:@"placecache_readcounts" statementBlock:v13];
  uint64_t v7 = (void *)v19[5];
  if (v7) {
    id v8 = v7;
  }

  _Block_object_dispose(&v18, 8);
  id v9 = v7;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __83__GEORequestCounterPersistence_getPlaceCacheResultsInTimeRange_rawCounts_complete___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 a4, double a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a2;
  id v11 = [v9 dateWithTimeIntervalSinceReferenceDate:a5];
  (*(void (**)(uint64_t, id, void *, uint64_t, void))(v8 + 16))(v8, v10, v11, a3, a4);

  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end
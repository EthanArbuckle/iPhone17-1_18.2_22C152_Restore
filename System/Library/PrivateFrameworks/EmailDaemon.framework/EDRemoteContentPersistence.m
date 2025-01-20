@interface EDRemoteContentPersistence
+ (id)_remoteContentLinksTableSchemaWithName:(id)a3;
+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)_addRemoteContentLinks:(id)a3 withDate:(id)a4 toTable:(id)a5 withConnection:(id)a6 newLinks:(id *)a7;
- (BOOL)addRemoteContentLinks:(id)a3 newLinks:(id *)a4;
- (BOOL)pruneAllRemoteContentLinksWithMinimumCount:(unint64_t)a3;
- (BOOL)updateRequestCountForRemoteContentLinks:(id)a3 updateLastSeen:(BOOL)a4;
- (BOOL)useAdditionalTable;
- (EDPersistenceDatabase)database;
- (EDRemoteContentPersistence)initWithDatabase:(id)a3 useAdditionalTable:(BOOL)a4;
- (NSBackgroundActivityScheduler)analyticsScheduler;
- (OS_dispatch_queue)contentProtectionQueue;
- (id)_getRemoteContentURLInfoForTable:(id)a3 orderedBy:(int64_t)a4 inReverseOrder:(BOOL)a5 limit:(int64_t)a6 connection:(id)a7 error:(id *)a8;
- (id)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 error:(id *)a6;
- (id)remoteContentLinksBelowCount:(unint64_t)a3 limit:(unint64_t)a4;
- (int64_t)_rowCountForTable:(id)a3;
- (unint64_t)_currentRowCount;
- (unint64_t)_protectedRowCount;
- (unint64_t)countOfLinksLastSeenSince:(id)a3;
- (unint64_t)countOfUnrequestedLinks;
- (unint64_t)maximumRemoteContentLinks;
- (unint64_t)pruneThreshold;
- (void)_decrementCurrentRowCountBy:(unint64_t)a3;
- (void)_decrementProtectedRowCountBy:(unint64_t)a3;
- (void)_incrementCurrentRowCountBy:(unint64_t)a3;
- (void)_incrementProtectedRowCountBy:(unint64_t)a3;
- (void)_initializeCurrentRowCount;
- (void)_initializeProtectedRowCount;
- (void)_refillFromAdditionalTable;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)dealloc;
- (void)setMaximumRemoteContentLinks:(unint64_t)a3;
- (void)setPruneThreshold:(unint64_t)a3;
- (void)test_tearDown;
@end

@implementation EDRemoteContentPersistence

void ___ef_log_EDRemoteContentPersistence_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDRemoteContentPersistence");
  v1 = (void *)_ef_log_EDRemoteContentPersistence_log;
  _ef_log_EDRemoteContentPersistence_log = (uint64_t)v0;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (a3) {
    *a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  if (a4) {
    *a4 = v4;
  }
  v5 = [a1 _remoteContentLinksTableSchemaWithName:@"remote_content_links"];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)protectedTablesAndForeignKeysToResolve:(id *)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  v3 = [a1 _remoteContentLinksTableSchemaWithName:@"additional_remote_content_links"];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)_remoteContentLinksTableSchemaWithName:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v3 = objc_alloc(MEMORY[0x1E4F60F08]);
  v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"url" collation:1 nullable:0];
  v18[0] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"requests" nullable:0 defaultValue:&unk_1F35BAF10];
  v18[1] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_seen_date" nullable:0];
  v18[2] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_request_date" nullable:0 defaultValue:&unk_1F35BAF10];
  v18[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  v9 = (void *)[v3 initWithName:v14 rowIDType:1 columns:v8];

  v17 = @"url";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v9 addUniquenessConstraintForColumns:v10 conflictResolution:1];

  v16[0] = @"requests";
  v16[1] = @"last_request_date";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v9 addIndexForColumns:v11];

  v15[0] = @"requests";
  v15[1] = @"last_seen_date";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v9 addIndexForColumns:v12];

  return v9;
}

- (EDRemoteContentPersistence)initWithDatabase:(id)a3 useAdditionalTable:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EDRemoteContentPersistence;
  v8 = [(EDRemoteContentPersistence *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a3);
    v9->_useAdditionalTable = v4;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.email.EDRemoteContentPersistence.contentProtectionQueue", v10);
    contentProtectionQueue = v9->_contentProtectionQueue;
    v9->_contentProtectionQueue = (OS_dispatch_queue *)v11;

    *(int64x2_t *)&v9->_currentRowCount = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v9->_maximumRemoteContentLinks = xmmword_1DB6405D0;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.email.EDRemoteContentPersistence.analyticsScheduler"];
    analyticsScheduler = v9->_analyticsScheduler;
    v9->_analyticsScheduler = (NSBackgroundActivityScheduler *)v13;

    [(NSBackgroundActivityScheduler *)v9->_analyticsScheduler setQualityOfService:9];
    [(NSBackgroundActivityScheduler *)v9->_analyticsScheduler setInterval:86400.0];
    [(NSBackgroundActivityScheduler *)v9->_analyticsScheduler setRepeats:1];
    if (v4)
    {
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E4F14310], 1);
      [(NSBackgroundActivityScheduler *)v9->_analyticsScheduler _setAdditionalXPCActivityProperties:v15];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v9);
    v16 = v9->_analyticsScheduler;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke;
    v19[3] = &unk_1E6C05068;
    objc_copyWeak(&v20, &location);
    BOOL v21 = v4;
    [(NSBackgroundActivityScheduler *)v16 scheduleWithBlock:v19];
    v17 = [(EDRemoteContentPersistence *)v9 contentProtectionQueue];
    EFRegisterContentProtectionObserver();

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained database];
  char v6 = [v5 setupIsComplete];

  if (v6)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    id v7 = [WeakRetained database];
    v8 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence initWithDatabase:useAdditionalTable:]_block_invoke"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_2;
    v9[3] = &unk_1E6C05018;
    v9[4] = v13;
    v9[5] = v12;
    char v10 = *(unsigned char *)(a1 + 40);
    v9[6] = v11;
    objc_msgSend(v7, "__performReadWithCaller:usingBlock:", v8, v9);

    AnalyticsSendEventLazy();
    v3[2](v3, 1);
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
  }
  else
  {
    v3[2](v3, 1);
  }
}

uint64_t __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"requests" table:@"remote_content_links"];
  v5 = [MEMORY[0x1E4F60E40] count:0];
  [v4 addResult:v5 alias:@"count"];

  [v4 groupByColumn:@"requests"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_3;
  v11[3] = &unk_1E6C04FF0;
  long long v12 = *(_OWORD *)(a1 + 32);
  [v3 executeSelectStatement:v4 withBlock:v11 error:0];
  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F60EF8]);
    id v7 = [MEMORY[0x1E4F60E40] count:0];
    v8 = (void *)[v6 initWithResult:v7 table:@"additional_remote_content_links"];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_4;
    v10[3] = &unk_1E6BFF4C8;
    v10[4] = *(void *)(a1 + 48);
    [v3 executeSelectStatement:v8 withBlock:v10 error:0];
  }
  return 1;
}

void __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_3(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 objectForKeyedSubscript:@"requests"];
  BOOL v4 = [v3 numberValue];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [v10 objectForKeyedSubscript:@"count"];
  id v7 = [v6 numberValue];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v5) {
    uint64_t v9 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v9 = *(void *)(a1 + 40);
  }
  *(void *)(*(void *)(v9 + 8) + 24) += v8;
}

void __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectAtIndexedSubscript:0];
  BOOL v4 = [v3 numberValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 unsignedIntegerValue];
}

id __66__EDRemoteContentPersistence_initWithDatabase_useAdditionalTable___block_invoke_5(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v15[0] = @"totalCount";
  id v14 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v16 = v14;
  v15[1] = @"requestedCount";
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  void v15[2] = @"percentRequested";
  unint64_t v2 = *(void *)(a1 + 48);
  uint64_t v13 = (void *)v17;
  if (v2) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) / v2];
  }
  else {
  long long v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = v12;
  v15[3] = @"unrequestedCount";
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v19 = v3;
  v15[4] = @"percentUnrequested";
  unint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(a1 + 56) / v4];
  }
  else {
  id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  id v20 = v5;
  v15[5] = @"protectedCount";
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  BOOL v21 = v6;
  v15[6] = @"percentProtected";
  unint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [NSNumber numberWithUnsignedInteger:100 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) / v7];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = v8;
  v15[7] = @"hasProtectedLinks";
  uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  objc_super v23 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:v15 count:8];

  return v10;
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EDRemoteContentPersistence;
  [(EDRemoteContentPersistence *)&v3 dealloc];
}

- (unint64_t)_currentRowCount
{
  unint64_t currentRowCount = self->_currentRowCount;
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(EDRemoteContentPersistence *)self _initializeCurrentRowCount];
    unint64_t currentRowCount = self->_currentRowCount;
  }
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return currentRowCount;
  }
}

- (unint64_t)_protectedRowCount
{
  unint64_t protectedRowCount = self->_protectedRowCount;
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(EDRemoteContentPersistence *)self _initializeProtectedRowCount];
    unint64_t protectedRowCount = self->_protectedRowCount;
  }
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return protectedRowCount;
  }
}

- (void)_incrementCurrentRowCountBy:(unint64_t)a3
{
  int64_t currentRowCount = self->_currentRowCount;
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL) {
    [(EDRemoteContentPersistence *)self _initializeCurrentRowCount];
  }
  else {
    self->_int64_t currentRowCount = currentRowCount + a3;
  }
}

- (void)_decrementCurrentRowCountBy:(unint64_t)a3
{
  p_int64_t currentRowCount = &self->_currentRowCount;
  int64_t currentRowCount = self->_currentRowCount;
  if (currentRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(EDRemoteContentPersistence *)self _initializeCurrentRowCount];
  }
  else
  {
    uint64_t v5 = currentRowCount - a3;
    *p_int64_t currentRowCount = v5;
    if (v5 < 0)
    {
      id v6 = _ef_log_EDRemoteContentPersistence();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[EDRemoteContentPersistence _decrementCurrentRowCountBy:](p_currentRowCount, v6);
      }

      *p_int64_t currentRowCount = 0;
    }
  }
}

- (void)_incrementProtectedRowCountBy:(unint64_t)a3
{
  int64_t protectedRowCount = self->_protectedRowCount;
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL) {
    [(EDRemoteContentPersistence *)self _initializeProtectedRowCount];
  }
  else {
    self->_int64_t protectedRowCount = protectedRowCount + a3;
  }
}

- (void)_decrementProtectedRowCountBy:(unint64_t)a3
{
  int64_t protectedRowCount = self->_protectedRowCount;
  if (protectedRowCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(EDRemoteContentPersistence *)self _initializeProtectedRowCount];
  }
  else
  {
    int64_t v5 = protectedRowCount - a3;
    self->_int64_t protectedRowCount = v5;
    if (v5 < 0)
    {
      id v6 = _ef_log_EDRemoteContentPersistence();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[EDRemoteContentPersistence _decrementProtectedRowCountBy:]((uint64_t)self, v6);
      }

      self->_int64_t protectedRowCount = 0;
    }
  }
}

- (void)_initializeCurrentRowCount
{
  self->_int64_t currentRowCount = [(EDRemoteContentPersistence *)self _rowCountForTable:@"remote_content_links"];
}

- (void)_initializeProtectedRowCount
{
  if ([(EDRemoteContentPersistence *)self useAdditionalTable]) {
    self->_int64_t protectedRowCount = [(EDRemoteContentPersistence *)self _rowCountForTable:@"additional_remote_content_links"];
  }
}

- (int64_t)_rowCountForTable:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v5 = [(EDRemoteContentPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence _rowCountForTable:]"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__EDRemoteContentPersistence__rowCountForTable___block_invoke;
  v10[3] = &unk_1E6BFF400;
  id v7 = v4;
  id v11 = v7;
  long long v12 = &v13;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v10);

  int64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __48__EDRemoteContentPersistence__rowCountForTable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  int64_t v5 = [MEMORY[0x1E4F60E40] count:0];
  id v6 = (void *)[v4 initWithResult:v5 table:*(void *)(a1 + 32)];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __48__EDRemoteContentPersistence__rowCountForTable___block_invoke_2;
  v8[3] = &unk_1E6BFF4C8;
  v8[4] = *(void *)(a1 + 40);
  [v3 executeSelectStatement:v6 withBlock:v8 error:0];

  return 1;
}

void __48__EDRemoteContentPersistence__rowCountForTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 integerValue];

  *a4 = 1;
}

- (BOOL)addRemoteContentLinks:(id)a3 newLinks:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__32;
  BOOL v21 = __Block_byref_object_dispose__32;
  id v22 = 0;
  id v7 = [(EDRemoteContentPersistence *)self database];
  int64_t v8 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence addRemoteContentLinks:newLinks:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__EDRemoteContentPersistence_addRemoteContentLinks_newLinks___block_invoke;
  v12[3] = &unk_1E6C05090;
  void v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v23;
  uint64_t v15 = &v17;
  BOOL v16 = a4 != 0;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v12);

  if (a4) {
    *a4 = (id) v18[5];
  }
  char v10 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

uint64_t __61__EDRemoteContentPersistence_addRemoteContentLinks_newLinks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  if (![*(id *)(a1 + 32) useAdditionalTable])
  {
LABEL_5:
    id v10 = *(id *)(a1 + 40);
    id v11 = 0;
    goto LABEL_7;
  }
  unint64_t v5 = [*(id *)(a1 + 32) _currentRowCount];
  unint64_t v6 = [*(id *)(a1 + 32) maximumRemoteContentLinks];
  id v7 = *(void **)(a1 + 40);
  if (v5 < v6)
  {
    uint64_t v8 = [v7 count];
    if (v8 + v5 > [*(id *)(a1 + 32) maximumRemoteContentLinks])
    {
      unint64_t v9 = [*(id *)(a1 + 32) maximumRemoteContentLinks] - v5;
      objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 0, v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", v9, objc_msgSend(*(id *)(a1 + 40), "count") - v9);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v11 = v7;
  id v10 = 0;
LABEL_7:
  if ([v10 count])
  {
    long long v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    char v14 = [v12 _addRemoteContentLinks:v10 withDate:v4 toTable:@"remote_content_links" withConnection:v3 newLinks:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v14;
    objc_msgSend(*(id *)(a1 + 32), "_incrementCurrentRowCountBy:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "count"));
  }
  if ([v11 count])
  {
    uint64_t v15 = *(void **)(a1 + 32);
    id v26 = 0;
    char v16 = [v15 _addRemoteContentLinks:v11 withDate:v4 toTable:@"additional_remote_content_links" withConnection:v3 newLinks:&v26];
    id v17 = v26;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v16;
    objc_msgSend(*(id *)(a1 + 32), "_incrementProtectedRowCountBy:", objc_msgSend(v17, "count"));
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      if (v19)
      {
        uint64_t v20 = [v19 arrayByAddingObjectsFromArray:v17];
        uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
        id v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;
      }
      else
      {
        id v23 = v17;
        id v22 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v23;
      }
    }
  }
  uint64_t v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v24;
}

- (BOOL)_addRemoteContentLinks:(id)a3 withDate:(id)a4 toTable:(id)a5 withConnection:(id)a6 newLinks:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v27 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v24 = a7;
  if (a7) {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v26 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v11;
  uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v18 = objc_alloc(MEMORY[0x1E4F60F18]);
        v32 = @"url";
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        uint64_t v20 = (void *)[v18 initWithTable:v12 conflictTarget:v19];

        uint64_t v21 = [v17 absoluteString];
        [v20 setObject:v21 forKeyedSubscript:@"url"];

        [v20 setObject:v27 forKeyedSubscript:@"last_seen_date"];
        [v13 clearLastInsertedDatabaseID];
        if (([v13 executeUpsertStatement:v20 error:0] & 1) == 0)
        {

          BOOL v22 = 0;
          goto LABEL_16;
        }
        if ([v13 lastInsertedDatabaseID]) {
          [v26 addObject:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 1;
LABEL_16:

  if (v24) {
    *uint64_t v24 = v26;
  }

  return v22;
}

- (BOOL)updateRequestCountForRemoteContentLinks:(id)a3 updateLastSeen:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  id v7 = [(EDRemoteContentPersistence *)self database];
  uint64_t v8 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence updateRequestCountForRemoteContentLinks:updateLastSeen:]"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__EDRemoteContentPersistence_updateRequestCountForRemoteContentLinks_updateLastSeen___block_invoke;
  v11[3] = &unk_1E6C050B8;
  id v9 = v6;
  BOOL v14 = a4;
  id v12 = v9;
  id v13 = &v15;
  objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v11);

  LOBYTE(v6) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v6;
}

BOOL __85__EDRemoteContentPersistence_updateRequestCountForRemoteContentLinks_updateLastSeen___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v19 != v5) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"remote_content_links"];
      [v8 setObject:v3 forKeyedSubscript:@"last_request_date"];
      id v9 = [MEMORY[0x1E4F60E78] column:@"requests"];
      id v10 = [v9 plus:&unk_1F35BAF28];
      [v8 setObject:v10 forKeyedSubscript:@"requests"];

      if (*(unsigned char *)(a1 + 48)) {
        [v8 setObject:v3 forKeyedSubscript:@"last_seen_date"];
      }
      id v11 = [MEMORY[0x1E4F60E78] column:@"url"];
      uint64_t v12 = [v7 absoluteString];
      id v13 = [v11 equalTo:v12];
      [v8 setWhereClause:v13];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v17 executeUpdateStatement:v8 error:0];
      LOBYTE(v12) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;

      if (v12) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  return v14;
}

- (id)remoteContentLinksBelowCount:(unint64_t)a3 limit:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [(EDRemoteContentPersistence *)self database];
  id v9 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence remoteContentLinksBelowCount:limit:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke;
  v12[3] = &unk_1E6C030D8;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  id v10 = v7;
  id v13 = v10;
  objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v12);

  return v10;
}

uint64_t __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"url" table:@"remote_content_links"];
  uint64_t v5 = [MEMORY[0x1E4F60E78] column:@"requests"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v7 = [v5 lessThan:v6];
  [v4 setWhere:v7];

  if (*(void *)(a1 + 48)) {
    objc_msgSend(v4, "setLimit:");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2;
  v10[3] = &unk_1E6BFF3B0;
  id v11 = *(id *)(a1 + 32);
  uint64_t v8 = [v3 executeSelectStatement:v4 withBlock:v10 error:0];

  return v8;
}

void __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 stringValue];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  else
  {
    _ef_log_EDRemoteContentPersistence();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = v5;
      if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
      {
        id v9 = v8;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v8];
      }
      __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2_cold_1(v8, v9, (uint64_t)v10, v7);
    }
  }
}

- (unint64_t)countOfLinksLastSeenSince:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v5 = [(EDRemoteContentPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence countOfLinksLastSeenSince:]"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke;
  unint64_t v14 = &unk_1E6BFF400;
  id v7 = v4;
  id v15 = v7;
  char v16 = &v17;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, &v11);

  unint64_t v8 = [(EDRemoteContentPersistence *)self _protectedRowCount];
  unint64_t v9 = v18[3] + v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v5 = [MEMORY[0x1E4F60E40] count:0];
  uint64_t v6 = (void *)[v4 initWithResult:v5 table:@"remote_content_links"];

  id v7 = [MEMORY[0x1E4F60E78] column:@"last_seen_date"];
  unint64_t v8 = [v7 greaterThan:*(void *)(a1 + 32)];
  [v6 setWhere:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke_2;
  v10[3] = &unk_1E6BFF4C8;
  void v10[4] = *(void *)(a1 + 40);
  [v3 executeSelectStatement:v6 withBlock:v10 error:0];

  return 1;
}

void __56__EDRemoteContentPersistence_countOfLinksLastSeenSince___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 integerValue];

  *a4 = 1;
}

- (unint64_t)countOfUnrequestedLinks
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v3 = [(EDRemoteContentPersistence *)self database];
  id v4 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence countOfUnrequestedLinks]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke;
  v8[3] = &unk_1E6BFFFB8;
  v8[4] = &v9;
  objc_msgSend(v3, "__performReadWithCaller:usingBlock:", v4, v8);

  unint64_t v5 = [(EDRemoteContentPersistence *)self _protectedRowCount];
  unint64_t v6 = v10[3] + v5;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  unint64_t v5 = [MEMORY[0x1E4F60E40] count:0];
  unint64_t v6 = (void *)[v4 initWithResult:v5 table:@"remote_content_links"];

  id v7 = [MEMORY[0x1E4F60E78] column:@"requests"];
  unint64_t v8 = [v7 equalTo:&unk_1F35BAF10];
  [v6 setWhere:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke_2;
  v10[3] = &unk_1E6BFF4C8;
  void v10[4] = *(void *)(a1 + 32);
  [v3 executeSelectStatement:v6 withBlock:v10 error:0];

  return 1;
}

void __53__EDRemoteContentPersistence_countOfUnrequestedLinks__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  unint64_t v6 = [v7 objectAtIndexedSubscript:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 integerValue];

  *a4 = 1;
}

- (BOOL)pruneAllRemoteContentLinksWithMinimumCount:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  unint64_t v5 = [(EDRemoteContentPersistence *)self database];
  unint64_t v6 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence pruneAllRemoteContentLinksWithMinimumCount:]"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __73__EDRemoteContentPersistence_pruneAllRemoteContentLinksWithMinimumCount___block_invoke;
  v8[3] = &unk_1E6C03068;
  v8[4] = self;
  void v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v8);

  LOBYTE(v5) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

uint64_t __73__EDRemoteContentPersistence_pruneAllRemoteContentLinksWithMinimumCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) _currentRowCount];
  if (v4 > [*(id *)(a1 + 32) pruneThreshold])
  {
    unint64_t v5 = [MEMORY[0x1E4F60E78] column:@"requests"];
    unint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    id v7 = [v5 greaterThanEqualTo:v6];

    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"remote_content_links" where:v7];
    [v8 orderBy:@"last_seen_date" ascending:1];
    objc_msgSend(v8, "setLimit:", v4 - ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "pruneThreshold") >> 1));
    uint64_t v11 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 executeDeleteStatement:v8 rowsChanged:&v11];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_decrementCurrentRowCountBy:");
      [*(id *)(a1 + 32) _currentRowCount];
      if ([v3 protectedDatabaseAttached])
      {
        [*(id *)(a1 + 32) _refillFromAdditionalTable];
        [*(id *)(a1 + 32) _currentRowCount];
      }
      AnalyticsSendEventLazy();
    }
  }
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v9;
}

id __73__EDRemoteContentPersistence_pruneAllRemoteContentLinksWithMinimumCount___block_invoke_2(uint64_t a1)
{
  void v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"beforeCount";
  unint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v10[0] = v2;
  v9[1] = @"prunedCount";
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v10[1] = v3;
  v9[2] = @"refilledCount";
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v10[2] = v4;
  v9[3] = @"hasProtectedLinks";
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "useAdditionalTable"));
  v10[3] = v5;
  v9[4] = @"didRefill";
  unint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  void v10[4] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (void)_refillFromAdditionalTable
{
  if ([(EDRemoteContentPersistence *)self useAdditionalTable])
  {
    id v3 = [(EDRemoteContentPersistence *)self database];
    unint64_t v4 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence _refillFromAdditionalTable]"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__EDRemoteContentPersistence__refillFromAdditionalTable__block_invoke;
    v5[3] = &unk_1E6C00AF0;
    v5[4] = self;
    objc_msgSend(v3, "__performWriteWithCaller:usingBlock:", v4, v5);
  }
}

uint64_t __56__EDRemoteContentPersistence__refillFromAdditionalTable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 protectedDatabaseAttached] & 1) != 0
    && (unint64_t v4 = [*(id *)(a1 + 32) maximumRemoteContentLinks],
        unint64_t v5 = [*(id *)(a1 + 32) _currentRowCount],
        unint64_t v6 = v4 - v5,
        v4 > v5))
  {
    id v7 = (void *)[[NSString alloc] initWithFormat:@"INSERT OR IGNORE INTO %@ SELECT * FROM %@ ORDER BY ROWID ASC LIMIT %lu", @"remote_content_links", @"additional_remote_content_links", v6];
    uint64_t v8 = [v3 executeStatementString:v7 errorMessage:@"Refilling remote_content_links from additional table"];
    if (v8)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"additional_remote_content_links"];
      id v10 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
      [v9 orderBy:v10 ascending:1];

      [v9 setLimit:v6];
      uint64_t v12 = 0;
      if ([v3 executeDeleteStatement:v9 rowsChanged:&v12]) {
        [*(id *)(a1 + 32) _decrementProtectedRowCountBy:v12];
      }
      [*(id *)(a1 + 32) _initializeCurrentRowCount];
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  unint64_t v6 = [(EDRemoteContentPersistence *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = [(EDRemoteContentPersistence *)self useAdditionalTable];
  if (!a3 && v7)
  {
    [(EDRemoteContentPersistence *)self _refillFromAdditionalTable];
  }
}

- (id)getRemoteContentURLInfoOrderedBy:(int64_t)a3 inReverseOrder:(BOOL)a4 limit:(int64_t)a5 error:(id *)a6
{
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__32;
  v38 = __Block_byref_object_dispose__32;
  id v39 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__32;
  v32 = __Block_byref_object_dispose__32;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__32;
  id v26 = __Block_byref_object_dispose__32;
  id v27 = 0;
  uint64_t v11 = [(EDRemoteContentPersistence *)self database];
  uint64_t v12 = [NSString stringWithUTF8String:"-[EDRemoteContentPersistence getRemoteContentURLInfoOrderedBy:inReverseOrder:limit:error:]"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__EDRemoteContentPersistence_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_error___block_invoke;
  v20[3] = &unk_1E6C05108;
  v20[4] = self;
  v20[5] = &v28;
  BOOL v21 = a4;
  v20[8] = a3;
  v20[9] = a5;
  v20[6] = &v34;
  v20[7] = &v22;
  objc_msgSend(v11, "__performReadWithCaller:usingBlock:", v12, v20);

  if (v29[5])
  {
    if (a6) {
      *a6 = 0;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F60DF0]);
    uint64_t v14 = v29[5];
    uint64_t v15 = v23[5];
  }
  else
  {
    if (a6)
    {
      char v16 = (void *)v35[5];
      if (v16)
      {
        *a6 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "em_internalErrorWithReason:", @"Failed to get remote content url info");
        id v17 = objc_claimAutoreleasedReturnValue();
        *a6 = v17;
      }
    }
    id v13 = objc_alloc(MEMORY[0x1E4F60DF0]);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  long long v18 = (void *)[v13 initWithFirst:v14 second:v15];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

uint64_t __90__EDRemoteContentPersistence_getRemoteContentURLInfoOrderedBy_inReverseOrder_limit_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v4 _getRemoteContentURLInfoForTable:@"remote_content_links" orderedBy:v6 inReverseOrder:v5 limit:v7 connection:v3 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && [*(id *)(a1 + 32) useAdditionalTable])
  {
    unint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 < 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = v12;
    }
    uint64_t v14 = *(void *)(a1 + 72);
    if (v14 > v13)
    {
      uint64_t v15 = [*(id *)(a1 + 32) _getRemoteContentURLInfoForTable:@"additional_remote_content_links" orderedBy:*(void *)(a1 + 64) inReverseOrder:*(unsigned __int8 *)(a1 + 80) limit:v14 - v13 connection:v3 error:0];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
  }

  return 1;
}

- (id)_getRemoteContentURLInfoForTable:(id)a3 orderedBy:(int64_t)a4 inReverseOrder:(BOOL)a5 limit:(int64_t)a6 connection:(id)a7 error:(id *)a8
{
  int v11 = a5;
  id v13 = a3;
  id v14 = a7;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"url" table:v13];
  [v15 addResultColumn:@"requests"];
  [v15 addResultColumn:@"last_seen_date"];
  [v15 addResultColumn:@"last_request_date"];
  if ((unint64_t)a4 >= 4)
  {
    uint64_t v16 = 0;
    int v17 = 1;
  }
  else
  {
    uint64_t v16 = off_1E6C05128[a4];
    int v17 = dword_1DB6405E0[a4];
  }
  [v15 orderByColumn:v16 ascending:v17 != v11];
  if (a6 != 0x7FFFFFFFFFFFFFFFLL) {
    [v15 setLimit:a6 & ~(a6 >> 63)];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __111__EDRemoteContentPersistence__getRemoteContentURLInfoForTable_orderedBy_inReverseOrder_limit_connection_error___block_invoke;
  v23[3] = &unk_1E6BFF3B0;
  id v24 = v18;
  id v19 = v18;
  if ([v14 executeSelectStatement:v15 withBlock:v23 error:a8]) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = v20;

  return v21;
}

void __111__EDRemoteContentPersistence__getRemoteContentURLInfoForTable_orderedBy_inReverseOrder_limit_connection_error___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F1CB10]);
  unint64_t v4 = [v15 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 stringValue];
  uint64_t v6 = (void *)[v3 initWithString:v5];

  uint64_t v7 = [v15 objectAtIndexedSubscript:1];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [v15 objectAtIndexedSubscript:2];
  uint64_t v10 = [v9 dateValue];

  int v11 = [v15 objectAtIndexedSubscript:3];
  if ([v11 integerValue])
  {
    unint64_t v12 = [v15 objectAtIndexedSubscript:3];
    id v13 = [v12 dateValue];
  }
  else
  {
    id v13 = 0;
  }

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F603B8]) initWithURL:v6 requestCount:v8 & ~(v8 >> 63) lastSeen:v10 lastRequested:v13];
  [*(id *)(a1 + 32) addObject:v14];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDRemoteContentPersistence.m", 603, @"%s can only be called from unit tests", "-[EDRemoteContentPersistence test_tearDown]");
  }
  unint64_t v4 = [(EDRemoteContentPersistence *)self contentProtectionQueue];

  if (v4)
  {
    EFUnregisterContentProtectionObserver();
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v5 = [(EDRemoteContentPersistence *)self contentProtectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__EDRemoteContentPersistence_test_tearDown__block_invoke;
    block[3] = &unk_1E6C00E78;
    objc_copyWeak(&v8, &location);
    dispatch_sync(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __43__EDRemoteContentPersistence_test_tearDown__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[5];
  WeakRetained[5] = 0;
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (BOOL)useAdditionalTable
{
  return self->_useAdditionalTable;
}

- (NSBackgroundActivityScheduler)analyticsScheduler
{
  return self->_analyticsScheduler;
}

- (unint64_t)maximumRemoteContentLinks
{
  return self->_maximumRemoteContentLinks;
}

- (void)setMaximumRemoteContentLinks:(unint64_t)a3
{
  self->_maximumRemoteContentLinks = a3;
}

- (unint64_t)pruneThreshold
{
  return self->_pruneThreshold;
}

- (void)setPruneThreshold:(unint64_t)a3
{
  self->_pruneThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsScheduler, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_decrementCurrentRowCountBy:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Decremented row count past zero to %ld", (uint8_t *)&v3, 0xCu);
}

- (void)_decrementProtectedRowCountBy:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Decremented protected row count past zero to %ld", (uint8_t *)&v3, 0xCu);
}

void __65__EDRemoteContentPersistence_remoteContentLinksBelowCount_limit___block_invoke_2_cold_1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412290;
  *(void *)(a3 + 4) = a2;
  _os_log_error_impl(&dword_1DB39C000, a4, OS_LOG_TYPE_ERROR, "Invalid url string %@", (uint8_t *)a3, 0xCu);
}

@end
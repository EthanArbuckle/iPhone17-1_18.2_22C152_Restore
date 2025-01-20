@interface IDSMessageHashStore
+ (id)sharedInstance;
- (BOOL)containsMessageHash:(id)a3;
- (IDSMessageHashStore)init;
- (NSMutableArray)recentlySeenHashes;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_source)databaseCloseTimer;
- (double)databaseLastUpdateTime;
- (unint64_t)_currentLocalTime;
- (unint64_t)initialProcessTime;
- (unint64_t)initialServerTime;
- (void)_performInitialHousekeeping;
- (void)_runCleanup;
- (void)_setDatabaseCloseTimerOnIvarQueue;
- (void)_startCleanupTimer;
- (void)addMessageHash:(id)a3;
- (void)closeDatabase;
- (void)setDatabaseCloseTimer:(id)a3;
- (void)setDatabaseLastUpdateTime:(double)a3;
- (void)setInitialProcessTime:(unint64_t)a3;
- (void)setInitialServerTime:(unint64_t)a3;
- (void)setIvarQueue:(id)a3;
- (void)setRecentlySeenHashes:(id)a3;
- (void)updateCreationDateForHash:(id)a3;
@end

@implementation IDSMessageHashStore

+ (id)sharedInstance
{
  if (qword_26AD572C0 != -1) {
    dispatch_once(&qword_26AD572C0, &unk_26DB482A8);
  }
  v2 = (void *)qword_26AD572D0;
  return v2;
}

- (IDSMessageHashStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)IDSMessageHashStore;
  v2 = [(IDSMessageHashStore *)&v11 init];
  if (v2)
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_227320000, v3, OS_LOG_TYPE_DEFAULT, "Hash Store initialized", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v6 = dispatch_queue_create("IDSHashMessageStore", v5);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v6;

    v2->_initialProcessTime = mach_continuous_time();
    objc_msgSend((id)MEMORY[0x22A676930](@"APSConnection", @"ApplePushService"), "serverTime");
    v2->_initialServerTime = (unint64_t)v8;
    [(IDSMessageHashStore *)v2 _performInitialHousekeeping];
    [(IDSMessageHashStore *)v2 _startCleanupTimer];
  }
  return v2;
}

- (BOOL)containsMessageHash:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_227320000, v5, OS_LOG_TYPE_DEFAULT, "Checking if message hash %@ is contained in the database", (uint8_t *)&buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_227322CCC;
  v13[3] = &unk_2647FF050;
  p_long long buf = &buf;
  v13[4] = self;
  id v6 = v4;
  id v14 = v6;
  sub_2273219BC(v13);
  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_227320000, v7, OS_LOG_TYPE_DEFAULT, "Database reports that this message hash %@ has been seen before", v16, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v8 = objc_alloc_init(MEMORY[0x263F4A208]);
    v9 = [MEMORY[0x263F4A1F8] defaultLogger];
    [v9 logMetric:v8];

    v10 = +[IDSHashPersistenceAWDLogging sharedInstance];
    [v10 duplicateMessageEncounted];

    BOOL v11 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v11;
}

- (void)addMessageHash:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_227322E2C;
  v11[3] = &unk_2647FF078;
  v11[4] = self;
  id v5 = v4;
  id v12 = v5;
  sub_2273219BC(v11);
  ivarQueue = self->_ivarQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_227322F94;
  v8[3] = &unk_2647FF078;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(ivarQueue, v8);
}

- (void)updateCreationDateForHash:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_227323308;
  v7[3] = &unk_2647FF078;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

- (unint64_t)_currentLocalTime
{
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  if (mach_timebase_info(&info))
  {
    v3 = [MEMORY[0x263EFF910] date];
    [v3 timeIntervalSince1970];
    unint64_t v5 = (unint64_t)v4;
  }
  else
  {
    uint64_t v6 = mach_continuous_time();
    unint64_t v7 = [(IDSMessageHashStore *)self initialProcessTime];
    unint64_t v8 = (v6 - v7) * info.numer / info.denom;
    return [(IDSMessageHashStore *)self initialServerTime] + v8 / 0x3B9ACA00;
  }
  return v5;
}

- (void)_performInitialHousekeeping
{
}

- (void)_setDatabaseCloseTimerOnIvarQueue
{
  sub_2273219B0();
  self->_databaseLastUpdateTime = CFAbsoluteTimeGetCurrent();
  if (!self->_databaseCloseTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_ivarQueue);
    databaseCloseTimer = self->_databaseCloseTimer;
    self->_databaseCloseTimer = v3;

    unint64_t v5 = self->_databaseCloseTimer;
    dispatch_time_t v6 = dispatch_time(0, 0x8BB2C90000);
    dispatch_source_set_timer(v5, v6, 0x7FFFFFFFFFFFFFFFuLL, 0xDF8474CCCuLL);
    unint64_t v7 = self->_databaseCloseTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_227323778;
    handler[3] = &unk_2647FEE28;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_databaseCloseTimer);
  }
}

- (void)closeDatabase
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_227320000, v3, OS_LOG_TYPE_DEFAULT, "Closing database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_227323940;
  v4[3] = &unk_2647FEE28;
  v4[4] = self;
  sub_2273219BC(v4);
}

- (void)_startCleanupTimer
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_227320000, v3, OS_LOG_TYPE_DEBUG, "Scheduling Cleanup Timer", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_ivarQueue);
  unint64_t v5 = (void *)qword_26AD572B0;
  qword_26AD572B0 = (uint64_t)v4;

  dispatch_time_t v6 = qword_26AD572B0;
  if (qword_26AD572B0)
  {
    dispatch_time_t v7 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v6, v7, 0x8BB2C97000uLL, 0x3B9ACA00uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_227323B20;
    handler[3] = &unk_2647FEE28;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)qword_26AD572B0, handler);
    dispatch_resume((dispatch_object_t)qword_26AD572B0);
  }
}

- (void)_runCleanup
{
  v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_227320000, v3, OS_LOG_TYPE_DEBUG, "Scheduling timer called", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_227323C40;
  v4[3] = &unk_2647FEE28;
  v4[4] = self;
  sub_2273219BC(v4);
}

- (unint64_t)initialProcessTime
{
  return self->_initialProcessTime;
}

- (void)setInitialProcessTime:(unint64_t)a3
{
  self->_initialProcessTime = a3;
}

- (unint64_t)initialServerTime
{
  return self->_initialServerTime;
}

- (void)setInitialServerTime:(unint64_t)a3
{
  self->_initialServerTime = a3;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
}

- (OS_dispatch_source)databaseCloseTimer
{
  return self->_databaseCloseTimer;
}

- (void)setDatabaseCloseTimer:(id)a3
{
}

- (double)databaseLastUpdateTime
{
  return self->_databaseLastUpdateTime;
}

- (void)setDatabaseLastUpdateTime:(double)a3
{
  self->_databaseLastUpdateTime = a3;
}

- (NSMutableArray)recentlySeenHashes
{
  return self->_recentlySeenHashes;
}

- (void)setRecentlySeenHashes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlySeenHashes, 0);
  objc_storeStrong((id *)&self->_databaseCloseTimer, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

@end
@interface _GEOConfigDBOperationQueue
- (id)init:(id)a3;
- (void)cancelTimer;
- (void)dealloc;
- (void)enqueueOperation:(id)a3;
- (void)flush;
- (void)flushOnDBQueue;
- (void)scheduleTimer;
@end

@implementation _GEOConfigDBOperationQueue

- (void)enqueueOperation:(id)a3
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  id v4 = a3;
  geo_isolate_sync();
  if ((unint64_t)v6[3] < 0x65) {
    [(_GEOConfigDBOperationQueue *)self scheduleTimer];
  }
  else {
    [(_GEOConfigDBOperationQueue *)self flush];
  }

  _Block_object_dispose(&v5, 8);
}

- (void)scheduleTimer
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  timer = self->_timer;

  dispatch_source_set_timer(timer, v3, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
}

- (void)flushOnDBQueue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = [(GEOSQLiteDB *)self->_db isolationQueue];
  dispatch_assert_queue_V2(v3);

  [(_GEOConfigDBOperationQueue *)self cancelTimer];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[5] = MEMORY[0x1E4F143A8];
  v7[6] = 3221225472;
  v7[7] = __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke;
  v7[8] = &unk_1E53D7C00;
  v7[9] = self;
  v7[10] = &v8;
  geo_isolate_sync();
  id v4 = j__GEOGetUserDefaultsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(id)v9[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Flushing %llu operations", buf, 0xCu);
  }

  if (v9[5])
  {
    db = self->_db;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke_331;
    v7[3] = &unk_1E53D7C28;
    v7[4] = &v8;
    [(GEOSQLiteDB *)db executeInTransaction:v7];
  }
  _Block_object_dispose(&v8, 8);
}

- (void)cancelTimer
{
}

- (void)flush
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35___GEOConfigDBOperationQueue_flush__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  [(GEOSQLiteDB *)db executeAsync:v3];
}

- (id)init:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_GEOConfigDBOperationQueue;
  v6 = [(_GEOConfigDBOperationQueue *)&v20 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    uint64_t v8 = geo_isolater_create();
    isolator = v7->_isolator;
    v7->_isolator = (geo_isolater *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    operations = v7->_operations;
    v7->_operations = (NSMutableArray *)v10;

    global_queue = geo_get_global_queue();
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
    timer = v7->_timer;
    v7->_timer = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v7);
    uint64_t v15 = v7->_timer;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35___GEOConfigDBOperationQueue_init___block_invoke;
    v17[3] = &unk_1E53D7B90;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v15, v17);
    dispatch_activate((dispatch_object_t)v7->_timer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, &__block_literal_global_330);
  v3.receiver = self;
  v3.super_class = (Class)_GEOConfigDBOperationQueue;
  [(_GEOConfigDBOperationQueue *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_isolator, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end
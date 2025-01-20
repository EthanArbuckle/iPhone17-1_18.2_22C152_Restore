@interface PowerLogger
+ (id)sharedLogger;
- (NSMutableArray)events;
- (OS_dispatch_queue)queue;
- (PowerLogger)init;
- (void)flush;
- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7;
- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 purgedBytes:(unint64_t)a8;
- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 requestedBytes:(unint64_t)a8 purgedBytes:(unint64_t)a9;
- (void)setEvents:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PowerLogger

- (PowerLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)PowerLogger;
  v2 = [(PowerLogger *)&v7 init];
  if (v2 && init_fp)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    [(PowerLogger *)v2 setEvents:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cache_delete.PowerLogger", 0);
    [(PowerLogger *)v2 setQueue:v4];

    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)sharedLogger
{
  if (_MergedGlobals_14 != -1) {
    dispatch_once(&_MergedGlobals_14, &__block_literal_global_7);
  }
  v2 = (void *)qword_10006A898;
  return v2;
}

void __27__PowerLogger_sharedLogger__block_invoke(id a1)
{
  qword_10006A898 = objc_opt_new();
  _objc_release_x1();
}

- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7
{
}

- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 purgedBytes:(unint64_t)a8
{
}

- (void)logCacheDuetEvent:(unint64_t)a3 urgencyLevel:(int)a4 serviceName:(id)a5 startFromUptime:(double)a6 duration:(double)a7 requestedBytes:(unint64_t)a8 purgedBytes:(unint64_t)a9
{
  id v16 = a5;
  v17 = [(PowerLogger *)self queue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __110__PowerLogger_logCacheDuetEvent_urgencyLevel_serviceName_startFromUptime_duration_requestedBytes_purgedBytes___block_invoke;
  v19[3] = &unk_10005DFB8;
  v21 = self;
  unint64_t v22 = a3;
  int v27 = a4;
  double v23 = a6;
  double v24 = a7;
  unint64_t v25 = a8;
  unint64_t v26 = a9;
  id v20 = v16;
  id v18 = v16;
  dispatch_async(v17, v19);
}

void __110__PowerLogger_logCacheDuetEvent_urgencyLevel_serviceName_startFromUptime_duration_requestedBytes_purgedBytes___block_invoke(uint64_t a1)
{
  v12[0] = @"operationType";
  v2 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v13[0] = v2;
  v12[1] = @"urgencyLevel";
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 88)];
  dispatch_queue_t v4 = (void *)v3;
  CFStringRef v5 = *(const __CFString **)(a1 + 32);
  if (!v5) {
    CFStringRef v5 = &stru_1000601A0;
  }
  v13[1] = v3;
  v13[2] = v5;
  v12[2] = @"serviceName";
  v12[3] = @"startFromUptime";
  v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v13[3] = v6;
  v12[4] = @"duration";
  objc_super v7 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v13[4] = v7;
  v12[5] = @"requestedBytes";
  v8 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
  v13[5] = v8;
  v12[6] = @"purgedBytes";
  v9 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
  v13[6] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];

  v11 = [*(id *)(a1 + 40) events];
  [v11 addObject:v10];
}

- (void)flush
{
  uint64_t v3 = [(PowerLogger *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __20__PowerLogger_flush__block_invoke;
  block[3] = &unk_10005CD00;
  block[4] = self;
  dispatch_async(v3, block);
}

void __20__PowerLogger_flush__block_invoke(uint64_t a1)
{
  v9[0] = @"timestamp";
  v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  dispatch_queue_t v4 = +[NSNumber numberWithLong:1000 * (uint64_t)v3];

  v9[1] = @"events";
  v10[0] = v4;
  CFStringRef v5 = [*(id *)(a1 + 32) events];
  id v6 = [v5 copy];
  v10[1] = v6;
  objc_super v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  v8 = [*(id *)(a1 + 32) events];
  [v8 removeAllObjects];

  PLLogRegisteredEvent();
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
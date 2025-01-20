@interface HDCurrentActivityCacheQueryServer
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)shouldObserveActivityCache;
- (HDCurrentActivityCacheQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
- (void)_queue_stop;
- (void)activityCacheManager:(id)a3 changedTodayActivityCache:(id)a4;
@end

@implementation HDCurrentActivityCacheQueryServer

- (HDCurrentActivityCacheQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDCurrentActivityCacheQueryServer;
  v14 = [(HDCurrentActivityCacheQueryServer *)&v20 initWithUUID:v10 configuration:v11 client:v12 delegate:v13];
  if (v14)
  {
    uint64_t v15 = [v11 statisticsIntervalComponents];
    statisticsIntervalComponents = v14->_statisticsIntervalComponents;
    v14->_statisticsIntervalComponents = (NSDateComponents *)v15;

    uint64_t v17 = +[NSCalendar currentCalendar];
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v17;
  }
  return v14;
}

- (BOOL)shouldObserveActivityCache
{
  return 1;
}

- (void)_queue_start
{
  if ([(HDCurrentActivityCacheQueryServer *)self shouldObserveActivityCache])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
    [WeakRetained addActivityCacheObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)HDCurrentActivityCacheQueryServer;
  [(HDCurrentActivityCacheQueryServer *)&v4 _queue_start];
}

- (void)_queue_stop
{
  if ([(HDCurrentActivityCacheQueryServer *)self shouldObserveActivityCache])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
    [WeakRetained removeActivityCacheObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)HDCurrentActivityCacheQueryServer;
  [(HDCurrentActivityCacheQueryServer *)&v4 _queue_stop];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v13 profile];
  v16 = [v15 activityCacheInterface];

  if (v16)
  {
    unsigned int v17 = +[HDActivityDemoDataStore shouldShowActivityDemoData];
    v18 = off_344F8;
    if (!v17) {
      v18 = off_34500;
    }
    v19 = (id *)[objc_alloc(*v18) initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
    objc_super v20 = v19;
    if (v19) {
      objc_storeWeak(v19 + 4, v16);
    }
  }
  else
  {
    +[NSError hk_assignError:a7 code:100 description:@"Activity cache manager is unavailable"];
    objc_super v20 = 0;
  }

  return v20;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)activityCacheManager:(id)a3 changedTodayActivityCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HDCurrentActivityCacheQueryServer *)self clientProxy];
  v9 = [v8 remoteObjectProxy];

  if (v9
    && ([(HKActivityCache *)self->_lastActivityCache _isEqualToActivityCache:v7] & 1) == 0)
  {
    id v10 = objc_alloc_init((Class)HKCurrentActivityCacheQueryResult);
    [v10 setCurrentActivityCache:v7];
    id v11 = [v7 cacheIndex];
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_FF74;
    v19 = &unk_34AF8;
    id v12 = v10;
    id v20 = v12;
    v21 = self;
    [v6 accessStatisticsBuilderWithCacheIndex:v11 handler:&v16];
    id v13 = [(HDCurrentActivityCacheQueryServer *)self queryUUID];
    objc_msgSend(v9, "client_deliverQueryResult:queryUUID:", v12, v13);

    id v14 = (HKActivityCache *)[v7 copy];
    lastActivityCache = self->_lastActivityCache;
    self->_lastActivityCache = v14;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityCacheInterface);
  objc_storeStrong((id *)&self->_lastActivityCache, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_statisticsIntervalComponents, 0);
}

@end
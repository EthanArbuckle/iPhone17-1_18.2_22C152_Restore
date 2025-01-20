@interface HDCurrentActivitySummaryQueryServer
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (BOOL)_shouldListenForUpdates;
- (HDCurrentActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
- (void)_queue_startDataCollection;
- (void)_queue_stop;
- (void)_queue_stopDataCollection;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
@end

@implementation HDCurrentActivitySummaryQueryServer

- (HDCurrentActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDCurrentActivitySummaryQueryServer;
  v11 = [(HDCurrentActivitySummaryQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [v10 collectionIntervals];
    v13 = (NSDictionary *)[v12 copy];
    collectionIntervals = v11->_collectionIntervals;
    v11->_collectionIntervals = v13;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  unsigned int v14 = +[HDActivityDemoDataStore shouldShowActivityDemoData];
  v15 = off_34508;
  if (!v14) {
    v15 = &off_34510;
  }
  id v16 = [objc_alloc(*v15) initWithUUID:v13 configuration:v12 client:v11 delegate:v10];

  return v16;
}

- (void)_queue_start
{
  v11.receiver = self;
  v11.super_class = (Class)HDCurrentActivitySummaryQueryServer;
  [(HDCurrentActivitySummaryQueryServer *)&v11 _queue_start];
  v3 = [(HDCurrentActivitySummaryQueryServer *)self profile];
  v4 = [v3 dataCollectionManager];
  v5 = +[NSDate date];
  uint64_t v6 = [(NSDictionary *)self->_collectionIntervals allKeys];
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = &__NSArray0__struct;
  }
  v9 = +[NSSet setWithArray:v8];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4C80;
  v10[3] = &unk_347F8;
  v10[4] = self;
  [v4 requestAggregationThroughDate:v5 types:v9 mode:0 options:1 completion:v10];
}

- (void)_queue_stop
{
  v5.receiver = self;
  v5.super_class = (Class)HDCurrentActivitySummaryQueryServer;
  [(HDCurrentActivitySummaryQueryServer *)&v5 _queue_stop];
  v3 = [(HDCurrentActivitySummaryQueryServer *)self profile];
  v4 = [v3 currentActivitySummaryHelper];
  [v4 removeObserver:self];
}

- (void)_queue_startDataCollection
{
  v3 = [(HDCurrentActivitySummaryQueryServer *)self profile];
  v4 = [v3 dataCollectionManager];

  collectionIntervals = self->_collectionIntervals;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4EE4;
  v15[3] = &unk_34820;
  id v16 = v4;
  v17 = self;
  id v6 = v4;
  [(NSDictionary *)collectionIntervals enumerateKeysAndObjectsUsingBlock:v15];
  v7 = [(HDCurrentActivitySummaryQueryServer *)self profile];
  v8 = [v7 dataCollectionManager];
  v9 = +[NSDate date];
  uint64_t v10 = [(NSDictionary *)self->_collectionIntervals allKeys];
  objc_super v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = &__NSArray0__struct;
  }
  id v13 = +[NSSet setWithArray:v12];
  [v8 requestAggregationThroughDate:v9 types:v13 mode:1 options:1 completion:&stru_34860];

  v14.receiver = self;
  v14.super_class = (Class)HDCurrentActivitySummaryQueryServer;
  [(HDCurrentActivitySummaryQueryServer *)&v14 _queue_startDataCollection];
}

- (void)_queue_stopDataCollection
{
  v10.receiver = self;
  v10.super_class = (Class)HDCurrentActivitySummaryQueryServer;
  [(HDCurrentActivitySummaryQueryServer *)&v10 _queue_stopDataCollection];
  v3 = [(HDCurrentActivitySummaryQueryServer *)self profile];
  v4 = [v3 dataCollectionManager];

  collectionIntervals = self->_collectionIntervals;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5030;
  v7[3] = &unk_34820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(NSDictionary *)collectionIntervals enumerateKeysAndObjectsUsingBlock:v7];
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    id v19 = v8;
    objc_super v10 = +[NSArray arrayWithObjects:&v19 count:1];
  }
  else
  {
    objc_super v10 = &__NSArray0__struct;
  }
  objc_super v11 = [(HDCurrentActivitySummaryQueryServer *)self clientProxy];
  if (v11
    && ([(HKActivitySummary *)self->_lastActivitySummary _allFieldsAreEqual:v9] & 1) == 0)
  {
    _HKInitializeLogging();
    id v13 = HKLogQuery;
    if (os_log_type_enabled(HKLogQuery, OS_LOG_TYPE_DEBUG)) {
      sub_22A74((uint64_t)v9, v13);
    }
    objc_super v14 = [(HDCurrentActivitySummaryQueryServer *)self queryUUID];
    objc_msgSend(v11, "client_deliverActivitySummaries:queryUUID:", v10, v14);

    v15 = (HKActivitySummary *)[v9 copy];
    lastActivitySummary = self->_lastActivitySummary;
    self->_lastActivitySummary = v15;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = HKLogQuery;
    if (os_log_type_enabled(HKLogQuery, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      v18 = v9;
      _os_log_impl(&def_E6CC, v12, OS_LOG_TYPE_INFO, "Not calling query client with todayActivitySummary: %@, same as _lastActivitySummary.", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
  objc_storeStrong((id *)&self->_lastActivitySummary, 0);

  objc_storeStrong((id *)&self->_currentSummaryHelper, 0);
}

@end
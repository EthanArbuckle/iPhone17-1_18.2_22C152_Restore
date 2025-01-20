@interface HDActivityStatisticsQueryServer
+ (Class)queryClass;
- (HDActivityStatisticsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_didDeactivate;
- (void)_queue_start;
- (void)_queue_stop;
@end

@implementation HDActivityStatisticsQueryServer

- (HDActivityStatisticsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v44.receiver = self;
  v44.super_class = (Class)HDActivityStatisticsQueryServer;
  v14 = [(HDActivityStatisticsQueryServer *)&v44 initWithUUID:v10 configuration:v11 client:v12 delegate:v13];
  if (v14)
  {
    v15 = [v12 profile];
    uint64_t v16 = [v15 sourceManager];
    sourceManager = v14->_sourceManager;
    v14->_sourceManager = (HDSourceManager *)v16;

    uint64_t v18 = [v11 startDate];
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v18;

    uint64_t v20 = [v11 endDate];
    endDate = v14->_endDate;
    v14->_endDate = (NSDate *)v20;

    uint64_t v22 = [v11 moveIntervalComponents];
    moveIntervalComponents = v14->_moveIntervalComponents;
    v14->_moveIntervalComponents = (NSDateComponents *)v22;

    uint64_t v24 = [v11 exerciseIntervalComponents];
    exerciseIntervalComponents = v14->_exerciseIntervalComponents;
    v14->_exerciseIntervalComponents = (NSDateComponents *)v24;

    v14->_deliversUpdates = [v11 shouldDeactivateAfterInitialResults] ^ 1;
    objc_initWeak(&location, v14);
    id v26 = objc_alloc((Class)_HKDelayedOperation);
    v27 = [(HDActivityStatisticsQueryServer *)v14 queryQueue];
    [v11 updateInterval];
    double v29 = v28;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_22108;
    v41[3] = &unk_34898;
    objc_copyWeak(&v42, &location);
    v30 = (_HKDelayedOperation *)[v26 initWithQueue:v27 delay:v41 block:v29];
    updateOperation = v14->_updateOperation;
    v14->_updateOperation = v30;

    id v32 = objc_alloc((Class)_HKDelayedOperation);
    v33 = [(HDActivityStatisticsQueryServer *)v14 queryQueue];
    [v11 updateInterval];
    double v35 = v34;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_2220C;
    v39[3] = &unk_34898;
    objc_copyWeak(&v40, &location);
    v36 = (_HKDelayedOperation *)[v32 initWithQueue:v33 delay:v39 block:v35];
    resetOperation = v14->_resetOperation;
    v14->_resetOperation = v36;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v14;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v3.receiver = self;
  v3.super_class = (Class)HDActivityStatisticsQueryServer;
  [(HDActivityStatisticsQueryServer *)&v3 _queue_start];
  sub_22164(self);
}

- (void)_queue_stop
{
  v2.receiver = self;
  v2.super_class = (Class)HDActivityStatisticsQueryServer;
  [(HDActivityStatisticsQueryServer *)&v2 _queue_stop];
}

- (void)_queue_didDeactivate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_exerciseIntervalComponents, 0);
  objc_storeStrong((id *)&self->_moveIntervalComponents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_resetOperation, 0);
  objc_storeStrong((id *)&self->_updateOperation, 0);

  objc_storeStrong((id *)&self->_statisticsCollection, 0);
}

@end
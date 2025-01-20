@interface CSAttSiriMotionNode
- (BOOL)isReady;
- (CMMotionActivity)motionActivity;
- (CMMotionManager)motionManager;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMotionNode)initWithAttSiriController:(id)a3;
- (CSGestureMonitor)monitor;
- (NSArray)requiredNodes;
- (NSHashTable)receivers;
- (NSOperationQueue)opqueue;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (unint64_t)type;
- (void)_hasDeviceMotionAvailable:(id)a3;
- (void)addReceiver:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setMotionActivity:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setOpqueue:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CSAttSiriMotionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_opqueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
}

- (void)setMonitor:(id)a3
{
  self->_monitor = (CSGestureMonitor *)a3;
}

- (CSGestureMonitor)monitor
{
  return self->_monitor;
}

- (void)setMotionActivity:(id)a3
{
}

- (CMMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (void)setMotionManager:(id)a3
{
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setOpqueue:(id)a3
{
}

- (NSOperationQueue)opqueue
{
  return self->_opqueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3F08;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_hasDeviceMotionAvailable:(id)a3
{
  v27[0] = @"timestamp";
  id v4 = a3;
  v24 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v28[0] = v24;
  v27[1] = @"pitch";
  v23 = [v4 attitude];
  [v23 pitch];
  v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v28[1] = v22;
  v27[2] = @"yaw";
  v21 = [v4 attitude];
  [v21 yaw];
  v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v28[2] = v20;
  v27[3] = @"roll";
  v19 = [v4 attitude];
  [v19 roll];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v28[3] = v5;
  v27[4] = @"x";
  [v4 userAcceleration];
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v28[4] = v6;
  v27[5] = @"y";
  [v4 userAcceleration];
  v8 = +[NSNumber numberWithDouble:v7];
  v28[5] = v8;
  v27[6] = @"z";
  [v4 userAcceleration];
  double v10 = v9;

  v11 = +[NSNumber numberWithDouble:v10];
  v28[6] = v11;
  v27[7] = @"wakeGestureHostTime";
  v12 = +[NSNumber numberWithUnsignedLongLong:[(CSGestureMonitor *)self->_monitor wakeGestureTimestamp]];
  v28[7] = v12;
  v27[8] = @"isHandHeld";
  v13 = +[NSNumber numberWithBool:[(CSGestureMonitor *)self->_monitor isTriggerHandheld]];
  v28[8] = v13;
  v27[9] = @"vehicleConnected";
  v14 = +[NSNumber numberWithBool:[(CMMotionActivity *)self->_motionActivity isVehicleConnected]];
  v28[9] = v14;
  v27[10] = @"vehicleMotionHint";
  v15 = +[NSNumber numberWithBool:[(CMMotionActivity *)self->_motionActivity isVehicleMotionHint]];
  v28[10] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:11];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F42F0;
  block[3] = &unk_100253B08;
  block[4] = self;
  id v26 = v16;
  id v18 = v16;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4488;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F47B4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F48A0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (CSAttSiriMotionNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAttSiriMotionNode;
  v5 = [(CSAttSiriMotionNode *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("CSAttSiriMotionNode queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v5->_type = 11;
    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    receivers = v5->_receivers;
    v5->_receivers = (NSHashTable *)v8;

    v5->_isReady = 0;
    requiredNodes = v5->_requiredNodes;
    v5->_requiredNodes = 0;

    objc_storeWeak((id *)&v5->_attSiriController, v4);
    mhId = v5->_mhId;
    v5->_mhId = 0;
  }
  return v5;
}

@end
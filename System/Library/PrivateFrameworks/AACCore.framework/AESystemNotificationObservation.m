@interface AESystemNotificationObservation
+ (id)observationWithNotificationName:(id)a3 queue:(id)a4 notificationHandler:(id)a5;
- (AESystemNotificationObservation)initWithNotificationName:(id)a3 queue:(id)a4 notificationHandler:(id)a5;
- (NSString)notificationName;
- (OS_dispatch_queue)queue;
- (id)notificationHandler;
- (void)beginObserving;
- (void)fire;
- (void)invalidate;
- (void)setNotificationHandler:(id)a3;
@end

@implementation AESystemNotificationObservation

- (AESystemNotificationObservation)initWithNotificationName:(id)a3 queue:(id)a4 notificationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AESystemNotificationObservation;
  v11 = [(AESystemNotificationObservation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    notificationName = v11->_notificationName;
    v11->_notificationName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    uint64_t v14 = MEMORY[0x23ED033D0](v10);
    id notificationHandler = v11->_notificationHandler;
    v11->_id notificationHandler = (id)v14;
  }
  return v11;
}

+ (id)observationWithNotificationName:(id)a3 queue:(id)a4 notificationHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[AESystemNotificationObservation alloc] initWithNotificationName:v9 queue:v8 notificationHandler:v7];

  [(AESystemNotificationObservation *)v10 beginObserving];
  return v10;
}

- (void)invalidate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = [(AESystemNotificationObservation *)self notificationName];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  [(AESystemNotificationObservation *)self setNotificationHandler:0];
}

- (void)beginObserving
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = [(AESystemNotificationObservation *)self notificationName];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AESystemNotificationDidFire, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)fire
{
  v3 = [(AESystemNotificationObservation *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__AESystemNotificationObservation_fire__block_invoke;
  block[3] = &unk_264EA3B18;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__AESystemNotificationObservation_fire__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) notificationHandler];
  v1[2]();
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)notificationHandler
{
  return self->_notificationHandler;
}

- (void)setNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
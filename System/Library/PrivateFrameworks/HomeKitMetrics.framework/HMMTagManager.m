@interface HMMTagManager
+ (id)sharedInstance;
- (HMMLogEventSubmitting)logEventSubmitter;
- (HMMTagDispatching)currentDispatcher;
- (HMMTagManager)init;
- (OS_dispatch_queue)workQueue;
- (void)registerTagObserver:(id)a3 forTags:(id)a4;
- (void)resetTagDispatcher;
- (void)setCurrentDispatcher:(id)a3;
- (void)setLogEventSubmitter:(id)a3;
- (void)submitTaggedEvent:(id)a3 processorList:(id)a4;
- (void)unregisterTagObserver:(id)a3 forTags:(id)a4;
@end

@implementation HMMTagManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDispatcher, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setCurrentDispatcher:(id)a3
{
}

- (HMMTagDispatching)currentDispatcher
{
  return (HMMTagDispatching *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogEventSubmitter:(id)a3
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)unregisterTagObserver:(id)a3 forTags:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMMTagManager *)self currentDispatcher];
  [v8 unregisterTagObserver:v7 forTags:v6];
}

- (void)registerTagObserver:(id)a3 forTags:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMMTagManager *)self currentDispatcher];
  [v8 registerTagObserver:v7 forTags:v6];
}

- (void)submitTaggedEvent:(id)a3 processorList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMMTagManager *)self currentDispatcher];
  [v8 submitTaggedEvent:v7 processorList:v6];
}

- (void)resetTagDispatcher
{
  v3 = [HMMTagDispatcher alloc];
  id v5 = [(HMMTagManager *)self workQueue];
  v4 = [(HMMTagDispatcher *)v3 initWithWorkQueue:v5];
  [(HMMTagManager *)self setCurrentDispatcher:v4];
}

- (HMMTagManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)HMMTagManager;
  v2 = [(HMMTagManager *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMMDispatchQueueName(v2, 0);
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v7 = dispatch_queue_create(v4, v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    v9 = [[HMMTagDispatcher alloc] initWithWorkQueue:v3->_workQueue];
    currentDispatcher = v3->_currentDispatcher;
    v3->_currentDispatcher = (HMMTagDispatching *)v9;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance__hmf_once_t0_1393 != -1) {
    dispatch_once(&sharedInstance__hmf_once_t0_1393, &__block_literal_global_1394);
  }
  v2 = (void *)sharedInstance__hmf_once_v1_1395;
  return v2;
}

uint64_t __31__HMMTagManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HMMTagManager);
  uint64_t v1 = sharedInstance__hmf_once_v1_1395;
  sharedInstance__hmf_once_v1_1395 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
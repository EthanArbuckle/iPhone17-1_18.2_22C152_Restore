@interface C3DEngineNotificationQueueTransientWrapper
- (__C3DEngineNotificationQueue)engineNotificationQueue;
- (void)dealloc;
- (void)setEngineNotificationQueue:(__C3DEngineNotificationQueue *)a3;
@end

@implementation C3DEngineNotificationQueueTransientWrapper

- (void)setEngineNotificationQueue:(__C3DEngineNotificationQueue *)a3
{
}

- (__C3DEngineNotificationQueue)engineNotificationQueue
{
  return (__C3DEngineNotificationQueue *)objc_loadWeak(&self->_queue);
}

- (void)dealloc
{
  objc_storeWeak(&self->_queue, 0);
  v3.receiver = self;
  v3.super_class = (Class)C3DEngineNotificationQueueTransientWrapper;
  [(C3DEngineNotificationQueueTransientWrapper *)&v3 dealloc];
}

@end
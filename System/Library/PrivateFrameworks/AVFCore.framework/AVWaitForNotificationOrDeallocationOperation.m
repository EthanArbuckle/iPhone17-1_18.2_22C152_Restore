@interface AVWaitForNotificationOrDeallocationOperation
- (AVWaitForNotificationOrDeallocationOperation)initWithObject:(id)a3 notificationNames:(id)a4;
- (id)_monitoredObject;
- (void)_balanceMonitoringIsFinishedSemaphore;
- (void)_registerForObjectNotifications;
- (void)_signalMonitoringIsFinishedIfNeeded;
- (void)_unregisterForObjectNotifications;
- (void)_waitUntilFinishedIfNeeded;
- (void)dealloc;
@end

@implementation AVWaitForNotificationOrDeallocationOperation

- (AVWaitForNotificationOrDeallocationOperation)initWithObject:(id)a3 notificationNames:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVWaitForNotificationOrDeallocationOperation;
  v6 = [(AVWaitForNotificationOrDeallocationOperation *)&v10 init];
  if (v6)
  {
    if (!a3) {
      goto LABEL_10;
    }
    v6->_weakReferenceToMonitoredObject = [[AVWeakReference alloc] initWithReferencedObject:a3];
    v7 = [[AVWeakReference alloc] initWithReferencedObject:v6];
    v6->_weakReferenceToSelf = v7;
    if (v7) {
      CFRetain(v7);
    }
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->_operationStateSerializationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.waitForNotificationOrDeallocationOperation", v8);
    v6->_monitoringIsFinishedSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v6->_notificationNames = (NSArray *)[a4 copy];
    if (v6->_weakReferenceToSelf
      && v6->_weakReferenceToMonitoredObject
      && v6->_operationStateSerializationQueue
      && v6->_monitoringIsFinishedSemaphore)
    {
      +[AVDepartureAnnouncingObjectMonitor attachDepartureAnnouncingObjectMonitorToObject:a3 monitoringObject:v6];
      [(AVWaitForNotificationOrDeallocationOperation *)v6 _registerForObjectNotifications];
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v6;
}

- (void)_registerForObjectNotifications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_registeredForObjectNotifications)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    notificationNames = self->_notificationNames;
    uint64_t v5 = [(NSArray *)notificationNames countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(notificationNames);
          }
          [v3 addListenerWithWeakReference:self->_weakReferenceToSelf callback:avWaitForNotificationOrDeallocationOperationNotificationHandler name:*(void *)(*((void *)&v9 + 1) + 8 * i) object:0 flags:0];
        }
        uint64_t v6 = [(NSArray *)notificationNames countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    self->_registeredForObjectNotifications = 1;
  }
}

- (void)_unregisterForObjectNotifications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_registeredForObjectNotifications)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    notificationNames = self->_notificationNames;
    uint64_t v5 = [(NSArray *)notificationNames countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(notificationNames);
          }
          [v3 removeListenerWithWeakReference:self->_weakReferenceToSelf callback:avWaitForNotificationOrDeallocationOperationNotificationHandler name:*(void *)(*((void *)&v9 + 1) + 8 * i) object:0];
        }
        uint64_t v6 = [(NSArray *)notificationNames countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    self->_registeredForObjectNotifications = 0;
  }
}

- (void)dealloc
{
  [(AVWaitForNotificationOrDeallocationOperation *)self _balanceMonitoringIsFinishedSemaphore];
  [(AVWaitForNotificationOrDeallocationOperation *)self _unregisterForObjectNotifications];
  weakReferenceToSelf = self->_weakReferenceToSelf;
  if (weakReferenceToSelf) {
    CFRelease(weakReferenceToSelf);
  }
  operationStateSerializationQueue = self->_operationStateSerializationQueue;
  if (operationStateSerializationQueue) {
    dispatch_release(operationStateSerializationQueue);
  }
  monitoringIsFinishedSemaphore = self->_monitoringIsFinishedSemaphore;
  if (monitoringIsFinishedSemaphore) {
    dispatch_release(monitoringIsFinishedSemaphore);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVWaitForNotificationOrDeallocationOperation;
  [(AVWaitForNotificationOrDeallocationOperation *)&v6 dealloc];
}

- (id)_monitoredObject
{
  return [(AVWeakReference *)self->_weakReferenceToMonitoredObject referencedObject];
}

- (void)_signalMonitoringIsFinishedIfNeeded
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  operationStateSerializationQueue = self->_operationStateSerializationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AVWaitForNotificationOrDeallocationOperation__signalMonitoringIsFinishedIfNeeded__block_invoke;
  v4[3] = &unk_1E57B2110;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(operationStateSerializationQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_monitoringIsFinishedSemaphore);
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __83__AVWaitForNotificationOrDeallocationOperation__signalMonitoringIsFinishedIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 290) ^ 1;
  *(unsigned char *)(*(void *)(result + 32) + 290) = 1;
  return result;
}

- (void)_waitUntilFinishedIfNeeded
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  operationStateSerializationQueue = self->_operationStateSerializationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__AVWaitForNotificationOrDeallocationOperation__waitUntilFinishedIfNeeded__block_invoke;
  v4[3] = &unk_1E57B2110;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(operationStateSerializationQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_monitoringIsFinishedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __74__AVWaitForNotificationOrDeallocationOperation__waitUntilFinishedIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 289) ^ 1;
  *(unsigned char *)(*(void *)(result + 32) + 289) = 1;
  return result;
}

- (void)_balanceMonitoringIsFinishedSemaphore
{
  if (self->_operationStateSerializationQueue && self->_monitoringIsFinishedSemaphore)
  {
    [(AVWaitForNotificationOrDeallocationOperation *)self _signalMonitoringIsFinishedIfNeeded];
    [(AVWaitForNotificationOrDeallocationOperation *)self _waitUntilFinishedIfNeeded];
  }
}

@end
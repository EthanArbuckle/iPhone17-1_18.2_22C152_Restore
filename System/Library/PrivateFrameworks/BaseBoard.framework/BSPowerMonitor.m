@interface BSPowerMonitor
+ (id)sharedInstance;
- (BSPowerMonitor)init;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation BSPowerMonitor

+ (id)sharedInstance
{
  if (qword_1EB21B188 != -1) {
    dispatch_once(&qword_1EB21B188, &__block_literal_global_15);
  }
  v2 = (void *)_MergedGlobals_17;
  return v2;
}

void __32__BSPowerMonitor_sharedInstance__block_invoke()
{
  v0 = [BSPowerMonitor alloc];
  if (v0)
  {
    v10.receiver = v0;
    v10.super_class = (Class)BSPowerMonitor;
    id v1 = objc_msgSendSuper2(&v10, sel_init);
    if (v1)
    {
      dispatch_queue_t v2 = BSDispatchQueueCreateWithQualityOfService("com.apple.baseboard.powermonitor", 0, QOS_CLASS_USER_INITIATED, 0);
      v3 = (void *)*((void *)v1 + 4);
      *((void *)v1 + 4) = v2;

      *((_DWORD *)v1 + 10) = 0;
      uint64_t v4 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      v5 = (void *)*((void *)v1 + 6);
      *((void *)v1 + 6) = v4;

      uint64_t v6 = +[BSZeroingWeakReference referenceWithObject:v1];
      v7 = (void *)*((void *)v1 + 3);
      *((void *)v1 + 3) = v6;

      io_connect_t v8 = IORegisterForSystemPower(*((void **)v1 + 3), (IONotificationPortRef *)v1 + 1, (IOServiceInterestCallback)_BSPowerChanged, (io_object_t *)v1 + 4);
      *((_DWORD *)v1 + 14) = v8;
      if (v8) {
        IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v1 + 1), *((dispatch_queue_t *)v1 + 4));
      }
    }
  }
  else
  {
    id v1 = 0;
  }
  v9 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = (uint64_t)v1;
}

- (BSPowerMonitor)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSPowerMonitor.m" lineNumber:153 description:@"Please use the shared instance."];

  return 0;
}

- (void)dealloc
{
  if (self->_rootDomainConnect)
  {
    IODeregisterForSystemPower(&self->_notifier);
    IONotificationPortDestroy(self->_notificationPort);
    IOServiceClose(self->_rootDomainConnect);
  }
  v3 = self->_weakSelfWrapper;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__BSPowerMonitor_dealloc__block_invoke;
  block[3] = &unk_1E54457C8;
  io_connect_t v8 = v3;
  v5 = v3;
  dispatch_async(queue, block);

  v6.receiver = self;
  v6.super_class = (Class)BSPowerMonitor;
  [(BSPowerMonitor *)&v6 dealloc];
}

id __25__BSPowerMonitor_dealloc__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) object];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_lock_observers addObject:v5];
    os_unfair_lock_unlock(&self->_observersLock);
    id v4 = v5;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_lock_observers removeObject:v5];
    os_unfair_lock_unlock(&self->_observersLock);
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_weakSelfWrapper, 0);
}

@end
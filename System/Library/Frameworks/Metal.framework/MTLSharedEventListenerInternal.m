@interface MTLSharedEventListenerInternal
- (MTLSharedEventListenerInternal)init;
- (MTLSharedEventListenerInternal)initWithDispatchQueue:(id)a3;
- (id)dispatchQueue;
- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6;
- (void)dealloc;
@end

@implementation MTLSharedEventListenerInternal

- (MTLSharedEventListenerInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTLSharedEventListenerInternal;
  v2 = [(MTLSharedEventListener *)&v7 init];
  if (v2)
  {
    v2->_notificationPort = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
    dispatch_queue_t v3 = dispatch_queue_create("MTLSharedEventListener", 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
    if (!v3
      || (v4 = v3, (notificationPort = v2->_notificationPort) == 0)
      || (IONotificationPortSetDispatchQueue(notificationPort, v4), IOSurfaceSharedEventAddEventListener()))
    {

      return 0;
    }
  }
  return v2;
}

- (MTLSharedEventListenerInternal)initWithDispatchQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLSharedEventListenerInternal;
  id v4 = [(MTLSharedEventListener *)&v7 init];
  if (v4)
  {
    IONotificationPortRef v5 = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
    *((void *)v4 + 1) = v5;
    if (!a3
      || !v5
      || (*((void *)v4 + 2) = a3,
          dispatch_retain((dispatch_object_t)a3),
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v4 + 1), *((dispatch_queue_t *)v4 + 2)),
          IOSurfaceSharedEventAddEventListener()))
    {

      return 0;
    }
  }
  return (MTLSharedEventListenerInternal *)v4;
}

- (void)dealloc
{
  if (self->_dispatchQueue)
  {
    IONotificationPortSetDispatchQueue(self->_notificationPort, 0);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }
  IOSurfaceSharedEventRemoveEventListener();
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTLSharedEventListenerInternal;
  [(MTLSharedEventListenerInternal *)&v4 dealloc];
}

- (id)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6
{
  uint64_t v6 = IOSurfaceSharedEventNotifyEventListener();
  if (v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Internal error during notification request %08x", v6);
  }
}

@end
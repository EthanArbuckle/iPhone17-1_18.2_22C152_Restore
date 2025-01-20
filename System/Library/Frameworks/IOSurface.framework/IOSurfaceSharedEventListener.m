@interface IOSurfaceSharedEventListener
- (IOSurfaceSharedEventListener)init;
- (IOSurfaceSharedEventListener)initWithDispatchQueue:(id)a3;
- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6;
- (void)dealloc;
@end

@implementation IOSurfaceSharedEventListener

- (IOSurfaceSharedEventListener)initWithDispatchQueue:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)IOSurfaceSharedEventListener;
  id v4 = [(IOSurfaceSharedEventListener *)&v8 init];
  if (!v4) {
    return (IOSurfaceSharedEventListener *)v4;
  }
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    a3 = dispatch_queue_create("IOSurfaceEventNotification", 0);
    if (!a3)
    {
LABEL_8:

      return 0;
    }
  }
  *((void *)v4 + 2) = a3;
  v5 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  *((void *)v4 + 1) = v5;
  if (!v5) {
    goto LABEL_8;
  }
  IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v4 + 2));
  uint64_t v6 = IOSurfaceSharedEventAddEventListener((unint64_t)v4, *((IONotificationPortRef *)v4 + 1));
  if (v6)
  {
    NSLog(&cfstr_Iosurfaceshare.isa, v6);
    goto LABEL_8;
  }
  return (IOSurfaceSharedEventListener *)v4;
}

- (IOSurfaceSharedEventListener)init
{
  return [(IOSurfaceSharedEventListener *)self initWithDispatchQueue:0];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (self->_notificationPort)
  {
    IOSurfaceSharedEventRemoveEventListener((uint64_t)self);
    IONotificationPortSetDispatchQueue(self->_notificationPort, 0);
    IONotificationPortDestroy(self->_notificationPort);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceSharedEventListener;
  [(IOSurfaceSharedEventListener *)&v4 dealloc];
}

- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6
{
  uint64_t v6 = IOSurfaceSharedEventNotifyEventListener(self, a4, a3, a5, a6);
  if (v6) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Internal error during notification request %08x", v6);
  }
}

@end
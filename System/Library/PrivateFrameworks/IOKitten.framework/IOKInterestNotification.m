@interface IOKInterestNotification
- (IOKInterestNotification)init;
- (IOKInterestNotificationRef)notificationRef;
- (OS_dispatch_queue)queue;
- (id)handler;
- (unsigned)object;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setObject:(unsigned int)a3;
- (void)setQueue:(id)a3;
@end

@implementation IOKInterestNotification

id __34__IOKInterestNotification_dealloc__block_invoke()
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRef, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)dealloc
{
  io_object_t object = self->_object;
  if (object) {
    IOObjectRelease(object);
  }
  [(IOKInterestNotificationRef *)self->_notificationRef lock];
  [(IOKInterestNotificationRef *)self->_notificationRef setNotification:0];
  [(IOKInterestNotificationRef *)self->_notificationRef unlock];
  v4 = self->_notificationRef;
  v5 = v4;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__IOKInterestNotification_dealloc__block_invoke;
    block[3] = &unk_26456E820;
    v10 = v4;
    dispatch_async(queue, block);
  }
  notificationRef = self->_notificationRef;
  self->_notificationRef = 0;

  v8.receiver = self;
  v8.super_class = (Class)IOKInterestNotification;
  [(IOKInterestNotification *)&v8 dealloc];
}

- (void)setQueue:(id)a3
{
}

- (void)setObject:(unsigned int)a3
{
  io_object_t object = self->_object;
  if (object) {
    IOObjectRelease(object);
  }
  self->_io_object_t object = a3;
  if (a3)
  {
    IOObjectRetain(a3);
  }
}

- (void)setHandler:(id)a3
{
}

- (IOKInterestNotificationRef)notificationRef
{
  return self->_notificationRef;
}

- (IOKInterestNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)IOKInterestNotification;
  v2 = [(IOKInterestNotification *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IOKInterestNotificationRef);
    notificationRef = v2->_notificationRef;
    v2->_notificationRef = v3;

    [(IOKInterestNotificationRef *)v2->_notificationRef setNotification:v2];
  }
  return v2;
}

- (id)handler
{
  return self->_handler;
}

- (unsigned)object
{
  return self->_object;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
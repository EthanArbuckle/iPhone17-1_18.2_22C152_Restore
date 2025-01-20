@interface IOKMatchingNotification
- (IOKIterator)iterator;
- (IOKMatchingNotification)init;
- (IOKMatchingNotificationRef)notificationRef;
- (OS_dispatch_queue)queue;
- (id)handler;
- (void)dealloc;
- (void)primeNotification;
- (void)setHandler:(id)a3;
- (void)setIterator:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IOKMatchingNotification

- (IOKMatchingNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)IOKMatchingNotification;
  v2 = [(IOKMatchingNotification *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IOKMatchingNotificationRef);
    notificationRef = v2->_notificationRef;
    v2->_notificationRef = v3;

    [(IOKMatchingNotificationRef *)v2->_notificationRef setNotification:v2];
  }
  return v2;
}

- (void)primeNotification
{
  v4 = [(IOKMatchingNotification *)self handler];
  v3 = [(IOKMatchingNotification *)self iterator];
  v4[2](v4, v3);
}

- (void)dealloc
{
  [(IOKMatchingNotificationRef *)self->_notificationRef lock];
  [(IOKMatchingNotificationRef *)self->_notificationRef setNotification:0];
  [(IOKMatchingNotificationRef *)self->_notificationRef unlock];
  v3 = self->_notificationRef;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__IOKMatchingNotification_dealloc__block_invoke;
  block[3] = &unk_26456E820;
  v9 = v3;
  v5 = v3;
  dispatch_async(queue, block);
  notificationRef = self->_notificationRef;
  self->_notificationRef = 0;

  v7.receiver = self;
  v7.super_class = (Class)IOKMatchingNotification;
  [(IOKMatchingNotification *)&v7 dealloc];
}

id __34__IOKMatchingNotification_dealloc__block_invoke()
{
  return self;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (IOKIterator)iterator
{
  return self->_iterator;
}

- (void)setIterator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IOKMatchingNotificationRef)notificationRef
{
  return self->_notificationRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRef, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_iterator, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end
@interface FSUnaryItem
- (FSUnaryItem)init;
- (OS_dispatch_queue)queue;
- (void)dealloc;
@end

@implementation FSUnaryItem

- (FSUnaryItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)FSUnaryItem;
  v2 = [(FSItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    queue = v2->_queue;
    v2->_queue = 0;
  }
  return v3;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FSUnaryItem;
  [(FSUnaryItem *)&v4 dealloc];
}

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (!queue)
  {
    objc_super v4 = self;
    objc_sync_enter(v4);
    if (!self->_queue)
    {
      v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fskit.fsitem.queue", 0);
      objc_super v6 = self->_queue;
      self->_queue = v5;
    }
    objc_sync_exit(v4);

    queue = self->_queue;
  }
  return queue;
}

- (void).cxx_destruct
{
}

@end
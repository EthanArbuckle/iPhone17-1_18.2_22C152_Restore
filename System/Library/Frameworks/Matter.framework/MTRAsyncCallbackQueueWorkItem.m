@interface MTRAsyncCallbackQueueWorkItem
- (BOOL)enqueued;
- (MTRAsyncCallbackQueueWorkItem)initWithQueue:(dispatch_queue_t)queue;
- (MTRAsyncCallbackReadyHandler)readyHandler;
- (MTRAsyncCallbackWorkQueue)workQueue;
- (OS_dispatch_queue)queue;
- (dispatch_block_t)cancelHandler;
- (os_unfair_lock_s)lock;
- (unint64_t)retryCount;
- (void)_invalidate;
- (void)callReadyHandlerWithContext:(id)a3;
- (void)cancel;
- (void)endWork;
- (void)invalidate;
- (void)markEnqueued;
- (void)retryWork;
- (void)setReadyHandler:(MTRAsyncCallbackReadyHandler)readyHandler;
- (void)setRetryCount:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTRAsyncCallbackQueueWorkItem

- (MTRAsyncCallbackQueueWorkItem)initWithQueue:(dispatch_queue_t)queue
{
  v5 = queue;
  v9.receiver = self;
  v9.super_class = (Class)MTRAsyncCallbackQueueWorkItem;
  v6 = [(MTRAsyncCallbackQueueWorkItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_queue, queue);
  }

  return v7;
}

- (void)_invalidate
{
  id readyHandler = self->_readyHandler;
  self->_id readyHandler = 0;

  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = 0;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__invalidate(self, v4, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)markEnqueued
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_enqueued = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)setReadyHandler:(MTRAsyncCallbackReadyHandler)readyHandler
{
  id v6 = readyHandler;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_enqueued)
  {
    v4 = (void *)MEMORY[0x2456969D0](v6);
    id v5 = self->_readyHandler;
    self->_id readyHandler = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)endWork
{
  v4 = objc_msgSend_workQueue(self, a2, v2);
  objc_msgSend_endWork_(v4, v5, (uint64_t)self);

  objc_msgSend_invalidate(self, v6, v7);
}

- (void)retryWork
{
  objc_msgSend_workQueue(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_retryWork_(v5, v4, (uint64_t)self);
}

- (void)callReadyHandlerWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_queue(self, v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_244BDADF4;
  v9[3] = &unk_265193DC8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)MEMORY[0x2456969D0](self->_cancelHandler);
  objc_msgSend__invalidate(self, v5, v6);
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_super v9 = objc_msgSend_queue(self, v7, v8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244BDAF90;
    block[3] = &unk_265194E00;
    id v11 = v4;
    dispatch_async(v9, block);
  }
}

- (MTRAsyncCallbackReadyHandler)readyHandler
{
  return self->_readyHandler;
}

- (dispatch_block_t)cancelHandler
{
  return self->_cancelHandler;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (MTRAsyncCallbackWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (BOOL)enqueued
{
  return self->_enqueued;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cancelHandler, 0);

  objc_storeStrong(&self->_readyHandler, 0);
}

@end
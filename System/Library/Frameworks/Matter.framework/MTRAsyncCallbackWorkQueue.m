@interface MTRAsyncCallbackWorkQueue
- (MTRAsyncCallbackWorkQueue)initWithContext:(id)context queue:(dispatch_queue_t)queue;
- (NSMutableArray)items;
- (OS_dispatch_queue)queue;
- (id)context;
- (id)description;
- (os_unfair_lock_s)lock;
- (unint64_t)runningWorkItemCount;
- (void)_callNextReadyWorkItem;
- (void)_postProcessWorkItem:(id)a3 retry:(BOOL)a4;
- (void)endWork:(id)a3;
- (void)enqueueWorkItem:(MTRAsyncCallbackQueueWorkItem *)item;
- (void)invalidate;
- (void)retryWork:(id)a3;
- (void)setRunningWorkItemCount:(unint64_t)a3;
@end

@implementation MTRAsyncCallbackWorkQueue

- (MTRAsyncCallbackWorkQueue)initWithContext:(id)context queue:(dispatch_queue_t)queue
{
  id v7 = context;
  v8 = queue;
  v16.receiver = self;
  v16.super_class = (Class)MTRAsyncCallbackWorkQueue;
  v9 = [(MTRAsyncCallbackWorkQueue *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_context, context);
    objc_storeStrong((id *)&v10->_queue, queue);
    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF980], v11, v12);
    items = v10->_items;
    v10->_items = (NSMutableArray *)v13;
  }
  return v10;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = NSString;
  id v7 = objc_msgSend_context(self, v5, v6);
  v10 = objc_msgSend_items(self, v8, v9);
  uint64_t v13 = objc_msgSend_count(v10, v11, v12);
  v15 = objc_msgSend_stringWithFormat_(v4, v14, @"MTRAsyncCallbackWorkQueue context: %@ items count: %lu", v7, v13);

  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (void)enqueueWorkItem:(MTRAsyncCallbackQueueWorkItem *)item
{
  v4 = item;
  if (objc_msgSend_enqueued(v4, v5, v6))
  {
    uint64_t v9 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "MTRAsyncCallbackWorkQueue enqueueWorkItem: item cannot be enqueued twice", v17, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
  else
  {
    objc_msgSend_markEnqueued(v4, v7, v8);
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend_setWorkQueue_(v4, v10, (uint64_t)self);
    uint64_t v13 = objc_msgSend_items(self, v11, v12);
    objc_msgSend_addObject_(v13, v14, (uint64_t)v4);

    objc_msgSend__callNextReadyWorkItem(self, v15, v16);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_items;
  items = self->_items;
  self->_items = 0;

  os_unfair_lock_unlock(p_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_cancel(*(void **)(*((void *)&v15 + 1) + 8 * v12++), v8, v9, (void)v15);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend_removeAllObjects(v6, v13, v14);
}

- (void)_postProcessWorkItem:(id)a3 retry:(BOOL)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend_runningWorkItemCount(self, v8, v9))
  {
    uint64_t v12 = objc_msgSend_items(self, v10, v11);
    objc_msgSend_firstObject(v12, v13, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v6)
    {
      if (!a4)
      {
        uint64_t v20 = objc_msgSend_items(self, v16, v17);
        objc_msgSend_removeObjectAtIndex_(v20, v21, 0);
      }
      objc_msgSend_setRunningWorkItemCount_(self, v16, 0);
      objc_msgSend__callNextReadyWorkItem(self, v22, v23);
    }
    else
    {
      long long v18 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_ERROR, "MTRAsyncCallbackWorkQueue endWork: work item is not first on work queue", v24, 2u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
    }
  }
  else
  {
    v19 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_ERROR, "MTRAsyncCallbackWorkQueue endWork: no work is running on work queue", buf, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)endWork:(id)a3
{
}

- (void)retryWork:(id)a3
{
}

- (void)_callNextReadyWorkItem
{
  if (!objc_msgSend_runningWorkItemCount(self, a2, v2))
  {
    id v6 = objc_msgSend_items(self, v4, v5);
    uint64_t v9 = objc_msgSend_count(v6, v7, v8);

    if (v9)
    {
      objc_msgSend_setRunningWorkItemCount_(self, v10, 1);
      uint64_t v13 = objc_msgSend_items(self, v11, v12);
      objc_msgSend_firstObject(v13, v14, v15);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      long long v18 = objc_msgSend_context(self, v16, v17);
      objc_msgSend_callReadyHandlerWithContext_(v20, v19, (uint64_t)v18);
    }
  }
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)context
{
  return self->_context;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (unint64_t)runningWorkItemCount
{
  return self->_runningWorkItemCount;
}

- (void)setRunningWorkItemCount:(unint64_t)a3
{
  self->_runningWorkItemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_context, 0);
}

@end
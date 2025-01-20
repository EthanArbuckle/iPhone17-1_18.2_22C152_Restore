@interface CSRequestQueue
+ (id)_requestQueueAttribute:(BOOL)a3;
- (CSRequestQueue)initWithLabel:(char *)a3 target:(id)a4 critical:(BOOL)a5 startBlock:(id)a6;
- (CSRequestQueue)initWithLabel:(char *)a3 target:(id)a4 startBlock:(id)a5;
- (const)label;
- (void)async:(id)a3;
- (void)async:(id)a3 critical:(BOOL)a4;
- (void)enqueue:(id)a3;
- (void)handleEvent;
- (void)resume;
- (void)suspend;
- (void)sync:(id)a3;
- (void)validate;
@end

@implementation CSRequestQueue

- (void)enqueue:(id)a3
{
  id v4 = a3;
  qos_class_t v5 = qos_class_self();
  os_unfair_lock_lock(&self->_workItemsLock);
  if (self->_workItemsQoS >= v5)
  {
    [(NSMutableArray *)self->_workItems addObject:v4];

    os_unfair_lock_unlock(&self->_workItemsLock);
    workSource = self->_workSource;
    dispatch_source_merge_data(workSource, 1uLL);
  }
  else
  {
    self->_workItemsQoS = v5;
    [(NSMutableArray *)self->_workItems addObject:v4];

    os_unfair_lock_unlock(&self->_workItemsLock);
    dispatch_source_merge_data((dispatch_source_t)self->_workSource, 1uLL);
    v6 = self->_workQueue;
    qos_class_t v7 = qos_class_self();
    if (v7 < 0x1A) {
      dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_180);
    }
    else {
      dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v7, 0, &__block_literal_global_180);
    }
    id v10 = v8;
    dispatch_async((dispatch_queue_t)v6, v8);
  }
}

- (void)async:(id)a3
{
}

void __59__CSRequestQueue_initWithLabel_target_critical_startBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleEvent];
}

- (void)handleEvent
{
  if (dispatch_source_get_data((dispatch_source_t)self->_workSource))
  {
    os_unfair_lock_lock(&self->_workItemsLock);
    if (self->_critical) {
      unsigned int v3 = 17;
    }
    else {
      unsigned int v3 = 9;
    }
    self->_workItemsQoS = v3;
    while ([(NSMutableArray *)self->_workItems count])
    {
      if (atomic_load(&self->_suspended)) {
        break;
      }
      qos_class_t v5 = [(NSMutableArray *)self->_workItems firstObject];
      [(NSMutableArray *)self->_workItems removeObjectAtIndex:0];
      os_unfair_lock_unlock(&self->_workItemsLock);
      (*((void (**)(void))self->_startBlock + 2))();
      os_unfair_lock_lock(&self->_workItemsLock);
    }
    os_unfair_lock_unlock(&self->_workItemsLock);
  }
  else
  {
    if (self->_critical) {
      unsigned int v6 = 17;
    }
    else {
      unsigned int v6 = 9;
    }
    self->_workItemsQoS = v6;
  }
}

- (void)validate
{
}

void __41__CSRequestQueue__requestQueueAttribute___block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  _requestQueueAttribute__shouldPropagateQos = [v1 isEqualToString:@"com.apple.migrationpluginwrapper"];
}

- (CSRequestQueue)initWithLabel:(char *)a3 target:(id)a4 startBlock:(id)a5
{
  return [(CSRequestQueue *)self initWithLabel:a3 target:a4 critical:0 startBlock:a5];
}

- (CSRequestQueue)initWithLabel:(char *)a3 target:(id)a4 critical:(BOOL)a5 startBlock:(id)a6
{
  id v10 = (dispatch_queue_t *)a4;
  id v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CSRequestQueue;
  v12 = [(CSRequestQueue *)&v28 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    v14 = (void *)*((void *)v12 + 5);
    *((void *)v12 + 5) = v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16 = (void *)*((void *)v12 + 6);
    *((void *)v12 + 6) = v15;

    *((_DWORD *)v12 + 8) = 0;
    v12[56] = a5;
    v17 = [(id)objc_opt_class() _requestQueueAttribute:v12[56]];
    if (v10) {
      dispatch_queue_t v18 = dispatch_queue_create_with_target_V2(a3, v17, v10[2]);
    }
    else {
      dispatch_queue_t v18 = dispatch_queue_create(a3, v17);
    }
    v19 = (void *)*((void *)v12 + 2);
    *((void *)v12 + 2) = v18;

    if (v12[56]) {
      int v20 = 17;
    }
    else {
      int v20 = 9;
    }
    *((_DWORD *)v12 + 9) = v20;
    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v12 + 2));
    v22 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = v21;

    if (v12[56]) {
      dispatch_set_qos_class_floor(*((dispatch_object_t *)v12 + 3), QOS_CLASS_UTILITY, 0);
    }
    id location = 0;
    objc_initWeak(&location, v12);
    v23 = *((void *)v12 + 3);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__CSRequestQueue_initWithLabel_target_critical_startBlock___block_invoke;
    v25[3] = &unk_1E554CAE8;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v23, v25);
    dispatch_source_set_cancel_handler(*((dispatch_source_t *)v12 + 3), &__block_literal_global_178);
    dispatch_activate(*((dispatch_object_t *)v12 + 3));
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return (CSRequestQueue *)v12;
}

+ (id)_requestQueueAttribute:(BOOL)a3
{
  BOOL v3 = a3;
  if (_requestQueueAttribute__onceToken != -1) {
    dispatch_once(&_requestQueueAttribute__onceToken, &__block_literal_global_29);
  }
  if (_requestQueueAttribute__shouldPropagateQos)
  {
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  }
  else
  {
    if (v3) {
      dispatch_qos_class_t v5 = QOS_CLASS_UTILITY;
    }
    else {
      dispatch_qos_class_t v5 = QOS_CLASS_BACKGROUND;
    }
    unsigned int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v6, v5, 0);
  }

  return v4;
}

- (void)suspend
{
}

- (void)resume
{
  if (atomic_fetch_add((atomic_uint *volatile)&self->_suspended, 0xFFFFFFFF) == 1) {
    dispatch_source_merge_data((dispatch_source_t)self->_workSource, 1uLL);
  }
}

- (void)async:(id)a3 critical:(BOOL)a4
{
  unsigned int v6 = self->_workQueue;
  id v7 = a3;
  qos_class_t v8 = qos_class_self();
  BOOL v9 = v8 > QOS_CLASS_BACKGROUND && a4;
  if (v9 || v8 >= 0x1A) {
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v7);
  }
  else {
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  }
  dispatch_block_t block = v10;

  dispatch_async((dispatch_queue_t)v6, block);
}

- (void)sync:(id)a3
{
  workQueue = self->_workQueue;
  dispatch_block_t block = a3;
  dispatch_assert_queue_not_V2(workQueue);
  dispatch_sync((dispatch_queue_t)self->_workQueue, block);
}

- (const)label
{
  return dispatch_queue_get_label((dispatch_queue_t)self->_workQueue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_workSource, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
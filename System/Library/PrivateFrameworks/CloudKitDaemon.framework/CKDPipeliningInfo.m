@interface CKDPipeliningInfo
- (BOOL)isCancelled;
- (BOOL)perRequestCallbackQueueSuspended;
- (CKDOperationPipelining)operation;
- (CKDPipeliningInfo)initWithRequest:(id)a3 operation:(id)a4;
- (CKDURLRequestPipelining)request;
- (NSMutableArray)perRequestCallbackBlocks;
- (OS_dispatch_group)perRequestCallbackGroup;
- (OS_dispatch_group)perRequestGroup;
- (OS_dispatch_queue)perRequestCallbackQueue;
- (id)_initWithRequest:(id)a3 operation:(id)a4;
- (id)initForUnitTests;
- (void)addPerRequestCallbackBlock:(id)a3;
- (void)cancelAndDisablePerRequestCallbackBlocks;
- (void)dealloc;
- (void)disablePerRequestCallbackBlocks;
- (void)resumeCallbackQueue;
- (void)setIsCancelled:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)setPerRequestCallbackBlocks:(id)a3;
- (void)setPerRequestCallbackGroup:(id)a3;
- (void)setPerRequestCallbackQueue:(id)a3;
- (void)setPerRequestCallbackQueueSuspended:(BOOL)a3;
- (void)setPerRequestGroup:(id)a3;
- (void)setRequest:(id)a3;
- (void)suspendCallbackQueue;
@end

@implementation CKDPipeliningInfo

- (id)_initWithRequest:(id)a3 operation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CKDPipeliningInfo;
  v9 = [(CKDPipeliningInfo *)&v37 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    dispatch_group_t v11 = dispatch_group_create();
    perRequestCallbackGroup = v10->_perRequestCallbackGroup;
    v10->_perRequestCallbackGroup = (OS_dispatch_group *)v11;

    dispatch_group_t v13 = dispatch_group_create();
    perRequestGroup = v10->_perRequestGroup;
    v10->_perRequestGroup = (OS_dispatch_group *)v13;

    uint64_t v17 = objc_msgSend_pipeliningDescription(v8, v15, v16);
    v18 = (void *)v17;
    v19 = @"pipelining";
    if (v17) {
      v19 = (__CFString *)v17;
    }
    v20 = v19;

    v22 = objc_msgSend_stringWithFormat_(NSString, v21, @"com.apple.cloudkit.%@.callback.%p", v20, v7);
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_initially_inactive(v23);

    v27 = (const char *)objc_msgSend_UTF8String(v22, v25, v26);
    dispatch_queue_t v28 = dispatch_queue_create(v27, v24);
    perRequestCallbackQueue = v10->_perRequestCallbackQueue;
    v10->_perRequestCallbackQueue = (OS_dispatch_queue *)v28;

    v30 = v10->_perRequestCallbackQueue;
    v33 = objc_msgSend_callbackQueue(v8, v31, v32);
    dispatch_set_target_queue(v30, v33);

    dispatch_activate((dispatch_object_t)v10->_perRequestCallbackQueue);
    uint64_t v34 = objc_opt_new();
    perRequestCallbackBlocks = v10->_perRequestCallbackBlocks;
    v10->_perRequestCallbackBlocks = (NSMutableArray *)v34;

    v10->_isCancelled = 0;
  }

  return v10;
}

- (CKDPipeliningInfo)initWithRequest:(id)a3 operation:(id)a4
{
  return (CKDPipeliningInfo *)MEMORY[0x1F4181798](self, sel__initWithRequest_operation_, a3);
}

- (id)initForUnitTests
{
  return (id)MEMORY[0x1F4181798](self, sel__initWithRequest_operation_, 0);
}

- (void)dealloc
{
  if (objc_msgSend_perRequestCallbackQueueSuspended(self, a2, v2)) {
    dispatch_resume((dispatch_object_t)self->_perRequestCallbackQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPipeliningInfo;
  [(CKDPipeliningInfo *)&v4 dealloc];
}

- (BOOL)isCancelled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL isCancelled = v2->_isCancelled;
  objc_sync_exit(v2);

  return isCancelled;
}

- (void)addPerRequestCallbackBlock:(id)a3
{
  id aBlock = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  perRequestCallbackBlocks = v4->_perRequestCallbackBlocks;
  v6 = _Block_copy(aBlock);
  objc_msgSend_addObject_(perRequestCallbackBlocks, v7, (uint64_t)v6);

  objc_sync_exit(v4);
}

- (void)disablePerRequestCallbackBlocks
{
  obj = self;
  objc_sync_enter(obj);
  perRequestCallbackBlocks = obj->_perRequestCallbackBlocks;
  obj->_perRequestCallbackBlocks = 0;

  objc_sync_exit(obj);
}

- (void)cancelAndDisablePerRequestCallbackBlocks
{
  obj = self;
  objc_sync_enter(obj);
  perRequestCallbackBlocks = obj->_perRequestCallbackBlocks;
  if (perRequestCallbackBlocks) {
    obj->_BOOL isCancelled = 1;
  }
  obj->_perRequestCallbackBlocks = 0;

  objc_sync_exit(obj);
}

- (void)suspendCallbackQueue
{
  if (self->_perRequestCallbackQueueSuspended)
  {
    v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CKDOperation.m", 139, @"only one suspend is supported");
  }
  objc_msgSend_setPerRequestCallbackQueueSuspended_(self, a2, 1);
  perRequestCallbackQueue = self->_perRequestCallbackQueue;
  dispatch_suspend(perRequestCallbackQueue);
}

- (void)resumeCallbackQueue
{
  if (!self->_perRequestCallbackQueueSuspended)
  {
    v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CKDOperation.m", 146, @"resume without a suspend");
  }
  objc_msgSend_setPerRequestCallbackQueueSuspended_(self, a2, 0);
  perRequestCallbackQueue = self->_perRequestCallbackQueue;
  dispatch_resume(perRequestCallbackQueue);
}

- (CKDURLRequestPipelining)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (CKDOperationPipelining)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  return (CKDOperationPipelining *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (OS_dispatch_group)perRequestCallbackGroup
{
  return self->_perRequestCallbackGroup;
}

- (void)setPerRequestCallbackGroup:(id)a3
{
}

- (OS_dispatch_group)perRequestGroup
{
  return self->_perRequestGroup;
}

- (void)setPerRequestGroup:(id)a3
{
}

- (OS_dispatch_queue)perRequestCallbackQueue
{
  return self->_perRequestCallbackQueue;
}

- (void)setPerRequestCallbackQueue:(id)a3
{
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_BOOL isCancelled = a3;
}

- (BOOL)perRequestCallbackQueueSuspended
{
  return self->_perRequestCallbackQueueSuspended;
}

- (void)setPerRequestCallbackQueueSuspended:(BOOL)a3
{
  self->_perRequestCallbackQueueSuspended = a3;
}

- (NSMutableArray)perRequestCallbackBlocks
{
  return self->_perRequestCallbackBlocks;
}

- (void)setPerRequestCallbackBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perRequestCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_perRequestCallbackQueue, 0);
  objc_storeStrong((id *)&self->_perRequestGroup, 0);
  objc_storeStrong((id *)&self->_perRequestCallbackGroup, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
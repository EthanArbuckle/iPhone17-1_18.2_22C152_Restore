@interface _CATOperationTargetSelectorObserver
- (OS_dispatch_queue)delegateQueue;
- (SEL)selector;
- (_CATOperationTargetSelectorObserver)init;
- (_CATOperationTargetSelectorObserver)initWithTarget:(id)a3 selector:(SEL)a4 events:(unint64_t)a5 userInfo:(id)a6 delegateQueue:(id)a7;
- (id)target;
- (id)userInfo;
- (unint64_t)events;
- (void)invokeActionWithOperation:(id)a3;
- (void)operationDidFinish:(id)a3;
- (void)operationDidProgress:(id)a3;
- (void)operationDidStart:(id)a3;
@end

@implementation _CATOperationTargetSelectorObserver

- (_CATOperationTargetSelectorObserver)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATOperation.m", 673, @"%@: %@ is unavailable", v6, v7 object file lineNumber description];

  return 0;
}

- (_CATOperationTargetSelectorObserver)initWithTarget:(id)a3 selector:(SEL)a4 events:(unint64_t)a5 userInfo:(id)a6 delegateQueue:(id)a7
{
  id v14 = a3;
  id v15 = a6;
  v16 = a7;
  if (v14)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"CATOperation.m", 680, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"CATOperation.m", 681, @"Invalid parameter not satisfying: %@", @"sel" object file lineNumber description];

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)_CATOperationTargetSelectorObserver;
  v17 = [(_CATOperationTargetSelectorObserver *)&v31 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_target, a3);
    if (a4) {
      SEL v19 = a4;
    }
    else {
      SEL v19 = 0;
    }
    v18->_selector = v19;
    v18->_events = a5;
    objc_storeStrong(&v18->_userInfo, a6);
    v20 = NSString;
    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(a4);
    id v23 = [v20 stringWithFormat:@"%@.%p.%p.%@", v21, v18, v14, v22];
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], 0);
    delegateQueue = v18->_delegateQueue;
    v18->_delegateQueue = (OS_dispatch_queue *)v24;

    v26 = v18->_delegateQueue;
    if (v16)
    {
      dispatch_set_target_queue((dispatch_object_t)v18->_delegateQueue, v16);
    }
    else
    {
      v27 = dispatch_get_global_queue(21, 0);
      dispatch_set_target_queue(v26, v27);
    }
  }

  return v18;
}

- (void)operationDidStart:(id)a3
{
  id v4 = a3;
  if ([(_CATOperationTargetSelectorObserver *)self events]) {
    [(_CATOperationTargetSelectorObserver *)self invokeActionWithOperation:v4];
  }
}

- (void)operationDidProgress:(id)a3
{
  id v4 = a3;
  if (([(_CATOperationTargetSelectorObserver *)self events] & 8) != 0) {
    [(_CATOperationTargetSelectorObserver *)self invokeActionWithOperation:v4];
  }
}

- (void)operationDidFinish:(id)a3
{
  id v8 = a3;
  if (([(_CATOperationTargetSelectorObserver *)self events] & 4) != 0)
  {
    v5 = [v8 error];
    BOOL v4 = v5 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  if (([(_CATOperationTargetSelectorObserver *)self events] & 2) != 0)
  {
    v7 = [v8 error];
    BOOL v6 = v7 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (v4 || v6) {
    [(_CATOperationTargetSelectorObserver *)self invokeActionWithOperation:v8];
  }
}

- (void)invokeActionWithOperation:(id)a3
{
  id v4 = a3;
  v5 = [(_CATOperationTargetSelectorObserver *)self delegateQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65___CATOperationTargetSelectorObserver_invokeActionWithOperation___block_invoke;
  v8[3] = &unk_2641DC000;
  v8[4] = self;
  id v9 = v4;
  BOOL v6 = v8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_2;
  block[3] = &unk_2641DBD98;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

- (id)target
{
  return self->_target;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (unint64_t)events
{
  return self->_events;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong(&self->_userInfo, 0);

  objc_storeStrong(&self->_target, 0);
}

@end
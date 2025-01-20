@interface HMFDispatchContext
+ (void)blessWithImplicitContext:(id)a3;
- (HMFDispatchContext)initWithQueue:(id)a3;
- (HMFDispatchContext)initWithQueue:(id)a3 alwaysDispatch:(BOOL)a4;
- (OS_dispatch_queue)queue;
- (void)assertIsExecuting;
- (void)dealloc;
- (void)performBlock:(id)a3;
@end

@implementation HMFDispatchContext

- (HMFDispatchContext)initWithQueue:(id)a3
{
  return [(HMFDispatchContext *)self initWithQueue:a3 alwaysDispatch:0];
}

- (HMFDispatchContext)initWithQueue:(id)a3 alwaysDispatch:(BOOL)a4
{
  v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMFDispatchContext;
  v8 = [(HMFDispatchContext *)&v10 init];
  if (v8)
  {
    dispatch_queue_set_specific(v7, v8, v8, 0);
    objc_storeStrong((id *)&v8->_queue, a3);
    v8->_alwaysDispatch = a4;
  }

  return v8;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)HMFDispatchContext;
  [(HMFDispatchContext *)&v3 dealloc];
}

- (void)assertIsExecuting
{
  if (!self || dispatch_get_specific(self) != self) {
    _HMFPreconditionFailure(@"[self isExecuting]");
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)performBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if (!self->_alwaysDispatch && dispatch_get_specific(self) == self)
  {
    v6 = self;
    v7 = (CFTypeRef *)_HMFThreadLocalAsyncContext();
    CFTypeRef v8 = *v7;
    CFTypeRef *v7 = v9;
    v4[2](v4);
    CFRelease(*v7);
    CFTypeRef *v7 = v8;
  }
  else
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__HMFDispatchContext_performBlock___block_invoke;
    v10[3] = &unk_1E5957780;
    v10[4] = self;
    v11 = v4;
    dispatch_async(queue, v10);
  }
}

void __35__HMFDispatchContext_performBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_super v3 = (CFTypeRef *)_HMFThreadLocalAsyncContext();
  CFTypeRef v4 = *v3;
  *objc_super v3 = v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  CFRelease(*v3);
  *objc_super v3 = v4;
}

+ (void)blessWithImplicitContext:(id)a3
{
  objc_super v3 = a3;
  if (!v3) {
    _HMFPreconditionFailure(@"queue");
  }
  queue = v3;
  if (!dispatch_queue_get_specific(v3, &implicitContextKey))
  {
    CFTypeRef v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
    *CFTypeRef v4 = queue;
    dispatch_queue_set_specific(queue, &implicitContextKey, v4, (dispatch_function_t)HMFImplicitDispatchContextDestroy);
  }
}

- (void).cxx_destruct
{
}

@end
@interface OSLogEventStreamBase
- (NSPredicate)filterPredicate;
- (OSLogEventStreamBase)init;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)target;
- (id)invalidationHandler;
- (id)streamHandler;
- (unint64_t)flags;
- (unsigned)invalidated;
- (void)invalidate;
- (void)setEventHandler:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setInvalidated:(unsigned int)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStreamHandler:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation OSLogEventStreamBase

- (unsigned)invalidated
{
  return self->_invalidated;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

uint64_t __40__OSLogEventStreamBase_setEventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStreamHandler:*(void *)(a1 + 40)];
}

- (void)setStreamHandler:(id)a3
{
}

- (void)invalidate
{
}

uint64_t __47__OSLogEventStreamBase_setInvalidationHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = _Block_copy(*(const void **)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (OSLogEventStreamBase)init
{
  v8.receiver = self;
  v8.super_class = (Class)OSLogEventStreamBase;
  id v2 = [(OSLogEventStreamBase *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.loggingsupport.stream", 0);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = dispatch_get_global_queue(0, 0);
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 2), *((dispatch_queue_t *)v2 + 3));
  }
  return (OSLogEventStreamBase *)v2;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    v4 = [[_OSLogPredicateMapper alloc] initWithPredicate:v12];
    uint64_t v5 = [(_OSLogPredicateMapper *)v4 mappedPredicate];

    if (!v5)
    {
      objc_super v8 = (void *)MEMORY[0x1E4F1CA00];
      v9 = [(_OSLogPredicateMapper *)v4 validationErrors];
      v10 = [v9 componentsJoinedByString:@"\n"];
      v11 = [v8 exceptionWithName:@"OSLogInvalidPredicateException" reason:v10 userInfo:0];

      objc_exception_throw(v11);
    }
    v6 = [(_OSLogPredicateMapper *)v4 mappedPredicate];
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v6;

    [(NSPredicate *)self->_filterPredicate allowEvaluation];
    if (([(_OSLogPredicateMapper *)v4 flags] & 2) != 0) {
      self->_flags |= 1uLL;
    }
    if ([(_OSLogPredicateMapper *)v4 flags]) {
      self->_flags |= 2uLL;
    }
  }
  else
  {
    v4 = (_OSLogPredicateMapper *)self->_filterPredicate;
    self->_filterPredicate = 0;
  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__OSLogEventStreamBase_setInvalidationHandler___block_invoke;
  v7[3] = &unk_1E5A42878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setInvalidated:(unsigned int)a3
{
  self->_invalidated = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_streamHandler, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setEventHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__OSLogEventStreamBase_setEventHandler___block_invoke;
  v7[3] = &unk_1E5A42878;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setTarget:(id)a3
{
}

- (OS_dispatch_queue)target
{
  return self->_target;
}

- (void)setQueue:(id)a3
{
}

@end
@interface BSDispatchSource
- (uint64_t)initWithType:(uintptr_t)a3 handle:(uintptr_t)a4 mask:(void *)a5 queue:(void *)a6 configureSourceBlock:;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
@end

@implementation BSDispatchSource

- (void)resume
{
  if (a1)
  {
    if (!*(void *)(a1 + 16))
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_resume object:a1 file:@"BSDispatchSource.m" lineNumber:46 description:@"Cannot resume invalidated source"];
    }
    if (!*(void *)(a1 + 32))
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel_resume object:a1 file:@"BSDispatchSource.m" lineNumber:47 description:@"Resumed source has no event handler set"];
    }
    uint64_t v2 = *(void *)(a1 + 8);
    BOOL v6 = v2 == MEMORY[0x1E4F14458]
      || v2 == MEMORY[0x1E4F14460]
      || v2 == MEMORY[0x1E4F144B0]
      || v2 == MEMORY[0x1E4F14478]
      || v2 == MEMORY[0x1E4F144A8];
    if (v6 && !*(void *)(a1 + 40))
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_resume object:a1 file:@"BSDispatchSource.m" lineNumber:51 description:@"Source of file descriptor or mach port type has no cancel handler set"];
    }
    int v7 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v7, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v7)
    {
      dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 16), *(dispatch_block_t *)(a1 + 32));
      v8 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      v9 = *(void **)(a1 + 40);
      if (v9)
      {
        dispatch_source_set_cancel_handler(*(dispatch_source_t *)(a1 + 16), v9);
        v10 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0;
      }
      v11 = *(NSObject **)(a1 + 16);
      dispatch_activate(v11);
    }
  }
}

- (uint64_t)initWithType:(uintptr_t)a3 handle:(uintptr_t)a4 mask:(void *)a5 queue:(void *)a6 configureSourceBlock:
{
  v11 = a5;
  v12 = a6;
  if (a1)
  {
    if (!v11)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel_initWithType_handle_mask_queue_configureSourceBlock_, a1, @"BSDispatchSource.m", 23, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
    }
    uint64_t v13 = [a1 init];
    uint64_t v14 = v13;
    if (v13)
    {
      *(void *)(v13 + 8) = a2;
      dispatch_source_t v15 = dispatch_source_create(a2, a3, a4, v11);
      v16 = *(void **)(v14 + 16);
      *(void *)(v14 + 16) = v15;

      *(_DWORD *)(v14 + 24) = 0;
      *(_DWORD *)(v14 + 28) = 0;
      if (v12) {
        v12[2](v12, *(void *)(v14 + 16));
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  unsigned int v3 = 1;
  atomic_compare_exchange_strong_explicit(&self->_invalidated, &v3, v3, memory_order_relaxed, memory_order_relaxed);
  if (v3 != 1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"BSDispatchSource.m", 39, @"Invalid parameter not satisfying: %@", @"BSAtomicGetFlag(&_invalidated)" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)BSDispatchSource;
  [(BSDispatchSource *)&v6 dealloc];
}

- (void)invalidate
{
  int v2 = 0;
  atomic_compare_exchange_strong_explicit(&self->_invalidated, (unsigned int *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v2)
  {
    source = self->_source;
    if (source)
    {
      dispatch_activate(source);
      dispatch_source_cancel((dispatch_source_t)self->_source);
      v5 = self->_source;
      self->_source = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
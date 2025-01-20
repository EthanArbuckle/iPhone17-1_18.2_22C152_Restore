@interface _BSDefaultObserver
- (id)initWithAbstractDefaultDomain:(void *)a3 defaultsToObserve:(void *)a4 onQueue:(void *)a5 withBlock:;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _BSDefaultObserver

- (id)initWithAbstractDefaultDomain:(void *)a3 defaultsToObserve:(void *)a4 onQueue:(void *)a5 withBlock:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v30 = a3;
  id v11 = a4;
  id v12 = a5;
  v29 = v10;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_16;
  }
  if (v10)
  {
    if (v11) {
      goto LABEL_4;
    }
LABEL_18:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, @"_BSDefaultObserver.m", 34, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
LABEL_19:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, @"_BSDefaultObserver.m", 35, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_5;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_, a1, @"_BSDefaultObserver.m", 33, @"Invalid parameter not satisfying: %@", @"defaultDomain" object file lineNumber description];

  if (!v11) {
    goto LABEL_18;
  }
LABEL_4:
  if (!v12) {
    goto LABEL_19;
  }
LABEL_5:
  if (![v30 count])
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel_initWithAbstractDefaultDomain_defaultsToObserve_onQueue_withBlock_ object:a1 file:@"_BSDefaultObserver.m" lineNumber:36 description:@"Must have at least one default to observe."];
  }
  v35.receiver = a1;
  v35.super_class = (Class)_BSDefaultObserver;
  v13 = (id *)objc_msgSendSuper2(&v35, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = v13 + 1;
    objc_storeStrong(v13 + 1, a2);
    objc_storeStrong(v14 + 2, a4);
    uint64_t v16 = [v12 copy];
    id v17 = v14[4];
    v14[4] = (id)v16;

    objc_storeStrong(v14 + 3, a3);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v14[3];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = -[BSAbstractDefaultDomain _defaultKeyFromPropertyName:](*v15, *(void **)(*((void *)&v31 + 1) + 8 * v21));
          v23 = [*v15 _store];
          [v23 addObserver:v14 forKeyPath:v22 options:1 context:0];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v19);
    }

    -[BSAbstractDefaultDomain _addObserver:]((uint64_t)v14[1], v14);
  }
LABEL_16:

  return v14;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_BSDefaultObserver.m" lineNumber:56 description:@"We must be explicitly invalidated in order to be deallocated."];
  }
  v5.receiver = self;
  v5.super_class = (Class)_BSDefaultObserver;
  [(_BSDefaultObserver *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = self->_defaultsToObserve;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = -[BSAbstractDefaultDomain _defaultKeyFromPropertyName:](self->_defaults, *(void **)(*((void *)&v9 + 1) + 8 * v6));
          v8 = [(BSAbstractDefaultDomain *)self->_defaults _store];
          [v8 removeObserver:self forKeyPath:v7];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }

    -[BSAbstractDefaultDomain _removeObserver:]((uint64_t)self->_defaults, self);
    self->_invalidated = 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unsigned int v7 = atomic_fetch_add_explicit((atomic_uint *volatile)&self->_debounceCounter, 1u, memory_order_relaxed) + 1;
  dispatch_time_t v8 = dispatch_time(0, 100000000);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69___BSDefaultObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v10[3] = &unk_1E5446358;
  unsigned int v11 = v7;
  v10[4] = self;
  dispatch_after(v8, queue, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_defaultsToObserve, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
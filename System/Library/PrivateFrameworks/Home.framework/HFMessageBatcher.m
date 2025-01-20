@interface HFMessageBatcher
- (HFMessageBatcher)initWithIdentifier:(id)a3 batchingInterval:(double)a4 block:(id)a5;
- (NACancelable)cancelable;
- (NSMutableSet)mutableObjects;
- (NSSet)objects;
- (NSString)identifier;
- (double)batchingInterval;
- (id)block;
- (void)batchObject:(id)a3;
- (void)reset;
- (void)setBlock:(id)a3;
- (void)setCancelable:(id)a3;
- (void)setMutableObjects:(id)a3;
@end

@implementation HFMessageBatcher

- (HFMessageBatcher)initWithIdentifier:(id)a3 batchingInterval:(double)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFMessageBatcher;
  v11 = [(HFMessageBatcher *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_batchingInterval = a4;
    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    mutableObjects = v12->_mutableObjects;
    v12->_mutableObjects = (NSMutableSet *)v13;

    v15 = _Block_copy(v10);
    id block = v12->_block;
    v12->_id block = v15;

    v17 = HFLogForCategory(0x32uLL);
    v12->signpostID = os_signpost_id_generate(v17);
  }
  return v12;
}

- (NSSet)objects
{
  v2 = [(HFMessageBatcher *)self mutableObjects];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (void)reset
{
  v3 = [(HFMessageBatcher *)self cancelable];
  [v3 cancel];

  [(HFMessageBatcher *)self setCancelable:0];
  id v4 = [(HFMessageBatcher *)self mutableObjects];
  [v4 removeAllObjects];
}

- (void)batchObject:(id)a3
{
  id v4 = a3;
  v5 = [(HFMessageBatcher *)self mutableObjects];
  [v5 addObject:v4];

  v6 = [(HFMessageBatcher *)self cancelable];

  if (v6)
  {
    v7 = [(HFMessageBatcher *)self cancelable];
    [v7 cancel];
  }
  objc_initWeak(&location, self);
  v8 = [MEMORY[0x263F581B8] mainThreadScheduler];
  [(HFMessageBatcher *)self batchingInterval];
  double v10 = v9;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __32__HFMessageBatcher_batchObject___block_invoke;
  v15 = &unk_26408E550;
  objc_copyWeak(&v16, &location);
  v11 = [v8 afterDelay:&v12 performBlock:v10];
  -[HFMessageBatcher setCancelable:](self, "setCancelable:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __32__HFMessageBatcher_batchObject___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained objects];
    [v2 setCancelable:0];
    id v4 = [v2 mutableObjects];
    [v4 removeAllObjects];

    if ([v3 count])
    {
      v5 = HFLogForCategory(0x32uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = objc_opt_class();
        v7 = [v2 identifier];
        int v15 = 138543874;
        uint64_t v16 = v6;
        __int16 v17 = 2114;
        v18 = v7;
        __int16 v19 = 2048;
        uint64_t v20 = [v3 count];
        _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}@: executing batch with %lu", (uint8_t *)&v15, 0x20u);
      }
      v8 = HFLogForCategory(0x32uLL);
      double v9 = v8;
      os_signpost_id_t v10 = v2[1];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = [v2 identifier];
        uint64_t v13 = [v3 count];
        int v15 = 138543874;
        uint64_t v16 = v11;
        __int16 v17 = 2114;
        v18 = v12;
        __int16 v19 = 2048;
        uint64_t v20 = v13;
        _os_signpost_emit_with_name_impl(&dword_20B986000, v9, OS_SIGNPOST_EVENT, v10, "HFMessageBatcher", "%{public}@-%{public}@: executing batch with %lu", (uint8_t *)&v15, 0x20u);
      }
      v14 = [v2 block];
      ((void (**)(void, void *))v14)[2](v14, v3);
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)batchingInterval
{
  return self->_batchingInterval;
}

- (NACancelable)cancelable
{
  return self->_cancelable;
}

- (void)setCancelable:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSMutableSet)mutableObjects
{
  return self->_mutableObjects;
}

- (void)setMutableObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableObjects, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
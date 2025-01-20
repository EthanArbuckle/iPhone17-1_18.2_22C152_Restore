@interface AVProxyKVOObserver
- (AVProxyKVOObserver)initWithObservedObject:(id)a3 observer:(id)a4 keyPaths:(id)a5 retainingObservedObject:(BOOL)a6 includeInitialValue:(BOOL)a7 includeChanges:(BOOL)a8 changesBlock:(id)a9;
- (BOOL)includeChanges;
- (BOOL)includeInitialValue;
- (NSSet)keyPaths;
- (NSString)token;
- (id)changesBlock;
- (void)_handleValueChangeForKeyPath:(id)a3 ofObject:(id)a4 oldValue:(id)a5 newValue:(id)a6 context:(void *)a7;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startObserving:(id)a3 completion:(id)a4;
- (void)stopObserving;
@end

@implementation AVProxyKVOObserver

- (void)startObserving:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if ([(AVProxyKVOObserver *)self includeChanges]) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 0;
    }
    kdebug_trace();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = [(AVProxyKVOObserver *)self keyPaths];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          [v6 addObserver:self forKeyPath:*(void *)(*((void *)&v18 + 1) + 8 * v13++) options:v8 context:AVObservationControllerObservationContext];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v11);
    }

    kdebug_trace();
    self->_canHandleChanges = 1;
    if ([(AVProxyKVOObserver *)self includeInitialValue])
    {
      kdebug_trace();
      v14 = [(AVProxyKVOObserver *)self keyPaths];
      v15 = [v14 anyObject];

      v16 = [v6 valueForKeyPath:v15];
      [(AVProxyKVOObserver *)self _handleValueChangeForKeyPath:v15 ofObject:v6 oldValue:0 newValue:v16 context:AVObservationControllerObservationContext];

      kdebug_trace();
    }
    v7[2](v7);
  }
  else
  {
    v17 = (void *)[v7 copy];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AVProxyKVOObserver_startObserving_completion___block_invoke;
    block[3] = &unk_1E5FC4670;
    block[4] = self;
    id v23 = v6;
    v7 = v17;
    id v24 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (AVProxyKVOObserver)initWithObservedObject:(id)a3 observer:(id)a4 keyPaths:(id)a5 retainingObservedObject:(BOOL)a6 includeInitialValue:(BOOL)a7 includeChanges:(BOOL)a8 changesBlock:(id)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a5;
  id v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)AVProxyKVOObserver;
  long long v18 = [(AVProxyKVOObserver *)&v28 init];
  long long v19 = v18;
  if (v18)
  {
    if (v11) {
      objc_storeStrong(&v18->_retainedObservedObject, a3);
    }
    v19->_unsafeUnretainedObservedObject = v15;
    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
    keyPaths = v19->_keyPaths;
    v19->_keyPaths = (NSSet *)v20;

    v19->_includeInitialValue = a7;
    v19->_includeChanges = a8;
    v22 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v23 = [v22 globallyUniqueString];
    token = v19->_token;
    v19->_token = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    id changesBlock = v19->_changesBlock;
    v19->_id changesBlock = (id)v25;
  }
  return v19;
}

- (BOOL)includeInitialValue
{
  return self->_includeInitialValue;
}

- (BOOL)includeChanges
{
  return self->_includeChanges;
}

- (void)_handleValueChangeForKeyPath:(id)a3 ofObject:(id)a4 oldValue:(id)a5 newValue:(id)a6 context:(void *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v16 = [(AVProxyKVOObserver *)self changesBlock];
  id v15 = [(AVProxyKVOObserver *)self token];
  v16[2](v16, v13, v14, v11, v12, v15);
}

- (NSString)token
{
  return self->_token;
}

- (id)changesBlock
{
  return self->_changesBlock;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  kdebug_trace();
  id v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
  id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

  [(AVProxyKVOObserver *)self _handleValueChangeForKeyPath:v12 ofObject:v11 oldValue:v14 newValue:v13 context:a6];
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changesBlock, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong(&self->_retainedObservedObject, 0);
}

- (void)stopObserving
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(AVProxyKVOObserver *)self keyPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [self->_unsafeUnretainedObservedObject removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:AVObservationControllerObservationContext];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id retainedObservedObject = self->_retainedObservedObject;
  self->_id retainedObservedObject = 0;

  self->_unsafeUnid retainedObservedObject = 0;
}

uint64_t __48__AVProxyKVOObserver_startObserving_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObserving:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

@end
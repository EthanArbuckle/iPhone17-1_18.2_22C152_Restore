@interface LCSExtensionMonitor
- (BOOL)isCaptureExtension:(id)a3;
- (LCSExtensionMonitor)initWithExtensionPointIdentifier:(id)a3;
- (NSArray)knownCaptureExtensions;
- (NSString)extensionPointIdentifier;
- (void)_queue_notifyUpdatedExtensions:(id)a3;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
- (void)removeObserver:(id)a3;
- (void)start;
@end

@implementation LCSExtensionMonitor

- (LCSExtensionMonitor)initWithExtensionPointIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCSExtensionMonitor;
  v6 = [(LCSExtensionMonitor *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionPointIdentifier, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    queue_observers = v7->_queue_observers;
    v7->_queue_observers = (NSHashTable *)v10;
  }
  return v7;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__LCSExtensionMonitor_invalidate__block_invoke;
  block[3] = &unk_2653BEA40;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __33__LCSExtensionMonitor_invalidate__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(*(void *)(a1 + 32) + 24) enumerateObjectsUsingBlock:&__block_literal_global_1];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:0];
  [*(id *)(*(void *)(a1 + 32) + 16) suspend];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

uint64_t __33__LCSExtensionMonitor_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__LCSExtensionMonitor_start__block_invoke;
  block[3] = &unk_2653BEA40;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __28__LCSExtensionMonitor_start__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:*(void *)(*(void *)(a1 + 32) + 48)];
    v8[0] = v2;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

    uint64_t v4 = [objc_alloc(MEMORY[0x263F04DF0]) initWithQueries:v3 delegate:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 16) resume];
    v7 = [MEMORY[0x263F04DF0] executeQueries:v3];
    objc_msgSend(*(id *)(a1 + 32), "_queue_notifyUpdatedExtensions:", v7);
  }
}

- (void)_queue_notifyUpdatedExtensions:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = LCSLogExtension();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v50 = [v4 count];
    __int16 v51 = 2112;
    id v52 = v4;
    _os_log_impl(&dword_255087000, v5, OS_LOG_TYPE_DEFAULT, "Extensions updated; Received %lu extensions: %@",
      buf,
      0x16u);
  }

  v6 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v7 = self->_lock_knownCaptureExtensions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_super v13 = [v12 identity];
        [v6 setObject:v12 forKey:v13];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v9);
  }

  if (self->_lock_knownCaptureExtensions) {
    lock_knownCaptureExtensions = self->_lock_knownCaptureExtensions;
  }
  else {
    lock_knownCaptureExtensions = (NSArray *)MEMORY[0x263EFFA68];
  }
  v33 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", lock_knownCaptureExtensions, self);
  v15 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * v19);
        v21 = LCSLogExtension();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v20;
          _os_log_impl(&dword_255087000, v21, OS_LOG_TYPE_DEFAULT, "Examining extension identity %@", buf, 0xCu);
        }

        uint64_t v22 = [v6 objectForKey:v20];
        if (v22)
        {
          v23 = v22;
          v24 = LCSLogExtension();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = v20;
            _os_log_impl(&dword_255087000, v24, OS_LOG_TYPE_DEFAULT, "Extension identity %@ already tracked", buf, 0xCu);
          }

LABEL_25:
          [v15 addObject:v23];
          goto LABEL_26;
        }
        v23 = +[LCSExtension extensionWithIdentity:v20];
        if (v23) {
          goto LABEL_25;
        }
        v23 = LCSLogExtension();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v20;
          _os_log_error_impl(&dword_255087000, v23, OS_LOG_TYPE_ERROR, "Failed to add new extension wrapper: %@; PRPosterExtension unable to create extension",
            buf,
            0xCu);
        }
LABEL_26:

        ++v19;
      }
      while (v17 != v19);
      uint64_t v25 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      uint64_t v17 = v25;
    }
    while (v25);
  }

  id v26 = (id)[v15 copy];
  if ([v33 isEqual:v26])
  {
    os_unfair_lock_unlock(lock);
    v27 = LCSLogExtension();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_255087000, v27, OS_LOG_TYPE_DEFAULT, "Not notifying delegate of updated extensions, no changes detected.", buf, 2u);
    }
  }
  else
  {
    uint64_t v28 = objc_msgSend(v26, "bs_array");
    v29 = *(void **)(v31 + 24);
    *(void *)(v31 + 24) = v28;

    os_unfair_lock_unlock(lock);
    v30 = *(NSObject **)(v31 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__LCSExtensionMonitor__queue_notifyUpdatedExtensions___block_invoke;
    block[3] = &unk_2653BEC00;
    block[4] = v31;
    id v36 = v26;
    id v37 = v33;
    id v38 = v36;
    dispatch_async(v30, block);
  }
}

void __54__LCSExtensionMonitor__queue_notifyUpdatedExtensions___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 32), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 captureExtensionProvider:a1[4] didUpdateKnownExtensions:a1[5]];
        }
        if (objc_opt_respondsToSelector()) {
          [v7 captureExtensionProvider:a1[4] updatedKnownExtensionsFrom:a1[6] to:a1[7]];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSArray)knownCaptureExtensions
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSArray *)self->_lock_knownCaptureExtensions copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)isCaptureExtension:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)[(NSArray *)self->_lock_knownCaptureExtensions copy];
  os_unfair_lock_unlock(&self->_lock);
  if (!v5) {
    goto LABEL_4;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__LCSExtensionMonitor_isCaptureExtension___block_invoke;
  v14[3] = &unk_2653BEC28;
  id v15 = v4;
  uint64_t v6 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v14);

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
LABEL_4:
    long long v8 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:self->_extensionPointIdentifier];
    long long v9 = [MEMORY[0x263F04DF0] executeQuery:v8];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__LCSExtensionMonitor_isCaptureExtension___block_invoke_2;
    v12[3] = &unk_2653BEA68;
    id v13 = v4;
    long long v10 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v12);
    BOOL v7 = v10 != 0;
  }
  return v7;
}

uint64_t __42__LCSExtensionMonitor_isCaptureExtension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __42__LCSExtensionMonitor_isCaptureExtension___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __65__LCSExtensionMonitor_queryControllerDidUpdate_resultDifference___block_invoke;
  v8[3] = &unk_2653BE9F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __65__LCSExtensionMonitor_queryControllerDidUpdate_resultDifference___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) extensionIdentities];
  objc_msgSend(v1, "_queue_notifyUpdatedExtensions:", v2);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__LCSExtensionMonitor_addObserver___block_invoke;
    v7[3] = &unk_2653BE9F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __35__LCSExtensionMonitor_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__LCSExtensionMonitor_removeObserver___block_invoke;
    v7[3] = &unk_2653BE9F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __38__LCSExtensionMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_lock_knownCaptureExtensions, 0);
  objc_storeStrong((id *)&self->_queue_queryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
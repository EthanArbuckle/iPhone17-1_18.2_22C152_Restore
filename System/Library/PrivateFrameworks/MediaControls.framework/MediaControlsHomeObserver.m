@interface MediaControlsHomeObserver
- (BOOL)hasAccessoryWithUID:(id)a3;
- (MediaControlsHomeObserver)init;
- (MediaControlsHomeObserverDelegate)delegate;
- (void)_notifyDelegate;
- (void)_updateUIDs;
- (void)beginObserving;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopObserving;
@end

@implementation MediaControlsHomeObserver

- (MediaControlsHomeObserver)init
{
  v20.receiver = self;
  v20.super_class = (Class)MediaControlsHomeObserver;
  v2 = [(MediaControlsHomeObserver *)&v20 init];
  v3 = v2;
  if (v2)
  {
    id v4 = [(MediaControlsHomeObserver *)v2 description];
    v5 = (const char *)[v4 UTF8String];

    dispatch_queue_t v6 = dispatch_queue_create(v5, 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = dispatch_get_global_queue(0, 0);
    notifyQueue = v3->_notifyQueue;
    v3->_notifyQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    knownUIDs = v3->_knownUIDs;
    v3->_knownUIDs = v10;

    v12 = [MEMORY[0x1E4F2E978] defaultPrivateConfiguration];
    [v12 setOptions:1344];
    [v12 setDiscretionary:1];
    id v13 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v13 setUnderlyingQueue:v3->_serialQueue];
    [v13 setQualityOfService:-1];
    [v12 setDelegateQueue:v13];
    [v12 setAdaptive:1];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F2E820]) initWithHomeMangerConfiguration:v12];
    homeManager = v3->_homeManager;
    v3->_homeManager = (HMHomeManager *)v14;

    v16 = v3->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__MediaControlsHomeObserver_init__block_invoke;
    block[3] = &unk_1E5F0D7F8;
    v19 = v3;
    dispatch_async(v16, block);
  }
  return v3;
}

uint64_t __33__MediaControlsHomeObserver_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUIDs];
}

- (void)beginObserving
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HMHomeManager *)self->_homeManager setDelegate:self];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(HMHomeManager *)self->_homeManager homes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setDelegate:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)stopObserving
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(HMHomeManager *)self->_homeManager setDelegate:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(HMHomeManager *)self->_homeManager homes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)hasAccessoryWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MediaControlsHomeObserver_hasAccessoryWithUID___block_invoke;
  block[3] = &unk_1E5F0E148;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

uint64_t __49__MediaControlsHomeObserver_hasAccessoryWithUID___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)_updateUIDs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(HMHomeManager *)self->_homeManager homes];
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * v6);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v8 = [v7 accessories];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) mediaProfile];
              char v14 = [v13 routeUID];

              if ([v14 length]) {
                [(NSMutableSet *)self->_knownUIDs addObject:v14];
              }

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  [(MediaControlsHomeObserver *)self _notifyDelegate];
}

- (void)_notifyDelegate
{
  uint64_t v3 = [(MediaControlsHomeObserver *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    notifyQueue = self->_notifyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MediaControlsHomeObserver__notifyDelegate__block_invoke;
    block[3] = &unk_1E5F0D7F8;
    void block[4] = self;
    dispatch_async(notifyQueue, block);
  }
}

void __44__MediaControlsHomeObserver__notifyDelegate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 homeObserverDidUpdateKnownUIDs:*(void *)(a1 + 32)];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v4 = objc_msgSend(a3, "homes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setDelegate:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(MediaControlsHomeObserver *)self _updateUIDs];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [v5 setDelegate:self];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(v5, "accessories", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) mediaProfile];
        long long v12 = [v11 routeUID];

        if ([v12 length])
        {
          [(NSMutableSet *)self->_knownUIDs addObject:v12];
          [(MediaControlsHomeObserver *)self _notifyDelegate];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(a4, "accessories", a3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) mediaProfile];
        long long v11 = [v10 routeUID];

        if ([v11 length])
        {
          [(NSMutableSet *)self->_knownUIDs removeObject:v11];
          [(MediaControlsHomeObserver *)self _notifyDelegate];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = objc_msgSend(a4, "mediaProfile", a3);
  id v6 = [v5 routeUID];

  if ([v6 length])
  {
    [(NSMutableSet *)self->_knownUIDs addObject:v6];
    [(MediaControlsHomeObserver *)self _notifyDelegate];
  }
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5 = objc_msgSend(a4, "mediaProfile", a3);
  id v6 = [v5 routeUID];

  if ([v6 length])
  {
    [(NSMutableSet *)self->_knownUIDs removeObject:v6];
    [(MediaControlsHomeObserver *)self _notifyDelegate];
  }
}

- (MediaControlsHomeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaControlsHomeObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_knownUIDs, 0);

  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
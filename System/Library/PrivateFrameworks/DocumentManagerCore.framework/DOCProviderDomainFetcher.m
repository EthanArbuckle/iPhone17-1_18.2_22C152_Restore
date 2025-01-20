@interface DOCProviderDomainFetcher
- (BOOL)fetchProviders:(id)a3;
- (BOOL)fetchProviders:(id)a3 queue:(id)a4;
- (DOCProviderDomainFetcher)init;
- (FINode)providerDomainsNode;
- (FINodeObserver)observer;
- (NSMapTable)pendingQueuesAndCallbacks;
- (id)providersFromIterator:(id)a3;
- (void)dealloc;
- (void)openSyncCompleted:(id)a3;
- (void)setObserver:(id)a3;
- (void)setPendingQueuesAndCallbacks:(id)a3;
- (void)setProviderDomainsNode:(id)a3;
@end

@implementation DOCProviderDomainFetcher

- (DOCProviderDomainFetcher)init
{
  v8.receiver = self;
  v8.super_class = (Class)DOCProviderDomainFetcher;
  v2 = [(DOCProviderDomainFetcher *)&v8 init];
  if (v2)
  {
    StartFINode();
    uint64_t v3 = [MEMORY[0x263F397B0] providerDomainsContainer];
    providerDomainsNode = v2->_providerDomainsNode;
    v2->_providerDomainsNode = (FINode *)v3;

    uint64_t v5 = [MEMORY[0x263F397B8] observerForFINode:v2->_providerDomainsNode withObserver:v2];
    observer = v2->_observer;
    v2->_observer = (FINodeObserver *)v5;

    [(FINodeObserver *)v2->_observer startObserving:3];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(DOCProviderDomainFetcher *)self observer];
  [v3 stopObserving:3];

  v4.receiver = self;
  v4.super_class = (Class)DOCProviderDomainFetcher;
  [(DOCProviderDomainFetcher *)&v4 dealloc];
}

- (BOOL)fetchProviders:(id)a3
{
  return [(DOCProviderDomainFetcher *)self fetchProviders:a3 queue:0];
}

- (BOOL)fetchProviders:(id)a3 queue:(id)a4
{
  v6 = (void (**)(id, DOCProviderDomainFetcher *))a3;
  id v7 = a4;
  objc_super v8 = [(DOCProviderDomainFetcher *)self providerDomainsNode];
  v9 = [v8 iteratorWithOptions:0];

  int v10 = [v9 fullyPopulated];
  if (v10)
  {
    v11 = [(DOCProviderDomainFetcher *)self providersFromIterator:v9];
    v6[2](v6, v11);
  }
  else
  {
    if (!v7)
    {
      dispatch_get_global_queue(21, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = self;
    objc_sync_enter(v11);
    v12 = [(DOCProviderDomainFetcher *)v11 pendingQueuesAndCallbacks];
    v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      v13 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    }
    v14 = [v13 objectForKey:v7];
    v15 = (void *)[v14 mutableCopy];

    if (!v15)
    {
      v15 = [MEMORY[0x263EFF980] array];
    }
    v16 = (void *)MEMORY[0x21668ED30](v6);
    [v15 addObject:v16];

    [v13 setObject:v15 forKey:v7];
    [(DOCProviderDomainFetcher *)v11 setPendingQueuesAndCallbacks:v13];

    objc_sync_exit(v11);
  }

  return v10;
}

- (id)providersFromIterator:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = [v3 first];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      id v7 = [v6 fpDomain];
      if (v7) {
        [v4 addObject:v7];
      }

      uint64_t v8 = [v3 next];

      v6 = (void *)v8;
    }
    while (v8);
  }

  return v4;
}

- (void)openSyncCompleted:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v17 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(DOCProviderDomainFetcher *)v4 pendingQueuesAndCallbacks];
  [(DOCProviderDomainFetcher *)v4 setPendingQueuesAndCallbacks:0];
  objc_sync_exit(v4);

  if ([v5 count])
  {
    v15 = v5;
    v6 = [(DOCProviderDomainFetcher *)v4 providerDomainsNode];
    v16 = [v6 iteratorWithOptions:0];

    id v7 = [(DOCProviderDomainFetcher *)v4 providersFromIterator:v16];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v15;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(id *)(*((void *)&v21 + 1) + 8 * v11);
          v13 = [v8 objectForKey:v12];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __46__DOCProviderDomainFetcher_openSyncCompleted___block_invoke;
          block[3] = &unk_2641B5600;
          id v19 = v13;
          id v20 = v7;
          id v14 = v13;
          dispatch_async(v12, block);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v5 = v15;
  }
}

void __46__DOCProviderDomainFetcher_openSyncCompleted___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (FINode)providerDomainsNode
{
  return (FINode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProviderDomainsNode:(id)a3
{
}

- (FINodeObserver)observer
{
  return (FINodeObserver *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObserver:(id)a3
{
}

- (NSMapTable)pendingQueuesAndCallbacks
{
  return (NSMapTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingQueuesAndCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingQueuesAndCallbacks, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_providerDomainsNode, 0);
}

@end
@interface ASKNetworkQualityInquiry
- (ASKNetworkQualityInquiry)init;
- (BOOL)areKnownNetworksReady;
- (NSMutableArray)knownNetworksReadyHandlers;
- (NSMutableSet)knownNetworks;
- (NWNetworkOfInterestManager)manager;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)drainKnownNetworksReadyHandlers;
- (void)investigateNetworksWithCompletionBlock:(id)a3;
- (void)performWhenKnownNetworksReady:(id)a3;
- (void)setKnownNetworksReadyHandlers:(id)a3;
@end

@implementation ASKNetworkQualityInquiry

- (ASKNetworkQualityInquiry)init
{
  v11.receiver = self;
  v11.super_class = (Class)ASKNetworkQualityInquiry;
  v2 = [(ASKNetworkQualityInquiry *)&v11 init];
  if (v2)
  {
    v3 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x1E4FA91C0]);
    manager = v2->_manager;
    v2->_manager = v3;

    if (!v2->_manager)
    {
      v9 = 0;
      goto LABEL_6;
    }
    dispatch_queue_t v5 = dispatch_queue_create("AppStoreKitInternal.NetworkQualityInquiry.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(NWNetworkOfInterestManager *)v2->_manager setQueue:v2->_queue];
    [(NWNetworkOfInterestManager *)v2->_manager setDelegate:v2];
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    knownNetworks = v2->_knownNetworks;
    v2->_knownNetworks = v7;

    [(NWNetworkOfInterestManager *)v2->_manager trackNOIAnyForInterfaceType:2 options:0];
    [(NWNetworkOfInterestManager *)v2->_manager trackNOIAnyForInterfaceType:1 options:0];
    [(NWNetworkOfInterestManager *)v2->_manager trackNOIAnyForInterfaceType:3 options:0];
  }
  v9 = v2;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  [(NWNetworkOfInterestManager *)self->_manager setDelegate:0];
  [(NWNetworkOfInterestManager *)self->_manager destroy];
  v3.receiver = self;
  v3.super_class = (Class)ASKNetworkQualityInquiry;
  [(ASKNetworkQualityInquiry *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (BOOL)areKnownNetworksReady
{
  objc_super v3 = [(ASKNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(ASKNetworkQualityInquiry *)self knownNetworks];
  LOBYTE(v3) = [v4 count] == 3;

  return (char)v3;
}

- (void)performWhenKnownNetworksReady:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(ASKNetworkQualityInquiry *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ASKNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke;
  v7[3] = &unk_1E6DA8D48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__ASKNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) areKnownNetworksReady])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    objc_super v3 = [*(id *)(a1 + 32) knownNetworksReadyHandlers];

    if (!v3)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [*(id *)(a1 + 32) setKnownNetworksReadyHandlers:v4];
    }
    id v7 = [*(id *)(a1 + 32) knownNetworksReadyHandlers];
    dispatch_queue_t v5 = (void *)[*(id *)(a1 + 40) copy];
    id v6 = _Block_copy(v5);
    [v7 addObject:v6];
  }
}

- (void)drainKnownNetworksReadyHandlers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(ASKNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(ASKNetworkQualityInquiry *)self knownNetworksReadyHandlers];
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(ASKNetworkQualityInquiry *)self setKnownNetworksReadyHandlers:0];
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASKNetworkQualityInquiry *)self knownNetworks];
  [v5 addObject:v4];

  if ([(ASKNetworkQualityInquiry *)self areKnownNetworksReady])
  {
    [(ASKNetworkQualityInquiry *)self drainKnownNetworksReadyHandlers];
  }
}

- (void)didStopTrackingNOI:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ASKNetworkQualityInquiry *)self knownNetworks];
  [v5 removeObject:v4];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F4DCE8] sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    long long v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1E157D000, v7, OS_LOG_TYPE_DEBUG, "%@: Stopped tracking %@, searching for interface again", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = [(ASKNetworkQualityInquiry *)self manager];
  objc_msgSend(v8, "trackNOIAnyForInterfaceType:options:", objc_msgSend(v4, "interface"), 0);
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(ASKNetworkQualityInquiry *)self didStopTrackingNOI:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)investigateNetworksWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E6DA8E00;
  id v7 = v4;
  id v5 = v4;
  [(ASKNetworkQualityInquiry *)self performWhenKnownNetworksReady:v6];
}

void __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v4 = [v3 knownNetworks];
  uint64_t v5 = [v4 count];

  uint64_t v25 = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v7 = (void *)[v6 initWithCapacity:v23[3]];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v3 knownNetworks];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = [v3 manager];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_2;
        v14[3] = &unk_1E6DA8DD8;
        v14[4] = v12;
        id v15 = v7;
        v17 = &v22;
        id v16 = *(id *)(a1 + 32);
        [v13 auditableLinkQualityForNOI:v12 reply:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);
}

void __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = v5;
  if (v8 && (uint64_t v9 = [v7 interface], (unint64_t)(v9 - 1) <= 2))
  {
    uint64_t v10 = off_1E6DA8E48[v9 - 1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __ASKNetworkQualityInquiryReportMake_block_invoke;
    v23 = &unk_1E6DA8E28;
    id v12 = v11;
    id v24 = v12;
    [v8 enumerateKeysAndObjectsUsingBlock:buf];
    if ([v12 count])
    {
      [v12 setObject:v10 forKeyedSubscript:@"interface"];
      uint64_t v13 = (void *)[v12 copy];
    }
    else
    {
      uint64_t v13 = 0;
    }

    if (v13)
    {
      [*(id *)(a1 + 40) addObject:v13];
    }
  }
  else
  {
  }
  if (v6)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x1E4F4DCE8] sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1E157D000, v15, OS_LOG_TYPE_ERROR, "Could not determine link quality for %@, reason: %@", buf, 0x16u);
    }
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v18 = *(void *)(v17 + 24) - 1;
  *(void *)(v17 + 24) = v18;
  if (!v18)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_44;
    v19[3] = &unk_1E6DA8B20;
    id v21 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
}

uint64_t __67__ASKNetworkQualityInquiry_investigateNetworksWithCompletionBlock___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (NSMutableArray)knownNetworksReadyHandlers
{
  return self->_knownNetworksReadyHandlers;
}

- (void)setKnownNetworksReadyHandlers:(id)a3
{
}

@end
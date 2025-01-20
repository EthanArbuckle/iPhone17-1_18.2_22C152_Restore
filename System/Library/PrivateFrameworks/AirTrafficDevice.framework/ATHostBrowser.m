@interface ATHostBrowser
- (ATHostBrowser)init;
- (void)_finishSearchIfComplete;
- (void)_handleTimeout;
- (void)browseForHostsWithTimeout:(unint64_t)a3 completion:(id)a4;
- (void)cancel;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowserDidStopSearch:(id)a3;
- (void)netServiceDidResolveAddress:(id)a3;
@end

@implementation ATHostBrowser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hostsBeingResolved, 0);

  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
}

- (void)_handleTimeout
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%@ timeout expired - ending search", (uint8_t *)&v4, 0xCu);
  }

  if (self->_searchInProgress) {
    [(NSNetServiceBrowser *)self->_netServiceBrowser stop];
  }
}

- (void)_finishSearchIfComplete
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_searchInProgress && ![(NSMutableSet *)self->_hostsBeingResolved count])
  {
    v3 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "%@ host browse completed", (uint8_t *)&v8, 0xCu);
    }

    netServiceBrowser = self->_netServiceBrowser;
    v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(NSNetServiceBrowser *)netServiceBrowser removeFromRunLoop:v5 forMode:*MEMORY[0x1E4F1C3A0]];

    [(NSNetServiceBrowser *)self->_netServiceBrowser setDelegate:0];
    uint64_t v6 = self->_netServiceBrowser;
    self->_netServiceBrowser = 0;

    dispatch_source_cancel((dispatch_source_t)self->_timer);
    completionBlock = (void (**)(id, void, uint64_t))self->_completionBlock;
    if (completionBlock) {
      completionBlock[2](completionBlock, 0, 1);
    }
  }
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__ATHostBrowser_netService_didNotResolve___block_invoke;
  v8[3] = &unk_1E6B88B68;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __42__ATHostBrowser_netService_didNotResolve___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _finishSearchIfComplete];
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ATHostBrowser_netServiceDidResolveAddress___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__ATHostBrowser_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[5];
    if (v4)
    {
      id v5 = [[ATHostNetService alloc] initWithNetService:*(void *)(a1 + 40)];
      (*(void (**)(uint64_t, ATHostNetService *, void))(v4 + 16))(v4, v5, 0);

      v3 = *(void **)(a1 + 32);
    }
    return [v3 _finishSearchIfComplete];
  }
  return result;
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ATHostBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke;
  block[3] = &unk_1E6B88688;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

uint64_t __63__ATHostBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 48))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v3 stop];
  }
  return result;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ATHostBrowser_netServiceBrowser_didFindService_moreComing___block_invoke;
  block[3] = &unk_1E6B88688;
  block[4] = self;
  id v11 = v7;
  BOOL v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

uint64_t __61__ATHostBrowser_netServiceBrowser_didFindService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v12 = 138412802;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 1024;
    int v17 = v5;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%@ found host %@. moreComing=%d", (uint8_t *)&v12, 0x1Cu);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 32)];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = *(double *)(*(void *)(a1 + 32) + 64);
  double v8 = v7 - v6;
  BOOL v9 = v6 <= v7;
  double v10 = 1.0;
  if (!v9) {
    double v10 = v8;
  }
  uint64_t result = [*(id *)(a1 + 40) resolveWithTimeout:v10];
  if (!*(unsigned char *)(a1 + 48)) {
    return [*(id *)(*(void *)(a1 + 32) + 8) stop];
  }
  return result;
}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ATHostBrowser_netServiceBrowserDidStopSearch___block_invoke;
  block[3] = &unk_1E6B88B40;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__ATHostBrowser_netServiceBrowserDidStopSearch___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%@ search stopped", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return [*(id *)(a1 + 32) _finishSearchIfComplete];
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ATHostBrowser_netServiceBrowser_didNotSearch___block_invoke;
  v8[3] = &unk_1E6B88B68;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __48__ATHostBrowser_netServiceBrowser_didNotSearch___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%@ host browser failed search with error: %@", (uint8_t *)&v6, 0x16u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return [*(id *)(a1 + 32) _finishSearchIfComplete];
}

- (void)cancel
{
}

- (void)browseForHostsWithTimeout:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke;
  block[3] = &unk_1E6B88660;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v3;
    __int16 v26 = 2048;
    uint64_t v27 = v4;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "%@ browsing for hosts. timeout=%lus", buf, 0x16u);
  }

  uint64_t v5 = MEMORY[0x1E016B9C0](a1[5]);
  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1[4] + 24) removeAllObjects];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(a1[4] + 56) = v8;
  *(double *)(a1[4] + 64) = *(double *)(a1[4] + 56) + (double)(unint64_t)a1[6];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E98]);
  uint64_t v10 = a1[4];
  unint64_t v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v9;

  int v12 = *(void **)(a1[4] + 8);
  uint64_t v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v12 scheduleInRunLoop:v13 forMode:*MEMORY[0x1E4F1C3A0]];

  objc_msgSend(*(id *)(a1[4] + 8), "setDelegate:");
  __int16 v14 = *(void **)(a1[4] + 8);
  uint64_t v15 = [NSString stringWithCString:"_atc._tcp" encoding:1];
  [v14 searchForServicesOfType:v15 inDomain:&stru_1F33D2380];

  *(unsigned char *)(a1[4] + 16) = 1;
  dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1[4] + 32));
  uint64_t v17 = a1[4];
  uint64_t v18 = *(void **)(v17 + 48);
  *(void *)(v17 + 48) = v16;

  v19 = *(NSObject **)(a1[4] + 48);
  dispatch_time_t v20 = dispatch_time(0, 1000000000 * a1[6]);
  dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  uint64_t v21 = a1[4];
  v22 = *(NSObject **)(v21 + 48);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke_7;
  handler[3] = &unk_1E6B88B40;
  handler[4] = v21;
  dispatch_source_set_event_handler(v22, handler);
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 48));
}

uint64_t __54__ATHostBrowser_browseForHostsWithTimeout_completion___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTimeout];
}

- (ATHostBrowser)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATHostBrowser;
  v2 = [(ATHostBrowser *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ATHostDiscoveryService", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    hostsBeingResolved = v2->_hostsBeingResolved;
    v2->_hostsBeingResolved = (NSMutableSet *)v5;
  }
  return v2;
}

@end
@interface CMNetworkActivityObserver
+ (id)registeredObserverForActivityMonitor:(id)a3;
- (CMNetworkActivityMonitor)activityMonitor;
- (id)initForActivityMonitor:(id)a3;
- (void)_pollWithInterval:(double)a3 networkActivityDidCompleteBlock:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)registerObservations;
- (void)unregisterObservations;
@end

@implementation CMNetworkActivityObserver

- (id)initForActivityMonitor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMNetworkActivityObserver;
  v4 = [(CMNetworkActivityObserver *)&v7 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_activityMonitor, a3);
    v5->_valid = 1;
  }
  return v5;
}

- (CMNetworkActivityMonitor)activityMonitor
{
  return (CMNetworkActivityMonitor *)objc_loadWeak((id *)&self->_activityMonitor);
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_activityMonitor, 0);
  [(CMNetworkActivityObserver *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CMNetworkActivityObserver;
  [(CMNetworkActivityObserver *)&v3 dealloc];
}

- (void)unregisterObservations
{
  self->_registered = 0;
  int cmActivityToken = self->_cmActivityToken;
  if (cmActivityToken)
  {
    notify_cancel(cmActivityToken);
    self->_int cmActivityToken = 0;
  }
  int cmActivityPollingToken = self->_cmActivityPollingToken;
  if (cmActivityPollingToken)
  {
    notify_cancel(cmActivityPollingToken);
    self->_int cmActivityPollingToken = 0;
  }
}

- (void)_pollWithInterval:(double)a3 networkActivityDidCompleteBlock:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke;
  block[3] = &unk_1E5795B28;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v2 + 16);
  objc_super v3 = (int *)(v2 + 16);
  if (v4 || !notify_register_check("com.apple.coremedia.network_activity", v3))
  {
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke_2;
    block[3] = &unk_1E5795B28;
    uint64_t v9 = *(void *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    [v6 unregisterObservations];
  }
}

uint64_t __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activityMonitor])
  {
    int check = 0;
    notify_check(*(_DWORD *)(*(void *)(a1 + 32) + 16), &check);
    uint64_t v2 = *(int **)(a1 + 32);
    if (check)
    {
      return [v2 _pollWithInterval:*(void *)(a1 + 40) networkActivityDidCompleteBlock:*(double *)(a1 + 48)];
    }
    else
    {
      notify_cancel(v2[4]);
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    int v4 = *(void **)(a1 + 32);
    return [v4 unregisterObservations];
  }
}

- (void)registerObservations
{
  if (!self->_registered && self->_valid)
  {
    self->_registered = 1;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__CMNetworkActivityObserver_registerObservations__block_invoke;
    handler[3] = &unk_1E578C740;
    handler[4] = self;
    notify_register_dispatch("com.apple.coremedia.network_activity", &self->_cmActivityToken, MEMORY[0x1E4F14428], handler);
  }
}

uint64_t __49__CMNetworkActivityObserver_registerObservations__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) activityMonitor];
  if (v2)
  {
    objc_super v3 = v2;
    [v2 setNetworkIsActive:1];
    [*(id *)(a1 + 32) unregisterObservations];
    int v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__CMNetworkActivityObserver_registerObservations__block_invoke_2;
    v7[3] = &unk_1E57955D0;
    v7[4] = v3;
    v7[5] = v4;
    return [v4 _pollWithInterval:v7 networkActivityDidCompleteBlock:0.5];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    return [v6 unregisterObservations];
  }
}

uint64_t __49__CMNetworkActivityObserver_registerObservations__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNetworkIsActive:0];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 registerObservations];
}

- (void)invalidate
{
  self->_valid = 0;
  [(CMNetworkActivityObserver *)self unregisterObservations];
}

+ (id)registeredObserverForActivityMonitor:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initForActivityMonitor:a3];
  [v3 registerObservations];

  return v3;
}

@end
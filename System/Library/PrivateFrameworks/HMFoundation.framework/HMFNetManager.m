@interface HMFNetManager
+ (HMFNetManager)sharedManager;
- (HMFNetManager)init;
- (HMFNetManager)initWithWiFiManager:(id)a3;
- (HMFWiFiManager)wifiManager;
- (OS_dispatch_queue)clientQueue;
- (_HMFNetManagerWoWAssertion)wowAssertion;
- (void)deregisterWoWAssertionForObject:(id)a3;
- (void)registerWoWAssertionForObject:(id)a3;
- (void)setWowAssertion:(id)a3;
@end

@implementation HMFNetManager

+ (HMFNetManager)sharedManager
{
  if (_MergedGlobals_1_0 != -1) {
    dispatch_once(&_MergedGlobals_1_0, &__block_literal_global_25);
  }
  v2 = (void *)qword_1EB4EEE78;
  return (HMFNetManager *)v2;
}

uint64_t __30__HMFNetManager_sharedManager__block_invoke()
{
  qword_1EB4EEE78 = objc_alloc_init(HMFNetManager);
  return MEMORY[0x1F41817F8]();
}

- (HMFNetManager)initWithWiFiManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMFNetManager;
  v6 = [(HMFNetManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)HMFDispatchQueueName(v6, 0);
    dispatch_queue_t v9 = dispatch_queue_create(v8, 0);
    clientQueue = v7->_clientQueue;
    v7->_clientQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v7->_wifiManager, a3);
  }

  return v7;
}

- (HMFNetManager)init
{
  v3 = +[HMFWiFiManager sharedManager];
  v4 = [(HMFNetManager *)self initWithWiFiManager:v3];

  return v4;
}

- (void)registerWoWAssertionForObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMFNetManager *)self clientQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__HMFNetManager_registerWoWAssertionForObject___block_invoke;
    v6[3] = &unk_1E5957730;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __47__HMFNetManager_registerWoWAssertionForObject___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3A87A0]();
  v3 = [*(id *)(a1 + 32) wowAssertion];
  if (!v3)
  {
    id v4 = [_HMFNetManagerWoWAssertion alloc];
    id v5 = [*(id *)(a1 + 32) wifiManager];
    v3 = [(_HMFNetManagerWoWAssertion *)v4 initWithWifiManager:v5];

    [*(id *)(a1 + 32) setWowAssertion:v3];
  }
  objc_setAssociatedObject(*(id *)(a1 + 40), "HMF.wowAssertionKey", v3, (void *)1);
}

- (void)deregisterWoWAssertionForObject:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(a3, "HMF.wowAssertionKey", 0, (void *)1);
  }
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (_HMFNetManagerWoWAssertion)wowAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wowAssertion);
  return (_HMFNetManagerWoWAssertion *)WeakRetained;
}

- (void)setWowAssertion:(id)a3
{
}

- (HMFWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_destroyWeak((id *)&self->_wowAssertion);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
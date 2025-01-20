@interface CoreTelephonyShim
+ (id)sharedInstance;
- (CoreTelephonyShim)init;
- (id)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6;
- (id)copyMobileCountryCode:(id)a3 error:(id *)a4;
- (id)copyMobileNetworkCode:(id)a3 error:(id *)a4;
- (id)getCurrentDataSubscriptionContextSync:(id *)a3;
- (id)getEnglishCarrierNameFor:(id)a3 error:(id *)a4;
- (void)addDelegate:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation CoreTelephonyShim

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__CoreTelephonyShim_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __35__CoreTelephonyShim_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (CoreTelephonyShim)init
{
  v12.receiver = self;
  v12.super_class = (Class)CoreTelephonyShim;
  v2 = [(CoreTelephonyShim *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.autobugcapture.coretelephonyshim", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    delegates = v2->_delegates;
    v2->_delegates = (NSMutableSet *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v2->_queue];
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v8;

    [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
    v10 = v2;
  }
  return v2;
}

- (void)dealloc
{
  [(CoreTelephonyClient *)self->_coreTelephonyClient setDelegate:0];
  [(NSMutableSet *)self->_delegates removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)CoreTelephonyShim;
  [(CoreTelephonyShim *)&v3 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  dispatch_queue_t v4 = self->_delegates;
  objc_sync_enter(v4);
  if (v5) {
    [(NSMutableSet *)self->_delegates addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  dispatch_queue_t v4 = self->_delegates;
  objc_sync_enter(v4);
  if (v5) {
    [(NSMutableSet *)self->_delegates removeObject:v5];
  }
  objc_sync_exit(v4);
}

- (id)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6
{
  return (id)[(CoreTelephonyClient *)self->_coreTelephonyClient copyCarrierBundleValue:a3 key:a4 bundleType:a5 error:a6];
}

- (id)getEnglishCarrierNameFor:(id)a3 error:(id *)a4
{
  return (id)[(CoreTelephonyClient *)self->_coreTelephonyClient getEnglishCarrierNameFor:a3 error:a4];
}

- (id)copyMobileCountryCode:(id)a3 error:(id *)a4
{
  return (id)[(CoreTelephonyClient *)self->_coreTelephonyClient copyMobileCountryCode:a3 error:a4];
}

- (id)copyMobileNetworkCode:(id)a3 error:(id *)a4
{
  return (id)[(CoreTelephonyClient *)self->_coreTelephonyClient copyMobileNetworkCode:a3 error:a4];
}

- (id)getCurrentDataSubscriptionContextSync:(id *)a3
{
  return (id)[(CoreTelephonyClient *)self->_coreTelephonyClient getCurrentDataSubscriptionContextSync:a3];
}

- (void)subscriptionInfoDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = self->_delegates;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  dispatch_queue_t v4 = self->_delegates;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "subscriptionInfoDidChange", (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_delegates;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_delegates;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "currentDataSimChanged:", v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)carrierBundleChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self->_delegates;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_delegates;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "carrierBundleChange:", v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
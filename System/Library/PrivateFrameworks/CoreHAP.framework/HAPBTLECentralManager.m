@interface HAPBTLECentralManager
+ (id)getInstance;
- (CBCentralManager)centralManager;
- (HAPBTLECentralManager)init;
- (NSMutableSet)delegates;
- (OS_dispatch_queue)workQueue;
- (id)_getCentralManager;
- (int64_t)state;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)registerCentralManagerDelegate:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HAPBTLECentralManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->delegates, 0);
  objc_storeStrong((id *)&self->centralManager, 0);

  objc_storeStrong((id *)&self->workQueue, 0);
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

- (int64_t)state
{
  return self->state;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableSet)delegates
{
  return self->delegates;
}

- (void)setCentralManager:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->centralManager;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->workQueue;
}

- (void)registerCentralManagerDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(HAPBTLECentralManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HAPBTLECentralManager_registerCentralManagerDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__HAPBTLECentralManager_registerCentralManagerDelegate___block_invoke(uint64_t a1)
{
  id v6 = [[HAPComponent alloc] initWithDelegate:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) delegates];
  [v2 addObject:v6];

  v3 = [*(id *)(a1 + 40) _getCentralManager];
  uint64_t v4 = [v3 state];
  if ([*(id *)(a1 + 40) state])
  {
    v5 = [(HAPComponent *)v6 centralManagerDelegate];
    [v5 didUpdateBTLEState:v4];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 state];
  [(HAPBTLECentralManager *)self setState:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(HAPBTLECentralManager *)self delegates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) centralManagerDelegate];
        [v10 didUpdateBTLEState:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_getCentralManager
{
  v3 = [(HAPBTLECentralManager *)self centralManager];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1BD18]);
    v5 = [(HAPBTLECentralManager *)self workQueue];
    uint64_t v6 = (void *)[v4 initWithDelegate:self queue:v5];
    [(HAPBTLECentralManager *)self setCentralManager:v6];

    uint64_t v7 = [(HAPBTLECentralManager *)self centralManager];
    -[HAPBTLECentralManager setState:](self, "setState:", [v7 state]);
  }

  return [(HAPBTLECentralManager *)self centralManager];
}

- (HAPBTLECentralManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)HAPBTLECentralManager;
  v2 = [(HAPBTLECentralManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.HAPBTLECentralManager", v3);
    workQueue = v2->workQueue;
    v2->workQueue = (OS_dispatch_queue *)v4;

    centralManager = v2->centralManager;
    v2->centralManager = 0;

    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    delegates = v2->delegates;
    v2->delegates = v7;

    v2->state = 0;
  }
  return v2;
}

+ (id)getInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HAPBTLECentralManager_getInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getInstance_onceToken != -1) {
    dispatch_once(&getInstance_onceToken, block);
  }
  v2 = (void *)getInstance_hapCentralManager;

  return v2;
}

uint64_t __36__HAPBTLECentralManager_getInstance__block_invoke(uint64_t a1)
{
  getInstance_hapCentralManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

@end
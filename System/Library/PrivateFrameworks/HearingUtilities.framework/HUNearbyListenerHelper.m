@interface HUNearbyListenerHelper
- (HUNearbyListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4;
- (void)addKey:(id)a3 forDomain:(id)a4;
- (void)dealloc;
@end

@implementation HUNearbyListenerHelper

- (HUNearbyListenerHelper)initWithListenerAddress:(id)a3 andDelegate:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUNearbyListenerHelper;
  v7 = [(HUNearbyListenerHelper *)&v10 init];
  if (v7)
  {
    id v8 = objc_loadWeakRetained(&location);
    objc_storeWeak(&v7->_listenerAddress, v8);

    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  objc_destroyWeak(&location);
  return v7;
}

- (void)addKey:(id)a3 forDomain:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  keys = self->_keys;
  if (!keys)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = self->_keys;
    self->_keys = v8;

    keys = self->_keys;
  }
  id v10 = [(NSMutableDictionary *)keys objectForKey:v11];
  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  [v10 addObject:v6];
  [(NSMutableDictionary *)self->_keys setObject:v10 forKey:v11];
}

- (void)dealloc
{
  v3 = [(NSMutableDictionary *)self->_keys objectForKey:@"HUNearbyControllerLoggingKey"];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__HUNearbyListenerHelper_dealloc__block_invoke;
  v9[3] = &unk_2640FE010;
  v9[4] = self;
  [v3 enumerateObjectsUsingBlock:v9];

  v4 = [(NSMutableDictionary *)self->_keys objectForKey:@"HUNearbyControllerMessageKey"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__HUNearbyListenerHelper_dealloc__block_invoke_2;
  v8[3] = &unk_2640FE010;
  v8[4] = self;
  [v4 enumerateObjectsUsingBlock:v8];

  v5 = [(NSMutableDictionary *)self->_keys objectForKey:@"HUNearbyControllerDiscoveryKey"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__HUNearbyListenerHelper_dealloc__block_invoke_3;
  v7[3] = &unk_2640FE010;
  v7[4] = self;
  [v5 enumerateObjectsUsingBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)HUNearbyListenerHelper;
  [(HUNearbyListenerHelper *)&v6 dealloc];
}

void __33__HUNearbyListenerHelper_dealloc__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained registerLoggingBlock:0 forDomain:v4 withListener:*(void *)(a1 + 32)];
}

void __33__HUNearbyListenerHelper_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained registerMessageBlock:0 forDomain:v4 withListener:*(void *)(a1 + 32)];
}

void __33__HUNearbyListenerHelper_dealloc__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained registerDiscoveryBlock:0 forDomain:v4 withListener:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak(&self->_listenerAddress);
}

@end
@interface CDPDNetworkObserver
+ (id)sharedInstance;
- (CDPDNetworkObserver)init;
- (id)addNetworkObserverWithEventHandler:(id)a3;
- (void)_networkReachabilityDidChangeWithFlags:(unsigned int)a3;
- (void)removeObserverWithToken:(id)a3;
- (void)startObservingNetwork;
@end

@implementation CDPDNetworkObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

uint64_t __37__CDPDNetworkObserver_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = objc_alloc_init(CDPDNetworkObserver);
  return MEMORY[0x270F9A758]();
}

- (CDPDNetworkObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)CDPDNetworkObserver;
  v2 = [(CDPDNetworkObserver *)&v11 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    clientsLock = v2->_clientsLock;
    v2->_clientsLock = v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    clientsByUUID = v2->_clientsByUUID;
    v2->_clientsByUUID = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("CDPDNetworkObserver Event Queue", v7);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)startObservingNetwork
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CDPDNetworkObserver_startObservingNetwork__block_invoke;
  block[3] = &unk_26432F568;
  block[4] = self;
  dispatch_sync(eventQueue, block);
}

uint64_t __44__CDPDNetworkObserver_startObservingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  sockaddr address = (sockaddr)xmmword_2186D7190;
  *(void *)(*(void *)(a1 + 32) + 32) = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], &address);
  SCNetworkReachabilityFlags flags = 0;
  SCNetworkReachabilityGetFlags(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 32), &flags);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = (flags & 2) != 0;
  memset(&v3, 0, sizeof(v3));
  v3.info = *(void **)(a1 + 32);
  SCNetworkReachabilitySetCallback(*((SCNetworkReachabilityRef *)v3.info + 4), (SCNetworkReachabilityCallBack)_networkReachabilityCallBack, &v3);
  return SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 32), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
}

- (void)_networkReachabilityDidChangeWithFlags:(unsigned int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke;
  v4[3] = &unk_264331030;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = (*(unsigned char *)(a1 + 40) & 2) != 0;
  [*(id *)(*(void *)(a1 + 32) + 16) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  SCNetworkReachabilityContext v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke_2;
  v5[3] = &unk_264331008;
  v5[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  return [*(id *)(*(void *)(a1 + 32) + 16) unlock];
}

void __62__CDPDNetworkObserver__networkReachabilityDidChangeWithFlags___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 eventHandler];
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, *(unsigned __int8 *)(*(void *)(a1 + 32) + 8));
    v4 = (void (**)(void, void))v5;
  }
}

- (id)addNetworkObserverWithEventHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = [v5 UUIDString];

  v7 = objc_alloc_init(CDPDNetworkObserverClient);
  [(CDPDNetworkObserverClient *)v7 setEventHandler:v4];
  [(NSLock *)self->_clientsLock lock];
  [(NSMutableDictionary *)self->_clientsByUUID setObject:v7 forKey:v6];
  [(NSLock *)self->_clientsLock unlock];
  eventQueue = self->_eventQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__CDPDNetworkObserver_addNetworkObserverWithEventHandler___block_invoke;
  v11[3] = &unk_264331058;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  dispatch_async(eventQueue, v11);

  return v6;
}

uint64_t __58__CDPDNetworkObserver_addNetworkObserverWithEventHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1 + 32) + 8));
  }
  return result;
}

- (void)removeObserverWithToken:(id)a3
{
  clientsLock = self->_clientsLock;
  id v5 = a3;
  [(NSLock *)clientsLock lock];
  [(NSMutableDictionary *)self->_clientsByUUID removeObjectForKey:v5];

  uint64_t v6 = self->_clientsLock;
  [(NSLock *)v6 unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_clientsByUUID, 0);
  objc_storeStrong((id *)&self->_clientsLock, 0);
}

@end
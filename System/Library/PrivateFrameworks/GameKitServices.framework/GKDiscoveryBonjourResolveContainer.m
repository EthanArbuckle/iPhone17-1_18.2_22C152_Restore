@interface GKDiscoveryBonjourResolveContainer
- (GKDiscoveryBonjour)context;
- (GKDiscoveryBonjourResolveContainer)init;
- (NSMutableArray)serviceRefList;
- (id)resolveCompletionHandler;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setResolveCompletionHandler:(id)a3;
- (void)setServiceRefList:(id)a3;
@end

@implementation GKDiscoveryBonjourResolveContainer

- (GKDiscoveryBonjourResolveContainer)init
{
  v4.receiver = self;
  v4.super_class = (Class)GKDiscoveryBonjourResolveContainer;
  v2 = [(GKDiscoveryBonjourResolveContainer *)&v4 init];
  if (v2) {
    v2->_serviceRefList = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];

  self->_resolveCompletionHandler = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  serviceRefList = self->_serviceRefList;
  uint64_t v4 = [(NSMutableArray *)serviceRefList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(serviceRefList);
        }
        v8 = (_DNSServiceRef_t *)[*(id *)(*((void *)&v10 + 1) + 8 * i) pointerValue];
        if (v8) {
          DNSServiceRefDeallocate(v8);
        }
      }
      uint64_t v5 = [(NSMutableArray *)serviceRefList countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)GKDiscoveryBonjourResolveContainer;
  [(GKDiscoveryBonjourResolveContainer *)&v9 dealloc];
}

- (NSMutableArray)serviceRefList
{
  return self->_serviceRefList;
}

- (void)setServiceRefList:(id)a3
{
}

- (id)resolveCompletionHandler
{
  return self->_resolveCompletionHandler;
}

- (void)setResolveCompletionHandler:(id)a3
{
}

- (GKDiscoveryBonjour)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  self->_context = (GKDiscoveryBonjour *)a3;
}

@end
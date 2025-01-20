@interface CRKIdentifiedProviderRegistry
+ (id)sharedInstance;
- (CRKIdentifiedProviderRegistry)init;
- (NSArray)identifiedProviders;
- (void)registerIdentifiedProvider:(id)a3;
- (void)unregisterIdentifiedProvider:(id)a3;
@end

@implementation CRKIdentifiedProviderRegistry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CRKIdentifiedProviderRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sRegistry;

  return v2;
}

uint64_t __47__CRKIdentifiedProviderRegistry_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedInstance_sRegistry;
  sharedInstance_sRegistry = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (CRKIdentifiedProviderRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKIdentifiedProviderRegistry;
  v2 = [(CRKIdentifiedProviderRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    identifiedProviders = v2->_identifiedProviders;
    v2->_identifiedProviders = v3;
  }
  return v2;
}

- (void)registerIdentifiedProvider:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(NSMutableOrderedSet *)self->_identifiedProviders containsObject:v4] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_identifiedProviders addObject:v4];
    v5 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_224F73000, v5, OS_LOG_TYPE_INFO, "Registered provider with CardKit: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)unregisterIdentifiedProvider:(id)a3
{
}

- (NSArray)identifiedProviders
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_identifiedProviders array];
}

- (void).cxx_destruct
{
}

@end
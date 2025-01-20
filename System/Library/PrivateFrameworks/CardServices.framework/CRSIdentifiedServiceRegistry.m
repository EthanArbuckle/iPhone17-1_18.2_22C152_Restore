@interface CRSIdentifiedServiceRegistry
+ (id)sharedInstance;
- (CRSIdentifiedServiceRegistry)init;
- (id)identifiedServices;
- (void)registerIdentifiedService:(id)a3;
@end

@implementation CRSIdentifiedServiceRegistry

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CRSIdentifiedServiceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sRegistry;
  return v2;
}

uint64_t __46__CRSIdentifiedServiceRegistry_sharedInstance__block_invoke()
{
  sharedInstance_sRegistry = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (CRSIdentifiedServiceRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRSIdentifiedServiceRegistry;
  v2 = [(CRSIdentifiedServiceRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    identifiedServices = v2->_identifiedServices;
    v2->_identifiedServices = v3;
  }
  return v2;
}

- (void)registerIdentifiedService:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(NSMutableOrderedSet *)self->_identifiedServices containsObject:v4] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_identifiedServices addObject:v4];
    v5 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_225997000, v5, OS_LOG_TYPE_INFO, "Registered service with CardServices: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)identifiedServices
{
  return (id)[(NSMutableOrderedSet *)self->_identifiedServices array];
}

- (void).cxx_destruct
{
}

@end
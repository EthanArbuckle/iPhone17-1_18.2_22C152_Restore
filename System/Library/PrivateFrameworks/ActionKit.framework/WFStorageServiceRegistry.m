@interface WFStorageServiceRegistry
+ (id)sharedRegistry;
+ (void)registerAllActionKitStorageServiceClasses;
+ (void)registerStorageServiceClass:(Class)a3;
- (NSArray)registeredServices;
- (NSArray)storageServices;
- (NSSet)objectRepresentationClasses;
- (WFStorageServiceRegistry)init;
- (id)storageServiceWithName:(id)a3;
@end

@implementation WFStorageServiceRegistry

- (void).cxx_destruct
{
}

- (NSArray)registeredServices
{
  return self->_registeredServices;
}

- (id)storageServiceWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(WFStorageServiceRegistry *)self registeredServices];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [(id)objc_opt_class() serviceName];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSSet)objectRepresentationClasses
{
  v2 = [(WFStorageServiceRegistry *)self storageServices];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_187_22328);

  id v4 = [MEMORY[0x263EFFA08] setWithArray:v3];

  return (NSSet *)v4;
}

uint64_t __55__WFStorageServiceRegistry_objectRepresentationClasses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectRepresentationClass];
}

- (NSArray)storageServices
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  id v4 = [v3 objectForKey:@"WFStorageServicesAllowedServices"];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = "WFEnforceClass";
      __int16 v19 = 2114;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2114;
      uint64_t v24 = v5;
      id v9 = v22;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  if ([v7 containsObject:@"WFiCloudStorageService"])
  {
    uint64_t v10 = [v7 arrayByAddingObject:@"WFDefaultFileStorageService"];

    id v7 = (id)v10;
  }
  char v11 = [(WFStorageServiceRegistry *)self registeredServices];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__WFStorageServiceRegistry_storageServices__block_invoke;
  v15[3] = &unk_264E5AAB8;
  id v16 = v7;
  id v12 = v7;
  long long v13 = objc_msgSend(v11, "if_objectsPassingTest:", v15);

  return (NSArray *)v13;
}

uint64_t __43__WFStorageServiceRegistry_storageServices__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  uint64_t v4 = [v1 containsObject:v3];

  return v4;
}

- (WFStorageServiceRegistry)init
{
  v17[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)WFStorageServiceRegistry;
  v2 = [(WFStorageServiceRegistry *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] workflowUserDefaults];
    id v16 = @"WFStorageServicesAllowedServices";
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    v15[0] = v5;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v15[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    v17[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [v3 registerDefaults:v9];

    uint64_t v10 = objc_msgSend((id)registeredStorageServiceClasses, "if_map:", &__block_literal_global_177);
    registeredServices = v2->_registeredServices;
    v2->_registeredServices = (NSArray *)v10;

    id v12 = v2;
  }

  return v2;
}

id __32__WFStorageServiceRegistry_init__block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WFStorageServiceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, block);
  }
  v2 = (void *)sharedRegistry_sharedRegistry;
  return v2;
}

void __42__WFStorageServiceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) registerAllActionKitStorageServiceClasses];
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedRegistry_sharedRegistry;
  sharedRegistry_sharedRegistry = v1;
}

+ (void)registerStorageServiceClass:(Class)a3
{
  if (registerStorageServiceClass__onceToken != -1) {
    dispatch_once(&registerStorageServiceClass__onceToken, &__block_literal_global_22353);
  }
  int v4 = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  uint64_t v5 = (void *)registeredStorageServiceClasses;
  if (v4)
  {
    [v5 insertObject:a3 atIndex:0];
  }
  else
  {
    [v5 addObject:a3];
  }
}

void __56__WFStorageServiceRegistry_registerStorageServiceClass___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)registeredStorageServiceClasses;
  registeredStorageServiceClasses = v0;
}

+ (void)registerAllActionKitStorageServiceClasses
{
  v13[2] = *MEMORY[0x263EF8340];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(a1, "registerStorageServiceClass:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end
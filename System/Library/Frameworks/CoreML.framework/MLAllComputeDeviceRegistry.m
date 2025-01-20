@interface MLAllComputeDeviceRegistry
+ (id)registryWithDeviceRegistries:(id)a3;
+ (id)sharedRegistry;
- (MLAllComputeDeviceRegistry)initWithDeviceRegistries:(id)a3;
- (NSArray)deviceRegistries;
- (NSArray)registeredAndAccessibleComputeDevices;
- (NSArray)registeredComputeDevices;
@end

@implementation MLAllComputeDeviceRegistry

void __44__MLAllComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = +[MLNeuralEngineComputeDeviceRegistry sharedRegistry];
  v3 = +[MLGPUComputeDeviceRegistry sharedRegistry];
  v8[1] = v3;
  v4 = +[MLCPUComputeDeviceRegistry sharedRegistry];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v1 initWithDeviceRegistries:v5];
  v7 = (void *)sharedRegistry_registry_21984;
  sharedRegistry_registry_21984 = v6;
}

- (NSArray)registeredComputeDevices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(MLAllComputeDeviceRegistry *)self deviceRegistries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) registeredComputeDevices];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)deviceRegistries
{
  return self->_deviceRegistries;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MLAllComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_21983 != -1) {
    dispatch_once(&sharedRegistry_onceToken_21983, block);
  }
  v2 = (void *)sharedRegistry_registry_21984;

  return v2;
}

- (MLAllComputeDeviceRegistry)initWithDeviceRegistries:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLAllComputeDeviceRegistry;
  uint64_t v5 = [(MLAllComputeDeviceRegistry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    deviceRegistries = v5->_deviceRegistries;
    v5->_deviceRegistries = (NSArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)registeredAndAccessibleComputeDevices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(MLAllComputeDeviceRegistry *)self deviceRegistries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) registeredAndAccessibleComputeDevices];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (id)registryWithDeviceRegistries:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDeviceRegistries:v4];

  return v5;
}

@end
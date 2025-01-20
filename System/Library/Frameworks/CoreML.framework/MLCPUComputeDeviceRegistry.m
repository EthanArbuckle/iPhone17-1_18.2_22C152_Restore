@interface MLCPUComputeDeviceRegistry
+ (id)sharedRegistry;
- (MLCPUComputeDevice)cpuDevice;
- (MLCPUComputeDeviceRegistry)initWithCpuDevice:(id)a3;
- (NSArray)registeredComputeDevices;
@end

@implementation MLCPUComputeDeviceRegistry

- (NSArray)registeredComputeDevices
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(MLCPUComputeDeviceRegistry *)self cpuDevice];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (MLCPUComputeDevice)cpuDevice
{
  return self->_cpuDevice;
}

void __44__MLCPUComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[MLCPUComputeDevice physicalDevice];
  uint64_t v2 = [v1 initWithCpuDevice:v4];
  v3 = (void *)sharedRegistry_registry_16676;
  sharedRegistry_registry_16676 = v2;
}

- (MLCPUComputeDeviceRegistry)initWithCpuDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLCPUComputeDeviceRegistry;
  v6 = [(MLCPUComputeDeviceRegistry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cpuDevice, a3);
  }

  return v7;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MLCPUComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_16675 != -1) {
    dispatch_once(&sharedRegistry_onceToken_16675, block);
  }
  uint64_t v2 = (void *)sharedRegistry_registry_16676;

  return v2;
}

- (void).cxx_destruct
{
}

@end
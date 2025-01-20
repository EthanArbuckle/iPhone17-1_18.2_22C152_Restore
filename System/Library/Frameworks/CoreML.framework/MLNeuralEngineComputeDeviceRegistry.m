@interface MLNeuralEngineComputeDeviceRegistry
+ (id)sharedRegistry;
- (MLNeuralEngineComputeDevice)neuralEngineDevice;
- (MLNeuralEngineComputeDeviceRegistry)initWithNeuralEngineDevice:(id)a3;
- (NSArray)registeredAndAccessibleComputeDevices;
- (NSArray)registeredComputeDevices;
@end

@implementation MLNeuralEngineComputeDeviceRegistry

- (NSArray)registeredComputeDevices
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MLNeuralEngineComputeDeviceRegistry *)self neuralEngineDevice];
  if (v3)
  {
    v4 = [(MLNeuralEngineComputeDeviceRegistry *)self neuralEngineDevice];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (MLNeuralEngineComputeDevice)neuralEngineDevice
{
  return self->_neuralEngineDevice;
}

- (NSArray)registeredAndAccessibleComputeDevices
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MLNeuralEngineComputeDeviceRegistry *)self neuralEngineDevice];
  if (v3)
  {
    v4 = [(MLNeuralEngineComputeDeviceRegistry *)self neuralEngineDevice];
    if ([v4 isAccessible])
    {
      v5 = [(MLNeuralEngineComputeDeviceRegistry *)self neuralEngineDevice];
      v8[0] = v5;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MLNeuralEngineComputeDeviceRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, block);
  }
  v2 = (void *)sharedRegistry_registry;

  return v2;
}

void __53__MLNeuralEngineComputeDeviceRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[MLNeuralEngineComputeDevice physicalDevice];
  uint64_t v2 = [v1 initWithNeuralEngineDevice:v4];
  v3 = (void *)sharedRegistry_registry;
  sharedRegistry_registry = v2;
}

- (MLNeuralEngineComputeDeviceRegistry)initWithNeuralEngineDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLNeuralEngineComputeDeviceRegistry;
  v6 = [(MLNeuralEngineComputeDeviceRegistry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_neuralEngineDevice, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end
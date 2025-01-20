@interface ARSharedGPUDevice
+ (id)sharedInstance;
- (MTLDevice)device;
- (void)setDevice:(id)a3;
@end

@implementation ARSharedGPUDevice

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_114);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __35__ARSharedGPUDevice_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(ARSharedGPUDevice);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  id v2 = MTLCreateSystemDefaultDevice();
  [(id)sharedInstance_sharedInstance setDevice:v2];
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
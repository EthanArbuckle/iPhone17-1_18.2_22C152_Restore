@interface VCPCNNMetalContext
+ (BOOL)supportGPU;
+ (BOOL)supportVectorForward;
+ (id)sharedCommandQueue;
- (MTLCommandBuffer)commandBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (id)initNewContext:(BOOL)a3;
- (int)execute;
- (void)setCommandBuffer:(id)a3;
- (void)setCommandQueue:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation VCPCNNMetalContext

+ (BOOL)supportGPU
{
  return SocType() - 247 < 0xA;
}

+ (BOOL)supportVectorForward
{
  return SocType() - 246 < 0xB;
}

+ (id)sharedCommandQueue
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = [v2 sharedInstanceWithIdentifier:@"MTLCommandQueue" andCreationBlock:&__block_literal_global_86];

  return v3;
}

id __40__VCPCNNMetalContext_sharedCommandQueue__block_invoke()
{
  id v0 = MTLCreateSystemDefaultDevice();
  v1 = (void *)[v0 newCommandQueue];

  return v1;
}

- (id)initNewContext:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VCPCNNMetalContext;
  v4 = [(VCPCNNMetalContext *)&v20 init];
  if (v4 && SocType() != 246)
  {
    if (v3)
    {
      uint64_t v5 = [(id)objc_opt_class() sharedCommandQueue];
      commandQueue = v4->_commandQueue;
      v4->_commandQueue = (MTLCommandQueue *)v5;

      uint64_t v7 = [(MTLCommandQueue *)v4->_commandQueue device];
      device = v4->_device;
      v4->_device = (MTLDevice *)v7;

      v9 = v4->_commandQueue;
      objc_sync_enter(v9);
      uint64_t v10 = [(MTLCommandQueue *)v4->_commandQueue commandBuffer];
      commandBuffer = v4->_commandBuffer;
      v4->_commandBuffer = (MTLCommandBuffer *)v10;

      objc_sync_exit(v9);
    }
    else
    {
      v12 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      v13 = v4->_device;
      v4->_device = v12;

      uint64_t v14 = [(MTLDevice *)v4->_device newCommandQueue];
      v15 = v4->_commandQueue;
      v4->_commandQueue = (MTLCommandQueue *)v14;

      uint64_t v16 = [(MTLCommandQueue *)v4->_commandQueue commandBuffer];
      v9 = v4->_commandBuffer;
      v4->_commandBuffer = (MTLCommandBuffer *)v16;
    }

    if (v4->_commandBuffer) {
      MEMORY[0x1C186BD40](0.0);
    }
  }
  v17 = v4->_device;
  if (v17)
  {
    v17 = v4->_commandQueue;
    if (v17)
    {
      if (v4->_commandBuffer) {
        v17 = v4;
      }
      else {
        v17 = 0;
      }
    }
  }
  id v18 = v17;

  return v18;
}

- (int)execute
{
  [(MTLCommandBuffer *)self->_commandBuffer commit];
  [(MTLCommandBuffer *)self->_commandBuffer waitUntilCompleted];
  BOOL v3 = self->_commandQueue;
  objc_sync_enter(v3);
  v4 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = v4;

  if (self->_commandBuffer) {
    MEMORY[0x1C186BD40](0.0);
  }
  objc_sync_exit(v3);

  if (self->_commandBuffer) {
    return 0;
  }
  else {
    return -108;
  }
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCommandQueue:(id)a3
{
}

- (MTLCommandBuffer)commandBuffer
{
  return (MTLCommandBuffer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommandBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
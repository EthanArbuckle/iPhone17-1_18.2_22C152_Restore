@interface MTLCaptureManager
+ (MTLCaptureManager)sharedCaptureManager;
- (BOOL)isCapturing;
- (BOOL)startCaptureWithDescriptor:(MTLCaptureDescriptor *)descriptor error:(NSError *)error;
- (BOOL)supportsDestination:(MTLCaptureDestination)destination;
- (id)defaultCaptureScope;
- (id)newCaptureScopeWithCommandQueue:(id)commandQueue;
- (id)newCaptureScopeWithDevice:(id)device;
- (void)dealloc;
- (void)setDefaultCaptureScope:(id)defaultCaptureScope;
- (void)startCaptureWithCommandQueue:(id)commandQueue;
- (void)startCaptureWithDevice:(id)device;
- (void)startCaptureWithScope:(id)captureScope;
@end

@implementation MTLCaptureManager

- (id)newCaptureScopeWithCommandQueue:(id)commandQueue
{
  v4 = [MTLCaptureScope alloc];
  uint64_t v5 = [commandQueue device];

  return [(MTLCaptureScope *)v4 initWithDevice:v5 commandQueue:commandQueue];
}

- (BOOL)supportsDestination:(MTLCaptureDestination)destination
{
  return 0;
}

+ (MTLCaptureManager)sharedCaptureManager
{
  if (sharedCaptureManager_onceToken != -1) {
    dispatch_once(&sharedCaptureManager_onceToken, &__block_literal_global_10);
  }
  return (MTLCaptureManager *)sharedCaptureManager_sharedCaptureManager;
}

id __41__MTLCaptureManager_sharedCaptureManager__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sharedCaptureManager_sharedCaptureManager = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureManager;
  [(MTLCaptureManager *)&v3 dealloc];
}

- (id)newCaptureScopeWithDevice:(id)device
{
  v4 = [MTLCaptureScope alloc];

  return [(MTLCaptureScope *)v4 initWithDevice:device commandQueue:0];
}

- (BOOL)startCaptureWithDescriptor:(MTLCaptureDescriptor *)descriptor error:(NSError *)error
{
  if (error) {
    *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithMTLCaptureErrorCode:1];
  }
  return 0;
}

- (void)startCaptureWithDevice:(id)device
{
  uint64_t v5 = objc_alloc_init(MTLCaptureDescriptor);
  [(MTLCaptureDescriptor *)v5 setCaptureObject:device];
  [(MTLCaptureDescriptor *)v5 setDestination:1];
  [(MTLCaptureManager *)self startCaptureWithDescriptor:v5 error:0];
}

- (void)startCaptureWithCommandQueue:(id)commandQueue
{
  uint64_t v5 = objc_alloc_init(MTLCaptureDescriptor);
  [(MTLCaptureDescriptor *)v5 setCaptureObject:commandQueue];
  [(MTLCaptureDescriptor *)v5 setDestination:1];
  [(MTLCaptureManager *)self startCaptureWithDescriptor:v5 error:0];
}

- (void)startCaptureWithScope:(id)captureScope
{
  uint64_t v5 = objc_alloc_init(MTLCaptureDescriptor);
  [(MTLCaptureDescriptor *)v5 setCaptureObject:captureScope];
  [(MTLCaptureDescriptor *)v5 setDestination:1];
  [(MTLCaptureManager *)self startCaptureWithDescriptor:v5 error:0];
}

- (BOOL)isCapturing
{
  return self->_isCapturing;
}

- (id)defaultCaptureScope
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultCaptureScope:(id)defaultCaptureScope
{
}

@end
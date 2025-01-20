@interface CAMMetalContext
- (CAMMetalContext)init;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (void)init;
@end

@implementation CAMMetalContext

- (CAMMetalContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)CAMMetalContext;
  v2 = [(CAMMetalContext *)&v9 init];
  if (v2)
  {
    id v3 = MTLCreateSystemDefaultDevice();
    v4 = v3;
    if (v3)
    {
      os_log_t v5 = (os_log_t)[v3 newCommandQueue];
      if (v5)
      {
        objc_storeStrong((id *)&v2->_device, v4);
        objc_storeStrong((id *)&v2->_commandQueue, v5);
        v6 = v2;
LABEL_12:

        goto LABEL_13;
      }
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CAMMetalContext init](v7);
      }
    }
    else
    {
      os_log_t v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CAMMetalContext init](v5);
      }
    }
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to create default Metal command queue", v1, 2u);
}

@end
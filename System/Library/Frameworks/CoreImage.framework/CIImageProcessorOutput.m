@interface CIImageProcessorOutput
- (BOOL)metalCommandBufferRequested;
- (CGColorSpace)workingColorSpace;
- (CIImageProcessorOutput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8 tileTask:(void *)a9;
- (MTLCommandBuffer)metalCommandBuffer;
- (MTLTexture)metalTexture;
- (id)metalContext;
- (unsigned)contextID;
- (void)baseAddress;
- (void)dealloc;
- (void)metalCommandBuffer;
- (void)metalTexture;
- (void)setError:(id)a3;
@end

@implementation CIImageProcessorOutput

- (CIImageProcessorOutput)initWithSurface:(__IOSurface *)a3 texture:(Texture)a4 digest:(unint64_t)a5 allowSRGB:(BOOL)a6 bounds:(CGRect)a7 context:(void *)a8 tileTask:(void *)a9
{
  if (a3)
  {
    BOOL v10 = a6;
    double height = a7.size.height;
    double width = a7.size.width;
    double y = a7.origin.y;
    double x = a7.origin.x;
    var1 = a4.var0.var2.var1;
    var0 = (long long *)a4.var0.var0;
    if (a8) {
      v19 = (void *)CI::Object::ref((uint64_t)a8);
    }
    else {
      v19 = 0;
    }
    self->_task = v19;
    long long v30 = *var0;
    v29.receiver = self;
    v29.super_class = (Class)CIImageProcessorOutput;
    return -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:](&v29, sel_initWithSurface_texture_digest_allowSRGB_bounds_context_, a3, &v30, var1, a5, v10, x, y, width, height);
  }
  else
  {
    v20 = ci_logger_api();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CIImageProcessorOutput initWithSurface:texture:digest:allowSRGB:bounds:context:tileTask:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    return 0;
  }
}

- (void)dealloc
{
  self->_cmdBuffer = 0;
  if (self->super._surfaceLocked)
  {
    surface = self->super._surface;
    if (surface)
    {
      IOSurfaceUnlock(surface, 0, 0);
      self->super._surfaceLocked = 0;
    }
  }
  task = (CI::Object *)self->_task;
  if (task) {
    CI::Object::unref(task);
  }
  self->_task = 0;
  v5.receiver = self;
  v5.super_class = (Class)CIImageProcessorOutput;
  [(CIImageProcessorInOut *)&v5 dealloc];
}

- (void)baseAddress
{
}

- (MTLTexture)metalTexture
{
  if (IOSurfaceGetPlaneCount(self->super._surface) < 2)
  {
    CIMetalFormatForFormat([(CIImageProcessorInOut *)self format], 0);
    [(CIImageProcessorInOut *)self device];
    MTLPixelFormatGetInfoForDevice();
    v11 = ci_logger_api();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CIImageProcessorOutput metalTexture]();
    }
  }
  else
  {
    v3 = ci_logger_api();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(CIImageProcessorOutput *)v3 metalTexture];
    }
  }
  return 0;
}

- (MTLCommandBuffer)metalCommandBuffer
{
  if (self->_cmdBuffer) {
    return self->_cmdBuffer;
  }
  int v3 = (*(uint64_t (**)(void *, SEL))(*(void *)self->super._context + 16))(self->super._context, a2);
  context = self->super._context;
  if (v3 == 77)
  {
    cmdBuffer = (MTLCommandBuffer *)context[224];
LABEL_8:
    self->_cmdBuffer = cmdBuffer;
    goto LABEL_9;
  }
  int v6 = (*(uint64_t (**)(void *))(*context + 16))(context);
  uint64_t v7 = [(CIImageProcessorInOut *)self device];
  if (v6 != 76)
  {
    {
      v18 = v7;
      {
        singletonMTLCommandQueue(objc_object  {objcproto9MTLDevice}*)::commandQueue = (uint64_t)CIMetalCommandQueueCreate((uint64_t)"com.apple.CoreImage", v18);
      }
    }
    cmdBuffer = (MTLCommandBuffer *)CIMetalCommandBufferCreate((uint64_t)"com.apple.CoreImage", (void *)singletonMTLCommandQueue(objc_object  {objcproto9MTLDevice}*)::commandQueue, 0, 0);
    goto LABEL_8;
  }
  uint64_t v8 = CIMetalCommandQueueCreate((uint64_t)"com.apple.CoreImage", v7);
  self->_cmdBuffer = (MTLCommandBuffer *)CIMetalCommandBufferCreate((uint64_t)"com.apple.CoreImage", v8, 0, 0);
  CFRelease(v8);
  cmdBuffer = self->_cmdBuffer;
LABEL_9:
  if (([(MTLCommandBuffer *)cmdBuffer retainedReferences] & 1) == 0)
  {
    uint64_t v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(CIImageProcessorOutput *)v9 metalCommandBuffer];
    }
  }
  return self->_cmdBuffer;
}

- (BOOL)metalCommandBufferRequested
{
  return self->_cmdBuffer != 0;
}

- (CGColorSpace)workingColorSpace
{
  context = self->super._context;
  if (context) {
    return (CGColorSpace *)*((void *)context + 3);
  }
  else {
    return 0;
  }
}

- (unsigned)contextID
{
  context = self->super._context;
  if (context) {
    LODWORD(context) = (*(uint64_t (**)(void))(*(void *)context + 272))();
  }
  return context;
}

- (id)metalContext
{
  context = self->super._context;
  if (!context) {
    return 0;
  }
  metalContext = self->super._metalContext;
  if (!metalContext)
  {
    if ((*(unsigned int (**)(void *, SEL))(*(void *)context + 16))(context, a2) == 77) {
      operator new();
    }
    if ((*(unsigned int (**)(void *))(*(void *)self->super._context + 16))(self->super._context) == 76) {
      operator new();
    }
    metalContext = 0;
    self->super._metalContext = 0;
  }
  return metalContext;
}

- (void)setError:(id)a3
{
  if (a3)
  {
    task = (CI::TileTask *)self->_task;
    if (task) {
      CI::TileTask::setCommandBufferError(task, a3);
    }
  }
}

- (void)initWithSurface:(uint64_t)a3 texture:(uint64_t)a4 digest:(uint64_t)a5 allowSRGB:(uint64_t)a6 bounds:(uint64_t)a7 context:(uint64_t)a8 tileTask:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)metalTexture
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s The CIProcessorOutput cannot be accessed via a Metal texture because the format %{public}s is not writable.", v2, v3, v4, v5, 2u);
}

- (void)metalCommandBuffer
{
}

@end
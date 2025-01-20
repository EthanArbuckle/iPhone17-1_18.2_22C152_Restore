@interface ARMPSImageFilter
- (ARMPSImageFilter)initWithImageKernel:(id)a3 device:(id)a4;
- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 format:(unint64_t)a4;
- (void)dealloc;
@end

@implementation ARMPSImageFilter

- (ARMPSImageFilter)initWithImageKernel:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARMPSImageFilter;
  v9 = [(ARMPSImageFilter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a4);
    uint64_t v11 = [(MTLDevice *)v10->_device newCommandQueue];
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v11;

    objc_storeStrong((id *)&v10->_kernel, a3);
    v10->_pixelBufferPool = 0;
  }

  return v10;
}

- (void)dealloc
{
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    CVPixelBufferPoolRelease(pixelBufferPool);
    self->_pixelBufferPool = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ARMPSImageFilter;
  [(ARMPSImageFilter *)&v4 dealloc];
}

- (__CVBuffer)processPixelBuffer:(__CVBuffer *)a3 format:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_pixelBufferPool = &self->_pixelBufferPool;
  if (a3)
  {
    double Width = (double)CVPixelBufferGetWidth(a3);
    double Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  ARRecreatePixelBufferPoolOnConfigurationChanges(p_pixelBufferPool, PixelFormatType, Width, Height);
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *p_pixelBufferPool, &pixelBufferOut))
  {
    uint64_t v11 = _ARLogGeneral_15();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      __int16 v29 = 2048;
      v30 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not allocate pixel buffer", buf, 0x16u);
    }
    objc_super v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F35330];
    size_t v16 = CVPixelBufferGetWidth(a3);
    v17 = [v15 texture2DDescriptorWithPixelFormat:a4 width:v16 height:CVPixelBufferGetHeight(a3) mipmapped:0];
    uint64_t v11 = [(MTLDevice *)self->_device newTextureWithDescriptor:v17 iosurface:CVPixelBufferGetIOSurface(a3) plane:0];

    v18 = (void *)MEMORY[0x1E4F35330];
    size_t v19 = CVPixelBufferGetWidth(pixelBufferOut);
    v20 = [v18 texture2DDescriptorWithPixelFormat:a4 width:v19 height:CVPixelBufferGetHeight(pixelBufferOut) mipmapped:0];
    objc_msgSend(v20, "setUsage:", objc_msgSend(v20, "usage") | 2);
    v21 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v20 iosurface:CVPixelBufferGetIOSurface(pixelBufferOut) plane:0];

    if (v11 && v21)
    {
      v22 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
      [(MPSUnaryImageKernel *)self->_kernel encodeToCommandBuffer:v22 sourceTexture:v11 destinationTexture:v21];
      [v22 commit];
      [v22 waitUntilCompleted];
      objc_super v14 = pixelBufferOut;
    }
    else
    {
      v22 = _ARLogGeneral_15();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        __int16 v29 = 2048;
        v30 = self;
        _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not allocate create textures for processing", buf, 0x16u);
      }
      objc_super v14 = 0;
    }
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
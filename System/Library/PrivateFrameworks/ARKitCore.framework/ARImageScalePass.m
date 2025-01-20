@interface ARImageScalePass
- (ARImageScalePass)initWithDescription:(id)a3;
- (CGSize)scaledSize;
- (__CVBuffer)scalePixelBuffer:(__CVBuffer *)a3;
- (unsigned)conversionPixelFormatType;
- (void)dealloc;
- (void)setConversionPixelFormatType:(unsigned int)a3;
@end

@implementation ARImageScalePass

- (ARImageScalePass)initWithDescription:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARImageScalePass;
  v5 = [(ARImageScalePass *)&v16 init];
  if (!v5) {
    goto LABEL_15;
  }
  [v4 size];
  v5->_scaledSize.width = v6;
  v5->_scaledSize.height = v7;
  v5->_conversionPixelFormatType = [v4 pixelBufferFormat];
  p_vtPixelTransferSession = (CFTypeRef *)&v5->_vtPixelTransferSession;
  if (!VTPixelTransferSessionCreate(0, &v5->_vtPixelTransferSession))
  {
    if (+[ARKitUserDefaults BOOLForKey:(CFTypeRef)*MEMORY[0x1E4F1CFD0] @com.apple.arkit.scaling.useOptimalMSRCoeficients])
    {
      if (*p_vtPixelTransferSession) {
        CFRelease(*p_vtPixelTransferSession);
      }
      v9 = _ARLogTechnique_12();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      v14 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      __int16 v19 = 2048;
      v20 = v5;
      v12 = "%{public}@ <%p>: Unable to set pixel transfer session properties";
      goto LABEL_7;
    }
LABEL_15:
    v13 = v5;
    goto LABEL_16;
  }
  if (*p_vtPixelTransferSession) {
    CFRelease(*p_vtPixelTransferSession);
  }
  v9 = _ARLogTechnique_12();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    goto LABEL_8;
  }
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  *(_DWORD *)buf = 138543618;
  v18 = v11;
  __int16 v19 = 2048;
  v20 = v5;
  v12 = "%{public}@ <%p>: Unable to create pixel transfer session for image downscaling";
LABEL_7:
  _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);

LABEL_8:
  v13 = 0;
LABEL_16:

  return v13;
}

- (void)dealloc
{
  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(vtPixelTransferSession);
    id v4 = self->_vtPixelTransferSession;
    if (v4) {
      CFRelease(v4);
    }
    self->_vtPixelTransferSession = 0;
  }
  scaledPixelBufferPool = self->_scaledPixelBufferPool;
  if (scaledPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledPixelBufferPool);
    self->_scaledPixelBufferPool = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ARImageScalePass;
  [(ARImageScalePass *)&v6 dealloc];
}

- (void)setConversionPixelFormatType:(unsigned int)a3
{
  if ([(ARImageScalePass *)self conversionPixelFormatType] != a3)
  {
    self->_conversionPixelFormatType = a3;
    CVPixelBufferPoolRelease(self->_scaledPixelBufferPool);
    self->_scaledPixelBufferPool = 0;
  }
}

- (__CVBuffer)scalePixelBuffer:(__CVBuffer *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int conversionPixelFormatType = self->_conversionPixelFormatType;
  if (!conversionPixelFormatType) {
    unsigned int conversionPixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  }
  [(ARImageScalePass *)self scaledSize];
  v8 = ARCreateCVPixelBufferFromPool(&self->_scaledPixelBufferPool, conversionPixelFormatType, self, @"scaling pass pool", v6, v7);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(v8, 0);
  OSStatus v9 = VTPixelTransferSessionTransferImage(self->_vtPixelTransferSession, a3, v8);
  CVPixelBufferUnlockBaseAddress(v8, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v9)
  {
    CVPixelBufferRelease(v8);
    v10 = _ARLogTechnique_12();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v14 = 138543874;
      v15 = v12;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 1024;
      OSStatus v19 = v9;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to scale image with error %d", (uint8_t *)&v14, 0x1Cu);
    }
    return 0;
  }
  return v8;
}

- (unsigned)conversionPixelFormatType
{
  return self->_conversionPixelFormatType;
}

- (CGSize)scaledSize
{
  double width = self->_scaledSize.width;
  double height = self->_scaledSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end
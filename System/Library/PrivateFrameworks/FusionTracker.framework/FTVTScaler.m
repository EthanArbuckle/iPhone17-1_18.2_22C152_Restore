@interface FTVTScaler
- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6;
- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6 mean:;
- (FTVTScaler)initWithCommandQueue:(id)a3;
- (void)dealloc;
@end

@implementation FTVTScaler

- (FTVTScaler)initWithCommandQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FTVTScaler;
  v6 = [(FTVTScaler *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_commandQueue, a3);
    uint64_t v8 = [v5 device];
    device = v7->_device;
    v7->_device = (MTLDeviceSPI *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F132D8]) initWithDevice:v7->_device];
    meanFilter = v7->_meanFilter;
    v7->_meanFilter = (MPSImageStatisticsMean *)v10;

    v12 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:80 width:1 height:1 mipmapped:0];
    [v12 setUsage:2];
    uint64_t v13 = [(MTLDeviceSPI *)v7->_device newTextureWithDescriptor:v12];
    meanTexture = v7->_meanTexture;
    v7->_meanTexture = (MTLTexture *)v13;

    VTPixelTransferSessionCreate(0, &v7->_transferSession);
    v15 = (ft *)VTSessionSetProperty(v7->_transferSession, (CFStringRef)*MEMORY[0x263F1EA18], (CFTypeRef)*MEMORY[0x263EFFB38]);
    if (v15)
    {
      v16 = ft::GetOsLog(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[FTVTScaler initWithCommandQueue:]();
      }
    }
    else
    {
      v18 = (ft *)VTSessionSetProperty(v7->_transferSession, (CFStringRef)*MEMORY[0x263F1EA08], (CFTypeRef)*MEMORY[0x263F1EC68]);
      if (!v18)
      {
        v17 = v7;
        goto LABEL_10;
      }
      v16 = ft::GetOsLog(v18);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[FTVTScaler initWithCommandQueue:]();
      }
    }

    v17 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (void)dealloc
{
  VTPixelTransferSessionInvalidate(self->_transferSession);
  CFRelease(self->_transferSession);
  self->_transferSession = 0;
  v3.receiver = self;
  v3.super_class = (Class)FTVTScaler;
  [(FTVTScaler *)&v3 dealloc];
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6
{
  return -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:](self, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6 mean:
{
  uint64_t v7 = v6;
  double height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v11 = a5.size.height;
  double v12 = a5.size.width;
  CGFloat v13 = a5.origin.y;
  CGFloat v14 = a5.origin.x;
  if (CGRectIsEmpty(a5))
  {
    double v12 = (double)CVPixelBufferGetWidth(a3);
    double v11 = (double)CVPixelBufferGetHeight(a3);
    CGFloat v14 = 0.0;
    CGFloat v13 = 0.0;
  }
  CGFloat v18 = (double)CVPixelBufferGetWidth(a3);
  v46.size.double height = (double)CVPixelBufferGetHeight(a3);
  v46.origin.CGFloat x = 0.0;
  v46.origin.CGFloat y = 0.0;
  v41.origin.CGFloat x = v14;
  v41.origin.CGFloat y = v13;
  v41.size.double width = v12;
  v41.size.double height = v11;
  v46.size.double width = v18;
  if (CGRectEqualToRect(v41, v46))
  {
    v19 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x263F1EA10], 0);
    int v20 = (int)v19;
  }
  else
  {
    v42.origin.CGFloat x = v14;
    v42.origin.CGFloat y = v13;
    v42.size.double width = v12;
    v42.size.double height = v11;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
    v19 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x263F1EA10], DictionaryRepresentation);
    int v20 = (int)v19;
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  CGFloat v22 = y;
  if (v20)
  {
    v23 = ft::GetOsLog(v19);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:].cold.4();
    }
  }
  else
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    if (CGRectIsEmpty(v43))
    {
      double width = (double)CVPixelBufferGetWidth(a4);
      double height = (double)CVPixelBufferGetHeight(a4);
      CGFloat x = 0.0;
      CGFloat v22 = 0.0;
    }
    CGFloat v24 = (double)CVPixelBufferGetWidth(a4);
    v47.size.double height = (double)CVPixelBufferGetHeight(a4);
    v47.origin.CGFloat x = 0.0;
    v47.origin.CGFloat y = 0.0;
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = v22;
    v44.size.double width = width;
    v44.size.double height = height;
    v47.size.double width = v24;
    if (CGRectEqualToRect(v44, v47))
    {
      v25 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x263F1E9D8], 0);
      int v26 = (int)v25;
    }
    else
    {
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = v22;
      v45.size.double width = width;
      v45.size.double height = height;
      CFDictionaryRef v27 = CGRectCreateDictionaryRepresentation(v45);
      v25 = (ft *)VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x263F1E9D8], v27);
      int v26 = (int)v25;
      if (v27) {
        CFRelease(v27);
      }
    }
    if (v26)
    {
      v23 = ft::GetOsLog(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[FTVTScaler initWithCommandQueue:]();
      }
    }
    else
    {
      v28 = (ft *)VTPixelTransferSessionTransferImage(self->_transferSession, a3, a4);
      if (v28)
      {
        v23 = ft::GetOsLog(v28);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:]();
        }
      }
      else
      {
        if (!v7) {
          return 1;
        }
        PixelFormatType = (ft *)CVPixelBufferGetPixelFormatType(a4);
        if (PixelFormatType == 1111970369)
        {
          v32 = (void *)MEMORY[0x263F12A50];
          size_t v33 = CVPixelBufferGetWidth(a4);
          v23 = [v32 texture2DDescriptorWithPixelFormat:80 width:v33 height:CVPixelBufferGetHeight(a4) mipmapped:0];
          [v23 setUsage:1];
          v34 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v23 iosurface:CVPixelBufferGetIOSurface(a4) plane:0];
          v35 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
          [(MPSImageStatisticsMean *)self->_meanFilter encodeToCommandBuffer:v35 sourceTexture:v34 destinationTexture:self->_meanTexture];
          [v35 commit];
          [v35 waitUntilCompleted];
          meanTexture = self->_meanTexture;
          memset(v38, 0, sizeof(v38));
          int64x2_t v39 = vdupq_n_s64(1uLL);
          uint64_t v40 = 1;
          [(MTLTexture *)meanTexture getBytes:v7 bytesPerRow:4 fromRegion:v38 mipmapLevel:0];

          BOOL v29 = 1;
          goto LABEL_23;
        }
        v23 = ft::GetOsLog(PixelFormatType);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[FTVTScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:]();
        }
      }
    }
  }
  BOOL v29 = 0;
LABEL_23:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meanTexture, 0);
  objc_storeStrong((id *)&self->_meanFilter, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithCommandQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "FTVTScaler error: Failed to set kVTPixelTransferPropertyKey_ScalingMode to 'kVTScalingMode_CropSourceToCleanAperture'", v2, v3, v4, v5, v6);
}

- (void)initWithCommandQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "FTVTScaler error: Failed to set kVTPixelTransferPropertyKey_DestinationRectangle", v2, v3, v4, v5, v6);
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "FTVTScaler error: dstBuffer has unsupported pixelformat. Mean computation only supported for dstBuffer formats: 'kCVPixelFormatType_32BGRA'", v2, v3, v4, v5, v6);
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "FTVTScaler error: VTPixelTransferSessionTransferImage failed", v2, v3, v4, v5, v6);
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "FTVTScaler error: Failed to set kVTPixelTransferPropertyKey_SourceCropRectangle", v2, v3, v4, v5, v6);
}

@end
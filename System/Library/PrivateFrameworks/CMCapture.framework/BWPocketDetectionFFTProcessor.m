@interface BWPocketDetectionFFTProcessor
+ (int)prewarmShaders;
+ (void)initialize;
- (BWPocketDetectionFFTProcessor)initWithMetalCommandQueue:(id)a3;
- (int)_loadKernel:(id *)a3 name:(id)a4;
- (int)_processFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5;
- (int)_processMetalOptimizedFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5;
- (int)_setupPipelines;
- (int)allocateResources;
- (int)processFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5;
- (void)cleanupResources;
- (void)dealloc;
@end

@implementation BWPocketDetectionFFTProcessor

+ (void)initialize
{
}

- (BWPocketDetectionFFTProcessor)initWithMetalCommandQueue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWPocketDetectionFFTProcessor;
  v4 = [(BWPocketDetectionFFTProcessor *)&v8 init];
  v5 = v4;
  if (!a3) {
    goto LABEL_6;
  }
  if (v4)
  {
    v4->_metalCommandQueue = (MTLCommandQueue *)a3;
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F60]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), v5->_metalCommandQueue);
    v5->_metalContext = (FigMetalContext *)v6;
    if (v6)
    {
      v5->_useMetalForScalingAndResultAccumulation = 1;
      return v5;
    }
LABEL_6:
    FigDebugAssert3();

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  [(BWPocketDetectionFFTProcessor *)self cleanupResources];

  v3.receiver = self;
  v3.super_class = (Class)BWPocketDetectionFFTProcessor;
  [(BWPocketDetectionFFTProcessor *)&v3 dealloc];
}

- (int)allocateResources
{
  v18[1] = *MEMORY[0x1E4F143B8];
  self->_resourcesCleaned = 0;
  objc_super v3 = (CMIFFTTransform *)objc_msgSend(MEMORY[0x1E4F55EC8], "CMIFFT2DTransform:figMetalContext:width:height:layout:precision:", -[FigMetalContext device](self->_metalContext, "device"), 0, 1024, 1024, 0, 0);
  self->_fftTransform = v3;
  if (!v3) {
    goto LABEL_16;
  }
  v4 = v3;
  v5 = (MTLBuffer *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newBufferWithLength:options:", 0x800000, 0);
  self->_fftMetalBuffer = v5;
  if (!v5) {
    goto LABEL_16;
  }
  if (!self->_useMetalForScalingAndResultAccumulation)
  {
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v13 setWidth:1024];
    [(BWVideoFormatRequirements *)v13 setHeight:1024];
    [(BWVideoFormatRequirements *)v13 setSupportedPixelFormats:&unk_1EFB02960];
    v18[0] = v13;
    v14 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1]), 1, @"BWPocketDetectionNode", +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
    self->_fftBufferPool = v14;
    if (!v14)
    {
LABEL_16:
      FigDebugAssert3();
      return -1;
    }
    p_cropSession = &self->_cropSession;
    OSStatus v16 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], p_cropSession);
    if (v16)
    {
      OSStatus v12 = v16;
    }
    else
    {
      OSStatus v12 = VTSessionSetProperty(*p_cropSession, (CFStringRef)*MEMORY[0x1E4F45088], MEMORY[0x1E4F1CC38]);
      if (!v12) {
        return v12;
      }
    }
LABEL_18:
    FigDebugAssert3();
    return v12;
  }
  int v6 = [(BWPocketDetectionFFTProcessor *)self _setupPipelines];
  if (v6)
  {
    OSStatus v12 = v6;
    goto LABEL_18;
  }
  v7 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:2048 height:1024 mipmapped:0];
  [v7 setUsage:3];
  objc_super v8 = (MTLTexture *)[(MTLBuffer *)self->_fftMetalBuffer newTextureWithDescriptor:v7 offset:0 bytesPerRow:0x2000];
  self->_fftMetalTexture = v8;
  if (!v8) {
    goto LABEL_16;
  }
  v9 = (MTLBuffer *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newBufferWithLength:options:", 4096, 0);
  self->_fftResultAccumulationMetalBuffer = v9;
  if (!v9) {
    goto LABEL_16;
  }
  v10 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:64 height:16 mipmapped:0];
  [v10 setUsage:3];
  v11 = (MTLTexture *)[(MTLBuffer *)self->_fftResultAccumulationMetalBuffer newTextureWithDescriptor:v10 offset:0 bytesPerRow:256];
  OSStatus v12 = 0;
  self->_fftResultAccumulationMetalTexture = v11;
  if (!v11) {
    goto LABEL_16;
  }
  return v12;
}

- (void)cleanupResources
{
  if (!self->_resourcesCleaned)
  {

    self->_fftMetalBuffer = 0;
    if (self->_useMetalForScalingAndResultAccumulation)
    {

      self->_fftMetalTexture = 0;
      self->_fftResultAccumulationMetalBuffer = 0;
      p_fftResultAccumulationMetalTexture = &self->_fftResultAccumulationMetalTexture;
    }
    else
    {

      p_fftResultAccumulationMetalTexture = &self->_cropSession;
      cropSession = self->_cropSession;
      if (!cropSession)
      {
LABEL_8:
        self->_resourcesCleaned = 1;
        return;
      }
      VTPixelRotationSessionInvalidate(cropSession);
      if (*p_fftResultAccumulationMetalTexture) {
        CFRelease(*p_fftResultAccumulationMetalTexture);
      }
    }
    *p_fftResultAccumulationMetalTexture = 0;
    goto LABEL_8;
  }
}

+ (int)prewarmShaders
{
  v2 = (void *)[MEMORY[0x1E4F55F60] metalDevice];
  if (!v2)
  {
    FigDebugAssert3();
    objc_super v3 = 0;
LABEL_8:
    v5 = 0;
LABEL_10:
    int v6 = -1;
    goto LABEL_5;
  }
  objc_super v3 = (void *)[v2 newCommandQueue];
  if (!v3)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  v4 = [[BWPocketDetectionFFTProcessor alloc] initWithMetalCommandQueue:v3];
  v5 = v4;
  if (!v4)
  {
    FigDebugAssert3();
    goto LABEL_10;
  }
  [(BWPocketDetectionFFTProcessor *)v4 allocateResources];
  [(BWPocketDetectionFFTProcessor *)v5 cleanupResources];
  int v6 = 0;
LABEL_5:

  return v6;
}

- (int)processFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5
{
  if (self->_useMetalForScalingAndResultAccumulation) {
    -[BWPocketDetectionFFTProcessor _processMetalOptimizedFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](self, "_processMetalOptimizedFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  else {
    -[BWPocketDetectionFFTProcessor _processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](self, "_processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
  return 0;
}

- (int)_processMetalOptimizedFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v13 = -12780;
  uint64_t v14 = 10;
  if (PixelFormatType <= 796423727)
  {
    if (PixelFormatType > 758674991)
    {
      if (PixelFormatType > 792225327)
      {
        if (PixelFormatType == 792225328 || PixelFormatType == 792229424) {
          goto LABEL_36;
        }
        int v16 = 796419632;
      }
      else
      {
        if (PixelFormatType == 758674992) {
          goto LABEL_36;
        }
        if (PixelFormatType == 762865200) {
          goto LABEL_30;
        }
        int v16 = 762869296;
      }
      goto LABEL_29;
    }
    if (PixelFormatType <= 645424687)
    {
      if (PixelFormatType == 641230384) {
        goto LABEL_36;
      }
      int v15 = 641234480;
    }
    else
    {
      if (PixelFormatType == 645424688 || PixelFormatType == 645428784) {
        goto LABEL_30;
      }
      int v15 = 758670896;
    }
  }
  else
  {
    if (PixelFormatType <= 2016686639)
    {
      if (PixelFormatType <= 1278226487)
      {
        if (PixelFormatType != 796423728)
        {
          if (PixelFormatType == 875704422) {
            goto LABEL_36;
          }
          int v15 = 875704438;
          goto LABEL_33;
        }
LABEL_30:
        uint64_t v14 = 588;
        goto LABEL_36;
      }
      if (PixelFormatType == 1278226488) {
        goto LABEL_36;
      }
      if (PixelFormatType == 1882468912) {
        goto LABEL_30;
      }
      int v16 = 1885745712;
LABEL_29:
      if (PixelFormatType != v16) {
        return v13;
      }
      goto LABEL_30;
    }
    if (PixelFormatType > 2084075055)
    {
      if (PixelFormatType == 2084075056) {
        goto LABEL_36;
      }
      if (PixelFormatType == 2088265264) {
        goto LABEL_30;
      }
      int v16 = 2088269360;
      goto LABEL_29;
    }
    if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
    {
      uint64_t v14 = 20;
      goto LABEL_36;
    }
    int v15 = 2084070960;
  }
LABEL_33:
  if (PixelFormatType != v15) {
    return v13;
  }
LABEL_36:
  uint64_t v17 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:v14 usage:17 plane:0];
  fftMetalTexture = self->_fftMetalTexture;
  v19 = (void *)[(MTLCommandQueue *)self->_metalCommandQueue commandBuffer];
  if (v19)
  {
    v20 = v19;
    v21 = (void *)[v19 computeCommandEncoder];
    if (v21)
    {
      v22 = v21;
      [v21 setComputePipelineState:self->_computePipelines[0]];
      [v22 setTexture:v17 atIndex:0];
      [v22 setTexture:fftMetalTexture atIndex:1];
      if (height >= width) {
        double v23 = width;
      }
      else {
        double v23 = height;
      }
      int v24 = (int)v23;
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.double width = width;
      v47.size.double height = height;
      CGFloat MidX = CGRectGetMidX(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      double MidY = CGRectGetMidY(v48);
      if (v24 >= 0) {
        int v26 = v24;
      }
      else {
        int v26 = v24 + 1;
      }
      v27.f64[0] = MidX;
      v27.f64[1] = MidY;
      float32x2_t v45 = vcvt_f32_f64(vsubq_f64(v27, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(v26 >> 1)), 0)));
      float v44 = (float)v24 * 0.00097656;
      [v22 setBytes:&v45 length:8 atIndex:0];
      [v22 setBytes:&v44 length:4 atIndex:1];
      unint64_t v28 = [(MTLComputePipelineState *)self->_computePipelines[0] threadExecutionWidth];
      unint64_t v29 = [(MTLComputePipelineState *)self->_computePipelines[0] maxTotalThreadsPerThreadgroup];
      v43[0] = (v28 + 2047) / v28;
      v43[1] = (v29 / v28 + 1023) / (v29 / v28);
      v43[2] = 1;
      v42[0] = v28;
      v42[1] = v29 / v28;
      v42[2] = 1;
      [v22 dispatchThreadgroups:v43 threadsPerThreadgroup:v42];
      [v22 endEncoding];
      int v13 = [(CMIFFTTransform *)self->_fftTransform encodeToCommandBuffer:v20 inputBuffer:[(MTLTexture *)self->_fftMetalTexture buffer] direction:1];
      if (v13)
      {
        FigDebugAssert3();
      }
      else
      {
        v30 = (void *)[v20 computeCommandEncoder];
        [v30 setComputePipelineState:self->_computePipelines[1]];
        [v30 setTexture:self->_fftMetalTexture atIndex:0];
        [v30 setTexture:self->_fftResultAccumulationMetalTexture atIndex:1];
        int v41 = 1024;
        [v30 setBytes:&v41 length:4 atIndex:0];
        long long v39 = xmmword_1A5DBD1F0;
        uint64_t v40 = 1;
        int64x2_t v37 = vdupq_n_s64(0x20uLL);
        uint64_t v38 = 1;
        [v30 dispatchThreadgroups:&v39 threadsPerThreadgroup:&v37];
        [v30 endEncoding];
        [v20 commit];
        [v20 waitUntilCompleted];
        uint64_t v31 = objc_msgSend((id)-[MTLTexture buffer](self->_fftResultAccumulationMetalTexture, "buffer"), "contents");
        uint64_t v32 = 0;
        float v33 = 0.0;
        do
        {
          for (uint64_t i = 0; i != 256; i += 16)
            float v33 = (float)((float)((float)(v33 + COERCE_FLOAT(*(_OWORD *)(v31 + i)))
                                + COERCE_FLOAT(HIDWORD(*(void *)(v31 + i))))
                        + COERCE_FLOAT(*(void *)(v31 + i + 8)))
                + COERCE_FLOAT(HIDWORD(*(_OWORD *)(v31 + i)));
          ++v32;
          v31 += 256;
        }
        while (v32 != 16);
        *a5 = v33;
      }
      return v13;
    }
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_processFFTOnInputPixelBuffer:(__CVBuffer *)a3 usingSourceRect:(CGRect)a4 cumulativeScoreOut:(float *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11 = [(BWPixelBufferPool *)self->_fftBufferPool newPixelBuffer];
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRectGetMidX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRectGetMidY(v35);
  CVPixelBufferGetWidth(v11);
  CVPixelBufferGetHeight(v11);
  int v12 = VTPixelRotationSessionRotateSubImage();
  if (v12)
  {
    int v24 = v12;
LABEL_21:
    FigDebugAssert3();
    goto LABEL_17;
  }
  uint64_t v13 = [(MTLCommandQueue *)self->_metalCommandQueue commandBuffer];
  if (!v13)
  {
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_17;
  }
  uint64_t v14 = (void *)v13;
  CVReturn v15 = CVPixelBufferLockBaseAddress(v11, 1uLL);
  if (v15)
  {
    int v24 = v15;
    goto LABEL_21;
  }
  uint64_t v16 = [(MTLBuffer *)self->_fftMetalBuffer contents];
  BaseAddress = CVPixelBufferGetBaseAddress(v11);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v11);
  uint64_t v20 = 0;
  v21 = (float *)(v16 + 4);
  do
  {
    uint64_t v22 = 0;
    double v23 = v21;
    do
    {
      LOBYTE(v19) = BaseAddress[v22];
      float v19 = (float)LODWORD(v19) / 255.0;
      *(v23 - 1) = v19;
      *double v23 = 0.0;
      v23 += 2;
      ++v22;
    }
    while (v22 != 1024);
    ++v20;
    BaseAddress += BytesPerRow;
    v21 += 2048;
  }
  while (v20 != 1024);
  CVPixelBufferUnlockBaseAddress(v11, 1uLL);
  int v24 = [(CMIFFTTransform *)self->_fftTransform encodeToCommandBuffer:v14 inputBuffer:self->_fftMetalBuffer direction:1];
  if (v24) {
    goto LABEL_21;
  }
  [v14 commit];
  [v14 waitUntilCompleted];
  uint64_t v25 = 0;
  int v26 = (float *)(v16 + 8188);
  float64x2_t v27 = (float *)(v16 + 4);
  float v28 = 0.0;
  do
  {
    uint64_t v29 = 0;
    v30 = v27;
    uint64_t v31 = v26;
    do
    {
      if (v25 >= v29) {
        int v32 = v29;
      }
      else {
        int v32 = v25;
      }
      float v28 = (float)(v28
                  + (float)((float)((float)(*v30 * *v30) + (float)(*(v30 - 1) * *(v30 - 1)))
                          * (float)((float)v32 * 0.0019531)))
          + (float)((float)((float)(*(v31 - 1) * *(v31 - 1)) + (float)(*v31 * *v31)) * (float)((float)v32 * 0.0019531));
      ++v29;
      v31 -= 2;
      v30 += 2;
    }
    while (v29 != 512);
    ++v25;
    v26 += 2048;
    v27 += 2048;
  }
  while (v25 != 512);
  *a5 = v28;
LABEL_17:
  CVPixelBufferRelease(v11);
  return v24;
}

- (int)_setupPipelines
{
  uint64_t v3 = 0;
  computePipelines = self->_computePipelines;
  for (char i = 1; ; char i = 0)
  {
    char v6 = i;
    int v7 = -[BWPocketDetectionFFTProcessor _loadKernel:name:](self, "_loadKernel:name:", &computePipelines[v3], (id)[[NSString alloc] initWithUTF8String:kKernelNames[v3]]);
    if (v7) {
      break;
    }
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      return v7;
    }
  }
  FigDebugAssert3();
  return v7;
}

- (int)_loadKernel:(id *)a3 name:(id)a4
{
  id v6 = (id)objc_msgSend((id)-[FigMetalContext library](self->_metalContext, "library"), "newFunctionWithName:", a4);
  if (v6
    && (uint64_t v7 = objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newComputePipelineStateWithFunction:error:", v6, 0)) != 0)
  {
    objc_super v8 = (void *)v7;
    int result = 0;
    *a3 = v8;
  }
  else
  {
    FigDebugAssert3();
    return -1;
  }
  return result;
}

@end
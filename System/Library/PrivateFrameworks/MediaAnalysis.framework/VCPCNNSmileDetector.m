@interface VCPCNNSmileDetector
+ (id)detector;
- (float)getInputBuffer;
- (int)computeSmileScore:(float *)a3;
- (int)detectSmileForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 smile:(BOOL *)a5;
@end

@implementation VCPCNNSmileDetector

+ (id)detector
{
  {
    +[VCPCNNSmileDetector detector]::analyzerClass = objc_opt_class();
  }
  if (+[VCPCNNSmileDetector detector]::once != -1) {
    dispatch_once(&+[VCPCNNSmileDetector detector]::once, &__block_literal_global_13);
  }
  id v2 = objc_alloc_init((Class)+[VCPCNNSmileDetector detector]::analyzerClass);
  return v2;
}

uint64_t __31__VCPCNNSmileDetector_detector__block_invoke()
{
  uint64_t result = DeviceHasANE();
  if (result)
  {
    uint64_t result = objc_opt_class();
    +[VCPCNNSmileDetector detector]::analyzerClass = result;
  }
  return result;
}

- (float)getInputBuffer
{
  return 0;
}

- (int)computeSmileScore:(float *)a3
{
  return -4;
}

- (int)detectSmileForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 smile:(BOOL *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  float v46 = 0.0;
  int v12 = CVPixelBufferGetWidth(a4);
  int v13 = CVPixelBufferGetHeight(a4);
  float v14 = (float)(v12 - 1);
  float v15 = x;
  if (v15 < v14) {
    float v14 = x;
  }
  if (v15 <= 0.0) {
    float v16 = 0.0;
  }
  else {
    float v16 = v14;
  }
  float v17 = (float)(v13 - 1);
  float v18 = y;
  if (v18 < v17) {
    float v17 = y;
  }
  if (v18 <= 0.0) {
    float v19 = 0.0;
  }
  else {
    float v19 = v17;
  }
  float v20 = width;
  if ((float)((float)v12 - v16) > v20) {
    float v21 = v20;
  }
  else {
    float v21 = (float)v12 - v16;
  }
  float v22 = height;
  if ((float)((float)v13 - v19) > v22) {
    float v23 = v22;
  }
  else {
    float v23 = (float)v13 - v19;
  }
  CVPixelBufferRef pixelBuffer = a4;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a4)
  {
    CVReturn v24 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    int v43 = v24;
    if (v24)
    {
      int v25 = v24;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
      }
    }
    else
    {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      v36 = [(VCPCNNSmileDetector *)self getInputBuffer];
      int v37 = 0;
      float v38 = v21 / 40.0;
      float v39 = v23 / 40.0;
      HIDWORD(v40) = 0;
      if (v20 <= 0.0) {
        float v38 = 0.0;
      }
      if (v22 <= 0.0) {
        float v39 = 0.0;
      }
      do
      {
        for (uint64_t i = 0; i != 40; ++i)
        {
          *(float *)&double v40 = v38 * (float)(int)i;
          LOBYTE(v40) = BaseAddressOfPlane[BytesPerRowOfPlane * (int)v19
                                         + (int)v16
                                         + BytesPerRowOfPlane * (int)(float)(v39 * (float)v37)
                                         + (int)*(float *)&v40];
          double v40 = ((double)*(unint64_t *)&v40 / 255.0 + -0.574000001) / 0.166999996;
          *(float *)&double v40 = v40;
          v36[i] = *(float *)&v40;
        }
        ++v37;
        v36 += 40;
      }
      while (v37 != 40);
      int v25 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v43);
      if (!v25)
      {
        int v25 = [(VCPCNNSmileDetector *)self computeSmileScore:&v46];
        if (!v25) {
          *a5 = v46 > 0.5;
        }
      }
    }
  }
  else
  {
    BOOL v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v26) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
    int v25 = -50;
    int v43 = -50;
  }
  if (pixelBuffer
    && !v43
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
  }
  return v25;
}

- (void)detectSmileForFace:inBuffer:smile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBEDA000, MEMORY[0x1E4F14500], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
}

@end
@interface VCPCNNPoseEstimator
+ (id)estimator;
- (float)getInputBuffer;
- (int)computePoseScore:(float *)a3;
- (int)detectPoseForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 yaw:(int64_t *)a5;
@end

@implementation VCPCNNPoseEstimator

+ (id)estimator
{
  {
    +[VCPCNNPoseEstimator estimator]::analyzerClass = objc_opt_class();
  }
  if (+[VCPCNNPoseEstimator estimator]::once != -1) {
    dispatch_once(&+[VCPCNNPoseEstimator estimator]::once, &__block_literal_global_53);
  }
  id v2 = objc_alloc_init((Class)+[VCPCNNPoseEstimator estimator]::analyzerClass);
  return v2;
}

uint64_t __32__VCPCNNPoseEstimator_estimator__block_invoke()
{
  uint64_t result = DeviceHasANE();
  if (result)
  {
    uint64_t result = objc_opt_class();
    +[VCPCNNPoseEstimator estimator]::analyzerClass = result;
  }
  return result;
}

- (float)getInputBuffer
{
  return 0;
}

- (int)computePoseScore:(float *)a3
{
  return -4;
}

- (int)detectPoseForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 yaw:(int64_t *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int v12 = CVPixelBufferGetWidth(a4);
  int v13 = CVPixelBufferGetHeight(a4);
  float v14 = (float)(v12 - 1);
  float v15 = x;
  if (v15 < v14) {
    float v14 = x;
  }
  float v16 = (float)(v13 - 1);
  if (v15 <= 0.0) {
    float v17 = 0.0;
  }
  else {
    float v17 = v14;
  }
  float v18 = y;
  if (v18 < v16) {
    float v16 = y;
  }
  if (v18 <= 0.0) {
    float v19 = 0.0;
  }
  else {
    float v19 = v16;
  }
  float v20 = width;
  if ((float)((float)v12 - v17) > v20) {
    float v21 = v20;
  }
  else {
    float v21 = (float)v12 - v17;
  }
  float v22 = height;
  if ((float)((float)v13 - v19) > v22) {
    float v23 = v22;
  }
  else {
    float v23 = (float)v13 - v19;
  }
  v50[0] = 0;
  v50[1] = 0;
  int v51 = 0;
  CVPixelBufferRef pixelBuffer = a4;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a4)
  {
    CVReturn v24 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    int v47 = v24;
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
      v36 = [(VCPCNNPoseEstimator *)self getInputBuffer];
      int v37 = 0;
      if (v20 <= 0.0) {
        float v38 = 0.0;
      }
      else {
        float v38 = v21 / 40.0;
      }
      if (v22 <= 0.0) {
        float v39 = 0.0;
      }
      else {
        float v39 = v23 / 40.0;
      }
      do
      {
        for (uint64_t i = 0; i != 40; ++i)
        {
          *(float *)&unsigned int v41 = v38 * (float)(int)i;
          LOBYTE(v41) = BaseAddressOfPlane[BytesPerRowOfPlane * (int)v19
                                         + (int)v17
                                         + BytesPerRowOfPlane * (int)(float)(v39 * (float)v37)
                                         + (int)*(float *)&v41];
          v36[i] = (float)v41;
        }
        ++v37;
        v36 += 40;
      }
      while (v37 != 40);
      int v25 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v47);
      if (!v25)
      {
        int v25 = [(VCPCNNPoseEstimator *)self computePoseScore:v50];
        if (!v25)
        {
          int v42 = 0;
          float v43 = *(float *)v50;
          for (uint64_t j = 1; j != 5; ++j)
          {
            if (*((float *)v50 + j) > v43)
            {
              int v42 = j;
              float v43 = *((float *)v50 + j);
            }
          }
          int v25 = 0;
          *a5 = v42;
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
    int v47 = -50;
  }
  if (pixelBuffer) {
    BOOL v45 = v47 == 0;
  }
  else {
    BOOL v45 = 0;
  }
  if (v45
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
  }
  return v25;
}

@end
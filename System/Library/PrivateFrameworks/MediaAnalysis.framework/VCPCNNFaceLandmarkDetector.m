@interface VCPCNNFaceLandmarkDetector
+ (id)detector;
- (float)getInputBuffer;
- (id)landmarks;
- (int)analyzeFrame:(__CVBuffer *)a3 withFaceBounds:(CGRect)a4;
- (int)computeLandmarks:(float *)a3;
@end

@implementation VCPCNNFaceLandmarkDetector

+ (id)detector
{
  {
    +[VCPCNNFaceLandmarkDetector detector]::analyzerClass = objc_opt_class();
  }
  if (+[VCPCNNFaceLandmarkDetector detector]::once != -1) {
    dispatch_once(&+[VCPCNNFaceLandmarkDetector detector]::once, &__block_literal_global_50);
  }
  id v2 = objc_alloc_init((Class)+[VCPCNNFaceLandmarkDetector detector]::analyzerClass);
  return v2;
}

uint64_t __38__VCPCNNFaceLandmarkDetector_detector__block_invoke()
{
  uint64_t result = DeviceHasANE();
  if (result)
  {
    uint64_t result = objc_opt_class();
    +[VCPCNNFaceLandmarkDetector detector]::analyzerClass = result;
  }
  return result;
}

- (float)getInputBuffer
{
  return 0;
}

- (int)computeLandmarks:(float *)a3
{
  return -4;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withFaceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_landmarks removeAllObjects];
  int v10 = CVPixelBufferGetWidth(a3);
  int v11 = CVPixelBufferGetHeight(a3);
  float v12 = (float)(v10 - 1);
  double v60 = width;
  double v61 = x;
  float v13 = x;
  if (v13 < v12) {
    float v12 = x;
  }
  if (v13 <= 0.0) {
    float v14 = 0.0;
  }
  else {
    float v14 = v12;
  }
  float v15 = (float)(v11 - 1);
  double v58 = y;
  double v59 = height;
  float v16 = y;
  if (v16 < v15) {
    float v15 = y;
  }
  if (v16 <= 0.0) {
    float v17 = 0.0;
  }
  else {
    float v17 = v15;
  }
  float v18 = (float)v10;
  float v19 = width;
  if ((float)((float)v10 - v14) > v19) {
    float v20 = width;
  }
  else {
    float v20 = (float)v10 - v14;
  }
  float v21 = (float)v11;
  float v22 = height;
  uint64_t v67 = 0;
  memset(&v66[1], 0, 32);
  if ((float)((float)v11 - v17) > v22) {
    float v23 = height;
  }
  else {
    float v23 = (float)v11 - v17;
  }
  v66[0] = 0uLL;
  int v62 = 0;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v24 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    int v62 = v24;
    if (!v24
      || (int v25 = v24, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v69 = a3,
          __int16 v70 = 1024,
          int v71 = v25,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v25 = v62) == 0))
    {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v28 = [(VCPCNNFaceLandmarkDetector *)self getInputBuffer];
      int v29 = 0;
      float v30 = v19 <= 0.0 ? 0.0 : v20 / 40.0;
      float v31 = v22 <= 0.0 ? 0.0 : v23 / 40.0;
      do
      {
        for (uint64_t i = 0; i != 40; ++i)
        {
          *(float *)&unsigned int v33 = v30 * (float)(int)i;
          LOBYTE(v33) = BaseAddressOfPlane[BytesPerRowOfPlane * (int)v17
                                         + (int)v14
                                         + BytesPerRowOfPlane * (int)(float)(v31 * (float)v29)
                                         + (int)*(float *)&v33];
          v28[i] = (float)v33;
        }
        ++v29;
        v28 += 40;
      }
      while (v29 != 40);
      int v25 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v62);
      if (!v25)
      {
        int v25 = [(VCPCNNFaceLandmarkDetector *)self computeLandmarks:v66];
        if (!v25)
        {
          v34 = [MEMORY[0x1E4F1CA48] array];
          landmarks = self->_landmarks;
          self->_landmarks = v34;

          uint64_t v36 = 0;
          double v37 = v58 / v21;
          double v38 = v59 / v21;
          v39 = (float *)v66 + 1;
          do
          {
            float v41 = *(v39 - 1);
            float v40 = *v39;
            v42 = self->_landmarks;
            v43 = objc_msgSend(NSNumber, "numberWithInt:", LandmarkIndex[v36], *(void *)&v58, *(void *)&v59);
            double v44 = v61 / v18 + v41 * (v60 / v18);
            *(float *)&double v44 = v44;
            v65[0] = v43;
            v45 = [NSNumber numberWithFloat:v44];
            double v46 = v37 + v40 * v38;
            *(float *)&double v46 = v46;
            v65[1] = v45;
            *(float *)&double v46 = 1.0 - *(float *)&v46;
            v47 = [NSNumber numberWithFloat:v46];
            v65[2] = v47;
            v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
            [(NSMutableArray *)v42 addObject:v48];

            ++v36;
            v39 += 2;
          }
          while (v36 != 7);
          int v25 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v49 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v49) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v49, v50, v51, v52, v53, v54, v55, v56);
    }
    int v25 = -50;
    int v62 = -50;
  }
  if (pixelBuffer
    && !v62
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }
  return v25;
}

- (id)landmarks
{
  return self->_landmarks;
}

- (void).cxx_destruct
{
}

@end
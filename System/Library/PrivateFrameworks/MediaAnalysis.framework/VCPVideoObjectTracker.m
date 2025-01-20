@interface VCPVideoObjectTracker
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start;
- (CGRect)objectBounds;
- (CGRect)objectBoundsInitial;
- (VCPVideoObjectTracker)initWithObjectBounds:(CGRect)a3 inFrame:(__CVBuffer *)a4 timestamp:(id *)a5;
- (float)confidence;
- (int)lostCount;
- (int)trackObjectInFrame:(__CVBuffer *)a3;
@end

@implementation VCPVideoObjectTracker

- (VCPVideoObjectTracker)initWithObjectBounds:(CGRect)a3 inFrame:(__CVBuffer *)a4 timestamp:(id *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v57[8] = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)VCPVideoObjectTracker;
  v11 = [(VCPVideoObjectTracker *)&v56 init];
  if (!v11) {
    goto LABEL_43;
  }
  v12 = objc_alloc_init(VCPCtrTracker);
  v13 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v12;

  if (*((void *)v11 + 1))
  {
    int v14 = CVPixelBufferGetWidth(a4);
    int v15 = CVPixelBufferGetHeight(a4);
    float v16 = x;
    float v17 = y;
    float v18 = width;
    float v19 = height;
    *((double *)v11 + 10) = v16;
    *((double *)v11 + 11) = v17;
    *((double *)v11 + 12) = v18;
    *((double *)v11 + 13) = v19;
    long long v20 = *((_OWORD *)v11 + 6);
    *((_OWORD *)v11 + 3) = *((_OWORD *)v11 + 5);
    *((_OWORD *)v11 + 4) = v20;
    *((_DWORD *)v11 + 5) = 0;
    float v21 = (float)v14 + -1.0;
    if (v21 > v16) {
      float v22 = x;
    }
    else {
      float v22 = (float)v14 + -1.0;
    }
    if (v16 <= 0.0) {
      float v22 = 0.0;
    }
    double v23 = v22;
    float v24 = (float)v15 + -1.0;
    if (v24 > v17) {
      float v25 = y;
    }
    else {
      float v25 = (float)v15 + -1.0;
    }
    if (v17 <= 0.0) {
      float v25 = 0.0;
    }
    double v26 = v25;
    *(double *)v57 = v23;
    *(double *)&v57[1] = v26;
    float v27 = v16 + v18;
    if (v27 < v21) {
      float v28 = v27;
    }
    else {
      float v28 = (float)v14 + -1.0;
    }
    if (v27 <= 0.0) {
      float v29 = 0.0;
    }
    else {
      float v29 = v28;
    }
    double v30 = v29;
    *(double *)&v57[2] = v30;
    *(double *)&v57[3] = v26;
    float v31 = v17 + v19;
    if (v31 < v24) {
      float v32 = v31;
    }
    else {
      float v32 = (float)v15 + -1.0;
    }
    if (v31 <= 0.0) {
      float v33 = 0.0;
    }
    else {
      float v33 = v32;
    }
    *(double *)&v57[6] = v23;
    *(double *)&v57[7] = v33;
    *(double *)&v57[4] = v30;
    *(double *)&v57[5] = v33;
    CVPixelBufferRef pixelBuffer = a4;
    CVPixelBufferLockFlags unlockFlags = 1;
    if (a4)
    {
      uint64_t v34 = CVPixelBufferLockBaseAddress(a4, 1uLL);
      int v53 = v34;
      if (v34)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[VCPImageConverter convertImage:yuvFrame:]((uint64_t)a4, v34, v35, v36, v37, v38, v39, v40);
        }
        else {
          LODWORD(v34) = -50;
        }
      }
      else
      {
        [*((id *)v11 + 1) setupTrackerWithReferenceFrame:a4 withROI:v57];
        LODWORD(v34) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v53);
        if (!v34)
        {
          long long v50 = *(_OWORD *)&a5->var0;
          *((void *)v11 + 5) = a5->var3;
          *(_OWORD *)(v11 + 24) = v50;
        }
      }
    }
    else
    {
      BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v42) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v42, v43, v44, v45, v46, v47, v48, v49);
      }
      LODWORD(v34) = -50;
      int v53 = -50;
    }
    if (pixelBuffer
      && !v53
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
    if (v34)
    {
      v51 = 0;
LABEL_44:
      v41 = v51;
      goto LABEL_45;
    }
LABEL_43:
    v51 = v11;
    goto LABEL_44;
  }
  v41 = 0;
LABEL_45:

  return v41;
}

- (int)trackObjectInFrame:(__CVBuffer *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v35 = 0;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v5 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    int v35 = v5;
    if (!v5
      || (int v6 = v5, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          uint64_t v39 = a3,
          __int16 v40 = 1024,
          int v41 = v6,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v6 = v35) == 0))
    {
      [(VCPCtrTracker *)self->_correlationTracker trackInFrame:a3];
      int v6 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v35);
      if (!v6)
      {
        if ([(VCPCtrTracker *)self->_correlationTracker lostTrackInd])
        {
          CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
          self->_objectBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
          self->_objectBounds.size = v7;
        }
        else
        {
          size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
          size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
          float v19 = [(VCPCtrTracker *)self->_correlationTracker box];
          double x = (float)((float)WidthOfPlane + -1.0);
          if (v19->x < x) {
            double x = v19->x;
          }
          if (v19->x <= 0.0) {
            double x = 0.0;
          }
          self->_objectBounds.origin.double x = x;
          float v21 = [(VCPCtrTracker *)self->_correlationTracker box];
          double v22 = (float)((float)HeightOfPlane + -1.0);
          double y = v21->y;
          if (y < v22) {
            double v22 = v21->y;
          }
          if (y <= 0.0) {
            double v22 = 0.0;
          }
          self->_objectBounds.origin.double y = v22;
          double v24 = (double)[(VCPCtrTracker *)self->_correlationTracker box][32];
          double v25 = v24 - *(double *)[(VCPCtrTracker *)self->_correlationTracker box];
          double v26 = self->_objectBounds.origin.x;
          if ((double)WidthOfPlane - v26 < v25) {
            double v25 = (double)WidthOfPlane - v26;
          }
          self->_objectBounds.size.double width = v25;
          double v27 = (double)[(VCPCtrTracker *)self->_correlationTracker box][40];
          double v28 = v27 - (double)[(VCPCtrTracker *)self->_correlationTracker box][8];
          double v29 = self->_objectBounds.origin.y;
          if ((double)HeightOfPlane - v29 < v28) {
            double v28 = (double)HeightOfPlane - v29;
          }
          self->_objectBounds.size.double height = v28;
        }
        [(VCPCtrTracker *)self->_correlationTracker confidence];
        float v31 = v30 / 50.0;
        float v32 = 1.0;
        if (v31 < 1.0) {
          float v32 = v31;
        }
        BOOL v33 = v31 > 0.0;
        float v34 = 0.0;
        if (v33) {
          float v34 = v32;
        }
        self->_confidence = v34;
        int v6 = 0;
        if (v34 >= 0.2) {
          self->_lostCount = 0;
        }
        else {
          ++self->_lostCount;
        }
      }
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    int v6 = -50;
    int v35 = -50;
  }
  if (pixelBuffer
    && !v35
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
  }
  return v6;
}

- (CGRect)objectBoundsInitial
{
  double x = self->_objectBoundsInitial.origin.x;
  double y = self->_objectBoundsInitial.origin.y;
  double width = self->_objectBoundsInitial.size.width;
  double height = self->_objectBoundsInitial.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)objectBounds
{
  double x = self->_objectBounds.origin.x;
  double y = self->_objectBounds.origin.y;
  double width = self->_objectBounds.size.width;
  double height = self->_objectBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (int)lostCount
{
  return self->_lostCount;
}

- (void).cxx_destruct
{
}

@end
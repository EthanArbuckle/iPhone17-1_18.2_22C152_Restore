@interface FigCaptureImageMotionDetector
- ($5D018791884760D46230C39DEE7E58E3)motionStatistics;
- (FigCaptureImageMotionDetector)init;
- (FigCaptureImageMotionDetector)initWithWidth:(int)a3 height:(int)a4;
- (FigCaptureImageMotionDetector)initWithWidth:(int)a3 height:(int)a4 maximumSearchRange:(int)a5 frameRingSize:(int)a6;
- (float)stationaryThreshold;
- (int)maximumSearchRange;
- (int)processPixelBuffer:(__CVBuffer *)a3;
- (int)setCentralROIAndGetRect:(CGRect *)a3;
- (int)setRoi:(CGRect)a3 actualROI:(CGRect *)a4;
- (uint64_t)_allocateArrays:(int)a3 height:(size_t)count frameRingSize:;
- (uint64_t)_computeStatistics;
- (uint64_t)processPixelBuffer:(void *)a3 metadataDictionary:;
- (void)_freeAllocatedArrays;
- (void)dealloc;
- (void)resetProcessingState;
- (void)setStationaryThreshold:(float)a3;
@end

@implementation FigCaptureImageMotionDetector

- (FigCaptureImageMotionDetector)init
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureImageMotionDetector;
  v2 = [(FigCaptureImageMotionDetector *)&v6 init];
  v3 = (FigCaptureImageMotionDetector *)v2;
  if (v2)
  {
    *((void *)v2 + 5) = 0;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *((_OWORD *)v2 + 4) = 0u;
    *((_OWORD *)v2 + 5) = 0u;
    *((void *)v2 + 12) = 0;
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *((_OWORD *)v2 + 7) = *MEMORY[0x1E4F1DB28];
    *((_OWORD *)v2 + 8) = v4;
    *((void *)v2 + 18) = 1065017672;
    [v2 resetProcessingState];
  }
  return v3;
}

- (FigCaptureImageMotionDetector)initWithWidth:(int)a3 height:(int)a4
{
  return -[FigCaptureImageMotionDetector initWithWidth:height:maximumSearchRange:frameRingSize:](self, "initWithWidth:height:maximumSearchRange:frameRingSize:");
}

- (FigCaptureImageMotionDetector)initWithWidth:(int)a3 height:(int)a4 maximumSearchRange:(int)a5 frameRingSize:(int)a6
{
  objc_super v6 = self;
  if (a3 < 2
    || a4 <= 1
    || a5 < 0
    || (v9 = *(void *)&a6, v11 = [(FigCaptureImageMotionDetector *)self init], (objc_super v6 = v11) != 0)
    && ((v11->_width = a3,
         v11->_height = a4,
         v11->_maximumSearchRange = a5,
         -[FigCaptureImageMotionDetector _allocateArrays:height:frameRingSize:]((uint64_t)v11, a3, a4, v9))
     || [(FigCaptureImageMotionDetector *)v6 setCentralROIAndGetRect:0]))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
  }
  else
  {
    objc_super v6 = v6;
    v12 = v6;
  }

  return v12;
}

- (uint64_t)_allocateArrays:(int)a3 height:(size_t)count frameRingSize:
{
  if (result)
  {
    uint64_t v6 = result;
    *(_DWORD *)(result + 88) = 0;
    *(_DWORD *)(result + 92) = a3;
    *(_DWORD *)(result + 96) = 0;
    *(_DWORD *)(result + 100) = a2;
    *(_DWORD *)(result + 56) = count;
    v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
    *(void *)(v6 + 32) = v7;
    if (!v7) {
      goto LABEL_19;
    }
    v8 = malloc_type_calloc(*(unsigned int *)(v6 + 56), 8uLL, 0x80040B8603338uLL);
    *(void *)(v6 + 40) = v8;
    if (!v8) {
      goto LABEL_19;
    }
    int v9 = 8 * a3;
    int v10 = 8 * a2;
    if (*(_DWORD *)(v6 + 56))
    {
      uint64_t v11 = 0;
      do
      {
        *(void *)(*(void *)(v6 + 32) + 8 * v11) = malloc_type_malloc(v9, 0x214B32CAuLL);
        if (!*(void *)(*(void *)(v6 + 32) + 8 * v11)) {
          goto LABEL_19;
        }
        *(void *)(*(void *)(v6 + 40) + 8 * v11) = malloc_type_malloc(v10, 0x24D2D518uLL);
        if (!*(void *)(*(void *)(v6 + 40) + 8 * v11)) {
          goto LABEL_19;
        }
      }
      while (++v11 < (unint64_t)*(unsigned int *)(v6 + 56));
    }
    int v12 = v10 <= v9 ? 8 * a3 : 8 * a2;
    size_t v13 = v12;
    *(void *)(v6 + 64) = malloc_type_malloc(v12, 0xB32DF264uLL);
    v14 = malloc_type_malloc(v13, 0xC59264B1uLL);
    *(void *)(v6 + 72) = v14;
    if (!*(void *)(v6 + 64)
      || !v14
      || (v15 = malloc_type_malloc((16 * *(_DWORD *)(v6 + 148)) | 8, 0xC7B020F8uLL), (*(void *)(v6 + 80) = v15) == 0)
      || (int v16 = 4 * *(_DWORD *)(v6 + 100),
          *(void *)(v6 + 16) = malloc_type_malloc(4 * *(_DWORD *)(v6 + 92), 0xAA9D45CFuLL),
          v17 = malloc_type_malloc(v16, 0x1BE9BD36uLL),
          *(void *)(v6 + 24) = v17,
          !*(void *)(v6 + 16))
      || !v17)
    {
LABEL_19:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294954510;
    }
    return 0;
  }
  return result;
}

- (int)setRoi:(CGRect)a3 actualROI:(CGRect *)a4
{
  if (self->_imgProj.count) {
    goto LABEL_25;
  }
  double v6 = pixelSumComputeCompatibleROI(self->_width, a3.origin.x);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  pixelSumComputeCompatibleROI(self->_width, 0.0);
  int v15 = (2 * self->_maximumSearchRange) | 1;
  if (v15 < (int)v12)
  {
    if (v15 < (int)v10) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  int v16 = (v15 + (int)v14 - 1) / (int)v14 * (int)v14;
  if (v16 >= 0) {
    int v17 = (v15 + (int)v14 - 1) / (int)v14 * (int)v14;
  }
  else {
    int v17 = v16 + 1;
  }
  int v18 = ((int)(v8 + v12 * 0.5) - (v17 >> 1)) & ~(((int)(v8 + v12 * 0.5) - (v17 >> 1)) >> 31);
  if (v18 >= self->_height + ~v16) {
    int v18 = self->_height + ~v16;
  }
  double v8 = (double)v18;
  double v12 = (double)v16;
  if (v15 >= (int)v10)
  {
LABEL_12:
    int v20 = (int)v13;
    int v21 = (v15 + v20 - 1) / v20 * v20;
    if (v21 >= 0) {
      int v22 = v21;
    }
    else {
      int v22 = v21 + 1;
    }
    int v23 = ((int)(v6 + v10 * 0.5) - (v22 >> 1)) & ~(((int)(v6 + v10 * 0.5) - (v22 >> 1)) >> 31);
    int width = self->_width;
    if (v23 + v21 > width) {
      int v23 = (width + ~v21) / v20 * v20;
    }
    double v6 = (double)v23;
    double v10 = (double)v21;
    goto LABEL_18;
  }
  int width = self->_width;
LABEL_18:
  double v24 = pixelSumComputeCompatibleROI(width, v6);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.int width = v10;
  v32.size.height = v12;
  v33.origin.x = v24;
  v33.origin.y = v26;
  v33.size.int width = v28;
  v33.size.height = v30;
  if (!CGRectEqualToRect(v32, v33))
  {
LABEL_25:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12782;
  }
  int v15 = (2 * self->_maximumSearchRange) | 1;
  double v12 = v30;
  double v10 = v28;
  double v8 = v26;
  double v6 = v24;
LABEL_20:
  if (v15 >= (int)v12 || v15 >= (int)v10) {
    goto LABEL_25;
  }
  if (a4)
  {
    a4->origin.x = v6;
    a4->origin.y = v8;
    a4->size.int width = v10;
    a4->size.height = v12;
  }
  int result = 0;
  self->_sumROI.origin.x = v6;
  self->_sumROI.origin.y = v8;
  self->_sumROI.size.int width = v10;
  self->_sumROI.size.height = v12;
  self->_rowSumLength = (int)v12;
  self->_colSumLength = (int)v10;
  return result;
}

- (int)setCentralROIAndGetRect:(CGRect *)a3
{
  int v3 = [(FigCaptureImageMotionDetector *)self setRoi:a3 actualROI:pixelSumComputeCompatibleROI(self->_width, (float)((float)self->_width * 0.25))];
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

- (uint64_t)processPixelBuffer:(void *)a3 metadataDictionary:
{
  id v5 = a3;
  if (!a1)
  {
    uint64_t v31 = 0;
    goto LABEL_25;
  }
  int v35 = *(_DWORD *)(a1 + 52);
  if (a2)
  {
    int Width = CVPixelBufferGetWidth(a2);
    int Height = CVPixelBufferGetHeight(a2);
    if (*(_DWORD *)(a1 + 8) == Width && *(_DWORD *)(a1 + 12) == Height)
    {
      if (pixelSumForROI(a2, *(int32x4_t **)(a1 + 16), *(int32x4_t **)(a1 + 24), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136)))
      {
        double v8 = *(_DWORD **)(a1 + 24);
        if (v8)
        {
          double v9 = *(void **)(a1 + 16);
          if (v9)
          {
            uint64_t v10 = *(unsigned int *)(a1 + 88);
            if ((int)v10 > 0)
            {
              uint64_t v11 = *(unsigned int *)(a1 + 96);
              if ((int)v11 > 0)
              {
                double v13 = *(double *)(a1 + 112);
                double v12 = *(double *)(a1 + 120);
                uint64_t v14 = CVPixelBufferLockBaseAddress(a2, 1uLL);
                if (v14)
                {
                  uint64_t v31 = v14;
                  fig_log_get_emitter();
                  FigDebugAssert3();
                }
                else
                {
                  int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, 0);
                  int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, 0);
                  if ((int)v11 + (int)v13 > WidthOfPlane || (int)v10 + (int)v12 > HeightOfPlane)
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    uint64_t v31 = FigSignalErrorAt();
                  }
                  else
                  {
                    int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
                    CVPixelBufferRef pixelBuffer = a2;
                    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
                    id v19 = v5;
                    int v20 = BaseAddressOfPlane;
                    bzero(v8, 4 * v11);
                    bzero(v9, 4 * v10);
                    uint64_t v21 = 0;
                    int v22 = &v20[(int)v13 + BytesPerRowOfPlane * (uint64_t)(int)v12];
                    id v5 = v19;
                    int v23 = v22 + 3;
                    do
                    {
                      if (v11 >= 4)
                      {
                        unint64_t v24 = 0;
                        double v25 = v8 + 2;
                        do
                        {
                          int v26 = *((_DWORD *)v9 + v21) + v23[v24 - 3];
                          *((_DWORD *)v9 + v21) = v26;
                          int v27 = v26 + v23[v24 - 2];
                          *((_DWORD *)v9 + v21) = v27;
                          int v28 = v27 + v23[v24 - 1];
                          *((_DWORD *)v9 + v21) = v28;
                          *((_DWORD *)v9 + v21) = v28 + v23[v24];
                          int v29 = *(v25 - 1);
                          *(v25 - 2) += v23[v24 - 3];
                          *(v25 - 1) = v29 + v23[v24 - 2];
                          int v30 = v25[1];
                          *v25 += v23[v24 - 1];
                          v25[1] = v30 + v23[v24];
                          v24 += 4;
                          v25 += 4;
                        }
                        while (v24 < (v11 & 0xFFFFFFFC));
                      }
                      ++v21;
                      v23 += BytesPerRowOfPlane;
                    }
                    while (v21 != v10);
                    uint64_t v31 = 0;
                    a2 = pixelBuffer;
                  }
                  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
                  if (!v31) {
                    goto LABEL_20;
                  }
                }
LABEL_31:
                fig_log_get_emitter();
LABEL_34:
                FigDebugAssert3();
                goto LABEL_35;
              }
            }
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v31 = FigSignalErrorAt();
        if (v31) {
          goto LABEL_31;
        }
      }
LABEL_20:
      vDSP_vflt32D(*(const int **)(a1 + 16), 1, *(double **)(*(void *)(a1 + 32) + 8 * *(unsigned int *)(a1 + 48)), 1, *(int *)(a1 + 88));
      vDSP_vflt32D(*(const int **)(a1 + 24), 1, *(double **)(*(void *)(a1 + 40) + 8 * *(unsigned int *)(a1 + 48)), 1, *(int *)(a1 + 96));
      unsigned int v32 = *(_DWORD *)(a1 + 52);
      if (v32 < *(_DWORD *)(a1 + 56)) {
        *(_DWORD *)(a1 + 52) = ++v32;
      }
      if (v32 < 2) {
        goto LABEL_24;
      }
      uint64_t v33 = -[FigCaptureImageMotionDetector _computeStatistics](a1);
      if (!v33) {
        goto LABEL_24;
      }
      uint64_t v31 = v33;
      fig_log_get_emitter();
      goto LABEL_34;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  uint64_t v31 = FigSignalErrorAt();
  if (v31)
  {
LABEL_35:
    *(_DWORD *)(a1 + 52) = v35;
    *(unsigned char *)(a1 + 209) = 0;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v31 = 0;
  *(_DWORD *)(a1 + 48) = (*(_DWORD *)(a1 + 48) + 1) % *(_DWORD *)(a1 + 56);
LABEL_25:

  return v31;
}

- (uint64_t)_computeStatistics
{
  v62[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  unsigned int v2 = *(_DWORD *)(a1 + 52);
  if (v2 <= 1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v46 = 4294954514;
    goto LABEL_40;
  }
  uint64_t v3 = 0;
  uint64_t v4 = *(int *)(a1 + 48);
  signed int v5 = ((int)v4 + 1) % v2;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(v6 + 8 * v5);
  signed int v48 = v5;
  uint64_t v9 = *(void *)(v7 + 8 * v5);
  uint64_t v10 = *(void *)(v6 + 8 * v4);
  int v49 = *(_DWORD *)(a1 + 48);
  uint64_t v11 = *(void *)(v7 + 8 * v4);
  uint64_t v51 = a1 + 160;
  uint64_t v52 = a1 + 152;
  v62[0] = v8;
  v62[1] = v9;
  v61[0] = v10;
  v61[1] = v11;
  LODWORD(v11) = *(_DWORD *)(a1 + 88);
  v60[0] = *(_DWORD *)(a1 + 96);
  v60[1] = v11;
  unsigned int v12 = *(_DWORD *)(a1 + 148);
  uint64_t v13 = *(void *)(a1 + 80);
  char v14 = 1;
  while (1)
  {
    char v15 = v14;
    uint64_t v16 = v61[v3];
    uint64_t v17 = v62[v3];
    if (v16) {
      _ZF = v17 == 0;
    }
    else {
      _ZF = 1;
    }
    if (_ZF || (id v19 = *(double **)(v1 + 72)) == 0 || !v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v46 = 4294954516;
      goto LABEL_39;
    }
    if ((v12 & 0x80000000) == 0) {
      break;
    }
    int v21 = 0;
LABEL_33:
    char v14 = 0;
    float v33 = *(double *)(v13 + 8 * v21);
    *(float *)(v52 + 4 * v3) = v33;
    *(_DWORD *)(v51 + 4 * v3) = v21 - v12;
    uint64_t v3 = 1;
    if ((v15 & 1) == 0)
    {
      float v34 = *(float *)(v1 + 144);
      BOOL v35 = *(float *)(v1 + 152) < v34 || *(float *)(v1 + 156) < v34;
      uint64_t v46 = 0;
      long long v36 = *(_OWORD *)(v1 + 128);
      *(_OWORD *)(v1 + 176) = *(_OWORD *)(v1 + 112);
      *(_OWORD *)(v1 + 192) = v36;
      uint64_t v37 = *(void *)(v1 + 8);
      v38.i64[0] = (int)v37;
      v38.i64[1] = SHIDWORD(v37);
      float64x2_t v39 = vcvtq_f64_s64(v38);
      __asm { FMOV            V1.2D, #-1.0 }
      float64x2_t v43 = *(float64x2_t *)(v1 + 192);
      float64x2_t v44 = vdivq_f64(*(float64x2_t *)(v1 + 176), vaddq_f64(v39, _Q1));
      *(unsigned char *)(v1 + 208) = v35;
      unsigned int v45 = *(_DWORD *)(v1 + 52);
      *(float64x2_t *)(v1 + 176) = v44;
      *(float64x2_t *)(v1 + 192) = vdivq_f64(v43, v39);
      *(_DWORD *)(v1 + 168) = v45;
      *(_DWORD *)(v1 + 172) = (v49 - v48 + v45) % v45;
      goto LABEL_40;
    }
  }
  char v53 = v15;
  uint64_t v20 = 0;
  int v21 = 0;
  int v22 = *(double **)(v1 + 64);
  uint64_t v54 = v3;
  int v23 = (const double *)(v16 + 8 * v12 - 8 * (int)v12);
  double v24 = -100.0;
  vDSP_Length v25 = v60[v3] - 2 * v12;
  int v26 = (const double *)(v17 + 8 * v12);
  uint64_t v27 = -v12;
  uint64_t v28 = (2 * v12) | 1;
  while (1)
  {
    if (v27 + v20 < v27 || (int)v25 <= 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v31 = FigSignalErrorAt();
      double v29 = 0.0;
      if (v31)
      {
        uint64_t v46 = v31;
        goto LABEL_38;
      }
      goto LABEL_24;
    }
    if (v22)
    {
      double v58 = 0.0;
      double __Mean = 0.0;
      double v56 = 0.0;
      double __StandardDeviation = 0.0;
      vDSP_normalizeD(v23, 1, v22, 1, &__Mean, &__StandardDeviation, v25);
      vDSP_normalizeD(v26, 1, v19, 1, &v58, &v56, v25);
      double __C = 0.0;
      if (__StandardDeviation < 0.0000999999975 || v56 < 0.0000999999975)
      {
        if (v56 < 0.0000999999975 && __StandardDeviation < 0.0000999999975) {
          double v29 = 1.0;
        }
        else {
          double v29 = 0.0;
        }
      }
      else
      {
        vDSP_convD(v22, 1, v19, 1, &__C, 1, 1uLL, v25);
        double v29 = __C / (double)(int)v25;
      }
      goto LABEL_24;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v32 = FigSignalErrorAt();
    double v29 = 0.0;
    if (v32) {
      break;
    }
LABEL_24:
    *(double *)(v13 + 8 * v20) = v29;
    if (v29 > v24)
    {
      double v24 = v29;
      int v21 = v20;
    }
    ++v20;
    ++v23;
    if (v28 == v20)
    {
      uint64_t v1 = a1;
      uint64_t v13 = *(void *)(a1 + 80);
      unsigned int v12 = *(_DWORD *)(a1 + 148);
      uint64_t v3 = v54;
      char v15 = v53;
      goto LABEL_33;
    }
  }
  uint64_t v46 = v32;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_38:
  fig_log_get_emitter();
  FigDebugAssert3();
  uint64_t v1 = a1;
LABEL_39:
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_40:
  *(unsigned char *)(v1 + 209) = v46 == 0;
  return v46;
}

- (int)processPixelBuffer:(__CVBuffer *)a3
{
  return -[FigCaptureImageMotionDetector processPixelBuffer:metadataDictionary:]((uint64_t)self, a3, 0);
}

- (void)resetProcessingState
{
  *(void *)&self->_imgProj.curIdx = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)self->_motionStatistics.crossCorrelationMaximum = _D0;
  uint64_t v7 = MEMORY[0x1E4F1DB28];
  *(void *)self->_motionStatistics.maxCorrelationShift = 0;
  *(void *)&self->_motionStatistics.frameRingBufferCount = 0;
  CGSize v8 = *(CGSize *)(v7 + 16);
  self->_motionStatistics.roi.origin = *(CGPoint *)v7;
  self->_motionStatistics.roi.size = v8;
  *(_WORD *)&self->_motionStatistics.isMotionDetected = 0;
}

- (void)dealloc
{
  -[FigCaptureImageMotionDetector _freeAllocatedArrays]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureImageMotionDetector;
  [(FigCaptureImageMotionDetector *)&v3 dealloc];
}

- (void)_freeAllocatedArrays
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 56))
    {
      unint64_t v2 = 0;
      do
      {
        uint64_t v3 = *(void *)(a1 + 32);
        if (v3)
        {
          uint64_t v4 = *(void **)(v3 + 8 * v2);
          if (v4)
          {
            *(void *)(v3 + 8 * v2) = 0;
            free(v4);
          }
        }
        uint64_t v5 = *(void *)(a1 + 40);
        if (v5)
        {
          uint64_t v6 = *(void **)(v5 + 8 * v2);
          if (v6)
          {
            *(void *)(v5 + 8 * v2) = 0;
            free(v6);
          }
        }
        ++v2;
      }
      while (v2 < *(unsigned int *)(a1 + 56));
    }
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7)
    {
      *(void *)(a1 + 32) = 0;
      free(v7);
    }
    CGSize v8 = *(void **)(a1 + 40);
    if (v8)
    {
      *(void *)(a1 + 40) = 0;
      free(v8);
    }
    uint64_t v9 = *(void **)(a1 + 16);
    if (v9)
    {
      *(void *)(a1 + 16) = 0;
      free(v9);
    }
    uint64_t v10 = *(void **)(a1 + 24);
    if (v10)
    {
      *(void *)(a1 + 24) = 0;
      free(v10);
    }
    uint64_t v11 = *(void **)(a1 + 64);
    if (v11)
    {
      *(void *)(a1 + 64) = 0;
      free(v11);
    }
    unsigned int v12 = *(void **)(a1 + 72);
    if (v12)
    {
      *(void *)(a1 + 72) = 0;
      free(v12);
    }
    uint64_t v13 = *(void **)(a1 + 80);
    if (v13)
    {
      *(void *)(a1 + 80) = 0;
      free(v13);
    }
  }
}

- ($5D018791884760D46230C39DEE7E58E3)motionStatistics
{
  CGSize size = self[2].var4.size;
  *(CGPoint *)retstr->var0 = self[2].var4.origin;
  *(CGSize *)&retstr->var2 = size;
  long long v4 = *(_OWORD *)self[3].var1;
  *(_OWORD *)&retstr->var4.origin.y = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->var4.size.height = v4;
  return self;
}

- (float)stationaryThreshold
{
  return self->_stationaryThreshold;
}

- (void)setStationaryThreshold:(float)a3
{
  self->_stationaryThreshold = a3;
}

- (int)maximumSearchRange
{
  return self->_maximumSearchRange;
}

@end
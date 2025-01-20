@interface BWSceneStabilityMonitor
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stableStartTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unstableStartTime;
- (BOOL)isAFCompleted;
- (BOOL)isStable;
- (BOOL)processedSceneMotion;
- (BWSceneStabilityMonitor)init;
- (_BYTE)_updateAFStatusFromMetadata:(unsigned char *)result;
- (float)sceneMotionOffsetX;
- (float)sceneMotionOffsetY;
- (float)stabilityMetric;
- (uint64_t)_calculateStabilityWithAEMatrixFromMetadata:(uint64_t)result;
- (uint64_t)_calculateStabilityWithSceneMotionForPixelBuffer:(uint64_t)a1 pts:(CVPixelBufferRef)pixelBuffer;
- (void)_resetAEMatrixStorage;
- (void)_resetPixelSumStorage;
- (void)calculateStabilityWithPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 metadataDictionary:(id)a5 forceSceneMotion:(BOOL)a6;
- (void)dealloc;
- (void)reset;
@end

@implementation BWSceneStabilityMonitor

- (BWSceneStabilityMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)BWSceneStabilityMonitor;
  v2 = [(BWSceneStabilityMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(BWSceneStabilityMonitor *)v2 reset];
    uint64_t v4 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&v3->_pixelSumStorage.lastPTS.value = *MEMORY[0x1E4F1FA48];
    v3->_pixelSumStorage.lastPTS.epoch = *(void *)(v4 + 16);
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v3->_stableStartTime.value = *MEMORY[0x1E4F1F9F8];
    v3->_stableStartTime.epoch = *(void *)(v5 + 16);
  }
  return v3;
}

- (void)reset
{
  self->_lastAFStatus = 0;
  self->_isLastSceneStable = 0;
  self->_stabilityMetric = 0.0;
  *(_WORD *)&self->_isAFCompletedOnLastFrame = 0;
  self->_sceneMotionOffsetX = 0.0;
  self->_sceneMotionOffsetY = 0.0;
  -[BWSceneStabilityMonitor _resetAEMatrixStorage]((uint64_t)self);
  -[BWSceneStabilityMonitor _resetPixelSumStorage]((uint64_t)self);
}

- (void)_resetPixelSumStorage
{
  if (a1)
  {
    v2 = *(void **)(a1 + 136);
    if (v2)
    {
      *(void *)(a1 + 136) = 0;
      free(v2);
    }
    v3 = *(void **)(a1 + 144);
    if (v3)
    {
      *(void *)(a1 + 144) = 0;
      free(v3);
    }
    *(unsigned char *)(a1 + 152) = 0;
    *(_DWORD *)(a1 + 156) = 0;
    *(void *)(a1 + 112) = 0;
    *(void *)(a1 + 120) = 0;
  }
}

- (void)_resetAEMatrixStorage
{
  if (a1)
  {
    v2 = *(void **)(a1 + 80);
    if (v2)
    {
      *(void *)(a1 + 80) = 0;
      free(v2);
    }
    v3 = *(void **)(a1 + 88);
    if (v3)
    {
      *(void *)(a1 + 88) = 0;
      free(v3);
    }
    *(_DWORD *)(a1 + 108) = 0;
    *(void *)(a1 + 96) = 0;
    *(unsigned char *)(a1 + 104) = 0;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stableStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (uint64_t)_calculateStabilityWithAEMatrixFromMetadata:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F53BC0]];
    if (result)
    {
      v3 = (void *)result;
      if ([(id)result length] == 512)
      {
        uint64_t v24 = 0;
        uint64_t v4 = (uint16x4_t *)malloc_type_malloc(0x200uLL, 0x1000040BDFB0063uLL);
        *(_OWORD *)v4->i8 = 0u;
        *(_OWORD *)v4[2].i8 = 0u;
        *(_OWORD *)v4[4].i8 = 0u;
        *(_OWORD *)v4[6].i8 = 0u;
        *(_OWORD *)v4[8].i8 = 0u;
        *(_OWORD *)v4[10].i8 = 0u;
        *(_OWORD *)v4[12].i8 = 0u;
        *(_OWORD *)v4[14].i8 = 0u;
        *(_OWORD *)v4[16].i8 = 0u;
        *(_OWORD *)v4[18].i8 = 0u;
        *(_OWORD *)v4[20].i8 = 0u;
        *(_OWORD *)v4[22].i8 = 0u;
        *(_OWORD *)v4[24].i8 = 0u;
        *(_OWORD *)v4[26].i8 = 0u;
        *(_OWORD *)v4[28].i8 = 0u;
        *(_OWORD *)v4[30].i8 = 0u;
        *(_OWORD *)v4[32].i8 = 0u;
        *(_OWORD *)v4[34].i8 = 0u;
        *(_OWORD *)v4[36].i8 = 0u;
        *(_OWORD *)v4[38].i8 = 0u;
        *(_OWORD *)v4[40].i8 = 0u;
        *(_OWORD *)v4[42].i8 = 0u;
        *(_OWORD *)v4[44].i8 = 0u;
        *(_OWORD *)v4[46].i8 = 0u;
        *(_OWORD *)v4[48].i8 = 0u;
        *(_OWORD *)v4[50].i8 = 0u;
        *(_OWORD *)v4[52].i8 = 0u;
        *(_OWORD *)v4[54].i8 = 0u;
        *(_OWORD *)v4[56].i8 = 0u;
        *(_OWORD *)v4[58].i8 = 0u;
        *(_OWORD *)v4[60].i8 = 0u;
        *(_OWORD *)v4[62].i8 = 0u;
        uint64_t v5 = [v3 bytes];
        uint64_t v6 = 0;
        objc_super v7 = v4;
        do
        {
          for (uint64_t i = 0; i != 16; ++i)
            v7->i16[i] = *(_WORD *)(v5 + i * 2);
          ++v6;
          v7 += 4;
          v5 += 32;
        }
        while (v6 != 16);
        v9 = (char *)malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
        v10 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
        uint64_t v11 = (uint64_t)v10;
        uint64_t v12 = 0;
        v13 = v4 + 2;
        do
        {
          *(_DWORD *)&v9[v12] = vaddvq_s32(vaddq_s32((int32x4_t)vaddl_u16(v13[-2], *v13), (int32x4_t)vaddl_high_u16(*(uint16x8_t *)v13[-2].i8, *(uint16x8_t *)v13->i8)));
          v13 += 4;
          v12 += 4;
        }
        while (v12 != 64);
        uint64_t v14 = 0;
        v15 = v4;
        do
        {
          uint64_t v16 = 0;
          int v17 = 0;
          do
          {
            v17 += v15[v16].u16[0];
            v16 += 4;
          }
          while (v16 != 64);
          v10[v14++] = v17;
          v15 = (uint16x4_t *)((char *)v15 + 2);
        }
        while (v14 != 16);
        uint64_t v18 = *(void *)(v2 + 80);
        if (v18)
        {
          uint64_t v19 = *(void *)(v2 + 88);
          if (v19)
          {
            AEMatrix_FindQualityFromSums((uint64_t)v9, v18, (float *)&v24);
            AEMatrix_FindQualityFromSums(v11, v19, (float *)&v24 + 1);
            float v20 = *((float *)&v24 + 1);
            float v21 = *(float *)&v24;
            *(_DWORD *)(v2 + 96) = HIDWORD(v24);
            *(float *)(v2 + 100) = v21;
            if (v20 >= v21) {
              float v20 = v21;
            }
            *(unsigned char *)(v2 + 104) = v20 > 0.8;
            *(float *)(v2 + 108) = v20;
          }
        }
        free(v4);
        v22 = *(void **)(v2 + 80);
        if (v22)
        {
          *(void *)(v2 + 80) = 0;
          free(v22);
        }
        v23 = *(void **)(v2 + 88);
        if (v23)
        {
          *(void *)(v2 + 88) = 0;
          free(v23);
        }
        *(void *)(v2 + 80) = v9;
        *(void *)(v2 + 88) = v11;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)processedSceneMotion
{
  return self->_processedSceneMotion;
}

- (void)calculateStabilityWithPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 metadataDictionary:(id)a5 forceSceneMotion:(BOOL)a6
{
  BOOL v6 = a6;
  int v11 = -[BWSceneStabilityMonitor _calculateStabilityWithAEMatrixFromMetadata:]((uint64_t)self, a5);
  memset(&v25, 0, sizeof(v25));
  CMTime lhs = *(CMTime *)a4;
  CMTime rhs = (CMTime)self->_pixelSumStorage.lastPTS;
  CMTimeSubtract(&v25, &lhs, &rhs);
  if ((v11 & 1) == 0)
  {
    CMTimeMakeWithSeconds(&time2, 0.1, 1000);
    CMTime lhs = v25;
    if (CMTimeCompare(&lhs, &time2) <= 0 && !v6)
    {
      int v12 = 0;
      goto LABEL_7;
    }
LABEL_8:
    int v12 = -[BWSceneStabilityMonitor _calculateStabilityWithSceneMotionForPixelBuffer:pts:]((uint64_t)self, a3);
    if ((v11 & v12) == 1)
    {
      BOOL sceneStable = self->_aeMatrixStorage.sceneStable;
      if (self->_aeMatrixStorage.sceneStable) {
        BOOL sceneStable = self->_pixelSumStorage.sceneStable;
      }
      float stabilityMetric = self->_aeMatrixStorage.stabilityMetric;
      if (stabilityMetric >= self->_pixelSumStorage.stabilityMetric) {
        float stabilityMetric = self->_pixelSumStorage.stabilityMetric;
      }
      goto LABEL_18;
    }
    if (v11) {
      goto LABEL_15;
    }
    if (v12)
    {
      BOOL sceneStable = self->_pixelSumStorage.sceneStable;
      float stabilityMetric = self->_pixelSumStorage.stabilityMetric;
LABEL_18:
      int v12 = 1;
      goto LABEL_19;
    }
LABEL_7:
    BOOL sceneStable = 0;
    goto LABEL_20;
  }
  if (v6) {
    goto LABEL_8;
  }
  int v12 = 0;
LABEL_15:
  BOOL sceneStable = self->_aeMatrixStorage.sceneStable;
  float stabilityMetric = self->_aeMatrixStorage.stabilityMetric;
LABEL_19:
  self->_float stabilityMetric = stabilityMetric;
LABEL_20:
  if (self->_isLastSceneStable != sceneStable)
  {
    uint64_t v15 = 40;
    if (sceneStable) {
      uint64_t v16 = 16;
    }
    else {
      uint64_t v16 = 40;
    }
    if (!sceneStable) {
      uint64_t v15 = 16;
    }
    int v17 = (char *)self + v16;
    long long v18 = *(_OWORD *)&a4->var0;
    *((void *)v17 + 2) = a4->var3;
    *(_OWORD *)int v17 = v18;
    uint64_t v19 = MEMORY[0x1E4F1F9F8];
    float v20 = (char *)self + v15;
    *(_OWORD *)float v20 = *MEMORY[0x1E4F1F9F8];
    *((void *)v20 + 2) = *(void *)(v19 + 16);
    self->_isLastSceneStable = sceneStable;
  }
  uint64_t v21 = 0;
  if (v12) {
    uint64_t v21 = *(void *)&self->_pixelSumStorage.offsetX;
  }
  *(void *)&self->_sceneMotionOffsetX = v21;
  self->_processedSceneMotion = v12;
  -[BWSceneStabilityMonitor _updateAFStatusFromMetadata:](self, a5);
}

- (_BYTE)_updateAFStatusFromMetadata:(unsigned char *)result
{
  if (result)
  {
    uint64_t v2 = result;
    result[64] = 0;
    result = (unsigned char *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F53BF8]];
    if (result)
    {
      result = (unsigned char *)[result intValue];
      if (*((_DWORD *)v2 + 46) == 2 && result == 4) {
        v2[64] = 1;
      }
      *((_DWORD *)v2 + 46) = result;
    }
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWSceneStabilityMonitor *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)BWSceneStabilityMonitor;
  [(BWSceneStabilityMonitor *)&v3 dealloc];
}

- (uint64_t)_calculateStabilityWithSceneMotionForPixelBuffer:(uint64_t)a1 pts:(CVPixelBufferRef)pixelBuffer
{
  uint64_t result = 0;
  if (!a1 || !pixelBuffer) {
    return result;
  }
  int WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  double v6 = pixelSumComputeCompatibleROI(WidthOfPlane, 0.0);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unsigned int v13 = v9;
  unsigned int v14 = v11;
  if (*(void *)(a1 + 128) != __PAIR64__(v9, v11))
  {
    -[BWSceneStabilityMonitor _resetPixelSumStorage](a1);
    *(_DWORD *)(a1 + 128) = v14;
    *(_DWORD *)(a1 + 132) = v13;
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v15 = (int32x4_t *)malloc_type_malloc(4 * v14, 0xE877BD66uLL);
  uint64_t v16 = (int32x4_t *)malloc_type_malloc(4 * v13, 0x8D53A875uLL);
  if (pixelSumForROI(pixelBuffer, v15, v16, v6, v8, v10, v12))
  {
    fig_log_get_emitter();
  }
  else
  {
    int v17 = *(int32x4_t **)(a1 + 136);
    if (!v17)
    {
LABEL_16:
      v22 = *(void **)(a1 + 144);
      if (v22)
      {
        *(void *)(a1 + 144) = 0;
        free(v22);
      }
      *(void *)(a1 + 136) = v15;
      *(void *)(a1 + 144) = v16;
      return 1;
    }
    if (!*(void *)(a1 + 144))
    {
LABEL_15:
      *(void *)(a1 + 136) = 0;
      free(v17);
      goto LABEL_16;
    }
    if (!findOffsetFromSums(v15, v17, v14, 56, 1, 0, (float *)&v24, 0, (float *)&v23)
      && !findOffsetFromSums(v16, *(int32x4_t **)(a1 + 144), v13, 56, 1, 0, (float *)&v24 + 1, 0, (float *)&v23 + 1))
    {
      int v18 = v24;
      *(_DWORD *)(a1 + 112) = HIDWORD(v24);
      *(_DWORD *)(a1 + 116) = v18;
      float v20 = *((float *)&v23 + 1);
      float v19 = *(float *)&v23;
      *(_DWORD *)(a1 + 120) = HIDWORD(v23);
      *(float *)(a1 + 124) = v19;
      BOOL v21 = v20 > 0.1;
      if (v19 <= 0.1) {
        BOOL v21 = 0;
      }
      *(unsigned char *)(a1 + 152) = v21;
      if (v20 < v19) {
        float v19 = v20;
      }
      *(float *)(a1 + 156) = v19;
      int v17 = *(int32x4_t **)(a1 + 136);
      if (!v17) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    fig_log_get_emitter();
  }
  FigDebugAssert3();
  if (v15) {
    free(v15);
  }
  if (v16) {
    free(v16);
  }
  return 0;
}

- (BOOL)isStable
{
  return self->_isLastSceneStable;
}

- (float)stabilityMetric
{
  return self->_stabilityMetric;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unstableStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (BOOL)isAFCompleted
{
  return self->_isAFCompletedOnLastFrame;
}

- (float)sceneMotionOffsetX
{
  return self->_sceneMotionOffsetX;
}

- (float)sceneMotionOffsetY
{
  return self->_sceneMotionOffsetY;
}

@end
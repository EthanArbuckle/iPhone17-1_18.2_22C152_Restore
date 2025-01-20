@interface BWPreviewGyroStabilizationPanningDetection
- (BOOL)detectPanningUsingTranslation:(float *)a3 maxAvgTranslationOut:;
- (BOOL)isPanning;
- (BWPreviewGyroStabilizationPanningDetection)initWithPanningThreshold:(float)a3;
- (float)_computePanningStatistics;
- (void)_updateWithTranslation:(BWPreviewGyroStabilizationPanningDetection *)self;
- (void)reset;
@end

@implementation BWPreviewGyroStabilizationPanningDetection

- (BOOL)detectPanningUsingTranslation:(float *)a3 maxAvgTranslationOut:
{
  -[BWPreviewGyroStabilizationPanningDetection _updateWithTranslation:](self, "_updateWithTranslation:");
  [(BWPreviewGyroStabilizationPanningDetection *)self _computePanningStatistics];
  if (a3) {
    *(_DWORD *)a3 = v5;
  }
  return self->_isPanning;
}

- (void)_updateWithTranslation:(BWPreviewGyroStabilizationPanningDetection *)self
{
  *(void *)&self->_translationVector[8 * self->_inputIndex] = v2;
  int ringCount = self->_ringCount;
  if (ringCount <= 9) {
    self->_int ringCount = ringCount + 1;
  }
  int inputIndex = self->_inputIndex;
  signed int v5 = inputIndex
     + 1
     + 10
     * ((~inputIndex + ((inputIndex + 1) >> 31) + ((inputIndex + 1) & ~((inputIndex + 1) >> 31))) / 0xA
      + ((inputIndex + 1) >> 31));
  unsigned int v6 = inputIndex
     + 10
     * ((~inputIndex + ((inputIndex + 1) >> 31) + ((inputIndex + 1) & ~((inputIndex + 1) >> 31))) / 0xA
      + ((inputIndex + 1) >> 31));
  if (v5 >= 9) {
    signed int v5 = 9;
  }
  self->_int inputIndex = (v6 - v5 + 10) % 0xA - (10 - v5) + 1;
}

- (float)_computePanningStatistics
{
  if (self->_ringCount == 10)
  {
    int inputIndex = self->_inputIndex;
    float32x2_t v3 = 0;
    __asm { FMOV            V2.2S, #1.0 }
    int v9 = 10;
    float32x2_t v10 = 0;
    do
    {
      float32x2_t v11 = *(float32x2_t *)&self->_translationVector[8 * inputIndex];
      float32x2_t v12 = (float32x2_t)vand_s8(vorr_s8(vand_s8((int8x8_t)v11, (int8x8_t)0x8000000080000000), _D2), vorr_s8((int8x8_t)vcltz_f32(v11), (int8x8_t)vcgtz_f32(v11)));
      signed int v13 = inputIndex
          - 1
          + 10
          * ((((inputIndex - 1) & ~((inputIndex - 1) >> 31)) - inputIndex + ((inputIndex - 1) >> 31) + 1)
           / 0xA
           + ((inputIndex - 1) >> 31));
      unsigned int v14 = inputIndex
          + 10
          * ((((inputIndex - 1) & ~((inputIndex - 1) >> 31)) - inputIndex + ((inputIndex - 1) >> 31) + 1)
           / 0xA
           + ((inputIndex - 1) >> 31));
      if (v13 >= 9) {
        int v15 = 9;
      }
      else {
        int v15 = v13;
      }
      float32x2_t v3 = vadd_f32(v3, v11);
      float32x2_t v10 = vadd_f32(v10, v12);
      int inputIndex = v13 - 10 * ((v14 - v15 + 8) / 0xA);
      --v9;
    }
    while (v9);
    __asm { FMOV            V2.2S, #10.0 }
    float32x2_t v17 = vdiv_f32(vabs_f32(v3), _D2);
    int8x8_t v18 = (int8x8_t)vceq_f32(vabs_f32(v10), _D2);
    p_panningSpeedThreshold = &self->_panningSpeedThreshold;
    float32x2_t v20 = vld1_dup_f32(p_panningSpeedThreshold);
    uint32x2_t v21 = (uint32x2_t)vand_s8((int8x8_t)vcge_f32(v17, v20), v18);
    LODWORD(p_panningSpeedThreshold) = vpmax_u32(v21, v21).u32[0];
    self->_isPanning = (int)p_panningSpeedThreshold < 0;
    float result = 0.0;
    if ((p_panningSpeedThreshold & 0x80000000) != 0)
    {
      if (v21.i32[0]) {
        float result = v17.f32[0];
      }
      if (v21.i32[1])
      {
        if (result <= v17.f32[1]) {
          return v17.f32[1];
        }
      }
    }
  }
  else
  {
    self->_isPanning = 0;
    return 0.0;
  }
  return result;
}

- (BWPreviewGyroStabilizationPanningDetection)initWithPanningThreshold:(float)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWPreviewGyroStabilizationPanningDetection;
  v4 = [(BWPreviewGyroStabilizationPanningDetection *)&v7 init];
  signed int v5 = v4;
  if (v4)
  {
    [(BWPreviewGyroStabilizationPanningDetection *)v4 reset];
    v5->_panningSpeedThreshold = a3;
  }
  return v5;
}

- (void)reset
{
  *(void *)&self->_int inputIndex = 0;
}

- (BOOL)isPanning
{
  return self->_isPanning;
}

@end
@interface ISDimmingConversion
- (BOOL)_computeDimmedImage;
- (BOOL)_prepareSamplesIfNeeded;
- (BOOL)isDimmable;
- (CGImage)createDimmedImage;
- (ISDimmingConversion)initWithCGImage:(CGImage *)a3;
- (float)minMeanBrightnessAdjustmentFactor;
- (float)targetHighlightBrightnessLevel;
- (float)targetMeanBrightnessLevel;
- (void)_computeDimmingParameters;
- (void)dealloc;
- (void)setMinMeanBrightnessAdjustmentFactor:(float)a3;
- (void)setTargetHighlightBrightnessLevel:(float)a3;
- (void)setTargetMeanBrightnessLevel:(float)a3;
@end

@implementation ISDimmingConversion

- (ISDimmingConversion)initWithCGImage:(CGImage *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ISDimmingConversion;
  v4 = [(ISDimmingConversion *)&v6 init];
  if (v4)
  {
    v4->_cgImage = CGImageRetain(a3);
    *(void *)&v4->_targetHighlightBrightnessLevel = 0x3EE666663F6CCCCDLL;
    v4->_minMeanBrightnessAdjustmentFactor = 0.65;
  }
  return v4;
}

- (void)dealloc
{
  CGImageRelease(self->_cgImage);
  data = self->_data;
  if (data) {
    CFRelease(data);
  }
  free(*(void **)&self->_ucharDimmed[7]);
  v4.receiver = self;
  v4.super_class = (Class)ISDimmingConversion;
  [(ISDimmingConversion *)&v4 dealloc];
}

- (BOOL)_prepareSamplesIfNeeded
{
  if (*(void *)self->_ucharSamples) {
    goto LABEL_2;
  }
  cgImage = self->_cgImage;
  if (!cgImage) {
    return (char)cgImage;
  }
  if (CGImageGetBitsPerComponent(cgImage) != 8 || CGImageGetBitsPerPixel(self->_cgImage) != 32) {
    goto LABEL_13;
  }
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(self->_cgImage);
  LOBYTE(cgImage) = 0;
  if (AlphaInfo <= kCGImageAlphaNoneSkipLast && ((1 << AlphaInfo) & 0x2A) != 0)
  {
    cgImage = CGImageGetDataProvider(self->_cgImage);
    if (cgImage)
    {
      cgImage = CGDataProviderCopyData(cgImage);
      if (cgImage)
      {
        v5 = cgImage;
        BytePtr = CFDataGetBytePtr(cgImage);
        if (BytePtr)
        {
          self->_data = v5;
          *(void *)self->_ucharSamples = BytePtr;
          self->_width = CGImageGetWidth(self->_cgImage);
          int Height = CGImageGetHeight(self->_cgImage);
          int v8 = self->_width * Height;
          self->_height = Height;
          self->_numberOfSamples = v8;
          self->_alphaInfo = AlphaInfo;
LABEL_2:
          LOBYTE(cgImage) = 1;
          return (char)cgImage;
        }
        CFRelease(v5);
LABEL_13:
        LOBYTE(cgImage) = 0;
      }
    }
  }
  return (char)cgImage;
}

- (void)_computeDimmingParameters
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(ISDimmingConversion *)self _prepareSamplesIfNeeded])
  {
    float targetHighlightBrightnessLevel = self->_targetHighlightBrightnessLevel;
    float targetMeanBrightnessLevel = self->_targetMeanBrightnessLevel;
    uint64_t v5 = *(void *)self->_ucharSamples;
    unsigned int alphaInfo = self->_alphaInfo;
    int numberOfSamples = self->_numberOfSamples;
    int v8 = malloc_type_malloc(0x1F40uLL, 0x100004052888210uLL);
    uint64_t v9 = 0;
    unsigned int v45 = 10;
    float v10 = (float)numberOfSamples;
    do
    {
      *(float *)v11.i32 = (float)(v10 * (float)rand_r(&v45)) * 4.6566e-10;
      LODWORD(v46[0]) = 0;
      computeSampleAndLuma(v5, (int)*(float *)v11.i32, alphaInfo, 0, 0, 0, v46, v11, v12, v13);
      v8[v9++] = v46[0];
    }
    while (v9 != 2000);
    uint64_t v15 = 0;
    v16.i32[1] = 0;
    memset(v46, 0, sizeof(v46));
    do
    {
      int v17 = (int)(float)(*(float *)&v8[v15] * 100.0);
      if (v17 >= 99) {
        int v17 = 99;
      }
      ++*((_DWORD *)v46 + v17);
      ++v15;
    }
    while (v15 != 2000);
    int v18 = 0;
    int v19 = 99;
    while (1)
    {
      v18 += *((_DWORD *)v46 + v19);
      if (v18 >= 300) {
        break;
      }
      if (--v19 == -1)
      {
        float v20 = 1.0;
        goto LABEL_13;
      }
    }
    float v20 = (float)v19 / 99.0;
LABEL_13:
    float v21 = 1.0;
    if (v20 > targetHighlightBrightnessLevel)
    {
      float v21 = targetHighlightBrightnessLevel / v20;
      *(float *)v14.i32 = 1.0 - (float)(targetHighlightBrightnessLevel / v20);
      *(float *)v16.i32 = 1.0 / *(float *)v14.i32;
      *(float *)v14.i32 = -*(float *)v14.i32;
      *(float *)v16.i32 = *(float *)v16.i32 + -1.0;
      float v43 = *(float *)v16.i32;
      int32x2_t v22 = vdup_lane_s32(v16, 0);
      uint64_t v23 = 0x3FFFFFFFFFFFF830;
      float v37 = *(float *)v22.i32;
      float32x4_t v38 = (float32x4_t)vdupq_lane_s32(v14, 0);
      float v24 = *(float *)&v22.i32[1];
      __asm { FMOV            V0.4S, #1.0 }
      float32x4_t v36 = _Q0;
      do
      {
        int8x16_t v44 = *(int8x16_t *)&v8[v23 + 2000];
        float v42 = powf(*(float *)v44.i32, v43);
        float v41 = powf(*(float *)&v44.i32[1], v43);
        unint64_t v39 = vextq_s8(v44, v44, 8uLL).u64[0];
        float v40 = powf(*((float *)&v39 + 1), v24);
        float v30 = powf(*(float *)&v39, v37);
        v31.i64[0] = __PAIR64__(LODWORD(v41), LODWORD(v42));
        v31.i64[1] = __PAIR64__(LODWORD(v40), LODWORD(v30));
        *(float32x4_t *)&v8[v23 + 2000] = vmulq_f32((float32x4_t)v44, vmlaq_f32(v36, v31, v38));
        v23 += 4;
      }
      while (v23 * 4);
    }
    uint64_t v32 = 0;
    float v33 = 0.0;
    do
      float v33 = v33 + *(float *)&v8[v32++];
    while (v32 != 2000);
    float v34 = v33 / 2000.0;
    self->_hasDimmingParameters = 1;
    BOOL v35 = v34 > targetMeanBrightnessLevel || v20 > targetHighlightBrightnessLevel;
    self->_isDimmable = v35;
    self->_highlightBrightnessAdjustmentFactor = v21;
    self->_shouldAdjustHighlightBrightness = v20 > targetHighlightBrightnessLevel;
    self->_meanBrightnessAfterHighlightAdjustment = v34;
    self->_shouldAdjustMeanBrightness = v34 > targetMeanBrightnessLevel;
    free(v8);
  }
}

- (BOOL)isDimmable
{
  if (!self->_hasDimmingParameters) {
    [(ISDimmingConversion *)self _computeDimmingParameters];
  }
  return self->_isDimmable;
}

- (BOOL)_computeDimmedImage
{
  BOOL v3 = [(ISDimmingConversion *)self isDimmable];
  if (v3)
  {
    objc_super v6 = *(_DWORD **)&self->_ucharDimmed[7];
    if (!v6)
    {
      objc_super v6 = malloc_type_malloc(4 * self->_numberOfSamples, 0x100004052888210uLL);
      *(void *)&self->_ucharDimmed[7] = v6;
    }
    uint64_t numberOfSamples = self->_numberOfSamples;
    if ((int)numberOfSamples >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)self->_ucharSamples;
      unsigned int alphaInfo = self->_alphaInfo;
      BOOL shouldAdjustHighlightBrightness = self->_shouldAdjustHighlightBrightness;
      float meanBrightnessAfterHighlightAdjustment = self->_meanBrightnessAfterHighlightAdjustment;
      BOOL shouldAdjustMeanBrightness = self->_shouldAdjustMeanBrightness;
      float v14 = fminf(fmaxf((float)(self->_targetMeanBrightnessLevel+ (float)((float)-(float)(meanBrightnessAfterHighlightAdjustment* meanBrightnessAfterHighlightAdjustment)* meanBrightnessAfterHighlightAdjustment))/ (float)(meanBrightnessAfterHighlightAdjustment+ (float)((float)-(float)(meanBrightnessAfterHighlightAdjustment* meanBrightnessAfterHighlightAdjustment)* meanBrightnessAfterHighlightAdjustment)), self->_minMeanBrightnessAdjustmentFactor), 1.0);
      float v15 = 1.0 - self->_highlightBrightnessAdjustmentFactor;
      v5.i32[0] = -1.0;
      float v16 = (float)(1.0 / v15) + -1.0;
      float v17 = -v15;
      v4.i64[0] = 1.0;
      uint8x8_t v18 = (uint8x8_t)0x3F8000003F800000;
      float32x2_t v19 = (float32x2_t)vdup_n_s32(0x437F0000u);
      do
      {
        v35.i32[2] = 0;
        uint64_t v34 = 0;
        v35.i64[0] = 0;
        computeSampleAndLuma(v9, v8, alphaInfo, &v35, (_DWORD *)&v34 + 1, (float *)&v34, 0, v18, (int8x16_t)v4, v5);
        float v20 = *(float *)&v34;
        if (*(float *)&v34 == 0.0)
        {
          int16x8_t v21 = 0uLL;
        }
        else
        {
          __n128 v22 = (__n128)v35;
          if (shouldAdjustHighlightBrightness)
          {
            float32x4_t v32 = v35;
            float v33 = *(float *)&v34;
            float v23 = powf(*((float *)&v34 + 1), v16);
            float v20 = v33;
            __n128 v22 = (__n128)vmulq_n_f32(v32, (float)(v17 * v23) + 1.0);
          }
          if (shouldAdjustMeanBrightness)
          {
            float v24 = ((float)(v14 * *((float *)&v34 + 1))
                 + (1.0 - v14) * (float)(*((float *)&v34 + 1) * (float)(*((float *)&v34 + 1) * *((float *)&v34 + 1))))
                / *((float *)&v34 + 1);
            double v25 = ISSegmentationMathUtils_rgb2lab(v22);
            v26.n128_f32[0] = v24 * *(float *)&v25;
            v26.n128_u32[1] = HIDWORD(v25);
            v26.n128_u32[2] = v27;
            v28.n128_u64[0] = (unint64_t)ISSegmentationMathUtils_lab2rgb(v26, (float32x4_t)v26);
            __n128 v22 = v28;
            float v20 = *(float *)&v34;
          }
          v22.n128_u32[3] = 0;
          float32x4_t v29 = vmaxnmq_f32((float32x4_t)v22, (float32x4_t)0);
          v29.i32[3] = 0;
          float32x4_t v30 = vminnmq_f32(v29, (float32x4_t)xmmword_1AE7C0DE0);
          *(float32x2_t *)v4.f32 = vmul_f32(*(float32x2_t *)v30.f32, v19);
          v5.i32[0] = 1132396544;
          v4.i64[1] = COERCE_UNSIGNED_INT(vmuls_lane_f32(255.0, v30, 2)) | 0x437F000000000000;
          int16x8_t v21 = (int16x8_t)vcvtq_s32_f32(vmulq_n_f32(v4, v20));
          *(int16x4_t *)v21.i8 = vmovn_s32((int32x4_t)v21);
        }
        uint8x8_t v18 = (uint8x8_t)vmovn_s16(v21);
        v6[v8++] = v18.i32[0];
      }
      while (numberOfSamples != v8);
    }
  }
  return v3;
}

- (CGImage)createDimmedImage
{
  if (![(ISDimmingConversion *)self _computeDimmedImage]) {
    return 0;
  }
  int width = self->_width;
  int height = self->_height;
  uint64_t v5 = *(void *)&self->_ucharDimmed[7];
  return ISCreateCGImageUchar4AlphaPremultiplied(width, height, v5);
}

- (float)targetHighlightBrightnessLevel
{
  return self->_targetHighlightBrightnessLevel;
}

- (void)setTargetHighlightBrightnessLevel:(float)a3
{
  self->_float targetHighlightBrightnessLevel = a3;
}

- (float)targetMeanBrightnessLevel
{
  return self->_targetMeanBrightnessLevel;
}

- (void)setTargetMeanBrightnessLevel:(float)a3
{
  self->_float targetMeanBrightnessLevel = a3;
}

- (float)minMeanBrightnessAdjustmentFactor
{
  return self->_minMeanBrightnessAdjustmentFactor;
}

- (void)setMinMeanBrightnessAdjustmentFactor:(float)a3
{
  self->_minMeanBrightnessAdjustmentFactor = a3;
}

@end
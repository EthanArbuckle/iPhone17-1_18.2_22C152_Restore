@interface MDLCheckerboardTexture
- (CGColorRef)color1;
- (CGColorRef)color2;
- (MDLCheckerboardTexture)initWithDivisions:(float)divisions name:(NSString *)name dimensions:(vector_int2)dimensions channelCount:(int)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding color1:(CGColorRef)color1 color2:(CGColorRef)color2;
- (float)divisions;
- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)setColor1:(CGColorRef)color1;
- (void)setColor2:(CGColorRef)color2;
- (void)setDivisions:(float)divisions;
@end

@implementation MDLCheckerboardTexture

- (void)dealloc
{
  v3 = *(const void **)&self->_divisions;
  if (v3) {
    CFRelease(v3);
  }
  color1 = self->_color1;
  if (color1) {
    CFRelease(color1);
  }
  v5.receiver = self;
  v5.super_class = (Class)MDLCheckerboardTexture;
  [(MDLCheckerboardTexture *)&v5 dealloc];
}

- (void)setDivisions:(float)divisions
{
  if ((float)*(int *)(&self->super._hasAlphaValues + 2) != divisions) {
    *(_DWORD *)(&self->super._hasAlphaValues + 2) = (int)divisions;
  }
}

- (float)divisions
{
  return (float)*(int *)(&self->super._hasAlphaValues + 2);
}

- (void)setColor1:(CGColorRef)color1
{
  if (color1)
  {
    objc_msgSend_clearTexelData(self, a2, (uint64_t)color1);
    objc_super v5 = *(CGColor **)&self->_divisions;
    if (v5) {
      CGColorRelease(v5);
    }
    *(void *)&self->_divisions = CGColorCreateCopy(color1);
  }
}

- (CGColorRef)color1
{
  return *(CGColorRef *)&self->_divisions;
}

- (void)setColor2:(CGColorRef)color2
{
  if (color2)
  {
    objc_msgSend_clearTexelData(self, a2, (uint64_t)color2);
    color1 = self->_color1;
    if (color1) {
      CGColorRelease(color1);
    }
    self->_color1 = CGColorCreateCopy(color2);
  }
}

- (CGColorRef)color2
{
  return self->_color1;
}

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  if (self->super._channelEncoding != 1)
  {
    v7 = (void *)MEMORY[0x263EFF940];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(a4);
    objc_msgSend_raise_format_(v7, v11, @"ModelIOException", @"[%@ %@]: Only 8 bit textures supported", v9, v10);
  }
  if (self->super._textureData.channelCount != 4)
  {
    v12 = (void *)MEMORY[0x263EFF940];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = NSStringFromSelector(a4);
    objc_msgSend_raise_format_(v12, v16, @"ModelIOException", @"[%@ %@]: Only 4 channel textures supported", v14, v15);
  }
  int32x2_t v50 = *(int32x2_t *)self->super._anon_118;
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_mutableBytes(v17, v18, v19);
  Components = CGColorGetComponents(*(CGColorRef *)&self->_divisions);
  v22 = CGColorGetComponents(self->_color1);
  v25.i32[0] = 0;
  uint64_t v26 = 0;
  v27.i32[1] = v50.i32[1];
  v27.i32[0] = 1;
  int32x2_t v28 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v25, v50), 0), v27, (int8x8_t)v50);
  int32x2_t v29 = vmax_s32(vshl_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v25, vdup_lane_s32(v28, 1)), 0), (int8x8_t)(v28.u32[0] | 0x100000000), (int8x8_t)v28), vneg_s32(vdup_n_s32(a3))), (int32x2_t)0x100000001);
  int8x16_t v31 = *(int8x16_t *)Components;
  int8x16_t v30 = *(int8x16_t *)(Components + 2);
  int8x16_t v33 = *(int8x16_t *)v22;
  int8x16_t v32 = *(int8x16_t *)(v22 + 2);
  float32x2_t v34 = vcvt_f32_s32(v29);
  uint64_t v35 = v29.u32[0];
  uint64_t v36 = (4 * v29.i32[0]);
  float32x4_t v37 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  uint64_t v38 = v29.u32[1];
  __asm { FMOV            V5.2S, #1.0 }
  float32x2_t v44 = vdiv_f32(_D5, v34);
  v45.i64[0] = 0x100000001;
  v45.i64[1] = 0x100000001;
  do
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    do
    {
      v23.i32[0] = 0;
      v24.f32[0] = (float)(int)v47;
      v24.f32[1] = (float)(int)v26;
      *(int32x2_t *)v24.f32 = vcvt_s32_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v24.f32, (float)*(int *)(&self->super._hasAlphaValues + 2)), v44));
      *(int32x2_t *)v24.f32 = vadd_s32(vdup_lane_s32(*(int32x2_t *)v24.f32, 1), *(int32x2_t *)v24.f32);
      int8x16_t v48 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32((int32x4_t)vandq_s8((int8x16_t)v24, v45), (int32x4_t)v23), 0);
      float32x4_t v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)vbslq_s8(v48, v33, v31)), (float64x2_t)vbslq_s8(v48, v32, v30));
      int16x8_t v23 = (int16x8_t)vcvtq_s32_f32(vmulq_f32(v24, v37));
      *(int16x4_t *)v23.i8 = vmovn_s32((int32x4_t)v23);
      *(int8x8_t *)v23.i8 = vmovn_s16(v23);
      *(_DWORD *)(v20 + v26 * v36 + (v46 & 0xFFFFFFFC)) = v23.i32[0];
      ++v47;
      v46 += 4;
    }
    while (v35 != v47);
    ++v26;
  }
  while (v26 != v38);

  return v17;
}

- (MDLCheckerboardTexture)initWithDivisions:(float)divisions name:(NSString *)name dimensions:(vector_int2)dimensions channelCount:(int)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding color1:(CGColorRef)color1 color2:(CGColorRef)color2
{
  v16 = name;
  v23.receiver = self;
  v23.super_class = (Class)MDLCheckerboardTexture;
  v18 = [(MDLTexture *)&v23 init];
  if (v18)
  {
    if (v16)
    {
      uint64_t v19 = objc_msgSend_stringWithString_(NSString, v17, (uint64_t)v16);
      uint64_t v20 = v18->super._name;
      v18->super._name = (NSString *)v19;
    }
    *(vector_int2 *)v18->super._anon_118 = dimensions;
    *(_DWORD *)(&v18->super._hasAlphaValues + 2) = (int)divisions;
    *(void *)&v18->_divisions = CGColorCreateCopy(color1);
    v18->_color1 = CGColorCreateCopy(color2);
    *(void *)&v18->super._anon_118[8] = (int)(4 * *(void *)v18->super._anon_118);
    v18->super._textureData.channelCount = channelCount;
    v18->super._channelEncoding = channelEncoding;
    v18->super._selfCreating = 1;
    v21 = v18;
  }

  return v18;
}

@end
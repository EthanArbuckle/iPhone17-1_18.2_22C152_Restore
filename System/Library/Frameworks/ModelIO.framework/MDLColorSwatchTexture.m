@interface MDLColorSwatchTexture
- (MDLColorSwatchTexture)initWithColorGradientFrom:(CGColorRef)color1 toColor:(CGColorRef)color2 name:(NSString *)name textureDimensions:(vector_int2)textureDimensions;
- (MDLColorSwatchTexture)initWithColorTemperatureGradientFrom:(float)colorTemperature1 toColorTemperature:(float)colorTemperature2 name:(NSString *)name textureDimensions:(vector_int2)textureDimensions;
- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4;
@end

@implementation MDLColorSwatchTexture

- (MDLColorSwatchTexture)initWithColorTemperatureGradientFrom:(float)colorTemperature1 toColorTemperature:(float)colorTemperature2 name:(NSString *)name textureDimensions:(vector_int2)textureDimensions
{
  v9 = name;
  v17.receiver = self;
  v17.super_class = (Class)MDLColorSwatchTexture;
  v11 = [(MDLTexture *)&v17 init];
  if (v11)
  {
    if (v9)
    {
      uint64_t v12 = objc_msgSend_stringWithString_(NSString, v10, (uint64_t)v9);
      v13 = v11->super._name;
      v11->super._name = (NSString *)v12;
    }
    *(vector_int2 *)v11->super._anon_118 = textureDimensions;
    *(void *)&v11->super._anon_118[8] = 4 * textureDimensions.i32[0];
    v11->super._textureData.channelCount = 4;
    *(float *)(&v11->super._hasAlphaValues + 2) = colorTemperature1;
    v11->_colorTemperature1 = colorTemperature2;
    v11->super._channelEncoding = 1;
    v11->_type = 0;
    v11->super._selfCreating = 1;
    v14 = v11;
  }

  return v11;
}

- (MDLColorSwatchTexture)initWithColorGradientFrom:(CGColorRef)color1 toColor:(CGColorRef)color2 name:(NSString *)name textureDimensions:(vector_int2)textureDimensions
{
  v9 = name;
  v17.receiver = self;
  v17.super_class = (Class)MDLColorSwatchTexture;
  v11 = [(MDLTexture *)&v17 init];
  if (v11)
  {
    if (v9)
    {
      uint64_t v12 = objc_msgSend_stringWithString_(NSString, v10, (uint64_t)v9);
      v13 = v11->super._name;
      v11->super._name = (NSString *)v12;
    }
    *(vector_int2 *)v11->super._anon_118 = textureDimensions;
    *(void *)&v11->super._anon_118[8] = 4 * textureDimensions.i32[0];
    v11->super._textureData.channelCount = 4;
    v11->_color1 = color1;
    v11->_color2 = color2;
    v11->super._channelEncoding = 1;
    v11->_type = 1;
    v11->super._selfCreating = 1;
    v14 = v11;
  }

  return v11;
}

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  if (self->super._channelEncoding != 1)
  {
    v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a4);
    objc_msgSend_raise_format_(v8, v12, @"ModelIOException", @"[%@ %@]: Only 8 bit textures supported", v10, v11);
  }
  if (self->super._textureData.channelCount != 4)
  {
    v13 = (void *)MEMORY[0x263EFF940];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a4);
    objc_msgSend_raise_format_(v13, v17, @"ModelIOException", @"[%@ %@]: Only 4 channel textures supported", v15, v16);
  }
  v4.i32[0] = 0;
  v18.i32[1] = HIDWORD(*(void *)self->super._anon_118);
  v18.i32[0] = 1;
  int32x2_t v19 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->super._anon_118), 0), v18, *(int8x8_t *)self->super._anon_118);
  int8x8_t v20 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v19, 1)), 0), (int8x8_t)(v19.u32[0] | 0x100000000), (int8x8_t)v19);
  if (v20.i32[0] >> a3 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = (v20.i32[0] >> a3);
  }
  if (v20.i32[1] >> a3 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = (v20.i32[1] >> a3);
  }
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  id v23 = objc_claimAutoreleasedReturnValue();
  uint64_t v26 = objc_msgSend_mutableBytes(v23, v24, v25);
  float v30 = 1.0 / (float)(int)v22;
  uint64_t v31 = (4 * v21);
  if (self->_type)
  {
    color1 = self->_color1;
    if (color1 && self->_color2)
    {
      *(__n64 *)v33.f32 = sub_20B0688DC(color1);
      float32x4_t v57 = v33;
      *(__n64 *)v34.f32 = sub_20B0688DC(self->_color2);
      float32x4_t v56 = v34;
      uint64_t v35 = 0;
      float v36 = 1.0;
      float32x4_t v55 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      do
      {
        *(double *)v37.i64 = sub_20B068A50(vmlaq_n_f32(vmulq_n_f32(v57, v30 * (float)(int)v35), v56, v36 - (float)(v30 * (float)(int)v35)));
        v37.i32[3] = 1.0;
        int16x8_t v38 = (int16x8_t)vcvtq_s32_f32(vmulq_f32(v37, v55));
        *(int16x4_t *)v38.i8 = vmovn_s32((int32x4_t)v38);
        uint64_t v39 = v21;
        v40 = (_DWORD *)v26;
        float v36 = 1.0;
        do
        {
          *v40++ = vmovn_s16(v38).u32[0];
          --v39;
        }
        while (v39);
        ++v35;
        v26 += v31;
      }
      while (v35 != v22);
    }
    else
    {
      uint64_t v41 = 0;
      float32x4_t v42 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      do
      {
        *(float *)v27.i32 = v30 * (float)(int)v41;
        float32x4_t v43 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.i8, 0);
        v43.i32[3] = 1.0;
        int16x8_t v27 = (int16x8_t)vcvtq_s32_f32(vmulq_f32(v43, v42));
        *(int16x4_t *)v27.i8 = vmovn_s32((int32x4_t)v27);
        uint64_t v44 = v21;
        v45 = (_DWORD *)v26;
        do
        {
          *v45++ = vmovn_s16(v27).u32[0];
          --v44;
        }
        while (v44);
        ++v41;
        v26 += v31;
      }
      while (v41 != v22);
    }
  }
  else
  {
    uint64_t v46 = 0;
    float32x4_t v47 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v28.i32[0] = 1170939904;
    do
    {
      *(float *)v29.i32 = self->_colorTemperature1
                        + (float)((float)(v30 * (float)(int)v46)
                                * (float)(*(float *)(&self->super._hasAlphaValues + 2) - self->_colorTemperature1));
      v48.i64[0] = 0;
      v48.i32[2] = 0;
      if (*(float *)v29.i32 >= 1000.0 && *(float *)v29.i32 <= 40000.0)
      {
        int8x16_t v49 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v28, (float32x4_t)v29)), 0);
        float32x4_t v50 = vaddq_f32(vdivq_f32((float32x4_t)vbslq_s8(v49, (int8x16_t)xmmword_20B1E6E30, (int8x16_t)xmmword_20B1E6E20), vaddq_f32((float32x4_t)vbslq_s8(v49, (int8x16_t)xmmword_20B1E6E50, (int8x16_t)xmmword_20B1E6E40), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.i8, 0))), (float32x4_t)vbslq_s8(v49, (int8x16_t)xmmword_20B1E6E10, (int8x16_t)xmmword_20B1E6E00));
        v50.i32[3] = 0;
        float32x4_t v51 = vmaxnmq_f32(v50, (float32x4_t)0);
        v51.i32[3] = 0;
        float32x4_t v48 = vminnmq_f32(v51, (float32x4_t)xmmword_20B1E6E60);
      }
      v48.i32[3] = 1.0;
      int32x4_t v29 = vcvtq_s32_f32(vmulq_f32(v48, v47));
      *(int16x4_t *)v29.i8 = vmovn_s32(v29);
      uint64_t v52 = v21;
      v53 = (_DWORD *)v26;
      do
      {
        *v53++ = vmovn_s16((int16x8_t)v29).u32[0];
        --v52;
      }
      while (v52);
      ++v46;
      v26 += v31;
    }
    while (v46 != v22);
  }

  return v23;
}

@end
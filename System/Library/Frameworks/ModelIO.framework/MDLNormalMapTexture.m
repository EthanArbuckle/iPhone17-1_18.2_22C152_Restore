@interface MDLNormalMapTexture
- (MDLNormalMapTexture)initByGeneratingNormalMapWithTexture:(MDLTexture *)sourceTexture name:(NSString *)name smoothness:(float)smoothness contrast:(float)contrast;
- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4;
@end

@implementation MDLNormalMapTexture

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
    int v21 = 1;
  }
  else {
    int v21 = v20.i32[0] >> a3;
  }
  if (v20.i32[1] >> a3 <= 1) {
    int v22 = 1;
  }
  else {
    int v22 = v20.i32[1] >> a3;
  }
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  id v23 = objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_mutableBytes(v23, v24, v25);
  objc_msgSend_texelDataWithTopLeftOrigin(self->_sourceTexture, v27, v28);
  id v29 = objc_claimAutoreleasedReturnValue();
  v32 = (const void *)objc_msgSend_bytes(v29, v30, v31);
  size_t v35 = objc_msgSend_length(v23, v33, v34);
  memcpy(v26, v32, v35);
  sub_20B1BEC98(v21, v22, (unsigned int *)v26, *(float *)(&self->super._hasAlphaValues + 2), self->_smoothness);

  return v23;
}

- (MDLNormalMapTexture)initByGeneratingNormalMapWithTexture:(MDLTexture *)sourceTexture name:(NSString *)name smoothness:(float)smoothness contrast:(float)contrast
{
  v11 = sourceTexture;
  v12 = name;
  v21.receiver = self;
  v21.super_class = (Class)MDLNormalMapTexture;
  v15 = [(MDLTexture *)&v21 init];
  if (v15)
  {
    if (v12)
    {
      uint64_t v16 = objc_msgSend_stringWithString_(NSString, v13, (uint64_t)v12);
      v17 = v15->super._name;
      v15->super._name = (NSString *)v16;
    }
    objc_msgSend_dimensions(v11, v13, v14);
    *(void *)v15->super._anon_118 = v18;
    *(void *)&v15->super._anon_118[8] = 4 * (int)v18;
    v15->super._textureData.channelCount = 4;
    v15->super._channelEncoding = 1;
    *(float *)(&v15->super._hasAlphaValues + 2) = smoothness;
    v15->_smoothness = contrast;
    objc_storeStrong((id *)&v15->_sourceTexture, sourceTexture);
    v15->super._selfCreating = 1;
    int32x2_t v19 = v15;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end
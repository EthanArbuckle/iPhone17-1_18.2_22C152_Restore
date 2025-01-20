@interface MDLSkyCubeTexture
- (CGColorRef)groundColor;
- (MDLSkyCubeTexture)initWithName:(NSString *)name channelEncoding:(MDLTextureChannelEncoding)channelEncoding textureDimensions:(vector_int2)textureDimensions turbidity:(float)turbidity sunElevation:(float)sunElevation sunAzimuth:(float)sunAzimuth upperAtmosphereScattering:(float)upperAtmosphereScattering groundAlbedo:(float)groundAlbedo;
- (MDLSkyCubeTexture)initWithName:(NSString *)name channelEncoding:(MDLTextureChannelEncoding)channelEncoding textureDimensions:(vector_int2)textureDimensions turbidity:(float)turbidity sunElevation:(float)sunElevation upperAtmosphereScattering:(float)upperAtmosphereScattering groundAlbedo:(float)groundAlbedo;
- (float)brightness;
- (float)contrast;
- (float)exposure;
- (float)gamma;
- (float)groundAlbedo;
- (float)horizonElevation;
- (float)saturation;
- (float)sunAzimuth;
- (float)sunElevation;
- (float)turbidity;
- (float)upperAtmosphereScattering;
- (vector_float2)highDynamicRangeCompression;
- (void)dealloc;
- (void)setBrightness:(float)brightness;
- (void)setContrast:(float)contrast;
- (void)setExposure:(float)exposure;
- (void)setGamma:(float)gamma;
- (void)setGroundAlbedo:(float)groundAlbedo;
- (void)setGroundColor:(CGColorRef)groundColor;
- (void)setHighDynamicRangeCompression:(vector_float2)highDynamicRangeCompression;
- (void)setHorizonElevation:(float)horizonElevation;
- (void)setSaturation:(float)saturation;
- (void)setSunAzimuth:(float)sunAzimuth;
- (void)setSunElevation:(float)sunElevation;
- (void)setTurbidity:(float)turbidity;
- (void)setUpperAtmosphereScattering:(float)upperAtmosphereScattering;
- (void)updateTexture;
@end

@implementation MDLSkyCubeTexture

- (void)setGroundColor:(CGColorRef)groundColor
{
  v5 = self->_groundColor;
  if (v5) {
    CGColorRelease(v5);
  }
  self->_groundColor = CGColorCreateCopy(groundColor);
}

- (CGColorRef)groundColor
{
  return self->_groundColor;
}

- (MDLSkyCubeTexture)initWithName:(NSString *)name channelEncoding:(MDLTextureChannelEncoding)channelEncoding textureDimensions:(vector_int2)textureDimensions turbidity:(float)turbidity sunElevation:(float)sunElevation sunAzimuth:(float)sunAzimuth upperAtmosphereScattering:(float)upperAtmosphereScattering groundAlbedo:(float)groundAlbedo
{
  long long v30 = *(_OWORD *)textureDimensions.i8;
  v17 = name;
  v31.receiver = self;
  v31.super_class = (Class)MDLSkyCubeTexture;
  v18 = [(MDLTexture *)&v31 init];
  v21 = (float32x2_t *)v18;
  if (v18)
  {
    objc_msgSend_clearTexelData(v18, v19, v20);
    if (v17)
    {
      uint64_t v23 = objc_msgSend_stringWithString_(NSString, v22, (uint64_t)v17);
      v24 = (void *)v21[1];
      v21[1] = (float32x2_t)v23;
    }
    else
    {
      v24 = (void *)v21[1];
      v21[1] = (float32x2_t)&stru_26BF51EF0;
    }

    if (channelEncoding > (MDLTextureChannelEncodingFloat16|MDLTextureChannelEncodingUint8))
    {
      if (channelEncoding != MDLTextureChannelEncodingFloat32 && channelEncoding != MDLTextureChannelEncodingFloat16SR) {
        goto LABEL_15;
      }
    }
    else
    {
      if (channelEncoding == MDLTextureChannelEncodingUInt8)
      {
LABEL_16:
        v21[70].i32[0] = 1050201276;
        v26 = (const float *)&unk_20B1E9FA8;
        float32x2_t v27 = vld1_dup_f32(v26);
        v27.f32[0] = (float)(turbidity * 3.0) + 1.0;
        v21[73] = v27;
        int v25 = 4;
        channelEncoding = MDLTextureChannelEncodingUInt8;
        goto LABEL_18;
      }
      if (channelEncoding != MDLTextureChannelEncodingFloat16)
      {
LABEL_15:
        NSLog(&cfstr_OnlyUint8AndFl.isa, v30);
        goto LABEL_16;
      }
    }
    if ((channelEncoding & 0xFFFFFFFFFFFFFDFFLL) == 0x102)
    {
      v21[70].i32[0] = 1055439407;
      v21[73] = (float32x2_t)0x467A000040800000;
      int v25 = 8;
    }
    else if (channelEncoding == MDLTextureChannelEncodingFloat32)
    {
      v21[70].i32[0] = 1055439407;
      v21[73] = (float32x2_t)0x467A000040800000;
      int v25 = 16;
    }
    else
    {
      int v25 = 4;
    }
LABEL_18:
    v28.i32[0] = v30;
    v21[36] = (float32x2_t)(v25 * (int)v30);
    v28.i32[1] = 6 * DWORD1(v30);
    v21[35] = v28;
    v21[34].i32[0] = 4;
    v21[37].i8[0] = 1;
    v21[38] = (float32x2_t)channelEncoding;
    v21[67].f32[1] = turbidity;
    v21[68].f32[0] = sunElevation;
    v21[69].f32[0] = upperAtmosphereScattering;
    v21[69].f32[1] = groundAlbedo;
    v21[68].f32[1] = sunAzimuth;
    v21[75] = (float32x2_t)CGColorCreate(0, 0);
    operator new();
  }

  return 0;
}

- (MDLSkyCubeTexture)initWithName:(NSString *)name channelEncoding:(MDLTextureChannelEncoding)channelEncoding textureDimensions:(vector_int2)textureDimensions turbidity:(float)turbidity sunElevation:(float)sunElevation upperAtmosphereScattering:(float)upperAtmosphereScattering groundAlbedo:(float)groundAlbedo
{
  return (MDLSkyCubeTexture *)MEMORY[0x270F9A6D0](self, sel_initWithName_channelEncoding_textureDimensions_turbidity_sunElevation_sunAzimuth_upperAtmosphereScattering_groundAlbedo_, name);
}

- (void)dealloc
{
  sky = self->_sky;
  if (sky)
  {
    uint64_t v4 = sub_20B0AB384((uint64_t)sky);
    MEMORY[0x210532650](v4, 0x10A0C401EE0EB22);
  }
  self->_sky = 0;
  groundColor = self->_groundColor;
  if (groundColor)
  {
    CFRelease(groundColor);
    self->_groundColor = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MDLSkyCubeTexture;
  [(MDLSkyCubeTexture *)&v6 dealloc];
}

- (void)updateTexture
{
  float v3 = self->_groundAlbedo + 0.298437;
  sky = self->_sky;
  sky->var12 = v3;
  float v5 = self->_groundAlbedo + 0.298437;
  sky->var13 = v5;
  float v6 = self->_groundAlbedo + 0.298437;
  sky->var14 = v6;
  float v7 = self->_gamma + -0.139942;
  sky->var15 = v7;
  *(_OWORD *)&sky->var16 = xmmword_20B1E9F30;
  sky->var19 = *(void *)self->_highDynamicRangeCompression;
  sky->var20 = *(_DWORD *)&self->_highDynamicRangeCompression[4];
  sky->var21 = self->_exposure + 1.25;
  float v8 = self->_contrast + 4.4;
  sky->var22 = v8;
  sky->var23 = self->_brightness + 1.0;
  sky->var0 = *(float *)(&self->super._hasAlphaValues + 2) * 4.5;
  float v9 = (float)(1.0 - self->_turbidity) * 3.14159265;
  sky->var2 = v9;
  sky->var1 = self->_sunAzimuth * 1.25;
  sky->var3 = self->_sunElevation;
  sky->var4 = self->_upperAtmosphereScattering + self->_upperAtmosphereScattering;
  size_t NumberOfComponents = CGColorGetNumberOfComponents(self->_groundColor);
  Components = CGColorGetComponents(self->_groundColor);
  switch(NumberOfComponents)
  {
    case 1uLL:
      for (unsigned int i = 0; i != 3; ++i)
      {
        float v13 = *Components;
        *(&self->_sky->var8 + i) = v13;
      }
      goto LABEL_13;
    case 2uLL:
      for (unsigned int j = 0; j != 3; ++j)
      {
        float v16 = *Components;
        *(&self->_sky->var8 + j) = v16;
      }
      float v17 = Components[1];
      goto LABEL_14;
    case 3uLL:
      for (uint64_t k = 0; k != 3; ++k)
      {
        float v19 = Components[k];
        *(&self->_sky->var8 + k) = v19;
      }
LABEL_13:
      float v17 = 0.0;
LABEL_14:
      self->_sky->var11 = v17;
      break;
    case 4uLL:
      for (uint64_t m = 0; m != 4; ++m)
      {
        float v21 = Components[m];
        *(&self->_sky->var8 + m) = v21;
      }
      break;
    default:
      for (unsigned int n = 0; n != 4; ++n)
        *((_DWORD *)&self->_sky->var8 + n) = 0;
      break;
  }
  unint64_t v22 = *(void *)&self->super._anon_118[8] * *(int *)&self->super._anon_118[4];
  id v23 = objc_alloc(MEMORY[0x263EFF990]);
  int v25 = objc_msgSend_initWithLength_(v23, v24, 6 * (v22 / 6));
  if (v25)
  {
    id v32 = v25;
    objc_storeStrong((id *)self->super._topLeftOriginData, v25);
    v26 = self->super._topLeftOriginData[0];
    self->super._textureData.topLeftBytesForMip[0] = (char *)objc_msgSend_bytes(v26, v27, v28);
    if (malloc_type_malloc(16 * (int)HIDWORD(*(void *)self->super._anon_118) * (uint64_t)(int)*(void *)self->super._anon_118, 0xD15E0195uLL))
    {
      id v29 = v32;
      objc_msgSend_mutableBytes(v29, v30, v31);
      sub_20B0ABB80((uint64_t)self->_sky);
    }
  }

  MEMORY[0x270F9A758]();
}

- (float)turbidity
{
  return *(float *)(&self->super._hasAlphaValues + 2);
}

- (void)setTurbidity:(float)turbidity
{
  *(float *)(&self->super._hasAlphaValues + 2) = turbidity;
}

- (float)sunElevation
{
  return self->_turbidity;
}

- (void)setSunElevation:(float)sunElevation
{
  self->_turbidity = sunElevation;
}

- (float)sunAzimuth
{
  return self->_sunElevation;
}

- (void)setSunAzimuth:(float)sunAzimuth
{
  self->_sunElevatiounsigned int n = sunAzimuth;
}

- (float)upperAtmosphereScattering
{
  return self->_sunAzimuth;
}

- (void)setUpperAtmosphereScattering:(float)upperAtmosphereScattering
{
  self->_sunAzimuth = upperAtmosphereScattering;
}

- (float)groundAlbedo
{
  return self->_upperAtmosphereScattering;
}

- (void)setGroundAlbedo:(float)groundAlbedo
{
  self->_upperAtmosphereScattering = groundAlbedo;
}

- (float)brightness
{
  return self->_exposure;
}

- (void)setBrightness:(float)brightness
{
  self->_exposure = brightness;
}

- (float)contrast
{
  return self->_brightness;
}

- (void)setContrast:(float)contrast
{
  self->_brightness = contrast;
}

- (float)saturation
{
  return self->_contrast;
}

- (void)setSaturation:(float)saturation
{
  self->_contrast = saturation;
}

- (vector_float2)highDynamicRangeCompression
{
  return *(vector_float2 *)self->_highDynamicRangeCompression;
}

- (void)setHighDynamicRangeCompression:(vector_float2)highDynamicRangeCompression
{
  *(vector_float2 *)self->_highDynamicRangeCompressiounsigned int n = highDynamicRangeCompression;
}

- (float)horizonElevation
{
  return self->_horizonElevation;
}

- (void)setHorizonElevation:(float)horizonElevation
{
  self->_horizonElevatiounsigned int n = horizonElevation;
}

- (float)gamma
{
  return self->_groundAlbedo;
}

- (void)setGamma:(float)gamma
{
  self->_groundAlbedo = gamma;
}

- (float)exposure
{
  return self->_gamma;
}

- (void)setExposure:(float)exposure
{
  self->_gamma = exposure;
}

@end
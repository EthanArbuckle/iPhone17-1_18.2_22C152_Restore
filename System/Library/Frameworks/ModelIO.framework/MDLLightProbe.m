@interface MDLLightProbe
+ (CGColor)sampleSHAt:(id)a3 usingCoefficients:(unint64_t)a4 withLevel:;
+ (MDLLightProbe)lightProbeWithTextureSize:(NSInteger)textureSize forLocation:(MDLTransform *)transform lightsToConsider:(NSArray *)lightsToConsider objectsToConsider:(NSArray *)objectsToConsider reflectiveCubemap:(MDLTexture *)reflectiveCubemap irradianceCubemap:(MDLTexture *)irradianceCubemap;
+ (__n128)calculateIrradianceGradientUsingSamples:(double *)a3 ofSize:(uint64_t)a4 fromSH:(void *)a5 withLevel:(uint64_t)a6;
- (MDLLightProbe)initWithReflectiveTexture:(MDLTexture *)reflectiveTexture irradianceTexture:(MDLTexture *)irradianceTexture;
- (MDLTexture)irradianceTexture;
- (MDLTexture)reflectiveTexture;
- (NSData)sphericalHarmonicsCoefficients;
- (NSUInteger)sphericalHarmonicsLevel;
- (id)transform;
- (void)generateSphericalHarmonicsFromIrradiance:(NSUInteger)sphericalHarmonicsLevel;
- (void)setSphericalHarmonicsCoefficients:(id)a3;
- (void)setTransform:(id)a3;
@end

@implementation MDLLightProbe

- (NSData)sphericalHarmonicsCoefficients
{
  return (NSData *)self->_sphericalHarmonicsCoefficients;
}

- (void)setSphericalHarmonicsCoefficients:(id)a3
{
  id v7 = a3;
  objc_msgSend_dataWithData_(MEMORY[0x263EFF990], v4, (uint64_t)v7);
  v5 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  sphericalHarmonicsCoefficients = self->_sphericalHarmonicsCoefficients;
  self->_sphericalHarmonicsCoefficients = v5;
}

- (MDLLightProbe)initWithReflectiveTexture:(MDLTexture *)reflectiveTexture irradianceTexture:(MDLTexture *)irradianceTexture
{
  id v7 = reflectiveTexture;
  v8 = irradianceTexture;
  v14.receiver = self;
  v14.super_class = (Class)MDLLightProbe;
  v9 = [(MDLLight *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reflectiveTexture, reflectiveTexture);
    objc_storeStrong((id *)&v10->_irradianceTexture, irradianceTexture);
    v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    sphericalHarmonicsCoefficients = v10->_sphericalHarmonicsCoefficients;
    v10->_sphericalHarmonicsCoefficients = v11;
  }
  return v10;
}

- (void)generateSphericalHarmonicsFromIrradiance:(NSUInteger)sphericalHarmonicsLevel
{
  if (sphericalHarmonicsLevel >= 4)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v6, v10, @"ModelIOException", @"[%@ %@]: Spherical harmonics levels beyond 3 are not supported", v8, v9);
  }
  objc_msgSend_dimensions(self->_irradianceTexture, a2, sphericalHarmonicsLevel);
  long long v56 = v11;
  objc_msgSend_texelDataWithBottomLeftOrigin(self->_irradianceTexture, v12, v13);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  int v14 = (sphericalHarmonicsLevel + 1) * (sphericalHarmonicsLevel + 1);
  uint64_t v15 = v14;
  objc_msgSend_setLength_(self->_sphericalHarmonicsCoefficients, v16, 12 * v14);
  v19 = (float *)objc_msgSend_mutableBytes(self->_sphericalHarmonicsCoefficients, v17, v18);
  size_t v22 = objc_msgSend_length(self->_sphericalHarmonicsCoefficients, v20, v21);
  v53 = v19;
  bzero(v19, v22);
  self->_sphericalHarmonicsLevel = sphericalHarmonicsLevel;
  v23 = (float *)malloc_type_calloc(v14, 4uLL, 0x100004052888210uLL);
  uint64_t v55 = 0;
  v26.i64[1] = *((void *)&v56 + 1);
  uint64_t v24 = v56;
  v25.i64[0] = 1.0;
  *(double *)v26.i64 = 1.0 / (double)(int)v56;
  float v27 = *(double *)v26.i64;
  uint64_t v28 = 2 * v14;
  int v29 = v14;
  uint64_t v52 = v14 & 0xFFFFFFFD;
  float v30 = 0.0;
  do
  {
    if ((int)v24 >= 1)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          *(float *)v26.i32 = v27;
          *(double *)v33.i64 = sub_20B10D7C0(i, j, v55, v26, v25);
          float32x4_t v57 = v33;
          float v34 = sub_20B10D968(i, j, v24);
          id v35 = v54;
          uint64_t v38 = objc_msgSend_bytes(v35, v36, v37);
          switch(sphericalHarmonicsLevel)
          {
            case 0uLL:
              sub_20B10D500(v23);
              break;
            case 1uLL:
              sub_20B10D510((uint64_t)v23, (int8x16_t)v57);
              break;
            case 2uLL:
              sub_20B10D558((uint64_t)v23, (int8x16_t)v57);
              break;
            case 3uLL:
              sub_20B10D618((uint64_t)v23, v57);
              break;
            default:
              break;
          }
          if (v29 >= 1)
          {
            v40 = v53;
            v41 = (unsigned char *)(v38 + 4 * (int)v24 * (int)v24 * (5 - (int)v55) + 4 * ((int)i + (int)j * (int)v24));
            *(double *)v26.i64 = v34 * 0.00392156863;
            uint64_t v42 = v52;
            v43 = v23;
            do
            {
              LOBYTE(v39) = *v41;
              *(double *)&unint64_t v44 = (double)*(unint64_t *)&v39;
              float v45 = *v40 + *(double *)v26.i64 * *v43 * *(double *)&v44;
              float *v40 = v45;
              LOBYTE(v44) = v41[1];
              *(double *)&unint64_t v46 = (double)v44;
              float v47 = v40[v15] + *(double *)v26.i64 * *v43 * *(double *)&v46;
              v40[v15] = v47;
              float v48 = *v43++;
              LOBYTE(v46) = v41[2];
              double v39 = (double)v46;
              *(double *)v25.i64 = v40[v28] + *(double *)v26.i64 * v48 * v39;
              *(float *)v25.i32 = *(double *)v25.i64;
              v40[v28] = *(float *)v25.i32;
              ++v40;
              --v42;
            }
            while (v42);
          }
          float v30 = v34 + v30;
        }
      }
    }
    ++v55;
  }
  while (v55 != 6);
  v49 = v53;
  if (v29 >= 1)
  {
    LODWORD(v51) = 3 * v29;
    if (3 * v29 <= 1) {
      uint64_t v51 = 1;
    }
    else {
      uint64_t v51 = v51;
    }
    do
    {
      float v50 = 12.5663706 / v30;
      float *v49 = *v49 * v50;
      ++v49;
      --v51;
    }
    while (v51);
  }
  free(v23);
}

+ (__n128)calculateIrradianceGradientUsingSamples:(double *)a3 ofSize:(uint64_t)a4 fromSH:(void *)a5 withLevel:(uint64_t)a6
{
  id v10 = a5;
  float32x4_t v11 = 0uLL;
  if (v10 && a4)
  {
    float64x2_t v19 = (float64x2_t)xmmword_20B1E7960;
    do
    {
      float32x4_t v20 = v11;
      v12 = (CGColor *)objc_msgSend_sampleSHAt_usingCoefficients_withLevel_(MDLLightProbe, v9, (uint64_t)v10, a6, *a3, *(_OWORD *)&v19);
      Components = CGColorGetComponents(v12);
      float v14 = *Components;
      float64x2_t v15 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(*(float64x2_t *)(Components + 1))), v19);
      float v16 = v15.f64[0] + v14 * 0.2126 + v15.f64[1];
      float32x4_t v17 = *(float32x4_t *)a3;
      a3 += 2;
      float32x4_t v11 = vmlaq_n_f32(v20, v17, v16);
      --a4;
    }
    while (a4);
  }
  float32x4_t v21 = v11;

  return (__n128)v21;
}

+ (CGColor)sampleSHAt:(id)a3 usingCoefficients:(unint64_t)a4 withLevel:
{
  float32x4_t v38 = v4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (a4 >= 4)
  {
    id v10 = (void *)MEMORY[0x263EFF940];
    float32x4_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    uint64_t v13 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v10, v14, @"ModelIOException", @"[%@ %@]: Spherical harmonics levels beyond 3 are not supported", v12, v13, *(_OWORD *)&v38);
  }
  int v15 = a4 + 1;
  uint64_t v16 = (v15 * v15);
  if (objc_msgSend_length(v9, v7, v8) != 12 * v16)
  {
    float32x4_t v17 = (void *)MEMORY[0x263EFF940];
    uint64_t v18 = (objc_class *)objc_opt_class();
    float64x2_t v19 = NSStringFromClass(v18);
    float32x4_t v20 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v17, v21, @"ModelIOException", @"[%@ %@]: Number of spherical harmonics coefficients inconsistent with spherical harmonics level", v19, v20);
  }
  size_t v22 = (float *)malloc_type_calloc((v15 * v15), 4uLL, 0x100004052888210uLL);
  id v23 = v9;
  int8x16_t v26 = (__int32 *)objc_msgSend_bytes(v23, v24, v25);
  int32x4_t v27 = (int32x4_t)vmulq_f32(v38, v38);
  v27.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2)).u32[0];
  float32x2_t v28 = vrsqrte_f32((float32x2_t)v27.u32[0]);
  float32x2_t v29 = vmul_f32(vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v28, v28)), v28);
  float32x4_t v30 = vmulq_n_f32(v38, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v29, v29))).f32[0]);
  switch(a4)
  {
    case 0uLL:
      sub_20B10D500(v22);
      break;
    case 1uLL:
      sub_20B10D510((uint64_t)v22, (int8x16_t)v30);
      break;
    case 2uLL:
      sub_20B10D558((uint64_t)v22, (int8x16_t)v30);
      break;
    case 3uLL:
      sub_20B10D618((uint64_t)v22, v30);
      break;
    default:
      break;
  }
  if (a4 == -1)
  {
    float32x4_t v32 = 0uLL;
  }
  else
  {
    if (v16 <= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = v16;
    }
    float32x4_t v32 = 0uLL;
    float32x4_t v33 = v22;
    do
    {
      v30.i32[0] = *v26;
      float v34 = *v33++;
      v30.i32[1] = v26[v16];
      *(float32x2_t *)v30.f32 = vmul_n_f32(*(float32x2_t *)v30.f32, v34);
      v30.f32[2] = *(float *)&v26[(2 * v16)] * v34;
      float32x4_t v32 = vaddq_f32(v30, v32);
      ++v26;
      --v31;
    }
    while (v31);
  }
  float32x4_t v39 = v32;
  free(v22);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v39.f32);
  double v41 = v39.f32[2];
  uint64_t v42 = 0x3FF0000000000000;
  v36 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);

  return v36;
}

- (id)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (MDLTexture)reflectiveTexture
{
  return self->_reflectiveTexture;
}

- (MDLTexture)irradianceTexture
{
  return self->_irradianceTexture;
}

- (NSUInteger)sphericalHarmonicsLevel
{
  return self->_sphericalHarmonicsLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_sphericalHarmonicsCoefficients, 0);
  objc_storeStrong((id *)&self->_irradianceTexture, 0);

  objc_storeStrong((id *)&self->_reflectiveTexture, 0);
}

+ (MDLLightProbe)lightProbeWithTextureSize:(NSInteger)textureSize forLocation:(MDLTransform *)transform lightsToConsider:(NSArray *)lightsToConsider objectsToConsider:(NSArray *)objectsToConsider reflectiveCubemap:(MDLTexture *)reflectiveCubemap irradianceCubemap:(MDLTexture *)irradianceCubemap
{
  int v30 = textureSize;
  uint64_t v41 = *MEMORY[0x263EF8340];
  transform;
  v12 = lightsToConsider;
  float32x2_t v29 = objectsToConsider;
  reflectiveCubemap;
  irradianceCubemap;
  uint64_t v13 = objc_alloc_init(MDLScene);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  float v14 = v12;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v35, v40, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_addObject_(v13, v16, *(void *)(*((void *)&v35 + 1) + 8 * i));
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v35, v40, 16);
    }
    while (v17);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  float32x4_t v20 = v29;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v31, v39, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend_addObject_(v13, v22, *(void *)(*((void *)&v31 + 1) + 8 * j));
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v31, v39, 16);
    }
    while (v23);
  }

  id v26 = objc_alloc(MEMORY[0x263EFF990]);
  objc_msgSend_initWithLength_(v26, v27, 4 * v30 * 6 * v30);
  objc_alloc_init(MDLTransform);
  operator new();
}

@end
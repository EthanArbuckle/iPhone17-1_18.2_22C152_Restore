@interface MDLPhotometricLight
- (CGColor)evaluatedColorFromSHVector:(MDLPhotometricLight *)self;
- (MDLPhotometricLight)initWithIESProfile:(NSURL *)URL;
- (MDLTexture)generateTexture:(NSUInteger)textureSize;
- (MDLTexture)lightCubeMap;
- (NSData)sphericalHarmonicsCoefficients;
- (NSUInteger)sphericalHarmonicsLevel;
- (float)computeInnerAngle;
- (id)computeSceneKitRenderingTexture:(unint64_t)a3;
- (void)computeLumens;
- (void)generateCubemapFromLight:(NSUInteger)textureSize;
- (void)generateSphericalHarmonicsFromLight:(NSUInteger)sphericalHarmonicsLevel;
- (void)setSphericalHarmonicsCoefficients:(id)a3;
@end

@implementation MDLPhotometricLight

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

- (MDLPhotometricLight)initWithIESProfile:(NSURL *)URL
{
  v4 = URL;
  v29.receiver = self;
  v29.super_class = (Class)MDLPhotometricLight;
  v5 = [(MDLPhysicallyPlausibleLight *)&v29 init];
  if (v5)
  {
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    sphericalHarmonicsCoefficients = v5->_sphericalHarmonicsCoefficients;
    v5->_sphericalHarmonicsCoefficients = v6;

    objc_msgSend_setLightType_(v5, v8, 9);
    v10 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x263EFF8F8], v9, (uint64_t)v4);
    if (v10)
    {
      id v11 = v10;
      v14 = (const void *)objc_msgSend_bytes(v11, v12, v13);
      size_t v17 = objc_msgSend_length(v11, v15, v16);
      v18 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      *(_OWORD *)v23 = 0u;
      memset(__dst, 0, sizeof(__dst));
      if (v17 != -1)
      {
        sub_20B05CF80((unint64_t *)__dst, v17 + 1);
        v18 = __dst[0];
      }
      memcpy(v18, v14, v17);
      *((unsigned char *)__dst[0] + v17) = 0;
      sub_20B0AD5E8(__dst[0], (unint64_t)__dst[0] + v17, (uint64_t)v23);
      light = v5->super.super._light;
      if (light) {
        (*((void (**)(RTLight *))light->var0 + 1))(light);
      }
      operator new();
    }
    NSLog(&cfstr_UrlProvidedFor.isa);
    v20 = v5;
  }
  return v5;
}

- (void)generateCubemapFromLight:(NSUInteger)textureSize
{
  unsigned int v5 = 6 * textureSize;
  id v6 = objc_alloc(MEMORY[0x263EFF990]);
  unsigned int v36 = v5;
  id v37 = objc_msgSend_initWithLength_(v6, v7, (int)(4 * textureSize * v5));
  uint64_t v10 = objc_msgSend_bytes(v37, v8, v9);
  if (self->_iesLight)
  {
    v11.i64[0] = 1.0;
    int v13 = 5;
    float32x4_t v38 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    int8x16_t v14 = (int8x16_t)xmmword_20B1E7680;
    do
    {
      int v15 = v13;
      if ((int)textureSize >= 1)
      {
        int v16 = 0;
        do
        {
          int v17 = 0;
          v18 = (unsigned char *)v10;
          do
          {
            float v12 = 1.0 / (double)(int)textureSize;
            *(float *)v14.i32 = v12;
            *(double *)v19.i64 = sub_20B10D7C0(v17, v16, v15, v14, v11);
            float32x4_t v39 = v19;
            iesLight = (id *)self->_iesLight;
            id v21 = iesLight[2];
            objc_msgSend_translation(v21, v22, v23);
            long long v25 = (CGColor *)(*((uint64_t (**)(id *, float32x4_t))*iesLight + 2))(iesLight, vaddq_f32(v24, v39));

            Components = (float64x2_t *)CGColorGetComponents(v25);
            float32x4_t v27 = *(float32x4_t *)Components;
            *(float32x2_t *)v27.f32 = vcvt_f32_f64(*Components);
            float32_t v28 = Components[1].f64[0];
            v27.f32[2] = v28;
            float32x4_t v29 = vmulq_f32(v27, v38);
            v29.i32[3] = 0;
            float32x4_t v30 = vmaxnmq_f32(v29, (float32x4_t)0);
            v30.i32[3] = 0;
            int8x16_t v11 = (int8x16_t)xmmword_20B1E7680;
            int8x16_t v14 = (int8x16_t)vminnmq_f32(v30, (float32x4_t)xmmword_20B1E7680);
            unsigned char *v18 = (int)*(float *)v14.i32;
            v11.i32[0] = v14.i32[1];
            v18[1] = (int)*(float *)&v14.i32[1];
            v18[2] = (int)*(float *)&v14.i32[2];
            uint64_t v10 = (uint64_t)(v18 + 4);
            v18[3] = -1;
            ++v17;
            v18 += 4;
          }
          while (textureSize != v17);
          ++v16;
        }
        while (v16 != textureSize);
      }
      int v13 = v15 - 1;
    }
    while (v15);
  }
  v31 = [MDLTexture alloc];
  char v35 = 1;
  isCube = (MDLTexture *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v31, v32, (uint64_t)v37, 0, 0, 4 * textureSize, 4, 1, COERCE_DOUBLE(__PAIR64__(v36, textureSize)), v35);
  lightCubeMap = self->_lightCubeMap;
  self->_lightCubeMap = isCube;
}

- (void)computeLumens
{
  if (self->_iesLight)
  {
    int v6 = 5;
    float v7 = 0.0;
    float v8 = 0.0;
    do
    {
      int v9 = 0;
      int v10 = v6;
      do
      {
        for (int i = 0; i != 128; ++i)
        {
          v3.i64[0] = 0x3C0000003C000000;
          *(double *)v12.i64 = sub_20B10D7C0(i, v9, v10, v3, v4);
          float32x4_t v21 = v12;
          iesLight = (id *)self->_iesLight;
          id v14 = iesLight[2];
          objc_msgSend_translation(v14, v15, v16);
          float v20 = *((float *)self->_iesLight + 34) * sub_20B10E98C((uint64_t)iesLight, v18, v19, vaddq_f32(v17, v21));

          *(float *)v3.i32 = sub_20B10D968(i, v9, 128);
          float v7 = v7 + (float)(v20 * *(float *)v3.i32);
          float v8 = *(float *)v3.i32 + v8;
        }
        ++v9;
      }
      while (v9 != 128);
      int v6 = v10 - 1;
    }
    while (v10);
    *(double *)v3.i64 = v7 * 12.5663706 / v8;
    *(float *)v3.i32 = *(double *)v3.i64;
  }
  else
  {
    v3.i32[0] = 2143289344;
  }

  objc_msgSend_setLumens_(self, a2, v2, *(double *)v3.i64);
}

- (float)computeInnerAngle
{
  iesLight = (float *)self->_iesLight;
  uint64_t v4 = *((void *)iesLight + 11);
  uint64_t v3 = *((void *)iesLight + 12);
  uint64_t v5 = v3 - v4;
  if (v3 == v4) {
    return -1.0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = v5 >> 2;
  uint64_t v10 = *((void *)iesLight + 8);
  uint64_t v9 = *((void *)iesLight + 9);
  unint64_t v11 = (v9 - v10) >> 2;
  if (v11 <= 1) {
    unint64_t v11 = 1;
  }
  if (v8 <= 1) {
    unint64_t v8 = 1;
  }
  float result = -1.0;
  do
  {
    if (v9 != v10)
    {
      int v13 = (float *)(*((void *)iesLight + 14) + v6);
      unint64_t v14 = v11;
      int v15 = (float *)*((void *)iesLight + 8);
      do
      {
        float v16 = *v15++;
        float v17 = v16;
        float v18 = *v13++;
        float v19 = iesLight[35] * v18;
        if (result < v17 && v19 > 0.0) {
          float result = v17;
        }
        --v14;
      }
      while (v14);
    }
    ++v7;
    v6 += (v9 - v10) & 0xFFFFFFFFFFFFFFFCLL;
  }
  while (v7 != v8);
  return result;
}

- (MDLTexture)generateTexture:(NSUInteger)textureSize
{
  objc_msgSend_innerConeAngle(self, a2, textureSize);
  iesLight = (id *)self->_iesLight;
  if (iesLight)
  {
    float v7 = v5;
    id v8 = iesLight[2];
    objc_msgSend_translation(v8, v9, v10);
    float32x4_t v117 = v11;
    objc_msgSend_rotationMatrixAtTime_(v8, v12, v13, 0.0);
    float32x4_t v107 = v14;
    float32x4_t v109 = v15;
    float32x4_t v111 = v16;
    float32x4_t v114 = v17;
    objc_msgSend_rotationMatrixAtTime_(v8, v18, v19, 0.0);
    float32x4_t v118 = v24;
    if (*((void *)self->_iesLight + 12) - *((void *)self->_iesLight + 11) == 4 && v7 < 180.0)
    {
      float32x4_t v104 = v22;
      float32x4_t v105 = v23;
      float32x4_t v106 = v21;
      id v71 = objc_alloc(MEMORY[0x263EFF990]);
      id v28 = objc_msgSend_initWithLength_(v71, v72, textureSize);
      uint64_t v75 = objc_msgSend_bytes(v28, v73, v74);
      if ((int)textureSize >= 1)
      {
        uint64_t v76 = v75;
        uint64_t v77 = 0;
        __asm { FMOV            V1.4S, #-1.0 }
        float32x4_t v116 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(v107, (float32x4_t)0), (float32x4_t)0, v109), _Q1, v111), (float32x4_t)0, v114);
        int32x4_t v82 = (int32x4_t)vmulq_f32(v116, v116);
        v82.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v82.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v82.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v82, 2)).u32[0];
        float32x2_t v83 = vrsqrte_f32((float32x2_t)v82.u32[0]);
        float32x2_t v84 = vmul_f32(vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v83, v83)), v83);
        *(float32x2_t *)v82.i8 = vmul_f32(v84, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v84, v84)));
        float32x4_t v113 = (float32x4_t)v82;
        float32x4_t v120 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v118, (float32x4_t)0, v106), (float32x4_t)0, v104), (float32x4_t)0, v105);
        int32x4_t v85 = (int32x4_t)vmulq_f32(v120, v120);
        v85.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v85.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v85.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v85, 2)).u32[0];
        *(float32x2_t *)v82.i8 = vrsqrte_f32((float32x2_t)v85.u32[0]);
        *(float32x2_t *)v82.i8 = vmul_f32(vrsqrts_f32((float32x2_t)v85.u32[0], vmul_f32(*(float32x2_t *)v82.i8, *(float32x2_t *)v82.i8)), *(float32x2_t *)v82.i8);
        float32x4_t v108 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        *(float32x2_t *)v85.i8 = vmul_f32(*(float32x2_t *)v82.i8, vrsqrts_f32((float32x2_t)v85.u32[0], vmul_f32(*(float32x2_t *)v82.i8, *(float32x2_t *)v82.i8)));
        float32x4_t v110 = (float32x4_t)v85;
        float v86 = v7 * 0.017453;
        do
        {
          v87 = self->_iesLight;
          __float2 v90 = __sincosf_stret((float)(v86 * (float)(int)v77) * (float)(1.0 / (float)(textureSize - 1)));
          v89.f32[0] = v90.__cosval;
          v88.f32[0] = v90.__sinval;
          float32x4_t v91 = vmlaq_n_f32(vmulq_n_f32(v120, vmulq_f32(v88, v110).f32[0]), v116, vmulq_f32(v89, v113).f32[0]);
          int32x4_t v92 = (int32x4_t)vmulq_f32(v91, v91);
          v92.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v92.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2)).u32[0];
          *(float32x2_t *)v89.f32 = vrsqrte_f32((float32x2_t)v92.u32[0]);
          *(float32x2_t *)v89.f32 = vmul_f32(vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(*(float32x2_t *)v89.f32, *(float32x2_t *)v89.f32)), *(float32x2_t *)v89.f32);
          v93 = (CGColor *)(*(uint64_t (**)(void *, float32x4_t))(*(void *)v87 + 16))(v87, vmlaq_n_f32(v117, v91, vmul_f32(*(float32x2_t *)v89.f32, vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(*(float32x2_t *)v89.f32, *(float32x2_t *)v89.f32))).f32[0]));
          Components = (float64x2_t *)CGColorGetComponents(v93);
          float32x4_t v95 = *(float32x4_t *)Components;
          *(float32x2_t *)v95.f32 = vcvt_f32_f64(*Components);
          float32_t v96 = Components[1].f64[0];
          v95.f32[2] = v96;
          float32x4_t v97 = vmulq_f32(v95, v108);
          v97.i32[3] = 0;
          float32x4_t v98 = vmaxnmq_f32(v97, (float32x4_t)0);
          v98.i32[3] = 0;
          *(unsigned char *)(v76 + v77++) = (int)vminnmq_f32(v98, (float32x4_t)xmmword_20B1E7680).f32[0];
        }
        while (textureSize != v77);
      }
      v99 = [MDLTexture alloc];
      uint64_t isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v99, v100, (uint64_t)v28, 0, 0, (int)textureSize, 1, 1, COERCE_DOUBLE(textureSize | 0x100000000), 0);
      goto LABEL_26;
    }
    if (v7 < 89.0)
    {
      id v26 = objc_alloc(MEMORY[0x263EFF990]);
      id v28 = objc_msgSend_initWithLength_(v26, v27, textureSize * textureSize);
      uint64_t v31 = objc_msgSend_bytes(v28, v29, v30);
      if ((int)textureSize >= 1)
      {
        uint64_t v34 = v31;
        int v35 = 0;
        float32x4_t v112 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        float v115 = v7 * 0.017453;
        double v36 = 1.0 / (double)(int)textureSize;
        do
        {
          uint64_t v37 = 0;
          float v38 = ((double)v35 + (double)v35) * v36 + -1.0;
          float v39 = v38 * v38;
          double v40 = v38;
          do
          {
            *(double *)v32.i64 = ((double)(int)v37 + (double)(int)v37) * v36 + -1.0;
            *(float *)v32.i32 = *(double *)v32.i64;
            int8x16_t v119 = v32;
            float v41 = sqrtf(v39 + (float)(*(float *)v32.i32 * *(float *)v32.i32));
            *(double *)v32.i64 = v41;
            if (v41 < 0.01) {
              *(double *)v32.i64 = 0.01;
            }
            *(double *)v32.i64 = v40 / *(double *)v32.i64;
            *(float *)v32.i32 = *(double *)v32.i64;
            float v42 = fabsf(*(float *)v32.i32);
            v33.i32[0] = 1.0;
            v43.i64[0] = 0x8000000080000000;
            v43.i64[1] = 0x8000000080000000;
            LODWORD(v44) = vbslq_s8(v43, v33, v32).u32[0];
            if (*(float *)v32.i32 == 0.0) {
              float v44 = 0.0;
            }
            if (v42 > 1.0) {
              *(float *)v32.i32 = v44;
            }
            float v45 = v115 * v41;
            float v46 = acosf(*(float *)v32.i32);
            v47.i64[0] = 0x8000000080000000;
            v47.i64[1] = 0x8000000080000000;
            v48.i32[0] = 1.0;
            LODWORD(v49) = vbslq_s8(v47, v48, v119).u32[0];
            if (*(float *)v119.i32 == 0.0) {
              float v49 = 0.0;
            }
            float v50 = v46 * v49;
            __float2 v51 = __sincosf_stret(v45);
            __float2 v52 = __sincosf_stret(v50);
            v53.f32[0] = v52.__sinval * v51.__sinval;
            v53.f32[1] = v52.__cosval * v51.__sinval;
            v53.f32[2] = -v51.__cosval;
            int32x4_t v54 = (int32x4_t)vmulq_f32(v53, v53);
            v54.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v54.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v54.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v54, 2)).u32[0];
            float32x2_t v55 = vrsqrte_f32((float32x2_t)v54.u32[0]);
            float32x2_t v56 = vmul_f32(vrsqrts_f32((float32x2_t)v54.u32[0], vmul_f32(v55, v55)), v55);
            v57 = (CGColor *)(*(uint64_t (**)(void *, float32x4_t))(*(void *)self->_iesLight + 16))(self->_iesLight, vmlaq_n_f32(v117, v53, vmul_f32(v56, vrsqrts_f32((float32x2_t)v54.u32[0], vmul_f32(v56, v56))).f32[0]));
            v58 = (float64x2_t *)CGColorGetComponents(v57);
            float32x4_t v59 = *(float32x4_t *)v58;
            *(float32x2_t *)v59.f32 = vcvt_f32_f64(*v58);
            float32_t v60 = v58[1].f64[0];
            v59.f32[2] = v60;
            float32x4_t v61 = vmulq_f32(v59, v112);
            v61.i32[3] = 0;
            float32x4_t v62 = vmaxnmq_f32(v61, (float32x4_t)0);
            v62.i32[3] = 0;
            int8x16_t v32 = (int8x16_t)vminnmq_f32(v62, (float32x4_t)xmmword_20B1E7680);
            *(unsigned char *)(v34 + v37++) = (int)*(float *)v32.i32;
          }
          while (textureSize != v37);
          ++v35;
          v34 += v37;
        }
        while (v35 != textureSize);
      }
      v63 = [MDLTexture alloc];
      uint64_t isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v63, v64, (uint64_t)v28, 0, 0, (int)textureSize, 1, 1, COERCE_DOUBLE(vdup_n_s32(textureSize)), 0);
LABEL_26:
      v101 = (void *)isCube;

      goto LABEL_31;
    }
    lightCubeMap = self->_lightCubeMap;
    if (!lightCubeMap)
    {
      objc_msgSend_generateCubemapFromLight_(self, v20, textureSize);
      lightCubeMap = self->_lightCubeMap;
    }
    v70 = lightCubeMap;
  }
  else
  {
    NSLog(&cfstr_IeslightNotPro.isa);
    char v121 = 0;
    v66 = [MDLTexture alloc];
    id v67 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v8 = (id)objc_msgSend_initWithBytes_length_(v67, v68, (uint64_t)&v121, 1);
    v70 = (MDLTexture *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v66, v69, (uint64_t)v8, 0, 0, 1, 1, 1, COERCE_DOUBLE(0x100000001), 0);
  }
  v101 = v70;
LABEL_31:

  return (MDLTexture *)v101;
}

- (id)computeSceneKitRenderingTexture:(unint64_t)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_generateTexture_, a3);
}

- (void)generateSphericalHarmonicsFromLight:(NSUInteger)sphericalHarmonicsLevel
{
  if (sphericalHarmonicsLevel >= 4)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF940];
    float v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v6, v10, @"ModelIOException", @"[%@ %@]: Spherical harmonics levels beyond 3 are not supported", v8, v9);
  }
  objc_msgSend_dimensions(self->_lightCubeMap, a2, sphericalHarmonicsLevel);
  long long v57 = v11;
  float32x4_t v14 = objc_msgSend_texelDataWithBottomLeftOrigin(self->_lightCubeMap, v12, v13);
  if (!self->_iesLight)
  {
    id v55 = v14;
    int v16 = (sphericalHarmonicsLevel + 1) * (sphericalHarmonicsLevel + 1);
    uint64_t v17 = v16;
    objc_msgSend_setLength_(self->_sphericalHarmonicsCoefficients, v15, 12 * v16);
    float v20 = (float *)objc_msgSend_mutableBytes(self->_sphericalHarmonicsCoefficients, v18, v19);
    size_t v23 = objc_msgSend_length(self->_sphericalHarmonicsCoefficients, v21, v22);
    int32x4_t v54 = v20;
    bzero(v20, v23);
    self->_sphericalHarmonicsLevel = sphericalHarmonicsLevel;
    float32x4_t v24 = (float *)malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL);
    uint64_t v56 = 0;
    v27.i64[1] = *((void *)&v57 + 1);
    uint64_t v25 = v57;
    v26.i64[0] = 1.0;
    *(double *)v27.i64 = 1.0 / (double)(int)v57;
    float v28 = *(double *)v27.i64;
    uint64_t v29 = 2 * v16;
    int v30 = v16;
    uint64_t v53 = v16 & 0xFFFFFFFD;
    float v31 = 0.0;
    do
    {
      if ((int)v25 >= 1)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            *(float *)v27.i32 = v28;
            *(double *)v34.i64 = sub_20B10D7C0(i, j, v56, v27, v26);
            float32x4_t v58 = v34;
            float v35 = sub_20B10D968(i, j, v25);
            id v36 = v55;
            uint64_t v39 = objc_msgSend_bytes(v36, v37, v38);
            switch(sphericalHarmonicsLevel)
            {
              case 0uLL:
                sub_20B10D500(v24);
                break;
              case 1uLL:
                sub_20B10D510((uint64_t)v24, (int8x16_t)v58);
                break;
              case 2uLL:
                sub_20B10D558((uint64_t)v24, (int8x16_t)v58);
                break;
              case 3uLL:
                sub_20B10D618((uint64_t)v24, v58);
                break;
              default:
                break;
            }
            if (v30 >= 1)
            {
              float v41 = v54;
              float v42 = (unsigned char *)(v39 + 4 * (int)v25 * (int)v25 * (5 - (int)v56) + 4 * ((int)i + (int)j * (int)v25));
              *(double *)v27.i64 = v35 * 0.00392156863;
              uint64_t v43 = v53;
              float v44 = v24;
              do
              {
                LOBYTE(v40) = *v42;
                *(double *)&unint64_t v45 = (double)*(unint64_t *)&v40;
                float v46 = *v41 + *(double *)v27.i64 * *v44 * *(double *)&v45;
                *float v41 = v46;
                LOBYTE(v45) = v42[1];
                *(double *)&unint64_t v47 = (double)v45;
                float v48 = v41[v17] + *(double *)v27.i64 * *v44 * *(double *)&v47;
                v41[v17] = v48;
                float v49 = *v44++;
                LOBYTE(v47) = v42[2];
                double v40 = (double)v47;
                *(double *)v26.i64 = v41[v29] + *(double *)v27.i64 * v49 * v40;
                *(float *)v26.i32 = *(double *)v26.i64;
                v41[v29] = *(float *)v26.i32;
                ++v41;
                --v43;
              }
              while (v43);
            }
            float v31 = v35 + v31;
          }
        }
      }
      ++v56;
    }
    while (v56 != 6);
    float v50 = v54;
    if (v30 >= 1)
    {
      LODWORD(v52) = 3 * v30;
      if (3 * v30 <= 1) {
        uint64_t v52 = 1;
      }
      else {
        uint64_t v52 = v52;
      }
      do
      {
        float v51 = 12.5663706 / v31;
        *float v50 = *v50 * v51;
        ++v50;
        --v52;
      }
      while (v52);
    }
    free(v24);
    float32x4_t v14 = v55;
  }
}

- (CGColor)evaluatedColorFromSHVector:(MDLPhotometricLight *)self
{
  float32x4_t v22 = v2;
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v4 = LODWORD(self->_sphericalHarmonicsLevel) + 1;
  size_t v5 = (v4 * v4);
  uint64_t v6 = (float *)malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
  uint64_t v9 = (__int32 *)objc_msgSend_mutableBytes(self->_sphericalHarmonicsCoefficients, v7, v8);
  int32x4_t v10 = (int32x4_t)vmulq_f32(v22, v22);
  v10.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2)).u32[0];
  float32x2_t v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
  float32x2_t v12 = vmul_f32(vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)), v11);
  float32x4_t v13 = vmulq_n_f32(v22, vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
  switch(self->_sphericalHarmonicsLevel)
  {
    case 0uLL:
      sub_20B10D500(v6);
      if (v4) {
        goto LABEL_9;
      }
      goto LABEL_16;
    case 1uLL:
      sub_20B10D510((uint64_t)v6, (int8x16_t)v13);
      if (!v4) {
        goto LABEL_16;
      }
      goto LABEL_9;
    case 2uLL:
      sub_20B10D558((uint64_t)v6, (int8x16_t)v13);
      if (v4) {
        goto LABEL_9;
      }
      goto LABEL_16;
    case 3uLL:
      sub_20B10D618((uint64_t)v6, v13);
      if (!v4) {
        goto LABEL_16;
      }
      goto LABEL_9;
    default:
      NSLog(&cfstr_ComputationOfS.isa, *(double *)v13.i64, self->_sphericalHarmonicsLevel);
      if (v4)
      {
LABEL_9:
        if (v5 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v5;
        }
        float32x4_t v16 = 0uLL;
        uint64_t v17 = v6;
        do
        {
          v14.i32[0] = *v9;
          float v18 = *v17++;
          v14.i32[1] = v9[v5];
          *(float32x2_t *)v14.f32 = vmul_n_f32(*(float32x2_t *)v14.f32, v18);
          v14.f32[2] = *(float *)&v9[(2 * v5)] * v18;
          float32x4_t v16 = vaddq_f32(v14, v16);
          ++v9;
          --v15;
        }
        while (v15);
      }
      else
      {
LABEL_16:
        float32x4_t v16 = 0uLL;
      }
      float32x4_t v23 = v16;
      free(v6);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v23.f32);
      double v25 = v23.f32[2];
      uint64_t v26 = 0x3FF0000000000000;
      float v20 = CGColorCreate(DeviceRGB, components);
      CGColorSpaceRelease(DeviceRGB);
      return v20;
  }
}

- (MDLTexture)lightCubeMap
{
  return self->_lightCubeMap;
}

- (NSUInteger)sphericalHarmonicsLevel
{
  return self->_sphericalHarmonicsLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightCubeMap, 0);

  objc_storeStrong((id *)&self->_sphericalHarmonicsCoefficients, 0);
}

@end
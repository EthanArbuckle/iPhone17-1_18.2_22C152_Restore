@interface MDLCamera
- (CAAnimation)apertureAnimation;
- (CAAnimation)apertureAspectAnimation;
- (CAAnimation)fStopAnimation;
- (CAAnimation)focalDistanceAnimation;
- (CAAnimation)focalLengthAnimation;
- (MDLCamera)init;
- (MDLCameraProjection)projection;
- (MDLTexture)bokehKernelWithSize:(vector_int2)size;
- (NSTimeInterval)shutterOpenInterval;
- (NSUInteger)apertureBladeCount;
- (RTCamera)rtCamera;
- (double)getViewMatrixAtTime:(uint64_t)a1;
- (float)aperture;
- (float)aspect;
- (float)barrelDistortion;
- (float)chromaticAberration;
- (float)circleOfConfusionForDistance:(float)a3;
- (float)fStop;
- (float)farVisibilityDistance;
- (float)fieldOfView;
- (float)fisheyeDistortion;
- (float)focalLength;
- (float)focusDistance;
- (float)fov;
- (float)getProjectionMatrixAtTime:(uint64_t)a1;
- (float)maximumCircleOfConfusion;
- (float)nearVisibilityDistance;
- (float)opticalVignetting;
- (float)sensorAspect;
- (float)sensorVerticalAperture;
- (float)worldToMetersConversionScale;
- (float)zFar;
- (float)zNear;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)version;
- (matrix_float4x4)projectionMatrix;
- (vector_float2)exposureCompression;
- (vector_float2)sensorEnlargement;
- (vector_float2)sensorShift;
- (vector_float3)exposure;
- (vector_float3)flash;
- (vector_float3)rayTo:(vector_int2)pixel forViewPort:(vector_int2)size;
- (void)dealloc;
- (void)frameBoundingBox:(MDLAxisAlignedBoundingBox *)boundingBox setNearAndFar:(BOOL)setNearAndFar;
- (void)lookAt:(vector_float3)focusPosition;
- (void)lookAt:(vector_float3)focusPosition from:(vector_float3)cameraPosition;
- (void)setAperture:(float)a3;
- (void)setApertureAnimation:(id)a3;
- (void)setApertureAspectAnimation:(id)a3;
- (void)setApertureBladeCount:(NSUInteger)apertureBladeCount;
- (void)setAspect:(float)a3;
- (void)setBarrelDistortion:(float)barrelDistortion;
- (void)setChromaticAberration:(float)chromaticAberration;
- (void)setExposure:(vector_float3)exposure;
- (void)setExposureCompression:(vector_float2)exposureCompression;
- (void)setFStop:(float)fStop;
- (void)setFStopAnimation:(id)a3;
- (void)setFarVisibilityDistance:(float)farVisibilityDistance;
- (void)setFieldOfView:(float)fieldOfView;
- (void)setFisheyeDistortion:(float)fisheyeDistortion;
- (void)setFlash:(vector_float3)flash;
- (void)setFocalDistanceAnimation:(id)a3;
- (void)setFocalLength:(float)focalLength;
- (void)setFocalLengthAnimation:(id)a3;
- (void)setFocusDistance:(float)focusDistance;
- (void)setFov:(float)a3;
- (void)setMaximumCircleOfConfusion:(float)maximumCircleOfConfusion;
- (void)setNearVisibilityDistance:(float)nearVisibilityDistance;
- (void)setOpticalVignetting:(float)opticalVignetting;
- (void)setProjection:(MDLCameraProjection)projection;
- (void)setSensorAspect:(float)sensorAspect;
- (void)setSensorEnlargement:(vector_float2)sensorEnlargement;
- (void)setSensorShift:(vector_float2)sensorShift;
- (void)setSensorVerticalAperture:(float)sensorVerticalAperture;
- (void)setShutterOpenInterval:(NSTimeInterval)shutterOpenInterval;
- (void)setWorldToMetersConversionScale:(float)worldToMetersConversionScale;
- (void)setZFar:(float)a3;
- (void)setZNear:(float)a3;
@end

@implementation MDLCamera

- (MDLCamera)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLCamera;
  v2 = [(MDLObject *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(MDLTransform);
    objc_msgSend_setTransform_(v2, v4, (uint64_t)v3);

    operator new();
  }

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v13 = objc_msgSend_transform(self, v11, v12);
  v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  LODWORD(v14) = objc_msgSend_isSubclassOfClass_(v14, v16, v15);

  if (v14)
  {
    v19 = objc_msgSend_transform(self, v17, v18);
    v21 = objc_msgSend_copyWithZone_(v19, v20, (uint64_t)a3);
    objc_msgSend_setTransform_((void *)v10, v22, (uint64_t)v21);
  }
  *(float *)(v10 + 64) = self->_worldToMetersConversionScale;
  focalDistanceAnimation = self->_focalDistanceAnimation;
  if (focalDistanceAnimation)
  {
    uint64_t v24 = objc_msgSend_copyWithZone_(focalDistanceAnimation, v17, (uint64_t)a3);
    v25 = *(void **)(v10 + 72);
    *(void *)(v10 + 72) = v24;
  }
  fStopAnimation = self->_fStopAnimation;
  if (fStopAnimation)
  {
    uint64_t v27 = objc_msgSend_copyWithZone_(fStopAnimation, v17, (uint64_t)a3);
    v28 = *(void **)(v10 + 80);
    *(void *)(v10 + 80) = v27;
  }
  focalLengthAnimation = self->_focalLengthAnimation;
  if (focalLengthAnimation)
  {
    uint64_t v30 = objc_msgSend_copyWithZone_(focalLengthAnimation, v17, (uint64_t)a3);
    v31 = *(void **)(v10 + 88);
    *(void *)(v10 + 88) = v30;
  }
  apertureAnimation = self->_apertureAnimation;
  if (apertureAnimation)
  {
    uint64_t v33 = objc_msgSend_copyWithZone_(apertureAnimation, v17, (uint64_t)a3);
    v34 = *(void **)(v10 + 96);
    *(void *)(v10 + 96) = v33;
  }
  apertureAspectAnimation = self->_apertureAspectAnimation;
  if (apertureAspectAnimation)
  {
    uint64_t v36 = objc_msgSend_copyWithZone_(apertureAspectAnimation, v17, (uint64_t)a3);
    v37 = *(void **)(v10 + 104);
    *(void *)(v10 + 104) = v36;
  }
  operator new();
}

- (void)dealloc
{
  camera = self->_camera;
  if (camera) {
    (*((void (**)(RTCamera *, SEL))camera->var0 + 1))(camera, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)MDLCamera;
  [(MDLCamera *)&v4 dealloc];
}

- (int64_t)version
{
  return 1;
}

- (RTCamera)rtCamera
{
  return self->_camera;
}

- (double)getViewMatrixAtTime:(uint64_t)a1
{
  return sub_20B148F40(*(void *)(a1 + 56), 0.0);
}

- (matrix_float4x4)projectionMatrix
{
  float v2 = sub_20B148F88((uint64_t)self->_camera, 0.0);
  result.columns[3].i64[1] = v10;
  result.columns[3].i64[0] = v9;
  result.columns[2].i64[1] = v8;
  result.columns[2].i64[0] = v7;
  result.columns[1].i64[1] = v6;
  result.columns[1].i64[0] = v5;
  result.columns[0].i64[1] = v4;
  result.columns[0].f32[1] = v3;
  result.columns[0].f32[0] = v2;
  return result;
}

- (float)getProjectionMatrixAtTime:(uint64_t)a1
{
  return sub_20B148F88(*(void *)(a1 + 56), 0.0);
}

- (vector_float3)rayTo:(vector_int2)pixel forViewPort:(vector_int2)size
{
  sub_20B149090((float32x4_t *)self->_camera, COERCE_DOUBLE(vcvt_f32_s32((int32x2_t)pixel)), COERCE_DOUBLE(vcvt_f32_s32((int32x2_t)size)));
  result.i64[1] = v5;
  result.i64[0] = v4;
  return result;
}

- (float)focalLength
{
  return self->_camera[1].var19;
}

- (void)setFocalLength:(float)focalLength
{
  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[0].f32[2] = focalLength;
  camera[3].columns[2].f32[3] = atanf(camera[3].columns[2].f32[2] / (float)(focalLength + focalLength)) * 114.59;

  sub_20B148194(camera);
}

- (float)focusDistance
{
  return *((float *)&self->_camera[2].var2 + 1);
}

- (void)setFocusDistance:(float)focusDistance
{
  *((float *)&self->_camera[2].var2 + 1) = focusDistance;
}

- (float)aperture
{
  return self->_camera[2].var3;
}

- (void)setAperture:(float)a3
{
  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[2].f32[2] = a3;
  camera[3].columns[2].f32[3] = atanf(a3 / (float)(camera[3].columns[0].f32[2] + camera[3].columns[0].f32[2])) * 114.59;

  sub_20B148194(camera);
}

- (float)sensorVerticalAperture
{
  return self->_camera[2].var3;
}

- (void)setSensorVerticalAperture:(float)sensorVerticalAperture
{
  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[2].f32[2] = sensorVerticalAperture;
  camera[3].columns[2].f32[3] = atanf(sensorVerticalAperture/ (float)(camera[3].columns[0].f32[2] + camera[3].columns[0].f32[2]))* 114.59;

  sub_20B148194(camera);
}

- (vector_float2)sensorEnlargement
{
  return (vector_float2)self->_camera[2].var0;
}

- (void)setSensorEnlargement:(vector_float2)sensorEnlargement
{
  self->_camera[2].var0 = (void **)sensorEnlargement;
}

- (vector_float2)sensorShift
{
  return (vector_float2)self->_camera[2].var1;
}

- (void)setSensorShift:(vector_float2)sensorShift
{
  self->_camera[2].var1 = (unint64_t)sensorShift;
}

- (float)fov
{
  return self->_camera[2].var4;
}

- (void)setFov:(float)a3
{
}

- (float)fieldOfView
{
  return self->_camera[2].var4;
}

- (void)setFieldOfView:(float)fieldOfView
{
}

- (float)aspect
{
  return *(float *)&self->_camera[2].var5;
}

- (void)setAspect:(float)a3
{
  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[3].f32[0] = a3;
  sub_20B148194(camera);
}

- (float)sensorAspect
{
  return *(float *)&self->_camera[2].var5;
}

- (void)setSensorAspect:(float)sensorAspect
{
  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[3].f32[0] = sensorAspect;
  sub_20B148194(camera);
}

- (float)circleOfConfusionForDistance:(float)a3
{
  float result = (float)(self->_camera[1].var19 * self->_camera[2].var3) / (float)(a3 - self->_camera[1].var19);
  if (result >= self->_maximumCircleOfConfusion) {
    return self->_maximumCircleOfConfusion;
  }
  return result;
}

- (float)zNear
{
  return self->_camera[2].var11;
}

- (void)setZNear:(float)a3
{
  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[0] = a3;
  sub_20B148194(camera);
}

- (float)zFar
{
  return self->_camera[2].var12;
}

- (void)setZFar:(float)a3
{
  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[1] = a3;
  sub_20B148194(camera);
}

- (float)nearVisibilityDistance
{
  return self->_camera[2].var11;
}

- (void)setNearVisibilityDistance:(float)nearVisibilityDistance
{
  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[0] = nearVisibilityDistance;
  sub_20B148194(camera);
}

- (float)farVisibilityDistance
{
  return self->_camera[2].var12;
}

- (void)setFarVisibilityDistance:(float)farVisibilityDistance
{
  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[1] = farVisibilityDistance;
  sub_20B148194(camera);
}

- (MDLTexture)bokehKernelWithSize:(vector_int2)size
{
  int v4 = size.i32[0];
  int v5 = size.i32[1];
  size_t v46 = 4 * size.i32[1] * size.i32[0];
  v47 = (int *)malloc_type_malloc(v46, 0xB538CCF4uLL);
  int v8 = objc_msgSend_apertureBladeCount(self, v6, v7);
  int v10 = v8;
  if (v4 >= 0) {
    int v11 = v4;
  }
  else {
    int v11 = v4 + 1;
  }
  int v12 = v11 >> 1;
  if (v5 >= 0) {
    int v13 = v5;
  }
  else {
    int v13 = v5 + 1;
  }
  int v48 = -(v13 >> 1);
  if ((v8 - 3) > 0xD)
  {
    if (v5 >= 1)
    {
      int v35 = 0;
      uint64_t v36 = v47;
      do
      {
        if (v4 >= 1)
        {
          int v37 = -v12;
          int v38 = v4;
          do
          {
            if ((v35 - (v13 >> 1)) * (v35 - (v13 >> 1)) + v37 * v37 < (v12 * v12)) {
              int v39 = -1;
            }
            else {
              int v39 = -16777216;
            }
            *v36++ = v39;
            ++v37;
            --v38;
          }
          while (v38);
        }
        ++v35;
      }
      while (v35 != v5);
    }
  }
  else
  {
    double v14 = (double)v8;
    float v15 = 3.14159265 / (double)v8;
    float v16 = cosf(v15);
    if (v5 >= 1)
    {
      int v18 = 0;
      *(float *)v17.i32 = (float)v12;
      unsigned int v19 = (int)(float)(v16 * (float)v12) * (int)(float)(v16 * (float)v12);
      float v20 = 6.28318531 / v14;
      float32x2_t v21 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 0);
      v22 = v47;
      do
      {
        if (v4 >= 1)
        {
          for (int i = 0; i != v4; ++i)
          {
            int v24 = i - v12;
            if ((v18 + v48) * (v18 + v48) + v24 * v24 < v19)
            {
LABEL_18:
              int v34 = -1;
            }
            else
            {
              int v25 = 0;
              *(float *)v17.i32 = (float)v24;
              *(float *)&v17.i32[1] = (float)(v18 + v48);
              int8x16_t v49 = v17;
              while (1)
              {
                float v26 = (float)v25 * v20;
                float v27 = v26 + v20;
                __float2 v28 = __sincosf_stret(v26);
                float32x2_t v29 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v28.__sinval), LODWORD(v28.__cosval)), (float)v12);
                __float2 v30 = __sincosf_stret(v27);
                v31.i64[1] = v49.i64[1];
                *(float32x2_t *)v32.i8 = vmul_f32(vmla_f32(vneg_f32(v29), v21, (float32x2_t)__PAIR64__(LODWORD(v30.__sinval), LODWORD(v30.__cosval))), (float32x2_t)vrev64_s32((int32x2_t)vsub_f32(*(float32x2_t *)v49.i8, v29)));
                *(int32x2_t *)v31.i8 = vdup_lane_s32(*(int32x2_t *)v32.i8, 1);
                *(float32x2_t *)v32.i8 = vsub_f32(*(float32x2_t *)v32.i8, *(float32x2_t *)v31.i8);
                v31.i32[0] = 1.0;
                v33.i64[0] = 0x8000000080000000;
                v33.i64[1] = 0x8000000080000000;
                int8x16_t v17 = vbslq_s8(v33, v31, v32);
                if (*(float *)v32.i32 == 0.0) {
                  v17.i32[0] = v32.i32[0];
                }
                if ((int)*(float *)v17.i32 < 0) {
                  break;
                }
                if (v10 == ++v25) {
                  goto LABEL_18;
                }
              }
              int v34 = -16777216;
            }
            *v22++ = v34;
          }
        }
        ++v18;
      }
      while (v18 != v5);
    }
  }
  v40 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v9, (uint64_t)v47, v46);
  v41 = [MDLTexture alloc];
  isCube = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v41, v42, (uint64_t)v40, 1, @"bokeh", v4, 4, 1, *(double *)&size, 0);
  free(v47);

  return (MDLTexture *)isCube;
}

- (vector_float3)exposure
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setExposure:(vector_float3)exposure
{
  *(_OWORD *)&self->_camera[2].var15 = v3;
}

- (vector_float2)exposureCompression
{
  return *(vector_float2 *)&self->_camera[2].var13;
}

- (void)setExposureCompression:(vector_float2)exposureCompression
{
  *(vector_float2 *)&self->_camera[2].var13 = exposureCompression;
}

- (void)frameBoundingBox:(MDLAxisAlignedBoundingBox *)boundingBox setNearAndFar:(BOOL)setNearAndFar
{
  int v7 = (int)boundingBox;
  camera = self->_camera;
  int8x16_t v10 = (int8x16_t)vcgtq_f32(v5, v4);
  BOOL v11 = v10.i32[0] != 0;
  v10.i32[0] = vextq_s8(v10, v10, 8uLL).u32[0];
  *(int32x2_t *)v10.i8 = vtst_s32(*(int32x2_t *)v10.i8, *(int32x2_t *)v10.i8);
  int v12 = v11 & v10.i32[1];
  __int32 v13 = v10.i32[0];
  __asm { FMOV            V2.4S, #5.0 }
  int v19 = v12 & v13;
  if (v19) {
    unsigned int v20 = -1;
  }
  else {
    unsigned int v20 = 0;
  }
  int8x16_t v21 = (int8x16_t)vdupq_n_s32(v20);
  float32x4_t v22 = (float32x4_t)vbslq_s8(v21, _Q2, (int8x16_t)v4);
  __asm { FMOV            V0.4S, #-5.0 }
  float32x4_t v24 = (float32x4_t)vbslq_s8(v21, _Q0, (int8x16_t)v5);
  v25.i64[0] = 0x3F0000003F000000;
  v25.i64[1] = 0x3F0000003F000000;
  v6.i32[0] = -915135488;
  float32x4_t v47 = v22;
  float32x4_t v49 = v24;
  if ((v19 & 1) == 0)
  {
    float32x4_t v26 = vmulq_f32(vsubq_f32(v22, v24), v25);
    int32x4_t v27 = (int32x4_t)vmulq_f32(v26, v26);
    float v28 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.i8, 1)), (float32x4_t)vdupq_laneq_s32(v27, 2)).f32[0]);
    if (v28 > 1.1755e-38)
    {
      float v29 = camera[2].var4 * 0.0174532925;
      float v30 = v28 * 1.05;
      float v31 = sinf(v29 * 0.5);
      v25.i64[0] = 0x3F0000003F000000;
      v25.i64[1] = 0x3F0000003F000000;
      float32x4_t v22 = v47;
      float32x4_t v24 = v49;
      v6.f32[0] = v30 / v31;
    }
  }
  float32x4_t v51 = v6;
  float32x4_t v53 = vmulq_f32(vaddq_f32(v24, v22), v25);
  objc_msgSend_translation(camera->var10, a2, (uint64_t)boundingBox, setNearAndFar, *(_OWORD *)&v47, *(_OWORD *)&v49);
  float32x4_t v33 = vsubq_f32(v32, v53);
  int32x4_t v34 = (int32x4_t)vmulq_f32(v33, v33);
  v34.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2)).u32[0];
  float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
  float32x2_t v36 = vmul_f32(vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)), v35);
  *(float32x2_t *)v34.i8 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36)));
  __n128 v52 = (__n128)vmulq_n_f32(v33, vmulq_f32((float32x4_t)v34, v51).f32[0]);
  sub_20B1483B4((uint64_t)self->_camera, v52);
  sub_20B148B78((float32x4_t *)self->_camera, v53);
  *(double *)v55.columns[0].i64 = sub_20B148F40((uint64_t)self->_camera, 0.0);
  simd_float4x4 v56 = __invert_f4(v55);
  if (v7)
  {
    float32x4_t v37 = vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmlaq_n_f32((float32x4_t)v56.columns[3], (float32x4_t)v56.columns[0], v48.f32[0]), (float32x4_t)v56.columns[1], *(float32x2_t *)v48.f32, 1), (float32x4_t)v56.columns[2], v48, 2), (float32x4_t)v52);
    int32x4_t v38 = (int32x4_t)vmulq_f32(v37, v37);
    float32x4_t v39 = vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmlaq_n_f32((float32x4_t)v56.columns[3], (float32x4_t)v56.columns[0], v50.f32[0]), (float32x4_t)v56.columns[1], *(float32x2_t *)v50.f32, 1), (float32x4_t)v56.columns[2], v50, 2), (float32x4_t)v52);
    int32x4_t v40 = (int32x4_t)vmulq_f32(v39, v39);
    float v41 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.i8, 1)), (float32x4_t)vdupq_laneq_s32(v38, 2)).f32[0]);
    float v42 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 1)), (float32x4_t)vdupq_laneq_s32(v40, 2)).f32[0]);
    float v43 = fmaxf(v42, -3.4028e38);
    if (v41 > v43) {
      float v43 = v41;
    }
    float v44 = fminf(v42, 0.1);
    if (v41 < v44) {
      float v44 = v41;
    }
    float v45 = v44 * 0.70711;
    size_t v46 = (simd_float4x4 *)self->_camera;
    if (v43 > 1000.0) {
      float v45 = 0.70711;
    }
    v46[4].columns[1].f32[0] = v45;
    v46[4].columns[1].f32[1] = v43 * 4.0;
    sub_20B148194(v46);
  }
}

- (void)lookAt:(vector_float3)focusPosition
{
  sub_20B148B78((float32x4_t *)self->_camera, v3);
}

- (void)lookAt:(vector_float3)focusPosition from:(vector_float3)cameraPosition
{
  float32x4_t v8 = v4;
  sub_20B1483B4((uint64_t)self->_camera, v5);
  camera = self->_camera;

  sub_20B148B78((float32x4_t *)camera, v8);
}

- (float)worldToMetersConversionScale
{
  return self->_worldToMetersConversionScale;
}

- (void)setWorldToMetersConversionScale:(float)worldToMetersConversionScale
{
  self->_worldToMetersConversionScale = worldToMetersConversionScale;
}

- (CAAnimation)focalDistanceAnimation
{
  return self->_focalDistanceAnimation;
}

- (void)setFocalDistanceAnimation:(id)a3
{
}

- (CAAnimation)fStopAnimation
{
  return self->_fStopAnimation;
}

- (void)setFStopAnimation:(id)a3
{
}

- (CAAnimation)focalLengthAnimation
{
  return self->_focalLengthAnimation;
}

- (void)setFocalLengthAnimation:(id)a3
{
}

- (CAAnimation)apertureAnimation
{
  return self->_apertureAnimation;
}

- (void)setApertureAnimation:(id)a3
{
}

- (CAAnimation)apertureAspectAnimation
{
  return self->_apertureAspectAnimation;
}

- (void)setApertureAspectAnimation:(id)a3
{
}

- (MDLCameraProjection)projection
{
  return self->_projection;
}

- (void)setProjection:(MDLCameraProjection)projection
{
  self->_projection = projection;
}

- (float)barrelDistortion
{
  return self->_barrelDistortion;
}

- (void)setBarrelDistortion:(float)barrelDistortion
{
  self->_barrelDistortion = barrelDistortion;
}

- (float)fisheyeDistortion
{
  return self->_fisheyeDistortion;
}

- (void)setFisheyeDistortion:(float)fisheyeDistortion
{
  self->_fisheyeDistortion = fisheyeDistortion;
}

- (float)opticalVignetting
{
  return self->_opticalVignetting;
}

- (void)setOpticalVignetting:(float)opticalVignetting
{
  self->_opticalVignetting = opticalVignetting;
}

- (float)chromaticAberration
{
  return self->_chromaticAberration;
}

- (void)setChromaticAberration:(float)chromaticAberration
{
  self->_chromaticAberration = chromaticAberration;
}

- (float)fStop
{
  return self->_fStop;
}

- (void)setFStop:(float)fStop
{
  self->_fStop = fStop;
}

- (NSUInteger)apertureBladeCount
{
  return self->_apertureBladeCount;
}

- (void)setApertureBladeCount:(NSUInteger)apertureBladeCount
{
  self->_apertureBladeCount = apertureBladeCount;
}

- (float)maximumCircleOfConfusion
{
  return self->_maximumCircleOfConfusion;
}

- (void)setMaximumCircleOfConfusion:(float)maximumCircleOfConfusion
{
  self->_maximumCircleOfConfusion = maximumCircleOfConfusion;
}

- (NSTimeInterval)shutterOpenInterval
{
  return self->_shutterOpenInterval;
}

- (void)setShutterOpenInterval:(NSTimeInterval)shutterOpenInterval
{
  self->_shutterOpenInterval = shutterOpenInterval;
}

- (vector_float3)flash
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setFlash:(vector_float3)flash
{
  *(_OWORD *)self->_flash = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apertureAspectAnimation, 0);
  objc_storeStrong((id *)&self->_apertureAnimation, 0);
  objc_storeStrong((id *)&self->_focalLengthAnimation, 0);
  objc_storeStrong((id *)&self->_fStopAnimation, 0);

  objc_storeStrong((id *)&self->_focalDistanceAnimation, 0);
}

@end
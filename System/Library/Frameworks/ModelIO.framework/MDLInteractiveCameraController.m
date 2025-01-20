@interface MDLInteractiveCameraController
- (MDLInteractiveCameraController)init;
- (MDLStereoscopicCamera)camera;
- (__n128)framingBounds;
- (__n128)targetPosition;
- (__n128)trackVector;
- (double)clickPoint;
- (double)dragPoint;
- (double)viewSize;
- (float)targetDistance;
- (float)trackSpeed;
- (float)tumbleSpeed;
- (float)zoom;
- (float)zoomSpeed;
- (uint64_t)position;
- (uint64_t)setFramingBounds:(_OWORD *)a3;
- (unint64_t)mode;
- (void)frameBounds;
- (void)frameObject;
- (void)setCamera:(id)a3;
- (void)setClickPoint:(MDLInteractiveCameraController *)self;
- (void)setDragPoint:(MDLInteractiveCameraController *)self;
- (void)setMode:(unint64_t)a3;
- (void)setPosition:(MDLInteractiveCameraController *)self;
- (void)setTargetDistance:(float)a3;
- (void)setTargetPosition:(MDLInteractiveCameraController *)self;
- (void)setTrackSpeed:(float)a3;
- (void)setTrackVector:(MDLInteractiveCameraController *)self;
- (void)setTumbleSpeed:(float)a3;
- (void)setViewSize:(MDLInteractiveCameraController *)self;
- (void)setZoom:(float)a3;
- (void)setZoomSpeed:(float)a3;
- (void)update:(float)a3;
@end

@implementation MDLInteractiveCameraController

- (MDLInteractiveCameraController)init
{
  v12.receiver = self;
  v12.super_class = (Class)MDLInteractiveCameraController;
  v2 = [(MDLInteractiveCameraController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    camera = v2->_camera;
    v2->_camera = (MDLStereoscopicCamera *)v3;

    *(_OWORD *)v2->_lookAt = 0u;
    *(void *)v2->_dragPoint = 0;
    v2->_mode = 0;
    __asm { FMOV            V1.2S, #1.0 }
    *(void *)v2->_viewSize = _D1;
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v2->_anon_40 = _Q1;
    *(_OWORD *)&v2->_anon_40[16] = 0u;
    v2->_zoom = 1.0;
  }
  return v2;
}

- (uint64_t)setFramingBounds:(_OWORD *)a3
{
  *(_OWORD *)(a1 + 80) = a3[1];
  *(_OWORD *)(a1 + 64) = *a3;
  return MEMORY[0x270F9A6D0](a1, sel_frameObject, a3);
}

- (void)frameBounds
{
}

- (__n128)framingBounds
{
  __n128 result = *(__n128 *)(a1 + 80);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 64);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (void)setClickPoint:(MDLInteractiveCameraController *)self
{
  *(void *)self->_clickPoint = v2;
}

- (double)clickPoint
{
  return *(double *)(a1 + 32);
}

- (__n128)targetPosition
{
  return a1[1];
}

- (void)setTargetPosition:(MDLInteractiveCameraController *)self
{
  sub_20B148B78((float32x4_t *)self->_camera->super._camera, v2);
}

- (uint64_t)position
{
  return objc_msgSend_translation(*(void **)(*(void *)(*(void *)(a1 + 120) + 56) + 56), a2, a3);
}

- (void)setPosition:(MDLInteractiveCameraController *)self
{
  sub_20B1483B4((uint64_t)self->_camera->super._camera, v2);
}

- (void)frameObject
{
  camera = self->_camera;
  float var4 = camera->super._camera[2].var4;
  float32x4_t v5 = *(float32x4_t *)self->_anon_40;
  float32x4_t v6 = *(float32x4_t *)&self->_anon_40[16];
  int8x16_t v7 = (int8x16_t)vcgtq_f32(v6, v5);
  BOOL v8 = v7.i32[0] != 0;
  v7.i32[0] = vextq_s8(v7, v7, 8uLL).u32[0];
  *(int32x2_t *)v7.i8 = vtst_s32(*(int32x2_t *)v7.i8, *(int32x2_t *)v7.i8);
  int v9 = v8 & v7.i32[1];
  __int32 v10 = v7.i32[0];
  __asm { FMOV            V2.4S, #-5.0 }
  char v16 = v9 & v10;
  if ((v9 & v10) != 0) {
    unsigned int v17 = -1;
  }
  else {
    unsigned int v17 = 0;
  }
  int8x16_t v18 = (int8x16_t)vdupq_n_s32(v17);
  int8x16_t v19 = vbslq_s8(v18, _Q2, (int8x16_t)v6);
  __asm { FMOV            V2.4S, #5.0 }
  objc_msgSend_frameBoundingBox_setNearAndFar_(camera, a2, 1, vbslq_s8(v18, _Q2, (int8x16_t)v5), *(_OWORD *)&v19);
  float v22 = -100.0;
  if ((v16 & 1) == 0)
  {
    v23.i64[0] = 0x3F0000003F000000;
    v23.i64[1] = 0x3F0000003F000000;
    float32x4_t v24 = vmulq_f32(vsubq_f32(v28, v29), v23);
    int32x4_t v25 = (int32x4_t)vmulq_f32(v24, v24);
    float v26 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.i8, 1)), (float32x4_t)vdupq_laneq_s32(v25, 2)).f32[0]);
    if (v26 > 1.1755e-38)
    {
      float v27 = var4 * 0.0174532925;
      float v22 = (float)(v26 * 1.05) / sinf(v27 * 0.5);
    }
  }
  self->_targetDistance = self->_zoom * v22;

  MEMORY[0x270F9A6D0](self, sel_update_, v21);
}

- (void)update:(float)a3
{
  camera = (simd_float4x4 *)self->_camera->super._camera;
  camera[3].columns[3].i32[0] = vdiv_f32(*(float32x2_t *)self->_viewSize, (float32x2_t)vdup_lane_s32(*(int32x2_t *)self->_viewSize, 1)).u32[0];
  sub_20B148194(camera);
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    v13 = self->_camera->super._camera;
    float32x4_t v23 = *(float32x4_t *)&v13[2].var7;
    objc_msgSend_translation(v13->var10, v5, v6);
    v14 = self->_camera->super._camera;
    float targetDistance = self->_targetDistance;
    v16.i32[0] = LODWORD(self->_pitch);
    float yaw = self->_yaw;
    float32x4_t v18 = v23;
  }
  else
  {
    if (mode != 1)
    {
      if (!mode)
      {
        v8.i32[0] = 0;
        v8.i32[3] = 0;
        *(uint64_t *)((char *)v8.i64 + 4) = LODWORD(self->_targetElevation);
        float targetElevation = self->_targetElevation;
        float32x4_t v21 = v8;
        *(float *)&dword_267691124 = *(float *)&dword_267691124 + (float)(a3 * 10.0);
        float v9 = self->_targetDistance;
        v8.f32[0] = *(float *)&dword_267691124 * -0.1;
        __float2 v10 = __sincosf_stret(v8.f32[0]);
        v11.n128_f32[0] = v10.__sinval * v9;
        v11.n128_f32[1] = targetElevation;
        v11.n128_f32[2] = v10.__cosval * v9;
        sub_20B1483B4((uint64_t)self->_camera->super._camera, v11);
        objc_super v12 = self->_camera->super._camera;
        sub_20B148B78((float32x4_t *)v12, v21);
      }
      return;
    }
    *(float32x2_t *)self->_dragVector = vmul_f32(vmul_n_f32((float32x2_t)0xC040000040A00000, a3), vsub_f32(*(float32x2_t *)self->_dragPoint, *(float32x2_t *)self->_clickPoint));
    int8x16_t v19 = self->_camera->super._camera;
    float32x4_t v24 = *(float32x4_t *)&v19[2].var7;
    objc_msgSend_translation(v19->var10, v5, v6);
    float32x2_t v16 = vadd_f32(*(float32x2_t *)&self->_pitch, (float32x2_t)vrev64_s32(*(int32x2_t *)self->_dragVector));
    *(float32x2_t *)&self->_pitch = v16;
    v14 = self->_camera->super._camera;
    float targetDistance = self->_targetDistance;
    float yaw = v16.f32[1];
    float32x4_t v18 = v24;
  }

  sub_20B1484EC((__n128 *)v14, v18, targetDistance, v16.f32[0], yaw);
}

- (MDLStereoscopicCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (double)dragPoint
{
  return *(double *)(a1 + 128);
}

- (void)setDragPoint:(MDLInteractiveCameraController *)self
{
  *(void *)self->_dragPoint = v2;
}

- (__n128)trackVector
{
  return a1[10];
}

- (void)setTrackVector:(MDLInteractiveCameraController *)self
{
  *(_OWORD *)self->_trackVector = v2;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (float)tumbleSpeed
{
  return self->_tumbleSpeed;
}

- (void)setTumbleSpeed:(float)a3
{
  self->_tumbleSpeed = a3;
}

- (float)zoomSpeed
{
  return self->_zoomSpeed;
}

- (void)setZoomSpeed:(float)a3
{
  self->_zoomSpeed = a3;
}

- (float)trackSpeed
{
  return self->_trackSpeed;
}

- (void)setTrackSpeed:(float)a3
{
  self->_trackSpeed = a3;
}

- (float)targetDistance
{
  return self->_targetDistance;
}

- (void)setTargetDistance:(float)a3
{
  self->_float targetDistance = a3;
}

- (double)viewSize
{
  return *(double *)(a1 + 144);
}

- (void)setViewSize:(MDLInteractiveCameraController *)self
{
  *(void *)self->_viewSize = v2;
}

- (float)zoom
{
  return self->_zoom;
}

- (void)setZoom:(float)a3
{
  self->_zoom = a3;
}

- (void).cxx_destruct
{
}

@end
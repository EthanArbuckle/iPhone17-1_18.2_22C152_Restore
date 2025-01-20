@interface SCNCameraController
- (BOOL)_isLocationValid:(CGPoint)a3 inViewport:(CGSize)a4;
- (BOOL)automaticTarget;
- (BOOL)drivenByDefaultNavigationCameraController;
- (BOOL)inertiaEnabled;
- (BOOL)isInertiaRunning;
- (BOOL)useOrbitInteractionMode;
- (SCNCameraController)init;
- (SCNInteractionMode)interactionMode;
- (SCNNode)pointOfView;
- (SCNVector3)target;
- (SCNVector3)up;
- (SCNVector3)worldUp;
- (__n128)_targetRelativeToPointOfViewParent;
- (__n128)simdTarget;
- (__n128)simdUp;
- (double)_convertRotationFromWorldToPointOfView:(void *)a1;
- (double)_mapToSphere:(float64_t)a3 inViewport:(double)a4;
- (double)_orientationForMode;
- (double)_orthographicViewSpaceTranslationForZoomAtScreenPoint:(float)a3 scaleDelta:(float64_t)a4 viewport:(float64_t)a5;
- (double)lookAtWith:(float32x4_t)a3 target:;
- (double)unrolledWorldOrientation:(float *)a3;
- (float)inertiaFriction;
- (float)maximumHorizontalAngle;
- (float)maximumVerticalAngle;
- (float)minimumHorizontalAngle;
- (float)minimumVerticalAngle;
- (float32x4_t)_directionForScreenPoint:(double)a3 viewport:(float64_t)a4;
- (id)delegate;
- (void)_capOrientationAnglesToMaximum;
- (void)_endDraggingWithVelocity:(CGPoint)a3;
- (void)_resetOrientationState;
- (void)_rotateByX:(float)a3 Y:(float)a4;
- (void)_setInertiaRunning:(BOOL)a3;
- (void)_translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)_updateArcballOrientation;
- (void)_updateInertiaAtTime:(double)a3;
- (void)_updateRotation;
- (void)beginInteraction:(CGPoint)location withViewport:(CGSize)viewport;
- (void)clearRoll;
- (void)continueInteraction:(CGPoint)location withViewport:(CGSize)viewport sensitivity:(CGFloat)sensitivity;
- (void)dealloc;
- (void)dollyBy:(float)delta onScreenPoint:(CGPoint)point viewport:(CGSize)viewport;
- (void)dollyToTarget:(float)delta;
- (void)endInteraction:(CGPoint)location withViewport:(CGSize)viewport velocity:(CGPoint)velocity;
- (void)frameNodes:(NSArray *)nodes;
- (void)rollAroundTarget:(float)delta;
- (void)rollBy:(float)delta aroundScreenPoint:(CGPoint)point viewport:(CGSize)viewport;
- (void)rollCameraSpaceBy:(float)a3 withPoint:(CGPoint)a4 viewport:(CGSize)a5;
- (void)rotateByX:(float)deltaX Y:(float)deltaY;
- (void)setAutomaticTarget:(BOOL)automaticTarget;
- (void)setDelegate:(id)delegate;
- (void)setDrivenByDefaultNavigationCameraController:(BOOL)a3;
- (void)setInertiaEnabled:(BOOL)inertiaEnabled;
- (void)setInertiaFriction:(float)inertiaFriction;
- (void)setInteractionMode:(SCNInteractionMode)interactionMode;
- (void)setMaximumHorizontalAngle:(float)maximumHorizontalAngle;
- (void)setMaximumVerticalAngle:(float)maximumVerticalAngle;
- (void)setMinimumHorizontalAngle:(float)minimumHorizontalAngle;
- (void)setMinimumVerticalAngle:(float)minimumVerticalAngle;
- (void)setPointOfView:(SCNNode *)pointOfView;
- (void)setPointOfView:(id)a3 updateUpTransform:(BOOL)a4;
- (void)setSimdTarget:(SCNCameraController *)self;
- (void)setSimdUp:(SCNCameraController *)self;
- (void)setTarget:(SCNVector3)target;
- (void)setUp:(SCNVector3)a3;
- (void)setWorldUp:(SCNVector3)worldUp;
- (void)stopInertia;
- (void)translateInCameraSpaceByX:(float)deltaX Y:(float)deltaY Z:(float)deltaZ;
- (void)translateInScreenSpaceTo:(CGPoint)a3 viewport:(CGSize)a4;
@end

@implementation SCNCameraController

- (void)setPointOfView:(id)a3 updateUpTransform:(BOOL)a4
{
  if (self->_pointOfView != a3)
  {
    -[SCNCameraController _setInertiaRunning:](self, "_setInertiaRunning:", 0, a4);

    self->_pointOfView = (SCNNode *)a3;
  }
}

- (void)setPointOfView:(SCNNode *)pointOfView
{
}

- (SCNNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setUp:(SCNVector3)a3
{
  float y = a3.y;
  [(SCNCameraController *)self setSimdUp:*(double *)&a3.x];
}

- (void)setSimdUp:(SCNCameraController *)self
{
  float32x4_t v7 = v2;
  [(SCNCameraController *)self _setInertiaRunning:0];
  int32x4_t v4 = (int32x4_t)vmulq_f32(v7, v7);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  *(float32x4_t *)self->_up = vmulq_n_f32(v7, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
}

- (void)_setInertiaRunning:(BOOL)a3
{
  if (self->_inertia.inertiaRunning != a3)
  {
    if (a3)
    {
      [(SCNCameraController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __42__SCNCameraController__setInertiaRunning___block_invoke;
        block[3] = &unk_264004DF8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      if (![(SCNCameraController *)self drivenByDefaultNavigationCameraController])
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __42__SCNCameraController__setInertiaRunning___block_invoke_2;
        v7[3] = &unk_264007690;
        v7[4] = self;
        *(void *)&self->_anon_e0[8] = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v7 block:0.0166666667];
      }
      self->_inertia.inertiaRunning = a3;
    }
    else
    {
      if (![(SCNCameraController *)self drivenByDefaultNavigationCameraController])
      {
        float32x2_t v5 = *(void **)&self->_anon_e0[8];
        if (v5) {
          [v5 invalidate];
        }
        *(void *)&self->_anon_e0[8] = 0;
      }
      self->_inertia.inertiaRunning = a3;
      [(SCNCameraController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        v6[0] = MEMORY[0x263EF8330];
        v6[1] = 3221225472;
        v6[2] = __42__SCNCameraController__setInertiaRunning___block_invoke_3;
        v6[3] = &unk_264004DF8;
        v6[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], v6);
      }
    }
  }
}

- (void)setSimdTarget:(SCNCameraController *)self
{
  *(_OWORD *)self->_target = v2;
}

- (void)setDrivenByDefaultNavigationCameraController:(BOOL)a3
{
  self->_drivenBydefaultNavigationCameraController = a3;
}

- (void)setInteractionMode:(SCNInteractionMode)interactionMode
{
  if (self->_interactionMode != interactionMode)
  {
    [(SCNCameraController *)self _setInertiaRunning:0];
    self->_interactionMode = interactionMode;
  }
}

- (void)setInertiaEnabled:(BOOL)inertiaEnabled
{
  self->_inertia.inertiaEnabled = inertiaEnabled;
  if ([(SCNCameraController *)self isInertiaRunning] && !inertiaEnabled)
  {
    [(SCNCameraController *)self _setInertiaRunning:0];
  }
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (SCNCameraControllerDelegate *)delegate;
}

- (BOOL)isInertiaRunning
{
  return self->_inertia.inertiaRunning;
}

- (SCNCameraController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SCNCameraController;
  long long v2 = [(SCNCameraController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_inertia.friction = 0x3F8000003D4CCCCDLL;
    v2->_inertia.translationSensitivitfloat y = 1.0;
    *(_OWORD *)v2->_up = xmmword_20B5CB7D0;
    v2->_automaticTarget = 0;
    int v4 = C3DWasLinkedBeforeMajorOSYear2017();
    uint64_t v5 = 1;
    if (v4) {
      uint64_t v5 = 2;
    }
    v3->_interactionMode = v5;
  }
  return v3;
}

- (void)dealloc
{
  [(SCNCameraController *)self _setInertiaRunning:0];
  v3.receiver = self;
  v3.super_class = (Class)SCNCameraController;
  [(SCNCameraController *)&v3 dealloc];
}

- (SCNVector3)target
{
  [(SCNCameraController *)self simdTarget];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.x = v2;
  return result;
}

- (void)setTarget:(SCNVector3)target
{
  float y = target.y;
  [(SCNCameraController *)self setSimdTarget:*(double *)&target.x];
}

- (SCNVector3)up
{
  [(SCNCameraController *)self simdUp];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldUp
{
  [(SCNCameraController *)self simdUp];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.float y = v4;
  result.x = v2;
  return result;
}

- (void)setWorldUp:(SCNVector3)worldUp
{
  float y = worldUp.y;
  [(SCNCameraController *)self setSimdUp:*(double *)&worldUp.x];
}

- (BOOL)inertiaEnabled
{
  return self->_inertia.inertiaEnabled;
}

- (float)inertiaFriction
{
  return self->_inertia.friction;
}

- (void)setInertiaFriction:(float)inertiaFriction
{
  self->_inertia.friction = inertiaFriction;
}

- (__n128)simdUp
{
  return a1[15];
}

- (__n128)simdTarget
{
  return a1[16];
}

- (float)minimumVerticalAngle
{
  return *(float *)&self->_minimumAngles[4];
}

- (float)minimumHorizontalAngle
{
  uint64_t v2 = *(void *)self->_minimumAngles;
  LODWORD(result) = v2;
  return result;
}

- (float)maximumVerticalAngle
{
  return *(float *)&self->_maximumAngles[4];
}

- (float)maximumHorizontalAngle
{
  uint64_t v2 = *(void *)self->_maximumAngles;
  LODWORD(result) = v2;
  return result;
}

- (void)setMinimumVerticalAngle:(float)minimumVerticalAngle
{
  double v3 = minimumVerticalAngle / 180.0 * 3.14159265;
  if (v3 > 1.57079633) {
    double v3 = 1.57079633;
  }
  float v4 = fmax(v3, -1.57079633);
  *(float *)&self->_minimumAngles[4] = v4;
}

- (void)setMinimumHorizontalAngle:(float)minimumHorizontalAngle
{
  double v3 = minimumHorizontalAngle / 180.0 * 3.14159265;
  if (v3 > 3.14159265) {
    double v3 = 3.14159265;
  }
  float v4 = fmax(v3, -3.14159265);
  *(float *)self->_minimumAngles = v4;
}

- (void)setMaximumVerticalAngle:(float)maximumVerticalAngle
{
  double v3 = maximumVerticalAngle / 180.0 * 3.14159265;
  if (v3 > 1.57079633) {
    double v3 = 1.57079633;
  }
  float v4 = fmax(v3, -1.57079633);
  *(float *)&self->_maximumAngles[4] = v4;
}

- (void)setMaximumHorizontalAngle:(float)maximumHorizontalAngle
{
  double v3 = maximumHorizontalAngle / 180.0 * 3.14159265;
  if (v3 > 3.14159265) {
    double v3 = 3.14159265;
  }
  float v4 = fmax(v3, -3.14159265);
  *(float *)self->_maximumAngles = v4;
}

- (void)translateInCameraSpaceByX:(float)deltaX Y:(float)deltaY Z:(float)deltaZ
{
  [(SCNCameraController *)self _setInertiaRunning:0];
  *(float *)&double v9 = deltaX;
  *(float *)&double v10 = deltaY;
  *(float *)&double v11 = deltaZ;

  [(SCNCameraController *)self _translateInCameraSpaceByX:v9 Y:v10 Z:v11];
}

- (void)translateInScreenSpaceTo:(CGPoint)a3 viewport:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  [(SCNCameraController *)self _setInertiaRunning:0];
  float v9 = x - width * 0.5;
  float v10 = height - y - height * 0.5;
  float v12 = v10;
  float v13 = v9;
  double v11 = [(SCNCameraController *)self pointOfView];

  [(SCNNode *)v11 simdLocalTranslateBy:COERCE_DOUBLE(__PAIR64__(LODWORD(v12), LODWORD(v13)))];
}

- (void)rotateByX:(float)deltaX Y:(float)deltaY
{
  [(SCNCameraController *)self _setInertiaRunning:0];
  if (!self->_handlingInteraction) {
    [(SCNCameraController *)self _resetOrientationState];
  }
  double v7 = deltaX / 180.0 * 3.14159265;
  *(float *)&double v7 = v7;
  double v8 = deltaY / 180.0 * 3.14159265;
  *(float *)&double v8 = v8;

  [(SCNCameraController *)self _rotateByX:v7 Y:v8];
}

- (void)rollCameraSpaceBy:(float)a3 withPoint:(CGPoint)a4 viewport:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  [(SCNCameraController *)self _setInertiaRunning:0];
  -[SCNCameraController _directionForScreenPoint:viewport:](self, "_directionForScreenPoint:viewport:", x, y, width, height);
  float32x4_t v12 = v11;
  float32x4_t v13 = vmulq_f32(v11, v11);
  float32x4_t v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1)));
  if (v14.f32[0] <= 0.000000001)
  {
    long long v18 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  }
  else
  {
    float32x4_t v20 = v14;
    float v15 = a3 / 180.0 * 3.14159265;
    float32x4_t v21 = v12;
    LODWORD(v18) = *(void *)&__sincosf_stret(v15 * 0.5);
    float32x2_t v16 = vrsqrte_f32((float32x2_t)v20.u32[0]);
    float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v16, v16)));
    *(void *)&long long v18 = vmulq_n_f32(vmulq_n_f32(v21, vmul_f32(v17, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v17, v17))).f32[0]), *(float *)&v18).u64[0];
  }
  double v22 = *(double *)&v18;
  v19 = [(SCNCameraController *)self pointOfView];

  [(SCNNode *)v19 simdLocalRotateBy:v22];
}

- (void)rollAroundTarget:(float)delta
{
  [(SCNCameraController *)self _setInertiaRunning:0];
  [(SCNCameraController *)self simdTarget];
  float32x4_t v14 = v5;
  [(SCNNode *)[(SCNCameraController *)self pointOfView] simdWorldTransform];
  simd_float4x4 v19 = __invert_f4(v18);
  float32x4_t v6 = vaddq_f32((float32x4_t)v19.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v19.columns[0], v14.f32[0]), (float32x4_t)v19.columns[1], *(float32x2_t *)v14.f32, 1), (float32x4_t)v19.columns[2], v14, 2));
  v19.columns[0] = (simd_float4)vmulq_f32(v6, v6);
  float32x4_t v7 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19.columns[0], 2), vaddq_f32((float32x4_t)v19.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.columns[0].f32, 1)));
  if (v7.f32[0] <= 0.000000001)
  {
    long long v11 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  }
  else
  {
    float32x4_t v13 = v7;
    float v8 = delta / 180.0 * 3.14159265;
    float32x4_t v15 = v6;
    LODWORD(v11) = *(void *)&__sincosf_stret(v8 * 0.5);
    float32x2_t v9 = vrsqrte_f32((float32x2_t)v13.u32[0]);
    float32x2_t v10 = vmul_f32(v9, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v9, v9)));
    *(void *)&long long v11 = vmulq_n_f32(vmulq_n_f32(v15, vmul_f32(v10, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v10, v10))).f32[0]), *(float *)&v11).u64[0];
  }
  double v16 = *(double *)&v11;
  float32x4_t v12 = [(SCNCameraController *)self pointOfView];

  [(SCNNode *)v12 simdLocalRotateBy:v16];
}

- (void)dollyToTarget:(float)delta
{
  [(SCNCameraController *)self _setInertiaRunning:0];
  float32x4_t v5 = [(SCNCameraController *)self pointOfView];
  if (v5)
  {
    [(SCNNode *)v5 transform];
    v8.columns[0] = v23;
    v8.columns[1].i32[0] = v24.i32[0];
    __int32 v7 = v23.i32[3];
    v8.columns[2].i32[0] = v24.i32[1];
    __int32 v9 = v25.i32[0];
    v8.columns[3] = (simd_float4)v26;
    int8x16_t v10 = vextq_s8(v26, (int8x16_t)vtrn2q_s32(v25, (int32x4_t)v26), 4uLL);
    int8x16_t v11 = (int8x16_t)vzip2q_s64((int64x2_t)v25, v24);
    int8x16_t v6 = vextq_s8((int8x16_t)v8.columns[0], (int8x16_t)v8.columns[0], 8uLL);
    *(int8x8_t *)v6.i8 = vext_s8(*(int8x8_t *)v23.f32, *(int8x8_t *)v6.i8, 4uLL);
  }
  else
  {
    v8.columns[3] = 0uLL;
    v6.i64[0] = 0;
    v8.columns[2].i32[0] = 0;
    __int32 v9 = 0;
    v8.columns[1].i32[0] = 0;
    __int32 v7 = 0;
    v8.columns[0] = 0uLL;
    int8x16_t v10 = 0uLL;
    int8x16_t v11 = 0uLL;
  }
  v8.columns[0] = (simd_float4)vextq_s8(vextq_s8((int8x16_t)v8.columns[0], (int8x16_t)v8.columns[0], 4uLL), v6, 0xCuLL);
  v8.columns[0].i32[3] = v7;
  v8.columns[1].i32[1] = v8.columns[2].i32[0];
  v8.columns[1].i64[1] = v11.i64[1];
  v8.columns[2] = (simd_float4)vextq_s8(v10, v11, 8uLL);
  v8.columns[2].i32[0] = v9;
  v8.columns[3] = (simd_float4)vextq_s8(vextq_s8((int8x16_t)v8.columns[3], (int8x16_t)v8.columns[3], 4uLL), v10, 0xCuLL);
  simd_float4x4 v27 = __invert_f4(v8);
  v27.columns[0] = (simd_float4)vaddq_f32((float32x4_t)v27.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v27.columns[0], COERCE_FLOAT(*(_OWORD *)self->_target)), (float32x4_t)v27.columns[1], *(float32x2_t *)self->_target, 1), (float32x4_t)v27.columns[2], *(float32x4_t *)self->_target, 2));
  v27.columns[1] = (simd_float4)vmulq_f32((float32x4_t)v27.columns[0], (float32x4_t)v27.columns[0]);
  v27.columns[1].i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v27.columns[1], 2), vadd_f32(*(float32x2_t *)v27.columns[1].f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.columns[1].f32, 1))).u32[0];
  *(float32x2_t *)v27.columns[2].f32 = vrsqrte_f32((float32x2_t)v27.columns[1].u32[0]);
  *(float32x2_t *)v27.columns[2].f32 = vmul_f32(*(float32x2_t *)v27.columns[2].f32, vrsqrts_f32((float32x2_t)v27.columns[1].u32[0], vmul_f32(*(float32x2_t *)v27.columns[2].f32, *(float32x2_t *)v27.columns[2].f32)));
  float32x4_t v21 = *(float32x4_t *)self->_target;
  float32x4_t v22 = vmulq_n_f32(vnegq_f32((float32x4_t)v27.columns[0]), vmul_f32(*(float32x2_t *)v27.columns[2].f32, vrsqrts_f32((float32x2_t)v27.columns[1].u32[0], vmul_f32(*(float32x2_t *)v27.columns[2].f32, *(float32x2_t *)v27.columns[2].f32))).f32[0]);
  [(SCNNode *)[(SCNCameraController *)self pointOfView] simdWorldPosition];
  float32x4_t v20 = v12;
  float32x4_t v13 = [(SCNCameraController *)self pointOfView];
  +[SCNNode simdLocalFront];
  -[SCNNode simdConvertVector:toNode:](v13, "simdConvertVector:toNode:", 0);
  float32x4_t v14 = vsubq_f32(v21, v20);
  float32x4_t v16 = vmulq_f32(v14, v15);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0] <= 0.0)float v17 = -1.0; {
  else
  }
    float v17 = 1.0;
  float32x4_t v18 = vmulq_f32(v14, v14);
  if ((float)(v17
             * vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0]) < 0.0&& delta < 0.0)
  {
    delta = 0.0;
  }
  [(SCNNode *)[(SCNCameraController *)self pointOfView] simdLocalTranslateBy:*(double *)vmulq_n_f32(v22, v17 * delta).i64];
}

- (BOOL)useOrbitInteractionMode
{
  if ([(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitArcball
    || [(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitCenteredArcball)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    SCNInteractionMode v3 = [(SCNCameraController *)self interactionMode];
    if (v3 != SCNInteractionModeOrbitTurntable) {
      LOBYTE(v3) = [(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitAngleMapping;
    }
  }
  return v3;
}

- (double)unrolledWorldOrientation:(float *)a3
{
  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  float32x4_t v119 = v5;
  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldFront");
  float32x4_t v114 = v6;
  [a1 simdUp];
  float32x4_t v8 = vmulq_f32(v114, v7);
  float v9 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0];
  if (v9 >= 1.0) {
    float v9 = 1.0;
  }
  if (v9 <= -1.0) {
    float v9 = -1.0;
  }
  if (fabsf(fabsf(v9) + -1.0) >= 0.01)
  {
    [a1 simdTarget];
    float32x4_t v115 = v12;
    objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldPosition");
    float32x4_t v116 = vsubq_f32(v115, v13);
    if ([a1 useOrbitInteractionMode])
    {
      int8x16_t v15 = (int8x16_t)v116;
      float32x4_t v14 = v119;
      uint32x4_t v16 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3C23D70Au), vabdq_f32((float32x4_t)0, v116));
      v16.i32[3] = v16.i32[2];
      if ((vminvq_u32(v16) & 0x80000000) != 0)
      {
        int v20 = 0;
      }
      else
      {
        int32x4_t v17 = (int32x4_t)vmulq_f32(v116, v116);
        v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
        float32x2_t v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
        float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
        int8x16_t v15 = (int8x16_t)vmulq_n_f32(v116, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
        int v20 = 1;
      }
    }
    else
    {
      int v20 = 0;
      int8x16_t v15 = (int8x16_t)v116;
      float32x4_t v14 = v119;
    }
    unsigned int v21 = 0;
    float32x4_t v22 = (float32x4_t)v15;
    v22.i32[3] = v15.i32[0];
    float32x4_t v97 = v22;
    float32x4_t v95 = vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), v15, 0xCuLL));
    float32x4_t v96 = (float32x4_t)vextq_s8(vextq_s8(v15, v15, 0xCuLL), v15, 8uLL);
    float32x4_t v102 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    float v23 = 0.0;
    __asm { FMOV            V0.4S, #1.0 }
    int8x16_t v103 = _Q0;
    do
    {
      int8x16_t v117 = (int8x16_t)vnegq_f32(v14);
      float32x4_t v120 = v14;
      objc_msgSend(a1, "simdUp", *(_OWORD *)&v95, *(_OWORD *)&v96, *(_OWORD *)&v97);
      int8x16_t v30 = v117;
      float32x4_t v31 = v120;
      int8x16_t v32 = v29;
      float32x4_t v33 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v120, 3);
      float32x4_t v34 = (float32x4_t)vzip1q_s32((int32x4_t)v31, (int32x4_t)v31);
      v34.i32[0] = v120.i32[2];
      float32x4_t v35 = (float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)v120, 4uLL);
      int32x4_t v36 = vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31);
      float32x4_t v37 = (float32x4_t)v36;
      v37.i32[0] = v120.i32[1];
      float32x4_t v38 = (float32x4_t)v117;
      v38.i32[3] = v117.i32[0];
      float32x4_t v39 = (float32x4_t)vextq_s8(vextq_s8(v30, v30, 0xCuLL), v30, 8uLL);
      float32x4_t v40 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), v117, 0xCuLL);
      float32x4_t v113 = v33;
      int8x16_t v112 = (int8x16_t)v36;
      if (v20)
      {
        float32x4_t v41 = (float32x4_t)xmmword_20B5CBBD0;
        float32x4_t v42 = 0uLL;
        float32x4_t v43 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v97, v35), (float32x4_t)xmmword_20B5CBBD0), (float32x4_t)0, v120), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v96, v34)), v37, v95);
        float32x4_t v44 = (float32x4_t)vzip1q_s32((int32x4_t)v43, (int32x4_t)v43);
        v44.i32[0] = v43.i32[2];
        float32x4_t v45 = vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v38, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v43, 3), (int8x16_t)v43, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), v43, v33), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v39, v44));
        float32x4_t v46 = (float32x4_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43);
        v46.i32[0] = v43.i32[1];
        float32x4_t v118 = vmlaq_f32(v45, v46, vnegq_f32(v40));
      }
      else
      {
        float32x4_t v106 = v39;
        float32x4_t v109 = v40;
        int8x16_t v104 = v29;
        float32x4_t v100 = v37;
        float32x4_t v101 = v38;
        float32x4_t v98 = v35;
        float32x4_t v99 = v34;
        +[SCNNode simdLocalFront];
        float32x4_t v35 = v98;
        float32x4_t v34 = v99;
        float32x4_t v37 = v100;
        float32x4_t v38 = v101;
        int8x16_t v32 = v104;
        float32x4_t v39 = v106;
        float32x4_t v40 = v109;
        float32x4_t v31 = v120;
        float32x4_t v118 = v47;
        float32x4_t v41 = (float32x4_t)xmmword_20B5CBBD0;
        float32x4_t v42 = 0uLL;
      }
      float32x4_t v48 = (float32x4_t)v32;
      v48.i32[3] = v32.i32[0];
      float32x4_t v49 = vmlsq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v48, v35), v41), v42, v31), v41, vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v32, v32, 0xCuLL), v32, 8uLL), v34)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), v32, 0xCuLL));
      float32x4_t v50 = (float32x4_t)vzip1q_s32((int32x4_t)v49, (int32x4_t)v49);
      v50.i32[0] = v49.i32[2];
      float32x4_t v51 = vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v38, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v49, 3), (int8x16_t)v49, 4uLL)), v41), v49, v31, 3), v41, vmulq_f32(v39, v50));
      float32x4_t v52 = (float32x4_t)vuzp1q_s32((int32x4_t)v49, (int32x4_t)v49);
      v52.i32[0] = v49.i32[1];
      float32x4_t v105 = vmlsq_f32(v51, v52, v40);
      +[SCNNode simdLocalUp];
      float32x4_t v107 = v53;
      +[SCNNode simdLocalFront];
      float32x4_t v55 = vmulq_f32(v105, v54);
      float32x4_t v56 = vmlsq_lane_f32(v105, v54, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v55, 2), vaddq_f32(v55, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v55.f32, 1))), 0);
      float32x4_t v57 = v54;
      float32x4_t v58 = vmulq_f32(v56, v56);
      v58.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2), vaddq_f32(v58, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 1))).u64[0];
      float32x4_t v59 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 0);
      float32x4_t v60 = vrsqrteq_f32(v59);
      float32x4_t v61 = vmulq_f32(v60, vrsqrtsq_f32(v59, vmulq_f32(v60, v60)));
      int32x4_t v62 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v58.f32[0] != 0.0)), 0x1FuLL));
      v62.i32[3] = 0;
      float32x4_t v63 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v62), (int8x16_t)vmulq_f32(v61, vrsqrtsq_f32(v59, vmulq_f32(v61, v61))), v103);
      float32x4_t v110 = v57;
      float32x4_t v64 = vmulq_f32(v107, v57);
      float32x4_t v65 = vmulq_f32(v56, v63);
      float32x4_t v66 = vmlsq_lane_f32(v107, v57, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v64, 2), vaddq_f32(v64, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 1))), 0);
      float32x4_t v67 = vmulq_f32(v66, v66);
      float32x4_t v68 = v66;
      v67.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1))).u64[0];
      float32x4_t v69 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 0);
      float32x4_t v70 = vrsqrteq_f32(v69);
      float32x4_t v71 = vmulq_f32(v70, vrsqrtsq_f32(v69, vmulq_f32(v70, v70)));
      int32x4_t v72 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v67.f32[0] != 0.0)), 0x1FuLL));
      v72.i32[3] = 0;
      float32x4_t v73 = vmulq_f32(v68, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v72), (int8x16_t)vmulq_f32(v71, vrsqrtsq_f32(v69, vmulq_f32(v71, v71))), v103));
      int8x16_t v74 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v73, (int32x4_t)v73), (int8x16_t)v73, 0xCuLL), vnegq_f32(v65)), v73, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v65, (int32x4_t)v65), (int8x16_t)v65, 0xCuLL));
      float32x4_t v108 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v74, (int32x4_t)v74), v74, 0xCuLL);
      float32x4_t v75 = vmulq_f32(v73, v65);
      float v76 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v75, 2), vaddq_f32(v75, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v75.f32, 1))).f32[0];
      if (v76 >= 1.0) {
        float v76 = 1.0;
      }
      if (v76 <= -1.0) {
        float v76 = -1.0;
      }
      float v77 = acosf(v76);
      float32x4_t v78 = vmulq_f32(v110, v108);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v78, 2), vaddq_f32(v78, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v78.f32, 1))).f32[0] <= 0.0)float v79 = -v77; {
      else
      }
        float v79 = v77;
      float32x4_t v80 = vmulq_f32(v118, v118);
      float v81 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1))).f32[0];
      float32x4_t v82 = v102;
      if (v81 > 0.000000001)
      {
        float v111 = v81;
        __float2 v83 = __sincosf_stret(v79 * -0.5);
        float32x2_t v84 = vrsqrte_f32((float32x2_t)LODWORD(v111));
        float32x2_t v85 = vmul_f32(v84, vrsqrts_f32((float32x2_t)LODWORD(v111), vmul_f32(v84, v84)));
        float32x4_t v82 = vmulq_n_f32(vmulq_n_f32(v118, vmul_f32(v85, vrsqrts_f32((float32x2_t)LODWORD(v111), vmul_f32(v85, v85))).f32[0]), v83.__sinval);
        v82.i32[3] = LODWORD(v83.__cosval);
      }
      float32x4_t v86 = v120;
      float32x4_t v87 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v86, (int8x16_t)v86, 0xCuLL), (int8x16_t)v120, 8uLL);
      v86.i32[3] = v120.i32[0];
      float32x4_t v88 = (float32x4_t)vzip1q_s32((int32x4_t)v82, (int32x4_t)v82);
      v88.i32[0] = v82.i32[2];
      float32x4_t v89 = vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v86, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v82, 3), (int8x16_t)v82, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), v82, v113), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v87, v88));
      float32x4_t v90 = (float32x4_t)vuzp1q_s32((int32x4_t)v82, (int32x4_t)v82);
      v90.i32[0] = v82.i32[1];
      float32x4_t v14 = vmlsq_f32(v89, v90, (float32x4_t)vextq_s8(v112, (int8x16_t)v120, 0xCuLL));
      float v23 = v23 + v79;
      if (fabsf(v77) <= 0.001) {
        break;
      }
    }
    while (v21++ < 0x63);
    if (a3) {
      *a3 = v23;
    }
    int8x16_t v91 = (int8x16_t)vmulq_f32(v14, v14);
    *(float32x2_t *)v91.i8 = vadd_f32(*(float32x2_t *)v91.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v91, v91, 8uLL));
    float32x4_t v92 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v91.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v91.i8, 1)), 0);
    float32x4_t v93 = vrsqrteq_f32(v92);
    float32x4_t v94 = vmulq_f32(v93, vrsqrtsq_f32(v92, vmulq_f32(v93, v93)));
    *(void *)&double result = vmulq_f32(v14, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v92), v103, (int8x16_t)vmulq_f32(v94, vrsqrtsq_f32(v92, vmulq_f32(v94, v94))))).u64[0];
  }
  else
  {
    if (a3) {
      *a3 = 0.0;
    }
    int8x16_t v10 = (void *)[a1 pointOfView];
    [v10 simdWorldOrientation];
  }
  return result;
}

- (void)clearRoll
{
  [(SCNCameraController *)self _setInertiaRunning:0];
  [(SCNCameraController *)self unrolledWorldOrientation:0];
  double v5 = v3;
  float v4 = [(SCNCameraController *)self pointOfView];

  [(SCNNode *)v4 setSimdWorldOrientation:v5];
}

- (void)stopInertia
{
}

- (void)frameNodes:(NSArray *)nodes
{
  v30[1] = *MEMORY[0x263EF8340];
  [(SCNCameraController *)self _setInertiaRunning:0];
  if ([(SCNNode *)[(SCNCameraController *)self pointOfView] camera])
  {
    id v5 = [(SCNNode *)[(SCNCameraController *)self pointOfView] scene];
    if (v5)
    {
      float32x4_t v6 = v5;
      SCNNodeGetBoundingSphere(nodes, 16843009);
      double v8 = v7;
      *(double *)v10.i64 = v7;
      v10.i64[1] = v9;
      float v11 = *((float *)&v9 + 1);
      if (*((float *)&v9 + 1) != 0.0)
      {
        float32x4_t v29 = v10;
        if ([[(SCNNode *)[(SCNCameraController *)self pointOfView] camera] usesOrthographicProjection])
        {
          v30[0] = [v6 rootNode];
          SCNNodeGetBoundingSphere((void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1], 0x10000);
          v13.i64[0] = v12;
          v13.i64[1] = v14;
          float32x4_t v15 = vsubq_f32(v29, v13);
          float32x4_t v16 = vmulq_f32(v15, v15);
          double v17 = (float)(*((float *)&v14 + 1)
                      + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0]));
          [[(SCNNode *)[(SCNCameraController *)self pointOfView] camera] zNear];
          double v19 = v18 + v17;
          [[(SCNNode *)[(SCNCameraController *)self pointOfView] camera] setOrthographicScale:(float)(v11 * 1.33)];
        }
        else
        {
          [[(SCNNode *)[(SCNCameraController *)self pointOfView] camera] fieldOfView];
          *(float *)&double v22 = v22;
          *(float *)&double v22 = (float)(*(float *)&v22 * 0.5) / 180.0 * 3.14159265;
          double v23 = (float)(v11 / sinf(*(float *)&v22));
          [[(SCNNode *)[(SCNCameraController *)self pointOfView] camera] zNear];
          double v19 = v20 + v23;
        }
        *(float *)&double v20 = v19;
        [(SCNNode *)[(SCNCameraController *)self pointOfView] simdWorldFront];
        int32x4_t v25 = (int32x4_t)vmulq_f32(v24, v24);
        v25.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2), vadd_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v25.i8, 1))).u32[0];
        float32x2_t v26 = vrsqrte_f32((float32x2_t)v25.u32[0]);
        float32x2_t v27 = vmul_f32(v26, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v26, v26)));
        [(SCNNode *)[(SCNCameraController *)self pointOfView] setSimdPosition:*(double *)vmlsq_lane_f32(v29, vmulq_n_f32(v24, vmul_f32(v27, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v27, v27))).f32[0]), v28, 0).i64];
        if ([(SCNCameraController *)self automaticTarget]) {
          [(SCNCameraController *)self setSimdTarget:v8];
        }
      }
    }
  }
}

- (double)lookAtWith:(float32x4_t)a3 target:
{
  [a1 simdUp];
  float32x4_t v3 = vsubq_f32(a3, a2);
  int32x4_t v4 = (int32x4_t)vmulq_f32(v3, v3);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  float32x2_t v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  float32x2_t v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  float32x4_t v7 = vmulq_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
  int8x16_t v8 = (int8x16_t)vnegq_f32(v7);
  float32x4_t v10 = vmlsq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), v8, 0xCuLL), vnegq_f32(v9)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL), v7);
  float32x4_t v11 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v10, (int32x4_t)v10), (int8x16_t)v10, 0xCuLL);
  int32x4_t v12 = (int32x4_t)vmulq_f32(v10, v10);
  v12.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), *(float32x2_t *)v12.i8)).u32[0];
  float32x2_t v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
  float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
  *(void *)&double result = vmulq_n_f32(v11, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]).u64[0];
  return result;
}

- (void)beginInteraction:(CGPoint)location withViewport:(CGSize)viewport
{
  double height = viewport.height;
  double y = location.y;
  double width = viewport.width;
  double x = location.x;
  [(SCNCameraController *)self _setInertiaRunning:0];
  v5.f64[0] = width;
  v5.f64[1] = height;
  float64x2_t v15 = v5;
  self->_handlingInteraction = 1;
  if ([(SCNCameraController *)self automaticTarget])
  {
    float32x2_t v6 = [(SCNNode *)[(SCNCameraController *)self pointOfView] sceneRef];
    if (!v6) {
      return;
    }
    float32x4_t v7 = (__n128 *)v6;
    __n128 v14 = (__n128)vcvt_hight_f32_f64(0, v15);
    v8.f64[0] = x;
    v8.f64[1] = y;
    float32x2_t v9 = vcvt_f32_f64(v8);
    C3DSceneLock((uint64_t)v6);
    HitTestResultsAtPoint = (const void *)C3DSceneCreateHitTestResultsAtPoint(v7, (float32x4_t *)[(SCNNode *)[(SCNCameraController *)self pointOfView] nodeRef], 0, *(double *)&v9, v14);
    C3DSceneUnlock((uint64_t)v7);
    if (HitTestResultsAtPoint)
    {
      id v11 = +[SCNHitTestResult hitTestResultsFromHitTestResultRef:HitTestResultsAtPoint];
      CFRelease(HitTestResultsAtPoint);
      if ([v11 count])
      {
        objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "worldCoordinates");
        -[SCNCameraController setTarget:](self, "setTarget:");
      }
    }
  }
  else
  {
    v12.f64[0] = x;
    v12.f64[1] = y;
    float32x2_t v9 = vcvt_f32_f64(v12);
  }
  *(float32x2_t *)self->_anon_70 = v9;
  *(float32x2_t *)&self->_anon_70[16] = v9;
  [(SCNCameraController *)self _resetOrientationState];
  if ([(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitCenteredArcball
    || [(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitArcball)
  {
    *(float32x2_t *)self->_anon_90 = vmla_f32(vneg_f32(*(float32x2_t *)self->_anon_70), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v15));
    -[SCNCameraController _mapToSphere:inViewport:](self, "_mapToSphere:inViewport:", x, y, width, height);
    *(_OWORD *)&self->_anon_90[16] = v13;
  }
}

- (void)continueInteraction:(CGPoint)location withViewport:(CGSize)viewport sensitivity:(CGFloat)sensitivity
{
  double height = viewport.height;
  double width = viewport.width;
  long long v21 = *(long long *)&location.y;
  CGFloat y = location.y;
  *(float32x2_t *)&self->_anon_70[8] = vcvt_f32_f64((float64x2_t)location);
  if (viewport.width >= viewport.height) {
    double v9 = viewport.width;
  }
  else {
    double v9 = viewport.height;
  }
  float v10 = 360.0 / v9 * sensitivity;
  float v11 = sensitivity;
  self->_inertia.rotationSensitivitCGFloat y = v10;
  self->_inertia.translationSensitivitCGFloat y = v11;
  if ([(SCNCameraController *)self interactionMode] == SCNInteractionModeFly
    || [(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitTurntable
    || [(SCNCameraController *)self interactionMode] == SCNInteractionModeOrbitAngleMapping)
  {
    double v12 = *(double *)&self->_anon_70[8];
    double v13 = COERCE_DOUBLE(vmul_n_f32(vsub_f32(*(float32x2_t *)self->_anon_70, *(float32x2_t *)&v12), self->_inertia.rotationSensitivity));
    LODWORD(v12) = HIDWORD(v13);
    [(SCNCameraController *)self rotateByX:v13 Y:v12];
    *(void *)self->_anon_70 = *(void *)&self->_anon_70[8];
  }
  else
  {
    if ([(SCNCameraController *)self interactionMode] != SCNInteractionModeOrbitCenteredArcball
      && [(SCNCameraController *)self interactionMode] != SCNInteractionModeOrbitArcball)
    {
      if ([(SCNCameraController *)self interactionMode] == SCNInteractionModePan)
      {
        float32x2_t v15 = vsub_f32(*(float32x2_t *)&self->_anon_70[8], *(float32x2_t *)&self->_anon_70[16]);
        double v16 = COERCE_DOUBLE(vmul_n_f32(v15, self->_inertia.translationSensitivity));
        v15.f32[0] = -*(float *)&v16;
        LODWORD(v16) = HIDWORD(v16);
        double v17 = 0.0;
        double v18 = self;
      }
      else
      {
        if ([(SCNCameraController *)self interactionMode] != SCNInteractionModeTruck) {
          goto LABEL_8;
        }
        float32x2_t v15 = vmul_n_f32(vsub_f32(*(float32x2_t *)&self->_anon_70[8], *(float32x2_t *)&self->_anon_70[16]), self->_inertia.translationSensitivity);
        *(float *)&double v17 = -v15.f32[1];
        double v16 = 0.0;
        double v18 = self;
      }
      [(SCNCameraController *)v18 _translateInCameraSpaceByX:*(double *)&v15 Y:v16 Z:v17];
      goto LABEL_8;
    }
    -[SCNCameraController _mapToSphere:inViewport:](self, "_mapToSphere:inViewport:", v20, v22, width, height);
    *(_OWORD *)&self->_anon_90[32] = v14;
    [(SCNCameraController *)self _updateArcballOrientation];
  }
LABEL_8:
  *(void *)&self->_anon_70[16] = *(void *)&self->_anon_70[8];
}

- (void)endInteraction:(CGPoint)location withViewport:(CGSize)viewport velocity:(CGPoint)velocity
{
  self->_handlingInteraction = 0;
  -[SCNCameraController _endDraggingWithVelocity:](self, "_endDraggingWithVelocity:", velocity.x, velocity.y, viewport.width, viewport.height);
}

- (void)rollBy:(float)delta aroundScreenPoint:(CGPoint)point viewport:(CGSize)viewport
{
  double height = viewport.height;
  double width = viewport.width;
  double y = point.y;
  double x = point.x;
  [(SCNCameraController *)self _setInertiaRunning:0];
  -[SCNCameraController _directionForScreenPoint:viewport:](self, "_directionForScreenPoint:viewport:", x, y, width, height);
  float32x4_t v12 = v11;
  float32x4_t v13 = vmulq_f32(v11, v11);
  float32x4_t v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1)));
  if (v14.f32[0] <= 0.000000001)
  {
    float32x4_t v19 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  }
  else
  {
    float32x4_t v27 = v14;
    float v15 = delta / 180.0 * 3.14159265;
    float32x4_t v28 = v12;
    __float2 v16 = __sincosf_stret(v15 * 0.5);
    float32x2_t v17 = vrsqrte_f32((float32x2_t)v27.u32[0]);
    float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v17, v17)));
    float32x4_t v19 = vmulq_n_f32(vmulq_n_f32(v28, vmul_f32(v18, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v18, v18))).f32[0]), v16.__sinval);
    v19.i32[3] = LODWORD(v16.__cosval);
  }
  float32x4_t v29 = v19;
  [(SCNNode *)[(SCNCameraController *)self pointOfView] simdOrientation];
  float32x4_t v21 = v20;
  v21.i32[3] = v20.i32[0];
  int32x4_t v22 = (int32x4_t)v29;
  float32x4_t v23 = (float32x4_t)vzip1q_s32(v22, v22);
  v23.i32[0] = v29.i32[2];
  float32x4_t v24 = vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v29, 3), (int8x16_t)v29, 4uLL), v21), (float32x4_t)xmmword_20B5CBBD0), v29, v20, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32(v23, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v20, (int8x16_t)v20, 0xCuLL), (int8x16_t)v20, 8uLL)));
  float32x4_t v25 = (float32x4_t)vuzp1q_s32(v22, v22);
  v25.i32[0] = v29.i32[1];
  *(void *)&double v30 = vmlsq_f32(v24, v25, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL)).u64[0];
  float32x2_t v26 = [(SCNCameraController *)self pointOfView];

  [(SCNNode *)v26 setSimdOrientation:v30];
}

- (void)dollyBy:(float)delta onScreenPoint:(CGPoint)point viewport:(CGSize)viewport
{
  double height = viewport.height;
  double width = viewport.width;
  double y = point.y;
  double x = point.x;
  [(SCNCameraController *)self _setInertiaRunning:0];
  -[SCNCameraController _directionForScreenPoint:viewport:](self, "_directionForScreenPoint:viewport:", x, y, width, height);
  float32x4_t v13 = v10;
  float32x4_t v11 = [(SCNCameraController *)self pointOfView];
  *(void *)&double v12 = vmulq_n_f32(v13, delta).u64[0];

  [(SCNNode *)v11 simdLocalTranslateBy:v12];
}

- (void)_resetOrientationState
{
  [(SCNNode *)[(SCNCameraController *)self pointOfView] simdWorldTransform];
  *(float32x4_t *)&self->_anon_10[16] = v3;
  *(float32x4_t *)&self->_anon_10[32] = v4;
  *(float32x4_t *)&self->_anon_10[48] = v5;
  *(_OWORD *)&self->_anon_10[64] = v6;
  int8x16_t v7 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5), (int8x16_t)v5, 0xCuLL), vnegq_f32(v4)), v5, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL));
  float32x4_t v8 = vmulq_f32(v3, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL));
  _NF = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0] < 0.0;
  float v10 = 1.0;
  if (_NF) {
    float v10 = -1.0;
  }
  float32x4_t v11 = vmulq_f32(v3, v3);
  float32x4_t v12 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1)));
  float32x4_t v13 = vmulq_f32(v4, v4);
  v12.f32[0] = sqrtf(v12.f32[0]);
  float32x4_t v14 = vmulq_f32(v5, v5);
  v12.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0]);
  v12.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0]);
  float32x4_t v15 = vmulq_n_f32(v12, v10);
  uint32x4_t v16 = (uint32x4_t)vceqzq_f32(v15);
  v16.i32[3] = v16.i32[2];
  if ((vmaxvq_u32(v16) & 0x80000000) != 0
    || (uint32x4_t v17 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v15), (int8x16_t)vcgezq_f32(v15))),
        v17.i32[3] = v17.i32[2],
        (vmaxvq_u32(v17) & 0x80000000) != 0))
  {
    int8x16_t v24 = *(int8x16_t *)(MEMORY[0x263EF89A8] + 48);
  }
  else
  {
    float32x4_t v18 = vdivq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0));
    float32x4_t v19 = vdivq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1));
    float32x4_t v20 = vdivq_f32(v5, (float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2));
    float v21 = v20.f32[2] + (float)(v18.f32[0] + v19.f32[1]);
    if (v21 <= 0.0)
    {
      BOOL v25 = v18.f32[0] <= v19.f32[1] || v18.f32[0] <= v20.f32[2];
      if (v25)
      {
        if (v19.f32[1] <= v20.f32[2])
        {
          float32_t v30 = (float)(v20.f32[2] + 1.0) - v18.f32[0];
          float32x4_t v31 = (float32x4_t)vzip2q_s32((int32x4_t)v18, vzip1q_s32((int32x4_t)v20, (int32x4_t)v18));
          int8x16_t v32 = (int8x16_t)vrev64q_s32((int32x4_t)v19);
          float32x4_t v33 = (float32x4_t)vextq_s8(v32, v32, 8uLL);
          v33.i32[0] = v20.i32[0];
          v23.i64[0] = vaddq_f32(v31, v33).u64[0];
          v31.f32[2] = v30;
          v23.i64[1] = vsubq_f32(v31, v33).i64[1];
          v20.i32[0] = v23.i32[2];
        }
        else
        {
          float32_t v26 = (float)(v19.f32[1] + 1.0) - v18.f32[0];
          float32x4_t v27 = v19;
          v27.i32[0] = v18.i32[1];
          v19.i32[1] = v20.i32[2];
          v19.i32[2] = v20.i32[1];
          int32x4_t v28 = (int32x4_t)vaddq_f32(v27, v19);
          v27.f32[1] = v26;
          v27.i32[3] = v20.i32[0];
          v19.i32[3] = v18.i32[2];
          float32x4_t v20 = vsubq_f32(v27, v19);
          float32x4_t v23 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v28), (int32x4_t)v20);
          v20.i32[0] = v20.i32[1];
        }
      }
      else
      {
        float32x4_t v29 = v18;
        v29.f32[0] = (float)(v18.f32[0] + 1.0) - v19.f32[1];
        v29.i32[3] = v19.i32[2];
        float32x4_t v5 = (float32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL);
        float32x4_t v20 = vsubq_f32(v29, v5);
        v5.i32[1] = v19.i32[0];
        float32x4_t v23 = vaddq_f32(v18, v5);
        v23.i32[0] = v20.i32[0];
        v23.i32[3] = v20.i32[3];
      }
    }
    else
    {
      float32x4_t v22 = (float32x4_t)vzip2q_s32((int32x4_t)v19, vuzp1q_s32((int32x4_t)v19, (int32x4_t)v20));
      v22.i32[2] = v18.i32[1];
      float32x4_t v20 = (float32x4_t)vtrn2q_s32((int32x4_t)v20, vzip2q_s32((int32x4_t)v20, (int32x4_t)v18));
      v20.i32[2] = v19.i32[0];
      float32x4_t v23 = vsubq_f32(v22, v20);
      v20.i32[3] = 1.0;
      v22.f32[3] = v21;
      v23.i32[3] = vaddq_f32(v22, v20).i32[3];
      v20.i32[0] = v23.i32[3];
    }
    v5.i32[0] = 0;
    float32x4_t v34 = vmulq_n_f32(v23, 0.5 / sqrtf(v20.f32[0]));
    int32x4_t v35 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v34), (int8x16_t)vcgezq_f32(v34)));
    v35.i32[0] = vmaxvq_u32((uint32x4_t)v35);
    int8x16_t v24 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32((int32x4_t)v5, v35), 0), *(int8x16_t *)(MEMORY[0x263EF89A8] + 48), (int8x16_t)v34);
  }
  *(int8x16_t *)&self->_anon_10[80] = v24;
  *(void *)self->_anon_10 = 0;
  uint32x2_t v36 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)self->_minimumAngles));
  if ((vpmax_u32(v36, v36).u32[0] & 0x80000000) != 0
    || (v37.i64[0] = 0,
        uint32x2_t v38 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)self->_maximumAngles)),
        (vpmax_u32(v38, v38).u32[0] & 0x80000000) != 0))
  {
    SCNInteractionMode v39 = [(SCNCameraController *)self interactionMode];
    float32x4_t v40 = [(SCNCameraController *)self pointOfView];
    if (v39)
    {
      [(SCNNode *)v40 simdWorldPosition];
      float32x4_t v79 = v41;
      [(SCNCameraController *)self simdTarget];
      float32x4_t v43 = vsubq_f32(v79, v42);
    }
    else
    {
      [(SCNNode *)v40 simdWorldFront];
      float32x4_t v43 = vnegq_f32(v44);
    }
    float32x4_t v80 = v43;
    [(SCNCameraController *)self simdUp];
    float32x4_t v46 = vmulq_f32(v80, v45);
    float32x4_t v76 = vmlsq_lane_f32(v80, v45, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v46, 2), vaddq_f32(v46, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v46.f32, 1))), 0);
    float v78 = atan2f(v76.f32[0], v76.f32[2]);
    [(SCNNode *)[(SCNCameraController *)self pointOfView] simdWorldRight];
    float32x4_t v48 = vmulq_f32(v47, v76);
    float32x4_t v49 = vmlsq_lane_f32(v76, v47, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v48, 2), vaddq_f32(v48, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v48.f32, 1))), 0);
    float32x4_t v50 = v47;
    float32x4_t v51 = vmulq_f32(v49, v49);
    float32x4_t v52 = v49;
    v51.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1))).u64[0];
    float32x4_t v53 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 0);
    float32x4_t v54 = vrsqrteq_f32(v53);
    float32x4_t v55 = vmulq_f32(v54, vrsqrtsq_f32(v53, vmulq_f32(v54, v54)));
    int8x16_t v56 = (int8x16_t)vmulq_f32(v55, vrsqrtsq_f32(v53, vmulq_f32(v55, v55)));
    int32x4_t v57 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v51.f32[0] != 0.0)), 0x1FuLL));
    v57.i32[3] = 0;
    __asm { FMOV            V2.4S, #1.0 }
    float32x4_t v62 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v57), v56, _Q2);
    float32x4_t v77 = v50;
    float32x4_t v63 = vmulq_f32(v80, v50);
    float32x4_t v64 = vmlsq_lane_f32(v80, v50, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))), 0);
    float32x4_t v65 = vmulq_f32(v64, v64);
    v65.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2), vaddq_f32(v65, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 1))).u64[0];
    float32x4_t v66 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 0);
    float32x4_t v67 = vmulq_f32(v52, v62);
    float32x4_t v68 = vrsqrteq_f32(v66);
    float32x4_t v69 = vmulq_f32(v68, vrsqrtsq_f32(v66, vmulq_f32(v68, v68)));
    int32x4_t v70 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v65.f32[0] != 0.0)), 0x1FuLL));
    v70.i32[3] = 0;
    float32x4_t v71 = vmulq_f32(v64, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v70), (int8x16_t)vmulq_f32(v69, vrsqrtsq_f32(v66, vmulq_f32(v69, v69))), _Q2));
    int8x16_t v72 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v71, (int32x4_t)v71), (int8x16_t)v71, 0xCuLL), vnegq_f32(v67)), v71, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v67, (int32x4_t)v67), (int8x16_t)v67, 0xCuLL));
    float32x4_t v81 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), v72, 0xCuLL);
    float32x4_t v73 = vmulq_f32(v71, v67);
    float v74 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v73, 2), vaddq_f32(v73, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v73.f32, 1))).f32[0];
    if (v74 >= 1.0) {
      float v74 = 1.0;
    }
    if (v74 <= -1.0) {
      float v74 = -1.0;
    }
    float v75 = acosf(v74);
    float32x4_t v37 = vmulq_f32(v77, v81);
    BOOL v25 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0] <= 0.0;
    v37.f32[0] = v78;
    if (v25) {
      float v75 = -v75;
    }
    v37.f32[1] = v75;
  }
  *(void *)&self->_anon_10[8] = v37.i64[0];
}

- (float32x4_t)_directionForScreenPoint:(double)a3 viewport:(float64_t)a4
{
  double result = (float32x4_t *)objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "nodeRef");
  if (result)
  {
    long long v6 = result;
    double result = (float32x4_t *)C3DGetScene(result);
    if (result)
    {
      uint64_t v7 = (uint64_t)result;
      uint64_t v8 = C3DGetScene(v6);
      C3DSceneLock(v8);
      memset(v20, 0, sizeof(v20));
      if (C3DNodeGetProjectionInfos((uint64_t)v6, (uint64_t)v20))
      {
        if ((v20[0] & 2) != 0) {
          C3DAdjustZRangeOfProjectionInfos((uint64_t)v20, v6, 0, v7);
        }
        v9.f64[0] = a4;
        v9.f64[1] = a5;
        float32x4_t v19 = vcvt_hight_f32_f64(0, v9);
        simd_float4x4 v21 = *(simd_float4x4 *)C3DProjectionInfosGetMatrix((char *)v20, (uint64_t)&v19, 0);
        __invert_f4(v21);
        __asm { FMOV            V1.4S, #-1.0 }
        uint64_t v15 = C3DGetScene(v6);
        return (float32x4_t *)C3DSceneUnlock(v15);
      }
      else
      {
        uint64_t v16 = C3DGetScene(v6);
        return (float32x4_t *)C3DSceneUnlock(v16);
      }
    }
  }
  return result;
}

- (void)_updateInertiaAtTime:(double)a3
{
  if (self->_inertia.inertiaRunning)
  {
    float v4 = (a3 - self->_inertia.lastSimulationTime) * 60.0;
    int v5 = (int)fmaxf(v4, 1.0);
    self->_inertia.lastSimulationTime = a3;
    if (v5 >= 1)
    {
      float friction = self->_inertia.friction;
      do
      {
        if (friction != 0.0)
        {
          if (v4 <= 1.0) {
            float v7 = v4;
          }
          else {
            float v7 = 1.0;
          }
          *(float32x2_t *)self->_anon_e0 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)self->_anon_e0), 1.0 - (float)(fmaxf(v7, 0.0) * friction)));
        }
        float v4 = v4 + -1.0;
        --v5;
      }
      while (v5);
    }
    if (![(SCNCameraController *)self drivenByDefaultNavigationCameraController])
    {
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
    }
    float32x2_t v8 = *(float32x2_t *)self->_anon_e0;
    float32x4_t v9 = (float32x4_t)vmulq_f64(vcvtq_f64_f32(v8), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL));
    *(float32x2_t *)v9.f32 = vcvt_f32_f64((float64x2_t)v9);
    v9.i32[2] = 0;
    float32x4_t v10 = vaddq_f32(*(float32x4_t *)&self->_anon_90[32], vaddq_f32(*(float32x4_t *)&self->_anon_90[16], v9));
    int32x4_t v11 = (int32x4_t)vmulq_f32(v10, v10);
    v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
    float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
    float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
    double v14 = COERCE_DOUBLE(vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))));
    *(float32x4_t *)&self->_anon_90[32] = vmulq_n_f32(v10, *(float *)&v14);
    switch(self->_interactionMode)
    {
      case 0:
      case 1:
      case 2:
        float32x2_t v15 = vmul_n_f32(v8, self->_inertia.rotationSensitivity);
        double v16 = (float)-v15.f32[0] / 180.0 * 3.14159265;
        *(float *)&double v16 = v16;
        double v17 = v15.f32[1] / 180.0 * 3.14159265;
        *(float *)&double v17 = v17;
        [(SCNCameraController *)self _rotateByX:v16 Y:v17];
        break;
      case 3:
      case 4:
        [(SCNCameraController *)self _updateArcballOrientation];
        break;
      case 5:
        double v18 = COERCE_DOUBLE(vmul_n_f32(v8, self->_inertia.translationSensitivity));
        v8.f32[0] = -*(float *)&v18;
        *(float *)&double v18 = -*((float *)&v18 + 1);
        double v14 = 0.0;
        float32x4_t v19 = self;
        goto LABEL_17;
      case 6:
        float32x2_t v8 = vmul_n_f32(v8, self->_inertia.translationSensitivity);
        LODWORD(v14) = v8.i32[1];
        double v18 = 0.0;
        float32x4_t v19 = self;
LABEL_17:
        [(SCNCameraController *)v19 _translateInCameraSpaceByX:*(double *)&v8 Y:v18 Z:v14];
        break;
      default:
        break;
    }
    if (![(SCNCameraController *)self drivenByDefaultNavigationCameraController])+[SCNTransaction commit]; {
    if (vaddv_f32(vmul_f32(*(float32x2_t *)self->_anon_e0, *(float32x2_t *)self->_anon_e0)) < 0.1)
    }
    {
      [(SCNCameraController *)self _setInertiaRunning:0];
    }
  }
}

- (__n128)_targetRelativeToPointOfViewParent
{
  if (objc_msgSend((id)-[__n128 pointOfView](a1, "pointOfView"), "parentNode"))
  {
    uint64_t v2 = objc_msgSend((id)-[__n128 pointOfView](a1, "pointOfView"), "parentNode");
    __n128 v3 = a1[16];
    [v2 simdConvertPosition:0 fromNode:v3.n128_f64[0]];
  }
  else
  {
    return a1[16];
  }
  return result;
}

- (void)_translateInCameraSpaceByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  int v5 = [(SCNCameraController *)self pointOfView];

  [(SCNNode *)v5 simdLocalTranslateBy:COERCE_DOUBLE(__PAIR64__(LODWORD(a4), LODWORD(a3)))];
}

- (void)_rotateByX:(float)a3 Y:(float)a4
{
  uint32x2_t v5 = (uint32x2_t)vceqz_f32(*(float32x2_t *)&a3);
  if ((vpmin_u32(v5, v5).u32[0] & 0x80000000) == 0)
  {
    int8x8_t v6 = (int8x8_t)vadd_f32(*(float32x2_t *)&a3, *(float32x2_t *)self->_anon_10);
    *(float *)&unsigned int v7 = *(float *)v6.i32 + -6.28318531;
    int8x8_t v8 = vbsl_s8((int8x8_t)vcgtd_f64(*(float *)v6.i32, 6.28318531), (int8x8_t)__PAIR64__(v6.u32[1], v7), v6);
    *(float *)&unsigned int v9 = *(float *)v8.i32 + 6.28318531;
    int8x8_t v10 = vbsl_s8((int8x8_t)vcgtd_f64(-6.28318531, *(float *)v8.i32), (int8x8_t)__PAIR64__(v8.u32[1], v9), v8);
    double v11 = *(float *)&v10.i32[1];
    if (*(float *)&v10.i32[1] > 6.28318531)
    {
      *(float *)&__int32 v12 = v11 + -6.28318531;
      v10.i32[1] = v12;
      double v11 = *(float *)&v12;
    }
    if (v11 < -6.28318531)
    {
      *(float *)&__int32 v13 = v11 + 6.28318531;
      v10.i32[1] = v13;
    }
    *(int8x8_t *)self->_anon_10 = v10;
    [(SCNCameraController *)self _updateRotation];
  }
}

- (double)_orientationForMode
{
  float32x4_t v46 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  if ([(id)a1 interactionMode])
  {
    if ([(id)a1 interactionMode] == 1)
    {
      [(id)a1 simdUp];
    }
    else
    {
      if ([(id)a1 interactionMode] != 2)
      {
        float32x4_t v30 = v46;
        goto LABEL_15;
      }
      objc_msgSend((id)objc_msgSend((id)a1, "pointOfView"), "simdWorldUp");
    }
    float32x4_t v13 = v2;
    float32x4_t v14 = vmulq_f32(v2, v2);
    float32x4_t v15 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1)));
    float32x4_t v16 = v46;
    if (v15.f32[0] > 0.000000001)
    {
      float32x4_t v41 = v15;
      float32x4_t v45 = v13;
      __float2 v17 = __sincosf_stret(0.5 * COERCE_FLOAT(*(void *)(a1 + 16)));
      float32x2_t v18 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v18, v18)));
      float32x4_t v16 = vmulq_n_f32(vmulq_n_f32(v45, vmul_f32(v19, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v19, v19))).f32[0]), v17.__sinval);
      v16.i32[3] = LODWORD(v17.__cosval);
    }
    float32x4_t v44 = v16;
    objc_msgSend((id)objc_msgSend((id)a1, "pointOfView", *(_OWORD *)&v41), "simdWorldRight");
  }
  else
  {
    __n128 v3 = (void *)[(id)a1 pointOfView];
    [(id)a1 simdUp];
    objc_msgSend(v3, "simdConvertVector:fromNode:", 0);
    float32x4_t v5 = v4;
    float32x4_t v6 = vmulq_f32(v4, v4);
    float32x4_t v7 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1)));
    float32x4_t v8 = v46;
    if (v7.f32[0] > 0.000000001)
    {
      float32x4_t v41 = v7;
      float32x4_t v43 = v5;
      __float2 v9 = __sincosf_stret(0.5 * COERCE_FLOAT(*(void *)(a1 + 16)));
      float32x2_t v10 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v10, v10)));
      float32x4_t v8 = vmulq_n_f32(vmulq_n_f32(v43, vmul_f32(v11, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v11, v11))).f32[0]), v9.__sinval);
      v8.i32[3] = LODWORD(v9.__cosval);
    }
    float32x4_t v44 = v8;
    +[SCNNode simdLocalRight];
  }
  float32x4_t v20 = v12;
  float32x4_t v21 = vmulq_f32(v12, v12);
  float v22 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).f32[0];
  float32x4_t v23 = v46;
  if (v22 > 0.000000001)
  {
    float v42 = v22;
    float32x4_t v47 = v20;
    __float2 v24 = __sincosf_stret(*(float *)(a1 + 20) * 0.5);
    float32x2_t v25 = vrsqrte_f32((float32x2_t)LODWORD(v42));
    float32x2_t v26 = vmul_f32(v25, vrsqrts_f32((float32x2_t)LODWORD(v42), vmul_f32(v25, v25)));
    float32x4_t v23 = vmulq_n_f32(vmulq_n_f32(v47, vmul_f32(v26, vrsqrts_f32((float32x2_t)LODWORD(v42), vmul_f32(v26, v26))).f32[0]), v24.__sinval);
    v23.i32[3] = LODWORD(v24.__cosval);
  }
  float32x4_t v27 = v44;
  v27.i32[3] = v44.i32[0];
  float32x4_t v28 = (float32x4_t)vzip1q_s32((int32x4_t)v23, (int32x4_t)v23);
  v28.i32[0] = v23.i32[2];
  float32x4_t v29 = (float32x4_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23);
  v29.i32[0] = v23.i32[1];
  float32x4_t v30 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v27, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v23, 3), (int8x16_t)v23, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), v23, v44, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v44, (int8x16_t)v44, 0xCuLL), (int8x16_t)v44, 8uLL), v28)), v29, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v44, (int32x4_t)v44), (int8x16_t)v44, 0xCuLL));
LABEL_15:
  int8x16_t v31 = (int8x16_t)vmulq_f32(v30, v30);
  *(float32x2_t *)v31.i8 = vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
  float32x4_t v32 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.i8, 1)), 0);
  float32x4_t v33 = vrsqrteq_f32(v32);
  float32x4_t v34 = vmulq_f32(v33, vrsqrtsq_f32(v32, vmulq_f32(v33, v33)));
  __asm { FMOV            V2.4S, #1.0 }
  *(void *)&double result = vmulq_f32(v30, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v32), _Q2, (int8x16_t)vmulq_f32(v34, vrsqrtsq_f32(v32, vmulq_f32(v34, v34))))).u64[0];
  return result;
}

- (void)_capOrientationAnglesToMaximum
{
  unint64_t interactionMode = self->_interactionMode;
  if (interactionMode > 1) {
    return;
  }
  float32x2_t v3 = *(float32x2_t *)self->_anon_10;
  float32x2_t v4 = vadd_f32(*(float32x2_t *)&self->_anon_10[8], v3);
  v5.i32[0] = v4.i32[0];
  v5.i32[1] = vneg_f32(v4).i32[1];
  float32x2_t v6 = (float32x2_t)vbsl_s8((int8x8_t)vceqd_s64(interactionMode, 0), (int8x8_t)v4, v5);
  float32x2_t v7 = *(float32x2_t *)self->_maximumAngles;
  if (v7.f32[0] != 0.0 || COERCE_FLOAT(*(void *)self->_minimumAngles) != 0.0)
  {
    if ((vcgt_f32(v6, v7).u8[0] & 1) != 0 && v3.f32[0] > 0.0)
    {
      float v8 = fmaxf(vsub_f32(v3, vsub_f32(v6, v7)).f32[0], 0.0);
LABEL_11:
      v3.f32[0] = v8;
      *(float32x2_t *)self->_anon_10 = v3;
      goto LABEL_12;
    }
    float32x2_t v9 = *(float32x2_t *)self->_minimumAngles;
    if ((vcgt_f32(v9, v6).u8[0] & 1) != 0 && v3.f32[0] < 0.0)
    {
      float v8 = vsub_f32(v3, vsub_f32(v6, v9)).f32[0];
      if (v8 > 0.0) {
        float v8 = 0.0;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
  if (v7.f32[1] != 0.0 || *(float *)&self->_minimumAngles[4] != 0.0)
  {
    if (interactionMode)
    {
      if (v6.f32[1] > v7.f32[1] && v3.f32[1] < 0.0)
      {
        float v10 = (float)(v6.f32[1] - v7.f32[1]) + v3.f32[1];
        goto LABEL_28;
      }
      float v11 = *(float *)&self->_minimumAngles[4];
      if (v6.f32[1] < v11 && v3.f32[1] > 0.0)
      {
        float v12 = (float)(v6.f32[1] - v11) + v3.f32[1];
LABEL_24:
        float v10 = fmaxf(v12, 0.0);
LABEL_30:
        v3.f32[1] = v10;
        *(float32x2_t *)self->_anon_10 = v3;
      }
    }
    else
    {
      if (v6.f32[1] > v7.f32[1] && v3.f32[1] > 0.0)
      {
        float v12 = v3.f32[1] - (float)(v6.f32[1] - v7.f32[1]);
        goto LABEL_24;
      }
      float v13 = *(float *)&self->_minimumAngles[4];
      if (v6.f32[1] < v13 && v3.f32[1] < 0.0)
      {
        float v10 = v3.f32[1] - (float)(v6.f32[1] - v13);
LABEL_28:
        if (v10 > 0.0) {
          float v10 = 0.0;
        }
        goto LABEL_30;
      }
    }
  }
}

- (void)_updateRotation
{
  if (self->_interactionMode <= 2uLL)
  {
    [(SCNCameraController *)self _capOrientationAnglesToMaximum];
    if ([(SCNCameraController *)self useOrbitInteractionMode])
    {
      -[SCNNode setSimdWorldTransform:]([(SCNCameraController *)self pointOfView], "setSimdWorldTransform:", *(double *)&self->_anon_10[16], *(double *)&self->_anon_10[32], *(double *)&self->_anon_10[48], *(double *)&self->_anon_10[64]);
      float32x2_t v3 = [(SCNCameraController *)self pointOfView];
      [(SCNCameraController *)self _orientationForMode];
      double v7 = v4;
      [(SCNCameraController *)self simdTarget];
      [(SCNNode *)v3 simdRotateBy:v7 aroundTarget:v5];
    }
    else
    {
      [(SCNNode *)[(SCNCameraController *)self pointOfView] setSimdWorldOrientation:*(double *)&self->_anon_10[80]];
      float32x2_t v6 = [(SCNCameraController *)self pointOfView];
      [(SCNCameraController *)self _orientationForMode];
      -[SCNNode simdLocalRotateBy:](v6, "simdLocalRotateBy:");
    }
  }
}

- (double)_convertRotationFromWorldToPointOfView:(void *)a1
{
  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  float32x4_t v16 = v3;
  objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "simdWorldOrientation");
  float32x4_t v5 = vnegq_f32(v4);
  float32x4_t v6 = (float32x4_t)vzip1q_s32((int32x4_t)v5, (int32x4_t)v5);
  v6.i32[0] = v5.i32[2];
  float32x4_t v7 = (float32x4_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5);
  v7.i32[0] = v5.i32[1];
  v5.i32[3] = v4.i32[3];
  float32x4_t v8 = a2;
  v8.i32[3] = a2.i32[0];
  float32x4_t v9 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v8, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v5, 3), (int8x16_t)v5, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), v5, a2, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)a2, (int8x16_t)a2, 0xCuLL), (int8x16_t)a2, 8uLL), v6)), v7, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a2, (int32x4_t)a2), (int8x16_t)a2, 0xCuLL));
  int8x16_t v10 = (int8x16_t)v16;
  float32x4_t v11 = v16;
  v11.i32[3] = v16.i32[0];
  float32x4_t v12 = (float32x4_t)vzip1q_s32((int32x4_t)v9, (int32x4_t)v9);
  v12.i32[0] = v9.i32[2];
  float32x4_t v13 = vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v11, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v9, 3), (int8x16_t)v9, 4uLL)), (float32x4_t)xmmword_20B5CBBD0), v9, v16, 3), (float32x4_t)xmmword_20B5CBBD0, vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v10, v10, 0xCuLL), (int8x16_t)v16, 8uLL), v12));
  float32x4_t v14 = (float32x4_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9);
  v14.i32[0] = v9.i32[1];
  *(void *)&double result = vmlsq_f32(v13, v14, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v10, (int32x4_t)v10), (int8x16_t)v16, 0xCuLL)).u64[0];
  return result;
}

- (void)_updateArcballOrientation
{
  if (self->_interactionMode >= 2uLL)
  {
    float32x4_t v4 = *(float32x4_t *)&self->_anon_90[16];
    float32x4_t v3 = *(float32x4_t *)&self->_anon_90[32];
    uint32x4_t v5 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32(v4, v3));
    v5.i32[3] = v5.i32[2];
    if ((vminvq_u32(v5) & 0x80000000) == 0)
    {
      float32x4_t v6 = vmulq_f32(v4, v3);
      LODWORD(v7) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).u32[0];
      if (fabsf(v7) < 1.0)
      {
        float32x4_t v8 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v3, (int32x4_t)v3), (int8x16_t)v3, 0xCuLL), vnegq_f32(v4)), v3, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL));
        float32x4_t v9 = vmulq_f32(v8, v8);
        float32x4_t v10 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), v9));
        if (v10.f32[0] <= 0.000000001)
        {
          long long v14 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
        }
        else
        {
          float32x4_t v27 = v10;
          float32x4_t v28 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL);
          float v11 = acosf(v7);
          LODWORD(v14) = *(void *)&__sincosf_stret((float)(v11 * -2.0) * 0.5);
          float32x2_t v12 = vrsqrte_f32((float32x2_t)v27.u32[0]);
          float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v12, v12)));
          *(void *)&long long v14 = vmulq_n_f32(vmulq_n_f32(v28, vmul_f32(v13, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v13, v13))).f32[0]), *(float *)&v14).u64[0];
        }
        -[SCNCameraController _convertRotationFromWorldToPointOfView:](self, "_convertRotationFromWorldToPointOfView:", *(double *)&v14, *(_OWORD *)&v27);
        float32x4_t v29 = v15;
        float32x4_t v16 = [(SCNCameraController *)self pointOfView];
        int8x16_t v17 = (int8x16_t)vmulq_f32(v29, v29);
        *(float32x2_t *)v17.i8 = vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
        float32x4_t v18 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1)), 0);
        float32x4_t v19 = vrsqrteq_f32(v18);
        float32x4_t v20 = vmulq_f32(v19, vrsqrtsq_f32(v18, vmulq_f32(v19, v19)));
        __asm { FMOV            V2.4S, #1.0 }
        v29.i64[0] = vmulq_f32(v29, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v18), _Q2, (int8x16_t)vmulq_f32(v20, vrsqrtsq_f32(v18, vmulq_f32(v20, v20))))).u64[0];
        [(SCNCameraController *)self simdTarget];
        [(SCNNode *)v16 simdRotateBy:*(double *)v29.i64 aroundTarget:v26];
        float32x4_t v3 = *(float32x4_t *)&self->_anon_90[32];
      }
      *(float32x4_t *)&self->_anon_90[16] = v3;
    }
  }
}

- (BOOL)_isLocationValid:(CGPoint)a3 inViewport:(CGSize)a4
{
  BOOL v4 = a3.x <= a4.width;
  if (a3.y < 0.0) {
    BOOL v4 = 0;
  }
  if (a3.y > a4.height) {
    BOOL v4 = 0;
  }
  return a3.x >= 0.0 && v4;
}

- (double)_mapToSphere:(float64_t)a3 inViewport:(double)a4
{
  a2.f64[1] = a3;
  if (*(void *)&a1[39] == 3) {
    a2 = vaddq_f64(a2, vcvtq_f64_f32(a1[18]));
  }
  if (a4 >= a5) {
    double v5 = a4;
  }
  else {
    double v5 = a5;
  }
  *(float *)&double v5 = v5;
  float32x4_t v6 = (float32x4_t)vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)(*(float *)&v5 * 0.5)), 0));
  *(float32x2_t *)v6.f32 = vdiv_f32(vcvt_f32_f64((float64x2_t)v6), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v5, 0));
  float v7 = vmlas_n_f32(COERCE_FLOAT(vmul_f32(*(float32x2_t *)&v6, *(float32x2_t *)&v6).i32[1]), v6.f32[0], v6.f32[0]);
  BOOL v8 = v7 < 0.125;
  float v9 = 0.125 / sqrtf(v7);
  float v10 = sqrtf(0.25 - v7);
  if (!v8) {
    float v10 = v9;
  }
  v6.f32[2] = v10;
  int32x4_t v11 = (int32x4_t)vmulq_f32(v6, v6);
  v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
  float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  v6.i64[0] = vmulq_n_f32(v6, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]).u64[0];
  return *(double *)v6.i64;
}

- (void)_endDraggingWithVelocity:(CGPoint)a3
{
  if (self->_inertia.inertiaEnabled)
  {
    CGFloat y = a3.y;
    float32x2_t v4 = vcvt_f32_f64((float64x2_t)a3);
    uint32x2_t v5 = (uint32x2_t)vcge_f32(vabs_f32(v4), (float32x2_t)vdup_n_s32(0x3DCCCCCDu));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      float32x2_t v7 = vdiv_f32(v4, (float32x2_t)vdup_n_s32(0x42700000u));
      *(float32x2_t *)self->_anon_e0 = v7;
      if (self->_inertia.friction == 0.0)
      {
        int8x8_t v8 = (int8x8_t)vdup_lane_s32(vcgt_f32(v7, 0), 0);
        float v9 = -20.0;
        if (v7.f32[0] >= -20.0) {
          float v10 = v7.f32[0];
        }
        else {
          float v10 = -20.0;
        }
        v7.i32[0] = fminf(v7.f32[0], 20.0);
        int8x8_t v11 = vbsl_s8(v8, (int8x8_t)v7, (int8x8_t)__PAIR64__(v7.u32[1], LODWORD(v10)));
        float v12 = fminf(*(float *)&v11.i32[1], 20.0);
        if (*(float *)&v11.i32[1] >= -20.0) {
          float v9 = *(float *)&v11.i32[1];
        }
        if (*(float *)&v11.i32[1] <= 0.0) {
          float v13 = v9;
        }
        else {
          float v13 = v12;
        }
        *(float *)&v11.i32[1] = v13;
        *(int8x8_t *)self->_anon_e0 = v11;
      }
      else
      {
        float v13 = v7.f32[1];
      }
      *(float *)&self->_anon_e0[4] = -v13;
      [(SCNCameraController *)self _setInertiaRunning:1];
      self->_inertia.lastSimulationTime = CACurrentMediaTime();
    }
  }
}

uint64_t __42__SCNCameraController__setInertiaRunning___block_invoke(uint64_t a1)
{
  float32x4_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 cameraInertiaWillStartForController:v3];
}

uint64_t __42__SCNCameraController__setInertiaRunning___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = CACurrentMediaTime();

  return [v1 _updateInertiaAtTime:v2];
}

uint64_t __42__SCNCameraController__setInertiaRunning___block_invoke_3(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 cameraInertiaDidEndForController:v3];
}

- (id)delegate
{
  return self->_delegate;
}

- (SCNInteractionMode)interactionMode
{
  return self->_interactionMode;
}

- (BOOL)automaticTarget
{
  return self->_automaticTarget;
}

- (void)setAutomaticTarget:(BOOL)automaticTarget
{
  self->_automaticTarget = automaticTarget;
}

- (double)_orthographicViewSpaceTranslationForZoomAtScreenPoint:(float)a3 scaleDelta:(float64_t)a4 viewport:(float64_t)a5
{
  float32x4_t v6 = (float32x4_t *)objc_msgSend((id)objc_msgSend(a1, "pointOfView"), "nodeRef");
  double v7 = 0.0;
  if (v6)
  {
    int8x8_t v8 = v6;
    uint64_t v9 = C3DGetScene(v6);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = C3DGetScene(v8);
      C3DSceneLock(v11);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      memset(v33, 0, sizeof(v33));
      if (C3DNodeGetProjectionInfos((uint64_t)v8, (uint64_t)v33))
      {
        if ((v33[0] & 8) != 0)
        {
          uint64_t v22 = C3DGetScene(v8);
          C3DSceneUnlock(v22);
          float32x4_t v23 = scn_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[SCNCameraController(SPI) _orthographicViewSpaceTranslationForZoomAtScreenPoint:scaleDelta:viewport:](v23);
          }
        }
        else
        {
          if ((v33[0] & 2) != 0) {
            C3DAdjustZRangeOfProjectionInfos((uint64_t)v33, v8, 0, v10);
          }
          uint64_t v12 = C3DGetScene(v8);
          C3DSceneUnlock(v12);
          v13.f64[0] = a4;
          v13.f64[1] = a5;
          float32x4_t v32 = vcvt_hight_f32_f64(0, v13);
          simd_float4x4 v45 = *(simd_float4x4 *)C3DProjectionInfosGetMatrix((char *)v33, (uint64_t)&v32, 0);
          simd_float4x4 v46 = __invert_f4(v45);
          float32x4_t v25 = (float32x4_t)v46.columns[0];
          float32x4_t v26 = (float32x4_t)v46.columns[1];
          float32x4_t v27 = (float32x4_t)v46.columns[2];
          float32x2_t v28 = *(float32x2_t *)v46.columns[3].f32;
          *(double *)&long long v34 = *(double *)&v34 + a3;
          simd_float4x4 v47 = *(simd_float4x4 *)C3DProjectionInfosGetMatrix((char *)v33, (uint64_t)&v32, 0);
          simd_float4x4 v48 = __invert_f4(v47);
          float v14 = (float)(*(float *)&a2 + *(float *)&a2) / a4 + -1.0;
          float v15 = (float)(*((float *)&a2 + 1) + *((float *)&a2 + 1)) / a5 + -1.0;
          __asm { FMOV            V7.4S, #-1.0 }
          return COERCE_DOUBLE(vsub_f32(vadd_f32(v28, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v25, v14), v26, v15), _Q7, v27)), vadd_f32(*(float32x2_t *)v48.columns[3].f32, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v48.columns[0], v14), (float32x4_t)v48.columns[1], v15), _Q7, (float32x4_t)v48.columns[2]))));
        }
      }
      else
      {
        uint64_t v21 = C3DGetScene(v8);
        C3DSceneUnlock(v21);
      }
    }
  }
  return v7;
}

- (BOOL)drivenByDefaultNavigationCameraController
{
  return self->_drivenBydefaultNavigationCameraController;
}

@end
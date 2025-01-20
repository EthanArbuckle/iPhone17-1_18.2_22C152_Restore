@interface SCNCameraNavigationController
- ($9BBE2667FA0C53BBDA0194B766E02F4A)_sceneBoundingSphere;
- (BOOL)_computeBoundingSphereOmittingFloorsForNode:(__C3DNode *)a3 sphere:(C3DSphere *)a4;
- (BOOL)_freeCameraActivated;
- (BOOL)_pointOfViewUsesOrthographicProjection;
- (BOOL)allowsTranslation;
- (BOOL)autoSwitchToFreeCamera;
- (BOOL)automaticCameraTarget;
- (BOOL)enableFreeCamera;
- (BOOL)enableInertia;
- (BOOL)enabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gimbalLockMode;
- (BOOL)wantsRedraw;
- (SCNCameraController)cameraController;
- (SCNCameraNavigationController)initWithView:(id)a3;
- (SCNCameraNavigationControllerDelegate)delegate;
- (SCNNode)freeCamera;
- (SCNVector3)cameraAutomaticTargetPoint;
- (SCNVector3)cameraTarget;
- (SCNVector3)gimbalLockVector;
- (SCNView)view;
- (double)_modeSensitivity;
- (double)flyModeVelocity;
- (double)friction;
- (double)panSensitivity;
- (double)rotationSensitivity;
- (double)truckSensitivity;
- (double)zoomFactor;
- (float)_cappedTranslationDelta:(float)a3;
- (float)_orthographicScaleForZoomFactor:(float)a3;
- (float)_orthographicZoomFactorForProposedZoomFactor:(float)a3;
- (float)_pointOfViewOrthographicScale;
- (float)_targetDistance;
- (float)_translationCoef;
- (id).cxx_construct;
- (id)gestureRecognizers;
- (id)pointOfView;
- (uint64_t)worldFront;
- (unint64_t)_effectiveStickyAxis;
- (unint64_t)stickyAxis;
- (void)__didChangePointOfView;
- (void)__willChangePointOfView;
- (void)_computeAutomaticTargetPointIfNeeded;
- (void)_computeStickyAxisIfNeeded:(CGPoint)a3;
- (void)_computeTranslationOrigin3DFromPoint:(CGPoint)a3;
- (void)_defaultTargetForScene:(void *)a3;
- (void)_handleDoubleTap:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handlePinch:(id)a3;
- (void)_handleRotation:(id)a3;
- (void)_installFreeViewCameraIfNeeded;
- (void)_prepareFreeViewCamera;
- (void)_resetFreeViewCamera;
- (void)_setPointOfViewOrthographicScale:(float)a3;
- (void)_setupUpVector;
- (void)_startBrowsingIfNeeded:(CGPoint)a3;
- (void)_stopInertia;
- (void)_switchToFreeViewCamera;
- (void)_translateToViewPoint:(CGPoint)a3;
- (void)_willBeginInteraction;
- (void)beginGesture:(id)a3;
- (void)cameraDidChange;
- (void)dealloc;
- (void)focusNode:(id)a3;
- (void)focusNodes:(id)a3;
- (void)invalidateCameraTarget;
- (void)panWithGestureRecognizer:(id)a3;
- (void)pinchWithGestureRecognizer:(id)a3;
- (void)rotateOf:(double)a3;
- (void)rotateWithGestureRecognizer:(id)a3;
- (void)sceneDidChange;
- (void)sceneWillChange;
- (void)setAllowsTranslation:(BOOL)a3;
- (void)setAutoSwitchToFreeCamera:(BOOL)a3;
- (void)setAutomaticCameraTarget:(BOOL)a3;
- (void)setCameraTarget:(SCNVector3)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableFreeCamera:(BOOL)a3;
- (void)setEnableInertia:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFlyModeVelocity:(double)a3;
- (void)setFriction:(double)a3;
- (void)setGimbalLockMode:(BOOL)a3;
- (void)setGimbalLockVector:(SCNVector3)a3;
- (void)setPanSensitivity:(double)a3;
- (void)setRotationSensitivity:(double)a3;
- (void)setStickyAxis:(unint64_t)a3;
- (void)setTruckSensitivity:(double)a3;
- (void)setView:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)viewWillDrawAtTime:(double)a3;
- (void)zoomBy:(float)a3;
- (void)zoomBy:(float)a3 animate:(BOOL)a4;
@end

@implementation SCNCameraNavigationController

- (void)_resetFreeViewCamera
{
  uint64_t v3 = [(objc_class *)self[1].super.isa sceneRef];
  if (v3)
  {
    uint64_t v4 = v3;
    C3DSceneLock(v3);
    C3DRemoveSceneRef((void *)[(objc_class *)self[1].super.isa nodeRef], [(objc_class *)self[1].super.isa sceneRef]);
    C3DSceneUnlock(v4);
  }
  [(objc_class *)self[1].super.isa removeFromParentNode];

  self[1].super.isa = 0;
}

- (void)_computeAutomaticTargetPointIfNeeded
{
  if (BYTE1(self->_inertia.lastDragLocation.x)
    && !LOBYTE(self->_inertia.lastDragLocation.x)
    && ![(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] automaticTarget])
  {
    LOBYTE(self->_inertia.lastDragLocation.x) = 1;
    id v3 = [(SCNCameraNavigationController *)self pointOfView];
    [(SCNCameraNavigationController *)self worldFront];
    float32x4_t v17 = v4;
    [(SCNCameraNavigationController *)self _targetDistance];
    float v18 = v5;
    objc_msgSend((id)objc_msgSend(v3, "presentationNode"), "simdWorldPosition");
    if (self->_didEverFocusNode)
    {
      float32x4_t v8 = v17;
      float v7 = v18;
    }
    else
    {
      float32x4_t v19 = v6;
      uint64_t v9 = [(SCNCameraNavigationController *)self _sceneBoundingSphere];
      float32x4_t v6 = v19;
      v10.i64[0] = v9;
      v10.i64[1] = v11;
      float32x4_t v12 = vsubq_f32(v10, v19);
      float32x4_t v13 = vmulq_f32(v17, v12);
      BOOL v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0] <= 0.5;
      float32x4_t v8 = v17;
      float v7 = v18;
      if (!v14)
      {
        float32x4_t v15 = vmulq_f32(v12, v12);
        float v7 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
      }
    }
    *(void *)&double v20 = vmlaq_n_f32(v6, v8, v7).u64[0];
    v16 = [(SCNCameraNavigationController *)self cameraController];
    [(SCNCameraController *)v16 setSimdTarget:v20];
  }
}

- (SCNCameraNavigationController)initWithView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNCameraNavigationController;
  float32x4_t v4 = [(SCNCameraNavigationController *)&v8 init];
  float v5 = v4;
  if (v4)
  {
    v4->_freeViewCameraNode = (SCNNode *)a3;
    v4->_delegate = (SCNCameraNavigationControllerDelegate *)objc_alloc_init(SCNCameraController);
    -[SCNCameraNavigationControllerDelegate setPointOfView:](v5->_delegate, "setPointOfView:", [a3 pointOfView]);
    [(SCNCameraNavigationControllerDelegate *)v5->_delegate setInertiaEnabled:1];
    if (C3DWasLinkedBeforeMajorOSYear2017()) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    [(SCNCameraNavigationControllerDelegate *)v5->_delegate setInteractionMode:v6];
    [(SCNCameraNavigationControllerDelegate *)v5->_delegate setDrivenByDefaultNavigationCameraController:1];
    [(SCNCameraNavigationControllerDelegate *)v5->_delegate setDelegate:v5];
    LODWORD(v5->_keyboard.keyCodeConfiguration) = 0;
    v5->_drawAtTimeLock._os_unfair_lock_opaque = 0;
    v5->_orthographicZoomFactor = 1.0;
    WORD1(v5->_cameraController) = 257;
    v5->_translationAllowed = 1;
    BYTE1(v5->_inertia.lastDragLocation.x) = C3DWasLinkedBeforeMajorOSYear2017();
    *(_WORD *)&v5->_pinchShouldMoveCamera = 257;
    *(_OWORD *)&v5->_flyModeVelocity = xmmword_20B5EFAD0;
    *(_OWORD *)&v5->_truckSensitivity = xmmword_20B5EFAE0;
    [(SCNCameraNavigationController *)v5 sceneDidChange];
    [(SCNCameraNavigationController *)v5 cameraDidChange];
  }
  return v5;
}

- (void)cameraDidChange
{
  -[SCNCameraController setPointOfView:](-[SCNCameraNavigationController cameraController](self, "cameraController"), "setPointOfView:", objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView"));

  [(SCNCameraNavigationController *)self _setupUpVector];
}

- (void)sceneDidChange
{
  [(SCNCameraNavigationController *)self invalidateCameraTarget];
  uint64_t v3 = objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
  if (v3)
  {
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setPointOfView:v3];
    self->_cameraTargetComputed = 0;
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setSimdTarget:0.0];
    [(SCNCameraNavigationController *)self _computeAutomaticTargetPointIfNeeded];
  }
}

- (id)pointOfView
{
  v2 = [(SCNCameraNavigationController *)self cameraController];

  return [(SCNCameraController *)v2 pointOfView];
}

- (SCNCameraController)cameraController
{
  return (SCNCameraController *)self->_delegate;
}

- (void)invalidateCameraTarget
{
  LOBYTE(self->_inertia.lastDragLocation.x) = 0;
}

- (void)_setupUpVector
{
  id v3 = [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] attributeForKey:@"kSceneUpAxisAttributeKey"];
  if (v3)
  {
    [v3 SCNVector3Value];
    v50.i64[0] = v5;
    double v51 = v6;
    double v52 = v7;
  }
  else
  {
    v4.i32[0] = 1.0;
    double v51 = *(double *)v4.i64;
    double v52 = 0.0;
    v4.i64[0] = 0;
    float32x4_t v50 = v4;
  }
  objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "convertVector:fromNode:", 0, *(double *)v50.i64, v51, v52);
  v10.i32[1] = v8;
  v10.i32[2] = v9;
  uint64_t v11 = 2;
  if (*(float *)&v51 == 0.0) {
    uint64_t v11 = 1;
  }
  float32x4_t v53 = v10;
  *(_DWORD *)((unint64_t)&v53 | (4 * v11)) = 0;
  if (fabsf(v53.f32[0]) < 0.001 && fabsf(v53.f32[2]) < 0.001 && fabsf(v53.f32[1]) < 0.001)
  {
    delegate = self->_delegate;
LABEL_14:
    -[SCNCameraNavigationControllerDelegate setUp:](delegate, "setUp:");
    return;
  }
  float32x4_t v13 = vmulq_f32(v53, v53);
  int32x2_t v14 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u64[0];
  float32x4_t v15 = (float32x4_t)vdupq_lane_s32(v14, 0);
  float32x4_t v16 = vrsqrteq_f32(v15);
  float32x4_t v17 = vmulq_f32(v16, vrsqrtsq_f32(v15, vmulq_f32(v16, v16)));
  int8x16_t v18 = (int8x16_t)vmulq_f32(v17, vrsqrtsq_f32(v15, vmulq_f32(v17, v17)));
  int32x4_t v19 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(*(float *)v14.i32 != 0.0)), 0x1FuLL));
  v19.i32[3] = 0;
  __asm { FMOV            V17.4S, #1.0 }
  float32x4_t v25 = vmulq_f32(v53, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v19), v18, _Q17));
  float32x4_t v26 = v50;
  v26.i32[1] = LODWORD(v51);
  v26.i32[2] = LODWORD(v52);
  float32x4_t v27 = vmulq_f32(v26, v25);
  LODWORD(v28) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).u32[0];
  if (fabsf(v28) > 0.99)
  {
    delegate = self->_delegate;
    goto LABEL_14;
  }
  float32x4_t v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v26, (int32x4_t)v26), (int8x16_t)v26, 0xCuLL);
  int8x16_t v30 = (int8x16_t)vmlaq_f32(vmulq_f32(v29, vnegq_f32(v25)), v26, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL));
  float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), v30, 0xCuLL);
  float32x4_t v32 = vmulq_f32(v25, v25);
  float32x4_t v33 = vmulq_f32(v26, v26);
  v31.f32[3] = v28
             + sqrtf(vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).f32[0], vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0]));
  int8x16_t v34 = (int8x16_t)vmulq_f32(v31, v31);
  *(float32x2_t *)v34.i8 = vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL));
  float32x4_t v35 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1)), 0);
  float32x4_t v36 = vrsqrteq_f32(v35);
  float32x4_t v37 = vmulq_f32(v36, vrsqrtsq_f32(v35, vmulq_f32(v36, v36)));
  float32x4_t v38 = vmulq_f32(v31, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_f32(v35), _Q17, (int8x16_t)vmulq_f32(v37, vrsqrtsq_f32(v35, vmulq_f32(v37, v37)))));
  float32x4_t v39 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v38, (int32x4_t)v38), (int8x16_t)v38, 0xCuLL);
  float32x4_t v40 = vnegq_f32(v38);
  float32x4_t v41 = vmlaq_f32(vmulq_f32(v29, v40), v26, v39);
  int8x16_t v42 = (int8x16_t)vaddq_f32(v41, v41);
  float32x4_t v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), v42, 0xCuLL);
  float32x4_t v44 = vmlaq_laneq_f32(v26, v43, v38, 3);
  int8x16_t v45 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), (int8x16_t)v43, 0xCuLL), v40), v43, v39);
  float32x4_t v49 = vaddq_f32(v44, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v45, (int32x4_t)v45), v45, 0xCuLL));
  objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "simdWorldRight");
  float32x4_t v47 = vmulq_f32(v46, v49);
  if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]) > 0.70711)
  {
    delegate = self->_delegate;
    goto LABEL_14;
  }
  v48 = self->_delegate;

  [(SCNCameraNavigationControllerDelegate *)v48 setSimdUp:*(double *)v49.i64];
}

- (SCNView)view
{
  return (SCNView *)self->_freeViewCameraNode;
}

- (void)sceneWillChange
{
  *(_WORD *)&self->_isSceneBoundingSphereComputed = 0;
  [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setSimdTarget:0.0];

  [(SCNCameraNavigationController *)self _resetFreeViewCamera];
}

- (void)setDelegate:(id)a3
{
  self->_view = (SCNView *)a3;
}

- (id)gestureRecognizers
{
  tapGesture = self->_tapGesture;
  if (tapGesture)
  {
    pressGesture = self->_pressGesture;
    pinchGesture = self->_pinchGesture;
    panGesture = self->_panGesture;
    rotateGesture = self->_rotateGesture;
  }
  else
  {
    pressGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C7A0]);
    [(UIGestureRecognizer *)pressGesture setMinimumPressDuration:0.0];
    tapGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1CA70]);
    pinchGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C860]);
    panGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C838]);
    [(UIGestureRecognizer *)panGesture setAllowedScrollTypesMask:3];
    rotateGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C900]);
    [(UIGestureRecognizer *)tapGesture setNumberOfTapsRequired:2];
    [(UIGestureRecognizer *)pinchGesture addTarget:self action:sel__handlePinch_];
    [(UIGestureRecognizer *)panGesture addTarget:self action:sel__handlePan_];
    [(UIGestureRecognizer *)pressGesture addTarget:self action:sel__handlePress_];
    [(UIGestureRecognizer *)rotateGesture addTarget:self action:sel__handleRotation_];
    [(UIGestureRecognizer *)tapGesture addTarget:self action:sel__handleDoubleTap_];
    [(UIGestureRecognizer *)pressGesture setDelegate:self];
    [(UIGestureRecognizer *)panGesture setDelegate:self];
    [(UIGestureRecognizer *)pinchGesture setDelegate:self];
    [(UIGestureRecognizer *)rotateGesture setDelegate:self];
    [(UIGestureRecognizer *)tapGesture setDelegate:self];
    [(UIGestureRecognizer *)pinchGesture setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)rotateGesture setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)panGesture setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)tapGesture setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)pressGesture setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)pinchGesture setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)rotateGesture setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)panGesture setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)tapGesture setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)pressGesture setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)pinchGesture setEnabled:[(SCNCameraNavigationController *)self enabled]];
    [(UIGestureRecognizer *)rotateGesture setEnabled:[(SCNCameraNavigationController *)self enabled]];
    [(UIGestureRecognizer *)panGesture setEnabled:[(SCNCameraNavigationController *)self enabled]];
    [(UIGestureRecognizer *)tapGesture setEnabled:[(SCNCameraNavigationController *)self enabled]];
    [(UIGestureRecognizer *)pressGesture setEnabled:[(SCNCameraNavigationController *)self enabled]];
    self->_pinchGesture = pinchGesture;
    self->_panGesture = panGesture;
    self->_rotateGesture = rotateGesture;
    self->_pressGesture = pressGesture;
    self->_tapGesture = tapGesture;
  }
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", pressGesture, panGesture, tapGesture, pinchGesture, rotateGesture, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (id).cxx_construct
{
  *((void *)self + 48) = 0;
  *((void *)self + 49) = 0;
  *((void *)self + 47) = (char *)self + 384;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  return self;
}

- (void)dealloc
{
  [(SCNCameraNavigationControllerDelegate *)self->_delegate setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)SCNCameraNavigationController;
  [(SCNCameraNavigationController *)&v3 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_enabled = a3;
  id v4 = [(SCNCameraNavigationController *)self gestureRecognizers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:self->_enabled];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)allowsTranslation
{
  return self->_translationAllowed;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  self->_translationAllowed = a3;
}

- (BOOL)enableInertia
{
  v2 = [(SCNCameraNavigationController *)self cameraController];

  return [(SCNCameraController *)v2 inertiaEnabled];
}

- (void)setEnableInertia:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SCNCameraNavigationController *)self cameraController];

  [(SCNCameraController *)v4 setInertiaEnabled:v3];
}

- (double)friction
{
  [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] inertiaFriction];
  return v2;
}

- (void)setFriction:(double)a3
{
  float v3 = a3;
  id v4 = [(SCNCameraNavigationController *)self cameraController];
  *(float *)&double v5 = v3;

  [(SCNCameraController *)v4 setInertiaFriction:v5];
}

- (BOOL)automaticCameraTarget
{
  return BYTE1(self->_inertia.lastDragLocation.x);
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  if (BYTE1(self->_inertia.lastDragLocation.x) != a3)
  {
    BYTE1(self->_inertia.lastDragLocation.x) = a3;
    [(SCNCameraNavigationController *)self invalidateCameraTarget];
  }
}

- (SCNVector3)cameraTarget
{
  [(SCNCameraNavigationController *)self _computeAutomaticTargetPointIfNeeded];
  float v3 = [(SCNCameraNavigationController *)self cameraController];

  [(SCNCameraController *)v3 target];
  result.z = v6;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)setCameraTarget:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  [(SCNCameraNavigationController *)self setAutomaticCameraTarget:0];
  uint64_t v7 = [(SCNCameraNavigationController *)self cameraController];
  *(float *)&double v8 = x;
  *(float *)&double v9 = y;
  *(float *)&double v10 = z;

  -[SCNCameraController setTarget:](v7, "setTarget:", v8, v9, v10);
}

- (BOOL)gimbalLockMode
{
  return [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] interactionMode] == SCNInteractionModeOrbitTurntable;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 3;
  }
  float v4 = [(SCNCameraNavigationController *)self cameraController];

  [(SCNCameraController *)v4 setInteractionMode:v3];
}

- (SCNVector3)gimbalLockVector
{
  float v2 = 0.0;
  float v3 = 1.0;
  float v4 = 0.0;
  result.float z = v4;
  result.float y = v3;
  result.float x = v2;
  return result;
}

- (void)setGimbalLockVector:(SCNVector3)a3
{
  float v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNCameraNavigationController setGimbalLockVector:](v3);
  }
}

- (BOOL)wantsRedraw
{
  if ([(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] isInertiaRunning])
  {
    return 1;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&self->_keyboard.keyCodeConfiguration);
  begin = self->_keyboard.forward.__begin_;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_keyboard.keyCodeConfiguration);
  if ([(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] interactionMode])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = begin == 0;
  }
  return !v5;
}

- (void)focusNode:(id)a3
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a3;
  -[SCNCameraNavigationController focusNodes:](self, "focusNodes:", [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1]);
}

- (void)focusNodes:(id)a3
{
  if (a3)
  {
    self->_didEverFocusNode = 1;
    [(SCNCameraNavigationController *)self setAutomaticCameraTarget:0];
    [(SCNCameraNavigationController *)self _switchToFreeViewCamera];
    BOOL v5 = [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] automaticTarget];
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setAutomaticTarget:1];
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] frameNodes:a3];
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setAutomaticTarget:v5];
    if ([(SCNCameraNavigationController *)self _pointOfViewUsesOrthographicProjection])
    {
      float originalOrthoScale = self->_originalOrthoScale;
      [(SCNCameraNavigationController *)self _pointOfViewOrthographicScale];
      double v8 = (float)(originalOrthoScale / v7);
      [(SCNCameraNavigationController *)self setZoomFactor:v8];
    }
  }
}

- (unint64_t)stickyAxis
{
  return *(void *)&self->_anon_119[27];
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_anon_119[3] = a3 == 0;
  *(void *)&self->_anon_119[27] = a3;
}

- (unint64_t)_effectiveStickyAxis
{
  unint64_t v2 = *(void *)&self->_anon_119[27];
  if (!v2)
  {
    uint64_t v3 = 296;
    if (!self->_anon_119[3]) {
      uint64_t v3 = 304;
    }
    return *(unint64_t *)((char *)&self->super.isa + v3);
  }
  return v2;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  BYTE2(self->_cameraController) = a3;
  if (!a3) {
    [(SCNCameraNavigationController *)self _resetFreeViewCamera];
  }
}

- (BOOL)_freeCameraActivated
{
  Class isa = self[1].super.isa;
  return isa
      && isa == (Class)objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
}

- (void)_prepareFreeViewCamera
{
  uint64_t v3 = (objc_class *)objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
  float v4 = v3;
  if (v3 && v3 == self[1].super.isa) {
    return;
  }
  BOOL v5 = (void *)[(objc_class *)v3 presentationNode];
  if ([v5 camera]) {
    float v6 = (void *)[v5 camera];
  }
  else {
    float v6 = (void *)[v5 light];
  }
  [v6 orthographicScale];
  *(float *)&double v7 = v7;
  self->_float originalOrthoScale = *(float *)&v7;
  self->_orthographicZoomFactor = 1.0;
  Class isa = self[1].super.isa;
  if (!v4)
  {
    if (isa) {
      goto LABEL_13;
    }
    double v9 = +[SCNNode node];
    goto LABEL_12;
  }
  if (v4 == isa)
  {
    memset(&v24, 0, sizeof(v24));
LABEL_22:
    uint64_t v14 = (void *)[(objc_class *)v4 presentationNode];
    if (v14) {
      [v14 worldTransform];
    }
    else {
      memset(&v24, 0, sizeof(v24));
    }
    goto LABEL_25;
  }
  if (!isa)
  {
    double v9 = (SCNNode *)[(objc_class *)v4 copy];
LABEL_12:
    self[1].super.Class isa = (Class)v9;
  }
LABEL_13:
  if ([(objc_class *)v4 camera])
  {
    double v10 = (SCNCamera *)(id)objc_msgSend((id)-[objc_class camera](v4, "camera"), "copy");
LABEL_15:
    long long v11 = v10;
    goto LABEL_16;
  }
  if (![(objc_class *)v4 light])
  {
    double v10 = +[SCNCamera camera];
    goto LABEL_15;
  }
  float32x4_t v13 = (void *)[(objc_class *)v4 light];
  long long v11 = +[SCNCamera camera];
  if (v13)
  {
    [v13 spotOuterAngle];
    -[SCNCamera setFieldOfView:](v11, "setFieldOfView:");
    [(SCNCamera *)v11 setFieldOfViewOrientation:0];
    [v13 zNear];
    -[SCNCamera setZNear:](v11, "setZNear:");
    [v13 zFar];
    -[SCNCamera setZFar:](v11, "setZFar:");
  }
LABEL_16:
  [(objc_class *)self[1].super.isa setCamera:v11];
  [(objc_class *)self[1].super.isa setLight:0];
  [(objc_class *)self[1].super.isa setGeometry:0];
  [(objc_class *)self[1].super.isa setConstraints:0];
  BOOL v12 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  [(objc_class *)self[1].super.isa removeAllAnimations];
  [(objc_class *)self[1].super.isa removeAllActions];
  [(objc_class *)self[1].super.isa setConstraints:0];
  +[SCNTransaction setImmediateMode:v12];
  memset(&v24, 0, sizeof(v24));
  if (v4) {
    goto LABEL_22;
  }
  SCNMatrix4 v24 = SCNMatrix4Identity;
LABEL_25:
  C3DMatrix4x4FromSCNMatrix4(v23, (uint64_t)&v24);
  double v15 = C3DMatrix4x4Determinant3x3((uint64_t)v23);
  if (fabs(*(float *)&v15 + -1.0) > 0.00001)
  {
    v22.i32[2] = 0;
    v22.i64[0] = 0;
    v21.i32[2] = 0;
    v21.i64[0] = 0;
    float32x4_t v20 = 0uLL;
    C3DMatrix4x4GetAffineTransforms((uint64_t)v23, &v22, (int8x16_t *)&v20, &v21);
    C3DQuaternionNormalize(&v20);
    C3DMatrix4x4MakeAffine(v23, &v22, &v20, (float32x2_t *)&v21);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v23, &v24);
  }
  SCNMatrix4 v19 = v24;
  [(objc_class *)self[1].super.isa setTransform:&v19];
  [(objc_class *)self[1].super.isa setName:@"kSCNFreeViewCameraName"];
  objc_msgSend((id)-[objc_class camera](self[1].super.isa, "camera"), "setName:", objc_msgSend(@"kSCNFreeViewCameraName", "stringByAppendingString:", @"Camera"));
  if ([(SCNView *)[(SCNCameraNavigationController *)self view] _showsAuthoringEnvironment])
  {
    objc_msgSend((id)-[objc_class camera](self[1].super.isa, "camera"), "setAutomaticallyAdjustsZRange:", 1);
    uint64_t v16 = objc_msgSend((id)-[objc_class camera](self[1].super.isa, "camera"), "cameraRef");
    *(unsigned char *)(v16 + 64) |= 4u;
  }
  float32x4_t v17 = [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] sceneRef];
  if (v17)
  {
    uint64_t v18 = (uint64_t)v17;
    if (!C3DGetSceneRef([(objc_class *)self[1].super.isa nodeRef]))
    {
      C3DSceneLock(v18);
      C3DAddSceneRef((uint64_t *)[(objc_class *)self[1].super.isa nodeRef], v18);
      C3DSceneUnlock(v18);
    }
  }
}

- (void)_installFreeViewCameraIfNeeded
{
  if ([(SCNCameraNavigationController *)self enableFreeCamera])
  {
    id v3 = [(SCNView *)[(SCNCameraNavigationController *)self view] renderer];
    if ((Class)[v3 pointOfView] != self[1].super.isa)
    {
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
      [v3 setPointOfView:self[1].super.isa];
      [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setPointOfView:self[1].super.isa];
      +[SCNTransaction commit];
    }
  }
}

- (void)_switchToFreeViewCamera
{
  if ([(SCNCameraNavigationController *)self enableFreeCamera])
  {
    if (![(SCNCameraNavigationController *)self _freeCameraActivated])
    {
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
      [(SCNCameraNavigationController *)self _prepareFreeViewCamera];
      [(SCNCameraNavigationController *)self _installFreeViewCameraIfNeeded];
      +[SCNTransaction commit];
    }
  }
  else
  {
    uint64_t v3 = objc_msgSend(-[SCNView renderer](-[SCNCameraNavigationController view](self, "view"), "renderer"), "pointOfView");
    float v4 = [(SCNCameraNavigationController *)self cameraController];
    [(SCNCameraController *)v4 setPointOfView:v3];
  }
}

- (float)_cappedTranslationDelta:(float)a3
{
  [(SCNCameraNavigationController *)self _targetDistance];
  if (v5 >= 10000000.0)
  {
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] simdTarget];
    float32x4_t v15 = v6;
    objc_msgSend((id)objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "presentationNode"), "simdWorldPosition");
    float32x4_t v16 = vsubq_f32(v15, v7);
    [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] simdWorldFront];
    float32x4_t v9 = vmulq_f32(v16, v8);
    float v10 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0];
    if (v10 >= 0.0 && a3 < 0.0) {
      float v12 = 0.0;
    }
    else {
      float v12 = a3;
    }
    if (v12 > 0.0 && v10 < 0.0) {
      return 0.0;
    }
    else {
      return v12;
    }
  }
  return a3;
}

- (float)_translationCoef
{
  [(SCNCameraNavigationController *)self _targetDistance];
  double v3 = v2;
  if (v3 > 10000000.0) {
    double v3 = 10000000.0;
  }
  double v4 = v3 * 0.00999999978;
  BOOL v5 = v3 <= 0.1;
  double v6 = 0.000999999978;
  if (!v5) {
    return v4;
  }
  return v6;
}

- (float)_targetDistance
{
  [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] simdTarget];
  float32x4_t v8 = v3;
  objc_msgSend((id)objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "presentationNode"), "simdWorldPosition");
  float32x4_t v5 = vsubq_f32(v4, v8);
  float32x4_t v6 = vmulq_f32(v5, v5);
  float result = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
  if (result <= 0.1) {
    return 0.1;
  }
  return result;
}

- (void)rotateOf:(double)a3
{
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  if (BYTE3(self->_cameraController)) {
    [(SCNCameraNavigationController *)self _switchToFreeViewCamera];
  }
  [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = v5 * 0.5;
  double v10 = v7 * 0.5;
  long long v11 = [(SCNCameraNavigationController *)self cameraController];
  *(float *)&double v12 = a3;
  -[SCNCameraController rollBy:aroundScreenPoint:viewport:](v11, "rollBy:aroundScreenPoint:viewport:", v12, v9, v10, v6, v8);

  +[SCNTransaction commit];
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SCNCameraNavigationController *)self autoSwitchToFreeCamera]) {
    [(SCNCameraNavigationController *)self _switchToFreeViewCamera];
  }
  if ([(SCNCameraNavigationController *)self pointOfView])
  {
    if (v4)
    {
      +[SCNTransaction begin];
      +[SCNTransaction setAnimationDuration:0.3];
      double v7 = [(SCNCameraNavigationController *)self cameraController];
      *(float *)&double v8 = a3 * -100.0;
      [(SCNCameraController *)v7 translateInCameraSpaceByX:0.0 Y:0.0 Z:v8];
      +[SCNTransaction commit];
    }
    else
    {
      double v9 = [(SCNCameraNavigationController *)self cameraController];
      *(float *)&double v10 = a3 * -100.0;
      [(SCNCameraController *)v9 translateInCameraSpaceByX:0.0 Y:0.0 Z:v10];
    }
  }
}

- (void)zoomBy:(float)a3
{
}

- (double)zoomFactor
{
  BOOL v3 = [(SCNCameraNavigationController *)self _pointOfViewUsesOrthographicProjection];
  uint64_t v4 = 76;
  if (v3) {
    uint64_t v4 = 84;
  }
  return *(float *)((char *)&self->super.isa + v4);
}

- (float)_orthographicZoomFactorForProposedZoomFactor:(float)a3
{
  -[SCNCameraNavigationController _orthographicScaleForZoomFactor:](self, "_orthographicScaleForZoomFactor:");
  float v6 = v5;
  [(SCNCameraNavigationController *)self _sceneBoundingSphere];
  float v8 = v7;
  if (v7 == 0.0) {
    return self->_orthographicZoomFactor;
  }
  [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
  float v10 = v9;
  [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
  float v12 = v11;
  if (v12 >= v10) {
    float v13 = v11;
  }
  else {
    float v13 = v10;
  }
  if (v12 >= v10) {
    float v12 = v10;
  }
  float v14 = v12 / fmaxf(v13, 1.0);
  float originalOrthoScale = self->_originalOrthoScale;
  double v16 = v8 * 10000000.0;
  if (v16 <= originalOrthoScale)
  {
    float v18 = self->_originalOrthoScale;
  }
  else
  {
    float v17 = v16;
    float v18 = v17;
  }
  double v19 = v8 * 0.00001 * v14;
  if (v19 <= originalOrthoScale)
  {
    float v20 = v19;
    float v21 = v20;
  }
  else
  {
    float v21 = self->_originalOrthoScale;
  }
  if (v6 > v18) {
    return originalOrthoScale / v18;
  }
  if (v6 < v21) {
    return originalOrthoScale / v21;
  }
  return a3;
}

- (float)_orthographicScaleForZoomFactor:(float)a3
{
  return self->_originalOrthoScale / a3;
}

- (void)setZoomFactor:(double)a3
{
  [(SCNCameraNavigationController *)self zoomFactor];
  if (a3 > 0.0 && v5 != a3)
  {
    if (BYTE3(self->_cameraController)) {
      [(SCNCameraNavigationController *)self _switchToFreeViewCamera];
    }
    id v7 = [(SCNCameraNavigationController *)self pointOfView];
    if ([(SCNCameraNavigationController *)self _pointOfViewUsesOrthographicProjection])
    {
      *(float *)&double v8 = a3;
      [(SCNCameraNavigationController *)self _orthographicZoomFactorForProposedZoomFactor:v8];
      self->_orthographicZoomFactor = v9;
      -[SCNCameraNavigationController _orthographicScaleForZoomFactor:](self, "_orthographicScaleForZoomFactor:");
      -[SCNCameraNavigationController _setPointOfViewOrthographicScale:](self, "_setPointOfViewOrthographicScale:");
    }
    else
    {
      long double v10 = tan(self->_cameraOriginalFieldOfView * 0.5 / 180.0 * 3.14159265);
      long double v11 = atan(v10 / a3);
      *(float *)&long double v11 = v11 / 3.14159265 * 180.0 + v11 / 3.14159265 * 180.0;
      double v12 = fmin(*(float *)&v11, 120.0);
      if (v12 < 1.0) {
        double v12 = 1.0;
      }
      float v13 = v12;
      objc_msgSend((id)objc_msgSend(v7, "camera"), "setFieldOfView:", v13);
      float v14 = a3;
      self->_fieldOfViewZoomFactor = v14;
    }
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  uint64_t v14 = *(void *)&a4;
  v16.i64[0] = *(void *)&a3;
  if (BYTE3(self->_cameraController)) {
    [(SCNCameraNavigationController *)self _switchToFreeViewCamera];
  }
  if ([(SCNCameraNavigationController *)self pointOfView])
  {
    *(float *)&double v7 = a5;
    [(SCNCameraNavigationController *)self _cappedTranslationDelta:v7];
    float32x4_t v8 = v16;
    v8.i32[1] = v15;
    v8.i32[2] = v9;
    float32x4_t v17 = v8;
    [(SCNCameraNavigationController *)self _translationCoef];
    float32x4_t v18 = vmulq_n_f32(v17, v10);
    long double v11 = [(SCNCameraNavigationController *)self cameraController];
    LODWORD(v13) = v18.i32[1];
    *(float *)&double v12 = -v18.f32[2];
    [(SCNCameraController *)v11 translateInCameraSpaceByX:*(double *)v18.i64 Y:v13 Z:v12];
  }
}

- (void)viewWillDrawAtTime:(double)a3
{
  BOOL v5 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  if ([(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] isInertiaRunning])
  {
    float v6 = [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] sceneRef];
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      C3DSceneLock((uint64_t)v6);
      [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] updateInertiaAtTime:a3];
      C3DSceneUnlock(v7);
    }
    else
    {
      [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] updateInertiaAtTime:a3];
    }
  }
  os_unfair_lock_unlock(&self->_drawAtTimeLock);

  +[SCNTransaction setImmediateMode:v5];
}

- (void)_willBeginInteraction
{
  if (!self->_cameraTargetComputed
    && ![(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] automaticTarget])
  {
    [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] simdTarget];
    uint32x4_t v4 = (uint32x4_t)vceqzq_f32(v3);
    v4.i32[3] = v4.i32[2];
    if ((vminvq_u32(v4) & 0x80000000) != 0)
    {
      self->_cameraTargetComputed = 1;
      [(SCNCameraNavigationController *)self _defaultTargetForScene:[(SCNView *)[(SCNCameraNavigationController *)self view] scene]];
      [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] setSimdTarget:v5];
    }
  }
  [(SCNCameraNavigationController *)self _stopInertia];
  float v6 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] camera];
  if ([(SCNCamera *)v6 useLegacyFov])
  {
    [(SCNCamera *)v6 xFov];
    if (v7 != 0.0)
    {
      [(SCNCamera *)v6 yFov];
      if (v8 != 0.0)
      {
        [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
        float v11 = v10 / fmax(v9, 1.0);
        [(SCNCamera *)v6 xFov];
        double v13 = v12;
        [(SCNCamera *)v6 yFov];
        *(float *)&double v13 = v13 / v14;
        [(SCNCamera *)v6 fieldOfView];
        -[SCNCamera setFieldOfView:](v6, "setFieldOfView:");
        [(SCNCamera *)v6 setProjectionDirection:*(float *)&v13 > v11];
      }
    }
  }
  objc_msgSend((id)objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "camera"), "fieldOfView");
  *(float *)&double v15 = v15;
  self->_cameraOriginalFieldOfView = *(float *)&v15;
  self->_fieldOfViewZoomFactor = 1.0;
  [(SCNCameraNavigationController *)self _pointOfViewOrthographicScale];
  self->_float originalOrthoScale = v16;
  self->_orthographicZoomFactor = 1.0;
}

- (void)_stopInertia
{
  p_drawAtTimeLock = &self->_drawAtTimeLock;
  os_unfair_lock_lock(&self->_drawAtTimeLock);
  [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] stopInertia];
  os_unfair_lock_unlock(p_drawAtTimeLock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SCNCameraNavigationController__stopInertia__block_invoke;
  block[3] = &unk_264004DF8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__SCNCameraNavigationController__stopInertia__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__didChangePointOfView");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  BOOL v7 = [(SCNCameraNavigationController *)self enabled];
  if (v7)
  {
    pressGesture = self->_pressGesture;
    BOOL v9 = pressGesture == a3 || pressGesture == a4;
    LOBYTE(v7) = v9
              || (tapGesture = self->_tapGesture, panGesture = self->_panGesture, tapGesture == a3)
              && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4)
              || tapGesture == a4 && panGesture == a3
              || tapGesture == a4 && self->_pinchGesture == a3;
  }
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v5 = [(SCNCameraNavigationController *)self enabled];
  if (v5) {
    [(SCNCameraNavigationController *)self beginGesture:a3];
  }
  return v5;
}

- (void)_handlePinch:(id)a3
{
  if ([(SCNCameraNavigationController *)self enabled])
  {
    [(SCNCameraNavigationController *)self pinchWithGestureRecognizer:a3];
  }
}

- (void)_handlePan:(id)a3
{
  if ([(SCNCameraNavigationController *)self enabled])
  {
    [(SCNCameraNavigationController *)self panWithGestureRecognizer:a3];
  }
}

- (void)_handleRotation:(id)a3
{
  if ([(SCNCameraNavigationController *)self enabled])
  {
    [(SCNCameraNavigationController *)self rotateWithGestureRecognizer:a3];
  }
}

- (void)_handleDoubleTap:(id)a3
{
  if ([(SCNCameraNavigationController *)self enabled])
  {
    uint32x4_t v4 = [(SCNCameraNavigationController *)self delegate];
    [(SCNCameraNavigationControllerDelegate *)v4 switchToNextCamera];
  }
}

- (void)beginGesture:(id)a3
{
  if (BYTE3(self->_cameraController)) {
    [(SCNCameraNavigationController *)self _switchToFreeViewCamera];
  }
  [(SCNCameraNavigationController *)self _willBeginInteraction];
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if ([a3 numberOfTouches])
  {
    objc_msgSend(a3, "locationInView:", -[SCNCameraNavigationController view](self, "view"));
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = 0.0;
    double v8 = 0.0;
  }
  self->_lastInputLocation.float x = v6;
  self->_lastInputLocation.float y = v8;
  self->_lastRotationAngle = 0.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SCNCameraNavigationController _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v8);
    int64_t v9 = 2;
LABEL_12:
    self->_browseMode = v9;
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SCNCameraNavigationController _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v8);
    if (self->_translationAllowed)
    {
      self->_browseMode = 3;
      [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
      -[SCNCameraNavigationController _computeTranslationOrigin3DFromPoint:](self, "_computeTranslationOrigin3DFromPoint:", v6, v10 - v8);
    }
    int64_t v9 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCNCameraNavigationController *)self zoomFactor];
    *(float *)&double v11 = v11;
    self->_initialZoom = *(float *)&v11;
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  [a3 rotation];
  double v6 = v5;
  [(SCNCameraNavigationController *)self _stopInertia];
  if ([a3 state] == 1) {
    [(SCNCameraNavigationController *)self __willChangePointOfView];
  }
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  [(SCNCameraNavigationController *)self rotateOf:(v6 - self->_lastRotationAngle) / 3.14159265 * -180.0];
  +[SCNTransaction commit];
  self->_lastRotationAngle = v6;
  if ([a3 state] == 4 || objc_msgSend(a3, "state") == 3)
  {
    [(SCNCameraNavigationController *)self __didChangePointOfView];
  }
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  [(SCNCameraNavigationController *)self _stopInertia];
  if ([a3 state] == 1) {
    [(SCNCameraNavigationController *)self __willChangePointOfView];
  }
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  double v5 = fmax(self->_initialZoom, 0.001);
  [a3 scale];
  [(SCNCameraNavigationController *)self setZoomFactor:v6 * v5];
  +[SCNTransaction commit];
  if ([a3 state] == 4 || objc_msgSend(a3, "state") == 3)
  {
    [(SCNCameraNavigationController *)self __didChangePointOfView];
  }
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v5 = [a3 numberOfTouches];
  if (self->_browseMode != 2)
  {
    uint64_t v6 = v5;
    objc_msgSend(a3, "locationInView:", -[SCNCameraNavigationController view](self, "view"));
    double v8 = v7;
    double v10 = v9;
    [(SCNCameraNavigationController *)self _stopInertia];
    if ([a3 state] == 1) {
      [(SCNCameraNavigationController *)self __willChangePointOfView];
    }
    +[SCNTransaction begin];
    +[SCNTransaction setDisableActions:1];
    if ([a3 state] == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        objc_msgSend(a3, "velocityInView:", -[SCNCameraNavigationController view](self, "view"));
        if ([(SCNView *)[(SCNCameraNavigationController *)self view] preferredFramesPerSecond])
        {
          [(SCNView *)[(SCNCameraNavigationController *)self view] preferredFramesPerSecond];
        }
        double v11 = [(SCNCameraNavigationController *)self cameraController];
        [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
        -[SCNCameraController endInteraction:withViewport:velocity:](v11, "endInteraction:withViewport:velocity:", v8, v10);
        if (![(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] isInertiaRunning])[(SCNCameraNavigationController *)self __didChangePointOfView]; {
      }
        }
    }
    else
    {
      switch(v6)
      {
        case 3:
          if (self->_lastGestureFingerCount != 3)
          {
            [(SCNCameraNavigationController *)self beginGesture:a3];
            self->_lastGestureFingerCount = 3;
          }
          [(SCNCameraNavigationController *)self _translationCoef];
          float v19 = v18;
          double v20 = v10 - self->_lastInputLocation.y;
          *(float *)&double v20 = v20;
          [(SCNCameraNavigationController *)self _cappedTranslationDelta:v20];
          float v22 = v21;
          v23 = [(SCNCameraNavigationController *)self cameraController];
          *(float *)&double v24 = -(float)(v19 * v22);
          [(SCNCameraController *)v23 translateInCameraSpaceByX:0.0 Y:0.0 Z:v24];
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            [(SCNCameraNavigationController *)self beginGesture:a3];
            self->_lastGestureFingerCount = 2;
          }
          [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
          double v10 = v25 - v10;
          -[SCNCameraNavigationController _translateToViewPoint:](self, "_translateToViewPoint:", v8, v10);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            double v12 = [(SCNCameraNavigationController *)self cameraController];
            [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
            double v14 = v13;
            double v16 = v15;
            [(SCNCameraNavigationController *)self _modeSensitivity];
            -[SCNCameraController continueInteraction:withViewport:sensitivity:](v12, "continueInteraction:withViewport:sensitivity:", v8, v10, v14, v16, v17);
          }
          else
          {
            [(SCNCameraNavigationController *)self beginGesture:a3];
            float32x4_t v26 = [(SCNCameraNavigationController *)self cameraController];
            [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
            [(SCNCameraController *)v26 beginInteraction:v8 withViewport:v10];
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
    +[SCNTransaction commit];
    self->_lastInputLocation.float x = v8;
    self->_lastInputLocation.float y = v10;
  }
}

- (double)_modeSensitivity
{
  SCNInteractionMode v3 = [(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] interactionMode];
  if ((unint64_t)v3 >= SCNInteractionModePan)
  {
    if (v3 == SCNInteractionModeTruck)
    {
      [(SCNCameraNavigationController *)self truckSensitivity];
    }
    else if (v3 == SCNInteractionModePan)
    {
      [(SCNCameraNavigationController *)self panSensitivity];
    }
    else
    {
      return 1.0;
    }
  }
  else
  {
    [(SCNCameraNavigationController *)self rotationSensitivity];
  }
  return result;
}

- (uint64_t)worldFront
{
  v1 = objc_msgSend((id)objc_msgSend(a1, "cameraController"), "pointOfView");

  return [v1 simdWorldFront];
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  Class v6 = [(SCNCameraNavigationController *)self pointOfView];
  if (BYTE3(self->_cameraController)) {
    [(SCNCameraNavigationController *)self _prepareFreeViewCamera];
  }
  if (![(objc_class *)v6 parentNode] && v6 != self[1].super.isa) {
    [(SCNCameraNavigationController *)self _installFreeViewCameraIfNeeded];
  }
  +[SCNTransaction commit];
  self->_initialInputLocation.CGFloat x = x;
  self->_initialInputLocation.CGFloat y = y;
  objc_msgSend(-[SCNCameraNavigationController pointOfView](self, "pointOfView"), "simdConvertPosition:toNode:", 0, 0.0);
  *(_OWORD *)self->_initialPointOfViewWorldPosition = v7;
  [(SCNCameraNavigationController *)self _pointOfViewOrthographicScale];
  self->_float originalOrthoScale = v8;
  self->_orthographicZoomFactor = 1.0;
}

- (void)_defaultTargetForScene:(void *)a3
{
  uint64_t v5 = (void *)[a1 pointOfView];
  [a1 worldFront];
  float32x4_t v25 = v6;
  objc_msgSend((id)objc_msgSend(v5, "presentationInstance"), "simdConvertPosition:toNode:", 0, 0.0);
  float32x4_t v26 = v7;
  v8.i64[0] = [a1 _sceneBoundingSphere];
  v8.i64[1] = v9;
  float32x4_t v23 = vsubq_f32(v8, v26);
  objc_msgSend((id)objc_msgSend(v5, "camera"), "fieldOfView");
  *(float *)&double v10 = v10 * 3.14159265 / 180.0;
  float v11 = cosf(*(float *)&v10);
  int32x4_t v12 = (int32x4_t)vmulq_f32(v23, v23);
  v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
  float32x2_t v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
  float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
  float32x4_t v15 = vmulq_f32(v25, vmulq_n_f32(v23, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]));
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0] <= v11)
  {
    objc_msgSend((id)objc_msgSend(v5, "camera"), "zFar");
    *(float *)&double v16 = v16;
    float32x4_t v24 = vmlaq_n_f32(v26, v25, *(float *)&v16);
    double v17 = (void *)[a3 rootNode];
    LODWORD(v19) = v26.i32[2];
    LODWORD(v18) = v26.i32[1];
    LODWORD(v21) = v24.i32[2];
    LODWORD(v20) = v24.i32[1];
    float v22 = objc_msgSend(v17, "hitTestWithSegmentFromPoint:toPoint:options:", 0, *(double *)v26.i64, v18, v19, *(double *)v24.i64, v20, v21);
    if ([v22 count]) {
      objc_msgSend((id)objc_msgSend(v22, "firstObject"), "worldCoordinates");
    }
    else {
      [a1 _targetDistance];
    }
  }
}

- (SCNVector3)cameraAutomaticTargetPoint
{
  [(SCNCameraNavigationController *)self _computeAutomaticTargetPointIfNeeded];
  SCNInteractionMode v3 = [(SCNCameraNavigationController *)self cameraController];

  [(SCNCameraController *)v3 target];
  result.float z = v6;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- ($9BBE2667FA0C53BBDA0194B766E02F4A)_sceneBoundingSphere
{
  v9[1] = *MEMORY[0x263EF8340];
  if (!self->_isSceneBoundingSphereComputed
    && [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] rootNode])
  {
    v9[0] = [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] rootNode];
    double BoundingSphere = SCNNodeGetBoundingSphere((void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1], 0);
    *(void *)self->_anon_70 = v7;
    *(void *)&self->_anon_70[8] = v8;
    self->_isSceneBoundingSphereComputed = 1;
  }
  result.var0.var0 = *(float *)&BoundingSphere;
  result.var0.var3 = v6;
  result.var0.var2 = v5;
  result.var0.var1 = v4;
  return result;
}

- (BOOL)_computeBoundingSphereOmittingFloorsForNode:(__C3DNode *)a3 sphere:(C3DSphere *)a4
{
  *(_OWORD *)a4 = xmmword_20B5CC220;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__SCNCameraNavigationController__computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke;
  v6[3] = &__block_descriptor_40_e20_q16__0____C3DNode__8l;
  v6[4] = a4;
  C3DNodeApplyHierarchy((uint64_t)a3, (uint64_t)v6);
  return *((float *)a4 + 3) >= 0.0;
}

uint64_t __84__SCNCameraNavigationController__computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke(uint64_t a1, float32x4_t *a2)
{
  if (C3DNodeIsHidden((uint64_t)a2)) {
    return 1;
  }
  if (!C3DNodeGetFloor((uint64_t)a2))
  {
    GeometrCGFloat y = (const void *)C3DNodeGetGeometry((uint64_t)a2);
    if (Geometry)
    {
      if (C3DGetBoundingSphere(Geometry, 0, (uint64_t)&v7))
      {
        WorldMatriCGFloat x = C3DNodeGetWorldMatrix(a2);
        C3DSphereXFormMatrix4x4(&v7, WorldMatrix, (uint64_t)&v7);
        C3DSphereMakeByMergingSpheres(*(float32x4_t **)(a1 + 32), *(float32x4_t **)(a1 + 32), &v7);
      }
    }
  }
  return 0;
}

- (void)_computeStickyAxisIfNeeded:(CGPoint)a3
{
  if (self->_anon_119[3])
  {
    if (!*(void *)&self->_anon_119[19])
    {
      CGFloat y = a3.y;
      float32x2_t v4 = vcvt_f32_f64(vaddq_f64((float64x2_t)a3, vcvtq_f64_f32(*(float32x2_t *)&self->_anon_119[11])));
      *(float32x2_t *)&self->_anon_119[11] = v4;
      if (vaddv_f32(vmul_f32(v4, v4)) > 1.0)
      {
        int32x2_t v5 = vdup_n_s32(self->_browseMode == 3);
        int8x16_t v6 = (int8x16_t)vcvtq_f64_f32(v4);
        v7.i64[0] = v5.u32[0];
        v7.i64[1] = v5.u32[1];
        float64x2_t v8 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), v6, vextq_s8(v6, v6, 8uLL));
        float64x2_t v9 = vabsq_f64(v8);
        if ((vmovn_s64(vcgeq_f64(v9, (float64x2_t)vdupq_laneq_s64((int64x2_t)v9, 1))).u8[0] & 1) != 0
          && v8.f64[0] != 0.0)
        {
          uint64_t v10 = 1;
LABEL_10:
          *(void *)&self->_anon_119[19] = v10;
          return;
        }
        if (v8.f64[1] != 0.0)
        {
          uint64_t v10 = 2;
          goto LABEL_10;
        }
      }
    }
  }
}

- (float)_pointOfViewOrthographicScale
{
  SCNInteractionMode v3 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] camera];
  float32x2_t v4 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] light];
  if (!v3)
  {
    SCNInteractionMode v3 = (SCNCamera *)v4;
    if (!v4) {
      return 1.0;
    }
  }
  [(SCNCamera *)v3 orthographicScale];
  return v5;
}

- (void)_setPointOfViewOrthographicScale:(float)a3
{
  double v5 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] camera];
  int8x16_t v6 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] light];
  if (v5 || (double v5 = (SCNCamera *)v6) != 0)
  {
    [(SCNCamera *)v5 setOrthographicScale:a3];
  }
}

- (BOOL)_pointOfViewUsesOrthographicProjection
{
  SCNInteractionMode v3 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] camera];
  float32x2_t v4 = [(SCNNode *)[(SCNCameraController *)[(SCNCameraNavigationController *)self cameraController] pointOfView] light];
  if (v3)
  {
    LOBYTE(v4) = [(SCNCamera *)v3 usesOrthographicProjection];
  }
  else if (v4)
  {
    double v5 = [(SCNLight *)v4 type];
    LOBYTE(v4) = [(NSString *)v5 isEqualToString:@"directional"];
  }
  return (char)v4;
}

- (void)_computeTranslationOrigin3DFromPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
  v4.f64[0] = x;
  v4.f64[1] = y;
  double v5 = COERCE_DOUBLE(vcvt_f32_f64(v4));
  v7.f64[1] = v6;
  __n128 v31 = (__n128)vcvt_hight_f32_f64(0, v7);
  id v8 = [(SCNCameraNavigationController *)self pointOfView];
  *(void *)self->_translationOrigin = [(SCNCameraNavigationController *)self _sceneBoundingSphere];
  *(void *)&self->_translationOrigin[8] = v9;
  uint64_t v10 = [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] sceneRef];
  uint64_t v11 = (uint64_t)v10;
  if (v10) {
    C3DSceneLock((uint64_t)v10);
  }
  double v12 = _C3DHitTestComputeHitSegment((float32x4_t *)[v8 nodeRef], v11, &v33, &v34, v31, v5);
  if (v13)
  {
    [(SCNCameraNavigationController *)self worldFront];
    float32x4_t v14 = vmulq_f32(*(float32x4_t *)self->_translationOrigin, v15);
    v15.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0];
    float32x4_t v16 = vsubq_f32(v34, v33);
    float32x4_t v17 = vmulq_f32(v16, v16);
    int32x2_t v18 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u64[0];
    *(float *)v18.i32 = sqrtf(*(float *)v18.i32);
    float32x4_t v19 = vdivq_f32(v16, (float32x4_t)vdupq_lane_s32(v18, 0));
    v19.i32[3] = 0;
    int8x16_t v20 = (int8x16_t)vmulq_f32(v15, v19);
    float v21 = vaddv_f32(vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)));
    if (v21 != 0.0
      && ((float32x4_t v22 = v33,
           v22.i32[3] = 1.0,
           int8x16_t v23 = (int8x16_t)vmulq_f32(v22, v15),
           float v24 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL)))
               / v21,
           v24 >= 0.0)
        ? (BOOL v25 = v24 <= *(float *)v18.i32)
        : (BOOL v25 = 0),
          v25))
    {
      float32x4_t v27 = vmlaq_n_f32(v22, v19, v24);
    }
    else
    {
      v26.i64[0] = 0x3F0000003F000000;
      v26.i64[1] = 0x3F0000003F000000;
      float32x4_t v27 = vmulq_f32(vaddq_f32(v33, v34), v26);
    }
    *(float32x4_t *)self->_translationOrigin = v27;
  }
  else
  {
    float v28 = scn_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B249000, v28, OS_LOG_TYPE_DEFAULT, "Warning: _computeTranslationOrigin3DFromPoint: invalid zRange", buf, 2u);
    }
  }
  if (v11) {
    C3DSceneUnlock(v11);
  }
}

- (void)_translateToViewPoint:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  [(SCNView *)[(SCNCameraNavigationController *)self view] bounds];
  v5.f64[1] = v4;
  __n128 v33 = (__n128)vcvt_hight_f32_f64(0, v5);
  v6.f64[0] = x;
  v6.f64[1] = y;
  double v7 = COERCE_DOUBLE(vcvt_f32_f64(v6));
  id v8 = [(SCNCameraNavigationController *)self pointOfView];
  uint64_t v9 = [(SCNScene *)[(SCNView *)[(SCNCameraNavigationController *)self view] scene] sceneRef];
  uint64_t v10 = (uint64_t)v9;
  if (v9) {
    C3DSceneLock((uint64_t)v9);
  }
  _C3DHitTestComputeHitSegment((float32x4_t *)[v8 nodeRef], v10, &v38, &v39, v33, v7);
  int v12 = v11;
  if (v10) {
    C3DSceneUnlock(v10);
  }
  if (v12)
  {
    float32x4_t v32 = v38;
    float32x4_t v13 = vsubq_f32(v39, v38);
    float32x4_t v14 = vmulq_f32(v13, v13);
    v14.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u64[0];
    v14.f32[0] = sqrtf(v14.f32[0]);
    float v30 = v14.f32[0];
    float32x4_t v15 = vdivq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
    v15.i32[3] = 0;
    float32x4_t v34 = v15;
    [(SCNCameraNavigationController *)self worldFront];
    float32x4_t v16 = *(float32x4_t *)self->_translationOrigin;
    float32x4_t v17 = vmulq_f32(v16, v18);
    v18.f32[3] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0];
    int8x16_t v19 = (int8x16_t)vmulq_f32(v18, v34);
    float v20 = vaddv_f32(vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL)));
    if (v20 != 0.0
      && ((float32x4_t v21 = v32,
           v21.i32[3] = 1.0,
           int8x16_t v22 = (int8x16_t)vmulq_f32(v21, v18),
           float v23 = (float)-vaddv_f32(vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)))
               / v20,
           v23 >= 0.0)
        ? (BOOL v24 = v23 <= v30)
        : (BOOL v24 = 0),
          v24))
    {
      float32x4_t v35 = vsubq_f32(v16, vmlaq_n_f32(v21, v34, v23));
      [v8 simdWorldTransform];
      simd_float4x4 v41 = __invert_f4(v40);
      float32x4_t v36 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v41.columns[1], *(float32x2_t *)v35.f32, 1), (float32x4_t)v41.columns[0], v35.f32[0]), (float32x4_t)v41.columns[2], v35, 2);
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
      float32x4_t v26 = [(SCNCameraNavigationController *)self cameraController];
      LODWORD(v28) = v36.i32[2];
      LODWORD(v27) = v36.i32[1];
      [(SCNCameraController *)v26 translateInCameraSpaceByX:*(double *)v36.i64 Y:v27 Z:v28];
      +[SCNTransaction commit];
    }
    else
    {
      BOOL v25 = scn_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B249000, v25, OS_LOG_TYPE_DEFAULT, "Warning: Warning: no C3DIntersectionRay3Plane", buf, 2u);
      }
    }
  }
}

- (void)__willChangePointOfView
{
  if (!self->_recordingPointOfViewEvents)
  {
    self->_recordingPointOfViewEvents = 1;
    [(SCNCameraNavigationController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      SCNInteractionMode v3 = [(SCNCameraNavigationController *)self delegate];
      [(SCNCameraNavigationControllerDelegate *)v3 willChangePointOfView];
    }
  }
}

- (void)__didChangePointOfView
{
  if (self->_recordingPointOfViewEvents)
  {
    [(SCNCameraNavigationController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(SCNCameraNavigationControllerDelegate *)[(SCNCameraNavigationController *)self delegate] didChangePointOfView];
    }
    self->_recordingPointOfViewEvents = 0;
  }
}

- (SCNCameraNavigationControllerDelegate)delegate
{
  return (SCNCameraNavigationControllerDelegate *)self->_view;
}

- (void)setView:(id)a3
{
  self->_freeViewCameraNode = (SCNNode *)a3;
}

- (SCNNode)freeCamera
{
  return (SCNNode *)self[1].super.isa;
}

- (BOOL)enableFreeCamera
{
  return BYTE2(self->_cameraController);
}

- (BOOL)autoSwitchToFreeCamera
{
  return BYTE3(self->_cameraController);
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  BYTE3(self->_cameraController) = a3;
}

- (double)flyModeVelocity
{
  return self->_flyModeVelocity;
}

- (void)setFlyModeVelocity:(double)a3
{
  self->_flyModeVelocitCGFloat y = a3;
}

- (double)panSensitivity
{
  return self->_panSensitivity;
}

- (void)setPanSensitivity:(double)a3
{
  self->_panSensitivitCGFloat y = a3;
}

- (double)truckSensitivity
{
  return self->_truckSensitivity;
}

- (void)setTruckSensitivity:(double)a3
{
  self->_truckSensitivitCGFloat y = a3;
}

- (double)rotationSensitivity
{
  return self->_rotationSensitivity;
}

- (void)setRotationSensitivity:(double)a3
{
  self->_rotationSensitivitCGFloat y = a3;
}

- (void).cxx_destruct
{
  end = self->_keyboard.right.__end_;
  if (end)
  {
    self->_keyboard.right.__end_cap_.__value_ = end;
    operator delete(end);
  }
  float64_t v4 = self->_keyboard.left.__end_;
  if (v4)
  {
    self->_keyboard.left.__end_cap_.__value_ = v4;
    operator delete(v4);
  }
  float64x2_t v5 = self->_keyboard.backward.__end_;
  if (v5)
  {
    self->_keyboard.backward.__end_cap_.__value_ = v5;
    operator delete(v5);
  }
  float64x2_t v6 = self->_keyboard.forward.__end_;
  if (v6)
  {
    self->_keyboard.forward.__end_cap_.__value_ = v6;
    operator delete(v6);
  }
  value = (void *)self->_keyboard.keyDown.__tree_.__pair3_.__value_;

  std::__tree<char>::destroy((uint64_t)&self->_keyboard.keyDown.__tree_.__pair1_, value);
}

- (void)setGimbalLockVector:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: setGimbalLockVector is deprecated", v1, 2u);
}

@end
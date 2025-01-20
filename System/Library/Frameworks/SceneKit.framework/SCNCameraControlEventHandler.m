@interface SCNCameraControlEventHandler
+ (SCNMatrix4)matrixWithNoRoll:(SEL)a3;
+ (double)frontVectorWithPointOfView:(void *)a3;
- (BOOL)_3DConnexionIsPressed;
- (BOOL)_freeCameraActivated;
- (BOOL)_isInertiaRunning;
- (BOOL)allowsTranslation;
- (BOOL)automaticCameraTarget;
- (BOOL)computeBoundingSphereOmittingFloorsForNode:(__C3DNode *)a3 sphere:(C3DSphere *)a4;
- (BOOL)enableInertia;
- (BOOL)enabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gimbalLockMode;
- (BOOL)wantsRedraw;
- (SCNCameraControlEventHandler)init;
- (SCNVector3)cameraAutomaticTargetPoint;
- (SCNVector3)cameraTarget;
- (SCNVector3)gimbalLockVector;
- (__n128)viewedObjectSphere;
- (double)_browseScale;
- (double)friction;
- (double)zoomFactor;
- (float)_translationCoef;
- (id)freeCamera;
- (id)gestureRecognizers;
- (uint64_t)frontVector;
- (unint64_t)stickyAxis;
- (void)_beginTranslateAtLocation:(CGPoint)a3;
- (void)_handleDoubleTap:(id)a3;
- (void)_handlePan:(id)a3;
- (void)_handlePinch:(id)a3;
- (void)_handleRotation:(id)a3;
- (void)_installFreeViewCameraIfNeeded;
- (void)_onInertiaTimer;
- (void)_prepareFreeViewCamera;
- (void)_resetBrowseScaleFactor;
- (void)_resetFreeViewCamera;
- (void)_rotateWithDrag:(CGPoint)a3 mode:(int64_t)a4 stickyAxis:(unint64_t)a5;
- (void)_setInertiaRunning:(BOOL)a3;
- (void)_startBrowsingIfNeeded:(CGPoint)a3;
- (void)_switchToFreeViewCamera;
- (void)_translateTo:(CGPoint)a3;
- (void)activateFreeCamera;
- (void)beginGesture:(id)a3;
- (void)cameraDidChange;
- (void)cameraWillChange;
- (void)clearRoll;
- (void)computeAutomaticTargetPoint;
- (void)dealloc;
- (void)endDraggingWithVelocity:(CGPoint)a3;
- (void)focusNode:(id)a3;
- (void)invalidateCameraTarget;
- (void)panWithGestureRecognizer:(id)a3;
- (void)pinchWithGestureRecognizer:(id)a3;
- (void)rotateOf:(double)a3;
- (void)rotateWithGestureRecognizer:(id)a3;
- (void)rotateWithVector:(int64_t)a3 mode:;
- (void)sceneDidChange;
- (void)sceneWillChange;
- (void)setAllowsTranslation:(BOOL)a3;
- (void)setAutomaticCameraTarget:(BOOL)a3;
- (void)setCameraTarget:(SCNVector3)a3;
- (void)setEnableFreeCamera:(BOOL)a3;
- (void)setEnableInertia:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFriction:(double)a3;
- (void)setGimbalLockMode:(BOOL)a3;
- (void)setGimbalLockVector:(SCNVector3)a3;
- (void)setStickyAxis:(unint64_t)a3;
- (void)setZoomFactor:(double)a3;
- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5;
- (void)updateBrowseScaleFactor;
- (void)viewWillDrawAtTime:(double)a3;
- (void)zoomBy:(float)a3;
- (void)zoomBy:(float)a3 animate:(BOOL)a4;
@end

@implementation SCNCameraControlEventHandler

- (SCNCameraControlEventHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNCameraControlEventHandler;
  result = [(SCNEventHandler *)&v3 init];
  if (result)
  {
    result->_zoomFactor = 1.0;
    *((unsigned char *)result + 312) |= 8u;
    *((unsigned char *)result + 312) &= ~2u;
    result->_friction = 0.05;
    result->_browseScaleFactor = 1.0;
    *((unsigned char *)result + 312) |= 0x20u;
    *((unsigned char *)result + 313) &= ~2u;
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  [(SCNNode *)self->_freeViewCameraNode removeFromParentNode];

  v3.receiver = self;
  v3.super_class = (Class)SCNCameraControlEventHandler;
  [(SCNEventHandler *)&v3 dealloc];
}

- (BOOL)enabled
{
  return *((unsigned char *)self + 312) & 1;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *((unsigned char *)self + 312) = *((unsigned char *)self + 312) & 0xFE | a3;
  id v4 = [(SCNCameraControlEventHandler *)self gestureRecognizers];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:*((unsigned char *)self + 312) & 1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)allowsTranslation
{
  return (*((unsigned __int8 *)self + 312) >> 5) & 1;
}

- (void)setAllowsTranslation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 312) = *((unsigned char *)self + 312) & 0xDF | v3;
}

- (BOOL)enableInertia
{
  return (*((unsigned __int8 *)self + 312) >> 3) & 1;
}

- (void)setEnableInertia:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 312) = *((unsigned char *)self + 312) & 0xF7 | v3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (BOOL)gimbalLockMode
{
  return (*((unsigned __int8 *)self + 313) >> 1) & 1;
}

- (void)setGimbalLockMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 313) = *((unsigned char *)self + 313) & 0xFD | v3;
}

- (SCNVector3)gimbalLockVector
{
  float v2 = 0.0;
  float v3 = 1.0;
  float v4 = 0.0;
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setGimbalLockVector:(SCNVector3)a3
{
}

- (BOOL)automaticCameraTarget
{
  return (*((unsigned __int8 *)self + 312) >> 1) & 1;
}

- (void)invalidateCameraTarget
{
  *((unsigned char *)self + 312) &= ~4u;
}

- (void)setAutomaticCameraTarget:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 312);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 312) = v3 & 0xFD | v4;
    [(SCNCameraControlEventHandler *)self invalidateCameraTarget];
  }
}

- (SCNVector3)cameraTarget
{
  float x = self->_cameraTarget.x;
  float y = self->_cameraTarget.y;
  float z = self->_cameraTarget.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setCameraTarget:(SCNVector3)a3
{
  self->_cameraTarget = a3;
}

- (id)freeCamera
{
  return self->_freeViewCameraNode;
}

- (void)focusNode:(id)a3
{
  if (a3)
  {
    *((unsigned char *)self + 312) |= 0x10u;
    [(SCNCameraControlEventHandler *)self _setInertiaRunning:0];
    [(SCNCameraControlEventHandler *)self _switchToFreeViewCamera];
    [(SCNCameraControlEventHandler *)self setAutomaticCameraTarget:0];
    uint64_t v43 = 0;
    int v44 = 0;
    [(SCNCameraControlEventHandler *)self frontVector];
    float32x4_t v35 = v5;
    double v42 = 0.0;
    if ([a3 getBoundingSphereCenter:&v43 radius:&v42])
    {
      float originalFovX = self->_originalFovX;
      if (originalFovX <= self->_originalFovY) {
        float originalFovX = self->_originalFovY;
      }
      float v7 = (float)(originalFovX * 0.5) / 180.0 * 3.14159265;
      memset(v41, 0, sizeof(v41));
      [a3 worldTransform];
      *(float *)&unsigned int v8 = v42;
      v9.i64[0] = 0;
      v9.i64[1] = v8;
      float32x4_t v32 = v9;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      C3DMatrix4x4FromSCNMatrix4(&v37, (uint64_t)v41);
      v36[0] = v37;
      v36[1] = v38;
      v36[2] = v39;
      v36[3] = v40;
      *(float32x2_t *)v10.f32 = C3DVector3RotateAndScale((float32x2_t *)v36, v32);
      float32x4_t v11 = vmulq_f32(v10, v10);
      float v12 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
      double v42 = v12;
      float v13 = tanf(v7);
      double v14 = sqrt((float)((float)(v12 / v13) * (float)(v12 / v13)) + v12 * v12);
    }
    else
    {
      [(SCNCameraControlEventHandler *)self _browseScale];
      double v14 = v15;
    }
    v16 = (void *)[a3 presentationNode];
    LODWORD(v18) = HIDWORD(v43);
    LODWORD(v17) = v43;
    LODWORD(v19) = v44;
    objc_msgSend(v16, "convertPosition:toNode:", 0, v17, v18, v19);
    uint64_t v31 = v21;
    float32x4_t v33 = v20;
    __int32 v30 = v22;
    -[SCNCameraControlEventHandler setCameraTarget:](self, "setCameraTarget:");
    float32x4_t v23 = v35;
    float32x4_t v24 = vmulq_f32(v23, v23);
    float v25 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
    if (v25 != 0.0)
    {
      float32x4_t v26 = v33;
      v26.i32[1] = v30;
      HIDWORD(v27) = HIDWORD(v31);
      v26.i32[2] = v31;
      float v28 = v14;
      float v34 = v28 / v25;
      float32x4_t v29 = vsubq_f32(v26, vmulq_n_f32(v35, v28 / v25));
      LODWORD(v27) = v29.i32[1];
      v23.i32[0] = v29.i32[2];
      -[SCNNode setPosition:](self->_freeViewCameraNode, "setPosition:", *(double *)v29.i64, v27, *(double *)v23.i64);
      self->_browseScaleFactor = v34;
    }
  }
  else
  {
    [(SCNCameraControlEventHandler *)self setAutomaticCameraTarget:1];
  }
}

- (unint64_t)stickyAxis
{
  return self->_stickyAxis;
}

- (void)setStickyAxis:(unint64_t)a3
{
  self->_stickyAxis = a3;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->super._enableFreeCamera = a3;
  if (!a3) {
    [(SCNCameraControlEventHandler *)self _resetFreeViewCamera];
  }
}

- (void)activateFreeCamera
{
  v3.receiver = self;
  v3.super_class = (Class)SCNCameraControlEventHandler;
  [(SCNEventHandler *)&v3 activateFreeCamera];
  [(SCNCameraControlEventHandler *)self _prepareFreeViewCamera];
}

- (void)_resetFreeViewCamera
{
  if ([(SCNNode *)self->_freeViewCameraNode sceneRef]) {
    C3DRemoveSceneRef([(SCNNode *)self->_freeViewCameraNode nodeRef], (uint64_t)[(SCNNode *)self->_freeViewCameraNode sceneRef]);
  }
  [(SCNNode *)self->_freeViewCameraNode removeFromParentNode];

  self->_freeViewCameraNode = 0;
}

- (BOOL)_freeCameraActivated
{
  freeViewCameraNode = self->_freeViewCameraNode;
  return freeViewCameraNode
      && freeViewCameraNode == (SCNNode *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
}

- (void)_prepareFreeViewCamera
{
  objc_super v3 = (SCNNode *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  char v4 = v3;
  if (v3 && v3 == self->_freeViewCameraNode) {
    return;
  }
  float32x4_t v5 = [(SCNNode *)v3 presentationNode];
  [(SCNCamera *)[(SCNNode *)v5 camera] xFov];
  *(float *)&double v6 = v6;
  self->_float originalFovX = *(float *)&v6;
  [(SCNCamera *)[(SCNNode *)v5 camera] yFov];
  float v8 = v7;
  self->_originalFovY = v8;
  if (v8 == 0.0 && self->_originalFovX == 0.0) {
    float v8 = 60.0;
  }
  self->_originalFovY = v8;
  [(SCNCamera *)[(SCNNode *)v5 camera] orthographicScale];
  *(float *)&double v10 = v10;
  self->_originalOrthoScale = *(float *)&v10;
  self->_zoomFactor = 1.0;
  freeViewCameraNode = self->_freeViewCameraNode;
  if (!v4)
  {
    if (freeViewCameraNode) {
      goto LABEL_15;
    }
    float v12 = +[SCNNode node];
    goto LABEL_14;
  }
  if (v4 == freeViewCameraNode)
  {
    memset(&v29, 0, sizeof(v29));
LABEL_24:
    double v17 = [(SCNNode *)v4 presentationNode];
    if (v17) {
      [(SCNNode *)v17 worldTransform];
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }
    goto LABEL_27;
  }
  if (!freeViewCameraNode)
  {
    float v12 = [(SCNNode *)v4 copy];
LABEL_14:
    self->_freeViewCameraNode = v12;
  }
LABEL_15:
  if ([(SCNNode *)v4 camera])
  {
    float v13 = (SCNCamera *)[(SCNCamera *)[(SCNNode *)v4 camera] copy];
LABEL_17:
    double v14 = v13;
    goto LABEL_18;
  }
  if (![(SCNNode *)v4 light])
  {
    float v13 = +[SCNCamera camera];
    goto LABEL_17;
  }
  v16 = [(SCNNode *)v4 light];
  double v14 = +[SCNCamera camera];
  if (v16)
  {
    [(SCNLight *)v16 spotOuterAngle];
    -[SCNCamera setFieldOfView:](v14, "setFieldOfView:");
    [(SCNCamera *)v14 setFieldOfViewOrientation:0];
    [(SCNLight *)v16 zNear];
    -[SCNCamera setZNear:](v14, "setZNear:");
    [(SCNLight *)v16 zFar];
    -[SCNCamera setZFar:](v14, "setZFar:");
  }
LABEL_18:
  [(SCNNode *)self->_freeViewCameraNode setCamera:v14];
  [(SCNNode *)self->_freeViewCameraNode setLight:0];
  [(SCNNode *)self->_freeViewCameraNode setGeometry:0];
  BOOL v15 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  [(SCNNode *)self->_freeViewCameraNode removeAllAnimations];
  +[SCNTransaction setImmediateMode:v15];
  memset(&v29, 0, sizeof(v29));
  if (v4) {
    goto LABEL_24;
  }
  SCNMatrix4 v29 = SCNMatrix4Identity;
LABEL_27:
  memset(v28, 0, sizeof(v28));
  C3DMatrix4x4FromSCNMatrix4(v28, (uint64_t)&v29);
  double v18 = C3DMatrix4x4Determinant3x3((uint64_t)v28);
  if (fabs(*(float *)&v18 + -1.0) > 0.00001)
  {
    v27.i32[2] = 0;
    v27.i64[0] = 0;
    v26.i32[2] = 0;
    v26.i64[0] = 0;
    float32x4_t v25 = 0uLL;
    C3DMatrix4x4GetAffineTransforms((uint64_t)v28, &v27, (int8x16_t *)&v25, &v26);
    C3DQuaternionNormalize(&v25);
    C3DMatrix4x4MakeAffine(v28, &v27, &v25, (float32x2_t *)&v26);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v28, &v29);
  }
  SCNMatrix4 v24 = v29;
  [(SCNNode *)self->_freeViewCameraNode setTransform:&v24];
  [(SCNNode *)self->_freeViewCameraNode setName:@"kSCNFreeViewCameraName"];
  -[SCNCamera setName:](-[SCNNode camera](self->_freeViewCameraNode, "camera"), "setName:", [@"kSCNFreeViewCameraName" stringByAppendingString:@"Camera"]);
  if ([(SCNView *)[(SCNEventHandler *)self view] _showsAuthoringEnvironment])
  {
    [(SCNCamera *)[(SCNNode *)self->_freeViewCameraNode camera] setAutomaticallyAdjustsZRange:1];
    double v19 = [(SCNCamera *)[(SCNNode *)self->_freeViewCameraNode camera] cameraRef];
    *((unsigned char *)v19 + 64) |= 4u;
  }
  float32x4_t v20 = [(SCNScene *)[(SCNView *)[(SCNEventHandler *)self view] scene] sceneRef];
  if (v20)
  {
    uint64_t v21 = (uint64_t)v20;
    if (!C3DGetSceneRef((uint64_t)[(SCNNode *)self->_freeViewCameraNode nodeRef])) {
      C3DAddSceneRef((uint64_t *)[(SCNNode *)self->_freeViewCameraNode nodeRef], v21);
    }
  }
  [(SCNCameraControlEventHandler *)self viewedObjectSphere];
  *(void *)&self->_cameraTarget.float x = v22;
  self->_cameraTarget.float z = v23;
}

- (void)_installFreeViewCameraIfNeeded
{
  if ([(SCNEventHandler *)self enableFreeCamera])
  {
    id v3 = [(SCNView *)[(SCNEventHandler *)self view] renderer];
    if ((SCNNode *)[v3 pointOfView] != self->_freeViewCameraNode)
    {
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
      [v3 setPointOfView:self->_freeViewCameraNode];
      [(SCNCameraControlEventHandler *)self updateBrowseScaleFactor];
      +[SCNTransaction commit];
    }
  }
}

- (void)_switchToFreeViewCamera
{
  if ([(SCNEventHandler *)self enableFreeCamera]
    && ![(SCNCameraControlEventHandler *)self _freeCameraActivated])
  {
    +[SCNTransaction begin];
    +[SCNTransaction setDisableActions:1];
    [(SCNCameraControlEventHandler *)self _prepareFreeViewCamera];
    [(SCNCameraControlEventHandler *)self _installFreeViewCameraIfNeeded];
    +[SCNTransaction commit];
  }
}

- (SCNVector3)cameraAutomaticTargetPoint
{
  if ((*((unsigned char *)self + 312) & 4) == 0) {
    [(SCNCameraControlEventHandler *)self computeAutomaticTargetPoint];
  }
  float x = self->_autoCameraTarget.x;
  float y = self->_autoCameraTarget.y;
  float z = self->_autoCameraTarget.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)computeAutomaticTargetPoint
{
  *((unsigned char *)self + 312) |= 4u;
  id v3 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  [(SCNCameraControlEventHandler *)self _browseScale];
  double v5 = v4;
  [(SCNCameraControlEventHandler *)self frontVector];
  float32x4_t v22 = v6;
  double v7 = (void *)[v3 presentationInstance];
  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  objc_msgSend(v7, "convertPosition:toNode:", 0, v8, v9, v10);
  __int32 v24 = v12;
  float32x4_t v25 = v11;
  float v23 = v13;
  if ((*((unsigned char *)self + 312) & 0x10) != 0)
  {
    float32x4_t v17 = v22;
  }
  else
  {
    [(SCNCameraControlEventHandler *)self viewedObjectSphere];
    float32x4_t v14 = v25;
    v14.i32[1] = v24;
    v14.f32[2] = v23;
    float32x4_t v16 = vsubq_f32(v15, v14);
    float32x4_t v17 = v22;
    float32x4_t v18 = vmulq_f32(v22, v16);
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0] > 0.5)
    {
      float32x4_t v19 = vmulq_f32(v16, v16);
      double v5 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]);
    }
  }
  float v20 = v5;
  *(float32x2_t *)&self->_autoCameraTarget.float x = vadd_f32((float32x2_t)__PAIR64__(v24, v25.u32[0]), COERCE_FLOAT32X2_T(C3DVector3Rescale(v17, v20)));
  self->_autoCameraTarget.float z = v23 + v21;
}

- (float)_translationCoef
{
  [(SCNCameraControlEventHandler *)self _browseScale];
  return v2 * 0.01;
}

- (double)_browseScale
{
  return self->_browseScaleFactor;
}

- (void)_resetBrowseScaleFactor
{
  self->_browseScaleFactor = 1.0;
  id v3 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v3)
  {
    double v4 = objc_msgSend(v3, "presentationNode", 0, 0, 0, 0, 0, 0);
    if (v4)
    {
      [v4 worldTransform];
      float32x4_t v5 = 0u;
      int8x8_t v6 = vext_s8(0, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v5, (int8x16_t)v5, 8uLL), 4uLL);
    }
    else
    {
      int8x8_t v6 = 0;
      v5.i32[0] = 0;
      v5.i32[3] = 0;
    }
    *(int8x8_t *)&v5.i32[1] = v6;
    float32x4_t v7 = vmulq_f32(v5, v5);
    self->_browseScaleFactor = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
  }
}

- (void)updateBrowseScaleFactor
{
  if ((*((unsigned char *)self + 312) & 2) != 0) {
    [(SCNCameraControlEventHandler *)self cameraAutomaticTargetPoint];
  }
  else {
    [(SCNCameraControlEventHandler *)self cameraTarget];
  }
  v17.i64[0] = v3;
  __int32 v16 = v5;
  int8x8_t v6 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view", v4), "renderer"), "pointOfView");
  float32x4_t v7 = (void *)[v6 presentationNode];
  if (v7)
  {
    [v7 worldTransform];
    float32x4_t v8 = 0u;
    int8x8_t v9 = vext_s8(0, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v8, (int8x16_t)v8, 8uLL), 4uLL);
  }
  else
  {
    v8.i32[0] = 0;
    v8.i32[3] = 0;
    int8x8_t v9 = 0;
  }
  float32x4_t v10 = v17;
  v10.i32[1] = v15;
  v10.i32[2] = v16;
  *(int8x8_t *)&v8.i32[1] = v9;
  float32x4_t v11 = vsubq_f32(v8, v10);
  float32x4_t v12 = vmulq_f32(v11, v11);
  float v13 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
  double v14 = v13;
  if (v13 <= 0.1) {
    float v13 = 0.1;
  }
  self->_browseScaleFactor = v13;
  +[SCNTransaction begin];
  +[SCNTransaction setAnimationDuration:0.0];
  objc_msgSend((id)objc_msgSend(v6, "camera"), "setFocalDistance:", v14);
  +[SCNTransaction commit];
}

- (void)rotateOf:(double)a3
{
  if (self->super._autoSwitchToFreeCamera) {
    [(SCNCameraControlEventHandler *)self _switchToFreeViewCamera];
  }
  *((unsigned char *)self + 313) &= ~1u;
  __int32 v5 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v5)
  {
    int8x8_t v6 = v5;
    memset(v14, 0, sizeof(v14));
    memset(v13, 0, sizeof(v13));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    [v5 transform];
    C3DMatrix4x4FromSCNMatrix4(v14, (uint64_t)&v9);
    float v7 = a3 * -3.14159265 / 180.0;
    C3DMatrix4x4MakeRotationZ(v13, v7);
    C3DMatrix4x4Mult((uint64_t)v13, v14, v14);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v14, &v9);
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
    [v6 setTransform:v8];
  }
}

- (void)zoomBy:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->super._autoSwitchToFreeCamera) {
    [(SCNCameraControlEventHandler *)self _switchToFreeViewCamera];
  }
  float v7 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v7)
  {
    float32x4_t v8 = v7;
    memset(v21, 0, sizeof(v21));
    memset(v20, 0, sizeof(v20));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    [v7 transform];
    v9.n128_u64[0] = 0;
    v9.n128_u32[3] = 0;
    v9.n128_f32[2] = a3 * -100.0;
    __n128 v15 = v9;
    C3DMatrix4x4MakeTranslation((uint64_t)v21, &v15);
    C3DMatrix4x4FromSCNMatrix4(v20, (uint64_t)&v16);
    double v10 = C3DMatrix4x4Mult((uint64_t)v21, v20, v21);
    if (v4)
    {
      +[SCNTransaction begin];
      +[SCNTransaction setAnimationDuration:0.3];
      C3DMatrix4x4ToSCNMatrix4((uint64_t)v21, &v16);
      long long v11 = v16;
      long long v12 = v17;
      long long v13 = v18;
      long long v14 = v19;
      [v8 setTransform:&v11];
      +[SCNTransaction commit];
    }
    else
    {
      C3DMatrix4x4ToSCNMatrix4((uint64_t)v21, &v16);
      long long v11 = v16;
      long long v12 = v17;
      long long v13 = v18;
      long long v14 = v19;
      [v8 setTransform:&v11];
    }
  }
}

- (void)zoomBy:(float)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor == a3) {
    return;
  }
  if (self->super._autoSwitchToFreeCamera) {
    [(SCNCameraControlEventHandler *)self _switchToFreeViewCamera];
  }
  __int32 v5 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (objc_msgSend((id)objc_msgSend(v5, "camera"), "usesOrthographicProjection"))
  {
    float zoomFactor = self->_zoomFactor;
    if (zoomFactor != 0.0)
    {
      float originalOrthoScale = self->_originalOrthoScale;
      [(SCNCameraControlEventHandler *)self viewedObjectSphere];
      float v9 = v8;
      if (v8 == 0.0) {
        return;
      }
      double v10 = (float)(originalOrthoScale / zoomFactor);
      [(SCNView *)[(SCNEventHandler *)self view] bounds];
      double v12 = v11;
      [(SCNView *)[(SCNEventHandler *)self view] bounds];
      double v14 = v9;
      double v15 = v14 + v14;
      double v16 = self->_originalOrthoScale;
      if (v14 + v14 <= v16) {
        double v15 = self->_originalOrthoScale;
      }
      if (v15 <= v10)
      {
        if (self->_zoomFactor >= a3) {
          return;
        }
      }
      else
      {
        double v17 = v14 * 0.1;
        float v18 = v13;
        float v19 = v12;
        if (v18 >= v19) {
          float v20 = v12;
        }
        else {
          float v20 = v18;
        }
        double v21 = v20;
        if (v18 < v19) {
          float v18 = v12;
        }
        double v22 = v17 * (v21 / fmax(v18, 1.0));
        if (v22 <= v16) {
          double v16 = v22;
        }
        if (v16 >= v10)
        {
          if (self->_zoomFactor <= a3) {
            return;
          }
        }
        else
        {
          objc_msgSend((id)objc_msgSend(v5, "camera"), "setOrthographicScale:", v10);
        }
      }
    }
LABEL_31:
    float v32 = a3;
    self->_float zoomFactor = v32;
    return;
  }
  float originalFovX = self->_originalFovX;
  long double v24 = tan(originalFovX * 0.0174532925 * 0.5);
  long double v25 = atan(v24 / a3);
  float v26 = (v25 + v25) / 3.14159265 * 180.0;
  float originalFovY = self->_originalFovY;
  long double v28 = tan(originalFovY * 0.0174532925 * 0.5);
  double v29 = atan(v28 / a3);
  if ((originalFovX <= 0.0 || v26 > 1.0) && v26 < 120.0)
  {
    float v30 = (v29 + v29) / 3.14159265 * 180.0;
    if ((originalFovY <= 0.0 || v30 > 1.0) && v30 < 120.0)
    {
      if (v5)
      {
        double v31 = v30;
        objc_msgSend((id)objc_msgSend(v5, "camera"), "setXFov:", v26);
        objc_msgSend((id)objc_msgSend(v5, "camera"), "setYFov:", v31);
      }
      goto LABEL_31;
    }
  }
}

- (void)translateByX:(float)a3 Y:(float)a4 Z:(float)a5
{
  if (self->super._autoSwitchToFreeCamera) {
    [(SCNCameraControlEventHandler *)self _switchToFreeViewCamera];
  }
  uint64_t v9 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v9)
  {
    double v10 = (void *)v9;
    [(SCNCameraControlEventHandler *)self cameraAutomaticTargetPoint];
    memset(&v22, 0, sizeof(v22));
    [v10 transform];
    [(SCNCameraControlEventHandler *)self _translationCoef];
    float browseScaleFactor = self->_browseScaleFactor;
    if (browseScaleFactor >= 100000.0 && a5 < 0.0) {
      float v14 = 0.0;
    }
    else {
      float v14 = a5;
    }
    double v15 = browseScaleFactor;
    *(void *)&a.m14 = 0;
    *(void *)&a.m12 = 0;
    if (v14 > 0.0 && v15 < 0.1) {
      float v17 = 0.0;
    }
    else {
      float v17 = v14;
    }
    a.m11 = 1.0;
    a.m22 = 1.0;
    *(void *)&a.m23 = 0;
    *(void *)&a.m31 = 0;
    *(void *)&a.m33 = 1065353216;
    a.m41 = -(float)(a3 * v11);
    a.m42 = -(float)(a4 * v11);
    a.m43 = -(float)(v17 * v11);
    a.m44 = 1.0;
    SCNMatrix4 b = v22;
    SCNMatrix4Mult(&v21, &a, &b);
    SCNMatrix4 v22 = v21;
    SCNMatrix4 v18 = v21;
    [v10 setTransform:&v18];
    if (a3 != 0.0 || a4 != 0.0) {
      [(SCNCameraControlEventHandler *)self invalidateCameraTarget];
    }
    [(SCNCameraControlEventHandler *)self focusNode:0];
    [(SCNCameraControlEventHandler *)self updateBrowseScaleFactor];
  }
}

- (void)sceneWillChange
{
  *((unsigned char *)self + 304) &= ~1u;
  *((unsigned char *)self + 313) &= ~1u;
  [(SCNCameraControlEventHandler *)self _resetFreeViewCamera];

  [(SCNCameraControlEventHandler *)self _setInertiaRunning:0];
}

- (void)sceneDidChange
{
  [(SCNCameraControlEventHandler *)self invalidateCameraTarget];

  [(SCNCameraControlEventHandler *)self _resetBrowseScaleFactor];
}

- (void)cameraWillChange
{
  *((unsigned char *)self + 313) &= ~1u;
  [(SCNCameraControlEventHandler *)self _setInertiaRunning:0];
}

- (void)cameraDidChange
{
  [(SCNCameraControlEventHandler *)self _resetBrowseScaleFactor];

  [(SCNCameraControlEventHandler *)self invalidateCameraTarget];
}

- (void)_onInertiaTimer
{
  CFTimeInterval v3 = CACurrentMediaTime();
  double lastSimulationTime = self->_lastSimulationTime;
  int v5 = (int)((v3 - lastSimulationTime) * 60.0);
  self->_double lastSimulationTime = lastSimulationTime + (double)v5 / 60.0;
  if (v5 >= 1)
  {
    p_inertiaVelocitdouble y = &self->_inertiaVelocity;
    do
    {
      double friction = self->_friction;
      double x = p_inertiaVelocity->x;
      double y = self->_inertiaVelocity.y;
      if (friction != 0.0)
      {
        double x = (1.0 - friction) * x;
        p_inertiaVelocity->double x = x;
        double y = y * (1.0 - self->_friction);
        self->_inertiaVelocity.double y = y;
      }
      CGFloat v10 = y + self->_totalDragWithInertia.y;
      self->_totalDragWithInertia.double x = x + self->_totalDragWithInertia.x;
      self->_totalDragWithInertia.double y = v10;
      --v5;
    }
    while (v5);
  }
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  -[SCNCameraControlEventHandler _rotateWithDrag:mode:stickyAxis:](self, "_rotateWithDrag:mode:stickyAxis:", self->_browseMode, self->_stickyAxis, self->_totalDragWithInertia.x, self->_totalDragWithInertia.y);
  +[SCNTransaction commit];
  if (self->_inertiaVelocity.y * self->_inertiaVelocity.y + self->_inertiaVelocity.x * self->_inertiaVelocity.x < 0.001)
  {
    [(SCNCameraControlEventHandler *)self _setInertiaRunning:0];
  }
}

- (void)rotateWithVector:(int64_t)a3 mode:
{
  long long v13 = v3;
  BOOL v4 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view", a3), "renderer"), "pointOfView");
  int v5 = v4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (v4) {
    [v4 transform];
  }
  memset(v8, 0, sizeof(v8));
  C3DMatrix4x4FromSCNMatrix4(v8, (uint64_t)&v9);
  memset(v7, 0, sizeof(v7));
  C3DMatrix4x4MakeEulerRotation(v7, &v13);
  C3DMatrix4x4Mult((uint64_t)v7, v8, v8);
  C3DMatrix4x4ToSCNMatrix4((uint64_t)v8, &v9);
  v6[0] = v9;
  v6[1] = v10;
  v6[2] = v11;
  v6[3] = v12;
  [v5 setTransform:v6];
}

- (void)viewWillDrawAtTime:(double)a3
{
  if ([(SCNCameraControlEventHandler *)self _isInertiaRunning])
  {
    [(SCNCameraControlEventHandler *)self _onInertiaTimer];
  }
}

- (void)_setInertiaRunning:(BOOL)a3
{
  BOOL v3 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (v3) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *((unsigned char *)self + 313) = *((unsigned char *)self + 313) & 0xFB | v6;

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)_isInertiaRunning
{
  double v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LODWORD(v2) = (*((unsigned __int8 *)v2 + 313) >> 2) & 1;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)_3DConnexionIsPressed
{
  return 0;
}

- (BOOL)wantsRedraw
{
  if ([(SCNCameraControlEventHandler *)self _isInertiaRunning]) {
    return 1;
  }

  return [(SCNCameraControlEventHandler *)self _3DConnexionIsPressed];
}

- (void)endDraggingWithVelocity:(CGPoint)a3
{
  if ((*((unsigned char *)self + 312) & 8) != 0)
  {
    double v3 = fabs(a3.y);
    if (fabs(a3.x) >= 10.0 || v3 >= 10.0)
    {
      CGFloat y = a3.y;
      CGPoint v7 = (CGPoint)vdivq_f64((float64x2_t)a3, (float64x2_t)xmmword_20B5EFAC0);
      self->_inertiaVelocitCGFloat y = v7;
      if (self->_friction == 0.0)
      {
        __asm
        {
          FMOV            V2.2D, #-20.0
          FMOV            V4.2D, #20.0
        }
        self->_inertiaVelocitCGFloat y = (CGPoint)vbslq_s8((int8x16_t)vcgtzq_f64((float64x2_t)v7), (int8x16_t)vminnmq_f64((float64x2_t)v7, _Q4), vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)v7), (int8x16_t)_Q2, (int8x16_t)v7));
      }
      [(SCNCameraControlEventHandler *)self _setInertiaRunning:1];
      self->_double lastSimulationTime = CACurrentMediaTime();
      long long v13 = [(SCNEventHandler *)self view];
      [(SCNView *)v13 eventHandlerWantsRedraw];
    }
  }
}

- (void)_startBrowsingIfNeeded:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->super._autoSwitchToFreeCamera) {
    [(SCNCameraControlEventHandler *)self _switchToFreeViewCamera];
  }
  char v6 = (SCNNode *)objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  if (self->super._autoSwitchToFreeCamera) {
    [(SCNCameraControlEventHandler *)self _prepareFreeViewCamera];
  }
  if ([(SCNNode *)v6 parentNode] || v6 == self->_freeViewCameraNode)
  {
    CGPoint v7 = [(SCNNode *)v6 presentationNode];
    [(SCNCamera *)[(SCNNode *)v7 camera] xFov];
    *(float *)&double v8 = v8;
    self->_float originalFovX = *(float *)&v8;
    [(SCNCamera *)[(SCNNode *)v7 camera] yFov];
    float v10 = v9;
    self->_float originalFovY = v10;
    if (v10 == 0.0 && self->_originalFovX == 0.0) {
      float v10 = 60.0;
    }
    self->_float originalFovY = v10;
    [(SCNCamera *)[(SCNNode *)v7 camera] orthographicScale];
    *(float *)&double v12 = v12;
    self->_float originalOrthoScale = *(float *)&v12;
    self->_float zoomFactor = 1.0;
  }
  else
  {
    [(SCNCameraControlEventHandler *)self _installFreeViewCameraIfNeeded];
  }
  +[SCNTransaction commit];
  [(SCNCameraControlEventHandler *)self computeAutomaticTargetPoint];
  freeViewCameraNode = self->_freeViewCameraNode;
  if (freeViewCameraNode)
  {
    [(SCNNode *)freeViewCameraNode transform];
    C3DMatrix4x4FromSCNMatrix4((C3DMatrix4x4 *)self->_initialMatrix.components, (uint64_t)&v14);
    self->_initialPoint.CGFloat x = x;
    self->_initialPoint.CGFloat y = y;
    *((unsigned char *)self + 313) &= ~1u;
  }
}

- (BOOL)computeBoundingSphereOmittingFloorsForNode:(__C3DNode *)a3 sphere:(C3DSphere *)a4
{
  *(_OWORD *)a4 = xmmword_20B5CC220;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__SCNCameraControlEventHandler_computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke;
  v6[3] = &__block_descriptor_40_e20_q16__0____C3DNode__8l;
  _OWORD v6[4] = a4;
  C3DNodeApplyHierarchy((uint64_t)a3, (uint64_t)v6);
  return *((float *)a4 + 3) >= 0.0;
}

uint64_t __82__SCNCameraControlEventHandler_computeBoundingSphereOmittingFloorsForNode_sphere___block_invoke(uint64_t a1, float32x4_t *a2)
{
  if (C3DNodeIsHidden((uint64_t)a2)) {
    return 1;
  }
  if (!C3DNodeGetFloor((uint64_t)a2))
  {
    float32x4_t v7 = 0uLL;
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

- (__n128)viewedObjectSphere
{
  if ((a1[19].i8[0] & 1) == 0)
  {
    float32x4_t v15 = 0uLL;
    if (-[float32x4_t computeBoundingSphereOmittingFloorsForNode:sphere:](a1, "computeBoundingSphereOmittingFloorsForNode:sphere:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[float32x4_t view](a1, "view"), "scene"), "rootNode"), "nodeRef"), &v15))
    {
      long long v13 = 0u;
      long long v14 = 0u;
      float32x4_t v11 = 0u;
      long long v12 = 0u;
      C3DNodeComputeWorldMatrix((float32x4_t *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[float32x4_t view](a1, "view"), "scene"), "rootNode"), "nodeRef"), (uint64_t)&v11);
      float32x4_t v7 = v11;
      long long v8 = v12;
      long long v9 = v13;
      long long v10 = v14;
      *(double *)v2.i64 = C3DVector3MultMatrix4x4(&v7, v15);
      unsigned __int32 v3 = v15.u32[3];
      v2.i32[3] = v15.i32[3];
      float32x4_t v15 = v2;
      v2.i64[0] = 0;
      v2.i64[1] = v3;
      float32x4_t v7 = v11;
      long long v8 = v12;
      long long v9 = v13;
      long long v10 = v14;
      *(float32x2_t *)v4.f32 = C3DVector3RotateAndScale((float32x2_t *)&v7, v2);
      float32x4_t v5 = vmulq_f32(v4, v4);
      v15.i32[3] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
      a1[18] = v15;
    }
    else
    {
      a1[18] = (float32x4_t)xmmword_20B5CB530;
    }
    a1[19].i8[0] |= 1u;
  }
  return (__n128)a1[18];
}

+ (double)frontVectorWithPointOfView:(void *)a3
{
  objc_msgSend((id)objc_msgSend(a3, "camera"), "cameraRef");
  *(double *)v4.i64 = C3DCameraGetFrontDirection();
  float32x4_t v7 = v4;
  long long v5 = 0uLL;
  memset(v13, 0, sizeof(v13));
  if (a3)
  {
    objc_msgSend(a3, "worldTransform", *(_OWORD *)&v7);
    long long v5 = 0uLL;
  }
  long long v11 = v5;
  long long v12 = v5;
  long long v9 = v5;
  long long v10 = v5;
  C3DMatrix4x4FromSCNMatrix4(&v9, (uint64_t)v13);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  v8[3] = v12;
  return C3DVector3Rotate((float32x2_t *)v8, v7);
}

- (uint64_t)frontVector
{
  uint64_t v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "view"), "renderer"), "pointOfView");
  float32x4_t v2 = objc_opt_class();

  return [v2 frontVectorWithPointOfView:v1];
}

- (void)_beginTranslateAtLocation:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  [(SCNView *)[(SCNEventHandler *)self view] bounds];
  float64_t v17 = v4;
  [(SCNView *)[(SCNEventHandler *)self view] bounds];
  float64_t v14 = v5;
  char v6 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  v7.f64[0] = v17;
  v7.f64[1] = v14;
  __n128 v18 = (__n128)vcvt_hight_f32_f64(0, v7);
  v7.f64[0] = x;
  v7.f64[1] = y;
  double v8 = COERCE_DOUBLE(vcvt_f32_f64(v7));
  [(SCNCameraControlEventHandler *)self viewedObjectSphere];
  *(_OWORD *)self->_clickOrigin = v9;
  [(SCNCameraControlEventHandler *)self frontVector];
  float32x4_t v22 = v10;
  float32x4_t v20 = 0u;
  float32x4_t v21 = 0u;
  _C3DHitTestComputeHitSegment((float32x4_t *)[v6 nodeRef], (uint64_t)-[SCNScene sceneRef](-[SCNView scene](-[SCNEventHandler view](self, "view"), "scene"), "sceneRef"), &v20, &v21, v18, v8);
  if (v11)
  {
    __n128 buf = 0uLL;
    C3DPlaneMakeWithVectors(&buf, (float32x4_t *)self->_clickOrigin, &v22);
    if (!C3DIntersectionSegment3Plane(&v20, (float *)&buf, (float32x4_t *)self->_clickOrigin))
    {
      *(double *)&long long v12 = C3DVector3MidVector(v20, v21);
      *(_OWORD *)self->_clickOrigin = v12;
    }
  }
  else
  {
    long long v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u16[0] = 0;
      _os_log_impl(&dword_20B249000, v13, OS_LOG_TYPE_DEFAULT, "Warning: _beginTranslateAtLocation: invalid zRange", (uint8_t *)&buf, 2u);
    }
  }
}

+ (SCNMatrix4)matrixWithNoRoll:(SEL)a3
{
  memset(&v31, 0, sizeof(v31));
  memset(&v30, 0, sizeof(v30));
  C3DMatrix4x4FromSCNMatrix4(&v31, (uint64_t)a4);
  C3DMatrix4x4Invert(&v31, &v30);
  float32x4_t v26 = (float32x4_t)v31.columns[0];
  simd_float4 v27 = v31.columns[1];
  simd_float4 v28 = v31.columns[2];
  simd_float4 v29 = v31.columns[3];
  *(double *)v6.i64 = C3DVector3Rotate((float32x2_t *)&v26, (float32x4_t)xmmword_20B5CB7D0);
  float32x4_t v24 = v6;
  float32x4_t v26 = (float32x4_t)v31.columns[0];
  simd_float4 v27 = v31.columns[1];
  simd_float4 v28 = v31.columns[2];
  simd_float4 v29 = v31.columns[3];
  *(double *)v7.i64 = C3DVector3Rotate((float32x2_t *)&v26, (float32x4_t)xmmword_20B5CB810);
  v8.i64[0] = 0;
  float32x4_t v9 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1)), 0), (int8x16_t)xmmword_20B5CB8B0, (int8x16_t)xmmword_20B5CB7D0);
  float32x4_t v10 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v7, v7), (int8x16_t)v7, 0xCuLL);
  int8x16_t v11 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL), vnegq_f32((float32x4_t)v7)), v9, v10);
  float32x4_t v12 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), v11, 0xCuLL);
  float32x4_t v13 = vmlaq_f32(vmulq_f32(v10, vnegq_f32(v12)), (float32x4_t)v7, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL));
  int32x4_t v14 = (int32x4_t)vmulq_f32(v13, v13);
  v14.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v14, 2), *(float32x2_t *)v14.i8)).u32[0];
  float32x4_t v15 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL);
  *(float32x2_t *)v13.f32 = vrsqrte_f32((float32x2_t)v14.u32[0]);
  *(float32x2_t *)v13.f32 = vmul_f32(*(float32x2_t *)v13.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v13.f32)));
  float32x4_t v16 = vmulq_n_f32(v15, vmul_f32(*(float32x2_t *)v13.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v13.f32))).f32[0]);
  float32x4_t v17 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24), (int8x16_t)v24, 0xCuLL), vnegq_f32(v16)), v24, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v16, (int32x4_t)v16), (int8x16_t)v16, 0xCuLL));
  float32x4_t v18 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL);
  int32x4_t v19 = (int32x4_t)vmulq_f32(v17, v17);
  v19.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v19.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2), *(float32x2_t *)v19.i8)).u32[0];
  *(float32x2_t *)v11.i8 = vrsqrte_f32((float32x2_t)v19.u32[0]);
  *(float32x2_t *)v11.i8 = vmul_f32(*(float32x2_t *)v11.i8, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(*(float32x2_t *)v11.i8, *(float32x2_t *)v11.i8)));
  float32x4_t v25 = vmulq_n_f32(v18, vmul_f32(*(float32x2_t *)v11.i8, vrsqrts_f32((float32x2_t)v19.u32[0], vmul_f32(*(float32x2_t *)v11.i8, *(float32x2_t *)v11.i8))).f32[0]);
  float v20 = C3DVector3Angle(v16, v24);
  simd_float4 v28 = 0u;
  simd_float4 v29 = 0u;
  float32x4_t v26 = 0u;
  simd_float4 v27 = 0u;
  C3DMatrix4x4MakeAxisAngleRotation(&v26, &v25, v20);
  C3DMatrix4x4Mult((uint64_t)&v31, &v26, &v31);
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&v31, a4);
  long long v22 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&retstr->m21 = v22;
  long long v23 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&retstr->m41 = v23;
  return result;
}

- (void)clearRoll
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned __int32 v3 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v3)
  {
    [v3 worldTransform];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
  }
  double v4 = objc_opt_class();
  if (v4)
  {
    v6[0] = v11;
    v6[1] = v12;
    v6[2] = v13;
    v6[3] = v14;
    [v4 matrixWithNoRoll:v6];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  long long v11 = v7;
  long long v12 = v8;
  long long v13 = v9;
  long long v14 = v10;
  double v5 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  long long v7 = v11;
  long long v8 = v12;
  long long v9 = v13;
  long long v10 = v14;
  [v5 setWorldTransform:&v7];
}

- (void)_rotateWithDrag:(CGPoint)a3 mode:(int64_t)a4 stickyAxis:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  v66.i32[2] = 0;
  v66.i64[0] = 0;
  DWORD2(v65) = 0;
  *(void *)&long long v65 = 0;
  self->_totalDragWithInertiSCNMatrix4 a = a3;
  long long v10 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if ((*((unsigned char *)self + 313) & 1) == 0)
  {
    *(_OWORD *)self->_upDir = xmmword_20B5CB7D0;
    long long v11 = *(_OWORD *)&self->_initialMatrix.components[4];
    float32x4_t v61 = *(float32x4_t *)self->_initialMatrix.components;
    long long v62 = v11;
    long long v12 = *(_OWORD *)&self->_initialMatrix.components[12];
    long long v63 = *(_OWORD *)&self->_initialMatrix.components[8];
    long long v64 = v12;
    *(double *)&long long v13 = C3DVector3Rotate((float32x2_t *)&v61, (float32x4_t)xmmword_20B5CB7D0);
    *(_OWORD *)self->_upDir = v13;
    *((unsigned char *)self + 313) |= 1u;
  }
  *(uint64_t *)((char *)v60.i64 + 4) = 0;
  p_initialMatridouble x = &self->_initialMatrix;
  v60.i32[0] = 0;
  *(void *)&double v15 = C3DMatrix4x4GetTranslation((__n128 *)&self->_initialMatrix, (__n128 *)&v60).n128_u64[0];
  if (a4 == 1)
  {
    if ((*((unsigned char *)self + 312) & 2) != 0) {
      [(SCNCameraControlEventHandler *)self cameraAutomaticTargetPoint];
    }
    else {
      [(SCNCameraControlEventHandler *)self cameraTarget];
    }
    v16.i32[1] = v17;
    v16.i32[2] = v18;
    float32x4_t v49 = v16;
    float32x4_t v21 = vsubq_f32(v16, v60);
  }
  else
  {
    long long v19 = *(_OWORD *)&self->_initialMatrix.components[4];
    float32x4_t v61 = *(float32x4_t *)p_initialMatrix->components;
    long long v62 = v19;
    long long v20 = *(_OWORD *)&self->_initialMatrix.components[12];
    long long v63 = *(_OWORD *)&self->_initialMatrix.components[8];
    long long v64 = v20;
    *(double *)v21.i64 = C3DVector3Rotate((float32x2_t *)&v61, (float32x4_t)xmmword_20B5CB810);
    double x = -x;
    double y = -y;
    float32x4_t v49 = 0u;
  }
  float32x4_t v22 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21), (int8x16_t)v21, 0xCuLL);
  float32x4_t v23 = vnegq_f32(v21);
  float32x4_t v24 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)self->_upDir, *(int32x4_t *)self->_upDir), *(int8x16_t *)self->_upDir, 0xCuLL), v23), *(float32x4_t *)self->_upDir, v22);
  float32x4_t v25 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24), (int8x16_t)v24, 0xCuLL);
  int32x4_t v26 = (int32x4_t)vmulq_f32(v24, v24);
  v26.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), *(float32x2_t *)v26.i8)).u32[0];
  float32x2_t v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
  float32x2_t v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
  float32x4_t v29 = vmulq_n_f32(v25, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
  float32x4_t v66 = v29;
  if ((*((unsigned char *)self + 313) & 2) != 0)
  {
    long long v64 = 0u;
    long long v65 = xmmword_20B5CB8B0;
    long long v62 = 0u;
    long long v63 = 0u;
    float32x4_t v61 = 0u;
    *(void *)&double v47 = C3DMatrix4x4MakeIdentity((uint64_t)&v61).n128_u64[0];
    if (a5 <= 1) {
      C3DMatrix4x4MakeAxisAngleRotation(&v61, &v66, y * -0.00872664626);
    }
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      float32x4_t v56 = 0u;
      long long v57 = 0u;
      C3DMatrix4x4MakeAxisAngleRotation(&v56, (float32x4_t *)&v65, x * -0.00872664626);
      double v47 = C3DMatrix4x4Mult((uint64_t)&v61, &v56, &v61);
    }
  }
  else
  {
    float32x4_t v30 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), (int8x16_t)v29, 0xCuLL), v23), v29, v22);
    float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL);
    int32x4_t v32 = (int32x4_t)vmulq_f32(v30, v30);
    v32.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), *(float32x2_t *)v32.i8)).u32[0];
    float32x2_t v33 = vrsqrte_f32((float32x2_t)v32.u32[0]);
    float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v33, v33)));
    float32x4_t v35 = vmulq_n_f32(v31, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v34, v34))).f32[0]);
    long long v64 = 0u;
    long long v65 = (__int128)v35;
    long long v62 = 0u;
    long long v63 = 0u;
    float32x4_t v61 = 0u;
    double v36 = 0.0;
    if (a5 == 2) {
      double v37 = 0.0;
    }
    else {
      double v37 = y;
    }
    if (a5 == 1) {
      double v37 = y;
    }
    else {
      double v36 = x;
    }
    *(float *)&double v37 = v37;
    v38.f32[0] = v36;
    float32x4_t v39 = vmlsq_lane_f32(vmulq_n_f32(v29, v38.f32[0]), v35, *(float32x2_t *)&v37, 0);
    int32x4_t v40 = (int32x4_t)vmulq_f32(v39, v39);
    v40.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1))).u32[0];
    float32x2_t v41 = vrsqrte_f32((float32x2_t)v40.u32[0]);
    float32x2_t v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v41, v41)));
    float32x4_t v43 = vmulq_n_f32(v39, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v42, v42))).f32[0]);
    float32x4_t v44 = vmlaq_f32(vmulq_f32(v22, vnegq_f32(v43)), v21, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v43, (int32x4_t)v43), (int8x16_t)v43, 0xCuLL));
    float32x4_t v45 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v44, (int32x4_t)v44), (int8x16_t)v44, 0xCuLL);
    int32x4_t v46 = (int32x4_t)vmulq_f32(v44, v44);
    v46.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v46.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v46, 2), *(float32x2_t *)v46.i8)).u32[0];
    *(float32x2_t *)v43.f32 = vrsqrte_f32((float32x2_t)v46.u32[0]);
    *(float32x2_t *)v43.f32 = vmul_f32(*(float32x2_t *)v43.f32, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(*(float32x2_t *)v43.f32, *(float32x2_t *)v43.f32)));
    float32x4_t v56 = vmulq_n_f32(v45, vmul_f32(*(float32x2_t *)v43.f32, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(*(float32x2_t *)v43.f32, *(float32x2_t *)v43.f32))).f32[0]);
    v38.i32[1] = LODWORD(v37);
    C3DMatrix4x4MakeAxisAngleRotation(&v61, &v56, sqrtf(vaddv_f32(vmul_f32(v38, v38))) * 0.00872664626);
  }
  if (a4 == 2)
  {
    [(SCNCameraControlEventHandler *)self invalidateCameraTarget];
  }
  else
  {
    float32x4_t v60 = vsubq_f32(v60, v49);
    float32x4_t v56 = v61;
    long long v57 = v62;
    long long v58 = v63;
    long long v59 = v64;
    *(double *)v48.i64 = C3DVector3Rotate((float32x2_t *)&v56, v60);
    float32x4_t v60 = vaddq_f32(v49, v48);
  }
  C3DMatrix4x4Mult3x3((uint64_t)p_initialMatrix, &v61, (uint64_t)&v61);
  long long v58 = 0u;
  long long v59 = 0u;
  float32x4_t v56 = 0u;
  long long v57 = 0u;
  memset(v55, 0, sizeof(v55));
  C3DMatrix4x4MakeTranslation((uint64_t)v55, (__n128 *)&v60);
  C3DMatrix4x4Mult((uint64_t)&v61, v55, &v56);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&v56, &v51);
  v50[0] = v51;
  v50[1] = v52;
  v50[2] = v53;
  v50[3] = v54;
  [v10 setTransform:v50];
}

- (void)_translateTo:(CGPoint)a3
{
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  memset(v33, 0, sizeof(v33));
  *(uint64_t *)((char *)v32.i64 + 4) = 0;
  v32.i32[0] = 0;
  __n128 v31 = 0uLL;
  double v4 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  [(SCNView *)[(SCNEventHandler *)self view] bounds];
  float64_t v13 = v5;
  [(SCNView *)[(SCNEventHandler *)self view] bounds];
  v6.f64[0] = v13;
  v6.f64[1] = v7;
  __n128 v14 = (__n128)vcvt_hight_f32_f64(0, v6);
  v6.f64[0] = x;
  v6.f64[1] = y;
  _C3DHitTestComputeHitSegment((float32x4_t *)[v4 nodeRef], (uint64_t)-[SCNScene sceneRef](-[SCNView scene](-[SCNEventHandler view](self, "view"), "scene"), "sceneRef"), &v35, &v34, v14, COERCE_DOUBLE(vcvt_f32_f64(v6)));
  if (v8)
  {
    *(uint64_t *)((char *)v30.i64 + 4) = 0;
    v30.i32[0] = 0;
    long long v9 = (float32x4_t *)objc_msgSend(v4, "nodeRef", *(double *)C3DRay3MakeWithSegment(v33, &v34).i64);
    C3DNodeGetWorldPosition(v9, (__n128 *)&v30);
    float32x4_t v34 = v30;
    [(SCNCameraControlEventHandler *)self frontVector];
    float32x4_t v29 = v10;
    C3DPlaneMakeWithVectors(&v31, (float32x4_t *)self->_clickOrigin, &v29);
    if (C3DIntersectionRay3Plane((uint64_t)v33, (float *)&v31, &v32))
    {
      float32x4_t v28 = vnegq_f32(vsubq_f32(v32, *(float32x4_t *)self->_clickOrigin));
      long long v26 = 0u;
      long long v27 = 0u;
      *(_OWORD *)__n128 buf = 0u;
      long long v25 = 0u;
      memset(v23, 0, sizeof(v23));
      C3DMatrix4x4MakeTranslation((uint64_t)buf, (__n128 *)&v28);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v11 = (void *)[v4 presentationNode];
      if (v11)
      {
        [v11 transform];
      }
      else
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
      }
      memset(v18, 0, sizeof(v18));
      C3DMatrix4x4FromSCNMatrix4(v18, (uint64_t)&v19);
      C3DMatrix4x4Mult((uint64_t)v18, (float32x4_t *)buf, v23);
      C3DMatrix4x4ToSCNMatrix4((uint64_t)v23, &v19);
      v17[0] = v19;
      v17[1] = v20;
      v17[2] = v21;
      v17[3] = v22;
      [v4 setTransform:v17];
      [(SCNCameraControlEventHandler *)self focusNode:0];
    }
    else
    {
      long long v12 = scn_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__n128 buf = 0;
        _os_log_impl(&dword_20B249000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Warning: no C3DIntersectionRay3Plane", buf, 2u);
      }
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  pressGesture = self->_pressGesture;
  if (pressGesture == a3 || pressGesture == a4) {
    return 1;
  }
  tapGesture = self->_tapGesture;
  panGesture = self->_panGesture;
  if (tapGesture == a3 && (panGesture == a4 || self->_pinchGesture == a4 || self->_rotateGesture == a4)) {
    return 1;
  }
  if (tapGesture == a4 && panGesture == a3) {
    return 1;
  }
  return tapGesture == a4 && self->_pinchGesture == a3;
}

- (id)gestureRecognizers
{
  tapGesture = self->_tapGesture;
  if (tapGesture)
  {
    pressGesture = self->_pressGesture;
  }
  else
  {
    pressGesture = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C7A0]);
    [(UIGestureRecognizer *)pressGesture setMinimumPressDuration:0.0];
    double v5 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1CA70]);
    float64x2_t v6 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C860]);
    float64_t v7 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C838]);
    int v8 = (UIGestureRecognizer *)objc_alloc_init(MEMORY[0x263F1C900]);
    [(UIGestureRecognizer *)v5 setNumberOfTapsRequired:2];
    [(UIGestureRecognizer *)v6 addTarget:self action:sel__handlePinch_];
    [(UIGestureRecognizer *)v7 addTarget:self action:sel__handlePan_];
    [(UIGestureRecognizer *)pressGesture addTarget:self action:sel__handlePress_];
    [(UIGestureRecognizer *)v8 addTarget:self action:sel__handleRotation_];
    [(UIGestureRecognizer *)v5 addTarget:self action:sel__handleDoubleTap_];
    [(UIGestureRecognizer *)pressGesture setDelegate:self];
    [(UIGestureRecognizer *)v7 setDelegate:self];
    [(UIGestureRecognizer *)v6 setDelegate:self];
    [(UIGestureRecognizer *)v8 setDelegate:self];
    [(UIGestureRecognizer *)v5 setDelegate:self];
    [(UIGestureRecognizer *)v6 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v8 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v7 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)pressGesture setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v6 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v8 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v7 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)pressGesture setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v6 setEnabled:[(SCNCameraControlEventHandler *)self enabled]];
    [(UIGestureRecognizer *)v8 setEnabled:[(SCNCameraControlEventHandler *)self enabled]];
    [(UIGestureRecognizer *)v7 setEnabled:[(SCNCameraControlEventHandler *)self enabled]];
    [(UIGestureRecognizer *)v5 setEnabled:[(SCNCameraControlEventHandler *)self enabled]];
    [(UIGestureRecognizer *)pressGesture setEnabled:[(SCNCameraControlEventHandler *)self enabled]];
    self->_tapGesture = v5;
    self->_panGesture = v7;
    self->_pinchGesture = v6;
    self->_rotateGesture = v8;
    self->_pressGesture = pressGesture;
    tapGesture = self->_tapGesture;
  }
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", pressGesture, self->_panGesture, tapGesture, self->_pinchGesture, self->_rotateGesture, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_handlePinch:(id)a3
{
  if (*((unsigned char *)self + 312)) {
    [(SCNCameraControlEventHandler *)self pinchWithGestureRecognizer:a3];
  }
}

- (void)_handlePan:(id)a3
{
  if (*((unsigned char *)self + 312)) {
    [(SCNCameraControlEventHandler *)self panWithGestureRecognizer:a3];
  }
}

- (void)_handleRotation:(id)a3
{
  if (*((unsigned char *)self + 312)) {
    [(SCNCameraControlEventHandler *)self rotateWithGestureRecognizer:a3];
  }
}

- (void)_handleDoubleTap:(id)a3
{
  if (*((unsigned char *)self + 312))
  {
    unsigned __int32 v3 = [(SCNEventHandler *)self view];
    [(SCNView *)v3 switchToNextCamera];
  }
}

- (void)beginGesture:(id)a3
{
  [(SCNCameraControlEventHandler *)self _setInertiaRunning:0];
  self->_isDraggingWithOneFinger = 0;
  self->_lastGestureFingerCount = 0;
  if ([a3 numberOfTouches])
  {
    objc_msgSend(a3, "locationOfTouch:inView:", 0, -[SCNEventHandler view](self, "view"));
    double v6 = v5;
    double v8 = v7;
    [(SCNView *)[(SCNEventHandler *)self view] bounds];
    double v10 = v9 - v8;
  }
  else
  {
    double v10 = 0.0;
    double v6 = 0.0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_roll = 0.0;
    -[SCNCameraControlEventHandler _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v10);
    long long v11 = *(_OWORD *)&self->_initialMatrix.components[12];
    long long v13 = *(_OWORD *)self->_initialMatrix.components;
    long long v12 = *(_OWORD *)&self->_initialMatrix.components[4];
    *(_OWORD *)&self->_initialMatrixForRoll.components[9] = *(_OWORD *)&self->_initialMatrix.components[8];
    *(_OWORD *)&self->_initialMatrixForRoll.components[13] = v11;
    *(_OWORD *)&self->_initialMatrixForRoll.components[1] = v13;
    *(_OWORD *)&self->_initialMatrixForRoll.components[5] = v12;
    self->_browseMode = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[SCNCameraControlEventHandler _startBrowsingIfNeeded:](self, "_startBrowsingIfNeeded:", v6, v10);
      if ((*((unsigned char *)self + 312) & 0x20) != 0)
      {
        self->_browseMode = 4;
        -[SCNCameraControlEventHandler _beginTranslateAtLocation:](self, "_beginTranslateAtLocation:", v6, v10);
      }
      self->_browseMode = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_initialZoom = self->_zoomFactor;
      }
    }
  }
}

- (void)rotateWithGestureRecognizer:(id)a3
{
  [(SCNCameraControlEventHandler *)self _setInertiaRunning:0];
  *((unsigned char *)self + 313) &= ~1u;
  uint64_t v5 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view"), "renderer"), "pointOfView");
  if (v5)
  {
    double v6 = (void *)v5;
    memset(v13, 0, sizeof(v13));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    [a3 rotation];
    *(float *)&double v7 = v7;
    self->_roll = *(float *)&v7;
    C3DMatrix4x4MakeRotationZ(v13, *(float *)&v7);
    C3DMatrix4x4Mult((uint64_t)v13, (float32x4_t *)&self->_initialMatrixForRoll.components[1], v13);
    C3DMatrix4x4ToSCNMatrix4((uint64_t)v13, &v9);
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
    [v6 setTransform:v8];
  }
}

- (void)pinchWithGestureRecognizer:(id)a3
{
  double v4 = fmax(self->_initialZoom, 0.001);
  [a3 scale];
  double v6 = v5 * v4;

  [(SCNCameraControlEventHandler *)self setZoomFactor:v6];
}

- (void)panWithGestureRecognizer:(id)a3
{
  uint64_t v5 = [a3 numberOfTouches];
  if (self->_browseMode != 3)
  {
    uint64_t v6 = v5;
    if ([a3 state] == 3)
    {
      if (self->_isDraggingWithOneFinger)
      {
        objc_msgSend(a3, "velocityInView:", -[SCNEventHandler view](self, "view"));
        -[SCNCameraControlEventHandler endDraggingWithVelocity:](self, "endDraggingWithVelocity:");
      }
    }
    else
    {
      objc_msgSend(a3, "translationInView:", -[SCNEventHandler view](self, "view"));
      switch(v6)
      {
        case 3:
          double v13 = -v8;
          if (self->_lastGestureFingerCount != 3)
          {
            [(SCNCameraControlEventHandler *)self beginGesture:a3];
            self->_lastGestureFingerCount = 3;
          }
          [(SCNCameraControlEventHandler *)self _translationCoef];
          v14.n128_u64[0] = 0;
          memset(v30, 0, sizeof(v30));
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          *(float *)&unsigned int v16 = v13 * v15;
          v14.n128_u64[1] = v16;
          __n128 v25 = v14;
          C3DMatrix4x4MakeTranslation((uint64_t)v30, &v25);
          __int32 v17 = objc_msgSend(-[SCNView renderer](-[SCNEventHandler view](self, "view", C3DMatrix4x4Mult((uint64_t)v30, (float32x4_t *)&self->_initialMatrix, v30)), "renderer"), "pointOfView");
          C3DMatrix4x4ToSCNMatrix4((uint64_t)v30, &v26);
          v24[0] = v26;
          v24[1] = v27;
          v24[2] = v28;
          v24[3] = v29;
          [v17 setTransform:v24];
          break;
        case 2:
          if (self->_lastGestureFingerCount != 2)
          {
            [(SCNCameraControlEventHandler *)self beginGesture:a3];
            self->_lastGestureFingerCount = 2;
          }
          objc_msgSend(a3, "locationOfTouch:inView:", 0, -[SCNEventHandler view](self, "view"));
          double v19 = v18;
          double v21 = v20;
          [(SCNView *)[(SCNEventHandler *)self view] bounds];
          -[SCNCameraControlEventHandler _translateTo:](self, "_translateTo:", v19, v22 - v21);
          break;
        case 1:
          if (self->_lastGestureFingerCount == 1)
          {
            self->_isDraggingWithOneFinger = 1;
            double v9 = v7 + v7;
            int64_t browseMode = self->_browseMode;
            unint64_t stickyAxis = self->_stickyAxis;
            double v12 = v8 * -2.0;
            -[SCNCameraControlEventHandler _rotateWithDrag:mode:stickyAxis:](self, "_rotateWithDrag:mode:stickyAxis:", browseMode, stickyAxis, v9, v12);
          }
          else
          {
            [(SCNCameraControlEventHandler *)self beginGesture:a3];
            float32x4_t v23 = [(SCNEventHandler *)self view];
            objc_msgSend(a3, "setTranslation:inView:", v23, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
            self->_lastGestureFingerCount = 1;
          }
          break;
      }
    }
  }
}

@end
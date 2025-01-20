@interface AVTAvatarEnvironment
- (BOOL)faceIsFullyVisible;
- (BOOL)showReticle;
- (NSString)framingMode;
- (SCNNode)currentPointOfView;
- (SCNNode)defaultPointOfView;
- (SCNNode)environmentNode;
- (float)fadeFactor;
- (id)defaultEnvironmentNode;
- (id)initAndInstallInScene:(id)a3 renderer:(id)a4;
- (id)pointOfViewForFramingMode:(id)a3;
- (void)avatarDidChange:(id)a3 presentationConfiguration:(id)a4;
- (void)configureARCameraForFaceTracking;
- (void)configureARCameraForReticle;
- (void)defaultEnvironmentNode;
- (void)didSnapshot;
- (void)hideTrackingLossIndicator;
- (void)setEnablePhysicsSimulation:(BOOL)a3;
- (void)setFadeFactor:(float)a3;
- (void)setFramingMode:(id)a3;
- (void)setFramingMode:(id)a3 animationDuration:(double)a4;
- (void)setFramingModeForcingPointOfViewUpdate:(id)a3;
- (void)setShowReticle:(BOOL)a3;
- (void)showTrackingLossIndicator;
- (void)updateCustomCameras;
- (void)updatePointOfViewFromFramingMode;
- (void)updateSpecializedLighting;
- (void)updateWithPresentationConfiguration:(id)a3;
- (void)willSnapshot;
@end

@implementation AVTAvatarEnvironment

- (id)defaultEnvironmentNode
{
  v2 = +[AVTResourceLocator sharedResourceLocator]();
  v3 = -[AVTResourceLocator pathForEnvironmentResource:ofType:isDirectory:](v2, @"environment", @"scn", 0);
  v4 = [NSURL fileURLWithPath:v3 isDirectory:0];
  id v18 = 0;
  v5 = objc_msgSend(MEMORY[0x263F16AD8], "avt_rootNodeForSceneAtURL:options:error:", v4, 0, &v18);
  id v6 = v18;
  if (v6)
  {
    v7 = avt_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(AVTAvatarEnvironment *)(uint64_t)v3 defaultEnvironmentNode];
    }
  }
  v8 = -[AVTResourceLocator pathForMemojiResource:ofType:isDirectory:](v2, @"cameras", @"scn", 0);
  if (v8)
  {
    v9 = [NSURL fileURLWithPath:v8 isDirectory:0];
    id v17 = 0;
    v10 = objc_msgSend(MEMORY[0x263F16AD8], "avt_nodeNamed:forSceneAtURL:options:error:", @"cameras", v9, 0, &v17);
    id v11 = v17;
    if (v11)
    {
      v12 = avt_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(AVTAvatarEnvironment *)(uint64_t)v8 defaultEnvironmentNode];
      }
    }
    if (v10) {
      [v5 addChildNode:v10];
    }
  }
  v13 = [v5 childNodeWithName:@"cameraWatchface" recursively:1];
  v14 = [v13 camera];
  [v14 setXFov:0.0];

  v15 = [v5 clone];
  [v15 setName:@"environment"];

  return v15;
}

- (id)initAndInstallInScene:(id)a3 renderer:(id)a4
{
  v58[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)AVTAvatarEnvironment;
  v8 = [(AVTAvatarEnvironment *)&v56 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    objc_storeWeak((id *)&v9->_renderer, v7);
    uint64_t v10 = [(AVTAvatarEnvironment *)v9 defaultEnvironmentNode];
    environmentNode = v9->_environmentNode;
    v9->_environmentNode = (SCNNode *)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_scene);
    v13 = [WeakRetained rootNode];
    [v13 addChildNode:v9->_environmentNode];

    uint64_t v14 = [(SCNNode *)v9->_environmentNode childNodeWithName:@"camera" recursively:1];
    animojiCamera = v9->_animojiCamera;
    v9->_animojiCamera = (SCNNode *)v14;

    uint64_t v16 = [(SCNNode *)v9->_environmentNode childNodeWithName:@"cameras" recursively:1];
    memojiCameraGroup = v9->_memojiCameraGroup;
    v9->_memojiCameraGroup = (SCNNode *)v16;

    uint64_t v18 = [(SCNNode *)v9->_environmentNode childNodeWithName:@"lighting" recursively:1];
    defaultLightingNode = v9->_defaultLightingNode;
    v9->_defaultLightingNode = (SCNNode *)v18;

    objc_storeStrong((id *)&v9->_defaultPointOfView, v9->_animojiCamera);
    v20 = [(SCNNode *)v9->_defaultPointOfView camera];
    [v20 setXFov:0.0];

    uint64_t v21 = [(SCNNode *)v9->_defaultPointOfView name];
    framingMode = v9->_framingMode;
    v9->_framingMode = (NSString *)v21;

    defaultPointOfView = v9->_defaultPointOfView;
    id v24 = objc_loadWeakRetained((id *)&v9->_renderer);
    [v24 setPointOfView:defaultPointOfView];

    if (!v9->_defaultPointOfView)
    {
      v25 = avt_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[AVTAvatarEnvironment initAndInstallInScene:renderer:](v25);
      }
    }
    uint64_t v26 = [MEMORY[0x263F16A98] node];
    whitePlane = v9->_whitePlane;
    v9->_whitePlane = (SCNNode *)v26;

    v28 = [MEMORY[0x263F16AC0] planeWithWidth:10.0 height:10.0];
    [(SCNNode *)v9->_whitePlane setGeometry:v28];

    uint64_t v29 = *MEMORY[0x263F16B98];
    v30 = [(SCNNode *)v9->_whitePlane geometry];
    v31 = [v30 firstMaterial];
    [v31 setLightingModelName:v29];

    [(SCNNode *)v9->_whitePlane setSimdPosition:0.0];
    [(SCNNode *)v9->_whitePlane setRenderingOrder:1000];
    [(SCNNode *)v9->_whitePlane setOpacity:0.0];
    uint64_t v32 = [MEMORY[0x263F16A98] node];
    trackingLostIndicator = v9->_trackingLostIndicator;
    v9->_trackingLostIndicator = (SCNNode *)v32;

    v34 = [MEMORY[0x263F16AC0] planeWithWidth:1.0 height:1.0];
    [(SCNNode *)v9->_trackingLostIndicator setGeometry:v34];

    v35 = [(SCNNode *)v9->_trackingLostIndicator geometry];
    v36 = [v35 firstMaterial];
    [v36 setWritesToDepthBuffer:0];

    v37 = [(SCNNode *)v9->_trackingLostIndicator geometry];
    v38 = [v37 firstMaterial];
    [v38 setReadsFromDepthBuffer:0];

    v39 = [(SCNNode *)v9->_trackingLostIndicator geometry];
    v40 = [v39 firstMaterial];
    [v40 setLightingModelName:v29];

    v41 = [MEMORY[0x263F1C550] redColor];
    v42 = [(SCNNode *)v9->_trackingLostIndicator geometry];
    v43 = [v42 firstMaterial];
    v44 = [v43 diffuse];
    [v44 setContents:v41];

    [(SCNNode *)v9->_trackingLostIndicator setSimdPosition:3.52429132e-14];
    [(SCNNode *)v9->_trackingLostIndicator setRenderingOrder:100];
    [(SCNNode *)v9->_trackingLostIndicator setOpacity:0.0];
    v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v46 = [v45 pathForResource:@"trackingIndicator" ofType:@"shader"];

    v47 = [NSString stringWithContentsOfFile:v46 encoding:4 error:0];
    v48 = [(SCNNode *)v9->_trackingLostIndicator geometry];
    uint64_t v57 = *MEMORY[0x263F16BD8];
    v58[0] = v47;
    v49 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
    [v48 setShaderModifiers:v49];

    [(SCNNode *)v9->_defaultPointOfView addChildNode:v9->_trackingLostIndicator];
    uint64_t v50 = [(SCNNode *)v9->_defaultPointOfView copy];
    arModeCamera = v9->_arModeCamera;
    v9->_arModeCamera = (SCNNode *)v50;

    v52 = [(SCNNode *)v9->_defaultPointOfView camera];
    v53 = (void *)[v52 copy];
    [(SCNNode *)v9->_arModeCamera setCamera:v53];

    [(SCNNode *)v9->_arModeCamera setName:@"cameraARMode"];
    v54 = [(SCNNode *)v9->_arModeCamera camera];
    [v54 setName:@"cameraARMode"];

    [(SCNNode *)v9->_environmentNode addChildNode:v9->_arModeCamera];
    [(AVTAvatarEnvironment *)v9 configureARCameraForReticle];
    [(SCNNode *)v9->_defaultPointOfView addChildNode:v9->_whitePlane];
  }
  return v9;
}

- (SCNNode)environmentNode
{
  return self->_environmentNode;
}

- (SCNNode)defaultPointOfView
{
  return self->_defaultPointOfView;
}

- (SCNNode)currentPointOfView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
  v3 = [WeakRetained pointOfView];

  return (SCNNode *)v3;
}

- (void)avatarDidChange:(id)a3 presentationConfiguration:(id)a4
{
  id obj = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_avatar, obj);
    [(AVTAvatarEnvironment *)self updateCustomCameras];
    [(AVTAvatarEnvironment *)self updateSpecializedLighting];
  }
  [(AVTAvatarEnvironment *)self updateWithPresentationConfiguration:v6];
  [(AVTAvatarEnvironment *)self updatePointOfViewFromFramingMode];
}

- (void)updateCustomCameras
{
  [(SCNNode *)self->_customCamera removeFromParentNode];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  v4 = [WeakRetained cameraNode];
  v5 = [v4 clone];
  customCamera = self->_customCamera;
  self->_customCamera = v5;

  if (self->_customCamera)
  {
    environmentNode = self->_environmentNode;
    -[SCNNode addChildNode:](environmentNode, "addChildNode:");
  }
}

- (void)updateSpecializedLighting
{
  [(SCNNode *)self->_specializedLightingNode removeFromParentNode];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  v4 = [WeakRetained lightingNode];
  v5 = [v4 clone];
  specializedLightingNode = self->_specializedLightingNode;
  self->_specializedLightingNode = v5;

  id v7 = self->_specializedLightingNode;
  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_scene);
    v9 = [v8 rootNode];
    [v9 addChildNode:self->_specializedLightingNode];
  }
  defaultLightingNode = self->_defaultLightingNode;
  [(SCNNode *)defaultLightingNode setHidden:v7 != 0];
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (void)setFramingMode:(id)a3
{
}

- (void)setFramingMode:(id)a3 animationDuration:(double)a4
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_framingMode, "isEqualToString:"))
  {
    id v6 = (NSString *)[v8 copy];
    framingMode = self->_framingMode;
    self->_framingMode = v6;

    if (a4 <= 0.0)
    {
      [(AVTAvatarEnvironment *)self updatePointOfViewFromFramingMode];
    }
    else
    {
      [MEMORY[0x263F16B08] begin];
      [MEMORY[0x263F16B08] setAnimationDuration:a4];
      [(AVTAvatarEnvironment *)self updatePointOfViewFromFramingMode];
      [MEMORY[0x263F16B08] commit];
    }
  }
}

- (void)setFramingModeForcingPointOfViewUpdate:(id)a3
{
  v4 = (NSString *)[a3 copy];
  framingMode = self->_framingMode;
  self->_framingMode = v4;

  [(AVTAvatarEnvironment *)self updatePointOfViewFromFramingMode];
}

- (id)pointOfViewForFramingMode:(id)a3
{
  v4 = (__CFString *)a3;
  if ([(__CFString *)v4 isEqualToString:@"cameraGrid"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {

      v4 = @"cameraGridMemoji";
    }
  }
  id v7 = [(SCNNode *)self->_environmentNode childNodeWithName:v4 recursively:1];

  return v7;
}

- (void)updatePointOfViewFromFramingMode
{
  id v8 = [a2 name];
  OUTLINED_FUNCTION_0(&dword_20B819000, v2, v3, "Error: Failed to find the \"%@\" camera, using the default one instead (\"%@\")", v4, v5, v6, v7, 2u);
}

- (void)updateWithPresentationConfiguration:(id)a3
{
  p_avatar = &self->_avatar;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_avatar);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (updateWithPresentationConfiguration__onceToken != -1) {
    dispatch_once(&updateWithPresentationConfiguration__onceToken, &__block_literal_global_13);
  }
  char v8 = isKindOfClass & 1;
  char v9 = [v5 usesAR];

  environmentNode = self->_environmentNode;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__AVTAvatarEnvironment_updateWithPresentationConfiguration___block_invoke_2;
  v15[3] = &__block_descriptor_34_e21_v24__0__SCNNode_8_B16l;
  char v16 = v8;
  char v17 = v9;
  [(SCNNode *)environmentNode enumerateHierarchyUsingBlock:v15];
  id v11 = objc_loadWeakRetained((id *)p_avatar);
  v12 = [v11 rootJointNode];
  v13 = [v12 parentNode];
  uint64_t v14 = [(SCNNode *)self->_arModeCamera parentNode];
  objc_msgSend(v13, "simdConvertTransform:toNode:", v14, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
  -[SCNNode setSimdTransform:](self->_arModeCamera, "setSimdTransform:");
}

void __60__AVTAvatarEnvironment_updateWithPresentationConfiguration___block_invoke()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1)
  {
    updateWithPresentationConfiguration__shadowSamples = 1;
    updateWithPresentationConfiguration__shadowSize = 1;
  }
}

void __60__AVTAvatarEnvironment_updateWithPresentationConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 light];
  id v9 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v4 = [v3 type];
    int v5 = [v4 isEqualToString:*MEMORY[0x263F16B70]];

    if (v5)
    {
      [v9 setCastsShadow:1];
      double v6 = 512.0;
      if (updateWithPresentationConfiguration__shadowSize) {
        double v6 = 1024.0;
      }
      objc_msgSend(v9, "setShadowMapSize:", v6, v6);
      if (updateWithPresentationConfiguration__shadowSamples) {
        uint64_t v7 = 32;
      }
      else {
        uint64_t v7 = 16;
      }
      [v9 setShadowSampleCount:v7];
      [v9 setShadowRadius:0.0];
      double v8 = 0.1;
      if (!*(unsigned char *)(a1 + 33)) {
        double v8 = 1.0;
      }
      [v9 setZNear:v8];
      [v9 setZFar:100.0];
      [v9 setAutomaticallyAdjustsShadowProjection:*(unsigned __int8 *)(a1 + 33)];
      [v9 setOrthographicScale:25.0];
    }
  }
  else
  {
    [v3 setCastsShadow:0];
  }
}

- (void)setEnablePhysicsSimulation:(BOOL)a3
{
  BOOL v3 = a3;
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v14 = [WeakRetained physicsWorld];

  [v14 speed];
  if ((((v6 != 4.0) ^ v3) & 1) == 0)
  {
    double v7 = 0.0;
    if (v3) {
      double v7 = 4.0;
    }
    [v14 setSpeed:v7];
    if (v3)
    {
      id v8 = objc_loadWeakRetained((id *)p_scene);
      uint64_t v9 = [v8 isPaused] ^ 1;
      id v10 = objc_loadWeakRetained((id *)p_scene);
      [v10 setPaused:v9];

      id v11 = objc_loadWeakRetained((id *)p_scene);
      uint64_t v12 = [v11 isPaused] ^ 1;
      id v13 = objc_loadWeakRetained((id *)p_scene);
      [v13 setPaused:v12];
    }
  }
}

- (void)setShowReticle:(BOOL)a3
{
  if (self->_trackingLostIndicatorVisible != a3)
  {
    if (a3)
    {
      [(AVTAvatarEnvironment *)self configureARCameraForReticle];
      [(AVTAvatarEnvironment *)self showTrackingLossIndicator];
    }
    else
    {
      [(AVTAvatarEnvironment *)self configureARCameraForFaceTracking];
      [(AVTAvatarEnvironment *)self hideTrackingLossIndicator];
    }
  }
}

- (BOOL)showReticle
{
  return self->_trackingLostIndicatorVisible;
}

- (void)showTrackingLossIndicator
{
  self->_trackingLostIndicatorVisible = 1;
  BOOL v3 = [(SCNNode *)self->_trackingLostIndicator geometry];
  [v3 setValue:&unk_26C0630A8 forKey:@"hold"];

  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.23];
  uint64_t v4 = [(SCNNode *)self->_trackingLostIndicator geometry];
  [v4 setValue:&unk_26C0630B8 forKey:@"hold"];

  [(SCNNode *)self->_trackingLostIndicator setOpacity:1.0];
  [MEMORY[0x263F16B08] commit];
  id v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"scale"];
  [v12 setDuration:30.0];
  int v5 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", 0.00718750152);
  [v12 setFromValue:v5];

  __asm { FMOV            V0.4S, #1.0 }
  id v11 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *(double *)&_Q0);
  [v12 setToValue:v11];

  [(SCNNode *)self->_trackingLostIndicator addAnimation:v12 forKey:@"pulse"];
}

- (void)hideTrackingLossIndicator
{
  self->_trackingLostIndicatorVisible = 0;
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.23];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke;
  v4[3] = &unk_26401F6E0;
  v4[4] = self;
  [MEMORY[0x263F16B08] setCompletionBlock:v4];
  BOOL v3 = [(SCNNode *)self->_trackingLostIndicator geometry];
  [v3 setValue:&unk_26C0630A8 forKey:@"hold"];

  [MEMORY[0x263F16B08] commit];
}

uint64_t __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.3];
  uint64_t v2 = (void *)MEMORY[0x263F16B08];
  BOOL v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB0]];
  [v2 setAnimationTimingFunction:v3];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke_2;
  v5[3] = &unk_26401F6E0;
  v5[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F16B08] setCompletionBlock:v5];
  [*(id *)(*(void *)(a1 + 32) + 32) setOpacity:0.0];
  return [MEMORY[0x263F16B08] commit];
}

uint64_t __49__AVTAvatarEnvironment_hideTrackingLossIndicator__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40)) {
    return [*(id *)(v1 + 32) removeAnimationForKey:@"pulse"];
  }
  return result;
}

- (void)configureARCameraForFaceTracking
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatar);
  BOOL v3 = [WeakRetained rootJointNode];
  uint64_t v4 = [v3 parentNode];
  int v5 = [(SCNNode *)self->_arModeCamera parentNode];
  objc_msgSend(v4, "simdConvertTransform:toNode:", v5, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
  -[SCNNode setSimdTransform:](self->_arModeCamera, "setSimdTransform:");
}

- (void)configureARCameraForReticle
{
  id v6 = [(SCNNode *)self->_defaultPointOfView camera];
  BOOL v3 = [(SCNNode *)self->_arModeCamera camera];
  [v6 focalLength];
  objc_msgSend(v3, "setFocalLength:");
  [v6 sensorHeight];
  objc_msgSend(v3, "setSensorHeight:");
  objc_msgSend(v3, "setProjectionDirection:", objc_msgSend(v6, "projectionDirection"));
  defaultPointOfView = self->_defaultPointOfView;
  int v5 = [(SCNNode *)self->_arModeCamera parentNode];
  -[SCNNode simdConvertTransform:toNode:](defaultPointOfView, "simdConvertTransform:toNode:", v5, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
  -[SCNNode setSimdTransform:](self->_arModeCamera, "setSimdTransform:");
}

- (void)willSnapshot
{
  [(SCNNode *)self->_trackingLostIndicator setHidden:1];
  uint64_t v2 = (void *)MEMORY[0x263F16B08];
  [v2 flush];
}

- (void)didSnapshot
{
  [(SCNNode *)self->_trackingLostIndicator setHidden:0];
  uint64_t v2 = (void *)MEMORY[0x263F16B08];
  [v2 flush];
}

- (void)setFadeFactor:(float)a3
{
}

- (float)fadeFactor
{
  [(SCNNode *)self->_whitePlane opacity];
  return v2;
}

- (BOOL)faceIsFullyVisible
{
  double v2 = [(SCNNode *)self->_whitePlane presentationNode];
  [v2 opacity];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLightingNode, 0);
  objc_storeStrong((id *)&self->_specializedLightingNode, 0);
  objc_storeStrong((id *)&self->_arModeCamera, 0);
  objc_storeStrong((id *)&self->_customCamera, 0);
  objc_storeStrong((id *)&self->_memojiCameraGroup, 0);
  objc_storeStrong((id *)&self->_animojiCamera, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
  objc_storeStrong((id *)&self->_defaultPointOfView, 0);
  objc_storeStrong((id *)&self->_environmentNode, 0);
  objc_storeStrong((id *)&self->_whitePlane, 0);
  objc_storeStrong((id *)&self->_shadowPlaneMaterial, 0);
  objc_storeStrong((id *)&self->_trackingLostIndicator, 0);
  objc_destroyWeak((id *)&self->_avatar);
  objc_destroyWeak((id *)&self->_renderer);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)defaultEnvironmentNode
{
  double v2 = [a2 description];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0(&dword_20B819000, v3, v4, "Error: could not load scene at %@ with error: %@", v5, v6, v7, v8, v9);
}

- (void)initAndInstallInScene:(os_log_t)log renderer:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Could not find the default point of view", v1, 2u);
}

@end
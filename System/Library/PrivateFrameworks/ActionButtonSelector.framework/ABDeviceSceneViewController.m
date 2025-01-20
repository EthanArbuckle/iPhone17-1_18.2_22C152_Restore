@interface ABDeviceSceneViewController
- (BOOL)isScenePresented;
- (CATransform3D)actionButtonPerspectiveTransform;
- (NSNumber)scenePresentationBarrier;
- (double)actionButtonScreenScale;
- (double)actionButtonTranslationWithPressProgress:(uint64_t)a1;
- (id)delegate;
- (id)setDelegate:(id *)result;
- (void)_didPresentFrame;
- (void)_renderWithTargetTimestamp:(double)a3 duration:(double)a4 renderInputs:(ABDeviceSceneRenderInputs *)a5;
- (void)_setupSceneIfNeeded;
- (void)_subscribeToFramePresentationIfNeeded;
- (void)devicePerspectiveTransform;
- (void)renderWithTargetTimestamp:(double)a3 duration:(double)a4 renderInputs:;
- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5;
- (void)setScenePresentationBarrier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation ABDeviceSceneViewController

- (void)viewDidLoad
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)ABDeviceSceneViewController;
  [(ABDeviceSceneViewController *)&v7 viewDidLoad];
  v3 = ABLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[ABDeviceSceneResourceLoader sharedLoader]();
    BOOL v5 = -[ABDeviceSceneResourceLoader areResourcesLoaded]((BOOL)v4);
    v6 = @"no";
    if (v5) {
      v6 = @"yes";
    }
    *(_DWORD *)buf = 138543618;
    v9 = self;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_24741F000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) loading the view; scene resources are ready: %{public}@",
      buf,
      0x16u);
  }
  [(ABDeviceSceneViewController *)self _setupSceneIfNeeded];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ABDeviceSceneViewController;
  [(ABDeviceSceneViewController *)&v7 viewIsAppearing:a3];
  v4 = NSNumber;
  BOOL v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  [(ABDeviceSceneViewController *)self setScenePresentationBarrier:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABDeviceSceneViewController;
  [(ABDeviceSceneViewController *)&v4 viewDidAppear:a3];
  [(ABDeviceSceneViewController *)self setScenePresentationBarrier:0];
}

- (void)renderWithTargetTimestamp:(double)a3 duration:(double)a4 renderInputs:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v8 = +[ABDeviceSceneResourceLoader sharedLoader]();
    BOOL v9 = -[ABDeviceSceneResourceLoader areResourcesLoaded]((BOOL)v8);

    if (v9)
    {
      __int16 v10 = *(void **)(a2 + 168);
      uint64_t v23 = *(void *)(a2 + 160);
      long long v11 = *(_OWORD *)(a2 + 144);
      v22[8] = *(_OWORD *)(a2 + 128);
      v22[9] = v11;
      long long v12 = *(_OWORD *)(a2 + 80);
      v22[4] = *(_OWORD *)(a2 + 64);
      v22[5] = v12;
      long long v13 = *(_OWORD *)(a2 + 112);
      v22[6] = *(_OWORD *)(a2 + 96);
      v22[7] = v13;
      long long v14 = *(_OWORD *)(a2 + 16);
      v22[0] = *(_OWORD *)a2;
      v22[1] = v14;
      long long v15 = *(_OWORD *)(a2 + 48);
      v22[2] = *(_OWORD *)(a2 + 32);
      v22[3] = v15;
      id v16 = v10;
      uint64_t v17 = *(void *)(a2 + 176);
      id v24 = v16;
      uint64_t v25 = v17;
      long long v26 = *(_OWORD *)(a2 + 184);
      [a1 _renderWithTargetTimestamp:v22 duration:a3 renderInputs:a4];
    }
    else if (!a1[142])
    {
      v18 = ABLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = a1;
        _os_log_impl(&dword_24741F000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) view controller will initiate resource loading", buf, 0xCu);
      }

      v19 = +[ABDeviceSceneResourceLoader sharedLoader]();
      uint64_t v20 = -[ABDeviceSceneResourceLoader loadResourcesWithCompletion:]((uint64_t)v19, &__block_literal_global_0);
      v21 = (void *)a1[142];
      a1[142] = v20;
    }
  }
}

void __79__ABDeviceSceneViewController_renderWithTargetTimestamp_duration_renderInputs___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = ABLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [NSNumber numberWithBool:a2];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_24741F000, v3, OS_LOG_TYPE_DEFAULT, "Finished resource loading, isSuccess: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)devicePerspectiveTransform
{
  if (a1)
  {
    objc_super v4 = [a1[122] pointOfView];
    memset(&v20, 0, sizeof(v20));
    int v5 = [v4 camera];
    v6 = v5;
    if (v5) {
      [v5 projectionTransform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }

    memset(&v19, 0, sizeof(v19));
    if (v4) {
      [v4 worldTransform];
    }
    memset(&v18, 0, sizeof(v18));
    SCNMatrix4 m = v19;
    SCNMatrix4Invert(&v18, &m);
    memset(&m, 0, sizeof(m));
    uint64_t v7 = [a1 view];
    [v7 bounds];
    float v9 = v8 * 0.5;
    __int16 v10 = [a1 view];
    [v10 bounds];
    memset(&b.m22, 0, 40);
    float v12 = v11 * 0.5;
    *(_OWORD *)&b.m12 = 0u;
    b.m11 = v9;
    b.m22 = v12;
    b.m33 = -1.0;
    b.m44 = 1.0;
    SCNMatrix4 a = v20;
    SCNMatrix4Mult(&m, &a, &b);

    memset(&a, 0, sizeof(a));
    SCNMatrix4 v14 = v18;
    SCNMatrix4 v13 = m;
    SCNMatrix4Mult(&a, &v14, &v13);
    SCNMatrix4 v14 = a;
    CATransform3DFromSCNMatrix4((float32x2_t *)&v14, (float64x2_t *)a2);
  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

- (CATransform3D)actionButtonPerspectiveTransform
{
  if (result)
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    long long v15 = 0uLL;
    long long v16 = 0uLL;
    float64x2_t v13 = 0uLL;
    long long v14 = 0uLL;
    CGFloat m41 = result[7].m41;
    if (m41 == 0.0) {
      memset(v12, 0, sizeof(v12));
    }
    else {
      [*(id *)&m41 transform];
    }
    CATransform3DFromSCNMatrix4((float32x2_t *)v12, &v13);
    memset(&v11, 0, sizeof(v11));
    double v4 = ABDegreesToRadians(-90.0);
    CATransform3DMakeRotation(&v11, v4, 0.0, 1.0, 0.0);
    double v5 = ABButtonOffsetFromDeviceCenter();
    memset(&v10, 0, sizeof(v10));
    CATransform3DMakeTranslation(&v10, v5, v6, 0.0);
    CATransform3D a = v11;
    CATransform3D v7 = v10;
    CATransform3DConcat(&v9, &a, &v7);
    *(_OWORD *)&a.m31 = v17;
    *(_OWORD *)&a.m33 = v18;
    *(_OWORD *)&a.CGFloat m41 = v19;
    *(_OWORD *)&a.m43 = v20;
    *(float64x2_t *)&a.m11 = v13;
    *(_OWORD *)&a.m13 = v14;
    *(_OWORD *)&a.m21 = v15;
    *(_OWORD *)&a.m23 = v16;
    return CATransform3DConcat((CATransform3D *)a2, &v9, &a);
  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0uLL;
    *(_OWORD *)(a2 + 112) = 0uLL;
    *(_OWORD *)(a2 + 64) = 0uLL;
    *(_OWORD *)(a2 + 80) = 0uLL;
    *(_OWORD *)(a2 + 32) = 0uLL;
    *(_OWORD *)(a2 + 48) = 0uLL;
    *(_OWORD *)a2 = 0uLL;
    *(_OWORD *)(a2 + 16) = 0uLL;
  }
  return result;
}

- (double)actionButtonTranslationWithPressProgress:(uint64_t)a1
{
  if (a1) {
    return -(ABButtonPressDepth() * a2);
  }
  else {
    return 0.0;
  }
}

- (double)actionButtonScreenScale
{
  if (a1) {
    return ABButtonScreenScale();
  }
  else {
    return 0.0;
  }
}

- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ABDeviceSceneViewController_renderer_willRenderScene_atTime___block_invoke;
  block[3] = &unk_265212E38;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__ABDeviceSceneViewController_renderer_willRenderScene_atTime___block_invoke(uint64_t a1)
{
  -[ABDeviceSceneViewController delegate](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 deviceSceneViewControllerWillRenderScene:*(void *)(a1 + 32)];
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 144);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_setupSceneIfNeeded
{
  if (!self->_sceneView)
  {
    v3 = +[ABDeviceSceneResourceLoader sharedLoader]();
    BOOL v4 = -[ABDeviceSceneResourceLoader areResourcesLoaded]((BOOL)v3);

    if (v4)
    {
      p_sceneModel = &self->_sceneModel;
      CGFloat v6 = +[ABDeviceSceneResourceLoader sharedLoader]();
      [(ABDeviceSceneResourceLoader *)(uint64_t)v6 sceneModel];
      __move_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((uint64_t)&self->_sceneModel, v18);

      CATransform3D v7 = +[ABDeviceSceneResourceLoader sharedLoader]();
      -[ABDeviceSceneResourceLoader sceneView]((uint64_t)v7);
      double v8 = (SCNView *)objc_claimAutoreleasedReturnValue();
      sceneView = self->_sceneView;
      self->_sceneView = v8;

      CATransform3D v10 = [(ABDeviceSceneViewController *)self view];
      [v10 addSubview:self->_sceneView];

      CATransform3D v11 = [(ABDeviceSceneViewController *)self view];
      [v11 frame];
      -[SCNView setBounds:](self->_sceneView, "setBounds:");

      [(SCNView *)self->_sceneView setAutoresizingMask:18];
      [(SCNView *)self->_sceneView setDelegate:self];
      float v12 = (ABDeviceDisplayView *)objc_opt_new();
      displayView = self->_displayView;
      self->_displayView = v12;

      [(ABDeviceDisplayView *)self->_displayView sizeToFit];
      long long v14 = [(ABDeviceDisplayView *)self->_displayView layer];
      long long v15 = [(SCNNode *)p_sceneModel->displayNode geometry];
      long long v16 = [v15 firstMaterial];
      long long v17 = [v16 emission];
      [v17 setContents:v14];
    }
  }
}

- (void)_renderWithTargetTimestamp:(double)a3 duration:(double)a4 renderInputs:(ABDeviceSceneRenderInputs *)a5
{
  [(ABDeviceSceneViewController *)self _setupSceneIfNeeded];
  CATransform3D v7 = [(SCNView *)self->_sceneView pointOfView];
  double v8 = [v7 camera];

  [v8 setFocusDistance:a5->cameraAndLight.focusDistance];
  [v8 setFocalLength:a5->cameraAndLight.focalLength];
  [v8 setFStop:a5->cameraAndLight.fStop];
  [v8 setApertureBladeCount:(uint64_t)a5->cameraAndLight.apertureBladeCount];
  double lightingIntensity = a5->cameraAndLight.lightingIntensity;
  CATransform3D v10 = [(SCNScene *)self->_sceneModel.scene lightingEnvironment];
  [v10 setIntensity:lightingIntensity];

  double buttonPressProgress = a5->buttonPressProgress;
  double v12 = ABButtonPressDepth();
  capNode = self->_sceneModel.buttonModel.capNode;
  *(float *)&double buttonPressProgress = -(v12 * buttonPressProgress);
  uint64_t v51 = 0;
  uint64_t v50 = 0;
  int v49 = 1065353216;
  int v52 = 1065353216;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 1065353216;
  int v56 = LODWORD(buttonPressProgress);
  uint64_t v57 = 0;
  int v58 = 1065353216;
  [(SCNNode *)capNode setTransform:&v49];
  sidesNode = self->_sceneModel.buttonModel.sidesNode;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  int v39 = 1065353216;
  int v42 = 1065353216;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 1065353216;
  int v46 = LODWORD(buttonPressProgress);
  uint64_t v47 = 0;
  int v48 = 1065353216;
  [(SCNNode *)sidesNode setTransform:&v39];
  long long v15 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m21;
  *(_OWORD *)&a.m11 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m11;
  *(_OWORD *)&a.m21 = v15;
  long long v16 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m41;
  *(_OWORD *)&a.m31 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m31;
  *(_OWORD *)&a.CGFloat m41 = v16;
  *(void *)&b.m14 = 0;
  *(void *)&b.m12 = 0;
  b.m11 = 1.0;
  b.m22 = 1.0;
  *(void *)&b.m31 = 0;
  *(void *)&b.m23 = 0;
  *(void *)&b.m33 = 1065353216;
  b.CGFloat m41 = *(float *)&buttonPressProgress;
  b.m43 = 0.0;
  b.m42 = 0.0;
  b.m44 = 1.0;
  SCNMatrix4Mult(&v38, &a, &b);
  capNodeHighlight = self->_sceneModel.buttonModel.capNodeHighlight;
  SCNMatrix4 v36 = v38;
  [(SCNNode *)capNodeHighlight setTransform:&v36];
  long long v18 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m21;
  *(_OWORD *)&a.m11 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m11;
  *(_OWORD *)&a.m21 = v18;
  long long v19 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m41;
  *(_OWORD *)&a.m31 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m31;
  *(_OWORD *)&a.CGFloat m41 = v19;
  *(void *)&b.m14 = 0;
  *(void *)&b.m12 = 0;
  b.m11 = 1.0;
  b.m22 = 1.0;
  *(void *)&b.m31 = 0;
  *(void *)&b.m23 = 0;
  *(void *)&b.m33 = 1065353216;
  b.CGFloat m41 = *(float *)&buttonPressProgress;
  b.m43 = 0.0;
  b.m42 = 0.0;
  b.m44 = 1.0;
  SCNMatrix4Mult(&v35, &a, &b);
  sidesNodeHighlight = self->_sceneModel.buttonModel.sidesNodeHighlight;
  SCNMatrix4 v34 = v35;
  [(SCNNode *)sidesNodeHighlight setTransform:&v34];
  long long v21 = *(_OWORD *)&a5->modelTransform.m33;
  long long v29 = *(_OWORD *)&a5->modelTransform.m31;
  long long v30 = v21;
  long long v22 = *(_OWORD *)&a5->modelTransform.m43;
  long long v31 = *(_OWORD *)&a5->modelTransform.m41;
  long long v32 = v22;
  long long v23 = *(_OWORD *)&a5->modelTransform.m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a5->modelTransform.m11;
  *(_OWORD *)&a.m21 = v23;
  long long v24 = *(_OWORD *)&a5->modelTransform.m23;
  *(_OWORD *)&a.m31 = *(_OWORD *)&a5->modelTransform.m21;
  *(_OWORD *)&a.CGFloat m41 = v24;
  SCNMatrix4FromCATransform3D((float64x2_t *)&a, v33);
  deviceNode = self->_sceneModel.deviceNode;
  v27[0] = v33[0];
  v27[1] = v33[1];
  v27[2] = v33[2];
  v27[3] = v33[3];
  [(SCNNode *)deviceNode setTransform:v27];
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)v26, (uint64_t)&self->_sceneModel.buttonModel);
  ABDeviceSceneButtonModelSetColor(v26, a5->buttonHighlight.color, a5->buttonHighlight.opacity);
  -[ABDeviceDisplayView setIslandMode:](&self->_displayView->super.super.super.isa, a5->islandMode);
  [(ABDeviceSceneViewController *)self _subscribeToFramePresentationIfNeeded];
}

- (void)_subscribeToFramePresentationIfNeeded
{
  if (!self->_isScenePresented)
  {
    objc_initWeak(&location, self);
    sceneView = self->_sceneView;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __68__ABDeviceSceneViewController__subscribeToFramePresentationIfNeeded__block_invoke;
    v4[3] = &unk_265212F20;
    objc_copyWeak(&v5, &location);
    [(SCNView *)sceneView _addGPUFramePresentedHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __68__ABDeviceSceneViewController__subscribeToFramePresentationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didPresentFrame];
}

- (void)_didPresentFrame
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = ABLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    float64x2_t v13 = self;
    _os_log_impl(&dword_24741F000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) did present frame", buf, 0xCu);
  }

  BOOL v4 = [(ABDeviceSceneViewController *)self scenePresentationBarrier];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 <= 0.0
    || ([MEMORY[0x263EFF910] now],
        CATransform3D v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceReferenceDate],
        double v9 = v8 - v6,
        v7,
        v9 <= 0.2))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__ABDeviceSceneViewController__didPresentFrame__block_invoke;
    block[3] = &unk_265212E38;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    CATransform3D v10 = ABLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      float64x2_t v13 = self;
      _os_log_impl(&dword_24741F000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) delaying scene presentation", buf, 0xCu);
    }

    [(ABDeviceSceneViewController *)self setScenePresentationBarrier:0];
  }
}

uint64_t __47__ABDeviceSceneViewController__didPresentFrame__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1144) = 1;
  return result;
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 144, a2);
  }
  return result;
}

- (BOOL)isScenePresented
{
  if (result) {
    return *(unsigned char *)(result + 1144) != 0;
  }
  return result;
}

- (NSNumber)scenePresentationBarrier
{
  return (NSNumber *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setScenePresentationBarrier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePresentationBarrier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_resourceLoadingToken, 0);
  objc_storeStrong((id *)&self->_displayView, 0);
  __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72((id *)&self->_sceneModel.scene);

  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end
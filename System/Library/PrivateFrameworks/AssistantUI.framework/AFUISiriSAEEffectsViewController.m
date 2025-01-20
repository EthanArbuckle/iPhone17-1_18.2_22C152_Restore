@interface AFUISiriSAEEffectsViewController
+ (CGRect)normalizedCameraButtonRect;
+ (CGRect)normalizedLockButtonRect;
+ (id)sharedSiriUISettingsDefaults;
- (AFUISiriSAEEffectsViewController)initWithDelegate:(id)a3 instrumentationHandler:(id)a4;
- (AFUISiriSAEEffectsViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_supportsSAE;
- (BOOL)_supportsShockwaveForInvocationType:(int64_t)a3;
- (BOOL)forceOrb;
- (NSMutableArray)dismissalHandlers;
- (NSMutableArray)presentationHandlers;
- (SRUIFPlatformHostingInstrumentationHandler)viewHostingInstrumentationHandler;
- (SUIAShockwaveViewController)shockwaveViewController;
- (SUICEdgeLightMaskMetalLayer)edgeLightMaskMetalLayer;
- (UIView)eyesFreeView;
- (_UIIntelligenceSystemLightView)systemLightView;
- (id)_createEdgeLightMaskMetalLayer;
- (id)_createShockwaveViewControllerForInvocationType:(int64_t)a3;
- (id)_createSystemLightView;
- (int64_t)shockwaveDisablement;
- (int64_t)state;
- (unint64_t)edgeLightBurstStartPosition;
- (unint64_t)supportedInterfaceOrientations;
- (void)_beginAnimatingEdgeLight;
- (void)_handleDismissalRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handlePresentationRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_setUpEffectsIfNeededForInvocationType:(int64_t)a3;
- (void)_transitionToShockwaveState:(int64_t)a3;
- (void)_updateEdgeLightMaskMetalLayerFramerate;
- (void)beginAnimatingEffectsForInvocationType:(int64_t)a3;
- (void)beginHintingForInvocationType:(int64_t)a3;
- (void)insertEyesFreeView:(id)a3;
- (void)requestDismissalWithHandler:(id)a3;
- (void)requestPresentationWithHandler:(id)a3;
- (void)setEdgeLightBurstStartPosition:(unint64_t)a3;
- (void)setEdgeLightMaskMetalLayer:(id)a3;
- (void)setEyesFreeView:(id)a3;
- (void)setShockwaveViewController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSystemLightView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AFUISiriSAEEffectsViewController

+ (id)sharedSiriUISettingsDefaults
{
  if (sharedSiriUISettingsDefaults_onceToken != -1) {
    dispatch_once(&sharedSiriUISettingsDefaults_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedSiriUISettingsDefaults_defaults;

  return v2;
}

uint64_t __64__AFUISiriSAEEffectsViewController_sharedSiriUISettingsDefaults__block_invoke()
{
  sharedSiriUISettingsDefaults_defaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];

  return MEMORY[0x270F9A758]();
}

+ (CGRect)normalizedLockButtonRect
{
  if (normalizedLockButtonRect_once != -1) {
    dispatch_once(&normalizedLockButtonRect_once, &__block_literal_global_39);
  }
  double v3 = *((double *)&normalizedLockButtonRect_normalizedLockButtonRect + 1);
  double v2 = *(double *)&normalizedLockButtonRect_normalizedLockButtonRect;
  double v4 = *(double *)&qword_267F9CBA0;
  double v5 = unk_267F9CBA8;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke()
{
  normalizedLockButtonRect_normalizedLockButtonRect = AFUISiriSAEEffectsViewControllerFallbackNormalizedLockButtonRect;
  *(_OWORD *)&qword_267F9CBA0 = unk_2230F5CC0;
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    CFDataRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v1);
      CGFloat v5 = *(double *)BytePtr;
      CGFloat v4 = *((double *)BytePtr + 1);
      CGFloat v7 = *((double *)BytePtr + 2);
      CGFloat v6 = *((double *)BytePtr + 3);
      CFRelease(v1);
      v24.origin.x = v5;
      v24.origin.y = v4;
      v24.size.width = v7;
      v24.size.height = v6;
      if (CGRectIsNull(v24)
        || (v25.origin.x = v5,
            v25.origin.y = v4,
            v25.size.width = v7,
            v25.size.height = v6,
            CGRectEqualToRect(v25, *MEMORY[0x263F001A8])))
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke_cold_2();
        }
      }
      else
      {
        v26.origin.x = v5;
        v26.origin.y = v4;
        v26.size.width = v7;
        v26.size.height = v6;
        CGRectGetMinX(v26);
        v27.origin.x = v5;
        v27.origin.y = v4;
        v27.size.width = v7;
        v27.size.height = v6;
        CGRectGetMinY(v27);
        v28.origin.x = v5;
        v28.origin.y = v4;
        v28.size.width = v7;
        v28.size.height = v6;
        CGRectGetWidth(v28);
        v29.origin.x = v5;
        v29.origin.y = v4;
        v29.size.width = v7;
        v29.size.height = v6;
        CGRectGetHeight(v29);
        *(CGFloat *)&normalizedLockButtonRect_normalizedLockButtonRect = v5;
        *((CGFloat *)&normalizedLockButtonRect_normalizedLockButtonRect + 1) = v4;
        qword_267F9CBA0 = *(void *)&v7;
        unk_267F9CBA8 = *(void *)&v6;
      }
    }
    else
    {
      CFRelease(v1);
      v16 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke_cold_3(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

+ (CGRect)normalizedCameraButtonRect
{
  if (normalizedCameraButtonRect_once != -1) {
    dispatch_once(&normalizedCameraButtonRect_once, &__block_literal_global_44);
  }
  double v3 = *((double *)&normalizedCameraButtonRect_normalizedCameraButtonRect + 1);
  double v2 = *(double *)&normalizedCameraButtonRect_normalizedCameraButtonRect;
  double v4 = *(double *)&qword_267F9CBC8;
  double v5 = unk_267F9CBD0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke()
{
  normalizedCameraButtonRect_normalizedCameraButtonRect = AFUISiriSAEEffectsViewControllerFallbackNormalizedCameraButtonRect;
  *(_OWORD *)&qword_267F9CBC8 = unk_2230F5CE0;
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    CFDataRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v1);
      CGFloat v5 = *(double *)BytePtr;
      CGFloat v4 = *((double *)BytePtr + 1);
      CGFloat v7 = *((double *)BytePtr + 2);
      CGFloat v6 = *((double *)BytePtr + 3);
      CFRelease(v1);
      v24.origin.x = v5;
      v24.origin.y = v4;
      v24.size.width = v7;
      v24.size.height = v6;
      if (CGRectIsNull(v24)
        || (v25.origin.x = v5,
            v25.origin.y = v4,
            v25.size.width = v7,
            v25.size.height = v6,
            CGRectEqualToRect(v25, *MEMORY[0x263F001A8])))
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke_cold_2();
        }
      }
      else
      {
        v26.origin.x = v5;
        v26.origin.y = v4;
        v26.size.width = v7;
        v26.size.height = v6;
        CGRectGetMinX(v26);
        v27.origin.x = v5;
        v27.origin.y = v4;
        v27.size.width = v7;
        v27.size.height = v6;
        CGRectGetMinY(v27);
        v28.origin.x = v5;
        v28.origin.y = v4;
        v28.size.width = v7;
        v28.size.height = v6;
        CGRectGetWidth(v28);
        v29.origin.x = v5;
        v29.origin.y = v4;
        v29.size.width = v7;
        v29.size.height = v6;
        CGRectGetHeight(v29);
        *(CGFloat *)&normalizedCameraButtonRect_normalizedCameraButtonRect = v5;
        *((CGFloat *)&normalizedCameraButtonRect_normalizedCameraButtonRect + 1) = v4;
        qword_267F9CBC8 = *(void *)&v7;
        unk_267F9CBD0 = *(void *)&v6;
      }
    }
    else
    {
      CFRelease(v1);
      v16 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke_cold_3(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (AFUISiriSAEEffectsViewController)initWithDelegate:(id)a3 instrumentationHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)AFUISiriSAEEffectsViewController;
  v8 = [(AFUISiriSAEEffectsViewController *)&v21 initWithNibName:0 bundle:0];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_viewHostingInstrumentationHandler, a4);
    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    presentationHandlers = v9->_presentationHandlers;
    v9->_presentationHandlers = v10;

    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dismissalHandlers = v9->_dismissalHandlers;
    v9->_dismissalHandlers = v12;

    uint64_t v14 = +[AFUISiriSAEEffectsViewController sharedSiriUISettingsDefaults];
    v9->_forceOrb = [v14 integerForKey:@"ForceOrbGraphic"] != 0;
    v9->_shockwaveDisablement = [v14 integerForKey:@"DisableShockwave"];
    v9->_edgeLightBurstStartPosition = 0;
    uint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v9 selector:sel__thermalStateDidChange_ name:*MEMORY[0x263F08458] object:0];

    v16 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      BOOL v18 = [(AFUISiriSAEEffectsViewController *)v9 _supportsSAE];
      BOOL v19 = [(AFUISiriSAEEffectsViewController *)v9 _supportsShockwaveForInvocationType:0];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[AFUISiriSAEEffectsViewController initWithDelegate:instrumentationHandler:]";
      __int16 v24 = 1024;
      BOOL v25 = v18;
      __int16 v26 = 1024;
      BOOL v27 = v19;
      _os_log_impl(&dword_223099000, v17, OS_LOG_TYPE_DEFAULT, "%s #effects initializing with supportsSAE: %{BOOL}u; supportsShockwave: %{BOOL}u",
        buf,
        0x18u);
    }
  }

  return v9;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AFUISiriSAEEffectsViewController;
  [(AFUISiriSAEEffectsViewController *)&v8 viewDidLoad];
  double v3 = [(AFUISiriSAEEffectsViewController *)self _createEdgeLightMaskMetalLayer];
  CGFloat v4 = [(AFUISiriSAEEffectsViewController *)self _createSystemLightView];
  CGFloat v5 = [v4 layer];
  [v5 addSublayer:v3];

  id v6 = [(AFUISiriSAEEffectsViewController *)self view];
  id v7 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v7];

  [v6 addSubview:v4];
  [(AFUISiriSAEEffectsViewController *)self setSystemLightView:v4];
  [(AFUISiriSAEEffectsViewController *)self setEdgeLightMaskMetalLayer:v3];
  [(AFUISiriSAEEffectsViewController *)self _updateEdgeLightMaskMetalLayerFramerate];
}

- (void)viewDidLayoutSubviews
{
  id v26 = [(AFUISiriSAEEffectsViewController *)self view];
  double v3 = [(AFUISiriSAEEffectsViewController *)self eyesFreeView];
  CGFloat v4 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];
  CGFloat v5 = [(AFUISiriSAEEffectsViewController *)self systemLightView];
  if (v4)
  {
    id v6 = [v4 view];
    [v26 bringSubviewToFront:v6];
  }
  [v26 bringSubviewToFront:v5];
  if (v3) {
    [v26 bringSubviewToFront:v3];
  }
  [v26 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
  uint64_t v15 = [v4 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  v16 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
  uint64_t v17 = [v16 superlayer];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  objc_msgSend(v16, "setFrame:", v19, v21, v23, v25);
}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)AFUISiriSAEEffectsViewController;
  [(AFUISiriSAEEffectsViewController *)&v9 viewIsAppearing:a3];
  CGFloat v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v11 = "-[AFUISiriSAEEffectsViewController viewIsAppearing:]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #effects is appearing", buf, 0xCu);
  }
  CGFloat v5 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
  id v6 = [(AFUISiriSAEEffectsViewController *)self view];
  double v7 = [v6 window];
  double v8 = [v7 screen];
  [v5 setScreen:v8];

  [(AFUISiriSAEEffectsViewController *)self setState:4];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriSAEEffectsViewController;
  [(AFUISiriSAEEffectsViewController *)&v5 viewDidAppear:a3];
  CGFloat v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v7 = "-[AFUISiriSAEEffectsViewController viewDidAppear:]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #effects did appear", buf, 0xCu);
  }
  [(AFUISiriSAEEffectsViewController *)self setState:5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriSAEEffectsViewController;
  [(AFUISiriSAEEffectsViewController *)&v5 viewWillDisappear:a3];
  CGFloat v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v7 = "-[AFUISiriSAEEffectsViewController viewWillDisappear:]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #effects will disappear", buf, 0xCu);
  }
  [(AFUISiriSAEEffectsViewController *)self setState:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriSAEEffectsViewController;
  [(AFUISiriSAEEffectsViewController *)&v5 viewDidDisappear:a3];
  CGFloat v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v7 = "-[AFUISiriSAEEffectsViewController viewDidDisappear:]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #effects did disappear", buf, 0xCu);
  }
  [(AFUISiriSAEEffectsViewController *)self setState:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return MEMORY[0x270F72808](self, a2);
}

- (void)requestPresentationWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [(AFUISiriSAEEffectsViewController *)self state];
  if (v5 < 3)
  {
    double v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v20 = "-[AFUISiriSAEEffectsViewController requestPresentationWithHandler:]";
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #effects currently dismissed or dismissing; requesting presentation",
        buf,
        0xCu);
    }
    double v11 = [(AFUISiriSAEEffectsViewController *)self presentationHandlers];
    uint64_t v12 = (void *)[v4 copy];
    double v13 = _Block_copy(v12);
    [v11 addObject:v13];

    [(AFUISiriSAEEffectsViewController *)self setState:3];
    double v14 = [(AFUISiriSAEEffectsViewController *)self delegate];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__AFUISiriSAEEffectsViewController_requestPresentationWithHandler___block_invoke;
    v16[3] = &unk_2646925C0;
    objc_copyWeak(&v17, &location);
    [v14 siriSAEEffectsViewController:self requestsPresentationWithHandler:v16];

    objc_destroyWeak(&v17);
  }
  else if (v5 - 3 >= 2)
  {
    if (v5 == 5)
    {
      uint64_t v15 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v20 = "-[AFUISiriSAEEffectsViewController requestPresentationWithHandler:]";
        _os_log_impl(&dword_223099000, v15, OS_LOG_TYPE_DEFAULT, "%s #effects already presented; completing immediately",
          buf,
          0xCu);
      }
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v20 = "-[AFUISiriSAEEffectsViewController requestPresentationWithHandler:]";
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #effects presentation request in progress; enqueuing handler",
        buf,
        0xCu);
    }
    double v7 = [(AFUISiriSAEEffectsViewController *)self presentationHandlers];
    uint64_t v8 = (void *)[v4 copy];
    objc_super v9 = _Block_copy(v8);
    [v7 addObject:v9];
  }
  objc_destroyWeak(&location);
}

void __67__AFUISiriSAEEffectsViewController_requestPresentationWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handlePresentationRequestDidCompleteWithSuccess:a2 error:v5];
}

- (void)requestDismissalWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  int64_t v5 = [(AFUISiriSAEEffectsViewController *)self state];
  if ((unint64_t)(v5 - 3) < 3)
  {
    double v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v20 = "-[AFUISiriSAEEffectsViewController requestDismissalWithHandler:]";
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #effects currently presented or presenting; requesting dismissal",
        buf,
        0xCu);
    }
    double v11 = [(AFUISiriSAEEffectsViewController *)self dismissalHandlers];
    uint64_t v12 = (void *)[v4 copy];
    double v13 = _Block_copy(v12);
    [v11 addObject:v13];

    [(AFUISiriSAEEffectsViewController *)self setState:2];
    double v14 = [(AFUISiriSAEEffectsViewController *)self delegate];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__AFUISiriSAEEffectsViewController_requestDismissalWithHandler___block_invoke;
    v16[3] = &unk_2646925C0;
    objc_copyWeak(&v17, &location);
    [v14 siriSAEEffectsViewController:self requestsDismissalWithHandler:v16];

    objc_destroyWeak(&v17);
  }
  else if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      uint64_t v15 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        double v20 = "-[AFUISiriSAEEffectsViewController requestDismissalWithHandler:]";
        _os_log_impl(&dword_223099000, v15, OS_LOG_TYPE_DEFAULT, "%s #effects already dismissed; completing immediately",
          buf,
          0xCu);
      }
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v20 = "-[AFUISiriSAEEffectsViewController requestDismissalWithHandler:]";
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #effects dismissal request in progress; enqueuing handler",
        buf,
        0xCu);
    }
    double v7 = [(AFUISiriSAEEffectsViewController *)self dismissalHandlers];
    uint64_t v8 = (void *)[v4 copy];
    objc_super v9 = _Block_copy(v8);
    [v7 addObject:v9];
  }
  objc_destroyWeak(&location);
}

void __64__AFUISiriSAEEffectsViewController_requestDismissalWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleDismissalRequestDidCompleteWithSuccess:a2 error:v5];
}

- (void)beginHintingForInvocationType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  -[AFUISiriSAEEffectsViewController _setUpEffectsIfNeededForInvocationType:](self, "_setUpEffectsIfNeededForInvocationType:");
  id v5 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];

  if (v5)
  {
    id v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 2) {
        double v7 = @".Unspecified";
      }
      else {
        double v7 = off_264692658[a3 - 1];
      }
      *(_DWORD *)double v10 = 136315394;
      *(void *)&v10[4] = "-[AFUISiriSAEEffectsViewController beginHintingForInvocationType:]";
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v7;
      uint64_t v8 = v6;
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #effects beginning hinting for %{public}@ invocation", v10, 0x16u);
    }
    objc_super v9 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];
    [v9 setState:1 animated:1 recommendedNextAction:0 completion:0];
  }
}

- (void)beginAnimatingEffectsForInvocationType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  -[AFUISiriSAEEffectsViewController _setUpEffectsIfNeededForInvocationType:](self, "_setUpEffectsIfNeededForInvocationType:");
  id v5 = [(AFUISiriSAEEffectsViewController *)self view];
  [v5 layoutIfNeeded];

  id v6 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];

  if (v6)
  {
    double v7 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];
    [v7 setState:1];

    objc_initWeak((id *)location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__AFUISiriSAEEffectsViewController_beginAnimatingEffectsForInvocationType___block_invoke;
    v11[3] = &unk_2646925E8;
    objc_copyWeak(v12, (id *)location);
    v12[1] = (id)a3;
    dispatch_async(MEMORY[0x263EF83A0], v11);
    objc_destroyWeak(v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 2) {
        objc_super v9 = @".Unspecified";
      }
      else {
        objc_super v9 = off_264692658[a3 - 1];
      }
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[AFUISiriSAEEffectsViewController beginAnimatingEffectsForInvocationType:]";
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      double v10 = v8;
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #effects animating edge light for %{public}@ invocation", location, 0x16u);
    }
    [(AFUISiriSAEEffectsViewController *)self _beginAnimatingEdgeLight];
  }
}

void __75__AFUISiriSAEEffectsViewController_beginAnimatingEffectsForInvocationType___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = *(void *)(a1 + 40) - 1;
      if (v4 > 2) {
        id v5 = @".Unspecified";
      }
      else {
        id v5 = off_264692658[v4];
      }
      *(_DWORD *)double v7 = 136315394;
      *(void *)&v7[4] = "-[AFUISiriSAEEffectsViewController beginAnimatingEffectsForInvocationType:]_block_invoke";
      *(_WORD *)&v7[12] = 2114;
      *(void *)&v7[14] = v5;
      id v6 = v3;
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #effects animating shockwave and edge light for %{public}@ invocation", v7, 0x16u);
    }
    objc_msgSend(WeakRetained, "_beginAnimatingEdgeLight", *(_OWORD *)v7, *(void *)&v7[16], v8);
    [WeakRetained _transitionToShockwaveState:2];
  }
}

- (void)insertEyesFreeView:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(AFUISiriSAEEffectsViewController *)self eyesFreeView];
  [v4 removeFromSuperview];

  [(AFUISiriSAEEffectsViewController *)self setEyesFreeView:0];
  if (v6)
  {
    id v5 = [(AFUISiriSAEEffectsViewController *)self view];
    [v5 addSubview:v6];
    [(AFUISiriSAEEffectsViewController *)self setEyesFreeView:v6];
    [v5 setNeedsLayout];
    [v5 layoutIfNeeded];
  }
}

- (BOOL)_supportsSAE
{
  if ([(AFUISiriSAEEffectsViewController *)self forceOrb]) {
    return 0;
  }
  double v3 = (void *)MEMORY[0x263F286B8];

  return [v3 isSAEEnabled];
}

- (BOOL)_supportsShockwaveForInvocationType:(int64_t)a3
{
  if ([(AFUISiriSAEEffectsViewController *)self shockwaveDisablement]) {
    return 0;
  }
  BOOL v5 = !UIAccessibilityIsReduceMotionEnabled();
  return a3 != 3 && v5;
}

- (id)_createEdgeLightMaskMetalLayer
{
  id v3 = objc_alloc_init(MEMORY[0x263F75420]);
  [v3 setName:@"EdgeLightMask"];
  [v3 setAllowsHitTesting:0];
  [v3 setCompositingFilter:*MEMORY[0x263F15D10]];
  [v3 setBurstStartPosition:0];
  if ([(AFUISiriSAEEffectsViewController *)self shockwaveDisablement] == 2)
  {
    LODWORD(v4) = 0.5;
    [v3 setBurstOpacity:v4];
  }

  return v3;
}

- (id)_createSystemLightView
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F83008]);
  id v3 = objc_msgSend(v2, "initWithFrame:preferringAudioReactivity:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v3 setUserInteractionEnabled:0];
  double v4 = [v3 layer];
  LODWORD(v5) = 2.0;
  [v4 setGain:v5];
  [v4 setOpaque:0];
  [v4 setAllowsHitTesting:0];
  id v6 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  double v7 = (void *)MEMORY[0x263F08D40];
  CAColorMatrixMakeMultiplyColor();
  uint64_t v8 = [v7 valueWithCAColorMatrix:&v11];
  [v6 setValue:v8 forKey:*MEMORY[0x263F15C30]];

  [v6 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15BE8]];
  v12[0] = v6;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v4 setFilters:v9];

  return v3;
}

- (id)_createShockwaveViewControllerForInvocationType:(int64_t)a3
{
  double v4 = [(AFUISiriSAEEffectsViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (a3 == 1)
  {
    id v13 = objc_alloc(MEMORY[0x263F7C470]);
    [(id)objc_opt_class() normalizedLockButtonRect];
    uint64_t v14 = objc_msgSend(v13, "initWithNormalizedButtonEdgeLocation:shockwaveViewBounds:");
  }
  else
  {
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F7C478]), "initWithEdge:shockwaveViewBounds:", 4, v6, v8, v10, v12);
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F7C488]) initWithStyle:v14];

  return v16;
}

- (void)_handlePresentationRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    double v19 = "-[AFUISiriSAEEffectsViewController _handlePresentationRequestDidCompleteWithSuccess:error:]";
    __int16 v20 = 1024;
    BOOL v21 = v4;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #effects presentation request completed; success: %{BOOL}u; error: %{public}@",
      buf,
      0x1Cu);
  }
  double v8 = [(AFUISiriSAEEffectsViewController *)self presentationHandlers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
  [v8 removeAllObjects];
}

- (void)_handleDismissalRequestDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    double v19 = "-[AFUISiriSAEEffectsViewController _handleDismissalRequestDidCompleteWithSuccess:error:]";
    __int16 v20 = 1024;
    BOOL v21 = v4;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #effects dismissal request completed; success: %{BOOL}u; error: %{public}@",
      buf,
      0x1Cu);
  }
  double v8 = [(AFUISiriSAEEffectsViewController *)self dismissalHandlers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
  [v8 removeAllObjects];
}

- (void)_setUpEffectsIfNeededForInvocationType:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(AFUISiriSAEEffectsViewController *)self _supportsSAE])
  {
    if ([(AFUISiriSAEEffectsViewController *)self _supportsShockwaveForInvocationType:a3])
    {
      double v5 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];

      if (!v5)
      {
        id v6 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(a3 - 1) > 2) {
            double v7 = @".Unspecified";
          }
          else {
            double v7 = off_264692658[a3 - 1];
          }
          *(_DWORD *)BOOL v21 = 136315394;
          *(void *)&v21[4] = "-[AFUISiriSAEEffectsViewController _setUpEffectsIfNeededForInvocationType:]";
          *(_WORD *)&v21[12] = 2114;
          *(void *)&v21[14] = v7;
          uint64_t v9 = v6;
          _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #effects setting up shockwave for %{public}@ invocation", v21, 0x16u);
        }
        uint64_t v10 = -[AFUISiriSAEEffectsViewController _createShockwaveViewControllerForInvocationType:](self, "_createShockwaveViewControllerForInvocationType:", a3, *(_OWORD *)v21, *(void *)&v21[16]);
        [(AFUISiriSAEEffectsViewController *)self bs_addChildViewController:v10];
        [(AFUISiriSAEEffectsViewController *)self setShockwaveViewController:v10];
      }
    }
    if (![(AFUISiriSAEEffectsViewController *)self edgeLightBurstStartPosition])
    {
      uint64_t v11 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        if ((unint64_t)(a3 - 1) > 2) {
          uint64_t v12 = @".Unspecified";
        }
        else {
          uint64_t v12 = off_264692658[a3 - 1];
        }
        *(_DWORD *)BOOL v21 = 136315394;
        *(void *)&v21[4] = "-[AFUISiriSAEEffectsViewController _setUpEffectsIfNeededForInvocationType:]";
        *(_WORD *)&v21[12] = 2114;
        *(void *)&v21[14] = v12;
        long long v13 = v11;
        _os_log_impl(&dword_223099000, v13, OS_LOG_TYPE_DEFAULT, "%s #effects setting up edge light for %{public}@ invocation", v21, 0x16u);
      }
      if (a3 != 1)
      {
        if (a3 == 3)
        {
          [(id)objc_opt_class() normalizedCameraButtonRect];
          CGFloat x = v23.origin.x;
          CGFloat y = v23.origin.y;
          CGFloat width = v23.size.width;
          CGFloat height = v23.size.height;
          double MidX = CGRectGetMidX(v23);
          v24.origin.CGFloat x = x;
          v24.origin.CGFloat y = y;
          v24.size.CGFloat width = width;
          v24.size.CGFloat height = height;
          double MidY = CGRectGetMidY(v24);
          long long v14 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
          objc_msgSend(v14, "setBurstStartPositionCustom:", MidX, MidY);
          a3 = 7;
          goto LABEL_25;
        }
        if (a3 == 2) {
          a3 = 2;
        }
        else {
          a3 = 0;
        }
      }
      long long v14 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
      [v14 setBurstStartPosition:a3];
LABEL_25:

      [(AFUISiriSAEEffectsViewController *)self setEdgeLightBurstStartPosition:a3];
    }
  }
  else
  {
    double v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v21 = 136315138;
      *(void *)&v21[4] = "-[AFUISiriSAEEffectsViewController _setUpEffectsIfNeededForInvocationType:]";
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #effects not setting up effects; SAE not supported",
        v21,
        0xCu);
    }
  }
}

- (void)_beginAnimatingEdgeLight
{
  objc_initWeak(&location, self);
  id v3 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__AFUISiriSAEEffectsViewController__beginAnimatingEdgeLight__block_invoke;
  v4[3] = &unk_2646919D8;
  objc_copyWeak(&v5, &location);
  [v3 animateOnWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__AFUISiriSAEEffectsViewController__beginAnimatingEdgeLight__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained viewHostingInstrumentationHandler];
    [v2 appearanceDidChange:1 machAbsoluteTime:mach_absolute_time()];

    id WeakRetained = v3;
  }
}

- (void)_transitionToShockwaveState:(int64_t)a3
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__AFUISiriSAEEffectsViewController__transitionToShockwaveState___block_invoke;
  aBlock[3] = &unk_264691B18;
  objc_copyWeak(&v14, &location);
  id v5 = _Block_copy(aBlock);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __64__AFUISiriSAEEffectsViewController__transitionToShockwaveState___block_invoke_2;
  uint64_t v11 = &unk_264692610;
  v12[1] = (id)a3;
  objc_copyWeak(v12, &location);
  id v6 = _Block_copy(&v8);
  double v7 = [(AFUISiriSAEEffectsViewController *)self shockwaveViewController];
  [v7 setState:a3 animated:a3 != 0 recommendedNextAction:v5 completion:v6];

  objc_destroyWeak(v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__AFUISiriSAEEffectsViewController__transitionToShockwaveState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transitionToShockwaveState:a2];
}

void __64__AFUISiriSAEEffectsViewController__transitionToShockwaveState___block_invoke_2(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 40);
  BOOL v2 = v1 > 5;
  uint64_t v3 = (1 << v1) & 0x2C;
  if (!v2 && v3 != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      id v6 = [WeakRetained shockwaveViewController];
      objc_msgSend(v7, "bs_removeChildViewController:", v6);

      [v7 setShockwaveViewController:0];
      id WeakRetained = v7;
    }
  }
}

- (void)_updateEdgeLightMaskMetalLayerFramerate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
  unint64_t v4 = [v3 thermalState];

  if (v4 < 2)
  {
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[AFUISiriSAEEffectsViewController _updateEdgeLightMaskMetalLayerFramerate]";
      _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #effects Edge Light Mask exiting performance mode due to decreased thermal pressure", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
    [v6 endReducedFramerateForPerformance];
    goto LABEL_9;
  }
  if (v4 - 2 <= 1)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[AFUISiriSAEEffectsViewController _updateEdgeLightMaskMetalLayerFramerate]";
      _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #effects Edge Light Mask entering performance mode due to thermal pressure", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [(AFUISiriSAEEffectsViewController *)self edgeLightMaskMetalLayer];
    [v6 startReducedFramerateForPerformance];
LABEL_9:

    return;
  }
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[AFUISiriSAEEffectsViewController _updateEdgeLightMaskMetalLayerFramerate]";
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #effects Edge Light Mask detected unknown thermal pressure", (uint8_t *)&v9, 0xCu);
  }
}

- (AFUISiriSAEEffectsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriSAEEffectsViewControllerDelegate *)WeakRetained;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SRUIFPlatformHostingInstrumentationHandler)viewHostingInstrumentationHandler
{
  return self->_viewHostingInstrumentationHandler;
}

- (NSMutableArray)presentationHandlers
{
  return self->_presentationHandlers;
}

- (NSMutableArray)dismissalHandlers
{
  return self->_dismissalHandlers;
}

- (BOOL)forceOrb
{
  return self->_forceOrb;
}

- (int64_t)shockwaveDisablement
{
  return self->_shockwaveDisablement;
}

- (unint64_t)edgeLightBurstStartPosition
{
  return self->_edgeLightBurstStartPosition;
}

- (void)setEdgeLightBurstStartPosition:(unint64_t)a3
{
  self->_edgeLightBurstStartPosition = a3;
}

- (UIView)eyesFreeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eyesFreeView);

  return (UIView *)WeakRetained;
}

- (void)setEyesFreeView:(id)a3
{
}

- (SUIAShockwaveViewController)shockwaveViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shockwaveViewController);

  return (SUIAShockwaveViewController *)WeakRetained;
}

- (void)setShockwaveViewController:(id)a3
{
}

- (_UIIntelligenceSystemLightView)systemLightView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemLightView);

  return (_UIIntelligenceSystemLightView *)WeakRetained;
}

- (void)setSystemLightView:(id)a3
{
}

- (SUICEdgeLightMaskMetalLayer)edgeLightMaskMetalLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightMaskMetalLayer);

  return (SUICEdgeLightMaskMetalLayer *)WeakRetained;
}

- (void)setEdgeLightMaskMetalLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_edgeLightMaskMetalLayer);
  objc_destroyWeak((id *)&self->_systemLightView);
  objc_destroyWeak((id *)&self->_shockwaveViewController);
  objc_destroyWeak((id *)&self->_eyesFreeView);
  objc_storeStrong((id *)&self->_dismissalHandlers, 0);
  objc_storeStrong((id *)&self->_presentationHandlers, 0);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_223099000, a1, a3, "%s #effects MobileGestalt returned NULL when querying side button rect", a5, a6, a7, a8, 2u);
}

void __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = v1;
  v10.origin.CGFloat x = OUTLINED_FUNCTION_1_1();
  uint64_t v3 = NSStringFromCGRect(v10);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_223099000, v4, v5, "%s #effects MobileGestalt returned bad rect (%{public}@) when querying side button rect", v6, v7, v8, v9, 2u);
}

void __60__AFUISiriSAEEffectsViewController_normalizedLockButtonRect__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_223099000, a1, a3, "%s #effects MobileGestalt returned unexpected data when querying side button rect", a5, a6, a7, a8, 2u);
}

void __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_223099000, a1, a3, "%s #effects MobileGestalt returned NULL when querying camera button rect", a5, a6, a7, a8, 2u);
}

void __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  id v2 = v1;
  v10.origin.CGFloat x = OUTLINED_FUNCTION_1_1();
  uint64_t v3 = NSStringFromCGRect(v10);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_223099000, v4, v5, "%s #effects MobileGestalt returned bad rect (%{public}@) when querying camera button rect", v6, v7, v8, v9, 2u);
}

void __62__AFUISiriSAEEffectsViewController_normalizedCameraButtonRect__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_223099000, a1, a3, "%s #effects MobileGestalt returned unexpected data when querying camera button rect", a5, a6, a7, a8, 2u);
}

@end
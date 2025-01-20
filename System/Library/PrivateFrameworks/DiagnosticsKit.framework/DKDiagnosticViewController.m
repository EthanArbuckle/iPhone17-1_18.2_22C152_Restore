@interface DKDiagnosticViewController
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isSetup;
- (BOOL)shouldPresentInHostApp;
- (BOOL)shouldShowPressHomeLabel;
- (CAGradientLayer)gradientLayer;
- (CXCallObserver)callObserver;
- (DKDiagnosticContext)context;
- (DKDiagnosticViewController)init;
- (DKMutableDiagnosticResult)result;
- (NSLock)finishedLock;
- (NSProgress)progress;
- (_UILegibilityLabel)pressHomeLabel;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)createGradientLayer;
- (void)dismissInHostApp;
- (void)displayPressHomeLabelFor:(double)a3;
- (void)monitorIncomingCall;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetGradientAndLabelBefore:(BOOL)a3;
- (void)setCallObserver:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFinishedLock:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setPressHomeLabel:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResult:(id)a3;
- (void)setSetup:(BOOL)a3;
- (void)setShouldShowPressHomeLabel:(BOOL)a3;
- (void)shouldShowViewControllerInHostApp:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DKDiagnosticViewController

- (DKDiagnosticViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticViewController;
  v2 = [(DKDiagnosticViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_cancelled = 0;
    v2->_setup = 0;
    v2->_finished = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    finishedLock = v3->_finishedLock;
    v3->_finishedLock = v4;

    v3->_shouldShowPressHomeLabel = 1;
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DKDiagnosticViewController;
  [(DKDiagnosticViewController *)&v5 viewDidLoad];
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DKDiagnosticViewController_viewDidLoad__block_invoke;
  block[3] = &unk_264E86710;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __41__DKDiagnosticViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayPressHomeLabelFor:4.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DKDiagnosticViewController;
  [(DKDiagnosticViewController *)&v10 viewWillAppear:a3];
  v4 = [(DKDiagnosticViewController *)self context];
  [v4 setIsPresentingView:1];

  if (CheckerBoardServicesLibraryCore())
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    objc_super v5 = (void *)getCBSUtilitiesClass_softClass;
    uint64_t v15 = getCBSUtilitiesClass_softClass;
    if (!getCBSUtilitiesClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getCBSUtilitiesClass_block_invoke;
      v11[3] = &unk_264E86770;
      v11[4] = &v12;
      __getCBSUtilitiesClass_block_invoke((uint64_t)v11);
      objc_super v5 = (void *)v13[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v12, 8);
    if ([v6 isCheckerBoardActive])
    {
      int v7 = [(DKDiagnosticViewController *)self prefersStatusBarHidden];
      v8 = [(DKDiagnosticViewController *)self context];
      v9 = v8;
      if (v7)
      {
        [v8 hideStatusBar];
      }
      else
      {
        [v8 showStatusBar];

        v9 = [(DKDiagnosticViewController *)self context];
        objc_msgSend(v9, "setStatusBarStyle:", -[DKDiagnosticViewController preferredStatusBarStyle](self, "preferredStatusBarStyle"));
      }
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DKDiagnosticViewController;
  [(DKDiagnosticViewController *)&v5 viewDidDisappear:a3];
  v4 = [(DKDiagnosticViewController *)self context];
  [v4 setIsPresentingView:0];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DKDiagnosticViewController;
  id v4 = a3;
  [(DKDiagnosticViewController *)&v7 beginRequestWithExtensionContext:v4];
  -[DKDiagnosticViewController setContext:](self, "setContext:", v4, v7.receiver, v7.super_class);

  id v5 = objc_alloc_init(MEMORY[0x263F08AB8]);
  [(DKDiagnosticViewController *)self setProgress:v5];

  id v6 = objc_alloc_init(DKMutableDiagnosticResult);
  [(DKDiagnosticViewController *)self setResult:v6];

  [(DKDiagnosticViewController *)self monitorIncomingCall];
}

- (void)setFinished:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DKDiagnosticViewController *)self finishedLock];
  [v5 lock];

  if (self->_finished || !v3)
  {
    id v12 = [(DKDiagnosticViewController *)self finishedLock];
    [v12 unlock];
  }
  else
  {
    self->_finished = 1;
    objc_super v7 = [(DKDiagnosticViewController *)self finishedLock];
    [v7 unlock];

    if ([(DKDiagnosticViewController *)self isSetup])
    {
      if (objc_opt_respondsToSelector()) {
        [(DKDiagnosticViewController *)self teardown];
      }
    }
    v8 = [(DKDiagnosticViewController *)self result];
    +[DKUtilities moveFilesToSharedContainerInMutableResult:v8];

    v9 = [(DKDiagnosticViewController *)self context];
    objc_super v10 = [(DKDiagnosticViewController *)self result];
    v11 = (void *)[v10 copy];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__DKDiagnosticViewController_setFinished___block_invoke;
    v13[3] = &unk_264E86710;
    v13[4] = self;
    [v9 completeWithDiagnosticResult:v11 completion:v13];
  }
}

void __42__DKDiagnosticViewController_setFinished___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) context];
  [v1 completeRequestReturningItems:MEMORY[0x263EFFA68] completionHandler:0];
}

- (void)setCancelled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);
}

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"fractionCompleted" options:1 context:ProgressObserverContext_0];
  [v5 addObserver:self forKeyPath:@"totalUnitCount" options:1 context:ProgressObserverContext_0];
  [v5 addObserver:self forKeyPath:@"indeterminate" options:1 context:ProgressObserverContext_0];
  [v5 addObserver:self forKeyPath:@"userInfo.NSProgressEstimatedTimeRemainingKey" options:1 context:ProgressObserverContext_0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)ProgressObserverContext_0 == a6)
  {
    objc_super v7 = [DKDiagnosticProgress alloc];
    v8 = [(DKDiagnosticViewController *)self progress];
    id v12 = [(DKDiagnosticProgress *)v7 initWithProgress:v8];

    v9 = [(DKDiagnosticViewController *)self context];
    objc_super v10 = [(DKDiagnosticViewController *)self context];
    v11 = [v10 testID];
    [v9 updateProgress:v12 forTest:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DKDiagnosticViewController;
    -[DKDiagnosticViewController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)monitorIncomingCall
{
  id v3 = objc_alloc_init(MEMORY[0x263EFC8E8]);
  [(DKDiagnosticViewController *)self setCallObserver:v3];

  id v8 = [(DKDiagnosticViewController *)self callObserver];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 bundleIdentifier];
  id v6 = [v5 stringByAppendingString:@".incomingCallCancelQueue"];
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
  [v8 setDelegate:self queue:v7];
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v5 = [(DKDiagnosticViewController *)self context];
    [v5 cancelRemoteDiagnosticWithCompletion:0];

    [v6 setDelegate:0 queue:0];
  }
}

- (void)displayPressHomeLabelFor:(double)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v59 = a3;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "Displaying press home label for %f", buf, 0xCu);
  }

  if ([(DKDiagnosticViewController *)self shouldShowPressHomeLabel])
  {
    id v6 = [(DKDiagnosticViewController *)self pressHomeLabel];

    if (!v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F83030]);
      id v8 = [MEMORY[0x263F83038] sharedInstanceForStyle:2];
      v9 = [@"PRESS_BUTTON_TO_SKIP" localizedString];
      objc_super v10 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
      v11 = (void *)[v7 initWithSettings:v8 strength:v9 string:v10 font:0.25];
      [(DKDiagnosticViewController *)self setPressHomeLabel:v11];

      id v12 = [(DKDiagnosticViewController *)self pressHomeLabel];
      [v12 setUserInteractionEnabled:0];

      objc_super v13 = [(DKDiagnosticViewController *)self pressHomeLabel];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v14 = [(DKDiagnosticViewController *)self view];
      uint64_t v15 = [(DKDiagnosticViewController *)self pressHomeLabel];
      [v14 addSubview:v15];

      v16 = [(DKDiagnosticViewController *)self pressHomeLabel];
      v17 = [v16 layer];
      [v17 setZPosition:999.0];

      v46 = (void *)MEMORY[0x263F08938];
      v54 = [(DKDiagnosticViewController *)self pressHomeLabel];
      v52 = [v54 bottomAnchor];
      v53 = [(DKDiagnosticViewController *)self view];
      v51 = [v53 bottomAnchor];
      v50 = [v52 constraintEqualToAnchor:v51 constant:-38.0];
      v57[0] = v50;
      v49 = [(DKDiagnosticViewController *)self pressHomeLabel];
      v47 = [v49 leadingAnchor];
      v48 = [(DKDiagnosticViewController *)self view];
      v45 = [v48 leadingAnchor];
      v44 = [v47 constraintEqualToAnchor:v45];
      v57[1] = v44;
      v43 = [(DKDiagnosticViewController *)self pressHomeLabel];
      v18 = [v43 trailingAnchor];
      v19 = [(DKDiagnosticViewController *)self view];
      v20 = [v19 trailingAnchor];
      v21 = [v18 constraintEqualToAnchor:v20];
      v57[2] = v21;
      v22 = [(DKDiagnosticViewController *)self pressHomeLabel];
      v23 = [v22 heightAnchor];
      v24 = [v23 constraintEqualToConstant:19.0];
      v57[3] = v24;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:4];
      [v46 activateConstraints:v25];
    }
    v26 = [(DKDiagnosticViewController *)self pressHomeLabel];
    [v26 setAlpha:1.0];

    [(DKDiagnosticViewController *)self createGradientLayer];
    v27 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.xy"];
    [v27 setFromValue:&unk_26F0DBA98];
    [v27 setToValue:&unk_26F0DBAA8];
    [v27 setDuration:0.6];
    LODWORD(v28) = 1.0;
    LODWORD(v29) = 1028443341;
    LODWORD(v30) = 1041865114;
    v31 = [MEMORY[0x263F15808] functionWithControlPoints:v29 :0.0 :v30 :v28];
    [v27 setTimingFunction:v31];

    uint64_t v32 = *MEMORY[0x263F15AA0];
    [v27 setFillMode:*MEMORY[0x263F15AA0]];
    v33 = [MEMORY[0x263F15760] animationWithKeyPath:@"locations"];
    [v33 setFromValue:&unk_26F0DBAC8];
    [v33 setToValue:&unk_26F0DBAE0];
    [v33 setDuration:0.6];
    LODWORD(v34) = 1.0;
    LODWORD(v35) = 1028443341;
    LODWORD(v36) = 1041865114;
    v37 = [MEMORY[0x263F15808] functionWithControlPoints:v35 :0.0 :v36 :v34];
    [v33 setTimingFunction:v37];

    [v33 setFillMode:v32];
    v38 = [MEMORY[0x263F15750] animation];
    [v38 setDuration:0.6];
    v56[0] = v27;
    v56[1] = v33;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
    [v38 setAnimations:v39];

    [v38 setFillMode:v32];
    v40 = [(DKDiagnosticViewController *)self gradientLayer];
    [v40 removeAllAnimations];

    v41 = [(DKDiagnosticViewController *)self gradientLayer];
    [v41 addAnimation:v38 forKey:@"fade-in-animation"];

    dispatch_time_t v42 = dispatch_time(0, (uint64_t)((a3 + 0.6) * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke;
    block[3] = &unk_264E86710;
    block[4] = self;
    dispatch_after(v42, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke(uint64_t a1)
{
  v2 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v2, OS_LOG_TYPE_DEFAULT, "Fading out the press home label", buf, 2u);
  }

  [*(id *)(a1 + 32) resetGradientAndLabelBefore:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke_60;
  v4[3] = &unk_264E86710;
  v4[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0.7];
}

void __55__DKDiagnosticViewController_displayPressHomeLabelFor___block_invoke_60(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pressHomeLabel];
  [v1 setAlpha:0.0];

  v2 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_23D039000, v2, OS_LOG_TYPE_DEFAULT, "Press home label alpha is 0 now", v3, 2u);
  }
}

- (void)createGradientLayer
{
  v25[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F157D0]);
  [v3 setType:*MEMORY[0x263F15DE0]];
  objc_msgSend(v3, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v3, "setEndPoint:", 1.0, 1.0);
  id v4 = [MEMORY[0x263F825C8] whiteColor];
  v25[0] = [v4 CGColor];
  id v5 = [MEMORY[0x263F825C8] clearColor];
  v25[1] = [v5 CGColor];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [v3 setColors:v6];

  [(DKDiagnosticViewController *)self resetGradientAndLabelBefore:1];
  id v7 = [(DKDiagnosticViewController *)self view];
  id v8 = [v7 layer];
  [v8 addSublayer:v3];

  [(DKDiagnosticViewController *)self setGradientLayer:v3];
  v9 = [(DKDiagnosticViewController *)self pressHomeLabel];
  objc_super v10 = [v9 layer];
  [v10 setMask:v3];

  v11 = [(DKDiagnosticViewController *)self view];
  [v11 layoutIfNeeded];

  id v12 = [(DKDiagnosticViewController *)self pressHomeLabel];
  [v12 frame];
  long double v14 = v13;
  uint64_t v15 = [(DKDiagnosticViewController *)self pressHomeLabel];
  [v15 frame];
  double v17 = hypot(v14, v16);

  double v18 = fmax(v17 * 2.0 + 32.0, 364.0);
  v19 = [(DKDiagnosticViewController *)self pressHomeLabel];
  [v19 bounds];
  double MidX = CGRectGetMidX(v26);
  v21 = [(DKDiagnosticViewController *)self pressHomeLabel];
  [v21 bounds];
  double MidY = CGRectGetMidY(v27);

  v23 = [(DKDiagnosticViewController *)self gradientLayer];
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v18, v18);

  v24 = [(DKDiagnosticViewController *)self gradientLayer];
  objc_msgSend(v24, "setPosition:", MidX, MidY + 32.0);
}

- (void)resetGradientAndLabelBefore:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v5 = [(DKDiagnosticViewController *)self pressHomeLabel];
  [v5 setAlpha:1.0];

  id v6 = [(DKDiagnosticViewController *)self gradientLayer];
  id v7 = v6;
  if (v3)
  {
    [v6 setLocations:&unk_26F0DBAF8];

    id v8 = [(DKDiagnosticViewController *)self gradientLayer];
    CATransform3DMakeScale(&v11, 0.0, 0.0, 1.0);
    v9 = &v11;
  }
  else
  {
    [v6 setLocations:&unk_26F0DBB10];

    id v8 = [(DKDiagnosticViewController *)self gradientLayer];
    CATransform3DMakeScale(&v10, 1.0, 1.0, 1.0);
    v9 = &v10;
  }
  [v8 setTransform:v9];

  [MEMORY[0x263F158F8] commit];
}

- (BOOL)shouldPresentInHostApp
{
  return 1;
}

- (void)shouldShowViewControllerInHostApp:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, [(DKDiagnosticViewController *)self shouldPresentInHostApp]);
}

- (void)dismissInHostApp
{
  BOOL v3 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "Telling host app that this DK's view controller should not be shown", v5, 2u);
  }

  id v4 = [(DKDiagnosticViewController *)self context];
  [v4 dismissRemoteDiagnosticViewControllerWithCompletion:&__block_literal_global_3];
}

- (NSProgress)progress
{
  return self->_progress;
}

- (DKMutableDiagnosticResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (BOOL)shouldShowPressHomeLabel
{
  return self->_shouldShowPressHomeLabel;
}

- (void)setShouldShowPressHomeLabel:(BOOL)a3
{
  self->_shouldShowPressHomeLabel = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (DKDiagnosticContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSLock)finishedLock
{
  return self->_finishedLock;
}

- (void)setFinishedLock:(id)a3
{
}

- (_UILegibilityLabel)pressHomeLabel
{
  return self->_pressHomeLabel;
}

- (void)setPressHomeLabel:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_pressHomeLabel, 0);
  objc_storeStrong((id *)&self->_finishedLock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
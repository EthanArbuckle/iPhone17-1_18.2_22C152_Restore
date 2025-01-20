@interface CFXFullScreenTextEditViewController
+ (BOOL)displayFullScreenTextEditorForEffect:(id)a3 inViewController:(id)a4 delegate:(id)a5 cameraViewWindowFrame:(CGRect)a6 insertingEffect:(BOOL)a7;
+ (BOOL)isFullScreenTextEditorPresented;
+ (id)CFX_fadeTimingParameters;
+ (void)notifyCameraViewWindowFrameChanged:(CGRect)a3;
+ (void)removeFullScreenTextEditor;
+ (void)resign;
- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5;
- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 shouldDisableEditingAnimationForEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4;
- (BOOL)effectEditorViewShouldPreviewEditEffect:(id)a3;
- (BOOL)effectWasRemoved;
- (BOOL)insertingEffect;
- (BOOL)isRunningAnimation;
- (BOOL)removeButtonRelativeBoundsIsViewSpace;
- (CFXEffect)textEffect;
- (CFXEffect)workingEffect;
- (CFXEffectEditorView)effectEditor;
- (CFXFullScreenTextEditViewController)initWithTextEffect:(id)a3 CGSize:(CGRect)a4 insertingEffect:(BOOL)a5 delegate:(id)a6;
- (CFXFullScreenTextEditViewControllerDelegate)delegate;
- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6;
- (CGRect)effectEditorFrameRelativeToScreen;
- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6;
- (JFXOverlayEffectDebugViewOptions)debugOptions;
- (UIView)debugView;
- (UIView)dimmingView;
- (double)effectEditorView:(id)a3 durationForBeginEditingAnimationForEffect:(id)a4;
- (double)effectEditorView:(id)a3 durationForEndEditingAnimationForEffect:(id)a4;
- (id)effectEditorView:(id)a3 beginEditingAnimationFromFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 beginEditingAnimationToFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 calculateAnimatedFaceTrackingTransformWithCurrentFaceTrackingDataFromTrackingType:(int64_t)a4 interpolatedWithFaceTrackingTransform:(id)a5 toTrackingType:(int64_t)a6 atAnimationProgress:(float)a7;
- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4;
- (id)effectEditorView:(id)a3 endEditingAnimationFromFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 endEditingAnimationToFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 textForEffect:(id)a4;
- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4;
- (void)CFX_animateWithDuration:(double)a3 animatingIn:(BOOL)a4 completion:(id)a5;
- (void)configureWorkingEffect;
- (void)dealloc;
- (void)didTappedEmptyDimmedArea:(id)a3;
- (void)effectEditorView:(id)a3 applyAnimationTransformsToEffect:(id)a4 transforms:(id)a5;
- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4;
- (void)effectEditorView:(id)a3 didCompleteBeginEditingAnimationForEffect:(id)a4;
- (void)effectEditorView:(id)a3 didCompleteEndEditingAnimationForEffect:(id)a4 completion:(id)a5;
- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5;
- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5;
- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4;
- (void)effectEditorView:(id)a3 didStartBeginEditingAnimationForEffect:(id)a4 completion:(id)a5;
- (void)effectEditorView:(id)a3 didStartEndEditingAnimationForEffect:(id)a4;
- (void)effectEditorView:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4;
- (void)effectEditorView:(id)a3 willBeginAnimationBeforeEditingEffect:(id)a4;
- (void)effectEditorViewDidBeginEditing:(id)a3;
- (void)effectEditorViewDidEndEditing:(id)a3;
- (void)keyboardDidHide:(id)a3;
- (void)scaleTextToFitTextEditingBounds:(BOOL)a3;
- (void)setDebugOptions:(id)a3;
- (void)setDebugView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setEffectEditor:(id)a3;
- (void)setEffectEditorFrameRelativeToScreen:(CGRect)a3;
- (void)setEffectWasRemoved:(BOOL)a3;
- (void)setInsertingEffect:(BOOL)a3;
- (void)setIsRunningAnimation:(BOOL)a3;
- (void)setWorkingEffect:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CFXFullScreenTextEditViewController

+ (BOOL)displayFullScreenTextEditorForEffect:(id)a3 inViewController:(id)a4 delegate:(id)a5 cameraViewWindowFrame:(CGRect)a6 insertingEffect:(BOOL)a7
{
  uint64_t v7 = s_CurrentFullScreenTextEditorController;
  if (!s_CurrentFullScreenTextEditorController)
  {
    BOOL v8 = a7;
    double height = a6.size.height;
    double width = a6.size.width;
    double y = a6.origin.y;
    double x = a6.origin.x;
    id v15 = a5;
    id v16 = a4;
    id v17 = a3;
    v18 = -[CFXFullScreenTextEditViewController initWithTextEffect:CGSize:insertingEffect:delegate:]([CFXFullScreenTextEditViewController alloc], "initWithTextEffect:CGSize:insertingEffect:delegate:", v17, v8, v15, x, y, width, height);

    v19 = (void *)s_CurrentFullScreenTextEditorController;
    s_CurrentFullScreenTextEditorController = (uint64_t)v18;

    [v16 jfxAddChildViewController:s_CurrentFullScreenTextEditorController constrainRelativeToSafeAreas:0];
  }
  return v7 == 0;
}

+ (void)removeFullScreenTextEditor
{
  if (s_CurrentFullScreenTextEditorController)
  {
    [(id)s_CurrentFullScreenTextEditorController jfxRemoveFromParentViewController];
    v2 = (void *)s_CurrentFullScreenTextEditorController;
    s_CurrentFullScreenTextEditorController = 0;
  }
}

+ (BOOL)isFullScreenTextEditorPresented
{
  return s_CurrentFullScreenTextEditorController != 0;
}

+ (void)notifyCameraViewWindowFrameChanged:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = (id)s_CurrentFullScreenTextEditorController;
  if (v19)
  {
    objc_msgSend(v19, "setEffectEditorFrameRelativeToScreen:", x, y, width, height);
    uint64_t v7 = [v19 view];
    BOOL v8 = [v7 window];

    if (v8)
    {
      v9 = [v19 view];
      [v19 effectEditorFrameRelativeToScreen];
      objc_msgSend(v9, "convertRect:fromView:", 0);
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [v19 effectEditor];
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
    }
  }
}

+ (void)resign
{
  if (s_CurrentFullScreenTextEditorController)
  {
    id v2 = [(id)s_CurrentFullScreenTextEditorController effectEditor];
    [v2 endEditingAnimated:1 withCompletionBlock:0];
  }
}

- (CFXFullScreenTextEditViewController)initWithTextEffect:(id)a3 CGSize:(CGRect)a4 insertingEffect:(BOOL)a5 delegate:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  id v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)CFXFullScreenTextEditViewController;
  double v16 = [(CFXFullScreenTextEditViewController *)&v32 initWithNibName:0 bundle:0];
  if (v16)
  {
    double v17 = [v14 jtEffect];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v25 = (void *)MEMORY[0x263EFF940];
      uint64_t v26 = *MEMORY[0x263EFF4A0];
      v27 = NSString;
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      v30 = [v27 stringWithFormat:@"overlay required to initialize class %@ ", v29];
      id v31 = [v25 exceptionWithName:v26 reason:v30 userInfo:0];

      objc_exception_throw(v31);
    }
    objc_storeStrong((id *)&v16->_textEffect, a3);
    id v19 = [(CFXFullScreenTextEditViewController *)v16 textEffect];
    v20 = [v19 jtEffect];
    v21 = (void *)[v20 copy];

    uint64_t v22 = +[CFXEffect effectWithJTEffect:v21];
    workingEffect = v16->_workingEffect;
    v16->_workingEffect = (CFXEffect *)v22;

    objc_storeWeak((id *)&v16->_delegate, v15);
    v16->_insertingEffect = a5;
    v16->_effectEditorFrameRelativeToScreen.origin.CGFloat x = x;
    v16->_effectEditorFrameRelativeToScreen.origin.CGFloat y = y;
    v16->_effectEditorFrameRelativeToScreen.size.CGFloat width = width;
    v16->_effectEditorFrameRelativeToScreen.size.CGFloat height = height;
  }
  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CFXFullScreenTextEditViewController;
  [(CFXFullScreenTextEditViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v83[4] = *MEMORY[0x263EF8340];
  v82.receiver = self;
  v82.super_class = (Class)CFXFullScreenTextEditViewController;
  [(CFXFullScreenTextEditViewController *)&v82 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [(CFXFullScreenTextEditViewController *)self setDimmingView:v3];

  objc_super v4 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CFXFullScreenTextEditViewController *)self view];
  v6 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  [v5 addSubview:v6];

  v72 = (void *)MEMORY[0x263F08938];
  v81 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  v79 = [v81 topAnchor];
  v80 = [(CFXFullScreenTextEditViewController *)self view];
  v78 = [v80 topAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v83[0] = v77;
  v76 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  v74 = [v76 bottomAnchor];
  v75 = [(CFXFullScreenTextEditViewController *)self view];
  v73 = [v75 bottomAnchor];
  v71 = [v74 constraintEqualToAnchor:v73];
  v83[1] = v71;
  v70 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  v69 = [v70 leadingAnchor];
  uint64_t v7 = [(CFXFullScreenTextEditViewController *)self view];
  BOOL v8 = [v7 leadingAnchor];
  v9 = [v69 constraintEqualToAnchor:v8];
  v83[2] = v9;
  double v10 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  double v11 = [v10 trailingAnchor];
  double v12 = [(CFXFullScreenTextEditViewController *)self view];
  double v13 = [v12 trailingAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  v83[3] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:4];
  [v72 activateConstraints:v15];

  double v16 = [MEMORY[0x263F1C550] blackColor];
  double v17 = [v16 colorWithAlphaComponent:0.5];
  v18 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  [v18 setBackgroundColor:v17];

  id v19 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_didTappedEmptyDimmedArea_];
  v20 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  [v20 addGestureRecognizer:v19];

  v21 = [(CFXFullScreenTextEditViewController *)self dimmingView];
  [v21 setAlpha:0.0];

  uint64_t v22 = JFX_getDrawOverlayBoundsOptionsDictionary();
  v23 = +[JFXOverlayEffectDebugViewOptions debugViewOptionsWithDictionary:v22];
  [(CFXFullScreenTextEditViewController *)self setDebugOptions:v23];

  if (JFX_isDrawOverlayBoundsEnabled())
  {
    v24 = [(CFXFullScreenTextEditViewController *)self debugOptions];
    int v25 = [v24 showTextBoundingBoxes];

    if (v25)
    {
      id v26 = objc_alloc(MEMORY[0x263F1CB60]);
      double v27 = *MEMORY[0x263F001A8];
      double v28 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v29 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v30 = *(double *)(MEMORY[0x263F001A8] + 24);
      id v31 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x263F001A8], v28, v29, v30);
      [(CFXFullScreenTextEditViewController *)self setDebugView:v31];

      objc_super v32 = [(CFXFullScreenTextEditViewController *)self debugView];
      v33 = [v32 layer];
      [v33 setBorderWidth:2.0];

      id v34 = [MEMORY[0x263F1C550] greenColor];
      uint64_t v35 = [v34 CGColor];
      v36 = [(CFXFullScreenTextEditViewController *)self debugView];
      v37 = [v36 layer];
      [v37 setBorderColor:v35];

      v38 = [(CFXFullScreenTextEditViewController *)self view];
      v39 = [(CFXFullScreenTextEditViewController *)self debugView];
      [v38 addSubview:v39];

      v40 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v27, v28, v29, v30);
      [v40 setTag:1];
      v41 = [v40 layer];
      [v41 setBorderWidth:4.0];

      id v42 = [MEMORY[0x263F1C550] yellowColor];
      uint64_t v43 = [v42 CGColor];
      v44 = [v40 layer];
      [v44 setBorderColor:v43];

      v45 = [(CFXFullScreenTextEditViewController *)self debugView];
      [v45 addSubview:v40];

      v46 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v27, v28, v29, v30);
      [v46 setTag:2];
      v47 = [v46 layer];
      [v47 setBorderWidth:2.0];

      id v48 = [MEMORY[0x263F1C550] orangeColor];
      uint64_t v49 = [v48 CGColor];
      v50 = [v46 layer];
      [v50 setBorderColor:v49];

      v51 = [(CFXFullScreenTextEditViewController *)self debugView];
      [v51 addSubview:v46];

      v52 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 4.0, 4.0);
      [v52 setTag:3];
      id v53 = [MEMORY[0x263F1C550] magentaColor];
      uint64_t v54 = [v53 CGColor];
      v55 = [v52 layer];
      [v55 setBackgroundColor:v54];

      v56 = [(CFXFullScreenTextEditViewController *)self debugView];
      [v56 addSubview:v52];

      v57 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v27, v28, v29, v30);
      [v57 setTag:4];
      v58 = [v57 layer];
      [v58 setBorderWidth:2.0];

      id v59 = [MEMORY[0x263F1C550] redColor];
      uint64_t v60 = [v59 CGColor];
      v61 = [v57 layer];
      [v61 setBorderColor:v60];

      v62 = [(CFXFullScreenTextEditViewController *)self debugView];
      [v62 addSubview:v57];

      v63 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v27, v28, v29, v30);
      [v63 setTag:5];
      v64 = [v63 layer];
      [v64 setBorderWidth:4.0];

      id v65 = [MEMORY[0x263F1C550] blackColor];
      uint64_t v66 = [v65 CGColor];
      v67 = [v63 layer];
      [v67 setBorderColor:v66];

      v68 = [(CFXFullScreenTextEditViewController *)self debugView];
      [v68 addSubview:v63];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CFXFullScreenTextEditViewController;
  [(CFXFullScreenTextEditViewController *)&v28 viewDidAppear:a3];
  [(CFXFullScreenTextEditViewController *)self configureWorkingEffect];
  objc_super v4 = [[CFXEffectEditorView alloc] initWithMode:2 delegate:self];
  [(CFXFullScreenTextEditViewController *)self setEffectEditor:v4];

  v5 = [(CFXFullScreenTextEditViewController *)self view];
  v6 = [(CFXFullScreenTextEditViewController *)self effectEditor];
  [v5 addSubview:v6];

  uint64_t v7 = [(CFXFullScreenTextEditViewController *)self view];
  [(CFXFullScreenTextEditViewController *)self effectEditorFrameRelativeToScreen];
  objc_msgSend(v7, "convertRect:fromView:", 0);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(CFXFullScreenTextEditViewController *)self effectEditor];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  int v17 = [(CFXFullScreenTextEditViewController *)self insertingEffect];
  v18 = [(CFXFullScreenTextEditViewController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    v20 = [(CFXFullScreenTextEditViewController *)self delegate];
    v21 = [(CFXFullScreenTextEditViewController *)self workingEffect];
    int v22 = [v20 fullScreenTextEditViewController:self shouldDisableEditingAnimationForEffect:v21];

    v17 |= v22;
  }
  objc_initWeak(&location, self);
  v23 = [(CFXFullScreenTextEditViewController *)self effectEditor];
  v24 = [(CFXFullScreenTextEditViewController *)self workingEffect];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __53__CFXFullScreenTextEditViewController_viewDidAppear___block_invoke;
  v25[3] = &unk_264C0B650;
  objc_copyWeak(&v26, &location);
  v25[4] = self;
  [v23 beginEditingEffect:v24 animated:v17 ^ 1u withCompletionBlock:v25];

  if (v17) {
    [(CFXFullScreenTextEditViewController *)self CFX_animateWithDuration:1 animatingIn:0 completion:0.4];
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __53__CFXFullScreenTextEditViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [WeakRetained delegate];
    objc_super v4 = [v7 textEffect];
    [v3 fullScreenTextEditViewController:v7 didBeginEditingEffect:v4];

    v5 = [v7 effectEditor];
    [v5 beginTextEditing];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:*(void *)(a1 + 32) selector:sel_keyboardDidHide_ name:*MEMORY[0x263F1D410] object:0];

    id WeakRetained = v7;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CFXFullScreenTextEditViewController;
  [(CFXFullScreenTextEditViewController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D410] object:0];

  v5 = [(CFXFullScreenTextEditViewController *)self effectEditor];
  [v5 endEditingAnimated:0 withCompletionBlock:0];
}

- (void)keyboardDidHide:(id)a3
{
  id v3 = [(CFXFullScreenTextEditViewController *)self effectEditor];
  [v3 endEditingAnimated:1 withCompletionBlock:0];
}

- (void)didTappedEmptyDimmedArea:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(CFXFullScreenTextEditViewController *)self effectEditor];
    [v4 endEditingAnimated:1 withCompletionBlock:0];
  }
}

- (void)configureWorkingEffect
{
  id v3 = [(CFXFullScreenTextEditViewController *)self workingEffect];
  id v4 = [v3 jtEffect];

  [v4 setHidden:0];
  long long v5 = *(_OWORD *)(MEMORY[0x263EF8990] + 80);
  long long v39 = *(_OWORD *)(MEMORY[0x263EF8990] + 64);
  long long v40 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263EF8990] + 112);
  long long v41 = *(_OWORD *)(MEMORY[0x263EF8990] + 96);
  long long v42 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x263EF8990] + 16);
  long long v35 = *MEMORY[0x263EF8990];
  long long v36 = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263EF8990] + 48);
  long long v37 = *(_OWORD *)(MEMORY[0x263EF8990] + 32);
  long long v38 = v8;
  [v4 setTopLevelTransform:&v35];
  double v9 = [(CFXFullScreenTextEditViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0
    && ([(CFXFullScreenTextEditViewController *)self delegate],
        double v11 = objc_claimAutoreleasedReturnValue(),
        [(CFXFullScreenTextEditViewController *)self workingEffect],
        double v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v11 fullScreenTextEditViewController:self shouldDisableEditingAnimationForEffect:v12],
        v12,
        v11,
        v13))
  {
    double v14 = [v4 trackingProps];
    double v15 = v14;
    uint64_t v16 = 0;
  }
  else
  {
    int v17 = [v4 trackingProps];
    uint64_t v18 = [v17 trackingType];

    if (v18 != 1) {
      goto LABEL_7;
    }
    double v14 = [v4 trackingProps];
    double v15 = v14;
    uint64_t v16 = 2;
  }
  [v14 setTrackingType:v16];

LABEL_7:
  if ([v4 isTextFlipped])
  {
    CGAffineTransformMakeRotation((CGAffineTransform *)_150, 3.14159265);
    char v19 = [(CFXFullScreenTextEditViewController *)self view];
    [v19 bounds];
    long long v32 = *MEMORY[0x263F010E0];
    uint64_t v33 = *(void *)(MEMORY[0x263F010E0] + 16);
    objc_msgSend(v4, "addTransform:withComponentTime:relativeTo:basisOrigin:", _150, &v32, 1);
  }
  v20 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if (v21 == 1)
  {
    [v4 renderSize];
    double v23 = v22;
    double v25 = v24;
    [(CFXFullScreenTextEditViewController *)self effectEditorFrameRelativeToScreen];
    double Height = CGRectGetHeight(v43);
    [(CFXFullScreenTextEditViewController *)self effectEditorFrameRelativeToScreen];
    double Width = CGRectGetWidth(v44);
    if (v23 >= v25) {
      double v28 = v25;
    }
    else {
      double v28 = v23;
    }
    if (v23 >= v25) {
      double v29 = v23;
    }
    else {
      double v29 = v25;
    }
    BOOL v30 = Height <= Width;
    if (Height <= Width) {
      double v31 = v29;
    }
    else {
      double v31 = v28;
    }
    if (!v30) {
      double v28 = v29;
    }
    objc_msgSend(v4, "setRenderSize:", v31, v28);
  }
  [(CFXFullScreenTextEditViewController *)self scaleTextToFitTextEditingBounds:1];
}

- (void)scaleTextToFitTextEditingBounds:(BOOL)a3
{
  if (![(CFXFullScreenTextEditViewController *)self isRunningAnimation])
  {
    long long v5 = [(CFXFullScreenTextEditViewController *)self view];
    [(CFXFullScreenTextEditViewController *)self effectEditorFrameRelativeToScreen];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    double v86 = v6;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    int v13 = [(CFXFullScreenTextEditViewController *)self view];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    v105.origin.CGFloat x = 0.0;
    v105.origin.double y = 0.0;
    v105.size.double width = v10;
    v105.size.double height = v12;
    double MidX = CGRectGetMidX(v105);
    v106.origin.CGFloat x = 0.0;
    v106.origin.double y = 0.0;
    v106.size.double width = v10;
    v106.size.double height = v12;
    CGFloat v19 = CGRectGetMidY(v106) - v17 * 0.5;

    v107.origin.CGFloat x = 0.0;
    v107.origin.double y = 0.0;
    v107.size.double width = v10;
    v107.size.double height = v12;
    v124.origin.CGFloat x = MidX - v15 * 0.5;
    v124.origin.double y = v19;
    v124.size.double width = v15;
    v124.size.double height = v17;
    CGRect v108 = CGRectIntersection(v107, v124);
    CGFloat x = v108.origin.x;
    double y = v108.origin.y;
    double width = v108.size.width;
    double height = v108.size.height;
    double v24 = [(CFXFullScreenTextEditViewController *)self workingEffect];
    double v25 = [v24 jtEffect];

    char v26 = [v25 isEmoji];
    double v27 = (long long *)MEMORY[0x263F010E0];
    if (a3) {
      goto LABEL_4;
    }
    long long v102 = *MEMORY[0x263F010E0];
    uint64_t v103 = *(void *)(MEMORY[0x263F010E0] + 16);
    objc_msgSend(v25, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v102, 1, 1, 1, 0.0, 0.0, v10, v12);
    v125.origin.CGFloat x = v28 + -24.0;
    v125.origin.double y = v29 + -34.0;
    v125.size.double width = v30 + 48.0;
    v125.size.double height = v31 + 58.0;
    v109.origin.CGFloat x = x;
    v109.origin.double y = y;
    v109.size.double width = width;
    v109.size.double height = height;
    if (!CGRectContainsRect(v109, v125))
    {
LABEL_4:
      double v96 = x;
      double v85 = v8;
      if (v26)
      {
        double v32 = 0.32;
      }
      else
      {
        uint64_t v33 = [v25 strings];
        id v34 = [v33 firstObject];
        if ((unint64_t)[v34 length] >= 4) {
          double v32 = 0.5;
        }
        else {
          double v32 = 0.32;
        }
      }
      if (width >= height) {
        double v35 = height;
      }
      else {
        double v35 = width;
      }
      long long v102 = *v27;
      long long v98 = v102;
      uint64_t v103 = *((void *)v27 + 2);
      uint64_t v36 = v103;
      double v84 = v35 * v32;
      objc_msgSend(v25, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v102, 0.0, 0.0, v84, v84, 0.0, 0.0, v10, v12);
      long long v102 = v98;
      uint64_t v103 = v36;
      objc_msgSend(v25, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v102, 1, 1, 1, 0.0, 0.0, v10, v12);
      CGFloat v94 = v40;
      CGFloat v95 = v39;
      if (width <= height) {
        double v41 = 0.5;
      }
      else {
        double v41 = width / height * 0.5 - (width / height + -1.0) * 0.5;
      }
      CGFloat v91 = v37;
      CGFloat v92 = v38;
      if (v10 > v12) {
        double v41 = ((v10 / v12 + -1.0) * 0.5 + v41) / (v10 / v12);
      }
      double v93 = v12;
      double v42 = CGRectMakeWithSizeAndCenterPoint(v37 + 48.0, v38 + 58.0, v10 * v41);
      double rect = v45;
      double v46 = v42;
      double v87 = y;
      CGFloat v88 = v42;
      double v97 = v44;
      if (v44 <= width)
      {
        double v46 = v96;
        if (v42 >= v96)
        {
          CGFloat v47 = v43;
          double MaxX = CGRectGetMaxX(*(CGRect *)&v42);
          v110.origin.CGFloat x = v96;
          v110.origin.double y = y;
          v110.size.double width = width;
          v110.size.double height = height;
          CGFloat v49 = CGRectGetMaxX(v110);
          double v43 = v47;
          double v44 = v97;
          double v46 = v88;
          if (MaxX > v49)
          {
            v111.origin.CGFloat x = v96;
            v111.origin.double y = y;
            v111.size.double width = width;
            v111.size.double height = height;
            double v50 = CGRectGetMaxX(v111);
            v112.origin.CGFloat x = v88;
            v112.origin.double y = v47;
            v112.size.double width = v97;
            v112.size.double height = rect;
            CGFloat v51 = CGRectGetWidth(v112);
            double v43 = v47;
            double v44 = v97;
            double v46 = v50 - v51;
          }
        }
      }
      CGFloat v83 = v43;
      if (rect <= height)
      {
        if (v43 >= y)
        {
          double v52 = v46;
          CGFloat v53 = v43;
          double v54 = rect;
          double MaxY = CGRectGetMaxY(*(CGRect *)(&v43 - 1));
          v113.origin.CGFloat x = v96;
          v113.origin.double y = y;
          v113.size.double width = width;
          v113.size.double height = height;
          if (MaxY <= CGRectGetMaxY(v113))
          {
            double v43 = v53;
          }
          else
          {
            v114.origin.CGFloat x = v96;
            v114.origin.double y = y;
            v114.size.double width = width;
            v114.size.double height = height;
            double v56 = CGRectGetMaxY(v114);
            v115.origin.CGFloat x = v46;
            v115.origin.double y = v53;
            v115.size.double width = v97;
            v115.size.double height = rect;
            double v43 = v56 - CGRectGetHeight(v115);
          }
          double v44 = v97;
        }
        else
        {
          double v43 = y;
        }
      }
      double v81 = v43;
      v116.origin.CGFloat x = v46 + 24.0;
      v116.origin.double y = v43 + 34.0;
      CGFloat v57 = v116.origin.y;
      v116.size.double width = v44 + -48.0;
      double v58 = v116.size.width;
      v116.size.double height = rect + -58.0;
      double v89 = CGRectGetMidX(v116);
      v117.origin.CGFloat x = v95;
      v117.origin.double y = v94;
      v117.size.double width = v91;
      v117.size.double height = v92;
      CGFloat v90 = v89 - CGRectGetMidX(v117);
      v118.origin.CGFloat x = v46 + 24.0;
      double v82 = v57;
      v118.origin.double y = v57;
      v118.size.double width = v58;
      v118.size.double height = rect + -58.0;
      double MidY = CGRectGetMidY(v118);
      v119.origin.CGFloat x = v95;
      v119.origin.double y = v94;
      v119.size.double width = v91;
      v119.size.double height = v92;
      CGFloat v60 = CGRectGetMidY(v119);
      CGAffineTransformMakeTranslation(&v104, v90, MidY - v60);
      long long v100 = v98;
      uint64_t v101 = v36;
      objc_msgSend(v25, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v104, &v100, 1, 0.0, 0.0, v10, v93);
      if (JFX_isDrawOverlayBoundsEnabled())
      {
        v61 = [(CFXFullScreenTextEditViewController *)self debugOptions];
        int v62 = [v61 showTextBoundingBoxes];

        if (v62)
        {
          v63 = [(CFXFullScreenTextEditViewController *)self debugView];
          objc_msgSend(v63, "setFrame:", v86, v85, v10, v93);

          v64 = [(CFXFullScreenTextEditViewController *)self debugView];
          id v65 = [v64 viewWithTag:1];
          objc_msgSend(v65, "setFrame:", v96, v87, width, height);

          uint64_t v66 = [(CFXFullScreenTextEditViewController *)self debugView];
          v67 = [v66 viewWithTag:2];
          objc_msgSend(v67, "setFrame:", 0.0, 0.0, v84, v84);

          v120.origin.CGFloat x = v46 + 24.0;
          v120.origin.double y = v82;
          v120.size.double width = v58;
          v120.size.double height = rect + -58.0;
          double v68 = CGRectGetMidX(v120);
          v121.origin.CGFloat x = v46 + 24.0;
          v121.origin.double y = v82;
          v121.size.double width = v58;
          v121.size.double height = rect + -58.0;
          double v69 = CGRectGetMidY(v121);
          v70 = [(CFXFullScreenTextEditViewController *)self debugView];
          v71 = [v70 viewWithTag:2];
          objc_msgSend(v71, "setCenter:", v68, v69);

          v122.origin.CGFloat x = v88;
          v122.origin.double y = v83;
          v122.size.double width = v97;
          v122.size.double height = rect;
          double v72 = CGRectGetMidX(v122);
          v123.origin.CGFloat x = v88;
          v123.origin.double y = v83;
          v123.size.double width = v97;
          v123.size.double height = rect;
          double v73 = CGRectGetMidY(v123);
          v74 = [(CFXFullScreenTextEditViewController *)self debugView];
          v75 = [v74 viewWithTag:3];
          objc_msgSend(v75, "setCenter:", v72, v73);

          v76 = [(CFXFullScreenTextEditViewController *)self debugView];
          v77 = [v76 viewWithTag:4];
          objc_msgSend(v77, "setFrame:", v46, v81, v97, rect);

          v78 = [(CFXFullScreenTextEditViewController *)self debugView];
          v79 = [v78 viewWithTag:5];
          objc_msgSend(v79, "setFrame:", v46 + 24.0, v82, v58, rect + -58.0);
        }
      }
      v80 = [(CFXFullScreenTextEditViewController *)self effectEditor];
      [v80 notifyEffectTransformDidChange];
    }
  }
}

- (void)effectEditorViewDidBeginEditing:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = [(CFXFullScreenTextEditViewController *)self workingEffect];
  id v4 = [v3 jtEffect];
  v6[0] = v4;
  long long v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  +[JFXEffectEditingUtilities disableAnimationForEffects:v5];
}

- (void)effectEditorViewDidEndEditing:(id)a3
{
  if (![(CFXFullScreenTextEditViewController *)self effectWasRemoved])
  {
    id v4 = [(CFXFullScreenTextEditViewController *)self workingEffect];
    long long v5 = [v4 jtEffect];
    id v8 = +[JFXEffectEditingUtilities textForEffect:v5];

    double v6 = [(CFXFullScreenTextEditViewController *)self delegate];
    double v7 = [(CFXFullScreenTextEditViewController *)self textEffect];
    [v6 fullScreenTextEditViewController:self didFinishEditingEffect:v7 withUpdatedText:v8];

    +[CFXFullScreenTextEditViewController removeFullScreenTextEditor];
  }
}

- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v27[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(CFXFullScreenTextEditViewController *)self workingEffect];
  double v9 = [v8 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v11 = [(CFXFullScreenTextEditViewController *)self workingEffect];
    double v12 = [v11 jtEffect];

    [v7 bounds];
    double v14 = 44.0 / v13;
    v27[0] = v12;
    double v16 = 44.0 / v15;
    double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    [v7 bounds];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    double v22 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v17, &v25, 1, x, y, v18, v19, v20, v21, v14, v16);

    if (v22)
    {
      double v23 = +[CFXEffect effectWithJTEffect:v22];
    }
    else
    {
      double v23 = 0;
    }
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = [v9 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v12 = [v9 jtEffect];
    [v8 bounds];
    double v14 = 44.0 / v13;
    v27[0] = v12;
    double v16 = 44.0 / v15;
    double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    [v8 bounds];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    double v22 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v17, &v25, 1, x, y, v18, v19, v20, v21, v14, v16);

    BOOL v23 = v22 != 0;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5
{
  id v7 = a5;
  id v8 = [a4 jtEffect];
  +[JFXEffectEditingUtilities updateEffectText:v8 newText:v7];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CFXFullScreenTextEditViewController_effectEditorView_didEditTextForEffect_newText___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __85__CFXFullScreenTextEditViewController_effectEditorView_didEditTextForEffect_newText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scaleTextToFitTextEditingBounds:0];
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  -[CFXFullScreenTextEditViewController setEffectWasRemoved:](self, "setEffectWasRemoved:", 1, a4);
  long long v5 = [(CFXFullScreenTextEditViewController *)self delegate];
  double v6 = [(CFXFullScreenTextEditViewController *)self textEffect];
  [v5 fullScreenTextEditViewController:self didFinishEditingByRemovingEffect:v6];

  +[CFXFullScreenTextEditViewController removeFullScreenTextEditor];
}

- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v9 = a4;
  double v10 = [v9 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v12 = [v9 jtEffect];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    objc_msgSend(v12, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v25, 1, 1, 1, x, y, width, height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  id v12 = a3;
  id v13 = a4;
  double v14 = [v13 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v16 = [v13 jtEffect];
    [v12 bounds];
    long long v31 = *MEMORY[0x263F010E0];
    uint64_t v32 = *(void *)(MEMORY[0x263F010E0] + 16);
    objc_msgSend(v16, "hitAreaBoundingFrameAtTime:forcePosterFrame:includeDropShadow:adjustForMinimumSize:normalizedMinimumSize:relativeTo:basisOrigin:", &v31, 1, 1, v10, 1, 44.0 / v17, 44.0 / v18, x, y, width, height);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    double v20 = *MEMORY[0x263F001A8];
    double v22 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v24 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v26 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v7 = objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v10 = *MEMORY[0x263F010E0];
    uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
    id v8 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)removeButtonRelativeBoundsIsViewSpace
{
  return 1;
}

- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v9 = objc_msgSend(a4, "jtEffect", a3);
  long long v18 = *MEMORY[0x263F010E0];
  uint64_t v19 = *(void *)(MEMORY[0x263F010E0] + 16);
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v17[0] = *MEMORY[0x263F000D0];
  v17[1] = v10;
  v17[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  +[JFXEffectEditingUtilities removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:](JFXEffectEditingUtilities, "removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:", v9, &v18, v17, x, y, width, height);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v9 = objc_msgSend(a4, "jtEffect", a3);
  long long v12 = *MEMORY[0x263F010E0];
  uint64_t v13 = *(void *)(MEMORY[0x263F010E0] + 16);
  id v10 = +[JFXEffectEditingUtilities newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:](JFXEffectEditingUtilities, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:", v9, &v12, 0, x, y, width, height);

  return v10;
}

- (id)effectEditorView:(id)a3 textForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  long long v5 = +[JFXEffectEditingUtilities textForEffect:v4];

  return v5;
}

- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4
{
  objc_msgSend(a4, "jtEffect", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities beginTextEditingForEffect:v4];
}

- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5
{
  id v8 = a4;
  if (![(CFXFullScreenTextEditViewController *)self effectWasRemoved])
  {
    double v6 = [v8 jtEffect];
    +[JFXEffectEditingUtilities updateEffectToDefaultTextIfEmpty:v6];

    id v7 = [v8 jtEffect];
    +[JFXEffectEditingUtilities endTextEditingForEffect:v7];
  }
}

- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  BOOL v5 = +[JFXEffectEditingUtilities canEditTextForEffect:v4];

  return v5;
}

- (BOOL)effectEditorViewShouldPreviewEditEffect:(id)a3
{
  return 1;
}

- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  unint64_t v5 = +[JFXEffectEditingUtilities maximumTextLengthForEffect:v4];

  return v5;
}

- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v10 = a5.y;
  double v11 = a5.x;
  long long v12 = objc_msgSend(a4, "jtEffect", a3);
  long long v19 = *MEMORY[0x263F010E0];
  uint64_t v20 = *(void *)(MEMORY[0x263F010E0] + 16);
  +[JFXEffectEditingUtilities spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:](JFXEffectEditingUtilities, "spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:", v12, &v19, v11, v10, x, y, width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  char v5 = [v4 isCurrentlyTracking];

  return v5;
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4
{
  return +[JFXEffectEditingUtilities isFaceTrackingDataAvailable];
}

- (void)effectEditorView:(id)a3 applyAnimationTransformsToEffect:(id)a4 transforms:(id)a5
{
  id v6 = a5;
  id v7 = [a4 jtEffect];
  [v6 applyToEffect:v7];
}

- (BOOL)effectEditorView:(id)a3 shouldDisableEditingAnimationForEffect:(id)a4
{
  id v5 = a4;
  id v6 = [(CFXFullScreenTextEditViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CFXFullScreenTextEditViewController *)self delegate];
    char v9 = [v8 fullScreenTextEditViewController:self shouldDisableEditingAnimationForEffect:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (double)effectEditorView:(id)a3 durationForBeginEditingAnimationForEffect:(id)a4
{
  return 0.4;
}

- (void)effectEditorView:(id)a3 willBeginAnimationBeforeEditingEffect:(id)a4
{
  id v6 = [(CFXFullScreenTextEditViewController *)self delegate];
  id v5 = [(CFXFullScreenTextEditViewController *)self textEffect];
  [v6 fullScreenTextEditViewController:self willBeginAnimationBeforeEditingEffect:v5];
}

- (id)effectEditorView:(id)a3 beginEditingAnimationFromFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  char v7 = [(CFXFullScreenTextEditViewController *)self textEffect];
  id v8 = [v7 jtEffect];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = *MEMORY[0x263F010E0];
    uint64_t v12 = *(void *)(MEMORY[0x263F010E0] + 16);
    char v9 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v8, 1, &v11, 1, 1, 1, width, height);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)effectEditorView:(id)a3 beginEditingAnimationToFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  char v7 = objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v10 = *MEMORY[0x263F010E0];
    uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
    id v8 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)effectEditorView:(id)a3 didStartBeginEditingAnimationForEffect:(id)a4 completion:(id)a5
{
  id v6 = a5;
  [(CFXFullScreenTextEditViewController *)self setIsRunningAnimation:1];
  char v7 = [(CFXFullScreenTextEditViewController *)self delegate];
  id v8 = [(CFXFullScreenTextEditViewController *)self textEffect];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __106__CFXFullScreenTextEditViewController_effectEditorView_didStartBeginEditingAnimationForEffect_completion___block_invoke;
  v10[3] = &unk_264C0AF38;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 fullScreenTextEditViewController:self didBeginAnimationBeforeEditingEffect:v8 completion:v10];
}

uint64_t __106__CFXFullScreenTextEditViewController_effectEditorView_didStartBeginEditingAnimationForEffect_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "CFX_animateWithDuration:animatingIn:completion:", 1, 0, 0.4);
}

- (void)effectEditorView:(id)a3 didCompleteBeginEditingAnimationForEffect:(id)a4
{
}

- (double)effectEditorView:(id)a3 durationForEndEditingAnimationForEffect:(id)a4
{
  BOOL v4 = [(CFXFullScreenTextEditViewController *)self effectWasRemoved];
  double result = 0.4;
  if (v4) {
    return 0.0;
  }
  return result;
}

- (void)effectEditorView:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4
{
  id v5 = objc_msgSend(a4, "jtEffect", a3);
  id v8 = +[JFXEffectEditingUtilities textForEffect:v5];

  id v6 = [(CFXFullScreenTextEditViewController *)self delegate];
  char v7 = [(CFXFullScreenTextEditViewController *)self textEffect];
  [v6 fullScreenTextEditViewController:self willBeginAnimationAfterEditingEffect:v7 updatedText:v8];
}

- (id)effectEditorView:(id)a3 endEditingAnimationFromFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  char v7 = objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v10 = *MEMORY[0x263F010E0];
    uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
    id v8 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)effectEditorView:(id)a3 endEditingAnimationToFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  char v7 = [(CFXFullScreenTextEditViewController *)self textEffect];
  id v8 = [v7 jtEffect];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = *MEMORY[0x263F010E0];
    uint64_t v12 = *(void *)(MEMORY[0x263F010E0] + 16);
    id v9 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v8, 1, &v11, 1, 1, 1, width, height);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)effectEditorView:(id)a3 didStartEndEditingAnimationForEffect:(id)a4
{
  -[CFXFullScreenTextEditViewController setIsRunningAnimation:](self, "setIsRunningAnimation:", 1, a4);
  [(CFXFullScreenTextEditViewController *)self CFX_animateWithDuration:0 animatingIn:0 completion:0.4];
}

- (void)effectEditorView:(id)a3 didCompleteEndEditingAnimationForEffect:(id)a4 completion:(id)a5
{
  id v9 = (void (**)(void))a5;
  [(CFXFullScreenTextEditViewController *)self setIsRunningAnimation:0];
  id v6 = [(CFXFullScreenTextEditViewController *)self delegate];

  if (v6)
  {
    char v7 = [(CFXFullScreenTextEditViewController *)self delegate];
    id v8 = [(CFXFullScreenTextEditViewController *)self textEffect];
    [v7 fullScreenTextEditViewController:self didFinishAnimationAfterEditingEffect:v8 completion:v9];
  }
  else
  {
    v9[2]();
  }
}

- (id)effectEditorView:(id)a3 calculateAnimatedFaceTrackingTransformWithCurrentFaceTrackingDataFromTrackingType:(int64_t)a4 interpolatedWithFaceTrackingTransform:(id)a5 toTrackingType:(int64_t)a6 atAnimationProgress:(float)a7
{
  id v11 = a5;
  uint64_t v12 = +[JFXVideoCameraController sharedInstance];
  double v13 = [v12 mostRecentARMetadata];

  double v14 = [v13 faceAnchor];

  if (v14)
  {
    double v15 = [(CFXFullScreenTextEditViewController *)self delegate];
    uint64_t v16 = [v15 faceTrackingInterfaceOrientationForfullScreenTextEditViewController:self];

    double v17 = [JFXFaceTrackingTransformCalculator alloc];
    double v18 = +[CFXMediaSettings sharedInstance];
    [v18 renderSize];
    long long v19 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:](v17, "initWithARMetaData:outputSize:playableInterfaceOrientation:", v13, v16);

    uint64_t v20 = [(JFXFaceTrackingTransformCalculator *)v19 calculateFaceTrackingTransform];
    [v11 cameraTransform];
    double v56 = v22;
    double v57 = v21;
    double v54 = v24;
    double v55 = v23;
    [v20 cameraTransform];
    *(float *)&uint64_t v44 = a7;
    +[JFXFaceTrackingTransformCalculator interpolateFrom:to:fraction:](JFXFaceTrackingTransformCalculator, "interpolateFrom:to:fraction:", v57, v56, v55, v54, v25, v26, v27, v28, v44);
    [v11 transformForTrackingType:a4];
    double v50 = v30;
    double v52 = v29;
    double v46 = v32;
    double v48 = v31;
    [v20 transformForTrackingType:a6];
    *(float *)&uint64_t v45 = a7;
    +[JFXFaceTrackingTransformCalculator interpolateFrom:to:fraction:](JFXFaceTrackingTransformCalculator, "interpolateFrom:to:fraction:", v52, v50, v48, v46, v33, v34, v35, v36, v45);
    long long v51 = v38;
    long long v53 = v37;
    long long v47 = v40;
    long long v49 = v39;
    double v41 = [JFXFaceTrackedEffectTransform alloc];
    [v11 cameraProjection];
    double v42 = -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:](v41, "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v53, v51, v49, v47, v53, v51, v49, v47);
  }
  else
  {
    double v42 = 0;
  }

  return v42;
}

+ (id)CFX_fadeTimingParameters
{
  if (CFX_fadeTimingParameters_onceToken != -1) {
    dispatch_once(&CFX_fadeTimingParameters_onceToken, &__block_literal_global_26);
  }
  id v2 = (void *)CFX_fadeTimingParameters_sFadeTimingParameters;
  return v2;
}

uint64_t __63__CFXFullScreenTextEditViewController_CFX_fadeTimingParameters__block_invoke()
{
  CFX_fadeTimingParameters_sFadeTimingParameters = [objc_alloc(MEMORY[0x263F1C9B0]) initWithDampingRatio:0.968245837];
  return MEMORY[0x270F9A758]();
}

- (void)CFX_animateWithDuration:(double)a3 animatingIn:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = objc_msgSend((id)objc_opt_class(), "CFX_fadeTimingParameters");
  long long v10 = (void *)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v9 timingParameters:a3];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke;
  v13[3] = &unk_264C0A0C0;
  v13[4] = self;
  BOOL v14 = a4;
  [v10 addAnimations:v13];
  if (v8)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke_2;
    v11[3] = &unk_264C0AA48;
    id v12 = v8;
    [v10 addCompletion:v11];
  }
  [v10 setUserInteractionEnabled:0];
  [v10 startAnimation];
}

void __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) dimmingView];
  [v2 setAlpha:v1];
}

uint64_t __86__CFXFullScreenTextEditViewController_CFX_animateWithDuration_animatingIn_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CFXEffect)textEffect
{
  return self->_textEffect;
}

- (CFXEffect)workingEffect
{
  return self->_workingEffect;
}

- (void)setWorkingEffect:(id)a3
{
}

- (CFXEffectEditorView)effectEditor
{
  return self->_effectEditor;
}

- (void)setEffectEditor:(id)a3
{
}

- (CFXFullScreenTextEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXFullScreenTextEditViewControllerDelegate *)WeakRetained;
}

- (BOOL)effectWasRemoved
{
  return self->_effectWasRemoved;
}

- (void)setEffectWasRemoved:(BOOL)a3
{
  self->_effectWasRemoved = a3;
}

- (CGRect)effectEditorFrameRelativeToScreen
{
  double x = self->_effectEditorFrameRelativeToScreen.origin.x;
  double y = self->_effectEditorFrameRelativeToScreen.origin.y;
  double width = self->_effectEditorFrameRelativeToScreen.size.width;
  double height = self->_effectEditorFrameRelativeToScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEffectEditorFrameRelativeToScreen:(CGRect)a3
{
  self->_effectEditorFrameRelativeToScreen = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)isRunningAnimation
{
  return self->_isRunningAnimation;
}

- (void)setIsRunningAnimation:(BOOL)a3
{
  self->_isRunningAnimation = a3;
}

- (BOOL)insertingEffect
{
  return self->_insertingEffect;
}

- (void)setInsertingEffect:(BOOL)a3
{
  self->_insertingEffect = a3;
}

- (JFXOverlayEffectDebugViewOptions)debugOptions
{
  return self->_debugOptions;
}

- (void)setDebugOptions:(id)a3
{
}

- (UIView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_debugOptions, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectEditor, 0);
  objc_storeStrong((id *)&self->_workingEffect, 0);
  objc_storeStrong((id *)&self->_textEffect, 0);
}

@end
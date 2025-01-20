@interface CKBrowserDragViewController
+ (BOOL)supportsForceTouch;
- (BOOL)_orbScalingEnabled;
- (BOOL)canPeel;
- (BOOL)canRotate;
- (BOOL)canScale;
- (BOOL)hasMovedToWindow;
- (BOOL)isPressed;
- (CGPoint)anchorOffset;
- (CGPoint)dragViewCenter;
- (CGPoint)keyboardAnchorOffset;
- (CGPoint)keyboardDragViewCenter;
- (CGPoint)previousPanLocationInKeyboardView;
- (CGPoint)previousPanLocationInView;
- (CGRect)keyboardSourceRect;
- (CGRect)sourceRect;
- (CKAnimatedImage)dragImage;
- (CKBrowserDragStickerView)keyboardDragView;
- (CKBrowserDragStickerView)normalDragView;
- (CKBrowserDragViewController)initWithDragImage:(id)a3 inSourceRect:(CGRect)a4 withSourcePoint:(CGPoint)a5 keyboardSourceRect:(CGRect)a6 keyboardSourcePoint:(CGPoint)a7 withGestureRecognizer:(id)a8;
- (CKBrowserDragViewControllerDelegate)delegate;
- (UILongPressGestureRecognizer)gestureRecognizer;
- (UIPanGestureRecognizer)keyboardPanGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)keyboardWindowSourceView;
- (double)absoluteScale;
- (double)dragViewRotation;
- (double)dragViewScale;
- (double)rotationAngle;
- (id)draggedSticker;
- (void)_reversePeelAnimationToPoint:(CGPoint)a3 keyboardPoint:(CGPoint)a4 forPlacement:(BOOL)a5 shouldShrink:(BOOL)a6 completionBlock:(id)a7;
- (void)animateBackToSourceCompletionBlock:(id)a3;
- (void)animatePlacementAtPoint:(CGPoint)a3 shouldShrink:(BOOL)a4 completionBlock:(id)a5;
- (void)applicationDidEnterBackground:(id)a3;
- (void)commitDrag;
- (void)dealloc;
- (void)gestureRecognized:(id)a3;
- (void)manuallyInitializeDragAtPoint:(CGPoint)a3;
- (void)manuallyUpdateDragPositionToPoint:(CGPoint)a3;
- (void)panGestureRecognized:(id)a3;
- (void)setAnchorOffset:(CGPoint)a3;
- (void)setCanPeel:(BOOL)a3;
- (void)setCanRotate:(BOOL)a3;
- (void)setCanScale:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDragImage:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setHasMovedToWindow:(BOOL)a3;
- (void)setKeyboardAnchorOffset:(CGPoint)a3;
- (void)setKeyboardDragView:(id)a3;
- (void)setKeyboardPanGestureRecognizer:(id)a3;
- (void)setKeyboardSourceRect:(CGRect)a3;
- (void)setKeyboardWindowSourceView:(id)a3;
- (void)setNormalDragView:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPlusImageViewHidden:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPreviousPanLocationInKeyboardView:(CGPoint)a3;
- (void)setPreviousPanLocationInView:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKBrowserDragViewController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserDragViewController;
  [(CKBrowserDragViewController *)&v4 dealloc];
}

- (CKBrowserDragViewController)initWithDragImage:(id)a3 inSourceRect:(CGRect)a4 withSourcePoint:(CGPoint)a5 keyboardSourceRect:(CGRect)a6 keyboardSourcePoint:(CGPoint)a7 withGestureRecognizer:(id)a8
{
  CGFloat x = a7.x;
  CGFloat y = a5.y;
  CGFloat v10 = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v16 = a3;
  id v17 = *(id *)&x;
  v27.receiver = self;
  v27.super_class = (Class)CKBrowserDragViewController;
  v18 = [(CKBrowserDragViewController *)&v27 initWithNibName:0 bundle:0];
  v19 = v18;
  if (v18)
  {
    [(CKBrowserDragViewController *)v18 setGestureRecognizer:v17];
    [(CKBrowserDragViewController *)v19 setDragImage:v16];
    -[CKBrowserDragViewController setSourceRect:](v19, "setSourceRect:", v14, v13, width, height);
    -[CKBrowserDragViewController setKeyboardSourceRect:](v19, "setKeyboardSourceRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
    v20.f64[0] = v14;
    v21.f64[0] = width;
    v22.f64[0] = v10;
    [(CKBrowserDragViewController *)v19 setAnchorOffset:CKAnchorOffset(v20, v13, v21, height, v22, y)];
    v23.f64[0] = a6.origin.x;
    v24.f64[0] = a6.size.width;
    v25.f64[0] = v28;
    [(CKBrowserDragViewController *)v19 setKeyboardAnchorOffset:CKAnchorOffset(v23, a6.origin.y, v24, a6.size.height, v25, v29)];
  }

  return v19;
}

- (double)absoluteScale
{
  [(CKBrowserDragViewController *)self dragViewScale];
  double v4 = v3;
  v5 = [(CKBrowserDragViewController *)self normalDragView];
  [v5 initialScale];
  double v7 = v4 * v6;

  return v7;
}

- (void)animateBackToSourceCompletionBlock:(id)a3
{
  id v31 = a3;
  [(CKBrowserDragViewController *)self sourceRect];
  uint64_t v27 = v5;
  uint64_t v29 = v4;
  uint64_t v25 = v6;
  double v8 = v7;
  uint64_t v9 = MEMORY[0x1E4F1DB28];
  if (CKMainScreenScale_once_81 != -1) {
    dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_270_0);
  }
  double v10 = *(double *)(v9 + 16);
  double v11 = *(double *)(v9 + 24);
  double v12 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
  [(CKBrowserDragViewController *)self keyboardSourceRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (CKMainScreenScale_once_81 != -1) {
    dispatch_once(&CKMainScreenScale_once_81, &__block_literal_global_270_0);
  }
  if (v12 == 0.0) {
    double v21 = 1.0;
  }
  else {
    double v21 = v12;
  }
  double v22 = 1.0 / v21 * (v26 * v21 + floor((v8 * v21 - v11 * v21) * 0.5));
  double v23 = 1.0 / v21 * (v30 * v21 + floor((v28 * v21 - v10 * v21) * 0.5));
  double v24 = *(double *)&CKMainScreenScale_sMainScreenScale_81;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_81 == 0.0) {
    double v24 = 1.0;
  }
  -[CKBrowserDragViewController _reversePeelAnimationToPoint:keyboardPoint:forPlacement:shouldShrink:completionBlock:](self, "_reversePeelAnimationToPoint:keyboardPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v31, v23, v22, 1.0 / v24 * (v14 * v24 + floor((v18 * v24 - v10 * v24) * 0.5)), 1.0 / v24 * (v16 * v24 + floor((v20 * v24 - v11 * v24) * 0.5)));
}

- (void)animatePlacementAtPoint:(CGPoint)a3 shouldShrink:(BOOL)a4 completionBlock:(id)a5
{
}

- (void)_reversePeelAnimationToPoint:(CGPoint)a3 keyboardPoint:(CGPoint)a4 forPlacement:(BOOL)a5 shouldShrink:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  double y = a3.y;
  double x = a3.x;
  id v12 = a7;
  double v13 = [(CKBrowserDragViewController *)self normalDragView];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__CKBrowserDragViewController__reversePeelAnimationToPoint_keyboardPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
  v15[3] = &unk_1E5620F48;
  id v16 = v12;
  id v14 = v12;
  objc_msgSend(v13, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", v8, v7, v15, x, y);
}

uint64_t __116__CKBrowserDragViewController__reversePeelAnimationToPoint_keyboardPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPlusImageViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CKBrowserDragViewController *)self normalDragView];
  [v5 setPlusImageViewHidden:v3];

  id v6 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v6 setPlusImageViewHidden:v3];
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)CKBrowserDragViewController;
  [(CKBrowserDragViewController *)&v46 viewDidLoad];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
  uint64_t v4 = [(CKBrowserDragViewController *)self dragImage];

  if (v4)
  {
    uint64_t v5 = [CKBrowserDragStickerView alloc];
    [(CKBrowserDragViewController *)self sourceRect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(CKBrowserDragViewController *)self dragImage];
    double v15 = -[CKBrowserDragStickerView initWithSourceRect:dragImage:](v5, "initWithSourceRect:dragImage:", v14, v7, v9, v11, v13);
    [(CKBrowserDragViewController *)self setNormalDragView:v15];

    BOOL v16 = [(CKBrowserDragViewController *)self canPeel];
    double v17 = [(CKBrowserDragViewController *)self normalDragView];
    [v17 setCanPeel:v16];

    BOOL v18 = [(CKBrowserDragViewController *)self isPressed];
    double v19 = [(CKBrowserDragViewController *)self normalDragView];
    [v19 setPressed:v18];

    double v20 = [(CKBrowserDragViewController *)self view];
    double v21 = [(CKBrowserDragViewController *)self normalDragView];
    [v20 addSubview:v21];

    double v22 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];

    if (v22)
    {
      double v23 = [CKBrowserDragStickerView alloc];
      [(CKBrowserDragViewController *)self sourceRect];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v32 = [(CKBrowserDragViewController *)self dragImage];
      v33 = -[CKBrowserDragStickerView initWithSourceRect:dragImage:](v23, "initWithSourceRect:dragImage:", v32, v25, v27, v29, v31);
      [(CKBrowserDragViewController *)self setKeyboardDragView:v33];

      BOOL v34 = [(CKBrowserDragViewController *)self canPeel];
      v35 = [(CKBrowserDragViewController *)self keyboardDragView];
      [v35 setCanPeel:v34];

      BOOL v36 = [(CKBrowserDragViewController *)self isPressed];
      v37 = [(CKBrowserDragViewController *)self keyboardDragView];
      [v37 setPressed:v36];

      v38 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];
      v39 = [(CKBrowserDragViewController *)self keyboardDragView];
      [v38 addSubview:v39];
    }
  }
  v40 = [(CKBrowserDragViewController *)self gestureRecognizer];
  [v40 addTarget:self action:sel_gestureRecognized_];

  v41 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel_panGestureRecognized_];
  v42 = [(CKBrowserDragViewController *)self view];
  [v42 addGestureRecognizer:v41];

  [(CKBrowserDragViewController *)self setPanGestureRecognizer:v41];
  v43 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];

  if (v43)
  {
    v44 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel_panGestureRecognized_];
    v45 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];
    [v45 addGestureRecognizer:v44];

    [(CKBrowserDragViewController *)self setKeyboardPanGestureRecognizer:v44];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CKBrowserDragViewController;
  [(CKBrowserDragViewController *)&v26 viewDidAppear:a3];
  uint64_t v4 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v4 animatePeelWithCompletion:0];

  uint64_t v5 = [(CKBrowserDragViewController *)self normalDragView];
  [v5 animatePeelWithCompletion:0];

  double v6 = [(CKBrowserDragViewController *)self gestureRecognizer];
  double v7 = [(CKBrowserDragViewController *)self view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CKBrowserDragViewController *)self normalDragView];
  objc_msgSend(v12, "setInitialDragStartPosition:", v9, v11);

  double v13 = [(CKBrowserDragViewController *)self gestureRecognizer];
  id v14 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];
  [v13 locationInView:v14];
  double v16 = v15;
  double v18 = v17;
  double v19 = [(CKBrowserDragViewController *)self keyboardDragView];
  objc_msgSend(v19, "setInitialDragStartPosition:", v16, v18);

  if (![(CKBrowserDragViewController *)self isPressed])
  {
    [(CKBrowserDragViewController *)self setPressed:1];
    double v20 = [(CKBrowserDragViewController *)self normalDragView];
    double v21 = [(CKBrowserDragViewController *)self normalDragView];
    [v21 initialDragStartPosition];
    objc_msgSend(v20, "attachElasticEffectsForLocation:");

    double v22 = [(CKBrowserDragViewController *)self keyboardDragView];
    double v23 = [(CKBrowserDragViewController *)self keyboardDragView];
    [v23 initialDragStartPosition];
    objc_msgSend(v22, "attachElasticEffectsForLocation:");
  }
  double v24 = [(CKBrowserDragViewController *)self normalDragView];
  [v24 updateAnimationTimerObserving];

  double v25 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v25 updateAnimationTimerObserving];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKBrowserDragViewController;
  [(CKBrowserDragViewController *)&v9 viewDidDisappear:a3];
  uint64_t v4 = [(CKBrowserDragViewController *)self normalDragView];
  [v4 updateAnimationTimerObserving];

  uint64_t v5 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v5 updateAnimationTimerObserving];

  double v6 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v6 removeFromSuperview];

  double v7 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];
  double v8 = [(CKBrowserDragViewController *)self keyboardPanGestureRecognizer];
  [v7 removeGestureRecognizer:v8];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = [(CKBrowserDragViewController *)self delegate];
  [v5 browserDragViewController:self dragEndedWithTarget:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserDragViewController;
  [(CKBrowserDragViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(CKBrowserDragViewController *)self setHasMovedToWindow:1];
}

- (void)gestureRecognized:(id)a3
{
  id v35 = a3;
  uint64_t v4 = [(CKBrowserDragViewController *)self view];
  objc_super v5 = [v4 window];
  if (!v5 && [(CKBrowserDragViewController *)self hasMovedToWindow])
  {

LABEL_13:
    [(CKBrowserDragViewController *)self setPressed:0];
    v33 = [(CKBrowserDragViewController *)self normalDragView];
    [v33 detachElasticEffects];

    BOOL v34 = [(CKBrowserDragViewController *)self keyboardDragView];
    [v34 detachElasticEffects];

    [(CKBrowserDragViewController *)self commitDrag];
    goto LABEL_14;
  }
  if ([v35 state] == 1)
  {
  }
  else
  {
    uint64_t v6 = [v35 state];

    if (v6 != 2) {
      goto LABEL_13;
    }
  }
  if ([(CKBrowserDragViewController *)self isPressed])
  {
    double v7 = [(CKBrowserDragViewController *)self normalDragView];
    double v8 = [(CKBrowserDragViewController *)self view];
    [v35 locationInView:v8];
    objc_msgSend(v7, "updateElasticEffectsForLocation:");

    objc_super v9 = [(CKBrowserDragViewController *)self keyboardDragView];
    double v10 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];
    [v35 locationInView:v10];
    objc_msgSend(v9, "updateElasticEffectsForLocation:");
  }
  if ([(CKBrowserDragViewController *)self _orbScalingEnabled]
    && [(CKBrowserDragViewController *)self canScale])
  {
    double v11 = [v35 touches];
    double v12 = [v11 firstObject];

    [v12 force];
    double v14 = v13;
    [v12 maximumPossibleForce];
    double v16 = v14 / v15 + v14 / v15;
    double v17 = [(CKBrowserDragViewController *)self normalDragView];
    [v17 setDragViewScale:v16];

    double v18 = [(CKBrowserDragViewController *)self keyboardDragView];
    [v18 setDragViewScale:v16];
  }
  [(CKBrowserDragViewController *)self dragViewCenter];
  double v20 = v19;
  double v22 = v21;
  double v23 = [(CKBrowserDragViewController *)self normalDragView];
  [v23 initialSize];
  double v25 = v24;
  double v27 = v26;
  [(CKBrowserDragViewController *)self absoluteScale];
  double v29 = v28;
  [(CKBrowserDragViewController *)self rotationAngle];
  double v31 = +[CKBrowserDragControllerTarget targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:](CKBrowserDragControllerTarget, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:", 0, v20, v22, v25, v27, v29, 1.4, v30);

  v32 = [(CKBrowserDragViewController *)self delegate];
  [v32 browserDragViewController:self draggedWithTarget:v31];

LABEL_14:
}

- (CGPoint)dragViewCenter
{
  v2 = [(CKBrowserDragViewController *)self normalDragView];
  [v2 dragViewCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)keyboardDragViewCenter
{
  v2 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v2 dragViewCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)manuallyInitializeDragAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CKBrowserDragViewController *)self setPressed:1];
  double v6 = [(CKBrowserDragViewController *)self normalDragView];
  objc_msgSend(v6, "attachElasticEffectsForLocation:", x, y);

  id v7 = [(CKBrowserDragViewController *)self keyboardDragView];
  objc_msgSend(v7, "attachElasticEffectsForLocation:", x, y);
}

- (void)manuallyUpdateDragPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CKBrowserDragViewController *)self normalDragView];
  objc_msgSend(v6, "updateElasticEffectsForLocation:", x, y);

  id v7 = [(CKBrowserDragViewController *)self keyboardDragView];
  objc_msgSend(v7, "updateElasticEffectsForLocation:", x, y);
}

- (void)panGestureRecognized:(id)a3
{
  id v45 = a3;
  id v4 = [(CKBrowserDragViewController *)self keyboardPanGestureRecognizer];

  if (v4 == v45)
  {
    double v5 = [(CKBrowserDragViewController *)self keyboardWindowSourceView];
    if ([v45 state] == 1)
    {
      [v45 locationInView:v5];
      double v11 = self;
      goto LABEL_21;
    }
  }
  else
  {
    double v5 = [(CKBrowserDragViewController *)self view];
    if ([v45 state] == 1)
    {
      [v45 locationInView:v5];
      double v8 = self;
LABEL_19:
      -[CKBrowserDragViewController setPreviousPanLocationInView:](v8, "setPreviousPanLocationInView:", v6, v7);
      goto LABEL_22;
    }
  }
  if ([v45 state] == 2)
  {
    [v45 locationInView:v5];
    double v13 = v12;
    double v15 = v14;
    if (v4 == v45)
    {
      [(CKBrowserDragViewController *)self previousPanLocationInKeyboardView];
      double v17 = v24;
      double v19 = v25;
      [(CKBrowserDragViewController *)self keyboardDragViewCenter];
    }
    else
    {
      [(CKBrowserDragViewController *)self previousPanLocationInView];
      double v17 = v16;
      double v19 = v18;
      [(CKBrowserDragViewController *)self dragViewCenter];
    }
    double v26 = v20;
    double v27 = v21;
    if ([(CKBrowserDragViewController *)self canRotate])
    {
      double v28 = atan2(v15 - v27, v13 - v26);
      long double v29 = v28 - atan2(v19 - v27, v17 - v26);
      [(CKBrowserDragViewController *)self rotationAngle];
      [(CKBrowserDragViewController *)self setRotationAngle:(double)(v29 + v30)];
    }
    if (![(CKBrowserDragViewController *)self _orbScalingEnabled]
      && [(CKBrowserDragViewController *)self canScale])
    {
      float v31 = v26 - v17;
      float v32 = v27 - v19;
      double v33 = hypotf(v31, v32);
      float v34 = v26 - v13;
      float v35 = v27 - v15;
      double v36 = hypotf(v34, v35) - v33;
      v37 = +[CKUIBehavior sharedBehaviors];
      [v37 dragPinchGestureScaleFactor];
      double v39 = v36 / v38;

      v40 = [(CKBrowserDragViewController *)self normalDragView];
      [v40 dragViewScale];
      double v42 = v39 + v41;

      v43 = [(CKBrowserDragViewController *)self normalDragView];
      [v43 setDragViewScale:v42];

      v44 = [(CKBrowserDragViewController *)self keyboardDragView];
      [v44 setDragViewScale:v42];
    }
    -[CKBrowserDragViewController setPreviousPanLocationInView:](self, "setPreviousPanLocationInView:", v13, v15);
    if (v4 != v45)
    {
      double v8 = self;
      double v6 = v13;
      double v7 = v15;
      goto LABEL_19;
    }
    double v11 = self;
    double v9 = v13;
    double v10 = v15;
  }
  else
  {
    if ([v45 state] != 3) {
      goto LABEL_22;
    }
    double v22 = *MEMORY[0x1E4F1DAD8];
    double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[CKBrowserDragViewController setPreviousPanLocationInView:](self, "setPreviousPanLocationInView:", *MEMORY[0x1E4F1DAD8], v23);
    double v11 = self;
    double v9 = v22;
    double v10 = v23;
  }
LABEL_21:
  -[CKBrowserDragViewController setPreviousPanLocationInKeyboardView:](v11, "setPreviousPanLocationInKeyboardView:", v9, v10);
LABEL_22:
}

- (BOOL)_orbScalingEnabled
{
  return 0;
}

- (double)dragViewScale
{
  v2 = [(CKBrowserDragViewController *)self normalDragView];
  [v2 dragViewScale];
  double v4 = v3;

  return v4;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = [(CKBrowserDragViewController *)self delegate];
  [v4 browserDragViewController:self dragEndedWithTarget:0];
}

- (void)commitDrag
{
  double v3 = [(CKBrowserDragViewController *)self gestureRecognizer];
  [v3 removeTarget:self action:sel_gestureRecognized_];

  [(CKBrowserDragViewController *)self setGestureRecognizer:0];
  [(CKBrowserDragViewController *)self dragViewCenter];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(CKBrowserDragViewController *)self normalDragView];
  [v8 initialSize];
  double v10 = v9;
  double v12 = v11;
  [(CKBrowserDragViewController *)self absoluteScale];
  double v14 = v13;
  [(CKBrowserDragViewController *)self rotationAngle];
  +[CKBrowserDragControllerTarget targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:](CKBrowserDragControllerTarget, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:", 0, v5, v7, v10, v12, v14, 1.4, v15);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  double v16 = [(CKBrowserDragViewController *)self delegate];
  [v16 browserDragViewController:self dragEndedWithTarget:v17];
}

- (void)setRotationAngle:(double)a3
{
  double v5 = [(CKBrowserDragViewController *)self normalDragView];
  [v5 setRotationAngle:a3];

  id v6 = [(CKBrowserDragViewController *)self keyboardDragView];
  [v6 setRotationAngle:a3];
}

- (double)rotationAngle
{
  v2 = [(CKBrowserDragViewController *)self normalDragView];
  [v2 rotationAngle];
  double v4 = v3;

  return v4;
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    BOOL v3 = a3;
    self->_pressed = a3;
    double v5 = [(CKBrowserDragViewController *)self normalDragView];
    [v5 setPressed:v3];

    id v6 = [(CKBrowserDragViewController *)self keyboardDragView];
    [v6 setPressed:v3];
  }
}

- (void)setCanPeel:(BOOL)a3
{
  if (self->_canPeel != a3)
  {
    BOOL v3 = a3;
    self->_canPeel = a3;
    double v5 = [(CKBrowserDragViewController *)self normalDragView];
    [v5 setCanPeel:v3];

    id v6 = [(CKBrowserDragViewController *)self keyboardDragView];
    [v6 setCanPeel:v3];
  }
}

+ (BOOL)supportsForceTouch
{
  if (supportsForceTouch_once != -1) {
    dispatch_once(&supportsForceTouch_once, &__block_literal_global_201);
  }
  return supportsForceTouch_supportsForceTouch;
}

uint64_t __49__CKBrowserDragViewController_supportsForceTouch__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  supportsForceTouch_supportsForceTouch = result;
  return result;
}

- (id)draggedSticker
{
  v2 = [(CKBrowserDragViewController *)self normalDragView];
  BOOL v3 = [v2 draggedSticker];

  return v3;
}

- (CKBrowserDragViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserDragViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)dragViewRotation
{
  return self->_dragViewRotation;
}

- (BOOL)canRotate
{
  return self->_canRotate;
}

- (void)setCanRotate:(BOOL)a3
{
  self->_canRotate = a3;
}

- (BOOL)canScale
{
  return self->_canScale;
}

- (void)setCanScale:(BOOL)a3
{
  self->_canScale = a3;
}

- (BOOL)canPeel
{
  return self->_canPeel;
}

- (UIView)keyboardWindowSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardWindowSourceView);

  return (UIView *)WeakRetained;
}

- (void)setKeyboardWindowSourceView:(id)a3
{
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (CKAnimatedImage)dragImage
{
  return self->_dragImage;
}

- (void)setDragImage:(id)a3
{
}

- (CKBrowserDragStickerView)normalDragView
{
  return self->_normalDragView;
}

- (void)setNormalDragView:(id)a3
{
}

- (CKBrowserDragStickerView)keyboardDragView
{
  return self->_keyboardDragView;
}

- (void)setKeyboardDragView:(id)a3
{
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (UIPanGestureRecognizer)keyboardPanGestureRecognizer
{
  return self->_keyboardPanGestureRecognizer;
}

- (void)setKeyboardPanGestureRecognizer:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGRect)keyboardSourceRect
{
  double x = self->_keyboardSourceRect.origin.x;
  double y = self->_keyboardSourceRect.origin.y;
  double width = self->_keyboardSourceRect.size.width;
  double height = self->_keyboardSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardSourceRect:(CGRect)a3
{
  self->_keyboardSourceRect = a3;
}

- (CGPoint)anchorOffset
{
  double x = self->_anchorOffset.x;
  double y = self->_anchorOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorOffset:(CGPoint)a3
{
  self->_anchorOffset = a3;
}

- (CGPoint)keyboardAnchorOffset
{
  double x = self->_keyboardAnchorOffset.x;
  double y = self->_keyboardAnchorOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setKeyboardAnchorOffset:(CGPoint)a3
{
  self->_keyboardAnchorOffset = a3;
}

- (CGPoint)previousPanLocationInView
{
  double x = self->_previousPanLocationInView.x;
  double y = self->_previousPanLocationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousPanLocationInView:(CGPoint)a3
{
  self->_previousPanLocationInView = a3;
}

- (CGPoint)previousPanLocationInKeyboardView
{
  double x = self->_previousPanLocationInKeyboardView.x;
  double y = self->_previousPanLocationInKeyboardView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousPanLocationInKeyboardView:(CGPoint)a3
{
  self->_previousPanLocationInKeyboardView = a3;
}

- (BOOL)hasMovedToWindow
{
  return self->_hasMovedToWindow;
}

- (void)setHasMovedToWindow:(BOOL)a3
{
  self->_hasMovedToWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_keyboardDragView, 0);
  objc_storeStrong((id *)&self->_normalDragView, 0);
  objc_storeStrong((id *)&self->_dragImage, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_keyboardWindowSourceView);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
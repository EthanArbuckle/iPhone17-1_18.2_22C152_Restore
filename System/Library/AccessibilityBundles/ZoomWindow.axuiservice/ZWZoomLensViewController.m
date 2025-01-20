@interface ZWZoomLensViewController
- (BOOL)_minimumZoomIndistinguishableFromStandbyMode;
- (BOOL)_shouldDisableLensEffectsForStandbyMode;
- (BOOL)_shouldRoundLensCorners;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)inStandbyMode;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldPanZoomContentForAxis:(int64_t)a3 delta:(CGPoint)a4 edgeMask:(unint64_t)a5;
- (BOOL)userIsInteractingWithLens;
- (BOOL)userIsMovingLens;
- (CGPoint)_lensDragMultiplier;
- (CGPoint)dummyScrollViewDefaultOffset;
- (CGPoint)dummyScrollViewOffsetForSlug;
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (CGPoint)offsetByPanningToPoint:(CGPoint)a3 zoomFactor:(double)a4;
- (CGPoint)offsetByPanningToRect:(CGRect)a3 zoomFactor:(double)a4;
- (CGPoint)offsetByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFactor:(double)a5;
- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningToRect:(CGRect)a3 zoomFacotr:(double)a4;
- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFacotr:(double)a5;
- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4;
- (CGPoint)zoomPanOffset;
- (CGSize)dummyScrollViewContentSize;
- (NSString)identifier;
- (NSString)lensEffect;
- (NSString)screenshotActionHandlerIdentifier;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIScreen)screen;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (ZWCancelButtonTouchesScrollView)dummyScrollView;
- (ZWLensZoomView)lensZoomView;
- (ZWZoomLensViewController)initWithZoomFactor:(double)a3 zoomPanOffset:(CGPoint)a4 lensEffect:(id)a5 screen:(id)a6;
- (ZWZoomLensViewControllerDelegate)delegate;
- (double)zoomFactor;
- (id)dummyScrollViewPanGestureRecognizer;
- (id)standbyFinishedTransitioningUnitTestCallback;
- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4;
- (void)_handleLongPress:(id)a3;
- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)handleFluidSwitcherGestureWillBegin;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDummyScrollView:(id)a3;
- (void)setInStandbyMode:(BOOL)a3;
- (void)setLensEffect:(id)a3;
- (void)setLensZoomView:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setScreen:(id)a3;
- (void)setScreenshotActionHandlerIdentifier:(id)a3;
- (void)setStandbyFinishedTransitioningUnitTestCallback:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setUserIsInteractingWithLens:(BOOL)a3;
- (void)setUserIsMovingLens:(BOOL)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)updateStandbyMode:(BOOL)a3 zoomFactor:(double)a4 panOffset:(CGPoint)a5 lensEffect:(id)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7;
- (void)viewDidLoad;
@end

@implementation ZWZoomLensViewController

- (ZWZoomLensViewController)initWithZoomFactor:(double)a3 zoomPanOffset:(CGPoint)a4 lensEffect:(id)a5 screen:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)ZWZoomLensViewController;
  v13 = [(ZWZoomLensViewController *)&v25 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    [(ZWZoomLensViewController *)v13 setZoomFactor:a3];
    -[ZWZoomLensViewController setZoomPanOffset:](v14, "setZoomPanOffset:", x, y);
    [(ZWZoomLensViewController *)v14 setLensEffect:v11];
    [(ZWZoomLensViewController *)v14 setScreen:v12];
    v14->_inStandbyMode = 1;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__0;
    v23[4] = __Block_byref_object_dispose__0;
    v15 = v14;
    v24 = v15;
    v16 = +[AXSpringBoardServer server];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __79__ZWZoomLensViewController_initWithZoomFactor_zoomPanOffset_lensEffect_screen___block_invoke;
    v20[3] = &unk_791D0;
    v21 = v15;
    v22 = v23;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __79__ZWZoomLensViewController_initWithZoomFactor_zoomPanOffset_lensEffect_screen___block_invoke_5;
    v18[3] = &unk_791F8;
    v19 = v21;
    [v16 registerSpringBoardActionHandler:v20 withIdentifierCallback:v18];

    _Block_object_dispose(v23, 8);
  }

  return v14;
}

void __79__ZWZoomLensViewController_initWithZoomFactor_zoomPanOffset_lensEffect_screen___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 6)
  {
    v3 = [*(id *)(a1 + 32) lensEffect];
    unsigned int v4 = [v3 isEqualToString:AXZoomLensEffectLowLight];

    if (v4)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) updateLensEffect:AXZoomLensEffectNone animated:0 completion:&__block_literal_global_4];
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

id __79__ZWZoomLensViewController_initWithZoomFactor_zoomPanOffset_lensEffect_screen___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) updateLensEffect:AXZoomLensEffectLowLight animated:1 completion:&__block_literal_global_267];
}

id __79__ZWZoomLensViewController_initWithZoomFactor_zoomPanOffset_lensEffect_screen___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setScreenshotActionHandlerIdentifier:a2];
}

- (void)loadView
{
  v24 = [[ZWLensRootView alloc] initWithDelegate:self];
  [(ZWZoomLensViewController *)self setView:v24];
  [(ZWLensRootView *)v24 setAccessibilityContainerType:4];
  v3 = ZWLocString(@"ZW_LENS_TOUCH_CONTAINER_LABEL");
  [(ZWLensRootView *)v24 setAccessibilityLabel:v3];

  [(ZWLensRootView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  unsigned int v4 = [ZWLensZoomView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[ZWLensZoomView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWZoomLensViewController *)self setLensZoomView:v8];
  [(ZWLensRootView *)v24 addSubview:v8];
  v9 = +[AXSettings sharedInstance];
  v10 = [v9 zoomCurrentLensEffect];
  [(ZWLensZoomView *)v8 updateLensEffect:v10 animated:0 completion:0];

  [(ZWLensZoomView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v11 = -[ZWCancelButtonTouchesScrollView initWithFrame:]([ZWCancelButtonTouchesScrollView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(ZWLensRootView *)v24 addSubview:v11];
  [(ZWCancelButtonTouchesScrollView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ZWCancelButtonTouchesScrollView *)v11 setCanCancelContentTouches:1];
  [(ZWCancelButtonTouchesScrollView *)v11 setContentInsetAdjustmentBehavior:2];
  LODWORD(v12) = AXResistAllCompressingAndStretching[0];
  LODWORD(v13) = AXResistAllCompressingAndStretching[1];
  LODWORD(v14) = AXResistAllCompressingAndStretching[2];
  LODWORD(v15) = AXResistAllCompressingAndStretching[3];
  -[ZWCancelButtonTouchesScrollView ax_setContentHuggingAndCompressionResistance:](v11, "ax_setContentHuggingAndCompressionResistance:", v12, v13, v14, v15);
  id v16 = [(ZWCancelButtonTouchesScrollView *)v11 ax_pinConstraintsInAllDimensionsToView:v24];
  [(ZWZoomLensViewController *)self setDummyScrollView:v11];
  [(ZWCancelButtonTouchesScrollView *)v11 setDelegate:self];
  [(ZWZoomLensViewController *)self dummyScrollViewContentSize];
  -[ZWCancelButtonTouchesScrollView setContentSize:](v11, "setContentSize:");
  [(ZWZoomLensViewController *)self dummyScrollViewDefaultOffset];
  -[ZWCancelButtonTouchesScrollView setContentOffset:](v11, "setContentOffset:");
  [(ZWCancelButtonTouchesScrollView *)v11 setBounces:0];
  [(ZWCancelButtonTouchesScrollView *)v11 setHidden:1];
  v17 = [(ZWCancelButtonTouchesScrollView *)v11 panGestureRecognizer];
  [(ZWLensRootView *)v24 addGestureRecognizer:v17];

  id v18 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleLongPress:"];
  [(ZWZoomLensViewController *)self setLongPressGestureRecognizer:v18];
  [v18 setDelegate:self];
  [v18 setMinimumPressDuration:0.02];
  [v18 setAllowableMovement:10000.0];
  [(ZWLensRootView *)v24 addGestureRecognizer:v18];
  id v19 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTap:"];
  [(ZWZoomLensViewController *)self setTapGestureRecognizer:v19];
  [(ZWLensRootView *)v24 addGestureRecognizer:v19];
  [v19 setDelegate:self];
  [(ZWZoomLensViewController *)self zoomFactor];
  double v21 = v20;
  [(ZWZoomLensViewController *)self zoomPanOffset];
  -[ZWZoomLensViewController updateZoomFactor:panOffset:animated:animationDuration:completion:](self, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v21, v22, v23, -1.0);
}

- (void)dealloc
{
  v3 = +[AXSpringBoardServer server];
  unsigned int v4 = [(ZWZoomLensViewController *)self screenshotActionHandlerIdentifier];
  [v3 removeActionHandler:v4];

  v5.receiver = self;
  v5.super_class = (Class)ZWZoomLensViewController;
  [(ZWZoomLensViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ZWZoomLensViewController;
  [(ZWZoomLensViewController *)&v3 viewDidLoad];
  [(ZWZoomLensViewController *)self _applyInitialLayoutConstraints];
}

- (void)updateZoomFactor:(double)a3 panOffset:(CGPoint)a4 animated:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7
{
  BOOL v8 = a5;
  double y = a4.y;
  double x = a4.x;
  id v17 = a7;
  [(ZWZoomLensViewController *)self setZoomFactor:a3];
  -[ZWZoomLensViewController setZoomPanOffset:](self, "setZoomPanOffset:", x, y);
  [(ZWZoomLensViewController *)self zoomFactor];
  if (vabdd_f64(v13, AXZoomMinimumZoomLevel) <= 0.0001
    && [(ZWZoomLensViewController *)self _minimumZoomIndistinguishableFromStandbyMode])
  {
    [(ZWZoomLensViewController *)self setInStandbyMode:1];
  }
  double v14 = [(ZWZoomLensViewController *)self lensZoomView];

  if (v14)
  {
    double v15 = [(ZWZoomLensViewController *)self lensZoomView];
    objc_msgSend(v15, "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:", -[ZWZoomLensViewController _shouldRoundLensCorners](self, "_shouldRoundLensCorners"), v8, v17, x, y, a3, a6);
  }
  else
  {
    id v16 = v17;
    if (!v17) {
      goto LABEL_9;
    }
    (*((void (**)(id))v17 + 2))(v17);
  }
  id v16 = v17;
LABEL_9:
}

- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  BOOL v8 = (void (**)(void))a5;
  [(ZWZoomLensViewController *)self setLensEffect:v11];
  v9 = [(ZWZoomLensViewController *)self lensZoomView];

  if (v9)
  {
    v10 = [(ZWZoomLensViewController *)self lensZoomView];
    [v10 updateLensEffect:v11 animated:v6 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)setInStandbyMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL inStandbyMode = self->_inStandbyMode;
  self->_BOOL inStandbyMode = a3;
  BOOL v6 = +[ZWCoalescedSettings sharedInstance];
  [v6 setZoomInStandby:v3];

  if (inStandbyMode != v3)
  {
    v7 = [(ZWZoomLensViewController *)self delegate];
    [v7 zoomLensViewControllerDidChangeStandbyMode:self];
  }
  id v9 = [(ZWZoomLensViewController *)self dummyScrollView];
  BOOL v8 = [(ZWZoomLensViewController *)self dummyScrollView];
  [v8 contentOffset];
  objc_msgSend(v9, "setContentOffset:animated:", 0);
}

- (void)updateStandbyMode:(BOOL)a3 zoomFactor:(double)a4 panOffset:(CGPoint)a5 lensEffect:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  double y = a5.y;
  double x = a5.x;
  uint64_t v13 = a3;
  id v15 = a6;
  id v16 = a8;
  if (vabdd_f64(a4, AXZoomMinimumZoomLevel) <= 0.0001) {
    uint64_t v13 = [(ZWZoomLensViewController *)self _minimumZoomIndistinguishableFromStandbyMode] | v13;
  }
  [(ZWZoomLensViewController *)self setInStandbyMode:v13];
  [(ZWZoomLensViewController *)self setZoomFactor:a4];
  -[ZWZoomLensViewController setZoomPanOffset:](self, "setZoomPanOffset:", x, y);
  [(ZWZoomLensViewController *)self setLensEffect:v15];
  id v17 = [(ZWZoomLensViewController *)self standbyFinishedTransitioningUnitTestCallback];

  if (!v17)
  {
LABEL_6:
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v16)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke;
    v38[3] = &unk_78FE8;
    v38[4] = self;
    id v39 = v16;
    id v16 = objc_retainBlock(v38);

    goto LABEL_6;
  }
  id v16 = [(ZWZoomLensViewController *)self standbyFinishedTransitioningUnitTestCallback];
  if (v9)
  {
LABEL_7:
    id v18 = [(ZWZoomLensViewController *)self delegate];
    [v18 didStartAnimation];
  }
LABEL_8:
  if (v16)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_2;
    v36[3] = &unk_78FE8;
    v36[4] = self;
    id v37 = v16;
    id v16 = objc_retainBlock(v36);
  }
  id v19 = [(ZWZoomLensViewController *)self view];
  double v20 = [v19 window];

  if (v20)
  {
    double v21 = [(ZWZoomLensViewController *)self view];
    [v21 layoutIfNeeded];
  }
  if (v13)
  {
    unsigned int v22 = [(ZWZoomLensViewController *)self _shouldDisableLensEffectsForStandbyMode];
    double v23 = [(ZWZoomLensViewController *)self lensZoomView];
    if (v22)
    {
      uint64_t v24 = AXZoomLensEffectNone;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_3;
      v33[3] = &unk_78F28;
      v33[4] = self;
      BOOL v35 = v9;
      objc_super v25 = &v34;
      id v34 = v16;
      [v23 updateLensEffect:v24 animated:v9 completion:v33];
    }
    else
    {
      double v26 = AXZoomMinimumZoomLevel;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_6;
      v30[3] = &unk_78F28;
      v30[4] = self;
      BOOL v32 = v9;
      objc_super v25 = &v31;
      id v31 = v16;
      objc_msgSend(v23, "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:", 0, v9, v30, CGPointZero.x, CGPointZero.y, v26, -1.0);
    }
  }
  else
  {
    [(ZWZoomLensViewController *)self _updateLensChromeVisibility:1 animated:v9 completion:0];
    double v23 = [(ZWZoomLensViewController *)self delegate];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_8;
    v27[3] = &unk_78F28;
    v27[4] = self;
    BOOL v29 = v9;
    objc_super v25 = &v28;
    id v28 = v16;
    [v23 zoomLensViewControllerUpdateUIForStandby:self completion:v27];
  }
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = [*(id *)(a1 + 32) standbyFinishedTransitioningUnitTestCallback];
  v2[2]();
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didEndAnimation];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lensZoomView];
  double v3 = AXZoomMinimumZoomLevel;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_4;
  v6[3] = &unk_78F28;
  objc_super v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  char v8 = v4;
  id v7 = v5;
  objc_msgSend(v2, "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:", 0, v4, v6, CGPointZero.x, CGPointZero.y, v3, -1.0);
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_5;
  v3[3] = &unk_78FC0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v1 _updateLensChromeVisibility:0 animated:v2 completion:v3];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 zoomLensViewControllerUpdateUIForStandby:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_7;
  v3[3] = &unk_78FC0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v1 _updateLensChromeVisibility:0 animated:v2 completion:v3];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 zoomLensViewControllerUpdateUIForStandby:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lensZoomView];
  [*(id *)(a1 + 32) zoomPanOffset];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 32) zoomFactor];
  double v8 = v7;
  id v9 = [*(id *)(a1 + 32) _shouldRoundLensCorners];
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_9;
  v12[3] = &unk_78F28;
  id v11 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  char v14 = v10;
  id v13 = v11;
  objc_msgSend(v2, "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:", v9, v10, v12, v4, v6, v8, -1.0);
}

void __98__ZWZoomLensViewController_updateStandbyMode_zoomFactor_panOffset_lensEffect_animated_completion___block_invoke_9(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) lensZoomView];
  id v2 = [*(id *)(a1 + 32) lensEffect];
  [v3 updateLensEffect:v2 animated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (CGPoint)_lensDragMultiplier
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)handleFluidSwitcherGestureWillBegin
{
}

- (BOOL)_shouldRoundLensCorners
{
  return 0;
}

- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (BOOL)_shouldDisableLensEffectsForStandbyMode
{
  return 0;
}

- (BOOL)_minimumZoomIndistinguishableFromStandbyMode
{
  return ![(ZWZoomLensViewController *)self _shouldDisableLensEffectsForStandbyMode];
}

- (BOOL)shouldPanZoomContentForAxis:(int64_t)a3 delta:(CGPoint)a4 edgeMask:(unint64_t)a5
{
  char v5 = a5;
  double y = a4.y;
  double x = a4.x;
  [(ZWZoomLensViewController *)self zoomPanOffset];
  if (a3 == 2)
  {
    if ((v5 & 8) == 0 || (BOOL result = 1, x >= 0.0) && x + v9 > 0.0)
    {
      if ((v5 & 2) != 0)
      {
        BOOL v12 = x > 0.0;
        double v13 = x + v9;
        return v13 >= 0.0 || v12;
      }
      return 0;
    }
  }
  else if ((v5 & 1) == 0 || (BOOL result = 1, y >= 0.0) && y + v10 > 0.0)
  {
    if ((v5 & 4) != 0)
    {
      BOOL v12 = y > 0.0;
      double v13 = y + v10;
      return v13 >= 0.0 || v12;
    }
    return 0;
  }
  return result;
}

- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFacotr:(double)a5
{
  if ((a4 & 2) != 0) {
    double x = a3.x;
  }
  else {
    double x = 0.0;
  }
  if ((a4 & 4) != 0) {
    double y = a3.y;
  }
  else {
    double y = 0.0;
  }
  [(ZWZoomLensViewController *)self zoomPanOffset];
  double v9 = x + v8;
  [(ZWZoomLensViewController *)self zoomPanOffset];
  double v11 = y + v10;
  double v12 = v9;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (CGPoint)offsetByPanningWithDelta:(CGPoint)a3 axis:(int64_t)a4 zoomFactor:(double)a5
{
  char v5 = a4;
  -[ZWZoomLensViewController offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:](self, "offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:", a3.x, a3.y);
  -[ZWZoomLensViewController validPanOffsetForProposedOffset:proposedZoomFactor:](self, "validPanOffsetForProposedOffset:proposedZoomFactor:");
  double v8 = v7;
  double v10 = v9;
  [(ZWZoomLensViewController *)self zoomPanOffset];
  if ((v5 & 2) != 0) {
    double v11 = v8;
  }
  if ((v5 & 4) != 0) {
    double v12 = v10;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)offsetByPanningToPoint:(CGPoint)a3 zoomFactor:(double)a4
{
  -[ZWZoomLensViewController offsetByPanningToRect:zoomFactor:](self, "offsetByPanningToRect:zoomFactor:", a3.x, a3.y, 0.0, 0.0, a4);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)offsetIgnoringValidOffsetConstraintsByPanningToRect:(CGRect)a3 zoomFacotr:(double)a4
{
  AX_CGRectGetCenter();
  double v6 = v5;
  double v8 = v7;
  double v9 = [(ZWZoomLensViewController *)self view];
  [v9 frame];
  AX_CGRectGetCenter();
  double v11 = v10;
  double v13 = v12;

  double v14 = v6 - v11;
  double v15 = v8 - v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGPoint)offsetByPanningToRect:(CGRect)a3 zoomFactor:(double)a4
{
  -[ZWZoomLensViewController offsetIgnoringValidOffsetConstraintsByPanningToRect:zoomFacotr:](self, "offsetIgnoringValidOffsetConstraintsByPanningToRect:zoomFacotr:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[ZWZoomLensViewController validPanOffsetForProposedOffset:proposedZoomFactor:](self, "validPanOffsetForProposedOffset:proposedZoomFactor:");
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(ZWZoomLensViewController *)self maximumPanOffsetWithZoomFactor:a4];
  double v8 = -v6;
  if (x >= -v6) {
    double v8 = x;
  }
  if (x <= v6) {
    double v6 = v8;
  }
  double v9 = -v7;
  if (y >= -v7) {
    double v9 = y;
  }
  if (y <= v7) {
    double v7 = v9;
  }
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (id)dummyScrollViewPanGestureRecognizer
{
  double v2 = [(ZWZoomLensViewController *)self dummyScrollView];
  double v3 = [v2 panGestureRecognizer];

  return v3;
}

- (CGSize)dummyScrollViewContentSize
{
  double v2 = 10000.0;
  double v3 = 10000.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGPoint)dummyScrollViewDefaultOffset
{
  double v2 = 5000.0;
  double v3 = 5000.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)dummyScrollViewOffsetForSlug
{
  [(ZWZoomLensViewController *)self dummyScrollViewDefaultOffset];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(ZWZoomLensViewController *)self dummyScrollView];
  [v7 contentOffset];
  double v9 = v8;
  double v11 = v10;

  double v12 = v4 - v9;
  double v13 = v6 - v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)_handleLongPress:(id)a3
{
  double v4 = (char *)[a3 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 != (unsigned char *)&dword_0 + 1) {
      return;
    }
    +[NSDate timeIntervalSinceReferenceDate];
    if (v7 - self->_lastTapTime <= 1.0) {
      unint64_t v8 = (unint64_t)(double)(self->_prescrollTaps + 1);
    }
    else {
      unint64_t v8 = 0;
    }
    self->_prescrollTaps = v8;
    self->_lastTapTime = v7;
    double v5 = self;
    uint64_t v6 = 1;
  }
  else
  {
    double v5 = self;
    uint64_t v6 = 0;
  }

  [(ZWZoomLensViewController *)v5 setUserIsInteractingWithLens:v6];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v6 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    [(ZWZoomLensViewController *)self setUserIsMovingLens:1];
    self->_lastDragOffset = CGPointZero;
    self->_shouldNotifyDelegateOfDrag = 0;
    [(ZWZoomLensViewController *)self dummyScrollViewDefaultOffset];
    objc_msgSend(v6, "setContentOffset:");
    self->_shouldNotifyDelegateOfDrag = 1;
    double v4 = [(ZWZoomLensViewController *)self delegate];
    double v5 = [(ZWZoomLensViewController *)self view];
    [v4 zoomLensViewController:self willBeginMovingLens:v5];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    [(ZWZoomLensViewController *)self dummyScrollViewOffsetForSlug];
    CGFloat v6 = v4;
    CGFloat v7 = v5;
    if (self->_shouldNotifyDelegateOfDrag)
    {
      double v8 = v4 - self->_lastDragOffset.x;
      double v9 = v5 - self->_lastDragOffset.y;
      [(ZWZoomLensViewController *)self _lensDragMultiplier];
      double v11 = v8 * v10;
      double v13 = v9 * v12;
      double v14 = [(ZWZoomLensViewController *)self delegate];
      double v15 = [(ZWZoomLensViewController *)self view];
      objc_msgSend(v14, "zoomLensViewController:didMoveLens:withDelta:", self, v15, v11, v13);
    }
    self->_lastDragOffset.double x = v6;
    self->_lastDragOffset.double y = v7;
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (![(ZWZoomLensViewController *)self inStandbyMode] && !a4)
  {
    [(ZWZoomLensViewController *)self setUserIsMovingLens:0];
    id v7 = [(ZWZoomLensViewController *)self delegate];
    CGFloat v6 = [(ZWZoomLensViewController *)self view];
    [v7 zoomLensViewController:self didFinishMovingLens:v6];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    [(ZWZoomLensViewController *)self setUserIsMovingLens:0];
    id v5 = [(ZWZoomLensViewController *)self delegate];
    double v4 = [(ZWZoomLensViewController *)self view];
    [v5 zoomLensViewController:self didFinishMovingLens:v4];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ZWZoomLensViewController *)self longPressGestureRecognizer];

  id v9 = [(ZWZoomLensViewController *)self dummyScrollView];
  id v10 = [v9 panGestureRecognizer];
  id v11 = v10;
  if (v8 == v6)
  {
    if (v10 != v7)
    {
      id v14 = [(ZWZoomLensViewController *)self tapGestureRecognizer];
LABEL_11:
      char v13 = v14 == v7;

      goto LABEL_13;
    }
LABEL_12:
    char v13 = 1;
    goto LABEL_13;
  }

  if (v11 == v6)
  {
    id v9 = [(ZWZoomLensViewController *)self longPressGestureRecognizer];
    if (v9 == v7)
    {
      char v13 = 1;
      goto LABEL_14;
    }
    id v11 = [(ZWZoomLensViewController *)self tapGestureRecognizer];
    char v13 = v11 == v7;
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  id v12 = [(ZWZoomLensViewController *)self tapGestureRecognizer];

  if (v12 == v6)
  {
    id v9 = [(ZWZoomLensViewController *)self dummyScrollView];
    id v11 = [v9 panGestureRecognizer];
    if (v11 != v7)
    {
      id v14 = [(ZWZoomLensViewController *)self longPressGestureRecognizer];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  char v13 = 0;
LABEL_15:

  return v13;
}

- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4
{
  return 0;
}

- (ZWZoomLensViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWZoomLensViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (CGPoint)zoomPanOffset
{
  double x = self->_zoomPanOffset.x;
  double y = self->_zoomPanOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  self->_zoomPanOffset = a3;
}

- (NSString)lensEffect
{
  return self->_lensEffect;
}

- (void)setLensEffect:(id)a3
{
}

- (BOOL)userIsInteractingWithLens
{
  return self->_userIsInteractingWithLens;
}

- (void)setUserIsInteractingWithLens:(BOOL)a3
{
  self->_userIsInteractingWithLens = a3;
}

- (BOOL)userIsMovingLens
{
  return self->_userIsMovingLens;
}

- (void)setUserIsMovingLens:(BOOL)a3
{
  self->_userIsMovingLens = a3;
}

- (ZWLensZoomView)lensZoomView
{
  return self->_lensZoomView;
}

- (void)setLensZoomView:(id)a3
{
}

- (BOOL)inStandbyMode
{
  return self->_inStandbyMode;
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  return (UIScreen *)WeakRetained;
}

- (void)setScreen:(id)a3
{
}

- (ZWCancelButtonTouchesScrollView)dummyScrollView
{
  return self->_dummyScrollView;
}

- (void)setDummyScrollView:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSString)screenshotActionHandlerIdentifier
{
  return self->_screenshotActionHandlerIdentifier;
}

- (void)setScreenshotActionHandlerIdentifier:(id)a3
{
}

- (id)standbyFinishedTransitioningUnitTestCallback
{
  return self->_standbyFinishedTransitioningUnitTestCallback;
}

- (void)setStandbyFinishedTransitioningUnitTestCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_standbyFinishedTransitioningUnitTestCallback, 0);
  objc_storeStrong((id *)&self->_screenshotActionHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dummyScrollView, 0);
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_lensZoomView, 0);
  objc_storeStrong((id *)&self->_lensEffect, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)identifier
{
  return 0;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end
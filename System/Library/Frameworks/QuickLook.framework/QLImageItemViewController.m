@interface QLImageItemViewController
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)draggableViewShouldStartDragSession:(id)a3;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (BOOL)shouldDetectMachineReadableCode;
- (CGSize)imageSize;
- (NSDictionary)clientPreviewOptions;
- (UIImage)imageForAnalysis;
- (UIView)imageAnalysisView;
- (id)draggableView;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (void)_setupAndStartImageAnalysisIfNeeded;
- (void)_updateAnalysisButtonsContainerConstraints;
- (void)adjustImageInteractionForScrollEvent:(id)a3;
- (void)animateToPreferredDynamicRange;
- (void)animationTimerFired:(double)a3;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)imageAnalysisInteractionDidDismissVisualSearchController;
- (void)imageAnalysisInteractionWillPresentVisualSearchController;
- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)performFirstTimeAppearanceActions:(unint64_t)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
- (void)updatePreferredDynamicRangeForced:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation QLImageItemViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
  imageView = self->_imageView;
  self->_imageView = v10;

  [(UIImageView *)self->_imageView setUserInteractionEnabled:1];
  v12 = [MEMORY[0x263F825C8] clearColor];
  [(UIImageView *)self->_imageView setBackgroundColor:v12];

  [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"QLImageItemViewControllerImageViewAccessibilityIdentifier"];
  [(UIImageView *)self->_imageView setPreferredImageDynamicRange:0];
  if (self->_HDRTransitionInProgress) {
    [(QLImageItemViewController *)self animateToPreferredDynamicRange];
  }
  else {
    [(QLImageItemViewController *)self updatePreferredDynamicRangeForced:0];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  self->_imageIsAnimated = isKindOfClass & 1;
  if (isKindOfClass)
  {
    objc_storeStrong((id *)&self->_animatedImage, a3);
    id v18 = v9;
    QLRunInMainThread();
  }
  else
  {
    v14 = [v8 image];
    [(UIImageView *)self->_imageView setImage:v14];

    v15 = [(UIImageView *)self->_imageView image];
    [v15 size];
    self->_imageSize.width = v16;
    self->_imageSize.height = v17;

    [(QLScrollableContentItemViewController *)self setContentView:self->_imageView];
    -[QLImageItemViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_imageSize.width, self->_imageSize.height);
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void __89__QLImageItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1168) = 0x7FEFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(a1 + 32) + 1176) = 0;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1152) frameAtTime:0.0];
  v2 = (void *)(*(void *)(a1 + 32) + 1184);
  [v6 size];
  void *v2 = v3;
  v2[1] = v4;
  [*(id *)(*(void *)(a1 + 32) + 1144) setImage:v6];
  [*(id *)(a1 + 32) setContentView:*(void *)(*(void *)(a1 + 32) + 1144)];
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(*(void *)(a1 + 32) + 1184), *(double *)(*(void *)(a1 + 32) + 1192));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_imageIsAnimated)
  {
    uint64_t v5 = +[QLImageAnimationTimer sharedTimer];
    [v5 addAnimationTimerObserver:self];
  }
  else if (_os_feature_enabled_impl())
  {
    id v6 = [(QLItemViewController *)self appearance];
    BOOL v7 = +[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](QLImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", [v6 presentationMode]);

    if (v7) {
      [(QLImageItemViewController *)self _setupAndStartImageAnalysisIfNeeded];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)QLImageItemViewController;
  [(QLScrollableContentItemViewController *)&v8 previewDidAppear:v3];
}

- (void)previewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewController;
  [(QLItemViewController *)&v4 previewWillDisappear:a3];
  [(QLImageAnalysisManager *)self->_imageAnalysisManager shouldHideInteraction:1 animated:0];
}

- (void)previewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_imageIsAnimated)
  {
    self->_initialTimeStamp = 1.79769313e308;
    uint64_t v5 = +[QLImageAnimationTimer sharedTimer];
    [v5 removeAnimationTimerObserver:self];
  }
  else
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager stopImageAnalysis];
  }
  v6.receiver = self;
  v6.super_class = (Class)QLImageItemViewController;
  [(QLScrollableContentItemViewController *)&v6 previewDidDisappear:v3];
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(QLItemViewController *)self appearance];
  v22.receiver = self;
  v22.super_class = (Class)QLImageItemViewController;
  [(QLScrollableContentItemViewController *)&v22 setAppearance:v6 animated:v4];
  if ([(QLScrollableContentItemViewController *)self shouldLayoutContentBasedOnPeripheryInsets])
  {
    [v6 peripheryInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x263F834E8];
    double v11 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v13 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v15 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  CGFloat v16 = [(QLScrollableContentItemViewController *)self scrollView];
  objc_msgSend(v16, "setContentInset:", v9, v11, v13, v15);

  [(QLImageItemViewController *)self updatePreferredDynamicRangeForced:0];
  int v17 = _os_feature_enabled_impl();
  if (!self->_imageIsAnimated && v17 != 0)
  {
    uint64_t v19 = [v7 presentationMode];
    v20 = [(QLItemViewController *)self appearance];
    uint64_t v21 = [v20 presentationMode];

    if (v19 != v21)
    {
      if (+[QLImageAnalysisManager shouldStartImageAnalysisForPresentationMode:v21]&& ([(QLItemViewController *)self didAppearOnce]|| [(QLImageAnalysisManager *)self->_imageAnalysisManager hasAnalysis]))
      {
        [(QLImageItemViewController *)self _setupAndStartImageAnalysisIfNeeded];
      }
      else
      {
        [(QLImageItemViewController *)self _updateAnalysisButtonsContainerConstraints];
      }
    }
  }
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImage)imageForAnalysis
{
  return [(UIImageView *)self->_imageView image];
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (void)animationTimerFired:(double)a3
{
  if (self->_imageIsAnimated)
  {
    double initialTimeStamp = self->_initialTimeStamp;
    if (initialTimeStamp == 1.79769313e308)
    {
      double initialTimeStamp = a3 - self->_currentPlaybackTime;
      self->_double initialTimeStamp = initialTimeStamp;
    }
    long double v5 = a3 - initialTimeStamp;
    [(QLAnimatedImage *)self->_animatedImage duration];
    self->_currentPlaybackTime = fmod(v5, v6);
    uint64_t v7 = -[QLAnimatedImage frameAtTime:](self->_animatedImage, "frameAtTime:");
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v7 = [(UIImageView *)self->_imageView setImage:v7];
      uint64_t v8 = v9;
    }
    MEMORY[0x270F9A758](v7, v8);
  }
}

- (void)transitionDidStart:(BOOL)a3
{
  self->_HDRTransitionInProgress = 1;
  if (self->_imageView) {
    [(QLImageItemViewController *)self animateToPreferredDynamicRange];
  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)QLImageItemViewController;
  [(QLItemViewController *)&v4 transitionDidFinish:a3 didComplete:a4];
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLImageItemViewController;
  objc_super v4 = [(QLItemViewController *)&v8 toolbarButtonsForTraitCollection:a3];
  long double v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    long double v5 = [MEMORY[0x263EFF980] array];
  }
  if (_os_feature_enabled_impl()
    && [(QLImageAnalysisManager *)self->_imageAnalysisManager isInteractionActive]
    && [(QLImageAnalysisManager *)self->_imageAnalysisManager hasResultsForVisualSearch])
  {
    long double v6 = [(QLImageAnalysisManager *)self->_imageAnalysisManager imageAnalysisToolbarButton];
    [v5 addObject:v6];
  }

  return v5;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  int v8 = _os_feature_enabled_impl();
  if ([v6 isEqualToString:@"QLVisualSearchButton"]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)QLImageItemViewController;
    [(QLItemViewController *)&v10 buttonPressedWithIdentifier:v6 completionHandler:v7];
  }
  else
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager infoButtonTapped];
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [(QLItemViewController *)self delegate];
  [v4 previewItemViewController:self wantsFullScreen:0];
}

- (id)draggableView
{
  return self->_imageView;
}

- (BOOL)draggableViewShouldStartDragSession:(id)a3
{
  id v4 = a3;
  long double v5 = [(QLImageItemViewController *)self imageAnalysisView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if (-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:", v7, v9)
    || -[QLImageAnalysisManager imageSubjectExistsAtPoint:](self->_imageAnalysisManager, "imageSubjectExistsAtPoint:", v7, v9))
  {
    BOOL v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)QLImageItemViewController;
    BOOL v10 = [(QLItemViewController *)&v12 draggableViewShouldStartDragSession:v4];
  }

  return v10;
}

- (UIView)imageAnalysisView
{
  return (UIView *)self->_imageView;
}

- (NSDictionary)clientPreviewOptions
{
  v2 = [(QLItemViewController *)self context];
  BOOL v3 = [v2 clientPreviewOptions];

  return (NSDictionary *)v3;
}

- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLItemViewController *)self delegate];
  [v5 previewItemViewControllerWantsUpdateOverlay:self animated:v3];
}

- (void)imageAnalysisInteractionWillPresentVisualSearchController
{
  BOOL v3 = [NSNumber numberWithBool:self->_isFullScreen];
  savedFullScreenState = self->_savedFullScreenState;
  self->_savedFullScreenState = v3;

  id v5 = [(QLItemViewController *)self delegate];
  [v5 previewItemViewController:self wantsFullScreen:1];
}

- (void)imageAnalysisInteractionDidDismissVisualSearchController
{
  savedFullScreenState = self->_savedFullScreenState;
  if (savedFullScreenState)
  {
    uint64_t v4 = [(NSNumber *)savedFullScreenState BOOLValue];
    id v5 = self->_savedFullScreenState;
    self->_savedFullScreenState = 0;

    double v6 = [(QLItemViewController *)self delegate];
    id v9 = v6;
    double v7 = self;
    uint64_t v8 = v4;
  }
  else
  {
    double v6 = [(QLItemViewController *)self delegate];
    id v9 = v6;
    double v7 = self;
    uint64_t v8 = 0;
  }
  [v6 previewItemViewController:v7 wantsFullScreen:v8];
}

- (void)_setupAndStartImageAnalysisIfNeeded
{
  imageAnalysisManager = self->_imageAnalysisManager;
  if (!imageAnalysisManager)
  {
LABEL_8:
    double v7 = [QLImageAnalysisManager alloc];
    uint64_t v8 = [(QLImageItemViewController *)self view];
    id v9 = [(QLImageAnalysisManager *)v7 initWithDelegate:self presentingView:v8];
    BOOL v10 = self->_imageAnalysisManager;
    self->_imageAnalysisManager = v9;

    goto LABEL_9;
  }
  BOOL v4 = [(QLImageAnalysisManager *)imageAnalysisManager hasAnalysis];
  id v5 = self->_imageAnalysisManager;
  if (!v4)
  {
    if (v5)
    {
      if ([(QLImageAnalysisManager *)v5 isAnalysisOngoing]) {
        return;
      }
      double v6 = self->_imageAnalysisManager;
      if (v6) {
        [(QLImageAnalysisManager *)v6 stopImageAnalysis];
      }
    }
    goto LABEL_8;
  }
  [(QLImageAnalysisManager *)v5 addInteractionIfNeeded];
  [(QLImageAnalysisManager *)self->_imageAnalysisManager setupAnalysisButtonsContainer];
LABEL_9:

  [(QLImageItemViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (void)_updateAnalysisButtonsContainerConstraints
{
  imageAnalysisManager = self->_imageAnalysisManager;
  BOOL v4 = self->_imageView;
  id v5 = [(QLImageItemViewController *)self view];
  [(QLImageAnalysisManager *)imageAnalysisManager updateBottomRightContainerPositionForImageView:v4 view:v5];
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLImageItemViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_);
  self->_isFullScreen = v5;
  [(QLImageAnalysisManager *)self->_imageAnalysisManager updateForFullScreen:v5 animated:v4];
  [(QLImageItemViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (void)viewDidLoad
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)QLImageItemViewController;
  [(QLImageItemViewController *)&v8 viewDidLoad];
  objc_initWeak(&location, self);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__QLImageItemViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_2642F5408;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(QLImageItemViewController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__QLImageItemViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAnalysisButtonsContainerConstraints];
}

- (void)adjustImageInteractionForScrollEvent:(id)a3
{
  [(QLImageAnalysisManager *)self->_imageAnalysisManager adjustImageInteractionForScrollView:a3];

  [(QLImageItemViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (BOOL)shouldDetectMachineReadableCode
{
  v2 = [(QLItemViewController *)self context];
  char v3 = [v2 shouldPreventMachineReadableCodeDetection] ^ 1;

  return v3;
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  char v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLImageItemViewController;
  unsigned __int8 v4 = -[QLItemViewController canPerformFirstTimeAppearanceActions:](&v7, sel_canPerformFirstTimeAppearanceActions_);
  BOOL v5 = (v3 & 0x28) != 0;
  if (v4) {
    BOOL v5 = 1;
  }
  return (v3 & 0x10) != 0 || v5;
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  if ((a3 & 8) != 0)
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager setShouldHighlightTextAndDDAfterNextAnalysis:1];
  }
  else if ((a3 & 0x10) != 0)
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager setShouldEnterVisualSearchAfterNextAnalysis:1];
  }
  else if ((a3 & 0x20) != 0)
  {
    [(QLImageAnalysisManager *)self->_imageAnalysisManager setShouldUpliftSubjectAfterNextAnalysis:1];
  }
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)QLImageItemViewController;
  id v7 = a3;
  unsigned int v8 = [(QLItemViewController *)&v16 shouldAcceptTouch:v7 ofGestureRecognizer:v6];
  id v9 = [(QLImageItemViewController *)self imageAnalysisView];
  [v7 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  LODWORD(v9) = [v7 _isPointerTouch];
  if (v9)
  {
    if ([(QLImageAnalysisManager *)self->_imageAnalysisManager isTextSelectionEnabled])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 &= !-[QLImageAnalysisManager textExistsAtPoint:](self->_imageAnalysisManager, "textExistsAtPoint:", v11, v13);
      }
    }
  }
  if (-[QLImageAnalysisManager visualSearchExistsAtPoint:](self->_imageAnalysisManager, "visualSearchExistsAtPoint:", v11, v13))
  {
    objc_opt_class();
    v8 &= ~objc_opt_isKindOfClass();
  }
  unsigned int v14 = v8 & ~[(QLImageAnalysisManager *)self->_imageAnalysisManager hasActiveTextSelection];

  return v14;
}

- (void)updatePreferredDynamicRangeForced:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    if (!self->_HDRTransitionInProgress || v3)
    {
      id v6 = [(QLItemViewController *)self appearance];
      uint64_t v7 = [v6 presentationMode];

      imageView = self->_imageView;
      if (v7 == 2) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
      [(UIImageView *)imageView setPreferredImageDynamicRange:v9];
    }
  }
}

- (void)animateToPreferredDynamicRange
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke;
  v3[3] = &unk_2642F5430;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke_2;
  v2[3] = &unk_2642F5458;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v3 animations:v2 completion:2.0];
}

uint64_t __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1144) setPreferredImageDynamicRange:2];
}

uint64_t __59__QLImageItemViewController_animateToPreferredDynamicRange__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1202) = 0;
  return [*(id *)(a1 + 32) updatePreferredDynamicRangeForced:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisButtonContainerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainerRightConstraint, 0);
  objc_storeStrong((id *)&self->_analysisButtonContainer, 0);
  objc_storeStrong((id *)&self->_savedFullScreenState, 0);
  objc_storeStrong((id *)&self->_imageAnalysisManager, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
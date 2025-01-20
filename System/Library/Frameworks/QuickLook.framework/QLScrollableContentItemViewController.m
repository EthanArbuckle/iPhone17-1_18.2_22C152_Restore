@interface QLScrollableContentItemViewController
- (BOOL)canPinchToDismiss;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldFit;
- (BOOL)shouldLayoutContentBasedOnPeripheryInsets;
- (BOOL)supportsChromeless;
- (BOOL)supportsScrollingUpAndDownUsingKeyCommands;
- (CGSize)imageSize;
- (QLScrollableContentItemViewController)init;
- (UIView)contentView;
- (double)previewScrollView:(id)a3 extraMinimumZoomForMinimumZoomScale:(double)a4 maximumZoomScale:(double)a5;
- (id)scrollView;
- (void)_doubleTapRecognized:(id)a3;
- (void)_updateScrollViewZoomUpdate:(CGSize)a3;
- (void)loadView;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewScrollViewDidScroll:(id)a3;
- (void)previewScrollViewDidZoom:(id)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setContentView:(id)a3;
- (void)setShouldFit:(BOOL)a3;
- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation QLScrollableContentItemViewController

- (QLScrollableContentItemViewController)init
{
  [(QLScrollableContentItemViewController *)self setShouldFit:0];
  v4.receiver = self;
  v4.super_class = (Class)QLScrollableContentItemViewController;
  return [(QLItemViewController *)&v4 init];
}

- (CGSize)imageSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)loadView
{
  if (!self->_scrollView)
  {
    double v3 = objc_alloc_init(QLPreviewScrollView);
    scrollView = self->_scrollView;
    self->_scrollView = v3;

    [(QLPreviewScrollView *)self->_scrollView setClipsToBounds:0];
    [(QLPreviewScrollView *)self->_scrollView setZoomDelegate:self];
    [(QLPreviewScrollView *)self->_scrollView setShouldFit:[(QLScrollableContentItemViewController *)self shouldFit]];
    [(QLPreviewScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
    v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__doubleTapRecognized_];
    doubleTapGesture = self->_doubleTapGesture;
    self->_doubleTapGesture = v5;

    [(UITapGestureRecognizer *)self->_doubleTapGesture setNumberOfTapsRequired:2];
    v7 = [(QLItemViewController *)self delegate];
    [(UITapGestureRecognizer *)self->_doubleTapGesture setDelegate:v7];

    id v20 = (id)objc_opt_new();
    [v20 addSubview:self->_scrollView];
    [(QLPreviewScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(QLPreviewScrollView *)self->_scrollView leftAnchor];
    v9 = [v20 leftAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [(QLPreviewScrollView *)self->_scrollView rightAnchor];
    v12 = [v20 rightAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(QLPreviewScrollView *)self->_scrollView topAnchor];
    v15 = [v20 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(QLPreviewScrollView *)self->_scrollView bottomAnchor];
    v18 = [v20 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    [(QLScrollableContentItemViewController *)self setView:v20];
  }
}

- (void)setContentView:(id)a3
{
  v11 = (UIView *)a3;
  [(QLScrollableContentItemViewController *)self loadView];
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v11)
  {
    if (contentView)
    {
      [(UIView *)contentView removeFromSuperview];
      [(UIView *)*p_contentView removeGestureRecognizer:self->_doubleTapGesture];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(QLScrollableContentItemViewController *)self imageSize];
    double v8 = v7;
    double v10 = v9;
    -[UIView setFrame:](*p_contentView, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v7, v9);
    [(UIView *)*p_contentView addGestureRecognizer:self->_doubleTapGesture];
    [(QLPreviewScrollView *)self->_scrollView addSubview:*p_contentView];
    -[QLPreviewScrollView setContentViewSize:](self->_scrollView, "setContentViewSize:", v8, v10);
  }
}

- (void)setShouldFit:(BOOL)a3
{
  self->_shouldFit = a3;
  -[QLPreviewScrollView setShouldFit:](self->_scrollView, "setShouldFit:");
}

- (void)_doubleTapRecognized:(id)a3
{
  scrollView = self->_scrollView;
  id v5 = a3;
  [(QLPreviewScrollView *)scrollView zoomScale];
  double v7 = v6;
  [(QLPreviewScrollView *)self->_scrollView contentIsSmallerThanView];
  double v9 = v8;
  [(QLPreviewScrollView *)self->_scrollView minZoomScale];
  double v11 = v10;
  v12 = self->_scrollView;
  if (v9 != 0.0)
  {
    if (v7 != v10)
    {
      [(QLPreviewScrollView *)v12 minZoomScale];
LABEL_10:
      double v15 = v13;
      goto LABEL_11;
    }
LABEL_9:
    [(QLPreviewScrollView *)v12 maxZoomScale];
    goto LABEL_10;
  }
  [(QLPreviewScrollView *)v12 minZoomScale];
  double v15 = v14;
  if (v7 == v11)
  {
    double v15 = v14 * 2.5;
    [(QLPreviewScrollView *)self->_scrollView fillZoomScale];
    if (v15 < v16)
    {
      [(QLPreviewScrollView *)self->_scrollView fillZoomScale];
      double v15 = v17;
    }
    [(QLPreviewScrollView *)self->_scrollView maxZoomScale];
    if (v15 > v18)
    {
      v12 = self->_scrollView;
      goto LABEL_9;
    }
  }
LABEL_11:
  v19 = self->_scrollView;
  id v20 = [v5 view];
  [v5 locationInView:v20];
  double v22 = v21;
  double v24 = v23;

  -[QLPreviewScrollView zoomRectForScale:withCenter:](v19, "zoomRectForScale:withCenter:", v15, v22, v24);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  -[QLPreviewScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", 1, v26, v28, v30, v32);
  id v33 = [(QLItemViewController *)self delegate];
  [v33 previewItemViewController:self wantsFullScreen:1];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(QLScrollableContentItemViewController *)self view];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  if (width != v10 || height != v12)
  {
    [(QLPreviewScrollView *)self->_scrollView setPreventZoomUpdate:1];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__QLScrollableContentItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_2642F6858;
    v15[4] = self;
    *(double *)&v15[5] = width;
    *(double *)&v15[6] = height;
    [v7 animateAlongsideTransition:v15 completion:0];
  }
  v14.receiver = self;
  v14.super_class = (Class)QLScrollableContentItemViewController;
  -[QLScrollableContentItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __92__QLScrollableContentItemViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewZoomUpdate:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)QLScrollableContentItemViewController;
  -[QLItemViewController transitionWillFinish:didComplete:](&v8, sel_transitionWillFinish_didComplete_);
  if (v4 && !a3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__QLScrollableContentItemViewController_transitionWillFinish_didComplete___block_invoke;
    v7[3] = &unk_2642F5430;
    v7[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:0.1];
  }
}

uint64_t __74__QLScrollableContentItemViewController_transitionWillFinish_didComplete___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1112);
  [v1 minZoomScale];

  return objc_msgSend(v1, "setZoomScale:");
}

- (void)previewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_isVisible) {
    [(QLPreviewScrollView *)self->_scrollView setNeedsZoomUpdate:1];
  }
  [(QLPreviewScrollView *)self->_scrollView setClipsToBounds:0];
  v5.receiver = self;
  v5.super_class = (Class)QLScrollableContentItemViewController;
  [(QLItemViewController *)&v5 previewWillAppear:v3];
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLScrollableContentItemViewController;
  [(QLItemViewController *)&v4 previewDidAppear:a3];
  self->_isVisible = 1;
}

- (void)previewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLScrollableContentItemViewController;
  [(QLItemViewController *)&v4 previewDidDisappear:a3];
  [(QLPreviewScrollView *)self->_scrollView setClipsToBounds:1];
  self->_isVisible = 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(QLItemViewController *)self appearance];
  uint64_t v8 = [v7 presentationMode];

  v14.receiver = self;
  v14.super_class = (Class)QLScrollableContentItemViewController;
  [(QLItemViewController *)&v14 setAppearance:v6 animated:v4];
  if (v8 == 4) {
    [(QLPreviewScrollView *)self->_scrollView setNeedsZoomUpdate:1];
  }
  double v9 = [(QLScrollableContentItemViewController *)self view];
  double v10 = [v9 window];
  uint64_t v11 = [v10 _windowInterfaceOrientation];

  [v6 peripheryInsets];
  scrollView = self->_scrollView;
  if (v11 == 1) {
    -[QLPreviewScrollView setPeripheryInsetsPortrait:](scrollView, "setPeripheryInsetsPortrait:");
  }
  else {
    -[QLPreviewScrollView setPeripheryInsetsLandscape:](scrollView, "setPeripheryInsetsLandscape:");
  }
  double v13 = [(QLScrollableContentItemViewController *)self view];
  [v13 size];
  -[QLScrollableContentItemViewController _updateScrollViewZoomUpdate:](self, "_updateScrollViewZoomUpdate:");
}

- (BOOL)canPinchToDismiss
{
  [(QLPreviewScrollView *)self->_scrollView zoomScale];
  double v4 = v3;
  [(QLPreviewScrollView *)self->_scrollView minZoomScale];
  return v4 == v5;
}

- (BOOL)supportsScrollingUpAndDownUsingKeyCommands
{
  return 0;
}

- (id)scrollView
{
  return self->_scrollView;
}

- (void)_updateScrollViewZoomUpdate:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(QLPreviewScrollView *)self->_scrollView setPreventZoomUpdate:0];
  [(QLPreviewScrollView *)self->_scrollView zoomScale];
  double v7 = v6;
  [(QLPreviewScrollView *)self->_scrollView fitZoomScale];
  double v9 = v8;
  [(QLPreviewScrollView *)self->_scrollView minZoomScale];
  double v11 = v10;
  [(QLPreviewScrollView *)self->_scrollView maxZoomScale];
  double v13 = v12;
  -[QLPreviewScrollView updateZoomScalesWithSize:](self->_scrollView, "updateZoomScalesWithSize:", width, height);
  if (v7 == v9)
  {
    [(QLPreviewScrollView *)self->_scrollView fitZoomScale];
    goto LABEL_10;
  }
  scrollView = self->_scrollView;
  if (v7 == v11) {
    goto LABEL_4;
  }
  [(QLPreviewScrollView *)scrollView maxZoomScale];
  if (v7 != v13)
  {
    double v16 = self->_scrollView;
    if (v7 <= v15)
    {
      [(QLPreviewScrollView *)v16 minZoomScale];
      if (v7 < v17)
      {
        scrollView = self->_scrollView;
LABEL_4:
        [(QLPreviewScrollView *)scrollView minZoomScale];
      }
    }
    else
    {
      [(QLPreviewScrollView *)v16 maxZoomScale];
    }
  }
LABEL_10:
  double v18 = self->_scrollView;

  -[QLPreviewScrollView setZoomScale:](v18, "setZoomScale:");
}

- (BOOL)shouldLayoutContentBasedOnPeripheryInsets
{
  double v3 = [(QLItemViewController *)self appearance];
  uint64_t v4 = [v3 presentationMode];

  double v5 = [(QLScrollableContentItemViewController *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v10 = *MEMORY[0x263F001B0];
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v7 == v10 && v9 == v11)
  {
    double v13 = [MEMORY[0x263F82B60] mainScreen];
    [v13 bounds];
  }
  else
  {
    double v13 = [(QLScrollableContentItemViewController *)self view];
    [v13 frame];
  }
  double v16 = v14;
  double v17 = v15;

  [(QLScrollableContentItemViewController *)self imageSize];
  BOOL v20 = !QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance(v18, v19, v16, v17);
  return v4 != 4 && v20;
}

- (void)previewScrollViewDidScroll:(id)a3
{
  [(QLScrollableContentItemViewController *)self didScroll:a3];
  id v4 = [(QLScrollableContentItemViewController *)self view];
  [(UIView *)self->_contentView frame];
  objc_msgSend(v4, "convertRect:fromView:", self->_scrollView);
  -[QLItemViewController setContentFrame:](self, "setContentFrame:");
}

- (void)previewScrollViewDidZoom:(id)a3
{
  [(QLScrollableContentItemViewController *)self didZoom:a3];
  id v4 = [(QLScrollableContentItemViewController *)self view];
  [(UIView *)self->_contentView frame];
  objc_msgSend(v4, "convertRect:fromView:", self->_scrollView);
  -[QLItemViewController setContentFrame:](self, "setContentFrame:");
}

- (double)previewScrollView:(id)a3 extraMinimumZoomForMinimumZoomScale:(double)a4 maximumZoomScale:(double)a5
{
  double v7 = [(QLItemViewController *)self appearance];
  if ([v7 presentationMode] == 4) {
    double v8 = (a5 - a4) * 0.002;
  }
  else {
    double v8 = 0.0;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)supportsChromeless
{
  return 1;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)shouldFit
{
  return self->_shouldFit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
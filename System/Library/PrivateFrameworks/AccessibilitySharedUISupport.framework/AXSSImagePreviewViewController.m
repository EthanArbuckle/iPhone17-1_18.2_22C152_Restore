@interface AXSSImagePreviewViewController
- (AXSSImagePreviewViewController)initWithContentSnapshot:(id)a3;
- (AXSSImagePreviewViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isSnapshotViewAttached;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isManualZoomActive;
- (CGSize)_scrollViewClippedSize;
- (UIEdgeInsets)edgeInsets;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIScrollView)scrollView;
- (UISwipeGestureRecognizer)swipeGestureRecognizer;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UIView)contentSnapshot;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_addGestureRecognizers;
- (void)_centerImageIfNeeded;
- (void)_doubleTapGestureRecognized:(id)a3;
- (void)_fitImageIfNeeded:(BOOL)a3;
- (void)_imagePreviewViewControllerSetupUI;
- (void)_pinchGestureRecognized:(id)a3;
- (void)_removeGestureRecognizers;
- (void)_stopScrollViewAnimations;
- (void)_swipeGestureRecognized:(id)a3;
- (void)_toggleManualZoomMode;
- (void)_viewShouldExpand;
- (void)_zoomImage:(double)a3 withContentOffset:(CGPoint)a4 animated:(BOOL)a5;
- (void)_zoomImageToBestScaleIfNeeded:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)setContentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setIsManualZoomActive:(BOOL)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSwipeGestureRecognizer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AXSSImagePreviewViewController

- (AXSSImagePreviewViewController)initWithContentSnapshot:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXSSImagePreviewViewController;
  v5 = [(AXSSImagePreviewViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(AXSSImagePreviewViewController *)v5 setContentSnapshot:v4];
  }

  return v6;
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AXSSImagePreviewViewController;
  [(AXSSImagePreviewViewController *)&v8 viewWillLayoutSubviews];
  v3 = [(AXSSImagePreviewViewController *)self scrollView];
  [v3 bounds];
  double Height = CGRectGetHeight(v9);

  if (Height <= 1.0)
  {
    v7 = [(AXSSImagePreviewViewController *)self contentSnapshot];
    [v7 removeFromSuperview];
  }
  else
  {
    if (![(AXSSImagePreviewViewController *)self _isSnapshotViewAttached])
    {
      v5 = [(AXSSImagePreviewViewController *)self scrollView];
      v6 = [(AXSSImagePreviewViewController *)self contentSnapshot];
      [v5 addSubview:v6];
    }
    [(AXSSImagePreviewViewController *)self _fitImageIfNeeded:0];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AXSSImagePreviewViewController;
  [(AXSSImagePreviewViewController *)&v3 viewDidLoad];
  [(AXSSImagePreviewViewController *)self _imagePreviewViewControllerSetupUI];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSSImagePreviewViewController;
  [(AXSSImagePreviewViewController *)&v4 viewWillAppear:a3];
  [(AXSSImagePreviewViewController *)self _addGestureRecognizers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSSImagePreviewViewController;
  [(AXSSImagePreviewViewController *)&v4 viewWillDisappear:a3];
  [(AXSSImagePreviewViewController *)self _removeGestureRecognizers];
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self->_edgeInsets.top;
  if (self->_edgeInsets.left != a3.left
    || v7 != top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets.double top = top;
    self->_edgeInsets.double left = a3.left;
    self->_edgeInsets.double bottom = a3.bottom;
    self->_edgeInsets.double right = a3.right;
    v12 = [(AXSSImagePreviewViewController *)self scrollView];
    objc_msgSend(v12, "setScrollIndicatorInsets:", top, left, bottom, right);

    [(AXSSImagePreviewViewController *)self _centerImageIfNeeded];
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSImagePreviewViewController *)self scrollView];
  if (v5 == v4)
  {
    BOOL v6 = [(AXSSImagePreviewViewController *)self _isSnapshotViewAttached];

    if (v6)
    {
      double v7 = [(AXSSImagePreviewViewController *)self contentSnapshot];
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v7 = 0;
LABEL_6:

  return v7;
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSImagePreviewViewController *)self scrollView];

  if (v5 == v4)
  {
    if ([(AXSSImagePreviewViewController *)self isManualZoomActive]) {
      [(AXSSImagePreviewViewController *)self _viewShouldExpand];
    }
    [(AXSSImagePreviewViewController *)self _centerImageIfNeeded];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSImagePreviewViewController *)self scrollView];

  if (v5 == v4)
  {
    [(AXSSImagePreviewViewController *)self _centerImageIfNeeded];
  }
}

- (void)_doubleTapGestureRecognized:(id)a3
{
  id v6 = a3;
  id v4 = [(AXSSImagePreviewViewController *)self doubleTapGestureRecognizer];
  if (v4 == v6)
  {

    goto LABEL_5;
  }
  uint64_t v5 = [v6 state];

  if (v5 == 3) {
LABEL_5:
  }
    [(AXSSImagePreviewViewController *)self _toggleManualZoomMode];
}

- (void)_pinchGestureRecognized:(id)a3
{
  id v6 = a3;
  id v4 = [(AXSSImagePreviewViewController *)self pinchGestureRecognizer];
  if (v4 == v6)
  {
  }
  else
  {
    uint64_t v5 = [v6 state];

    if (v5 != 1) {
      goto LABEL_7;
    }
  }
  if (![(AXSSImagePreviewViewController *)self isManualZoomActive]) {
    [(AXSSImagePreviewViewController *)self _toggleManualZoomMode];
  }
LABEL_7:
}

- (void)_swipeGestureRecognized:(id)a3
{
  id v6 = a3;
  id v4 = [(AXSSImagePreviewViewController *)self swipeGestureRecognizer];
  if (v4 == v6)
  {

    goto LABEL_5;
  }
  uint64_t v5 = [v6 state];

  if (v5 == 3) {
LABEL_5:
  }
    [(AXSSImagePreviewViewController *)self _viewShouldExpand];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isSnapshotViewAttached
{
  v2 = [(AXSSImagePreviewViewController *)self contentSnapshot];
  objc_super v3 = [v2 superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_toggleManualZoomMode
{
  id v3 = objc_alloc_init(MEMORY[0x263F82BC0]);
  [v3 prepare];
  [(AXSSImagePreviewViewController *)self _stopScrollViewAnimations];
  if ([(AXSSImagePreviewViewController *)self isManualZoomActive])
  {
    [(AXSSImagePreviewViewController *)self setIsManualZoomActive:0];
    [(AXSSImagePreviewViewController *)self _fitImageIfNeeded:1];
  }
  else
  {
    [(AXSSImagePreviewViewController *)self setIsManualZoomActive:1];
    [(AXSSImagePreviewViewController *)self _viewShouldExpand];
    [(AXSSImagePreviewViewController *)self _zoomImageToBestScaleIfNeeded:1];
  }
  [v3 selectionChanged];
}

- (CGSize)_scrollViewClippedSize
{
  id v3 = [(AXSSImagePreviewViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(AXSSImagePreviewViewController *)self edgeInsets];
  double v10 = v5 - (v8 + v9);
  double v13 = v7 - (v11 + v12);
  double v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_fitImageIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(AXSSImagePreviewViewController *)self isManualZoomActive]
    && [(AXSSImagePreviewViewController *)self _isSnapshotViewAttached])
  {
    [(AXSSImagePreviewViewController *)self _scrollViewClippedSize];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(AXSSImagePreviewViewController *)self contentSnapshot];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    BOOL v14 = floor(v8) < 1.0 || v13 < 1.0;
    if (!v14 && v11 >= 1.0)
    {
      [(AXSSImagePreviewViewController *)self edgeInsets];
      double v18 = -v17;
      double v19 = v13 * (v6 / v11);
      if (v19 <= v8) {
        double v20 = (v19 - v8) * 0.5;
      }
      else {
        double v20 = v19 - v8;
      }
      double v21 = (v11 - v6) * 0.5;
      double v22 = (v13 - v8) * 0.5;
      if (v13 > v8) {
        double v22 = v13 - v8;
      }
      BOOL v23 = v11 > v6;
      if (v11 <= v6) {
        double v24 = 1.0;
      }
      else {
        double v24 = v6 / v11;
      }
      if (v23)
      {
        double v25 = v20;
      }
      else
      {
        double v18 = v21;
        double v25 = v22;
      }
      double v26 = ceil(v18);
      double v27 = floor(v25 - v16);
      v28 = [(AXSSImagePreviewViewController *)self scrollView];
      [v28 setMinimumZoomScale:v24];

      v29 = [(AXSSImagePreviewViewController *)self scrollView];
      [v29 setMaximumZoomScale:v24];

      -[AXSSImagePreviewViewController _zoomImage:withContentOffset:animated:](self, "_zoomImage:withContentOffset:animated:", v3, v24, v26, v27);
    }
  }
}

- (void)_zoomImageToBestScaleIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AXSSImagePreviewViewController *)self isManualZoomActive]
    && [(AXSSImagePreviewViewController *)self _isSnapshotViewAttached])
  {
    double v5 = [(AXSSImagePreviewViewController *)self contentSnapshot];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    [(AXSSImagePreviewViewController *)self _scrollViewClippedSize];
    double v12 = v10;
    double v13 = v11;
    BOOL v14 = floor(v11) < 1.0 || v9 < 1.0;
    if (!v14 && v7 >= 1.0)
    {
      BOOL v16 = v7 > v10;
      BOOL v17 = v9 > v11;
      double v18 = v10 / v7;
      if (v10 / v7 >= v13 / v9) {
        double v19 = v10 / v7;
      }
      else {
        double v19 = v13 / v9;
      }
      if (v10 / v7 >= v13 / v9) {
        double v18 = v13 / v9;
      }
      double v20 = 2.5;
      if (v19 <= 2.5) {
        double v20 = v19;
      }
      if (v16 && v17) {
        double v21 = 1.0;
      }
      else {
        double v21 = v20;
      }
      if (v16 && v17) {
        double v22 = v18;
      }
      else {
        double v22 = 1.0;
      }
      [(AXSSImagePreviewViewController *)self edgeInsets];
      double v25 = -(v13 - v21 * v9) * 0.5 - v24;
      double v26 = ceil(-(v12 - v21 * v7) * 0.5 - v23);
      double v27 = floor(v25);
      v28 = [(AXSSImagePreviewViewController *)self scrollView];
      [v28 setMinimumZoomScale:v22];

      v29 = [(AXSSImagePreviewViewController *)self scrollView];
      [v29 setMaximumZoomScale:2.5];

      -[AXSSImagePreviewViewController _zoomImage:withContentOffset:animated:](self, "_zoomImage:withContentOffset:animated:", v3, v21, v26, v27);
    }
  }
}

- (void)_centerImageIfNeeded
{
  if ([(AXSSImagePreviewViewController *)self _isSnapshotViewAttached])
  {
    [(AXSSImagePreviewViewController *)self _scrollViewClippedSize];
    double v4 = v3;
    double v6 = v5;
    double v7 = [(AXSSImagePreviewViewController *)self scrollView];
    [v7 contentSize];
    double v9 = v8;
    double v11 = v10;

    [(AXSSImagePreviewViewController *)self edgeInsets];
    double v16 = (v4 - v9) * 0.5;
    if (v9 >= v4) {
      double v16 = -0.0;
    }
    double v17 = v15 + v16;
    double v18 = v13 + v16;
    double v19 = (v6 - v11) * 0.5;
    if (v11 >= v6) {
      double v19 = -0.0;
    }
    double v20 = v12 + v19;
    double v21 = v14 + v19;
    id v22 = [(AXSSImagePreviewViewController *)self scrollView];
    objc_msgSend(v22, "setContentInset:", v20, v18, v21, v17);
  }
}

- (void)_zoomImage:(double)a3 withContentOffset:(CGPoint)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  double v9 = [(AXSSImagePreviewViewController *)self scrollView];
  [v9 zoomScale];
  if (v10 != a3 || (([v9 contentOffset], v12 == x) ? (BOOL v13 = v11 == y) : (BOOL v13 = 0), !v13))
  {
    if (v5)
    {
      double v14 = (void *)MEMORY[0x263F82E00];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __72__AXSSImagePreviewViewController__zoomImage_withContentOffset_animated___block_invoke;
      v15[3] = &unk_264855A70;
      id v16 = v9;
      double v17 = a3;
      double v18 = x;
      double v19 = y;
      [v14 animateWithDuration:0x20000 delay:v15 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:0.800000012 completion:5.0];
    }
    else
    {
      [v9 setZoomScale:0 animated:a3];
      objc_msgSend(v9, "setContentOffset:animated:", 0, x, y);
    }
  }
}

uint64_t __72__AXSSImagePreviewViewController__zoomImage_withContentOffset_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setZoomScale:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setContentOffset:", v2, v3);
}

- (void)_stopScrollViewAnimations
{
  id v2 = [(AXSSImagePreviewViewController *)self scrollView];
  [v2 zoomScale];
  objc_msgSend(v2, "setZoomScale:animated:", 0);
  [v2 contentOffset];
  objc_msgSend(v2, "setContentOffset:animated:", 0);
}

- (void)_imagePreviewViewControllerSetupUI
{
  double v3 = [(AXSSImagePreviewViewController *)self scrollView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82B88]);
    BOOL v5 = [(AXSSImagePreviewViewController *)self view];
    [v5 bounds];
    id v7 = (id)objc_msgSend(v4, "initWithFrame:");

    [v7 setAutoresizingMask:18];
    [v7 setDelegate:self];
    [v7 setAlwaysBounceVertical:1];
    [v7 setAlwaysBounceHorizontal:1];
    [(AXSSImagePreviewViewController *)self edgeInsets];
    objc_msgSend(v7, "setScrollIndicatorInsets:");
    double v6 = [(AXSSImagePreviewViewController *)self view];
    [v6 addSubview:v7];

    [(AXSSImagePreviewViewController *)self setScrollView:v7];
  }
}

- (void)_addGestureRecognizers
{
  double v3 = [(AXSSImagePreviewViewController *)self doubleTapGestureRecognizer];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__doubleTapGestureRecognized_];
    [v4 setNumberOfTapsRequired:2];
    [v4 setNumberOfTouchesRequired:1];
    [v4 setDelegate:self];
    BOOL v5 = [(AXSSImagePreviewViewController *)self scrollView];
    [v5 addGestureRecognizer:v4];

    [(AXSSImagePreviewViewController *)self setDoubleTapGestureRecognizer:v4];
  }
  double v6 = [(AXSSImagePreviewViewController *)self pinchGestureRecognizer];

  if (!v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F82A40]) initWithTarget:self action:sel__pinchGestureRecognized_];
    [v7 setDelegate:self];
    double v8 = [(AXSSImagePreviewViewController *)self scrollView];
    [v8 addGestureRecognizer:v7];

    [(AXSSImagePreviewViewController *)self setPinchGestureRecognizer:v7];
  }
  double v9 = [(AXSSImagePreviewViewController *)self swipeGestureRecognizer];

  if (!v9)
  {
    id v11 = (id)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:self action:sel__swipeGestureRecognized_];
    [v11 setDelegate:self];
    [v11 setDirection:8];
    double v10 = [(AXSSImagePreviewViewController *)self scrollView];
    [v10 addGestureRecognizer:v11];

    [(AXSSImagePreviewViewController *)self setSwipeGestureRecognizer:v11];
  }
}

- (void)_removeGestureRecognizers
{
  id v8 = [(AXSSImagePreviewViewController *)self doubleTapGestureRecognizer];
  if (v8)
  {
    double v3 = [(AXSSImagePreviewViewController *)self scrollView];
    [v3 removeGestureRecognizer:v8];

    [(AXSSImagePreviewViewController *)self setDoubleTapGestureRecognizer:0];
  }
  id v4 = [(AXSSImagePreviewViewController *)self pinchGestureRecognizer];
  if (v4)
  {
    BOOL v5 = [(AXSSImagePreviewViewController *)self scrollView];
    [v5 removeGestureRecognizer:v4];

    [(AXSSImagePreviewViewController *)self setPinchGestureRecognizer:0];
  }
  double v6 = [(AXSSImagePreviewViewController *)self swipeGestureRecognizer];
  if (v6)
  {
    id v7 = [(AXSSImagePreviewViewController *)self scrollView];
    [v7 removeGestureRecognizer:v6];

    [(AXSSImagePreviewViewController *)self setSwipeGestureRecognizer:0];
  }
}

- (void)_viewShouldExpand
{
  id v3 = [(AXSSImagePreviewViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 imagePreviewShouldExpand:self];
  }
}

- (AXSSImagePreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSSImagePreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (void)setContentSnapshot:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (UISwipeGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (void)setSwipeGestureRecognizer:(id)a3
{
}

- (BOOL)isManualZoomActive
{
  return self->_isManualZoomActive;
}

- (void)setIsManualZoomActive:(BOOL)a3
{
  self->_isManualZoomActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface AVPictureInPictureContentViewController
- (AVPictureInPictureContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AVPictureInPictureContentViewControllerDelegate)delegate;
- (AVPictureInPictureController)pictureInPictureController;
- (AVPictureInPictureControllerContentSource)contentSource;
- (AVPictureInPictureViewController)pictureInPictureViewController;
- (AVPlayerController)playerController;
- (BOOL)avkit_isVisible;
- (BOOL)avkit_wantsManagedSecondScreenPlayback;
- (BOOL)lastKnownIsVisible;
- (CGRect)avkit_videoRectInWindow;
- (CGRect)lastKnownVideoRectInWindow;
- (NSTimer)observeSourceViewTimer;
- (UIWindow)avkit_window;
- (id)avkit_pictureInPictureViewController;
- (int64_t)avkit_contentSourceType;
- (void)_observeSourceView;
- (void)_removeFromParent;
- (void)_setLastKnownIsVisible:(BOOL)a3 videoRectInWindow:(CGRect)a4;
- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3;
- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3;
- (void)setContentSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKnownIsVisible:(BOOL)a3;
- (void)setLastKnownVideoRectInWindow:(CGRect)a3;
- (void)setObserveSourceViewTimer:(id)a3;
- (void)setPictureInPictureController:(id)a3;
- (void)setPictureInPictureViewController:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)startObservingSourceView;
- (void)stopObservingSourceView;
@end

@implementation AVPictureInPictureContentViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentSource);
  objc_destroyWeak((id *)&self->_pictureInPictureController);
  objc_storeStrong((id *)&self->_observeSourceViewTimer, 0);
  objc_destroyWeak((id *)&self->_pictureInPictureViewController);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_playerController, 0);
}

- (AVPictureInPictureControllerContentSource)contentSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentSource);

  return (AVPictureInPictureControllerContentSource *)WeakRetained;
}

- (void)setPictureInPictureController:(id)a3
{
}

- (AVPictureInPictureController)pictureInPictureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureController);

  return (AVPictureInPictureController *)WeakRetained;
}

- (void)setLastKnownIsVisible:(BOOL)a3
{
  self->_lastKnownIsVisible = a3;
}

- (BOOL)lastKnownIsVisible
{
  return self->_lastKnownIsVisible;
}

- (void)setLastKnownVideoRectInWindow:(CGRect)a3
{
  self->_lastKnownVideoRectInWindow = a3;
}

- (CGRect)lastKnownVideoRectInWindow
{
  double x = self->_lastKnownVideoRectInWindow.origin.x;
  double y = self->_lastKnownVideoRectInWindow.origin.y;
  double width = self->_lastKnownVideoRectInWindow.size.width;
  double height = self->_lastKnownVideoRectInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setObserveSourceViewTimer:(id)a3
{
}

- (NSTimer)observeSourceViewTimer
{
  return self->_observeSourceViewTimer;
}

- (void)setPictureInPictureViewController:(id)a3
{
}

- (AVPictureInPictureViewController)pictureInPictureViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureViewController);

  return (AVPictureInPictureViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVPictureInPictureContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVPictureInPictureContentViewControllerDelegate *)WeakRetained;
}

- (void)_removeFromParent
{
  [(AVPictureInPictureContentViewController *)self willMoveToParentViewController:0];
  v3 = [(AVPictureInPictureContentViewController *)self view];
  [v3 removeFromSuperview];

  [(AVPictureInPictureContentViewController *)self removeFromParentViewController];
}

- (void)_setLastKnownIsVisible:(BOOL)a3 videoRectInWindow:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  if ([(AVPictureInPictureContentViewController *)self lastKnownIsVisible] == a3)
  {
    [(AVPictureInPictureContentViewController *)self lastKnownVideoRectInWindow];
    v18.origin.double x = v10;
    v18.origin.double y = v11;
    v18.size.double width = v12;
    v18.size.double height = v13;
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    BOOL v14 = CGRectEqualToRect(v17, v18);
    [(AVPictureInPictureContentViewController *)self setLastKnownIsVisible:v8];
    -[AVPictureInPictureContentViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
    if (v14) {
      return;
    }
  }
  else
  {
    [(AVPictureInPictureContentViewController *)self setLastKnownIsVisible:v8];
    -[AVPictureInPictureContentViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
  }
  id v15 = [(AVPictureInPictureContentViewController *)self pictureInPictureController];
  [v15 contentSourceVideoRectInWindowChanged];
}

- (void)_observeSourceView
{
  BOOL v3 = [(AVPictureInPictureContentViewController *)self avkit_isVisible];
  [(AVPictureInPictureContentViewController *)self avkit_videoRectInWindow];

  -[AVPictureInPictureContentViewController _setLastKnownIsVisible:videoRectInWindow:](self, "_setLastKnownIsVisible:videoRectInWindow:", v3);
}

- (BOOL)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (int64_t)avkit_contentSourceType
{
  return 3;
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPictureInPictureContentViewController *)self parentViewController];

  if (v5 == v4)
  {
    [(AVPictureInPictureContentViewController *)self _removeFromParent];
  }
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v18 = a3;
  id v4 = [(AVPictureInPictureContentViewController *)self parentViewController];

  if (v4) {
    [(AVPictureInPictureContentViewController *)self _removeFromParent];
  }
  [v18 addChildViewController:self];
  id v5 = [v18 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(AVPictureInPictureContentViewController *)self view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  id v15 = [(AVPictureInPictureContentViewController *)self view];
  [v15 setAutoresizingMask:18];

  v16 = [v18 view];
  CGRect v17 = [(AVPictureInPictureContentViewController *)self view];
  [v16 addSubview:v17];

  [(AVPictureInPictureContentViewController *)self didMoveToParentViewController:v18];
}

- (id)avkit_pictureInPictureViewController
{
  BOOL v3 = [(AVPictureInPictureContentViewController *)self pictureInPictureViewController];
  if (!v3)
  {
    BOOL v3 = objc_alloc_init(AVPictureInPictureViewController);
    [(AVPictureInPictureContentViewController *)self setPictureInPictureViewController:v3];
  }

  return v3;
}

- (UIWindow)avkit_window
{
  v2 = [(AVPictureInPictureContentViewController *)self contentSource];
  BOOL v3 = [v2 activeSourceView];
  id v4 = [v3 window];

  return (UIWindow *)v4;
}

- (BOOL)avkit_isVisible
{
  BOOL v3 = [(AVPictureInPictureContentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVPictureInPictureContentViewController *)self delegate];
    double v6 = [(AVPictureInPictureContentViewController *)self contentSource];
    id v7 = [v6 activeSourceView];
    LOBYTE(v8) = [v5 pictureInPictureContentViewController:self isViewVisible:v7];
  }
  else
  {
    id v5 = [(AVPictureInPictureContentViewController *)self contentSource];
    id v7 = [v5 activeSourceView];
    double v9 = [v7 window];
    if (v9 && ([v7 isHiddenOrHasHiddenAncestor] & 1) == 0)
    {
      [v7 bounds];
      objc_msgSend(v9, "convertRect:fromView:", v7);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v9 bounds];
      v25.origin.double x = v18;
      v25.origin.double y = v19;
      v25.size.double width = v20;
      v25.size.double height = v21;
      v23.origin.double x = v11;
      v23.origin.double y = v13;
      v23.size.double width = v15;
      v23.size.double height = v17;
      CGRect v24 = CGRectIntersection(v23, v25);
      int v8 = !CGRectIsEmpty(v24);
    }
    else
    {
      LOBYTE(v8) = 0;
    }

    double v6 = v7;
  }

  return v8;
}

- (CGRect)avkit_videoRectInWindow
{
  BOOL v3 = [(AVPictureInPictureContentViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVPictureInPictureContentViewController *)self delegate];
    [v5 pictureInPictureContentViewControllerVideoFrameInWindow:self];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    id v5 = [(AVPictureInPictureContentViewController *)self contentSource];
    double v14 = [v5 activeSourceView];
    CGFloat v15 = [v14 window];
    double v16 = [(AVPictureInPictureContentViewController *)self contentSource];
    CGFloat v17 = [v16 activeSourceView];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [(AVPictureInPictureContentViewController *)self contentSource];
    v27 = [v26 activeSourceView];
    objc_msgSend(v15, "convertRect:fromView:", v27, v19, v21, v23, v25);
    double v7 = v28;
    double v9 = v29;
    double v11 = v30;
    double v13 = v31;
  }
  double v32 = v7;
  double v33 = v9;
  double v34 = v11;
  double v35 = v13;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (void)stopObservingSourceView
{
  BOOL v3 = [(AVPictureInPictureContentViewController *)self observeSourceViewTimer];
  [v3 invalidate];

  [(AVPictureInPictureContentViewController *)self setObserveSourceViewTimer:0];
}

- (void)startObservingSourceView
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _observeSourceView];

  id v3 = objc_loadWeakRetained(v1);
  char v4 = [v3 observeSourceViewTimer];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    double v6 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke_2;
    v8[3] = &unk_1E5FC4480;
    objc_copyWeak(&v9, v1);
    double v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:v8 block:2.0];
    [v5 setObserveSourceViewTimer:v7];

    objc_destroyWeak(&v9);
  }
}

void __67__AVPictureInPictureContentViewController_startObservingSourceView__block_invoke_2(id *a1, void *a2)
{
  id v5 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained _observeSourceView];

  id v4 = objc_loadWeakRetained(a1);
  if (!v4) {
    [v5 invalidate];
  }
}

- (void)setContentSource:(id)a3
{
  id obj = a3;
  p_contentSource = &self->_contentSource;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentSource);

  double v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_contentSource, obj);
    double v6 = obj;
  }
}

- (void)setPlayerController:(id)a3
{
  id v5 = (AVPlayerController *)a3;
  p_playerController = &self->_playerController;
  if (self->_playerController != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_playerController, a3);
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_playerController, v5);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVPictureInPictureContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureContentViewController;
  id v4 = [(AVPictureInPictureContentViewController *)&v7 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4) {
    -[AVPictureInPictureContentViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 100.0, 100.0);
  }
  return v5;
}

@end
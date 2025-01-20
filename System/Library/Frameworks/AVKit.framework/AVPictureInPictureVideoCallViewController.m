@interface AVPictureInPictureVideoCallViewController
- (AVPictureInPictureController)pictureInPictureController;
- (AVPictureInPictureControllerContentSource)contentSource;
- (AVPictureInPictureVideoCallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AVPictureInPictureViewController)pictureInPictureViewController;
- (AVVideoCallPlayerController)videoCallPlayerController;
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
- (void)setLastKnownIsVisible:(BOOL)a3;
- (void)setLastKnownVideoRectInWindow:(CGRect)a3;
- (void)setObserveSourceViewTimer:(id)a3;
- (void)setPictureInPictureController:(id)a3;
- (void)setPictureInPictureViewController:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)startObservingSourceView;
- (void)stopObservingSourceView;
@end

@implementation AVPictureInPictureVideoCallViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentSource);
  objc_destroyWeak((id *)&self->_pictureInPictureController);
  objc_storeStrong((id *)&self->_observeSourceViewTimer, 0);
  objc_destroyWeak((id *)&self->_pictureInPictureViewController);

  objc_storeStrong((id *)&self->_videoCallPlayerController, 0);
}

- (void)setContentSource:(id)a3
{
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

- (void)_removeFromParent
{
  [(AVPictureInPictureVideoCallViewController *)self willMoveToParentViewController:0];
  v3 = [(AVPictureInPictureVideoCallViewController *)self view];
  [v3 removeFromSuperview];

  [(AVPictureInPictureVideoCallViewController *)self removeFromParentViewController];
}

- (void)_setLastKnownIsVisible:(BOOL)a3 videoRectInWindow:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  if ([(AVPictureInPictureVideoCallViewController *)self lastKnownIsVisible] == a3)
  {
    [(AVPictureInPictureVideoCallViewController *)self lastKnownVideoRectInWindow];
    v18.origin.double x = v10;
    v18.origin.double y = v11;
    v18.size.double width = v12;
    v18.size.double height = v13;
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    BOOL v14 = CGRectEqualToRect(v17, v18);
    [(AVPictureInPictureVideoCallViewController *)self setLastKnownIsVisible:v8];
    -[AVPictureInPictureVideoCallViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
    if (v14) {
      return;
    }
  }
  else
  {
    [(AVPictureInPictureVideoCallViewController *)self setLastKnownIsVisible:v8];
    -[AVPictureInPictureVideoCallViewController setLastKnownVideoRectInWindow:](self, "setLastKnownVideoRectInWindow:", x, y, width, height);
  }
  id v15 = [(AVPictureInPictureVideoCallViewController *)self pictureInPictureController];
  [v15 contentSourceVideoRectInWindowChanged];
}

- (void)_observeSourceView
{
  BOOL v3 = [(AVPictureInPictureVideoCallViewController *)self avkit_isVisible];
  [(AVPictureInPictureVideoCallViewController *)self avkit_videoRectInWindow];

  -[AVPictureInPictureVideoCallViewController _setLastKnownIsVisible:videoRectInWindow:](self, "_setLastKnownIsVisible:videoRectInWindow:", v3);
}

- (BOOL)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (int64_t)avkit_contentSourceType
{
  return 2;
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPictureInPictureVideoCallViewController *)self parentViewController];

  if (v5 == v4)
  {
    [(AVPictureInPictureVideoCallViewController *)self _removeFromParent];
  }
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v18 = a3;
  id v4 = [(AVPictureInPictureVideoCallViewController *)self parentViewController];

  if (v4) {
    [(AVPictureInPictureVideoCallViewController *)self _removeFromParent];
  }
  [v18 addChildViewController:self];
  id v5 = [v18 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(AVPictureInPictureVideoCallViewController *)self view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  id v15 = [(AVPictureInPictureVideoCallViewController *)self view];
  [v15 setAutoresizingMask:18];

  v16 = [v18 view];
  CGRect v17 = [(AVPictureInPictureVideoCallViewController *)self view];
  [v16 addSubview:v17];

  [(AVPictureInPictureVideoCallViewController *)self didMoveToParentViewController:v18];
}

- (id)avkit_pictureInPictureViewController
{
  BOOL v3 = [(AVPictureInPictureVideoCallViewController *)self pictureInPictureViewController];
  if (!v3)
  {
    BOOL v3 = objc_alloc_init(AVPictureInPictureViewController);
    [(AVPictureInPictureVideoCallViewController *)self setPictureInPictureViewController:v3];
  }

  return v3;
}

- (AVVideoCallPlayerController)videoCallPlayerController
{
  p_videoCallPlayerController = &self->_videoCallPlayerController;
  id v4 = self->_videoCallPlayerController;
  if (!v4)
  {
    id v4 = objc_alloc_init(AVVideoCallPlayerController);
    id v5 = [(AVPictureInPictureVideoCallViewController *)self contentSource];
    [(AVVideoCallPlayerController *)v4 setContentSource:v5];

    [(AVPictureInPictureVideoCallViewController *)self preferredContentSize];
    -[AVVideoCallPlayerController setContentDimensions:](v4, "setContentDimensions:");
    [(AVVideoCallPlayerController *)v4 setPictureInPicturePossible:1];
    objc_storeStrong((id *)p_videoCallPlayerController, v4);
  }

  return v4;
}

- (UIWindow)avkit_window
{
  v2 = [(AVPictureInPictureVideoCallViewController *)self contentSource];
  BOOL v3 = [v2 activeVideoCallSourceView];
  id v4 = [v3 window];

  return (UIWindow *)v4;
}

- (BOOL)avkit_isVisible
{
  v2 = [(AVPictureInPictureVideoCallViewController *)self contentSource];
  BOOL v3 = [v2 activeVideoCallSourceView];
  char v4 = objc_msgSend(v3, "avkit_isInAWindowAndVisible");

  return v4;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureVideoCallViewController;
  -[AVPictureInPictureVideoCallViewController setPreferredContentSize:](&v7, sel_setPreferredContentSize_);
  double v6 = [(AVPictureInPictureVideoCallViewController *)self videoCallPlayerController];
  objc_msgSend(v6, "setContentDimensions:", width, height);
}

- (CGRect)avkit_videoRectInWindow
{
  BOOL v3 = [(AVPictureInPictureVideoCallViewController *)self contentSource];
  char v4 = [v3 activeVideoCallSourceView];
  id v5 = [v4 window];
  double v6 = [(AVPictureInPictureVideoCallViewController *)self contentSource];
  objc_super v7 = [v6 activeVideoCallSourceView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVPictureInPictureVideoCallViewController *)self contentSource];
  CGRect v17 = [v16 activeVideoCallSourceView];
  objc_msgSend(v5, "convertRect:fromView:", v17, v9, v11, v13, v15);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)stopObservingSourceView
{
  BOOL v3 = [(AVPictureInPictureVideoCallViewController *)self observeSourceViewTimer];
  [v3 invalidate];

  [(AVPictureInPictureVideoCallViewController *)self setObserveSourceViewTimer:0];
  id v4 = [(AVPictureInPictureVideoCallViewController *)self videoCallPlayerController];
  [v4 setPictureInPicturePossible:0];
}

- (void)startObservingSourceView
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _observeSourceView];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 observeSourceViewTimer];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    double v6 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke_2;
    v8[3] = &unk_1E5FC4480;
    objc_copyWeak(&v9, v1);
    objc_super v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:v8 block:2.0];
    [v5 setObserveSourceViewTimer:v7];

    objc_destroyWeak(&v9);
  }
}

void __69__AVPictureInPictureVideoCallViewController_startObservingSourceView__block_invoke_2(id *a1, void *a2)
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

- (AVPictureInPictureVideoCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureVideoCallViewController;
  id v4 = [(AVPictureInPictureVideoCallViewController *)&v7 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4) {
    -[AVPictureInPictureVideoCallViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 100.0, 100.0);
  }
  return v5;
}

@end
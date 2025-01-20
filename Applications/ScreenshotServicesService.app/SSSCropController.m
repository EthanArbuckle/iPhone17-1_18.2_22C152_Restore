@interface SSSCropController
- (BOOL)cropEnabled;
- (BOOL)isCropped;
- (CGRect)cropOverlayViewRectInWindow;
- (CGRect)cropRect;
- (NSArray)gestureRecognizers;
- (NSArray)snapRects;
- (SSSCropController)init;
- (SSSCropControllerDelegate)delegate;
- (SSSScreenshotContainerView)viewToCrop;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIScrollView)scrollView;
- (UIView)cropView;
- (double)cornerGrabberAlpha;
- (double)cornerRadius;
- (double)lineAlpha;
- (double)lineGrabberAlpha;
- (int64_t)editMode;
- (int64_t)numberOfTouchesRequiredForPanningCrop;
- (void)_setCropRect:(CGRect)a3 notify:(BOOL)a4;
- (void)cancelCrop;
- (void)commitInflightEdits;
- (void)cropControllerRootView:(id)a3 changedToCropRect:(CGRect)a4;
- (void)cropControllerRootViewWillBeginChangingCropRect:(id)a3;
- (void)doneCrop;
- (void)enterCrop;
- (void)prepareForFullscreenExperience:(BOOL)a3;
- (void)resetCrop;
- (void)setCornerGrabberAlpha:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCropEnabled:(BOOL)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setEditMode:(int64_t)a3;
- (void)setLineAlpha:(double)a3;
- (void)setLineGrabberAlpha:(double)a3;
- (void)setNumberOfTouchesRequiredForPanningCrop:(int64_t)a3;
- (void)setPageCropRect:(CGRect)a3;
- (void)setSnapRects:(id)a3;
- (void)setViewToCrop:(id)a3;
@end

@implementation SSSCropController

- (SSSCropController)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSSCropController;
  v2 = [(SSSCropController *)&v11 init];
  v3 = objc_alloc_init(SSSCropControllerRootView);
  v4 = (void *)*((void *)v2 + 13);
  *((void *)v2 + 13) = v3;

  [*((id *)v2 + 13) setDelegate:v2];
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v2 + 24) = _Q0;
  *(_OWORD *)(v2 + 72) = *(_OWORD *)(v2 + 8);
  *(_OWORD *)(v2 + 88) = *(_OWORD *)(v2 + 24);
  [v2 setNumberOfTouchesRequiredForPanningCrop:1];
  [v2 setSnapRects:&__NSArray0__struct];
  return (SSSCropController *)v2;
}

- (UIView)cropView
{
  return (UIView *)self->_rootView;
}

- (void)setViewToCrop:(id)a3
{
}

- (SSSScreenshotContainerView)viewToCrop
{
  return [(SSSCropControllerRootView *)self->_rootView viewToCrop];
}

- (void)setEditMode:(int64_t)a3
{
}

- (int64_t)editMode
{
  return [(SSSCropControllerRootView *)self->_rootView editMode];
}

- (double)cornerGrabberAlpha
{
  [(SSSCropControllerRootView *)self->_rootView cornerGrabberAlpha];
  return result;
}

- (double)lineAlpha
{
  [(SSSCropControllerRootView *)self->_rootView lineAlpha];
  return result;
}

- (double)lineGrabberAlpha
{
  [(SSSCropControllerRootView *)self->_rootView lineGrabberAlpha];
  return result;
}

- (void)setCornerGrabberAlpha:(double)a3
{
}

- (void)setLineAlpha:(double)a3
{
}

- (void)setLineGrabberAlpha:(double)a3
{
}

- (void)setCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_lastNotifiedCropRect = a3;
  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 0);
  rootView = self->_rootView;

  -[SSSCropControllerRootView setUndoCropRect:](rootView, "setUndoCropRect:", x, y, width, height);
}

- (void)_setCropRect:(CGRect)a3 notify:(BOOL)a4
{
  self->_cropRect = a3;
  if (a4)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    if ((SSRectEqualToRect() & 1) == 0)
    {
      v9 = [(SSSCropController *)self delegate];
      [v9 cropController:self changedToCropRect:x, y, width, height];

      self->_lastNotifiedCropRect.origin.double x = x;
      self->_lastNotifiedCropRect.origin.double y = y;
      self->_lastNotifiedCropRect.size.double width = width;
      self->_lastNotifiedCropRect.size.double height = height;
    }
  }
}

- (void)commitInflightEdits
{
}

- (void)setPageCropRect:(CGRect)a3
{
}

- (void)prepareForFullscreenExperience:(BOOL)a3
{
}

- (void)enterCrop
{
  self->_saveCropRect = self->_cropRect;
}

- (void)resetCrop
{
  -[SSSCropControllerRootView setCropRect:](self->_rootView, "setCropRect:", 0.0, 0.0, 1.0, 1.0);

  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 0, 0.0, 0.0, 1.0, 1.0);
}

- (void)doneCrop
{
}

- (void)cancelCrop
{
  -[SSSCropControllerRootView setCropRect:](self->_rootView, "setCropRect:", self->_saveCropRect.origin.x, self->_saveCropRect.origin.y, self->_saveCropRect.size.width, self->_saveCropRect.size.height);
  double x = self->_saveCropRect.origin.x;
  double y = self->_saveCropRect.origin.y;
  double width = self->_saveCropRect.size.width;
  double height = self->_saveCropRect.size.height;

  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", 0, x, y, width, height);
}

- (BOOL)isCropped
{
  v3.origin.double x = 0.0;
  v3.origin.double y = 0.0;
  v3.size.double width = 1.0;
  v3.size.double height = 1.0;
  return !CGRectEqualToRect(self->_cropRect, v3);
}

- (NSArray)gestureRecognizers
{
  return [(SSSCropControllerRootView *)self->_rootView gestureRecognizers];
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return [(SSSCropControllerRootView *)self->_rootView panGestureRecognizer];
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return [(SSSCropControllerRootView *)self->_rootView pinchGestureRecognizer];
}

- (void)setNumberOfTouchesRequiredForPanningCrop:(int64_t)a3
{
}

- (int64_t)numberOfTouchesRequiredForPanningCrop
{
  return [(SSSCropControllerRootView *)self->_rootView numberOfTouchesRequiredForPanningCrop];
}

- (void)setCropEnabled:(BOOL)a3
{
}

- (BOOL)cropEnabled
{
  return [(SSSCropControllerRootView *)self->_rootView cropEnabled];
}

- (void)setSnapRects:(id)a3
{
}

- (NSArray)snapRects
{
  return [(SSSCropControllerRootView *)self->_rootView snapRects];
}

- (void)setCornerRadius:(double)a3
{
}

- (double)cornerRadius
{
  [(SSSCropControllerRootView *)self->_rootView cornerRadius];
  return result;
}

- (void)cropControllerRootViewWillBeginChangingCropRect:(id)a3
{
  id v4 = [(SSSCropController *)self delegate];
  [v4 cropControllerDidBeginCropping:self];
}

- (void)cropControllerRootView:(id)a3 changedToCropRect:(CGRect)a4
{
  -[SSSCropController _setCropRect:notify:](self, "_setCropRect:notify:", [a3 editMode] != (id)2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v5 = [(SSSCropController *)self delegate];
  [v5 cropControllerCropRectDidChange:self];
}

- (UIScrollView)scrollView
{
  return [(SSSCropControllerRootView *)self->_rootView scrollView];
}

- (CGRect)cropOverlayViewRectInWindow
{
  [(SSSCropControllerRootView *)self->_rootView cropOverlayViewRectInWindow];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SSSCropControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSCropControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_rootView, 0);
}

@end
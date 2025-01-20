@interface _SSSScreenshotContentOverlayController
- ($0AC6E346AE4835514AAA8AC86D8F4844)viewState;
- (AKController)annotationKitController;
- (BOOL)active;
- (BOOL)gesturesEnabled;
- (BOOL)rulerHostWantsSharedRuler;
- (CGRect)rectToCenterAboveKeyboard;
- (NSArray)gestureRecognizers;
- (SSSScreenshot)screenshot;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIRotationGestureRecognizer)rotationGestureRecognizer;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)overlayView;
- (UIView)rulerHostView;
- (_SSSScreenshotContentOverlayControllerDelegate)delegate;
- (id)rulerHostingView;
- (void)setActive:(BOOL)a3;
- (void)setAnnotationKitController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setRulerHostView:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation _SSSScreenshotContentOverlayController

- (CGRect)rectToCenterAboveKeyboard
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return 0;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return 0;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return 0;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return 0;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return 0;
}

- (UIView)overlayView
{
  return 0;
}

- (NSArray)gestureRecognizers
{
  return (NSArray *)&__NSArray0__struct;
}

- (void)setGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_gesturesEnabled = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(_SSSScreenshotContentOverlayController *)self gestureRecognizers];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setEnabled:v3];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)rulerHostingView
{
  return [(_SSSScreenshotContentOverlayController *)self rulerHostView];
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (SSSScreenshot)screenshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshot);

  return (SSSScreenshot *)WeakRetained;
}

- (void)setScreenshot:(id)a3
{
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)viewState
{
  int64_t page = self->_viewState.page;
  int64_t state = self->_viewState.state;
  result.var1 = page;
  result.var0 = state;
  return result;
}

- (void)setViewState:(id)a3
{
  self->_viewState = ($AB3BE9747824767834AFB82FA4A604F6)a3;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (_SSSScreenshotContentOverlayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SSSScreenshotContentOverlayControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKController)annotationKitController
{
  return self->_annotationKitController;
}

- (void)setAnnotationKitController:(id)a3
{
}

- (UIView)rulerHostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostView);

  return (UIView *)WeakRetained;
}

- (void)setRulerHostView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rulerHostView);
  objc_storeStrong((id *)&self->_annotationKitController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_screenshot);
}

@end
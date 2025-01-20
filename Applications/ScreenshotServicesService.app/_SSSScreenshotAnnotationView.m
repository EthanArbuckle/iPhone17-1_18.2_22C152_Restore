@interface _SSSScreenshotAnnotationView
- (BOOL)didDrawPenStroke;
- (BOOL)screenshotEditsSnapshotted;
- (SSSScreenshot)screenshot;
- (UIView)annotationOverlayView;
- (UIView)vellumView;
- (_SSSScreenshotAnnotationView)initWithFrame:(CGRect)a3;
- (_SSSScreenshotContentOverlayController)overlayController;
- (double)cornerRadius;
- (double)vellumOpacity;
- (void)_asyncHideCachedOverlayView;
- (void)_cancelScheduledHideCachedOverlayView;
- (void)_hideAndShowViewsForScreenshotEditsSnapshotted:(BOOL)a3;
- (void)_scheduleHideCachedOverlayViewWithDelay:(double)a3;
- (void)_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:(BOOL)a3;
- (void)dealloc;
- (void)endedEditing;
- (void)enterEditing;
- (void)generateSnapshotImageIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)setAnnotationOverlayView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setOverlayControllerActive:(BOOL)a3;
- (void)setRulerHostView:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setScreenshotEditsSnapshotted:(BOOL)a3;
- (void)setVellumOpacity:(double)a3;
- (void)setVellumView:(id)a3;
- (void)updateUndoState;
@end

@implementation _SSSScreenshotAnnotationView

- (_SSSScreenshotAnnotationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SSSScreenshotAnnotationView;
  v3 = -[_SSSScreenshotAnnotationView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(_SSSScreenshotAnnotationController);
  overlayController = v3->_overlayController;
  v3->_overlayController = &v4->super;

  return v3;
}

- (void)dealloc
{
  [(_SSSScreenshotAnnotationView *)self endedEditing];
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotAnnotationView;
  [(_SSSScreenshotAnnotationView *)&v3 dealloc];
}

- (void)updateUndoState
{
}

- (void)setGesturesEnabled:(BOOL)a3
{
}

- (void)setRulerHostView:(id)a3
{
}

- (void)setScreenshot:(id)a3
{
  objc_storeStrong((id *)&self->_screenshot, a3);
  id v5 = a3;
  [(_SSSScreenshotContentOverlayController *)self->_overlayController setScreenshot:v5];
}

- (void)enterEditing
{
  [(_SSSScreenshotAnnotationView *)self _hideAndShowViewsForScreenshotEditsSnapshotted:[(_SSSScreenshotAnnotationView *)self screenshotEditsSnapshotted]];
  [(_SSSScreenshotAnnotationView *)self _updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:[(_SSSScreenshotAnnotationView *)self screenshotEditsSnapshotted]];
  [(_SSSScreenshotContentOverlayController *)self->_overlayController logDidEnterEditingWithOverlay];

  [(_SSSScreenshotAnnotationView *)self setNeedsLayout];
}

- (void)endedEditing
{
  [(_SSSScreenshotContentOverlayController *)self->_overlayController setActive:0];
  overlayController = self->_overlayController;

  [(_SSSScreenshotContentOverlayController *)overlayController logDidEndEditingWithOverlay];
}

- (BOOL)didDrawPenStroke
{
  return [(_SSSScreenshotContentOverlayController *)self->_overlayController didDrawPenStroke];
}

- (void)setOverlayControllerActive:(BOOL)a3
{
  self->_overlayControllerActive = a3;
  if (a3) {
    [(_SSSScreenshotAnnotationView *)self enterEditing];
  }
  else {
    [(_SSSScreenshotAnnotationView *)self endedEditing];
  }
}

- (void)setVellumOpacity:(double)a3
{
  if (self->_vellumOpacity != a3)
  {
    self->_vellumOpacity = a3;
    [(_SSSScreenshotAnnotationView *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(_SSSScreenshotAnnotationView *)self setClipsToBounds:a3 > 0.0];

  [(_SSSScreenshotAnnotationView *)self _setCornerRadius:a3];
}

- (void)setScreenshotEditsSnapshotted:(BOOL)a3
{
  if (self->_screenshotEditsSnapshotted != a3)
  {
    BOOL v3 = a3;
    self->_screenshotEditsSnapshotted = a3;
    objc_initWeak(&location, self);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    objc_super v7 = sub_100036340;
    v8 = &unk_100099BD0;
    objc_copyWeak(&v9, &location);
    [(_SSSScreenshotAnnotationView *)self generateSnapshotImageIfNecessary:v3 withCompletion:&v5];
    [(_SSSScreenshotAnnotationView *)self setNeedsLayout];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_asyncHideCachedOverlayView
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003644C;
  v2[3] = &unk_100099BD0;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_scheduleHideCachedOverlayViewWithDelay:(double)a3
{
}

- (void)_cancelScheduledHideCachedOverlayView
{
}

- (void)_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:(BOOL)a3
{
  id v5 = [(_SSSScreenshotAnnotationView *)self overlayController];
  uint64_t v6 = v5;
  BOOL v7 = !a3 && self->_overlayControllerActive;
  [v5 setActive:v7];

  [(_SSSScreenshotAnnotationView *)self setNeedsLayout];
}

- (void)_hideAndShowViewsForScreenshotEditsSnapshotted:(BOOL)a3
{
  BOOL v3 = a3;
  [(_SSSScreenshotAnnotationView *)self _cancelScheduledHideCachedOverlayView];
  id v5 = [(_SSSScreenshotAnnotationView *)self annotationOverlayView];
  uint64_t v6 = v5;
  if (v3)
  {
    [v5 setHidden:1];

    [(UIView *)self->_vellumView setHidden:1];
    [(_SSSScreenshotAnnotationView *)self setCachedViewsHidden:0];
    if ((_SSIsViewSnapshotDebuggingEnabled() & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v7 = +[UIColor blueColor];
  }
  else
  {
    [v5 setHidden:0];

    [(_SSSScreenshotAnnotationView *)self _scheduleHideCachedOverlayViewWithDelay:0.0833333333];
    if (!_SSIsViewSnapshotDebuggingEnabled()) {
      goto LABEL_7;
    }
    uint64_t v7 = +[UIColor redColor];
  }
  v8 = (void *)v7;
  id v9 = [(_SSSScreenshotAnnotationView *)self layer];
  id v10 = v8;
  [v9 setBorderColor:[v10 CGColor]];

  v11 = [(_SSSScreenshotAnnotationView *)self layer];
  [v11 setBorderWidth:20.0];

LABEL_7:

  [(_SSSScreenshotAnnotationView *)self setNeedsLayout];
}

- (void)generateSnapshotImageIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (_SSSScreenshotContentOverlayController)overlayController
{
  return self->_overlayController;
}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (UIView)annotationOverlayView
{
  return self->_annotationOverlayView;
}

- (void)setAnnotationOverlayView:(id)a3
{
}

- (BOOL)screenshotEditsSnapshotted
{
  return self->_screenshotEditsSnapshotted;
}

- (UIView)vellumView
{
  return self->_vellumView;
}

- (void)setVellumView:(id)a3
{
}

- (double)vellumOpacity
{
  return self->_vellumOpacity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vellumView, 0);
  objc_storeStrong((id *)&self->_annotationOverlayView, 0);
  objc_storeStrong((id *)&self->_screenshot, 0);

  objc_storeStrong((id *)&self->_overlayController, 0);
}

@end
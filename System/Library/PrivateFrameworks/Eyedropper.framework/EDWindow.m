@interface EDWindow
+ (BOOL)_isSecure;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_preventsRootPresentationController;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)_shouldControlAutorotation;
- (EDWindow)initWithWindowScene:(id)a3;
- (EDWindowTrackingDelegate)trackingDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTrackingDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation EDWindow

- (EDWindow)initWithWindowScene:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)EDWindow;
  id v3 = a3;
  v4 = [(EDWindow *)&v11 initWithWindowScene:v3];
  -[EDWindow setHidden:](v4, "setHidden:", 0, v11.receiver, v11.super_class);
  v5 = [MEMORY[0x263F1C550] clearColor];
  [(EDWindow *)v4 setBackgroundColor:v5];

  [(EDWindow *)v4 setWindowLevel:*MEMORY[0x263F1D5C0] + -1.0];
  [(EDWindow *)v4 _setWindowControlsStatusBarOrientation:0];
  v6 = [(EDWindow *)v4 layer];
  [v6 setDisableUpdateMask:2];

  v7 = [EDWindowRootViewController alloc];
  v8 = [v3 screen];

  [v8 bounds];
  v9 = -[EDWindowRootViewController initWithScreenBounds:](v7, "initWithScreenBounds:");
  [(EDWindow *)v4 setRootViewController:v9];

  return v4;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_preventsRootPresentationController
{
  return 1;
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(EDWindow *)self rootViewController];
  v9 = [v8 lensView];

  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  if (!objc_msgSend(v9, "pointInside:withEvent:", v7)
    || ([v9 isHidden] & 1) != 0
    || ([v9 alpha], v10 == 0.0))
  {
    objc_super v11 = self;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)EDWindow;
    -[EDWindow hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
    objc_super v11 = (EDWindow *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(EDWindow *)self trackingDelegate];
  [v6 trackedTouchesBegan:v5];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(EDWindow *)self trackingDelegate];
  [v6 trackedTouchesMoved:v5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(EDWindow *)self trackingDelegate];
  [v6 trackedTouchesEnded:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(EDWindow *)self trackingDelegate];
  [v6 trackedTouchesCancelled:v5];
}

- (EDWindowTrackingDelegate)trackingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingDelegate);

  return (EDWindowTrackingDelegate *)WeakRetained;
}

- (void)setTrackingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
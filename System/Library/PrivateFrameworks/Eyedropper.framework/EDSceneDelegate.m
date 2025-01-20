@interface EDSceneDelegate
- (UIWindow)window;
- (id)appDelegate;
- (id)lensView;
- (void)resetTouchesBeganTime;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
- (void)trackedTouchesBegan:(id)a3;
- (void)trackedTouchesEnded:(id)a3;
- (void)trackedTouchesMoved:(id)a3;
@end

@implementation EDSceneDelegate

- (id)appDelegate
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 delegate];

  return v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  v7 = [[EDWindow alloc] initWithWindowScene:v6];

  window = self->_window;
  self->_window = &v7->super;
  v11 = v7;

  v9 = [(EDSceneDelegate *)self appDelegate];
  v10 = [(EDSceneDelegate *)self lensView];
  [v10 setDelegate:v9];

  [(EDWindow *)v11 setTrackingDelegate:self];
  [(UIWindow *)self->_window makeKeyAndVisible];
}

- (id)lensView
{
  v2 = [(UIWindow *)self->_window rootViewController];
  v3 = [v2 lensView];

  return v3;
}

- (void)trackedTouchesBegan:(id)a3
{
  id v14 = a3;
  v4 = [(EDSceneDelegate *)self appDelegate];
  v5 = [(EDSceneDelegate *)self lensView];
  id v6 = [v4 activeLensView];

  if (v6 == v5)
  {
    v7 = [v14 anyObject];
    [v7 locationInView:self->_window];
    double v9 = v8;
    double v11 = v10;
    v12 = [v4 activeLensView];
    objc_msgSend(v12, "updateCenterOffsetAtTouchDown:", v9, v11);
  }
  if (self->_touchesBeganTime == 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_touchesBeganTime = v13;
  }
}

- (void)trackedTouchesEnded:(id)a3
{
  id v15 = a3;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  if (v4 - self->_touchesBeganTime > 0.2)
  {
    v5 = [(EDSceneDelegate *)self appDelegate];
    id v6 = [(EDSceneDelegate *)self lensView];
    v7 = [v15 anyObject];
    double v8 = [(EDSceneDelegate *)self window];
    [v7 locationInView:v8];
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    double v13 = [v5 activeLensView];
    if (v13 == v6)
    {
      [v6 frame];
      v17.x = v10;
      v17.y = v12;
      BOOL v14 = CGRectContainsPoint(v18, v17);

      if (v14) {
        [v6 selectColor];
      }
    }
    else
    {
    }
    [(EDSceneDelegate *)self resetTouchesBeganTime];
    [v5 dismissEyedropper];
  }
}

- (void)trackedTouchesMoved:(id)a3
{
  id v15 = a3;
  double v4 = [(EDSceneDelegate *)self appDelegate];
  v5 = [(EDSceneDelegate *)self lensView];
  if (![v5 isActive]
    || ([v4 activeLensView], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6 != v5))
  {
    v7 = [v15 anyObject];
    double v8 = [(EDSceneDelegate *)self window];
    [v7 locationInView:v8];
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    double v13 = [(EDSceneDelegate *)self window];
    [v13 bounds];
    v17.x = v10;
    v17.y = v12;
    BOOL v14 = CGRectContainsPoint(v18, v17);

    if (v14) {
      [v5 setActive:1];
    }
  }
  [(EDSceneDelegate *)self resetTouchesBeganTime];
  [v5 updateLensViewWithEvent:v15];
}

- (void)resetTouchesBeganTime
{
  self->_touchesBeganTime = 0.0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
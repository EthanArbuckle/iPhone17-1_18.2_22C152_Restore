@interface HUQuickControlInteractionCoordinator
- (BOOL)isUserInteractionActive;
- (BOOL)isUserInteractionEnabled;
- (BOOL)viewVisible;
- (HUQuickControlControllableView)controlView;
- (HUQuickControlInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4;
- (HUQuickControlInteractionCoordinatorDelegate)delegate;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setViewVisible:(BOOL)a3;
@end

@implementation HUQuickControlInteractionCoordinator

- (HUQuickControlInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlInteractionCoordinator;
  v9 = [(HUQuickControlInteractionCoordinator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controlView, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, self, @"HUQuickControlInteractionCoordinator.m", 29, @"%s is an abstract method that must be overriden by subclass %@", "-[HUQuickControlInteractionCoordinator beginUserInteractionWithFirstTouchGestureRecognizer:]", objc_opt_class() object file lineNumber description];
}

- (BOOL)isUserInteractionActive
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUQuickControlInteractionCoordinator.m", 39, @"%s is an abstract method that must be overriden by subclass %@", "-[HUQuickControlInteractionCoordinator isUserInteractionActive]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (BOOL)viewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (HUQuickControlControllableView)controlView
{
  return self->_controlView;
}

- (HUQuickControlInteractionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlInteractionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_controlView, 0);
}

@end
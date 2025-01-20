@interface SKWeakContainer
- (BOOL)wasOnScreen;
- (UIView)scrollingView;
- (UIView)trackingView;
- (void)setScrollingView:(id)a3;
- (void)setTrackingView:(id)a3;
- (void)setWasOnScreen:(BOOL)a3;
@end

@implementation SKWeakContainer

- (UIView)scrollingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollingView);

  return (UIView *)WeakRetained;
}

- (void)setScrollingView:(id)a3
{
}

- (UIView)trackingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingView);

  return (UIView *)WeakRetained;
}

- (void)setTrackingView:(id)a3
{
}

- (BOOL)wasOnScreen
{
  return self->_wasOnScreen;
}

- (void)setWasOnScreen:(BOOL)a3
{
  self->_wasOnScreen = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trackingView);

  objc_destroyWeak((id *)&self->_scrollingView);
}

@end
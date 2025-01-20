@interface JFXPassThroughContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldDelegatePointInside;
- (JFXPassThroughContainerViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldDelegatePointInside:(BOOL)a3;
@end

@implementation JFXPassThroughContainerView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(JFXPassThroughContainerView *)self shouldDelegatePointInside]
    && ([(JFXPassThroughContainerView *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    v10 = [(JFXPassThroughContainerView *)self delegate];
    unsigned __int8 v11 = objc_msgSend(v10, "passThroughContainerView:hasPointInside:", self, x, y);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)JFXPassThroughContainerView;
    unsigned __int8 v11 = -[JFXPassThroughContainerView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)JFXPassThroughContainerView;
  -[JFXPassThroughContainerView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
  id v7 = (JFXPassThroughContainerView *)objc_claimAutoreleasedReturnValue();
  v8 = [(JFXPassThroughContainerView *)self delegate];
  char v9 = objc_msgSend(v8, "passThroughContainerView:shouldHandleTouchWithinView:atPoint:", self, v7, x, y);

  if ((v9 & 1) != 0 || v7 != self) {
    v10 = v7;
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (JFXPassThroughContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JFXPassThroughContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldDelegatePointInside
{
  return self->_shouldDelegatePointInside;
}

- (void)setShouldDelegatePointInside:(BOOL)a3
{
  self->_shouldDelegatePointInside = a3;
}

- (void).cxx_destruct
{
}

@end
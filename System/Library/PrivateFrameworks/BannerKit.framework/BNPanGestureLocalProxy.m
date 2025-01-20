@interface BNPanGestureLocalProxy
- (BNPanGestureLocalProxy)initWithPanGestureRecognizer:(id)a3 containerView:(id)a4;
- (BNPanGestureProxyDelegate)delegate;
- (BOOL)didCrossDefaultThreshold;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (CGPoint)translationInCoordinateSpace:(id)a3;
- (CGPoint)velocityInCoordinateSpace:(id)a3;
- (CGPoint)visualTranslationInCoordinateSpace:(id)a3;
- (id)actionHandler;
- (int64_t)state;
- (void)_handlePan:(id)a3;
- (void)sendAction;
- (void)setActionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BNPanGestureLocalProxy

- (BNPanGestureLocalProxy)initWithPanGestureRecognizer:(id)a3 containerView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BNPanGestureLocalProxy;
  v8 = [(BNPanGestureLocalProxy *)&v12 init];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_panGesture, v6);
    [v6 addTarget:v9 action:sel__handlePan_];

    objc_storeWeak((id *)&v9->_containerView, v7);
  }

  return v9;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained gestureRecognizerProxy:self locationForTouch:0 inCoordinateSpace:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_panGesture);
    v11 = [v10 view];
    [v10 locationInView:v11];
    objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v4);
    double v7 = v12;
    double v9 = v13;
  }
  double v14 = v7;
  double v15 = v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained gestureRecognizerProxy:self translationInCoordinateSpace:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_panGesture);
    v11 = [v10 view];
    [v10 translationInView:v11];
    objc_msgSend(v11, "convertPoint:toCoordinateSpace:", v4);
    double v7 = v12;
    double v9 = v13;
  }
  double v14 = v7;
  double v15 = v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained gestureRecognizerProxy:self visualTranslationInCoordinateSpace:v5];
  }
  else {
    [(BNPanGestureLocalProxy *)self translationInCoordinateSpace:v5];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained gestureRecognizerProxy:self velocityInCoordinateSpace:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    p_panGesture = &self->_panGesture;
    id v11 = objc_loadWeakRetained((id *)p_panGesture);
    double v12 = [v11 view];
    id v13 = objc_loadWeakRetained((id *)p_panGesture);
    [v13 velocityInView:v12];
    objc_msgSend(v12, "convertPoint:toCoordinateSpace:", v4);
    double v7 = v14;
    double v9 = v15;
  }
  double v16 = v7;
  double v17 = v9;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)sendAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panGesture);
  [(BNPanGestureLocalProxy *)self _handlePan:WeakRetained];
}

- (void)_handlePan:(id)a3
{
  int64_t v4 = [a3 state];
  self->_state = v4;
  if (v4 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    [(BNPanGestureLocalProxy *)self visualTranslationInCoordinateSpace:WeakRetained];
    double v7 = v6;

    if (v7 > 40.0) {
      self->_didCrossDefaultThreshold = 1;
    }
  }
  id actionHandler = self->_actionHandler;
  if (actionHandler)
  {
    double v9 = (void (*)(void))*((void *)actionHandler + 2);
    v9();
  }
}

- (int64_t)state
{
  return self->_state;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)didCrossDefaultThreshold
{
  return self->_didCrossDefaultThreshold;
}

- (BNPanGestureProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNPanGestureProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_panGesture);
}

@end
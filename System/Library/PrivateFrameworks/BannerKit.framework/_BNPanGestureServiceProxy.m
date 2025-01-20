@interface _BNPanGestureServiceProxy
- (BNPanGestureProxyAction)_activePanGestureProxyAction;
- (BNPanGestureProxyDelegate)delegate;
- (BOOL)didCrossDefaultThreshold;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (CGPoint)translationInCoordinateSpace:(id)a3;
- (CGPoint)velocityInCoordinateSpace:(id)a3;
- (CGPoint)visualTranslationInCoordinateSpace:(id)a3;
- (id)actionHandler;
- (int64_t)state;
- (void)_setActivePanGestureProxyAction:(id)a3;
- (void)sendAction;
- (void)setActionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _BNPanGestureServiceProxy

- (int64_t)state
{
  return [(BNPanGestureProxyAction *)self->_activePanGestureProxyAction state];
}

- (BOOL)didCrossDefaultThreshold
{
  return [(BNPanGestureProxyAction *)self->_activePanGestureProxyAction didCrossDefaultThreshold];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxyAction *)self->_activePanGestureProxyAction locationInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxyAction *)self->_activePanGestureProxyAction translationInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxyAction *)self->_activePanGestureProxyAction visualTranslationInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  [(BNPanGestureProxyAction *)self->_activePanGestureProxyAction velocityInCoordinateSpace:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)sendAction
{
  double v3 = [(_BNPanGestureServiceProxy *)self actionHandler];
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, _BNPanGestureServiceProxy *))v3)[2](v3, self);
    double v3 = (void (**)(void, void))v4;
  }
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BNPanGestureProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNPanGestureProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BNPanGestureProxyAction)_activePanGestureProxyAction
{
  return self->_activePanGestureProxyAction;
}

- (void)_setActivePanGestureProxyAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePanGestureProxyAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
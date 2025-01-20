@interface PKHoverInteraction
- (PKHoverController)hoverController;
- (PKHoverInteraction)initWithDelegate:(id)a3;
- (PKHoverInteractionDelegate)delegate;
- (UIView)view;
- (void)didMoveToView:(id)a3;
- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5;
- (void)hoverControllerHoldGestureEnded:(id)a3;
- (void)setHoverController:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PKHoverInteraction

- (PKHoverInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKHoverInteraction;
  v5 = [(PKHoverInteraction *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)didMoveToView:(id)a3
{
  id v6 = a3;
  [(PKHoverInteraction *)self setView:v6];
  if (v6)
  {
    id v4 = (PKHoverController *)-[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], self, v6);
    hoverController = self->_hoverController;
    self->_hoverController = v4;
  }
  else
  {
    hoverController = self->_hoverController;
    self->_hoverController = 0;
  }
}

- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "hoverInteraction:didBeginHoverAndHoldAtLocation:elevation:", self, a4->var0.var0.x, a4->var0.var0.y, a4->var6);
  }
}

- (void)hoverControllerHoldGestureEnded:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 hoverInteractionDidEndHoverAndHold:self];
  }
}

- (PKHoverInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKHoverInteractionDelegate *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (PKHoverController)hoverController
{
  return self->_hoverController;
}

- (void)setHoverController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_destroyWeak((id *)&self->_view);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
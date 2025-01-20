@interface _SFBarHoverAssistant
+ (void)attachToBar:(id)a3 withAnimator:(id)a4 inContainerView:(id)a5;
- (BOOL)_gestureIsOverBar;
- (UIView)containerView;
- (_SFBarCommon)bar;
- (_SFBarHoverAssistant)initWithBar:(id)a3 withAnimator:(id)a4 inContainerView:(id)a5;
- (_SFDynamicBarAnimator)dynamicBarAnimator;
- (void)_hover:(id)a3;
- (void)dealloc;
- (void)dynamicBarAnimatorStateDidChange:(id)a3;
- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3;
@end

@implementation _SFBarHoverAssistant

- (_SFBarHoverAssistant)initWithBar:(id)a3 withAnimator:(id)a4 inContainerView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_SFBarHoverAssistant;
  v11 = [(_SFBarHoverAssistant *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_bar, v8);
    objc_storeWeak((id *)&v12->_dynamicBarAnimator, v9);
    [v9 addObserver:v12];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v12 action:sel__hover_];
    hoverRecognizer = v12->_hoverRecognizer;
    v12->_hoverRecognizer = (UIHoverGestureRecognizer *)v13;

    objc_storeWeak((id *)&v12->_containerView, v10);
    [v10 addGestureRecognizer:v12->_hoverRecognizer];
    v15 = v12;
  }

  return v12;
}

+ (void)attachToBar:(id)a3 withAnimator:(id)a4 inContainerView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  value = [[_SFBarHoverAssistant alloc] initWithBar:v9 withAnimator:v8 inContainerView:v7];

  objc_setAssociatedObject(v9, "hoverAssistant", value, (void *)1);
}

- (void)_hover:(id)a3
{
  if ((unint64_t)([a3 state] - 1) <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
    uint64_t v4 = [WeakRetained targetState];
    BOOL v5 = [(_SFBarHoverAssistant *)self _gestureIsOverBar];
    id v6 = objc_loadWeakRetained((id *)&self->_containerView);
    id v7 = [v6 window];
    id v8 = [v7 rootViewController];
    id v9 = [v8 presentedViewController];

    if (v4 || !v5)
    {
      if (v4 == 1)
      {
        BOOL v10 = !self->_didShowBarFromHover || v5;
        if (!v10 && !v9) {
          [WeakRetained attemptTransitionToState:0 animated:1];
        }
      }
    }
    else
    {
      [WeakRetained attemptTransitionToState:1 animated:1];
      self->_didShowBarFromHover = 1;
    }
  }
}

- (BOOL)_gestureIsOverBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  id v4 = objc_loadWeakRetained((id *)&self->_bar);
  [(UIHoverGestureRecognizer *)self->_hoverRecognizer locationInView:WeakRetained];
  double v6 = v5;
  [v4 bounds];
  objc_msgSend(WeakRetained, "convertRect:fromView:", v4);
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  double MinY = CGRectGetMinY(v15);
  [WeakRetained bounds];
  double v12 = CGRectGetHeight(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  if (MinY >= v12 - CGRectGetMaxY(v17))
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    BOOL v13 = v6 >= CGRectGetMinY(v19);
  }
  else
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    BOOL v13 = v6 <= CGRectGetMaxY(v18);
  }

  return v13;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  [WeakRetained removeGestureRecognizer:self->_hoverRecognizer];

  v4.receiver = self;
  v4.super_class = (Class)_SFBarHoverAssistant;
  [(_SFBarHoverAssistant *)&v4 dealloc];
}

- (void)dynamicBarAnimatorStateDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
  uint64_t v5 = [WeakRetained targetState];

  if (!v5) {
    self->_didShowBarFromHover = 0;
  }
}

- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);
  uint64_t v5 = [WeakRetained targetState];

  if (!v5) {
    self->_didShowBarFromHover = 0;
  }
}

- (_SFBarCommon)bar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);

  return (_SFBarCommon *)WeakRetained;
}

- (_SFDynamicBarAnimator)dynamicBarAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicBarAnimator);

  return (_SFDynamicBarAnimator *)WeakRetained;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_dynamicBarAnimator);
  objc_destroyWeak((id *)&self->_bar);

  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
}

@end
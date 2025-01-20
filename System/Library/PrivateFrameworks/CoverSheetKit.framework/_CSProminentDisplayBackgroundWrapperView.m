@interface _CSProminentDisplayBackgroundWrapperView
- (UIView)wrappedView;
- (void)_ensureWrappedViewIsAtIndexZero;
- (void)addSubview:(id)a3;
- (void)bringSubviewToFront:(id)a3;
- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4;
- (void)insertSubview:(id)a3 aboveSubview:(id)a4;
- (void)insertSubview:(id)a3 atIndex:(int64_t)a4;
- (void)insertSubview:(id)a3 belowSubview:(id)a4;
- (void)layoutSubviews;
- (void)sendSubviewToBack:(id)a3;
- (void)setWrappedView:(id)a3;
@end

@implementation _CSProminentDisplayBackgroundWrapperView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v4 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedView);
  [(_CSProminentDisplayBackgroundWrapperView *)self bounds];
  objc_msgSend(WeakRetained, "setFrame:");
}

- (void)setWrappedView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedView);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_wrappedView);
    [v6 removeFromSuperview];

    objc_storeWeak((id *)&self->_wrappedView, v4);
    v7.receiver = self;
    v7.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
    [(_CSProminentDisplayBackgroundWrapperView *)&v7 insertSubview:v4 atIndex:0];
    [(_CSProminentDisplayBackgroundWrapperView *)self setNeedsLayout];
  }
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v4 addSubview:a3];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)_ensureWrappedViewIsAtIndexZero
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 51);

    if (WeakRetained)
    {
      id v3 = objc_loadWeakRetained(a1 + 51);
      [a1 sendSubviewToBack:v3];
    }
  }
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v5 insertSubview:a3 atIndex:a4];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)exchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v5 exchangeSubviewAtIndex:a3 withSubviewAtIndex:a4];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v5 insertSubview:a3 belowSubview:a4];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v5 insertSubview:a3 aboveSubview:a4];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)bringSubviewToFront:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v4 bringSubviewToFront:a3];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (void)sendSubviewToBack:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_CSProminentDisplayBackgroundWrapperView;
  [(_CSProminentDisplayBackgroundWrapperView *)&v4 sendSubviewToBack:a3];
  -[_CSProminentDisplayBackgroundWrapperView _ensureWrappedViewIsAtIndexZero]((id *)&self->super.super.super.isa);
}

- (UIView)wrappedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wrappedView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
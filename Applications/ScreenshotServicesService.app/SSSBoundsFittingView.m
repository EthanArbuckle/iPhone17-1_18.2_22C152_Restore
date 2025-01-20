@interface SSSBoundsFittingView
- (UIView)managedView;
- (void)layoutSubviews;
- (void)setManagedView:(id)a3;
@end

@implementation SSSBoundsFittingView

- (void)setManagedView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managedView);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_managedView);
    [v5 removeFromSuperview];

    id v6 = objc_storeWeak((id *)&self->_managedView, obj);
    [(SSSBoundsFittingView *)self addSubview:obj];

    [(SSSBoundsFittingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SSSBoundsFittingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managedView);
  [WeakRetained setFrame:v4, v6, v8, v10];
}

- (UIView)managedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managedView);

  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
@interface HUDashboardNavigationTitleView
- (HUDashboardNavigationTitleView)initWithDelegate:(id)a3;
- (HUDashboardNavigationTitleViewDelegate)delegate;
- (double)previousLargeTitleHeight;
- (void)contentDidChange;
- (void)setDelegate:(id)a3;
- (void)setPreviousLargeTitleHeight:(double)a3;
@end

@implementation HUDashboardNavigationTitleView

- (HUDashboardNavigationTitleView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUDashboardNavigationTitleView;
  v5 = [(HUDashboardNavigationTitleView *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_previousLargeTitleHeight = 0.0;
  }

  return v6;
}

- (void)contentDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)HUDashboardNavigationTitleView;
  [(_UINavigationBarTitleView *)&v10 contentDidChange];
  [(_UINavigationBarTitleView *)self largeTitleHeight];
  double v4 = round(v3);
  [(_UINavigationBarTitleView *)self largeTitleHeightRange];
  double v6 = v5;
  [(_UINavigationBarTitleView *)self largeTitleHeightRange];
  double v8 = fmax(v6, fmin(v7, v4));
  if (self->_previousLargeTitleHeight != v8)
  {
    v9 = [(HUDashboardNavigationTitleView *)self delegate];
    [v9 largeTitleHeightDidChange:v8];
  }
  self->_previousLargeTitleHeight = v8;
}

- (HUDashboardNavigationTitleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUDashboardNavigationTitleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)previousLargeTitleHeight
{
  return self->_previousLargeTitleHeight;
}

- (void)setPreviousLargeTitleHeight:(double)a3
{
  self->_previousLargeTitleHeight = a3;
}

- (void).cxx_destruct
{
}

@end
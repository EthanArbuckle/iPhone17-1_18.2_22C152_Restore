@interface DRSessionView
- (DRFlockContainer)flockContainer;
- (DRSessionView)initWithFrame:(CGRect)a3;
- (DRSessionViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation DRSessionView

- (DRSessionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DRSessionView;
  v3 = -[DRSessionView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    flockContainer = v3->_flockContainer;
    v3->_flockContainer = (DRFlockContainer *)v4;

    [(DRSessionView *)v3 addSubview:v3->_flockContainer];
  }
  return v3;
}

- (DRFlockContainer)flockContainer
{
  return self->_flockContainer;
}

- (void)layoutSubviews
{
  id v3 = [(DRSessionView *)self delegate];
  [v3 sessionViewWillLayoutSubviews:self];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DRSessionView;
  -[DRSessionView hitTest:withEvent:](&v7, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (DRFlockContainer *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_flockContainer)
  {

    v5 = 0;
  }
  return v5;
}

- (DRSessionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRSessionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flockContainer, 0);
}

@end
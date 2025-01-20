@interface EKLayoutContainerView
- (EKLayoutContainerViewDelegate)delegate;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation EKLayoutContainerView

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)EKLayoutContainerView;
  [(EKLayoutContainerView *)&v6 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 layoutContainerView:self];
  }
}

- (EKLayoutContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKLayoutContainerViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
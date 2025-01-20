@interface MUImpressionsCalculatorConfiguration
- (MUImpressionsCalculatorConfiguration)initWithLogger:(id)a3 contentScrollView:(id)a4 containerViewProvider:(id)a5;
- (MUImpressionsLogger)logger;
- (UIScrollView)scrollView;
- (UIView)hostingContainerView;
@end

@implementation MUImpressionsCalculatorConfiguration

- (MUImpressionsCalculatorConfiguration)initWithLogger:(id)a3 contentScrollView:(id)a4 containerViewProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MUImpressionsCalculatorConfiguration;
  v12 = [(MUImpressionsCalculatorConfiguration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_logger, a3);
    objc_storeWeak((id *)&v13->_scrollView, v10);
    v14 = _Block_copy(v11);
    id containerViewProvider = v13->_containerViewProvider;
    v13->_id containerViewProvider = v14;
  }
  return v13;
}

- (UIView)hostingContainerView
{
  p_cachedContainerView = &self->_cachedContainerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedContainerView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_cachedContainerView);
  }
  else
  {
    v6 = (*((void (**)(void))self->_containerViewProvider + 2))();
    if (v6)
    {
      id v7 = objc_storeWeak((id *)p_cachedContainerView, v6);
      v5 = v6;
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)&self->_scrollView);
      v5 = [v8 superview];
    }
  }
  return (UIView *)v5;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (MUImpressionsLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_cachedContainerView);
  objc_storeStrong(&self->_containerViewProvider, 0);
}

@end
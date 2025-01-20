@interface CSPageViewBase
- (CSPageViewControllerProtocol)pageViewController;
- (double)contentWidth;
- (void)setContentWidth:(double)a3;
- (void)setPageViewController:(id)a3;
@end

@implementation CSPageViewBase

- (CSPageViewControllerProtocol)pageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageViewController);

  return (CSPageViewControllerProtocol *)WeakRetained;
}

- (void)setPageViewController:(id)a3
{
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (void)setContentWidth:(double)a3
{
  self->_contentWidth = a3;
}

- (void).cxx_destruct
{
}

@end
@interface CKNavigationItem
- (UIScrollView)contentScrollView;
- (void)setContentScrollView:(id)a3;
@end

@implementation CKNavigationItem

- (UIScrollView)contentScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setContentScrollView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface QLNavigationState
- (BOOL)navigationBarHidden;
- (BOOL)toolBarHidden;
- (BOOL)translucentNavigationBar;
- (BOOL)translucentToolbar;
- (UINavigationController)navigationController;
- (void)setNavigationBarHidden:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setToolBarHidden:(BOOL)a3;
- (void)setTranslucentNavigationBar:(BOOL)a3;
- (void)setTranslucentToolbar:(BOOL)a3;
@end

@implementation QLNavigationState

- (BOOL)navigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (BOOL)toolBarHidden
{
  return self->_toolBarHidden;
}

- (void)setToolBarHidden:(BOOL)a3
{
  self->_toolBarHidden = a3;
}

- (BOOL)translucentNavigationBar
{
  return self->_translucentNavigationBar;
}

- (void)setTranslucentNavigationBar:(BOOL)a3
{
  self->_translucentNavigationBar = a3;
}

- (BOOL)translucentToolbar
{
  return self->_translucentToolbar;
}

- (void)setTranslucentToolbar:(BOOL)a3
{
  self->_translucentToolbar = a3;
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
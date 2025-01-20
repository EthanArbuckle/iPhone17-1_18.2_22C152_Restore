@interface IKAppTabBar
- (IKAppTabBar)initWithTabBarController:(id)a3;
- (IKAppTabBarController)controller;
- (IKJSTabBar)jsTabBar;
- (void)onSelect;
- (void)setJsTabBar:(id)a3;
@end

@implementation IKAppTabBar

- (IKAppTabBar)initWithTabBarController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKAppTabBar;
  v5 = [(IKAppTabBar *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

- (void)onSelect
{
  id v2 = [(IKAppTabBar *)self jsTabBar];
  [v2 onSelect];
}

- (IKAppTabBarController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (IKAppTabBarController *)WeakRetained;
}

- (IKJSTabBar)jsTabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsTabBar);
  return (IKJSTabBar *)WeakRetained;
}

- (void)setJsTabBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_jsTabBar);
  objc_destroyWeak((id *)&self->_controller);
}

@end
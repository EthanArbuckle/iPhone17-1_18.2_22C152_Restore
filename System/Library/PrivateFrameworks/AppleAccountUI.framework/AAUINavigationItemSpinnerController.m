@interface AAUINavigationItemSpinnerController
- (AAUINavigationItemSpinnerController)initWithNavigationItem:(id)a3 hideBackButton:(BOOL)a4;
- (UINavigationItem)navigationItem;
- (void)setNavigationItem:(id)a3;
- (void)startSpinning;
- (void)stopSpinning;
@end

@implementation AAUINavigationItemSpinnerController

- (AAUINavigationItemSpinnerController)initWithNavigationItem:(id)a3 hideBackButton:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUINavigationItemSpinnerController;
  v8 = [(AAUINavigationItemSpinnerController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_navigationItem, a3);
    v9->_shouldHideBackButton = a4;
  }

  return v9;
}

- (void)startSpinning
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = [(UINavigationItem *)self->_navigationItem rightBarButtonItems];
  rightBarItems = self->_rightBarItems;
  self->_rightBarItems = v3;

  v5 = [(UINavigationItem *)self->_navigationItem leftBarButtonItems];
  leftBarItems = self->_leftBarItems;
  self->_leftBarItems = v5;

  if (self->_shouldHideBackButton) {
    self->_hidesBackButton = [(UINavigationItem *)self->_navigationItem hidesBackButton];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v7 setHidesWhenStopped:1];
  [v7 startAnimating];
  v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v7];
  navigationItem = self->_navigationItem;
  v11[0] = v8;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [(UINavigationItem *)navigationItem setRightBarButtonItems:v10 animated:1];

  if (self->_shouldHideBackButton) {
    [(UINavigationItem *)self->_navigationItem setHidesBackButton:1 animated:1];
  }
}

- (void)stopSpinning
{
  [(UINavigationItem *)self->_navigationItem setLeftBarButtonItems:self->_leftBarItems animated:1];
  [(UINavigationItem *)self->_navigationItem setRightBarButtonItems:self->_rightBarItems animated:1];
  if (self->_shouldHideBackButton)
  {
    navigationItem = self->_navigationItem;
    BOOL hidesBackButton = self->_hidesBackButton;
    [(UINavigationItem *)navigationItem setHidesBackButton:hidesBackButton animated:1];
  }
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (void)setNavigationItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBarItems, 0);
  objc_storeStrong((id *)&self->_leftBarItems, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
}

@end
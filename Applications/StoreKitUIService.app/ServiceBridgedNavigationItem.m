@interface ServiceBridgedNavigationItem
+ (id)itemFromItem:(id)a3;
- (ServiceBridgedNavigationItemProxy)proxyHandler;
- (id)rightBarButtonItem;
- (void)setBackButtonTitle:(id)a3;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setProxyHandler:(id)a3;
- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4;
- (void)setTitle:(id)a3;
@end

@implementation ServiceBridgedNavigationItem

+ (id)itemFromItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v3)
  {
    v5 = [v3 backButtonTitle];
    [v4 setBackButtonTitle:v5];

    [v4 setHidesBackButton:[v3 hidesBackButton]];
    v6 = [v3 leftBarButtonItems];
    [v4 setLeftBarButtonItems:v6];

    [v4 setLeftItemsSupplementBackButton:[v3 leftItemsSupplementBackButton]];
    v7 = [v3 prompt];
    [v4 setPrompt:v7];

    v8 = [v3 rightBarButtonItems];
    [v4 setRightBarButtonItems:v8];

    v9 = [v3 title];
    [v4 setTitle:v9];

    v10 = [v3 titleView];
    [v4 setTitleView:v10];
  }

  return v4;
}

- (id)rightBarButtonItem
{
  v7.receiver = self;
  v7.super_class = (Class)ServiceBridgedNavigationItem;
  id v3 = [(ServiceBridgedNavigationItem *)&v7 rightBarButtonItem];
  id v4 = +[ServiceBridgedBarButtonItem itemFromItem:v3];

  v5 = [(ServiceBridgedNavigationItem *)self proxyHandler];
  [v4 setProxyHandler:v5];

  return v4;
}

- (void)setBackButtonTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceBridgedNavigationItem;
  [(ServiceBridgedNavigationItem *)&v5 setBackButtonTitle:a3];
  id v4 = [(ServiceBridgedNavigationItem *)self proxyHandler];
  [v4 navigationItemUpdated];
}

- (void)setHidesBackButton:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceBridgedNavigationItem;
  [(ServiceBridgedNavigationItem *)&v5 setHidesBackButton:a3];
  id v4 = [(ServiceBridgedNavigationItem *)self proxyHandler];
  [v4 navigationItemUpdated];
}

- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ServiceBridgedNavigationItem;
  [(ServiceBridgedNavigationItem *)&v6 setRightBarButtonItem:a3 animated:a4];
  objc_super v5 = [(ServiceBridgedNavigationItem *)self proxyHandler];
  [v5 navigationItemUpdated];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceBridgedNavigationItem;
  [(ServiceBridgedNavigationItem *)&v5 setTitle:a3];
  id v4 = [(ServiceBridgedNavigationItem *)self proxyHandler];
  [v4 navigationItemUpdated];
}

- (ServiceBridgedNavigationItemProxy)proxyHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyHandler);

  return (ServiceBridgedNavigationItemProxy *)WeakRetained;
}

- (void)setProxyHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
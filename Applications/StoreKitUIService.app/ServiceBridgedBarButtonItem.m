@interface ServiceBridgedBarButtonItem
+ (id)itemFromItem:(id)a3;
- (BOOL)isEnabled;
- (SEL)action;
- (ServiceBridgedNavigationItemProxy)proxyHandler;
- (id)target;
- (id)title;
- (void)setAction:(SEL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setProxyHandler:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ServiceBridgedBarButtonItem

+ (id)itemFromItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

- (SEL)action
{
  return [(UIBarButtonItem *)self->_underlyingBarButtonItem action];
}

- (BOOL)isEnabled
{
  return [(UIBarButtonItem *)self->_underlyingBarButtonItem isEnabled];
}

- (id)target
{
  return [(UIBarButtonItem *)self->_underlyingBarButtonItem target];
}

- (id)title
{
  return [(UIBarButtonItem *)self->_underlyingBarButtonItem title];
}

- (void)setAction:(SEL)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  [(UIBarButtonItem *)self->_underlyingBarButtonItem setEnabled:a3];
  id v4 = [(ServiceBridgedBarButtonItem *)self proxyHandler];
  [v4 navigationItemUpdated];
}

- (void)setTarget:(id)a3
{
}

- (void)setTitle:(id)a3
{
  [(UIBarButtonItem *)self->_underlyingBarButtonItem setTitle:a3];
  id v4 = [(ServiceBridgedBarButtonItem *)self proxyHandler];
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
  objc_destroyWeak((id *)&self->_proxyHandler);

  objc_storeStrong((id *)&self->_underlyingBarButtonItem, 0);
}

@end
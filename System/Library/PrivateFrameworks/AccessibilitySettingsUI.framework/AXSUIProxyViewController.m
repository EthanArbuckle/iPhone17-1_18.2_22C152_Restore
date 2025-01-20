@interface AXSUIProxyViewController
- (AXSUIProxyViewController)init;
- (UIViewController)wrapped;
- (id)makeController;
- (void)setWrapped:(id)a3;
@end

@implementation AXSUIProxyViewController

- (AXSUIProxyViewController)init
{
  v3 = [(AXSUIProxyViewController *)self makeController];

  return v3;
}

- (id)makeController
{
  return 0;
}

- (UIViewController)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
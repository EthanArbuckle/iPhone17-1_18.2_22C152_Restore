@interface WrappedAMSUIWebViewController
- (id)dismissBlock;
- (void)setDismissBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation WrappedAMSUIWebViewController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(WrappedAMSUIWebViewController *)self isBeingDismissed] & 1) != 0
    || [(WrappedAMSUIWebViewController *)self isMovingFromParentViewController])
  {
    v5 = [(WrappedAMSUIWebViewController *)self dismissBlock];

    if (v5)
    {
      v6 = [(WrappedAMSUIWebViewController *)self dismissBlock];
      v6[2]();
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)WrappedAMSUIWebViewController;
  [(WrappedAMSUIWebViewController *)&v7 viewDidDisappear:v3];
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
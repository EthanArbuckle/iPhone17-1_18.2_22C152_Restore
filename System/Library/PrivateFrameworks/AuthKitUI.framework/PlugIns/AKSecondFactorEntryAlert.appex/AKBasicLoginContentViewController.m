@interface AKBasicLoginContentViewController
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation AKBasicLoginContentViewController

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginContentViewController;
  [(AKBasicLoginContentViewController *)&v4 loadView];
  v3 = -[AKBasicLoginContentViewControllerContainerView initWithFrame:]([AKBasicLoginContentViewControllerContainerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(AKBasicLoginContentViewController *)self setView:v3];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AKBasicLoginContentViewController;
  [(AKBasicLoginContentViewController *)&v4 viewWillLayoutSubviews];
  v3 = [(AKBasicLoginContentViewController *)self view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", UILayoutFittingExpandedSize.width, UILayoutFittingExpandedSize.height);
  -[AKBasicLoginContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

@end
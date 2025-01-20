@interface GKMessageComposeViewController
- (GKMessageComposeViewControllerDelegate)gkComposeDelegate;
- (void)setGkComposeDelegate:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation GKMessageComposeViewController

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKMessageComposeViewController;
  [(GKMessageComposeViewController *)&v5 viewDidDisappear:a3];
  v4 = [(GKMessageComposeViewController *)self gkComposeDelegate];
  [v4 didEndDisplaying];
}

- (GKMessageComposeViewControllerDelegate)gkComposeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gkComposeDelegate);

  return (GKMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setGkComposeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
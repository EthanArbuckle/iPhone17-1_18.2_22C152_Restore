@interface MediaControlsPanelViewController
+ (id)panelViewControllerForCoverSheet;
- (MPAVRoutingViewController)routingViewController;
- (UIView)backgroundView;
- (id)delegate;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRoutingViewController:(id)a3;
@end

@implementation MediaControlsPanelViewController

+ (id)panelViewControllerForCoverSheet
{
  return +[MRPlatterViewController coverSheetPlatterViewController];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MPAVRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);

  objc_destroyWeak(&self->_delegate);
}

@end
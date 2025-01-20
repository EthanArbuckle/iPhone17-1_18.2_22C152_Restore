@interface AMUIPosterEditingSwitcherViewController
- (AMUIPosterEditingSwitcherViewController)initWithActiveConfiguration:(id)a3 transitionOverlayView:(id)a4;
- (AMUIPosterEditingSwitcherViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (UIView)transitionOverlayView;
- (void)handleDismiss;
- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation AMUIPosterEditingSwitcherViewController

- (AMUIPosterEditingSwitcherViewController)initWithActiveConfiguration:(id)a3 transitionOverlayView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterEditingSwitcherViewController;
  v9 = [(AMUIPosterEditingSwitcherViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activeConfiguration, a3);
    objc_storeStrong((id *)&v10->_transitionOverlayView, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterEditingSwitcherViewController;
  [(AMUIPosterEditingSwitcherViewController *)&v12 viewDidLoad];
  v3 = [(AMUIPosterEditingSwitcherViewController *)self transitionOverlayView];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 layer];
    uint64_t RenderId = CALayerGetRenderId();
  }
  else
  {
    uint64_t RenderId = 0;
  }
  id v7 = [v4 window];
  uint64_t v8 = [v7 _contextId];

  v9 = (void *)[objc_alloc(MEMORY[0x263F5F3C8]) initWithActiveConfiguration:self->_activeConfiguration transitionOverlayRenderId:RenderId transitionOverlayContextId:v8];
  v10 = (PRUISModalRemoteViewController *)[objc_alloc(MEMORY[0x263F5F3E8]) initWithEntryPoint:v9];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v10;

  [(PRUISModalRemoteViewController *)self->_remoteViewController setModalInPresentation:0];
  [(PRUISModalRemoteViewController *)self->_remoteViewController setDelegate:self];
  [(AMUIPosterEditingSwitcherViewController *)self bs_addChildViewController:self->_remoteViewController];
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)handleDismiss
{
}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  id v5 = [(AMUIPosterEditingSwitcherViewController *)self delegate];
  [v5 posterEditingSwitcherViewControllerRequestsDismissal:self];
}

- (AMUIPosterEditingSwitcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIPosterEditingSwitcherViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)transitionOverlayView
{
  return self->_transitionOverlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionOverlayView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end
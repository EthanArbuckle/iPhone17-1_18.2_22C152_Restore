@interface BPSSetupMiniFlowController
- (BOOL)isDisplayingInSkippedMiniFlow;
- (BPSBuddyControllerDelegate)delegate;
- (id)navigationController;
- (id)viewController;
- (void)pushController:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setIsDisplayingInSkippedMiniFlow:(BOOL)a3;
@end

@implementation BPSSetupMiniFlowController

- (id)viewController
{
  return 0;
}

- (id)navigationController
{
  v2 = [(BPSSetupMiniFlowController *)self viewController];
  v3 = [v2 navigationController];

  return v3;
}

- (void)pushController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BPSSetupMiniFlowController *)self navigationController];
  [v7 pushViewController:v6 animated:v4];
}

- (BPSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BPSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDisplayingInSkippedMiniFlow
{
  return self->_isDisplayingInSkippedMiniFlow;
}

- (void)setIsDisplayingInSkippedMiniFlow:(BOOL)a3
{
  self->_isDisplayingInSkippedMiniFlow = a3;
}

- (void).cxx_destruct
{
}

@end
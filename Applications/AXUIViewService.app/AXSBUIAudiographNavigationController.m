@interface AXSBUIAudiographNavigationController
- (AXSBUIAudiographDismissDelegate)dismissDelegate;
- (BOOL)accessibilityPerformEscape;
- (void)setDismissDelegate:(id)a3;
@end

@implementation AXSBUIAudiographNavigationController

- (BOOL)accessibilityPerformEscape
{
  v2 = [(AXSBUIAudiographNavigationController *)self dismissDelegate];
  [v2 dismiss];

  return 1;
}

- (AXSBUIAudiographDismissDelegate)dismissDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissDelegate);

  return (AXSBUIAudiographDismissDelegate *)WeakRetained;
}

- (void)setDismissDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
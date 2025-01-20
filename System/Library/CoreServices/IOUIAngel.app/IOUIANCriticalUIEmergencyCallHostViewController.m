@interface IOUIANCriticalUIEmergencyCallHostViewController
- (BOOL)_canShowWhileLocked;
- (IOUIANCriticalUIEmergencyCallHostViewControllerDelegate)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismiss;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation IOUIANCriticalUIEmergencyCallHostViewController

- (void)dismiss
{
  v3 = [(IOUIANCriticalUIEmergencyCallHostViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(IOUIANCriticalUIEmergencyCallHostViewController *)self delegate];
    [v5 emergencyCallHostViewControllerDidRequestDismiss:self];
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v7 = a3;
  char v4 = [(IOUIANCriticalUIEmergencyCallHostViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(IOUIANCriticalUIEmergencyCallHostViewController *)self delegate];
    [v6 emergencyCallHostViewControllerDidTerminate:self withError:v7];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (IOUIANCriticalUIEmergencyCallHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IOUIANCriticalUIEmergencyCallHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
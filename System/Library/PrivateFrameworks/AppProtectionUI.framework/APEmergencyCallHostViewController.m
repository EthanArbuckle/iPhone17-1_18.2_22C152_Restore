@interface APEmergencyCallHostViewController
- (APEmergencyCallHostViewControllerDelegate)delegate;
- (void)dismiss;
- (void)setDelegate:(id)a3;
@end

@implementation APEmergencyCallHostViewController

- (void)dismiss
{
  [(APEmergencyCallHostViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v3 = [(APEmergencyCallHostViewController *)self delegate];
  [v3 emergencyCallHostViewControllerDidDismiss:self];
}

- (APEmergencyCallHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APEmergencyCallHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
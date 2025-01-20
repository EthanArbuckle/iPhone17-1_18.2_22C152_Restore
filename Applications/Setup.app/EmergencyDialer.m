@interface EmergencyDialer
- (EmergencyDialerDelegate)delegate;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismiss;
- (void)setDelegate:(id)a3;
@end

@implementation EmergencyDialer

- (void)dismiss
{
  -[EmergencyDialer dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a2);
  v2 = [(EmergencyDialer *)self delegate];
  [(EmergencyDialerDelegate *)v2 dialerDidDismiss:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [(UIDevice *)v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (EmergencyDialerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EmergencyDialerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
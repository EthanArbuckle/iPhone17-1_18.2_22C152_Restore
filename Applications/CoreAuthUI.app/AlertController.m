@interface AlertController
- (void)_holdPresentingViewController;
- (void)_releasePresentingViewController;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AlertController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AlertController;
  [(AlertController *)&v4 viewDidAppear:a3];
  [(AlertController *)self _holdPresentingViewController];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AlertController;
  [(AlertController *)&v4 viewDidDisappear:a3];
  [(AlertController *)self _releasePresentingViewController];
}

- (void)_holdPresentingViewController
{
  v3 = [(AlertController *)self presentingViewController];
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v3;

  v5 = LACLogAlertUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_presentingViewController;
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Holding %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_releasePresentingViewController
{
  v3 = LACLogAlertUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    presentingViewController = self->_presentingViewController;
    int v6 = 138543362;
    int v7 = presentingViewController;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Released %{public}@", (uint8_t *)&v6, 0xCu);
  }

  v5 = self->_presentingViewController;
  self->_presentingViewController = 0;
}

- (void).cxx_destruct
{
}

@end
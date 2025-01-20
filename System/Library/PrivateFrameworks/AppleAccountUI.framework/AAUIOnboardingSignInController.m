@interface AAUIOnboardingSignInController
- (AAUIOnboardingSignInController)initWithSetupSignInConfig:(id)a3;
- (AAUIOnboardingSignInControllerDelegate)delegate;
- (AAUIServiceSignInConfiguration)signInConfiguration;
- (AAUIServiceSignInController)serviceController;
- (void)dealloc;
- (void)serviceSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)serviceSignInController:(id)a3 didSkipWithReason:(int64_t)a4;
- (void)serviceSignInControllerDidCancel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setSignInConfiguration:(id)a3;
- (void)start;
@end

@implementation AAUIOnboardingSignInController

- (AAUIOnboardingSignInController)initWithSetupSignInConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIOnboardingSignInController;
  v5 = [(AAUIOnboardingSignInController *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 signInConfiguration];
    signInConfiguration = v5->_signInConfiguration;
    v5->_signInConfiguration = (AAUIServiceSignInConfiguration *)v6;

    v8 = [[AAUIServiceSignInController alloc] initWithSignInConfiguration:v5->_signInConfiguration];
    serviceController = v5->_serviceController;
    v5->_serviceController = v8;
  }
  return v5;
}

- (void)start
{
  [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setServiceDelegate:self];
  serviceController = self->_serviceController;
  [(AAUIServiceSignInController *)serviceController loadViewControllerForPresentation];
}

- (void)serviceSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v8 = [(AAUIOnboardingSignInController *)self delegate];
  v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController completing with results: %@", (uint8_t *)&v10, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v8 onboardingSignInController:v6 didCompleteWithOperationsResults:v7];
  }
}

- (void)serviceSignInControllerDidCancel:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v5 = [(AAUIOnboardingSignInController *)self delegate];
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController did cancel", v7, 2u);
  }

  if (objc_opt_respondsToSelector()) {
    [v5 onboardingSignInControllerDidCancel:v4];
  }
}

- (void)serviceSignInController:(id)a3 didSkipWithReason:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = [(AAUIOnboardingSignInController *)self delegate];
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a4;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController did skip with reason %ld", (uint8_t *)&v9, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v7 onboardingSignInController:v6 didSkipWithReason:a4];
  }
}

- (void)dealloc
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "AAUIOnboardingSignInController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUIOnboardingSignInController;
  [(AAUIOnboardingSignInController *)&v4 dealloc];
}

- (AAUIOnboardingSignInControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIOnboardingSignInControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AAUIServiceSignInConfiguration)signInConfiguration
{
  return self->_signInConfiguration;
}

- (void)setSignInConfiguration:(id)a3
{
}

- (AAUIServiceSignInController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_signInConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface AAUIOnboardingSplitSignInDelegate
- (AAUIOnboardingSplitSignInDelegate)initWithServiceSignInController:(id)a3;
- (void)_handleAIDAResultErrorInSignInController:(id)a3;
- (void)onboardingSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)onboardingSignInController:(id)a3 didSkipWithReason:(int64_t)a4;
- (void)onboardingSignInControllerDidCancel:(id)a3;
@end

@implementation AAUIOnboardingSplitSignInDelegate

- (AAUIOnboardingSplitSignInDelegate)initWithServiceSignInController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIOnboardingSplitSignInDelegate;
  v6 = [(AAUIOnboardingSplitSignInDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originatingServiceSignInController, a3);
  }

  return v7;
}

- (void)onboardingSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F26D28];
  objc_super v9 = [v7 objectForKey:*MEMORY[0x263F26D28]];

  if (v9)
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v7 objectForKey:v8];
      int v31 = 138412290;
      v32 = v11;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Split onboarding sign in for service cloud returned %@", (uint8_t *)&v31, 0xCu);
    }
    v12 = [v7 objectForKey:v8];
    v13 = [v12 error];

    if (!v13)
    {
      objc_storeStrong((id *)&self->_semiFinalResults, a4);
      v14 = [[AAUIAppleIDSignInConfigSplitAccountStore alloc] initWithNavController:v6];
      v15 = [[AAUIOnboardingSignInController alloc] initWithSetupSignInConfig:v14];
      storeSignInController = self->_storeSignInController;
      self->_storeSignInController = v15;

      [(AAUIOnboardingSignInController *)self->_storeSignInController setDelegate:self];
      v17 = [(AAUIServiceSignInController *)self->_originatingServiceSignInController authenticationController];
      v18 = [(AAUIOnboardingSignInController *)self->_storeSignInController serviceController];
      v19 = [v18 signInViewController];
      [v19 setAuthenticationController:v17];

      v20 = [(AAUIServiceSignInController *)self->_originatingServiceSignInController serviceOwnersManager];
      v21 = [(AAUIOnboardingSignInController *)self->_storeSignInController serviceController];
      [v21 setServiceOwnersManager:v20];

      [(AAUIOnboardingSignInController *)self->_storeSignInController start];
LABEL_12:

      goto LABEL_13;
    }
LABEL_8:
    [(AAUIOnboardingSplitSignInDelegate *)self _handleAIDAResultErrorInSignInController:v6];
    goto LABEL_13;
  }
  uint64_t v22 = *MEMORY[0x263F26D48];
  v23 = [v7 objectForKey:*MEMORY[0x263F26D48]];

  if (v23)
  {
    v24 = [v7 objectForKey:v22];
    v25 = [v24 error];

    if (!v25)
    {
      v26 = _AAUILogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v7 objectForKey:v8];
        int v31 = 138412290;
        v32 = v27;
        _os_log_impl(&dword_209754000, v26, OS_LOG_TYPE_DEFAULT, "Split onboarding sign in for service store returned %@", (uint8_t *)&v31, 0xCu);
      }
      v14 = (AAUIAppleIDSignInConfigSplitAccountStore *)[(NSDictionary *)self->_semiFinalResults mutableCopy];
      v28 = [v7 objectForKey:v22];
      [(AAUIAppleIDSignInConfigSplitAccountStore *)v14 setObject:v28 forKey:v22];

      originatingServiceSignInController = self->_originatingServiceSignInController;
      v30 = (void *)[(AAUIAppleIDSignInConfigSplitAccountStore *)v14 copy];
      [(AAUIServiceSignInController *)originatingServiceSignInController controllerFinishedWithAIDAResults:v30];

      goto LABEL_12;
    }
    goto LABEL_8;
  }
LABEL_13:
}

- (void)_handleAIDAResultErrorInSignInController:(id)a3
{
  id v5 = a3;
  v3 = [v5 topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (void)onboardingSignInControllerDidCancel:(id)a3
{
  id v4 = [(AAUIServiceSignInController *)self->_originatingServiceSignInController signInViewController];
  id v6 = [v4 delegate];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AAUIServiceSignInController *)self->_originatingServiceSignInController signInViewController];
    [v6 signInViewControllerDidCancel:v5];
  }
}

- (void)onboardingSignInController:(id)a3 didSkipWithReason:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    int64_t v15 = a4;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Split onboarding sign in skipped with reason reason %ld", (uint8_t *)&v14, 0xCu);
  }

  if (self->_storeSignInController)
  {
    id v7 = objc_alloc(MEMORY[0x263F26D80]);
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25710] code:-8014 userInfo:0];
    uint64_t v9 = *MEMORY[0x263F26D48];
    v10 = (void *)[v7 initWithSuccess:0 error:v8 type:*MEMORY[0x263F26D48]];

    v11 = (void *)[(NSDictionary *)self->_semiFinalResults mutableCopy];
    [v11 setObject:v10 forKey:v9];
    originatingServiceSignInController = self->_originatingServiceSignInController;
    v13 = (void *)[v11 copy];
    [(AAUIServiceSignInController *)originatingServiceSignInController controllerFinishedWithAIDAResults:v13];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeSignInController, 0);
  objc_storeStrong((id *)&self->_semiFinalResults, 0);
  objc_storeStrong((id *)&self->_originatingServiceSignInController, 0);
}

@end
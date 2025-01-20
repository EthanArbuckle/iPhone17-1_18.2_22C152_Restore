@interface AISDGameCenterSignInHelper
- (AISDGameCenterSignInHelper)initWithAuthenticationResults:(id)a3;
- (NSDictionary)authenticationResults;
- (void)signInWithCompletionHandler:(id)a3;
@end

@implementation AISDGameCenterSignInHelper

- (AISDGameCenterSignInHelper)initWithAuthenticationResults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AISDGameCenterSignInHelper;
  v6 = [(AISDGameCenterSignInHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authenticationResults, a3);
  }

  return v7;
}

- (void)signInWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, void, void *))a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[AISDGameCenterSignInHelper signInWithCompletionHandler:]();
  }
  v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AppleIDSetupDaemon.GameCenterSignInHelper" code:2 userInfo:0];
  v3[2](v3, 0, v4);
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void).cxx_destruct
{
}

- (void)signInWithCompletionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2481C8000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AISDGameCenterSignInHelper: Not expected to be called for non-tvOS platform", v0, 2u);
}

@end
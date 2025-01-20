@interface SharedCredentialController
- (id)error;
- (id)passwordCredential;
- (id)presentationAnchorForAuthorizationController:(id)a3;
- (int)result;
- (void)_requestCredential;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)dealloc;
@end

@implementation SharedCredentialController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_passwordCredential, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  if (loadUIKit_onceToken != -1) {
    dispatch_once(&loadUIKit_onceToken, &__block_literal_global_93);
  }
  v3 = [ (id) kUIApplicationClass sharedApplication];
  v4 = [v3 keyWindow];

  return v4;
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  v5 = (NSError *)a4;
  v6 = secLogObjForScope("swcagent");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEBUG, "SWC received didCompleteWithError", v10, 2u);
  }

  passwordCredential = self->_passwordCredential;
  self->_passwordCredential = 0;

  error = self->_error;
  self->_error = v5;
  v9 = v5;

  self->_result = -25300;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5 = a4;
  v6 = secLogObjForScope("swcagent");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEBUG, "SWC received didCompleteWithAuthorization", v12, 2u);
  }

  v7 = [v5 credential];

  if (loadAuthenticationServices_onceToken != -1) {
    dispatch_once(&loadAuthenticationServices_onceToken, &__block_literal_global_10172);
  }
  id v8 = (id) kASPasswordCredentialClass;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = v7;
    int v10 = 0;
  }
  else
  {
    v9 = 0;
    int v10 = -25300;
  }
  passwordCredential = self->_passwordCredential;
  self->_passwordCredential = v9;

  self->_result = v10;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (int)result
{
  return self->_result;
}

- (id)error
{
  return self->_error;
}

- (id)passwordCredential
{
  passwordCredential = self->_passwordCredential;
  if (!passwordCredential)
  {
    [(SharedCredentialController *)self _requestCredential];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    passwordCredential = self->_passwordCredential;
  }
  v4 = passwordCredential;

  return v4;
}

- (void)_requestCredential
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!self->_provider)
  {
    if (loadAuthenticationServices_onceToken != -1) {
      dispatch_once(&loadAuthenticationServices_onceToken, &__block_literal_global_10172);
    }
    v3 = (ASAuthorizationPasswordProvider *)objc_alloc_init((Class) (id) kASAuthorizationPasswordProviderClass);
    provider = self->_provider;
    self->_provider = v3;
  }
  controller = self->_controller;
  if (!controller)
  {
    if (loadAuthenticationServices_onceToken != -1) {
      dispatch_once(&loadAuthenticationServices_onceToken, &__block_literal_global_10172);
    }
    id v6 = objc_alloc((Class) (id) kASAuthorizationControllerClass);
    v7 = [(ASAuthorizationPasswordProvider *)self->_provider createRequest];
    v14[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v9 = (ASAuthorizationController *)[v6 initWithAuthorizationRequests:v8];
    int v10 = self->_controller;
    self->_controller = v9;

    controller = self->_controller;
  }
  [(ASAuthorizationController *)controller setDelegate:self];
  [(ASAuthorizationController *)self->_controller setPresentationContextProvider:self];
  v11 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v11;

  self->_result = -25300;
  error = self->_error;
  self->_error = 0;

  [(ASAuthorizationController *)self->_controller performRequests];
}

- (void)dealloc
{
  [(ASAuthorizationController *)self->_controller setDelegate:0];
  [(ASAuthorizationController *)self->_controller setPresentationContextProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SharedCredentialController;
  [(SharedCredentialController *)&v3 dealloc];
}

@end
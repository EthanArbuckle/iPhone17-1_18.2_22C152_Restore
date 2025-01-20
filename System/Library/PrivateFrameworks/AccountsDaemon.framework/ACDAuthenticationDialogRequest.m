@interface ACDAuthenticationDialogRequest
- (ACAccount)account;
- (BOOL)confirmationRequired;
- (NSString)authDelegateClassBundlePath;
- (NSString)authDelegateClassName;
- (NSURL)url;
- (id)completion;
- (void)setAccount:(id)a3;
- (void)setAuthDelegateClassBundlePath:(id)a3;
- (void)setAuthDelegateClassName:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setConfirmationRequired:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation ACDAuthenticationDialogRequest

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)confirmationRequired
{
  return self->_confirmationRequired;
}

- (void)setConfirmationRequired:(BOOL)a3
{
  self->_confirmationRequired = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)authDelegateClassName
{
  return self->_authDelegateClassName;
}

- (void)setAuthDelegateClassName:(id)a3
{
}

- (NSString)authDelegateClassBundlePath
{
  return self->_authDelegateClassBundlePath;
}

- (void)setAuthDelegateClassBundlePath:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_authDelegateClassBundlePath, 0);
  objc_storeStrong((id *)&self->_authDelegateClassName, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end
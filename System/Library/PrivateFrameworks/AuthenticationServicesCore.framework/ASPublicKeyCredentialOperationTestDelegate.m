@interface ASPublicKeyCredentialOperationTestDelegate
- (BOOL)isCABLEAuthenticatorRequest;
- (id)didCompletionRegistrationCallback;
- (void)didCompleteRegistrationWithCredential:(id)a3 error:(id)a4;
- (void)setDidCompletionRegistrationCallback:(id)a3;
@end

@implementation ASPublicKeyCredentialOperationTestDelegate

- (void)didCompleteRegistrationWithCredential:(id)a3 error:(id)a4
{
  didCompletionRegistrationCallback = (void (**)(id, id, id))self->_didCompletionRegistrationCallback;
  if (didCompletionRegistrationCallback)
  {
    didCompletionRegistrationCallback[2](didCompletionRegistrationCallback, a3, a4);
    didCompletionRegistrationCallback = (void (**)(id, id, id))self->_didCompletionRegistrationCallback;
  }
  self->_didCompletionRegistrationCallback = 0;
}

- (BOOL)isCABLEAuthenticatorRequest
{
  return 0;
}

- (id)didCompletionRegistrationCallback
{
  return self->_didCompletionRegistrationCallback;
}

- (void)setDidCompletionRegistrationCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
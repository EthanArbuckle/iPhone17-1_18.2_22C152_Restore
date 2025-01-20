@interface PBAAuthenticationPolicy
- (BOOL)allowAuthenticationRevocation;
- (BOOL)shouldClearBlockStateOnSync;
- (BOOL)usesSecureMode;
- (PBAAuthenticationPolicyDelegate)delegate;
- (void)passcodeAuthenticationFailedWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)wipeDeviceWithReason:(id)a3;
@end

@implementation PBAAuthenticationPolicy

- (BOOL)allowAuthenticationRevocation
{
  return 1;
}

- (BOOL)shouldClearBlockStateOnSync
{
  return 0;
}

- (BOOL)usesSecureMode
{
  return 0;
}

- (void)wipeDeviceWithReason:(id)a3
{
  id v3 = a3;
  id v4 = +[SBFObliterationController sharedInstance];
  [v4 obliterateDataPartitionShowingProgress:0 skipDataObliteration:0 eraseDataPlan:0 reason:v3];
}

- (void)passcodeAuthenticationFailedWithError:(id)a3
{
  id v7 = a3;
  id v4 = [v7 domain];
  unsigned int v5 = [v4 isEqualToString:SBFMKBErrorDomain];

  if (v5 && [v7 code] == (id)-14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained authenticationPolicyEncounteredPolicyError:self];
  }
}

- (PBAAuthenticationPolicyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PBAAuthenticationPolicyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
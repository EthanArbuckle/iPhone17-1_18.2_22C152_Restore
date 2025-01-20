@interface CTXPCPINOperationCompletedRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCPINOperationCompletedRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v6 SIMUnlockProcedureDidComplete];
  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (int)requiredEntitlement
{
  return 3;
}

@end
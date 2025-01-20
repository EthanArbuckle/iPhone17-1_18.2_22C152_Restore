@interface CTXPCCanRunActivationCodeProvisioningRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCCanRunActivationCodeProvisioningRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__CTXPCCanRunActivationCodeProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262D28;
  id v8 = v5;
  id v6 = v5;
  [a3 canRunActivationCodeProvisioningWithCompletion:v7];
}

void __92__CTXPCCanRunActivationCodeProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [[CTXPCCanRunActivationCodeProvisioningResponse alloc] initWithTitle:v10 message:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 32;
}

@end
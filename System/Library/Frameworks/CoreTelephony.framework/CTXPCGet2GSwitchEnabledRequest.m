@interface CTXPCGet2GSwitchEnabledRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGet2GSwitchEnabledRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CTXPCGet2GSwitchEnabledRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262E68;
  id v8 = v5;
  id v6 = v5;
  [a3 get2GSwitchEnabled:v7];
}

void __78__CTXPCGet2GSwitchEnabledRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    id v5 = 0;
  }
  else {
    id v5 = [[CTXPCGet2GSwitchEnabledResponse alloc] initWithIsEnabled:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

@end
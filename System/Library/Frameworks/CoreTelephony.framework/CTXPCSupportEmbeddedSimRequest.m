@interface CTXPCSupportEmbeddedSimRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSupportEmbeddedSimRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CTXPCSupportEmbeddedSimRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262CB0;
  id v8 = v5;
  id v6 = v5;
  [a3 supportsEmbeddedSIMWithCompletion:v7];
}

void __78__CTXPCSupportEmbeddedSimRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [CTXPCSimCommonNumberResultResponse alloc];
  id v5 = [NSNumber numberWithBool:a2];
  id v6 = [(CTXPCSimCommonNumberResultResponse *)v4 initWithResult:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 26;
}

@end
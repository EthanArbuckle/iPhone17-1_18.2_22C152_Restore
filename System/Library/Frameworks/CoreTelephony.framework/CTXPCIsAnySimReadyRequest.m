@interface CTXPCIsAnySimReadyRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCIsAnySimReadyRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CTXPCIsAnySimReadyRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262E68;
  id v8 = v5;
  id v6 = v5;
  [a3 isAnySimReadyWithCompletion:v7];
}

void __73__CTXPCIsAnySimReadyRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [CTXPCSimCommonNumberResultResponse alloc];
  id v6 = [NSNumber numberWithBool:a2];
  v7 = [(CTXPCSimCommonNumberResultResponse *)v5 initWithResult:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 1;
}

@end
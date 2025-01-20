@interface CTXPCSimTrayStatusRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSimTrayStatusRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__CTXPCSimTrayStatusRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262DA0;
  id v8 = v5;
  id v6 = v5;
  [a3 getSIMTrayStatus:v7];
}

void __73__CTXPCSimTrayStatusRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = [[CTXPCSimCommonResultResponse alloc] initWithResult:v7];
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

@end
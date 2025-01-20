@interface CTXPCShouldShoweSIMTravelTipRequest
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCShouldShoweSIMTravelTipRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__CTXPCShouldShoweSIMTravelTipRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E5262CB0;
  id v8 = v5;
  id v6 = v5;
  [a3 shouldShoweSIMTravelTipWithCompletion:v7];
}

void __83__CTXPCShouldShoweSIMTravelTipRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[CTXPCBooleanResponseMessage alloc] initWithResult:a2];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (int)requiredEntitlement
{
  return 25;
}

@end
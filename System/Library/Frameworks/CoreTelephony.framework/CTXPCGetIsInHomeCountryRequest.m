@interface CTXPCGetIsInHomeCountryRequest
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetIsInHomeCountryRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CTXPCGetIsInHomeCountryRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262E68;
  id v9 = v7;
  id v11 = v9;
  [v6 copyIsInHomeCountry:v8 completion:v10];
}

void __78__CTXPCGetIsInHomeCountryRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    v5 = 0;
  }
  else {
    v5 = [[CTXPCGetIsInHomeCountryResponse alloc] initWithIsHome:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
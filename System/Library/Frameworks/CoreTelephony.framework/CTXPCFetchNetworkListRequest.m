@interface CTXPCFetchNetworkListRequest
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCFetchNetworkListRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CTXPCFetchNetworkListRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v9 = v7;
  id v11 = v9;
  [v6 fetchNetworkList:v8 completion:v10];
}

uint64_t __76__CTXPCFetchNetworkListRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
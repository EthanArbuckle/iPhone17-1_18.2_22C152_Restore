@interface CTXPCGetVoiceLinkQualityMetricRequest
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetVoiceLinkQualityMetricRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CTXPCGetVoiceLinkQualityMetricRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E52656F8;
  id v9 = v7;
  id v11 = v9;
  [v6 getVoiceLinkQualityMetric:v8 completion:v10];
}

void __85__CTXPCGetVoiceLinkQualityMetricRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = 0;
  if (v7 && !v5) {
    id v6 = [[CTXPCGetVoiceLinkQualityMetricResponse alloc] initWithVoiceLinkQualityMetric:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
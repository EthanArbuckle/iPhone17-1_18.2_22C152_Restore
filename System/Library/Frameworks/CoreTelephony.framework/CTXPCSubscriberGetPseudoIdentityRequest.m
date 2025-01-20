@interface CTXPCSubscriberGetPseudoIdentityRequest
- (CTXPCSubscriberGetPseudoIdentityRequest)initWithContext:(id)a3 service:(id)a4;
- (NSString)service;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSubscriberGetPseudoIdentityRequest

- (CTXPCSubscriberGetPseudoIdentityRequest)initWithContext:(id)a3 service:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"service";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSubscriberGetPseudoIdentityRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCSubscriberGetPseudoIdentityRequest *)self service];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__CTXPCSubscriberGetPseudoIdentityRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262DA0;
  id v10 = v7;
  id v12 = v10;
  [v6 context:v8 getPseudoIdentityFor:v9 completion:v11];
}

void __87__CTXPCSubscriberGetPseudoIdentityRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (NSString)service
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"service"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 5;
}

@end
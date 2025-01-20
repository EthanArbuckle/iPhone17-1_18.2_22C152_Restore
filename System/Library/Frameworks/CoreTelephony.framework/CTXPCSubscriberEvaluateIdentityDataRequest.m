@interface CTXPCSubscriberEvaluateIdentityDataRequest
+ (id)allowedClassesForArguments;
- (CTXPCSubscriberEvaluateIdentityDataRequest)initWithContext:(id)a3 identityData:(id)a4;
- (NSData)identity;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSubscriberEvaluateIdentityDataRequest

- (CTXPCSubscriberEvaluateIdentityDataRequest)initWithContext:(id)a3 identityData:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"identity";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSubscriberEvaluateIdentityDataRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCSubscriberEvaluateIdentityDataRequest *)self identity];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__CTXPCSubscriberEvaluateIdentityDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 evaluateMobileSubscriberIdentity:v8 identity:v9 completion:v11];
}

uint64_t __90__CTXPCSubscriberEvaluateIdentityDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSData)identity
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"identity"];
  v4 = CTThrowingCastIfClass<NSData>(v3);

  return (NSData *)v4;
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSubscriberEvaluateIdentityDataRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
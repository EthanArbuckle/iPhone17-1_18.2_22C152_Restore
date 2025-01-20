@interface CTXPCGetRemotePlanSignupInfoRequest
+ (id)allowedClassesForArguments;
- (CTXPCGetRemotePlanSignupInfoRequest)initWithContext:(id)a3 userConsent:(int64_t)a4;
- (int)requiredEntitlement;
- (int64_t)userConsent;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetRemotePlanSignupInfoRequest

- (CTXPCGetRemotePlanSignupInfoRequest)initWithContext:(id)a3 userConsent:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12 = @"userConsent";
  v7 = [NSNumber numberWithInteger:a4];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetRemotePlanSignupInfoRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  int64_t v9 = [(CTXPCGetRemotePlanSignupInfoRequest *)self userConsent];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__CTXPCGetRemotePlanSignupInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262EE0;
  id v10 = v7;
  id v12 = v10;
  [v6 remotePlanSignupInfoFor:v8 userConsent:v9 completion:v11];
}

void __83__CTXPCGetRemotePlanSignupInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [[CTXPCWebsheetInfoResponse alloc] initWithURL:v11 postdata:v7];
  (*(void (**)(uint64_t, CTXPCWebsheetInfoResponse *, id))(v9 + 16))(v9, v10, v8);
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetRemotePlanSignupInfoRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (int64_t)userConsent
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"userConsent"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  int64_t v5 = [v4 integerValue];

  return v5;
}

@end
@interface CTXPCSetMaxDataRateRequest
+ (id)allowedClassesForArguments;
- (CTXPCSetMaxDataRateRequest)initWithContext:(id)a3 rate:(int64_t)a4;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSetMaxDataRateRequest

- (CTXPCSetMaxDataRateRequest)initWithContext:(id)a3 rate:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12 = @"maxDataRate";
  v7 = [NSNumber numberWithInteger:a4];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSetMaxDataRateRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCMessage *)self namedArguments];
  v9 = [v8 objectForKey:@"maxDataRate"];
  v10 = CTThrowingCastIfClass<NSNumber>(v9);
  uint64_t v11 = [v10 integerValue];

  v12 = [(CTXPCSubscriptionContextRequest *)self context];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CTXPCSetMaxDataRateRequest_performRequestWithHandler_completionHandler___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v13 = v7;
  id v15 = v13;
  [v6 setMaxDataRate:v12 rate:v11 completion:v14];
}

uint64_t __74__CTXPCSetMaxDataRateRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 18;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetMaxDataRateRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
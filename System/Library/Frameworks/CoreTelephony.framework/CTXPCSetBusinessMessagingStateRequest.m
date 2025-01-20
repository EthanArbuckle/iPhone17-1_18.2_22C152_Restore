@interface CTXPCSetBusinessMessagingStateRequest
+ (id)allowedClassesForArguments;
- (BOOL)shouldEnable;
- (CTXPCSetBusinessMessagingStateRequest)initWithContext:(id)a3 shouldEnable:(BOOL)a4;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSetBusinessMessagingStateRequest

- (CTXPCSetBusinessMessagingStateRequest)initWithContext:(id)a3 shouldEnable:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12 = @"shouldEnable";
  v7 = [NSNumber numberWithBool:v4];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSetBusinessMessagingStateRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (BOOL)shouldEnable
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"shouldEnable"];
  BOOL v4 = CTThrowingCastIfClass<NSNumber>(v3);

  LOBYTE(v2) = [v4 BOOLValue];
  return (char)v2;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CTXPCSetBusinessMessagingStateRequest *)self shouldEnable])
  {
    v8 = [(CTXPCSubscriptionContextRequest *)self context];
    v9 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__CTXPCSetBusinessMessagingStateRequest_performRequestWithHandler_completionHandler___block_invoke;
    v11[3] = &unk_1E5260CB8;
    v11[4] = v7;
    [v6 enableBusinessMessaging:v8 completion:v11];
  }
  else
  {
    v8 = [(CTXPCSubscriptionContextRequest *)self context];
    v9 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__CTXPCSetBusinessMessagingStateRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v10[3] = &unk_1E5260CB8;
    v10[4] = v7;
    [v6 disableBusinessMessaging:v8 completion:v10];
  }
}

uint64_t __85__CTXPCSetBusinessMessagingStateRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__CTXPCSetBusinessMessagingStateRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetBusinessMessagingStateRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (int)requiredEntitlement
{
  if ([(CTXPCSetBusinessMessagingStateRequest *)self shouldEnable]) {
    return 18;
  }
  else {
    return 19;
  }
}

@end
@interface CTXPCSelectNetworkRequest
+ (id)allowedClassesForArguments;
- (CTXPCSelectNetworkRequest)initWithContext:(id)a3 network:(id)a4;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSelectNetworkRequest

- (CTXPCSelectNetworkRequest)initWithContext:(id)a3 network:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, @"network", 0);
  v10.receiver = self;
  v10.super_class = (Class)CTXPCSelectNetworkRequest;
  v8 = [(CTXPCSubscriptionContextRequest *)&v10 initWithContext:v6 namedArguments:v7];

  return v8;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCMessage *)self namedArguments];
  id v9 = [v8 objectForKey:@"network"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [(CTXPCSubscriptionContextRequest *)self context];
  if (v10)
  {
    v12 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v13[3] = &unk_1E5260CB8;
    v13[4] = v7;
    [v6 selectNetwork:v11 network:v10 completion:v13];
  }
  else
  {
    v12 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke;
    v14[3] = &unk_1E5260CB8;
    v14[4] = v7;
    [v6 automaticallySelectNetwork:v11 completion:v14];
  }
}

uint64_t __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSelectNetworkRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
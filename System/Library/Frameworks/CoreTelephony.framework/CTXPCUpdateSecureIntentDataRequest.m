@interface CTXPCUpdateSecureIntentDataRequest
+ (id)allowedClassesForArguments;
- (CTXPCUpdateSecureIntentDataRequest)initWithData:(id)a3;
- (id)data;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCUpdateSecureIntentDataRequest

- (CTXPCUpdateSecureIntentDataRequest)initWithData:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = @"data";
    v12[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9.receiver = self;
    v9.super_class = (Class)CTXPCUpdateSecureIntentDataRequest;
    v7 = [(CTXPCMessage *)&v9 initWithNamedArguments:v6];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CTXPCUpdateSecureIntentDataRequest;
    v7 = [(CTXPCRequestMessage *)&v10 init];
  }

  return v7;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCUpdateSecureIntentDataRequest *)self data];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__CTXPCUpdateSecureIntentDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v9 = v7;
  id v11 = v9;
  [v6 updateSecureIntentData:v8 completion:v10];
}

uint64_t __82__CTXPCUpdateSecureIntentDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCUpdateSecureIntentDataRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)data
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKeyedSubscript:@"data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end
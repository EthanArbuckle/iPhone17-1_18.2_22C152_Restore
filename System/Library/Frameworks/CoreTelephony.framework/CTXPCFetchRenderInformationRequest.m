@interface CTXPCFetchRenderInformationRequest
+ (id)allowedClassesForArguments;
- (CTLazuliDestination)destination;
- (CTLazuliOperationID)operationID;
- (CTXPCFetchRenderInformationRequest)initWithContext:(id)a3 destination:(id)a4;
- (CTXPCFetchRenderInformationRequest)initWithContext:(id)a3 destination:(id)a4 operationID:(id)a5;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCFetchRenderInformationRequest

- (CTXPCFetchRenderInformationRequest)initWithContext:(id)a3 destination:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"destination";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCFetchRenderInformationRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (CTXPCFetchRenderInformationRequest)initWithContext:(id)a3 destination:(id)a4 operationID:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = @"destination";
  v15[1] = @"operationID";
  v16[0] = v9;
  v16[1] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCFetchRenderInformationRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (CTLazuliDestination)destination
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"destination"];
  v4 = CTThrowingCastIfClass<CTLazuliDestination>(v3);

  return (CTLazuliDestination *)v4;
}

- (CTLazuliOperationID)operationID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"operationID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTLazuliOperationID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCSubscriptionContextRequest *)self context];
  id v9 = [(CTXPCFetchRenderInformationRequest *)self destination];
  id v10 = [(CTXPCFetchRenderInformationRequest *)self operationID];
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke;
    v14[3] = &unk_1E5260CB8;
    objc_super v11 = &v15;
    id v15 = v7;
    [v6 fetchRenderInformation:v8 forChatBot:v9 withOperationID:v10 completion:v14];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5260CB8;
    objc_super v11 = &v13;
    id v13 = v7;
    [v6 fetchChatBotRenderInformation:v8 forDestination:v9 completion:v12];
  }
}

uint64_t __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCFetchRenderInformationRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
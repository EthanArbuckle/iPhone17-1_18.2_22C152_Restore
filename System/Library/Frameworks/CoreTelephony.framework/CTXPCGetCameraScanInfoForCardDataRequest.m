@interface CTXPCGetCameraScanInfoForCardDataRequest
+ (id)allowedClassesForArguments;
- (CTXPCGetCameraScanInfoForCardDataRequest)initWithCardData:(id)a3;
- (id)cardData;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetCameraScanInfoForCardDataRequest

- (CTXPCGetCameraScanInfoForCardDataRequest)initWithCardData:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"cardData"];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetCameraScanInfoForCardDataRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCGetCameraScanInfoForCardDataRequest *)self cardData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__CTXPCGetCameraScanInfoForCardDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262D00;
  id v9 = v7;
  id v11 = v9;
  [v6 getCameraScanInfoForCardData:v8 completionHandler:v10];
}

void __88__CTXPCGetCameraScanInfoForCardDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [[CTXPCGetCameraScanInfoForCardDataResponse alloc] initWithAction:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetCameraScanInfoForCardDataRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)cardData
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"cardData"];
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
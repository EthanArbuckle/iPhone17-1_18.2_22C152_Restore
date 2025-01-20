@interface CTXPCWebsheetInfoForPlanRequest
+ (id)allowedClassesForArguments;
- (CTXPCWebsheetInfoForPlanRequest)initWithPlan:(id)a3;
- (id)plan;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCWebsheetInfoForPlanRequest

- (CTXPCWebsheetInfoForPlanRequest)initWithPlan:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"plan";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCWebsheetInfoForPlanRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCWebsheetInfoForPlanRequest *)self plan];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __79__CTXPCWebsheetInfoForPlanRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262E40;
  id v9 = v7;
  id v11 = v9;
  [v6 websheetInfoForPlan:v8 completion:v10];
}

void __79__CTXPCWebsheetInfoForPlanRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = [[CTXPCWebsheetInfoResponse alloc] initWithURLString:v14 postdata:v9 type:v10];
  (*(void (**)(uint64_t, CTXPCWebsheetInfoResponse *, id))(v12 + 16))(v12, v13, v11);
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCWebsheetInfoForPlanRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)plan
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"plan"];
  id v4 = CTThrowingCastIfClass<CTPlan>(v3);

  return v4;
}

@end
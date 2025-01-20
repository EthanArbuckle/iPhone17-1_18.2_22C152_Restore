@interface CTXPCUserDidExitWebsheetFlowForPlanRequest
+ (id)allowedClassesForArguments;
- (CTXPCUserDidExitWebsheetFlowForPlanRequest)initWithPlan:(id)a3;
- (id)plan;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCUserDidExitWebsheetFlowForPlanRequest

- (CTXPCUserDidExitWebsheetFlowForPlanRequest)initWithPlan:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"plan";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCUserDidExitWebsheetFlowForPlanRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCUserDidExitWebsheetFlowForPlanRequest *)self plan];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __90__CTXPCUserDidExitWebsheetFlowForPlanRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v9 = v7;
  id v11 = v9;
  [v6 userDidExitWebsheetFlowForPlan:v8 completion:v10];
}

uint64_t __90__CTXPCUserDidExitWebsheetFlowForPlanRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCUserDidExitWebsheetFlowForPlanRequest;
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
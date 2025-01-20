@interface CTXPCStartPendingPlanInstallFlowRequest
+ (id)allowedClassesForArguments;
- (CTXPCStartPendingPlanInstallFlowRequest)initWithPlan:(id)a3 carrierName:(id)a4;
- (id)carrierName;
- (id)plan;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCStartPendingPlanInstallFlowRequest

- (CTXPCStartPendingPlanInstallFlowRequest)initWithPlan:(id)a3 carrierName:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"plan";
  v12[1] = @"carrier";
  v13[0] = v6;
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCStartPendingPlanInstallFlowRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCStartPendingPlanInstallFlowRequest *)self plan];
  v9 = [(CTXPCStartPendingPlanInstallFlowRequest *)self carrierName];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__CTXPCStartPendingPlanInstallFlowRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262CD8;
  id v10 = v7;
  id v12 = v10;
  [v6 startPendingPlanInstallationForPlan:v8 carrierName:v9 completionHandler:v11];
}

void __87__CTXPCStartPendingPlanInstallFlowRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [[CTXPCTriggerPendingPlanInstallFlowResponse alloc] initWithResult:a2];
  (*(void (**)(uint64_t, CTXPCTriggerPendingPlanInstallFlowResponse *, id))(v5 + 16))(v5, v6, v7);
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCStartPendingPlanInstallFlowRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)plan
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"plan"];
  v4 = CTThrowingCastIfClass<CTPlan>(v3);

  return v4;
}

- (id)carrierName
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"carrier"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
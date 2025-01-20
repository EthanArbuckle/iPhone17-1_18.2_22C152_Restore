@interface CTXPCPrepareCrossPlatformCellularPlanLabelRequest
+ (id)allowedClassesForArguments;
- (CTXPCPrepareCrossPlatformCellularPlanLabelRequest)initWithPlanLabels:(id)a3;
- (id)planLabels;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCPrepareCrossPlatformCellularPlanLabelRequest

- (CTXPCPrepareCrossPlatformCellularPlanLabelRequest)initWithPlanLabels:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"planLabels";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCPrepareCrossPlatformCellularPlanLabelRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCPrepareCrossPlatformCellularPlanLabelRequest *)self planLabels];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __97__CTXPCPrepareCrossPlatformCellularPlanLabelRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262F30;
  id v9 = v7;
  id v11 = v9;
  [v6 prepareCrossPlatformCellularPlanLabel:v8 completion:v10];
}

void __97__CTXPCPrepareCrossPlatformCellularPlanLabelRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [[CTXPCSubscriptionInfoMessage alloc] initWithInfo:v8];
  (*(void (**)(uint64_t, CTXPCSubscriptionInfoMessage *, id))(v6 + 16))(v6, v7, v5);
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCPrepareCrossPlatformCellularPlanLabelRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)planLabels
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"planLabels"];
  id v4 = CTThrowingCastIfClass<NSArray<CTCellularPlanCrossPlatformLabel *>>(v3);

  return v4;
}

@end
@interface CTXPCAddPlanWithProvisioningRequest
+ (id)allowedClassesForArguments;
- (CTXPCAddPlanWithProvisioningRequest)initWithRequest:(id)a3 appName:(id)a4 appType:(unint64_t)a5;
- (id)appName;
- (id)request;
- (int)requiredEntitlement;
- (unint64_t)appType;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCAddPlanWithProvisioningRequest

- (CTXPCAddPlanWithProvisioningRequest)initWithRequest:(id)a3 appName:(id)a4 appType:(unint64_t)a5
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v15[0] = @"request";
  v15[1] = @"appName";
  v16[0] = v8;
  v16[1] = v9;
  v15[2] = @"appType";
  v10 = [NSNumber numberWithUnsignedInteger:a5];
  v16[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCAddPlanWithProvisioningRequest;
  v12 = [(CTXPCMessage *)&v14 initWithNamedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCAddPlanWithProvisioningRequest *)self request];
  id v9 = [(CTXPCAddPlanWithProvisioningRequest *)self appName];
  unint64_t v10 = [(CTXPCAddPlanWithProvisioningRequest *)self appType];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__CTXPCAddPlanWithProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5262CD8;
  id v11 = v7;
  id v13 = v11;
  [v6 addPlanWith:v8 appName:v9 appType:v10 completionHandler:v12];
}

void __83__CTXPCAddPlanWithProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  v5 = [[CTXPCAddPlanWithProvisioningResponse alloc] initWithResult:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 26;
}

+ (id)allowedClassesForArguments
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCAddPlanWithProvisioningRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)request
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"request"];
  v4 = CTThrowingCastIfClass<CTCellularPlanProvisioningRequest>(v3);

  return v4;
}

- (id)appName
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"appName"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

- (unint64_t)appType
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"appType"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

@end
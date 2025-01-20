@interface CTXPCCancelTransferPlanRequest
+ (id)allowedClassesForArguments;
- (BOOL)keepCache;
- (CTXPCCancelTransferPlanRequest)initWithPlan:(id)a3 fromDevice:(id)a4 keepCache:(BOOL)a5;
- (id)deviceIdentifier;
- (id)plan;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCCancelTransferPlanRequest

- (CTXPCCancelTransferPlanRequest)initWithPlan:(id)a3 fromDevice:(id)a4 keepCache:(BOOL)a5
{
  BOOL v5 = a5;
  v16[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v15[0] = @"plan";
  v15[1] = @"deviceID";
  v16[0] = v8;
  v16[1] = v9;
  v15[2] = @"keepCache";
  v10 = [NSNumber numberWithBool:v5];
  v16[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCCancelTransferPlanRequest;
  v12 = [(CTXPCMessage *)&v14 initWithNamedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCCancelTransferPlanRequest *)self plan];
  id v9 = [(CTXPCCancelTransferPlanRequest *)self deviceIdentifier];
  BOOL v10 = [(CTXPCCancelTransferPlanRequest *)self keepCache];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__CTXPCCancelTransferPlanRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v11 = v7;
  id v13 = v11;
  [v6 cancelCellularPlanTransfer:v8 fromDevice:v9 keepCache:v10 completionHandler:v12];
}

uint64_t __78__CTXPCCancelTransferPlanRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCCancelTransferPlanRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)plan
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"plan"];
  v4 = CTThrowingCastIfClass<CTPlan>(v3);

  return v4;
}

- (id)deviceIdentifier
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"deviceID"];
  v4 = CTThrowingCastIfClass<CTDeviceIdentifier>(v3);

  return v4;
}

- (BOOL)keepCache
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"keepCache"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

@end
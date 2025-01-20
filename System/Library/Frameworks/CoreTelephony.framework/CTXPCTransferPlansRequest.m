@interface CTXPCTransferPlansRequest
+ (id)allowedClassesForArguments;
- (CTXPCTransferPlansRequest)initWithPlans:(id)a3 fromDevice:(id)a4;
- (id)deviceIdentifier;
- (id)plans;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCTransferPlansRequest

- (CTXPCTransferPlansRequest)initWithPlans:(id)a3 fromDevice:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"plans";
  v12[1] = @"deviceID";
  v13[0] = v6;
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCTransferPlansRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCTransferPlansRequest *)self plans];
  v9 = [(CTXPCTransferPlansRequest *)self deviceIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CTXPCTransferPlansRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262D78;
  id v10 = v7;
  id v12 = v10;
  [v6 transferCellularPlans:v8 fromDevice:v9 completionHandler:v11];
}

uint64_t __73__CTXPCTransferPlansRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCTransferPlansRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)plans
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"plans"];
  v4 = CTThrowingCastIfClass<CTPlanList>(v3);

  return v4;
}

- (id)deviceIdentifier
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"deviceID"];
  v4 = CTThrowingCastIfClass<CTDeviceIdentifier>(v3);

  return v4;
}

@end
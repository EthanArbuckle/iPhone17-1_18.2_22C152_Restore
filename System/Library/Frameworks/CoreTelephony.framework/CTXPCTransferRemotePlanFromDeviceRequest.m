@interface CTXPCTransferRemotePlanFromDeviceRequest
+ (id)allowedClassesForArguments;
- (CTXPCTransferRemotePlanFromDeviceRequest)initWithPlanID:(id)a3 fromDevice:(id)a4;
- (id)deviceIdentifier;
- (id)planID;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCTransferRemotePlanFromDeviceRequest

- (CTXPCTransferRemotePlanFromDeviceRequest)initWithPlanID:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 setObject:v6 forKeyedSubscript:@"planID"];
  [v8 setObject:v7 forKeyedSubscript:@"deviceID"];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCTransferRemotePlanFromDeviceRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCTransferRemotePlanFromDeviceRequest *)self planID];
  v9 = [(CTXPCTransferRemotePlanFromDeviceRequest *)self deviceIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__CTXPCTransferRemotePlanFromDeviceRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262E68;
  id v10 = v7;
  id v12 = v10;
  [v6 transferRemotePlan:v8 fromDevice:v9 completion:v11];
}

void __88__CTXPCTransferRemotePlanFromDeviceRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [[CTXPCBooleanResponseMessage alloc] initWithResult:a2];
  (*(void (**)(uint64_t, CTXPCBooleanResponseMessage *, id))(v5 + 16))(v5, v6, v7);
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCTransferRemotePlanFromDeviceRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)planID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"planID"];
  v4 = CTThrowingCastIfClass<CTRemotePlanIdentifier>(v3);

  return v4;
}

- (id)deviceIdentifier
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKeyedSubscript:@"deviceID"];
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
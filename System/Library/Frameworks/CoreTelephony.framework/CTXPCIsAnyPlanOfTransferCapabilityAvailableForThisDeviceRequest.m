@interface CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest
+ (id)allowedClassesForArguments;
- (CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest)initWithCapability:(unint64_t)a3;
- (int)requiredEntitlement;
- (unint64_t)capability;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest

- (CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest)initWithCapability:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"capability";
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest *)self capability];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __111__CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262E68;
  id v9 = v7;
  id v11 = v9;
  [v6 isAnyPlanOfTransferCapability:v8 availableForThisDeviceWithCompletion:v10];
}

void __111__CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCIsAnyPlanOfTransferCapabilityAvailableForThisDeviceRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (unint64_t)capability
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"capability"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

@end
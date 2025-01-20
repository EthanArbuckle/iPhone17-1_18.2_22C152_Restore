@interface CTXPCActivateProximityTransferRequest
+ (id)allowedClassesForArguments;
- (CTXPCActivateProximityTransferRequest)initWithEndpoint:(unint64_t)a3;
- (int)requiredEntitlement;
- (unint64_t)endpoint;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCActivateProximityTransferRequest

- (CTXPCActivateProximityTransferRequest)initWithEndpoint:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"endpoint";
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCActivateProximityTransferRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CTXPCActivateProximityTransferRequest *)self endpoint];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __85__CTXPCActivateProximityTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v9 = v7;
  id v11 = v9;
  [v6 activateProximityTransfer:v8 completion:v10];
}

uint64_t __85__CTXPCActivateProximityTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCActivateProximityTransferRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (unint64_t)endpoint
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"endpoint"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

@end
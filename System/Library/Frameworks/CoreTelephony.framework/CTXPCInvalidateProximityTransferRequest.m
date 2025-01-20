@interface CTXPCInvalidateProximityTransferRequest
+ (id)allowedClassesForArguments;
- (BOOL)force;
- (CTXPCInvalidateProximityTransferRequest)initWithEndpoint:(unint64_t)a3 force:(BOOL)a4;
- (int)requiredEntitlement;
- (unint64_t)endpoint;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCInvalidateProximityTransferRequest

- (CTXPCInvalidateProximityTransferRequest)initWithEndpoint:(unint64_t)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"endpoint";
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  v12[1] = @"force";
  v13[0] = v6;
  v7 = [NSNumber numberWithBool:v4];
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCInvalidateProximityTransferRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CTXPCInvalidateProximityTransferRequest *)self endpoint];
  BOOL v9 = [(CTXPCInvalidateProximityTransferRequest *)self force];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__CTXPCInvalidateProximityTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 invalidateProximityTransfer:v8 force:v9 completion:v11];
}

uint64_t __87__CTXPCInvalidateProximityTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCInvalidateProximityTransferRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (unint64_t)endpoint
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"endpoint"];
  BOOL v4 = CTThrowingCastIfClass<NSNumber>(v3);
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (BOOL)force
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"force"];
  BOOL v4 = CTThrowingCastIfClass<NSNumber>(v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

@end
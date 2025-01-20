@interface CTXPCValidateProximityTransferRequest
+ (id)allowedClassesForArguments;
- (CTXPCValidateProximityTransferRequest)initWithEndpoint:(unint64_t)a3 pin:(id)a4;
- (id)pin;
- (int)requiredEntitlement;
- (unint64_t)endpoint;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCValidateProximityTransferRequest

- (CTXPCValidateProximityTransferRequest)initWithEndpoint:(unint64_t)a3 pin:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v12[0] = @"endpoint";
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v12[1] = @"pin";
  v13[0] = v7;
  v13[1] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCValidateProximityTransferRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CTXPCValidateProximityTransferRequest *)self endpoint];
  v9 = [(CTXPCValidateProximityTransferRequest *)self pin];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__CTXPCValidateProximityTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 validateProximityTransfer:v8 pin:v9 completion:v11];
}

uint64_t __85__CTXPCValidateProximityTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCValidateProximityTransferRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (unint64_t)endpoint
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"endpoint"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (id)pin
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"pin"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
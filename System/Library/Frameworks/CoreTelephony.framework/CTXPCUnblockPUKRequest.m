@interface CTXPCUnblockPUKRequest
- (CTXPCUnblockPUKRequest)initWithContext:(id)a3 puk:(id)a4 pin:(id)a5;
- (NSString)pin;
- (NSString)puk;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCUnblockPUKRequest

- (CTXPCUnblockPUKRequest)initWithContext:(id)a3 puk:(id)a4 pin:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = @"updated-pin";
  v15[1] = @"puk";
  v16[0] = v10;
  v16[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCUnblockPUKRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCSubscriptionContextRequest *)self context];
  id v9 = [(CTXPCUnblockPUKRequest *)self puk];
  id v10 = [(CTXPCUnblockPUKRequest *)self pin];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CTXPCUnblockPUKRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v11 = v7;
  id v13 = v11;
  [v6 unlockPUK:v8 puk:v9 newPin:v10 completion:v12];
}

- (NSString)puk
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"puk"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (NSString)pin
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"updated-pin"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 3;
}

@end
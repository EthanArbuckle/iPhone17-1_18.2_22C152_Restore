@interface CTXPCChangePINRequest
- (CTXPCChangePINRequest)initWithContext:(id)a3 currentPin:(id)a4 updatedPin:(id)a5;
- (NSString)currentPin;
- (NSString)updatedPin;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCChangePINRequest

- (CTXPCChangePINRequest)initWithContext:(id)a3 currentPin:(id)a4 updatedPin:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = @"current-pn";
  v15[1] = @"updated-pin";
  v16[0] = v9;
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCChangePINRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCSubscriptionContextRequest *)self context];
  id v9 = [(CTXPCChangePINRequest *)self currentPin];
  id v10 = [(CTXPCChangePINRequest *)self updatedPin];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__CTXPCChangePINRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v11 = v7;
  id v13 = v11;
  [v6 changePIN:v8 oldPin:v9 newPin:v10 completion:v12];
}

uint64_t __69__CTXPCChangePINRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)currentPin
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"current-pn"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (NSString)updatedPin
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
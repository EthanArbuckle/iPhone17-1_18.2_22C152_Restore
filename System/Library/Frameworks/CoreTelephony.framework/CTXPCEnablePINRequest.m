@interface CTXPCEnablePINRequest
+ (id)allowedClassesForArguments;
- (BOOL)enable;
- (CTXPCEnablePINRequest)initWithContext:(id)a3 enable:(BOOL)a4 pin:(id)a5;
- (NSString)pin;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCEnablePINRequest

- (CTXPCEnablePINRequest)initWithContext:(id)a3 enable:(BOOL)a4 pin:(id)a5
{
  BOOL v6 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v15[0] = @"current-pn";
  v15[1] = @"enable-pin";
  v16[0] = v9;
  v10 = [NSNumber numberWithBool:v6];
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCEnablePINRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCSubscriptionContextRequest *)self context];
  BOOL v9 = [(CTXPCEnablePINRequest *)self enable];
  v10 = [(CTXPCEnablePINRequest *)self pin];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__CTXPCEnablePINRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v11 = v7;
  id v13 = v11;
  [v6 saveSIMLockValue:v8 enabled:v9 pin:v10 completion:v12];
}

uint64_t __69__CTXPCEnablePINRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enable
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"enable-pin"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);

  LOBYTE(v2) = [v4 BOOLValue];
  return (char)v2;
}

- (NSString)pin
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"current-pn"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCEnablePINRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
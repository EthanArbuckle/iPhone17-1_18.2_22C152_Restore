@interface CTXPCRenewOneTimePasswordRequest
+ (id)allowedClassesForArguments;
- (CTXPCRenewOneTimePasswordRequest)initWithSourceIccid:(id)a3;
- (id)sourceIccid;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCRenewOneTimePasswordRequest

- (CTXPCRenewOneTimePasswordRequest)initWithSourceIccid:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"sourceIccid";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCRenewOneTimePasswordRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCRenewOneTimePasswordRequest *)self sourceIccid];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __80__CTXPCRenewOneTimePasswordRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5260CB8;
  id v9 = v7;
  id v11 = v9;
  [v6 renewOneTimePassword:v8 completion:v10];
}

uint64_t __80__CTXPCRenewOneTimePasswordRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCRenewOneTimePasswordRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)sourceIccid
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"sourceIccid"];
  id v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
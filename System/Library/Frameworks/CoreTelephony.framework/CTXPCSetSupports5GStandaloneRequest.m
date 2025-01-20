@interface CTXPCSetSupports5GStandaloneRequest
+ (id)allowedClassesForArguments;
- (CTXPCSetSupports5GStandaloneRequest)initWithDescriptor:(id)a3 enabled:(BOOL)a4;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSetSupports5GStandaloneRequest

- (CTXPCSetSupports5GStandaloneRequest)initWithDescriptor:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12 = @"enable";
  v7 = [NSNumber numberWithBool:v4];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSetSupports5GStandaloneRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithDescriptor:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCMessage *)self namedArguments];
  v9 = [v8 objectForKey:@"enable"];
  v10 = CTThrowingCastIfClass<NSNumber>(v9);
  uint64_t v11 = [v10 BOOLValue];

  v12 = [(CTXPCSubscriptionContextRequest *)self descriptor];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__CTXPCSetSupports5GStandaloneRequest_performRequestWithHandler_completionHandler___block_invoke;
  v14[3] = &unk_1E5260CB8;
  id v13 = v7;
  id v15 = v13;
  [v6 setSupports5GStandalone:v12 enabled:v11 completion:v14];
}

uint64_t __83__CTXPCSetSupports5GStandaloneRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetSupports5GStandaloneRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
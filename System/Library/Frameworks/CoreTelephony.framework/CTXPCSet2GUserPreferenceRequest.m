@interface CTXPCSet2GUserPreferenceRequest
+ (id)allowedClassesForArguments;
- (CTXPCSet2GUserPreferenceRequest)initWithEnable:(BOOL)a3;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSet2GUserPreferenceRequest

- (CTXPCSet2GUserPreferenceRequest)initWithEnable:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"enable";
  v4 = [NSNumber numberWithBool:a3];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCSet2GUserPreferenceRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCMessage *)self namedArguments];
  v9 = [v8 objectForKey:@"enable"];
  v10 = CTThrowingCastIfClass<NSNumber>(v9);
  uint64_t v11 = [v10 BOOLValue];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CTXPCSet2GUserPreferenceRequest_performRequestWithHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v12 = v7;
  id v14 = v12;
  [v6 set2GUserPreference:v11 completion:v13];
}

uint64_t __79__CTXPCSet2GUserPreferenceRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSet2GUserPreferenceRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
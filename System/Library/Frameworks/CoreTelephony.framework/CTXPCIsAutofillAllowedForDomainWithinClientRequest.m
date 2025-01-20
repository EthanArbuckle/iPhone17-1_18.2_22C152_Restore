@interface CTXPCIsAutofillAllowedForDomainWithinClientRequest
+ (id)allowedClassesForArguments;
- (CTXPCIsAutofillAllowedForDomainWithinClientRequest)initWithDomain:(id)a3 clientBundleIdentifier:(id)a4;
- (id)clientBundleIdentifier;
- (id)domain;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCIsAutofillAllowedForDomainWithinClientRequest

- (CTXPCIsAutofillAllowedForDomainWithinClientRequest)initWithDomain:(id)a3 clientBundleIdentifier:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"domain";
  v12[1] = @"bundleID";
  v13[0] = v6;
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCIsAutofillAllowedForDomainWithinClientRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCIsAutofillAllowedForDomainWithinClientRequest *)self domain];
  v9 = [(CTXPCIsAutofillAllowedForDomainWithinClientRequest *)self clientBundleIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__CTXPCIsAutofillAllowedForDomainWithinClientRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262E68;
  id v10 = v7;
  id v12 = v10;
  [v6 isAutofilleSIMIdAllowedForDomain:v8 clientBundleIdentifier:v9 completion:v11];
}

void __98__CTXPCIsAutofillAllowedForDomainWithinClientRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [[CTXPCBooleanResponseMessage alloc] initWithResult:a2];
  (*(void (**)(uint64_t, CTXPCBooleanResponseMessage *, id))(v5 + 16))(v5, v6, v7);
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCIsAutofillAllowedForDomainWithinClientRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)domain
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"domain"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

- (id)clientBundleIdentifier
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"bundleID"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
@interface CTXPCHandleTermsAndConditionsCompletedRequest
+ (id)allowedClassesForArguments;
- (BOOL)consented;
- (CTXPCHandleTermsAndConditionsCompletedRequest)initWithSourceIccid:(id)a3 consented:(BOOL)a4;
- (id)sourceIccid;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCHandleTermsAndConditionsCompletedRequest

- (CTXPCHandleTermsAndConditionsCompletedRequest)initWithSourceIccid:(id)a3 consented:(BOOL)a4
{
  BOOL v4 = a4;
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12[0] = @"sourceIccid";
  v12[1] = @"consented";
  v13[0] = v6;
  v7 = [NSNumber numberWithBool:v4];
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCHandleTermsAndConditionsCompletedRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCHandleTermsAndConditionsCompletedRequest *)self sourceIccid];
  BOOL v9 = [(CTXPCHandleTermsAndConditionsCompletedRequest *)self consented];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__CTXPCHandleTermsAndConditionsCompletedRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 handleTermsAndConditionsCompleted:v8 consented:v9 completion:v11];
}

uint64_t __93__CTXPCHandleTermsAndConditionsCompletedRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCHandleTermsAndConditionsCompletedRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  BOOL v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)sourceIccid
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"sourceIccid"];
  BOOL v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

- (BOOL)consented
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"consented"];
  BOOL v4 = CTThrowingCastIfClass<NSNumber>(v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

@end
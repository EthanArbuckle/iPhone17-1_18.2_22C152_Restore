@interface CTXPCEncryptDataRequest
+ (id)allowedClassesForArguments;
- (CTXPCEncryptDataRequest)initWithMcc:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 plainText:(id)a7;
- (id)gid1;
- (id)gid2;
- (id)mcc;
- (id)mnc;
- (id)plainText;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCEncryptDataRequest

- (CTXPCEncryptDataRequest)initWithMcc:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 plainText:(id)a7
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = @"mcc";
  v22[1] = @"mnc";
  v23[0] = v12;
  v23[1] = v13;
  v22[2] = @"plainText";
  v23[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v18 = (void *)[v17 mutableCopy];

  [v18 setObject:v14 forKeyedSubscript:@"gid1"];
  [v18 setObject:v15 forKeyedSubscript:@"gid2"];
  v21.receiver = self;
  v21.super_class = (Class)CTXPCEncryptDataRequest;
  v19 = [(CTXPCMessage *)&v21 initWithNamedArguments:v18];

  return v19;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCEncryptDataRequest *)self mcc];
  v9 = [(CTXPCEncryptDataRequest *)self mnc];
  v10 = [(CTXPCEncryptDataRequest *)self gid1];
  v11 = [(CTXPCEncryptDataRequest *)self gid2];
  id v12 = [(CTXPCEncryptDataRequest *)self plainText];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__CTXPCEncryptDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v14[3] = &unk_1E5262DA0;
  id v13 = v7;
  id v15 = v13;
  [v6 encryptDataWithCarrierIdentifiers:v8 mnc:v9 gid1:v10 gid2:v11 data:v12 completion:v14];
}

void __71__CTXPCEncryptDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [[CTXPCEncryptDataResponse alloc] initWithCipherText:v8];
  (*(void (**)(uint64_t, CTXPCEncryptDataResponse *, id))(v6 + 16))(v6, v7, v5);
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCEncryptDataRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)mcc
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"mcc"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

- (id)mnc
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"mnc"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

- (id)gid1
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"gid1"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)gid2
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"gid2"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)plainText
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"plainText"];
  id v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
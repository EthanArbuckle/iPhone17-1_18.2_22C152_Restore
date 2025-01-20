@interface CTXPCGetLocalDeviceIdentifierRequest
+ (id)allowedClassesForArguments;
- (CTXPCGetLocalDeviceIdentifierRequest)initWithType:(unint64_t)a3 clientBundleIdentifier:(id)a4;
- (id)clientBundleIdentifier;
- (int)requiredEntitlement;
- (unint64_t)type;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetLocalDeviceIdentifierRequest

- (CTXPCGetLocalDeviceIdentifierRequest)initWithType:(unint64_t)a3 clientBundleIdentifier:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v12[0] = @"type";
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v12[1] = @"bundleID";
  v13[0] = v7;
  v13[1] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetLocalDeviceIdentifierRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CTXPCGetLocalDeviceIdentifierRequest *)self type];
  v9 = [(CTXPCGetLocalDeviceIdentifierRequest *)self clientBundleIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__CTXPCGetLocalDeviceIdentifierRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262F08;
  id v10 = v7;
  id v12 = v10;
  [v6 getLocalDeviceIdentifier:v8 clientBundleIdentifier:v9 completion:v11];
}

void __84__CTXPCGetLocalDeviceIdentifierRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [[CTXPCDeviceIdentifierMessage alloc] initWithDeviceID:v8];
  (*(void (**)(uint64_t, CTXPCDeviceIdentifierMessage *, id))(v6 + 16))(v6, v7, v5);
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCGetLocalDeviceIdentifierRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (unint64_t)type
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"type"];
  v4 = CTThrowingCastIfClass<NSNumber>(v3);
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (id)clientBundleIdentifier
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"bundleID"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
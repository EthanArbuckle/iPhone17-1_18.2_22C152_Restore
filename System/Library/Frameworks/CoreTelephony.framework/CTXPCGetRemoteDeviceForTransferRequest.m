@interface CTXPCGetRemoteDeviceForTransferRequest
+ (id)allowedClassesForArguments;
- (CTXPCGetRemoteDeviceForTransferRequest)initWithEID:(id)a3;
- (id)eid;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetRemoteDeviceForTransferRequest

- (CTXPCGetRemoteDeviceForTransferRequest)initWithEID:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"remoteEID";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetRemoteDeviceForTransferRequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCGetRemoteDeviceForTransferRequest *)self eid];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __86__CTXPCGetRemoteDeviceForTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262E90;
  id v9 = v7;
  id v11 = v9;
  [v6 getRemoteDeviceForTransferWithEID:v8 completion:v10];
}

void __86__CTXPCGetRemoteDeviceForTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [[CTXPCGetRemoteDeviceForTransferResponse alloc] initWithDevice:v8];
  (*(void (**)(uint64_t, CTXPCGetRemoteDeviceForTransferResponse *, id))(v6 + 16))(v6, v7, v5);
}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetRemoteDeviceForTransferRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)eid
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"remoteEID"];
  id v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
@interface CTXPCMessageRevokeRequest
+ (id)allowedClassesForArguments;
- (CTLazuliMessageID)messageID;
- (CTLazuliMessageRevokeData)revokeData;
- (CTXPCMessageRevokeRequest)initWithContext:(id)a3 revokeData:(id)a4 messageID:(id)a5;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCMessageRevokeRequest

- (CTXPCMessageRevokeRequest)initWithContext:(id)a3 revokeData:(id)a4 messageID:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = @"revokeData";
  v15[1] = @"messageID";
  v16[0] = v9;
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCMessageRevokeRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (CTLazuliMessageRevokeData)revokeData
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"revokeData"];
  v4 = CTThrowingCastIfClass<CTLazuliMessageRevokeData>(v3);

  return (CTLazuliMessageRevokeData *)v4;
}

- (CTLazuliMessageID)messageID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"messageID"];
  v4 = CTThrowingCastIfClass<CTLazuliMessageID>(v3);

  return (CTLazuliMessageID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCSubscriptionContextRequest *)self context];
  id v9 = [(CTXPCMessageRevokeRequest *)self revokeData];
  id v10 = [(CTXPCMessageRevokeRequest *)self messageID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__CTXPCMessageRevokeRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E5260CB8;
  id v11 = v7;
  id v13 = v11;
  [v6 revokeMessage:v8 withRevokeData:v9 withMessageID:v10 completion:v12];
}

uint64_t __73__CTXPCMessageRevokeRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCMessageRevokeRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
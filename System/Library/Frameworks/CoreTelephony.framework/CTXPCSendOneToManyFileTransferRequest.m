@interface CTXPCSendOneToManyFileTransferRequest
+ (BOOL)isSensitiveMessage;
+ (id)allowedClassesForArguments;
- (CTLazuliDestinationList)destinationList;
- (CTLazuliFileTransferDescriptor)fileTransferDescriptor;
- (CTLazuliMessageID)messageID;
- (CTXPCSendOneToManyFileTransferRequest)initWithContext:(id)a3 to:(id)a4 withMessageID:(id)a5 withDescriptor:(id)a6;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSendOneToManyFileTransferRequest

- (CTXPCSendOneToManyFileTransferRequest)initWithContext:(id)a3 to:(id)a4 withMessageID:(id)a5 withDescriptor:(id)a6
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = @"destinationList";
  v18[1] = @"messageID";
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = @"descriptor";
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendOneToManyFileTransferRequest;
  v15 = [(CTXPCSubscriptionContextRequest *)&v17 initWithContext:v10 namedArguments:v14];

  return v15;
}

- (CTLazuliMessageID)messageID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"messageID"];
  v4 = CTThrowingCastIfClass<CTLazuliMessageID>(v3);

  return (CTLazuliMessageID *)v4;
}

- (CTLazuliFileTransferDescriptor)fileTransferDescriptor
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"descriptor"];
  v4 = CTThrowingCastIfClass<CTLazuliFileTransferDescriptor>(v3);

  return (CTLazuliFileTransferDescriptor *)v4;
}

- (CTLazuliDestinationList)destinationList
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"destinationList"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTLazuliDestinationList *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCSendOneToManyFileTransferRequest *)self messageID];
  id v10 = [(CTXPCSendOneToManyFileTransferRequest *)self fileTransferDescriptor];
  id v11 = [(CTXPCSendOneToManyFileTransferRequest *)self destinationList];
  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__CTXPCSendOneToManyFileTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
    v13[3] = &unk_1E5260CB8;
    id v14 = v7;
    [v6 sendOneToManyFileTransferMessage:v8 to:v11 withMessageID:v9 withDescriptor:v10 completion:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

uint64_t __85__CTXPCSendOneToManyFileTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendOneToManyFileTransferRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

+ (BOOL)isSensitiveMessage
{
  return 1;
}

@end
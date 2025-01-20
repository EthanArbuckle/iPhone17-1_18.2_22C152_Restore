@interface CTXPCRetrieveMessageRequest
+ (id)allowedClassesForArguments;
- (CTLazuliMessageID)messageID;
- (CTXPCRetrieveMessageRequest)initWithContext:(id)a3 messageID:(id)a4;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCRetrieveMessageRequest

- (CTXPCRetrieveMessageRequest)initWithContext:(id)a3 messageID:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"messageID";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCRetrieveMessageRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
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
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCRetrieveMessageRequest *)self messageID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__CTXPCRetrieveMessageRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5262F80;
  id v10 = v7;
  id v12 = v10;
  [v6 retrieveMessage:v8 withMessageID:v9 completion:v11];
}

void __75__CTXPCRetrieveMessageRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = [[CTXPCRetrieveMessageResponse alloc] initWithMessageEnvelope:v7];
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCRetrieveMessageRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (int)requiredEntitlement
{
  return 7;
}

@end
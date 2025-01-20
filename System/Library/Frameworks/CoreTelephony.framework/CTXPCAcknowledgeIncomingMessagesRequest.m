@interface CTXPCAcknowledgeIncomingMessagesRequest
+ (id)allowedClassesForArguments;
- (CTLazuliMessageIDList)messageIDList;
- (CTXPCAcknowledgeIncomingMessagesRequest)initWithContext:(id)a3 messageIDList:(id)a4;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCAcknowledgeIncomingMessagesRequest

- (CTXPCAcknowledgeIncomingMessagesRequest)initWithContext:(id)a3 messageIDList:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"messageIDList";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCAcknowledgeIncomingMessagesRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (CTLazuliMessageIDList)messageIDList
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"messageIDList"];
  v4 = CTThrowingCastIfClass<CTLazuliMessageIDList>(v3);

  return (CTLazuliMessageIDList *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCAcknowledgeIncomingMessagesRequest *)self messageIDList];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__CTXPCAcknowledgeIncomingMessagesRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 acknowledgeIncomingMessages:v8 withMessageIDList:v9 completion:v11];
}

uint64_t __87__CTXPCAcknowledgeIncomingMessagesRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCAcknowledgeIncomingMessagesRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
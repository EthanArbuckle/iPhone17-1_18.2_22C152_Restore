@interface CTXPCSendDispositionNotificationMessageRequest
+ (id)allowedClassesForArguments;
- (CTLazuliDestination)destination;
- (CTLazuliGroupChatUri)groupChatURI;
- (CTLazuliMessageID)messageID;
- (CTLazuliMessageID)notificationMessageID;
- (CTXPCSendDispositionNotificationMessageRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 notificationType:(int64_t)a6 notificationMessageID:(id)a7;
- (CTXPCSendDispositionNotificationMessageRequest)initWithContext:(id)a3 groupChatURI:(id)a4 destination:(id)a5 messageID:(id)a6 notificationType:(int64_t)a7 notificationMessageID:(id)a8;
- (int)requiredEntitlement;
- (int64_t)notificationType;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSendDispositionNotificationMessageRequest

- (CTXPCSendDispositionNotificationMessageRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 notificationType:(int64_t)a6 notificationMessageID:(id)a7
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v21[0] = @"destination";
  v21[1] = @"messageID";
  v22[0] = v13;
  v22[1] = v14;
  v21[2] = @"notificationType";
  v16 = [NSNumber numberWithInteger:a6];
  v21[3] = @"notificationMessageID";
  v22[2] = v16;
  v22[3] = v15;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  v20.receiver = self;
  v20.super_class = (Class)CTXPCSendDispositionNotificationMessageRequest;
  v18 = [(CTXPCSubscriptionContextRequest *)&v20 initWithContext:v12 namedArguments:v17];

  return v18;
}

- (CTXPCSendDispositionNotificationMessageRequest)initWithContext:(id)a3 groupChatURI:(id)a4 destination:(id)a5 messageID:(id)a6 notificationType:(int64_t)a7 notificationMessageID:(id)a8
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v24[0] = @"groupChatURI";
  v24[1] = @"destination";
  v25[0] = v15;
  v25[1] = v16;
  v25[2] = v17;
  v24[2] = @"messageID";
  v24[3] = @"notificationType";
  v19 = [NSNumber numberWithInteger:a7];
  v24[4] = @"notificationMessageID";
  v25[3] = v19;
  v25[4] = v18;
  objc_super v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
  v23.receiver = self;
  v23.super_class = (Class)CTXPCSendDispositionNotificationMessageRequest;
  v21 = [(CTXPCSubscriptionContextRequest *)&v23 initWithContext:v14 namedArguments:v20];

  return v21;
}

- (CTLazuliDestination)destination
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"destination"];
  v4 = CTThrowingCastIfClass<CTLazuliDestination>(v3);

  return (CTLazuliDestination *)v4;
}

- (CTLazuliGroupChatUri)groupChatURI
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"groupChatURI"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CTLazuliGroupChatUri *)v4;
}

- (CTLazuliMessageID)messageID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"messageID"];
  id v4 = CTThrowingCastIfClass<CTLazuliMessageID>(v3);

  return (CTLazuliMessageID *)v4;
}

- (int64_t)notificationType
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"notificationType"];
  id v4 = CTThrowingCastIfClass<NSNumber>(v3);

  int64_t v5 = [v4 integerValue];
  return v5;
}

- (CTLazuliMessageID)notificationMessageID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"notificationMessageID"];
  id v4 = CTThrowingCastIfClass<CTLazuliMessageID>(v3);

  return (CTLazuliMessageID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCSendDispositionNotificationMessageRequest *)self messageID];
  int64_t v10 = [(CTXPCSendDispositionNotificationMessageRequest *)self notificationType];
  v11 = [(CTXPCSendDispositionNotificationMessageRequest *)self notificationMessageID];
  id v12 = [(CTXPCSendDispositionNotificationMessageRequest *)self destination];
  id v13 = [(CTXPCSendDispositionNotificationMessageRequest *)self groupChatURI];
  if (v13)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke;
    v17[3] = &unk_1E5260CB8;
    id v14 = &v18;
    id v18 = v7;
    [v6 sendGroupDispositionNotificationMessage:v8 toGroup:v13 to:v12 withMessageID:v9 withDisposition:v10 forMessageID:v11 completion:v17];
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5260CB8;
    id v14 = &v16;
    id v16 = v7;
    [v6 sendDispositionNotificationMessage:v8 to:v12 withMessageID:v9 withDisposition:v10 forMessageID:v11 completion:v15];
  }
}

uint64_t __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__CTXPCSendDispositionNotificationMessageRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendDispositionNotificationMessageRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
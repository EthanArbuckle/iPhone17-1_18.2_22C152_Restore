@interface CTXPCSendDeviceActionRequest
+ (id)allowedClassesForArguments;
- (CTLazuliDestination)destination;
- (CTLazuliMessageID)messageID;
- (CTLazuliSuggestedActionDevice)action;
- (CTXPCSendDeviceActionRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 action:(id)a6;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSendDeviceActionRequest

- (CTXPCSendDeviceActionRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 action:(id)a6
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = @"destination";
  v18[1] = @"messageID";
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = @"action";
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendDeviceActionRequest;
  v15 = [(CTXPCSubscriptionContextRequest *)&v17 initWithContext:v10 namedArguments:v14];

  return v15;
}

- (CTLazuliDestination)destination
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"destination"];
  v4 = CTThrowingCastIfClass<CTLazuliDestination>(v3);

  return (CTLazuliDestination *)v4;
}

- (CTLazuliMessageID)messageID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"messageID"];
  v4 = CTThrowingCastIfClass<CTLazuliMessageID>(v3);

  return (CTLazuliMessageID *)v4;
}

- (CTLazuliSuggestedActionDevice)action
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"action"];
  v4 = CTThrowingCastIfClass<CTLazuliSuggestedActionDevice>(v3);

  return (CTLazuliSuggestedActionDevice *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCSendDeviceActionRequest *)self destination];
  id v10 = [(CTXPCSendDeviceActionRequest *)self messageID];
  id v11 = [(CTXPCSendDeviceActionRequest *)self action];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CTXPCSendDeviceActionRequest_performRequestWithHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v12 = v7;
  id v14 = v12;
  [v6 sendDeviceAction:v8 to:v9 withMessageID:v10 withAction:v11 completion:v13];
}

uint64_t __76__CTXPCSendDeviceActionRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendDeviceActionRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
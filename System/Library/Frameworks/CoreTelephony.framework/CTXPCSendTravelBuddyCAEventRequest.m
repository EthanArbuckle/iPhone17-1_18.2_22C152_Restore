@interface CTXPCSendTravelBuddyCAEventRequest
+ (id)allowedClassesForArguments;
- (CTXPCSendTravelBuddyCAEventRequest)initWithAction:(id)a3 carrierName:(id)a4;
- (id)action;
- (id)carrierName;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSendTravelBuddyCAEventRequest

- (CTXPCSendTravelBuddyCAEventRequest)initWithAction:(id)a3 carrierName:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"action";
  v12[1] = @"carrier";
  v13[0] = v6;
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSendTravelBuddyCAEventRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSendTravelBuddyCAEventRequest *)self action];
  v9 = [(CTXPCSendTravelBuddyCAEventRequest *)self carrierName];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__CTXPCSendTravelBuddyCAEventRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 sendTravelBuddyCAEventWithCompletion:v8 carrierName:v9 completion:v11];
}

uint64_t __82__CTXPCSendTravelBuddyCAEventRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSendTravelBuddyCAEventRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (id)action
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"action"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

- (id)carrierName
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKeyedSubscript:@"carrier"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
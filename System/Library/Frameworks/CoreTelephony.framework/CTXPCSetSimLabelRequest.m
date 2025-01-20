@interface CTXPCSetSimLabelRequest
- (CTXPCSetSimLabelRequest)initWithContext:(id)a3 label:(id)a4;
- (id)label;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSetSimLabelRequest

- (CTXPCSetSimLabelRequest)initWithContext:(id)a3 label:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"label";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSetSimLabelRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCSetSimLabelRequest *)self label];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CTXPCSetSimLabelRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5260CB8;
  id v10 = v7;
  id v12 = v10;
  [v6 setLabel:v8 label:v9 completion:v11];
}

uint64_t __71__CTXPCSetSimLabelRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

- (id)label
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"label"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return v4;
}

@end
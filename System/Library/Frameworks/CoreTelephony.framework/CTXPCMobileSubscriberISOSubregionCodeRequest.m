@interface CTXPCMobileSubscriberISOSubregionCodeRequest
- (CTXPCMobileSubscriberISOSubregionCodeRequest)initWithMcc:(id)a3 mnc:(id)a4;
- (NSString)mcc;
- (NSString)mnc;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCMobileSubscriberISOSubregionCodeRequest

- (CTXPCMobileSubscriberISOSubregionCodeRequest)initWithMcc:(id)a3 mnc:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12[0] = @"mcc";
  v12[1] = @"mnc";
  v13[0] = v6;
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCMobileSubscriberISOSubregionCodeRequest;
  v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCMobileSubscriberISOSubregionCodeRequest *)self mcc];
  v9 = [(CTXPCMobileSubscriberISOSubregionCodeRequest *)self mnc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__CTXPCMobileSubscriberISOSubregionCodeRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5267888;
  id v10 = v7;
  id v12 = v10;
  [v6 copyMobileSubscriberIsoSubregionCode:v8 MNC:v9 completion:v11];
}

void __92__CTXPCMobileSubscriberISOSubregionCodeRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = [[CTXPCSimCommonArrayResultResponse alloc] initWithResult:v7];
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)mcc
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"mcc"];
  v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (NSString)mnc
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 valueForKey:@"mnc"];

  if (v3)
  {
    v4 = CTThrowingCastIfClass<NSString>(v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 3;
}

@end
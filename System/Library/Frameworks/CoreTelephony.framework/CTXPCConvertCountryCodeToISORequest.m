@interface CTXPCConvertCountryCodeToISORequest
- (CTXPCConvertCountryCodeToISORequest)initWithMcc:(id)a3;
- (NSString)mcc;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCConvertCountryCodeToISORequest

- (CTXPCConvertCountryCodeToISORequest)initWithMcc:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = @"mcc";
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)CTXPCConvertCountryCodeToISORequest;
  v6 = [(CTXPCMessage *)&v8 initWithNamedArguments:v5];

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CTXPCConvertCountryCodeToISORequest *)self mcc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __83__CTXPCConvertCountryCodeToISORequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E5262DA0;
  id v9 = v7;
  id v11 = v9;
  [v6 copyMobileSubscriberIsoCountryCode:v8 completion:v10];
}

void __83__CTXPCConvertCountryCodeToISORequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = [[CTXPCSimCommonResultResponse alloc] initWithResult:v7];
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
  id v4 = CTThrowingCastIfClass<NSString>(v3);

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 1;
}

@end
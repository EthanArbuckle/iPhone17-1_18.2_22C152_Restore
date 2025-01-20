@interface CTXPCReportSpamRequest
+ (BOOL)isSensitiveMessage;
+ (id)allowedClassesForArguments;
- (CTLazuliDestination)destination;
- (CTLazuliOperationID)operationID;
- (CTLazuliSpamReportInformation)spamReportInfo;
- (CTXPCReportSpamRequest)initWithContext:(id)a3 destination:(id)a4 spamReportInfo:(id)a5 operationID:(id)a6;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCReportSpamRequest

- (CTXPCReportSpamRequest)initWithContext:(id)a3 destination:(id)a4 spamReportInfo:(id)a5 operationID:(id)a6
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = @"destination";
  v18[1] = @"spamReportInfo";
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = @"operationID";
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v17.receiver = self;
  v17.super_class = (Class)CTXPCReportSpamRequest;
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

- (CTLazuliSpamReportInformation)spamReportInfo
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"spamReportInfo"];
  v4 = CTThrowingCastIfClass<CTLazuliSpamReportInformation>(v3);

  return (CTLazuliSpamReportInformation *)v4;
}

- (CTLazuliOperationID)operationID
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"operationID"];
  v4 = CTThrowingCastIfClass<CTLazuliOperationID>(v3);

  return (CTLazuliOperationID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCReportSpamRequest *)self destination];
  id v10 = [(CTXPCReportSpamRequest *)self spamReportInfo];
  id v11 = [(CTXPCReportSpamRequest *)self operationID];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CTXPCReportSpamRequest_performRequestWithHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E5260CB8;
  id v12 = v7;
  id v14 = v12;
  [v6 reportLazuliSpamWithContext:v8 destination:v9 spamReportInfo:v10 operationID:v11 completion:v13];
}

uint64_t __70__CTXPCReportSpamRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCReportSpamRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

+ (BOOL)isSensitiveMessage
{
  return 1;
}

@end
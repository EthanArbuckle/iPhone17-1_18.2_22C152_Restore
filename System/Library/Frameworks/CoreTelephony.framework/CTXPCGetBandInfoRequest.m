@interface CTXPCGetBandInfoRequest
+ (id)allowedClassesForArguments;
- (CTXPCGetBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCGetBandInfoRequest

- (CTXPCGetBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12 = @"type";
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetBandInfoRequest;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCMessage *)self namedArguments];
  v9 = [v8 objectForKey:@"type"];
  v10 = CTThrowingCastIfClass<NSNumber>(v9);
  int v11 = [v10 unsignedIntValue];

  if (v11 == 1)
  {
    v12 = [(CTXPCSubscriptionContextRequest *)self context];
    v13 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5265680;
    v14[4] = v7;
    [v6 getBandInfo:v12 completion:v14];
    goto LABEL_5;
  }
  if (!v11)
  {
    v12 = [(CTXPCSubscriptionContextRequest *)self context];
    v13 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E5262E18;
    v15[4] = v7;
    [v6 copyBandInfo:v12 completion:v15];
LABEL_5:
  }
}

void __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = 0;
  if (v7 && !v5) {
    id v6 = [[CTXPCGetBandInfoResponse alloc] initWithBandMasks:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = 0;
  if (v7 && !v5) {
    id v6 = [[CTXPCGetBandInfoResponse alloc] initWithBandInfo:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetBandInfoRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
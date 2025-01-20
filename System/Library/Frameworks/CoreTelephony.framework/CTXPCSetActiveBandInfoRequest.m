@interface CTXPCSetActiveBandInfoRequest
+ (id)allowedClassesForArguments;
- (CTXPCSetActiveBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4 bandInfo:(id)a5;
- (CTXPCSetActiveBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4 bands:(id)a5;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSetActiveBandInfoRequest

- (CTXPCSetActiveBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4 bands:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v15[0] = @"type";
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  v15[1] = @"bands";
  v16[0] = v10;
  v16[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSetActiveBandInfoRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (CTXPCSetActiveBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4 bandInfo:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v15[0] = @"type";
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  v15[1] = @"bands";
  v16[0] = v10;
  v16[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSetActiveBandInfoRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithContext:v8 namedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCMessage *)self namedArguments];
  id v9 = [v8 objectForKey:@"type"];
  v10 = CTThrowingCastIfClass<NSNumber>(v9);
  int v11 = [v10 unsignedIntValue];

  v12 = [(CTXPCMessage *)self namedArguments];
  v13 = [v12 objectForKey:@"bands"];

  if (v11 == 1)
  {
    objc_super v14 = CTThrowingCastIfClass<CTBandInfo>(v13);
    v15 = [(CTXPCSubscriptionContextRequest *)self context];
    v16 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5260CB8;
    v17[4] = v7;
    [v6 setActiveBandInfo:v15 bands:v14 completion:v17];
    goto LABEL_5;
  }
  if (!v11)
  {
    objc_super v14 = CTThrowingCastIfClass<NSDictionary>(v13);
    v15 = [(CTXPCSubscriptionContextRequest *)self context];
    v16 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
    v18[3] = &unk_1E5260CB8;
    v18[4] = v7;
    [v6 setBandInfo:v15 bands:v14 completion:v18];
LABEL_5:
  }
}

uint64_t __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSetActiveBandInfoRequest;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
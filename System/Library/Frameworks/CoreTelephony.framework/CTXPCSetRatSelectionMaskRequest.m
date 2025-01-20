@interface CTXPCSetRatSelectionMaskRequest
+ (id)allowedClassesForArguments;
- (CTXPCSetRatSelectionMaskRequest)initWithDescriptor:(id)a3 selection:(unsigned __int8)a4 preferred:(unsigned __int8)a5;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCSetRatSelectionMaskRequest

- (CTXPCSetRatSelectionMaskRequest)initWithDescriptor:(id)a3 selection:(unsigned __int8)a4 preferred:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v15[0] = @"selection";
  v9 = [NSNumber numberWithUnsignedChar:v6];
  v15[1] = @"preferred";
  v16[0] = v9;
  v10 = [NSNumber numberWithUnsignedChar:v5];
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSetRatSelectionMaskRequest;
  v12 = [(CTXPCSubscriptionContextRequest *)&v14 initWithDescriptor:v8 namedArguments:v11];

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CTXPCMessage *)self namedArguments];
  v9 = [v8 objectForKey:@"selection"];
  v10 = CTThrowingCastIfClass<NSNumber>(v9);
  unsigned __int8 v11 = [v10 unsignedIntValue];

  v12 = [(CTXPCMessage *)self namedArguments];
  v13 = [v12 objectForKey:@"preferred"];
  objc_super v14 = CTThrowingCastIfClass<NSNumber>(v13);
  LOBYTE(v10) = [v14 unsignedIntValue];

  v15 = [(CTXPCSubscriptionContextRequest *)self descriptor];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__CTXPCSetRatSelectionMaskRequest_performRequestWithHandler_completionHandler___block_invoke;
  v17[3] = &unk_1E5260CB8;
  id v16 = v7;
  id v18 = v16;
  [v6 setRatSelectionMask:v15 selection:v11 preferred:v10 completion:v17];
}

uint64_t __79__CTXPCSetRatSelectionMaskRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetRatSelectionMaskRequest;
  v2 = objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

@end
@interface CTXPCDecodeSuggestionsBase64Request
+ (id)allowedClassesForArguments;
- (CTLazuliDeepLinkBase64String)base64String;
- (CTXPCDecodeSuggestionsBase64Request)initWithContext:(id)a3 base64String:(id)a4;
- (int)requiredEntitlement;
- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4;
@end

@implementation CTXPCDecodeSuggestionsBase64Request

- (CTXPCDecodeSuggestionsBase64Request)initWithContext:(id)a3 base64String:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12 = @"base64String";
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCDecodeSuggestionsBase64Request;
  v9 = [(CTXPCSubscriptionContextRequest *)&v11 initWithContext:v6 namedArguments:v8];

  return v9;
}

- (CTLazuliDeepLinkBase64String)base64String
{
  v2 = [(CTXPCMessage *)self namedArguments];
  v3 = [v2 objectForKey:@"base64String"];
  v4 = CTThrowingCastIfClass<CTLazuliDeepLinkBase64String>(v3);

  return (CTLazuliDeepLinkBase64String *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CTXPCSubscriptionContextRequest *)self context];
  v9 = [(CTXPCDecodeSuggestionsBase64Request *)self base64String];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__CTXPCDecodeSuggestionsBase64Request_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E5263020;
  id v10 = v7;
  id v12 = v10;
  [v6 decodeSuggestionsBase64:v8 withBase64String:v9 completion:v11];
}

void __83__CTXPCDecodeSuggestionsBase64Request_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5) {
    id v6 = [[CTXPCDecodeSuggestionsBase64Response alloc] initWithDecodedPayload:v5];
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCDecodeSuggestionsBase64Request;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end
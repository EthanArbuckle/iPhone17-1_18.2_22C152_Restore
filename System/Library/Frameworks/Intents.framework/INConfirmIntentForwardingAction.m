@interface INConfirmIntentForwardingAction
+ (Class)responseClass;
- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4;
- (id)_completionHandlerWithActionCompletionHandler:(id)a3;
- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4;
@end

@implementation INConfirmIntentForwardingAction

- (id)_completionHandlerWithActionCompletionHandler:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__INConfirmIntentForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke;
  v7[3] = &unk_1E551F7D0;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x192F984C0](v7);

  return v5;
}

void __81__INConfirmIntentForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  v13 = [[INConfirmIntentForwardingActionResponse alloc] initWithIntentResponse:v12 launchContextActivityData:v11 cacheItems:v10 error:v9];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(INIntentForwardingAction *)self intent];
  id v8 = [(INConfirmIntentForwardingAction *)self _completionHandlerWithActionCompletionHandler:v6];

  [v7 confirmIntent:v9 withCompletion:v8];
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INConfirmIntentForwardingAction;
  if (![(INIntentForwardingAction *)&v12 executeRemotelyWithVendorRemote:v6 completionHandler:v7])
  {
    id v8 = [(INIntentForwardingAction *)self intent];
    id v9 = INIntentWithTypedIntent(v8);

    id v10 = [(INConfirmIntentForwardingAction *)self _completionHandlerWithActionCompletionHandler:v7];
    [v6 confirmIntent:v9 withCompletion:v10];
  }
  return 1;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end
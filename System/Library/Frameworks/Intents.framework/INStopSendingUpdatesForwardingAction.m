@interface INStopSendingUpdatesForwardingAction
+ (Class)responseClass;
- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4;
- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4;
@end

@implementation INStopSendingUpdatesForwardingAction

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(INIntentForwardingAction *)self intent];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__INStopSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke;
  v10[3] = &unk_1E551BEC0;
  id v11 = v6;
  id v9 = v6;
  [v7 stopSendingUpdatesForIntent:v8 completionHandler:v10];
}

void __92__INStopSendingUpdatesForwardingAction_executeLocallyWithIntentDeliverer_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = [[INIntentForwardingActionResponse alloc] initWithError:0];
  (*(void (**)(uint64_t, INIntentForwardingActionResponse *))(v1 + 16))(v1, v2);
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, INIntentForwardingActionResponse *))a4;
  v14.receiver = self;
  v14.super_class = (Class)INStopSendingUpdatesForwardingAction;
  if ([(INIntentForwardingAction *)&v14 executeRemotelyWithVendorRemote:v6 completionHandler:v7])
  {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    v8 = [(INIntentForwardingAction *)self intent];
    id v9 = INIntentWithTypedIntent(v8);

    [v6 stopSendingUpdatesForIntent:v9];
    v10 = [[INIntentForwardingActionResponse alloc] initWithError:0];
    v7[2](v7, v10);

LABEL_4:
    BOOL v11 = 1;
    goto LABEL_8;
  }
  v12 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[INStopSendingUpdatesForwardingAction executeRemotelyWithVendorRemote:completionHandler:]";
    _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s The extension context doesn't implement stopSendingUpdatesForIntent:", buf, 0xCu);
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end
@interface LNOneShotActionExecutor
- (BOOL)hasValidConnection;
- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3;
- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3;
- (LNOneShotActionExecutor)init;
- (LNOneShotActionExecutor)initWithAction:(id)a3 executorOptions:(id)a4 appContext:(id)a5;
- (int64_t)connectionIdentifier;
- (void)performWithCompletionHandler:(id)a3;
- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4;
- (void)requestOpenURL:(id)a3 completionHandler:(id)a4;
- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4;
- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3;
@end

@implementation LNOneShotActionExecutor

- (int64_t)connectionIdentifier
{
  return 0;
}

- (BOOL)hasValidConnection
{
  return 0;
}

- (LNOneShotActionExecutor)initWithAction:(id)a3 executorOptions:(id)a4 appContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (LNOneShotActionExecutor *)OneShotActionExecutor.init(action:executorOptions:appContext:)();
}

- (void)performWithCompletionHandler:(id)a3
{
}

- (LNOneShotActionExecutor)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___LNOneShotActionExecutor_appContext);
}

- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4
{
}

- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4
{
}

- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4
{
}

- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4
{
}

- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3
{
}

- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3
{
  return sub_2364E44AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))OneShotActionExecutor.requestCancelTimeout());
}

- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3
{
  return sub_2364E44AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))OneShotActionExecutor.requestExtendTimeout());
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
}

@end
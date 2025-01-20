@interface LNPerformActionExecutorDelegateProxy
- (BOOL)hasValidConnection;
- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3;
- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3;
- (LNPerformActionExecutorDelegateProxy)init;
- (LNPerformActionExecutorDelegateProxy)initWithConnection:(id)a3 interface:(id)a4;
- (int64_t)connectionIdentifier;
- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4;
- (void)requestOpenURL:(id)a3 completionHandler:(id)a4;
- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4;
- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4;
- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3;
@end

@implementation LNPerformActionExecutorDelegateProxy

- (LNPerformActionExecutorDelegateProxy)initWithConnection:(id)a3 interface:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  return (LNPerformActionExecutorDelegateProxy *)PerformActionExecutorDelegateProxy.init(connection:interface:)(v5, (uint64_t)a4);
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
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_236569A04((uint64_t)&unk_268864690, v5);
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3
{
  return sub_23649E3F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_23649E14C);
}

- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3
{
  return sub_23649E3F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_23649E1A0);
}

- (int64_t)connectionIdentifier
{
  v2 = self;
  id v3 = sub_23649E4B0();

  return (int64_t)v3;
}

- (BOOL)hasValidConnection
{
  v2 = self;
  BOOL v3 = sub_23649E530();

  return v3;
}

- (LNPerformActionExecutorDelegateProxy)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end
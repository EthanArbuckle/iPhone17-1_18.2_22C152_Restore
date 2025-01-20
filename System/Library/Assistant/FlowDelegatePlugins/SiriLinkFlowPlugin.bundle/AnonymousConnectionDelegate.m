@interface AnonymousConnectionDelegate
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (_TtC18SiriLinkFlowPlugin27AnonymousConnectionDelegate)init;
- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4;
- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation AnonymousConnectionDelegate

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  AnonymousConnectionDelegate.executor(_:needsConfirmationWith:)((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  AnonymousConnectionDelegate.executor(_:needsActionConfirmationWith:)((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  AnonymousConnectionDelegate.executor(_:needsDisambiguationWith:)((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  AnonymousConnectionDelegate.executor(_:needsValueWith:)((uint64_t)v8, v7);
}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  AnonymousConnectionDelegate.executor(_:didFinishWith:error:)((uint64_t)v11, a4, (uint64_t)a5);
}

- (void)executor:(LNActionExecutor *)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  id v8 = a3;
  id v9 = self;

  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in AnonymousConnectionDelegate.executorEnvironmentForViewSnippet(_:), (uint64_t)v7);
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  AnonymousConnectionDelegate.executor(_:shouldRunShowOutputAction:)();

  return 0;
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  AnonymousConnectionDelegate.executor(_:needsContinueInAppWith:)((uint64_t)v8, v7);
}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  id v8 = self;
  AnonymousConnectionDelegate.executor(_:needsAppProtectionUnlockWithCompletionHandler:)();

  swift_release();
}

- (_TtC18SiriLinkFlowPlugin27AnonymousConnectionDelegate)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin27AnonymousConnectionDelegate_aceService);
  v3 = (char *)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin27AnonymousConnectionDelegate_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncThrowingStream<LinkConnectionEvent, Error>.Continuation);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
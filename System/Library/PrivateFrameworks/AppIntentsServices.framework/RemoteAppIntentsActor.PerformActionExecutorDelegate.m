@interface RemoteAppIntentsActor.PerformActionExecutorDelegate
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (_TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate)init;
- (void)executor:(LNActionExecutor *)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
@end

@implementation RemoteAppIntentsActor.PerformActionExecutorDelegate

- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5
{
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247B96450();
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247B96F68();
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247B97914();
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247B98324();
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_247B98AE0();
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  return 0;
}

- (void)executor:(LNActionExecutor *)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_247C6DA74((uint64_t)&unk_2692ABF10, (uint64_t)v7);
}

- (_TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_actionMetadata));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692ABF00);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_66();
  v3();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_connection));
  swift_weakDestroy();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_environment);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_peer);
  sub_247AD95A8((uint64_t)self+ OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_pendingRequests, &qword_2692ABEF0);
  sub_247CBD7F8();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_66();
  v4();
  swift_bridgeObjectRelease();
}

@end
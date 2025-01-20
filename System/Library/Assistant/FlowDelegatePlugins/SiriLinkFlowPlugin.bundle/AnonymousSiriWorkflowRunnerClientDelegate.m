@interface AnonymousSiriWorkflowRunnerClientDelegate
- (_TtC18SiriLinkFlowPlugin41AnonymousSiriWorkflowRunnerClientDelegate)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartActionWithIdentifier:(id)a4;
- (void)workflowRunnerClient:(id)a3 performSiriRequest:(id)a4 completionHandler:(id)a5;
@end

@implementation AnonymousSiriWorkflowRunnerClientDelegate

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = a5;
  AnonymousSiriWorkflowRunnerClientDelegate.workflowRunnerClient(_:didFinishRunningWorkflowWithOutput:error:cancelled:)();
}

- (void)workflowRunnerClient:(id)a3 performSiriRequest:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  AnonymousSiriWorkflowRunnerClientDelegate.workflowRunnerClient(_:performSiriRequest:completionHandler:)();

  swift_release();
}

- (void)workflowRunnerClient:(id)a3 didStartActionWithIdentifier:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  AnonymousSiriWorkflowRunnerClientDelegate.workflowRunnerClient(_:didStartActionWithIdentifier:)();

  swift_bridgeObjectRelease();
}

- (_TtC18SiriLinkFlowPlugin41AnonymousSiriWorkflowRunnerClientDelegate)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin41AnonymousSiriWorkflowRunnerClientDelegate_continuation;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<SiriWorkflowRunnerEvent>.Continuation);
  OUTLINED_FUNCTION_6();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end
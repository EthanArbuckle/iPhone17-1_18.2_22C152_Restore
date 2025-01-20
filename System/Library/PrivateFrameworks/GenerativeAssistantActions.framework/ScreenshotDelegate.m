@interface ScreenshotDelegate
- (_TtC26GenerativeAssistantActions18ScreenshotDelegate)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation ScreenshotDelegate

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for WFContextualActionFile();
    uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v10 = a3;
  id v11 = a5;
  v12 = self;
  ScreenshotDelegate.workflowRunnerClient(_:didFinishRunningWorkflowWithOutputFiles:error:cancelled:)(v10, v7, a5);

  swift_bridgeObjectRelease();
}

- (_TtC26GenerativeAssistantActions18ScreenshotDelegate)init
{
  result = (_TtC26GenerativeAssistantActions18ScreenshotDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
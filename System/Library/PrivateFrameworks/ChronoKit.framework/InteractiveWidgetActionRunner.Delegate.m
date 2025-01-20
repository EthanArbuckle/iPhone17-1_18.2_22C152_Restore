@interface InteractiveWidgetActionRunner.Delegate
- (_TtCC9ChronoKit29InteractiveWidgetActionRunnerP33_1C4DBC0C4C60E41750913BD55B2D37FB8Delegate)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithError:(id)a4 cancelled:(BOOL)a5;
@end

@implementation InteractiveWidgetActionRunner.Delegate

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithError:(id)a4 cancelled:(BOOL)a5
{
  v7 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC9ChronoKit29InteractiveWidgetActionRunnerP33_1C4DBC0C4C60E41750913BD55B2D37FB8Delegate_completion);
  id v8 = a3;
  v9 = self;
  id v10 = a4;
  swift_retain();
  v7(a4);

  swift_release();
}

- (_TtCC9ChronoKit29InteractiveWidgetActionRunnerP33_1C4DBC0C4C60E41750913BD55B2D37FB8Delegate)init
{
  result = (_TtCC9ChronoKit29InteractiveWidgetActionRunnerP33_1C4DBC0C4C60E41750913BD55B2D37FB8Delegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
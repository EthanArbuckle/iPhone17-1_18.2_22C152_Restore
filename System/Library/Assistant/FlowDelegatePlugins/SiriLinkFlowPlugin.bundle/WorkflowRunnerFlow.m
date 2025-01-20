@interface WorkflowRunnerFlow
- (_TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow)init;
@end

@implementation WorkflowRunnerFlow

- (_TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_workflowRunnerInput;
  outlined consume of SiriWorkflowRunnerInput(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_workflowRunnerInput), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void **)v3 + 4), *((void **)v3 + 5), *((void **)v3 + 6), *((void **)v3 + 7), v3[64]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_workflowRunner);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_deviceState);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_aceServiceInvoker);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_outputPublisher);
  swift_release();
  swift_release();
  outlined destroy of WorkflowRunnerFlow.State((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_state, (void (*)(void))type metadata accessor for WorkflowRunnerFlow.State);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_locationProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC18SiriLinkFlowPlugin18WorkflowRunnerFlow_dateTimeResolver);
  swift_release();
  swift_release();

  swift_release();
}

@end
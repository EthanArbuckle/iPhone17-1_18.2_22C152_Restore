@interface RecommendationFlowControllerRepresentable.FlowControllerDelegate
- (_TtCV21CloudRecommendationUI41RecommendationFlowControllerRepresentable22FlowControllerDelegate)init;
- (void)userDidCancelAction;
- (void)userDidCompleteAction:(id)a3;
@end

@implementation RecommendationFlowControllerRepresentable.FlowControllerDelegate

- (void)userDidCompleteAction:(id)a3
{
  v4 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCV21CloudRecommendationUI41RecommendationFlowControllerRepresentable22FlowControllerDelegate_completion);
  id v5 = a3;
  v6 = self;
  swift_retain();
  v4(v5);

  swift_release();
}

- (void)userDidCancelAction
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV21CloudRecommendationUI41RecommendationFlowControllerRepresentable22FlowControllerDelegate_cancellation);
  v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtCV21CloudRecommendationUI41RecommendationFlowControllerRepresentable22FlowControllerDelegate)init
{
  result = (_TtCV21CloudRecommendationUI41RecommendationFlowControllerRepresentable22FlowControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
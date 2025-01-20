@interface TurnOnAppsActionHandler
- (_TtC21CloudRecommendationUI23TurnOnAppsActionHandler)init;
- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5;
- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4;
@end

@implementation TurnOnAppsActionHandler

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  v8 = self;
  id v9 = a5;
  sub_24A34E954(a5, "TurnOnApps flow completed with error %s");
}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_24A34E954(a4, "TurnOnApps flow cancelled with error %s");
}

- (_TtC21CloudRecommendationUI23TurnOnAppsActionHandler)init
{
  result = (_TtC21CloudRecommendationUI23TurnOnAppsActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_presenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_account));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_remoteUIPresenter));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_activeRecommendation);
}

@end
@interface UpgradeFlowManagerAction
- (_TtC21CloudRecommendationUI24UpgradeFlowManagerAction)init;
- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4;
@end

@implementation UpgradeFlowManagerAction

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24A307574();
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A3077E0();
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A3078C4();
}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_24A3079A4(a4);
}

- (_TtC21CloudRecommendationUI24UpgradeFlowManagerAction)init
{
  result = (_TtC21CloudRecommendationUI24UpgradeFlowManagerAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_presenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_account));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_activeRecommendation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_upgradeFlowManager));
  swift_unknownObjectRelease();
}

@end
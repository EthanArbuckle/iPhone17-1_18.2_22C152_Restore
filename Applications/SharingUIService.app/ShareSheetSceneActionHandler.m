@interface ShareSheetSceneActionHandler
- (_TtC16SharingUIService28ShareSheetSceneActionHandler)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation ShareSheetSceneActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  sub_100008D18(0, &qword_100043AB0);
  sub_10000FA30();
  unint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_100010604(v10);

  swift_bridgeObjectRelease();
  v15.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (_TtC16SharingUIService28ShareSheetSceneActionHandler)init
{
  result = (_TtC16SharingUIService28ShareSheetSceneActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
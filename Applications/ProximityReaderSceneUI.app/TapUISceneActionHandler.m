@interface TapUISceneActionHandler
- (_TtC22ProximityReaderSceneUI23TapUISceneActionHandler)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation TapUISceneActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  sub_1000099EC();
  sub_100009A2C();
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_10000B060(v10, (uint64_t)v11, v12);

  swift_bridgeObjectRelease();
  v15.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (_TtC22ProximityReaderSceneUI23TapUISceneActionHandler)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TapUISceneActionHandler *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action));
}

@end
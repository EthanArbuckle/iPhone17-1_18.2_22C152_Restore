@interface SceneWindowObserver
- (UIScene)_scene;
- (_TtC16SharingUIService19SceneWindowObserver)init;
- (_TtC16SharingUIService19SceneWindowObserver)initWithScene:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_setScene:(id)a3;
@end

@implementation SceneWindowObserver

- (UIScene)_scene
{
  return (UIScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene));
}

- (void)_setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene) = (Class)a3;
  id v3 = a3;
}

- (_TtC16SharingUIService19SceneWindowObserver)initWithScene:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19SceneWindowObserver__scene) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SceneWindowObserver();
  id v4 = a3;
  v5 = [(SceneWindowObserver *)&v7 init];

  return v5;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  sub_100006E30(&qword_100043378);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10002B9F0;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SceneSettingsDiffAction());
  id v7 = a3;
  v8 = self;
  *(void *)(v5 + 32) = [v6 init];
  specialized Array._endMutation()();

  sub_100006E30((uint64_t *)&unk_100044400);
  v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (_TtC16SharingUIService19SceneWindowObserver)init
{
  result = (_TtC16SharingUIService19SceneWindowObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
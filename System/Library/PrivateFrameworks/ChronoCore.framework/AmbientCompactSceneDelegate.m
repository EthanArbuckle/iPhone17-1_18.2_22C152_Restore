@interface AmbientCompactSceneDelegate
- (_TtC10ChronoCore27AmbientCompactSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation AmbientCompactSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1DAC12094(v8);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAC12504();
}

- (void)sceneDidDisconnect:(id)a3
{
  if (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase__validated) == 1)
  {
    id v4 = a3;
    v5 = self;
    sub_1DAC742EC(v4);
  }
}

- (_TtC10ChronoCore27AmbientCompactSceneDelegate)init
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore27AmbientCompactSceneDelegate__cancellables) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore27AmbientCompactSceneDelegate__viewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore27AmbientCompactSceneDelegate__viewModel) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AmbientCompactSceneDelegate();
  return [(SingleActivitySceneDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore27AmbientCompactSceneDelegate__viewController));

  swift_release();
}

@end
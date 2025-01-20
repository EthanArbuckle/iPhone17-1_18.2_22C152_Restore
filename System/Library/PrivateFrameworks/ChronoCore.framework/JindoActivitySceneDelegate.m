@interface JindoActivitySceneDelegate
- (_TtC10ChronoCore26JindoActivitySceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation JindoActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1DACA5F80(v8);
}

- (void)sceneWillEnterForeground:(id)a3
{
  v4 = (_TtC10ChronoCore26JindoActivitySceneDelegate *)a3;
  id v8 = self;
  sub_1DAAFD300();
  v5 = *(Class *)((char *)&v8->super.super.isa
                + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider);
  if (v5)
  {
    v6 = v8;
    v7 = v5;
    sub_1DABC86E4(v7, v6);

    v4 = v6;
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  v4 = (_TtC10ChronoCore26JindoActivitySceneDelegate *)a3;
  v7 = self;
  sub_1DAAFD7A8();
  v5 = *(Class *)((char *)&v7->super.super.isa
                + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider);
  if (v5)
  {
    v6 = v5;
    sub_1DABC1F20();

    v4 = v7;
    v7 = v6;
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase__validated) == 1)
  {
    id v4 = a3;
    v5 = self;
    sub_1DAAF9708((uint64_t)v4);
  }
}

- (_TtC10ChronoCore26JindoActivitySceneDelegate)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JindoActivitySceneDelegate();
  return [(ActivitySceneDelegateBase *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore26JindoActivitySceneDelegate__systemApertureElementProvider));
}

@end
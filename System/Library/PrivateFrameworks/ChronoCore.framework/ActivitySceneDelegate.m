@interface ActivitySceneDelegate
- (_TtC10ChronoCore21ActivitySceneDelegate)init;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation ActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1DAC7A720(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAC742EC(v4);
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  sub_1DA9E142C(0, &qword_1EBE44730);
  sub_1DAA0A200(&qword_1EBE44738, &qword_1EBE44730);
  unint64_t v6 = sub_1DAD27CC8();
  id v7 = a3;
  id v8 = self;
  sub_1DAC7A9B4(v6);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_1DAD27CB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (_TtC10ChronoCore21ActivitySceneDelegate)init
{
  v2 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate__cancellables) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate_viewController) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate_viewModels) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return [(ActivitySceneDelegateBase *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore21ActivitySceneDelegate_viewController));

  swift_bridgeObjectRelease();
}

@end
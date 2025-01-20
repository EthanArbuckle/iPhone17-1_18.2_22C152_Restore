@interface SceneDelegate
- (UIWindow)window;
- (_TtC20PeopleMessageService13SceneDelegate)init;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000AD04(v8, v10);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_100008EDC();
  sub_10000AC5C(&qword_10001DA50, (void (*)(uint64_t))sub_100008EDC);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100009824(v6);

  swift_bridgeObjectRelease();
}

- (_TtC20PeopleMessageService13SceneDelegate)init
{
  return (_TtC20PeopleMessageService13SceneDelegate *)sub_100008D50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_rootViewController));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer);
}

@end
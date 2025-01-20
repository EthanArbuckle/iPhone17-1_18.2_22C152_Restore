@interface SceneDelegate
- (UIWindow)window;
- (_TtC16SharingUIService13SceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100017D88(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001760C(v4);
}

- (_TtC16SharingUIService13SceneDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey;
  sub_100017D48();
  id v4 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)NSString.init(stringLiteral:)();
  *(void *)&v4->sceneComponentKey[OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window) = 0;
  *((unsigned char *)&v4->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_isModernScene) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SceneDelegate();
  return [(SceneDelegate *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneComponentKey));
  sub_1000183D8((uint64_t)self + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_sceneSession);
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SharingUIService13SceneDelegate_window);
}

@end
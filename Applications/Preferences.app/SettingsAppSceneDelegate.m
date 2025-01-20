@interface SettingsAppSceneDelegate
- (_TtC11SettingsApp24SettingsAppSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)windowScene:(UIWindowScene *)a3 performActionForShortcutItem:(UIApplicationShortcutItem *)a4 completionHandler:(id)a5;
@end

@implementation SettingsAppSceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100007300();
}

- (_TtC11SettingsApp24SettingsAppSceneDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__selectedQuickActionSubject;
  *(Class *)((char *)&self->super.isa + v3) = (Class)swift_getKeyPath();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__shortcutItemForInitialLaunch) = 0;
  ObservationRegistrar.init()();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SettingsAppSceneDelegate();
  return [(SettingsAppSceneDelegate *)&v5 init];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v10 shortcutItem];
  swift_getKeyPath();
  sub_1000686D0();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
}

- (void)windowScene:(UIWindowScene *)a3 performActionForShortcutItem:(UIApplicationShortcutItem *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100046B9C(&qword_100164100);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100160828;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100160838;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100082F2C((uint64_t)v11, (uint64_t)&unk_100160848, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate__shortcutItemForInitialLaunch));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC11SettingsApp24SettingsAppSceneDelegate___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
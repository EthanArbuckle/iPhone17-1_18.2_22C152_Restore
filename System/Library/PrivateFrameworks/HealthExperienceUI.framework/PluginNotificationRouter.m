@interface PluginNotificationRouter
- (_TtC18HealthExperienceUI24PluginNotificationRouter)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation PluginNotificationRouter

- (_TtC18HealthExperienceUI24PluginNotificationRouter)init
{
  sub_1AD73C950();
  v3 = self;
  uint64_t v4 = sub_1AD73C940();
  type metadata accessor for PlatformNotificationHandlerPluginProvider();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = v4;

  v6 = (_TtC18HealthExperienceUI24PluginNotificationRouter *)sub_1AD1AD9F0(v5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI24PluginNotificationRouter_pluginProviding);
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24PluginNotificationRouter_sceneProvider;
  sub_1AD24D3D8((uint64_t)v3);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v11.is_nil = (char)v8;
  v9 = v8;
  v11.value.super.isa = (Class)a4;
  PluginNotificationRouter.userNotificationCenter(_:openSettingsFor:)((UNUserNotificationCenter)v6, v11);
}

@end
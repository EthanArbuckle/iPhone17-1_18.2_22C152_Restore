@interface MobilityAppPluginAppDelegate
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (_TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation MobilityAppPluginAppDelegate

- (_TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_allocWithZone(MEMORY[0x263F452C0]);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate_analyticsManager) = v6;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  return [(MobilityAppPluginAppDelegate *)&v8 init];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_2416F040C(v11, sub_2416F10EC, (uint64_t (*)(void))v9);

  swift_release();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_2416F0F04((uint64_t (*)(uint64_t))sub_2416F03F8);

  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate_analyticsManager));
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = sub_24171F818();
  uint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = sub_24171F7B8();
LABEL_4:
  id v11 = a3;
  v12 = self;
  char v13 = sub_241719F68(a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end
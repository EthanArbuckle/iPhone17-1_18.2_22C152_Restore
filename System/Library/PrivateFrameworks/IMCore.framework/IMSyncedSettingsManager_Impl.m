@interface IMSyncedSettingsManager_Impl
- (IMSyncedSettingsManager_Impl)init;
- (IMSyncedSettingsManager_Impl)initWithDaemonController:(id)a3 connection:(id)a4 notificationCenter:(id)a5;
- (void)addObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5;
- (void)dealloc;
- (void)didUpdateSettingsKeys:(id)a3;
- (void)removeObserver:(id)a3 key:(int64_t)a4;
- (void)setSettingValue:(id)a3 forKey:(int64_t)a4;
- (void)settingValueForKey:(int64_t)a3 reply:(id)a4;
@end

@implementation IMSyncedSettingsManager_Impl

- (IMSyncedSettingsManager_Impl)initWithDaemonController:(id)a3 connection:(id)a4 notificationCenter:(id)a5
{
  return (IMSyncedSettingsManager_Impl *)SyncedSettingsManager.init(daemonController:connection:notificationCenter:)((uint64_t)a3, (uint64_t)a4, a5);
}

- (void)didUpdateSettingsKeys:(id)a3
{
  uint64_t v4 = sub_1A4CBB15C();
  v5 = self;
  sub_1A4C9DB5C(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_daemonController);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_listener);
  objc_msgSend(v4, sel_removeHandler_, v3);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SyncedSettingsManager();
  [(IMSyncedSettingsManager_Impl *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_notificationCenter);
}

- (void)settingValueForKey:(int64_t)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_1A4C9E124(a3, (uint64_t)sub_1A4C9ED28, v7);

  swift_release();
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_1A4CBB39C();
  swift_unknownObjectRelease();
  sub_1A4C9E4A4(v7, a4);

  sub_1A4B0BDA0((uint64_t)v7);
}

- (void)addObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1A4CBB39C();
  swift_unknownObjectRelease();
  v8 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_notificationCenter);
  sub_1A4B0BC88(v11, v11[3]);
  uint64_t v9 = sub_1A4CBB5DC();
  v10 = (void *)sub_1A4CBB33C();
  objc_msgSend(v8, sel_addObserver_selector_name_object_, v9, a4, v10, 0);

  swift_unknownObjectRelease();
  sub_1A4B0BDA0((uint64_t)v11);
}

- (void)removeObserver:(id)a3 key:(int64_t)a4
{
  swift_unknownObjectRetain();
  objc_super v5 = self;
  sub_1A4CBB39C();
  swift_unknownObjectRelease();
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___IMSyncedSettingsManager_Impl_notificationCenter);
  sub_1A4B0BC88(v9, v9[3]);
  uint64_t v7 = sub_1A4CBB5DC();
  v8 = (void *)sub_1A4CBB33C();
  objc_msgSend(v6, sel_removeObserver_name_object_, v7, v8, 0);

  swift_unknownObjectRelease();
  sub_1A4B0BDA0((uint64_t)v9);
}

- (IMSyncedSettingsManager_Impl)init
{
  result = (IMSyncedSettingsManager_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
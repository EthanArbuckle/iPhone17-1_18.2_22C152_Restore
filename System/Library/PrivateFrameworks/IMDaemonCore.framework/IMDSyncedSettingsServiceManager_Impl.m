@interface IMDSyncedSettingsServiceManager_Impl
- (IMDSyncedSettingsServiceManager_Impl)init;
- (IMDSyncedSettingsServiceManager_Impl)initWithLocalDomain:(id)a3 remoteDomain:(id)a4 localStorageDelegate:(id)a5 remoteStorageDelegate:(id)a6;
- (id)settingValueForKey:(int64_t)a3;
- (void)cloudkitStateEnabledReturnedWithNotification:(id)a3;
- (void)dealloc;
- (void)handleDidChangeWithNotification:(id)a3;
- (void)setSettingValue:(id)a3 forKey:(int64_t)a4;
@end

@implementation IMDSyncedSettingsServiceManager_Impl

- (IMDSyncedSettingsServiceManager_Impl)init
{
  return (IMDSyncedSettingsServiceManager_Impl *)SyncedSettingsServiceManager.init()();
}

- (IMDSyncedSettingsServiceManager_Impl)initWithLocalDomain:(id)a3 remoteDomain:(id)a4 localStorageDelegate:(id)a5 remoteStorageDelegate:(id)a6
{
  uint64_t v8 = sub_1D9906DA0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1D9906DA0();
  uint64_t v13 = v12;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (IMDSyncedSettingsServiceManager_Impl *)SyncedSettingsServiceManager.init(localDomain:remoteDomain:localStorageDelegate:remoteStorageDelegate:)(v8, v10, v11, v13, (uint64_t)a5, (uint64_t)a6);
}

- (void)cloudkitStateEnabledReturnedWithNotification:(id)a3
{
  uint64_t v4 = sub_1D99062E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D99062B0();
  uint64_t v8 = self;
  sub_1D98AAE20();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dealloc
{
  v2 = self;
  SyncedSettingsServiceManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (id)settingValueForKey:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1D98ABBC4(a3, (uint64_t)v12);

  uint64_t v5 = v13;
  if (v13)
  {
    uint64_t v6 = sub_1D968636C(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = (void *)sub_1D9907700();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    sub_1D9686484((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_1D99073D0();
  swift_unknownObjectRelease();
  sub_1D98AC118(v7, a4);

  sub_1D9686484((uint64_t)v7);
}

- (void)handleDidChangeWithNotification:(id)a3
{
  uint64_t v4 = sub_1D99062E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D99062B0();
  uint64_t v8 = self;
  sub_1D98AD6B8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
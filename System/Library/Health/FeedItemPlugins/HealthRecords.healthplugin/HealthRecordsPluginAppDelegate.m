@interface HealthRecordsPluginAppDelegate
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (_TtC13HealthRecords30HealthRecordsPluginAppDelegate)init;
@end

@implementation HealthRecordsPluginAppDelegate

- (_TtC13HealthRecords30HealthRecordsPluginAppDelegate)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13HealthRecords30HealthRecordsPluginAppDelegate____lazy_storage___notificationCenterDelegate) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HealthRecordsPluginAppDelegate();
  return [(HealthRecordsPluginAppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
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
  uint64_t v8 = sub_2409547C8();
  uint64_t v10 = v9;
  if (v5) {
LABEL_3:
  }
    uint64_t v5 = sub_2409546A8();
LABEL_4:
  id v11 = a3;
  v12 = self;
  char v13 = sub_24091C210((uint64_t)a3, v8, v10, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

@end
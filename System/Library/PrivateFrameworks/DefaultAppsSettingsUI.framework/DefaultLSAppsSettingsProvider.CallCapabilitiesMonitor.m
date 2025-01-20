@interface DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor
- (_TtCC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProviderP33_6339B278615E8A6CFC693041365478EF23CallCapabilitiesMonitor)init;
- (uint64_t)didChangeTelephonyCallingSupport;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
@end

@implementation DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor

- (void).cxx_destruct
{
}

- (uint64_t)didChangeTelephonyCallingSupport
{
  v1 = *(void (**)(uint64_t))&a1[OBJC_IVAR____TtCC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProviderP33_6339B278615E8A6CFC693041365478EF23CallCapabilitiesMonitor_notify];
  v2 = a1;
  uint64_t v3 = swift_retain();
  v1(v3);

  return swift_release();
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  uint64_t v4 = sub_24CA401E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CA401C8();
  v8 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProviderP33_6339B278615E8A6CFC693041365478EF23CallCapabilitiesMonitor_notify);
  v9 = self;
  uint64_t v10 = swift_retain();
  v8(v10);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProviderP33_6339B278615E8A6CFC693041365478EF23CallCapabilitiesMonitor)init
{
  result = (_TtCC21DefaultAppsSettingsUI29DefaultLSAppsSettingsProviderP33_6339B278615E8A6CFC693041365478EF23CallCapabilitiesMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
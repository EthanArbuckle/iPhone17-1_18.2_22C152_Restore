@interface DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor
- (_TtCC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProviderP33_40EE96E35A8AC8EA956464E45E3106DB23CallCapabilitiesMonitor)init;
- (uint64_t)didChangeTelephonyCallingSupport;
- (void)dealloc;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
@end

@implementation DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  [v4 removeDelegate:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(DefaultLSAppsSettingsProvider.CallCapabilitiesMonitor *)&v6 dealloc];
}

- (void).cxx_destruct
{
}

- (uint64_t)didChangeTelephonyCallingSupport
{
  v1 = *(void (**)(uint64_t))&a1[OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProviderP33_40EE96E35A8AC8EA956464E45E3106DB23CallCapabilitiesMonitor_notify];
  v2 = a1;
  uint64_t v3 = swift_retain();
  v1(v3);

  return swift_release();
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  uint64_t v4 = sub_245A8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24588();
  v8 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProviderP33_40EE96E35A8AC8EA956464E45E3106DB23CallCapabilitiesMonitor_notify);
  v9 = self;
  uint64_t v10 = swift_retain();
  v8(v10);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProviderP33_40EE96E35A8AC8EA956464E45E3106DB23CallCapabilitiesMonitor)init
{
  result = (_TtCC27DefaultAppsSettingsUIPlugin29DefaultLSAppsSettingsProviderP33_40EE96E35A8AC8EA956464E45E3106DB23CallCapabilitiesMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
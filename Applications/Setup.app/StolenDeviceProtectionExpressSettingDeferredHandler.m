@interface StolenDeviceProtectionExpressSettingDeferredHandler
- (_TtC5Setup51StolenDeviceProtectionExpressSettingDeferredHandler)init;
- (void)executeHandler:(id)a3;
@end

@implementation StolenDeviceProtectionExpressSettingDeferredHandler

- (void)executeHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1000243C0((uint64_t)sub_10002525C, v5);

  swift_release();
}

- (_TtC5Setup51StolenDeviceProtectionExpressSettingDeferredHandler)init
{
  result = (_TtC5Setup51StolenDeviceProtectionExpressSettingDeferredHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
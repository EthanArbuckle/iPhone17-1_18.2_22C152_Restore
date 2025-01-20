@interface _DDWirelessSettingsController
- (_TtC17DeviceDiscoveryUI29_DDWirelessSettingsController)init;
- (void)wirelessSettingsDidChange:(id)a3;
@end

@implementation _DDWirelessSettingsController

- (_TtC17DeviceDiscoveryUI29_DDWirelessSettingsController)init
{
  return (_TtC17DeviceDiscoveryUI29_DDWirelessSettingsController *)sub_24CB7D33C();
}

- (void)wirelessSettingsDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_24CB7D4C8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI29_DDWirelessSettingsController_controller));
  v3 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI29_DDWirelessSettingsController__viewType;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269814FC0);
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end
@interface TerminalBackedDevicesDiscoveryProvider
- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider)init;
- (void)deviceDiscovery:(id)a3 didActivateWithError:(id)a4;
- (void)deviceDiscovery:(id)a3 didEncounterError:(id)a4;
- (void)deviceDiscovery:(id)a3 didLoseDevice:(id)a4;
- (void)deviceDiscovery:(id)a3 hasInvalidated:(id)a4;
@end

@implementation TerminalBackedDevicesDiscoveryProvider

- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider)init
{
  result = (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1000100E8((uint64_t)self+ OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider_discoveryPrimitivesProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider____lazy_storage___delegationQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider_nearbyDeviceDiscoveryObservation));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider__readyToAcceptPIN;
  uint64_t v4 = sub_10000D308(&qword_1000DB540);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider__catSharingDeviceDiscovery));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension38TerminalBackedDevicesDiscoveryProvider_currentPairingDevice));

  swift_unknownObjectRelease();
}

- (void)deviceDiscovery:(id)a3 didActivateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_100093008((uint64_t)a4);
}

- (void)deviceDiscovery:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100093310(v7);
}

- (void)deviceDiscovery:(id)a3 hasInvalidated:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1000935B8((uint64_t)v8, (uint64_t (*)(void))&static os_log_type_t.info.getter, "CATSharingDeviceDiscovery has invalidated with error: %{public}s", (uint64_t)&unk_1000CE8C8, (uint64_t)&unk_1000DB528);
}

- (void)deviceDiscovery:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1000935B8((uint64_t)v8, (uint64_t (*)(void))&static os_log_type_t.error.getter, "CATSharingDeviceDiscovery failed with error: %{public}s", (uint64_t)&unk_1000CE878, (uint64_t)&unk_1000DB500);
}

@end
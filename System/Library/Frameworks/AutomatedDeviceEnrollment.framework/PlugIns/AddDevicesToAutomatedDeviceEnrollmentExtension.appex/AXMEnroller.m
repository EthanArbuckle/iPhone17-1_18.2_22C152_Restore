@interface AXMEnroller
- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller)init;
- (void)dealloc;
- (void)enrollmentOperationDidFinish:(id)a3;
- (void)fetchADEPrerequisitesOperationDidFinish:(id)a3;
@end

@implementation AXMEnroller

- (void)dealloc
{
  sub_10000FF9C((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_requestPerformingProvider), *(void *)&self->requestPerformingProvider[OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_requestPerformingProvider+ 16]);
  v3 = self;
  id v4 = sub_10003D090();
  [v4 invalidate];

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AXMEnroller();
  [(AXMEnroller *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1000100E8((uint64_t)self+ OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_requestPerformingProvider);
  sub_1000100E8((uint64_t)self + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_accountProvider);
  swift_unknownObjectRelease();
  sub_1000100E8((uint64_t)self + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_mdmServerInfoStore);
  swift_unknownObjectRelease();
  sub_1000100E8((uint64_t)self+ OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_currentNetworkPrimitives);
  sub_1000149CC((uint64_t)self + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller_device);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller____lazy_storage___catOperationQueue));

  swift_release();
}

- (void)fetchADEPrerequisitesOperationDidFinish:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100044614(v4);
}

- (void)enrollmentOperationDidFinish:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100046188(v4);
}

- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller)init
{
  result = (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension11AXMEnroller *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
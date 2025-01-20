@interface BuddyProxy
- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension10BuddyProxy)init;
- (void)client:(id)a3 didInterruptWithError:(id)a4;
- (void)clientDidConnect:(id)a3;
- (void)clientDidDisconnect:(id)a3;
@end

@implementation BuddyProxy

- (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension10BuddyProxy)init
{
  result = (_TtC46AddDevicesToAutomatedDeviceEnrollmentExtension10BuddyProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension10BuddyProxy_catSharingTransport));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension10BuddyProxy____lazy_storage___catTaskClient));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC46AddDevicesToAutomatedDeviceEnrollmentExtension10BuddyProxy____lazy_storage___catOperationQueue);
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_10003D3F0();
}

- (void)clientDidConnect:(id)a3
{
}

- (void)clientDidDisconnect:(id)a3
{
}

@end
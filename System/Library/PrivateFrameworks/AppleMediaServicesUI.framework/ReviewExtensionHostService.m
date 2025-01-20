@interface ReviewExtensionHostService
- (_TtC20AppleMediaServicesUI26ReviewExtensionHostService)init;
- (void)cancel;
- (void)dismissWithData:(id)a3 error:(id)a4;
@end

@implementation ReviewExtensionHostService

- (void)cancel
{
  v2 = self;
  sub_21C2990F0();
}

- (void)dismissWithData:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_21C299270(a3, (unint64_t)a4);
}

- (_TtC20AppleMediaServicesUI26ReviewExtensionHostService)init
{
}

- (void).cxx_destruct
{
  sub_21C299A3C((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_hostView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_reviewContext));
  swift_unknownObjectRelease();
  sub_21C207794((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_dismissContinuation, (uint64_t *)&unk_267C7ADD0);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20AppleMediaServicesUI26ReviewExtensionHostService_connection);
}

@end
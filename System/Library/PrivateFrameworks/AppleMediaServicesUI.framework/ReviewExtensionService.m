@interface ReviewExtensionService
- (_TtC20AppleMediaServicesUI22ReviewExtensionService)init;
- (void)loadWith:(id)a3 bagProfile:(id)a4 bagProfileVersion:(id)a5;
@end

@implementation ReviewExtensionService

- (_TtC20AppleMediaServicesUI22ReviewExtensionService)init
{
  return (_TtC20AppleMediaServicesUI22ReviewExtensionService *)ReviewExtensionService.init()();
}

- (void)loadWith:(id)a3 bagProfile:(id)a4 bagProfileVersion:(id)a5
{
  sub_21C2BF2C0();
  sub_21C2BF2C0();
  id v7 = a3;
  v8 = self;
  sub_21C29E85C(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService_xpcConnection));

  sub_21C2A018C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService__state));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService__dialogCoordinator));

  v3 = (char *)self + OBJC_IVAR____TtC20AppleMediaServicesUI22ReviewExtensionService___observationRegistrar;
  uint64_t v4 = sub_21C2BD840();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end
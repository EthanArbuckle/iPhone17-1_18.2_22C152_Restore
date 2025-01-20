@interface DescriptorService
- (_TtC10ChronoCore17DescriptorService)init;
- (void)dealloc;
@end

@implementation DescriptorService

- (void)dealloc
{
  v2 = self;
  sub_1DACB01BC();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_extensionManager);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_userManager, (uint64_t *)&unk_1EBE4CA10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_remoteWidgetDescriptorService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_preferences);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_descriptorCache, &qword_1EBE43AF0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_hostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_intentResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_keybagStateProvider);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_stateCaptureManager, &qword_1EBE4A178);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_taskService);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore17DescriptorService__queue_queryTimer);
}

- (_TtC10ChronoCore17DescriptorService)init
{
  result = (_TtC10ChronoCore17DescriptorService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
@interface TaskActivityScheduler
- (_TtC10ChronoCore21TaskActivityScheduler)init;
- (void)dealloc;
@end

@implementation TaskActivityScheduler

- (void)dealloc
{
  v2 = self;
  sub_1DA9F5CCC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCore21TaskActivityScheduler__schedulingProviderQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore21TaskActivityScheduler__schedulingProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore21TaskActivityScheduler__dataProtectionMonitor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore21TaskActivityScheduler__keybagProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore21TaskActivityScheduler__systemDataMigrator);
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore21TaskActivityScheduler__lock_userManager);

  swift_bridgeObjectRelease();
}

- (_TtC10ChronoCore21TaskActivityScheduler)init
{
  result = (_TtC10ChronoCore21TaskActivityScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
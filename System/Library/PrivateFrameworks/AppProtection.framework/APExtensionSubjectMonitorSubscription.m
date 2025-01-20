@interface APExtensionSubjectMonitorSubscription
- (_TtC13AppProtection37APExtensionSubjectMonitorSubscription)init;
- (void)invalidate;
@end

@implementation APExtensionSubjectMonitorSubscription

- (void)invalidate
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC13AppProtection37APExtensionSubjectMonitorSubscription_registry)
                 + OBJC_IVAR___APExtensionSubjectMonitorRegistry_state);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 28));
  sub_247D74F84((uint64_t *)(v2 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 28));

  swift_release();
}

- (_TtC13AppProtection37APExtensionSubjectMonitorSubscription)init
{
  result = (_TtC13AppProtection37APExtensionSubjectMonitorSubscription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_247D74F30((uint64_t)self + OBJC_IVAR____TtC13AppProtection37APExtensionSubjectMonitorSubscription_monitorRef);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13AppProtection37APExtensionSubjectMonitorSubscription_registry);
}

@end
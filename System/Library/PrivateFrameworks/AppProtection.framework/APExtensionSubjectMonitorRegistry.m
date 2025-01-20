@interface APExtensionSubjectMonitorRegistry
- (APExtensionSubjectMonitorRegistry)init;
- (APExtensionSubjectMonitorRegistry)initWithExtensionSubject:(id)a3;
- (id)addMonitor:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
@end

@implementation APExtensionSubjectMonitorRegistry

- (APExtensionSubjectMonitorRegistry)initWithExtensionSubject:(id)a3
{
  id v3 = a3;
  v4 = (APExtensionSubjectMonitorRegistry *)sub_247D74480(v3);

  return v4;
}

- (void)dealloc
{
  v2 = self;
  sub_247D71930();
}

- (void).cxx_destruct
{
  swift_release();
}

- (id)addMonitor:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APExtensionSubjectMonitorRegistry_state);
  swift_unknownObjectRetain();
  v5 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 28));
  sub_247D74EB8((void *)(v4 + 16), &v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 28));
  v6 = v8;
  swift_unknownObjectRelease();

  swift_release();
  return v6;
}

- (void)resume
{
  v2 = self;
  sub_247D71CF0();
}

- (void)invalidate
{
  v2 = self;
  sub_247D720CC();
}

- (APExtensionSubjectMonitorRegistry)init
{
  result = (APExtensionSubjectMonitorRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
@interface ODINFHardwareMonitor
- (_TtC17CoreODIEssentials20ODINFHardwareMonitor)init;
- (void)hardwareStateDidChange;
@end

@implementation ODINFHardwareMonitor

- (void)hardwareStateDidChange
{
  swift_retain();
  sub_214BFE9EC();
  swift_release();
}

- (_TtC17CoreODIEssentials20ODINFHardwareMonitor)init
{
  swift_defaultActor_initialize();
  v3 = (char *)self + OBJC_IVAR____TtC17CoreODIEssentials20ODINFHardwareMonitor_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26784CD68);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ODINFHardwareMonitor();
  return [(ODINFHardwareMonitor *)&v6 init];
}

@end
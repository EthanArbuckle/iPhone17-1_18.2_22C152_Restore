@interface ProcessMonitor
- (_TtC10ChronoCore14ProcessMonitor)init;
@end

@implementation ProcessMonitor

- (_TtC10ChronoCore14ProcessMonitor)init
{
  result = (_TtC10ChronoCore14ProcessMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__widgetHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__controlHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__extensionManager);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__keepAliveAssertionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__nowPlayingObserver);
  swift_release();
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__lock_nowPlayingApp, &qword_1EBE4BF80);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__lock_processMonitor, &qword_1EBE43318);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore14ProcessMonitor__lock_activityCenter, &qword_1EA8EE508);
}

@end
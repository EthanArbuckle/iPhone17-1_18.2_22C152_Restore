@interface SetupCoordinator
- (_TtC22HomeCaptiveViewService16SetupCoordinator)init;
- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4;
- (void)handleDismissal;
- (void)handleWebNavigationWithCompletionHandler:(id)a3;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
@end

@implementation SetupCoordinator

- (_TtC22HomeCaptiveViewService16SetupCoordinator)init
{
  result = (_TtC22HomeCaptiveViewService16SetupCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  sub_1000055F8((uint64_t)self + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_100008E30();
}

- (void)handleWebNavigationWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000A2C4((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)handleDismissal
{
  v2 = self;
  sub_100009070();
}

- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4
{
}

- (void)proxCardFlowWillPresent
{
  if (qword_100015C20 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000520C(v0, (uint64_t)qword_100015ED0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)v2 = 136315138;
    sub_10000B030(0xD000000000000019, 0x800000010000C8F0, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

@end
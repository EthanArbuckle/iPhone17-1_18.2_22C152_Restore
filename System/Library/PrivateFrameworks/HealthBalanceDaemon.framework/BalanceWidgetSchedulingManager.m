@interface BalanceWidgetSchedulingManager
- (_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager)init;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation BalanceWidgetSchedulingManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)&self->widgetReloader[OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_changeProvider];
  uint64_t v5 = swift_getObjectType();
  v6 = *(void (**)(_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *, _UNKNOWN **, uint64_t, uint64_t))(v4 + 16);
  v7 = self;
  swift_unknownObjectRetain();
  v6(v7, &off_2701F0768, v5, v4);
  swift_unknownObjectRelease();

  v8.receiver = v7;
  v8.super_class = ObjectType;
  [(BalanceWidgetSchedulingManager *)&v8 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_widgetReloader);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_queue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_reloadOperation));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager_didBecomeReady);
  sub_250EAB9CC(v3);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_250EC62B8(v4);
}

- (_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager)init
{
  result = (_TtC19HealthBalanceDaemon30BalanceWidgetSchedulingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
@interface HealthAppOrchestrationListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14HealthPlatform30HealthAppOrchestrationListener)init;
@end

@implementation HealthAppOrchestrationListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1C2610A14(v7);

  return v9 & 1;
}

- (_TtC14HealthPlatform30HealthAppOrchestrationListener)init
{
  result = (_TtC14HealthPlatform30HealthAppOrchestrationListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_listener));
  sub_1C273ADE8((uint64_t)self + OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_coordinator);

  swift_release();
}

@end
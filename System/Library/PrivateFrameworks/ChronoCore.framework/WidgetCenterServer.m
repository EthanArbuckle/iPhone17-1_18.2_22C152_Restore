@interface WidgetCenterServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10ChronoCore18WidgetCenterServer)init;
@end

@implementation WidgetCenterServer

- (_TtC10ChronoCore18WidgetCenterServer)init
{
  result = (_TtC10ChronoCore18WidgetCenterServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__extensionManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__descriptorService);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__widgetRelevanceService, &qword_1EBE484A0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1DABBD7CC(v7);

  return v9 & 1;
}

@end
@interface ChronoServicesServer
- (_TtC10ChronoCore20ChronoServicesServer)init;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation ChronoServicesServer

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_connectionListener);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ChronoServicesServer();
  [(ChronoServicesServer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_taskService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_descriptorService);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_deviceService, qword_1EBE49300);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_extensionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_widgetHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_keybagStateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_powerlogSuggestionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_keepAliveAssertionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_duetService);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_stuckPairedRelationshipRepairer, &qword_1EBE487E0);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_widgetRelevanceService, &qword_1EBE484A0);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_remoteActivityLaunchService, &qword_1EBE48570);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_activityService, &qword_1EBE4D0B8);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_iconStore, &qword_1EBE4BEA8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (_TtC10ChronoCore20ChronoServicesServer)init
{
  result = (_TtC10ChronoCore20ChronoServicesServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1DAB5AE20(v8);

  swift_unknownObjectRelease();
}

@end
@interface DBInstrumentClusterLayoutCoordinator
- (_TtC9DashBoard36DBInstrumentClusterLayoutCoordinator)init;
- (void)service:(id)a3 didReceiveLayerMetadata:(id)a4;
@end

@implementation DBInstrumentClusterLayoutCoordinator

- (_TtC9DashBoard36DBInstrumentClusterLayoutCoordinator)init
{
  result = (_TtC9DashBoard36DBInstrumentClusterLayoutCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9DashBoard36DBInstrumentClusterLayoutCoordinator_uisyncSession));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9DashBoard36DBInstrumentClusterLayoutCoordinator__readyToTransitionLayout;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268589998);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)service:(id)a3 didReceiveLayerMetadata:(id)a4
{
  uint64_t v6 = sub_22D85E458();
  id v7 = a3;
  v8 = self;
  sub_22D84C840(v6);

  swift_bridgeObjectRelease();
}

@end
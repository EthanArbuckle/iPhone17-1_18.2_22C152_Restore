@interface DBDefaultUISyncSessionCommandHandler
- (DBUISyncCommandObserving)commandObserver;
- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)init;
- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)initWithUISyncSession:(id)a3;
- (void)didReceiveData:(id)a3;
- (void)setCommandObserver:(id)a3;
@end

@implementation DBDefaultUISyncSessionCommandHandler

- (DBUISyncCommandObserving)commandObserver
{
  v2 = (char *)self + OBJC_IVAR____TtC9DashBoard36DBDefaultUISyncSessionCommandHandler_commandObserver;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230F8D710](v2);
  return (DBUISyncCommandObserving *)v3;
}

- (void)setCommandObserver:(id)a3
{
}

- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)initWithUISyncSession:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard36DBDefaultUISyncSessionCommandHandler_uisyncSession) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DBDefaultUISyncSessionCommandHandler();
  id v5 = a3;
  return [(DBDefaultUISyncSessionCommandHandler *)&v7 init];
}

- (void)didReceiveData:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = sub_22D85CCF8();
  unint64_t v7 = v6;

  DBDefaultUISyncSessionCommandHandler.didReceiveData(_:)(v5, v7);
  sub_22D7E8078(v5, v7);
}

- (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler)init
{
  result = (_TtC9DashBoard36DBDefaultUISyncSessionCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22D7C465C((uint64_t)self + OBJC_IVAR____TtC9DashBoard36DBDefaultUISyncSessionCommandHandler_commandObserver);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9DashBoard36DBDefaultUISyncSessionCommandHandler_uisyncSession);
}

@end
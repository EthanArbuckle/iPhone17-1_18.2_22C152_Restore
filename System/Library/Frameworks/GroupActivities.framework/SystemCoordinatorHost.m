@interface SystemCoordinatorHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15GroupActivities21SystemCoordinatorHost)init;
- (void)dealloc;
@end

@implementation SystemCoordinatorHost

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_listener);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(SystemCoordinatorHost *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  outlined destroy of weak SystemCoordinatorHostDelegate?((uint64_t)self + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_delegate);
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_connection);
}

- (_TtC15GroupActivities21SystemCoordinatorHost)init
{
  result = (_TtC15GroupActivities21SystemCoordinatorHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = specialized SystemCoordinatorHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9;
}

@end
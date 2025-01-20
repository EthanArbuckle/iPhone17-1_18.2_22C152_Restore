@interface SkannerDatabaseSession
- (SQLiteConnection)connection;
- (_TtC9appstored22SkannerDatabaseSession)init;
- (_TtC9appstored22SkannerDatabaseSession)initWithConnection:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation SkannerDatabaseSession

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9appstored22SkannerDatabaseSession_connection));
}

- (void)setConnection:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored22SkannerDatabaseSession_connection);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored22SkannerDatabaseSession_connection) = (Class)a3;
  id v3 = a3;
}

- (_TtC9appstored22SkannerDatabaseSession)initWithConnection:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored22SkannerDatabaseSession_connection) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SkannerDatabaseSession();
  id v4 = a3;
  return [(SkannerDatabaseSession *)&v6 init];
}

- (_TtC9appstored22SkannerDatabaseSession)init
{
  result = (_TtC9appstored22SkannerDatabaseSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
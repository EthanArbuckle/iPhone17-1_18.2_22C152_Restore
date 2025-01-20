@interface SkannerDatabaseTransaction
- (_TtC9appstored26SkannerDatabaseTransaction)initWithConnection:(id)a3;
@end

@implementation SkannerDatabaseTransaction

- (_TtC9appstored26SkannerDatabaseTransaction)initWithConnection:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored22SkannerDatabaseSession_connection) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SkannerDatabaseSession();
  id v4 = a3;
  return [(SkannerDatabaseSession *)&v6 init];
}

@end
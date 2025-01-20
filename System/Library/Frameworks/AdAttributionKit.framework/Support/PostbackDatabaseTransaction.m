@interface PostbackDatabaseTransaction
- (_TtC20AttributionKitDaemon27PostbackDatabaseTransaction)init;
- (_TtC20AttributionKitDaemon27PostbackDatabaseTransaction)initWithConnection:(id)a3;
@end

@implementation PostbackDatabaseTransaction

- (_TtC20AttributionKitDaemon27PostbackDatabaseTransaction)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PostbackDatabaseSession *)&v3 init];
}

- (_TtC20AttributionKitDaemon27PostbackDatabaseTransaction)initWithConnection:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(PostbackDatabaseSession *)&v5 initWithConnection:a3];
}

@end
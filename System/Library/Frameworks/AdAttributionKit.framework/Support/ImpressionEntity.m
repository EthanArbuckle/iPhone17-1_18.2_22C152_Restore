@interface ImpressionEntity
+ (id)databaseTable;
- (_TtC20AttributionKitDaemon16ImpressionEntity)init;
- (_TtC20AttributionKitDaemon16ImpressionEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC20AttributionKitDaemon16ImpressionEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation ImpressionEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtC20AttributionKitDaemon16ImpressionEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  return (_TtC20AttributionKitDaemon16ImpressionEntity *)sub_1000C3F78(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for ImpressionEntity);
}

- (_TtC20AttributionKitDaemon16ImpressionEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC20AttributionKitDaemon16ImpressionEntity *)sub_1000C4068(self, (uint64_t)a2, a3, (uint64_t)a4, type metadata accessor for ImpressionEntity);
}

- (_TtC20AttributionKitDaemon16ImpressionEntity)init
{
  return (_TtC20AttributionKitDaemon16ImpressionEntity *)sub_1000C40DC(self, (uint64_t)a2, type metadata accessor for ImpressionEntity);
}

@end
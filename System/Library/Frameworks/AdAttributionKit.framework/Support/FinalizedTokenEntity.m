@interface FinalizedTokenEntity
+ (id)databaseTable;
- (_TtC20AttributionKitDaemon20FinalizedTokenEntity)init;
- (_TtC20AttributionKitDaemon20FinalizedTokenEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC20AttributionKitDaemon20FinalizedTokenEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation FinalizedTokenEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtC20AttributionKitDaemon20FinalizedTokenEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FinalizedTokenEntity();
  v8 = [(SQLiteEntity *)&v10 initWithPropertyValues:isa onConnection:v6];

  return v8;
}

- (_TtC20AttributionKitDaemon20FinalizedTokenEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FinalizedTokenEntity();
  return [(SQLiteEntity *)&v7 initWithPersistentID:a3 onConnection:a4];
}

- (_TtC20AttributionKitDaemon20FinalizedTokenEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FinalizedTokenEntity();
  return [(FinalizedTokenEntity *)&v3 init];
}

@end
@interface GhostbackEntity
+ (id)databaseTable;
- (_TtC20AttributionKitDaemon15GhostbackEntity)init;
- (_TtC20AttributionKitDaemon15GhostbackEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC20AttributionKitDaemon15GhostbackEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation GhostbackEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtC20AttributionKitDaemon15GhostbackEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for GhostbackEntity();
  v8 = [(SQLiteEntity *)&v10 initWithPropertyValues:isa onConnection:v6];

  return v8;
}

- (_TtC20AttributionKitDaemon15GhostbackEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for GhostbackEntity();
  return [(SQLiteEntity *)&v7 initWithPersistentID:a3 onConnection:a4];
}

- (_TtC20AttributionKitDaemon15GhostbackEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GhostbackEntity();
  return [(GhostbackEntity *)&v3 init];
}

@end
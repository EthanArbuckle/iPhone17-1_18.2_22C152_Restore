@interface SoloEventEntity
+ (id)databaseTable;
- (_TtC20AttributionKitDaemon15SoloEventEntity)init;
- (_TtC20AttributionKitDaemon15SoloEventEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC20AttributionKitDaemon15SoloEventEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation SoloEventEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtC20AttributionKitDaemon15SoloEventEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SoloEventEntity();
  v8 = [(SQLiteEntity *)&v10 initWithPropertyValues:isa onConnection:v6];

  return v8;
}

- (_TtC20AttributionKitDaemon15SoloEventEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SoloEventEntity();
  return [(SQLiteEntity *)&v7 initWithPersistentID:a3 onConnection:a4];
}

- (_TtC20AttributionKitDaemon15SoloEventEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SoloEventEntity();
  return [(SoloEventEntity *)&v3 init];
}

@end
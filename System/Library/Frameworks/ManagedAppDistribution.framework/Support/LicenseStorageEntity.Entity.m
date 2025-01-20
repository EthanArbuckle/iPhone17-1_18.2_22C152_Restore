@interface LicenseStorageEntity.Entity
+ (id)databaseTable;
- (_TtCV28ManagedAppDistributionDaemon20LicenseStorageEntity6Entity)init;
- (_TtCV28ManagedAppDistributionDaemon20LicenseStorageEntity6Entity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtCV28ManagedAppDistributionDaemon20LicenseStorageEntity6Entity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation LicenseStorageEntity.Entity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtCV28ManagedAppDistributionDaemon20LicenseStorageEntity6Entity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LicenseStorageEntity.Entity();
  return [(ASUSQLiteEntity *)&v7 initWithPersistentID:a3 onConnection:a4];
}

- (_TtCV28ManagedAppDistributionDaemon20LicenseStorageEntity6Entity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LicenseStorageEntity.Entity();
  v8 = [(ASUSQLiteEntity *)&v10 initWithPropertyValues:isa onConnection:v6];

  return v8;
}

- (_TtCV28ManagedAppDistributionDaemon20LicenseStorageEntity6Entity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LicenseStorageEntity.Entity();
  return [(LicenseStorageEntity.Entity *)&v3 init];
}

@end
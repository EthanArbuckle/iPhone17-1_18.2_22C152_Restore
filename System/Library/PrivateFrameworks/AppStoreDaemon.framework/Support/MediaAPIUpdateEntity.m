@interface MediaAPIUpdateEntity
+ (Class)memoryEntityClass;
+ (NSString)BOOLeanPropertyMaskKey;
+ (NSString)bundleIDPropertyKey;
+ (NSString)installDatePropertyKey;
+ (NSString)itemIDPropertyKey;
+ (NSString)metadataPropertyKey;
+ (NSString)updateStatePropertyKey;
+ (id)databaseTable;
- (_TtC9appstored20MediaAPIUpdateEntity)init;
- (_TtC9appstored20MediaAPIUpdateEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9appstored20MediaAPIUpdateEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation MediaAPIUpdateEntity

+ (id)databaseTable
{
  NSString v2 = String._bridgeToObjectiveC()();
  return v2;
}

+ (NSString)BOOLeanPropertyMaskKey
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)bundleIDPropertyKey
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)installDatePropertyKey
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)itemIDPropertyKey
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)metadataPropertyKey
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (NSString)updateStatePropertyKey
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

+ (Class)memoryEntityClass
{
  type metadata accessor for MediaAPIUpdate();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9appstored20MediaAPIUpdateEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MediaAPIUpdateEntity();
  v8 = [(SQLiteEntity *)&v10 initWithPropertyValues:isa onConnection:v6];

  return v8;
}

- (_TtC9appstored20MediaAPIUpdateEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MediaAPIUpdateEntity();
  return [(SQLiteEntity *)&v7 initWithPersistentID:a3 onConnection:a4];
}

- (_TtC9appstored20MediaAPIUpdateEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaAPIUpdateEntity();
  return [(MediaAPIUpdateEntity *)&v3 init];
}

@end
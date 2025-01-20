@interface BMDatabaseInitializer
+ (BOOL)initializeSQLDatabaseWithIdentifier:(id)a3;
+ (id)viewSubscribedStreams;
- (_TtC12BiomeStreams21BMDatabaseInitializer)init;
@end

@implementation BMDatabaseInitializer

+ (BOOL)initializeSQLDatabaseWithIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  char v5 = static BMDatabaseInitializer.initializeSQLDatabase(identifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (id)viewSubscribedStreams
{
  static BMDatabaseInitializer.viewSubscribedStreams()();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (_TtC12BiomeStreams21BMDatabaseInitializer)init
{
  return (_TtC12BiomeStreams21BMDatabaseInitializer *)BMDatabaseInitializer.init()();
}

@end
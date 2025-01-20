@interface PurchaseIntentEntity
+ (id)databaseTable;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)init;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation PurchaseIntentEntity

+ (id)databaseTable
{
  swift_getObjCClassMetadata();
  sub_100012528();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity *)sub_1000EFC54(v5, a4);
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity *)sub_1000EFD50(a3, a4);
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity)init
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B20PurchaseIntentEntity *)sub_1000EFDE8((uint64_t (*)(void))type metadata accessor for PurchaseIntentEntity);
}

@end
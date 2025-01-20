@interface StorefrontEntity
+ (id)databaseTable;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)init;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation StorefrontEntity

+ (id)databaseTable
{
  swift_getObjCClassMetadata();
  sub_10017F660();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity *)sub_10017F760(v5, a4);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity *)sub_10017F85C(a3, a4);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity)init
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D16StorefrontEntity *)sub_10017F8F4(0, type metadata accessor for StorefrontEntity);
}

@end
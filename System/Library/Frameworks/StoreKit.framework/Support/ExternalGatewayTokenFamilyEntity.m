@interface ExternalGatewayTokenFamilyEntity
+ (id)databaseTable;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)init;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation ExternalGatewayTokenFamilyEntity

+ (id)databaseTable
{
  swift_getObjCClassMetadata();
  sub_100102070();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity *)sub_1001028F0(v5, a4);
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity *)sub_1001029FC(a3, a4);
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity)init
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD32ExternalGatewayTokenFamilyEntity *)sub_100102A94();
}

@end
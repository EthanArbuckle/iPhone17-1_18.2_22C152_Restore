@interface ExternalGatewayTokenFamilyStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)init;
- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)initWithDatabase:(id)a3;
@end

@implementation ExternalGatewayTokenFamilyStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  swift_getObjCClassMetadata();
  id v2 = sub_10010224C();

  return (SQLiteDatabaseStoreDescriptor *)v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  char v5 = sub_100102320(v4);

  return v5 & 1;
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)initWithDatabase:(id)a3
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore *)sub_1001027D8(a3);
}

- (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore)init
{
  return (_TtC9storekitdP33_A0B67E5E835CE5C4351F500DE01F7FFD31ExternalGatewayTokenFamilyStore *)sub_100102A94();
}

@end
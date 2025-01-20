@interface StorefrontStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)init;
- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)initWithDatabase:(id)a3;
@end

@implementation StorefrontStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  swift_getObjCClassMetadata();
  id v2 = sub_10017F020();

  return (SQLiteDatabaseStoreDescriptor *)v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  char v5 = sub_10017F0F4(v4);

  return v5 & 1;
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)initWithDatabase:(id)a3
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore *)sub_10017F564(a3);
}

- (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore)init
{
  return (_TtC9storekitdP33_AF6EE5E6A32790C1A1159F4A44E8152D15StorefrontStore *)sub_10017F8F4(0, type metadata accessor for StorefrontStore);
}

@end
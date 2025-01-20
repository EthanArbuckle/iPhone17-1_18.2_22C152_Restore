@interface PurchaseIntentStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)init;
- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)initWithDatabase:(id)a3;
@end

@implementation PurchaseIntentStore

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)initWithDatabase:(id)a3
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore *)sub_100005BEC(a3);
}

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  swift_getObjCClassMetadata();
  id v2 = sub_10000A628();

  return (SQLiteDatabaseStoreDescriptor *)v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  char v5 = sub_1000EF318(v4);

  return v5 & 1;
}

- (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore)init
{
  return (_TtC9storekitdP33_E619F6C7E2B7960B25E94D759ACE384B19PurchaseIntentStore *)sub_1000EFDE8((uint64_t (*)(void))type metadata accessor for PurchaseIntentStore);
}

@end
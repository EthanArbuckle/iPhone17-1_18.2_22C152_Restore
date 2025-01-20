@interface DatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (_TtC25ASOctaneSupportXPCService13DatabaseStore)init;
- (_TtC25ASOctaneSupportXPCService13DatabaseStore)initWithDatabase:(id)a3;
@end

@implementation DatabaseStore

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  id v2 = sub_100206814();
  return (SQLiteDatabaseStoreDescriptor *)v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  char v5 = sub_100206CB0(v4);

  return v5 & 1;
}

- (_TtC25ASOctaneSupportXPCService13DatabaseStore)initWithDatabase:(id)a3
{
  return (_TtC25ASOctaneSupportXPCService13DatabaseStore *)sub_10020B764(a3);
}

- (_TtC25ASOctaneSupportXPCService13DatabaseStore)init
{
  return (_TtC25ASOctaneSupportXPCService13DatabaseStore *)sub_10020B7DC();
}

@end
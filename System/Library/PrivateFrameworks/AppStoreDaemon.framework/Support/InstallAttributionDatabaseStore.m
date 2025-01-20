@interface InstallAttributionDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation InstallAttributionDatabaseStore

+ (id)storeDescriptor
{
  v2 = [SQLiteDatabaseStoreDescriptor alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000088C8(v2, @"install_attribution", &off_10054DE00, v3, v4);
  return v5;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_100282DB0((uint64_t)a3, 18000, &stru_1005249A0, 0);
  }
  else {
    return 0;
  }
}

@end
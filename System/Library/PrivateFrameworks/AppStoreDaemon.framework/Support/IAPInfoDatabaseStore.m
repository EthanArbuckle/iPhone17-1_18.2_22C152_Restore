@interface IAPInfoDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation IAPInfoDatabaseStore

+ (id)storeDescriptor
{
  v2 = [SQLiteDatabaseStoreDescriptor alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000088C8(v2, @"iap_info", &off_10054DDA0, v3, v4);
  return v5;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_100282DB0((uint64_t)a3, 13003, &stru_100523BD0, 0);
  }
  else {
    return 0;
  }
}

@end
@interface ODRDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
- (void)modifyUsingTransaction:(id)a3;
@end

@implementation ODRDatabaseStore

+ (id)storeDescriptor
{
  v2 = [SQLiteDatabaseStoreDescriptor alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000088C8(v2, @"on_demand_resources", &off_10054DD70, v3, v4);
  return v5;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_100282DB0((uint64_t)a3, 14000, &stru_100522F48, 0);
  }
  else {
    return 0;
  }
}

- (void)modifyUsingTransaction:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002396A4;
  v6[3] = &unk_100522F70;
  id v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ODRDatabaseStore;
  id v4 = v7;
  [(SQLiteDatabaseStore *)&v5 modifyUsingTransaction:v6];
}

@end
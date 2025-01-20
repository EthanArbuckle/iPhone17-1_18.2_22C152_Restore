@interface TestFlightFeedbackDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation TestFlightFeedbackDatabaseStore

+ (id)storeDescriptor
{
  v2 = [SQLiteDatabaseStoreDescriptor alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000088C8(v2, @"testflight_feedback", &off_10054DDB8, v3, v4);
  return v5;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_100282DB0((uint64_t)a3, 15001, &stru_100524298, 0);
  }
  else {
    return 0;
  }
}

@end
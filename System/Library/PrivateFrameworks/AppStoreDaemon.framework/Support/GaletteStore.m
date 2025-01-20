@interface GaletteStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)shared;
+ (id)storeDescriptor;
@end

@implementation GaletteStore

+ (id)shared
{
  if (qword_1005B0E00 != -1) {
    dispatch_once(&qword_1005B0E00, &stru_100526180);
  }
  v2 = (void *)qword_1005B0DF8;
  return v2;
}

+ (id)storeDescriptor
{
  v2 = [SQLiteDatabaseStoreDescriptor alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000088C8(v2, @"galette", &off_10054DE60, v3, v4);
  return v5;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  if (a3) {
    return sub_100282DB0((uint64_t)a3, 15500, &stru_1005261A0, 0);
  }
  else {
    return 0;
  }
}

@end
@interface AppInstallsDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)activeInstallForBundleID:(id)a3;
+ (id)storeDescriptor;
- (void)modifyUsingTransaction:(id)a3;
- (void)readUsingSession:(id)a3;
@end

@implementation AppInstallsDatabaseStore

+ (id)activeInstallForBundleID:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (void *)sub_100050E1C(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)storeDescriptor
{
  v2 = [SQLiteDatabaseStoreDescriptor alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = sub_1000088C8(v2, @"app_installs", &off_10054E0A0, v3, v4);
  return v5;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  return sub_100408E2C((uint64_t)AppInstallsDatabaseSchema, a3);
}

- (void)modifyUsingTransaction:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003E0DB8;
  v5[3] = &unk_10052C560;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)AppInstallsDatabaseStore;
  id v3 = v7;
  [(SQLiteDatabaseStore *)&v4 modifyUsingTransaction:v5];
}

- (void)readUsingSession:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003E1C6C;
  v6[3] = &unk_10052C588;
  id v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AppInstallsDatabaseStore;
  id v4 = v7;
  [(SQLiteDatabaseStore *)&v5 readUsingSession:v6];
}

@end
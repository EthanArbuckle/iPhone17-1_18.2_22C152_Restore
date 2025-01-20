@interface SQLiteDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (SQLiteDatabaseStoreDescriptor)storeDescriptor;
- (SQLiteDatabase)database;
- (SQLiteDatabaseStore)initWithDatabase:(id)a3;
- (void)modifyUsingTransaction:(id)a3;
- (void)modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4;
- (void)readUsingSession:(id)a3;
@end

@implementation SQLiteDatabaseStore

- (SQLiteDatabaseStore)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteDatabaseStore;
  v6 = [(SQLiteDatabaseStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)readUsingSession:(id)a3
{
}

+ (SQLiteDatabaseStoreDescriptor)storeDescriptor
{
  v2 = objc_alloc_init(SQLiteDatabaseStoreDescriptor);

  return v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  return 1;
}

- (void)modifyUsingTransaction:(id)a3
{
}

- (void)modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4
{
}

- (SQLiteDatabase)database
{
  return (SQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

@end
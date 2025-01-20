@interface InAppPromotionDatabaseStore
+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3;
+ (id)storeDescriptor;
@end

@implementation InAppPromotionDatabaseStore

+ (id)storeDescriptor
{
  v2 = objc_alloc_init(SQLiteDatabaseStoreDescriptor);
  [(SQLiteDatabaseStoreDescriptor *)v2 setSchemaName:@"storekit_promotions"];
  [(SQLiteDatabaseStoreDescriptor *)v2 setSessionClass:objc_opt_class()];
  [(SQLiteDatabaseStoreDescriptor *)v2 setTransactionClass:objc_opt_class()];

  return v2;
}

+ (BOOL)createOrMigrateStoreUsingSchema:(id)a3
{
  id v3 = a3;
  if ((uint64_t)[v3 currentSchemaVersion] > 14499)
  {
LABEL_9:
    BOOL v5 = 1;
    goto LABEL_15;
  }
  while (1)
  {
    id v4 = [v3 currentSchemaVersion];
    if (v4 == (id)14500) {
      goto LABEL_8;
    }
    if (v4 != (id)14000) {
      break;
    }
    if (![v3 migrateToVersion:14500 usingBlock:&stru_100359D08]) {
      goto LABEL_14;
    }
LABEL_8:
    if ((uint64_t)[v3 currentSchemaVersion] > 14499) {
      goto LABEL_9;
    }
  }
  if (!v4)
  {
    if (([v3 migrateToVersion:14500 usingBlock:&stru_100359CE8] & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  if (qword_1003A0210 != -1) {
    dispatch_once(&qword_1003A0210, &stru_100359D28);
  }
  v6 = (void *)qword_1003A01F8;
  if (os_log_type_enabled((os_log_t)qword_1003A01F8, OS_LOG_TYPE_ERROR)) {
    sub_1002C9310(v6, v3);
  }
LABEL_14:
  BOOL v5 = 0;
LABEL_15:

  return v5;
}

@end
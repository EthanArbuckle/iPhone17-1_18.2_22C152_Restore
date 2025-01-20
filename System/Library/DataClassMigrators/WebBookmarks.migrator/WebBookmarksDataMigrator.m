@interface WebBookmarksDataMigrator
- (BOOL)performMigration;
- (id)dataClassName;
@end

@implementation WebBookmarksDataMigrator

- (id)dataClassName
{
  return @"WebBookmarks";
}

- (BOOL)performMigration
{
  if (qword_C008 != -1) {
    dispatch_once(&qword_C008, &stru_4098);
  }
  v3 = qword_C000;
  if (os_log_type_enabled((os_log_t)qword_C000, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Starting WebBookmarks DataMigration", buf, 2u);
  }
  if (([(WebBookmarksDataMigrator *)self didUpgrade] & 1) != 0
    || ([(WebBookmarksDataMigrator *)self didRestoreFromBackup] & 1) != 0
    || [(WebBookmarksDataMigrator *)self didMigrateBackupFromDifferentDevice])
  {
    if (qword_C008 != -1) {
      dispatch_once(&qword_C008, &stru_4098);
    }
    v4 = qword_C000;
    if (os_log_type_enabled((os_log_t)qword_C000, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Scheduling bookmarks database maintenance", v16, 2u);
    }
    id v5 = objc_alloc_init((Class)WebBookmarksSettingsGateway);
    [v5 scheduleBookmarksDatabaseMaintenance];
    [v5 scheduleBookmarksDatabaseMigrationTask];
    [v5 scheduleHSTSSuperCookieCleanup];
    id v6 = objc_alloc((Class)WebBookmarkCollection);
    v7 = +[WBCollectionConfiguration safariBookmarkCollectionConfiguration];
    id v8 = [v6 initWithConfiguration:v7];

    if (v8)
    {
      if (qword_C008 != -1) {
        dispatch_once(&qword_C008, &stru_4098);
      }
      v9 = qword_C000;
      if (os_log_type_enabled((os_log_t)qword_C000, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Finished migrating bookmark collection", v15, 2u);
      }
    }
  }
  else
  {
    if (qword_C008 != -1) {
      dispatch_once(&qword_C008, &stru_4098);
    }
    v12 = qword_C000;
    if (os_log_type_enabled((os_log_t)qword_C000, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "No need to schedule bookmarks database maintenance for clean install", v14, 2u);
    }
  }
  if (qword_C008 != -1) {
    dispatch_once(&qword_C008, &stru_4098);
  }
  v10 = qword_C000;
  if (os_log_type_enabled((os_log_t)qword_C000, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Successfully completed WebBookmarks database maintenance tasks. Migration is successful", v13, 2u);
  }
  return 1;
}

@end
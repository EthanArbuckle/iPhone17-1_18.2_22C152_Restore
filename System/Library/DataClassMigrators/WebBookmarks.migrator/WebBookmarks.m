void sub_382C(id a1)
{
  uint64_t vars8;

  qword_C000 = (uint64_t)os_log_create("com.apple.WebBookmarks", "DataMigration");

  _objc_release_x1();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return [a1 didUpgrade];
}

id objc_msgSend_safariBookmarkCollectionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 safariBookmarkCollectionConfiguration];
}

id objc_msgSend_scheduleBookmarksDatabaseMaintenance(void *a1, const char *a2, ...)
{
  return [a1 scheduleBookmarksDatabaseMaintenance];
}

id objc_msgSend_scheduleBookmarksDatabaseMigrationTask(void *a1, const char *a2, ...)
{
  return [a1 scheduleBookmarksDatabaseMigrationTask];
}

id objc_msgSend_scheduleHSTSSuperCookieCleanup(void *a1, const char *a2, ...)
{
  return [a1 scheduleHSTSSuperCookieCleanup];
}
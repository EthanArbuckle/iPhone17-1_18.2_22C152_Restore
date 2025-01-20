void sub_3BF8(id a1, NSError *a2)
{
  _DMLogFunc();
}

uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}
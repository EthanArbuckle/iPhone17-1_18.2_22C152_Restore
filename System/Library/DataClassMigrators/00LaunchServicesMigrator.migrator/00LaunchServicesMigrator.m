void sub_349C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Returning migration failed. Please include the all of your /var/mobile/Library/Caches/com.apple.LaunchServices-* files, the contents of /var/mobile/Library/Logs/MobileInstallation and /var/Mobile/Library/Logs/DataMigration in a bug report.", v1, 2u);
}

uint64_t _LSDefaultLog()
{
  return __LSDefaultLog();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__LSPrivateDatabaseNeedsRebuild(void *a1, const char *a2, ...)
{
  return [a1 _LSPrivateDatabaseNeedsRebuild];
}

id objc_msgSend__LSPrivateNoteMigratorRunning(void *a1, const char *a2, ...)
{
  return [a1 _LSPrivateNoteMigratorRunning];
}

id objc_msgSend__LSPrivateRemovedSystemAppIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _LSPrivateRemovedSystemAppIdentifiers];
}

id objc_msgSend__LSPrivateUpdateAppRemovalRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _LSPrivateUpdateAppRemovalRestrictions];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_populateLSDatabase(void *a1, const char *a2, ...)
{
  return [a1 populateLSDatabase];
}

id objc_msgSend_removeAppRemovalRestrictionForTVOnUpgradeIfInstalled(void *a1, const char *a2, ...)
{
  return [a1 removeAppRemovalRestrictionForTVOnUpgradeIfInstalled];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}
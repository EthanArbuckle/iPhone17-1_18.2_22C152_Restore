uint64_t _SecKeychainForceUpgradeIfNeeded()
{
  return __SecKeychainForceUpgradeIfNeeded();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}
_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      v9 = 67109376;
      v10 = 0;
      v11 = 1024;
      v12 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping keychain migration erase:%d upgrade:%d", (uint8_t *)&v9, 0xEu);
    }
    return 1;
  }
  if (v4)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Performing keychain migration", (uint8_t *)&v9, 2u);
  }
  v5 = _SecKeychainForceUpgradeIfNeeded();
  if (!v5) {
    return 1;
  }
  v6 = v5;
  v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    v9 = 67109120;
    v10 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to perform keychain migration: %d", (uint8_t *)&v9, 8u);
    return 0;
  }
  return result;
}

@end
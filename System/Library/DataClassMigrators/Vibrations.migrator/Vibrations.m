uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_msgSend__migrateLegacySettings(void *a1, const char *a2, ...)
{
  return [a1 _migrateLegacySettings];
}
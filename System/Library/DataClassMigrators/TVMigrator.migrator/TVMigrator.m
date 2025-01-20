uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}
)performMigration
{
  notify_post((const char *)[@"com.apple.videos.migrationCompleted" UTF8String]);
  return 1;
}

@end
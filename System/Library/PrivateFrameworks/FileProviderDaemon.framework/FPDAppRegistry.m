@interface FPDAppRegistry
+ (BOOL)keepInSync;
- (void)addApps:(id)a3;
- (void)removeAppsWithBundleIDs:(id)a3;
@end

@implementation FPDAppRegistry

+ (BOOL)keepInSync
{
  return 0;
}

- (void)addApps:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPDAppRegistry;
  [(FPAppRegistry *)&v7 addApps:v4];
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDAppRegistry addApps:](v4);
  }

  objc_msgSend((id)*MEMORY[0x1E4F25960], "fp_libnotifyPerUserNotificationName");
  id v6 = objc_claimAutoreleasedReturnValue();
  notify_post((const char *)[v6 UTF8String]);
}

- (void)removeAppsWithBundleIDs:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPDAppRegistry;
  [(FPAppRegistry *)&v7 removeAppsWithBundleIDs:v4];
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPDAppRegistry removeAppsWithBundleIDs:](v4);
  }

  objc_msgSend((id)*MEMORY[0x1E4F25960], "fp_libnotifyPerUserNotificationName");
  id v6 = objc_claimAutoreleasedReturnValue();
  notify_post((const char *)[v6 UTF8String]);
}

- (void)addApps:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v1, v2, "[DEBUG] posting %@ for %lu apps", v3, v4, v5, v6, v7);
}

- (void)removeAppsWithBundleIDs:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_6(&dword_1D744C000, v1, v2, "[DEBUG] posting %@ for removal of %lu apps", v3, v4, v5, v6, v7);
}

@end
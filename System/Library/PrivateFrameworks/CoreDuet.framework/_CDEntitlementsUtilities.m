@interface _CDEntitlementsUtilities
+ (id)entitlementValueForKey:(id)a3;
@end

@implementation _CDEntitlementsUtilities

+ (id)entitlementValueForKey:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    CFErrorRef error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[_CDEntitlementsUtilities entitlementValueForKey:]((uint64_t)v3, (uint64_t *)&error);
      }
      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_CDEntitlementsUtilities entitlementValueForKey:]();
    }
    v6 = 0;
  }

  return v6;
}

+ (void)entitlementValueForKey:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create security task", v0, 2u);
}

+ (void)entitlementValueForKey:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a2;
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get entitlement '%@': %@", (uint8_t *)&v3, 0x16u);
}

@end
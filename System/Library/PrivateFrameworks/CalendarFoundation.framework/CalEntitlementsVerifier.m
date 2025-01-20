@interface CalEntitlementsVerifier
+ (BOOL)currentProcessHasAllowSuggestionsEntitlement;
+ (BOOL)currentProcessHasBirthdayModificationEntitlement;
+ (BOOL)currentProcessHasBooleanEntitlement:(id)a3;
+ (BOOL)currentProcessHasCalendarToolEntitlement;
+ (BOOL)currentProcessHasLocationdEffectiveBundleEntitlement;
+ (BOOL)currentProcessHasSyncClientEntitlement;
+ (BOOL)currentProcessHasTestingEntitlement;
+ (BOOL)currentProcessHasWatchOSMutableDatabaseEntitlement;
+ (BOOL)currentProcessIsAutomator;
+ (BOOL)currentProcessIsCalendarDaemon;
+ (BOOL)currentProcessIsDataAccess;
+ (BOOL)currentProcessIsFirstPartyApp;
+ (BOOL)currentProcessIsFirstPartyCalendarApp;
+ (BOOL)currentProcessIsPreferences;
+ (BOOL)currentProcessUsesInProcessEventStores;
+ (id)_currentProcessValueForEntitlement:(id)a3 loadBlock:(id)a4;
+ (id)currentProcessGetArrayOfStringsEntitlement:(id)a3;
+ (id)currentProcessGetStringEntitlement:(id)a3;
@end

@implementation CalEntitlementsVerifier

+ (BOOL)currentProcessHasAllowSuggestionsEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.allow-suggestions"];
}

+ (BOOL)currentProcessHasBooleanEntitlement:(id)a3
{
  v3 = [a1 _currentProcessValueForEntitlement:a3 loadBlock:&__block_literal_global_24];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)currentProcessHasLocationdEffectiveBundleEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.locationd.effective_bundle"];
}

uint64_t __63__CalEntitlementsVerifier_currentProcessHasBooleanEntitlement___block_invoke(int a1, CFTypeRef cf)
{
  BOOL v4 = cf && (v3 = CFGetTypeID(cf), v3 == CFBooleanGetTypeID()) && CFBooleanGetValue((CFBooleanRef)cf) != 0;
  v5 = NSNumber;

  return [v5 numberWithBool:v4];
}

+ (id)currentProcessGetStringEntitlement:(id)a3
{
  return (id)[a1 _currentProcessValueForEntitlement:a3 loadBlock:&__block_literal_global_3];
}

id __62__CalEntitlementsVerifier_currentProcessGetStringEntitlement___block_invoke(int a1, void *cf)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFStringGetTypeID()) {
      v5 = cf;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)currentProcessGetArrayOfStringsEntitlement:(id)a3
{
  return (id)[a1 _currentProcessValueForEntitlement:a3 loadBlock:&__block_literal_global_6];
}

id __70__CalEntitlementsVerifier_currentProcessGetArrayOfStringsEntitlement___block_invoke(int a1, void *cf)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!cf)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 != CFArrayGetTypeID())
  {
    CFTypeID v13 = CFGetTypeID(cf);
    if (v13 == CFStringGetTypeID())
    {
      v19 = cf;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  CFTypeID v4 = cf;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v5, "addObject:", v11, (void)v15);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
LABEL_16:

  return v12;
}

+ (id)_currentProcessValueForEntitlement:(id)a3 loadBlock:(id)a4
{
  v5 = (__CFString *)a3;
  id v6 = (void (**)(id, CFTypeRef))a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_currentProcessValueForEntitlement_loadBlock__lock);
  uint64_t v7 = [(id)_currentProcessValueForEntitlement_loadBlock__s_cache objectForKey:v5];
  if (!v7)
  {
    uint64_t v8 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    CFErrorRef error = 0;
    CFTypeRef v9 = SecTaskCopyValueForEntitlement(v8, v5, &error);
    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = error == 0;
    }
    if (!v10)
    {
      uint64_t v11 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CalEntitlementsVerifier _currentProcessValueForEntitlement:loadBlock:]((uint64_t)v5, (uint64_t *)&error, v11);
      }
    }
    uint64_t v7 = v6[2](v6, v9);
    if (v9) {
      CFRelease(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    }
    v12 = (void *)_currentProcessValueForEntitlement_loadBlock__s_cache;
    if (!_currentProcessValueForEntitlement_loadBlock__s_cache)
    {
      uint64_t v13 = objc_opt_new();
      v14 = (void *)_currentProcessValueForEntitlement_loadBlock__s_cache;
      _currentProcessValueForEntitlement_loadBlock__s_cache = v13;

      v12 = (void *)_currentProcessValueForEntitlement_loadBlock__s_cache;
    }
    [v12 setObject:v7 forKey:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_currentProcessValueForEntitlement_loadBlock__lock);
  long long v15 = [MEMORY[0x1E4F1CA98] null];
  if (v7 == v15) {
    long long v16 = 0;
  }
  else {
    long long v16 = v7;
  }
  id v17 = v16;

  return v17;
}

+ (BOOL)currentProcessIsFirstPartyCalendarApp
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar"];
}

+ (BOOL)currentProcessIsCalendarDaemon
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.calaccessd"];
}

+ (BOOL)currentProcessIsDataAccess
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.dataaccessd"];
}

+ (BOOL)currentProcessIsPreferences
{
  uint64_t v2 = [a1 currentProcessGetStringEntitlement:@"application-identifier"];
  char v3 = [v2 isEqualToString:@"com.apple.Preferences"];

  return v3;
}

+ (BOOL)currentProcessIsAutomator
{
  uint64_t v2 = [a1 currentProcessGetStringEntitlement:@"com.apple.application-identifier"];
  char v3 = [v2 isEqualToString:@"com.apple.Automator"];

  return v3;
}

+ (BOOL)currentProcessHasWatchOSMutableDatabaseEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.watchos-mutable-database"];
}

+ (BOOL)currentProcessHasSyncClientEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.syncclient"];
}

+ (BOOL)currentProcessHasCalendarToolEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.iamcalendar_tool"];
}

+ (BOOL)currentProcessHasBirthdayModificationEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.allow-birthday-modification"];
}

+ (BOOL)currentProcessHasTestingEntitlement
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.daemon.access-level.testing"];
}

+ (BOOL)currentProcessIsFirstPartyApp
{
  char v3 = [a1 currentProcessGetArrayOfStringsEntitlement:@"com.apple.private.tcc.allow"];
  if ([v3 containsObject:@"kTCCServiceCalendar"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [a1 currentProcessGetArrayOfStringsEntitlement:@"com.apple.private.tcc.allow.overridable"];
    if ([v5 containsObject:@"kTCCServiceCalendar"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
      uint64_t v7 = [v6 teamIdentifier];
      uint64_t v8 = v7;
      if (v7)
      {
        if ([v7 isEqualToString:@"0000000000"]) {
          char v4 = 1;
        }
        else {
          char v4 = [v8 isEqualToString:@"ZL6BUSYGB3"];
        }
      }
      else
      {
        char v4 = 0;
      }
    }
  }

  return v4;
}

+ (BOOL)currentProcessUsesInProcessEventStores
{
  return [a1 currentProcessHasBooleanEntitlement:@"com.apple.private.calendar.usesInProcessEventStores"];
}

+ (void)_currentProcessValueForEntitlement:(os_log_t)log loadBlock:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "An error occurred while checking to see if the current process has entitlement %@. %@", (uint8_t *)&v4, 0x16u);
}

@end
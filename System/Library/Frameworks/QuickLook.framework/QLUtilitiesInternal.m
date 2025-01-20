@interface QLUtilitiesInternal
+ (BOOL)currentAppIsAppleApp;
+ (BOOL)deviceIsLocked;
+ (NSString)applicationIdentifierEntitlementKey;
+ (id)appIdentifierFromTeamAppTuple:(id)a3 processName:(id)a4;
+ (id)getCurrentApplicationBundleIdentifier;
+ (id)getCurrentApplicationBundleIdentifierUsingEntitlement;
@end

@implementation QLUtilitiesInternal

+ (NSString)applicationIdentifierEntitlementKey
{
  if (applicationIdentifierEntitlementKey_onceToken != -1) {
    dispatch_once(&applicationIdentifierEntitlementKey_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)applicationIdentifierEntitlementKey__applicationIdentifierEntitlementKey;

  return (NSString *)v2;
}

void __58__QLUtilitiesInternal_applicationIdentifierEntitlementKey__block_invoke()
{
  v0 = (void *)applicationIdentifierEntitlementKey__applicationIdentifierEntitlementKey;
  applicationIdentifierEntitlementKey__applicationIdentifierEntitlementKey = @"application-identifier";
}

+ (id)getCurrentApplicationBundleIdentifier
{
  v2 = +[QLUtilitiesInternal getCurrentApplicationBundleIdentifierUsingEntitlement];
  if (!v2)
  {
    v3 = [MEMORY[0x263F086E0] mainBundle];
    v2 = [v3 bundleIdentifier];

    v4 = (NSObject **)MEMORY[0x263F62940];
    v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Could not obtain current application bundle identifier #Generic", v7, 2u);
    }
  }

  return v2;
}

+ (id)getCurrentApplicationBundleIdentifierUsingEntitlement
{
  v2 = _QLGetStringEntitlement(@"application-identifier");
  if (v2)
  {
    v3 = [MEMORY[0x263F08AB0] processInfo];
    v4 = [v3 processName];
    v5 = +[QLUtilitiesInternal appIdentifierFromTeamAppTuple:v2 processName:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)currentAppIsAppleApp
{
  v2 = +[QLUtilitiesInternal getCurrentApplicationBundleIdentifierUsingEntitlement];
  char v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

+ (BOOL)deviceIsLocked
{
  v2 = (void *)MGCopyAnswer();
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)appIdentifierFromTeamAppTuple:(id)a3 processName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (appIdentifierFromTeamAppTuple_processName__onceToken != -1) {
    dispatch_once(&appIdentifierFromTeamAppTuple_processName__onceToken, &__block_literal_global_11);
  }
  if ([v5 hasPrefix:@"com.apple."])
  {
    id v7 = v5;
  }
  else
  {
    v8 = objc_msgSend((id)appIdentifierFromTeamAppTuple_processName____regex, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    id v7 = 0;
    if ([v8 count] == 1)
    {
      v9 = [v8 objectAtIndex:0];
      id v7 = 0;
      if ([v9 numberOfRanges] == 2)
      {
        uint64_t v10 = [v9 rangeAtIndex:1];
        objc_msgSend(v5, "substringWithRange:", v10, v11);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v7;
}

uint64_t __65__QLUtilitiesInternal_appIdentifierFromTeamAppTuple_processName___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[0-9,A-Z]{10}\\.(.*)" options:0 error:0];
  uint64_t v1 = appIdentifierFromTeamAppTuple_processName____regex;
  appIdentifierFromTeamAppTuple_processName____regex = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end
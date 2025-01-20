@interface MCManagedPreferencesManager
+ (BOOL)addManagedPreferences:(id)a3 toDomain:(id)a4;
+ (BOOL)removeManagedPreferences:(id)a3 fromDomain:(id)a4;
+ (BOOL)setManagedPreferences:(id)a3 forDomain:(id)a4;
+ (id)globalManagedPreferencesDomain;
+ (id)managedPreferencesForDomain:(id)a3;
+ (id)managedPreferencesPathForDomain:(id)a3;
+ (void)sendManagedPreferencesChangedNotificationForDomains:(id)a3;
+ (void)updateGlobalManagedPreferencesByAddingPreferences:(id)a3 removingPreferences:(id)a4;
@end

@implementation MCManagedPreferencesManager

+ (id)managedPreferencesPathForDomain:(id)a3
{
  v3 = (void *)_CFPreferencesCopyPathForManagedDomain();
  return v3;
}

+ (id)managedPreferencesForDomain:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = [a1 managedPreferencesPathForDomain:a3];
  v5 = [v3 dictionaryWithContentsOfFile:v4];

  return v5;
}

+ (BOOL)setManagedPreferences:(id)a3 forDomain:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_DEFAULT, "MCManagedPreferencesManager removing managed preferences for domain: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  BOOL v8 = _CFPreferencesWriteManagedDomain() != 0;

  return v8;
}

+ (BOOL)addManagedPreferences:(id)a3 toDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [a1 managedPreferencesForDomain:v6];
  v9 = (void *)[v8 mutableCopy];
  int v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  uint64_t v12 = v11;

  [v12 addEntriesFromDictionary:v7];
  char v13 = [a1 setManagedPreferences:v12 forDomain:v6];

  return v13;
}

+ (BOOL)removeManagedPreferences:(id)a3 fromDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [a1 managedPreferencesForDomain:v7];
  v9 = (void *)[v8 mutableCopy];

  if (v9)
  {
    [v9 removeObjectsForKeys:v6];
    char v10 = [a1 setManagedPreferences:v9 forDomain:v7];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

+ (void)sendManagedPreferencesChangedNotificationForDomains:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    _CFPreferencesManagementStatusChangedForDomains();
    _CFPreferencesPostValuesChangedInDomains();
  }
}

+ (id)globalManagedPreferencesDomain
{
  return @".GlobalPreferences";
}

+ (void)updateGlobalManagedPreferencesByAddingPreferences:(id)a3 removingPreferences:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    BOOL v8 = [a1 globalManagedPreferencesDomain];
    +[MCManagedPreferencesManager addManagedPreferences:v6 toDomain:v8];

    if (![v7 count]) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ([v7 count])
  {
LABEL_5:
    v9 = [a1 globalManagedPreferencesDomain];
    +[MCManagedPreferencesManager removeManagedPreferences:v7 fromDomain:v9];

LABEL_6:
    char v10 = [a1 globalManagedPreferencesDomain];
    v12[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [a1 sendManagedPreferencesChangedNotificationForDomains:v11];
  }
}

@end
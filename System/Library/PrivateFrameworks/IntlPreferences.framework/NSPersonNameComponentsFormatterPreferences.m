@interface NSPersonNameComponentsFormatterPreferences
+ (id)infoClassFromPreferencesSource:(unint64_t)a3;
+ (id)mappedPreferencesForPreferences:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5;
+ (void)_postPreferencesChangedNotification;
+ (void)_setPreference:(id)a3 toValue:(int64_t)a4 usingExistingGetter:(SEL)a5;
+ (void)_syncronizeGizmoDefaultWithKey:(id)a3 value:(int64_t)a4;
+ (void)setDefaultDisplayNameOrder:(int64_t)a3;
+ (void)setPreferNicknamesDefault:(BOOL)a3;
+ (void)setShortNameFormat:(int64_t)a3;
+ (void)setShortNameIsEnabled:(BOOL)a3;
@end

@implementation NSPersonNameComponentsFormatterPreferences

+ (void)_setPreference:(id)a3 toValue:(int64_t)a4 usingExistingGetter:(SEL)a5
{
  key = (__CFString *)a3;
  uint64_t v8 = [MEMORY[0x1E4F28F38] performSelector:a5];
  v9 = (const void *)[NSNumber numberWithInteger:a4];
  CFPreferencesSetValue(key, v9, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v8 != a4)
  {
    [a1 _syncronizeGizmoDefaultWithKey:key value:a4];
    [a1 _postPreferencesChangedNotification];
  }
}

+ (void)_postPreferencesChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NSPersonNamePreferencesDidChangeNotification", 0, 0, 1u);
}

+ (void)setDefaultDisplayNameOrder:(int64_t)a3
{
}

+ (void)setShortNameFormat:(int64_t)a3
{
}

+ (void)setPreferNicknamesDefault:(BOOL)a3
{
}

+ (void)setShortNameIsEnabled:(BOOL)a3
{
}

+ (void)_syncronizeGizmoDefaultWithKey:(id)a3 value:(int64_t)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (getNRPairedDeviceRegistryClass() && getNPSManagerClass())
  {
    v6 = [getNRPairedDeviceRegistryClass() sharedInstance];
    v7 = [v6 getActivePairedDevice];

    id v8 = v7;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    v9 = (uint64_t (*)(id))getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    v33 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
    if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke;
      v28 = &unk_1E63BFCF0;
      v29 = &v30;
      v10 = (void *)NanoRegistryLibrary();
      v31[3] = (uint64_t)dlsym(v10, "NRWatchOSVersionForRemoteDevice");
      getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(v29[1] + 24);
      v9 = (uint64_t (*)(id))v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (v9)
    {
      int v11 = v9(v8);

      BOOL v12 = (v11 & 0xFFFE0000) != 0;
      id v13 = objc_alloc_init((Class)getNPSManagerClass());
      if (v12)
      {
        v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
        [v13 synchronizeUserDefaultsDomain:@".GlobalPreferences" keys:v14];
        goto LABEL_13;
      }
      id v15 = +[IPiOSABNamePreferenceInfoProvider domain];
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2020000000;
      v16 = (uint64_t (*)(id))getPSIsNanoMirroringDomainSymbolLoc_ptr;
      v33 = getPSIsNanoMirroringDomainSymbolLoc_ptr;
      if (!getPSIsNanoMirroringDomainSymbolLoc_ptr)
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __getPSIsNanoMirroringDomainSymbolLoc_block_invoke;
        v28 = &unk_1E63BFCF0;
        v29 = &v30;
        __getPSIsNanoMirroringDomainSymbolLoc_block_invoke((uint64_t)&v25);
        v16 = (uint64_t (*)(id))v31[3];
      }
      _Block_object_dispose(&v30, 8);
      if (v16)
      {
        int v17 = v16(v15);

        if (!v17)
        {
LABEL_14:

          goto LABEL_15;
        }
        id v34 = v5;
        v18 = [NSNumber numberWithInteger:a4];
        v35[0] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
        v14 = +[NSPersonNameComponentsFormatterPreferences mappedPreferencesForPreferences:v19 from:0 to:2];

        v20 = +[IPiOSABNamePreferenceInfoProvider domain];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __83__NSPersonNameComponentsFormatterPreferences__syncronizeGizmoDefaultWithKey_value___block_invoke;
        v22[3] = &unk_1E63BFE30;
        id v23 = v20;
        id v24 = v13;
        id v21 = v20;
        [v14 enumerateKeysAndObjectsUsingBlock:v22];

LABEL_13:
        goto LABEL_14;
      }
      +[NSPersonNameComponentsFormatterPreferences _syncronizeGizmoDefaultWithKey:value:]();
    }
    else
    {
      +[NSPersonNameComponentsFormatterPreferences _syncronizeGizmoDefaultWithKey:value:]();
    }
    __break(1u);
  }
LABEL_15:
}

void __83__NSPersonNameComponentsFormatterPreferences__syncronizeGizmoDefaultWithKey_value___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v7 = (void *)getNPSDomainAccessorClass_softClass;
  uint64_t v19 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getNPSDomainAccessorClass_block_invoke;
    v15[3] = &unk_1E63BFCF0;
    v15[4] = &v16;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v15);
    v7 = (void *)v17[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v16, 8);
  v9 = (void *)[[v8 alloc] initWithDomain:*(void *)(a1 + 32)];
  objc_msgSend(v9, "setInteger:forKey:", objc_msgSend(v6, "integerValue"), v5);
  id v10 = (id)[v9 synchronize];
  uint64_t v13 = a1 + 32;
  uint64_t v11 = *(void *)(a1 + 32);
  BOOL v12 = *(void **)(v13 + 8);
  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  [v12 synchronizeNanoDomain:v11 keys:v14];
}

+ (id)mappedPreferencesForPreferences:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a3;
  id v10 = [v8 dictionary];
  uint64_t v11 = [a1 infoClassFromPreferencesSource:a4];
  BOOL v12 = [a1 infoClassFromPreferencesSource:a5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__NSPersonNameComponentsFormatterPreferences_mappedPreferencesForPreferences_from_to___block_invoke;
  v19[3] = &unk_1E63BFE58;
  id v20 = v11;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v14 = v12;
  id v15 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v19];

  uint64_t v16 = v22;
  id v17 = v13;

  return v17;
}

void __86__NSPersonNameComponentsFormatterPreferences_mappedPreferencesForPreferences_from_to___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a1[4];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 nativeKeyNameToCanonicalKeyName];
  id v15 = [v8 objectForKeyedSubscript:v7];

  id v9 = [a1[5] canonicalNameToNativeKeyName];
  id v10 = [v9 objectForKeyedSubscript:v15];

  uint64_t v11 = [a1[4] valueToValueIdentifierMapFromCanonicalKey:v15];
  BOOL v12 = [v11 objectForKeyedSubscript:v6];

  id v13 = [a1[5] valueIdentifierToValueMapFromCanonicalKey:v15];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (v10 && v14) {
    [a1[6] setObject:v14 forKeyedSubscript:v10];
  }
}

+ (id)infoClassFromPreferencesSource:(unint64_t)a3
{
  if (a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return v4;
}

+ (uint64_t)_syncronizeGizmoDefaultWithKey:value:.cold.1()
{
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
}

@end
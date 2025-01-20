@interface CFXPreferences
@end

@implementation CFXPreferences

void __36___CFXPreferences_resetPreferences___block_invoke_4(uint64_t a1, int a2, void *value)
{
}

void __85___CFXPreferences_PlistSourceAdditions__withManagedSourceForIdentifier_user_perform___block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [CFPrefsManagedSource alloc];
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 32);
      v10.receiver = v6;
      v10.super_class = (Class)CFPrefsManagedSource;
      v6 = (CFPrefsManagedSource *)objc_msgSendSuper2(&v10, sel_initWithDomain_user_byHost_containerPath_containingPreferences_, v7, v8, 1, 0, v9);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6;
    CFDictionarySetValue(theDict, *(const void **)(a1 + 48), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (const void *)[a2 copyValueForKey:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 != 0;
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

uint64_t __66___CFXPreferences_copyValueForKey_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copyValueForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (const void *)[a2 copyValueForKey:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 != 0;
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

CFDictionaryRef __40___CFXPreferences_synchronizeEverything__block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  CFDictionaryRef result = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_8(uint64_t a1, const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_4(uint64_t a1, const void *a2)
{
}

uint64_t __61___CFXPreferences_synchronizeIdentifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 synchronize];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __58___CFXPreferences_appSynchronizeWithIdentifier_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 synchronize];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke(uint64_t *a1, __CFString *theString, uint64_t a3, char a4, const __CFString *a5)
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  MutableCopy = theString;
  if (a5)
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, theString);
    CFStringAppend(MutableCopy, a5);
  }
  BOOL v11 = _CFPrefsArmPendingKVOSlot();
  uint64_t v12 = a1[4];
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke_2;
  v13[3] = &unk_1ECDFF168;
  v13[4] = v12;
  v13[5] = &v19;
  v13[8] = theString;
  v13[9] = a3;
  v13[10] = a1[6];
  v13[11] = a5;
  char v14 = a4;
  v13[6] = &v15;
  v13[7] = MutableCopy;
  -[_CFXPreferences withSearchLists:](v12, (uint64_t)v13);
  if (a5) {
    CFRelease(MutableCopy);
  }
  if (*((unsigned char *)v16 + 24)) {
    [*(id *)(v20[5] + 112) setEnabled:1];
  }
  (*(void (**)(void))(a1[5] + 16))();

  if (v11) {
    -[_CFXPreferences _deliverPendingKVONotifications]((const os_unfair_lock *)a1[4]);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

id __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  v17[1] = *(CFPrefsConfigurationFileSource **)off_1ECE0A5B0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 56));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[CFPrefsSearchListSource alloc] initWithIdentifier:*(void *)(a1 + 64) containingPreferences:*(void *)(a1 + 32)];
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), *(void *)(a1 + 72));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), @"kCFPreferencesAnyUser");
    -[CFPrefsSearchListSource addNamedVolatileSourceForIdentifier:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"NSArgumentDomain");
    uint64_t v16 = 0;
    v17[0] = 0;
    CFStringRef v5 = -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:](*(const __CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(const void **)(a1 + 80), v17, (CFStringRef *)&v16);
    if (v5)
    {
      CFStringRef v6 = v5;
      -[CFPrefsSearchListSource addCloudSourceForIdentifier:configurationPath:storeName:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), (uint64_t)v5, v16, *(const __CFString **)(a1 + 88));
      CFArrayRef v7 = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 80);
      CFIndex Count = CFArrayGetCount(v7);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 112) = CFArrayGetValueAtIndex(v7, Count - 1);
      CFRelease(v6);
    }
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), *(const __CFString **)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(const __CFString **)(a1 + 88));
    CFArrayRef v9 = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 80);
    CFIndex v10 = CFArrayGetCount(v9);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 104) = CFArrayGetValueAtIndex(v9, v10 - 1);
    -[CFPrefsSearchListSource addSuiteSourceForIdentifier:user:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 64), *(const __CFString **)(a1 + 72));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"kCFPreferencesAnyApplication", *(void *)(a1 + 72));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"kCFPreferencesAnyApplication", *(const __CFString **)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(const __CFString **)(a1 + 88));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), @"kCFPreferencesAnyUser", 1, 0);
    -[CFPrefsSearchListSource addSuiteSourceForIdentifier:user:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 64), @"kCFPreferencesAnyUser");
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"kCFPreferencesAnyApplication", @"kCFPreferencesAnyUser", 1, 0);
    -[CFPrefsSearchListSource addNamedVolatileSourceForIdentifier:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), @"NSRegistrationDomain");
    if (v17[0])
    {
      -[CFPrefsSearchListSource addSource:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v17[0]);
    }
    CFSetRef v11 = *(const __CFSet **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 88);
    if (v11) {
      BOOL v12 = CFSetGetCount(v11) > 0;
    }
    else {
      BOOL v12 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v13)
    {
      *(unsigned char *)(v13 + 120) = 1;
      char v14 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    else
    {
      char v14 = 0;
    }
    CFDictionarySetValue(theDict, *(const void **)(a1 + 56), v14);

    v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return v4;
}

uint64_t __76___CFXPreferences_copyAppValueForKey_identifier_container_configurationURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 copyValueForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    CFStringRef v6 = *(const __CFString **)(a1 + 56);
    if (CFEqual(v6, @"kCFPreferencesAnyUser")) {
      goto LABEL_31;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&__useVolatileDomainsForUser_volatileHomeDirsLock);
    CFDictionaryRef Mutable = (const __CFDictionary *)__useVolatileDomainsForUser_volatileHomeDirs;
    if (!__useVolatileDomainsForUser_volatileHomeDirs)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      __useVolatileDomainsForUser_volatileHomeDirs = (uint64_t)Mutable;
    }
    Value = (__objc2_class **)CFDictionaryGetValue(Mutable, v6);
    if (!Value)
    {
      if (CFEqual(@"kCFPreferencesCurrentUser", v6)) {
        CFStringRef v9 = 0;
      }
      else {
        CFStringRef v9 = v6;
      }
      CFIndex v10 = CFCopyHomeDirectoryURLForUser(v9);
      if (_CFURLExists((const __CFURL *)v10))
      {
        Value = &__kCFBooleanFalse;
      }
      else
      {
        bzero(buffer, 0x400uLL);
        CFURLGetFileSystemRepresentation((CFURLRef)v10, 1u, buffer, 1024);
        CFStringGetCString(v6, v14, 100, 0x8000100u);
        CFSetRef v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216_cold_2(v11);
        }
        Value = &__kCFBooleanTrue;
      }
      if (v10) {
        CFRelease(v10);
      }
      CFDictionarySetValue((CFMutableDictionaryRef)__useVolatileDomainsForUser_volatileHomeDirs, v6, Value);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__useVolatileDomainsForUser_volatileHomeDirsLock);
    if (Value == &__kCFBooleanTrue || (__overrideUseVolatileDomainsForUser & 1) != 0)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      uint64_t v13 = _CFPrefsClientLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216_cold_1(a1, (uint64_t *)(a1 + 56), v13);
      }
      _CFSetTSD(0xFu, 0, 0);
      BOOL v12 = [[CFPrefsSource alloc] initWithContainingPreferences:*(void *)(a1 + 32)];
    }
    else
    {
LABEL_31:
      if (*(unsigned char *)(a1 + 80)) {
        BOOL v12 = [[CFPrefsCloudSource alloc] initWithDomain:*(void *)(a1 + 64) user:*(void *)(a1 + 56) byHost:*(unsigned __int8 *)(a1 + 81) containerPath:*(void *)(a1 + 72) containingPreferences:*(void *)(a1 + 32)];
      }
      else {
        BOOL v12 = [[CFPrefsPlistSource alloc] initWithDomain:*(void *)(a1 + 64) user:*(void *)(a1 + 56) byHost:*(unsigned __int8 *)(a1 + 81) containerPath:*(void *)(a1 + 72) containingPreferences:*(void *)(a1 + 32)];
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v12;
    CFDictionarySetValue(theDict, *(const void **)(a1 + 48), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(void *a1)
{
  v2 = (const void *)a1[4];
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[6];
  if (v4) {
    CFRelease(v4);
  }
  id v5 = (const void *)a1[7];
  if (v5)
  {
    CFRelease(v5);
  }
}

os_unfair_lock_s *__57___CFXPreferences_copyDictionaryForSourceWithIdentifier___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyDictionary](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

os_unfair_lock_s *__54___CFXPreferences_copyDictionaryForApp_withContainer___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyDictionary](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __68___CFXPreferences_copyValuesForKeys_identifier_user_host_container___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_lock(a2 + 13);
  CFArrayRef v4 = *(const __CFArray **)(a1 + 40);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        CFStringRef v9 = (const void *)[(os_unfair_lock_s *)a2 alreadylocked_copyValueForKey:ValueAtIndex];
        if (v9)
        {
          CFIndex v10 = v9;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), ValueAtIndex, v9);
          CFRelease(v10);
        }
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [(os_unfair_lock_s *)a2 alreadylocked_copyDictionary];
  }

  os_unfair_lock_unlock(a2 + 13);
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_98(uint64_t a1)
{
}

os_unfair_lock_s *__64___CFXPreferences_copyKeyListForIdentifier_user_host_container___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyKeyList](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __68___CFXPreferences_setBackupDisabled_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBackupDisabled:*(unsigned __int8 *)(a1 + 32)];
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_9(uint64_t a1, const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_6(uint64_t a1, const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_5(uint64_t a1, const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_10(uint64_t a1, const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke(uint64_t a1)
{
  v20[1] = *(CFStringRef *)off_1ECE0A5B0;
  CFStringRef v19 = 0;
  v20[0] = 0;
  CFTypeRef v18 = 0;
  __int16 v17 = 0;
  char v16 = 0;
  _CFPrefsExtractQuadrupleFromPathIfPossible(*(const __CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v20, &v19, &v18, &v17, (unsigned char *)&v17 + 1, &v16);
  if (v20[0]) {
    *(CFStringRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v20[0];
  }
  if (v19)
  {
    CFRelease(v19);
    CFStringRef v19 = 0;
  }
  CFTypeRef v2 = v18;
  if (v18) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v18;
  }
  v11[0] = off_1ECE0A5A0;
  v11[1] = 3221225472;
  BOOL v12 = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2;
  uint64_t v13 = &__block_descriptor_48_e5_v8__0l;
  CFTypeRef v14 = v2;
  CFStringRef v15 = v20[0];
  if (HIBYTE(v17))
  {
    __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2((uint64_t)v11);
  }
  else
  {
    v8[0] = off_1ECE0A5A0;
    v8[1] = 3221225472;
    v8[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_3;
    v8[3] = &unk_1ECE00A18;
    long long v9 = *(_OWORD *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 48);
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v9, v3, @"kCFPreferencesCurrentUser", 1, (uint64_t)v8);
    v5[0] = off_1ECE0A5A0;
    v5[1] = 3221225472;
    v5[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_7;
    v5[3] = &unk_1ECE00A18;
    long long v6 = *(_OWORD *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 48);
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v6, v4, @"kCFPreferencesAnyUser", 1, (uint64_t)v5);
    v12((uint64_t)v11);
  }
}

void __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _CFPrefsGetCacheStringForBundleID(*(__CFString **)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(*(__CFString **)(a1 + 56));
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"suite/%@/%@", CacheStringForBundleID, v4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = CFDictionaryGetValue(a2, v6);
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [(CFPrefsSearchListSource *)[CFPrefsSuiteSearchListSource alloc] initWithIdentifier:*(void *)(a1 + 56) containingPreferences:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v8)
    {
      *(unsigned char *)(v8 + 120) = 1;
      long long v9 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    else
    {
      long long v9 = 0;
    }
    CFDictionarySetValue(a2, v6, v9);

    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  id v10 = v7;

  CFRelease(v6);
}

void __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  unint64_t Count = CFDictionaryGetCount(theDict);
  if (((Count >> 59) & 0xF) != 0)
  {
    CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", 2 * Count);
    v23 = +[NSException exceptionWithName:@"NSGenericException" reason:v22 userInfo:0];
    CFRelease(v22);
    objc_exception_throw(v23);
  }
  uint64_t v6 = Count;
  if (Count) {
    uint64_t v7 = 2 * Count;
  }
  else {
    uint64_t v7 = 1;
  }
  unint64_t v8 = MEMORY[0x1F4188790](v7, v5);
  id v10 = (const void **)((char *)&v24 - v9);
  size_t v24 = 0;
  if (v11 >= 0x101)
  {
    id v10 = (const void **)_CFCreateArrayStorage(v8, 0, &v24);
    BOOL v12 = v10;
  }
  else
  {
    BOOL v12 = 0;
  }
  id v13 = *(id *)(a1 + 32);
  CFDictionaryGetKeysAndValues(theDict, v10, &v10[v6]);
  if (v6 >= 1)
  {
    uint64_t v14 = v6;
    do
    {
      CFStringRef v15 = v10[v6];
      if (v15 == *(const void **)(a1 + 32))
      {
        CFDictionaryReplaceValue(theDict, *v10, *(const void **)(a1 + 40));
      }
      else
      {
        CFArrayRef v16 = (const __CFArray *)*((void *)v15 + 10);
        if (v16)
        {
          v26.length = CFArrayGetCount(*((CFArrayRef *)v15 + 10));
          v26.location = 0;
          if (CFArrayContainsValue(v16, v26, *(const void **)(a1 + 32))) {
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), *v10);
          }
        }
      }
      ++v10;
      --v14;
    }
    while (v14);
  }
  free(v12);
  CFIndex v17 = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (v17 >= 1)
  {
    for (CFIndex i = 0; i != v17; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
      Value = (void *)CFDictionaryGetValue(theDict, ValueAtIndex);
      uint64_t v21 = (unsigned char *)objc_msgSend(Value, "copy", v24, v25);
      -[CFPrefsSearchListSource replaceSource:withSource:]((uint64_t)v21, *(const void **)(a1 + 32), *(const void **)(a1 + 40));
      if (v21) {
        v21[120] = 1;
      }
      -[_CFXPreferences replaceSearchList:withSearchList:](*(void *)(a1 + 48), Value, v21);
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_7(uint64_t *a1, void *a2)
{
  v15[5] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = (const os_unfair_lock *)a1[4];
  uint64_t v6 = *(__CFString **)(*(void *)(a1[5] + 8) + 24);
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  v15[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_8;
  v15[3] = &unk_1ECDFEEF0;
  v15[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v5, v6, @"kCFPreferencesAnyUser", (uint64_t)v15);
  uint64_t v7 = a1[4];
  unint64_t v8 = *(__CFString **)(*(void *)(a1[5] + 8) + 24);
  CFStringRef v9 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24);
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_9;
  v14[3] = &unk_1ECDFEF18;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v7, v8, @"kCFPreferencesAnyUser", 1, v9, 0, (uint64_t)v14);
  uint64_t v10 = a1[4];
  unint64_t v11 = *(__CFString **)(*(void *)(a1[5] + 8) + 24);
  CFStringRef v12 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24);
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_10;
  v13[3] = &unk_1ECDFEF18;
  v13[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v10, v11, @"kCFPreferencesAnyUser", 0, v12, 0, (uint64_t)v13);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_3(uint64_t *a1, void *a2)
{
  v15[5] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = (const os_unfair_lock *)a1[4];
  uint64_t v6 = *(__CFString **)(*(void *)(a1[5] + 8) + 24);
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  v15[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_4;
  v15[3] = &unk_1ECDFEEF0;
  v15[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v5, v6, @"kCFPreferencesCurrentUser", (uint64_t)v15);
  uint64_t v7 = a1[4];
  unint64_t v8 = *(__CFString **)(*(void *)(a1[5] + 8) + 24);
  CFStringRef v9 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24);
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_5;
  v14[3] = &unk_1ECDFEF18;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v7, v8, @"kCFPreferencesCurrentUser", 1, v9, 0, (uint64_t)v14);
  uint64_t v10 = a1[4];
  unint64_t v11 = *(__CFString **)(*(void *)(a1[5] + 8) + 24);
  CFStringRef v12 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24);
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_6;
  v13[3] = &unk_1ECDFEF18;
  v13[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v10, v11, @"kCFPreferencesCurrentUser", 0, v12, 0, (uint64_t)v13);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2(uint64_t a1)
{
  CFTypeRef v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  -[CFPrefsSource setValue:forKey:from:](a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  v5[0] = off_1ECE0A5A0;
  v5[1] = 3221225472;
  v5[2] = __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke_2;
  v5[3] = &unk_1ECE00898;
  void v5[4] = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  return [(os_unfair_lock_s *)a2 transitionIntoDirectModeIfNeededWithRetryBlock:v5];
}

uint64_t __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  -[CFPrefsSource setValue:forKey:from:](a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0);
  v5[0] = off_1ECE0A5A0;
  v5[1] = 3221225472;
  v5[2] = __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke_2;
  v5[3] = &unk_1ECE00898;
  void v5[4] = a2;
  long long v6 = *(_OWORD *)(a1 + 32);
  return [(os_unfair_lock_s *)a2 transitionIntoDirectModeIfNeededWithRetryBlock:v5];
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_2()
{
  uint64_t v1 = *(void *)off_1ECE0A5B0;
  if ((__CF_FORK_STATE & 2) == 0) {
    __CF_USED();
  }
  if (__CF_FORK_STATE) {
    __THE_PROCESS_HAS_FORKED_AND_YOU_CANNOT_USE_THIS_COREFOUNDATION_FUNCTIONALITY___YOU_MUST_EXEC__();
  }
  if ((__CF_FORK_STATE & 1) == 0)
  {
    int out_token = 0;
    notify_register_dispatch("com.apple.CFPreferences._domainsChangedExternally", &out_token, (dispatch_queue_t)off_1ECE0A5E0, &__block_literal_global_215);
  }
}

void __65___CFXPreferences_registerUserDefaultsInstance_configurationURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _observingCFPreferences])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    -[CFPrefsSearchListSource addPreferencesObserver:](a2, v4);
  }
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v5 = (void *)[a3 copyVolatileSourceWithContainingPreferences:*(void *)(a1 + 32)];
  if (!v5) {
    __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3_cold_1();
  }
  id v6 = v5;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, v5);
}

void __41___CFXPreferences_registerDefaultValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = off_1ECE0A5A0;
  v5[1] = 3221225472;
  v5[2] = __41___CFXPreferences_registerDefaultValues___block_invoke_2;
  v5[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  void v5[4] = a3;
  void v5[5] = a2;
  v5[6] = a4;
  -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v4, @"NSRegistrationDomain", (uint64_t)v5);
}

void __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[CFPrefsSource alloc] initWithContainingPreferences:*(void *)(a1 + 32)];
    CFDictionarySetValue(theDict, *(const void **)(a1 + 48), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    _addBackstopValuesForIdentifierAndSource(*(const void **)(a1 + 56), *(os_unfair_lock_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  id v6 = *(const void **)(a1 + 48);

  CFRelease(v6);
}

void __41___CFXPreferences_registerDefaultValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
}

void __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
}

void __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[7] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(__CFString **)(a1 + 40);
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke_2;
  v6[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v6[4] = a3;
  v6[5] = a2;
  v6[6] = a4;
  -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v4, v5, (uint64_t)v6);
}

os_unfair_lock_s *__59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyDictionary](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *(void *)off_1ECE0A5B0;
  CFTypeRef v2 = _CFPrefsClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "CFPreferencesPID");
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesDomain");
    id v5 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesUncanonicalizedPath");
    BOOL v6 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "CFPreferencesIsByHost");
    uint64_t v7 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesCloudConfig");
    unint64_t v8 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesUser");
    CFStringRef v9 = _CFPrefsClientLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219266;
      int64_t v21 = int64;
      __int16 v22 = 2080;
      v23 = string;
      __int16 v24 = 2080;
      uint64_t v25 = v8;
      __int16 v26 = 1024;
      BOOL v27 = v6;
      __int16 v28 = 2080;
      v29 = v5;
      __int16 v30 = 2080;
      v31 = v7;
      _os_log_debug_impl(&dword_182B90000, v9, OS_LOG_TYPE_DEBUG, "Received remote change notification from process %lld for { domain: %s, user: %s, byHost: %d, path: %s, cloud configuration path: %s }", buf, 0x3Au);
    }
  }
  _CFPrefsArmPendingKVOSlot();
  CFURLRef value = (const __CFURL *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CFPreferencesDomain");
  CFDataRef v11 = _CFXPCCreateCFObjectFromXPCObject(value);
  if (v11)
  {
    CFDataRef v12 = v11;
    id v13 = (id *)(a1 + 40);
    if (objc_loadWeak(v13))
    {
      id Weak = objc_loadWeak(v13);
      -[_CFXPreferences updateSearchListsForIdentifier:]((uint64_t)Weak, v12);
    }
    CFRelease(v12);
  }
  uint64_t v15 = _CFGetTSD(0x10u);
  if (v15)
  {
    CFArrayRef v16 = (const void *)v15;
    _CFSetTSD(0x10u, 0, 0);
    if (v16 != (const void *)16)
    {
      Main = CFRunLoopGetMain();
      block[0] = off_1ECE0A5A0;
      block[1] = 3221225472;
      block[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_98;
      block[3] = &unk_1ECDB0298;
      block[4] = v16;
      CFRunLoopPerformBlock(Main, @"kCFRunLoopCommonModes", block);
      CFTypeRef v18 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v18);
      CFRelease(v16);
    }
  }
}

CFDictionaryRef __71___CFXPreferences_SearchListAdditions__updateSearchListsForIdentifier___block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  CFDictionaryRef result = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __36___CFXPreferences_resetPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  v2[0] = off_1ECE0A5A0;
  v2[1] = 3221225472;
  v2[2] = __36___CFXPreferences_resetPreferences___block_invoke_2;
  v2[3] = &unk_1ECE00CC8;
  char v3 = *(unsigned char *)(a1 + 48);
  v2[6] = a2;
  -[_CFXPreferences withNamedVolatileSources:](*(void *)(a1 + 32), (uint64_t)v2);
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[6] = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_2;
  v3[3] = &unk_1ECE00C28;
  uint64_t v2 = *(void *)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  v3[5] = a2;
  -[_CFXPreferences withNamedVolatileSources:](v2, (uint64_t)v3);
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  context[0] = off_1ECE0A5A0;
  context[1] = 3221225472;
  context[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3;
  context[3] = &unk_1ECE00C00;
  long long v3 = *(_OWORD *)(a1 + 32);
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)applyBlockApplier, context);
}

void __36___CFXPreferences_resetPreferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __36___CFXPreferences_resetPreferences___block_invoke_3;
  v3[3] = &unk_1ECE00CA0;
  char v4 = *(unsigned char *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 48);
  v3[6] = a2;
  void v3[7] = v2;
  -[_CFXPreferences withSources:](*(void *)(a1 + 32), (uint64_t)v3);
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke(uint64_t a1, id a2)
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (object_getClass(a2) == (Class)off_1ECE0A690)
  {
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      unint64_t v8 = reply;
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(v8);
    }
    else
    {
      CFStringRef v9 = (void *)MEMORY[0x185313310](a2);
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      uint64_t v10 = _CFPrefsClientLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = v9;
        _os_log_impl(&dword_182B90000, v10, OS_LOG_TYPE_INFO, "CFPrefs client received non-reply message: %s", buf, 0xCu);
      }
      _CFSetTSD(0xFu, 0, 0);
      free(v9);
    }
    if (_block_invoke_onceToken != -1) {
      dispatch_once(&_block_invoke_onceToken, &__block_literal_global_44);
    }
    CFDataRef v11 = _block_invoke_observationCallBackQueue;
    v12[0] = off_1ECE0A5A0;
    v12[1] = 3221225472;
    v12[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_2;
    v12[3] = &unk_1ECE00D90;
    v12[4] = a2;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    dispatch_async(v11, v12);
    objc_destroyWeak(&v13);
  }
  else if (a2 == off_1ECE0A658)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

void __36___CFXPreferences_resetPreferences___block_invoke_3(uint64_t a1, __CFDictionary *a2)
{
  void v12[5] = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  if (*(unsigned char *)(a1 + 64)) {
    -[_CFXPreferences destroyConnections](*(void **)(a1 + 32));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 48);
  if (v4)
  {
    Value = (void *)CFDictionaryGetValue(v4, @"NSRegistrationDomain");
    BOOL v6 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"NSArgumentDomain");
    if (Value) {
      id v7 = Value;
    }
    if (v6) {
      id v8 = v6;
    }
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 48));
    if (a2) {
      goto LABEL_9;
    }
  }
  else
  {
    Value = 0;
    BOOL v6 = 0;
    if (a2) {
LABEL_9:
    }
      CFDictionaryRemoveAllValues(a2);
  }
  CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 56);
  if (v9)
  {
    CFIndex Count = CFDictionaryGetCount(v9);
    if (Count)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable(0, Count, &kCFTypeArrayCallBacks);
      CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 56);
      v12[0] = off_1ECE0A5A0;
      v12[1] = 3221225472;
      v12[2] = __36___CFXPreferences_resetPreferences___block_invoke_4;
      v12[3] = &unk_1ECE00C78;
      v12[4] = *(void *)(a1 + 40);
      CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)applyBlockApplier, v12);
    }
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
  }
  if (Value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), @"NSRegistrationDomain", Value);
  }
  if (v6) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), @"NSArgumentDomain", v6);
  }
}

dispatch_queue_t __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_91()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("CFPreferences Remote KVO Callback Queue", v0);
  _block_invoke_observationCallBackQueue = (uint64_t)result;
  return result;
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_3()
{
  if ((__CF_FORK_STATE & 2) == 0) {
    __CF_USED();
  }
  if (__CF_FORK_STATE) {
    __THE_PROCESS_HAS_FORKED_AND_YOU_CANNOT_USE_THIS_COREFOUNDATION_FUNCTIONALITY___YOU_MUST_EXEC__();
  }
  if ((__CF_FORK_STATE & 1) == 0)
  {
    if (_CFPreferencesDoesNSUserDefaultsExist())
    {
      id v0 = _CFPreferencesCopyStandardUserDefaults();
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, @"NSUserDefaultsDidChangeNotification", v0, 0, 1u);
    }
    CFDictionaryRef v2 = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    long long v3 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v3, @"com.apple.CFPreferences._didChange", @"com.apple.CFPreferences", v2, 1u);
    CFRelease(v2);
  }
}

id __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke(uint64_t a1, void *a2)
{
  CFDictionaryRef v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (v4 != a2) {
        _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@ doesn't match %@", v4, a2);
      }
    }
    else if (v4 == a2)
    {
      __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_cold_1((uint64_t)a2);
    }
  }

  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(uint64_t a1, __CFString *a2, const __CFString *a3, int a4, const __CFString *a5)
{
  char v6 = a4;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  uint64_t v18 = 0;
  CFStringRef v19 = &v18;
  uint64_t v20 = 0x3052000000;
  int64_t v21 = __Block_byref_object_copy__2;
  __int16 v22 = __Block_byref_object_dispose__2;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  CacheKeyForQuintuplet = _CFPrefsCreateCacheKeyForQuintuplet(a2, a3, a4, a5, 0);
  uint64_t v11 = *(void *)(a1 + 32);
  v12[0] = off_1ECE0A5A0;
  v12[1] = 3221225472;
  v12[2] = __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_132;
  v12[3] = &unk_1ECDFF118;
  v12[4] = v11;
  void v12[5] = &v18;
  v12[8] = a2;
  v12[9] = a5;
  v12[10] = a3;
  char v13 = v6;
  void v12[6] = &v14;
  v12[7] = CacheKeyForQuintuplet;
  -[_CFXPreferences withSearchLists:](v11, (uint64_t)v12);
  if (*((unsigned char *)v15 + 24)) {
    [*(id *)(v19[5] + 112) setEnabled:1];
  }
  CFRelease(CacheKeyForQuintuplet);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

id __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_132(uint64_t a1, CFDictionaryRef theDict)
{
  v21[1] = *(CFPrefsConfigurationFileSource **)off_1ECE0A5B0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 56));
  CFDictionaryRef v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4) {
    return v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[CFPrefsSearchListSource alloc] initWithIdentifier:*(void *)(a1 + 64) containingPreferences:*(void *)(a1 + 32)];
  uint64_t v5 = _CFPrefsTestingCloudConfigurationOverrideURL;
  if (_CFPrefsTestingCloudConfigurationOverrideURL)
  {
    if (CFURLGetTypeID() == 29) {
      char v6 = (const void *)v5;
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  CFTypeRef cf = 0;
  v21[0] = 0;
  CFStringRef v7 = -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:](*(const __CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6, v21, (CFStringRef *)&cf);
  if (v7)
  {
    CFStringRef v8 = v7;
    -[CFPrefsSearchListSource addCloudSourceForIdentifier:configurationPath:storeName:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), (uint64_t)v7, (uint64_t)cf, *(const __CFString **)(a1 + 72));
    CFArrayRef v9 = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 80);
    CFIndex Count = CFArrayGetCount(v9);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 112) = CFArrayGetValueAtIndex(v9, Count - 1);
    CFRelease(v8);
  }
  -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(__CFString **)(a1 + 64), *(const __CFString **)(a1 + 80), *(unsigned __int8 *)(a1 + 88), *(const __CFString **)(a1 + 72));
  CFArrayRef v11 = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 80);
  CFIndex v12 = CFArrayGetCount(v11);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 104) = CFArrayGetValueAtIndex(v11, v12 - 1);
  if (v21[0])
  {
    -[CFPrefsSearchListSource addSource:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v21[0]);
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CFSetRef v14 = *(const __CFSet **)(v13 + 88);
  if (v14)
  {
    if (CFSetGetCount(v14) > 0)
    {
      BOOL v15 = 1;
      goto LABEL_18;
    }
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  CFArrayRef v16 = *(const __CFArray **)(v13 + 96);
  if (v16) {
    BOOL v15 = CFArrayGetCount(v16) > 0;
  }
  else {
    BOOL v15 = 0;
  }
LABEL_18:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v15;
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v17)
  {
    *(unsigned char *)(v17 + 120) = 1;
    uint64_t v18 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else
  {
    uint64_t v18 = 0;
  }
  CFDictionarySetValue(theDict, *(const void **)(a1 + 56), v18);

  if (cf) {
    CFRelease(cf);
  }
  CFDictionaryRef v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return v4;
}

id __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke(uint64_t a1, void *a2)
{
  CFDictionaryRef v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (v4 != a2) {
        __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_2();
      }
    }
    else if (v4 == a2)
    {
      __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_1();
    }
  }

  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __68___CFXPreferences_SearchListAdditions__copyDescriptionOfSearchLists__block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
}

void __50___CFXPreferences_unregisterUserDefaultsInstance___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __38___CFXPreferences_flushManagedSources__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (a2)
  {
    CFDictionaryRef v4 = _os_activity_create(&dword_182B90000, "Notifying CFPrefsD Of Updated Managed Preferences", (os_activity_t)off_1ECE0A638, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "CFPreferencesOperation", 3);
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3052000000;
    CFIndex v12 = __Block_byref_object_copy__6;
    uint64_t v13 = __Block_byref_object_dispose__6;
    uint64_t v14 = 0;
    char v6 = *(const os_unfair_lock **)(a1 + 32);
    v8[0] = off_1ECE0A5A0;
    v8[1] = 3221225472;
    v8[2] = __38___CFXPreferences_flushManagedSources__block_invoke_57;
    v8[3] = &unk_1ECE008C8;
    v8[5] = v5;
    v8[6] = &v9;
    void v8[4] = a2;
    CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v6, (uint64_t)v8);
    xpc_release(v5);
    CFStringRef v7 = (void *)v10[5];
    if (v7) {
      xpc_release(v7);
    }

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }
}

xpc_object_t __38___CFXPreferences_flushManagedSources__block_invoke_57(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __80___CFXPreferences_hasCloudValueForKey_appIdentifier_container_configurationURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = -[CFPrefsSearchListSource alreadylocked_hasCloudValueForKey:](a2, *(const __CFString **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

BOOL __88___CFXPreferences_hasNonRegisteredValueForKey_appIdentifier_container_configurationURL___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL result = -[CFPrefsSearchListSource alreadylocked_hasNonRegisteredValueForKey:](a2, *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __72___CFXPreferences_setDaemonCacheEnabled_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDaemonCacheEnabled:*(unsigned __int8 *)(a1 + 32)];
}

void __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (a2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v5 = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(a1 + 40));
    if (v5)
    {
      char v6 = v5;
      CFStringRef v7 = _os_activity_create(&dword_182B90000, "Flushing Cached Preferences Data", (os_activity_t)off_1ECE0A638, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v7, &state);
      xpc_dictionary_set_value(v4, "CFPreferencesDomain", v6);
      xpc_release(v6);
      xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 4);
      uint64_t v11 = 0;
      CFIndex v12 = &v11;
      uint64_t v13 = 0x3052000000;
      uint64_t v14 = __Block_byref_object_copy__6;
      BOOL v15 = __Block_byref_object_dispose__6;
      uint64_t v16 = 0;
      v10[0] = off_1ECE0A5A0;
      v10[1] = 3221225472;
      v10[2] = __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke_2;
      v10[3] = &unk_1ECE008C8;
      v10[5] = v4;
      v10[6] = &v11;
      v10[4] = a2;
      CFStringRef v8 = *(const os_unfair_lock **)(a1 + 32);
      if (*(_DWORD *)(a1 + 48) == 2) {
        CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v8, (uint64_t)v10);
      }
      else {
        CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v8, (uint64_t)v10);
      }
      xpc_release(v4);
      uint64_t v9 = (void *)v12[5];
      if (v9) {
        xpc_release(v9);
      }

      _Block_object_dispose(&v11, 8);
      os_activity_scope_leave(&state);
    }
    else
    {
      xpc_release(v4);
    }
  }
}

xpc_object_t __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke_2(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  if (a2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 999);
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000;
    uint64_t v11 = __Block_byref_object_copy__6;
    CFIndex v12 = __Block_byref_object_dispose__6;
    uint64_t v13 = 0;
    v7[0] = off_1ECE0A5A0;
    v7[1] = 3221225472;
    v7[2] = __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke_2;
    v7[3] = &unk_1ECE008C8;
    v7[5] = v4;
    v7[6] = &v8;
    v7[4] = a2;
    xpc_object_t v5 = *(const os_unfair_lock **)(a1 + 32);
    if (*(_DWORD *)(a1 + 40) == 2) {
      CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v5, (uint64_t)v7);
    }
    else {
      CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v5, (uint64_t)v7);
    }
    xpc_release(v4);
    char v6 = (void *)v9[5];
    if (v6) {
      xpc_release(v6);
    }
    _Block_object_dispose(&v8, 8);
  }
}

xpc_object_t __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke_2(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __73___CFXPreferences_setFileProtectionClass_identifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFileProtectionClass:*(unsigned int *)(a1 + 32)];
}

uint64_t __72___CFXPreferences_fileProtectionClassForIdentifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  bzero(v6, 0x400uLL);
  uint64_t result = _CFPrefsGetPathForTriplet((__CFString *)[a2 domainIdentifier], (const __CFString *)objc_msgSend(a2, "userIdentifier"), objc_msgSend(a2, "isByHost"), (CFStringRef)objc_msgSend(a2, "container"), (UInt8 *)v6);
  if (result)
  {
    uint64_t result = open_dprotected_np(v6, 0, 0, 1);
    if (result != -1)
    {
      int v5 = result;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fcntl(result, 63);
      return close(v5);
    }
  }
  return result;
}

uint64_t __56___CFXPreferences_setAccessRestricted_forAppIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessRestricted:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __101___CFXPreferences_fullCloudSynchronizeForAppIdentifier_container_configurationURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fullCloudSynchronizeWithCompletionHandler:*(void *)(a1 + 32)];
}

void __70___CFXPreferences_setCloudSyncEnabled_forKey_appIdentifier_container___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[6] = *(void *)off_1ECE0A5B0;
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_2;
  v4[3] = &unk_1ECE00AD8;
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  v4[5] = v3;
  withKeysAndValues(v2, (uint64_t)v4);
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v21[1] = *(void *)off_1ECE0A5B0;
  CFArrayRef v8 = *(const __CFArray **)(a1 + 40);
  if (v8)
  {
    unint64_t Count = CFArrayGetCount(v8);
    unint64_t v11 = Count;
    if (Count >> 60)
    {
      CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", Count);
      uint64_t v18 = +[NSException exceptionWithName:@"NSGenericException" reason:v17 userInfo:0];
      CFRelease(v17);
      objc_exception_throw(v18);
    }
    if (Count <= 1) {
      unint64_t Count = 1;
    }
    unint64_t v12 = MEMORY[0x1F4188790](Count, v10);
    uint64_t v14 = (const void **)((char *)v20 - v13);
    v21[0] = 0;
    if (v11 >= 0x101)
    {
      BOOL v15 = (const void **)_CFCreateArrayStorage(v12, 0, v21);
      uint64_t v14 = v15;
    }
    else
    {
      BOOL v15 = 0;
      if (!v11) {
        goto LABEL_11;
      }
    }
    v22.location = 0;
    v22.length = v11;
    CFArrayGetValues(*(CFArrayRef *)(a1 + 40), v22, v14);
  }
  else
  {
    MEMORY[0x1F4188790](0, a2);
    uint64_t v14 = (const void **)&v19;
    BOOL v15 = 0;
    unint64_t v11 = 0;
    v21[0] = 0;
  }
LABEL_11:
  -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:](*(os_unfair_lock_s **)(a1 + 32), a3, a2, a4, 1, (uint64_t)v14, v11, 0);
  uint64_t v16 = *(void **)(a1 + 32);
  v20[0] = off_1ECE0A5A0;
  v20[1] = 3221225472;
  CFStringRef v20[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_3;
  v20[3] = &unk_1ECE00AB0;
  v20[4] = v16;
  v20[5] = a3;
  v20[6] = a2;
  v20[7] = a4;
  v20[8] = v14;
  v20[9] = v11;
  [v16 transitionIntoDirectModeIfNeededWithRetryBlock:v20];
  free(v15);
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_3(uint64_t a1)
{
}

void __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke_2(uint64_t a1)
{
}

void __74___CFXPreferences_copyManagedValuesForKeys_identifier_useSystemContainer___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_lock(a2 + 13);
  CFArrayRef v4 = *(const __CFArray **)(a1 + 40);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        uint64_t v9 = (const void *)-[CFPrefsSearchListSource alreadylocked_copyManagedValueForKey:]();
        if (v9)
        {
          uint64_t v10 = v9;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), ValueAtIndex, v9);
          CFRelease(v10);
        }
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -[CFPrefsSearchListSource alreadylocked_copyManagedDictionary](a2);
  }

  os_unfair_lock_unlock(a2 + 13);
}

void __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke_2(uint64_t a1)
{
}

void __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[7] = *(void *)off_1ECE0A5B0;
  CFArrayRef v8 = *(const os_unfair_lock **)(a1 + 32);
  uint64_t v9 = *(__CFString **)(a1 + 40);
  uint64_t v10 = *(__CFString **)(a1 + 48);
  int v11 = CFEqual(*(CFTypeRef *)(a1 + 56), @"kCFPreferencesCurrentHost");
  CFStringRef v12 = *(const __CFString **)(a1 + 64);
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke_2;
  v13[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v13[4] = a3;
  void v13[5] = a2;
  v13[6] = a4;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](v8, v9, v10, v11 != 0, v12, 0, (uint64_t)v13);
}

void __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
}

void __47___CFXPreferences_removeVolatileSourceForName___block_invoke(uint64_t a1, CFMutableDictionaryRef theDict)
{
}

os_unfair_lock_s *__59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke_2(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t result = (os_unfair_lock_s *)CFDictionaryGetValue(theDict, *(const void **)(a1 + 40));
  if (result)
  {
    uint64_t result = -[CFPrefsSource copyDictionary](result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __38___CFXPreferences_volatileSourceNames__block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  v12[1] = *(void *)off_1ECE0A5B0;
  CFIndex Count = CFDictionaryGetCount(theDict);
  if (Count >= 1)
  {
    unint64_t v6 = Count;
    if ((unint64_t)Count >> 60)
    {
      CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", Count);
      int v11 = +[NSException exceptionWithName:@"NSGenericException" reason:v10 userInfo:0];
      CFRelease(v10);
      objc_exception_throw(v11);
    }
    MEMORY[0x1F4188790](Count, v5);
    CFArrayRef v8 = (const void **)((char *)v12 - v7);
    v12[0] = 0;
    if (v6 >= 0x101)
    {
      CFArrayRef v8 = (const void **)_CFCreateArrayStorage(v6, 0, v12);
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = 0;
    }
    CFDictionaryGetKeysAndValues(theDict, v8, 0);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v8, v6, &kCFTypeArrayCallBacks);
    free(v9);
  }
}

void __39___CFXPreferences_resetUserPreferences__block_invoke(uint64_t a1, uint64_t a2)
{
  void v2[7] = *(void *)off_1ECE0A5B0;
  v2[0] = off_1ECE0A5A0;
  v2[1] = 3221225472;
  v2[2] = __39___CFXPreferences_resetUserPreferences__block_invoke_2;
  v2[3] = &unk_1ECE00D40;
  v2[6] = a2;
  -[_CFXPreferences withNamedVolatileSources:](*(void *)(a1 + 32), (uint64_t)v2);
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void v3[8] = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __39___CFXPreferences_resetUserPreferences__block_invoke_3;
  v3[3] = &unk_1ECE00D18;
  uint64_t v2 = *(void *)(a1 + 48);
  v3[6] = a2;
  void v3[7] = v2;
  -[_CFXPreferences withSources:](*(void *)(a1 + 32), (uint64_t)v3);
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_3(uint64_t a1, const __CFDictionary *a2)
{
  v24[5] = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  if (v5)
  {
    xpc_release(v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  *(void *)(v4 + 40) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  LODWORD(v6) = CFDictionaryGetCount(a2);
  uint64_t v7 = (const void **)malloc_type_malloc(8 * (int)v6, 0x6004044C4A2DFuLL);
  CFArrayRef v8 = (const void **)malloc_type_malloc(8 * (int)v6, 0x80040B8603338uLL);
  if (!v7 || (uint64_t v9 = v8) == 0) {
    __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_1();
  }
  CFDictionaryGetKeysAndValues(a2, v7, v8);
  if ((int)v6 >= 1)
  {
    uint64_t v6 = v6;
    CFStringRef v10 = (id *)v9;
    int v11 = v7;
    do
    {
      if ([*v10 servedByUserSessionDaemon]) {
        CFDictionaryRemoveValue(a2, *v11);
      }
      ++v11;
      ++v10;
      --v6;
    }
    while (v6);
  }
  free(v7);
  free(v9);
  CFDictionaryRef v12 = *(const __CFDictionary **)(a1 + 48);
  if (v12)
  {
    int Count = CFDictionaryGetCount(v12);
    uint64_t v14 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    BOOL v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    if (!v14 || (uint64_t v16 = v15) == 0) {
      __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_2();
    }
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 48), v14, v15);
    if (Count >= 1)
    {
      uint64_t v17 = Count;
      uint64_t v18 = (id *)v16;
      uint64_t v19 = v14;
      do
      {
        uint64_t v20 = *v19;
        if ([*v18 servedByUserSessionDaemon]
          && !CFEqual(v20, @"NSRegistrationDomain")
          && !CFEqual(v20, @"NSArgumentDomain"))
        {
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), *v19);
        }
        ++v19;
        ++v18;
        --v17;
      }
      while (v17);
    }
    free(v14);
    free(v16);
  }
  CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 56);
  if (v21)
  {
    CFIndex v22 = CFDictionaryGetCount(v21);
    if (v22)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFArrayCreateMutable(0, v22, &kCFTypeArrayCallBacks);
      CFDictionaryRef v23 = *(const __CFDictionary **)(a1 + 56);
      v24[0] = off_1ECE0A5A0;
      v24[1] = 3221225472;
      v24[2] = __39___CFXPreferences_resetUserPreferences__block_invoke_4;
      v24[3] = &unk_1ECE00C78;
      v24[4] = *(void *)(a1 + 40);
      CFDictionaryApplyFunction(v23, (CFDictionaryApplierFunction)applyBlockApplier, v24);
    }
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
  }
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_4(uint64_t a1, int a2, void *value)
{
}

void __37___CFXPreferences_shmemForRole_name___block_invoke(uint64_t a1)
{
  uint64_t v2 = _CFPrefsClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __37___CFXPreferences_shmemForRole_name___block_invoke_cold_1(a1, v2);
  }
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke(uint64_t a1)
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = off_1ECE0A5A0;
  v8[1] = 3221225472;
  v8[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_2;
  v8[3] = &unk_1ECE00E08;
  void v8[4] = v2;
  long long v9 = *(_OWORD *)(a1 + 48);
  -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v2, v3, @"kCFPreferencesCurrentUser", 1, (uint64_t)v8);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_6;
  v6[3] = &unk_1ECE00E08;
  v6[4] = v4;
  long long v7 = *(_OWORD *)(a1 + 48);
  -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v4, v5, @"kCFPreferencesAnyUser", 1, (uint64_t)v6);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_2(uint64_t *a1, void *a2)
{
  v15[5] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = (const os_unfair_lock *)a1[4];
  uint64_t v6 = (__CFString *)a1[5];
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  v15[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_3;
  v15[3] = &unk_1ECE00DE0;
  v15[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v5, v6, @"kCFPreferencesCurrentUser", (uint64_t)v15);
  uint64_t v7 = a1[4];
  CFArrayRef v8 = (__CFString *)a1[5];
  CFStringRef v9 = (const __CFString *)a1[6];
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_4;
  v14[3] = &unk_1ECDFEF18;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v7, v8, @"kCFPreferencesCurrentUser", 1, v9, 0, (uint64_t)v14);
  uint64_t v10 = a1[4];
  int v11 = (__CFString *)a1[5];
  CFStringRef v12 = (const __CFString *)a1[6];
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_5;
  v13[3] = &unk_1ECDFEF18;
  v13[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v10, v11, @"kCFPreferencesCurrentUser", 0, v12, 0, (uint64_t)v13);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_3(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_4(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_5(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_6(uint64_t *a1, void *a2)
{
  v15[5] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = (const os_unfair_lock *)a1[4];
  uint64_t v6 = (__CFString *)a1[5];
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  v15[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_7;
  v15[3] = &unk_1ECE00DE0;
  v15[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v5, v6, @"kCFPreferencesAnyUser", (uint64_t)v15);
  uint64_t v7 = a1[4];
  CFArrayRef v8 = (__CFString *)a1[5];
  CFStringRef v9 = (const __CFString *)a1[6];
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_8;
  v14[3] = &unk_1ECDFEF18;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v7, v8, @"kCFPreferencesAnyUser", 1, v9, 0, (uint64_t)v14);
  uint64_t v10 = a1[4];
  int v11 = (__CFString *)a1[5];
  CFStringRef v12 = (const __CFString *)a1[6];
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_9;
  v13[3] = &unk_1ECDFEF18;
  v13[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v10, v11, @"kCFPreferencesAnyUser", 0, v12, 0, (uint64_t)v13);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_7(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_8(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_9(uint64_t a1, const void *a2)
{
}

void __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  v6[6] = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock(a2 + 13);
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke_2;
  v6[3] = &unk_1ECE00E58;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = a2;
  void v6[5] = v5;
  [v4 enumerateObjectsUsingBlock:v6];
  os_unfair_lock_unlock(a2 + 13);
  -[_CFXPreferences _deliverPendingKVONotifications](*(const os_unfair_lock **)(a1 + 48));
}

uint64_t __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");

  return [v3 deferredNotifyCausedByLoadingOfChangesFromDictionary:a2 toDictionary:v4];
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  uint64_t v3 = *a2;
  uint64_t v4 = "current host";
  if (!*(unsigned char *)(a1 + 81)) {
    uint64_t v4 = "any host";
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  int v7 = 138544131;
  uint64_t v8 = v5;
  __int16 v9 = 2113;
  uint64_t v10 = v3;
  __int16 v11 = 2082;
  CFStringRef v12 = v4;
  __int16 v13 = 2114;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "Disabling saving preferences for { %{public}@, %{private}@, %{public}s, %{public}@ } because home directory is inaccessible", (uint8_t *)&v7, 0x2Au);
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216_cold_2(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_182B90000, log, OS_LOG_TYPE_DEBUG, "CFPreferences: user home directory is unavailable. User domains will be volatile.", v1, 2u);
}

void __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_cold_1(uint64_t a1)
{
}

void __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_1()
{
  __assert_rtn("-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]_block_invoke", "CFPrefsSearchListSource.m", 1782, "previous != src");
}

void __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_2()
{
  __assert_rtn("-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]_block_invoke", "CFPrefsSearchListSource.m", 1780, "previous == src");
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3_cold_1()
{
  __assert_rtn("-[_CFXPreferences ingestVolatileStateFromPreferences:]_block_invoke_3", "CFXPreferences.m", 1223, "copy != NULL");
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_1()
{
}

void __39___CFXPreferences_resetUserPreferences__block_invoke_3_cold_2()
{
}

void __37___CFXPreferences_shmemForRole_name___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_182B90000, a2, OS_LOG_TYPE_FAULT, "Couldn't map preferences shmem named %{public}s", (uint8_t *)&v3, 0xCu);
}

@end
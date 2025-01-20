@interface LSLocalizedStringRecord
@end

@implementation LSLocalizedStringRecord

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = LaunchServices::LocalizedString::localizeUnsafely(a5, *a2, *(void **)(a1 + 32));
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __46___LSLocalizedStringRecord_defaultStringValue__block_invoke(uint64_t a1, _LSDatabase **a2, int a3, int a4, LaunchServices::LocalizedString *this)
{
  uint64_t v6 = LaunchServices::LocalizedString::getDefaultValueUnsafely(this, *a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel__allUnsanitizedStringValues];
  v3 = v2;
  if (!v2) {
    goto LABEL_17;
  }
  v4 = [v2 allKeys];
  v5 = [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel__missingBundleLocs];
  if (v5)
  {
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    v4 = (void *)v6;
  }
  else
  {
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      Name = sel_getName(*(SEL *)(a1 + 56));
      __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_2((uint64_t)Name, buf, v7);
    }
  }
  if (v4)
  {
    CFArrayRef v9 = (const __CFArray *)*(id *)(a1 + 40);
    if (v9
      || ([(id)__LSDefaultsGetSharedInstance() preferredLocalizations],
          (CFArrayRef v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_10:
      CFArrayRef v10 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v4, v9);
LABEL_11:
      if ([(__CFArray *)v10 count])
      {
        v11 = [(__CFArray *)v10 objectAtIndexedSubscript:0];
        uint64_t v12 = [v3 objectForKeyedSubscript:v11];
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      goto LABEL_14;
    }
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      CFArrayRef v9 = 0;
    }
    else
    {
      if (_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::onceToken != -1) {
        dispatch_once(&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::onceToken, &__block_literal_global_50);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheLock);
      if (!_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache
        || mach_absolute_time()
         - _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheTime > _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::maxCacheTimeAbsolute)
      {
        uint64_t v29 = 0;
        v30[0] = &v29;
        v30[1] = 0x3032000000;
        v30[2] = __Block_byref_object_copy__35;
        v30[3] = __Block_byref_object_dispose__35;
        id v31 = 0;
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x3032000000;
        v26 = __Block_byref_object_copy__35;
        v27 = __Block_byref_object_dispose__35;
        id v28 = 0;
        int v18 = 11;
        while (1)
        {
          v19 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, 0);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = ___ZL78_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcessesv_block_invoke_43;
          v22[3] = &unk_1E522FCD0;
          v22[4] = &v23;
          v22[5] = &v29;
          [v19 getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:v22];
          if (v24[5] || !_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v30[0] + 40))) {
            break;
          }

          if (--v18 <= 1) {
            goto LABEL_30;
          }
        }

LABEL_30:
        v20 = (void *)v24[5];
        if (!v20)
        {
          v21 = _LSDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_1((uint64_t)v30, v21);
          }

          v20 = (void *)v24[5];
        }
        objc_storeStrong((id *)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache, v20);
        _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheTime = mach_absolute_time();
        _Block_object_dispose(&v23, 8);

        _Block_object_dispose(&v29, 8);
      }
      CFArrayRef v9 = (const __CFArray *)(id)_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache;
      os_unfair_lock_unlock((os_unfair_lock_t)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheLock);
      if (v9) {
        goto LABEL_10;
      }
    }
    CFArrayRef v10 = 0;
    goto LABEL_11;
  }
LABEL_14:
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v15 = [v3 objectForKeyedSubscript:@"LSDefaultLocalizedValue"];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
LABEL_17:
}

void __43___LSLocalizedStringRecord_allStringValues__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "sanitizeString:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __46___LSLocalizedStringRecord_defaultStringValue__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel__allUnsanitizedStringValues];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 objectForKeyedSubscript:@"LSDefaultLocalizedValue"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = v6;
  }
}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "could not fetch preferred locales for LSLocalizedStringRecord: %@", (uint8_t *)&v3, 0xCu);
}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_2(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Could not find missing localizations computing string value in %s... resulting locale may be unexpected!", buf, 0xCu);
}

@end
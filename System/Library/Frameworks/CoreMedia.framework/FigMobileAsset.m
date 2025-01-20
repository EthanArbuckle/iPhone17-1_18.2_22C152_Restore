@interface FigMobileAsset
@end

@implementation FigMobileAsset

void __FigMobileAsset_RegisterForAssetUpdates_block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    CFArrayRef v3 = (const __CFArray *)*((void *)Value + 3);
    if (v3)
    {
      CFIndex v4 = 0;
      while (1)
      {
        CFIndex Count = CFArrayGetCount(v3);
        v6 = (__CFArray *)*((void *)Value + 3);
        if (Count <= v4) {
          break;
        }
        ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)Value + 3), v4);
        if (*ValueAtIndex == *(void *)(a1 + 64) && ValueAtIndex[1] == *(void *)(a1 + 72)) {
          goto LABEL_44;
        }
        ++v4;
        CFArrayRef v3 = (const __CFArray *)*((void *)Value + 3);
        if (!v3) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      v6 = 0;
    }
    CFArrayRef v8 = *(const __CFArray **)(a1 + 56);
    if (v8) {
      v9.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    }
    else {
      v9.length = 0;
    }
    v9.location = 0;
    CFArrayAppendArray(v6, v8, v9);
    if (dword_1E9272E18)
    {
      name[0] = 0;
      LOBYTE(v50) = 0;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, name, &v50);
      unsigned int v30 = name[0];
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)v50)) {
        unsigned int v32 = v30;
      }
      else {
        unsigned int v32 = v30 & 0xFFFFFFFE;
      }
      if (v32)
      {
        uint64_t v33 = *(void *)(a1 + 32);
        uint64_t v34 = *(void *)(a1 + 64);
        int buffer = 136315650;
        v63 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke";
        __int16 v64 = 2112;
        uint64_t v65 = v33;
        __int16 v66 = 2048;
        uint64_t v67 = v34;
        v35 = (unsigned char *)_os_log_send_and_compose_impl();
        LOBYTE(v30) = name[0];
      }
      else
      {
        v35 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v35, v35 != v60, v30, 0, v31);
    }
  }
  else
  {
    v10 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10600408109E9C4uLL);
    *(_DWORD *)v10 = *(_DWORD *)(a1 + 80);
    CFTypeRef v11 = *(CFTypeRef *)(a1 + 40);
    if (v11) {
      CFTypeRef v11 = CFRetain(v11);
    }
    *((void *)v10 + 1) = v11;
    CFTypeRef v12 = *(CFTypeRef *)(a1 + 48);
    if (v12) {
      CFTypeRef v12 = CFRetain(v12);
    }
    *((void *)v10 + 2) = v12;
    CFTypeRef v13 = *(CFTypeRef *)(a1 + 56);
    if (v13) {
      CFTypeRef v13 = CFRetain(v13);
    }
    int v14 = *(_DWORD *)(a1 + 84);
    *((void *)v10 + 4) = -1;
    *((void *)v10 + 5) = 0x10000000000000;
    *((void *)v10 + 3) = v13;
    *((double *)v10 + 6) = (double)(3600 * v14);
    CFPropertyListRef v15 = CFPreferencesCopyValue(@"mobileAssetUpdateTimes", @"com.apple.celestial", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    v16 = v15;
    if (v15)
    {
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == CFDictionaryGetTypeID()
        && !FigCFDictionaryGetDoubleIfPresent((uint64_t)v16, *(const void **)(a1 + 32), v10 + 40))
      {
        *((void *)v10 + 5) = 0x10000000000000;
      }
    }
    CFStringGetCString(*(CFStringRef *)(a1 + 32), (char *)&buffer, 100, 0x8000100u);
    __strlcat_chk();
    if (figMobileAsset_GetNotificationQueue_onceToken != -1) {
      dispatch_once(&figMobileAsset_GetNotificationQueue_onceToken, &__block_literal_global_42);
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __FigMobileAsset_RegisterForAssetUpdates_block_invoke_2;
    handler[3] = &__block_descriptor_68_e8_v12__0i8l;
    int v49 = *(_DWORD *)(a1 + 80);
    long long v18 = *(_OWORD *)(a1 + 48);
    long long v47 = *(_OWORD *)(a1 + 32);
    long long v48 = v18;
    notify_register_dispatch((const char *)&buffer, (int *)v10 + 8, (dispatch_queue_t)figMobileAsset_GetNotificationQueue_mobileAssetNotificationQueue, handler);
    CFStringGetCString(*(CFStringRef *)(a1 + 32), (char *)name, 100, 0x8000100u);
    __strlcat_chk();
    if (figMobileAsset_GetNotificationQueue_onceToken != -1) {
      dispatch_once(&figMobileAsset_GetNotificationQueue_onceToken, &__block_literal_global_42);
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __FigMobileAsset_RegisterForAssetUpdates_block_invoke_7;
    v42[3] = &__block_descriptor_68_e8_v12__0i8l;
    int v45 = *(_DWORD *)(a1 + 80);
    long long v19 = *(_OWORD *)(a1 + 48);
    long long v43 = *(_OWORD *)(a1 + 32);
    long long v44 = v19;
    notify_register_dispatch((const char *)name, (int *)v10 + 9, (dispatch_queue_t)figMobileAsset_GetNotificationQueue_mobileAssetNotificationQueue, v42);
    CFDictionarySetValue((CFMutableDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32), v10);
    if (dword_1E9272E18)
    {
      int v41 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, &v41, &type);
      int v21 = v41;
      if (os_log_type_enabled(v20, type)) {
        unsigned int v23 = v21;
      }
      else {
        unsigned int v23 = v21 & 0xFFFFFFFE;
      }
      if (v23)
      {
        uint64_t v24 = *(void *)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 64);
        int v27 = *(_DWORD *)(a1 + 80);
        int v26 = *(_DWORD *)(a1 + 84);
        int v50 = 136316163;
        v51 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke";
        __int16 v52 = 2113;
        uint64_t v53 = v24;
        __int16 v54 = 2048;
        uint64_t v55 = v25;
        __int16 v56 = 1024;
        int v57 = v26;
        __int16 v58 = 1024;
        int v59 = v27;
        v28 = (unsigned char *)_os_log_send_and_compose_impl();
        LOBYTE(v21) = v41;
      }
      else
      {
        v28 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v28, v28 != v60, v21, 0, v22);
    }
    if (v16) {
      CFRelease(v16);
    }
  }
LABEL_44:
  if (CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32))) {
    figMobileAsset_DownloadCatalogAndRequery(*(CFTypeRef *)(a1 + 32), 0);
  }
  v36 = *(const void **)(a1 + 32);
  if (v36) {
    CFRelease(v36);
  }
  v37 = *(const void **)(a1 + 40);
  if (v37) {
    CFRelease(v37);
  }
  v38 = *(const void **)(a1 + 48);
  if (v38) {
    CFRelease(v38);
  }
  v39 = *(const void **)(a1 + 56);
  if (v39) {
    CFRelease(v39);
  }
}

void __FigMobileAsset_RegisterForAssetUpdates_block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dword_1E9272E18)
  {
    v9[0] = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, v9, &type);
    int v3 = v9[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v5 = v3;
    }
    else {
      unsigned int v5 = v3 & 0xFFFFFFFE;
    }
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v9[1] = 136315395;
      v10 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke_2";
      __int16 v11 = 2113;
      uint64_t v12 = v6;
      v7 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v3) = v9[0];
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v7, v7 != &v13, v3, 0, v4);
  }
  figMobileAsset_QueryMostRecentAsset(*(const void **)(a1 + 32), 0, *(_DWORD *)(a1 + 64), 1, *(const __CFDictionary **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56));
}

void __FigMobileAsset_RegisterForAssetUpdates_block_invoke_7(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dword_1E9272E18)
  {
    v9[0] = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, v9, &type);
    int v3 = v9[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
      unsigned int v5 = v3;
    }
    else {
      unsigned int v5 = v3 & 0xFFFFFFFE;
    }
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v9[1] = 136315395;
      v10 = "FigMobileAsset_RegisterForAssetUpdates_block_invoke";
      __int16 v11 = 2113;
      uint64_t v12 = v6;
      v7 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v3) = v9[0];
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v7, v7 != &v13, v3, 0, v4);
  }
  figMobileAsset_QueryMostRecentAsset(*(const void **)(a1 + 32), 0, *(_DWORD *)(a1 + 64), 1, *(const __CFDictionary **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56));
}

void __FigMobileAsset_UnregisterFromAssetUpdates_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    CFDictionaryRemoveValue((CFMutableDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    int v3 = Value[8];
    if (v3 != -1)
    {
      notify_cancel(v3);
      Value[8] = -1;
    }
    int v4 = Value[9];
    if (v4 != -1)
    {
      notify_cancel(v4);
      Value[9] = -1;
    }
    unsigned int v5 = (const void *)*((void *)Value + 1);
    if (v5)
    {
      CFRelease(v5);
      *((void *)Value + 1) = 0;
    }
    uint64_t v6 = (const void *)*((void *)Value + 2);
    if (v6) {
      CFRelease(v6);
    }
    free(Value);
    if (dword_1E9272E18)
    {
      v15[0] = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, v15, &type);
      int v8 = v15[0];
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
        unsigned int v10 = v8;
      }
      else {
        unsigned int v10 = v8 & 0xFFFFFFFE;
      }
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        v15[1] = 136315395;
        v16 = "FigMobileAsset_UnregisterFromAssetUpdates_block_invoke";
        __int16 v17 = 2113;
        uint64_t v18 = v11;
        uint64_t v12 = (char *)_os_log_send_and_compose_impl();
        LOBYTE(v8) = v15[0];
      }
      else
      {
        uint64_t v12 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v12, v12 != &v19, v8, 0, v9);
    }
  }
  char v13 = *(const void **)(a1 + 32);
  if (v13) {
    CFRelease(v13);
  }
}

void __FigMobileAsset_UnregisterCallbackFromAssetUpdates_block_invoke(uint64_t a1)
{
  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    CFArrayRef v3 = (const __CFArray *)*((void *)Value + 3);
    if (v3)
    {
      CFIndex v4 = 0;
      while (CFArrayGetCount(v3) > v4)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)Value + 3), v4);
        if (*ValueAtIndex == *(void *)(a1 + 40) && ValueAtIndex[1] == *(void *)(a1 + 48))
        {
          CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)Value + 3), v4);
          break;
        }
        ++v4;
        CFArrayRef v3 = (const __CFArray *)*((void *)Value + 3);
        if (!v3) {
          break;
        }
      }
    }
  }
  uint64_t v6 = *(const void **)(a1 + 32);
  if (v6)
  {
    CFRelease(v6);
  }
}

@end
@interface CBPreferencesHandler
+ (BOOL)migrateNestedPreferenceForAllUsersWithKey1:(id)a3 key2:(id)a4 toKey:(id)a5;
+ (BOOL)storeNestedPreferenceForAllUsersWithKey1:(id)a3 key2:(id)a4 key3:(id)a5 andValue:(id)a6;
+ (BOOL)storePreferenceForAllUsersForKey:(id)a3 andValue:(id)a4;
+ (BOOL)storePreferenceForAllUsersMultiple:(id)a3;
+ (BOOL)storePreferenceForUser:(id)a3 withKey:(id)a4 andValue:(id)a5;
+ (__CFDictionary)copyPreferenceDictionaryForUser:(id)a3;
+ (id)copyNestedPreferenceForKey1:(id)a3 key2:(id)a4;
+ (id)copyNestedPreferenceForKey1:(id)a3 key2:(id)a4 key3:(id)a5;
+ (id)copyPreferenceForAllUsersForKey:(id)a3;
+ (id)copyPreferenceForAllUsersMultiple:(id)a3;
+ (id)copyPreferenceForUser:(id)a3 forKey:(id)a4;
+ (void)consistencyCheckForUser:(id)a3;
@end

@implementation CBPreferencesHandler

+ (void)consistencyCheckForUser:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v20 = a1;
  SEL v19 = a2;
  CFStringRef v18 = (CFStringRef)a3;
  v9 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  v10 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v17 = 0;
  id v17 = (id)CFPreferencesCopyValue(v18, @"com.apple.CoreBrightness", *v9, *v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v17 objectForKey:@"DisplayServicesExternalAmbientLightCompensation"])
  {
    os_log_t v16 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      inited = init_default_corebrightness_log();
    }
    os_log_t v16 = inited;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_64_8_66((uint64_t)v21, @"DisplayServicesExternalAmbientLightCompensation", (uint64_t)v18);
      _os_log_impl(&dword_1BA438000, v16, v15, "detected deprecated key %@ for %{public}@ - removing", v21, 0x16u);
    }
    id v14 = (id)[v17 mutableCopy];
    if (v14)
    {
      [v14 removeObjectForKey:@"DisplayServicesExternalAmbientLightCompensation"];
      v6 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
      v7 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
      CFPreferencesSetValue(v18, v14, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      if (!CFPreferencesSynchronize(@"com.apple.CoreBrightness", *v6, *v7))
      {
        v13 = 0;
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          v5 = init_default_corebrightness_log();
        }
        v13 = v5;
        char v12 = 16;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v3 = v13;
          os_log_type_t v4 = v12;
          __os_log_helper_16_0_0(v11);
          _os_log_error_impl(&dword_1BA438000, v3, v4, "ERROR: failed to update the preferences after sanity check", v11, 2u);
        }
      }
    }
  }
}

+ (BOOL)storePreferenceForUser:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  BOOL v10 = 1;
  theDict = +[CBPreferencesHandler copyPreferenceDictionaryForUser:a3];
  if (!theDict)
  {
    theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
LABEL_5:
    if (theDict)
    {
      CFDictionarySetValue(theDict, a4, a5);
      v6 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
      v7 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
      CFPreferencesSetValue((CFStringRef)a3, theDict, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      CFPreferencesSynchronize(@"com.apple.CoreBrightness", *v6, *v7);
    }
    else
    {
      BOOL v10 = 0;
    }
    goto LABEL_8;
  }
  CFTypeRef cf1 = CFDictionaryGetValue(theDict, a4);
  if (!cf1 || !CFEqual(cf1, a5)) {
    goto LABEL_5;
  }
LABEL_8:
  if (theDict) {
    CFRelease(theDict);
  }
  return v10;
}

+ (BOOL)storeNestedPreferenceForAllUsersWithKey1:(id)a3 key2:(id)a4 key3:(id)a5 andValue:(id)a6
{
  BOOL v20 = 1;
  CFDictionaryRef Mutable = 0;
  CFTypeRef cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:a3];
  if (cf && (CFTypeID TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(cf)))
  {
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)cf);
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(allocator, Count, (CFDictionaryRef)cf);
  }
  else
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  if (MutableCopy)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, a4);
    if (Value && (CFTypeID v12 = CFDictionaryGetTypeID(), v12 == CFGetTypeID(Value)))
    {
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex v7 = CFDictionaryGetCount(Value);
      CFDictionaryRef Mutable = CFDictionaryCreateMutableCopy(v11, v7, Value);
    }
    else
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    if (Mutable)
    {
      CFTypeRef cf1 = CFDictionaryGetValue(Mutable, a5);
      if (cf1 && a6 && CFEqual(cf1, a6))
      {
        BOOL v20 = 0;
      }
      else
      {
        if (a6)
        {
          CFDictionarySetValue(Mutable, a5, a6);
        }
        else if (cf1)
        {
          CFDictionaryRemoveValue(Mutable, a5);
        }
        CFDictionarySetValue(MutableCopy, a4, Mutable);
        v9 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
        BOOL v10 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
        CFPreferencesSetValue((CFStringRef)a3, MutableCopy, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
        CFPreferencesSynchronize(@"com.apple.CoreBrightness", *v9, *v10);
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v20;
}

+ (BOOL)migrateNestedPreferenceForAllUsersWithKey1:(id)a3 key2:(id)a4 toKey:(id)a5
{
  BOOL v18 = 1;
  CFDictionaryRef MutableCopy = 0;
  CFMutableDictionaryRef v16 = 0;
  CFTypeRef cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:a3];
  if (cf)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)cf);
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(allocator, Count, (CFDictionaryRef)cf);
    }
  }
  if (MutableCopy)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, a4);
    if (Value)
    {
      CFTypeID v11 = CFDictionaryGetTypeID();
      if (v11 == CFGetTypeID(Value))
      {
        CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFIndex v6 = CFDictionaryGetCount(Value);
        CFMutableDictionaryRef v16 = CFDictionaryCreateMutableCopy(v10, v6, Value);
      }
    }
    if (v16)
    {
      CFDictionaryRemoveValue(MutableCopy, a4);
      CFDictionarySetValue(MutableCopy, a5, v16);
      v8 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
      v9 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
      CFPreferencesSetValue((CFStringRef)a3, MutableCopy, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      CFPreferencesSynchronize(@"com.apple.CoreBrightness", *v8, *v9);
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v18;
}

+ (BOOL)storePreferenceForAllUsersForKey:(id)a3 andValue:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  v5 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  CFIndex v6 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue((CFStringRef)a3, a4, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return CFPreferencesSynchronize(@"com.apple.CoreBrightness", *v5, *v6) != 0;
}

+ (id)copyPreferenceForUser:(id)a3 forKey:(id)a4
{
  theDict = +[CBPreferencesHandler copyPreferenceDictionaryForUser:a3];
  if (!theDict) {
    return 0;
  }
  CFTypeRef cf = CFDictionaryGetValue(theDict, a4);
  if (cf) {
    CFRetain(cf);
  }
  CFRelease(theDict);
  return (id)cf;
}

+ (id)copyNestedPreferenceForKey1:(id)a3 key2:(id)a4
{
  CFTypeRef Value = 0;
  CFTypeRef cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:a3];
  if (cf)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      CFTypeRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, a4);
      if (Value) {
        CFRetain(Value);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return (id)Value;
}

+ (id)copyNestedPreferenceForKey1:(id)a3 key2:(id)a4 key3:(id)a5
{
  CFTypeRef v10 = 0;
  CFTypeRef cf = +[CBPreferencesHandler copyPreferenceForAllUsersForKey:a3];
  if (cf)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf, a4);
      if (Value)
      {
        CFTypeID v6 = CFDictionaryGetTypeID();
        if (v6 == CFGetTypeID(Value))
        {
          CFTypeRef v10 = CFDictionaryGetValue(Value, a5);
          if (v10) {
            CFRetain(v10);
          }
        }
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return (id)v10;
}

+ (id)copyPreferenceForAllUsersForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = 0;
  if (CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]))
  {
    return (id)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  }
  if (_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  }
  else {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v7, (uint64_t)a3);
    _os_log_error_impl(&dword_1BA438000, inited, OS_LOG_TYPE_ERROR, "failed to synchronise the preferences (%{public}@)", v7, 0xCu);
  }
  return v5;
}

+ (id)copyPreferenceForAllUsersMultiple:(id)a3
{
  id v12 = a1;
  SEL v11 = a2;
  CFArrayRef v10 = (CFArrayRef)a3;
  if (CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]))
  {
    return CFPreferencesCopyMultiple(v10, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  }
  os_log_t oslog = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  }
  else {
    inited = init_default_corebrightness_log();
  }
  os_log_t oslog = inited;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v5 = type;
    __os_log_helper_16_0_0(v7);
    _os_log_error_impl(&dword_1BA438000, log, v5, "failed to synchronise the preferences", v7, 2u);
  }
  return 0;
}

+ (BOOL)storePreferenceForAllUsersMultiple:(id)a3
{
  if (!a3) {
    return 0;
  }
  CFPreferencesSetMultiple((CFDictionaryRef)a3, 0, @"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return 1;
}

+ (__CFDictionary)copyPreferenceDictionaryForUser:(id)a3
{
  CFDictionaryRef MutableCopy = 0;
  os_log_type_t v5 = (CFStringRef *)MEMORY[0x1E4F1D3F0];
  CFTypeID v6 = (CFStringRef *)MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.CoreBrightness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFDictionaryRef cf = (const __CFDictionary *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.CoreBrightness", *v5, *v6);
  if (cf)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(cf)) {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, cf);
    }
    CFRelease(cf);
  }
  return MutableCopy;
}

@end
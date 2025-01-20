const void *CPDateFormatStringForFormatType(const void *a1)
{
  CFLocaleRef v2;
  const void *v3;
  CFStringRef *v5;
  CFStringRef VersionString;
  CFStringRef v7;
  CFPropertyListRef v8;
  CFPropertyListRef v9;
  CFDictionaryRef v10;
  unint64_t v11;
  __CFDateFormatter *v12;
  CFTypeRef v13;
  int v14;
  CFStringRef Format;
  __CFDateFormatter *v16;
  CFStringRef v17;
  CFStringRef v18;
  CFArrayRef v19;
  CFArrayRef v20;
  CFIndex Count;
  CFIndex v22;
  CFIndex i;
  __CFDictionary *v24;
  const void *v25;
  const void *ValueAtIndex;
  CFIndex Length;
  CFMutableStringRef MutableCopy;
  CFIndex v29;
  CFIndex v30;
  CFIndex v31;
  CFStringRef Copy;
  const void *v33;
  CFStringRef v34;
  CFStringRef v35;
  CFStringRef v36;
  uint64_t v37;
  void *v38;
  id v39;
  CFStringRef *v40;
  const void *v41;
  CFDictionaryRef v42;
  CFDictionaryRef v43;
  CFStringRef v44;
  CFStringRef v45;
  CFIndex v46;
  __CFString *v47;
  CFStringRef v48;
  CFStringRef v49;
  CFIndex v50;
  __CFString *v51;
  CFStringRef v52;
  CFStringRef v53;
  CFStringRef v54;
  CFPropertyListRef v55;
  const void *v56;
  CFPropertyListRef v57;
  const void *v58;
  __CFDictionary *v59;
  const void *v60;
  void *v61;
  CFTypeRef v62;
  CFTypeRef v63;
  void *v64;
  CFTypeRef v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const void *v70;
  CFStringRef value;
  void *values[2];
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  uint64_t v80;
  CFRange v81;
  CFRange v82;
  CFRange v83;
  CFRange v84;

  v80 = *MEMORY[0x1E4F143B8];
  if (_RegisterForLocaleChangeNotificationIfNecessary_onceToken != -1) {
    dispatch_once(&_RegisterForLocaleChangeNotificationIfNecessary_onceToken, &__block_literal_global);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  v2 = CFLocaleCopyCurrent();
  if (!__LocaleDateFormats)
  {
    __LocaleDateFormats = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithContentsOfFile:", objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", @"Library/Caches/DateFormats.plist"));
    v5 = (CFStringRef *)MEMORY[0x1E4F1D3B8];
    if (!__LocaleDateFormats) {
      goto LABEL_18;
    }
    VersionString = _CreateVersionString();
    v7 = *v5;
    v8 = CFPreferencesCopyAppValue(@"AppleICUForce12HourTime", *v5);
    v9 = CFPreferencesCopyAppValue(@"AppleICUForce24HourTime", v7);
    v10 = (const __CFDictionary *)__LocaleDateFormats;
    v11 = MEMORY[0x192FBE440](v2);
    if (!_CachedValueIsEqualToExpectedValue(v10, @"Locale", v11)
      || !_CachedValueIsEqualToExpectedValue((const __CFDictionary *)__LocaleDateFormats, @"Version", (unint64_t)VersionString)|| !_CachedValueIsEqualToExpectedValue((const __CFDictionary *)__LocaleDateFormats, @"AppleICUForce12HourTime", (unint64_t)v8)|| !_CachedValueIsEqualToExpectedValue((const __CFDictionary *)__LocaleDateFormats, @"AppleICUForce24HourTime", (unint64_t)v9))
    {
      CFRelease((CFTypeRef)__LocaleDateFormats);
      __LocaleDateFormats = 0;
    }
    if (VersionString) {
      CFRelease(VersionString);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (v9) {
      CFRelease(v9);
    }
    if (!__LocaleDateFormats)
    {
LABEL_18:
      v76 = xmmword_1E5668D30;
      v77 = *(_OWORD *)&off_1E5668D40;
      v78 = xmmword_1E5668D50;
      v79 = *(_OWORD *)off_1E5668D60;
      *(_OWORD *)values = xmmword_1E5668CF0;
      v73 = *(_OWORD *)&off_1E5668D00;
      v74 = xmmword_1E5668D10;
      v75 = *(_OWORD *)&off_1E5668D20;
      __LocaleDateFormats = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v12 = CFDateFormatterCreate(0, v2, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
      v13 = CFDateFormatterCopyProperty(v12, (CFDateFormatterKey)*MEMORY[0x1E4F1D058]);
      v70 = a1;
      if (v13 || (v13 = CFDateFormatterCopyProperty(v12, (CFDateFormatterKey)*MEMORY[0x1E4F1D0A0])) != 0)
      {
        CFRelease(v13);
        v14 = 0;
      }
      else
      {
        v14 = 1;
      }
      Format = CFDateFormatterGetFormat(v12);
      value = (const __CFString *)CFRetain(Format);
      CFRelease(v12);
      v16 = CFDateFormatterCreate(0, v2, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
      v17 = CFDateFormatterGetFormat(v16);
      v18 = (const __CFString *)CFRetain(v17);
      CFRelease(v16);
      v19 = CFArrayCreate(0, (const void **)values, 16, MEMORY[0x1E4F1D510]);
      v20 = (const __CFArray *)MEMORY[0x192FBE2B0](0, v19, 0, v2);
      CFRelease(v19);
      Count = CFArrayGetCount(v20);
      if (Count >= 1)
      {
        v22 = Count;
        for (i = 0; i != v22; ++i)
        {
          v24 = (__CFDictionary *)__LocaleDateFormats;
          v25 = *(&off_1E5668C70 + i);
          ValueAtIndex = CFArrayGetValueAtIndex(v20, i);
          CFDictionarySetValue(v24, v25, ValueAtIndex);
        }
      }
      CFRelease(v20);
      Length = CFStringGetLength(v18);
      MutableCopy = CFStringCreateMutableCopy(0, Length, v18);
      v81.location = 0;
      v81.length = Length;
      v29 = CFStringFindAndReplace(MutableCopy, @",", @" ", v81, 0);
      v82.location = 0;
      v82.length = Length;
      v30 = CFStringFindAndReplace(MutableCopy, @"/", @" ", v82, 0) + v29;
      v83.location = 0;
      v83.length = Length;
      v31 = CFStringFindAndReplace(MutableCopy, @"-", @" ", v83, 0);
      v84.location = 0;
      v84.length = Length;
      if (v30 + v31 + CFStringFindAndReplace(MutableCopy, @"  ", @" ", v84, 0) < 1)
      {
        CFRetain(v18);
        Copy = v18;
      }
      else
      {
        Copy = CFStringCreateCopy(0, MutableCopy);
      }
      CFRelease(MutableCopy);
      CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UIAbbreviatedDateFormatWithoutCommas", Copy);
      CFRelease(Copy);
      a1 = v70;
      if (v14)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UINoAMPMTimeFormat", value);
        v33 = CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, @"UIMinutelessTimeFormat");
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UIHourFormat", v33);
      }
      else
      {
        v34 = _StripAMPMAndCopy(value);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UINoAMPMTimeFormat", v34);
        CFRelease(v34);
        v35 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, @"UIMinutelessTimeFormat");
        v36 = _StripAMPMAndCopy(v35);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UIHourFormat", v36);
        CFRelease(v36);
      }
      CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UINotesFormatWithYear", v18);
      v37 = MEMORY[0x192FBE440](v2);
      if (_CopyPathForLocaleOverrides_onceToken != -1) {
        dispatch_once(&_CopyPathForLocaleOverrides_onceToken, &__block_literal_global_173);
      }
      v38 = objc_msgSend((id)_CopyPathForLocaleOverrides_appSupportBundle, "pathForResource:ofType:inDirectory:", v37, @"plist", @"DateFormats", v70);
      if (!v38)
      {
        v61 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
        objc_msgSend(v61, "setObject:forKey:", CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E4F1D218]), *MEMORY[0x1E4F1C438]);
        v62 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E4F1D220]);
        if (v62) {
          [v61 setObject:v62 forKey:*MEMORY[0x1E4F1C470]];
        }
        v63 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
        v64 = (void *)MEMORY[0x1E4F1C400];
        if (v63) {
          [v61 setObject:v63 forKey:*MEMORY[0x1E4F1C400]];
        }
        v65 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x1E4F1D1E0]);
        if (v65) {
          [v61 setObject:v65 forKey:@"calendar"];
        }
        v66 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v61];
        v38 = (void *)[(id)_CopyPathForLocaleOverrides_appSupportBundle pathForResource:v66 ofType:@"plist" inDirectory:@"DateFormats"];
        if (v63 && !v38)
        {
          [v61 removeObjectForKey:*v64];
          v67 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v61];
          v38 = (void *)[(id)_CopyPathForLocaleOverrides_appSupportBundle pathForResource:v67 ofType:@"plist" inDirectory:@"DateFormats"];
        }
        if (v65 && !v38)
        {
          [v61 removeObjectForKey:@"calendar"];
          if (v63) {
            [v61 setObject:v63 forKey:*v64];
          }
          v68 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v61];
          v38 = (void *)[(id)_CopyPathForLocaleOverrides_appSupportBundle pathForResource:v68 ofType:@"plist" inDirectory:@"DateFormats"];
          if (v63 && !v38)
          {
            [v61 removeObjectForKey:*v64];
            v69 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v61];
            v38 = (void *)[(id)_CopyPathForLocaleOverrides_appSupportBundle pathForResource:v69 ofType:@"plist" inDirectory:@"DateFormats"];
          }
        }
      }
      v39 = v38;
      v40 = (CFStringRef *)MEMORY[0x1E4F1D3B8];
      if (v39)
      {
        v41 = v39;
        v42 = (const __CFDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v39];
        if (v42)
        {
          v43 = v42;
          CFDictionaryApplyFunction(v42, (CFDictionaryApplierFunction)_AddOverrideToFormatsDictionary, (void *)__LocaleDateFormats);
          CFRelease(v43);
        }
        CFRelease(v41);
      }
      v44 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, @"UIAbbreviatedMonthDayFormat");
      if (v44)
      {
        v45 = v44;
        v46 = CFStringGetLength(v44);
        v47 = CFStringCreateMutableCopy(0, v46, v45);
        CFStringAppend(v47, @"   ");
        CFStringAppend(v47, value);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UINotesDisplayFormat", v47);
        CFRelease(v47);
      }
      v48 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, @"UINotesFormatWithYear");
      if (v48)
      {
        v49 = v48;
        v50 = CFStringGetLength(v48);
        v51 = CFStringCreateMutableCopy(0, v50, v49);
        CFStringAppend(v51, @"   ");
        CFStringAppend(v51, value);
        CFDictionarySetValue((CFMutableDictionaryRef)__LocaleDateFormats, @"UINotesDisplayFormatWithYear", v51);
        CFRelease(v51);
      }
      CFRelease(v18);
      CFRelease(value);
      v52 = _CreateVersionString();
      if (v52)
      {
        v53 = v52;
        v54 = *v40;
        v55 = CFPreferencesCopyAppValue(@"AppleICUForce24HourTime", *v40);
        if (v55)
        {
          v56 = v55;
          CFDictionaryAddValue((CFMutableDictionaryRef)__LocaleDateFormats, @"AppleICUForce24HourTime", v55);
          CFRelease(v56);
        }
        v57 = CFPreferencesCopyAppValue(@"AppleICUForce12HourTime", v54);
        if (v57)
        {
          v58 = v57;
          CFDictionaryAddValue((CFMutableDictionaryRef)__LocaleDateFormats, @"AppleICUForce12HourTime", v57);
          CFRelease(v58);
        }
        v59 = (__CFDictionary *)__LocaleDateFormats;
        v60 = (const void *)MEMORY[0x192FBE440](v2);
        CFDictionaryAddValue(v59, @"Locale", v60);
        CFDictionaryAddValue((CFMutableDictionaryRef)__LocaleDateFormats, @"Version", v53);
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", __LocaleDateFormats, 200, 0, 0), "writeToFile:options:error:", objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", @"Library/Caches/DateFormats.plist"), 1, 0);
        CFRelease(v53);
      }
    }
  }
  CFRelease(v2);
  v3 = CFDictionaryGetValue((CFDictionaryRef)__LocaleDateFormats, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v3;
}

BOOL _CachedValueIsEqualToExpectedValue(const __CFDictionary *a1, const void *a2, unint64_t a3)
{
  Value = CFDictionaryGetValue(a1, a2);
  unint64_t v5 = (unint64_t)Value;
  return a3 && Value && CFEqual(Value, (CFTypeRef)a3) || (a3 | v5) == 0;
}

CFStringRef _StripAMPMAndCopy(CFStringRef theString)
{
  CFStringRef Copy = theString;
  MutableCFStringRef Copy = CFStringCreateMutableCopy(0, 0, theString);
  v6.length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  CFIndex v3 = CFStringFindAndReplace(MutableCopy, @"a ", &stru_1EDF24210, v6, 0);
  v7.length = CFStringGetLength(MutableCopy);
  v7.location = 0;
  CFIndex v4 = CFStringFindAndReplace(MutableCopy, @" a", &stru_1EDF24210, v7, 0) + v3;
  v8.length = CFStringGetLength(MutableCopy);
  v8.location = 0;
  if (v4 + CFStringFindAndReplace(MutableCopy, @"a", &stru_1EDF24210, v8, 0) < 1) {
    CFRetain(Copy);
  }
  else {
    CFStringRef Copy = CFStringCreateCopy(0, MutableCopy);
  }
  CFRelease(MutableCopy);
  return Copy;
}

void _AddOverrideToFormatsDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

unint64_t _CPTimeFormatIs24HourMode()
{
  if (_RegisterForLocaleChangeNotificationIfNecessary_onceToken != -1) {
    dispatch_once(&_RegisterForLocaleChangeNotificationIfNecessary_onceToken, &__block_literal_global);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  v0 = (__CFDateFormatter *)todayFormatter;
  if (!todayFormatter)
  {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
    todayFormatter = (uint64_t)CFDateFormatterCreate(0, v1, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    CFRelease(v1);
    v0 = (__CFDateFormatter *)todayFormatter;
  }
  CFStringRef Format = CFDateFormatterGetFormat(v0);
  unint64_t v3 = (unint64_t)Format;
  if (Format) {
    unint64_t v3 = CFStringFind(Format, @"H", 0).location != -1
  }
      || CFStringFind((CFStringRef)v3, @"k", 0).location != -1;
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v3;
}

void _LocaleWillChangeCallback()
{
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  if (__LocaleDateFormats)
  {
    CFRelease((CFTypeRef)__LocaleDateFormats);
    __LocaleDateFormats = 0;
  }
  if (todayFormatter)
  {
    CFRelease((CFTypeRef)todayFormatter);
    todayFormatter = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
}

CFStringRef _CreateVersionString()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)versionArray = 0;
  ulocdata_getCLDRVersion();
  u_versionToString(versionArray, versionString);
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%d-%s", 7, versionString);
}

void CPFreeSpaceRequestBytesAtPathWithCompletionBlock(unint64_t a1, CFURLRef anURL, const __CFDictionary *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a4) {
    CFRange v6 = a4;
  }
  else {
    CFRange v6 = &__block_literal_global_0;
  }
  if (!anURL) {
    anURL = (CFURLRef)[MEMORY[0x1E4F1CB10] fileURLWithPath:NSHomeDirectory() isDirectory:1];
  }
  CFRange v7 = (__CFString *)CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)v25 = a1;
    *(_WORD *)&v25[8] = 2080;
    *(void *)&v25[10] = [(__CFString *)v7 UTF8String];
    __int16 v26 = 2048;
    v27 = v6;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: new request for %llu bytes at path %s for block %p", buf, 0x20u);
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v7) & 1) == 0)
  {
    do
    {
      if (![(__CFString *)v7 length]) {
        break;
      }
      CFRange v8 = (void *)[(__CFString *)v7 stringByDeletingLastPathComponent];

      CFRange v7 = v8;
    }
    while (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v7));
  }
  v9 = v7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [(__CFString *)v7 UTF8String];
    *(_DWORD *)buf = 136315394;
    *(void *)v25 = v10;
    *(_WORD *)&v25[8] = 2048;
    *(void *)&v25[10] = v6;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: rationalized path to %s for block %p", buf, 0x16u);
  }
  unint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t TotalCapacityAndAvailableCapacityForMountPoint = GetTotalCapacityAndAvailableCapacityForMountPoint(v7, &v23, &v22);
  if (TotalCapacityAndAvailableCapacityForMountPoint)
  {
    v12 = (void *)TotalCapacityAndAvailableCapacityForMountPoint;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_2(v12, (uint64_t)v6);
    }
    (*((void (**)(void *, void, void, void *))v6 + 2))(v6, 0, 0, v12);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)v25 = v23;
    *(_WORD *)&v25[8] = 2048;
    *(void *)&v25[10] = v22;
    __int16 v26 = 2048;
    v27 = v6;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: got total space %llu and available space %llu for block %p", buf, 0x20u);
  }
  if (!a3) {
    goto LABEL_26;
  }
  Value = (void *)CFDictionaryGetValue(a3, @"CPFreeSpaceEffortLevelKey");
  if (!Value) {
    goto LABEL_26;
  }
  unsigned int v14 = [Value intValue];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v25 = v14;
    *(_WORD *)&v25[4] = 2048;
    *(void *)&v25[6] = v6;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: caller requested effort level %d for block %p", buf, 0x12u);
  }
  if (v14 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_1((uint64_t)v6, v14);
    }
LABEL_26:
    unsigned int v14 = 1;
  }
  if (v23 < a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v25 = v6;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: not satisfied (total space < requested space) for block %p", buf, 0xCu);
    }
    unint64_t v15 = v22;
    v16 = (void (*)(void *, uint64_t, unint64_t, void))*((void *)v6 + 2);
    v17 = v6;
    uint64_t v18 = 0;
    goto LABEL_45;
  }
  unint64_t v19 = v22;
  if (v22 >= a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v25 = v6;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: satisfied (available space >= requested space) for block %p", buf, 0xCu);
      unint64_t v19 = v22;
    }
    v16 = (void (*)(void *, uint64_t, unint64_t, void))*((void *)v6 + 2);
    v17 = v6;
    uint64_t v18 = 1;
    goto LABEL_44;
  }
  BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v20)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v25 = v6;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: not satisfied (effort needed but not allowed) for block %p", buf, 0xCu);
      unint64_t v19 = v22;
    }
    v16 = (void (*)(void *, uint64_t, unint64_t, void))*((void *)v6 + 2);
    v17 = v6;
    uint64_t v18 = 0;
LABEL_44:
    unint64_t v15 = v19;
LABEL_45:
    v16(v17, v18, v15, 0);
    return;
  }
  if (v20)
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v25 = v6;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: will enqueue request for block %p", buf, 0xCu);
  }
  if (GetFreeSpaceDispatchQueue___once != -1) {
    dispatch_once(&GetFreeSpaceDispatchQueue___once, &__block_literal_global_28);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_9;
  v21[3] = &unk_1E5668DD0;
  v21[6] = v6;
  v21[7] = a1;
  v21[4] = v7;
  v21[5] = 0;
  dispatch_async((dispatch_queue_t)GetFreeSpaceDispatchQueue___queue, v21);
}

uint64_t GetTotalCapacityAndAvailableCapacityForMountPoint(void *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(&v17, 0, 512);
  if (statfs((const char *)[a1 fileSystemRepresentation], &v17))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      GetTotalCapacityAndAvailableCapacityForMountPoint_cold_1();
    }
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"POSIX filesystem error" forKey:*MEMORY[0x1E4F28568]];
    return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F1D160] code:*__error() userInfo:v6];
  }
  else
  {
    uint64_t v8 = v17.f_blocks * v17.f_bsize;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v8;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: real total capacity %llu", buf, 0xCu);
    }
    uint64_t v14 = 0;
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfFileSystemForPath:error:", a1, &v14);
    uint64_t v7 = v14;
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "free space request: failed to get attributes for the mount point", buf, 2u);
        return v14;
      }
    }
    else
    {
      unint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F283A0]), "unsignedLongLongValue");
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = v10;
        _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: real available capacity %llu", buf, 0xCu);
      }
      if (a2)
      {
        uint64_t v11 = v8 - 157286400;
        if (v8 < 0x9600000) {
          uint64_t v11 = 0;
        }
        *a2 = v11;
      }
      uint64_t v7 = 0;
      if (a3)
      {
        unint64_t v12 = v10 - 157286400;
        if (v10 < 0x9600000) {
          unint64_t v12 = 0;
        }
        *a3 = v12;
      }
    }
  }
  return v7;
}

uint64_t __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_9(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    *(_DWORD *)statfs v17 = 134217984;
    *(void *)&v17[4] = v2;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: processing enqueued request for block %p", v17, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 56) + 157286400;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)statfs v17 = 134218240;
    *(void *)&v17[4] = v3;
    *(_WORD *)&v17[12] = 2048;
    *(void *)&v17[14] = v4;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: will request CacheDelete of %llu bytes for block %p", v17, 0x16u);
  }
  if (_CPFreeupBytes_onceToken != -1) {
    dispatch_once(&_CPFreeupBytes_onceToken, &__block_literal_global_12);
  }
  unint64_t v5 = dispatch_semaphore_create(0);
  v20[0] = @"CACHE_DELETE_VOLUME";
  v20[1] = @"CACHE_DELETE_AMOUNT";
  v21[0] = (unint64_t)@"/private/var";
  v21[1] = [NSNumber numberWithUnsignedLongLong:v3];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  *(void *)statfs v17 = MEMORY[0x1E4F143A8];
  *(void *)&v17[8] = 3221225472;
  *(void *)&v17[16] = ___CPFreeupBytes_block_invoke_2;
  uint64_t v18 = &unk_1E5668DF8;
  unint64_t v19 = v5;
  uint64_t v7 = (const void *)_CPFreeupBytes__CacheDeletePurgeSpaceWithInfo(v6, v17);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  CFRelease(v7);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)statfs v17 = 134218240;
    *(void *)&v17[4] = v3;
    *(_WORD *)&v17[12] = 2048;
    *(void *)&v17[14] = v8;
    _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: did finish CacheDelete of %llu bytes for block %p", v17, 0x16u);
  }
  v21[0] = 0;
  if (GetTotalCapacityAndAvailableCapacityForMountPoint(*(void **)(a1 + 32), 0, v21))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_9_cold_1(a1);
    }
    v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)statfs v17 = 134218240;
      *(void *)&v17[4] = v21[0];
      *(_WORD *)&v17[12] = 2048;
      *(void *)&v17[14] = v10;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: got available space %llu for block %p", v17, 0x16u);
    }
    unint64_t v11 = v21[0];
    unint64_t v12 = *(void *)(a1 + 56);
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
    if (v11 >= v12)
    {
      if (v13)
      {
        uint64_t v15 = *(void *)(a1 + 48);
        *(_DWORD *)statfs v17 = 134218240;
        *(void *)&v17[4] = v11;
        *(_WORD *)&v17[12] = 2048;
        *(void *)&v17[14] = v15;
        _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: satisfied with new available space %llu for block %p", v17, 0x16u);
      }
      v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)statfs v17 = 134218240;
        *(void *)&v17[4] = v11;
        *(_WORD *)&v17[12] = 2048;
        *(void *)&v17[14] = v14;
        _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "free space request: not satisfied with new available space %llu for block %p", v17, 0x16u);
      }
      v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    }
  }
  return v9();
}

dispatch_queue_t __GetFreeSpaceDispatchQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("freeSpaceDispatchQueue", 0);
  GetFreeSpaceDispatchQueue___queue = (uint64_t)result;
  return result;
}

const void *CPCityGetLocalizedCityName(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 5);
}

const void *CPCityGetLocalizedCountryName(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 6);
}

const void *CPCityGetTimeZoneFile(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 3);
}

const void *CPCityGetIdentifier(const __CFArray *a1)
{
  return CFArrayGetValueAtIndex(a1, 9);
}

uint64_t CPFSSizeStrings(float a1)
{
  return CPFSSizeStringsWithStyle(0, a1);
}

uint64_t CPFSSizeStringsWithStyle(int a1, float a2)
{
  if (a2 == 0.0)
  {
    uint64_t v4 = @"0 bytes";
    return __diskSizeStringForKey((uint64_t)v4);
  }
  if (a2 == 1.0)
  {
    uint64_t v4 = @"1 byte";
    return __diskSizeStringForKey((uint64_t)v4);
  }
  v7[1] = v2;
  v7[2] = v3;
  v7[0] = 0;
  uint64_t v6 = __localizedScaledSizeAndFormatWithStyle(a1, v7, a2, a2);
  return objc_msgSend(NSString, "localizedStringWithFormat:", v7[0], v6);
}

uint64_t __diskSizeStringForKey(uint64_t a1)
{
  id v2 = (id)__thisBundle;
  if (!__thisBundle)
  {
    id v2 = (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppSupport"];
    __thisBundle = (uint64_t)v2;
    if (!v2) {
      return a1;
    }
  }
  return [v2 localizedStringForKey:a1 value:&stru_1EDF24210 table:@"CPDiskSizes"];
}

uint64_t CPFSProgressString(float a1, float a2)
{
  return CPFSProgressStringWithStyle(0, a1, a2);
}

uint64_t CPFSProgressStringWithStyle(int a1, float a2, float a3)
{
  uint64_t v5 = __localizedScaledSizeAndFormatWithStyle(a1, 0, a2, a3);
  uint64_t v6 = CPFSSizeStringsWithStyle(a1, a3);
  return [NSString localizedStringWithFormat:__diskSizeStringForKey(@"%@ of %@"), v5, v6];
}

uint64_t __localizedScaledSizeAndFormatWithStyle(int a1, uint64_t *a2, float a3, float a4)
{
  if (a4 < 100.0)
  {
    uint64_t v6 = __diskSizeStringForKey(@"%d bytes");
    double v7 = floorf(a3);
    goto LABEL_3;
  }
  double v10 = (float)(a3 * 0.00097656);
  float v11 = a4 * 0.00097656;
  if (v11 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1) {
      BOOL v13 = @"%.0f";
    }
    else {
      BOOL v13 = @"%.1f";
    }
    uint64_t v14 = @"KB";
    goto LABEL_14;
  }
  double v15 = v11 * 0.0009765625;
  if (v15 < 1.0)
  {
    if (a1)
    {
      uint64_t v16 = @"%.0fKB";
LABEL_67:
      uint64_t v6 = __diskSizeStringForKey((uint64_t)v16);
      double v7 = v10;
LABEL_3:
      uint64_t result = __localizedIntegerNumber(v7);
      if (!a2) {
        return result;
      }
      goto LABEL_4;
    }
    uint64_t v18 = @"%dKB";
    goto LABEL_31;
  }
  double v10 = v10 * 0.0009765625;
  if (v15 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1) {
      BOOL v13 = @"%.0f";
    }
    else {
      BOOL v13 = @"%.1f";
    }
    uint64_t v14 = @"MB";
    goto LABEL_14;
  }
  if (v15 < 1000.0)
  {
    if (a1)
    {
      uint64_t v16 = @"%.0fMB";
      goto LABEL_67;
    }
    uint64_t v18 = @"%dMB";
LABEL_31:
    uint64_t v6 = __diskSizeStringForKey((uint64_t)v18);
    double v7 = floor(v10);
    goto LABEL_3;
  }
  double v10 = v10 * 0.0009765625;
  double v19 = v15 * 0.0009765625;
  if (v19 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1) {
      BOOL v13 = @"%.0f";
    }
    else {
      BOOL v13 = @"%.1f";
    }
    uint64_t v14 = @"GB";
    goto LABEL_14;
  }
  if (v19 < 1000.0)
  {
    if (a1)
    {
      uint64_t v16 = @"%.0fGB";
      goto LABEL_67;
    }
    uint64_t v18 = @"%dGB";
    goto LABEL_31;
  }
  double v10 = v10 * 0.0009765625;
  double v21 = v19 * 0.0009765625;
  if (v21 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1) {
      BOOL v13 = @"%.0f";
    }
    else {
      BOOL v13 = @"%.1f";
    }
    uint64_t v14 = @"TB";
    goto LABEL_14;
  }
  if (v21 < 1000.0)
  {
    if (a1)
    {
      uint64_t v16 = @"%.0fTB";
      goto LABEL_67;
    }
    uint64_t v18 = @"%dTB";
    goto LABEL_31;
  }
  double v10 = v10 * 0.0009765625;
  double v23 = v21 * 0.0009765625;
  if (v23 < 100.0)
  {
    if (fmod(v10, 1.0) < 0.05 && a1 == 1) {
      BOOL v13 = @"%.0f";
    }
    else {
      BOOL v13 = @"%.1f";
    }
    uint64_t v14 = @"PB";
    goto LABEL_14;
  }
  if (v23 < 1000.0)
  {
    if (a1)
    {
      uint64_t v16 = @"%.0fPB";
      goto LABEL_67;
    }
    uint64_t v18 = @"%dPB";
    goto LABEL_31;
  }
  if (v23 * 0.0009765625 < 10.0)
  {
    double v10 = v10 * 0.0009765625;
    if (fmod(v10, 1.0) < 0.05 && a1 == 1) {
      BOOL v13 = @"%.0f";
    }
    else {
      BOOL v13 = @"%.1f";
    }
    uint64_t v14 = @"EB";
LABEL_14:
    uint64_t v6 = __diskSizeStringForKey([(__CFString *)v13 stringByAppendingString:v14]);
    uint64_t result = __localizedFormattedNumber(a1, v10);
    if (!a2) {
      return result;
    }
LABEL_4:
    *a2 = v6;
    return result;
  }
  uint64_t v6 = __diskSizeStringForKey(@"%.1fEB");
  uint64_t result = 0;
  if (a2) {
    goto LABEL_4;
  }
  return result;
}

uint64_t __localizedIntegerNumber(double a1)
{
  pthread_mutex_lock(&__integerMutex);
  id v2 = (void *)__integerFormatter;
  if (!__integerFormatter)
  {
    __integerFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    objc_msgSend((id)__integerFormatter, "setLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "autoupdatingCurrentLocale"));
    [(id)__integerFormatter setAlwaysShowsDecimalSeparator:0];
    [(id)__integerFormatter setMaximumFractionDigits:0];
    [(id)__integerFormatter setMinimumIntegerDigits:1];
    id v2 = (void *)__integerFormatter;
  }
  uint64_t v3 = objc_msgSend(v2, "stringFromNumber:", objc_msgSend(NSNumber, "numberWithDouble:", a1));
  pthread_mutex_unlock(&__integerMutex);
  return v3;
}

uint64_t __localizedFormattedNumber(int a1, double a2)
{
  double v4 = fmod(a2, 1.0);
  if (a1 == 1 && v4 < 0.05)
  {
    return __localizedIntegerNumber(a2);
  }
  else
  {
    pthread_mutex_lock(&__decimalMutex);
    uint64_t v6 = (void *)__decimalFormatter;
    if (!__decimalFormatter)
    {
      __decimalFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28EE0]);
      objc_msgSend((id)__decimalFormatter, "setLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "autoupdatingCurrentLocale"));
      [(id)__decimalFormatter setAlwaysShowsDecimalSeparator:1];
      [(id)__decimalFormatter setMinimumFractionDigits:1];
      [(id)__decimalFormatter setMinimumIntegerDigits:1];
      uint64_t v6 = (void *)__decimalFormatter;
    }
    uint64_t v7 = objc_msgSend(v6, "stringFromNumber:", objc_msgSend(NSNumber, "numberWithDouble:", a2));
    pthread_mutex_unlock(&__decimalMutex);
    return v7;
  }
}

CFRunLoopSourceRef CPCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return CPCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

CFRunLoopSourceRef CPCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  pthread_once(&__CPMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  uint64_t v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)uint64_t v8 = a2;
  v8[1] = a1;
  v8[2] = a4;
  context.version = 1;
  context.info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F14838];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  CFRunLoopSourceRef v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9) {
    free(v8);
  }
  return v9;
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__CPMIGServerCalloutContextKey, 0);
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, @"<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, CFRunLoopSourceContext context = %p}", *a1, *((void *)a1 + 1), *((void *)a1 + 2));
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  uint64_t v6 = *(void *)(a4 + 8);
  mach_msg_id_t msgh_id = a1->msgh_id;
  int v8 = *(_DWORD *)(v6 + 8);
  BOOL v9 = __OFSUB__(msgh_id, v8);
  int v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    float v11 = 0;
  }
  else
  {
    float v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      char v12 = 0;
      size_t v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  char v12 = 1;
  size_t v13 = 36;
LABEL_7:
  uint64_t v14 = (mach_msg_header_t *)malloc_type_malloc(v13, 0x18E20578uLL);
  if (v14)
  {
    double v15 = v14;
    mach_port_t msgh_remote_port = a1->msgh_remote_port;
    v14->mach_msg_bits_t msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(void *)&v14->mach_port_t msgh_remote_port = msgh_remote_port;
    v14->msgh_voucher_port = 0;
    v14->mach_msg_id_t msgh_id = a1->msgh_id + 100;
    if (v12)
    {
      *(void *)&v14[1].mach_msg_bits_t msgh_bits = *MEMORY[0x1E4F14068];
      v14[1].mach_port_t msgh_remote_port = -303;
    }
    else
    {
      statfs v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__CPMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__CPMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    mach_msg_bits_t msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      mach_port_t v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->mach_port_t msgh_remote_port = 0;
        mach_msg_destroy(a1);
        mach_msg_bits_t msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12) {
        mach_msg_option_t v20 = 1;
      }
      else {
        mach_msg_option_t v20 = 17;
      }
      double v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        double v23 = (FILE *)*MEMORY[0x1E4F143C8];
        v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1) {
        goto LABEL_31;
      }
      mach_msg_bits_t msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0) {
      mach_msg_destroy(v15);
    }
    goto LABEL_31;
  }
  return 0;
}

uint64_t CPGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *CPGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__CPMIGServerCalloutContextKey);
}

uint64_t CPGetDeviceRegionCode()
{
  if (CPGetDeviceRegionCode_onceToken != -1) {
    dispatch_once(&CPGetDeviceRegionCode_onceToken, &__block_literal_global_1);
  }
  return CPGetDeviceRegionCode___regionCode;
}

uint64_t __CPGetDeviceRegionCode_block_invoke()
{
  uint64_t result = MGCopyAnswer();
  CPGetDeviceRegionCode___regionCode = result;
  return result;
}

const void *CPSharedResourcesDirectory()
{
  pthread_mutex_lock(&CPSharedResourcesDirectory_lock);
  uint64_t v0 = geteuid();
  if (!v0) {
    uint64_t v0 = getuid();
  }
  if (CPSharedResourcesDirectory_pathDictionary)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)CPSharedResourcesDirectory_pathDictionary, (const void *)v0);
    if (Value) {
      goto LABEL_13;
    }
  }
  else
  {
    CPSharedResourcesDirectory_pathDictionary = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if ((pw_dir || (double v4 = getpwuid(v0)) != 0 && (pw_dir = v4->pw_dir) != 0)
    && (CFStringRef v3 = CFStringCreateWithFileSystemRepresentation(0, pw_dir)) != 0)
  {
    Value = v3;
    CFDictionarySetValue((CFMutableDictionaryRef)CPSharedResourcesDirectory_pathDictionary, (const void *)v0, v3);
    CFRelease(Value);
  }
  else
  {
    NSLog((NSString *)@"Returning NULL path from CPSharedResourcesDirectory for uid %d", v0);
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&CPSharedResourcesDirectory_lock);
  return Value;
}

CFStringRef CPCopySharedResourcesPreferencesDomainForDomain(uint64_t a1)
{
  id v2 = CPSharedResourcesDirectory();
  return CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v2, a1);
}

uint64_t CPSystemRootDirectory()
{
  if (CPSystemRootDirectory_onceToken != -1) {
    dispatch_once(&CPSystemRootDirectory_onceToken, &__block_literal_global_10);
  }
  return CPSystemRootDirectory_systemRootDirectory;
}

void __CPSystemRootDirectory_block_invoke()
{
  CPSystemRootDirectory_systemRootDirectory = @"/";
}

void sub_18FB82EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CPCopyBundleIdentifierFromAuditToken(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  CFStringRef v3 = v2;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = proc_pidpath(*(_DWORD *)(v1 + 20), buffer, 0x1000u);
  if (v4 < 1)
  {
    id v6 = 0;
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithBytes:buffer length:v4 encoding:4];
    id v6 = [[_CPBundleIdentifierString alloc] _initWithExecutablePath:v5];

    if (v3)
    {
      if (v6)
      {
        char v7 = [v6 _isProcessName];
LABEL_7:
        *CFStringRef v3 = v7;
        return v6;
      }
LABEL_6:
      char v7 = 0;
      goto LABEL_7;
    }
  }
  return v6;
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken(_OWORD *a1, void *a2, void *a3)
{
  long long v5 = a1[1];
  *(_OWORD *)v9.val = *a1;
  *(_OWORD *)&v9.val[4] = v5;
  id v6 = SecTaskCreateWithAuditToken(0, &v9);
  uint64_t v7 = CPCopyBundleIdentifierAndTeamFromSecTaskRef(v6, a2, a3);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

uint64_t CPCopyBundleIdentifierAndTeamFromSecTaskRef(__SecTask *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  CFTypeRef v5 = SecTaskCopyValueForEntitlement(a1, @"application-identifier", 0);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == CFStringGetTypeID()) {
    uint64_t v8 = CPCopyBundleIdentifierAndTeamFromApplicationIdentifier((uint64_t)v6, a2, a3);
  }
  else {
    uint64_t v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier(uint64_t result, void *a2, void *a3)
{
  if (!result) {
    return result;
  }
  CFTypeRef v5 = (void *)result;
  if ((unint64_t)[(id)result length] < 0xB
    || [v5 characterAtIndex:10] != 46)
  {
    goto LABEL_20;
  }
  id v6 = objc_msgSend(v5, "substringWithRange:", 0, 10);
  unint64_t v7 = 0;
  do
  {
    int v8 = [v5 characterAtIndex:v7];
    BOOL v10 = (v8 - 65) < 0x1A || (v8 - 48) < 0xA;
  }
  while (v10 && v7++ < 9);
  if (!v10)
  {
LABEL_20:
    id v12 = 0;
LABEL_21:
    CFTypeRef v13 = CFRetain(v5);
    if (a2) {
      goto LABEL_19;
    }
LABEL_22:
    if (v13) {
      CFRelease(v13);
    }
    goto LABEL_24;
  }
  id v12 = v6;
  CFTypeRef v13 = (id)objc_msgSend(v5, "substringWithRange:", 11, objc_msgSend(v5, "length") - 11);
  if (!v13) {
    goto LABEL_21;
  }
  if (!a2) {
    goto LABEL_22;
  }
LABEL_19:
  *a2 = v13;
LABEL_24:
  if (a3)
  {
    *a3 = v12;
  }
  else if (v12)
  {
    CFRelease(v12);
  }
  return 1;
}

uint64_t CPCanSendMail()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  Class v1 = NSClassFromString((NSString *)@"MFMailAccountProxy");
  if (v1 && (Class v2 = v1, (objc_opt_respondsToSelector() & 1) != 0))
  {
    [(objc_class *)v2 performSelector:sel_reloadAccounts];
    uint64_t CanSendMail = [(objc_class *)v2 performSelector:sel_defaultMailAccountForDelivery] != 0;
  }
  else
  {
    if (CPCanSendMail_onceToken != -1) {
      dispatch_once(&CPCanSendMail_onceToken, &__block_literal_global_44);
    }
    if (CPCanSendMail_MailServicesCanSendMail) {
      uint64_t CanSendMail = CPCanSendMail_MailServicesCanSendMail();
    }
    else {
      uint64_t CanSendMail = 0;
    }
  }

  return CanSendMail;
}

void __CPCanSendMail_block_invoke()
{
  if (CPSystemRootDirectory_onceToken != -1) {
    dispatch_once(&CPSystemRootDirectory_onceToken, &__block_literal_global_10);
  }
  id v0 = dlopen((const char *)objc_msgSend((id)objc_msgSend((id)CPSystemRootDirectory_systemRootDirectory, "stringByAppendingPathComponent:", @"System/Library/PrivateFrameworks/MailServices.framework/MailServices"), "fileSystemRepresentation"), 5);
  if (v0) {
    CPCanSendMail_MailServicesuint64_t CanSendMail = (uint64_t (*)(void))dlsym(v0, "MSCanSendMail");
  }
  else {
    NSLog((NSString *)@"failed to load MailServices framework");
  }
}

BOOL CPCanSendMMS()
{
  int v0 = CPCanSendMMS_token;
  if (CPCanSendMMS_token == -1)
  {
    notify_register_check("com.apple.MobileSMS.MMSCapable", &CPCanSendMMS_token);
    int v0 = CPCanSendMMS_token;
  }
  uint64_t state64 = 0;
  notify_get_state(v0, &state64);
  if (!state64) {
    return 0;
  }
  int v1 = CPCanSendMMS_seatbeltCheck;
  if (CPCanSendMMS_seatbeltCheck == -1)
  {
    int v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isWritableFileAtPath:", objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", @"Library/SMS/sms.db"));
    CPCanSendMMS_seatbeltCheck = v1;
  }
  return v1 != 0;
}

uint64_t CPIsInternalDevice()
{
  if (CPIsInternalDevice_onceToken != -1) {
    dispatch_once(&CPIsInternalDevice_onceToken, &__block_literal_global_61);
  }
  return CPIsInternalDevice_result;
}

uint64_t __CPIsInternalDevice_block_invoke()
{
  if (MGGetBoolAnswer()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = MGGetBoolAnswer();
  }
  CPIsInternalDevice_uint64_t result = result;
  return result;
}

double CPMachAbsoluteTime()
{
  uint64_t v0 = mach_absolute_time();
  return CPMachAbsoluteTimeIntervalToCFTimeInterval(v0);
}

double CPMachAbsoluteTimeIntervalToCFTimeInterval(unint64_t a1)
{
  double v2 = *(double *)&CPMachAbsoluteTimeIntervalToCFTimeInterval___timebaseFactor;
  if (*(double *)&CPMachAbsoluteTimeIntervalToCFTimeInterval___timebaseFactor == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v4) = info.denom;
    LODWORD(v3) = info.numer;
    double v2 = (double)v3 / (double)v4 * 0.000000001;
    CPMachAbsoluteTimeIntervalToCFTimeInterval___timebaseFactor = *(void *)&v2;
  }
  return v2 * (double)a1;
}

double CPTimeBlock(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  (*(void (**)(uint64_t))(a1 + 16))(a1);
  unint64_t v3 = mach_absolute_time() - v2;
  return CPMachAbsoluteTimeIntervalToCFTimeInterval(v3);
}

uint64_t CPOpenTemporaryFile(uint64_t a1, char *a2, size_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  unint64_t v7 = (void *)[[NSString alloc] initWithUTF8String:a1];
  int v8 = (void *)[[NSString alloc] initWithFormat:@"%@/.%@.XXXXXX", objc_msgSend(v7, "stringByDeletingLastPathComponent"), objc_msgSend(v7, "lastPathComponent")];
  strlcpy(a2, (const char *)[v8 fileSystemRepresentation], a3);
  uint64_t v9 = mkstemp(a2);

  [v6 drain];
  return v9;
}

void CPBasename(const char *a1, char *a2, CFIndex a3)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        size_t v6 = strlen(a1);
        CFURLRef v7 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)a1, v6, 0);
        if (v7)
        {
          CFURLRef v8 = v7;
          CFStringRef PathComponent = CFURLCopyLastPathComponent(v7);
          if (PathComponent)
          {
            CFStringRef v10 = PathComponent;
            CFStringGetCString(PathComponent, a2, a3, 0x8000100u);
            CFRelease(v10);
          }
          CFRelease(v8);
        }
      }
    }
  }
}

void CPTemporaryPath(const char *a1, char *a2, size_t a3)
{
  __source = 0;
  size_t v6 = [(NSString *)NSTemporaryDirectory() fileSystemRepresentation];
  NSLog((NSString *)@"%s: tempdir returned by [NSTemporaryDirectory() fileSystemRepresentation] is %s", "void CPTemporaryPath(const char *, char *, size_t)", v6);
  if (v6[strlen(v6) - 1] == 47) {
    CFURLRef v7 = "";
  }
  else {
    CFURLRef v7 = "/";
  }
  asprintf(&__source, "%s%s%s.XXXXXX", v6, v7, a1);
  if (__source)
  {
    NSLog((NSString *)@"%s: will attempt to use path %s", "void CPTemporaryPath(const char *, char *, size_t)", __source);
    if (mkstemp(__source) == -1)
    {
      NSLog((NSString *)@"CPTemporaryPath failed with result %i at path %s", 0xFFFFFFFFLL, __source);
      if (!a2) {
        goto LABEL_8;
      }
    }
    else if (!a2)
    {
LABEL_8:
      free(__source);
      return;
    }
    strlcpy(a2, __source, a3);
    goto LABEL_8;
  }
}

void *CPSqliteDatabaseCreateWithPath(const __CFString *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x130uLL, 0x10E0040C156DB45uLL);
  *uint64_t v2 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1);
  return v2;
}

CFStringRef CPSqliteDatabaseSetVFSModuleName(CFStringRef result, const __CFString *a2)
{
  if (result)
  {
    CFStringRef v2 = result;
    uint64_t result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    v2[7].length = (uint64_t)result;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetVersion(uint64_t result, int a2)
{
  if (result)
  {
    *(_WORD *)(result + 116) |= 1u;
    *(_DWORD *)(result + 112) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetJournalModeWAL(uint64_t result)
{
  if (result) {
    *(_WORD *)(result + 116) |= 0x400u;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetAutoVacuumLevel(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 256) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetAccessRequestHandler(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 40) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetDataProtectionLevel(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 260) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetSupportsReadOnlyConnections(uint64_t result)
{
  if (result) {
    *(_WORD *)(result + 116) |= 2u;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetAutoRetryStatements(uint64_t result, int a2)
{
  if (result)
  {
    if (a2) {
      __int16 v2 = 2048;
    }
    else {
      __int16 v2 = 0;
    }
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xF7FF | v2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetShouldUseInhibitorForConnections(uint64_t result, int a2)
{
  if (result)
  {
    if (a2) {
      __int16 v2 = 4096;
    }
    else {
      __int16 v2 = 0;
    }
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xEFFF | v2;
  }
  return result;
}

uint64_t CPSqliteConnectionDatabaseVersion(CFMutableDictionaryRef *a1)
{
  return CPSqliteConnectionIntegerForPropertyWithDefaultValue(a1, @"_ClientVersion", 0);
}

uint64_t CPSqliteConnectionIntegerForProperty(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  return CPSqliteConnectionIntegerForPropertyWithDefaultValue(a1, a2, 0);
}

uint64_t CPSqliteConnectionSetDatabaseVersion(CFMutableDictionaryRef *a1, int a2)
{
  return CPSqliteConnectionSetIntegerForProperty(a1, @"_ClientVersion", a2);
}

uint64_t CPSqliteConnectionSetIntegerForProperty(CFMutableDictionaryRef *a1, const __CFString *a2, int a3)
{
  uint64_t v3 = 1;
  if (a1 && a2 && (!*a1 || (*((_WORD *)*a1 + 58) & 4) == 0))
  {
    CFURLRef v7 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
           0);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = (char *)_CPCreateUTF8StringFromCFString(a2);
      uint64_t v3 = _performSetIntegerPropertyStatement(v8, v9, a3);
      if (v3 == 17)
      {
        CFStringRef v10 = a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
              (float v11 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
                       0)) != 0))
        {
          uint64_t v3 = _performSetIntegerPropertyStatement((uint64_t)v11, v9, a3);
        }
        else
        {
          uint64_t v3 = 17;
        }
      }
      free(v9);
    }
  }
  return v3;
}

uint64_t CPSqliteDatabaseSetSetupHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 16) = a2;
    *(void *)(result + 48) = a3;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetShouldMigrateInProcess(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 88) = a2 ^ 1;
  }
  return result;
}

CFStringRef CPSqliteDatabaseSetMigrationPluginBundleID(CFStringRef result, const __CFString *a2)
{
  if (result)
  {
    CFStringRef v2 = result;
    uint64_t result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    v2[3].isa = (void *)result;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetDatabaseInitializer(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 24) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetConnectionInitializer(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetCommitHookCallback(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 192) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetUpdateHookCallback(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 200) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetExternalConversionChecker(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 208) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetPropertiesEnabled(uint64_t result, int a2)
{
  if (result)
  {
    if (a2) {
      __int16 v2 = 0;
    }
    else {
      __int16 v2 = 4;
    }
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xFFFB | v2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetStatementCacheLimit(uint64_t result, int a2)
{
  *(_DWORD *)(result + 288) = a2;
  return result;
}

uint64_t CPSqliteDatabaseGetStatementCacheLimit(uint64_t a1)
{
  return *(unsigned int *)(a1 + 288);
}

uint64_t CPSqliteDatabaseSetThreadSafeEnabled(uint64_t result)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __int16 v1 = *(_WORD *)(result + 116);
  if ((v1 & 8) == 0)
  {
    uint64_t v2 = result;
    *(_WORD *)(result + 116) = v1 | 8;
    v3.__sig = 0;
    *(void *)v3.__opaque = 0;
    pthread_mutexattr_init(&v3);
    pthread_mutexattr_settype(&v3, 2);
    return pthread_mutex_init((pthread_mutex_t *)(v2 + 120), &v3);
  }
  return result;
}

void *CPSqliteDatabaseSetMigrationHandlers(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result[7] = a2;
    result[8] = a3;
    result[13] = a4;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetCorruptionHandler(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 72) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetDatabaseDeletedCallback(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 80) = a2;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetStatementCompileErrorCallback(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 296) = a2;
  }
  return result;
}

void CPSqliteDatabaseClose(uint64_t a1)
{
  if ((*(_WORD *)(a1 + 116) & 0x80) != 0) {
    notify_cancel(*(_DWORD *)(a1 + 232));
  }
  uint64_t v2 = *(const void **)(a1 + 240);
  if (v2) {
    _Block_release(v2);
  }
  CPSqliteDatabaseCloseAllConnections(a1);
  CFRelease(*(CFTypeRef *)a1);
  pthread_mutexattr_t v3 = *(const void **)(a1 + 248);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 96);
  if (v4) {
    CFRelease(v4);
  }
  free((void *)a1);
}

void CPSqliteDatabaseCloseAllConnections(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    CPSqliteConnectionClose(v2);
    *(void *)(a1 + 8) = 0;
  }
  uint64_t v3 = *(void *)(a1 + 280);
  if (v3)
  {
    CPSqliteConnectionClose(v3);
    *(void *)(a1 + 280) = 0;
  }
}

uint64_t CPSqliteDatabasePath(uint64_t a1)
{
  return *(void *)a1;
}

BOOL CPSqliteDatabaseIsAccessPermitted(uint64_t a1)
{
  int v2 = 0;
  _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, &v2);
  return v2 != 3;
}

uint64_t CPSqliteDatabaseConnectionForWritingWithSqlite3OpenFlagsAndReturnError(uint64_t a1, int a2, _DWORD *a3)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, a2, a3);
}

uint64_t CPSqliteDatabaseConnectionForReading(uint64_t a1)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, 0, 0);
}

uint64_t CPSqliteDatabaseConnectionForReadingWithSqlite3OpenFlags(uint64_t a1, int a2)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, a2, 0);
}

uint64_t _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(uint64_t result, int a2, int a3, _DWORD *a4)
{
  int v15 = 0;
  if (result)
  {
    uint64_t v7 = result;
    if ((*(_WORD *)(result + 116) & 8) != 0) {
      pthread_mutex_lock((pthread_mutex_t *)(result + 120));
    }
    uint64_t v8 = 8;
    if (a2)
    {
      uint64_t v8 = 280;
      uint64_t v9 = (uint64_t *)(v7 + 280);
    }
    else
    {
      uint64_t v9 = (uint64_t *)(v7 + 8);
    }
    uint64_t result = *(void *)(v7 + v8);
    if (!result)
    {
      CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)v7);
      float v11 = (char *)malloc_type_calloc(MaximumSizeOfFileSystemRepresentation + 1, 1uLL, 0x100004077774924uLL);
      CFStringGetFileSystemRepresentation(*(CFStringRef *)v7, v11, MaximumSizeOfFileSystemRepresentation);
      char v14 = 0;
      uint64_t v12 = _connectAndCheckVersion(v7, v11, &v14, a2, a3, &v15);
      if (v12)
      {
        CFTypeRef v13 = (void *)v12;
        free(v11);
        goto LABEL_10;
      }
      if (v14)
      {
        CFTypeRef v13 = (void *)_connectAndCheckVersion(v7, v11, &v14, a2, a3, &v15);
        free(v11);
        if (v13)
        {
LABEL_10:
          *CFTypeRef v13 = v7;
          if (a2) {
            *(void *)(v7 + 280) = v13;
          }
          else {
            *(void *)(v7 + 8) = v13;
          }
        }
      }
      else
      {
        free(v11);
      }
      uint64_t result = *v9;
    }
  }
  if (a4) {
    *a4 = v15;
  }
  return result;
}

uint64_t CPSqliteDatabaseConnectionForWriting(uint64_t a1)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
}

uint64_t CPSqliteDatabaseConnectionForWritingWithSqlite3OpenFlags(uint64_t a1, int a2)
{
  return _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, a2, 0);
}

uint64_t *CPSqliteDatabaseReleaseSqliteConnection(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = *result;
    if (*result)
    {
      if ((*(_WORD *)(v1 + 116) & 8) != 0) {
        return (uint64_t *)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 120));
      }
    }
  }
  return result;
}

void CPSqliteConnectionClose(uint64_t a1)
{
  if (a1)
  {
    CPSqliteConnectionFlushStatementCache(a1);
    int v2 = *(sqlite3 **)(a1 + 8);
    if (v2)
    {
      if (*(void *)a1 && (*(_WORD *)(*(void *)a1 + 116) & 0x1000) != 0)
      {
        uint64_t v3 = CPStartAnInhibitor();
        sqlite3_close(*(sqlite3 **)(a1 + 8));
        if (v3) {
          CPStopInhibitorWithIdentifier(v3);
        }
      }
      else
      {
        sqlite3_close(v2);
      }
    }
    uint64_t v4 = *(void (**)(void))(a1 + 40);
    if (v4) {
      v4(*(void *)(a1 + 32));
    }
    free((void *)a1);
  }
}

const void *CPSqliteDatabaseStatementForReading(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, 0, 0);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CFTypeRef v5 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v3, a2, 0);
  CFMutableDictionaryRef v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  }
  return v5;
}

const void *CPSqliteConnectionStatementForSQL(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  return CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, a2, 0);
}

const void *CPSqliteDatabaseStatementForWriting(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CFTypeRef v5 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v3, a2, 0);
  CFMutableDictionaryRef v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  }
  return v5;
}

uint64_t **CPSqliteDatabaseReleaseSqliteStatement(uint64_t **result)
{
  if (result)
  {
    if (*result)
    {
      uint64_t v1 = **result;
      if (v1)
      {
        if ((*(_WORD *)(v1 + 116) & 8) != 0) {
          return (uint64_t **)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 120));
        }
      }
    }
  }
  return result;
}

CFStringRef CPSqliteDatabaseCopyUniqueIdentifier(uint64_t a1)
{
  return CPSqliteDatabaseCopyValueForProperty(a1, @"_UniqueIdentifier");
}

CFStringRef CPSqliteDatabaseCopyValueForProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, (*(unsigned __int16 *)(a1 + 116) >> 1) & 1, 0, 0);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  CFStringRef v5 = CPSqliteConnectionCopyValueForProperty(v3, a2);
  CFMutableDictionaryRef v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  }
  return v5;
}

CFStringRef CPSqliteConnectionCopyValueForProperty(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  if (!a1 || *a1 && (*((_WORD *)*a1 + 58) & 4) != 0) {
    return 0;
  }
  uint64_t v3 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;",
         0);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (uint64_t)v3;
  CFStringRef v5 = _CPCreateUTF8StringFromCFString(a2);
  sqlite3_bind_text(*(sqlite3_stmt **)(v4 + 8), 1, (const char *)v5, -1, MEMORY[0x1E4F14838]);
  CFStringRef v6 = CPSqliteStatementCopyStringResult(v4);
  CPSqliteStatementReset(v4);
  return v6;
}

uint64_t CPSqliteDatabaseSetValueForProperty(uint64_t a1, const __CFString *a2, UInt8 *a3)
{
  CFStringRef v5 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v5) {
    return 1;
  }
  CFStringRef v6 = v5;
  uint64_t v7 = CPSqliteConnectionSetValueForProperty(v5, a2, a3);
  CFMutableDictionaryRef v8 = *v6;
  if (*v6 && (*((_WORD *)v8 + 58) & 8) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v8 + 120));
  }
  return v7;
}

uint64_t CPSqliteConnectionSetValueForProperty(CFMutableDictionaryRef *a1, const __CFString *a2, UInt8 *a3)
{
  uint64_t v3 = 1;
  if (a1 && a2 && (!*a1 || (*((_WORD *)*a1 + 58) & 4) == 0))
  {
    uint64_t v7 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
           0);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = (char *)_CPCreateUTF8StringFromCFString(a2);
      if (a3) {
        a3 = _CPCreateUTF8StringFromCFString((const __CFString *)a3);
      }
      uint64_t v3 = _performSetStringPropertyStatement(v8, v9, (const char *)a3);
      if (v3 == 17)
      {
        CFStringRef v10 = a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
              (float v11 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
                       0)) != 0))
        {
          uint64_t v3 = _performSetStringPropertyStatement((uint64_t)v11, v9, (const char *)a3);
        }
        else
        {
          uint64_t v3 = 17;
        }
      }
      free(v9);
      if (a3) {
        free(a3);
      }
    }
  }
  return v3;
}

uint64_t CPSqliteDatabaseRemoveProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (CFMutableDictionaryRef *)_CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = CPSqliteConnectionRemoveProperty(v3, a2);
  CFMutableDictionaryRef v6 = *v4;
  if (*v4 && (*((_WORD *)v6 + 58) & 8) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)v6 + 120));
  }
  return v5;
}

uint64_t CPSqliteConnectionRemoveProperty(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  uint64_t v2 = 1;
  if (a1 && a2 && (!*a1 || (*((_WORD *)*a1 + 58) & 4) == 0))
  {
    uint64_t v5 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"DELETE FROM _SqliteDatabaseProperties WHERE key = ?;",
           0);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      uint64_t v7 = (char *)_CPCreateUTF8StringFromCFString(a2);
      uint64_t v2 = _performRemovePropertyStatement(v6, v7);
      if (v2 == 17)
      {
        uint64_t v8 = a1[2];
        if (v8
          && (CFDictionaryRemoveValue(v8, @"DELETE FROM _SqliteDatabaseProperties WHERE key = ?;"),
              (uint64_t v9 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"DELETE FROM _SqliteDatabaseProperties WHERE key = ?;",
                      0)) != 0))
        {
          uint64_t v2 = _performRemovePropertyStatement((uint64_t)v9, v7);
        }
        else
        {
          uint64_t v2 = 17;
        }
      }
      free(v7);
    }
  }
  return v2;
}

uint64_t CPSqliteDatabaseRegisterFunction(uint64_t a1, const char *a2, void (__cdecl *a3)(sqlite3_context *, int, sqlite3_value **), int a4, void *a5)
{
  uint64_t v9 = _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(a1, 0, 0, 0);
  if (!v9) {
    return 1;
  }
  CFStringRef v10 = (uint64_t *)v9;
  uint64_t function = sqlite3_create_function(*(sqlite3 **)(v9 + 8), a2, a4, 1, a5, a3, 0, 0);
  uint64_t v12 = *v10;
  if (*v10 && (*(_WORD *)(v12 + 116) & 8) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v12 + 120));
  }
  return function;
}

uint64_t CPSqliteDatabaseSetProfileCallback(uint64_t a1, void (__cdecl *a2)(void *, const char *, sqlite3_uint64))
{
  return CPSqliteDatabaseSetProfileCallbackWithContext(a1, a2, 0);
}

uint64_t CPSqliteDatabaseSetProfileCallbackWithContext(uint64_t result, void (__cdecl *a2)(void *, const char *, sqlite3_uint64), void *a3)
{
  if (result)
  {
    uint64_t result = _CPSqliteDatabaseConnectionForWithSqlite3OpenFlagsAndReturnError(result, 0, 0, 0);
    if (result)
    {
      uint64_t v5 = (uint64_t *)result;
      uint64_t result = (uint64_t)sqlite3_profile(*(sqlite3 **)(result + 8), a2, a3);
      uint64_t v6 = *v5;
      if (*v5)
      {
        if ((*(_WORD *)(v6 + 116) & 8) != 0)
        {
          return pthread_mutex_unlock((pthread_mutex_t *)(v6 + 120));
        }
      }
    }
  }
  return result;
}

uint64_t CPSqliteDatabaseSetLoggingEnabled(uint64_t a1, int a2)
{
  int v4 = _debugLoggingEnabled();
  if (__debugLoggingForced == -1)
  {
    __debugLoggingForced = getenv("CPSQLDEBUG") != 0;
    if (__debugLoggingForced) {
      goto LABEL_3;
    }
  }
  else if (__debugLoggingForced)
  {
    goto LABEL_3;
  }
  __debugLoggingEnabled = a2 != 0;
LABEL_3:
  int v5 = _debugLoggingEnabled();
  if (v5 != v4)
  {
    if (v5) {
      uint64_t v6 = (void (__cdecl *)(void *, const char *, sqlite3_uint64))CPSqliteDatabaseDefaultProfileCallback;
    }
    else {
      uint64_t v6 = 0;
    }
    CPSqliteDatabaseSetProfileCallbackWithContext(a1, v6, 0);
  }
  return 0;
}

void CPSqliteDatabaseDefaultProfileCallback(uint64_t a1, const char *a2, unint64_t a3)
{
  syslog(4, "==\nCPSqlite: %s\nTime: %llu ms\n", a2, a3 >> 20);
}

void *CPSqliteSetupLoggingForDatabaseHandle(sqlite3 *a1)
{
  uint64_t result = (void *)_debugLoggingEnabled();
  if (a1 && result)
  {
    return sqlite3_profile(a1, (void (__cdecl *)(void *, const char *, sqlite3_uint64))CPSqliteDatabaseDefaultProfileCallback, 0);
  }
  return result;
}

uint64_t CPSqliteDatabaseSetBusyHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 216) = a2;
    *(void *)(result + 224) = a3;
  }
  return result;
}

void CPSqliteRegisterYieldNotifyBlock(uint64_t a1, void *aBlock)
{
  if (a1)
  {
    uint64_t v3 = *(const void **)(a1 + 240);
    int v4 = aBlock ? _Block_copy(aBlock) : 0;
    *(void *)(a1 + 240) = v4;
    if (v3)
    {
      _Block_release(v3);
    }
  }
}

uint64_t CPSqliteDatabaseUnlockRequested(uint64_t result)
{
  if (result) {
    return (*(unsigned __int16 *)(result + 116) >> 9) & 1;
  }
  return result;
}

uint64_t CPSqliteDatabaseSetShouldRequestUnlock(uint64_t result, int a2)
{
  if (result)
  {
    if (a2) {
      __int16 v2 = 16;
    }
    else {
      __int16 v2 = 0;
    }
    *(_WORD *)(result + 116) = *(_WORD *)(result + 116) & 0xFFEF | v2;
  }
  return result;
}

void CPSqliteDatabaseSetShouldYieldWhenRequested(uint64_t a1, int a2)
{
  if (a1)
  {
    if (a2) {
      __int16 v3 = 32;
    }
    else {
      __int16 v3 = 0;
    }
    __int16 v4 = *(_WORD *)(a1 + 116) & 0xFFDF | v3;
    *(_WORD *)(a1 + 116) = v4;
    if ((v4 & 0x60) == 0x20)
    {
      *(_WORD *)(a1 + 116) = v4 | 0x40;
      NotifyName = createNotifyName((const __CFString **)a1);
      global_queue = dispatch_get_global_queue(2, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 0x40000000;
      handler[2] = __updateNotifyRegistration_block_invoke;
      handler[3] = &__block_descriptor_tmp;
      handler[4] = a1;
      if (!notify_register_dispatch(NotifyName, (int *)(a1 + 232), global_queue, handler)) {
        *(_WORD *)(a1 + 116) |= 0x80u;
      }
      free(NotifyName);
    }
    else if ((v4 & 0xA0) == 0x80)
    {
      notify_cancel(*(_DWORD *)(a1 + 232));
      *(_WORD *)(a1 + 116) &= 0xFF3Fu;
      *(_DWORD *)(a1 + 232) = 0;
    }
  }
}

void CPSqliteDatabaseRequestUnlock(uint64_t a1)
{
  if (a1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v3 = Current - *(double *)(a1 + 272);
    if (v3 < 0.0 || v3 > 1.0)
    {
      *(double *)(a1 + 272) = Current;
      NotifyName = createNotifyName((const __CFString **)a1);
      notify_post(NotifyName);
      *(_WORD *)(a1 + 116) |= 0x100u;
      free(NotifyName);
    }
  }
}

char *createNotifyName(const __CFString **a1)
{
  uint64_t v1 = _CPCreateUTF8StringFromCFString(*a1);
  double v3 = 0;
  asprintf(&v3, "com.apple.AppSupport-%s", (const char *)v1);
  free(v1);
  return v3;
}

sqlite3_stmt *CPSqlitePreparedStatement(uint64_t *a1, char *zSql, int a3)
{
  ppStmt = 0;
  if (!a1) {
    return 0;
  }
  __int16 v4 = (sqlite3 *)a1[1];
  if (!v4) {
    return 0;
  }
  do
    int v7 = sqlite3_prepare_v2(v4, zSql, -1, &ppStmt, 0);
  while ((v7 - 5) < 2);
  uint64_t v8 = ppStmt;
  if (v7 || !ppStmt)
  {
    if (!a3)
    {
      uint64_t v9 = sqlite3_errmsg(v4);
      syslog(4, "%sCould not compile statement %s: %s\n", "warning: ", zSql, v9);
      uint64_t v10 = *a1;
      if (*a1)
      {
        float v11 = *(void (**)(uint64_t, uint64_t *, uint64_t, char *, const char *))(v10 + 296);
        if (v11)
        {
          uint64_t v12 = sqlite3_errcode(v4);
          v11(v10, a1, v12, zSql, v9);
        }
      }
      uint64_t v8 = ppStmt;
    }
    if (!v8) {
      return v8;
    }
    sqlite3_finalize(v8);
    return 0;
  }
  if (CPSqlitePreparedStatement_checkedEnv)
  {
    if (!(_BYTE)CPSqlitePreparedStatement_sExplainSettings) {
      return v8;
    }
  }
  else
  {
    CPSqlitePreparedStatement_checkedEnv = 1;
    char v14 = getenv("CPSQLEXPLAIN");
    BYTE1(CPSqlitePreparedStatement_sExplainSettings) = v14 != 0;
    int v15 = getenv("CPSQLEXPLAIN_TABLES");
    HIBYTE(CPSqlitePreparedStatement_sExplainSettings) = v15 != 0;
    uint64_t v16 = getenv("CPSQLEXPLAIN_ONLY_NON_INDEXED");
    BYTE2(CPSqlitePreparedStatement_sExplainSettings) = v16 != 0;
    HIBYTE(CPSqlitePreparedStatement_sExplainSettings) = ((unint64_t)v15 | (unint64_t)v16) != 0;
    LOBYTE(CPSqlitePreparedStatement_sExplainSettings) = ((unint64_t)v14 | (unint64_t)v15 | (unint64_t)v16) != 0;
    if (!((unint64_t)v14 | (unint64_t)v15 | (unint64_t)v16)) {
      return v8;
    }
  }
  v21[1] = zSql;
  uint64_t v22 = 0;
  v21[0] = CPSqlitePreparedStatement_sExplainSettings;
  CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"EXPLAIN QUERY PLAN %s", zSql);
  uint64_t v18 = _CPCreateUTF8StringFromCFString(v17);
  sqlite3_exec(v4, (const char *)v18, (int (__cdecl *)(void *, int, char **, char **))ExplainQueryPlanCallback, v21, 0);
  free(v18);
  if (v17) {
    CFRelease(v17);
  }
  if (HIDWORD(v22))
  {
    syslog(4, "----------------------------\n");
    int v19 = HIDWORD(v22)--;
    if (v19 >= 2)
    {
      do
        syslog(4, "\n");
      while (HIDWORD(v22)-- > 1);
    }
  }
  return ppStmt;
}

uint64_t ExplainQueryPlanCallback(uint64_t a1, int a2, char **a3, const char **a4)
{
  int v8 = *(unsigned __int8 *)(a1 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 1))
    {
      syslog(4, "----- Explaining Query -----\n%s\n", *(const char **)(a1 + 8));
      int v8 = 1;
      *(unsigned char *)(a1 + 16) = 1;
      *(_DWORD *)(a1 + 20) = 1;
    }
    else
    {
      int v8 = 0;
    }
  }
  if (a2 >= 1)
  {
    uint64_t v9 = a2;
    while (strcmp(*a4, "detail"))
    {
      ++a3;
      ++a4;
      if (!--v9) {
        return 0;
      }
    }
    uint64_t v10 = *a3;
    if (!strstr(*a3, "WITH INDEX") && !strstr(v10, "USING PRIMARY KEY"))
    {
      if (*(unsigned char *)(a1 + 2)) {
        float v11 = " ***** NO INDEX *****";
      }
      else {
        float v11 = "";
      }
      if (!v8 && *(unsigned char *)(a1 + 2) && !*(unsigned char *)(a1 + 1))
      {
        syslog(4, "--------------------------\n !!!!! NOT INDEXED !!!!!\n--------------------------\n%s\n--------------------------\n", *(const char **)(a1 + 8));
        *(unsigned char *)(a1 + 16) = 1;
        *(_DWORD *)(a1 + 20) = 2;
        uint64_t v10 = *a3;
      }
      goto LABEL_14;
    }
    float v11 = "";
    if (!*(unsigned char *)(a1 + 2) || v8) {
LABEL_14:
    }
      syslog(4, " ==>>%s %s\n", v11, v10);
  }
  return 0;
}

const void *CPSqliteConnectionStatementForSQLAndIgnoreErrors(CFMutableDictionaryRef *a1, const __CFString *key, int a3)
{
  if (!a1) {
    return 0;
  }
  int v7 = a1 + 2;
  CFDictionaryRef v6 = a1[2];
  if (!v6)
  {
    *(_OWORD *)&v28.version = 0uLL;
    v28.copyDescription = 0;
    v28.equal = 0;
    v28.release = (CFDictionaryReleaseCallBack)CPSqliteStatementFinalize;
    CFDictionaryRef v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], &v28);
    *int v7 = v6;
  }
  if (*((int *)*a1 + 72) >= 1 && !a1[3])
  {
    memset(&v28, 0, sizeof(v28));
    a1[3] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], &v28);
    CFDictionaryRef v6 = a1[2];
  }
  Value = CFDictionaryGetValue(v6, key);
  if (!Value)
  {
    if (!*((_DWORD *)*a1 + 72))
    {
      Value = CPSqliteStatementForSQLUncachedAndIgnoreErrors((uint64_t *)a1, key, a3);
      if (!Value) {
        return Value;
      }
      goto LABEL_32;
    }
    uint64_t v9 = a1 + 3;
    uint64_t v10 = CFDictionaryGetValue(a1[3], key);
    if (v10)
    {
      Value = v10;
      CFDictionaryRemoveValue(*v9, key);
LABEL_32:
      CFDictionarySetValue(*v7, key, Value);
      return Value;
    }
    Value = CPSqliteStatementForSQLUncachedAndIgnoreErrors((uint64_t *)a1, key, a3);
    if (Value)
    {
      CFIndex Count = CFDictionaryGetCount(a1[3]);
      CFIndex v12 = *((unsigned int *)*a1 + 72);
      if ((int)v12 >= 1)
      {
        CFIndex v13 = Count;
        if (Count >= v12)
        {
          char v14 = (const void **)malloc_type_malloc(8 * Count, 0x10040436913F5uLL);
          if (v14)
          {
            int v15 = v14;
            uint64_t v16 = (const void **)malloc_type_malloc(8 * v13, 0x2004093837F09uLL);
            if (v16)
            {
              CFStringRef v17 = v16;
              CFDictionaryGetKeysAndValues(*v9, v15, v16);
              uint64_t v18 = *v15;
              int v19 = (double *)*v17;
              uint32_t v20 = arc4random_uniform(v13);
              double v21 = CPMachAbsoluteTime();
              uint32_t v22 = v20;
              while (1)
              {
                uint64_t v23 = v22;
                v24 = (double *)v17[v22];
                double v25 = v24[2];
                if (v21 - v25 > 300.0) {
                  break;
                }
                if (v25 < v19[2])
                {
                  uint64_t v18 = v15[v23];
                  int v19 = v24;
                }
                if (v13 == v23 + 1) {
                  uint32_t v22 = 0;
                }
                else {
                  uint32_t v22 = v23 + 1;
                }
                if (v22 == v20) {
                  goto LABEL_29;
                }
              }
              uint64_t v18 = v15[v23];
LABEL_29:
              __int16 v26 = CFDictionaryGetValue(*v9, v18);
              CPSqliteStatementFinalize((int)v26, v26);
              CFDictionaryRemoveValue(*v9, v18);
              free(v17);
            }
            free(v15);
          }
        }
      }
      int v7 = v9;
      goto LABEL_32;
    }
  }
  return Value;
}

uint64_t CPSqliteConnectionPerformSQL(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  __int16 v2 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, a2, 0);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = (uint64_t)v2;
  uint64_t v4 = CPSqliteStatementPerform((uint64_t)v2);
  CPSqliteStatementReset(v3);
  return v4;
}

uint64_t CPSqliteStatementPerform(uint64_t a1)
{
  if (!a1 || !*(void *)(a1 + 8)) {
    return 1;
  }
  uint64_t v2 = CPSqliteStatementStep(a1);
  uint64_t v3 = **(void **)a1;
  int v4 = (*(_WORD *)(v3 + 116) & 2) != 0 && *(void *)(v3 + 8) == 0;
  checkResultWithStatement((void *)v3, v4, *(sqlite3 **)(*(void *)a1 + 8), v2, (uint64_t)"CPSqliteStatementPerform", a1);
  return v2;
}

uint64_t CPSqliteStatementReset(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v2 = *(sqlite3_stmt **)(a1 + 8);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = sqlite3_reset(v2);
  uint64_t v4 = **(void **)a1;
  int v5 = (*(_WORD *)(v4 + 116) & 2) != 0 && *(void *)(v4 + 8) == 0;
  CFDictionaryRef v6 = *(sqlite3 **)(*(void *)a1 + 8);
  unsigned int v7 = sqlite3_errcode(v6);
  checkResultWithStatement((void *)v4, v5, v6, v7, (uint64_t)"CPSqliteStatementReset", a1);
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 8));
  return v3;
}

void CPSqliteConnectionFlushStatementCache(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 16) = 0;
    }
    CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 24);
    if (v3)
    {
      CFIndex Count = CFDictionaryGetCount(v3);
      int v5 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 24), 0, v5);
      CFRelease(*(CFTypeRef *)(a1 + 24));
      *(void *)(a1 + 24) = 0;
      if (Count >= 1)
      {
        unsigned int v7 = v5;
        do
        {
          int v8 = *v7++;
          CPSqliteStatementFinalize(v6, v8);
          --Count;
        }
        while (Count);
      }
      free(v5);
    }
  }
}

void CPSqliteStatementFinalize(int a1, void *a2)
{
  if (a2)
  {
    CFDictionaryRef v3 = (sqlite3_stmt *)a2[1];
    if (v3) {
      sqlite3_finalize(v3);
    }
  }
  free(a2);
}

uint64_t CPSqliteConnectionBeginTransactionType(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 64) != 0xFFFF) {
    return 0;
  }
  CFMutableDictionaryRef v4 = *(CFMutableDictionaryRef *)a1;
  if (*(void *)a1)
  {
    if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8)))
    {
      int v5 = *((unsigned __int16 *)v4 + 58);
      if ((~v5 & 0x220) == 0)
      {
        if ((v5 & 0x100) != 0)
        {
          __int16 v6 = v5 & 0xFEFF;
        }
        else
        {
          usleep(0xF4240u);
          __int16 v6 = *((_WORD *)v4 + 58);
        }
        *((_WORD *)v4 + 58) = v6 & 0xFDFF;
      }
    }
  }
  if (a2 > 2)
  {
    uint64_t result = 0;
  }
  else
  {
    CFStringRef v8 = off_1E5668E60[a2];
    uint64_t result = sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8));
    if (result) {
      uint64_t result = _performSqlUsingConnection((CFMutableDictionaryRef *)a1, v8);
    }
  }
  if (result) {
    BOOL v9 = result == 101;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = v9;
  if (a2 != 0xFFFF)
  {
    if (v10) {
      *(_DWORD *)(a1 + 64) = a2;
    }
  }
  return result;
}

uint64_t _performSqlUsingConnection(CFMutableDictionaryRef *a1, const __CFString *a2)
{
  uint64_t v2 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, a2, 0);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = (uint64_t)v2;
  if (!v2[1]) {
    return 1;
  }
  int v4 = CPSqliteStatementPerform((uint64_t)v2);
  CPSqliteStatementReset(v3);
  if (v4 == 101) {
    return 101;
  }
  __int16 v6 = *(sqlite3 **)(*(void *)v3 + 8);
  return sqlite3_errcode(v6);
}

uint64_t CPSqliteConnectionGetActiveTransactionType(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 64);
  }
  else {
    return 0xFFFFLL;
  }
}

uint64_t CPSqliteConnectionBegin(uint64_t a1)
{
  return CPSqliteConnectionBeginTransactionType(a1, 0);
}

uint64_t CPSqliteConnectionCommit(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t result = _performSqlUsingConnection((CFMutableDictionaryRef *)a1, @"COMMIT;");
  *(_DWORD *)(a1 + 64) = 0xFFFF;
  return result;
}

uint64_t CPSqliteConnectionRollback(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8))) {
    return 0;
  }
  uint64_t result = _performSqlUsingConnection((CFMutableDictionaryRef *)a1, @"ROLLBACK;");
  *(_DWORD *)(a1 + 64) = 0xFFFF;
  return result;
}

BOOL CPSqliteConnectionShouldCacheStatements(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 68) != 0;
  }
  return result;
}

uint64_t CPSqliteConnectionSetShouldCacheStatements(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 68) = a2;
  }
  return result;
}

void CPSqliteStatementBindValuesForColumns(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  if (a1 && a3)
  {
    int v5 = *(sqlite3_stmt **)(a1 + 8);
    int v6 = a4 + 1;
    uint64_t v7 = a3;
    do
    {
      _bindColumnValueAtIndex(v5, a2, v6);
      a2 += 24;
      ++v6;
      --v7;
    }
    while (v7);
  }
}

void _bindColumnValueAtIndex(sqlite3_stmt *a1, uint64_t a2, int a3)
{
  switch(*(_DWORD *)(a2 + 8))
  {
    case 0:
      int v6 = *(_DWORD *)(a2 + 16);
      sqlite3_bind_int(a1, a3, v6);
      return;
    case 1:
      sqlite3_int64 v7 = *(void *)(a2 + 16);
      sqlite3_bind_int64(a1, a3, v7);
      return;
    case 2:
      CFStringRef v8 = *(const __CFString **)(a2 + 16);
      if (!v8) {
        goto LABEL_26;
      }
      BOOL v9 = _CPCreateUTF8StringFromCFString(v8);
      int v10 = (void (__cdecl *)(void *))MEMORY[0x1E4F14838];
      sqlite3_bind_text(a1, a3, (const char *)v9, -1, v10);
      return;
    case 3:
    case 5:
      syslog(4, "%s does not handle raw data types yet.", "void _bindColumnValueAtIndex(sqlite3_stmt *, CPWriteColumnDescriptor *, unsigned int)");
      return;
    case 4:
      CFDataRef v11 = *(const __CFData **)(a2 + 16);
      if (!v11) {
        goto LABEL_26;
      }
      BytePtr = CFDataGetBytePtr(v11);
      int Length = CFDataGetLength(*(CFDataRef *)(a2 + 16));
      sqlite3_bind_blob(a1, a3, BytePtr, Length, 0);
      return;
    case 6:
      double v14 = *(float *)(a2 + 16);
      goto LABEL_23;
    case 7:
      CFNumberRef v15 = *(const __CFNumber **)(a2 + 16);
      if (!v15) {
        goto LABEL_26;
      }
      double valuePtr = 0.0;
      if (CFNumberIsFloatType(v15))
      {
        CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberDoubleType, &valuePtr);
        sqlite3_bind_double(a1, a3, valuePtr);
      }
      else
      {
        CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberSInt64Type, &valuePtr);
        sqlite3_bind_int64(a1, a3, *(sqlite3_int64 *)&valuePtr);
      }
      break;
    case 8:
      if (*(void *)(a2 + 16))
      {
        MEMORY[0x192FBE2F0]();
LABEL_23:
        sqlite3_bind_double(a1, a3, v14);
      }
      else
      {
LABEL_26:
        sqlite3_bind_null(a1, a3);
      }
      break;
    default:
      return;
  }
}

uint64_t CPSqliteConnectionAddRecord(CFMutableDictionaryRef *a1, const __CFString *a2, const char **a3, unsigned int a4)
{
  return CPSqliteConnectionAddRecordWithRowid(a1, a2, -1, a3, a4);
}

uint64_t CPSqliteConnectionAddRecordWithRowid(CFMutableDictionaryRef *a1, const __CFString *a2, sqlite3_int64 a3, const char **a4, unsigned int a5)
{
  if (!a1) {
    return 1;
  }
  if (a5)
  {
    BOOL v9 = a4;
    BOOL v11 = a3 == -1 && a5 < 3;
    if (v11)
    {
      if (a5 == 1) {
        CFMutableStringRef v12 = @"?";
      }
      else {
        CFMutableStringRef v12 = @"?, ?";
      }
      CFIndex v13 = *a4;
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    }
    else
    {
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableStringRef v12 = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      CFStringAppend(v12, @"?");
      CFIndex v13 = *v9;
      CFMutableStringRef Mutable = CFStringCreateMutable(v14, 0);
      if (a3 != -1)
      {
        CFStringAppend(v12, @", ?");
        CFStringAppend(Mutable, @"ROWID, ");
      }
    }
    CFStringRef v19 = CFStringCreateWithCString(v14, v13, 0x8000100u);
    CFStringAppend(Mutable, v19);
    CFRelease(v19);
    unsigned int v37 = a5;
    if (a5 >= 2)
    {
      uint32_t v20 = v9 + 3;
      uint64_t v21 = a5 - 1;
      do
      {
        CFStringRef v22 = CFStringCreateWithCString(v14, *v20, 0x8000100u);
        CFStringAppend(Mutable, @", ");
        CFStringAppend(Mutable, v22);
        CFRelease(v22);
        if (!v11) {
          CFStringAppend(v12, @", ?");
        }
        v20 += 3;
        --v21;
      }
      while (v21);
    }
    MutableCFStringRef Copy = CFStringCreateMutableCopy(0, 0, @"INSERT INTO ");
    CFStringAppend(MutableCopy, a2);
    CFStringAppend(MutableCopy, @" (");
    CFStringAppend(MutableCopy, Mutable);
    CFStringAppend(MutableCopy, @" VALUES ("));
    CFStringAppend(MutableCopy, v12);
    CFStringAppend(MutableCopy, @";"));
    v24 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, MutableCopy, 0);
    if (v24)
    {
      uint64_t v25 = (uint64_t)v24;
      __int16 v26 = (sqlite3_stmt *)*((void *)v24 + 1);
      if (a3 == -1)
      {
        uint64_t v30 = 0;
        do
        {
          _bindColumnValueAtIndex(v26, (uint64_t)v9, ++v30);
          v9 += 3;
        }
        while (v37 != v30);
      }
      else
      {
        sqlite3_bind_int64(*((sqlite3_stmt **)v24 + 1), 1, a3);
        uint64_t v27 = 0;
        CFDictionaryValueCallBacks v28 = *(sqlite3_stmt **)(v25 + 8);
        do
        {
          _bindColumnValueAtIndex(v28, (uint64_t)v9, v27++ + 2);
          v9 += 3;
        }
        while (v37 != v27);
      }
      uint64_t v31 = CPSqliteStatementPerform(v25);
      CPSqliteStatementReset(v25);
      CFRelease(MutableCopy);
      CFRelease(Mutable);
      if (!v11) {
        CFRelease(v12);
      }
      return v31;
    }
    if (v12) {
      CFRelease(v12);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (MutableCopy)
    {
      CFMutableStringRef v29 = MutableCopy;
LABEL_43:
      CFRelease(v29);
      return 1;
    }
    return 1;
  }
  CFMutableStringRef v16 = CFStringCreateMutableCopy(0, 0, @"INSERT INTO ");
  CFStringAppend(v16, a2);
  if (a3 == -1)
  {
    CFStringAppend(v16, @" (ROWID) VALUES(NULL);");
    uint64_t v18 = (void *)CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, v16, 0);
    if (v18) {
      goto LABEL_40;
    }
  }
  else
  {
    CFStringAppend(v16, @" (ROWID) VALUES(?);");
    CFStringRef v17 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, v16, 0);
    if (v17)
    {
      uint64_t v18 = v17;
      sqlite3_bind_int64(v17[1], 1, a3);
LABEL_40:
      uint64_t v32 = CPSqliteStatementPerform((uint64_t)v18);
      CPSqliteStatementReset((uint64_t)v18);
      CFRelease(v16);
      return v32;
    }
  }
  if (v16)
  {
    CFMutableStringRef v29 = v16;
    goto LABEL_43;
  }
  return 1;
}

uint64_t CPSqliteConnectionUpdateRecord(CFMutableDictionaryRef *a1, const __CFString *a2, sqlite3_int64 a3, long long *a4, unsigned int a5)
{
  uint64_t v5 = 1;
  if (a1 && a5)
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    CFStringAppend(Mutable, @"UPDATE ");
    CFStringAppend(Mutable, a2);
    CFStringAppend(Mutable, @" SET ");
    uint64_t v12 = 0;
    do
    {
      CFStringRef v13 = CFStringCreateWithCString(v10, *(const char **)((char *)a4 + v12), 0x8000100u);
      if (v12) {
        CFStringAppend(Mutable, @", ");
      }
      CFStringAppend(Mutable, v13);
      CFStringAppend(Mutable, @" = ?");
      CFRelease(v13);
      v12 += 24;
    }
    while (24 * a5 != v12);
    CFStringAppend(Mutable, @" WHERE ROWID = ?;");
    CFAllocatorRef v14 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, Mutable, 0);
    CFRelease(Mutable);
    if (v14)
    {
      uint64_t v15 = 0;
      CFMutableStringRef v16 = (sqlite3_stmt *)*((void *)v14 + 1);
      do
      {
        long long v19 = *a4;
        uint64_t v20 = *((void *)a4 + 2);
        _bindColumnValueAtIndex(v16, (uint64_t)&v19, ++v15);
        a4 = (long long *)((char *)a4 + 24);
      }
      while (a5 != v15);
      sqlite3_bind_int64(v16, v15 + 1, a3);
      uint64_t v5 = CPSqliteStatementPerform((uint64_t)v14);
      CPSqliteStatementReset((uint64_t)v14);
    }
    else
    {
      return 1;
    }
  }
  return v5;
}

CFStringRef CPSqliteStatementCopyStringResult(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 8)) {
    return 0;
  }
  if (CPSqliteStatementStep(a1) != 100) {
    return 0;
  }
  uint64_t v2 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (const char *)v2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  return CFStringCreateWithCString(v4, v3, 0x8000100u);
}

CFMutableDictionaryRef *CPSqliteConnectionCopyValuesForPropertiesLike(CFMutableDictionaryRef *result, const __CFString *a2, __CFArray **a3, __CFArray **a4)
{
  if (!result || *result && (*((_WORD *)*result + 58) & 4) != 0) {
    return result;
  }
  uint64_t result = (CFMutableDictionaryRef *)CPSqliteConnectionStatementForSQLAndIgnoreErrors(result, @"SELECT key, value FROM _SqliteDatabaseProperties WHERE key LIKE ?;",
                                       0);
  if (!result) {
    return result;
  }
  sqlite3_int64 v7 = result;
  CFStringRef v8 = _CPCreateUTF8StringFromCFString(a2);
  sqlite3_bind_text(v7[1], 1, (const char *)v8, -1, MEMORY[0x1E4F14838]);
  BOOL v9 = 0;
  CFMutableStringRef Mutable = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v12 = (const void *)*MEMORY[0x1E4F1D260];
  CFStringRef v13 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  while (1)
  {
    int v14 = CPSqliteStatementStep((uint64_t)v7);
    if (v14 != 100) {
      break;
    }
    if (!a3) {
      goto LABEL_19;
    }
    uint64_t v15 = sqlite3_column_text(v7[1], 0);
    if (v15) {
      CFStringRef v16 = CFStringCreateWithCString(v11, (const char *)v15, 0x8000100u);
    }
    else {
      CFStringRef v16 = 0;
    }
    if ((unint64_t)a4 | (unint64_t)v16)
    {
      if (!Mutable) {
        CFMutableStringRef Mutable = CFArrayCreateMutable(v11, 0, v13);
      }
      if (v16) {
        CFStringRef v17 = v16;
      }
      else {
        CFStringRef v17 = v12;
      }
      CFArrayAppendValue(Mutable, v17);
      if (v16) {
        CFRelease(v16);
      }
LABEL_19:
      if (a4)
      {
        uint64_t v18 = sqlite3_column_text(v7[1], 1);
        CFStringRef v19 = v18 ? CFStringCreateWithCString(v11, (const char *)v18, 0x8000100u) : 0;
        if ((unint64_t)a3 | (unint64_t)v19)
        {
          if (!v9) {
            BOOL v9 = CFArrayCreateMutable(v11, 0, v13);
          }
          if (v19) {
            uint64_t v20 = v19;
          }
          else {
            uint64_t v20 = v12;
          }
          CFArrayAppendValue(v9, v20);
          if (v19) {
            CFRelease(v19);
          }
        }
      }
    }
  }
  if (v14 != 101)
  {
    uint64_t v21 = sqlite3_errmsg(*((sqlite3 **)*v7 + 1));
    syslog(4, "%s: %s\n", "CPSqliteConnectionCopyValuesForPropertiesLike", v21);
  }
  uint64_t result = (CFMutableDictionaryRef *)CPSqliteStatementReset((uint64_t)v7);
  if (a3 && Mutable) {
    *a3 = Mutable;
  }
  if (a4 && v9) {
    *a4 = v9;
  }
  return result;
}

uint64_t CPSqliteStatementStep(uint64_t a1)
{
  if ((*(_WORD *)(**(void **)a1 + 116) & 0x800) == 0)
  {
    uint64_t v2 = *(sqlite3_stmt **)(a1 + 8);
    return sqlite3_step(v2);
  }
  unsigned int v12 = 0;
  unsigned int v4 = 0;
  int v5 = 0;
  double v6 = 0.0;
  while (2)
  {
    for (int i = 3 * v4; ; i += 3)
    {
      uint64_t v8 = sqlite3_step(*(sqlite3_stmt **)(a1 + 8));
      if (v8 > 0xDu)
      {
        if (v8 != 14)
        {
          BOOL v11 = v8 == 100;
          goto LABEL_41;
        }
        if (v5 > 2) {
          goto LABEL_40;
        }
        if (v6 == 0.0) {
          double v6 = CFAbsoluteTimeGetCurrent() + 240.0;
        }
        ++v5;
        if (v4 <= 0xA) {
          useconds_t v9 = i + 1;
        }
        else {
          useconds_t v9 = v4 + 1101;
        }
        goto LABEL_32;
      }
      if (v8 != 5)
      {
        if (v8 != 6) {
          goto LABEL_40;
        }
        if (!*(unsigned char *)(a1 + 24)) {
          sqlite3_reset(*(sqlite3_stmt **)(a1 + 8));
        }
        if (v6 == 0.0) {
          double v6 = CFAbsoluteTimeGetCurrent() + 240.0;
        }
        if (v4 <= 0xA) {
          useconds_t v9 = 3 * v4 + 1;
        }
        else {
          useconds_t v9 = v4 + 1101;
        }
        goto LABEL_32;
      }
      if (!*(unsigned char *)(a1 + 24)) {
        sqlite3_reset(*(sqlite3_stmt **)(a1 + 8));
      }
      if (v6 == 0.0) {
        double v6 = CFAbsoluteTimeGetCurrent() + 240.0;
      }
      if (v4 >= 0x2711)
      {
        if (v4 - 10000 >= 0xB) {
          useconds_t v9 = v4 - 8899;
        }
        else {
          useconds_t v9 = i - 29999;
        }
LABEL_32:
        usleep(v9);
      }
      if (v6 != 0.0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current > v6) {
          break;
        }
      }
      ++v4;
    }
    if (v12 <= 7)
    {
      ++v4;
      double v6 = Current + 30.0;
      ++v12;
      continue;
    }
    break;
  }
  CFLog();
LABEL_40:
  BOOL v11 = 0;
LABEL_41:
  *(unsigned char *)(a1 + 24) = v11;
  return v8;
}

uint64_t CPSqliteConnectionIntegerForPropertyWithDefaultValue(CFMutableDictionaryRef *a1, const __CFString *a2, uint64_t a3)
{
  BOOL v8 = 0;
  int v7 = 0;
  uint64_t v4 = _integerForProperty(a1, a2, &v7, &v8, 0);
  if (v8) {
    return v4;
  }
  if ((v7 - 100) >= 2 && v7 != 0) {
    syslog(4, "SQLite error fetching integer property: %i", v7);
  }
  return a3;
}

uint64_t _integerForProperty(CFMutableDictionaryRef *a1, const __CFString *a2, int *a3, BOOL *a4, int a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (!a1) {
    return 0;
  }
  useconds_t v9 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQLAndIgnoreErrors(a1, @"SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;",
                          a5);
  if (!v9) {
    return 0;
  }
  CFAllocatorRef v10 = v9;
  BOOL v11 = _CPCreateUTF8StringFromCFString(a2);
  int v14 = 101;
  sqlite3_bind_text(v10[1], 1, (const char *)v11, -1, MEMORY[0x1E4F14838]);
  uint64_t v12 = CPSqliteStatementIntegerResult(v10, &v14);
  if (a4) {
    *a4 = v14 == 100;
  }
  CPSqliteStatementReset((uint64_t)v10);
  if (a3) {
    *a3 = sqlite3_errcode(a1[1]);
  }
  return v12;
}

uint64_t _performSetStringPropertyStatement(uint64_t a1, char *a2, const char *a3)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, a2, -1, 0);
  int v5 = *(sqlite3_stmt **)(a1 + 8);
  if (a3) {
    sqlite3_bind_text(v5, 2, a3, -1, 0);
  }
  else {
    sqlite3_bind_null(v5, 2);
  }
  CPSqliteStatementPerform(a1);
  return CPSqliteStatementReset(a1);
}

uint64_t _performSetIntegerPropertyStatement(uint64_t a1, char *a2, int a3)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, a2, -1, 0);
  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 8), 2, a3);
  CPSqliteStatementPerform(a1);
  return CPSqliteStatementReset(a1);
}

uint64_t _performRemovePropertyStatement(uint64_t a1, char *a2)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, a2, -1, 0);
  CPSqliteStatementPerform(a1);
  return CPSqliteStatementReset(a1);
}

sqlite3_int64 CPSqliteConnectionRowidOfLastInsert(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(sqlite3 **)(a1 + 8)) != 0) {
    return sqlite3_last_insert_rowid(v1);
  }
  else {
    return -1;
  }
}

uint64_t CPSqliteConnectionCheckNoConnectionError(uint64_t a1, int a2, const char *a3)
{
  if ((a2 - 100) < 2 || a2 == 0) {
    return 0;
  }
  int v5 = sqlite3_errmsg(*(sqlite3 **)(a1 + 8));
  syslog(4, "sqlite3 error in %s: %s\n", a3, v5);
  return 1;
}

void CPSqliteConnectionEnableProgressHandlerCallback(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a1 && a2 >= 1 && a3)
  {
    int v5 = (sqlite3 *)a1[1];
    if (v5)
    {
      a1[6] = a3;
      a1[7] = a4;
      sqlite3_progress_handler(v5, a2, (int (__cdecl *)(void *))_CPSqliteConnectionDefaultProgressHandler, a1);
    }
  }
}

uint64_t _CPSqliteConnectionDefaultProgressHandler(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(a1 + 48);
  if (v1) {
    return v1(a1, *(void *)(a1 + 56));
  }
  else {
    return 0;
  }
}

void CPSqliteConnectionDisableProgressHandlerCallback(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(sqlite3 **)(a1 + 8);
    if (v1) {
      sqlite3_progress_handler(v1, 0, 0, 0);
    }
  }
}

void checkResultWithStatement(void *a1, int a2, sqlite3 *db, unsigned int a4, uint64_t a5, uint64_t a6)
{
  int v12 = sqlite3_extended_errcode(db);
  if (a4 - 1 <= 0x62)
  {
    CFStringRef v13 = sqlite3_errmsg(db);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      checkResultWithStatement_cold_1((uint64_t)v13, a4, v12);
    }
  }
  if (a4 > 0x1A) {
    goto LABEL_16;
  }
  if (((1 << a4) & 0x4000C00) == 0)
  {
    if (((1 << a4) & 0x80100) != 0)
    {
LABEL_13:
      if (a6) {
        uint64_t v15 = *(sqlite3_stmt **)(a6 + 8);
      }
      else {
        uint64_t v15 = 0;
      }
      sqlite3PrintErrorWithStatement(db, a5, v15);
      return;
    }
LABEL_16:
    if (a4 - 5 > 1) {
      return;
    }
    goto LABEL_13;
  }
  int v14 = (uint64_t (*)(void *))a1[9];
  if (!v14 || (v14(a1) & 1) == 0)
  {
    switch(a4)
    {
      case 0xAu:
        handleSqliteIOError(a1, a2, (uint64_t)db, a6, v12);
        break;
      case 0x1Au:
        handleSqliteNotADBError(a1, a2, db, a6);
      case 0xBu:
        handleSqliteCorruptError(a1, a2, db, a6);
    }
  }
}

uint64_t CPSqliteStatementIntegerResult(sqlite3_stmt **a1, int *a2)
{
  if (!a1 || !a1[1]) {
    return 0;
  }
  if (CPSqliteStatementStep((uint64_t)a1) == 100)
  {
    uint64_t v4 = sqlite3_column_int(a1[1], 0);
    if (!a2) {
      return v4;
    }
    goto LABEL_8;
  }
  uint64_t v4 = 0;
  if (a2) {
LABEL_8:
  }
    *a2 = sqlite3_errcode(*((sqlite3 **)*a1 + 1));
  return v4;
}

sqlite3_int64 CPSqliteStatementInteger64Result(sqlite3_stmt **a1, int *a2)
{
  if (!a1 || !a1[1]) {
    return 0;
  }
  if (CPSqliteStatementStep((uint64_t)a1) == 100)
  {
    sqlite3_int64 v4 = sqlite3_column_int64(a1[1], 0);
    if (!a2) {
      return v4;
    }
    goto LABEL_8;
  }
  sqlite3_int64 v4 = 0;
  if (a2) {
LABEL_8:
  }
    *a2 = sqlite3_errcode(*((sqlite3 **)*a1 + 1));
  return v4;
}

uint64_t CPSqliteStatementSendResults(void *a1, unsigned int (*a2)(void *, uint64_t), uint64_t a3)
{
  if (!a1 || !a1[1] || !*a1 || !*(void *)(*a1 + 8)) {
    return 1;
  }
  while (1)
  {
    uint64_t v6 = CPSqliteStatementStep((uint64_t)a1);
    if (v6 != 100) {
      break;
    }
    if (a2(a1, a3))
    {
      uint64_t v7 = 100;
      goto LABEL_11;
    }
  }
  uint64_t v7 = v6;
  if ((v6 - 102) > 0xFFFFFFFD)
  {
    uint64_t v7 = 101;
  }
  else
  {
    BOOL v8 = sqlite3_errmsg(*(sqlite3 **)(*a1 + 8));
    syslog(4, "%s: %s\n", "CPSqliteStatementSendResults", v8);
  }
LABEL_11:
  CPSqliteStatementReset((uint64_t)a1);
  return v7;
}

void CPSqliteStatementApplyValuesFromRecord(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
}

void _sqliteStatementApplyValuesFromRecordWithNullValue(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5, int a6)
{
  if (a1)
  {
    CFAllocatorRef v10 = *(sqlite3_stmt **)(a1 + 8);
    sqlite3_column_count(v10);
    if (a3)
    {
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      unint64_t v11 = a3;
      uint64_t v12 = a2 + 8;
      unint64_t v13 = 1;
      do
      {
        int v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v12;
        if (*(void *)v12)
        {
          int v15 = *(_DWORD *)(v12 - 8);
          uint64_t v16 = *(void *)(v12 + 8);
          switch(*(_DWORD *)(v12 - 4))
          {
            case 0:
              uint64_t v17 = sqlite3_column_int(v10, *(_DWORD *)(v12 - 8));
              char v18 = v14(a4, v16, v17);
              goto LABEL_47;
            case 1:
              sqlite3_int64 v19 = sqlite3_column_int64(v10, *(_DWORD *)(v12 - 8));
              goto LABEL_21;
            case 2:
              uint64_t v20 = sqlite3_column_text(v10, *(_DWORD *)(v12 - 8));
              if (v20) {
                BOOL v21 = 0;
              }
              else {
                BOOL v21 = a6 == 0;
              }
              if (v21) {
                goto LABEL_54;
              }
              if (!v20) {
                goto LABEL_45;
              }
              CFNumberRef v22 = (const __CFNumber *)CFStringCreateWithCString(alloc, (const char *)v20, 0x8000100u);
              goto LABEL_28;
            case 3:
              uint64_t v23 = sqlite3_column_text(v10, *(_DWORD *)(v12 - 8));
              if (v23) {
                BOOL v24 = 0;
              }
              else {
                BOOL v24 = a6 == 0;
              }
              if (v24) {
                goto LABEL_54;
              }
              if (v23) {
                sqlite3_int64 v19 = (sqlite3_int64)v23;
              }
              else {
                sqlite3_int64 v19 = a5;
              }
LABEL_21:
              uint64_t v25 = a4;
              uint64_t v26 = v16;
              goto LABEL_46;
            case 4:
              unsigned int v27 = sqlite3_column_bytes(v10, *(_DWORD *)(v12 - 8));
              CFDictionaryValueCallBacks v28 = (const UInt8 *)sqlite3_column_blob(v10, v15);
              if (v28) {
                BOOL v29 = 0;
              }
              else {
                BOOL v29 = a6 == 0;
              }
              if (v29) {
                goto LABEL_54;
              }
              if (v28)
              {
                CFNumberRef v22 = CFDataCreate(alloc, v28, v27);
LABEL_28:
                CFNumberRef v30 = v22;
                uint64_t v31 = a4;
                uint64_t v32 = v16;
                CFNumberRef v33 = v30;
                goto LABEL_62;
              }
LABEL_45:
              uint64_t v25 = a4;
              uint64_t v26 = v16;
              sqlite3_int64 v19 = a5;
LABEL_46:
              char v18 = v14(v25, v26, v19);
LABEL_47:
              char v44 = v18;
              break;
            case 5:
              unsigned int v34 = sqlite3_column_bytes(v10, *(_DWORD *)(v12 - 8));
              v35 = sqlite3_column_blob(v10, v15);
              if (v35) {
                BOOL v36 = 0;
              }
              else {
                BOOL v36 = a6 == 0;
              }
              if (v36) {
                goto LABEL_54;
              }
              if (v35) {
                sqlite3_int64 v37 = (sqlite3_int64)v35;
              }
              else {
                sqlite3_int64 v37 = a5;
              }
              char v18 = ((uint64_t (*)(uint64_t, uint64_t, sqlite3_int64, void))v14)(a4, v16, v37, v34);
              goto LABEL_47;
            case 6:
              float v38 = sqlite3_column_double(v10, *(_DWORD *)(v12 - 8));
              char v18 = ((uint64_t (*)(uint64_t, uint64_t, float))v14)(a4, v16, v38);
              goto LABEL_47;
            case 7:
              int v39 = sqlite3_column_type(v10, *(_DWORD *)(v12 - 8));
              if (v39 == 5) {
                goto LABEL_44;
              }
              double valuePtr = 0.0;
              if (v39 == 2)
              {
                double valuePtr = sqlite3_column_double(v10, v15);
                CFAllocatorRef v40 = alloc;
                CFNumberType v41 = kCFNumberDoubleType;
              }
              else
              {
                double valuePtr = COERCE_DOUBLE(sqlite3_column_int64(v10, v15));
                CFAllocatorRef v40 = alloc;
                CFNumberType v41 = kCFNumberSInt64Type;
              }
              CFNumberRef v45 = CFNumberCreate(v40, v41, &valuePtr);
              goto LABEL_52;
            case 8:
              int v42 = sqlite3_column_type(v10, *(_DWORD *)(v12 - 8));
              if (v42 == 5)
              {
LABEL_44:
                CFNumberRef v30 = 0;
              }
              else
              {
                if (v42 == 2) {
                  double v43 = sqlite3_column_double(v10, v15);
                }
                else {
                  double v43 = (double)sqlite3_column_int64(v10, v15);
                }
                CFNumberRef v45 = CFDateCreate(0, v43);
LABEL_52:
                CFNumberRef v30 = v45;
                if (v45) {
                  goto LABEL_58;
                }
              }
              if (!a6) {
                goto LABEL_54;
              }
LABEL_58:
              if (v30) {
                CFNumberRef v33 = v30;
              }
              else {
                CFNumberRef v33 = (CFNumberRef)a5;
              }
              uint64_t v31 = a4;
              uint64_t v32 = v16;
LABEL_62:
              char v44 = v14(v31, v32, (uint64_t)v33);
              if (v30) {
                CFRelease(v30);
              }
              break;
            default:
              goto LABEL_54;
          }
        }
        else
        {
LABEL_54:
          char v44 = 1;
        }
        if (v13 >= v11) {
          break;
        }
        v12 += 24;
        ++v13;
      }
      while ((v44 & 1) != 0);
    }
  }
}

void CPSqliteStatementApplyValuesFromRecordWithNullValue(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5)
{
}

uint64_t CPSqliteStatementProcessPhoneQuery(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t (*a4)(uint64_t, void, void *, uint64_t, uint64_t), uint64_t a5)
{
  useconds_t v9 = CPPhoneNumberCopyHomeCountryCode();
  MutableCFStringRef Copy = 0;
  if (a1)
  {
    if (a2)
    {
      MutableCFStringRef Copy = 0;
      if (a4)
      {
        if (*(void *)(a1 + 8))
        {
          CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          if (a3)
          {
            CFIndex Length = CFStringGetLength(a3);
            MutableCFStringRef Copy = CFStringCreateMutableCopy(v11, Length, a3);
            CFStringLowercase(MutableCopy, 0);
          }
          else
          {
            MutableCFStringRef Copy = 0;
          }
          unint64_t v13 = (void *)PNCopyBestGuessNormalizedNumberForCountry();
          decomposePhoneNumber((uint64_t)v13, MutableCopy);
          if (CPSqliteStatementStep(a1) == 100)
          {
            CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
            do
            {
              int v15 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
              if (v15)
              {
                uint64_t v16 = v15;
                size_t v17 = strlen((const char *)v15);
                CFStringRef v18 = CFStringCreateWithBytesNoCopy(v11, v16, v17, 0x8000100u, 0, v14);
                sqlite3_int64 v19 = (void *)PNCopyBestGuessNormalizedNumberForCountry();
                decomposePhoneNumber((uint64_t)v19, v9);
                if (decomposedPhoneNumbersEqual())
                {
                  int v20 = a4(a1, 0, v19, 1, a5);
                  CFRelease(v18);
                  free(v19);
                  if (v20) {
                    break;
                  }
                }
                else
                {
                  CFRelease(v18);
                  free(v19);
                }
              }
            }
            while (CPSqliteStatementStep(a1) == 100);
          }
          if (v13) {
            free(v13);
          }
        }
      }
    }
  }
  if (v9) {
    CFRelease(v9);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return 0;
}

void CPSqlitePhoneNumberContainsAlphaCharacters(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 != 1)
  {
    sqlite3_result_error(a1, "CPSqlitePhoneNumberContainsAlphaCharacters: wrong number of arguments", -1);
    return;
  }
  sqlite3_int64 v4 = sqlite3_value_text(*a3);
  if (!v4 || (int v5 = v4, (v6 = strlen((const char *)v4)) == 0))
  {
LABEL_10:
    int v11 = 0;
    goto LABEL_15;
  }
  size_t v7 = v6;
  uint64_t v8 = MEMORY[0x1E4F14390];
  while (1)
  {
    int v9 = *(char *)v5++;
    uint64_t v10 = v9;
    if (v9 < 0) {
      break;
    }
    if ((*(_DWORD *)(v8 + 4 * v10 + 60) & 0x100) != 0) {
      goto LABEL_14;
    }
LABEL_9:
    if (!--v7) {
      goto LABEL_10;
    }
  }
  if (!__maskrune(v10, 0x100uLL)) {
    goto LABEL_9;
  }
LABEL_14:
  int v11 = 1;
LABEL_15:
  sqlite3_result_int(a1, v11);
}

size_t CPSqliteCompareSortKeyPrefixes(char *__s, char *a2, int a3)
{
  size_t result = 0;
  if (__s)
  {
    if (a2)
    {
      size_t result = strlen(__s);
      if (result)
      {
        size_t v7 = result;
        uint64_t v8 = strchr(__s, 1);
        int v9 = strchr(__s, 2);
        size_t v10 = strlen(a2);
        int v11 = strchr(a2, 2);
        if (!v8) {
          uint64_t v8 = &__s[v7];
        }
        if (!v9) {
          int v9 = v8;
        }
        while (1)
        {
          size_t v12 = v9 - __s;
          if (v11 && v12 < v10)
          {
            unint64_t v13 = v9;
            CFAllocatorRef v14 = v11;
            do
            {
              if (v12 != v14 - a2 || v13 == v8) {
                break;
              }
              uint64_t v16 = strchr(v13 + 1, 2);
              BOOL v17 = v8 < v16 || v16 == 0;
              unint64_t v13 = v17 ? v8 : v16;
              size_t v12 = v13 - __s;
              if (!*v14) {
                break;
              }
              CFStringRef v18 = strchr(v14 + 1, 2);
              if (!v18) {
                break;
              }
              CFAllocatorRef v14 = v18;
            }
            while (v12 < v10);
          }
          if ((a3 & 1) == 0 && v10 <= v12 && !strncmp(a2, __s, v10) || a3 && v10 == v12 && !strncmp(a2, __s, v10)) {
            break;
          }
          if (*v9)
          {
            __s = v9 + 1;
            sqlite3_int64 v19 = strchr(v9 + 1, 2);
            BOOL v20 = v8 < v19 || v19 == 0;
            int v9 = v20 ? v8 : v19;
            if (__s <= v8) {
              continue;
            }
          }
          return 0;
        }
        return 1;
      }
    }
  }
  return result;
}

void CPSqliteHasSortKeyPrefix(sqlite3_context *a1, int a2, uint64_t a3)
{
  if (a2 == 3)
  {
    sqlite3_int64 v4 = *(char **)(a3 + 8);
    int v5 = *(sqlite3_value **)(a3 + 16);
    if (*(void *)a3)
    {
      size_t v6 = (char *)sqlite3_value_blob(*(sqlite3_value **)a3);
      if (!v4)
      {
LABEL_5:
        if (v5) {
          BOOL v7 = sqlite3_value_int(v5) != 0;
        }
        else {
          BOOL v7 = 0;
        }
        int v8 = CPSqliteCompareSortKeyPrefixes(v6, v4, v7);
        sqlite3_result_int(a1, v8);
        return;
      }
    }
    else
    {
      size_t v6 = 0;
      if (!v4) {
        goto LABEL_5;
      }
    }
    sqlite3_int64 v4 = (char *)sqlite3_value_blob((sqlite3_value *)v4);
    goto LABEL_5;
  }
  sqlite3_result_error(a1, "CPSqliteHasSortKeyPrefix: wrong number of arguments", -1);
}

uint64_t CPSqliteUtilitiesGetSchemaVersionAtPath(const __CFString *a1)
{
  return _CPSqliteUtilitiesGetIntegerResultAtPathWithKey(a1, "SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;",
           "_ClientVersion");
}

uint64_t _CPSqliteUtilitiesGetIntegerResultAtPathWithKey(const __CFString *a1, const char *a2, const char *a3)
{
  int v5 = _CPCreateUTF8StringFromCFString(a1);
  ppDb = 0;
  int v6 = sqlite3_open_v2((const char *)v5, &ppDb, 1, 0);
  BOOL v7 = ppDb;
  if (ppDb)
  {
    if (v6)
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else
    {
      pStmt = 0;
      int v9 = strlen(a2);
      int v10 = sqlite3_prepare_v2(ppDb, a2, v9, &pStmt, 0);
      int v11 = pStmt;
      if (pStmt)
      {
        if (v10)
        {
          uint64_t v8 = 0xFFFFFFFFLL;
        }
        else
        {
          if (a3)
          {
            int v12 = strlen(a3);
            sqlite3_bind_text(pStmt, 1, a3, v12, 0);
            int v11 = pStmt;
          }
          if (sqlite3_step(v11) == 100) {
            uint64_t v8 = sqlite3_column_int(pStmt, 0);
          }
          else {
            uint64_t v8 = 0xFFFFFFFFLL;
          }
          sqlite3_reset(pStmt);
          int v11 = pStmt;
        }
        sqlite3_finalize(v11);
      }
      else
      {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      BOOL v7 = ppDb;
    }
    sqlite3_close(v7);
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  free(v5);
  return v8;
}

uint64_t CPSqliteUtilitiesGetIntegerQueryResultAtPath(const char *a1, const __CFString *a2)
{
  return _CPSqliteUtilitiesGetIntegerResultAtPathWithKey(a2, a1, a1);
}

uint64_t CPSqliteSetDefaultPageCacheSize(uint64_t result)
{
  if ((int)result >= 10) {
    __defaultPageCacheSize = result;
  }
  return result;
}

uint64_t CPSqliteSetDefaultSharedCacheModeEnabledState(uint64_t result)
{
  __defaultSharedCacheModeEnabledState = result;
  return result;
}

uint64_t CPSqliteDatabaseIsCorrupted(sqlite3 *db)
{
  uint64_t v1 = (uint64_t)db;
  if (!db) {
    return v1;
  }
  ppStmt = 0;
  int v2 = sqlite3_prepare_v2(db, "PRAGMA integrity_check;", -1, &ppStmt, 0);
  if ((v2 - 5) <= 1) {
    goto LABEL_3;
  }
  if (!v2)
  {
    int v2 = sqlite3_step(ppStmt);
    if ((v2 - 5) <= 1)
    {
LABEL_3:
      syslog(4, "Got SQLite error %i when running integrity check on db handle at %p.  Not flagging as corrupt.\n", v2, (const void *)v1);
      uint64_t v1 = 0;
      goto LABEL_6;
    }
    if (v2 == 100)
    {
      sqlite3_int64 v4 = sqlite3_column_text(ppStmt, 0);
      int v5 = sqlite3_column_bytes(ppStmt, 0);
      uint64_t v1 = 1;
      if (v4 && v5 >= 1) {
        uint64_t v1 = strncmp((const char *)v4, "ok", 3uLL) != 0;
      }
      goto LABEL_6;
    }
  }
  uint64_t v1 = 1;
LABEL_6:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v1;
}

BOOL CPSqliteDatabaseDelete(sqlite3 *a1)
{
  return truncateDatabaseWithSettings(a1, 0, 0, 0);
}

BOOL truncateDatabaseWithSettings(sqlite3 *a1, int a2, int a3, int a4)
{
  if (!a1) {
    return 0;
  }
  int v8 = a2;
  if (a3 == 1)
  {
    a2 |= 8u;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    a2 |= 0xCu;
LABEL_7:
    int v8 = a2;
  }
  if (a4) {
    int v8 = a2 | 0x80;
  }
  int v6 = sqlite3_file_control(a1, 0, 101, &v8);
  BOOL v5 = v6 == 0;
  if (v6) {
    syslog(4, "Failed to delete db handle %p!  SQLite error %i.\n", a1, v6);
  }
  return v5;
}

BOOL CPSqliteDatabaseDeleteUsingJournalModeWAL(sqlite3 *a1, int a2)
{
  return truncateDatabaseWithSettings(a1, a2, 0, 0);
}

uint64_t truncateDatabase(uint64_t a1)
{
  uint64_t v1 = a1;
  ppDb = 0;
  if (!a1) {
    return v1;
  }
  if ((*(_WORD *)(a1 + 116) & 0x1000) != 0) {
    uint64_t v2 = CPStartAnInhibitor();
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(v1 + 8);
  if (v3)
  {
    sqlite3_int64 v4 = *(sqlite3 **)(v3 + 8);
    if (v4)
    {
      int v5 = 0;
      ppDb = *(sqlite3 **)(v3 + 8);
      goto LABEL_15;
    }
  }
  if (*(void *)v1)
  {
    int v6 = _CPCreateUTF8StringFromCFString(*(const __CFString **)v1);
    if (v6)
    {
      BOOL v7 = v6;
      unsigned int v8 = *(_DWORD *)(v1 + 260);
      int v9 = v8 >= 4 ? 2 : 4194306 - (v8 << 20);
      sqlite3_open_v2((const char *)v6, &ppDb, v9, 0);
      free(v7);
      sqlite3_int64 v4 = ppDb;
      if (ppDb)
      {
        int v5 = 1;
LABEL_15:
        uint64_t v1 = truncateDatabaseWithSettings(v4, (*(unsigned __int16 *)(v1 + 116) >> 10) & 1, *(_DWORD *)(v1 + 256), 1);
        if (v5) {
          sqlite3_close(ppDb);
        }
        goto LABEL_18;
      }
    }
  }
  int v10 = _CPCreateUTF8StringFromCFString(*(const __CFString **)v1);
  syslog(4, "Could not get handle to truncate database %s!\n", (const char *)v10);
  free(v10);
  uint64_t v1 = 0;
LABEL_18:
  if (v2) {
    CPStopInhibitorWithIdentifier(v2);
  }
  return v1;
}

uint64_t CPSqliteDatabaseGetAutoVacuumLevel(sqlite3 *a1)
{
  if (!a1) {
    return 0;
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "PRAGMA auto_vacuum;", -1, &ppStmt, 0) || sqlite3_step(ppStmt) != 100) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = sqlite3_column_int(ppStmt, 0);
  }
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v1;
}

uint64_t _connectAndCheckVersion(uint64_t a1, const char *a2, unsigned char *a3, int a4, int a5, _DWORD *a6)
{
  *(void *)CFNumberRef v45 = 0;
  int v44 = 0;
  int v12 = *(uint64_t (**)(uint64_t))(a1 + 40);
  if (v12 && (v12(a1) & 1) == 0)
  {
    int v44 = 3;
    goto LABEL_10;
  }
  unint64_t v13 = _createConnection(a1, a2, a4, a5, &v44);
  *(void *)CFNumberRef v45 = v13;
  if (!v13 || (*(_WORD *)(a1 + 116) & 4) != 0) {
    goto LABEL_10;
  }
  uint64_t v14 = (uint64_t)v13;
  char v43 = 0;
  int v15 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v13, @"SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;",
          1);
  int v16 = *(unsigned __int16 *)(a1 + 116) & (a4 ^ 1);
  BOOL v17 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 208);
  if (!v15)
  {
    if (!v17)
    {
      checkConnectionStatus((uint64_t *)v45, &v43);
      int v22 = 0;
      uint64_t v14 = *(void *)v45;
      if (*(void *)v45) {
        BOOL v23 = v43 == 0;
      }
      else {
        BOOL v23 = 0;
      }
      int v18 = v23;
      int v20 = -1;
      if (v43) {
        goto LABEL_42;
      }
      goto LABEL_54;
    }
    int v21 = v17(a1, v14);
    switch(v21)
    {
      case 2:
        CPSqliteConnectionClose(v14);
        uint64_t v14 = 0;
        int v18 = 0;
        goto LABEL_36;
      case 1:
        BOOL v24 = 0;
        int v22 = 0;
        int v18 = 0;
        char v43 = 1;
        int v20 = -1;
LABEL_43:
        if (v24 || (a4 & 1) != 0) {
          goto LABEL_50;
        }
        syslog(4, "%s may be out of date (version %d, expected %d), we will create a new database.\n", a2, v20, *(_DWORD *)(a1 + 112));
        if (truncateDatabase(a1))
        {
          uint64_t v25 = *(void (**)(uint64_t, uint64_t))(a1 + 80);
          if (v25)
          {
            int v18 = 1;
            v25(a1, 1);
LABEL_50:
            if (v14) {
              CPSqliteConnectionClose(v14);
            }
            uint64_t v26 = _createConnection(a1, a2, a4, a5, &v44);
            *(void *)CFNumberRef v45 = v26;
            if (!v26) {
              goto LABEL_10;
            }
            uint64_t v14 = (uint64_t)v26;
            CPSqliteConnectionBeginTransactionType((uint64_t)v26, 0);
            goto LABEL_54;
          }
        }
        else
        {
          syslog(4, "Failed to delete database at %s!\n", a2);
        }
        int v18 = 1;
        goto LABEL_50;
      case 0:
        int v22 = 0;
        int v18 = 1;
LABEL_37:
        int v20 = -1;
        goto LABEL_41;
    }
LABEL_26:
    int v18 = 0;
    int v22 = 0;
    goto LABEL_37;
  }
  if (v17 && v17(a1, v14) == 2)
  {
    CPSqliteConnectionClose(v14);
    uint64_t v14 = 0;
    int v18 = 0;
    int v16 = 0;
LABEL_36:
    int v22 = 0;
    *(void *)CFNumberRef v45 = 0;
    goto LABEL_37;
  }
  if (!v16) {
    goto LABEL_26;
  }
  int v20 = CPSqliteConnectionIntegerForPropertyWithDefaultValue((CFMutableDictionaryRef *)v14, @"_ClientVersion", 0);
  checkConnectionStatus((uint64_t *)v45, &v43);
  uint64_t v14 = *(void *)v45;
  if (!*(void *)v45 || v20 == *(_DWORD *)(a1 + 112)) {
    goto LABEL_40;
  }
  _beginImmediateTransaction(*(uint64_t *)v45);
  checkConnectionStatus((uint64_t *)v45, &v43);
  if (!*(void *)v45)
  {
    uint64_t v14 = 0;
LABEL_40:
    int v18 = 0;
    int v22 = 0;
    int v16 = 1;
    goto LABEL_41;
  }
  int v16 = 1;
  uint64_t v42 = _integerForProperty(*(CFMutableDictionaryRef **)v45, @"_ClientVersion", &v44, 0, 1);
  checkConnectionStatus((uint64_t *)v45, &v43);
  uint64_t v14 = *(void *)v45;
  if (!*(void *)v45) {
    goto LABEL_92;
  }
  if (v44 == 17)
  {
    CPSqliteConnectionClose(*(uint64_t *)v45);
    *(void *)CFNumberRef v45 = 0;
    uint64_t v14 = 0;
    if (a3)
    {
      int v18 = 0;
      *a3 = 1;
LABEL_93:
      int v22 = 1;
LABEL_94:
      int v20 = v42;
      goto LABEL_41;
    }
LABEL_92:
    int v18 = 0;
    goto LABEL_93;
  }
  int v20 = v42;
  if (*(_DWORD *)(a1 + 112) == v42)
  {
    int v18 = 0;
    BOOL v24 = v43 == 0;
    int v22 = 1;
    goto LABEL_43;
  }
  if (!*(unsigned char *)(a1 + 88))
  {
    BOOL v36 = *(unsigned int (**)(uint64_t, void, uint64_t, void))(a1 + 56);
    if (!v36 || !*(void *)(a1 + 64))
    {
      BOOL v24 = 0;
      int v18 = 0;
      int v22 = 1;
      char v43 = 1;
      goto LABEL_43;
    }
    if (v36(a1, *(void *)v45, v42, *(void *)(a1 + 104)))
    {
      int v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 64))(a1, v14, v42, *(void *)(a1 + 104));
      if (v37 == 2)
      {
        CPSqliteConnectionClose(v14);
        uint64_t v14 = 0;
        int v18 = 0;
        *(void *)CFNumberRef v45 = 0;
        goto LABEL_93;
      }
      if (v37 != 1)
      {
        if (!v37) {
          CPSqliteConnectionSetIntegerForProperty((CFMutableDictionaryRef *)v14, @"_ClientVersion", *(_DWORD *)(a1 + 112));
        }
        goto LABEL_92;
      }
    }
    BOOL v24 = 0;
    int v18 = 0;
    int v22 = 1;
LABEL_103:
    char v43 = 1;
    int v20 = v42;
    goto LABEL_43;
  }
  CPSqliteConnectionClose(*(uint64_t *)v45);
  *(void *)CFNumberRef v45 = 0;
  int v22 = 1;
  CFNumberRef v33 = dlopen("/System/Library/PrivateFrameworks/DataMigration.framework/DataMigration", 1);
  if (!v33)
  {
LABEL_102:
    uint64_t v14 = 0;
    BOOL v24 = 0;
    int v18 = 0;
    goto LABEL_103;
  }
  unsigned int v34 = v33;
  if (*(void *)(a1 + 96))
  {
    v35 = (void (*)(void))dlsym(v33, "DMPerformMigrationReturningAfterPlugin");
    if (v35)
    {
      v35(*(void *)(a1 + 96));
      goto LABEL_98;
    }
    goto LABEL_101;
  }
  float v38 = (void (*)(void))dlsym(v33, "DMPerformMigration");
  if (!v38)
  {
LABEL_101:
    dlclose(v34);
    goto LABEL_102;
  }
  int v39 = v38;
  CFStringRef v40 = CFStringCreateWithFormat(0, 0, @"Database version conflict detected: %s", a2);
  v39();
  CFRelease(v40);
LABEL_98:
  dlclose(v34);
  CFNumberType v41 = _createConnection(a1, a2, a4, 0, &v44);
  uint64_t v14 = (uint64_t)v41;
  *(void *)CFNumberRef v45 = v41;
  if (!v41)
  {
    int v18 = 0;
    int v16 = 1;
    goto LABEL_94;
  }
  CPSqliteConnectionBeginTransactionType((uint64_t)v41, 0);
  int v20 = CPSqliteConnectionIntegerForPropertyWithDefaultValue((CFMutableDictionaryRef *)v14, @"_ClientVersion", 0);
  int v16 = 1;
  if (v20 != *(_DWORD *)(a1 + 112))
  {
    BOOL v24 = 0;
    int v18 = 0;
    char v43 = 1;
    goto LABEL_43;
  }
  int v18 = 0;
LABEL_41:
  if (v43)
  {
LABEL_42:
    BOOL v24 = 0;
    goto LABEL_43;
  }
LABEL_54:
  if ((v18 & 1) == 0 && v14)
  {
    if ((a4 & 1) == 0)
    {
      CFStringRef v27 = CPSqliteConnectionCopyValueForProperty((CFMutableDictionaryRef *)v14, @"_UniqueIdentifier");
      if (v27) {
        CFRelease(v27);
      }
      else {
        _addUniqueIdentifierToDatabase(v14, 1);
      }
    }
    if (v22)
    {
      _performSqlUsingConnection((CFMutableDictionaryRef *)v14, @"COMMIT;");
      *(_DWORD *)(v14 + 64) = 0xFFFF;
    }
  }
  if (v14 && ((v18 ^ 1) & 1) == 0 && (a4 & 1) == 0)
  {
    _beginImmediateTransaction(v14);
    if (!v16
      || (int v28 = _integerForProperty((CFMutableDictionaryRef *)v14, @"_ClientVersion", &v44, 0, 1), v44)
      || *(_DWORD *)(a1 + 112) != v28)
    {
      unsigned int v29 = sqlite3_exec(*(sqlite3 **)(v14 + 8), "pragma legacy_file_format = 0;", 0, 0, 0);
      checkResultWithStatement((void *)a1, 0, *(sqlite3 **)(v14 + 8), v29, (uint64_t)"CPSqliteDatabaseSetNewFileFormatPragma", 0);
      CFNumberRef v30 = *(void (**)(uint64_t, uint64_t))(a1 + 24);
      if (v30) {
        v30(a1, v14);
      }
      unsigned int v31 = sqlite3_exec(*(sqlite3 **)(v14 + 8), "CREATE TABLE IF NOT EXISTS _SqliteDatabaseProperties (key TEXT, value TEXT, UNIQUE(key));",
              0,
              0,
              0);
      checkResultWithStatement((void *)a1, 0, *(sqlite3 **)(v14 + 8), v31, (uint64_t)"_connectAndCheckVersion", 0);
      if (v31)
      {
        *(void *)(a1 + 8) = 0;
        goto LABEL_10;
      }
      uint64_t v32 = *(void (**)(uint64_t, uint64_t, void))(a1 + 16);
      if (v32) {
        v32(a1, v14, *(void *)(a1 + 48));
      }
      if (*(_WORD *)(a1 + 116)) {
        CPSqliteConnectionSetIntegerForProperty((CFMutableDictionaryRef *)v14, @"_ClientVersion", *(_DWORD *)(a1 + 112));
      }
      _addUniqueIdentifierToDatabase(v14, 0);
    }
    _performSqlUsingConnection((CFMutableDictionaryRef *)v14, @"COMMIT;");
    *(_DWORD *)(v14 + 64) = 0xFFFF;
  }
LABEL_10:
  if (a6) {
    *a6 = v44;
  }
  return *(void *)v45;
}

sqlite3 **_createConnection(uint64_t a1, const char *a2, int a3, int a4, int *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v10 = (sqlite3 **)malloc_type_calloc(1uLL, 0x48uLL, 0x10A004006D1BBC6uLL);
  if ((a3 & 1) == 0)
  {
    if (strcmp(a2, ":memory:"))
    {
      if (access(a2, 6) == -1 && *__error() != 2)
      {
        memset(&v40, 0, sizeof(v40));
        if (!stat(a2, &v40))
        {
          uid_t st_uid = v40.st_uid;
          if (st_uid == geteuid())
          {
            syslog(3, "fixing permissions on %s", a2);
            if (chmod(a2, 0x180u) < 0)
            {
              int v12 = __error();
              unint64_t v13 = strerror(*v12);
              syslog(3, "error %s setting permissions on %s", v13, a2);
            }
          }
        }
      }
    }
  }
  CFStringRef v14 = *(const __CFString **)(a1 + 248);
  if (v14) {
    int v15 = _CPCreateUTF8StringFromCFString(v14);
  }
  else {
    int v15 = 0;
  }
  if (__defaultSharedCacheModeEnabledState) {
    BOOL v16 = (a4 & 0x40000) == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16) {
    int v17 = a4 | 0x20000;
  }
  else {
    int v17 = a4;
  }
  unsigned int v18 = *(_DWORD *)(a1 + 260);
  if (v18 >= 4) {
    int v19 = 0;
  }
  else {
    int v19 = 0x400000 - (v18 << 20);
  }
  if ((*(_WORD *)(a1 + 116) & 0x1000) != 0) {
    uint64_t v20 = CPStartAnInhibitor();
  }
  else {
    uint64_t v20 = 0;
  }
  int v21 = v10 + 1;
  if (a3) {
    int v22 = 1;
  }
  else {
    int v22 = 2;
  }
  int v23 = v17 | v22 | v19;
  uint64_t v24 = sqlite3_open_v2(a2, v10 + 1, v23, (const char *)v15);
  uint64_t v25 = v24;
  if (!v24)
  {
    int v28 = 0;
    if (!v15) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  uint64_t v26 = sqlite3_errstr(v24);
  syslog(3, "Error opening database: %s", v26);
  CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"com.apple.AppSupport._createConnectionForWriting.sqlite3_open_v2.error.%d", v25);
  CPAggregateDictionaryAddValueForScalarKey((uint64_t)v27, 1);
  CFRelease(v27);
  if (*v21) {
    sqlite3_close(*v21);
  }
  int v28 = sqlite3_open_v2(a2, v10 + 1, v23 | 4, (const char *)v15);
  if (v15) {
LABEL_31:
  }
    free(v15);
LABEL_32:
  unsigned int v29 = *v21;
  if (!*v21 || v28)
  {
    if (v29) {
      sqlite3_close(v29);
    }
    free(v10);
    int v10 = 0;
  }
  else
  {
    *int v10 = (sqlite3 *)a1;
    *((_DWORD *)v10 + 16) = 0xFFFF;
    if ((*(_WORD *)(a1 + 116) & 0x800) != 0) {
      int v30 = 30000;
    }
    else {
      int v30 = 0x7FFFFFFF;
    }
    if (sqlite3_busy_timeout(v29, v30)) {
      syslog(3, "Failed to set busy timout");
    }
    if (*(void *)(a1 + 216))
    {
      unsigned int v31 = *(sqlite3 ***)(a1 + 224);
      uint64_t v32 = *(int (__cdecl **)(void *, int))(a1 + 216);
    }
    else
    {
      uint64_t v32 = (int (__cdecl *)(void *, int))defaultBusyHandler;
      unsigned int v31 = v10;
    }
    if (sqlite3_busy_handler(v10[1], v32, v31)) {
      syslog(3, "Failed to set busy handler");
    }
    sqlite3_commit_hook(*v21, (int (__cdecl *)(void *))commitHook, (void *)a1);
    sqlite3_update_hook(*v21, (void (__cdecl *)(void *, int, const char *, const char *, sqlite3_int64))updateHook, (void *)a1);
    CPSqliteSetupLoggingForDatabaseHandle(*v21);
    if (__defaultPageCacheSize >= 10)
    {
      snprintf((char *)&v40, 0x80uLL, "PRAGMA cache_size=%d;", __defaultPageCacheSize);
      sqlite3_exec(*v21, (const char *)&v40, 0, 0, 0);
    }
    CFNumberRef v33 = *(void (**)(uint64_t, sqlite3 **))(a1 + 32);
    if (v33) {
      v33(a1, v10);
    }
    if (v25)
    {
      if (*(_DWORD *)(a1 + 256))
      {
        snprintf((char *)&v40, 0x80uLL, "PRAGMA auto_vacuum=%d;", *(_DWORD *)(a1 + 256));
        sqlite3_exec(*v21, (const char *)&v40, 0, 0, 0);
      }
LABEL_56:
      if ((*(_WORD *)(a1 + 116) & 0x400) != 0) {
        sqlite3_exec(*v21, "PRAGMA journal_mode = WAL;", 0, 0, 0);
      }
      goto LABEL_63;
    }
    unsigned int v34 = CPSqliteConnectionStatementForSQLAndIgnoreErrors(v10, @"PRAGMA journal_mode;", 0);
    if (!v34) {
      goto LABEL_63;
    }
    uint64_t v35 = (uint64_t)v34;
    CFStringRef v36 = CPSqliteStatementCopyStringResult((uint64_t)v34);
    if (!v36)
    {
      CPSqliteStatementReset(v35);
      goto LABEL_63;
    }
    CFStringRef v37 = v36;
    CFComparisonResult v38 = CFStringCompare(v36, @"wal", 1uLL);
    CFRelease(v37);
    CPSqliteStatementReset(v35);
    if (v38) {
      goto LABEL_56;
    }
  }
LABEL_63:
  if (v20) {
    CPStopInhibitorWithIdentifier(v20);
  }
  if (a5) {
    *a5 = v28;
  }
  return v10;
}

void checkConnectionStatus(uint64_t *a1, unsigned char *a2)
{
  int v4 = sqlite3_errcode(*(sqlite3 **)(*a1 + 8));
  if (v4)
  {
    int v5 = v4;
    if ((v4 - 5) > 1)
    {
      if (v4 != 1)
      {
        if (v4 == 11)
        {
          CPSqliteConnectionClose(*a1);
          *a1 = 0;
          *a2 = 1;
        }
        else
        {
          int v6 = sqlite3_errmsg(*(sqlite3 **)(*a1 + 8));
          syslog(3, "encountered sqlite error %d: %s", v5, v6);
        }
      }
    }
    else
    {
      CPSqliteConnectionClose(*a1);
      *a1 = 0;
    }
  }
}

uint64_t _beginImmediateTransaction(uint64_t a1)
{
  int v2 = 5;
  do
  {
    CPSqliteConnectionBeginTransactionType(a1, 1u);
    uint64_t result = sqlite3_errcode(*(sqlite3 **)(a1 + 8));
    if ((result - 7) < 0xFFFFFFFE) {
      break;
    }
    uint64_t result = usleep(0x3E8u);
    --v2;
  }
  while (v2);
  return result;
}

void _addUniqueIdentifierToDatabase(uint64_t a1, int a2)
{
  if (a1)
  {
    if (a2) {
      CPSqliteConnectionBeginTransactionType(a1, 0);
    }
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    int v6 = (UInt8 *)CFUUIDCreateString(v4, v5);
    CPSqliteConnectionSetValueForProperty((CFMutableDictionaryRef *)a1, @"_UniqueIdentifier", v6);
    if (v6) {
      CFRelease(v6);
    }
    CFRelease(v5);
    if (a2)
    {
      _performSqlUsingConnection((CFMutableDictionaryRef *)a1, @"COMMIT;");
      *(_DWORD *)(a1 + 64) = 0xFFFF;
    }
  }
}

uint64_t defaultBusyHandler(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  if ((*(_WORD *)(v4 + 116) & 0x10) != 0) {
    CPSqliteDatabaseRequestUnlock(v4);
  }
  if (a1[1])
  {
    busy = (uint64_t (*)(uint64_t, uint64_t))_sqlite3_system_busy_handler();
    uint64_t v6 = a1[1];
    return busy(v6, a2);
  }
  else
  {
    syslog(3, "Failed to call _sqlite3_system_busy_handler, count %i", a2);
    return 0;
  }
}

uint64_t commitHook(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 192);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t updateHook(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 200);
  if (v1) {
    return v1();
  }
  return result;
}

BOOL _debugLoggingEnabled()
{
  int v0 = __debugLoggingForced;
  if (__debugLoggingForced == -1)
  {
    int v0 = getenv("CPSQLDEBUG") != 0;
    __debugLoggingForced = v0;
  }
  return (v0 | __debugLoggingEnabled) != 0;
}

uint64_t __updateNotifyRegistration_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 232) == a2)
  {
    *(_WORD *)(v2 + 116) |= 0x200u;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = *(void *)(v2 + 240);
  if (result)
  {
    if ((*(_WORD *)(v2 + 116) & 0x200) != 0) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void *CPSqliteStatementForSQLUncachedAndIgnoreErrors(uint64_t *a1, const __CFString *a2, int a3)
{
  CFUUIDRef v5 = (char *)_CPCreateUTF8StringFromCFString(a2);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  BOOL v7 = CPSqlitePreparedStatement(a1, v5, a3);
  if (v7)
  {
    unsigned int v8 = v7;
    int v9 = malloc_type_malloc(0x20uLL, 0x10200402C28E7A6uLL);
    int v10 = v9;
    if (v9)
    {
      void *v9 = a1;
      v9[1] = v8;
      *((double *)v9 + 2) = CPMachAbsoluteTime();
    }
    else
    {
      sqlite3_finalize(v8);
    }
  }
  else
  {
    int v10 = 0;
  }
  free(v6);
  return v10;
}

void handleSqliteCorruptError(void *a1, int a2, sqlite3 *a3, uint64_t a4)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got SQLITE_CORRUPT error.  Will try to delete database, but only if the pragma integrity_check fails.", buf, 2u);
  }
  syslog(4, "Got SQLITE_CORRUPT for db %p.  Will try to delete database, but only if the pragma integrity_check fails.\n", a1);
  runIntegrityCheckAndAbort(a1, a2, a3, a4);
}

void handleSqliteNotADBError(void *a1, int a2, sqlite3 *a3, uint64_t a4)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got SQLITE_NOTADB error.  Will try to delete database, but only if the pragma integrity_check fails.", buf, 2u);
  }
  syslog(4, "Got SQLITE_NOTADB for db %p.  Will try to delete database, but only if the pragma integrity_check fails.\n", a1);
  runIntegrityCheckAndAbort(a1, a2, a3, a4);
}

uint64_t handleSqliteIOError(const void *a1, char a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = a5;
    _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got SQLITE_IOERR with extended error code %i.  Will try to delete database, but only if the pragma integrity_check fails.\n", buf, 8u);
  }
  syslog(4, "Got SQLITE_IOERR with extended error code %i for db %p.  Will try to delete database, but only if the pragma integrity_check fails.\n", a5, a1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 0x40000000;
  v11[2] = __handleSqliteIOError_block_invoke;
  v11[3] = &__block_descriptor_tmp_163;
  char v12 = a2;
  v11[4] = a1;
  v11[5] = a3;
  v11[6] = a4;
  return runWithExtendedSQLiteErrorCode_SQLITE_IOERR_BLOCKED((uint64_t)v11);
}

void sqlite3PrintErrorWithStatement(sqlite3 *a1, uint64_t a2, sqlite3_stmt *a3)
{
  if (a3)
  {
    sqlite3_sql(a3);
    syslog(4, "%s: %s for %s\n");
  }
  else
  {
    syslog(4, "%s: %s\n");
  }
}

void runIntegrityCheckAndAbort(void *a1, int a2, sqlite3 *a3, uint64_t a4)
{
  int v19 = a3;
  if (a4) {
    sqlite3PrintErrorWithStatement(a3, (uint64_t)"runIntegrityCheckAndAbort", *(sqlite3_stmt **)(a4 + 8));
  }
  if (a1 && (*((_WORD *)a1 + 58) & 0x1000) != 0) {
    uint64_t v7 = CPStartAnInhibitor();
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = sqlite3_close(a3);
  if (v8) {
    syslog(4, "Failed to close db handle %p, with SQLite error %i.\n", a1, v8);
  }
  if (!a1 || !*a1 || (int v9 = _CPCreateUTF8StringFromCFString((const __CFString *)*a1)) == 0) {
    abortAfterFailingToGetPath(a1);
  }
  int v10 = (const char *)v9;
  if (integrityCheckDatabase((const char *)v9, &v19, (uint64_t)a1, a2)
    || (sqlite3_close(v19),
        uint64_t v11 = random() % 5000000,
        syslog(4, "Failed first integrity check, waiting %i useconds.", v11),
        usleep(v11),
        integrityCheckDatabase(v10, &v19, (uint64_t)a1, a2)))
  {
    char v12 = 0;
  }
  else
  {
    if (a2)
    {
      syslog(4, "Failed second integrity check, but leaving read-only database in place.");
    }
    else
    {
      syslog(4, "Failed second integrity check, deleting the database files.");
      unint64_t v13 = v19;
      if (CPIsInternalDevice()
        || CFPreferencesGetAppBooleanValue(@"CopyCorruptDatabases", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0))
      {
        int v14 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xA585852uLL);
        uint64_t v15 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xDC4422AFuLL);
        uint64_t v16 = 0;
        ppDb = 0;
        if ((*((_WORD *)a1 + 58) & 0x1000) != 0) {
          uint64_t v16 = CPStartAnInhibitor();
        }
        CPBasename(v10, v14, 1024);
        CPTemporaryPath(v14, v15, 0x400uLL);
        int v17 = sqlite3_open(v15, &ppDb);
        if (v17)
        {
          syslog(2, "%s: Unable to sqlite3_open corruptCopyPath %s with sql result code %d", "void deleteCorruptDatabase(char *, sqlite3 *, CPSqliteDatabase *)", v15, v17);
        }
        else
        {
          if (sqlite3_file_control(ppDb, 0, 102, v13)) {
            syslog(2, "Tried to copy possible corrupt database at path %s, but we failed with SQLite error %i.\n");
          }
          else {
            syslog(2, "Database at path %s may be corrupt. Copied it to %s for further investigation.\n");
          }
          sqlite3_close(ppDb);
        }
        if (v16) {
          CPStopInhibitorWithIdentifier(v16);
        }
        free(v14);
        free(v15);
      }
      if (truncateDatabase((uint64_t)a1))
      {
        unsigned int v18 = (void (*)(void *, void))a1[10];
        if (v18) {
          v18(a1, 0);
        }
      }
      else
      {
        syslog(2, "Failed to delete database at %s!\n");
      }
    }
    char v12 = 1;
  }
  sqlite3_close(v19);
  if (v7) {
    CPStopInhibitorWithIdentifier(v7);
  }
  if (v12) {
    abortAfterFailingIntegrityCheck(v10);
  }
  abortAfterPassingIntegrityCheck(v10);
}

uint64_t integrityCheckDatabase(const char *a1, sqlite3 **a2, uint64_t a3, int a4)
{
  CFStringRef v8 = *(const __CFString **)(a3 + 248);
  if (v8) {
    int v9 = _CPCreateUTF8StringFromCFString(v8);
  }
  else {
    int v9 = 0;
  }
  unsigned int v10 = *(_DWORD *)(a3 + 260);
  if (v10 >= 4) {
    int v11 = 0;
  }
  else {
    int v11 = 0x400000 - (v10 << 20);
  }
  if (a4) {
    int v12 = 1;
  }
  else {
    int v12 = 6;
  }
  int v13 = sqlite3_open_v2(a1, a2, v11 | v12, (const char *)v9);
  if (v9) {
    free(v9);
  }
  if ((v13 - 5) >= 2)
  {
    if (v13) {
      return 0;
    }
    else {
      return CPSqliteDatabaseIsCorrupted(*a2) ^ 1;
    }
  }
  else
  {
    syslog(4, "Got SQLite error %i when trying to open db at %s.  Skipping integrity check.\n", v13, a1);
    return 1;
  }
}

void abortAfterPassingIntegrityCheck(const char *a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting after passing the integrity check", buf, 2u);
  }
  syslog(4, "%s passed the integrity check, but we exited anyways\n", a1);
  abort();
}

void abortAfterFailingIntegrityCheck(const char *a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exiting after failing the integrity check", buf, 2u);
  }
  syslog(4, "%s failed the integrity check\n", a1);
  abort();
}

void abortAfterFailingToGetPath(const void *a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not get path for database", buf, 2u);
  }
  syslog(4, "Could not get path for database at %p\n", a1);
  abort();
}

void __handleSqliteIOError_block_invoke(uint64_t a1)
{
}

uint64_t runWithExtendedSQLiteErrorCode_SQLITE_IOERR_BLOCKED(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

CFStringRef Int64SetKeyCopyDescription(void *a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%llu", *a1);
}

BOOL Int64SetKeyEqual(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t Int64SetKeyHash(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t CPIntShow(int a1)
{
  return fprintf((FILE *)*MEMORY[0x1E4F143C8], "%d", a1);
}

uint64_t CPFloatShow(float *a1)
{
  return fprintf((FILE *)*MEMORY[0x1E4F143C8], "%f", *a1);
}

CFStringRef copyString(CFStringRef theString)
{
  return CFStringCreateCopy(0, theString);
}

uint64_t CPRecordGetTypeID()
{
  return kCPRecordTypeID;
}

CFDataRef CPRecordRegisterClass()
{
  kCPRecordTypeID = _CFRuntimeRegisterClass();
  CFDataRef result = CFDataCreate(0, 0, 0);
  __CPNotNullDataValue = (uint64_t)result;
  return result;
}

uint64_t CPRecordCreate(uint64_t a1)
{
  return CPRecordCreateWithRecordID(a1, -1);
}

uint64_t CPRecordCreateWithRecordID(uint64_t a1, int a2)
{
  uint64_t Instance = _createInstance(a1, a2);
  if (Instance && *(int *)(a1 + 72) >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *MEMORY[0x1E4F1D260];
    uint64_t v6 = 8;
    do
    {
      if (*(_DWORD *)(*(void *)(a1 + 80) + v6) == 4)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v8 = (uint64_t)Current;
        if (!(uint64_t)Current || *(void *)(Instance + 8 * v4 + 72) != v8)
        {
          if (v8) {
            uint64_t v10 = (uint64_t)Current;
          }
          else {
            uint64_t v10 = v5;
          }
          CPRecordPropertyLoadHandler(Instance, v4, v10);
        }
      }
      ++v4;
      v6 += 40;
    }
    while (v4 < *(int *)(a1 + 72));
  }
  return Instance;
}

CFStringRef CPRecordCopyTableName(CFStringRef result)
{
  if (result) {
    return CFStringCreateWithCString(0, **(const char ***)(result->length + 80), 0x8000100u);
  }
  return result;
}

uint64_t CPRecordCreateCopy(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t Instance = _createInstance(v2, *(_DWORD *)(a1 + 32));
  uint64_t v4 = Instance;
  if (Instance)
  {
    *(unsigned char *)(Instance + 56) = *(unsigned char *)(a1 + 56);
    uint64_t v5 = *(unsigned int *)(v2 + 72);
    if ((int)v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = a1 + 72;
      do
      {
        uint64_t v8 = *(void *)(v7 + 8 * v6);
        if (v8) {
          BOOL v9 = *(void *)(v4 + 8 * v6 + 72) == v8;
        }
        else {
          BOOL v9 = 0;
        }
        if (!v9) {
          CPRecordPropertyLoadHandler(v4, v6, v8);
        }
        ++v6;
      }
      while (v5 != v6);
    }
  }
  return v4;
}

uint64_t CPRecordGetClass(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t _createInstance(uint64_t a1, int a2)
{
  int v4 = 8 * *(_DWORD *)(a1 + 72) + 72;
  pthread_once(&kCPRecordRegisterClass, (void (*)(void))CPRecordRegisterClass);
  size_t v5 = v4 - 16;
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v7 = Instance;
  if (Instance)
  {
    bzero((void *)(Instance + 16), v5);
    *(void *)(v7 + 24) = a1;
    *(_DWORD *)(v7 + 32) = a2;
    uint64_t v8 = *(void (**)(uint64_t))(a1 + 8);
    if (v8) {
      v8(v7);
    }
  }
  return v7;
}

uint64_t CPRecordGetID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 32);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t CPRecordInitializePropertyAndAllowLoading(uint64_t result, int a2, uint64_t a3, int a4)
{
  if (result && (!a3 || *(void *)(result + 8 * a2 + 72) != a3))
  {
    uint64_t v4 = *MEMORY[0x1E4F1D260];
    if (a4) {
      uint64_t v4 = 0;
    }
    if (!a3) {
      a3 = v4;
    }
    return CPRecordPropertyLoadHandler(result, a2, a3);
  }
  return result;
}

uint64_t CPRecordInitializeProperty(uint64_t result, int a2, uint64_t a3)
{
  if (result && (!a3 || *(void *)(result + 8 * a2 + 72) != a3))
  {
    if (!a3) {
      a3 = *MEMORY[0x1E4F1D260];
    }
    return CPRecordPropertyLoadHandler(result, a2, a3);
  }
  return result;
}

uint64_t CPRecordDetachWithRecordID(uint64_t result, int a2)
{
  *(void *)(result + 16) = 0;
  *(unsigned char *)(result + 56) = 1;
  *(_DWORD *)(result + 32) = a2;
  return result;
}

void CPRecordDestroy(void *context)
{
  if (context)
  {
    uint64_t v2 = *(void (**)(void *))(*((void *)context + 3) + 24);
    if (v2) {
      v2(context);
    }
    uint64_t v3 = (const void *)*((void *)context + 5);
    if (v3) {
      CFRelease(v3);
    }
    uint64_t v4 = *((void *)context + 3);
    if (*(int *)(v4 + 72) >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = *MEMORY[0x1E4F1D260];
      uint64_t v7 = 16;
      do
      {
        uint64_t v8 = *(void (**)(void))(*(void *)(*(void *)(v4 + 80) + v7) + 8);
        if (v8)
        {
          uint64_t v9 = *((void *)context + v5 + 9);
          if (v9 && v9 != v6)
          {
            v8();
            uint64_t v4 = *((void *)context + 3);
          }
        }
        ++v5;
        v7 += 40;
      }
      while (v5 < *(int *)(v4 + 72));
    }
    CFDictionaryRef v11 = (const __CFDictionary *)*((void *)context + 6);
    if (v11)
    {
      CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)_ClearOriginalProperty, context);
      CFRelease(*((CFTypeRef *)context + 6));
    }
    int v12 = (const void *)*((void *)context + 8);
    if (v12)
    {
      CFRelease(v12);
    }
  }
}

uint64_t _ClearOriginalProperty(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*MEMORY[0x1E4F1D260] != a2 && a2)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(*(void *)(a3 + 24) + 80)
                                                       + 40 * (int)result
                                                       + 16)
                                           + 8);
    if (v3) {
      return v3(a2);
    }
  }
  return result;
}

uint64_t CPRecordPropertyLoadHandler(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5 = a1 + 8 * a2;
  uint64_t v8 = *(void *)(v5 + 72);
  uint64_t v7 = (uint64_t *)(v5 + 72);
  uint64_t v6 = v8;
  uint64_t v10 = *MEMORY[0x1E4F1D260];
  if (v8) {
    BOOL v11 = v6 == v10;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    int v12 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 24) + 80) + 40 * a2 + 16) + 8);
    if (v12) {
      v12();
    }
  }
  if (a3)
  {
    if (v10 != a3)
    {
      int v13 = **(uint64_t (***)(uint64_t))(*(void *)(*(void *)(a1 + 24) + 80) + 40 * a2 + 16);
      if (v13) {
        a3 = v13(a3);
      }
    }
  }
  *uint64_t v7 = a3;
  return 1;
}

uint64_t CPRecordUnloadProperty(uint64_t result, int a2)
{
  if (result)
  {
    LODWORD(v2) = a2;
    uint64_t v3 = result;
    uint64_t v4 = *(__CFDictionary **)(result + 40);
    if (v4) {
      CFDictionaryRemoveValue(v4, (const void *)a2);
    }
    CFDictionaryRef v5 = *(const __CFDictionary **)(v3 + 48);
    if (v5)
    {
      uint64_t v2 = (int)v2;
      Value = CFDictionaryGetValue(v5, (const void *)(int)v2);
      uint64_t v7 = (const void *)*MEMORY[0x1E4F1D260];
      if (Value)
      {
        if (Value != v7)
        {
          uint64_t v8 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(v3 + 24) + 80) + 40 * (int)v2 + 16) + 8);
          if (v8) {
            v8();
          }
        }
      }
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 48), (const void *)(int)v2);
    }
    else
    {
      uint64_t v7 = (const void *)*MEMORY[0x1E4F1D260];
      uint64_t v2 = (int)v2;
    }
    uint64_t v9 = v3 + 8 * v2;
    uint64_t v11 = *(void *)(v9 + 72);
    uint64_t v10 = (void *)(v9 + 72);
    CFDataRef result = v11;
    if (v11) {
      BOOL v12 = result == (void)v7;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      int v13 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(v3 + 24) + 80) + 40 * (int)v2 + 16) + 8);
      if (v13) {
        CFDataRef result = v13();
      }
    }
    *uint64_t v10 = 0;
  }
  return result;
}

CFArrayRef CPRecordCopyChangedProperties(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 40);
  if (!v2) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(v2);
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = Count;
  CFDictionaryRef v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v5, 0);
  CFArrayRef v6 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, v4, 0);
  free(v5);
  return v6;
}

void CPRecordMarkPropertyChanged(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    CFMutableStringRef Mutable = *(__CFDictionary **)(a1 + 40);
    if (!Mutable)
    {
      CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
      *(void *)(a1 + 40) = Mutable;
    }
    CFDictionarySetValue(Mutable, (const void *)(int)a2, (const void *)1);
    CFDictionaryRef v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 24) + 112);
    if (v5)
    {
      v5(a1, a2);
    }
  }
}

void CPRecordSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  updated = _updateDetachedRecord(a1);
  if (!updated) {
    return;
  }
  uint64_t v7 = (uint64_t)updated;
  uint64_t v8 = updated[3];
  if ((*(unsigned char *)(v8 + 56) & 4) != 0 && *(int *)(v8 + 136) >= 3)
  {
    uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 144);
    if (v9) {
      v9(updated, a2, a3);
    }
  }
  if (*(unsigned char *)(v7 + 58))
  {
    CFSetRef v10 = *(const __CFSet **)(v7 + 64);
    if (!v10 || (uint64_t v11 = (int)a2, !CFSetContainsValue(v10, (const void *)(int)a2)))
    {
      CFDictionaryRef v12 = *(const __CFDictionary **)(v7 + 48);
      if (!v12 || (uint64_t v11 = (int)a2, !CFDictionaryGetValue(v12, (const void *)(int)a2)))
      {
        CFMutableStringRef Mutable = *(__CFSet **)(v7 + 64);
        if (!Mutable)
        {
          CFMutableStringRef Mutable = CFSetCreateMutable(0, *(int *)(*(void *)(v7 + 24) + 72), 0);
          *(void *)(v7 + 64) = Mutable;
        }
        uint64_t v11 = (int)a2;
        CFSetAddValue(Mutable, (const void *)(int)a2);
        uint64_t Property = CPRecordGetProperty(a1, a2);
        if (Property)
        {
          uint64_t v15 = (const void *)Property;
          uint64_t v16 = **(uint64_t (***)(uint64_t))(*(void *)(*(void *)(v7 + 24) + 80) + 40 * (int)a2 + 16);
          if (v16) {
            uint64_t v15 = (const void *)v16(Property);
          }
        }
        else
        {
          uint64_t v15 = (const void *)*MEMORY[0x1E4F1D260];
        }
        int v23 = *(__CFDictionary **)(v7 + 48);
        if (!v23)
        {
          int v23 = CFDictionaryCreateMutable(0, 0, 0, 0);
          *(void *)(v7 + 48) = v23;
        }
        CFDictionaryAddValue(v23, (const void *)(int)a2, v15);
        CFSetRemoveValue(*(CFMutableSetRef *)(v7 + 64), (const void *)(int)a2);
        if (!a3) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v11 = (int)a2;
  }
  if (!a3)
  {
LABEL_19:
    if (a3) {
      uint64_t v17 = a3;
    }
    else {
      uint64_t v17 = *MEMORY[0x1E4F1D260];
    }
    CPRecordPropertyLoadHandler(v7, a2, v17);
    goto LABEL_23;
  }
LABEL_18:
  if (*(void *)(v7 + 8 * v11 + 72) != a3) {
    goto LABEL_19;
  }
LABEL_23:
  CPRecordMarkPropertyChanged(v7, a2);
  uint64_t v18 = *(void *)(v7 + 16);
  if (!v18) {
    return;
  }
  CFDictionaryRef v19 = *(const __CFDictionary **)(v18 + 24);
  if (v19)
  {
    if (CFDictionaryContainsKey(v19, (const void *)v7)) {
      return;
    }
    uint64_t v18 = *(void *)(v7 + 16);
  }
  CFDictionaryRef v20 = *(const __CFDictionary **)(v18 + 40);
  if (!v20
    || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v20, *(const void **)(v7 + 24))) == 0
    || !CFDictionaryContainsKey(Value, (const void *)*(int *)(v7 + 32)))
  {
    if (*(unsigned char *)(*(void *)(v7 + 16) + 57))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v7 + 24) + 80) + 40 * (int)v11 + 25)) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 3;
      }
    }
    else
    {
      uint64_t v22 = 2;
    }
    _addChangeActions((void *)v7, v22);
  }
}

const void *_updateDetachedRecord(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFRetain((CFTypeRef)a1);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = (const void *)a1;
  if (v2)
  {
    uint64_t v3 = (const void *)a1;
    if (*(unsigned char *)(a1 + 56))
    {
      Cache = (__CFDictionary *)CPRecordStoreGetCache(v2, *(void **)(a1 + 24));
      CFDictionaryRef v5 = Cache;
      int v6 = *(_DWORD *)(a1 + 32);
      if (v6 != -1 && Cache)
      {
        CFDictionarySetValue(Cache, (const void *)v6, (const void *)a1);
        int v6 = *(_DWORD *)(a1 + 32);
      }
      InstanceFromDB = _loadInstanceFromDB(*(void *)(a1 + 16), *(const char ***)(a1 + 24), v6);
      if (InstanceFromDB)
      {
        uint64_t v3 = InstanceFromDB;
        *(unsigned char *)(a1 + 56) = 0;
      }
      else
      {
        if (v5) {
          CFDictionaryRemoveValue(v5, (const void *)*(int *)(a1 + 32));
        }
        uint64_t v3 = 0;
        *(unsigned char *)(a1 + 57) = 1;
      }
    }
  }
  CFRelease((CFTypeRef)a1);
  return v3;
}

uint64_t CPRecordGetProperty(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = *(void *)(result + 8 * (int)a2 + 72);
    if (v4) {
      goto LABEL_3;
    }
    int v5 = a2;
    updated = _updateDetachedRecord(result);
    if (updated)
    {
      uint64_t v4 = updated[(int)a2 + 9];
      if (v4)
      {
LABEL_3:
        if (*MEMORY[0x1E4F1D260] == v4) {
          return 0;
        }
        else {
          return v4;
        }
      }
      uint64_t v3 = updated;
    }
    uint64_t v4 = *(void *)(*(void *)(*(void *)(v3[3] + 80) + 40 * v5 + 16) + 24);
    if (v4)
    {
      CFDictionaryRef v7 = (const __CFDictionary *)v3[5];
      if (v7 && CFDictionaryContainsKey(v7, (const void *)(int)a2))
      {
        uint64_t v4 = 0;
      }
      else
      {
        uint64_t v8 = v3[2];
        if (v8) {
          ReaderConnection = (uint64_t *)_getReaderConnection(v8);
        }
        else {
          ReaderConnection = 0;
        }
        (*(void (**)(void *, uint64_t, uint64_t *))(*(void *)(*(void *)(v3[3] + 80) + 40 * v5 + 16)
                                                             + 24))(v3, a2, ReaderConnection);
        if (ReaderConnection) {
          CPSqliteDatabaseReleaseSqliteConnection(ReaderConnection);
        }
        uint64_t v4 = v3[(int)a2 + 9];
      }
    }
    goto LABEL_3;
  }
  return result;
}

void _addChangeActions(void *key, uint64_t a2)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(key[2] + 32);
  if (!v4)
  {
    *(void *)(key[2] + 32) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    CFDictionaryRef v4 = *(const __CFDictionary **)(key[2] + 32);
  }
  int v5 = (const void *)((unint64_t)CFDictionaryGetValue(v4, key) | a2);
  int v6 = *(__CFDictionary **)(key[2] + 32);
  CFDictionarySetValue(v6, key, v5);
}

CFMutableDictionaryRef *_getReaderConnection(uint64_t a1)
{
  uint64_t Database = CPRecordStoreGetDatabase(a1);
  if (!Database) {
    return 0;
  }
  uint64_t v3 = (CFMutableDictionaryRef *)CPSqliteDatabaseConnectionForReading(Database);
  CFDictionaryRef v4 = v3;
  if (v3 && *(_DWORD *)(a1 + 96) == -1 && (*(unsigned char *)(a1 + 57) & 2) == 0) {
    *(_DWORD *)(a1 + 96) = CPSqliteConnectionIntegerForProperty(v3, @"__CPRecordSequenceNumber");
  }
  return v4;
}

uint64_t CPRecordGetCachedProperty(uint64_t result, int a2)
{
  if (result)
  {
    if (*MEMORY[0x1E4F1D260] == *(void *)(result + 8 * a2 + 72)) {
      return 0;
    }
    else {
      return *(void *)(result + 8 * a2 + 72);
    }
  }
  return result;
}

uint64_t CPRecordGetIntegerProperty(uint64_t a1, uint64_t a2)
{
  return CPRecordGetProperty(a1, a2);
}

const void *CPRecordGetOriginalProperty(const void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    CFDictionaryRef v4 = (const __CFDictionary *)*((void *)result + 6);
    if (v4 && (CFDataRef result = CFDictionaryGetValue(v4, (const void *)(int)a2)) != 0)
    {
      if (result == (const void *)*MEMORY[0x1E4F1D260]) {
        return 0;
      }
    }
    else
    {
      return (const void *)CPRecordGetProperty(v3, a2);
    }
  }
  return result;
}

uint64_t CPRecordIsDeleted(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 57);
}

uint64_t CPRecordCopyProperty(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t result = CPRecordGetProperty(a1, a2);
  if (result)
  {
    int v5 = **(uint64_t (***)(void))(*(void *)(*(void *)(a1 + 24) + 80) + 40 * v2 + 16);
    if (v5)
    {
      return v5();
    }
  }
  return result;
}

uint64_t CPRecordShow(uint64_t result)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 24);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 40);
    if (v3)
    {
      return v3();
    }
    else
    {
      uint64_t v4 = *(unsigned int *)(v2 + 72);
      int v5 = (FILE **)MEMORY[0x1E4F143C8];
      uint64_t result = fprintf((FILE *)*MEMORY[0x1E4F143C8], "CPRecord/%s instance %p:\n", *(const char **)v2, (const void *)result);
      if ((int)v4 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        do
        {
          uint64_t Property = CPRecordGetProperty(v1, v7);
          fprintf(*v5, " %s (%d) = ", *(const char **)(*(void *)(*(void *)(v1 + 24) + 80) + v6), v7);
          uint64_t v9 = *(void *)(*(void *)(v1 + 24) + 80);
          if (Property && (CFSetRef v10 = *(void (**)(uint64_t))(*(void *)(v9 + v6 + 16) + 16)) != 0)
          {
            v10(Property);
          }
          else
          {
            int v11 = *(_DWORD *)(v9 + v6 + 8);
            if ((v11 - 6) < 2 || v11 == 2)
            {
              CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"%@", Property);
              if (v13)
              {
                CFStringRef v14 = v13;
                CFStringGetCString(v13, buffer, 2048, 0x8000100u);
                fputs(buffer, *v5);
                CFRelease(v14);
              }
              else
              {
                fwrite("(nil)", 5uLL, 1uLL, *v5);
              }
            }
            else if (v11 == 1)
            {
              fprintf(*v5, "%d");
            }
            else
            {
              fprintf(*v5, "%p");
            }
          }
          uint64_t result = fputc(10, *v5);
          uint64_t v7 = (v7 + 1);
          v6 += 40;
        }
        while (40 * v4 != v6);
      }
    }
  }
  return result;
}

uint64_t CPRecordGetPropertyDescriptor(uint64_t a1, unsigned int a2)
{
  uint64_t result = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 24);
    if (*(_DWORD *)(v4 + 72) <= (signed int)a2) {
      return 0;
    }
    else {
      return *(void *)(v4 + 80) + 40 * a2;
    }
  }
  return result;
}

uint64_t CPRecordGetStore(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

void CPRecordMarkChanged(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1[2];
    if (v1)
    {
      if ((*(unsigned char *)(v1 + 57) & 1) != 0 && (*(unsigned char *)(a1[3] + 56) & 2) != 0) {
        _addChangeActions(a1, 1);
      }
    }
  }
}

uint64_t CPRecordStoreSetContext(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 88) = a2;
  }
  return result;
}

uint64_t CPRecordStoreGetContext(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

void CPRecordStoreSetValueForProperty(uint64_t a1, void *key, const void *a3)
{
  CFMutableStringRef Mutable = *(__CFDictionary **)(a1 + 80);
  if (!Mutable)
  {
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    *(void *)(a1 + 80) = Mutable;
  }
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (const void *)*MEMORY[0x1E4F1D260];
  }
  CFDictionarySetValue(Mutable, key, v7);
}

CFStringRef CPRecordStoreCopyValueForProperty(uint64_t a1, const __CFString *key)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 80);
  if (v4)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, key);
    if (Value)
    {
      CFStringRef v6 = Value;
      CFRetain(Value);
LABEL_6:
      if ((CFStringRef)*MEMORY[0x1E4F1D260] == v6)
      {
        CFRelease(v6);
        return 0;
      }
      return v6;
    }
  }
  uint64_t Database = CPRecordStoreGetDatabase(a1);
  if (!Database) {
    return 0;
  }
  CFStringRef v6 = CPSqliteDatabaseCopyValueForProperty(Database, key);
  if (v6) {
    goto LABEL_6;
  }
  return v6;
}

uint64_t CPRecordStoreGetDatabase(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    uint64_t v3 = CPSqliteDatabaseCreateWithPath(*(const __CFString **)a1);
    *(void *)(a1 + 8) = v3;
    CPSqliteDatabaseSetSetupHandler((uint64_t)v3, (uint64_t)_sqliteDatabaseSetupHandler, a1);
    return *(void *)(a1 + 8);
  }
  return result;
}

void CPRecordStoreRemoveProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t Database = CPRecordStoreGetDatabase(a1);
  if (Database)
  {
    CPSqliteDatabaseRemoveProperty(Database, a2);
    int v5 = *(__CFDictionary **)(a1 + 80);
    if (v5)
    {
      CFDictionaryRemoveValue(v5, a2);
    }
  }
}

uint64_t CPRecordIndexOfPropertyNamed(const char **a1, int a2, char *__s1)
{
  if (a2 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = a2;
  while (strcmp(__s1, *a1))
  {
    ++v5;
    a1 += 5;
    if (v6 == v5) {
      return v6;
    }
  }
  return v5;
}

_DWORD *CPRecordStoreCreateWithPathAndOptions(const __CFString *a1, char a2)
{
  CFDictionaryRef v4 = malloc_type_calloc(1uLL, 0x80uLL, 0x10F0040CCCEF908uLL);
  if (v4)
  {
    *(void *)CFDictionaryRef v4 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1);
    v4[24] = -1;
    *((unsigned char *)v4 + 57) = *((unsigned char *)v4 + 57) & 0xF9 | (2 * (a2 & 3));
  }
  return v4;
}

_DWORD *CPRecordStoreCreateWithPath(const __CFString *a1)
{
  return CPRecordStoreCreateWithPathAndOptions(a1, 0);
}

uint64_t CPRecordStoreSetSetupHandler(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 64) = a2;
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return CPSqliteDatabaseSetSetupHandler(result, (uint64_t)_sqliteDatabaseSetupHandler, a1);
  }
  return result;
}

void _sqliteDatabaseSetupHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t))(a3 + 64);
  if (v5)
  {
    v5(a3);
  }
  else
  {
    CPSqliteDatabaseDefaultSetupHandler(a1, a2);
    CFSetRef v6 = *(const __CFSet **)(a3 + 72);
    if (v6)
    {
      v7[0] = a3;
      v7[1] = a2;
      CFSetApplyFunction(v6, (CFSetApplierFunction)_createTablesForClassInStore, v7);
    }
  }
}

uint64_t CPRecordStoreLogChanges(uint64_t result, char a2)
{
  *(unsigned char *)(result + 57) = *(unsigned char *)(result + 57) & 0xFE | a2;
  return result;
}

uint64_t CPRecordStoreIsLoggingChanges(uint64_t a1)
{
  return *(unsigned char *)(a1 + 57) & 1;
}

uint64_t CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 1, a2, a3, a4);
}

uint64_t _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(uint64_t result, int a2, int a3, unsigned int a4, CFErrorRef *a5)
{
  if (result)
  {
    uint64_t v9 = result;
    uint64_t Database = CPRecordStoreGetDatabase(result);
    uint64_t result = CPSqliteDatabaseConnectionForWriting(Database);
    if (result)
    {
      int v11 = (CFMutableDictionaryRef *)result;
      CPSqliteConnectionBeginTransactionType(result, a4);
      int v12 = CPSqliteConnectionIntegerForProperty(v11, @"__CPRecordSequenceNumber");
      if (!a3 || (int v13 = *(_DWORD *)(v9 + 96), v13 == -1) || v12 == v13)
      {
        *(_DWORD *)(v9 + 96) = v12;
        v15[1] = v11;
        v15[2] = 0;
        v15[0] = v9;
        if (a2) {
          _CPRecordStoreSaveAddedRecords(v15);
        }
        else {
          _CPRecordStoreSaveDeletedRecords(v15);
        }
        return 1;
      }
      else if (a5)
      {
        CFErrorRef v14 = CFErrorCreate(0, @"CPRecord", 2, 0);
        uint64_t result = 0;
        *a5 = v14;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CPRecordStoreProcessDeletedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 0, a2, a3, a4);
}

uint64_t CPRecordProcessAddImmediate(uint64_t a1, const void *a2)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = CPRecordStoreGetDatabase(a1);
      if (result)
      {
        uint64_t result = CPSqliteDatabaseConnectionForWriting(result);
        if (result)
        {
          uint64_t v5 = result;
          uint64_t result = *(void *)(a1 + 24);
          if (result)
          {
            uint64_t result = CFDictionaryContainsKey((CFDictionaryRef)result, a2);
            if (result)
            {
              v8[1] = v5;
              v8[2] = 0;
              v8[0] = a1;
              signed int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), a2);
              CPRecordStoreSaveRecord((uint64_t)a2, Value, (uint64_t)v8);
              CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 24), a2);
              if (*(unsigned char *)(a1 + 56))
              {
                CFMutableStringRef Mutable = *(__CFSet **)(a1 + 48);
                if (!Mutable)
                {
                  CFMutableStringRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
                  *(void *)(a1 + 48) = Mutable;
                }
                CFSetAddValue(Mutable, a2);
              }
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void CPRecordStoreSaveRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  CFSetRef v6 = *(const char ***)(a1 + 24);
  uint64_t v7 = v6[6];
  if (v7) {
    ((void (*)(uint64_t, void))v7)(a1, *(void *)(a3 + 8));
  }
  unsigned int v62 = 0;
  int v8 = *(_DWORD *)(a1 + 32);
  _updateModificationDateProperties(a1);
  uint64_t v9 = (const char **)CPRecordStoreWriteColumnsForRecord(a1, (int *)&v62, 1);
  CFSetRef v10 = *v6;
  CFAllocatorRef v61 = (CFAllocatorRef)*MEMORY[0x1E4F1CF80];
  CFStringRef v11 = CFStringCreateWithCString(v61, v10, 0x8000100u);
  Cache = (__CFDictionary *)CPRecordStoreGetCache(*(void *)v3, v6);
  sqlite3_int64 v13 = *(unsigned int *)(a1 + 32);
  if (v13 == -1) {
    goto LABEL_8;
  }
  uint64_t v14 = *(void *)v3;
  if (!*(void *)v3) {
    goto LABEL_8;
  }
  if ((int)v13 >= -1) {
    goto LABEL_9;
  }
  if ((v13 & 0x7FFFFFFF) >= *(_DWORD *)(v14 + 104)) {
LABEL_8:
  }
    sqlite3_int64 v13 = -1;
  else {
    sqlite3_int64 v13 = *(void *)(*(void *)(v14 + 112) + 8 * (v13 & 0x7FFFFFFF));
  }
LABEL_9:
  CPSqliteConnectionAddRecordWithRowid(*(CFMutableDictionaryRef **)(v3 + 8), v11, v13, v9, v62);
  int RecordIDForRowid = *(_DWORD *)(a1 + 32);
  if (RecordIDForRowid == -1)
  {
    uint64_t v16 = *(void *)v3;
    sqlite3_int64 Insert = CPSqliteConnectionRowidOfLastInsert(*(void *)(v3 + 8));
    int RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(v16, Insert);
    *(_DWORD *)(a1 + 32) = RecordIDForRowid;
  }
  if (Cache) {
    CFDictionarySetValue(Cache, (const void *)RecordIDForRowid, (const void *)a1);
  }
  CFRelease(v11);
  free(v9);
  CFDictionaryRef v18 = *(const __CFDictionary **)(a1 + 40);
  if (!v18)
  {
    if (v8 != -1) {
      goto LABEL_62;
    }
    goto LABEL_39;
  }
  *(void *)(a1 + 40) = 0;
  if (v8 == -1)
  {
LABEL_39:
    CFDictionaryRef v56 = v18;
    uint64_t v57 = a2;
    v58 = v6;
    uint64_t v59 = v3;
    v60 = &v54;
    size_t v36 = *(unsigned int *)(*(void *)(a1 + 24) + 72);
    ((void (*)(void))MEMORY[0x1F4188790])();
    CFStringRef v37 = (char *)&v54 - ((v36 + 15) & 0x1FFFFFFF0);
    if ((int)v36 < 1)
    {
LABEL_60:
      uint64_t v3 = v59;
LABEL_61:
      LOBYTE(a2) = v57;
      CFSetRef v6 = v58;
      CFDictionaryRef v18 = v56;
      goto LABEL_62;
    }
    bzero((char *)&v54 - ((v36 + 15) & 0x1FFFFFFF0), v36);
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    int64_t v40 = v36 - 1;
    uint64_t v41 = 1;
    size_t v55 = v36 - 1;
    while (v37[v39])
    {
LABEL_59:
      ++v39;
      ++v41;
      v38 += 40;
      if (v39 == v36) {
        goto LABEL_60;
      }
    }
    uint64_t v42 = *(void *)(a1 + 24);
    uint64_t v43 = *(void *)(v42 + 80);
    if ((*(unsigned char *)(v43 + 40 * v39 + 25) & 2) == 0)
    {
      uint64_t v44 = *(void *)(v43 + 40 * v39 + 16);
      uint64_t v45 = *(void *)(v44 + 40);
      if (v45)
      {
        if (v39 < v40)
        {
          CFMutableStringRef Mutable = 0;
          uint64_t v47 = v38;
          v48 = (char *)v41;
          do
          {
            uint64_t v49 = *(void *)(*(void *)(a1 + 24) + 80) + v47;
            if ((*(unsigned char *)(v49 + 65) & 2) == 0 && *(void *)(*(void *)(v49 + 56) + 40) == v45)
            {
              if (!Mutable)
              {
                CFMutableStringRef Mutable = CFArrayCreateMutable(v61, v36, 0);
                CFArrayAppendValue(Mutable, (const void *)v39);
              }
              CFArrayAppendValue(Mutable, v48);
              v48[(void)v37] = 1;
            }
            ++v48;
            v47 += 40;
          }
          while ((char *)v36 != v48);
          uint64_t v42 = *(void *)(a1 + 24);
          if (Mutable)
          {
            (*(void (**)(uint64_t, __CFArray *, void))(*(void *)(*(void *)(v42 + 80) + 40 * v39 + 16)
                                                                 + 40))(a1, Mutable, *(void *)(v59 + 8));
            CFRelease(Mutable);
            int64_t v40 = v55;
            goto LABEL_58;
          }
          int64_t v40 = v55;
        }
        uint64_t v44 = *(void *)(*(void *)(v42 + 80) + 40 * v39 + 16);
      }
      v50 = *(void (**)(uint64_t, uint64_t, void))(v44 + 32);
      if (v50) {
        v50(a1, v39, *(void *)(v59 + 8));
      }
    }
LABEL_58:
    v37[v39] = 1;
    goto LABEL_59;
  }
  CFIndex Count = CFDictionaryGetCount(v18);
  if (Count)
  {
    uint64_t v20 = Count;
    uint64_t v57 = a2;
    v58 = v6;
    uint64_t v54 = (uint64_t)&v54;
    MEMORY[0x1F4188790](Count);
    uint64_t v22 = (const void **)((char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v21 >= 0x200) {
      size_t v23 = 512;
    }
    else {
      size_t v23 = v21;
    }
    bzero((char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
    CFDictionaryRef v56 = v18;
    CFDictionaryGetKeysAndValues(v18, v22, 0);
    MEMORY[0x1F4188790](v24);
    uint64_t v25 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v20 >= 1)
    {
      bzero((char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
      uint64_t v26 = 0;
      uint64_t v59 = v3;
      while (1)
      {
        if (!v25[v26])
        {
          CFStringRef v27 = v22[v26];
          uint64_t v28 = *(void *)(a1 + 24);
          uint64_t v29 = *(void *)(*(void *)(v28 + 80) + 40 * (int)v27 + 16);
          uint64_t v30 = *(void *)(v29 + 40);
          if (!v30) {
            goto LABEL_34;
          }
          signed int v31 = v22[v26];
          uint64_t v32 = v26 + 1;
          if (v26 + 1 >= v20) {
            goto LABEL_33;
          }
          v60 = (const void *)(int)v27;
          size_t v55 = (size_t)v27;
          CFNumberRef v33 = 0;
          do
          {
            unsigned int v34 = (const void *)SLODWORD(v22[v32]);
            if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 24) + 80) + 40 * (int)v34 + 16) + 40) == v30)
            {
              if (!v33)
              {
                CFNumberRef v33 = CFArrayCreateMutable(v61, v20, 0);
                CFArrayAppendValue(v33, v60);
              }
              CFArrayAppendValue(v33, v34);
              v25[v32] = 1;
            }
            ++v32;
          }
          while (v20 != v32);
          uint64_t v28 = *(void *)(a1 + 24);
          if (!v33)
          {
            uint64_t v3 = v59;
            signed int v31 = (int)v60;
LABEL_33:
            uint64_t v29 = *(void *)(*(void *)(v28 + 80) + 40 * v31 + 16);
LABEL_34:
            uint64_t v35 = *(void (**)(uint64_t))(v29 + 32);
            if (v35) {
              v35(a1);
            }
            goto LABEL_36;
          }
          uint64_t v3 = v59;
          (*(void (**)(uint64_t, __CFArray *, void))(*(void *)(*(void *)(v28 + 80) + 40 * (int)v60 + 16)
                                                               + 40))(a1, v33, *(void *)(v59 + 8));
          CFRelease(v33);
        }
LABEL_36:
        v25[v26++] = 1;
        if (v26 == v20) {
          goto LABEL_61;
        }
      }
    }
    goto LABEL_61;
  }
LABEL_62:
  if ((*(unsigned char *)(*(void *)v3 + 57) & 1) != 0
    && (a2 & 1) != 0
    && (*(unsigned char *)(*(void *)(a1 + 24) + 56) & 2) != 0)
  {
    _logRecordEvent(*(CFMutableDictionaryRef **)(v3 + 8), a1, 0, 0);
  }
  v51 = v6[13];
  if (v51) {
    ((void (*)(uint64_t, void, const __CFDictionary *))v51)(a1, *(void *)(v3 + 8), v18);
  }
  if (v18) {
    CFRelease(v18);
  }
  v52 = *(const void **)(a1 + 40);
  if (v52)
  {
    CFRelease(v52);
    *(void *)(a1 + 40) = 0;
  }
  CFDictionaryRef v53 = *(const __CFDictionary **)(a1 + 48);
  if (v53)
  {
    CFDictionaryApplyFunction(v53, (CFDictionaryApplierFunction)_ClearOriginalProperty, (void *)a1);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
  *(unsigned char *)(a1 + 58) = 1;
}

uint64_t CPRecordProcessChangesImmediate(uint64_t a1, const void *a2)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = CPRecordStoreGetDatabase(a1);
      if (result)
      {
        uint64_t result = CPSqliteDatabaseConnectionForWriting(result);
        if (result)
        {
          uint64_t v5 = result;
          uint64_t result = *(void *)(a1 + 32);
          if (result)
          {
            uint64_t result = CFDictionaryContainsKey((CFDictionaryRef)result, a2);
            if (result)
            {
              v7[1] = v5;
              void v7[2] = 0;
              v7[0] = a1;
              signed int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
              CPRecordStoreUpdateRecord((uint64_t)a2, Value, (uint64_t)v7);
              CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 32), a2);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void CPRecordStoreUpdateRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (CFMutableDictionaryRef **)a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void (**)(uint64_t, void))(v6 + 48);
  if (v7) {
    v7(a1, *(void *)(a3 + 8));
  }
  unsigned int v41 = 0;
  _updateModificationDateProperties(a1);
  int v8 = (long long *)CPRecordStoreWriteColumnsForRecord(a1, (int *)&v41, 0);
  uint64_t v9 = *(const char **)v6;
  CFAllocatorRef v39 = (CFAllocatorRef)*MEMORY[0x1E4F1CF80];
  CFStringRef v10 = CFStringCreateWithCString(v39, v9, 0x8000100u);
  CFStringRef v11 = *v3;
  if (!*v3) {
    goto LABEL_42;
  }
  sqlite3_int64 v12 = *(int *)(a1 + 32);
  if ((int)v12 < -1)
  {
    if ((v12 & 0x7FFFFFFF) < *((_DWORD *)v11 + 26))
    {
      sqlite3_int64 v12 = *((void *)v11[14] + (v12 & 0x7FFFFFFF));
      goto LABEL_7;
    }
LABEL_42:
    sqlite3_int64 v12 = -1;
  }
LABEL_7:
  CPSqliteConnectionUpdateRecord(v3[1], v10, v12, v8, v41);
  CFRelease(v10);
  free(v8);
  CFDictionaryRef v13 = *(const __CFDictionary **)(a1 + 40);
  if (v13)
  {
    *(void *)(a1 + 40) = 0;
    CFIndex Count = CFDictionaryGetCount(v13);
    if (Count)
    {
      uint64_t v15 = Count;
      uint64_t v35 = a2;
      uint64_t v36 = v6;
      uint64_t v33 = (uint64_t)&v33;
      MEMORY[0x1F4188790](Count);
      uint64_t v17 = (const void **)((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
      if (v16 >= 0x200) {
        size_t v18 = 512;
      }
      else {
        size_t v18 = v16;
      }
      bzero((char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
      CFDictionaryRef v34 = v13;
      CFDictionaryGetKeysAndValues(v13, v17, 0);
      MEMORY[0x1F4188790](v19);
      uint64_t v20 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v15 >= 1)
      {
        bzero((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
        uint64_t v21 = 0;
        CFStringRef v37 = v3;
        do
        {
          if (!v20[v21])
          {
            uint64_t v22 = v17[v21];
            uint64_t v23 = *(void *)(a1 + 24);
            uint64_t v24 = *(void *)(*(void *)(v23 + 80) + 40 * (int)v22 + 16);
            uint64_t v25 = *(void *)(v24 + 40);
            if (!v25) {
              goto LABEL_27;
            }
            signed int v26 = v17[v21];
            uint64_t v27 = v21 + 1;
            if (v21 + 1 >= v15) {
              goto LABEL_26;
            }
            int64_t v40 = (const void *)(int)v22;
            uint64_t v38 = v22;
            CFMutableStringRef Mutable = 0;
            do
            {
              uint64_t v29 = (const void *)SLODWORD(v17[v27]);
              if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 24) + 80) + 40 * (int)v29 + 16) + 40) == v25)
              {
                if (!Mutable)
                {
                  CFMutableStringRef Mutable = CFArrayCreateMutable(v39, v15, 0);
                  CFArrayAppendValue(Mutable, v40);
                }
                CFArrayAppendValue(Mutable, v29);
                v20[v27] = 1;
              }
              ++v27;
            }
            while (v15 != v27);
            uint64_t v23 = *(void *)(a1 + 24);
            if (!Mutable)
            {
              uint64_t v3 = v37;
              signed int v26 = (int)v40;
LABEL_26:
              uint64_t v24 = *(void *)(*(void *)(v23 + 80) + 40 * v26 + 16);
LABEL_27:
              uint64_t v30 = *(void (**)(uint64_t))(v24 + 32);
              if (v30) {
                v30(a1);
              }
              goto LABEL_29;
            }
            uint64_t v3 = v37;
            (*(void (**)(uint64_t, __CFArray *, CFMutableDictionaryRef *))(*(void *)(*(void *)(v23 + 80)
                                                                                               + 40 * (int)v40
                                                                                               + 16)
                                                                                   + 40))(a1, Mutable, v37[1]);
            CFRelease(Mutable);
          }
LABEL_29:
          v20[v21++] = 1;
        }
        while (v21 != v15);
      }
      CFDictionaryRef v13 = v34;
      LOBYTE(a2) = v35;
      uint64_t v6 = v36;
    }
  }
  if ((a2 & 1) != 0 && (*((unsigned char *)*v3 + 57) & 1) != 0 && (*(unsigned char *)(*(void *)(a1 + 24) + 56) & 2) != 0) {
    _logRecordEvent(v3[1], a1, 1, v13);
  }
  signed int v31 = *(void (**)(uint64_t, CFMutableDictionaryRef *, const __CFDictionary *))(v6 + 104);
  if (v31) {
    v31(a1, v3[1], v13);
  }
  if (v13) {
    CFRelease(v13);
  }
  CFDictionaryRef v32 = *(const __CFDictionary **)(a1 + 48);
  if (v32)
  {
    CFDictionaryApplyFunction(v32, (CFDictionaryApplierFunction)_ClearOriginalProperty, (void *)a1);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
}

uint64_t CPRecordStoreProcessAddedRecordsWithPolicy(uint64_t a1, int a2, CFErrorRef *a3)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 1, a2, 0, a3);
}

uint64_t CPRecordStoreProcessAddedRecords(uint64_t a1, CFErrorRef *a2)
{
  return _CPRecordStoreProcessAddedOrDeletedRecordsWithPolicyAndTransactionType(a1, 1, 0, 0, a2);
}

uint64_t CPRecordStoreGetSequenceNumber(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  ReaderConnection = _getReaderConnection(a1);
  if (!ReaderConnection) {
    return 0;
  }
  uint64_t v2 = (uint64_t *)ReaderConnection;
  uint64_t v3 = CPSqliteConnectionIntegerForProperty(ReaderConnection, @"__CPRecordSequenceNumber");
  CPSqliteDatabaseReleaseSqliteConnection(v2);
  return v3;
}

uint64_t CPRecordStoreGetLastSequenceNumber(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 96);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t CPRecordStoreGetRecordIDForRowid(uint64_t a1, uint64_t a2)
{
  uint64_t value = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = a2;
  if ((unint64_t)(a2 - 0x80000000) <= 0xFFFFFFFF7FFFFFFELL)
  {
    CFSetRef Mutable = *(const __CFSet **)(a1 + 120);
    if (!Mutable)
    {
      uint64_t v5 = malloc_type_malloc(0x8000uLL, 0x100004000313F17uLL);
      *(void *)(a1 + 112) = v5;
      if (!v5) {
        return 0xFFFFFFFFLL;
      }
      CFSetRef Mutable = CFSetCreateMutable(0, 4096, &Int64SetKeyCallbacks);
      *(void *)(a1 + 120) = Mutable;
      *(_DWORD *)(a1 + 108) = 4096;
    }
    uint64_t v6 = *(unsigned char **)(a1 + 112);
    uint64_t v7 = CFSetGetValue(Mutable, &value);
    if (v7) {
      return ((unint64_t)(v7 - v6) >> 3) | 0x80000000;
    }
    uint64_t v8 = *(unsigned int *)(a1 + 104);
    if (*(_DWORD *)(a1 + 108) != v8)
    {
LABEL_16:
      CFDictionaryRef v13 = &v6[8 * (int)v8];
      *CFDictionaryRef v13 = value;
      *(_DWORD *)(a1 + 104) = v8 + 1;
      uint64_t v2 = v8 | 0x80000000;
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v13);
      return v2;
    }
    int v9 = (3 * (int)v8) >> 1;
    CFStringRef v10 = reallocf(v6, 8 * v9);
    if (v10)
    {
      uint64_t v6 = v10;
      if (v10 != *(unsigned char **)(a1 + 112))
      {
        CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 120));
        if ((int)v8 >= 1)
        {
          uint64_t v11 = v8;
          sqlite3_int64 v12 = v6;
          do
          {
            CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v12);
            v12 += 8;
            --v11;
          }
          while (v11);
        }
        *(void *)(a1 + 112) = v6;
      }
      *(_DWORD *)(a1 + 108) = v9;
      goto LABEL_16;
    }
    return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t CPRecordStoreGetRowidForRecordID(uint64_t a1, int a2)
{
  if (!a1) {
    return -1;
  }
  if (a2 >= -1) {
    return a2;
  }
  if ((a2 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104)) {
    return *(void *)(*(void *)(a1 + 112) + 8 * (a2 & 0x7FFFFFFF));
  }
  else {
    return -1;
  }
}

CFArrayRef CPRecordStoreCopyAddedRecords(uint64_t a1)
{
  return _createRecordsArrayFromDictionary(*(const __CFDictionary **)(a1 + 24), MEMORY[0x1E4F1D510]);
}

CFArrayRef _createRecordsArrayFromDictionary(const __CFDictionary *a1, const CFArrayCallBacks *a2)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v5 = Count;
  uint64_t v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(a1, v6, 0);
  CFArrayRef v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v5, a2);
  free(v6);
  return v7;
}

CFArrayRef CPRecordStoreCopyChangedRecords(uint64_t a1)
{
  return _createRecordsArrayFromDictionary(*(const __CFDictionary **)(a1 + 32), MEMORY[0x1E4F1D510]);
}

__CFArray *CPRecordStoreCopyDeletedRecords(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 40);
  if (!v2) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(v2);
  if (!Count) {
    return 0;
  }
  uint64_t v4 = Count;
  CFSetRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v6 = (const void **)malloc_type_malloc(8 * v4, 0x2004093837F09uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v6, 0);
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v6[i]);
      CFIndex v9 = CFDictionaryGetCount(Value);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = (const void **)malloc_type_malloc(8 * v9, 0xC0040B8AA526DuLL);
        CFDictionaryGetKeysAndValues(Value, 0, v11);
        sqlite3_int64 v12 = v11;
        if (v10 >= 1)
        {
          do
          {
            uint64_t v13 = (uint64_t)*v12++;
            CFArrayAppendValue(Mutable, *(const void **)(v13 + 16));
            --v10;
          }
          while (v10);
        }
        free(v11);
      }
    }
  }
  free(v6);
  return Mutable;
}

CFArrayRef CPRecordStoreCopyDeletedRecordIDsOfClass(uint64_t a1, const void *a2)
{
  CFDictionaryRef Value = *(const __CFDictionary **)(a1 + 40);
  if (Value) {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, a2);
  }
  return _createRecordsArrayFromDictionary(Value, 0);
}

uint64_t CPRecordStoreProcessAddedRecordsOfClassWithPolicyAndTransactionType(uint64_t a1, uint64_t a2, int a3, unsigned int a4, CFErrorRef *a5)
{
  return CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(a1, (unsigned int (*)(uint64_t, const void *, uint64_t))_matchClassPredicate, a2, a3, a4, a5);
}

uint64_t CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(uint64_t a1, unsigned int (*a2)(uint64_t, const void *, uint64_t), uint64_t a3, int a4, unsigned int a5, CFErrorRef *a6)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 24))
    {
      v27[0] = a1;
      v27[2] = 0;
      uint64_t Database = CPRecordStoreGetDatabase(a1);
      if (Database)
      {
        uint64_t v14 = Database;
        uint64_t v15 = CPSqliteDatabaseConnectionForWriting(Database);
        if (v15)
        {
          unint64_t v16 = (CFMutableDictionaryRef *)v15;
          CPSqliteConnectionBeginTransactionType(v15, a5);
          v27[1] = v16;
          int v17 = CPSqliteConnectionIntegerForProperty(v16, @"__CPRecordSequenceNumber");
          if (a4)
          {
            int v18 = *(_DWORD *)(a1 + 96);
            if (v18 != -1 && v17 != v18)
            {
              int v19 = 0;
              if (a6) {
                *a6 = CFErrorCreate(0, @"CPRecord", 2, 0);
              }
LABEL_22:
              if ((*(_WORD *)(v14 + 116) & 8) != 0) {
                CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v16);
              }
              return v19 != 0;
            }
          }
          *(_DWORD *)(a1 + 96) = v17;
          CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 24));
          uint64_t v21 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
          if (v21)
          {
            uint64_t v22 = v21;
            CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 24), v21, 0);
            *(unsigned char *)(a1 + 56) = 1;
            if (Count >= 1)
            {
              uint64_t v23 = v22;
              do
              {
                uint64_t v24 = *v23;
                if (a2(a1, *v23, a3))
                {
                  CFSetRef v25 = *(const __CFSet **)(a1 + 48);
                  if (v25 && CFSetContainsValue(v25, v24))
                  {
                    CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 48), v24);
                  }
                  else
                  {
                    signed int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), v24);
                    CPRecordStoreSaveRecord((uint64_t)v24, Value, (uint64_t)v27);
                  }
                  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 24), v24);
                }
                ++v23;
                --Count;
              }
              while (Count);
            }
            *(unsigned char *)(a1 + 56) = 0;
            free(v22);
            int v19 = 1;
            goto LABEL_22;
          }
        }
      }
      int v19 = 0;
      return v19 != 0;
    }
    return 1;
  }
  return result;
}

BOOL _matchClassPredicate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a2 + 24) == a3;
}

uint64_t CPRecordStoreProcessAddedRecordsOfClassWithPolicy(uint64_t a1, uint64_t a2, int a3, CFErrorRef *a4)
{
  return CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(a1, (unsigned int (*)(uint64_t, const void *, uint64_t))_matchClassPredicate, a2, a3, 0, a4);
}

uint64_t CPRecordStoreProcessAddedRecordsOfClass(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  return CPRecordStoreProcessAddedRecordsWithPolicyAndTransactionTypeMatchingPredicate(a1, (unsigned int (*)(uint64_t, const void *, uint64_t))_matchClassPredicate, a2, 0, 0, a3);
}

void CPRecordInvalidateRecord(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 72);
    if (v2 >= 1)
    {
      for (int i = 0; i != v2; ++i)
        CPRecordUnloadProperty(a1, i);
    }
    *(unsigned char *)(a1 + 56) = 1;
    *(unsigned char *)(a1 + 58) = 0;
    uint64_t v4 = *(const void **)(a1 + 64);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 64) = 0;
    }
  }
}

uint64_t CPRecordStoreSaveWithCallbackAndTransactionType(uint64_t a1, void (*a2)(uint64_t, CFMutableDictionaryRef *), int a3, unsigned int a4, CFErrorRef *a5)
{
  return CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, a4, a5);
}

uint64_t CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(uint64_t a1, void (*a2)(uint64_t, CFMutableDictionaryRef *), void (*a3)(uint64_t, CFMutableDictionaryRef *), int a4, unsigned int a5, CFErrorRef *a6)
{
  if (a1
    && !a2
    && !a3
    && !*(void *)(a1 + 24)
    && !*(void *)(a1 + 32)
    && !*(void *)(a1 + 40)
    && !*(void *)(a1 + 80)
    && !*(void *)(a1 + 16))
  {
    return 1;
  }
  uint64_t Database = CPRecordStoreGetDatabase(a1);
  uint64_t v13 = CPSqliteDatabaseConnectionForWriting(Database);
  if (!v13)
  {
    if (a6)
    {
      CFIndex v15 = 1;
      goto LABEL_16;
    }
    return 0;
  }
  uint64_t v14 = (CFMutableDictionaryRef *)v13;
  if (a4 && (*(unsigned char *)(a1 + 57) & 2) != 0)
  {
    if (a6)
    {
      CFIndex v15 = 3;
LABEL_16:
      CFErrorRef v16 = CFErrorCreate(0, @"CPRecord", v15, 0);
      BOOL v17 = 0;
LABEL_17:
      *a6 = v16;
      return v17;
    }
    return 0;
  }
  CPSqliteConnectionBeginTransactionType(v13, a5);
  int v18 = CPSqliteConnectionIntegerForProperty(v14, @"__CPRecordSequenceNumber");
  int v19 = v18;
  if (a4)
  {
    int v20 = *(_DWORD *)(a1 + 96);
    if (v20 != -1 && v18 != v20)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s: database changed externally\n", "_Bool CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CPRecordStoreRef, CPRecordStoreSaveCallback, CPRecordStoreSaveCallback, CPRecordConflictPolicy, CPSqliteTransactionType, CFErrorRef *)");
      if (a6) {
        *a6 = CFErrorCreate(0, @"CPRecord", 2, 0);
      }
      CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v14);
      return 0;
    }
  }
  uint64_t context = a1;
  uint64_t v28 = v14;
  uint64_t v29 = 0;
  *(_DWORD *)(a1 + 96) = v18;
  if (a2) {
    a2(a1, v14);
  }
  _CPRecordStoreSaveDeletedRecords(&context);
  _CPRecordStoreSaveAddedRecords(&context);
  if (context)
  {
    if (v28)
    {
      CFDictionaryRef v22 = *(const __CFDictionary **)(context + 32);
      if (v22)
      {
        *(void *)(context + 32) = 0;
        CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)CPRecordStoreUpdateRecord, &context);
        CFRelease(v22);
        uint64_t v23 = *(const void **)(context + 32);
        if (v23)
        {
          CFRelease(v23);
          *(void *)(context + 32) = 0;
        }
      }
    }
  }
  CFDictionaryRef v24 = *(const __CFDictionary **)(a1 + 80);
  if (v24)
  {
    CFDictionaryApplyFunction(v24, (CFDictionaryApplierFunction)_saveProperty, &context);
    CFRelease(*(CFTypeRef *)(a1 + 80));
    *(void *)(a1 + 80) = 0;
  }
  int v25 = v19 + 1;
  *(_DWORD *)(a1 + 96) = v19 + 1;
  if (v19 <= 0 && (*(unsigned char *)(a1 + 57) & 4) != 0)
  {
    CFLog();
    int v25 = *(_DWORD *)(a1 + 96);
  }
  CPSqliteConnectionSetIntegerForProperty(v14, @"__CPRecordSequenceNumber", v25);
  if (a3) {
    a3(a1, v14);
  }
  if (a5 == 0xFFFF)
  {
    int v26 = 101;
  }
  else
  {
    int v26 = CPSqliteConnectionCommit((uint64_t)v14);
    CPSqliteConnectionCheckNoConnectionError((uint64_t)v14, v26, "_Bool CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CPRecordStoreRef, CPRecordStoreSaveCallback, CPRecordStoreSaveCallback, CPRecordConflictPolicy, CPSqliteTransactionType, CFErrorRef *)");
  }
  CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v14);
  BOOL v17 = v26 == 101;
  if (a6 && v26 != 101)
  {
    CFErrorRef v16 = CFErrorCreate(0, @"CPRecordSQLite", v26, 0);
    goto LABEL_17;
  }
  return v17;
}

void _CPRecordStoreSaveDeletedRecords(void *a1)
{
  if (a1 && *a1 && a1[1])
  {
    CFDictionaryRef v2 = *(const __CFDictionary **)(*a1 + 40);
    if (v2)
    {
      CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2);
      CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)CPRecordStoreDeleteRecordsInDictionary, a1);
      CFRelease(Copy);
      CFRelease(*(CFTypeRef *)(*a1 + 40));
      *(void *)(*a1 + 40) = 0;
    }
  }
}

void _CPRecordStoreSaveAddedRecords(void *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      if (a1[1])
      {
        CFDictionaryRef v3 = *(const __CFDictionary **)(v2 + 24);
        if (v3)
        {
          *(unsigned char *)(v2 + 56) = 1;
          CFDictionaryRef Copy = CFDictionaryCreateCopy(0, v3);
          if (Copy)
          {
            CFDictionaryRef v5 = Copy;
            CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)CPRecordStoreSaveRecordIfNotAdded, a1);
            CFRelease(v5);
          }
          uint64_t v6 = *a1;
          *(unsigned char *)(v6 + 56) = 0;
          CFRelease(*(CFTypeRef *)(v6 + 24));
          uint64_t v2 = *a1;
          *(void *)(*a1 + 24) = 0;
        }
        CFArrayRef v7 = *(const void **)(v2 + 48);
        if (v7)
        {
          CFRelease(v7);
          *(void *)(*a1 + 48) = 0;
        }
      }
    }
  }
}

uint64_t _saveProperty(const __CFString *a1, UInt8 *a2, uint64_t a3)
{
  uint64_t v4 = *(CFMutableDictionaryRef **)(a3 + 8);
  if ((UInt8 *)*MEMORY[0x1E4F1D260] == a2) {
    CFDictionaryRef v5 = 0;
  }
  else {
    CFDictionaryRef v5 = a2;
  }
  return CPSqliteConnectionSetValueForProperty(v4, a1, v5);
}

uint64_t CPRecordStoreSave(uint64_t a1, CFErrorRef *a2)
{
  return CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, 0, 0, 0, 0, a2);
}

uint64_t CPRecordStoreSaveWithCallback(uint64_t a1, void (*a2)(uint64_t, CFMutableDictionaryRef *), int a3, CFErrorRef *a4)
{
  return CPRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, 0, a4);
}

void CPRecordStoreDestroy(void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)*((void *)a1 + 2);
  if (v2)
  {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)_disownRecordsForClass, 0);
    CFRelease(*((CFTypeRef *)a1 + 2));
  }
  CFDictionaryRef v3 = (const __CFDictionary *)*((void *)a1 + 3);
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)_disownRecordKey, 0);
    CFRelease(*((CFTypeRef *)a1 + 3));
  }
  uint64_t v4 = (const void *)*((void *)a1 + 6);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *((void *)a1 + 1);
  if (v5) {
    CPSqliteDatabaseClose(v5);
  }
  uint64_t v6 = (const void *)*((void *)a1 + 4);
  if (v6) {
    CFRelease(v6);
  }
  CFArrayRef v7 = (const void *)*((void *)a1 + 5);
  if (v7) {
    CFRelease(v7);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  uint64_t v8 = (const void *)*((void *)a1 + 9);
  if (v8) {
    CFRelease(v8);
  }
  CFIndex v9 = (const void *)*((void *)a1 + 15);
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = (void *)*((void *)a1 + 14);
  if (v10) {
    free(v10);
  }
  free(a1);
}

void _disownRecordsForClass(int a1, CFDictionaryRef theDict)
{
}

uint64_t _disownRecordKey(uint64_t result)
{
  *(void *)(result + 16) = 0;
  return result;
}

void CPRecordStoreCreateTablesForClass(uint64_t a1, CFMutableDictionaryRef *a2, int a3)
{
  if (a2)
  {
    char v6 = *(unsigned char *)(a1 + 56);
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    MutableCFDictionaryRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"CREATE TABLE IF NOT EXISTS ");
    CFStringAppendCString(MutableCopy, *(const char **)a1, 0x8000100u);
    uint64_t v8 = *(unsigned int *)(a1 + 120);
    uint64_t v45 = a2;
    char v44 = v6;
    if ((int)v8 < 1) {
      goto LABEL_7;
    }
    char v9 = 0;
    uint64_t v10 = *(int **)(a1 + 128);
    do
    {
      int v11 = *v10;
      v10 += 4;
      v9 |= v11 == 1;
      --v8;
    }
    while (v8);
    if (v9)
    {
      CFStringAppend(MutableCopy, @" (");
    }
    else
    {
LABEL_7:
      sqlite3_int64 v12 = (void *)CFRetain(@"ROWID");
      uint64_t v13 = *(const char **)(a1 + 96);
      if (v13) {
        sqlite3_int64 v12 = (void *)CFStringCreateWithCString(0, v13, 0x600u);
      }
      uint64_t v14 = v12;
      CFStringAppendFormat(MutableCopy, 0, @" (%@ INTEGER PRIMARY KEY"), v12, alloc;
      if (v6) {
        CFStringRef v15 = @" AUTOINCREMENT, ";
      }
      else {
        CFStringRef v15 = @", ";
      }
      CFStringAppend(MutableCopy, v15);
      CFRelease(v14);
    }
    int v16 = *(_DWORD *)(a1 + 72);
    if (v16 >= 1)
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      char v19 = 1;
      do
      {
        uint64_t v20 = *(void *)(a1 + 80) + v17;
        if ((*(unsigned char *)(v20 + 24) & 4) != 0 || !*(_DWORD *)(v20 + 8)) {
          goto LABEL_28;
        }
        if ((v19 & 1) == 0) {
          CFStringAppend(MutableCopy, @", ");
        }
        CFStringAppendCString(MutableCopy, *(const char **)v20, 0x8000100u);
        unsigned int v21 = *(_DWORD *)(v20 + 8) - 1;
        CFStringRef v22 = @" TEXT";
        if (v21 <= 6) {
          CFStringRef v22 = off_1E5668EA8[v21];
        }
        CFStringAppend(MutableCopy, v22);
        int v23 = *(_DWORD *)(v20 + 24);
        if ((v23 & 0xE0) == 0) {
          goto LABEL_26;
        }
        CFSetRef Mutable = CFStringCreateMutable(0, 0);
        int v25 = Mutable;
        if ((v23 & 0x20) != 0)
        {
          CFStringAppend(Mutable, @" UNIQUE");
          if ((v23 & 0x40) == 0)
          {
LABEL_24:
            if ((v23 & 0x80) != 0) {
              goto LABEL_32;
            }
            goto LABEL_25;
          }
        }
        else if ((v23 & 0x40) == 0)
        {
          goto LABEL_24;
        }
        CFStringAppend(v25, @" NOT NULL");
        if ((v23 & 0x80) != 0)
        {
LABEL_32:
          CFStringAppend(v25, @" DEFAULT 0");
          if (v25) {
            goto LABEL_27;
          }
LABEL_26:
          int v25 = (__CFString *)CFRetain(&stru_1EDF24210);
          goto LABEL_27;
        }
LABEL_25:
        if (!v25) {
          goto LABEL_26;
        }
LABEL_27:
        CFStringAppend(MutableCopy, v25);
        CFRelease(v25);
        char v19 = 0;
        int v16 = *(_DWORD *)(a1 + 72);
LABEL_28:
        ++v18;
        v17 += 40;
      }
      while (v18 < v16);
    }
    if (*(int *)(a1 + 120) >= 1)
    {
      uint64_t v26 = 0;
      while (1)
      {
        uint64_t v27 = *(void *)(a1 + 128);
        int v28 = *(_DWORD *)(v27 + 16 * v26);
        if (v28 == 1) {
          break;
        }
        if (v28 == 2)
        {
          CFStringRef v29 = CFSTR(", UNIQUE (");
LABEL_40:
          CFStringAppend(MutableCopy, v29);
        }
        uint64_t v30 = v27 + 16 * v26;
        signed int v31 = (int *)(v30 + 4);
        if (*(int *)(v30 + 4) >= 1)
        {
          uint64_t v32 = 0;
          uint64_t v33 = (void *)(v30 + 8);
          do
          {
            if (v32) {
              CFStringAppend(MutableCopy, @", ");
            }
            CFStringAppendCString(MutableCopy, *(const char **)(*(void *)(a1 + 80) + 40 * *(int *)(*v33 + 4 * v32++)), 0x8000100u);
          }
          while (v32 < *v31);
        }
        CFStringAppend(MutableCopy, @""));
        if (++v26 >= *(int *)(a1 + 120)) {
          goto LABEL_47;
        }
      }
      CFStringRef v29 = CFSTR(", PRIMARY KEY (");
      goto LABEL_40;
    }
LABEL_47:
    CFStringAppend(MutableCopy, @";"));
    CPSqliteConnectionPerformSQL(v45, MutableCopy);
    CFRelease(MutableCopy);
    if (a3)
    {
      if ((v44 & 2) != 0)
      {
        CFMutableStringRef v34 = CFStringCreateMutableCopy(alloc, 0, @"CREATE TABLE IF NOT EXISTS ");
        CFStringAppendCString(v34, *(const char **)a1, 0x8000100u);
        CFStringAppend(v34, @"Changes (record INTEGER, type INTEGER");
        if ((v44 & 0x10) != 0) {
          CFStringAppend(v34, @", sequence_number INTEGER");
        }
        if (*(int *)(a1 + 72) < 1)
        {
LABEL_65:
          CFStringAppend(v34, @";"));
          CPSqliteConnectionPerformSQL(v45, v34);
          CFRelease(v34);
          return;
        }
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        while (1)
        {
          uint64_t v37 = *(void *)(a1 + 80) + v35;
          uint64_t v38 = *(const char **)v37;
          int v39 = *(_DWORD *)(v37 + 8);
          int v40 = *(_DWORD *)(v37 + 24);
          if (v39 && (v40 & 2) != 0) {
            break;
          }
          if ((v40 & 8) != 0)
          {
            CFStringAppend(v34, @", ");
            CFStringAppendCString(v34, v38, 0x8000100u);
            CFStringRef v42 = @" INTEGER";
LABEL_63:
            CFStringAppend(v34, v42);
          }
          ++v36;
          v35 += 40;
          if (v36 >= *(int *)(a1 + 72)) {
            goto LABEL_65;
          }
        }
        CFStringAppend(v34, @", ");
        CFStringAppendCString(v34, v38, 0x8000100u);
        CFStringRef v42 = @" TEXT";
        if ((v39 - 1) < 7) {
          CFStringRef v42 = off_1E5668EA8[v39 - 1];
        }
        goto LABEL_63;
      }
    }
  }
}

void CPRecordStoreRegisterClass(uint64_t a1, void *value)
{
  CFSetRef Mutable = *(__CFSet **)(a1 + 72);
  if (!Mutable)
  {
    CFSetRef Mutable = CFSetCreateMutable(0, 0, 0);
    *(void *)(a1 + 72) = Mutable;
  }
  CFSetAddValue(Mutable, value);
}

char *CPRecordStoreCreateReadColumns(uint64_t a1, _DWORD *a2, CFDictionaryRef theDict, uint64_t (*a4)(int a1), uint64_t (*(*a5)())(uint64_t a1, int a2, uint64_t a3))
{
  uint64_t v6 = a1;
  if (a4) {
    CFArrayRef v7 = a4;
  }
  else {
    CFArrayRef v7 = CPRecordStoreColumnTypeForPropertyType;
  }
  v50 = (uint64_t (*)(void))v7;
  if (a5) {
    uint64_t v8 = a5;
  }
  else {
    uint64_t v8 = returnCPRecordPropertyLoadHandler;
  }
  v48 = v8;
  if (theDict)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
  }
  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 72);
    if ((int)v10 < 1)
    {
      CFStringRef v15 = 0;
      LODWORD(Count) = 0;
      goto LABEL_31;
    }
    CFIndex Count = 0;
    uint64_t v11 = *(void *)(a1 + 80) + 24;
    sqlite3_int64 v12 = (char *)v11;
    do
    {
      char v13 = *v12;
      v12 += 40;
      if ((v13 & 4) == 0)
      {
        if (*(_DWORD *)(v11 - 16)) {
          CFIndex Count = (Count + 1);
        }
        else {
          CFIndex Count = Count;
        }
      }
      uint64_t v11 = (uint64_t)v12;
      --v10;
    }
    while (v10);
  }
  uint64_t v14 = Count;
  if ((int)Count < 1)
  {
    CFStringRef v15 = 0;
    if (theDict) {
      goto LABEL_20;
    }
LABEL_31:
    if (*(int *)(v6 + 72) >= 1)
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      do
      {
        uint64_t v35 = *(void *)(v6 + 80) + v32;
        if ((*(unsigned char *)(v35 + 24) & 4) == 0 && (*(_DWORD *)(v35 + 8) ? (BOOL v36 = (int)v34 < (int)Count) : (BOOL v36 = 0), v36))
        {
          uint64_t v37 = (v34 + 1);
          int v38 = v34;
          int v39 = &v15[24 * (int)v34];
          *(_DWORD *)int v39 = v37;
          int v40 = v15;
          *((_DWORD *)v39 + 1) = v50();
          if (*(unsigned char *)(v35 + 24))
          {
            *(void *)&v40[24 * v38 + 8] = 0;
          }
          else
          {
            uint64_t v41 = ((uint64_t (*)(void))v48)(*(unsigned int *)(v35 + 8));
            CFStringRef v42 = &v40[24 * v38];
            *((void *)v42 + 1) = v41;
            *((void *)v42 + 2) = v33;
          }
          CFStringRef v15 = v40;
        }
        else
        {
          uint64_t v37 = v34;
        }
        ++v33;
        v32 += 40;
        uint64_t v34 = v37;
      }
      while (v33 < *(int *)(v6 + 72));
    }
    signed int v31 = a2;
    goto LABEL_45;
  }
  CFStringRef v15 = (char *)malloc_type_calloc(Count, 0x18uLL, 0x1080040D2F62047uLL);
  if (!theDict) {
    goto LABEL_31;
  }
LABEL_20:
  uint64_t v49 = v15;
  int v16 = (const void **)malloc_type_malloc(8 * (int)Count, 0x80040B8603338uLL);
  char v44 = (const void **)malloc_type_malloc(8 * (int)Count, 0x80040B8603338uLL);
  uint64_t v45 = v16;
  CFDictionaryGetKeysAndValues(theDict, v16, v44);
  if ((int)Count >= 1)
  {
    int v17 = 0;
    char v19 = v44;
    uint64_t v18 = v16;
    uint64_t v47 = v6;
    do
    {
      uint64_t v20 = *(void *)(v6 + 80);
      uint64_t v21 = v20 + 40 * *(unsigned int *)v18;
      char v23 = *(unsigned char *)(v21 + 24);
      CFStringRef v22 = (unsigned char *)(v21 + 24);
      if ((v23 & 4) == 0)
      {
        uint64_t v24 = v20 + 40 * *(unsigned int *)v18;
        int v26 = *(_DWORD *)(v24 + 8);
        int v25 = (unsigned int *)(v24 + 8);
        if (v26)
        {
          CFIndex v27 = Count;
          int v28 = &v49[24 * v17];
          *(_DWORD *)int v28 = *v19;
          *((_DWORD *)v28 + 1) = v50();
          if (*v22)
          {
            *(void *)&v49[24 * v17 + 8] = 0;
          }
          else
          {
            uint64_t v29 = ((uint64_t (*)(void))v48)(*v25);
            uint64_t v30 = &v49[24 * v17];
            *((void *)v30 + 1) = v29;
            *((void *)v30 + 2) = *v18;
          }
          CFIndex Count = v27;
          ++v17;
          uint64_t v6 = v47;
        }
      }
      ++v19;
      ++v18;
      --v14;
    }
    while (v14);
  }
  free(v45);
  free(v44);
  signed int v31 = a2;
  CFStringRef v15 = v49;
LABEL_45:
  *signed int v31 = Count;
  return v15;
}

uint64_t CPRecordStoreColumnTypeForPropertyType(int a1)
{
  uint64_t v1 = 0;
  CFDictionaryRef v2 = typemap;
  do
  {
    int v3 = *v2;
    v2 += 2;
    if (v3 == a1) {
      break;
    }
    ++v1;
  }
  while (v1 != 7);
  return typemap[2 * v1 + 1];
}

uint64_t (*returnCPRecordPropertyLoadHandler())(uint64_t a1, int a2, uint64_t a3)
{
  return CPRecordPropertyLoadHandler;
}

__CFString *CPRecordStoreCreateSelectPrefixFromRecordDescriptor(const char **a1)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, 0, 0);
}

__CFString *CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(const char **a1, CFArrayRef theArray)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, theArray, 0);
}

__CFString *CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumn(const char **a1, void *a2)
{
  values = a2;
  if (a2)
  {
    CFArrayRef v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, 0);
    SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, v3, 0);
    CFRelease(v3);
    return SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  }
  else
  {
    return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, 0, 0, 0);
  }
}

__CFString *CPRecordStoreCreateColumnListFromRecordDescriptor(uint64_t a1)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, 0, 0, 0, 0);
}

__CFString *_CPRecordStoreCreateColumnListFromRecordDescriptor(uint64_t a1, int a2, CFStringRef theString, CFMutableDictionaryRef *a4, const __CFArray *a5)
{
  CFStringRef v7 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString) && CFStringGetLength(v7)) {
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@.", v7);
    }
    else {
      CFStringRef v7 = 0;
    }
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  MutableCFDictionaryRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"SELECT ");
  sqlite3_int64 v12 = MutableCopy;
  if (a2) {
    CFStringAppend(MutableCopy, @"DISTINCT ");
  }
  if (v7) {
    CFStringAppend(v12, v7);
  }
  CFStringAppend(v12, @"ROWID");
  if (a4) {
    *a4 = CFDictionaryCreateMutable(v10, 0, 0, 0);
  }
  if (*(int *)(a1 + 72) >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    int v15 = 1;
    do
    {
      uint64_t v16 = *(void *)(a1 + 80) + v13;
      int v17 = *(_DWORD *)(v16 + 24);
      if ((v17 & 4) == 0 && *(_DWORD *)(v16 + 8))
      {
        if (v17)
        {
          if (!a4) {
            CFStringAppend(v12, @", NULL");
          }
        }
        else
        {
          CFStringAppend(v12, @", ");
          if (v7) {
            CFStringAppend(v12, v7);
          }
          CFStringAppendCString(v12, *(const char **)(*(void *)(a1 + 80) + v13), 0x8000100u);
          if (a4) {
            CFDictionarySetValue(*a4, v14, (const void *)v15++);
          }
        }
      }
      ++v14;
      v13 += 40;
    }
    while ((uint64_t)v14 < *(int *)(a1 + 72));
  }
  if (a5)
  {
    if (CFArrayGetCount(a5))
    {
      CFIndex Count = CFArrayGetCount(a5);
      if (Count >= 1)
      {
        CFIndex v19 = Count;
        for (CFIndex i = 0; i != v19; ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a5, i);
          CFStringAppend(v12, @", ");
          CFStringAppend(v12, ValueAtIndex);
        }
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  return v12;
}

__CFString *CPRecordStoreCreateDistinctColumnList(uint64_t a1, int a2, CFMutableDictionaryRef *a3)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, a2, 0, a3, 0);
}

__CFString *CPRecordStoreCreateColumnList(uint64_t a1, CFMutableDictionaryRef *a2)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, 0, 0, a2, 0);
}

__CFString *CPRecordStoreCreateColumnListWithAliasAndExtraColumns(uint64_t a1, CFStringRef theString, const __CFArray *a3, CFMutableDictionaryRef *a4)
{
  return _CPRecordStoreCreateColumnListFromRecordDescriptor(a1, 0, theString, a4, a3);
}

__CFString *_CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(const char **a1, const __CFString *a2, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a5)
{
  CFStringRef v7 = theString;
  if (theString && !CFStringGetLength(theString)) {
    CFStringRef v7 = 0;
  }
  if (theArray && !a5 && !v7) {
    CFArrayGetCount(theArray);
  }
  ColumnListFromRecordDescriptor = _CPRecordStoreCreateColumnListFromRecordDescriptor((uint64_t)a1, 0, v7, a5, theArray);
  CFStringAppend(ColumnListFromRecordDescriptor, @" FROM ");
  if (a2 && CFStringGetLength(a2))
  {
    CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"(%@)", a2);
    CFStringAppend(ColumnListFromRecordDescriptor, v11);
    CFRelease(v11);
    if (!v7) {
      return ColumnListFromRecordDescriptor;
    }
    goto LABEL_13;
  }
  CFStringAppendCString(ColumnListFromRecordDescriptor, *a1, 0x8000100u);
  if (v7) {
LABEL_13:
  }
    CFStringAppendFormat(ColumnListFromRecordDescriptor, 0, @" AS %@", v7);
  return ColumnListFromRecordDescriptor;
}

__CFString *CPRecordStoreCreateJoinableSelectPrefixFromRecordDescriptor(const char **a1, CFStringRef theString)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, theString, 0, 0);
}

__CFString *CPRecordStoreCreateSelectPrefixWithTableExpressionAndAlias(const char **a1, const __CFString *a2, const __CFString *a3)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, a2, a3, 0, 0);
}

__CFString *CPRecordStoreCreateSelectStatement(const char **a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, a2, a3, 0, 0);
  if (SelectPrefixFromRecordDescriptorWithAdditionalColumns)
  {
    if (a4 && CFStringGetLength(a4) >= 1)
    {
      CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, @" ");
      CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, a4);
    }
    CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, @";");
  }
  return SelectPrefixFromRecordDescriptorWithAdditionalColumns;
}

__CFString *CPRecordStoreCreateSelectPrefix(const char **a1, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a4)
{
  return _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a1, 0, theString, theArray, a4);
}

uint64_t CPRecordStoreProcessStatementWithPropertyIndices(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, CFDictionaryRef theDict)
{
  return CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, a3, a4, 0, a5, theDict, 0);
}

uint64_t CPRecordStoreProcessRecordStatementWithPropertyIndices(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFDictionary *a7)
{
  return CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, a3, a4, a5, a6, a7, 0);
}

uint64_t CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, CFDictionaryRef theDict, uint64_t a8)
{
  if (!a3) {
    return 0;
  }
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (a8) {
    uint64_t v15 = a8;
  }
  else {
    uint64_t v15 = (uint64_t)a2;
  }
  Columns = CPRecordStoreCreateReadColumns(v15, (_DWORD *)&v22 + 2, theDict, 0, 0);
  uint64_t v17 = 0;
  *((void *)&v21 + 1) = Columns;
  if (a8 | (unint64_t)Columns)
  {
    uint64_t v18 = Columns;
    *(void *)&long long v22 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if ((void)v22)
    {
      *(void *)&long long v20 = a1;
      *((void *)&v20 + 1) = a2;
      *(void *)&long long v21 = CPRecordStoreGetCache(a1, a2);
      *(void *)&long long v23 = a4;
      *((void *)&v23 + 1) = a5;
      uint64_t v24 = a6;
      HIDWORD(v22) = -1;
      CPSqliteStatementSendResults(a3, (unsigned int (*)(void *, uint64_t))CPRecordLoadHandler, (uint64_t)&v20);
      uint64_t v18 = (void *)*((void *)&v21 + 1);
      uint64_t v17 = v22;
    }
    else
    {
      uint64_t v17 = 0;
    }
    free(v18);
  }
  return v17;
}

const void *CPRecordStoreGetCache(uint64_t a1, void *key)
{
  CFDictionaryRef Mutable = *(const __CFDictionary **)(a1 + 16);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    *(void *)(a1 + 16) = Mutable;
  }
  signed int Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    signed int Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), key, Value);
    CFRelease(Value);
  }
  return Value;
}

uint64_t CPRecordLoadHandler(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  int v4 = sqlite3_column_type(*(sqlite3_stmt **)(a1 + 8), 0);
  if (v4 == 5)
  {
    int RecordIDForRowid = -1;
    goto LABEL_8;
  }
  sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), 0);
  int RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(*(void *)a2, v6);
  CFDictionaryRef v7 = *(const __CFDictionary **)(*(void *)a2 + 40);
  if (v7)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v7, *(const void **)(a2 + 8));
    if (Value)
    {
      if (CFDictionaryContainsKey(Value, (const void *)RecordIDForRowid)) {
        return 0;
      }
    }
  }
LABEL_8:
  CFAllocatorRef v10 = *(uint64_t (**)(uint64_t, void))(a2 + 48);
  if (v10)
  {
    char v11 = v10(a1, *(void *)(a2 + 64));
    uint64_t v9 = v11 & 1;
    if ((v11 & 2) == 0) {
      return v9;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v4 != 5)
  {
    uint64_t v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid);
    if (v13)
    {
      uint64_t Instance = (uint64_t)v13;
      if (v13[56])
      {
        CPSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(void *)(a2 + 24), *(_DWORD *)(a2 + 40), (uint64_t)v13, *MEMORY[0x1E4F1D260]);
        *(unsigned char *)(Instance + 56) = 0;
      }
    }
    else
    {
      uint64_t Instance = _createInstance(*(void *)(a2 + 8), RecordIDForRowid);
      if (!Instance) {
        goto LABEL_20;
      }
      CPSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(void *)(a2 + 24), *(_DWORD *)(a2 + 40), Instance, *MEMORY[0x1E4F1D260]);
      *(void *)(Instance + 16) = *(void *)a2;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid, (const void *)Instance);
      CFRelease((CFTypeRef)Instance);
    }
    *(unsigned char *)(Instance + 58) = 1;
    goto LABEL_20;
  }
  uint64_t Instance = *MEMORY[0x1E4F1D260];
LABEL_20:
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 56);
  if (v14)
  {
    if (v14(a1, Instance, *(void *)(a2 + 64))) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v9;
    }
  }
  uint64_t v15 = *(__CFArray **)(a2 + 32);
  if (v15) {
    CFArrayAppendValue(v15, (const void *)Instance);
  }
  return v9;
}

uint64_t CPRecordStoreProcessStatement(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  return CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, a3, a4, 0, a5, 0, 0);
}

uint64_t CPRecordStoreProcessQuery(uint64_t a1, void *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  return CPRecordStoreProcessQueryWithBindBlock(a1, a2, a3, a4, a5, 0);
}

uint64_t CPRecordStoreProcessQueryWithBindBlock(uint64_t a1, void *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  ReaderConnection = _getReaderConnection(a1);
  if (!ReaderConnection) {
    return 0;
  }
  uint64_t v13 = (uint64_t *)ReaderConnection;
  uint64_t v14 = CPSqliteConnectionStatementForSQL(ReaderConnection, a3);
  if (v14)
  {
    uint64_t v15 = v14;
    if (a6) {
      (*(void (**)(uint64_t, void *))(a6 + 16))(a6, v14);
    }
    uint64_t Descriptor = CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, v15, a4, 0, a5, 0, 0);
  }
  else
  {
    uint64_t Descriptor = 0;
  }
  CPSqliteDatabaseReleaseSqliteConnection(v13);
  return Descriptor;
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWhere(uint64_t a1, const char **a2, const __CFString *a3)
{
  return CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock(a1, a2, a3, 0);
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock(uint64_t a1, const char **a2, const __CFString *a3, uint64_t a4)
{
  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a2, 0, 0, 0, 0);
  uint64_t v9 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  if (a3)
  {
    CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, @" ");
    CFStringAppend(v9, a3);
  }
  CFStringAppend(v9, @";");
  uint64_t v10 = CPRecordStoreProcessQueryWithBindBlock(a1, a2, v9, 0, 0, a4);
  CFRelease(v9);
  return v10;
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWithAliasAndFilter(uint64_t a1, const char **a2, const __CFString *a3, const __CFString *a4, uint64_t a5)
{
  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a2, 0, a3, 0, 0);
  uint64_t v10 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  if (a4)
  {
    CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, @" ");
    CFStringAppend(v10, a4);
  }
  CFStringAppend(v10, @";");
  uint64_t v11 = CPRecordStoreProcessQueryWithBindBlock(a1, a2, v10, 0, 0, a5);
  CFRelease(v10);
  return v11;
}

uint64_t CPRecordStoreCopyAllInstancesOfClass(uint64_t a1, const char **a2)
{
  return CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock(a1, a2, 0, 0);
}

const void *CPRecordStoreGetInstanceOfClassWithUID(uint64_t a1, void *a2, int a3)
{
  uint64_t result = _CPRecordStoreGetCachedInstanceOfClassWithUID(a1, a2, a3);
  if (!result)
  {
    return _loadInstanceFromDB(a1, (const char **)a2, a3);
  }
  return result;
}

const void *_CPRecordStoreGetCachedInstanceOfClassWithUID(uint64_t a1, void *a2, int a3)
{
  CFDictionaryRef Cache = (const __CFDictionary *)CPRecordStoreGetCache(a1, a2);
  if (!Cache) {
    return 0;
  }
  CFDictionaryRef v7 = (const void *)a3;
  CFDictionaryRef Value = CFDictionaryGetValue(Cache, (const void *)a3);
  if (!Value) {
    return 0;
  }
  updated = _updateDetachedRecord((uint64_t)Value);
  if (updated)
  {
    CFDictionaryRef DeletedRecords = (const __CFDictionary *)CPRecordStoreGetDeletedRecords(a1, a2);
    if (DeletedRecords)
    {
      if (CFDictionaryContainsKey(DeletedRecords, v7)) {
        return 0;
      }
    }
  }
  return updated;
}

const void *_loadInstanceFromDB(uint64_t a1, const char **a2, int a3)
{
  if (!CPRecordStoreGetDatabase(a1)
    || (SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(a2, 0, 0, 0, 0)) == 0)
  {
    CFStringRef ValueAtIndex = 0;
    goto LABEL_21;
  }
  CFStringRef v7 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  CFStringAppend(SelectPrefixFromRecordDescriptorWithAdditionalColumns, @" WHERE ROWID = ?;");
  ReaderConnection = _getReaderConnection(a1);
  if (ReaderConnection)
  {
    uint64_t v9 = (uint64_t *)ReaderConnection;
    uint64_t v10 = CPSqliteConnectionStatementForSQL(ReaderConnection, v7);
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = v10;
    sqlite3_int64 v12 = (sqlite3_stmt *)*((void *)v10 + 1);
    if (!v12) {
      goto LABEL_16;
    }
    if (!a1) {
      goto LABEL_24;
    }
    if (a3 >= -1)
    {
      sqlite3_int64 v13 = a3;
      goto LABEL_13;
    }
    if ((a3 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104)) {
      sqlite3_int64 v13 = *(void *)(*(void *)(a1 + 112) + 8 * (a3 & 0x7FFFFFFF));
    }
    else {
LABEL_24:
    }
      sqlite3_int64 v13 = -1;
LABEL_13:
    sqlite3_bind_int64(v12, 1, v13);
    CFArrayRef Descriptor = (const __CFArray *)CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, v11, 0, 0, 0, 0, 0);
    if (Descriptor)
    {
      CFArrayRef v16 = Descriptor;
      if (CFArrayGetCount(Descriptor) < 1) {
        CFStringRef ValueAtIndex = 0;
      }
      else {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v16, 0);
      }
      CFRelease(v16);
      goto LABEL_19;
    }
LABEL_16:
    CFStringRef ValueAtIndex = 0;
LABEL_19:
    CPSqliteDatabaseReleaseSqliteConnection(v9);
    goto LABEL_20;
  }
  CFStringRef ValueAtIndex = 0;
LABEL_20:
  CFRelease(v7);
LABEL_21:
  if (ValueAtIndex == (const void *)*MEMORY[0x1E4F1D260]) {
    return 0;
  }
  else {
    return ValueAtIndex;
  }
}

sqlite3_stmt **CPRecordStoreCopyInstancesOfClassWithUIDs(uint64_t a1, void *a2, const __CFArray *a3)
{
  CFDictionaryRef Cache = (const __CFDictionary *)CPRecordStoreGetCache(a1, a2);
  if (!Cache) {
    return 0;
  }
  CFDictionaryRef v7 = Cache;
  CFIndex Count = CFArrayGetCount(a3);
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef Mutable = (sqlite3_stmt **)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CFIndex v11 = CFArrayGetCount(a3);
  CFMutableSetRef v12 = CFSetCreateMutable(v9, v11, 0);
  if (Count < 1)
  {
LABEL_9:
    CFRelease(v12);
    if (Mutable) {
      return Mutable;
    }
  }
  else
  {
    CFIndex v13 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a3, v13);
      CFDictionaryRef Value = CFDictionaryGetValue(v7, ValueAtIndex);
      if (!Value) {
        break;
      }
      uint64_t v16 = (uint64_t)Value;
      if (!CFSetContainsValue(v12, ValueAtIndex))
      {
        updated = _updateDetachedRecord(v16);
        if (updated)
        {
          CFArrayAppendValue((CFMutableArrayRef)Mutable, updated);
          CFSetAddValue(v12, ValueAtIndex);
        }
      }
      if (Count == ++v13) {
        goto LABEL_9;
      }
    }
    CFRelease(Mutable);
    CFRelease(v12);
  }
  SelectPrefixFromRecordDescriptorWithAdditionalColumns = _CPRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns((const char **)a2, 0, 0, 0, 0);
  if (!SelectPrefixFromRecordDescriptorWithAdditionalColumns) {
    return 0;
  }
  CFIndex v19 = SelectPrefixFromRecordDescriptorWithAdditionalColumns;
  ReaderConnection = _getReaderConnection(a1);
  if (ReaderConnection)
  {
    long long v21 = ReaderConnection;
    CFStringAppend(v19, @" WHERE ROWID IN(");
    if (Count >= 1)
    {
      CFIndex v22 = Count;
      do
      {
        CFStringAppend(v19, @"?");
        if (v22 != 1) {
          CFStringAppend(v19, @", ");
        }
        --v22;
      }
      while (v22);
    }
    CFStringAppend(v19, @" "));
    long long v23 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQL(v21, v19);
    CFDictionaryRef Mutable = v23;
    if (v23)
    {
      if (v23[1])
      {
        if (Count >= 1)
        {
          CFIndex v24 = 0;
          while (1)
          {
            int v25 = CFArrayGetValueAtIndex(a3, v24);
            if (!a1) {
              break;
            }
            if (v25 < -1)
            {
              if ((v25 & 0x7FFFFFFF) >= *(_DWORD *)(a1 + 104)) {
                break;
              }
              sqlite3_int64 v26 = *(void *)(*(void *)(a1 + 112) + 8 * (v25 & 0x7FFFFFFF));
            }
            else
            {
              sqlite3_int64 v26 = v25;
            }
LABEL_28:
            sqlite3_bind_int64(Mutable[1], ++v24, v26);
            if (Count == v24) {
              goto LABEL_33;
            }
          }
          sqlite3_int64 v26 = -1;
          goto LABEL_28;
        }
LABEL_33:
        CFDictionaryRef Mutable = (sqlite3_stmt **)CPRecordStoreProcessRecordStatementWithPropertyIndicesAndQueryDescriptor(a1, a2, Mutable, 0, 0, 0, 0, 0);
      }
      else
      {
        CFDictionaryRef Mutable = 0;
      }
    }
    CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v21);
  }
  else
  {
    CFDictionaryRef Mutable = 0;
  }
  CFRelease(v19);
  return Mutable;
}

void CPRecordStoreAddRecord(uint64_t a1, void **a2)
{
}

void _CPRecordStoreAddRecord(uint64_t a1, void **key, int a3)
{
  if (!key) {
    return;
  }
  CFArrayRef v3 = key;
  key[2] = (void *)a1;
  if (*(unsigned char *)(a1 + 57)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  sqlite3_int64 v6 = (const void *)*((int *)key + 8);
  if (a3)
  {
    if (v6 == -1
      || (CachedInstanceOfClassWithUID = (void **)_CPRecordStoreGetCachedInstanceOfClassWithUID(a1, key[3], (int)v6)) == 0)
    {
      uint64_t v8 = v3;
    }
    else
    {
      uint64_t v8 = CachedInstanceOfClassWithUID;
      CFArrayRef v9 = CPRecordCopyChangedProperties((uint64_t)v3);
      CFArrayRef v10 = CPRecordCopyChangedProperties((uint64_t)v8);
      if (v9)
      {
        CFIndex Count = CFArrayGetCount(v9);
        if (Count >= 1)
        {
          CFIndex v12 = Count;
          for (CFIndex i = 0; i != v12; ++i)
          {
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v9, i);
            if (v10)
            {
              v24.length = CFArrayGetCount(v10);
              v24.location = 0;
              if (CFArrayContainsValue(v10, v24, (const void *)(int)ValueAtIndex)) {
                continue;
              }
            }
            uint64_t Property = CPRecordGetProperty((uint64_t)v3, (uint64_t)ValueAtIndex);
            CPRecordSetProperty((uint64_t)v8, (uint64_t)ValueAtIndex, Property);
          }
        }
        CFRelease(v9);
      }
      if (v10) {
        CFRelease(v10);
      }
    }
    CFDictionaryRef v21 = (const __CFDictionary *)v8[5];
    if (v21 && CFDictionaryGetCount(v21) >= 1) {
      _addChangeActions(v8, v5);
    }
    CFArrayRef v3 = v8;
    goto LABEL_32;
  }
  CFDictionaryRef v16 = *(const __CFDictionary **)(a1 + 40);
  if (!v16
    || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v16, key[3])) == 0
    || (uint64_t v18 = Value, !CFDictionaryContainsKey(Value, (const void *)*((int *)v3 + 8))))
  {
    CFDictionaryRef v19 = *(const __CFDictionary **)(a1 + 24);
    if (v19)
    {
      if (CFDictionaryContainsKey(v19, v3)) {
        goto LABEL_32;
      }
      CFDictionaryRef Mutable = *(__CFDictionary **)(a1 + 24);
    }
    else
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
      *(void *)(a1 + 24) = Mutable;
    }
    CFDictionarySetValue(Mutable, v3, (const void *)v5);
    goto LABEL_32;
  }
  CFDictionaryRemoveValue(v18, (const void *)*((int *)v3 + 8));
LABEL_32:
  if (v6 != -1)
  {
    CFDictionaryRef Cache = (__CFDictionary *)CPRecordStoreGetCache(a1, v3[3]);
    if (Cache)
    {
      CFDictionaryAddValue(Cache, v6, v3);
    }
  }
}

void CPRecordStoreAddExistingRecord(uint64_t a1, void **a2)
{
}

void CPRecordStoreRemoveRecordInternal(uint64_t a1, uint64_t a2, void *key, int a4)
{
  int v4 = a4;
  if (a2 && a4 == -1) {
    int v4 = *(_DWORD *)(a2 + 32);
  }
  if (v4 == -1)
  {
    if (!a2) {
      return;
    }
    CFIndex v13 = *(__CFDictionary **)(a1 + 24);
    if (!v13) {
      return;
    }
    goto LABEL_18;
  }
  if (a2 && !key) {
    key = *(void **)(a2 + 24);
  }
  CFDictionaryRef DeletedRecords = (__CFDictionary *)CPRecordStoreGetDeletedRecords(a1, key);
  if (DeletedRecords)
  {
    uint64_t v8 = DeletedRecords;
    char v9 = *(unsigned char *)(a1 + 57);
    pthread_once(&kCPRecordDeleteInfoRegisterClass, (void (*)(void))CPRecordDeleteInfoRegisterClass);
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (Instance)
    {
      CFIndex v11 = (unsigned char *)Instance;
      char v12 = v9 & 1;
      *(void *)(Instance + 16) = 0;
      *(void *)(Instance + 24) = 0;
      if (a2) {
        *(void *)(Instance + 16) = CFRetain((CFTypeRef)a2);
      }
      v11[24] = v12;
      CFDictionarySetValue(v8, (const void *)v4, v11);
      CFRelease(v11);
    }
  }
  if (a2)
  {
    CFIndex v13 = *(__CFDictionary **)(a1 + 32);
    if (v13)
    {
LABEL_18:
      CFDictionaryRemoveValue(v13, (const void *)a2);
    }
  }
}

const void *CPRecordStoreGetDeletedRecords(uint64_t a1, void *key)
{
  CFDictionaryRef Mutable = *(const __CFDictionary **)(a1 + 40);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    *(void *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_disownRecordValue, 0) = Mutable;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    CFDictionaryRef Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, Value);
    CFRelease(Value);
  }
  return Value;
}

void CPRecordStoreRemoveRecord(uint64_t a1, uint64_t a2)
{
  if (a2) {
    CPRecordStoreRemoveRecordInternal(a1, a2, *(void **)(a2 + 24), *(_DWORD *)(a2 + 32));
  }
}

void CPRecordStoreRemoveRecordOfClassWithUID(uint64_t a1, void *key, int a3)
{
}

void *CPRecordIsPendingAdd(void *key)
{
  if (key)
  {
    uint64_t v1 = key;
    uint64_t v2 = key[2];
    if (v2)
    {
      key = *(void **)(v2 + 24);
      if (key) {
        return (void *)(CFDictionaryContainsKey((CFDictionaryRef)key, v1) != 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return key;
}

void *CPRecordIsPendingChange(void *key)
{
  if (key)
  {
    uint64_t v1 = key;
    uint64_t v2 = key[2];
    if (v2)
    {
      key = *(void **)(v2 + 32);
      if (key) {
        return (void *)(CFDictionaryContainsKey((CFDictionaryRef)key, v1) != 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return key;
}

CFDictionaryRef CPRecordIsPendingDelete(const __CFDictionary *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    uint64_t result = (const __CFDictionary *)*((void *)result + 2);
    if (result)
    {
      if (*((void *)result + 5))
      {
        uint64_t result = (const __CFDictionary *)CPRecordStoreGetDeletedRecords((uint64_t)result, *((void **)v1 + 3));
        if (result) {
          return (const __CFDictionary *)(CFDictionaryContainsKey(result, (const void *)*((int *)v1 + 8)) != 0);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CPRecordStoreHasUnsavedChanges(void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)a1[3];
  if (v2 && CFDictionaryGetCount(v2) > 0) {
    return 1;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)a1[4];
  if (v3)
  {
    if (CFDictionaryGetCount(v3) > 0) {
      return 1;
    }
  }
  uint64_t result = a1[5];
  if (result)
  {
    uint64_t context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)_countEntriesInDictionaryValue, &context);
    return context > 0;
  }
  return result;
}

CFIndex _countEntriesInDictionaryValue(int a1, CFDictionaryRef theDict, _DWORD *a3)
{
  CFIndex result = CFDictionaryGetCount(theDict);
  *a3 += result;
  return result;
}

void CPRecordStoreRevert(uint64_t a1)
{
  CFDictionaryRef v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 24) = 0;
  }
  CFDictionaryRef v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 32) = 0;
  }
  int v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_disownRecordValue, 0) = 0;
  }
  uint64_t v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 48) = 0;
  }
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 16);
  if (v6) {
    CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)_revertRecordsForClass, 0);
  }
  *(_DWORD *)(a1 + 96) = -1;
}

void _revertRecordsForClass(int a1, CFDictionaryRef theDict)
{
}

void CPRecordStoreInvalidateCaches(uint64_t a1)
{
  CPRecordStoreRevert(a1);
  CFDictionaryRef v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0;
  }
}

CFDictionaryRef CPRecordStoreCountCachedRecords(uint64_t a1)
{
  uint64_t context = 0;
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)_countCachedRecords, &context);
    return (const __CFDictionary *)context;
  }
  return result;
}

CFIndex _countCachedRecords(int a1, CFDictionaryRef theDict, void *a3)
{
  CFIndex result = CFDictionaryGetCount(theDict);
  *a3 += result;
  return result;
}

uint64_t CPRecordStoreGetChangesForClass(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return CPRecordStoreGetChangesForClassWithProperties(a1, a2, a3, a4, 0, a6, a7, a8, 0);
}

uint64_t CPRecordStoreGetChangesForClassWithProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, 0, 0, a5, 0, 0, &a9);
}

uint64_t _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, __CFString *a8, uint64_t a9, void *a10)
{
  uint64_t v30 = a10;
  signed int v31 = a10 + 1;
  if (!*a10) {
    return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0);
  }
  size_t v17 = 0;
  uint64_t v18 = 0;
  do
  {
    CFDictionaryRef v19 = v31;
    v31 += 2;
    ++v18;
    v17 += 8;
  }
  while (v19[1]);
  long long v20 = (const char **)malloc_type_malloc(v17, 0x10040436913F5uLL);
  CFDictionaryRef v21 = (void **)malloc_type_malloc(v17, 0x80040B8603338uLL);
  CFIndex v22 = v21;
  uint64_t v23 = 0;
  uint64_t v24 = v18;
  do
  {
    v20[v23] = (const char *)*v30;
    int v25 = v30 + 1;
    v30 += 2;
    v21[v23++] = (void *)*v25;
    --v24;
  }
  while (v24);
  uint64_t v26 = _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(a1, a2, a3, a4, a5, a6, a7, a8, a9, v20, v21, v18);
  free(v20);
  free(v22);
  return v26;
}

uint64_t CPRecordStoreGetChangesForClassWithBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, 0, 0, a5, 0, a6, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesForClassWithProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, const __CFString *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, 0, a6, 0, 0, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, a6, a7, 0, 0, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesForClassWithBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, const __CFString *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, 0, a6, 0, a7, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, a6, a7, 0, a8, &a9);
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithBindBlockAndPropertiesA(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, uint64_t a8, const char **a9, uint64_t a10, int a11)
{
  CFDictionaryRef v19 = (void **)malloc_type_calloc(a11, 8uLL, 0x80040B8603338uLL);
  if (v19)
  {
    long long v20 = v19;
    if (a11 >= 1)
    {
      uint64_t v22 = a11;
      uint64_t v23 = v19;
      do
      {
        *v23++ = a10;
        a10 += 8;
        --v22;
      }
      while (v22);
    }
    uint64_t v24 = _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(a1, a2, a3, a4, a5, a6, a7, 0, a8, a9, v19, a11);
    free(v20);
    return v24;
  }
  else
  {
    CFLog();
    return 0xFFFFFFFFLL;
  }
}

uint64_t _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesA(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, __CFString *a8, uint64_t a9, const char **a10, void **a11, int a12)
{
  uint64_t v19 = a12;
  CFDictionaryRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"SELECT ROWID, record, type");
  CFMutableStringRef theString = Mutable;
  if ((*(unsigned char *)(a2 + 56) & 0x10) != 0)
  {
    CFStringAppend(Mutable, @", sequence_number");
    int v21 = 4;
  }
  else
  {
    int v21 = 3;
  }
  int v74 = v21;
  if (a12 < 1)
  {
    uint64_t v23 = 0;
  }
  else
  {
    v65 = a8;
    v66 = a3;
    v67 = a4;
    v68 = a5;
    v69 = a6;
    uint64_t v70 = a1;
    uint64_t v22 = a10;
    uint64_t v23 = (void **)malloc_type_calloc(a12, 0x18uLL, 0x1080040D2F62047uLL);
    uint64_t v24 = 0;
    uint64_t v73 = a2;
    do
    {
      int v25 = (char *)v23;
      uint64_t v26 = v19;
      unint64_t v27 = *(unsigned int *)(a2 + 72);
      if ((int)v27 < 1)
      {
        uint64_t v33 = 0;
      }
      else
      {
        int v28 = *(const char ***)(a2 + 80);
        uint64_t v29 = a10[v24];
        unint64_t v30 = 1;
        signed int v31 = v28;
        do
        {
          uint64_t v32 = *v31;
          v31 += 5;
          if (!strcmp(v32, v29)) {
            uint64_t v33 = v28;
          }
          else {
            uint64_t v33 = 0;
          }
          if (v30 >= v27) {
            break;
          }
          ++v30;
          int v28 = v31;
        }
        while (!v33);
      }
      uint64_t v23 = (void **)v25;
      *(_DWORD *)&v25[24 * v24] = v74 + v24;
      if (((_BYTE)v33[3] & 8) != 0)
      {
        int v37 = 0;
        uint64_t v19 = v26;
        a2 = v73;
      }
      else
      {
        uint64_t v34 = 0;
        uint64_t v35 = typemap;
        uint64_t v19 = v26;
        a2 = v73;
        do
        {
          int v36 = *v35;
          v35 += 2;
          if (v36 == *((_DWORD *)v33 + 2)) {
            break;
          }
          ++v34;
        }
        while (v34 != 7);
        int v37 = typemap[2 * v34 + 1];
      }
      int v38 = &v25[24 * v24];
      *((_DWORD *)v38 + 1) = v37;
      *((void *)v38 + 1) = ChangeLogPropertySetter;
      int v39 = malloc_type_calloc(8uLL, 1uLL, 0xB9982FB0uLL);
      if (((_BYTE)v33[3] & 8) != 0 || (int v40 = *((_DWORD *)v33 + 2) - 2, v40 > 5)) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = (const CFArrayCallBacks *)qword_1E5668EE0[v40];
      }
      *int v39 = CFArrayCreateMutable(0, 0, v41);
      *(void *)&v25[24 * v24++ + 16] = v39;
    }
    while (v24 != v19);
    uint64_t v42 = v19;
    do
    {
      CFStringAppend(theString, @", ");
      uint64_t v43 = *v22++;
      CFStringAppendCString(theString, v43, 0x8000100u);
      --v42;
    }
    while (v42);
    a6 = v69;
    a1 = v70;
    a4 = v67;
    a5 = v68;
    a8 = v65;
    a3 = v66;
  }
  CFStringAppendFormat(theString, 0, @" FROM %sChanges", *(void *)a2);
  if (a7)
  {
    CFStringAppendFormat(theString, 0, @" WHERE ");
    CFStringAppend(theString, a7);
  }
  char v44 = @"ORDER BY ROWID ASC";
  if (a8) {
    char v44 = a8;
  }
  CFStringAppendFormat(theString, 0, @" %@;", v44);
  ReaderConnection = _getReaderConnection(a1);
  v46 = CPSqliteConnectionStatementForSQL(ReaderConnection, theString);
  CFRelease(theString);
  if (!v46 || !*((void *)v46 + 1))
  {
    uint64_t v58 = 0xFFFFFFFFLL;
    goto LABEL_60;
  }
  if (a9) {
    (*(void (**)(uint64_t, const void *))(a9 + 16))(a9, v46);
  }
  CFAllocatorRef v47 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *a3 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  *a4 = CFArrayCreateMutable(v47, 0, 0);
  if (a5) {
    *a5 = CFArrayCreateMutable(v47, 0, 0);
  }
  if (a6) {
    *a6 = CFArrayCreateMutable(v47, 0, 0);
  }
  if (sqlite3_step(*((sqlite3_stmt **)v46 + 1)) == 100)
  {
    v75 = ReaderConnection;
    sqlite3_int64 v48 = *MEMORY[0x1E4F1D260];
    do
    {
      sqlite3_int64 v49 = sqlite3_column_int64(*((sqlite3_stmt **)v46 + 1), 1);
      v50 = *a3;
      int RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(a1, v49);
      CFArrayAppendValue(v50, (const void *)RecordIDForRowid);
      int v52 = sqlite3_column_int(*((sqlite3_stmt **)v46 + 1), 2);
      CFArrayAppendValue(*a4, (const void *)v52);
      if (a6)
      {
        int v53 = sqlite3_column_int(*((sqlite3_stmt **)v46 + 1), 3);
        CFArrayAppendValue(*a6, (const void *)v53);
      }
      sqlite3_int64 v54 = sqlite3_column_int64(*((sqlite3_stmt **)v46 + 1), 0);
      uint64_t v55 = v54;
      if (a5)
      {
        if (v54 == -1)
        {
          uint64_t v57 = *a5;
          sqlite3_int64 v56 = v48;
        }
        else
        {
          sqlite3_int64 v56 = (int)CPRecordStoreGetRecordIDForRowid(a1, v54);
          uint64_t v57 = *a5;
        }
        CFArrayAppendValue(v57, (const void *)v56);
      }
      CPSqliteStatementApplyValuesFromRecordWithNullValue((uint64_t)v46, (uint64_t)v23, v19, 0, v48);
    }
    while (sqlite3_step(*((sqlite3_stmt **)v46 + 1)) == 100);
    if (v55 == -1) {
      uint64_t v58 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v58 = CPRecordStoreGetRecordIDForRowid(a1, v55);
    }
    ReaderConnection = v75;
  }
  else
  {
    uint64_t v58 = 0xFFFFFFFFLL;
  }
  CPSqliteStatementReset((uint64_t)v46);
  CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)ReaderConnection);
  if ((int)v19 >= 1)
  {
    v60 = v23 + 2;
    uint64_t v61 = v19;
    do
    {
      unsigned int v62 = *a11++;
      *unsigned int v62 = **v60;
      uint64_t v63 = *v60;
      v60 += 3;
      free(v63);
      --v61;
    }
    while (v61);
LABEL_60:
    if ((int)v19 >= 1) {
      free(v23);
    }
  }
  return v58;
}

uint64_t CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithOrderAndBindBlockAndProperties(uint64_t a1, uint64_t a2, __CFArray **a3, CFMutableArrayRef *a4, __CFArray **a5, CFMutableArrayRef *a6, const __CFString *a7, __CFString *a8, uint64_t a9, ...)
{
  va_start(va, a9);
  return _CPRecordStoreGetChangesAndChangeIndicesAndSequenceNumbersForClassWithPropertiesV(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t *)va);
}

uint64_t CPRecordStoreDeleteChangesForClassWithIndices(uint64_t a1, void *a2, const __CFArray *a3)
{
  uint64_t result = CPRecordStoreGetDatabase(a1);
  if (result)
  {
    uint64_t v7 = result;
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    CFStringAppendFormat(Mutable, 0, @"DELETE FROM %sChanges", *a2);
    CFStringAppend(Mutable, @" WHERE ROWID IN(");
    CFIndex Count = CFArrayGetCount(a3);
    uint64_t v10 = Count;
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      do
      {
        CFStringAppend(Mutable, @"?");
        if (v11 != 1) {
          CFStringAppend(Mutable, @", ");
        }
        --v11;
      }
      while (v11);
    }
    CFStringAppend(Mutable, @";"));
    char v12 = (CFMutableDictionaryRef *)CPSqliteDatabaseConnectionForWriting(v7);
    CFIndex v13 = (sqlite3_stmt **)CPSqliteConnectionStatementForSQL(v12, Mutable);
    CFRelease(Mutable);
    if (v13 && v13[1])
    {
      if (v10 >= 1)
      {
        CFIndex v14 = 0;
        while (1)
        {
          int ValueAtIndex = CFArrayGetValueAtIndex(a3, v14);
          if (!a1) {
            break;
          }
          if (ValueAtIndex < -1)
          {
            if ((ValueAtIndex & 0x7FFFFFFF) >= *(_DWORD *)(a1 + 104)) {
              break;
            }
            sqlite3_int64 v16 = *(void *)(*(void *)(a1 + 112) + 8 * (ValueAtIndex & 0x7FFFFFFF));
          }
          else
          {
            sqlite3_int64 v16 = ValueAtIndex;
          }
LABEL_16:
          sqlite3_bind_int64(v13[1], ++v14, v16);
          if (v10 == v14) {
            goto LABEL_19;
          }
        }
        sqlite3_int64 v16 = -1;
        goto LABEL_16;
      }
LABEL_19:
      int v17 = CPSqliteStatementPerform((uint64_t)v13);
      CPSqliteStatementReset((uint64_t)v13);
      CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v12);
      return v17 == 101;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToIndexWhereWithBindBlock(uint64_t a1, void *a2, int a3, const __CFString *a4, uint64_t a5)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, a4, 1, 0, a5);
}

sqlite3_stmt *_CPRecordStoreDeleteChangesForClassWhereWithBindBlock(uint64_t a1, void *a2, int a3, const __CFString *a4, int a5, int a6, uint64_t a7)
{
  uint64_t result = (sqlite3_stmt *)CPRecordStoreGetDatabase(a1);
  if (result)
  {
    uint64_t v15 = (uint64_t)result;
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    CFStringAppendFormat(Mutable, 0, @"DELETE FROM %sChanges WHERE ", *a2);
    CFStringRef v17 = @"1";
    if (a6) {
      CFStringRef v17 = @"sequence_number <= ?";
    }
    if (a5) {
      CFStringAppendFormat(Mutable, 0, @"ROWID <= ?");
    }
    else {
      CFStringAppendFormat(Mutable, 0, v17);
    }
    if (a4)
    {
      CFStringAppend(Mutable, @" AND ");
      CFStringAppend(Mutable, a4);
    }
    CFStringAppend(Mutable, @";");
    uint64_t v18 = (CFMutableDictionaryRef *)CPSqliteDatabaseConnectionForWriting(v15);
    uint64_t v19 = CPSqliteConnectionStatementForSQL(v18, Mutable);
    CFRelease(Mutable);
    if (!v19) {
      return 0;
    }
    uint64_t result = (sqlite3_stmt *)*((void *)v19 + 1);
    if (result)
    {
      if (a1)
      {
        if (a3 >= -1)
        {
          sqlite3_int64 v20 = a3;
LABEL_16:
          sqlite3_bind_int64(result, 1, v20);
          if (a7) {
            (*(void (**)(uint64_t, const void *, uint64_t))(a7 + 16))(a7, v19, 2);
          }
          int v21 = CPSqliteStatementPerform((uint64_t)v19);
          CPSqliteStatementReset((uint64_t)v19);
          CPSqliteDatabaseReleaseSqliteConnection((uint64_t *)v18);
          return (sqlite3_stmt *)(v21 == 101);
        }
        if ((a3 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
        {
          sqlite3_int64 v20 = *(void *)(*(void *)(a1 + 112) + 8 * (a3 & 0x7FFFFFFF));
          goto LABEL_16;
        }
      }
      sqlite3_int64 v20 = -1;
      goto LABEL_16;
    }
  }
  return result;
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToIndexWhere(uint64_t a1, void *a2, int a3, const __CFString *a4)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, a4, 1, 0, 0);
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToIndex(uint64_t a1, void *a2, int a3)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, 0, 1, 0, 0);
}

sqlite3_stmt *CPRecordStoreDeleteChangesForClassToSequenceNumberWhere(uint64_t a1, void *a2, int a3, const __CFString *a4)
{
  return _CPRecordStoreDeleteChangesForClassWhereWithBindBlock(a1, a2, a3, a4, 0, 1, 0);
}

void CPRecordStoreInvalidateCachedInstancesOfClassWithBlock(uint64_t a1, const void *a2, uint64_t a3)
{
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v4, a2);
    if (Value)
    {
      if (a3)
      {
        uint64_t v8 = Value;
        CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Value);
        uint64_t v17 = a3;
        CFArrayRef theArray = 0;
        CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_forwardDictionaryEntry, &v17);
        CFRelease(Copy);
        if (theArray)
        {
          CFIndex Count = CFArrayGetCount(theArray);
          if (Count >= 1)
          {
            CFIndex v11 = Count;
            for (CFIndex i = 0; i != v11; ++i)
            {
              int ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
              CFIndex v14 = *(__CFDictionary **)(a1 + 32);
              if (v14) {
                CFDictionaryRemoveValue(v14, ValueAtIndex);
              }
              if (ValueAtIndex) {
                int v15 = ValueAtIndex[8];
              }
              else {
                int v15 = -1;
              }
              CFDictionaryRemoveValue(v8, (const void *)v15);
            }
          }
          CFRelease(theArray);
        }
      }
      else
      {
        sqlite3_int64 v16 = *(__CFDictionary **)(a1 + 16);
        CFDictionaryRemoveValue(v16, a2);
      }
    }
  }
}

void _forwardDictionaryEntry(uint64_t a1, const void *a2, void *a3)
{
  if (a2 && (*(unsigned int (**)(void))(*a3 + 16))())
  {
    CFMutableStringRef Mutable = (__CFArray *)a3[1];
    if (!Mutable)
    {
      CFMutableStringRef Mutable = CFArrayCreateMutable(0, 0, 0);
      a3[1] = Mutable;
    }
    CFArrayAppendValue(Mutable, a2);
  }
}

void CPRecordStoreInvalidateCachedInstancesOfClass(uint64_t a1, const void *a2, void *a3, uint64_t a4)
{
  if (a3)
  {
    CFDictionaryRef v4 = a3;
    a3 = v5;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 0x40000000;
    v5[2] = __CPRecordStoreInvalidateCachedInstancesOfClass_block_invoke;
    v5[3] = &__block_descriptor_tmp_0;
    v5[4] = v4;
    v5[5] = a4;
  }
  CPRecordStoreInvalidateCachedInstancesOfClassWithBlock(a1, a2, (uint64_t)a3);
}

uint64_t __CPRecordStoreInvalidateCachedInstancesOfClass_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 32))(a2, *(void *)(a1 + 40));
}

uint64_t CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return _CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(a1, a2, a3, 0, a4);
}

uint64_t _CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (a3)
  {
    char v9 = "";
    if (a4) {
      char v9 = " WHERE";
    }
    CFStringRef v10 = CFStringCreateWithFormat(v8, 0, @"SELECT %s.ROWID FROM %s%s %@;", *a2, *a2, v9, a3);
  }
  else
  {
    CFStringRef v10 = CFStringCreateWithFormat(v8, 0, @"SELECT ROWID FROM %s;", *a2);
  }
  CFStringRef v11 = v10;
  ReaderConnection = _getReaderConnection(a1);
  if (ReaderConnection)
  {
    CFIndex v13 = (uint64_t *)ReaderConnection;
    CFIndex v14 = CPSqliteConnectionStatementForSQL(ReaderConnection, v11);
    CFRelease(v11);
    if (v14 && v14[1])
    {
      if (a5) {
        (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v14);
      }
      v17[0] = CPRecordStoreGetDeletedRecords(a1, a2);
      v17[1] = a1;
      uint64_t v18 = 0;
      CPSqliteStatementSendResults(v14, (unsigned int (*)(void *, uint64_t))nonDeletedCountHandler, (uint64_t)v17);
      uint64_t v15 = v18;
      CPSqliteStatementReset((uint64_t)v14);
    }
    else
    {
      uint64_t v15 = 0xFFFFFFFFLL;
    }
    CPSqliteDatabaseReleaseSqliteConnection(v13);
  }
  else
  {
    CFRelease(v11);
    return 0xFFFFFFFFLL;
  }
  return v15;
}

uint64_t CPRecordStoreGetCountOfInstancesOfClassWhere(uint64_t a1, void *a2, uint64_t a3)
{
  return _CPRecordStoreGetCountOfInstancesOfClassWithFilterAndBindBlock(a1, a2, a3, 1, 0);
}

CFStringRef CPRecordDescribe(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<CPRecord: %p %s>", a1, **(void **)(a1 + 24));
}

void _createTablesForClassInStore(uint64_t a1, uint64_t a2)
{
}

void _updateModificationDateProperties(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (*(int *)(v1 + 72) >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 8;
    do
    {
      if (*(_DWORD *)(*(void *)(v1 + 80) + v4) == 5)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CPRecordInitializeProperty(a1, v3, (uint64_t)Current);
        CPRecordMarkPropertyChanged(a1, v3);
        uint64_t v1 = *(void *)(a1 + 24);
      }
      ++v3;
      v4 += 40;
    }
    while (v3 < *(int *)(v1 + 72));
  }
}

void *CPRecordStoreWriteColumnsForRecord(uint64_t a1, int *a2, int a3)
{
  uint64_t v5 = *(void *)(a1 + 24);
  if (*(int *)(v5 + 72) < 1)
  {
    int v8 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  do
  {
    uint64_t v9 = *(void *)(v5 + 80) + v6;
    int v10 = *(_DWORD *)(v9 + 24);
    if ((v10 & 4) == 0 && *(_DWORD *)(v9 + 8))
    {
      if (v10)
      {
        if (a3 && (v10 & 0x240) != 0) {
LABEL_12:
        }
          ++v8;
      }
      else
      {
        if (a3) {
          goto LABEL_12;
        }
        CFDictionaryRef v11 = *(const __CFDictionary **)(a1 + 40);
        if (v11)
        {
          if (CFDictionaryGetValueIfPresent(v11, v7, 0)) {
            goto LABEL_12;
          }
        }
      }
    }
    ++v7;
    uint64_t v5 = *(void *)(a1 + 24);
    v6 += 40;
  }
  while ((uint64_t)v7 < *(int *)(v5 + 72));
  if (v8 >= 1)
  {
    char v12 = malloc_type_calloc(1uLL, 24 * v8, 0x1072040C107B9A8uLL);
    uint64_t v5 = *(void *)(a1 + 24);
    goto LABEL_18;
  }
LABEL_17:
  char v12 = 0;
LABEL_18:
  if (*(int *)(v5 + 72) >= 1)
  {
    uint64_t v13 = 0;
    int v14 = 0;
    int v29 = a3;
    do
    {
      uint64_t v15 = *(void *)(v5 + 80);
      uint64_t v16 = v15 + 40 * v13;
      if ((*(_DWORD *)(v16 + 24) & 4) == 0)
      {
        uint64_t v17 = v15 + 40 * v13;
        int v20 = *(_DWORD *)(v17 + 8);
        uint64_t v19 = (int *)(v17 + 8);
        int v18 = v20;
        if (v20)
        {
          if (*(_DWORD *)(v16 + 24))
          {
            if (!a3) {
              goto LABEL_49;
            }
            if ((*(_DWORD *)(v16 + 24) & 0x240) == 0 || v14 >= v8) {
              goto LABEL_49;
            }
            goto LABEL_32;
          }
          if (a3)
          {
            if (v14 < v8) {
              goto LABEL_32;
            }
          }
          else
          {
            CFDictionaryRef v26 = *(const __CFDictionary **)(a1 + 40);
            if (v26 && CFDictionaryGetValueIfPresent(v26, (const void *)v13, 0) && v14 < v8)
            {
              int v18 = *v19;
LABEL_32:
              uint64_t v22 = 0;
              v12[3 * v14] = *(void *)v16;
              uint64_t v23 = typemap;
              do
              {
                int v24 = *v23;
                v23 += 2;
                if (v24 == v18) {
                  break;
                }
                ++v22;
              }
              while (v22 != 7);
              LODWORD(v12[3 * v14 + 1]) = typemap[2 * v22 + 1];
              uint64_t Property = (__CFString *)CPRecordGetProperty(a1, v13);
              if (!Property)
              {
                if ((*(unsigned char *)(v16 + 24) & 0x40) != 0)
                {
                  if (*v19 == 3)
                  {
                    pthread_once(&kCPRecordRegisterClass, (void (*)(void))CPRecordRegisterClass);
                    uint64_t Property = (__CFString *)__CPNotNullDataValue;
                  }
                  else if (*v19 == 2)
                  {
                    uint64_t Property = &stru_1EDF24210;
                  }
                  else
                  {
                    uint64_t Property = 0;
                  }
                }
                else
                {
                  uint64_t Property = 0;
                }
              }
              v12[3 * v14++ + 2] = Property;
              a3 = v29;
            }
          }
        }
      }
LABEL_49:
      ++v13;
      uint64_t v5 = *(void *)(a1 + 24);
    }
    while (v13 < *(int *)(v5 + 72));
  }
  *a2 = v8;
  return v12;
}

void _logRecordEvent(CFMutableDictionaryRef *a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  char v6 = *(unsigned char *)(*(void *)(a2 + 24) + 56);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, @"INSERT INTO %sChanges (ROWID, record, type"), **(void **)(a2 + 24);
  if ((v6 & 0x10) != 0) {
    CFStringAppendFormat(Mutable, 0, @", sequence_number");
  }
  uint64_t v8 = *(void *)(a2 + 24);
  int v9 = *(_DWORD *)(v8 + 72);
  if (v9 < 1)
  {
    int v14 = 0;
    signed int v10 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    signed int v10 = 0;
    CFDictionaryRef v11 = (_DWORD *)(*(void *)(v8 + 80) + 24);
    uint64_t v12 = *(unsigned int *)(v8 + 72);
    do
    {
      if ((*v11 & 8) != 0 || (*v11 & 2) != 0 && *(v11 - 4)) {
        ++v10;
      }
      v11 += 10;
      --v12;
    }
    while (v12);
    if (v10 < 1)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = (CFTypeRef *)malloc_type_calloc(1uLL, 24 * v10, 0x1072040C107B9A8uLL);
      uint64_t v8 = *(void *)(a2 + 24);
      int v9 = *(_DWORD *)(v8 + 72);
    }
    char v38 = v6;
    if (v9 >= 1)
    {
      uint64_t v15 = 0;
      signed int v16 = 0;
      uint64_t v17 = CPRecordGetProperty;
      if (a3 == 2) {
        uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))CPRecordGetOriginalProperty;
      }
      int v40 = v17;
      do
      {
        uint64_t v18 = *(void *)(v8 + 80) + 40 * v15;
        int v19 = *(_DWORD *)(v18 + 8);
        int v20 = *(_DWORD *)(v18 + 24);
        if (v19 && (v20 & 2) != 0 && v16 < v10)
        {
          uint64_t v21 = 0;
          v13[3 * v16] = *(CFTypeRef *)v18;
          uint64_t v22 = typemap;
          do
          {
            int v23 = *v22;
            v22 += 2;
            if (v23 == v19) {
              break;
            }
            ++v21;
          }
          while (v21 != 7);
          LODWORD(v13[3 * v16 + 1]) = typemap[2 * v21 + 1];
          switch(v19)
          {
            case 1:
            case 4:
            case 5:
              LODWORD(v13[3 * v16 + 2]) = v40(a2, v15);
              break;
            case 2:
            case 3:
            case 6:
            case 7:
              int v24 = (const void *)v40(a2, v15);
              v13[3 * v16 + 2] = v24;
              if (v24) {
                CFRetain(v24);
              }
              break;
            default:
              break;
          }
        }
        else
        {
          if ((v20 & 8) == 0 || v16 >= v10) {
            goto LABEL_37;
          }
          int v25 = (char *)&v13[3 * v16];
          *(void *)int v25 = *(void *)v18;
          CFDictionaryRef v26 = v25 + 8;
          if (a3 == 1)
          {
            *CFDictionaryRef v26 = 0;
            if (a4) {
              BOOL v27 = CFDictionaryGetValue(a4, (const void *)v15) != 0;
            }
            else {
              BOOL v27 = 0;
            }
            LODWORD(v13[3 * v16 + 2]) = v27;
          }
          else
          {
            *CFDictionaryRef v26 = 2;
            v13[3 * v16 + 2] = 0;
          }
        }
        ++v16;
LABEL_37:
        ++v15;
        uint64_t v8 = *(void *)(a2 + 24);
      }
      while (v15 < *(int *)(v8 + 72));
    }
    if (v10 < 1)
    {
      int v14 = 0;
      char v6 = v38;
    }
    else
    {
      uint64_t v28 = 0;
      char v6 = v38;
      do
      {
        CFStringAppend(Mutable, @", ");
        CFStringAppendCString(Mutable, (const char *)v13[v28], 0x8000100u);
        v28 += 3;
      }
      while (3 * v10 != v28);
      uint64_t v8 = *(void *)(a2 + 24);
      int v14 = 1;
    }
  }
  CFStringAppendFormat(Mutable, 0, @" VALUES(IFNULL(1 + (SELECT MAX(ROWID) FROM %sChanges), 0), ?, ?"), *(void *)v8);
  if ((v6 & 0x10) != 0) {
    CFStringAppendFormat(Mutable, 0, @", ?");
  }
  if (v14)
  {
    signed int v29 = v10;
    do
    {
      CFStringAppend(Mutable, @", ?");
      --v29;
    }
    while (v29);
  }
  CFStringAppend(Mutable, @";"));
  unint64_t v30 = CPSqliteConnectionStatementForSQL(a1, Mutable);
  if (v30)
  {
    uint64_t v31 = (uint64_t)v30;
    uint64_t v32 = (sqlite3_stmt *)*((void *)v30 + 1);
    if (v32)
    {
      uint64_t v33 = *(void *)(a2 + 16);
      if (v33)
      {
        sqlite3_int64 v34 = *(int *)(a2 + 32);
        if ((int)v34 >= -1)
        {
LABEL_54:
          sqlite3_bind_int64(v32, 1, v34);
          int v35 = 2;
          sqlite3_bind_int(*(sqlite3_stmt **)(v31 + 8), 2, a3);
          if ((v6 & 0x10) != 0)
          {
            int v35 = 3;
            sqlite3_bind_int(*(sqlite3_stmt **)(v31 + 8), 3, *(_DWORD *)(*(void *)(a2 + 16) + 96) + 1);
          }
          CPSqliteStatementBindValuesForColumns(v31, (uint64_t)v13, v10, v35);
          CPSqliteStatementPerform(v31);
          CPSqliteStatementReset(v31);
          goto LABEL_57;
        }
        if ((v34 & 0x7FFFFFFF) < *(_DWORD *)(v33 + 104))
        {
          sqlite3_int64 v34 = *(void *)(*(void *)(v33 + 112) + 8 * (v34 & 0x7FFFFFFF));
          goto LABEL_54;
        }
      }
      sqlite3_int64 v34 = -1;
      goto LABEL_54;
    }
  }
LABEL_57:
  if (v14)
  {
    uint64_t v36 = v10;
    int v37 = v13 + 2;
    do
    {
      switch(*((_DWORD *)v37 - 2))
      {
        case 2:
        case 3:
        case 6:
        case 7:
          if (*v37) {
            CFRelease(*v37);
          }
          break;
        default:
          break;
      }
      v37 += 3;
      --v36;
    }
    while (v36);
  }
  free(v13);
  CFRelease(Mutable);
}

void CPRecordStoreDeleteRecordsInDictionary(uint64_t a1, CFDictionaryRef theDict, void *a3)
{
  a3[2] = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)CPRecordStoreDeleteRecord, a3);
}

void CPRecordStoreDeleteRecord(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *(void *)(a2 + 16);
  if ((*(unsigned char *)(*a3 + 57) & 1) != 0 && (*(unsigned char *)(*(void *)(v5 + 24) + 56) & 2) != 0 && *(unsigned char *)(a2 + 24)) {
    _logRecordEvent((CFMutableDictionaryRef *)a3[1], *(void *)(a2 + 16), 2, 0);
  }
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"DELETE FROM %s WHERE ROWID = ?;",
         *(void *)a3[2]);
  uint64_t v7 = CPSqliteConnectionStatementForSQL((CFMutableDictionaryRef *)a3[1], v6);
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    int v9 = (sqlite3_stmt *)*((void *)v7 + 1);
    if (v9)
    {
      uint64_t v10 = *a3;
      if (*a3)
      {
        if ((int)a1 >= -1)
        {
          sqlite3_int64 v11 = (int)a1;
LABEL_12:
          sqlite3_bind_int64(v9, 1, v11);
          CPSqliteStatementPerform(v8);
          CPSqliteStatementReset(v8);
          goto LABEL_13;
        }
        if ((a1 & 0x7FFFFFFF) < *(_DWORD *)(v10 + 104))
        {
          sqlite3_int64 v11 = *(void *)(*(void *)(v10 + 112) + 8 * (a1 & 0x7FFFFFFF));
          goto LABEL_12;
        }
      }
      sqlite3_int64 v11 = -1;
      goto LABEL_12;
    }
  }
LABEL_13:
  CFRelease(v6);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(a3[2] + 32);
  if (v12) {
    v12(a1, v5, a3[1]);
  }
  if (v5) {
    *(unsigned char *)(v5 + 58) = 0;
  }
  CFDictionaryRef Cache = (__CFDictionary *)CPRecordStoreGetCache(*a3, (void *)a3[2]);
  if (Cache)
  {
    CFDictionaryRemoveValue(Cache, (const void *)(int)a1);
  }
}

void CPRecordStoreSaveRecordIfNotAdded(void *value, uint64_t a2, uint64_t a3)
{
  if (value)
  {
    uint64_t v4 = value[2];
    if (v4)
    {
      CFSetRef v7 = *(const __CFSet **)(v4 + 48);
      if (!v7 || !CFSetContainsValue(v7, value))
      {
        CPRecordStoreSaveRecord((uint64_t)value, a2, a3);
      }
    }
  }
}

void _disownRecordValue(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = 0;
}

void _revertRecord(uint64_t a1, uint64_t a2)
{
}

uint64_t ChangeLogPropertySetter(int a1, CFMutableArrayRef *a2, void *value)
{
  return 1;
}

uint64_t nonDeletedCountHandler(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v3 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), 0);
  int RecordIDForRowid = CPRecordStoreGetRecordIDForRowid(*(void *)(a2 + 8), v3);
  if (!*(void *)a2 || !CFDictionaryContainsKey(*(CFDictionaryRef *)a2, (const void *)RecordIDForRowid)) {
    ++*(_DWORD *)(a2 + 16);
  }
  return 0;
}

uint64_t CPRecordDeleteInfoRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kCPRecordDeleteInfoTypeID = result;
  return result;
}

void CPRecordDeleteInfoDestroy(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 16);
  if (v1) {
    CFRelease(v1);
  }
}

CFStringRef CPRecordDeleteInfoDescribe(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<CPRecordDeleteInfo: %p>", a1);
}

uint64_t decomposePhoneNumber(uint64_t a1, __CFString *a2)
{
  sqlite3_int64 v3 = a2;
  if (!a2) {
    sqlite3_int64 v3 = CPPhoneNumberCopyHomeCountryCode();
  }
  uint64_t v4 = PNDecomposeForCountry();
  if (v3 != a2 && v3) {
    CFRelease(v3);
  }
  return v4;
}

__CFString *CPPhoneNumberCopyHomeCountryCode()
{
  uint64_t result = (__CFString *)copyCountryCode(&__CurrentHomeCountryCode, __CurrentHomeCountryCodeListenerRegistered, @"CPHomeCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberHomeCountryCodeChanged, @"CPHomeCountryCodeChanged.Internal");
  if (!result)
  {
    return CPPhoneNumberCopyActiveCountryCode();
  }
  return result;
}

uint64_t CPPhoneNumberCopyNormalized(const char *a1)
{
  size_t v2 = strlen(a1);
  CFStringRef v3 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)a1, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  uint64_t v4 = CPPhoneNumberCopyHomeCountryCode();
  uint64_t v5 = PNCopyBestGuessNormalizedNumberForCountry();
  CFRelease(v3);
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

uint64_t _phoneNumbersEqual(const char *a1, uint64_t a2, const char *a3)
{
  uint64_t v3 = 0;
  if (a1 && a3)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    size_t v7 = strlen(a1);
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
    CFStringRef v9 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)a1, v7, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    size_t v10 = strlen(a3);
    CFStringRef v11 = CFStringCreateWithBytesNoCopy(v6, (const UInt8 *)a3, v10, 0x8000100u, 0, v8);
    uint64_t v3 = PNPhoneNumbersEqual();
    if (v9) {
      CFRelease(v9);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  return v3;
}

uint64_t CPPhoneNumbersEqualWithCountries(const char *a1, uint64_t a2, const char *a3)
{
  return _phoneNumbersEqual(a1, a2, a3);
}

uint64_t CPPhoneNumbersEqual(const char *a1, const char *a2, uint64_t a3)
{
  return _phoneNumbersEqual(a1, a3, a2);
}

uint64_t CPPhoneNumbersEqualStrict(const char *a1, const char *a2)
{
  uint64_t v4 = CPPhoneNumberCopyHomeCountryCode();
  uint64_t v5 = _phoneNumbersEqual(a1, (uint64_t)v4, a2);
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

char *CPPhoneNumberGetLastFour(const __CFString *a1, char *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFStringRef v29 = a1;
  uint64_t v32 = 0;
  CFIndex v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  uint64_t result = 0;
  unint64_t v30 = CharactersPtr;
  if (!CharactersPtr) {
    uint64_t result = (char *)CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v31 = result;
  CFIndex v34 = 0;
  CFIndex v35 = 0;
  v20[1] = 0;
  if (!Length) {
    goto LABEL_31;
  }
  int v7 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CFIndex v8 = -Length;
  CFIndex v9 = Length + 64;
  *(_OWORD *)buffer = 0u;
  long long v22 = 0u;
  do
  {
    if ((unint64_t)Length >= 5) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = Length;
    }
    if (Length >= 1)
    {
      CFIndex v11 = v33;
      if (v33 >= Length)
      {
        if (v30)
        {
          UniChar v12 = v30[Length - 1 + v32];
        }
        else if (v31)
        {
          UniChar v12 = v31[v32 - 1 + Length];
        }
        else
        {
          if (v35 < Length || (CFIndex v13 = v34, v34 >= Length))
          {
            uint64_t v14 = -v10;
            uint64_t v15 = v10 + v8;
            CFIndex v16 = v9 - v10;
            CFIndex v17 = Length + v14;
            CFIndex v18 = v17 + 64;
            if (v17 + 64 >= v33) {
              CFIndex v18 = v33;
            }
            CFIndex v34 = v17;
            CFIndex v35 = v18;
            if (v33 >= v16) {
              CFIndex v11 = v16;
            }
            v36.length = v11 + v15;
            v36.location = v17 + v32;
            CFStringGetCharacters(v29, v36, buffer);
            CFIndex v13 = v34;
          }
          UniChar v12 = *(_WORD *)&v20[2 * Length + -2 * v13];
        }
        uint64_t result = (char *)v12;
        if ((unsigned __int16)((v12 & 0xFFDF) - 65) > 0x19u)
        {
          if (v12 - 48 > 9) {
            goto LABEL_27;
          }
        }
        else
        {
          uint64_t result = (char *)__toupper(v12);
          UniChar v12 = __KeyMap[(int)result - 65];
        }
        if (v12) {
          v19[3 - v7++] = v12;
        }
      }
    }
LABEL_27:
    if (!--Length) {
      break;
    }
    ++v8;
    --v9;
  }
  while (v7 < 4);
  if (v7 >= 1) {
    return strncpy(a2, &v19[4 - v7], (v7 + 1));
  }
LABEL_31:
  *a2 = 0;
  return result;
}

CFTypeRef CPPhoneNumberCopyActiveCountryCodeNoDefault()
{
  return copyCountryCode(&__CurrentCountryCode, __CurrentCountryCodeListenerRegistered, @"CPActiveCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberActiveCountryCodeChanged, @"CPActiveCountryCodeChanged.Internal");
}

CFTypeRef copyCountryCode(const void **a1, unsigned char *a2, const __CFString *a3, void (__cdecl *a4)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef), const __CFString *a5)
{
  if (a2 && !*a2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, a4, a5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    *a2 = 1;
  }
  pthread_mutex_lock(&__CountryCodeLock);
  CFIndex v11 = *a1;
  UniChar v12 = (const void *)*MEMORY[0x1E4F1D260];
  if (*a1 == (const void *)*MEMORY[0x1E4F1D260]) {
    goto LABEL_10;
  }
  if (v11)
  {
    CFTypeRef v13 = CFRetain(v11);
    goto LABEL_13;
  }
  CFStringRef v14 = CPCopySharedResourcesPreferencesDomainForDomain(@"com.apple.AppSupport");
  if (!v14)
  {
LABEL_10:
    CFTypeRef v13 = 0;
    goto LABEL_13;
  }
  CFStringRef v15 = v14;
  CFPropertyListRef v16 = CFPreferencesCopyValue(a3, v14, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  *a1 = v16;
  if (v16)
  {
    CFTypeRef v13 = CFRetain(v16);
  }
  else
  {
    CFTypeRef v13 = 0;
    *a1 = v12;
  }
  CFRelease(v15);
LABEL_13:
  pthread_mutex_unlock(&__CountryCodeLock);
  return v13;
}

void _CPPhoneNumberActiveCountryCodeChanged()
{
}

__CFString *CPPhoneNumberCopyActiveCountryCode()
{
  CFTypeRef v0 = copyCountryCode(&__CurrentCountryCode, __CurrentCountryCodeListenerRegistered, @"CPActiveCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberActiveCountryCodeChanged, @"CPActiveCountryCodeChanged.Internal");
  if (!v0)
  {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
    if (v1)
    {
      CFLocaleRef v2 = v1;
      CFStringRef Value = (const __CFString *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x1E4F1D1F0]);
      if (Value)
      {
        MutableCFDictionaryRef Copy = CFStringCreateMutableCopy(0, 0, Value);
        CFTypeRef v0 = MutableCopy;
        if (MutableCopy) {
          CFStringLowercase(MutableCopy, v2);
        }
      }
      else
      {
        CFTypeRef v0 = 0;
      }
      CFRelease(v2);
    }
    else
    {
      CFTypeRef v0 = 0;
    }
  }
  if (v0) {
    return (__CFString *)v0;
  }
  else {
    return @"us";
  }
}

CFTypeRef copyHomeCountryCodeNoDefault()
{
  return copyCountryCode(&__CurrentHomeCountryCode, __CurrentHomeCountryCodeListenerRegistered, @"CPHomeCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberHomeCountryCodeChanged, @"CPHomeCountryCodeChanged.Internal");
}

CFTypeRef CPPhoneNumberCopyNetworkCountryCode()
{
  return copyCountryCode(&__CurrentNetworkCountryCode, __CurrentNetworkCountryCodeListenerRegistered, @"CPNetworkCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberNetworkCountryCodeChanged, @"CPNetworkCountryCodeChanged.Internal");
}

void _CPPhoneNumberNetworkCountryCodeChanged()
{
}

CFTypeRef CPPhoneNumberCopyLastKnownNetworkCountryCode()
{
  CFTypeRef result = copyCountryCode(&__CurrentNetworkCountryCode, __CurrentNetworkCountryCodeListenerRegistered, @"CPNetworkCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberNetworkCountryCodeChanged, @"CPNetworkCountryCodeChanged.Internal");
  if (!result)
  {
    return copyCountryCode(&__LastKnownNetworkCountryCode, 0, @"CPLastKnownNetworkCountryCode", 0, 0);
  }
  return result;
}

__CFString *CPPhoneNumberCopyCountryCodeForIncomingNumber()
{
  CFTypeRef result = (__CFString *)copyCountryCode(&__CurrentNetworkCountryCode, __CurrentNetworkCountryCodeListenerRegistered, @"CPNetworkCountryCode", (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_CPPhoneNumberNetworkCountryCodeChanged, @"CPNetworkCountryCodeChanged.Internal");
  if (!result)
  {
    return CPPhoneNumberCopyActiveCountryCode();
  }
  return result;
}

__CFString *CPPhoneNumberCopyCountryCodeForIncomingVoiceCall()
{
  return CPPhoneNumberCopyCountryCodeForIncomingNumber();
}

void CPPhoneNumberSetActiveCountryCode(__CFString *a1)
{
}

void setCountryCode(CFMutableStringRef MutableCopy, uint64_t (*a2)(void), const __CFString *a3, const __CFString *a4, const __CFString *a5, CFTypeRef *a6, void *a7, _DWORD *a8)
{
  if (getuid())
  {
    if (MutableCopy)
    {
      CFIndex Length = CFStringGetLength(MutableCopy);
      MutableCFDictionaryRef Copy = CFStringCreateMutableCopy(0, Length + 1, MutableCopy);
      CFStringLowercase(MutableCopy, 0);
    }
    unint64_t v17 = a2();
    CFIndex v18 = (const void *)v17;
    int v19 = MutableCopy == 0;
    int v20 = MutableCopy != 0;
    if (v17) {
      int v20 = 0;
    }
    else {
      int v19 = 0;
    }
    if (v19 != v20) {
      goto LABEL_10;
    }
    if (!((unint64_t)MutableCopy | v17)) {
      return;
    }
    if (CFStringCompare((CFStringRef)v17, MutableCopy, 0))
    {
LABEL_10:
      pthread_mutex_lock(&__CountryCodeLock);
      CFStringRef v21 = CPCopySharedResourcesPreferencesDomainForDomain(@"com.apple.AppSupport");
      if (v21)
      {
        CFStringRef v22 = v21;
        CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
        CFPreferencesSetValue(a3, MutableCopy, v21, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
        if (a4 && MutableCopy) {
          CFPreferencesSetValue(a4, MutableCopy, v22, @"mobile", v23);
        }
        CFPreferencesSynchronize(v22, @"mobile", v23);
        CFRelease(v22);
      }
      ++*a8;
      if (*a6) {
        CFRelease(*a6);
      }
      *a6 = MutableCopy;
      if (MutableCopy)
      {
        CFRetain(MutableCopy);
        if (a7)
        {
          *a7 = MutableCopy;
          CFRetain(MutableCopy);
        }
      }
      pthread_mutex_unlock(&__CountryCodeLock);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, a5, 0, 0, 1u);
    }
    if (v18) {
      CFRelease(v18);
    }
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
  }
}

void CPPhoneNumberSetHomeCountryCode(__CFString *a1)
{
}

void CPPhoneNumberSetNetworkCountryCode(__CFString *a1)
{
}

const char *CPPhoneNumberCopyCountryCodeForInternationalCallingCode(const char *result)
{
  if (result)
  {
    CFLocaleRef v1 = (const UInt8 *)result;
    size_t v2 = strlen(result);
    CFStringRef v3 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v1, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    uint64_t v4 = _PNCopyCountryCodeForInternationalCode();
    CFRelease(v3);
    return (const char *)v4;
  }
  return result;
}

uint64_t CPPhoneNumberCopyFormattedStringForVoiceCall()
{
  CFTypeRef v0 = CPPhoneNumberCopyCountryCodeForIncomingNumber();
  uint64_t v1 = PNCreateFormattedStringWithCountry();
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  CFTypeRef v0 = CPPhoneNumberCopyActiveCountryCode();
  uint64_t v1 = PNCreateFormattedStringWithCountry();
  CFRelease(v0);
  return v1;
}

void handleCountryChanged(_DWORD *a1, const __CFString *a2, const void **a3, const void **a4, const __CFString *a5)
{
  pthread_mutex_lock(&__CountryCodeLock);
  if (*a1)
  {
    --*a1;
    goto LABEL_3;
  }
  CFIndex v11 = *a3;
  UniChar v12 = (const void **)MEMORY[0x1E4F1D260];
  if (*a3)
  {
    if (v11 != (const void *)*MEMORY[0x1E4F1D260]) {
      CFRelease(v11);
    }
    *a3 = 0;
  }
  if (getuid())
  {
    CFStringRef v13 = CPCopySharedResourcesPreferencesDomainForDomain(@"com.apple.AppSupport");
    if (v13)
    {
      CFStringRef v14 = v13;
      CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
      CFPreferencesSynchronize(v13, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
      *a3 = CFPreferencesCopyValue(a2, v14, @"mobile", v15);
      CFRelease(v14);
    }
  }
  else
  {
    CFPropertyListRef v16 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.AppSupport.plist"];
    if (v16)
    {
      id v17 = (id)[v16 valueForKey:a2];
      *a3 = v17;
      if (!a4) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  id v17 = (id)*a3;
  if (!a4) {
    goto LABEL_19;
  }
LABEL_17:
  if (!v17)
  {
LABEL_20:
    *a3 = *v12;
    goto LABEL_21;
  }
  *a4 = v17;
  CFRetain(v17);
  id v17 = (id)*a3;
LABEL_19:
  if (!v17) {
    goto LABEL_20;
  }
LABEL_21:
  if (a4 && !*a4) {
    *a4 = *v12;
  }
LABEL_3:
  pthread_mutex_unlock(&__CountryCodeLock);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, a5, 0, 0, 1u);
}

void _CPPhoneNumberHomeCountryCodeChanged()
{
}

CFURLRef CPFileBuildDirectoriesToPath(CFStringRef filePath, uint64_t a2)
{
  if (!filePath) {
    return 0;
  }
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, filePath, kCFURLPOSIXPathStyle, 0);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = CPFileBuildDirectoriesToURL(v3, a2);
  CFRelease(v4);
  return v5;
}

CFURLRef CPFileBuildDirectoriesToURL(const __CFURL *a1, uint64_t a2)
{
  if (CPPathUtils_MakePath(a1, a2)) {
    return (CFURLRef)1;
  }
  CFURLRef result = CFURLCreateCopyDeletingLastPathComponent(0, a1);
  if (result)
  {
    CFURLRef v5 = result;
    int v6 = CPFileBuildDirectoriesToURL(result, a2);
    CFRelease(v5);
    if (v6)
    {
      return CPPathUtils_MakePath(a1, a2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL CPDeleteFile(const char *a1)
{
  return unlink(a1) == 0;
}

BOOL CPSecureDeleteFile(const char *a1)
{
  memset(&v12, 0, sizeof(v12));
  if (lstat(a1, &v12) == -1) {
    return 0;
  }
  if ((v12.st_mode & 0xF000) == 0x8000)
  {
    int v2 = open(a1, 1, 0);
    if (v2 < 0)
    {
      if (*__error() != 13) {
        return 0;
      }
      chmod(a1, 0x1FFu);
      int v2 = open(a1, 1, 0);
      if (v2 < 0) {
        return 0;
      }
    }
    int64_t st_blksize = v12.st_blksize;
    off_t st_size = v12.st_size;
    CFURLRef v5 = malloc_type_malloc(v12.st_blksize, 0x58B81F3EuLL);
    if ((__CPRandomizeBuffer_initalized & 1) == 0)
    {
      pid_t v6 = getpid();
      srandom(v6);
      __CPRandomizeBuffer_initalized = 1;
    }
    if (st_blksize)
    {
      int v7 = v5;
      int64_t v8 = st_blksize;
      do
      {
        *v7++ = random();
        --v8;
      }
      while (v8);
    }
    if (st_size >= st_blksize) {
      uint64_t v9 = st_size - st_blksize;
    }
    else {
      uint64_t v9 = 0;
    }
    lseek(v2, 0, 0);
    if (v9 < 1)
    {
      uint64_t v10 = 0;
LABEL_21:
      write(v2, v5, st_size - v10);
    }
    else
    {
      uint64_t v10 = 0;
      while (write(v2, v5, st_blksize) != -1)
      {
        v10 += write(v2, v5, st_blksize);
        if (v10 >= v9) {
          goto LABEL_21;
        }
      }
    }
    lseek(v2, 0, 0);
    free(v5);
    close(v2);
  }
  if ((unlink(a1) & 0x80000000) == 0) {
    return 1;
  }
  if (*__error() == 1)
  {
    chmod(a1, 0x1FFu);
    return unlink(a1) >= 0;
  }
  return 0;
}

FTS *CPDeleteTree(char *a1, int a2)
{
  v8[2] = *(char **)MEMORY[0x1E4F143B8];
  v8[0] = a1;
  v8[1] = 0;
  CFURLRef result = fts_open(v8, 20, 0);
  if (!result) {
    return result;
  }
  CFURLRef v4 = result;
  CFURLRef v5 = fts_read(result);
  if (!v5)
  {
LABEL_14:
    if (fts_close(v4) == -1)
    {
      if (logHandle_onceToken != -1) {
        dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
      }
      if (os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR)) {
        CPDeleteTree_cold_1();
      }
    }
    return (FTS *)1;
  }
  pid_t v6 = v5;
  while (2)
  {
    switch(v6->fts_info)
    {
      case 2u:
      case 4u:
        if (fts_close(v4) != -1) {
          return 0;
        }
        if (logHandle_onceToken != -1) {
          dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
        }
        CFURLRef result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
        if (result) {
          goto LABEL_41;
        }
        return result;
      case 6u:
        rmdir(v6->fts_path);
        goto LABEL_13;
      case 7u:
        if (fts_close(v4) != -1) {
          return 0;
        }
        if (logHandle_onceToken != -1) {
          dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
        }
        CFURLRef result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
        if (result) {
          goto LABEL_41;
        }
        return result;
      case 8u:
      case 0xCu:
      case 0xDu:
        fts_path = v6->fts_path;
        if (a2)
        {
          if (!CPSecureDeleteFile(fts_path))
          {
            if (fts_close(v4) != -1) {
              return 0;
            }
            if (logHandle_onceToken != -1) {
              dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
            }
            CFURLRef result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
            if (result) {
              goto LABEL_41;
            }
            return result;
          }
LABEL_13:
          pid_t v6 = fts_read(v4);
          if (!v6) {
            goto LABEL_14;
          }
          continue;
        }
        if ((unlink(fts_path) & 0x80000000) == 0) {
          goto LABEL_13;
        }
        if (*__error() != 13) {
          goto LABEL_13;
        }
        chmod(v6->fts_path, 0x1FFu);
        if ((unlink(v6->fts_path) & 0x80000000) == 0) {
          goto LABEL_13;
        }
        if (fts_close(v4) != -1) {
          return 0;
        }
        if (logHandle_onceToken != -1) {
          dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
        }
        CFURLRef result = (FTS *)os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR);
        if (result)
        {
LABEL_41:
          CPDeleteTree_cold_1();
          return 0;
        }
        return result;
      default:
        goto LABEL_13;
    }
  }
}

uint64_t CPTemporaryFileWithUniqueName(uint64_t a1, int *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:a1] fileSystemRepresentation];
  int v4 = CPOpenTemporaryFile((uint64_t)v3, v8, 0x400uLL);
  if (v4 == -1) {
    return 0;
  }
  int v5 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v8 isDirectory:0 relativeToURL:0];
  if (a2) {
    *a2 = v5;
  }
  else {
    close(v5);
  }
  return v6;
}

CFURLRef CPPathUtils_MakePath(const __CFURL *a1, mode_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFURLRef result = CFURLCopyAbsoluteURL(a1);
  if (!result) {
    return result;
  }
  int v4 = result;
  CFStringRef v5 = CFURLCopyFileSystemPath(result, kCFURLPOSIXPathStyle);
  if (!v5)
  {
    CFRelease(v4);
    return 0;
  }
  CFStringRef v6 = v5;
  int CString = CFStringGetCString(v5, buffer, 1024, 0x8000100u);
  CFRelease(v6);
  CFRelease(v4);
  if (!CString) {
    return 0;
  }
  memset(&v10, 0, sizeof(v10));
  if (stat(buffer, &v10) != -1) {
    return (CFURLRef)1;
  }
  int v8 = *__error();
  if (v8 != 20 && v8 != 2 || *(unsigned __int16 *)buffer == 47)
  {
    if (logHandle_onceToken != -1) {
      dispatch_once(&logHandle_onceToken, &__block_literal_global_2);
    }
    uint64_t v9 = logHandle_logHandle;
    if (os_log_type_enabled((os_log_t)logHandle_logHandle, OS_LOG_TYPE_ERROR)) {
      CPPathUtils_MakePath_cold_1((uint64_t)buffer, v8, v9);
    }
  }
  return (CFURLRef)(mkdir(buffer, a2) == 0);
}

os_log_t __logHandle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.AppSupport", "CPFileUtilities");
  logHandle_logHandle = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL CPScheduleWakeAtDateWithIdentifier(const __CFDate *a1, const __CFString *a2)
{
  return IOPMSchedulePowerEvent(a1, a2, @"wake") == 0;
}

void CPCancelWakeAtDateWithIdentifier(const __CFDate *a1, CFStringRef my_id)
{
  if (a1)
  {
    IOPMCancelScheduledPowerEvent(a1, my_id, @"wake");
  }
  else if (my_id)
  {
    CFArrayRef v3 = IOPMCopyScheduledPowerEvents();
    if (v3)
    {
      CFArrayRef v4 = v3;
      CFIndex Count = CFArrayGetCount(v3);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0; i != v6; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, i);
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"scheduledby");
          if (Value)
          {
            if (CFEqual(my_id, Value))
            {
              CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"eventtype");
              if (v10)
              {
                if (CFEqual(v10, @"wake"))
                {
                  CFDateRef v11 = (const __CFDate *)CFDictionaryGetValue(ValueAtIndex, @"time");
                  if (v11) {
                    IOPMCancelScheduledPowerEvent(v11, my_id, @"wake");
                  }
                }
              }
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
}

CFIndex __CPPowerAssertionsGetCount()
{
  pthread_mutex_lock(&_IdentifiedPowerAssertionsLock);
  if (_IdentifiedPowerAssertions) {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)_IdentifiedPowerAssertions);
  }
  else {
    CFIndex Count = 0;
  }
  pthread_mutex_unlock(&_IdentifiedPowerAssertionsLock);
  return Count;
}

uint64_t __CPPowerAssertionGetTimeouts(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(&_PowerAssertionsLock);
  CFIndex Count = _PowerAssertions;
  if (_PowerAssertions) {
    CFIndex Count = CFArrayGetCount((CFArrayRef)_PowerAssertions);
  }
  if (Count < a2) {
    a2 = Count;
  }
  if (a2 >= 1)
  {
    CFIndex v5 = 0;
    do
    {
      objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)_PowerAssertions, v5), "timeout");
      *(void *)(a1 + 8 * v5++) = v6;
    }
    while (a2 != v5);
  }
  pthread_mutex_unlock(&_PowerAssertionsLock);
  return a2;
}

uint64_t _CompareAssertionTimeouts(void *a1, void *a2)
{
  [a1 timeout];
  double v4 = v3;
  [a2 timeout];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v5 < v4;
  }
}

uint64_t CPSetPowerAssertionWithIdentifier(int a1, const void *a2)
{
  if (pthread_mutex_lock(&_IdentifiedPowerAssertionsLock)) {
    return 0;
  }
  CFDictionaryRef Mutable = (const __CFDictionary *)_IdentifiedPowerAssertions;
  if (!_IdentifiedPowerAssertions)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    _IdentifiedPowerAssertions = (uint64_t)Mutable;
  }
  int v6 = CFDictionaryContainsKey(Mutable, a2);
  if (!a1 || v6)
  {
    uint64_t v4 = 1;
    if ((a1 & 1) == 0 && v6) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_IdentifiedPowerAssertions, a2);
    }
  }
  else
  {
    int v7 = [[_CPPowerAssertion alloc] initWithIdentifier:a2 timeout:0.0];
    if (v7)
    {
      int v8 = v7;
      CFDictionarySetValue((CFMutableDictionaryRef)_IdentifiedPowerAssertions, a2, v7);
      CFRelease(v8);
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  pthread_mutex_unlock(&_IdentifiedPowerAssertionsLock);
  return v4;
}

uint64_t CPPowerAssertionCreate(uint64_t a1, double a2)
{
  uint64_t v4 = [_CPPowerAssertion alloc];
  return (uint64_t)[(_CPPowerAssertion *)v4 initWithIdentifier:a1 timeout:a2];
}

UInt8 *_CPCreateUTF8StringFromCFString(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0;
  uint64_t v4 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x633AAD5AuLL);
  v7.location = 0;
  v7.length = Length;
  CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v4, MaximumSizeForEncoding, &usedBufLen);
  v4[usedBufLen] = 0;
  return v4;
}

void sub_18FB92300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t _notificationServerWasRestarted(uint64_t a1, void *a2)
{
  return [a2 _notificationServerWasRestarted];
}

uint64_t _CPDNDeliverNotification(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  CFStringRef v10 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  CFDateRef v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
  if (!a5)
  {
    uint64_t v12 = 0;
LABEL_6:
    [CPGetContextForCalloutCurrentMIGServerSource() deliverNotification:v10 userInfo:v12];
    goto LABEL_7;
  }
  uint64_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:0];
  if (!v12) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
LABEL_7:

  return 0;
}

uint64_t _CPDNCheckIn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v7 = +[CPDistributedNotificationCenter centerForServerPort:a1];
  if ((a2 - 1) <= 0xFFFFFFFD) {
    [v7 _receivedCheckIn:a2 auditToken:a3];
  }

  return 0;
}

void *dictionaryWithoutLargestNSData(void *a1, uint64_t *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  objc_opt_class();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [a1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringRef v15 = a2;
    CFPropertyListRef v16 = a3;
    uint64_t v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(a1);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        CFStringRef v13 = objc_msgSend(a1, "objectForKey:", v12, v15, v16);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (unint64_t)[v13 length] >= 0x4000
          && (objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v8 = v12;
          id v9 = v13;
        }
      }
      uint64_t v7 = [a1 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
    if (v8)
    {
      a1 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
      [a1 removeObjectForKey:v8];
    }
    else
    {
      id v9 = 0;
    }
    a2 = v15;
    a3 = v16;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }
  *a2 = v8;
  *a3 = v9;
  return a1;
}

CFDataRef createDataFromVMDeallocateBytes(const UInt8 *a1, void *a2)
{
  v7.version = 0;
  memset(&v7.retain, 0, 40);
  v7.mach_timebase_info info = a2;
  v7.deallocate = (CFAllocatorDeallocateCallBack)vmDeallocateCallback;
  v7.preferredSize = 0;
  CFAllocatorRef v4 = CFAllocatorCreate(0, &v7);
  CFDataRef v5 = CFDataCreateWithBytesNoCopy(0, a1, (CFIndex)a2, v4);
  CFRelease(v4);
  return v5;
}

uint64_t _CPDMMessage(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, UInt8 *a8, unsigned int a9, uint64_t a10)
{
  return processMessage(a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

uint64_t processMessage(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, UInt8 *DataFromVMDeallocateBytes, unsigned int a8, uint64_t a9, unsigned int a10, unsigned int a11)
{
  long long v18 = CPGetContextForCalloutCurrentMIGServerSource();
  long long v19 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
  if ([v18 _isTaskEntitled:a9])
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (DataFromVMDeallocateBytes)
    {
      long long v20 = (void *)[[NSString alloc] initWithBytes:a5 length:a6 encoding:4];
      DataFromVMDeallocateBytes = (UInt8 *)createDataFromVMDeallocateBytes(DataFromVMDeallocateBytes, (void *)a8);
    }
    else
    {
      long long v20 = 0;
    }
    if (a4)
    {
      CFStringRef v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
      if (v20) {
        BOOL v24 = DataFromVMDeallocateBytes == 0;
      }
      else {
        BOOL v24 = 1;
      }
      uint64_t v26 = !v24 || a11 != 0;
      long long v27 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v23 options:v26 format:0 error:0];
    }
    else
    {
      long long v27 = 0;
    }
    v18[84] = a11 != 0;
    uint64_t v31 = 0;
    v18[85] = 0;
    *((_DWORD *)v18 + 2CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = a10;
    if (v19)
    {
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v20 && DataFromVMDeallocateBytes) {
          [v27 setObject:DataFromVMDeallocateBytes forKey:v20];
        }
        if (a11) {
          objc_msgSend(v27, "setObject:forKey:", -[CPDistributedMessagingCenter _initClientWithPort:]([CPDistributedMessagingCenter alloc], "_initClientWithPort:", a11), @"_kCPDistributedMessagingMagicCenterCreationKeyValue");
        }
        [v18 _dispatchMessageNamed:v19 userInfo:v27 reply:&v31 auditToken:a9];
      }
    }

    if (a10 - 1 > 0xFFFFFFFD || v18[85])
    {
      if (v31) {
        NSLog((NSString *)@"%@ ignoring reply dictionary for a one-way or delayed message named %@.", *((void *)v18 + 1), v19);
      }
    }
    else
    {
      [v18 _sendReplyMessage:v31 portPassing:v18[84] onMachPort:a10];
    }

    [v29 drain];
    return 4294966991;
  }
  else
  {
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v18 _requiredEntitlement];
    if (v19)
    {
      NSLog((NSString *)@"%@ ignoring message '%@' from client lacking the '%@' entitlement", v21, v19, v22);
    }
    else
    {
      NSLog((NSString *)@"%@ ignoring message from client lacking the '%@' entitlement", v21, v22);
    }
    return 5;
  }
}

uint64_t _CPDMNonBlockingMessage(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, UInt8 *a8, unsigned int a9, uint64_t a10)
{
  return processMessage(a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, 0);
}

uint64_t _CPDMTwoWayMessage(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, UInt8 *a11, unsigned int a12, void *a13, _DWORD *a14, void *a15, _DWORD *a16, uint64_t a17)
{
  *a13 = 0;
  *a14 = 0;
  *a15 = 0;
  *a16 = 0;
  return processMessage(a3, a4, a5, a6, a9, a10, a11, a12, a17, a2, 0);
}

uint64_t _CPDMTwoWayMessageWithPortPassing(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int a11, UInt8 *a12, unsigned int a13, void *a14, _DWORD *a15, void *a16, _DWORD *a17, uint64_t a18)
{
  *a14 = 0;
  *a15 = 0;
  *a16 = 0;
  *a17 = 0;
  return processMessage(a4, a5, a6, a7, a10, a11, a12, a13, a18, a2, a3);
}

void vmDeallocateCallback()
{
}

uint64_t _NotifyObserver(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 performSelector:a2 withObject:a3];
}

void *_RetainReachabilityContextInfo(void *a1)
{
  id v2 = a1;
  return a1;
}

uint64_t _ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [a3 reachabilityChangedWithFlags:a2];
  return [v5 drain];
}

CPNetworkObserver *_CPNetworkObserverSharedInitialize()
{
  os_log_t result = objc_alloc_init(CPNetworkObserver);
  _CPNetworkObserverShared = (uint64_t)result;
  return result;
}

uint64_t _NetworkReachabilityCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [a3 _networkReachableCallBack:a2];
  return [v5 drain];
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _wifiCallBack:a2];
}

BOOL _WiFiIsSettingEnabled(const __SCPreferences *a1)
{
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"AllowEnable");
  if (Value && (CFTypeID TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(Value))) {
    BOOL v4 = CFBooleanGetValue(Value) != 0;
  }
  else {
    BOOL v4 = *MEMORY[0x1E4F1CFD0] == (void)Value;
  }
  SCPreferencesSynchronize(a1);
  return v4;
}

uint64_t CPAggregateDictionaryAddValueForScalarKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[CPAggregateDictionary sharedAggregateDictionary];
  return [v4 addValue:a2 forKey:a1];
}

CPAggregateDictionary *initializeAggregateDictionary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  size_t v3 = 8;
  os_log_t result = (CPAggregateDictionary *)sysctlbyname("hw.model", &v4, &v3, 0, 0);
  if (v4 != 14414 || v5 != 50)
  {
    os_log_t result = (CPAggregateDictionary *)dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
    if (result)
    {
      id v2 = result;
      __ADClientCommit = (uint64_t (*)(void))dlsym(result, "ADClientCommit");
      __ADClientSignificantTimeChanged = (uint64_t (*)(void))dlsym(v2, "ADClientSignificantTimeChanged");
      __ADClientClearScalarKey = (uint64_t (*)(void))dlsym(v2, "ADClientClearScalarKey");
      __ADClientSetValueForScalarKey = (uint64_t (*)(void, void))dlsym(v2, "ADClientSetValueForScalarKey");
      __ADClientAddValueForScalarKey = (uint64_t (*)(void, void))dlsym(v2, "ADClientAddValueForScalarKey");
      __ADClientClearDistributionKey = (uint64_t (*)(void))dlsym(v2, "ADClientClearDistributionKey");
      __ADClientSetValueForDistributionKey = (uint64_t (*)(void, double))dlsym(v2, "ADClientSetValueForDistributionKey");
      __ADClientPushValueForDistributionKey = (uint64_t (*)(void, double))dlsym(v2, "ADClientPushValueForDistributionKey");
      os_log_t result = objc_alloc_init(CPAggregateDictionary);
      __aggregateDictionary = (uint64_t)result;
    }
  }
  return result;
}

void sub_18FB980BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPSqliteDatabaseRegisterMatchesSearchStringFunction(uint64_t a1, const char *a2)
{
  return CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(a1, a2, 5);
}

uint64_t CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(uint64_t a1, const char *a2, int a3)
{
  if (!a1) {
    return 1;
  }
  CPSqliteDatabaseConnectionForWriting(a1);
  uint64_t v6 = *(void **)(*(void *)(a1 + 8) + 32);
  if (!v6) {
    uint64_t v6 = malloc_type_calloc(1uLL, 0x10uLL, 0xD0040D45F9286uLL);
  }
  CFAllocatorContext v7 = CPSqliteMatchesSearchString;
  if (a3 == 6) {
    CFAllocatorContext v7 = CPSqliteMatchesSearchStringByWord;
  }
  if (a3 == 4) {
    uint64_t v8 = (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))CPSqliteMatchesSearchStringExactly;
  }
  else {
    uint64_t v8 = (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))v7;
  }
  uint64_t v9 = CPSqliteDatabaseRegisterFunction(a1, a2, v8, 2, v6);
  uint64_t v10 = *(void *)(a1 + 8);
  if (v9)
  {
    if (!*(void *)(v10 + 32)) {
      free(v6);
    }
  }
  else
  {
    *(void *)(v10 + 32) = v6;
    *(void *)(v10 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = SearchStringCacheDestroy;
  }
  return v9;
}

uint64_t CPSqliteDatabaseRegisterMatchesSearchStringByWordFunction(uint64_t a1, const char *a2)
{
  return CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(a1, a2, 6);
}

uint64_t CPSqliteDatabaseRegisterMatchesExactSearchStringFunction(uint64_t a1, const char *a2)
{
  return CPSqliteDatabaseRegisterMatchesSearchStringFunctionWithMatchType(a1, a2, 4);
}

void CPSqliteMatchesSearchStringExactly(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
}

void CPSqliteMatchesSearchStringByWord(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
}

void CPSqliteMatchesSearchString(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
}

void SearchStringCacheDestroy(id *a1)
{
  if (a1)
  {
    id v2 = *a1;
    if (v2) {
      free(v2);
    }

    free(a1);
  }
}

void CPSqliteMatchesSearchStringWithMatchType(sqlite3_context *a1, int a2, sqlite3_value **a3, uint64_t a4)
{
  if (a2 == 2)
  {
    CFAllocatorContext v7 = sqlite3_value_text(*a3);
    uint64_t v8 = sqlite3_user_data(a1);
    uint64_t v9 = *(char **)v8;
    if (*(void *)v8)
    {
      if (!strcmp((const char *)v7, v9))
      {
LABEL_6:
        CFDateRef v11 = sqlite3_value_text(a3[1]);
        if (v11) {
          int v12 = [*((id *)v8 + 1) matchesUTF8String:v11 matchType:a4 matchOptions:a4 != 6];
        }
        else {
          int v12 = 0;
        }
        sqlite3_result_int(a1, v12);
        return;
      }
      free(v9);
    }
    *(void *)uint64_t v8 = strdup((const char *)v7);
    uint64_t v10 = (void *)[[NSString alloc] initWithUTF8String:v7];
    *((void *)v8 + 1) = [[CPSearchMatcher alloc] initWithSearchString:v10];

    goto LABEL_6;
  }
  sqlite3_result_error(a1, "CPSqliteMatchesSearchString: wrong number of arguments", -1);
}

uint64_t matche(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 a3, uint64_t a4, void *a5, void *a6)
{
  unsigned __int8 v7 = a3;
  unint64_t v8 = (unint64_t)a2;
  uint64_t v9 = a1;
  int v168 = 0;
  uint64_t v167 = 0;
  LODWORD(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = *a1;
  if (!*a1)
  {
    int v155 = 0;
    v166 = 0;
    LOWORD(v16) = 0;
    LOWORD(v17) = 0;
    long long v18 = a2;
    goto LABEL_402;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  int v155 = 0;
  int v164 = 0;
  int v165 = 0;
  uint64_t v157 = 0;
  uint64_t v13 = 0;
  v160 = 0;
  v151 = 0;
  v166 = 0;
  CFStringRef v14 = 0;
  CFStringRef v15 = 0;
  LOWORD(v16) = 0;
  LOWORD(v17) = 0;
  long long v18 = a2;
  v154 = a5;
  while (1)
  {
    unint64_t v19 = *v18;
    if (!*v18) {
      goto LABEL_395;
    }
    uint64_t v158 = v13;
    char v20 = v10 - 34;
    BOOL v21 = (v10 - 34) < 0x3Fu;
    if (*(unsigned char *)(v8 + v12))
    {
      ++v12;
    }
    else
    {
      if (v11 > 2 * v12) {
        return 0;
      }
      ++v11;
    }
    uint64_t v161 = v12;
    uint64_t v162 = v11;
    if (v10 == 92)
    {
      ++v157;
      uint64_t v22 = v9 + 1;
      LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v9[1];
      v151 = v9;
    }
    else if (v10 == 42)
    {
      uint64_t v22 = v9 + 1;
      while (v10 == 42)
      {
        char v23 = *v22++;
        LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v23;
      }
      if (!(_BYTE)v10)
      {
        if (v19 < 0xC0)
        {
          if (!a5) {
            return 1;
          }
          goto LABEL_380;
        }
        unint64_t v107 = utf8_byte_length_noerror_utf8_len_table[v19 >> 4];
        v169[0] = v16;
        int v108 = utf8_decodestr(v18, v107, v169, &v167, 2, &v168, 0);
        LOWORD(v16) = v169[0];
        if (v108)
        {
          uint64_t v9 = v22 - 1;
          int v155 = 1;
          goto LABEL_395;
        }
        if (v169[0] - 12441 >= 2)
        {
          BOOL v110 = (v7 & 2) != 0 || v169[0] - 768 >= 0x70;
          int v111 = !v110;
          uint64_t result = v111 ^ 1u;
          if (!v110 || !a5) {
            return result;
          }
LABEL_380:
          v109 = v166;
          *a5 = &v166[-v8];
LABEL_489:
          *a6 = v18 - v109;
          return 1;
        }
        return 0;
      }
      if (v10 == 92)
      {
        if (*v22 != v19)
        {
          uint64_t v158 = 0;
          LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 92;
          v160 = --v22;
          goto LABEL_32;
        }
        LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = *v18;
      }
      else
      {
        uint64_t v158 = 0;
        v160 = --v22;
      }
    }
    else
    {
      uint64_t v22 = v9;
    }
    if (v10 >= 0xC0u)
    {
      if ((v10 + 29) < 0xCu)
      {
        int v165 = 1;
LABEL_30:
        CFStringRef v15 = v22;
        goto LABEL_37;
      }
      if (v10 == 239)
      {
        if (v22[1] < 0xACu)
        {
          int v165 = 1;
          LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = -17;
          goto LABEL_30;
        }
      }
      else if (v10 == 226 && v22[1] > 0xB9u)
      {
        int v165 = 1;
        LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = -30;
        goto LABEL_30;
      }
      int v165 = 0;
      goto LABEL_30;
    }
LABEL_32:
    if ((v10 & 0x80u) == 0) {
      CFStringRef v15 = 0;
    }
    int v24 = v165;
    if ((v10 & 0x80u) == 0) {
      int v24 = 0;
    }
    int v165 = v24;
LABEL_37:
    if (v19 >= 0xC0)
    {
      if ((v19 + 29) < 0xCu)
      {
LABEL_39:
        int v164 = 1;
LABEL_51:
        CFStringRef v14 = v18;
        goto LABEL_52;
      }
      if (v19 == 239)
      {
        if (v18[1] < 0xACu) {
          goto LABEL_39;
        }
      }
      else if (v19 == 226 && v18[1] > 0xB9u)
      {
        goto LABEL_39;
      }
      int v164 = 0;
      goto LABEL_51;
    }
    if ((v19 & 0x80u) == 0) {
      CFStringRef v14 = 0;
    }
    int v25 = v164;
    if ((v19 & 0x80u) == 0) {
      int v25 = 0;
    }
    int v164 = v25;
LABEL_52:
    if (v19 != v10) {
      break;
    }
    LOWORD(v17) = 0;
    LOWORD(v16) = 0;
    LODWORD(v26) = 0;
    long long v27 = v166;
    if (v166) {
      BOOL v28 = 1;
    }
    else {
      BOOL v28 = a5 == 0;
    }
    if (!v28) {
      long long v27 = v18;
    }
    v166 = v27;
    uint64_t v13 = 1;
LABEL_147:
    uint64_t v10 = &v14[(int)v26] - v18;
    if (v26) {
      CFStringRef v14 = 0;
    }
    else {
      uint64_t v10 = 1;
    }
    if (v13 && v160 && !v22[v13])
    {
      uint64_t v54 = v18[v10];
      if ((v7 & 4) != 0)
      {
        if ((v54 & 0x80) == 0 && separator_map[v54]) {
          goto LABEL_288;
        }
      }
      else if (v54 <= 1)
      {
        goto LABEL_288;
      }
      uint64_t v13 = 0;
      uint64_t v157 = 0;
      uint64_t v22 = v160;
    }
LABEL_288:
    uint64_t v9 = &v22[v13];
    v18 += v10;
    LOBYTE(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v22[v13];
    uint64_t v12 = v161;
    uint64_t v11 = v162;
    if (!(_BYTE)v10) {
      goto LABEL_395;
    }
  }
  unsigned int v17 = 0;
  unsigned int v16 = 0u;
  unint64_t v159 = 0;
  LODWORD(v26) = 0;
  int v29 = v21 & (0x4000000000000021uLL >> v20);
  BOOL v30 = ((unint64_t)v15 | (unint64_t)v14) == 0;
  if ((unint64_t)v15 | (unint64_t)v14) {
    int v29 = 1;
  }
  int v31 = v29 ^ 1;
  if (v165) {
    int v31 = 1;
  }
  if (v164) {
    int v32 = 0;
  }
  else {
    int v32 = v7 & (v165 == 0);
  }
  v153 = v22 + 1;
  if (v164) {
    int v33 = 1;
  }
  else {
    int v33 = v31;
  }
  v163 = v15;
  while (2)
  {
    if (v32)
    {
      if (v30)
      {
        int v34 = tolower_map[*v22];
        uint64_t v35 = *v18;
        if (v34 == tolower_map[v35]) {
          goto LABEL_138;
        }
        if (v22 == v160 && v35 >= 2)
        {
          CFRange v36 = v18 + 1;
          while (((char)*v36 & 0x80000000) == 0)
          {
            uint64_t v37 = *v36;
            if (v37 < 2)
            {
              CFStringRef v15 = 0;
              CFStringRef v14 = 0;
              unint64_t v8 = (unint64_t)a2;
              unsigned __int8 v7 = a3;
              a5 = v154;
LABEL_132:
              uint64_t v13 = v158;
              goto LABEL_133;
            }
            ++v36;
            if (v34 == tolower_map[v37])
            {
              long long v18 = v36 - 1;
              uint64_t v22 = v160;
              goto LABEL_138;
            }
          }
          long long v18 = v36;
        }
        goto LABEL_102;
      }
      if (v17)
      {
LABEL_83:
        if (!v16) {
          goto LABEL_84;
        }
      }
      else
      {
        if (v15)
        {
          unint64_t v38 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v15 >> 4];
          v169[0] = 0;
          unint64_t v159 = v38;
          int v39 = utf8_decodestr(v15, v38, v169, &v167, 2, &v168, 0);
          unsigned int v17 = v169[0];
          if (v39) {
            goto LABEL_393;
          }
          goto LABEL_83;
        }
        unsigned int v17 = *v22;
        if (!v16)
        {
LABEL_84:
          if (v14)
          {
            unint64_t v26 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v14 >> 4];
            v169[0] = 0;
            int v40 = utf8_decodestr(v14, v26, v169, &v167, 2, &v168, 0);
            unsigned int v16 = v169[0];
            if (v40)
            {
LABEL_393:
              int v155 = 1;
              goto LABEL_394;
            }
          }
          else
          {
            unsigned int v16 = *v18;
          }
        }
      }
      int v41 = map_case((unsigned __int16)v16);
      if (v17 == v41) {
        goto LABEL_330;
      }
      int v42 = v41;
      int v43 = map_case((unsigned __int16)v17);
      if (v43 == v42) {
        goto LABEL_330;
      }
      CFStringRef v15 = v163;
      if (v16 == v43) {
        goto LABEL_138;
      }
      if (v17 == 223)
      {
        if (v16 != 115)
        {
LABEL_98:
          unsigned int v17 = 223;
          goto LABEL_102;
        }
        if (v18[1] != 115)
        {
          unsigned int v16 = 0x73u;
          goto LABEL_98;
        }
        ++v18;
        LOWORD(v16) = 115;
        LOWORD(v17) = 223;
      }
      else
      {
        if (v17 != 115) {
          goto LABEL_102;
        }
        if (v16 != 223) {
          goto LABEL_102;
        }
        unsigned int v17 = 115;
        if (*v153 != 115) {
          goto LABEL_102;
        }
        ++v22;
      }
LABEL_138:
      unint64_t v8 = (unint64_t)a2;
      unsigned __int8 v7 = a3;
      a5 = v154;
      goto LABEL_139;
    }
LABEL_102:
    if (v33)
    {
      if (v160)
      {
        uint64_t v13 = 0;
        unint64_t v8 = (unint64_t)a2;
        int64_t v55 = &v160[v157] - v22;
        if (v22 <= v160) {
          int64_t v55 = 0;
        }
        v18 += v55;
        uint64_t v22 = v160;
        uint64_t v157 = 0;
        unsigned __int8 v7 = a3;
        a5 = v154;
        goto LABEL_147;
      }
      a5 = v154;
      uint64_t v57 = v166;
      if (v154) {
        uint64_t v57 = 0;
      }
      v166 = v57;
      unint64_t v8 = (unint64_t)a2;
      unsigned __int8 v7 = a3;
      if ((a3 & 4) == 0) {
        goto LABEL_494;
      }
LABEL_178:
      if ((v7 & 8) == 0)
      {
        if (*a1 - 48 < 0xA && *v18 - 48 <= 9)
        {
          uint64_t i = v18;
          do
          {
            unsigned int v60 = *++i;
            unsigned int v59 = v60;
          }
          while (v60 - 48 < 0xA);
          int v61 = 0;
          goto LABEL_260;
        }
        unsigned int v62 = -1;
        for (uint64_t i = v18; ; i += v67)
        {
          unint64_t v63 = *i;
          unsigned int v64 = *i;
          if ((char)*i < 0)
          {
            if (v64 != 239)
            {
              if (v64 == 227 && i[1] == 128 && i[2] == 128)
              {
                int v61 = 0;
                goto LABEL_259;
              }
LABEL_210:
              i += utf8_byte_length_noerror_utf8_len_table[v63 >> 4];
              int v61 = 1;
              goto LABEL_259;
            }
            int v68 = i[1];
            if (v68 != 188 && (v68 != 189 || i[2] > 0x9Fu)) {
              goto LABEL_210;
            }
            v169[0] = v16;
            int v69 = utf8_decodestr(i, 3uLL, v169, &v167, 2, &v168, 0);
            LOWORD(v16) = v169[0];
            if (v69)
            {
              int v61 = 0;
              int v155 = 1;
LABEL_259:
              unsigned int v59 = *i;
              a5 = v154;
LABEL_260:
              if (v59 < 2 || v61 != 0)
              {
                CFStringRef v15 = 0;
                CFStringRef v14 = 0;
                uint64_t v13 = 0;
                uint64_t v10 = 0;
                uint64_t v22 = a1;
                long long v18 = i;
                goto LABEL_288;
              }
              if (v59 == 227)
              {
                CFStringRef v15 = 0;
                CFStringRef v14 = 0;
                uint64_t v13 = 0;
                uint64_t v10 = 0;
                long long v18 = i + 3;
                uint64_t v22 = a1;
                goto LABEL_288;
              }
              int v86 = *a1;
              if (v59 == v86 && v86 != 92) {
                goto LABEL_276;
              }
              if (v86 == 92)
              {
                if (v59 != a1[1])
                {
                  CFStringRef v15 = 0;
                  CFStringRef v14 = 0;
                  uint64_t v13 = 0;
                  uint64_t v22 = a1;
                  long long v18 = i;
                  goto LABEL_287;
                }
LABEL_276:
                unsigned int v87 = (v22 - (v157 + a1)) & ~(((int)v22 - ((int)v157 + (int)a1)) >> 31);
                if (v87 >= 2) {
                  long long v18 = &i[-v87 + 1];
                }
                else {
                  long long v18 = i;
                }
                CFStringRef v15 = 0;
                CFStringRef v14 = 0;
                uint64_t v10 = 0;
                uint64_t v22 = a1;
                uint64_t v13 = 0;
              }
              else
              {
                CFStringRef v15 = 0;
                if (i != v18 && (char)v86 < 0) {
                  goto LABEL_276;
                }
                uint64_t v22 = a1;
                long long v18 = i;
                CFStringRef v14 = 0;
                uint64_t v13 = 0;
LABEL_287:
                uint64_t v10 = 1;
              }
              goto LABEL_288;
            }
            unsigned int v16 = v169[0] - 65248;
            if (((LOBYTE(v169[0]) + 32) & 0x80) != 0)
            {
              uint64_t v67 = 3;
            }
            else
            {
              if (separator_map[(LOBYTE(v169[0]) + 32)]) {
                goto LABEL_205;
              }
              uint64_t v67 = 3;
            }
          }
          else
          {
            int v65 = separator_map[v63];
            if (v64 < 2 || v65 != 0)
            {
LABEL_205:
              int v61 = 0;
              goto LABEL_259;
            }
            unsigned int v16 = *i;
            uint64_t v67 = 1;
          }
          unsigned int v70 = v16 - 97;
          if (v62 <= 1 && v70 > 0x19)
          {
            int v61 = 1;
            goto LABEL_259;
          }
          unsigned int v62 = v70 < 0x1A;
        }
      }
      goto LABEL_494;
    }
    if (v17)
    {
      unsigned int v44 = v17;
      if (!v16) {
        goto LABEL_111;
      }
    }
    else if (v15)
    {
      unint64_t v45 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v15 >> 4];
      v169[0] = 0;
      unint64_t v159 = v45;
      int v46 = utf8_decodestr(v15, v45, v169, &v167, 2, &v168, 0);
      unsigned int v44 = v169[0];
      if (v46) {
        goto LABEL_381;
      }
      CFStringRef v15 = v163;
      if (!v16) {
        goto LABEL_111;
      }
    }
    else
    {
      unsigned int v44 = *v22;
      if (!v16)
      {
LABEL_111:
        if (v14)
        {
          unint64_t v26 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v14 >> 4];
          v169[0] = 0;
          int v47 = utf8_decodestr(v14, v26, v169, &v167, 2, &v168, 0);
          unsigned int v16 = v169[0];
          if (v47)
          {
LABEL_381:
            int v155 = 1;
            LOWORD(v17) = v44;
LABEL_394:
            uint64_t v9 = v22;
            unint64_t v8 = (unint64_t)a2;
            unsigned __int8 v7 = a3;
            a5 = v154;
            goto LABEL_395;
          }
          CFStringRef v15 = v163;
        }
        else
        {
          unsigned int v16 = *v18;
        }
      }
    }
    unsigned int v48 = v44 - 65281;
    if (v44 == 12288) {
      int v49 = 32;
    }
    else {
      int v49 = v44;
    }
    if (v48 >= 0x5E) {
      unsigned int v17 = v49;
    }
    else {
      unsigned int v17 = v44 - 65248;
    }
    if (v16 - 65281 <= 0x5D)
    {
      int v50 = v16 - 65248;
LABEL_129:
      unsigned int v16 = v50;
      if (v17 != v50) {
        continue;
      }
      LOWORD(v16) = v17;
      goto LABEL_138;
    }
    break;
  }
  if (v16 == 12288) {
    int v50 = 32;
  }
  else {
    int v50 = v16;
  }
  if (v16 == 12288 || v44 == 12288 || v48 <= 0x5D) {
    goto LABEL_129;
  }
  if ((v17 | 0x20) == 0xF8)
  {
    unint64_t v8 = (unint64_t)a2;
    unsigned __int8 v7 = a3;
    a5 = v154;
    if ((v16 & 0xFFFFFFDF) == 0x4F)
    {
      if (a3)
      {
        if (v17 == 216) {
          unsigned int v17 = 248;
        }
        unsigned int v16 = tolower_map[v16];
      }
      int v56 = v18[1];
      if (v56 == 101 || v56 == 204 && v18[2] == 136)
      {
        if (v56 == 101) {
          ++v18;
        }
        goto LABEL_139;
      }
    }
  }
  else
  {
    unint64_t v8 = (unint64_t)a2;
    unsigned __int8 v7 = a3;
    a5 = v154;
  }
  if ((v16 | 0x20) == 0xF8 && (v17 & 0xFFFFFFDF) == 0x4F)
  {
    if (v7)
    {
      if (v16 == 216) {
        unsigned int v16 = 248;
      }
      unsigned int v17 = tolower_map[v17];
    }
    int v71 = *v153;
    if (v71 == 101 || v71 == 204 && v22[2] == 136)
    {
      if (v71 == 101) {
        ++v22;
      }
      goto LABEL_139;
    }
  }
  uint64_t v72 = 0;
  uint64_t v73 = v18 + 1;
  int v74 = v18 + 2;
  while (2)
  {
    int v75 = (unsigned __int16)ligatures[v72];
    if (v17 != v75) {
      goto LABEL_241;
    }
    uint64_t v76 = LOBYTE(ligatures[v72 + 1]);
    if ((v7 & 1) == 0)
    {
      if (v16 == v76)
      {
        int v79 = *v73;
        if (v79 == HIBYTE(ligatures[v72 + 1])) {
          goto LABEL_273;
        }
        if (v79 == 204 && LOBYTE(ligatures[v72 + 2]) && *v74 == 136) {
          goto LABEL_291;
        }
      }
LABEL_241:
      if (v16 != v75) {
        goto LABEL_254;
      }
      LODWORD(v76) = LOBYTE(ligatures[v72 + 1]);
      if (v7)
      {
LABEL_243:
        if (v17 != v76 && tolower_map[v17] != tolower_map[v76]) {
          goto LABEL_254;
        }
        uint64_t v80 = *v153;
        uint64_t v81 = HIBYTE(ligatures[v72 + 1]);
        if (v80 == v81 || tolower_map[v80] == tolower_map[v81])
        {
LABEL_272:
          ++v22;
          goto LABEL_139;
        }
        if (v80 != 204) {
          goto LABEL_254;
        }
        v82 = &ligatures[v72];
      }
      else
      {
        if (v17 != v76) {
          goto LABEL_254;
        }
        int v83 = *v153;
        v82 = &ligatures[v72];
        if (v83 == HIBYTE(ligatures[v72 + 1])) {
          goto LABEL_272;
        }
        if (v83 != 204) {
          goto LABEL_254;
        }
      }
      if (*((unsigned char *)v82 + 4) && v22[2] == 136)
      {
        v22 += 2;
        goto LABEL_139;
      }
      goto LABEL_254;
    }
    if (v16 == v76 || tolower_map[v16] == tolower_map[v76])
    {
      uint64_t v77 = *v73;
      uint64_t v78 = HIBYTE(ligatures[v72 + 1]);
      if (v77 == v78 || tolower_map[v77] == tolower_map[v78])
      {
LABEL_273:
        ++v18;
        goto LABEL_139;
      }
      if (v77 == 204 && LOBYTE(ligatures[v72 + 2]) && *v74 == 136)
      {
LABEL_291:
        v18 += 2;
        goto LABEL_139;
      }
    }
    if (v16 == v17) {
      goto LABEL_243;
    }
LABEL_254:
    v72 += 3;
    if (v72 != 18) {
      continue;
    }
    break;
  }
  if ((v7 & 2) == 0) {
    goto LABEL_132;
  }
  uint64_t v13 = v158;
  if (v17 != 778)
  {
    if (v16 == 778)
    {
      unsigned int v84 = v17 & 0xFFFFFFDF;
      goto LABEL_284;
    }
    if (v17 - 8220 <= 0x17 && ((1 << (v17 - 28)) & 0x80000B) != 0)
    {
      if (v16 != 34) {
        goto LABEL_133;
      }
LABEL_139:
      int v52 = v166;
      if (v166) {
        BOOL v53 = 1;
      }
      else {
        BOOL v53 = a5 == 0;
      }
      if (!v53) {
        int v52 = v18;
      }
      v166 = v52;
      if (v159) {
        uint64_t v13 = &v15[v159] - v22;
      }
      else {
        uint64_t v13 = 1;
      }
      goto LABEL_147;
    }
    BOOL v91 = v17 == 8219 || v17 >> 1 == 4108 || v17 == 8242 || v17 == 96;
    if (v16 == 39 && v91)
    {
      LOWORD(v16) = 39;
      goto LABEL_139;
    }
    if (v16 - 8220 <= 0x17 && ((1 << (v16 - 28)) & 0x80000B) != 0)
    {
      if (v17 != 34) {
        goto LABEL_133;
      }
      goto LABEL_139;
    }
    BOOL v95 = v16 == 8219 || v16 >> 1 == 4108 || v16 == 8242 || v16 == 96;
    if (v17 == 39 && v95)
    {
      LOWORD(v17) = 39;
LABEL_330:
      unint64_t v8 = (unint64_t)a2;
      unsigned __int8 v7 = a3;
      a5 = v154;
      CFStringRef v15 = v163;
      goto LABEL_139;
    }
    if (v17 == 776 && v18 > a2)
    {
      uint64_t v96 = *(v18 - 1);
      int v97 = tolower_map[v96];
      if ((v97 - 97) > 0x14 || ((1 << (v97 - 97)) & 0x104001) == 0) {
        goto LABEL_355;
      }
      int v98 = tolower_map[*v18];
      if (v98 == 101)
      {
        if ((a3 & 1) != 0 || *(v22 - 1) == v96)
        {
          LOWORD(v17) = 776;
          goto LABEL_330;
        }
LABEL_355:
        if (unicode_combinable((unsigned __int16)v17))
        {
          if (v160) {
            unint64_t v102 = v159;
          }
          else {
            unint64_t v102 = 0;
          }
          v157 += v102;
          uint64_t v103 = &v163[v159] - v22;
          v163 = 0;
LABEL_361:
          if (v16 >= 0x80 && unicode_combinable((unsigned __int16)v16))
          {
            v104 = &v14[v26];
            CFStringRef v14 = 0;
            uint64_t v10 = v104 - v18;
          }
          else
          {
            uint64_t v10 = 0;
          }
          if (v103)
          {
            int v165 = 0;
            int v164 = 0;
            unint64_t v8 = (unint64_t)a2;
            unsigned __int8 v7 = a3;
            a5 = v154;
            CFStringRef v15 = v163;
            uint64_t v13 = v103;
            goto LABEL_288;
          }
          if (v10)
          {
            if (v157)
            {
              int v165 = 0;
              int v164 = 0;
              BOOL v105 = v22 - 1 == v151;
              if (v22 - 1 == v151) {
                --v22;
              }
              uint64_t v106 = v157 - v105;
              uint64_t v13 = 0;
              uint64_t v157 = v106;
            }
            else
            {
              uint64_t v13 = 0;
              uint64_t v157 = 0;
              int v165 = 0;
              int v164 = 0;
            }
            unint64_t v8 = (unint64_t)a2;
            unsigned __int8 v7 = a3;
            a5 = v154;
            CFStringRef v15 = v163;
            goto LABEL_288;
          }
          uint64_t v13 = 0;
          unint64_t v8 = (unint64_t)a2;
          unsigned __int8 v7 = a3;
          a5 = v154;
          CFStringRef v15 = v163;
          goto LABEL_133;
        }
LABEL_360:
        uint64_t v103 = 0;
        goto LABEL_361;
      }
      if (v97 != 97 || v98 != 97) {
        goto LABEL_355;
      }
      LOWORD(v17) = 776;
LABEL_353:
      unint64_t v8 = (unint64_t)a2;
      unsigned __int8 v7 = a3;
      a5 = v154;
      CFStringRef v15 = v163;
      goto LABEL_132;
    }
    if (v22 > a1 && v16 == 776)
    {
      uint64_t v99 = *(v22 - 1);
      int v100 = tolower_map[v99];
      if ((v100 - 97) <= 0x14 && ((1 << (v100 - 97)) & 0x104001) != 0)
      {
        int v101 = tolower_map[*v22];
        if (v101 == 101)
        {
          if ((a3 & 1) != 0 || v99 == *(v18 - 1))
          {
            LOWORD(v16) = 776;
            goto LABEL_330;
          }
        }
        else if (v100 == 97 && v101 == 97)
        {
          LOWORD(v16) = 776;
          goto LABEL_353;
        }
      }
    }
    if (v17 < 0x80) {
      goto LABEL_360;
    }
    goto LABEL_355;
  }
  unsigned int v84 = v16 & 0xFFFFFFDF;
LABEL_284:
  if (v84 == 65) {
    goto LABEL_139;
  }
LABEL_133:
  v51 = v166;
  if (a5) {
    v51 = 0;
  }
  v166 = v51;
  if ((v7 & 4) != 0) {
    goto LABEL_178;
  }
  if (v160)
  {
    uint64_t v157 = 0;
    uint64_t v22 = v160;
    goto LABEL_147;
  }
LABEL_494:
  uint64_t v9 = v22;
LABEL_395:
  LODWORD(v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = *v9;
  if ((unint64_t)v18 > v8 && (v7 & 4) != 0 && !*v9)
  {
    v113 = a5;
    int v114 = 0;
    if (((char)*(v18 - 1) & 0x80000000) == 0 && *(v18 - 1) - 58 <= 0xFFFFFFF5) {
      int v114 = separator_map[*(v18 - 1)];
    }
    unsigned int v115 = *v18;
    goto LABEL_405;
  }
LABEL_402:
  v113 = a5;
  unsigned int v115 = *v18;
  int v114 = 0;
  if (v10)
  {
    if ((v115 & 0x80) != 0) {
      goto LABEL_424;
    }
  }
  else
  {
LABEL_405:
    if ((v7 & 2) != 0 && v115 >= 0xC0)
    {
      while (1)
      {
        unint64_t v116 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v18 >> 4];
        v169[0] = v16;
        if (utf8_decodestr(v18, v116, v169, &v167, 2, &v168, 0)) {
          break;
        }
        LOWORD(v16) = v169[0];
        v18 += v116;
        if (!unicode_combinable(v169[0])) {
          goto LABEL_411;
        }
      }
      unint64_t v116 = 0;
      int v155 = 1;
LABEL_411:
      v18 -= v116;
      unsigned int v115 = *v18;
      unint64_t v8 = (unint64_t)a2;
    }
  }
  if (v115 >= 2 && ((v115 & 0x80) != 0 || (v7 & 4) == 0 || !separator_map[v115]) || (v7 & 2) == 0 || *v9 < 0xC0u)
  {
LABEL_424:
    if (v155) {
      goto LABEL_425;
    }
    uint64_t v128 = *v18;
    if (v128 >= 2)
    {
      if (v114)
      {
        if ((v7 & 4) == 0) {
          goto LABEL_425;
        }
      }
      else if ((v128 & 0x80) != 0 || (v128 - 58) > 0xFFFFFFF5)
      {
        if (v128 != 227 || v18[1] != 128 || (v7 & 4) == 0 || v18[2] != 128) {
          goto LABEL_425;
        }
      }
      else if ((v7 & 4) == 0 || !separator_map[v128])
      {
        goto LABEL_425;
      }
    }
    if (*v9 && (*v9 != 42 || v9[1])) {
      goto LABEL_425;
    }
    if (!v113) {
      return 1;
    }
    v109 = v166;
    void *v113 = &v166[-v8];
    goto LABEL_489;
  }
  unint64_t v117 = 0;
  while (1)
  {
    v9 += v117;
    if (!*v9)
    {
LABEL_423:
      unint64_t v8 = (unint64_t)a2;
      goto LABEL_424;
    }
    unint64_t v117 = utf8_byte_length_noerror_utf8_len_table[(unint64_t)*v9 >> 4];
    v169[0] = v17;
    if (utf8_decodestr(v9, v117, v169, &v167, 2, &v168, 0)) {
      break;
    }
    LOWORD(v17) = v169[0];
    if (v169[0] - 12441 < 2 || !unicode_combinable(v169[0])) {
      goto LABEL_423;
    }
  }
  unint64_t v8 = (unint64_t)a2;
LABEL_425:
  uint64_t result = 0;
  if (v18 == (unsigned __int8 *)v8 || (v7 & 4) == 0 || *v9) {
    return result;
  }
  char_start = (unsigned __int8 *)utf8_prev_char_start(v8, (unint64_t)v18);
  unint64_t v119 = (unint64_t)char_start;
  unint64_t v120 = *char_start;
  unint64_t v121 = v120 >> 4;
  uint64_t v122 = utf8_byte_length_utf8_len_table[v120 >> 4];
  unsigned int v123 = v120 & utf8_to_code_point_utf8_first_char_mask[v122];
  if ((~(_BYTE)v121 & 0xC) != 0)
  {
    unsigned int v127 = v123;
  }
  else
  {
    uint64_t v122 = v122 <= 2 ? 2 : v122;
    uint64_t v124 = v122 - 1;
    v125 = (char *)(char_start + 1);
    do
    {
      char v126 = *v125++;
      unsigned int v127 = v126 & 0x3F | (v123 << 6);
      unsigned int v123 = v127;
      --v124;
    }
    while (v124);
  }
  unint64_t v129 = *v18;
  uint64_t v130 = utf8_byte_length_utf8_len_table[v129 >> 4];
  unsigned int v131 = v129 & utf8_to_code_point_utf8_first_char_mask[v130];
  if ((~(v129 >> 4) & 0xC) != 0)
  {
    unsigned int v136 = v129 & utf8_to_code_point_utf8_first_char_mask[v130];
  }
  else
  {
    uint64_t v132 = v130 <= 2 ? 2 : utf8_byte_length_utf8_len_table[v129 >> 4];
    uint64_t v133 = v132 - 1;
    v134 = (char *)(v18 + 1);
    do
    {
      char v135 = *v134++;
      unsigned int v136 = v135 & 0x3F | (v131 << 6);
      unsigned int v131 = v136;
      --v133;
    }
    while (v133);
  }
  uint64_t result = 0;
  if (v136 > 0xFFFE) {
    return result;
  }
  if (v136 - 880 > 0xFFFFFF8F || v127 > 0xFFFE) {
    return result;
  }
  unsigned int v138 = v136 - 48;
  if (v127 - 48 > 9)
  {
    if (v138 < 0xA) {
      return 1;
    }
    if (v127 - 123 >= 0xFFFFFFE6)
    {
      if (v136 > 0x7F) {
        uint64_t result = __maskrune(v136, 0x8000uLL);
      }
      else {
        uint64_t result = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v136 + 60) & 0x8000;
      }
      if (result) {
        return 1;
      }
      return result;
    }
    uint64_t result = 0;
    if (v127 - 91 < 0xFFFFFFE6 || v136 - 91 < 0xFFFFFFE6) {
      return result;
    }
    v139 = (unsigned __int8 *)utf8_prev_char_start(v8, v119);
    if (utf8_to_code_point(v139) - 91 >= 0xFFFFFFE6)
    {
      v140 = &v18[v130];
      int v141 = utf8_to_code_point(v140);
      if ((v141 - 880) >= 0xFFFFFF90)
      {
        LOBYTE(v142) = *v140;
        do
        {
          v140 += utf8_byte_length_utf8_len_table[v142 >> 4];
          unint64_t v142 = *v140;
          uint64_t v143 = utf8_byte_length_utf8_len_table[v142 >> 4];
          int v144 = utf8_to_code_point_utf8_first_char_mask[v143] & v142;
          if ((~(v142 >> 4) & 0xC) != 0)
          {
            int v141 = utf8_to_code_point_utf8_first_char_mask[v143] & v142;
          }
          else
          {
            if (v143 <= 2) {
              uint64_t v145 = 2;
            }
            else {
              uint64_t v145 = utf8_byte_length_utf8_len_table[v142 >> 4];
            }
            uint64_t v146 = v145 - 1;
            v147 = (char *)(v140 + 1);
            do
            {
              char v148 = *v147++;
              int v141 = v148 & 0x3F | (v144 << 6);
              int v144 = v141;
              --v146;
            }
            while (v146);
          }
        }
        while ((v141 - 880) > 0xFFFFFF8F);
      }
      if ((v141 - 91) <= 0xFFFFFFE5) {
        return 1;
      }
    }
    return 0;
  }
  return v138 >= 0xA;
}

unint64_t utf8_prev_char_start(unint64_t a1, unint64_t a2)
{
  do
  {
    if (a2 <= a1) {
      break;
    }
    do
    {
      unsigned int v3 = *(unsigned __int8 *)--a2;
      char v2 = v3;
      unint64_t v4 = (unint64_t)v3 >> 4;
      unint64_t v5 = v4 & 0xC;
    }
    while (v5 == 8);
    uint64_t v6 = utf8_byte_length_utf8_len_table[v4];
    int v7 = (utf8_to_code_point_utf8_first_char_mask[v6] & v2);
    if (v5 == 12)
    {
      uint64_t v8 = v6 <= 2 ? 2 : v6;
      for (uint64_t i = 1; i != v8; ++i)
      {
        int v10 = *(unsigned char *)(a2 + i) & 0x3F | (v7 << 6);
        int v7 = v10;
      }
    }
    else
    {
      int v10 = v7;
    }
  }
  while ((v10 - 880) > 0xFFFFFF8F);
  return a2;
}

unint64_t utf8_to_code_point(unsigned __int8 *a1)
{
  unint64_t v1 = *a1;
  unint64_t v2 = v1 >> 4;
  uint64_t v3 = utf8_byte_length_utf8_len_table[v1 >> 4];
  unint64_t v4 = v1 & utf8_to_code_point_utf8_first_char_mask[v3];
  if ((~(_BYTE)v2 & 0xC) != 0) {
    return v4;
  }
  if (v3 <= 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v3;
  }
  uint64_t v6 = (char *)(a1 + 1);
  uint64_t v7 = v5 - 1;
  do
  {
    char v8 = *v6++;
    unint64_t result = v8 & 0x3Fu | (v4 << 6);
    LODWORD(v4) = v8 & 0x3F | (v4 << 6);
    --v7;
  }
  while (v7);
  return result;
}

uint64_t unicode_combinable(unsigned int a1)
{
  if (a1 < 0x300) {
    return 0;
  }
  int v1 = __CFUniCharCombiningBitmap[(unint64_t)a1 >> 8];
  if (!__CFUniCharCombiningBitmap[(unint64_t)a1 >> 8]) {
    return 0;
  }
  if (v1 == 255) {
    return 1;
  }
  return (__CFUniCharCombiningBitmap[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

uint64_t unicode_decomposeable(unsigned int a1)
{
  if (a1 < 0xC0) {
    return 0;
  }
  int v1 = __CFUniCharDecomposableBitmap[(unint64_t)a1 >> 8];
  if (!__CFUniCharDecomposableBitmap[(unint64_t)a1 >> 8]) {
    return 0;
  }
  if (v1 == 255) {
    return 1;
  }
  return (__CFUniCharDecomposableBitmap[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

uint64_t utf8_encodelen(unsigned __int16 *a1, unint64_t a2, int a3, char a4)
{
  if (a2 < 2) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v6 = a2 >> 1;
  if (a3) {
    __int16 v7 = a3;
  }
  else {
    __int16 v7 = 95;
  }
  do
  {
    unsigned int v9 = *a1++;
    unsigned __int16 v8 = v9;
    unsigned int v10 = bswap32(v9) >> 16;
    if (a4) {
      unsigned __int16 v8 = v10;
    }
    int v11 = v8;
    if (!v8) {
      unsigned __int16 v8 = 9216;
    }
    if (v11 == 47) {
      unsigned __int16 v8 = v7;
    }
    if (v8 >= 0x80u)
    {
      if (v8 >= 0x800u)
      {
        if (v8 >> 11 == 27) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = 3;
        }
      }
      else
      {
        uint64_t v12 = 2;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
    result += v12;
    --v6;
  }
  while (v6);
  return result;
}

uint64_t utf8_encodestr(unsigned __int16 *a1, unint64_t a2, unsigned char *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)&v32[14] = *MEMORY[0x1E4F143B8];
  if (a2 < 2)
  {
    uint64_t result = 0;
    unsigned __int16 v8 = a3;
    goto LABEL_39;
  }
  uint64_t result = 0;
  int v10 = 0;
  int v11 = 0;
  unint64_t v12 = (unint64_t)&a3[a5 - ((a7 & 2) == 0)];
  unint64_t v13 = a2 >> 1;
  unsigned __int16 v8 = a3;
  while (1)
  {
    while (1)
    {
      --v13;
      if (v10 < 1)
      {
        unsigned int v16 = *a1++;
        unsigned int v14 = v16;
        unsigned int v17 = bswap32(v16) >> 16;
        if (a7) {
          unsigned int v14 = v17;
        }
        if ((a7 & 4) != 0)
        {
          int v18 = (unsigned __int16)v14;
          if ((unsigned __int16)v14 >= 0xC0u)
          {
            int v19 = __CFUniCharDecomposableBitmap[(unint64_t)(unsigned __int16)v14 >> 8];
            if (!__CFUniCharDecomposableBitmap[(unint64_t)(unsigned __int16)v14 >> 8]
              || v19 != 255
              && ((__CFUniCharDecomposableBitmap[(v14 >> 3) + 256 + 32 * v19 - 32] >> (v14 & 7)) & 1) == 0)
            {
              goto LABEL_18;
            }
            unsigned int v30 = result;
            char v20 = a4;
            BOOL v21 = a3;
            uint64_t v22 = a6;
            uint64_t v23 = a7;
            int v24 = unicode_decompose(v14, &v31);
            a7 = v23;
            a6 = v22;
            a3 = v21;
            a4 = v20;
            int v10 = v24 - 1;
            uint64_t result = v30;
            v13 += v10;
            unsigned int v14 = v31;
            int v11 = (unsigned __int16 *)v32;
          }
        }
      }
      else
      {
        unsigned int v15 = *v11++;
        unsigned int v14 = v15;
        --v10;
      }
      if (!(_WORD)v14)
      {
        LOBYTE(v14) = 0;
        LOBYTE(v25) = 2;
        LOBYTE(v26) = -112;
        goto LABEL_23;
      }
      if ((unsigned __int16)v14 == 47)
      {
        unsigned int v14 = a6;
        if (!a6) {
          break;
        }
      }
      int v18 = (unsigned __int16)v14;
      if ((unsigned __int16)v14 < 0x80u) {
        goto LABEL_35;
      }
LABEL_18:
      if ((unsigned __int16)v14 > 0x7FFu)
      {
        __int16 v26 = (unsigned __int16)v14 >> 6;
        __int16 v25 = (unsigned __int16)v14 >> 12;
        if ((unsigned __int16)v14 >> 10 != 54 || !v13) {
          goto LABEL_23;
        }
        unsigned int v27 = *a1;
        unsigned int v28 = bswap32(v27) >> 16;
        if (a7) {
          LOWORD(v27) = v28;
        }
        if ((unsigned __int16)v27 >> 10 == 55)
        {
          if ((unint64_t)(v8 + 3) >= v12) {
            goto LABEL_38;
          }
          unsigned int v29 = (v18 << 10) + (unsigned __int16)v27 - 56613888;
          --v13;
          ++a1;
          *unsigned __int16 v8 = (v29 >> 18) | 0xF0;
          v8[1] = (v29 >> 12) & 0x3F | 0x80;
          v8[2] = (v29 >> 6) & 0x3F | 0x80;
          void v8[3] = v27 & 0x3F | 0x80;
          v8 += 4;
          if (!v13) {
            goto LABEL_39;
          }
        }
        else
        {
LABEL_23:
          if ((unint64_t)(v8 + 2) >= v12) {
            goto LABEL_38;
          }
          *unsigned __int16 v8 = v25 | 0xE0;
          v8[1] = v26 & 0x3F | 0x80;
          v8[2] = v14 & 0x3F | 0x80;
          v8 += 3;
          if (!v13) {
            goto LABEL_39;
          }
        }
      }
      else
      {
        if ((unint64_t)(v8 + 1) >= v12) {
          goto LABEL_38;
        }
        *unsigned __int16 v8 = (v14 >> 6) | 0xC0;
        v8[1] = v14 & 0x3F | 0x80;
        v8 += 2;
        if (!v13) {
          goto LABEL_39;
        }
      }
    }
    LOBYTE(v14) = 95;
    uint64_t result = 22;
LABEL_35:
    if ((unint64_t)v8 >= v12) {
      break;
    }
    *v8++ = v14;
    if (!v13) {
      goto LABEL_39;
    }
  }
LABEL_38:
  uint64_t result = 63;
LABEL_39:
  *a4 = v8 - a3;
  if ((a7 & 2) == 0) {
    v8[1] = 0;
  }
  return result;
}

uint64_t unicode_decompose(__int16 a1, _WORD *a2)
{
  unsigned __int16 v2 = a1 + 21504;
  if ((unsigned __int16)(a1 + 21504) > 0x2BA4u) {
    return unicode_recursive_decompose(a1, a2);
  }
  *a2 = ((28533 * (unsigned __int16)(a1 + 21504)) >> 24) | 0x1100;
  a2[1] = v2 % 0x24Cu / 0x1C + 4449;
  if (!(v2 % 0x1Cu)) {
    return 2;
  }
  a2[2] = (unsigned __int16)(a1 + 21504) % 0x1Cu + 4519;
  return 3;
}

uint64_t utf8_decodestr(unsigned __int8 *a1, unint64_t a2, _WORD *a3, void *a4, uint64_t a5, _DWORD *a6, char a7)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  *a6 = 0;
  if (!a2)
  {
    uint64_t result = 0;
    int v11 = a3;
    goto LABEL_66;
  }
  unint64_t v9 = a2;
  unint64_t v10 = (unint64_t)a3 + a5;
  int v11 = a3;
  unint64_t v12 = a1;
  while (1)
  {
    unsigned int v14 = *v12++;
    unint64_t v13 = v14;
    if (!v14)
    {
LABEL_61:
      uint64_t result = 0;
      goto LABEL_66;
    }
    --v9;
    if ((v13 & 0x80) == 0) {
      goto LABEL_56;
    }
    unint64_t v15 = utf_extrabytes[v13 >> 3];
    BOOL v16 = v9 >= v15;
    v9 -= v15;
    if (!v16) {
      goto LABEL_63;
    }
    if (v15 != 3) {
      break;
    }
    int v19 = *v12;
    if ((v19 & 0xC0) != 0x80
      || (int v20 = a1[2], (v20 & 0xC0) != 0x80)
      || (int v21 = a1[3], (v21 & 0xC0) != 0x80)
      || (unsigned int v22 = v21 + (((v19 << 6) + (v13 << 12) + v20) << 6) - 63512704, v22 >> 20))
    {
LABEL_63:
      uint64_t result = 22;
      goto LABEL_66;
    }
    unsigned int v23 = (v22 >> 10) - 10240;
    if (a7)
    {
      *int v11 = bswap32(v23) >> 16;
      int v24 = v11 + 1;
      if ((unint64_t)(v11 + 1) >= v10)
      {
LABEL_67:
        uint64_t result = 63;
        int v11 = v24;
        goto LABEL_66;
      }
      __int16 v25 = __rev16(v22 & 0x3FF | 0xDC00);
    }
    else
    {
      *int v11 = v23;
      int v24 = v11 + 1;
      if ((unint64_t)(v11 + 1) >= v10) {
        goto LABEL_67;
      }
      __int16 v25 = v22 & 0x3FF | 0xDC00;
    }
    unint64_t v12 = a1 + 4;
    v11[1] = v25;
    v11 += 2;
LABEL_60:
    a1 = v12;
    if (!v9) {
      goto LABEL_61;
    }
  }
  if (v15 == 2)
  {
    int v26 = *v12;
    if ((v26 & 0xC0) != 0x80) {
      goto LABEL_63;
    }
    int v27 = a1[2];
    if ((v27 & 0xC0) != 0x80) {
      goto LABEL_63;
    }
    int v28 = (v26 << 6) + (v13 << 12) + v27;
    unsigned int v18 = v28 - 925824;
    if ((v28 - 925824) < 0x800) {
      goto LABEL_63;
    }
    unint64_t v12 = a1 + 3;
    if (v18 >> 11 >= 0x1B)
    {
      uint64_t result = 22;
      if (v18 < 0xE000 || (v28 & 0x3FFFFE) == 0xF207E) {
        goto LABEL_66;
      }
    }
  }
  else
  {
    if (v15 != 1) {
      goto LABEL_63;
    }
    int v17 = *v12;
    if ((v17 & 0xC0) != 0x80) {
      goto LABEL_63;
    }
    unsigned int v18 = v17 + (v13 << 6) - 12416;
    if (v18 < 0x80) {
      goto LABEL_63;
    }
    unint64_t v12 = a1 + 2;
  }
  if ((a7 & 4) == 0)
  {
    if ((a7 & 8) != 0 && (unsigned __int16)v18 >= 0x300u)
    {
      int v30 = __CFUniCharCombiningBitmap[BYTE1(v18)];
      if (__CFUniCharCombiningBitmap[BYTE1(v18)])
      {
        if (v30 == 255
          || ((__CFUniCharCombiningBitmap[(v18 >> 3) + 256 + 32 * v30 - 32] >> (v18 & 7)) & 1) != 0)
        {
          *a6 = 1;
          if (v11 == a3)
          {
            int v11 = a3;
          }
          else
          {
            unsigned int v31 = (unsigned __int16)*(v11 - 1);
            unsigned int v32 = bswap32(v31) >> 16;
            if (a7) {
              LOWORD(v31) = v32;
            }
            int v33 = a4;
            int v43 = a6;
            unsigned int v34 = unicode_combine((unsigned __int16)v31, (unsigned __int16)v18);
            a6 = v43;
            a4 = v33;
            if (v34)
            {
              --v11;
              unsigned int v18 = v34;
            }
          }
        }
      }
    }
LABEL_53:
    if (v18 == 9216) {
      LODWORD(v13) = 0;
    }
    else {
      LODWORD(v13) = v18;
    }
LABEL_56:
    if ((unint64_t)v11 >= v10) {
      goto LABEL_65;
    }
    unsigned int v42 = bswap32(v13) >> 16;
    if (a7) {
      LOWORD(v13) = v42;
    }
    *v11++ = v13;
    goto LABEL_60;
  }
  if ((unsigned __int16)v18 < 0xC0u) {
    goto LABEL_53;
  }
  int v35 = __CFUniCharDecomposableBitmap[BYTE1(v18)];
  if (!__CFUniCharDecomposableBitmap[BYTE1(v18)]
    || v35 != 255
    && ((__CFUniCharDecomposableBitmap[(v18 >> 3) + 256 + 32 * v35 - 32] >> (v18 & 7)) & 1) == 0)
  {
    goto LABEL_53;
  }
  unsigned int v44 = a6;
  CFRange v36 = a4;
  int v37 = unicode_decompose(v18, v45);
  if (v37 < 1)
  {
    a4 = v36;
    a6 = v44;
    goto LABEL_60;
  }
  uint64_t v38 = 0;
  a4 = v36;
  a6 = v44;
  while (1)
  {
    int v39 = &v11[v38];
    unsigned int v40 = (unsigned __int16)v45[v38];
    unsigned int v41 = bswap32(v40) >> 16;
    if (a7) {
      LOWORD(v4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v41;
    }
    *int v39 = v40;
    if ((unint64_t)(v39 + 1) >= v10) {
      break;
    }
    if (v37 == ++v38)
    {
      int v11 = (_WORD *)((char *)v11 + v38 * 2);
      goto LABEL_60;
    }
  }
  int v11 = v39 + 1;
LABEL_65:
  uint64_t result = 63;
LABEL_66:
  *a4 = (char *)v11 - (char *)a3;
  return result;
}

uint64_t unicode_combine(unsigned int a1, unsigned int a2)
{
  if (a2 - 4449 > 0x61)
  {
    if ((unsigned __int16)(a2 - 12443) < 0xD265u) {
      return 0;
    }
  }
  else
  {
    if (a2 >> 1 <= 0x8BA && (unsigned __int16)(a1 - 4352) <= 0x12u)
    {
      __int16 v2 = 28 * a2 + 588 * a1;
      __int16 v3 = -18076;
      return (unsigned __int16)(v2 + v3);
    }
    if (a2 >> 3 >= 0x235 && (unsigned __int16)((unsigned __int16)(a1 + 21504) >> 2) <= 0xAE8u)
    {
      HIDWORD(v9) = -1227133513 * a1 - 1840706560;
      LODWORD(v9) = HIDWORD(v9);
      if ((v9 >> 2) > 0x9249249) {
        return 0;
      }
      __int16 v2 = a1 + a2;
      __int16 v3 = -4519;
      return (unsigned __int16)(v2 + v3);
    }
  }
  uint64_t v5 = (unsigned int *)&__CFUniCharPrecompSourceTable;
  unint64_t v6 = (unsigned int *)&unk_18FBB768C;
  while (1)
  {
    uint64_t v7 = ((char *)v6 - (char *)v5) >> 4;
    unsigned __int16 v8 = &v5[2 * v7];
    if (*v8 <= a2) {
      break;
    }
    unint64_t v6 = v8 - 2;
LABEL_12:
    if (v5 > v6) {
      return 0;
    }
  }
  if (*v8 < a2)
  {
    uint64_t v5 = v8 + 2;
    goto LABEL_12;
  }
  unsigned int v10 = v5[2 * v7 + 1];
  if (v10)
  {
    int v11 = (char *)&__CFUniCharBMPPrecompDestinationTable + 4 * (unsigned __int16)v10;
    if (*(unsigned __int16 *)v11 <= a1)
    {
      unint64_t v12 = (unsigned __int16 *)&v11[4 * HIWORD(v10) - 4];
      if (*v12 >= a1)
      {
        while (1)
        {
          uint64_t v14 = ((char *)v12 - v11) >> 3;
          unint64_t v15 = (unsigned __int16 *)&v11[4 * v14];
          unsigned int v16 = *v15;
          if (v16 <= a1)
          {
            if (v16 >= a1) {
              return *(unsigned __int16 *)&v11[4 * v14 + 2];
            }
            int v11 = (char *)(v15 + 2);
          }
          else
          {
            unint64_t v12 = v15 - 2;
          }
          unsigned __int16 v4 = 0;
          if (v11 > (char *)v12) {
            return v4;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t unicode_recursive_decompose(unsigned int a1, _WORD *a2)
{
  __int16 v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  __int16 v3 = (unsigned __int16 *)&__CFUniCharDecompositionTable;
  unsigned __int16 v4 = (unsigned __int16 *)&unk_18FBBB0B4;
  while (1)
  {
    uint64_t v5 = ((char *)v4 - (char *)v3) >> 3;
    unint64_t v6 = &v3[2 * v5];
    unsigned int v7 = *v6;
    if (v7 <= a1) {
      break;
    }
    unsigned __int16 v4 = v6 - 2;
LABEL_7:
    if (v3 > v4) {
      goto LABEL_8;
    }
  }
  if (v7 < a1)
  {
    __int16 v3 = v6 + 2;
    goto LABEL_7;
  }
  unsigned int v8 = v3[2 * v5 + 1];
LABEL_9:
  int v9 = (v8 >> 12) & 7;
  __int16 v15 = v8 & 0xFFF;
  unsigned int v10 = (char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF);
  int v11 = (unsigned __int16 *)&v15;
  if (v9 != 1) {
    int v11 = (unsigned __int16 *)((char *)&__CFUniCharMultipleDecompositionTable + 2 * (v8 & 0xFFF));
  }
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  uint64_t result = unicode_recursive_decompose(*v11, a2);
  if (result)
  {
    --v9;
    unint64_t v13 = &v15;
    if (v9) {
      unint64_t v13 = (__int16 *)v10;
    }
    int v11 = (unsigned __int16 *)(v13 + 1);
    v2 += result;
LABEL_17:
    for (uint64_t result = (result + v9); v9; --v9)
    {
      __int16 v14 = *v11++;
      *v2++ = v14;
    }
  }
  return result;
}

uint64_t check_and_decompose_string(unsigned __int8 *a1, unint64_t a2, unsigned __int8 **a3, unint64_t *a4)
{
  *a3 = a1;
  *a4 = a2;
  if (!a2) {
    return 0;
  }
  unint64_t v8 = 0;
  int v24 = 0;
  unint64_t v23 = 0;
  int v9 = a1;
  while (((char)*v9 & 0x80000000) == 0)
  {
LABEL_10:
    ++v8;
    ++v9;
    if (v8 >= a2) {
      goto LABEL_11;
    }
  }
  unint64_t v10 = utf8_byte_length_noerror_utf8_len_table_0[(unint64_t)*v9 >> 4];
  if (utf8_decodestr(v9, v10, &v22, &v23, 4, &v24, 0)) {
    return 22;
  }
  if (v22 < 0xC0u
    || (int v11 = __CFUniCharDecomposableBitmap[(unint64_t)v22 >> 8]) == 0
    || v11 != 255
    && ((__CFUniCharDecomposableBitmap[(v22 >> 3) + 256 + 32 * v11 - 32] >> (v22 & 7)) & 1) == 0)
  {
    v8 += v10 - 1;
    v9 += v10 - 1;
    goto LABEL_10;
  }
LABEL_11:
  if (v8 >= a2)
  {
    if (v8 <= a2) {
      return 0;
    }
    return 22;
  }
  uint64_t v12 = (a2 >> 1) & 0x7FFFFFFFFFFFFFFELL;
  unint64_t v13 = malloc_type_malloc(v12 + 2 * a2 + 2, 0x4262708EuLL);
  if (v13)
  {
    size_t v14 = 2 * a2 + v12 + 66;
    do
    {
      int v15 = utf8_decodestr(a1, a2, v13, &v23, v14 - 64, &v24, 4);
      if (!v15) {
        break;
      }
      if (v15 == 22)
      {
        free(v13);
        return 22;
      }
      free(v13);
      unint64_t v13 = malloc_type_malloc(v14, 0x4262708EuLL);
      v14 += 64;
    }
    while (v13);
  }
  unint64_t v16 = v23;
  uint64_t v17 = utf8_encodelen(v13, v23, 47, 0);
  unsigned int v18 = malloc_type_malloc(v17 + 1, 0xFABA5E61uLL);
  uint64_t v19 = utf8_encodestr(v13, v16, v18, &v23, v17 + 1, 47, 4);
  if (v19)
  {
    uint64_t v20 = v19;
    free(v13);
    free(v18);
    return v20;
  }
  v18[v17] = 0;
  *a3 = v18;
  *a4 = v17 + 1;
  free(v13);
  return 0;
}

uint64_t map_case(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 > 0x7F)
  {
    if ((unsigned __int16)(a1 + 223) < 0x3Au || a1 < 0x587 || (unsigned __int16)(a1 - 7680) <= 0x6E9u)
    {
      int __key = (unsigned __int16)a1;
      __int16 v3 = (unsigned __int16 *)bsearch(&__key, &case_mapping_table, 0x57AuLL, 4uLL, (int (__cdecl *)(const void *, const void *))case_cmp);
      if (v3) {
        return v3[1];
      }
    }
  }
  else
  {
    if ((a1 - 97) > 0x19) {
      __int16 v2 = &tolower_map;
    }
    else {
      __int16 v2 = (char *)&toupper_map;
    }
    return v2[a1];
  }
  return v1;
}

uint64_t case_cmp(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 - *a2;
}

void get_canonical_language_identifier_for_string(char *cStr, char *a2, int a3)
{
  *a2 = 0;
  CFStringRef v5 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  CFStringRef CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, v5);
  CFStringGetCString(CanonicalLanguageIdentifierFromString, a2, a3, 0x8000100u);
  CFRelease(CanonicalLanguageIdentifierFromString);
  CFRelease(v5);
}

const void *CRCopyRestrictionsDictionary()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&CRCopyRestrictionsDictionary_lastSynchronizationTimeMutex);
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&CRCopyRestrictionsDictionary_lastSynchronizationTime > 2.0)
  {
    CFPreferencesAppSynchronize(@"com.apple.springboard");
    CRCopyRestrictionsDictionary_lastSynchronizationTime = *(void *)&Current;
  }
  pthread_mutex_unlock(&CRCopyRestrictionsDictionary_lastSynchronizationTimeMutex);
  uint64_t v1 = CFPreferencesCopyAppValue(@"SBParentalControlsMCContentRestrictions", @"com.apple.springboard");
  if (!v1)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &CRMaxRank);
    *(_OWORD *)keys = xmmword_1E5669128;
    long long v7 = *(_OWORD *)&off_1E5669138;
    v5[0] = v3;
    v5[1] = v3;
    v5[2] = v3;
    v5[3] = &stru_1EDF24210;
    uint64_t v1 = CFDictionaryCreate(v2, (const void **)keys, v5, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFPreferencesSetAppValue(@"SBParentalControlsMCContentRestrictions", v1, @"com.apple.springboard");
    if (v3) {
      CFRelease(v3);
    }
  }
  return v1;
}

const void *CRCopyCountryCode()
{
  return _CRCopyValueForKey(@"countryCode");
}

const void *_CRCopyValueForKey(const void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)CRCopyRestrictionsDictionary();
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  CFBooleanRef Value = CFDictionaryGetValue(v2, a1);
  CFStringRef v5 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v3);
  return v5;
}

const void *CRCopyMoviesRank()
{
  return _CRCopyValueForKey(@"movies");
}

const void *CRCopyTVShowsRank()
{
  return _CRCopyValueForKey(@"tvshows");
}

const void *CRCopyAppsRank()
{
  return _CRCopyValueForKey(@"apps");
}

void _DisposeICUSQLiteContext(void *a1)
{
  if (a1)
  {
    usearch_close();
    ubrk_close();
    CPICUReleaseSearchCollator(a1);
    CFDictionaryRef v2 = (UText *)a1[5];
    if (v2) {
      utext_close(v2);
    }
    CFDictionaryRef v3 = (void *)a1[24];
    if (v3) {
      free(v3);
    }
    unsigned __int16 v4 = (void *)a1[26];
    if (v4 && v4 != a1 + 27) {
      free(v4);
    }
    CFStringRef v5 = (void *)a1[22];
    if (v5 && v5 != a1 + 6) {
      free(v5);
    }
    free(a1);
  }
}

void *_CreateICUSQLiteContext(uint64_t a1, char a2)
{
  UErrorCode v9 = U_ZERO_ERROR;
  unsigned __int16 v4 = malloc_type_malloc(0x2E0uLL, 0x10B004033E6159AuLL);
  v4[3] = 0;
  *((_WORD *)v4 + 24) = 65;
  v4[22] = v4 + 6;
  *((_DWORD *)v4 + 46) = 128;
  v4[24] = 0;
  v4[5] = 0;
  *((_DWORD *)v4 + 5CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
  *((unsigned char *)v4 + 188) = 1;
  v4[26] = v4 + 27;
  *((_DWORD *)v4 + 182) = 256;
  CPICUCreateSearchCollator(a1, (uint64_t *)&v7);
  *(_OWORD *)unsigned __int16 v4 = v7;
  v4[2] = v8;
  v4[4] = ubrk_open();
  if (a2)
  {
    ucol_setAttribute();
    if ((a2 & 2) != 0) {
      goto LABEL_6;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_6;
  }
  ucol_setAttribute();
LABEL_6:
  if ((a2 & 4) != 0) {
    ucol_setAttribute();
  }
  v4[3] = usearch_openFromCollator();
  if (v9 >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    _DisposeICUSQLiteContext(v4);
    CFStringRef v5 = u_errorName(v9);
    NSLog((NSString *)@"Failed to open ICUSQLite collator: %s", v5);
    return 0;
  }
  return v4;
}

uint64_t ICUSearchContextPattern(uint64_t a1)
{
  return *(void *)(a1 + 176);
}

UChar *_ICUSQLiteMatch(const char *a1, char *__s2, int a3, int a4, uint64_t a5)
{
  UErrorCode pErrorCode = U_ZERO_ERROR;
  if (a3 == -1) {
    a3 = strlen(__s2);
  }
  UErrorCode v9 = *(void **)(a5 + 176);
  size_t v10 = a3;
  if (strncmp((const char *)v9, __s2, a3) || !*(void *)(a5 + 192))
  {
    pDestCFIndex Length = 0;
    if ((int)v10 >= 1)
    {
      if ((int)v10 >= *(_DWORD *)(a5 + 184))
      {
        int v11 = malloc_type_malloc((v10 + 1), 0x100004077774924uLL);
        if (!v11) {
          return 0;
        }
        UErrorCode v9 = v11;
        uint64_t v12 = *(void **)(a5 + 176);
        if (v12 != (void *)(a5 + 48)) {
          free(v12);
        }
        *(void *)(a5 + 176) = v9;
        *(_DWORD *)(a5 + 184) = v10 + 1;
      }
      memcpy(v9, __s2, v10);
      *(unsigned char *)(*(void *)(a5 + 176) + v1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
      u_strFromUTF8(*(UChar **)(a5 + 192), *(_DWORD *)(a5 + 200), &pDestLength, __s2, v10, &pErrorCode);
      if (pErrorCode == U_BUFFER_OVERFLOW_ERROR || !*(void *)(a5 + 192))
      {
        unint64_t v13 = (UChar *)malloc_type_malloc(2 * pDestLength + 2, 0x1000040BDFB0063uLL);
        if (!v13) {
          return 0;
        }
        size_t v14 = v13;
        int v15 = *(void **)(a5 + 192);
        if (v15) {
          free(v15);
        }
        *(void *)(a5 + 192) = v14;
        int32_t v16 = pDestLength + 1;
        *(_DWORD *)(a5 + 20CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = pDestLength + 1;
        UErrorCode pErrorCode = U_ZERO_ERROR;
        u_strFromUTF8(v14, v16, &pDestLength, __s2, v10, &pErrorCode);
      }
      usearch_setPattern();
      *(unsigned char *)(a5 + 188) = 1;
      uint64_t v17 = pDestLength;
      if (pDestLength >= 1)
      {
        unsigned int v18 = *(__int16 **)(a5 + 192);
        do
        {
          __int16 v20 = *v18++;
          __int16 v19 = v20;
          if ((unsigned __int16)(v20 + 160) < 0x50u
            || (v19 & 0xFF80) == 0xE00
            || (unsigned __int16)((unsigned __int16)(v19 - 11904) >> 7) <= 0x196u)
          {
            *(unsigned char *)(a5 + 188) = 0;
          }
          --v17;
        }
        while (v17);
      }
      if (pErrorCode <= U_ZERO_ERROR) {
        goto LABEL_26;
      }
      **(unsigned char **)(a5 + 176) = 0;
    }
    return 0;
  }
LABEL_26:
  int32_t v41 = 0;
  int32_t v21 = strlen(a1);
  if (v21 < 1) {
    return 0;
  }
  u_strFromUTF8(*(UChar **)(a5 + 208), *(_DWORD *)(a5 + 728), &v41, a1, v21, &pErrorCode);
  if (pErrorCode == U_BUFFER_OVERFLOW_ERROR)
  {
    uint64_t result = (UChar *)malloc_type_malloc(2 * v41 + 2, 0x1000040BDFB0063uLL);
    if (!result) {
      return result;
    }
    unint64_t v23 = result;
    int v24 = *(void **)(a5 + 208);
    if (v24 != (void *)(a5 + 216)) {
      free(v24);
    }
    *(void *)(a5 + 208) = v23;
    int32_t v25 = v41 + 1;
    *(_DWORD *)(a5 + 728) = v41 + 1;
    UErrorCode pErrorCode = U_ZERO_ERROR;
    u_strFromUTF8(v23, v25, &v41, a1, v21, &pErrorCode);
  }
  usearch_setText();
  if (a4 != 3)
  {
    int v29 = usearch_first();
    BOOL v28 = 0;
    int v30 = v29;
    switch(a4)
    {
      case 0:
        goto LABEL_63;
      case 1:
        BOOL v27 = v29 == -1;
        goto LABEL_35;
      case 2:
        BOOL v27 = v29 == 0;
        goto LABEL_35;
      case 4:
        if (v29) {
          goto LABEL_67;
        }
        BOOL v27 = usearch_getMatchedLength() == v41;
        goto LABEL_35;
      case 5:
      case 6:
        if (!*(unsigned char *)(a5 + 188))
        {
LABEL_63:
          BOOL v28 = v29 != -1;
          goto LABEL_68;
        }
        if (v29 == -1) {
          goto LABEL_67;
        }
        ubrk_setText();
        if (pErrorCode > U_ZERO_ERROR) {
          goto LABEL_67;
        }
        char v31 = 0;
        break;
      default:
        goto LABEL_68;
    }
    while (1)
    {
      if (ubrk_isBoundary())
      {
        if (a4 == 5 || (usearch_getMatchedLength(), ubrk_isBoundary()))
        {
LABEL_72:
          BOOL v28 = 1;
          goto LABEL_68;
        }
      }
      else
      {
        unsigned int v32 = *(UText **)(a5 + 40);
        if ((v31 & 1) == 0)
        {
          unsigned int v32 = utext_openUChars(v32, *(const UChar **)(a5 + 208), v41, &pErrorCode);
          *(void *)(a5 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v32;
        }
        utext_setNativeIndex(v32, v30);
        utext_moveIndex32(*(UText **)(a5 + 40), -1);
        UChar32 v33 = utext_next32(*(UText **)(a5 + 40));
        int isUUppercase = u_isUUppercase(v33);
        UChar32 v35 = utext_next32(*(UText **)(a5 + 40));
        int v36 = u_isUUppercase(v35);
        UChar32 v37 = utext_next32(*(UText **)(a5 + 40));
        if (u_isUUppercase(v37)) {
          BOOL v38 = isUUppercase == 0;
        }
        else {
          BOOL v38 = 1;
        }
        int v39 = v38;
        char v31 = 1;
        if (v36 && v39)
        {
          if (a4 == 5) {
            goto LABEL_72;
          }
          usearch_getMatchedLength();
          int isBoundary = ubrk_isBoundary();
          BOOL v28 = 1;
          if (isBoundary) {
            goto LABEL_68;
          }
        }
      }
      int v30 = usearch_next();
      BOOL v28 = 0;
      if (v30 == -1) {
        goto LABEL_68;
      }
    }
  }
  int v26 = usearch_last();
  if (v26 == -1)
  {
LABEL_67:
    BOOL v28 = 0;
  }
  else
  {
    BOOL v27 = usearch_getMatchedLength() + v26 == v41;
LABEL_35:
    BOOL v28 = v27;
  }
LABEL_68:
  if (pErrorCode < U_ILLEGAL_ARGUMENT_ERROR) {
    return (UChar *)v28;
  }
  else {
    return 0;
  }
}

void sub_18FB9BD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB9BF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CPStartAnInhibitor()
{
  CFTypeRef v0 = +[_CPInhibitorManager sharedInstance];
  uint64_t v1 = [v0 startAnInhibitor];

  return v1;
}

void CPStopInhibitorWithIdentifier(uint64_t a1)
{
  id v2 = +[_CPInhibitorManager sharedInstance];
  [v2 stopInhibitorWithIdentifier:a1];
}

uint64_t RunningBoardServicesLibraryCore()
{
  if (!RunningBoardServicesLibraryCore_frameworkLibrary) {
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RunningBoardServicesLibraryCore_frameworkLibrary;
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRBSProcessHandleClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSProcessHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSProcessHandleClass_block_invoke_cold_1();
  }
  getRBSProcessHandleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void RunningBoardServicesLibrary()
{
  CFTypeRef v0 = 0;
  if (!RunningBoardServicesLibraryCore()) {
    RunningBoardServicesLibrary_cold_1(&v0);
  }
}

Class __getRBSTargetClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSTarget");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSTargetClass_block_invoke_cold_1();
  }
  getRBSTargetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSDomainAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSDomainAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSDomainAttributeClass_block_invoke_cold_1();
  }
  getRBSDomainAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAcquisitionCompletionAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSAcquisitionCompletionAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1();
  }
  getRBSAcquisitionCompletionAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getRBSAssertionClass_block_invoke_cold_1();
  }
  getRBSAssertionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *getConfigPListURL()
{
  CFStringRef v0 = (const __CFString *)getConfigPListURL_configDefaultsDomain;
  if (!getConfigPListURL_configDefaultsDomain)
  {
    CFStringRef v0 = @"/var/mobile/Library/Preferences/com.apple.ConfigServer";
    getConfigPListURL_configDefaultsDomain = @"/var/mobile/Library/Preferences/com.apple.ConfigServer";
  }
  uint64_t v1 = (void *)CFPreferencesCopyAppValue(@"ConfigurationPlistURL", v0);
  if ([v1 length])
  {
    return (__CFString *)v1;
  }
  else
  {

    return @"https://configuration.apple.com/configurations/pep/config/pepconfig.plist";
  }
}

uint64_t downloadDictionary()
{
  CFStringRef v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:getConfigPListURL()];
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F290D0]) initWithURL:v0 cachePolicy:1 timeoutInterval:60.0];

  uint64_t v5 = 0;
  uint64_t v2 = [MEMORY[0x1E4F29090] sendSynchronousRequest:v1 returningResponse:0 error:&v5];

  if (v5) {
    NSLog((NSString *)@"Could not download configuration data %@", v5);
  }
  if (!v2) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F28F98] propertyListWithData:v2 options:0 format:0 error:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

void ALBasicDiacriticMatch(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 1)
  {
    uint64_t v5 = (void *)[sqlite3_user_data(a1) citySearchMatcher];
    unint64_t v6 = sqlite3_value_text(*a3);
    if (v6) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      UErrorCode v9 = a1;
      int v8 = 0;
    }
    else
    {
      int v8 = [v5 matchesUTF8String:v6];
      UErrorCode v9 = a1;
    }
    sqlite3_result_int(v9, v8);
  }
  else
  {
    sqlite3_result_error(a1, "ALBasicDiacriticMatch: wrong number of arguments", -1);
  }
}

void RadioPreferencesCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  pthread_mutex_lock(&__sValidObjectsLock);
  if (__sValidObjects && CFSetContainsValue((CFSetRef)__sValidObjects, a3))
  {
    id v5 = a3;
    pthread_mutex_unlock(&__sValidObjectsLock);
    if (v5) {
      [v5 notifyTarget:a2];
    }
  }
  else
  {
    pthread_mutex_unlock(&__sValidObjectsLock);
  }
}

void sub_18FBA1410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FBA17C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t NanoPreferencesSyncLibraryCore()
{
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary) {
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return NanoPreferencesSyncLibraryCore_frameworkLibrary;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!NanoPreferencesSyncLibraryCore()) {
    __getNPSDomainAccessorClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("NPSDomainAccessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getNPSDomainAccessorClass_block_invoke_cold_2();
  }
  getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t NanoSystemSettingsLibraryCore()
{
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary) {
    NanoSystemSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return NanoSystemSettingsLibraryCore_frameworkLibrary;
}

uint64_t __NanoSystemSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoSystemSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNSSManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!NanoSystemSettingsLibraryCore()) {
    __getNSSManagerClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("NSSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getNSSManagerClass_block_invoke_cold_2();
  }
  getNSSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t CPICUReleaseSearchCollator(void *a1)
{
  return MEMORY[0x1F417FD08](*a1);
}

uint64_t CPICUCreateSearchCollator@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  char v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (a1)
  {
    __strlcpy_chk();
  }
  else
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
    CFStringRef ValueAtIndex = (const __CFString *)CFPreferencesCopyAppValue(@"AppleCollationOrder", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
    if (ValueAtIndex
      || (CFArrayRef v7 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", v3)) != 0
      && (CFArrayRef v8 = v7,
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v7, 0),
          CFRetain(ValueAtIndex),
          CFRelease(v8),
          ValueAtIndex))
    {
      CFStringRef CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], ValueAtIndex);
      if (CanonicalLanguageIdentifierFromString)
      {
        CFStringRef v6 = CanonicalLanguageIdentifierFromString;
        CFStringGetCString(CanonicalLanguageIdentifierFromString, (char *)v10, 257, 0x600u);
        CFRelease(v6);
      }
      CFRelease(ValueAtIndex);
    }
    else
    {
      LOBYTE(v10[0]) = 0;
    }
  }
  uloc_setKeywordValue();
  *a2 = ucol_open();
  return ucol_setStrength();
}

CFErrorRef *CPBitmapWriteImagesToPath(const __CFArray *a1, unsigned int a2, const __CFData *a3, const __CFString *a4, int a5, CFErrorRef *a6)
{
  if (!a1 || !CFArrayGetCount(a1))
  {
    if (!a6) {
      return a6;
    }
    __CPBitmapSetErrorIfNecessary(a6, @"CPBitmapErrorDomain", 1, "No images provided");
    return 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  CPBitmapWriterCreateWithPath(a4, a2, a5, Count, a3, a6);
  if (!v13) {
    return 0;
  }
  size_t v14 = v13;
  if (Count < 1)
  {
LABEL_8:
    a6 = (CFErrorRef *)CPBitmapWriterFinalize((uint64_t)v14, (uint64_t)a6);
  }
  else
  {
    CFIndex v15 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a1, v15);
      if ((CPBitmapWriterAddImage((uint64_t)v14, (uint64_t)ValueAtIndex, (uint64_t)a6) & 1) == 0) {
        break;
      }
      if (Count == ++v15) {
        goto LABEL_8;
      }
    }
    a6 = 0;
  }
  CFRelease(v14);
  return a6;
}

void __CPBitmapSetErrorIfNecessary(CFErrorRef *a1, const __CFString *a2, CFIndex __errnum, char *cStr)
{
  if (a1)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if ((const __CFString *)*MEMORY[0x1E4F1D160] == a2)
    {
      size_t v10 = strerror(__errnum);
      UErrorCode v9 = (__CFString *)CFStringCreateWithFormat(v8, 0, @"CPBitmap: %s (%s)", cStr, v10);
    }
    else
    {
      UErrorCode v9 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x8000100u);
    }
    userInfoValues = v9;
    *a1 = CFErrorCreateWithUserInfoKeysAndValues(v8, a2, __errnum, MEMORY[0x1E4F1D140], (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
  }
}

void CPBitmapWriterCreateWithPath(const __CFString *a1, unsigned int a2, int a3, unint64_t a4, const __CFData *a5, CFErrorRef *a6)
{
  uint64_t v12 = (char *)malloc_type_malloc(0x400uLL, 0xC639AAE6uLL);
  if (v12)
  {
    unint64_t v13 = v12;
    char *v12 = 0;
    size_t v14 = (char *)malloc_type_malloc(0x400uLL, 0x4FA72E8CuLL);
    if (v14)
    {
      CFIndex v15 = v14;
      *size_t v14 = 0;
      if (a1 && CFStringGetCString(a1, v13, 1024, 0x8000100u))
      {
        int v16 = CPOpenTemporaryFile((uint64_t)v13, v15, 0x400uLL);
        if (v16 != -1)
        {
          int v17 = v16;
          CPBitmapWriterCreateWithFileDescriptor(v16, a2, a3, a4, a5, a6);
          if (v18)
          {
            *(unsigned char *)(v18 + 65) = 1;
            *(void *)(v18 + 72) = v15;
            *(void *)(v18 + 8CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v13;
            return;
          }
          goto LABEL_19;
        }
        if (a6)
        {
          CFStringRef v23 = (const __CFString *)*MEMORY[0x1E4F1D160];
          CFIndex v22 = *__error();
          __int16 v20 = "Could not open dest path";
          int32_t v21 = a6;
          CFStringRef v19 = v23;
          goto LABEL_17;
        }
      }
      else if (a6)
      {
        CFStringRef v19 = @"CPBitmapErrorDomain";
        __int16 v20 = "Invalid dest path";
        int32_t v21 = a6;
        CFIndex v22 = 4;
LABEL_17:
        __CPBitmapSetErrorIfNecessary(v21, v19, v22, v20);
      }
      int v17 = -1;
LABEL_19:
      free(v15);
      free(v13);
      if (v17 != -1) {
        close(v17);
      }
      return;
    }
    if (a6) {
      __CPBitmapSetErrorIfNecessary(a6, (const __CFString *)*MEMORY[0x1E4F1D160], 12, "Could not allocate source path buffer");
    }
    free(v13);
  }
  else if (a6)
  {
    __CPBitmapSetErrorIfNecessary(a6, (const __CFString *)*MEMORY[0x1E4F1D160], 12, "Could not allocate destination path buffer");
  }
}

uint64_t CPBitmapWriterAddImage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  CFAllocatorRef v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  CFStringRef v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  v6[2] = __CPBitmapWriterAddImage_block_invoke;
  v6[3] = &unk_1E56692F8;
  v6[6] = a3;
  v6[7] = a1;
  v6[4] = &v7;
  v6[5] = a2;
  dispatch_sync(v3, v6);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t CPBitmapWriterFinalize(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __CPBitmapWriterFinalize_block_invoke;
  block[3] = &unk_1E5669320;
  block[5] = a1;
  block[6] = a2;
  block[4] = &v6;
  dispatch_sync(v2, block);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFErrorRef *CPBitmapCreateImagesFromPath(const __CFString *a1, CFPropertyListRef *a2, char a3, CFErrorRef *a4)
{
  Class result = CPBitmapCreateMappedDataFromPath(a1, a4);
  if (result)
  {
    uint64_t v8 = result;
    ImagesFromData = CPBitmapCreateImagesFromData((const __CFData *)result, a2, a3, a4);
    CFRelease(v8);
    return (CFErrorRef *)ImagesFromData;
  }
  return result;
}

CFErrorRef *CPBitmapCreateMappedDataFromPath(const __CFString *a1, CFErrorRef *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  buffer[0] = 0;
  if (a1 && CFStringGetCString(a1, buffer, 1024, 0x8000100u))
  {
    int v3 = open(buffer, 0);
    if (v3 != -1)
    {
      int v4 = v3;
      size_t v5 = lseek(v3, 0, 2);
      if (v5 == -1)
      {
        if (!a2) {
          goto LABEL_17;
        }
        CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFIndex v16 = *__error();
        int v17 = "Could not lseek file for length";
      }
      else
      {
        uint64_t v6 = (void *)v5;
        uint64_t v7 = (const UInt8 *)mmap(0, v5, 1, 1, v4, 0);
        if (v7 != (const UInt8 *)-1)
        {
          uint64_t v8 = v7;
          v19.version = 0;
          memset(&v19.retain, 0, 40);
          v19.mach_timebase_info info = v6;
          v19.deallocate = (CFAllocatorDeallocateCallBack)MEMORY[0x1E4F149D0];
          v19.preferredSize = 0;
          CFAllocatorRef v9 = CFAllocatorCreate(0, &v19);
          a2 = (CFErrorRef *)CFDataCreateWithBytesNoCopy(0, v8, (CFIndex)v6, v9);
          CFRelease(v9);
LABEL_17:
          close(v4);
          return a2;
        }
        if (!a2) {
          goto LABEL_17;
        }
        CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFIndex v16 = *__error();
        int v17 = "Could not mmap CPBitmap file";
      }
      __CPBitmapSetErrorIfNecessary(a2, v15, v16, v17);
      a2 = 0;
      goto LABEL_17;
    }
    if (a2)
    {
      CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFIndex v13 = *__error();
      char v11 = "Could not open path for reading";
      uint64_t v12 = a2;
      CFStringRef v10 = v14;
      goto LABEL_9;
    }
  }
  else if (a2)
  {
    CFStringRef v10 = @"CPBitmapErrorDomain";
    char v11 = "Invalid read path";
    uint64_t v12 = a2;
    CFIndex v13 = 4;
LABEL_9:
    __CPBitmapSetErrorIfNecessary(v12, v10, v13, v11);
    return 0;
  }
  return a2;
}

__CFArray *CPBitmapCreateImagesFromData(const __CFData *a1, CFPropertyListRef *a2, char a3, CFErrorRef *a4)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  uint64_t v95 = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v92 = 0u;
  if (!a1 || (BytePtr = CFDataGetBytePtr(a1)) == 0 || (v9 = (UInt8 *)BytePtr, (size_t v10 = CFDataGetLength(a1)) == 0))
  {
    if (!a4)
    {
LABEL_15:
      CFDictionaryRef Mutable = 0;
      goto LABEL_16;
    }
    CFStringRef v14 = @"CPBitmapErrorDomain";
    CFStringRef v15 = "No data provided to CPBitmapCreateImagesFromData";
    CFIndex v16 = a4;
    CFIndex v17 = 0;
    goto LABEL_14;
  }
  unint64_t v11 = v10;
  if (v10 <= 0x17)
  {
LABEL_67:
    if (!a4) {
      goto LABEL_15;
    }
    CFStringRef v14 = @"CPBitmapErrorDomain";
    CFStringRef v15 = "Length of file does not match expected length";
    CFIndex v16 = a4;
    CFIndex v17 = 5;
    goto LABEL_14;
  }
  if ((a3 & 2) != 0) {
    madvise(v9, v10, 3);
  }
  if (v11 <= 0x1B) {
    uint64_t v12 = 24;
  }
  else {
    uint64_t v12 = 28;
  }
  if (v11 < 0x1C) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = *(_DWORD *)&v9[v11 - 28];
  }
  __int16 v20 = &v9[v11];
  uint64_t v22 = *(unsigned int *)&v9[v11 - 8];
  int v21 = *(_DWORD *)&v9[v11 - 4];
  unint64_t v23 = *(unsigned int *)&v9[v11 - 16];
  unsigned int v24 = *((_DWORD *)v20 - 3);
  uint64_t v25 = *((unsigned int *)v20 - 5);
  BOOL v26 = v11 > 0x1B && v21 == -592100446;
  int v27 = v26;
  if (!v26)
  {
    if (v21 != -878431599)
    {
      if (!a4) {
        goto LABEL_15;
      }
      CFStringRef v14 = @"CPBitmapErrorDomain";
      CFStringRef v15 = "Invalid magic in trailer";
      CFIndex v16 = a4;
      CFIndex v17 = 6;
      goto LABEL_14;
    }
    unsigned int v13 = 0;
    uint64_t v12 = 24;
  }
  uint64_t v72 = v22;
  if (!v22)
  {
    CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    goto LABEL_95;
  }
  uint64_t v70 = v12;
  CFIndex length = *((unsigned int *)v20 - 6);
  if (v24 <= 7 && ((1 << v24) & 0xD0) != 0)
  {
    decode[0] = 0.0;
    *(void *)&decode[1] = decode;
    uint64_t v97 = 0x2000000000;
    char v98 = 0;
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x2000000000;
    BOOL v91 = 0;
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x2000000000;
    uint64_t v87 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = &v80;
    uint64_t v82 = 0x2000000000;
    int v83 = 0;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 0x40000000;
    int v74 = __CPBitmapCreateImagesFromData_block_invoke;
    int v75 = &unk_1E56692B0;
    uint64_t v76 = decode;
    uint64_t v77 = &v88;
    uint64_t v78 = &v84;
    int v79 = &v80;
    if (v22 == 1)
    {
      CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDictionaryRef v29 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F2FF08], MEMORY[0x1E4F1CFC8], 1, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
      if (v29)
      {
        CFDictionaryRef v30 = v29;
        char v31 = (CFTypeRef *)CPBitmapDataWithOffsetCreate(a1, 0);
        if (v31)
        {
          unsigned int v32 = v31;
          Direct = CGDataProviderCreateDirect(v31, v11 - (v70 + length + v13), &__CPBitmapDataWithOffsetDirectProviderCallbacks);
          if (Direct)
          {
            unsigned int v34 = Direct;
            UChar32 v35 = CGImageSourceCreateWithDataProvider(Direct, v30);
            if (!v35)
            {
              v74(v73, *MEMORY[0x1E4F1D160], 12, (uint64_t)"Could not allocate image source");
              CFDictionaryRef Mutable = 0;
LABEL_89:
              CFRelease(v34);
              goto LABEL_90;
            }
            int v36 = v35;
            if (CGImageSourceGetCount(v35) == 1)
            {
              CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v36, 0, v30);
              if (ImageAtIndex)
              {
                CGImageRef v38 = ImageAtIndex;
                CFDictionaryRef Mutable = CFArrayCreateMutable(v28, 1, MEMORY[0x1E4F1D510]);
                CFArrayAppendValue(Mutable, v38);
                CFRelease(v38);
LABEL_88:
                CFRelease(v36);
                goto LABEL_89;
              }
              v74(v73, @"CPBitmapErrorDomain", 6, (uint64_t)"Could not create image from KTX source");
            }
            else
            {
              v74(v73, @"CPBitmapErrorDomain", 6, (uint64_t)"Unexpected image count for KTX format");
            }
            CFDictionaryRef Mutable = 0;
            goto LABEL_88;
          }
          v74(v73, *MEMORY[0x1E4F1D160], 12, (uint64_t)"Could not allocate source data provider");
          CFRelease(*v32);
          free(v32);
        }
        else
        {
          v74(v73, *MEMORY[0x1E4F1D160], 12, (uint64_t)"Could not allocate offsetted source data");
        }
        CFDictionaryRef Mutable = 0;
LABEL_90:
        CFRelease(v30);
        goto LABEL_91;
      }
      v74(v73, *MEMORY[0x1E4F1D160], 12, (uint64_t)"Could not allocate image source props");
      CFDictionaryRef Mutable = 0;
    }
    else
    {
      CFDictionaryRef Mutable = 0;
      char v98 = 1;
      BOOL v91 = @"CPBitmapErrorDomain";
      uint64_t v87 = 6;
      int v83 = "KTX container can only have one image";
    }
LABEL_91:
    int v54 = *(unsigned __int8 *)(*(void *)&decode[1] + 24);
    if (a4 && *(unsigned char *)(*(void *)&decode[1] + 24)) {
      __CPBitmapSetErrorIfNecessary(a4, (const __CFString *)v89[3], v85[3], (char *)v81[3]);
    }
    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(decode, 8);
    if (!v54)
    {
LABEL_98:
      if (a2)
      {
        if (length)
        {
          CFAllocatorRef v55 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          CFDataRef v56 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v20[-v70 - length], length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
          if (v56)
          {
            CFDataRef v57 = v56;
            *a2 = CFPropertyListCreateWithData(v55, v56, 0, 0, a4);
            CFRelease(v57);
          }
        }
      }
    }
    goto LABEL_95;
  }
  if (v13)
  {
    if (v11 < v13 || (unint64_t v39 = v12 + *((unsigned int *)v20 - 6) + v13, v39 > v11))
    {
      if (!a4) {
        goto LABEL_15;
      }
      CFStringRef v14 = @"CPBitmapErrorDomain";
      CFStringRef v15 = "Invalid colorSpace plist size";
    }
    else
    {
      size_t width = *((unsigned int *)v20 - 5);
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef v40 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v20[-v39], v13, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      if (!v40)
      {
        if (!a4) {
          goto LABEL_15;
        }
        CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFStringRef v15 = "Could not allocate colorSpaceData";
        CFIndex v16 = a4;
        CFIndex v17 = 12;
        goto LABEL_14;
      }
      CFDataRef cfa = v40;
      CFAllocatorRef allocatora = (CFAllocatorRef)CFPropertyListCreateWithData(allocator, v40, 0, 0, 0);
      CFRelease(cfa);
      if (allocatora)
      {
        *(void *)&long long v92 = CGColorSpaceCreateWithPropertyList(allocatora);
        CFRelease(allocatora);
        uint64_t v25 = width;
        if ((void)v92) {
          goto LABEL_52;
        }
        if (!a4)
        {
          CFDictionaryRef Mutable = 0;
          goto LABEL_18;
        }
        CFStringRef v14 = @"CPBitmapErrorDomain";
        CFStringRef v15 = "Invalid colorSpace plist";
      }
      else
      {
        if (!a4) {
          goto LABEL_15;
        }
        CFStringRef v14 = @"CPBitmapErrorDomain";
        CFStringRef v15 = "Invalid colorSpace plist data";
      }
    }
    CFIndex v16 = a4;
    CFIndex v17 = 8;
LABEL_14:
    __CPBitmapSetErrorIfNecessary(v16, v14, v17, v15);
    goto LABEL_15;
  }
LABEL_52:
  size_t widtha = v25;
  if (!__CPBitmapGetImageInfoForFormat(v24, v25, v23, (uint64_t)&v92, v27, a3 & 1))
  {
    if (!a4) {
      goto LABEL_15;
    }
    CFStringRef v14 = @"CPBitmapErrorDomain";
    CFStringRef v15 = "Invalid bitmap format in file";
    CFIndex v16 = a4;
    CFIndex v17 = 3;
    goto LABEL_14;
  }
  size_t v41 = v94;
  if (!is_mul_ok(v94, v23)) {
    goto LABEL_67;
  }
  if (!is_mul_ok((v72 - 1), *((unint64_t *)&v94 + 1))) {
    goto LABEL_67;
  }
  uint64_t v42 = (v72 - 1) * *((void *)&v94 + 1);
  BOOL v43 = __CFADD__(v42, v94 * v23);
  uint64_t v44 = v42 + v94 * v23;
  if (v43) {
    goto LABEL_67;
  }
  BOOL v43 = __CFADD__(v44, v13);
  uint64_t v45 = v44 + v13;
  if (v43) {
    goto LABEL_67;
  }
  BOOL v43 = __CFADD__(v45, length);
  CFIndex v46 = v45 + length;
  if (v43) {
    goto LABEL_67;
  }
  BOOL v43 = __CFADD__(v46, v70);
  CFIndex v47 = v46 + v70;
  if (v43) {
    goto LABEL_67;
  }
  uint64_t v61 = *((void *)&v94 + 1);
  off_t size = v94 * v23;
  if (v11 != v47) {
    goto LABEL_67;
  }
  CFDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  uint64_t v48 = 0;
  long long v60 = v93;
  space = (CGColorSpace *)v92;
  CGBitmapInfo bitmapInfo = v95;
  uint64_t v49 = v72;
  while (1)
  {
    CFTypeRef cf = (CFTypeRef)v48;
    int v50 = CPBitmapDataWithOffsetCreate(a1, v48);
    v51 = CGDataProviderCreateDirect(v50, size, &__CPBitmapDataWithOffsetDirectProviderCallbacks);
    allocatorb = v51;
    if (v24 == 5)
    {
      *(_OWORD *)decode = xmmword_18FBBC000;
      CGImageRef v52 = CGImageMaskCreate(widtha, v23, v60, *((size_t *)&v60 + 1), v41, v51, decode, 0);
    }
    else
    {
      CGImageRef v52 = CGImageCreate(widtha, v23, v60, *((size_t *)&v60 + 1), v41, space, bitmapInfo, v51, 0, 1, kCGRenderingIntentDefault);
    }
    CGImageRef v53 = v52;
    CGDataProviderRelease(allocatorb);
    if (!v53) {
      break;
    }
    CFArrayAppendValue(Mutable, v53);
    CGImageRelease(v53);
    uint64_t v48 = (uint64_t)cf + v61;
    if (!--v49) {
      goto LABEL_98;
    }
  }
  if (a4) {
    __CPBitmapSetErrorIfNecessary(a4, @"CPBitmapErrorDomain", 6, "Could not create image from data");
  }
LABEL_95:
  if (Mutable && CFArrayGetCount(Mutable) != v72)
  {
    CFRelease(Mutable);
    goto LABEL_15;
  }
LABEL_16:
  if ((void)v92) {
    CGColorSpaceRelease((CGColorSpaceRef)v92);
  }
LABEL_18:
  if (*((void *)&v92 + 1)) {
    CGColorSpaceRelease(*((CGColorSpaceRef *)&v92 + 1));
  }
  return Mutable;
}

const UInt8 *CPBitmapDataWithOffsetGetBytePtr(uint64_t a1)
{
  return &CFDataGetBytePtr(*(CFDataRef *)a1)[*(void *)(a1 + 8)];
}

void CPBitmapDataWithOffsetRelease(CFTypeRef *a1)
{
  CFRelease(*a1);
  free(a1);
}

void *__CPBitmapCreateImagesFromData_block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  *(void *)(*(void *)(result[5] + 8) + 24) = a2;
  *(void *)(*(void *)(result[6] + 8) + 24) = a3;
  *(void *)(*(void *)(result[7] + 8) + 24) = a4;
  return result;
}

void *CPBitmapDataWithOffsetCreate(const void *a1, uint64_t a2)
{
  int v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1060040C2E02434uLL);
  *int v4 = CFRetain(a1);
  v4[1] = a2;
  return v4;
}

uint64_t __CPBitmapGetImageInfoForFormat(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t result = 0;
  if (a5) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 8;
  }
  switch(a1)
  {
    case 0:
      if (a5) {
        uint64_t v12 = 0x3FFFFFFFFFFFFFF0;
      }
      else {
        uint64_t v12 = 0x3FFFFFFFFFFFFFF8;
      }
      *(void *)(a4 + 8) = CGColorSpaceCreateDeviceRGB();
      *(void *)(a4 + 32) = 4 * (v12 & (v8 + a2 - 1));
      *(_OWORD *)(a4 + 16) = xmmword_18FBBBFF0;
      int v13 = 8198;
      goto LABEL_26;
    case 1:
      if (a5) {
        uint64_t v15 = 0x3FFFFFFFFFFFFFF0;
      }
      else {
        uint64_t v15 = 0x3FFFFFFFFFFFFFF8;
      }
      *(void *)(a4 + 8) = CGColorSpaceCreateDeviceRGB();
      *(void *)(a4 + 32) = 4 * (v15 & (v8 + a2 - 1));
      *(_OWORD *)(a4 + 16) = xmmword_18FBBBFF0;
      if (a6) {
        int v13 = 8198;
      }
      else {
        int v13 = 8194;
      }
      goto LABEL_26;
    case 2:
      if (a5) {
        uint64_t v16 = 0x7FFFFFFFFFFFFFF0;
      }
      else {
        uint64_t v16 = 0x7FFFFFFFFFFFFFF8;
      }
      *(void *)(a4 + 8) = CGColorSpaceCreateDeviceRGB();
      *(void *)(a4 + 32) = 2 * (v16 & (v8 + a2 - 1));
      *(_OWORD *)(a4 + 16) = xmmword_18FBBBFE0;
      int v13 = 4102;
      goto LABEL_26;
    case 3:
      if (a5) {
        uint64_t v17 = -16;
      }
      else {
        uint64_t v17 = -8;
      }
      CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceGray();
      int v13 = 0;
      *(void *)(a4 + 8) = DeviceGray;
      *(void *)(a4 + 32) = v17 & (v8 + a2 - 1);
      *(int64x2_t *)(a4 + 16) = vdupq_n_s64(8uLL);
      goto LABEL_26;
    case 5:
      uint64_t v19 = -8;
      if (a5) {
        uint64_t v19 = -16;
      }
      *(void *)(a4 + 32) = v19 & (v8 + a2 - 1);
      *(int64x2_t *)(a4 + 16) = vdupq_n_s64(8uLL);
      int v13 = 7;
LABEL_26:
      *(_DWORD *)(a4 + 48) = v13;
      if (*(void *)a4)
      {
        size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(*(CGColorSpaceRef *)a4);
        if (NumberOfComponents != CGColorSpaceGetNumberOfComponents(*(CGColorSpaceRef *)(a4 + 8))) {
          return 0;
        }
      }
      else
      {
        *(void *)a4 = CGColorSpaceRetain(*(CGColorSpaceRef *)(a4 + 8));
      }
      *(void *)(a4 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = (*(void *)(a4 + 32) * a3 + 4095) & 0xFFFFFFFFFFFFF000;
      return 1;
    default:
      return result;
  }
}

uint64_t CPBitmapWriterGetTypeID()
{
  if (CPBitmapWriterGetTypeID_once != -1) {
    dispatch_once(&CPBitmapWriterGetTypeID_once, &__block_literal_global_6);
  }
  return CPBitmapWriterGetTypeID_typeID;
}

uint64_t __CPBitmapWriterGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  CPBitmapWriterGetTypeID_typeID = result;
  return result;
}

void CPBitmapWriterCreate(unsigned int a1, const __CFData *a2, const __CFString *a3, int a4, CFErrorRef *a5)
{
  if (a1 == 6)
  {
    if (!a5) {
      return;
    }
    size_t v5 = "Cannot serialize kCPBitmapFormatATX_4x4_PreTwiddled with this constructor - use CPBitmapWriterCreateWithPath instead";
    goto LABEL_7;
  }
  if (a1 == 4)
  {
    if (!a5) {
      return;
    }
    size_t v5 = "Cannot serialize kCPBitmapFormatKTX_4x4 with this constructor - use CPBitmapWriterCreateWithPath instead";
LABEL_7:
    __CPBitmapSetErrorIfNecessary(a5, @"CPBitmapErrorDomain", 3, v5);
    return;
  }
  CPBitmapWriterCreateWithPath(a3, a1, a4, 1uLL, a2, a5);
}

double CPBitmapWriterCreateWithFileDescriptor(int a1, unsigned int a2, int a3, unint64_t a4, CFDataRef Data, CFErrorRef *a6)
{
  if (a1 == -1)
  {
    if (!a6) {
      return result;
    }
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D160];
    size_t v10 = "Bad file descriptor";
    unint64_t v11 = a6;
    CFIndex v12 = 9;
    goto LABEL_11;
  }
  if (a2 >= 8)
  {
    if (!a6) {
      return result;
    }
    CFStringRef v9 = @"CPBitmapErrorDomain";
    size_t v10 = "Requested bitmap format is unknown";
    goto LABEL_10;
  }
  if (HIDWORD(a4))
  {
    if (!a6) {
      return result;
    }
    CFStringRef v9 = @"CPBitmapErrorDomain";
    size_t v10 = "Count of images is too high";
LABEL_10:
    unint64_t v11 = a6;
    CFIndex v12 = 3;
LABEL_11:
    __CPBitmapSetErrorIfNecessary(v11, v9, v12, v10);
    return result;
  }
  dispatch_queue_t v17 = dispatch_queue_create(0, 0);
  if (v17)
  {
    uint64_t v18 = v17;
    if (Data
      && (Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Data, kCFPropertyListBinaryFormat_v1_0, 0, a6)) == 0)
    {
      if (a6)
      {
        CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F1D160];
        int v21 = __error();
        __CPBitmapSetErrorIfNecessary(a6, v20, *v21, "Could not encode info dictionary");
      }
      dispatch_release(v18);
    }
    else
    {
      if (CPBitmapWriterGetTypeID_once != -1) {
        dispatch_once(&CPBitmapWriterGetTypeID_once, &__block_literal_global_6);
      }
      uint64_t Instance = _CFRuntimeCreateInstance();
      if (Instance)
      {
        *(void *)(Instance + 16) = v18;
        *(_DWORD *)(Instance + 24) = a1;
        *(_DWORD *)(Instance + 28) = a2;
        *(_DWORD *)(Instance + 32) = a3;
        *(void *)(Instance + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = a4;
        *(void *)(Instance + 48) = Data;
        *(void *)(Instance + 56) = 0;
        *(_WORD *)(Instance + 64) = 0;
        double result = 0.0;
        *(_OWORD *)(Instance + 72) = 0u;
        *(_OWORD *)(Instance + 88) = 0u;
        *(_OWORD *)(Instance + 104) = 0u;
        *(void *)(Instance + 12CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
      }
      else
      {
        if (a6) {
          __CPBitmapSetErrorIfNecessary(a6, (const __CFString *)*MEMORY[0x1E4F1D160], 12, "Could not allocate the writer");
        }
        dispatch_release(v18);
        if (Data) {
          CFRelease(Data);
        }
      }
    }
  }
  else if (a6)
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D160];
    size_t v10 = "Could not allocate the writer queue";
    unint64_t v11 = a6;
    CFIndex v12 = 12;
    goto LABEL_11;
  }
  return result;
}

void __CPBitmapWriterAddImage_block_invoke(uint64_t a1)
{
  values[3] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(CGImage **)(a1 + 40);
  if (!v2)
  {
    int v4 = *(CFErrorRef **)(a1 + 48);
    if (!v4) {
      return;
    }
    size_t v5 = "No images provided";
    CFIndex v6 = 1;
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (*(unsigned char *)(v3 + 64))
  {
    int v4 = *(CFErrorRef **)(a1 + 48);
    if (!v4) {
      return;
    }
    size_t v5 = "Writer already finalized";
    CFIndex v6 = 9;
LABEL_7:
    __CPBitmapSetErrorIfNecessary(v4, @"CPBitmapErrorDomain", v6, v5);
    return;
  }
  if (!*(void *)(v3 + 112))
  {
    unsigned int v10 = *(_DWORD *)(v3 + 28);
    if (v10 <= 7)
    {
      if (((1 << v10) & 0x2F) != 0)
      {
        unint64_t v11 = *(CFErrorRef **)(a1 + 48);
        uint64_t v93 = 0;
        long long v94 = &v93;
        uint64_t v95 = 0x2000000000;
        uint64_t v89 = 0;
        uint64_t v90 = &v89;
        uint64_t v91 = 0x2000000000;
        uint64_t v92 = 0;
        uint64_t v85 = 0;
        uint64_t v86 = &v85;
        uint64_t v87 = 0x2000000000;
        uint64_t v88 = 0;
        uint64_t v96 = 0;
        keys = (void *)MEMORY[0x1E4F143A8];
        uint64_t v98 = 0x40000000;
        uint64_t v99 = ____CPCGBitmapContextBlockSetup_block_invoke;
        int v100 = &unk_1E5669348;
        int v101 = &v85;
        unint64_t v102 = &v89;
        uint64_t v103 = &v93;
        size_t Width = CGImageGetWidth(v2);
        size_t Height = CGImageGetHeight(v2);
        CFStringRef v14 = malloc_type_malloc(0x38uLL, 0x10200401A3D0951uLL);
        uint64_t v15 = v94;
        v94[3] = (uint64_t)v14;
        if (v14)
        {
          v14[6] = 0;
          *((_OWORD *)v14 + 1) = 0u;
          *((_OWORD *)v14 + 2) = 0u;
          *(_OWORD *)CFStringRef v14 = 0u;
          int v16 = *(_DWORD *)(v3 + 32);
          if (v16)
          {
            ColorSpace = CGImageGetColorSpace(v2);
            CGColorSpaceRef v18 = CGColorSpaceRetain(ColorSpace);
            *(void *)v94[3] = v18;
            uint64_t v15 = v94;
          }
          if (__CPBitmapGetImageInfoForFormat(*(_DWORD *)(v3 + 28), Width, Height, v15[3], 1, 0))
          {
            char v19 = v16 & 1;
            if (v16 & 1) == 0 || (CGColorSpaceEqualToColorSpace())
            {
              CFDataRef Data = 0;
              goto LABEL_25;
            }
            CFPropertyListRef v52 = CGColorSpaceCopyPropertyList(*(CGColorSpaceRef *)v94[3]);
            if (v52)
            {
              CGImageRef v53 = v52;
              CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v52, kCFPropertyListBinaryFormat_v1_0, 0, v11);
              CFRelease(v53);
              if (Data)
              {
LABEL_25:
                if (Height >= 0x100) {
                  size_t v21 = 256;
                }
                else {
                  size_t v21 = Height;
                }
                size_t v22 = *(void *)(v94[3] + 32) * v21;
                unint64_t v23 = malloc_type_malloc(v22, 0xF610C80AuLL);
                v90[3] = (uint64_t)v23;
                if (v23)
                {
                  CGContextRef v24 = CGBitmapContextCreate(v23, Width, v21, *(void *)(v94[3] + 16), *(void *)(v94[3] + 32), *(CGColorSpaceRef *)v94[3], *(_DWORD *)(v94[3] + 48));
                  v86[3] = (uint64_t)v24;
                  if (v24)
                  {
                    uint64_t aBlock = MEMORY[0x1E4F143A8];
                    uint64_t v61 = 0x40000000;
                    unsigned int v62 = ____CPCGBitmapContextBlockSetup_block_invoke_2;
                    unint64_t v63 = &unk_1E5669370;
                    char v71 = v19;
                    int v68 = (uint64_t *)v21;
                    int v69 = (uint64_t *)Width;
                    unsigned int v64 = &v93;
                    int v65 = &v89;
                    size_t v70 = v22;
                    v66 = &v85;
                    uint64_t v67 = (uint64_t *)Height;
                    *(void *)(v3 + 96) = Width;
                    *(void *)(v3 + 104) = Height;
                    *(void *)(v3 + 56) = Data;
                    *(void *)(v3 + 112) = _Block_copy(&aBlock);
                    *(void *)(v3 + 12CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = _Block_copy(&keys);
                    _Block_object_dispose(&v85, 8);
                    _Block_object_dispose(&v89, 8);
                    _Block_object_dispose(&v93, 8);
                    goto LABEL_11;
                  }
                  if (!v11) {
                    goto LABEL_64;
                  }
                  CFStringRef v48 = @"CPBitmapErrorDomain";
                  uint64_t v49 = "Could not create bitmap context with desired arguments";
                  int v50 = v11;
                  CFIndex v51 = 3;
                }
                else
                {
                  if (!v11) {
                    goto LABEL_64;
                  }
                  CFStringRef v48 = (const __CFString *)*MEMORY[0x1E4F1D160];
                  uint64_t v49 = "Could not allocate bitmap buffer";
                  int v50 = v11;
                  CFIndex v51 = 12;
                }
                __CPBitmapSetErrorIfNecessary(v50, v48, v51, v49);
LABEL_64:
                if (Data) {
                  CFRelease(Data);
                }
              }
LABEL_66:
              ((void (*)(void **, void, void))v99)(&keys, 0, 0);
              _Block_object_dispose(&v85, 8);
              _Block_object_dispose(&v89, 8);
              _Block_object_dispose(&v93, 8);
              return;
            }
            if (!v11) {
              goto LABEL_66;
            }
            CFStringRef v41 = @"CPBitmapErrorDomain";
            uint64_t v42 = "Failed to create colorSpace plist";
            BOOL v43 = v11;
            CFIndex v44 = 8;
          }
          else
          {
            if (!v11) {
              goto LABEL_66;
            }
            CFStringRef v41 = @"CPBitmapErrorDomain";
            uint64_t v42 = "Trying to serialize invalid bitmap format";
            BOOL v43 = v11;
            CFIndex v44 = 3;
          }
        }
        else
        {
          if (!v11) {
            goto LABEL_66;
          }
          CFStringRef v41 = (const __CFString *)*MEMORY[0x1E4F1D160];
          uint64_t v42 = "Could not allocate bitmap info";
          BOOL v43 = v11;
          CFIndex v44 = 12;
        }
        __CPBitmapSetErrorIfNecessary(v43, v41, v44, v42);
        goto LABEL_66;
      }
      BOOL v26 = *(CFErrorRef **)(a1 + 48);
      uint64_t v93 = 0;
      long long v94 = &v93;
      uint64_t v95 = 0x2000000000;
      uint64_t v96 = 0;
      uint64_t v89 = 0;
      uint64_t v90 = &v89;
      uint64_t v91 = 0x2000000000;
      uint64_t v92 = 0;
      uint64_t v85 = 0;
      uint64_t v86 = &v85;
      uint64_t v87 = 0x2000000000;
      uint64_t v88 = 0;
      uint64_t v81 = 0;
      uint64_t v82 = &v81;
      uint64_t v83 = 0x2000000000;
      uint64_t v84 = 0;
      uint64_t v77 = 0;
      uint64_t v78 = &v77;
      uint64_t v79 = 0x2000000000;
      uint64_t v80 = 0;
      uint64_t v73 = 0;
      int v74 = &v73;
      uint64_t v75 = 0x2000000000;
      uint64_t v76 = 0;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v61 = 0x40000000;
      unsigned int v62 = ____CPCGDestinationKTXBlockSetup_block_invoke;
      unint64_t v63 = &unk_1E5669398;
      unsigned int v64 = &v73;
      int v65 = &v77;
      v66 = &v81;
      uint64_t v67 = &v85;
      int v68 = &v93;
      int v69 = &v89;
      size_t v27 = CGImageGetWidth(v2);
      size_t v28 = CGImageGetHeight(v2);
      int v29 = *(_DWORD *)(v3 + 28);
      if ((v29 & 0xFFFFFFFE) == 6) {
        CFStringRef v30 = @"com.apple.atx";
      }
      else {
        CFStringRef v30 = @"org.khronos.ktx";
      }
      char v31 = malloc_type_malloc(0x18uLL, 0x1060040C052FB36uLL);
      v94[3] = (uint64_t)v31;
      if (!v31
        || (*(void *)char v31 = v3,
            v31[2] = 0,
            *((void *)v31 + 2) = 0,
            unsigned int v32 = CGDataConsumerCreate((void *)v94[3], (const CGDataConsumerCallbacks *)&__CPCGDestinationKTXDataConsumerCallbacks), (v90[3] = (uint64_t)v32) == 0))
      {
        if (!v26)
        {
LABEL_48:
          ((void (*)(uint64_t *, void, void))v62)(&aBlock, 0, 0);
          int v47 = 0;
          goto LABEL_49;
        }
        CFStringRef v45 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFIndex v46 = "Could not allocate ATX/KTX data consumer";
LABEL_47:
        __CPBitmapSetErrorIfNecessary(v26, v45, 12, v46);
        goto LABEL_48;
      }
      CGImageDestinationRef v33 = CGImageDestinationCreateWithDataConsumer(v32, v30, *(void *)(v3 + 40), 0);
      v86[3] = (uint64_t)v33;
      if (!v33)
      {
        if (!v26) {
          goto LABEL_48;
        }
        CFStringRef v45 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFIndex v46 = "Could not allocate ATX/KTX destination";
        goto LABEL_47;
      }
      int v34 = *(_DWORD *)(v3 + 32);
      if (v34)
      {
        UChar32 v35 = CGImageGetColorSpace(v2);
        CGColorSpaceRef v36 = CGColorSpaceRetain(v35);
        v74[3] = (uint64_t)v36;
      }
      if (v29 == 7)
      {
        keys = (void *)*MEMORY[0x1E4F2F6C8];
        values[0] = *(void **)MEMORY[0x1E4F2F4B8];
        CFAllocatorRef v37 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CGImageRef v38 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D048];
        unint64_t v39 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
        CFIndex v40 = 1;
      }
      else
      {
        int v54 = *(_DWORD *)(v3 + 28);
        int valuePtr = 68;
        CFAllocatorRef v55 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFNumberRef v56 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
        v82[3] = (uint64_t)v56;
        if (!v56)
        {
LABEL_74:
          if (!v26) {
            goto LABEL_48;
          }
          CFStringRef v45 = (const __CFString *)*MEMORY[0x1E4F1D160];
          CFIndex v46 = "Could not allocate ATX/KTX props";
          goto LABEL_47;
        }
        CFDataRef v57 = (void *)*MEMORY[0x1E4F1CFD0];
        if (v54 != 6) {
          CFDataRef v57 = (void *)*MEMORY[0x1E4F1CFC8];
        }
        uint64_t v58 = *MEMORY[0x1E4F2F4E0];
        keys = (void *)*MEMORY[0x1E4F2F6C8];
        uint64_t v98 = v58;
        uint64_t v99 = (void *)*MEMORY[0x1E4F2F500];
        values[0] = *(void **)MEMORY[0x1E4F2F4F0];
        values[1] = v56;
        values[2] = v57;
        CGImageRef v38 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D048];
        unint64_t v39 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
        CFAllocatorRef v37 = v55;
        CFIndex v40 = 3;
      }
      CFDictionaryRef v59 = CFDictionaryCreate(v37, (const void **)&keys, (const void **)values, v40, v38, v39);
      v78[3] = (uint64_t)v59;
      if (v59)
      {
        keys = (void *)MEMORY[0x1E4F143A8];
        uint64_t v98 = 0x40000000;
        uint64_t v99 = ____CPCGDestinationKTXBlockSetup_block_invoke_2;
        int v100 = &unk_1E56693C0;
        char v104 = v34 & 1;
        int v101 = &v73;
        unint64_t v102 = &v85;
        uint64_t v103 = &v77;
        *(void *)(v3 + 96) = v27;
        *(void *)(v3 + 104) = v28;
        *(void *)(v3 + 112) = _Block_copy(&keys);
        *(void *)(v3 + 12CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = _Block_copy(&aBlock);
        int v47 = 1;
LABEL_49:
        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(&v77, 8);
        _Block_object_dispose(&v81, 8);
        _Block_object_dispose(&v85, 8);
        _Block_object_dispose(&v89, 8);
        _Block_object_dispose(&v93, 8);
        if (!v47) {
          return;
        }
        goto LABEL_11;
      }
      goto LABEL_74;
    }
  }
LABEL_11:
  uint64_t v7 = *(void *)(a1 + 56);
  if (*(void *)(v7 + 112))
  {
    uint64_t v8 = *(void *)(v7 + 96);
    if (v8 == CGImageGetWidth(*(CGImageRef *)(a1 + 40))
      && (uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 104), v9 == CGImageGetHeight(*(CGImageRef *)(a1 + 40))))
    {
      if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 56) + 112) + 16))())
      {
        ++*(void *)(*(void *)(a1 + 56) + 88);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
    }
    else
    {
      uint64_t v25 = *(CFErrorRef **)(a1 + 48);
      if (v25) {
        __CPBitmapSetErrorIfNecessary(v25, @"CPBitmapErrorDomain", 2, "Mismatched image sizes");
      }
    }
  }
}

void __CPBitmapWriterFinalize_block_invoke(void *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  if (!*(unsigned char *)(v2 + 64))
  {
    *(unsigned char *)(v2 + 64) = 1;
    uint64_t v7 = *(const void **)(v2 + 112);
    if (v7)
    {
      _Block_release(v7);
      uint64_t v2 = a1[5];
      *(void *)(v2 + 112) = 0;
    }
    if (!*(void *)(v2 + 88))
    {
      uint64_t v3 = (CFErrorRef *)a1[6];
      if (!v3) {
        return;
      }
      CFStringRef v4 = @"CPBitmapErrorDomain";
      size_t v5 = "No images provided";
      CFIndex v6 = 1;
      goto LABEL_4;
    }
    uint64_t v8 = *(void *)(v2 + 120);
    if (v8)
    {
      int v9 = (*(uint64_t (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, a1[6]);
      _Block_release(*(const void **)(a1[5] + 120));
      uint64_t v2 = a1[5];
      *(void *)(v2 + 12CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
      if (!v9) {
        return;
      }
    }
    if (lseek(*(_DWORD *)(v2 + 24), 0, 2) == -1)
    {
      int v13 = (CFErrorRef *)a1[6];
      if (!v13) {
        return;
      }
      CFIndex v6 = *__error();
      CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D160];
      size_t v5 = "Could not seek to end of file";
      uint64_t v3 = v13;
      goto LABEL_4;
    }
    uint64_t v10 = a1[5];
    CFDataRef v11 = *(const __CFData **)(v10 + 56);
    if (v11)
    {
      unsigned int Length = CFDataGetLength(v11);
      uint64_t v10 = a1[5];
    }
    else
    {
      unsigned int Length = 0;
    }
    CFDataRef v14 = *(const __CFData **)(v10 + 48);
    if (v14)
    {
      int64_t v15 = CFDataGetLength(v14);
      uint64_t v10 = a1[5];
    }
    else
    {
      int64_t v15 = 0;
    }
    uint64_t v16 = *(void *)(v10 + 88);
    uint64_t v17 = *(void *)(v10 + 40);
    if (v16 != v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 134218240;
      *(void *)UChar32 v35 = v16;
      *(_WORD *)&v35[8] = 2048;
      *(void *)&v35[10] = v17;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "count=%zu does not equal expectedCount=%zu", (uint8_t *)&v34, 0x16u);
      uint64_t v10 = a1[5];
      uint64_t v16 = *(void *)(v10 + 88);
    }
    int v34 = Length;
    *(_DWORD *)UChar32 v35 = v15;
    *(int32x2_t *)&v35[4] = vmovn_s64(*(int64x2_t *)(v10 + 96));
    *(_DWORD *)&v35[12] = *(_DWORD *)(v10 + 28);
    *(_DWORD *)&v35[16] = v16;
    int v36 = -592100446;
    if (Length)
    {
      int v18 = *(_DWORD *)(v10 + 24);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(v10 + 56));
      if (write(v18, BytePtr, Length) == -1)
      {
        CFStringRef v30 = (CFErrorRef *)a1[6];
        if (!v30) {
          return;
        }
        CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFIndex v32 = *__error();
        CGImageDestinationRef v33 = "Could not write colorSpace data";
        goto LABEL_51;
      }
      uint64_t v10 = a1[5];
    }
    if (v15 >= 1)
    {
      int v20 = *(_DWORD *)(v10 + 24);
      size_t v21 = CFDataGetBytePtr(*(CFDataRef *)(v10 + 48));
      if (write(v20, v21, v15) == -1)
      {
        CFStringRef v30 = (CFErrorRef *)a1[6];
        if (!v30) {
          return;
        }
        CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F1D160];
        CFIndex v32 = *__error();
        CGImageDestinationRef v33 = "Could not write info data";
        goto LABEL_51;
      }
      uint64_t v10 = a1[5];
    }
    if (write(*(_DWORD *)(v10 + 24), &v34, 0x1CuLL) == -1)
    {
      CFStringRef v30 = (CFErrorRef *)a1[6];
      if (!v30) {
        return;
      }
      CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFIndex v32 = *__error();
      CGImageDestinationRef v33 = "Could not write trailer";
      goto LABEL_51;
    }
    off_t v22 = lseek(*(_DWORD *)(a1[5] + 24), 0, 2);
    if (v22 == -1)
    {
      CFStringRef v30 = (CFErrorRef *)a1[6];
      if (!v30) {
        return;
      }
      CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFIndex v32 = *__error();
      CGImageDestinationRef v33 = "Could not seek to end of file after writing";
      goto LABEL_51;
    }
    off_t v24 = v22;
    uint64_t v25 = a1[5];
    BOOL v26 = *(const std::__fs::filesystem::path **)(v25 + 72);
    if (v26)
    {
      size_t v27 = *(const std::__fs::filesystem::path **)(v25 + 80);
      if (v27)
      {
        rename(v26, v27, v23);
        if (v28 == -1)
        {
          CFStringRef v30 = (CFErrorRef *)a1[6];
          if (!v30) {
            return;
          }
          CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F1D160];
          CFIndex v32 = *__error();
          CGImageDestinationRef v33 = "Could not rename temp file to dest path";
LABEL_51:
          __CPBitmapSetErrorIfNecessary(v30, v31, v32, v33);
          return;
        }
        uint64_t v25 = a1[5];
      }
    }
    if (*(unsigned char *)(v25 + 65))
    {
      int v29 = *(_DWORD *)(v25 + 24);
      if (v29 != -1)
      {
        if (close(v29))
        {
          CFStringRef v30 = (CFErrorRef *)a1[6];
          if (!v30) {
            return;
          }
          CFStringRef v31 = (const __CFString *)*MEMORY[0x1E4F1D160];
          CFIndex v32 = *__error();
          CGImageDestinationRef v33 = "Could not close the file";
          goto LABEL_51;
        }
        *(unsigned char *)(a1[5] + 65) = 0;
      }
    }
    *(void *)(*(void *)(a1[4] + 8) + 24) = v24;
    return;
  }
  uint64_t v3 = (CFErrorRef *)a1[6];
  if (!v3) {
    return;
  }
  CFStringRef v4 = @"CPBitmapErrorDomain";
  size_t v5 = "Writer already finalized";
  CFIndex v6 = 9;
LABEL_4:
  __CPBitmapSetErrorIfNecessary(v3, v4, v6, v5);
}

void finalizeWriter(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 16);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  CFStringRef v4 = *(const void **)(a1 + 56);
  if (v4) {
    CFRelease(v4);
  }
  size_t v5 = *(const void **)(a1 + 112);
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v6 = *(void *)(a1 + 120);
  if (v6)
  {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
    _Block_release(*(const void **)(a1 + 120));
  }
  if (*(unsigned char *)(a1 + 65))
  {
    int v7 = *(_DWORD *)(a1 + 24);
    if (v7 != -1) {
      close(v7);
    }
  }
  uint64_t v8 = *(void **)(a1 + 72);
  if (v8) {
    free(v8);
  }
  int v9 = *(void **)(a1 + 80);
  if (v9)
  {
    free(v9);
  }
}

ssize_t __CPCGDestinationKTXDataConsumerPutBytes(uint64_t a1, const void *a2, size_t a3)
{
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  ssize_t result = pwrite(*(_DWORD *)(*(void *)a1 + 24), a2, a3, *(void *)(a1 + 16));
  if (result < 0)
  {
    size_t v5 = __error();
    ssize_t result = 0;
    int v6 = *v5;
    if (!v6) {
      int v6 = 5;
    }
    *(_DWORD *)(a1 + 8) = v6;
  }
  else
  {
    *(void *)(a1 + 16) += result;
  }
  return result;
}

CGImageRef create_image_with_memory(const void *a1, uint64_t a2, int a3)
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  int v6 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  *int v6 = a3;
  int v7 = CGDataProviderCreateWithData(v6, a1, *(void *)(a2 + 8), (CGDataProviderReleaseDataCallback)release_munmap);
  unsigned int v8 = *(unsigned __int8 *)(a2 + 40);
  if (v8 < 3)
  {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
    goto LABEL_5;
  }
  if (v8 - 3 < 2)
  {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
LABEL_5:
    uint64_t v10 = DeviceRGB;
    unsigned int v8 = *(unsigned __int8 *)(a2 + 40);
    goto LABEL_6;
  }
  if (v8 != 5)
  {
    uint64_t v10 = 0;
LABEL_6:
    if (v8 > 5)
    {
      size_t v11 = 0;
    }
    else
    {
      if (v8 == 2)
      {
        size_t v11 = 5;
        goto LABEL_21;
      }
      size_t v11 = 8;
    }
    if (v8 > 5)
    {
      size_t v12 = 0;
      goto LABEL_23;
    }
    if (((1 << v8) & 3) != 0)
    {
      size_t v12 = 32;
      goto LABEL_23;
    }
    if (((1 << v8) & 0xC) == 0)
    {
      size_t v12 = 8;
LABEL_23:
      if (v8 > 5) {
        CGBitmapInfo v20 = 0;
      }
      else {
        CGBitmapInfo v20 = dword_18FBBC030[(char)v8];
      }
      CGImageRef v13 = CGImageCreate(*(void *)(a2 + 16), *(void *)(a2 + 24), v11, v12, *(void *)(a2 + 32), v10, v20, v7, 0, 0, kCGRenderingIntentDefault);
      CGColorSpaceRelease(v10);
      goto LABEL_27;
    }
LABEL_21:
    size_t v12 = 16;
    goto LABEL_23;
  }
  CGImageRef v13 = CGImageMaskCreate(*(void *)(a2 + 16), *(void *)(a2 + 24), 8uLL, 8uLL, *(void *)(a2 + 32), v7, create_image_with_memory_decode, 0);
  if (v13 && *(unsigned char *)(a2 + 40) == 5)
  {
    LOBYTE(v14) = *(unsigned char *)(a2 + 41);
    double v16 = (double)v14 / 255.0;
    LOBYTE(v15) = *(unsigned char *)(a2 + 42);
    double v17 = (double)v15 / 255.0;
    components[0] = v16;
    components[1] = v17;
    LOBYTE(v16) = *(unsigned char *)(a2 + 43);
    LOBYTE(v17) = *(unsigned char *)(a2 + 44);
    components[2] = (double)*(unint64_t *)&v16 / 255.0;
    components[3] = (double)*(unint64_t *)&v17 / 255.0;
    int v18 = CGColorSpaceCreateDeviceRGB();
    char v19 = CGColorCreate(v18, components);
    CGImageSetProperty();
    CGColorSpaceRelease(v18);
    CGColorRelease(v19);
  }
LABEL_27:
  CGDataProviderRelease(v7);
  return v13;
}

void release_munmap(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  size_t v5 = (void *)(a2 - v4);
  size_t v6 = v4 + a3;
  munlock((const void *)(a2 - v4), v4 + a3);
  munmap(v5, v6);
  free(a1);
}

void *_CPLog(uint64_t a1, const void *a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  _CPLog_os_log_shim();
  if (os_log_shim_legacy_logging_enabled()) {
    _logV(a1, a2, 0, 0, 0, a3, a4, &a9);
  }
  return _releaseObfuscatedStrings();
}

uint64_t _CPLog_os_log_shim()
{
  return os_log_shim_with_CFString();
}

void _logV(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFString *a7, va_list a8)
{
  unint64_t v13 = _settingsForFacility(a2);
  uint64_t v14 = v13;
  atomic_store(1u, (unsigned __int8 *)(v13 + 165));
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(v13 + 64), memory_order_acquire);
  unint64_t v16 = atomic_load_explicit((atomic_ullong *volatile)(v13 + 72), memory_order_acquire);
  unint64_t v17 = atomic_load_explicit((atomic_ullong *volatile)(v13 + 16), memory_order_acquire);
  int v18 = atomic_load_explicit((atomic_uint *volatile)(v13 + 52), memory_order_acquire);
  if (atomic_load_explicit((atomic_uint *volatile)(v13 + 52), memory_order_acquire) == -3)
  {
    unint64_t v19 = v13;
    do
    {
      int v18 = atomic_load_explicit((atomic_uint *volatile)(v19 + 44), memory_order_acquire);
      if (v18 != -2) {
        break;
      }
      unint64_t v19 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      int v18 = atomic_load_explicit((atomic_uint *volatile)(v19 + 52), memory_order_acquire);
    }
    while (atomic_load_explicit((atomic_uint *volatile)(v19 + 52), memory_order_acquire) == -3);
  }
  int v20 = atomic_load_explicit((atomic_uint *volatile)(v13 + 56), memory_order_acquire);
  if (v20 == -3)
  {
    unint64_t v21 = v13;
    do
    {
      int v20 = atomic_load_explicit((atomic_uint *volatile)(v21 + 48), memory_order_acquire);
      if (v20 != -2) {
        break;
      }
      unint64_t v21 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      int v20 = atomic_load_explicit((atomic_uint *volatile)(v21 + 56), memory_order_acquire);
    }
    while (v20 == -3);
  }
  if (v18 >= (int)a1 || v20 >= (int)a1)
  {
    unint64_t v48 = v17;
    uint64_t v49 = a6;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFDateRef v23 = CFDateCreate(0, Current);
    CFStringRef v24 = CFStringCreateWithFormatAndArguments(0, 0, a7, a8);
    if (!v24) {
      CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"Log message cannot be formatted. Format string: %@", a7);
    }
    if (v18 >= (int)a1 && v20 >= (int)a1 && !v16 && !explicit)
    {
      StandardConsoleLogLine = _createStandardConsoleLogLine(a1, (uint64_t)a2, a3, a4, a5, (uint64_t)v24);
      goto LABEL_18;
    }
    if (v18 < (int)a1)
    {
      StandardConsoleLogLine = 0;
    }
    else
    {
      if (v16) {
        size_t v27 = (__CFString *)(*(uint64_t (**)(unint64_t, uint64_t, const __CFDate *, unint64_t, const void *, uint64_t, uint64_t, uint64_t, uint64_t, CFStringRef))(v16 + 16))(v16, a1, v23, v48, a2, a3, a4, a5, v49, v24);
      }
      else {
        size_t v27 = _createStandardConsoleLogLine(a1, (uint64_t)a2, a3, a4, a5, (uint64_t)v24);
      }
      StandardConsoleLogLine = v27;
    }
    if (v20 < (int)a1) {
      goto LABEL_32;
    }
    if (explicit)
    {
      CFStringRef StandardFileLogLine = (CFStringRef)(*(uint64_t (**)(unint64_t, uint64_t, const __CFDate *, unint64_t, const void *, uint64_t, uint64_t, uint64_t, uint64_t, CFStringRef))(explicit + 16))(explicit, a1, v23, v48, a2, a3, a4, a5, v49, v24);
      goto LABEL_28;
    }
    if (StandardConsoleLogLine)
    {
LABEL_18:
      CFStringRef StandardFileLogLine = _createStandardFileLogLine(v23, (uint64_t)StandardConsoleLogLine);
LABEL_28:
      CFStringRef v28 = StandardFileLogLine;
      goto LABEL_33;
    }
    StandardConsoleLogLine = _createStandardConsoleLogLine(a1, (uint64_t)a2, a3, a4, a5, (uint64_t)v24);
    if (StandardConsoleLogLine)
    {
      CFStringRef v28 = _createStandardFileLogLine(v23, (uint64_t)StandardConsoleLogLine);
      CFRelease(StandardConsoleLogLine);
      StandardConsoleLogLine = 0;
    }
    else
    {
LABEL_32:
      CFStringRef v28 = 0;
    }
LABEL_33:
    if (v23) {
      CFRelease(v23);
    }
    if (v24) {
      CFRelease(v24);
    }
    if (StandardConsoleLogLine)
    {
      int v29 = *(__asl_object_s **)(v14 + 104);
      for (unsigned int i = atomic_load_explicit((atomic_uint *volatile)(v14 + 156), memory_order_acquire);
            !i;
            unsigned int i = atomic_load_explicit((atomic_uint *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 156), memory_order_acquire))
      {
        ;
      }
      BOOL v31 = i == 2;
      if (*(void *)(v14 + 88))
      {
        unint64_t v33 = atomic_load_explicit((atomic_ullong *volatile)(v14 + 88), memory_order_acquire);
        if (!v28)
        {
          BOOL v35 = 0;
          unint64_t v32 = 0;
          int v36 = 1;
          goto LABEL_47;
        }
      }
      else
      {
        unint64_t v32 = 0;
        if (!v28)
        {
          BOOL v35 = 0;
          int v36 = 1;
          goto LABEL_52;
        }
        unint64_t v33 = 0;
      }
    }
    else
    {
      if (!v28)
      {
        CFLog();
        return;
      }
      int v29 = 0;
      BOOL v31 = 0;
      unint64_t v33 = 0;
    }
    for (int j = *(_DWORD *)(v14 + 160);
          !j;
    BOOL v35 = j == 2;
    int v36 = 0;
    if (*(void *)(v14 + 96)) {
      unint64_t v32 = atomic_load_explicit((atomic_ullong *volatile)(v14 + 96), memory_order_acquire);
    }
    else {
      unint64_t v32 = 0;
    }
LABEL_47:
    if (!StandardConsoleLogLine
      || v33
      && !(*(unsigned int (**)(unint64_t, uint64_t, __CFString *, uint64_t, void))(v33 + 16))(v33, a1, StandardConsoleLogLine, v49, 0))
    {
LABEL_65:
      if (v36) {
        goto LABEL_78;
      }
LABEL_69:
      if (v32
        && !(*(unsigned int (**)(unint64_t, uint64_t, const __CFString *, uint64_t, void))(v32 + 16))(v32, a1, v28, v49, 0))
      {
        goto LABEL_78;
      }
      if (v35)
      {
        CFStringRef v44 = CFStringCreateWithFormat(0, 0, @"%@\n", v28);
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v44, 0x8000100u, 0);
        CFRelease(v44);
        if (ExternalRepresentation)
        {
LABEL_73:
          WorkSettingsFromSettings = _createWorkSettingsFromSettings(v14);
          atomic_store(0, (unsigned __int8 *)(v14 + 164));
          if (_workGroup_once != -1) {
            dispatch_once(&_workGroup_once, &__block_literal_global_169);
          }
          int v47 = _workGroup_group;
          if (_workQueue_once != -1) {
            dispatch_once(&_workQueue_once, &__block_literal_global_171);
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = ___performLog_block_invoke;
          block[3] = &__block_descriptor_48_e5_v8__0l;
          block[4] = WorkSettingsFromSettings;
          block[5] = ExternalRepresentation;
          dispatch_group_async(v47, (dispatch_queue_t)_workQueue_queue, block);
LABEL_78:
          if (!StandardConsoleLogLine) {
            goto LABEL_80;
          }
          goto LABEL_79;
        }
      }
      else
      {
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v28, 0x8000100u, 0);
        if (ExternalRepresentation) {
          goto LABEL_73;
        }
      }
      CFLog();
      if (!StandardConsoleLogLine)
      {
LABEL_80:
        if (v28) {
          CFRelease(v28);
        }
        return;
      }
LABEL_79:
      CFRelease(StandardConsoleLogLine);
      goto LABEL_80;
    }
LABEL_52:
    int v54 = v36;
    CStringPtr = CFStringGetCStringPtr(StandardConsoleLogLine, 0x8000100u);
    UTF8StringFromString = (unsigned __int16 *)CStringPtr;
    if (!CStringPtr) {
      UTF8StringFromString = _createUTF8StringFromString(StandardConsoleLogLine);
    }
    if (v31) {
      int v39 = a1;
    }
    else {
      int v39 = 5;
    }
    if (v29) {
      goto LABEL_61;
    }
    CFPropertyListRef v52 = StandardConsoleLogLine;
    BOOL v40 = v35;
    CFStringRef v41 = v28;
    asl_object_t v42 = asl_new(0);
    int v29 = v42;
    BOOL v43 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v14 + 104), (unint64_t *)&v43, (unint64_t)v42);
    if (v43)
    {
      MEMORY[0x192FBEFD0](v42);
      int v29 = v43;
    }
    CFStringRef v28 = v41;
    BOOL v35 = v40;
    StandardConsoleLogLine = v52;
    if (v29)
    {
LABEL_61:
      if (_aslClient_once != -1) {
        dispatch_once(&_aslClient_once, &__block_literal_global_161);
      }
      asl_log((asl_object_t)_aslClient_client, v29, v39, "%s", (const char *)UTF8StringFromString);
      if (CStringPtr) {
        goto LABEL_64;
      }
    }
    else
    {
      CFLog();
      if (CStringPtr)
      {
LABEL_64:
        LOBYTE(v36) = v54;
        goto LABEL_65;
      }
    }
    free(UTF8StringFromString);
    if (v54) {
      goto LABEL_79;
    }
    goto LABEL_69;
  }
}

void *_releaseObfuscatedStrings()
{
  if (_obfuscatedStringKey_onceToken != -1) {
    dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_232);
  }
  ssize_t result = pthread_getspecific(_obfuscatedStringKey_key);
  if (result)
  {
    CFRelease(result);
    if (_obfuscatedStringKey_onceToken != -1) {
      dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_232);
    }
    pthread_key_t v1 = _obfuscatedStringKey_key;
    return (void *)pthread_setspecific(v1, 0);
  }
  return result;
}

void *_CPLogLine(uint64_t a1, const void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  _CPLog_os_log_shim();
  if (os_log_shim_legacy_logging_enabled())
  {
    unint64_t v16 = strrchr(a3, 47);
    if (v16) {
      uint64_t v17 = (uint64_t)(v16 + 1);
    }
    else {
      uint64_t v17 = (uint64_t)a3;
    }
    _logV(a1, a2, v17, a4, a5, a6, a7, &a9);
  }
  return _releaseObfuscatedStrings();
}

void *CPLogV(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const __CFString *a7, va_list a8)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  _CPLog_os_log_shim();
  if (os_log_shim_legacy_logging_enabled()) {
    _logV(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  return _releaseObfuscatedStrings();
}

void CPLoggingAppendDataToLogFile(signed int a1, const void *a2, CFDataRef theData, void *a4)
{
  if (_init_once == -1)
  {
    if (!theData)
    {
LABEL_21:
      if (!a4) {
        return;
      }
      if (_callbackQueue_onceToken != -1) {
        dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_163);
      }
      size_t v12 = _callbackQueue_queue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __CPLoggingAppendDataToLogFile_block_invoke;
      char v19[3] = &unk_1E5669580;
      v19[4] = a4;
      unint64_t v13 = v19;
      goto LABEL_25;
    }
  }
  else
  {
    dispatch_once(&_init_once, &__block_literal_global_66);
    if (!theData) {
      goto LABEL_21;
    }
  }
  if (!CFDataGetLength(theData)) {
    goto LABEL_21;
  }
  unint64_t v8 = _settingsForFacility(a2);
  uint64_t v9 = v8;
  signed int explicit = atomic_load_explicit((atomic_uint *volatile)(v8 + 56), memory_order_acquire);
  if (explicit == -3)
  {
    unint64_t v11 = v8;
    do
    {
      signed int explicit = atomic_load_explicit((atomic_uint *volatile)(v11 + 48), memory_order_acquire);
      if (explicit != -2) {
        break;
      }
      unint64_t v11 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      signed int explicit = atomic_load_explicit((atomic_uint *volatile)(v11 + 56), memory_order_acquire);
    }
    while (explicit == -3);
  }
  if (explicit < a1)
  {
    if (!a4) {
      return;
    }
    if (_callbackQueue_onceToken != -1) {
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_163);
    }
    size_t v12 = _callbackQueue_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __CPLoggingAppendDataToLogFile_block_invoke_2;
    v18[3] = &unk_1E5669580;
    v18[4] = a4;
    unint64_t v13 = v18;
LABEL_25:
    dispatch_async(v12, v13);
    return;
  }
  CFDataRef Copy = CFDataCreateCopy(0, theData);
  if (a4) {
    a4 = _Block_copy(a4);
  }
  WorkSettingsFromSettings = _createWorkSettingsFromSettings(v9);
  atomic_store(0, (unsigned __int8 *)(v9 + 164));
  if (_workGroup_once != -1) {
    dispatch_once(&_workGroup_once, &__block_literal_global_169);
  }
  unint64_t v16 = _workGroup_group;
  if (_workQueue_once != -1) {
    dispatch_once(&_workQueue_once, &__block_literal_global_171);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __CPLoggingAppendDataToLogFile_block_invoke_3;
  block[3] = &unk_1E56695A8;
  block[5] = WorkSettingsFromSettings;
  void block[6] = Copy;
  block[4] = a4;
  dispatch_group_async(v16, (dispatch_queue_t)_workQueue_queue, block);
}

uint64_t __CPLoggingAppendDataToLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t _settingsForFacility(const void *a1)
{
  unint64_t explicit = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
  if (a1)
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)explicit, memory_order_acquire);
    if (explicit)
    {
      while (1)
      {
        CFArrayRef v3 = *(const __CFArray **)(explicit + 8);
        if (v3)
        {
          v5.CFIndex length = CFArrayGetCount(*(CFArrayRef *)(explicit + 8));
          v5.location = 0;
          if (CFArrayContainsValue(v3, v5, a1)) {
            break;
          }
        }
        unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)explicit, memory_order_acquire);
        if (!explicit) {
          return atomic_load_explicit(&_logFileSettings, memory_order_acquire);
        }
      }
    }
    else
    {
      return atomic_load_explicit(&_logFileSettings, memory_order_acquire);
    }
  }
  return explicit;
}

uint64_t __CPLoggingAppendDataToLogFile_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *_createWorkSettingsFromSettings(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(0x50uLL, 1uLL, 0xD070C659uLL);
  CFArrayRef v3 = v2;
  if (v2)
  {
    *uint64_t v2 = atomic_load_explicit((atomic_ullong *volatile)(a1 + 8), memory_order_acquire);
    v2[1] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire);
    v2[2] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 24), memory_order_acquire);
    for (unint64_t i = atomic_load_explicit((atomic_ullong *volatile)(a1 + 32), memory_order_acquire);
          i == -2;
          unint64_t i = atomic_load_explicit((atomic_ullong *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 32), memory_order_acquire))
    {
      ;
    }
    v2[3] = i;
    for (unsigned int j = atomic_load_explicit((atomic_uint *volatile)(a1 + 40), memory_order_acquire);
          j == -2;
          unsigned int j = atomic_load_explicit((atomic_uint *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 40), memory_order_acquire))
    {
      ;
    }
    *((_DWORD *)v2 + 8) = j;
    v2[5] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 64), memory_order_acquire);
    v2[6] = atomic_load_explicit((atomic_ullong *volatile)(a1 + 80), memory_order_acquire);
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 96), memory_order_acquire);
    uint64_t v7 = *(void *)(a1 + 144);
    v2[7] = explicit;
    v2[8] = v7;
    for (unsigned int k = atomic_load_explicit((atomic_uint *volatile)(a1 + 152), memory_order_acquire);
          !k;
          unsigned int k = atomic_load_explicit((atomic_uint *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 152), memory_order_acquire))
    {
      ;
    }
    *((unsigned char *)v2 + 72) = k == 2;
    for (int m = *(_DWORD *)(a1 + 160);
          !m;
    *((unsigned char *)v2 + 73) = m == 2;
    *((unsigned char *)v2 + 74) = atomic_load_explicit((atomic_uchar *volatile)(a1 + 164), memory_order_acquire);
  }
  else
  {
    CFLog();
  }
  return v3;
}

void __CPLoggingAppendDataToLogFile_block_invoke_3(uint64_t a1)
{
  _workQueueAppendDataToLogFile(*(void *)(a1 + 40), *(const __CFData **)(a1 + 48));
  free(*(void **)(a1 + 40));
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)(a1 + 32))
  {
    if (_callbackQueue_onceToken != -1) {
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_163);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CPLoggingAppendDataToLogFile_block_invoke_4;
    block[3] = &unk_1E5669580;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

void _workQueueAppendDataToLogFile(uint64_t a1, const __CFData *a2)
{
  if (!a1 || (CFArrayRef v3 = *(void **)(a1 + 64)) == 0)
  {
    CFLog();
    return;
  }
  if (*(uint64_t *)(a1 + 24) < 1) {
    goto LABEL_10;
  }
  if (*v3)
  {
    double v4 = MEMORY[0x192FBE2F0]();
    if (v4 < CFAbsoluteTimeGetCurrent())
    {
      CFRange v5 = **(const void ***)(a1 + 64);
      if (v5) {
        CFRelease(v5);
      }
      goto LABEL_8;
    }
LABEL_10:
    int64_t value = 0;
    goto LABEL_11;
  }
LABEL_8:
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  **(void **)(a1 + 64) = CFDateCreate(0, Current + 13.0);
  int64_t value = *(void *)(a1 + 24);
LABEL_11:
  BOOL v31 = 0;
  CFStringRef v7 = 0;
  for (unsigned int i = 0; i < 3; ++i)
  {
    if (v7) {
      CFRelease(v7);
    }
    CFStringRef v9 = *(const __CFString **)(*(void *)(a1 + 64) + 8);
    if (!v9)
    {
      _workQueueRefreshUUIDForWorkSettings(a1);
      CFStringRef v9 = *(const __CFString **)(*(void *)(a1 + 64) + 8);
      if (!v9)
      {
        uint64_t v27 = 0;
        CFStringRef v7 = 0;
        goto LABEL_48;
      }
    }
    int v10 = *(unsigned __int8 *)(a1 + 74);
    int v11 = *(unsigned __int8 *)(a1 + 72);
    int64_t v12 = *(int *)(a1 + 32);
    uint64_t v13 = _workQueueCopyConnection();
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      UTF8StringFromString = _createUTF8StringFromString(v9);
      uint64_t v36 = 0;
      uint64_t v37 = &v36;
      uint64_t v38 = 0x3052000000;
      int v39 = __Block_byref_object_copy__1;
      BOOL v40 = __Block_byref_object_dispose__1;
      uint64_t v41 = 0;
      unint64_t Length = CFDataGetLength(a2);
      if (_workQueueCreateMemoryMapOfSize_currentSize >= Length && _workQueueCreateMemoryMapOfSize_currentXPCObject)
      {
        xpc_retain((xpc_object_t)_workQueueCreateMemoryMapOfSize_currentXPCObject);
      }
      else
      {
        if (_workQueueCreateMemoryMapOfSize_currentSize)
        {
          xpc_release((xpc_object_t)_workQueueCreateMemoryMapOfSize_currentXPCObject);
          _workQueueCreateMemoryMapOfSize_currentXPCObject = 0;
          munmap((void *)_workQueueCreateMemoryMapOfSize_currentRegion, _workQueueCreateMemoryMapOfSize_currentSize);
        }
        uint64_t v17 = mmap(0, Length, 3, 4098, -1, 0);
        _workQueueCreateMemoryMapOfSize_currentRegion = (uint64_t)v17;
        if (v17 == (void *)-1)
        {
          BOOL v26 = __error();
          strerror(*v26);
          CFLog();
          CFStringRef v7 = 0;
          LODWORD(v18) = 0;
          _workQueueCreateMemoryMapOfSize_currentSize = 0;
          goto LABEL_40;
        }
        _workQueueCreateMemoryMapOfSize_currentSize = Length;
        _workQueueCreateMemoryMapOfSize_currentXPCObject = (uint64_t)xpc_shmem_create(v17, Length);
        xpc_retain((xpc_object_t)_workQueueCreateMemoryMapOfSize_currentXPCObject);
      }
      int v18 = (void *)_workQueueCreateMemoryMapOfSize_currentRegion;
      if (_workQueueCreateMemoryMapOfSize_currentRegion)
      {
        unint64_t v19 = (void *)_workQueueCreateMemoryMapOfSize_currentXPCObject;
        BytePtr = CFDataGetBytePtr(a2);
        memcpy(v18, BytePtr, Length);
        xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v21, "message", 2);
        xpc_dictionary_set_string(v21, "uuid", (const char *)UTF8StringFromString);
        xpc_dictionary_set_value(v21, "data", v19);
        xpc_dictionary_set_int64(v21, "length", Length);
        xpc_dictionary_set_BOOL(v21, "startnewfile", v10 != 0);
        xpc_dictionary_set_int64(v21, "sizecheck", value);
        xpc_dictionary_set_int64(v21, "maxfilecount", v12);
        xpc_dictionary_set_BOOL(v21, "wantscompressed", v11 != 0);
        xpc_release(v19);
        if (_waitForResponseQueue_once != -1) {
          dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ___workQueueLogToFileUUID_block_invoke;
        block[3] = &unk_1E5668FF8;
        block[4] = v14;
        void block[5] = v21;
        dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
        if (_waitForResponseSema_once != -1) {
          dispatch_once(&_waitForResponseSema_once, &__block_literal_global_221);
        }
        dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
        xpc_release(v21);
        if (_waitForResponseQueue_once != -1) {
          dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = ___workQueueLogToFileUUID_block_invoke_2;
        v34[3] = &unk_1E5669188;
        v34[4] = &v36;
        dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v34);
        off_t v22 = (void *)v37[5];
        if (v22)
        {
          BOOL v31 = xpc_dictionary_get_BOOL(v22, "didcreate");
          string = xpc_dictionary_get_string((xpc_object_t)v37[5], "newfilepath");
          CFStringRef v24 = (const UInt8 *)string;
          if (string)
          {
            size_t v25 = strlen(string);
            CFStringRef v7 = CFStringCreateWithBytes(0, v24, v25, 0x8000100u, 0);
          }
          else
          {
            CFStringRef v7 = 0;
          }
          LODWORD(v18) = xpc_dictionary_get_BOOL((xpc_object_t)v37[5], "retval");
          xpc_release((xpc_object_t)v37[5]);
        }
        else
        {
          CFLog();
          CFStringRef v7 = 0;
          LODWORD(v18) = 0;
        }
      }
      else
      {
        CFStringRef v7 = 0;
      }
LABEL_40:
      if (UTF8StringFromString) {
        free(UTF8StringFromString);
      }
      xpc_release(v14);
      _Block_object_dispose(&v36, 8);
      if (v18)
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
        goto LABEL_48;
      }
      goto LABEL_45;
    }
    CFStringRef v7 = 0;
LABEL_45:
    uint64_t v28 = *(void *)(a1 + 64);
    int v29 = *(const void **)(v28 + 8);
    if (v29)
    {
      CFRelease(v29);
      uint64_t v28 = *(void *)(a1 + 64);
    }
    uint64_t v27 = 0;
    *(void *)(v28 + 8) = 0;
LABEL_48:
    if (v27) {
      break;
    }
  }
  if (i >= 3) {
    CFLog();
  }
  uint64_t v30 = *(void *)(a1 + 48);
  if (v30 && v31) {
    (*(void (**)(uint64_t, CFStringRef))(v30 + 16))(v30, v7);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_18FBA7F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void __CPLoggingAppendDataToLogFile_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(const void **)(a1 + 32);
  _Block_release(v2);
}

void CPLoggingSlurpFileIntoLogFile(signed int a1, const void *a2, const __CFString *a3, const __CFString *Copy, const __CFString *a5, void *a6)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v12 = _settingsForFacility(a2);
  uint64_t v13 = v12;
  signed int explicit = atomic_load_explicit((atomic_uint *volatile)(v12 + 56), memory_order_acquire);
  if (explicit == -3)
  {
    unint64_t v15 = v12;
    do
    {
      signed int explicit = atomic_load_explicit((atomic_uint *volatile)(v15 + 48), memory_order_acquire);
      if (explicit != -2) {
        break;
      }
      unint64_t v15 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
      signed int explicit = atomic_load_explicit((atomic_uint *volatile)(v15 + 56), memory_order_acquire);
    }
    while (explicit == -3);
  }
  if (explicit >= a1)
  {
    if (Copy) {
      CFDataRef Copy = CFStringCreateCopy(0, Copy);
    }
    if (a3) {
      a3 = CFStringCreateCopy(0, a3);
    }
    if (a5) {
      a5 = CFStringCreateCopy(0, a5);
    }
    if (a6) {
      a6 = _Block_copy(a6);
    }
    WorkSettingsFromSettings = _createWorkSettingsFromSettings(v13);
    atomic_store(0, (unsigned __int8 *)(v13 + 164));
    if (_workGroup_once != -1) {
      dispatch_once(&_workGroup_once, &__block_literal_global_169);
    }
    uint64_t v17 = _workGroup_group;
    if (_workQueue_once != -1) {
      dispatch_once(&_workQueue_once, &__block_literal_global_171);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __CPLoggingSlurpFileIntoLogFile_block_invoke_2;
    v18[3] = &unk_1E56695D0;
    v18[6] = Copy;
    v18[7] = a3;
    v18[8] = a5;
    v18[4] = a6;
    void v18[5] = WorkSettingsFromSettings;
    dispatch_group_async(v17, (dispatch_queue_t)_workQueue_queue, v18);
  }
  else if (a6)
  {
    if (_callbackQueue_onceToken != -1) {
      dispatch_once(&_callbackQueue_onceToken, &__block_literal_global_163);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CPLoggingSlurpFileIntoLogFile_block_invoke;
    block[3] = &unk_1E5669580;
    block[4] = a6;
    dispatch_async((dispatch_queue_t)_callbackQueue_queue, block);
  }
}

uint64_t __CPLoggingSlurpFileIntoLogFile_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __CPLoggingSlurpFileIntoLogFile_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  CFStringRef v34 = *(const __CFString **)(a1 + 56);
  CFStringRef v35 = *(const __CFString **)(a1 + 48);
  CFStringRef v33 = *(const __CFString **)(a1 + 64);
  if (*(uint64_t *)(v1 + 24) < 1) {
    goto LABEL_7;
  }
  if (**(void **)(v1 + 64))
  {
    double v2 = MEMORY[0x192FBE2F0]();
    if (v2 < CFAbsoluteTimeGetCurrent())
    {
      CFArrayRef v3 = **(const void ***)(v1 + 64);
      if (v3) {
        CFRelease(v3);
      }
      goto LABEL_6;
    }
LABEL_7:
    int64_t value = 0;
    goto LABEL_8;
  }
LABEL_6:
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  **(void **)(v1 + 64) = CFDateCreate(0, Current + 13.0);
  int64_t value = *(void *)(v1 + 24);
LABEL_8:
  BOOL v30 = 0;
  CFStringRef v5 = 0;
  unsigned int v6 = 0;
  CFStringRef v7 = *(const __CFString **)(*(void *)(v1 + 64) + 8);
  uint64_t v31 = v1;
  do
  {
    if (!v7)
    {
      _workQueueRefreshUUIDForWorkSettings(v1);
      CFStringRef v7 = *(const __CFString **)(*(void *)(v1 + 64) + 8);
      if (!v7)
      {
        uint64_t v21 = 0;
        goto LABEL_42;
      }
    }
    if (v5)
    {
      CFRelease(v5);
      CFStringRef v7 = *(const __CFString **)(*(void *)(v1 + 64) + 8);
    }
    int v8 = *(unsigned __int8 *)(v1 + 74);
    int v9 = *(unsigned __int8 *)(v1 + 72);
    int64_t v10 = *(int *)(v1 + 32);
    xpc_object_t object = (xpc_object_t)_workQueueCopyConnection();
    if (object)
    {
      UTF8StringFromString = _createUTF8StringFromString(v7);
      unint64_t v12 = _createUTF8StringFromString(v35);
      int v13 = open((const char *)v12, 0);
      uint64_t v14 = _createUTF8StringFromString(v34);
      unint64_t v15 = _createUTF8StringFromString(v33);
      uint64_t v39 = 0;
      BOOL v40 = &v39;
      uint64_t v41 = 0x3052000000;
      asl_object_t v42 = __Block_byref_object_copy__1;
      BOOL v43 = __Block_byref_object_dispose__1;
      uint64_t v44 = 0;
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v16, "message", 4);
      xpc_dictionary_set_string(v16, "uuid", (const char *)UTF8StringFromString);
      xpc_dictionary_set_fd(v16, "slurpeefd", v13);
      xpc_dictionary_set_string(v16, "prefix", (const char *)v14);
      xpc_dictionary_set_string(v16, "suffix", (const char *)v15);
      xpc_dictionary_set_BOOL(v16, "startnewfile", v8 != 0);
      xpc_dictionary_set_int64(v16, "sizecheck", value);
      xpc_dictionary_set_int64(v16, "maxfilecount", v10);
      xpc_dictionary_set_BOOL(v16, "wantscompressed", v9 != 0);
      if (_waitForResponseQueue_once != -1) {
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___workQueueSlurpToFileUUID_block_invoke;
      block[3] = &unk_1E5668FF8;
      block[4] = object;
      void block[5] = v16;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
      if (_waitForResponseSema_once != -1) {
        dispatch_once(&_waitForResponseSema_once, &__block_literal_global_221);
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
      xpc_release(v16);
      if (_waitForResponseQueue_once != -1) {
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = ___workQueueSlurpToFileUUID_block_invoke_2;
      v37[3] = &unk_1E5669188;
      v37[4] = &v39;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v37);
      uint64_t v17 = (void *)v40[5];
      if (v17)
      {
        BOOL v30 = xpc_dictionary_get_BOOL(v17, "didcreate");
        string = xpc_dictionary_get_string((xpc_object_t)v40[5], "newfilepath");
        CFStringRef v5 = (CFStringRef)string;
        if (string)
        {
          size_t v19 = strlen(string);
          CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)v5, v19, 0x8000100u, 0);
        }
        BOOL v20 = xpc_dictionary_get_BOOL((xpc_object_t)v40[5], "retval");
        xpc_release((xpc_object_t)v40[5]);
      }
      else
      {
        CFLog();
        CFStringRef v5 = 0;
        BOOL v20 = 0;
      }
      if (v13 != -1) {
        close(v13);
      }
      if (UTF8StringFromString) {
        free(UTF8StringFromString);
      }
      if (v12) {
        free(v12);
      }
      if (v14) {
        free(v14);
      }
      if (v15) {
        free(v15);
      }
      xpc_release(object);
      _Block_object_dispose(&v39, 8);
      if (v20)
      {
        uint64_t v1 = v31;
        uint64_t v21 = *(void *)(*(void *)(v31 + 64) + 8);
        goto LABEL_42;
      }
      uint64_t v1 = v31;
    }
    else
    {
      CFStringRef v5 = 0;
    }
    uint64_t v22 = *(void *)(v1 + 64);
    CFDateRef v23 = *(const void **)(v22 + 8);
    if (v23)
    {
      CFRelease(v23);
      uint64_t v22 = *(void *)(v1 + 64);
    }
    uint64_t v21 = 0;
    *(void *)(v22 + 8) = 0;
LABEL_42:
    if (v21) {
      break;
    }
    ++v6;
    CFStringRef v7 = 0;
  }
  while (v6 < 3);
  if (v6 >= 3) {
    CFLog();
  }
  uint64_t v24 = *(void *)(v1 + 48);
  if (v24 && v30) {
    (*(void (**)(uint64_t, CFStringRef))(v24 + 16))(v24, v5);
  }
  if (v5) {
    CFRelease(v5);
  }
  free(*(void **)(a1 + 40));
  size_t v25 = *(const void **)(a1 + 48);
  if (v25) {
    CFRelease(v25);
  }
  BOOL v26 = *(const void **)(a1 + 56);
  if (v26) {
    CFRelease(v26);
  }
  uint64_t v27 = *(const void **)(a1 + 64);
  if (v27) {
    CFRelease(v27);
  }
  uint64_t v28 = *(void *)(a1 + 32);
  if (v28)
  {
    (*(void (**)(uint64_t))(v28 + 16))(v28);
    _Block_release(*(const void **)(a1 + 32));
  }
}

void sub_18FBA87D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void *_CPLogObfusc(void *a1)
{
  uint64_t v1 = _shouldObfuscate;
  LOBYTE(v1) = atomic_load_explicit(_shouldObfuscate, memory_order_acquire);
  if (v1) {
    return _obfuscatedRepresentation(a1);
  }
  return a1;
}

void *_obfuscatedRepresentation(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v1 = (void *)CFRetain(objc_msgSend(v1, sel_CPSafeDescription));
      if (!v1) {
        goto LABEL_27;
      }
LABEL_20:
      if (_obfuscatedStringKey_onceToken != -1) {
        dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_232);
      }
      CFDictionaryRef Mutable = pthread_getspecific(_obfuscatedStringKey_key);
      if (!Mutable)
      {
        CFDictionaryRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        if (_obfuscatedStringKey_onceToken != -1) {
          dispatch_once(&_obfuscatedStringKey_onceToken, &__block_literal_global_232);
        }
        pthread_setspecific(_obfuscatedStringKey_key, Mutable);
      }
      CFArrayAppendValue((CFMutableArrayRef)Mutable, v1);
      CFRelease(v1);
      goto LABEL_27;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v1 = (void *)_obfuscatedRepresentation(objc_msgSend(v1, sel_CPObfuscatedDescriptionObject));
    }
    else
    {
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFNumberGetTypeID())
      {
        if (_obfuscatedRepresentation_onceToken != -1) {
          dispatch_once(&_obfuscatedRepresentation_onceToken, &__block_literal_global_236);
        }
        CFStringRef StringWithNumber = CFNumberFormatterCreateStringWithNumber(0, (CFNumberFormatterRef)_obfuscatedRepresentation_numberFormatter, (CFNumberRef)v1);
      }
      else
      {
        CFStringRef StringWithNumber = (const __CFString *)CFRetain(objc_msgSend(v1, sel_description));
      }
      CFStringRef v5 = StringWithNumber;
      if (StringWithNumber)
      {
        UTF8StringFromString = _createUTF8StringFromString(StringWithNumber);
        if (UTF8StringFromString)
        {
          CFStringRef v7 = (char *)UTF8StringFromString;
          memset(&v14, 0, sizeof(v14));
          CC_SHA1_Init(&v14);
          CC_SHA1_Update(&v14, &_createHashRepresentationOfString_seed, 4u);
          CC_LONG v8 = strlen(v7);
          CC_SHA1_Update(&v14, v7, v8);
          CC_SHA1_Final(md, &v14);
          uint64_t v9 = 0;
          bytes[0] = 91;
          int64_t v10 = v16;
          do
          {
            unint64_t v11 = md[v9];
            *(v10 - 1) = _createHashRepresentationOfString_hexNibble[v11 >> 4];
            *int64_t v10 = _createHashRepresentationOfString_hexNibble[v11 & 0xF];
            v10 += 2;
            ++v9;
          }
          while (v9 != 4);
          *(_WORD *)(v10 - 1) = 93;
          uint64_t v1 = (void *)CFStringCreateWithBytes(0, bytes, 10, 0x8000100u, 0);
          free(v7);
        }
        else
        {
          uint64_t v1 = 0;
        }
        CFRelease(v5);
        if (!v1) {
          goto LABEL_27;
        }
        goto LABEL_20;
      }
      uint64_t v1 = 0;
    }
LABEL_27:
    [v2 drain];
  }
  return v1;
}

void CPLoggingAddCustomLogConfiguration(const __CFArray *a1, CFDictionaryRef theDict)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  if (CFDictionaryContainsKey(theDict, @"logName")) {
    CFTypeRef cf = CFDictionaryGetValue(theDict, @"logName");
  }
  else {
    CFTypeRef cf = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"logDirectory")) {
    CFBooleanRef Value = (__CFString *)CFDictionaryGetValue(theDict, @"logDirectory");
  }
  else {
    CFBooleanRef Value = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"maxLogFileSize")) {
    CFNumberRef v3 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"maxLogFileSize");
  }
  else {
    CFNumberRef v3 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"maxLogFileCount")) {
    CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"maxLogFileCount");
  }
  else {
    CFNumberRef v4 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"wantsCompressedFiles")) {
    CFBooleanRef BOOLean = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"wantsCompressedFiles");
  }
  else {
    CFBooleanRef BOOLean = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"consoleUsesRealLevels")) {
    CFBooleanRef v40 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"consoleUsesRealLevels");
  }
  else {
    CFBooleanRef v40 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"maxConsoleLevel")) {
    CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"maxConsoleLevel");
  }
  else {
    CFNumberRef v5 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"maxLogFileLevel")) {
    CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"maxLogFileLevel");
  }
  else {
    CFNumberRef v6 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"consoleLevelDefaultsDomain")) {
    CFTypeRef v35 = CFDictionaryGetValue(theDict, @"consoleLevelDefaultsDomain");
  }
  else {
    CFTypeRef v35 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"consoleLevelDefaultsKey")) {
    *((void *)&v33 + 1) = CFDictionaryGetValue(theDict, @"consoleLevelDefaultsKey");
  }
  else {
    *((void *)&v33 + 1) = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"logFileLevelDefaultsDomain")) {
    CFTypeRef v34 = CFDictionaryGetValue(theDict, @"logFileLevelDefaultsDomain");
  }
  else {
    CFTypeRef v34 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"logFileLevelDefaultsKey")) {
    *(void *)&long long v33 = CFDictionaryGetValue(theDict, @"logFileLevelDefaultsKey");
  }
  else {
    *(void *)&long long v33 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"enableNewlines")) {
    CFBooleanRef v36 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"enableNewlines");
  }
  else {
    CFBooleanRef v36 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"createFileLogFormatBlock")) {
    CFStringRef v7 = CFDictionaryGetValue(theDict, @"createFileLogFormatBlock");
  }
  else {
    CFStringRef v7 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"createConsoleLogFormatBlock")) {
    CC_LONG v8 = CFDictionaryGetValue(theDict, @"createConsoleLogFormatBlock");
  }
  else {
    CC_LONG v8 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"didCreateNewFileBlock")) {
    uint64_t v9 = CFDictionaryGetValue(theDict, @"didCreateNewFileBlock");
  }
  else {
    uint64_t v9 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"willLogToConsoleBlock")) {
    int64_t v10 = CFDictionaryGetValue(theDict, @"willLogToConsoleBlock");
  }
  else {
    int64_t v10 = 0;
  }
  if (CFDictionaryContainsKey(theDict, @"willLogToFileBlock"))
  {
    unint64_t v11 = CFDictionaryGetValue(theDict, @"willLogToFileBlock");
    if (v7) {
      goto LABEL_60;
    }
  }
  else
  {
    unint64_t v11 = 0;
    if (v7) {
      goto LABEL_60;
    }
  }
  if (!CFDictionaryContainsKey(theDict, @"createLogFormatBlock"))
  {
    CFStringRef v7 = 0;
    if (v8) {
      goto LABEL_66;
    }
    goto LABEL_61;
  }
  CFStringRef v7 = CFDictionaryGetValue(theDict, @"createLogFormatBlock");
LABEL_60:
  if (v8) {
    goto LABEL_66;
  }
LABEL_61:
  if (CFDictionaryContainsKey(theDict, @"createLogFormatBlock")) {
    CC_LONG v8 = CFDictionaryGetValue(theDict, @"createLogFormatBlock");
  }
  else {
    CC_LONG v8 = 0;
  }
LABEL_66:
  uint64_t valuePtr = 10485760;
  if (v3) {
    CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
  }
  int v45 = -1;
  if (v4) {
    CFNumberGetValue(v4, kCFNumberSInt32Type, &v45);
  }
  int v44 = 5;
  if (v5) {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &v44);
  }
  int v43 = -1;
  if (v6) {
    CFNumberGetValue(v6, kCFNumberSInt32Type, &v43);
  }
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    unint64_t v13 = (unint64_t)DefaultSettings;
    *((void *)DefaultSettings + 19) = 0;
    *((void *)DefaultSettings + 1) = CFArrayCreateCopy(0, a1);
    if (cf) {
      DefaultLogFileName = (void *)CFRetain(cf);
    }
    else {
      DefaultLogFileName = (void *)_createDefaultLogFileName();
    }
    *(void *)(v13 + 16) = DefaultLogFileName;
    if (Value) {
      unint64_t v15 = Value;
    }
    else {
      unint64_t v15 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs";
    }
    CFTypeRef v16 = CFRetain(v15);
    uint64_t v17 = valuePtr;
    *(void *)(v13 + 24) = v16;
    *(void *)(v13 + 32) = v17;
    int v18 = v44;
    *(_DWORD *)(v13 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v45;
    *(_DWORD *)(v13 + 44) = v18;
    *(_DWORD *)(v13 + 48) = v43;
    CFTypeRef v19 = v35;
    if (v35) {
      CFTypeRef v19 = CFRetain(v35);
    }
    *(void *)(v13 + 112) = v19;
    if (*((void *)&v33 + 1)) {
      CFTypeRef v20 = CFRetain(*((CFTypeRef *)&v33 + 1));
    }
    else {
      CFTypeRef v20 = 0;
    }
    *(void *)(v13 + 12CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v20;
    CFTypeRef v21 = v34;
    if (v34) {
      CFTypeRef v21 = CFRetain(v34);
    }
    *(void *)(v13 + 128) = v21;
    if ((void)v33) {
      CFTypeRef v22 = CFRetain((CFTypeRef)v33);
    }
    else {
      CFTypeRef v22 = 0;
    }
    *(void *)(v13 + 136) = v22;
    if (v7) {
      CFDateRef v23 = _Block_copy(v7);
    }
    else {
      CFDateRef v23 = 0;
    }
    *(void *)(v13 + 64) = v23;
    if (v8) {
      uint64_t v24 = _Block_copy(v8);
    }
    else {
      uint64_t v24 = 0;
    }
    *(void *)(v13 + 72) = v24;
    if (v9) {
      size_t v25 = _Block_copy(v9);
    }
    else {
      size_t v25 = 0;
    }
    *(void *)(v13 + 8CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v25;
    if (v10) {
      BOOL v26 = _Block_copy(v10);
    }
    else {
      BOOL v26 = 0;
    }
    *(void *)(v13 + 88) = v26;
    if (v11) {
      uint64_t v27 = _Block_copy(v11);
    }
    else {
      uint64_t v27 = 0;
    }
    *(void *)(v13 + 96) = v27;
    if (BOOLean)
    {
      if (CFBooleanGetValue(BOOLean)) {
        int v28 = 2;
      }
      else {
        int v28 = 1;
      }
    }
    else
    {
      int v28 = 0;
    }
    *(_DWORD *)(v13 + 152) = v28;
    if (v40)
    {
      if (CFBooleanGetValue(v40)) {
        int v29 = 2;
      }
      else {
        int v29 = 1;
      }
    }
    else
    {
      int v29 = 0;
    }
    *(_DWORD *)(v13 + 156) = v29;
    if (v36)
    {
      if (CFBooleanGetValue(v36)) {
        int v30 = 2;
      }
      else {
        int v30 = 1;
      }
    }
    else
    {
      int v30 = 0;
    }
    *(_DWORD *)(v13 + 16CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v30;
    uint64_t v31 = (unint64_t *)&_logFileSettings;
    for (unsigned int i = (atomic_ullong *)atomic_load_explicit(&_logFileSettings, memory_order_acquire);
          i;
          unsigned int i = (atomic_ullong *)atomic_load_explicit(i, memory_order_acquire))
    {
      uint64_t v31 = (unint64_t *)i;
    }
    atomic_store(v13, v31);
    if (v33 != 0 && _startObservingDefaultChanges_once != -1) {
      dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_246);
    }
    if (_recomputeQueue_onceToken != -1) {
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_257);
    }
    dispatch_sync((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_8);
    if (_configurationQueue_once != -1) {
      dispatch_once(&_configurationQueue_once, &__block_literal_global_260);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CPLoggingAddCustomLogConfiguration_block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v13;
    dispatch_sync((dispatch_queue_t)_configurationQueue_queue, block);
  }
  else
  {
    CFLog();
  }
}

char *_createDefaultSettings()
{
  CFStringRef v0 = (char *)malloc_type_calloc(0xA8uLL, 1uLL, 0x52AF0B50uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    *((void *)v0 + 4) = 10485760;
    *(_OWORD *)(v0 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = xmmword_18FBBC080;
    *((_DWORD *)v0 + 14) = -3;
    *((void *)v0 + 19) = 0x100000002;
    *((_DWORD *)v0 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 2;
    *((void *)v0 + 18) = malloc_type_calloc(0x10uLL, 1uLL, 0x7D2BF6FFuLL);
  }
  return v1;
}

CFStringRef _createDefaultLogFileName()
{
  CFStringRef v0 = getprogname();
  if (v0)
  {
    uint64_t v1 = (const UInt8 *)v0;
    size_t v2 = strlen(v0);
    return CFStringCreateWithBytes(0, v1, v2, 0x8000100u, 0);
  }
  else
  {
    uint64_t v4 = getpid();
    return CFStringCreateWithFormat(0, 0, @"pid_%d", v4);
  }
}

void _recomputeQueueRecomputeMaxAcceptedLevel()
{
  unint64_t explicit = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
  if (explicit)
  {
    signed int v1 = -1;
    do
    {
      signed int v2 = atomic_load_explicit((atomic_uint *volatile)(explicit + 56), memory_order_acquire);
      if (v2 == -3)
      {
        unint64_t v3 = explicit;
        do
        {
          signed int v2 = atomic_load_explicit((atomic_uint *volatile)(v3 + 48), memory_order_acquire);
          if (v2 != -2) {
            break;
          }
          unint64_t v3 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
          signed int v2 = atomic_load_explicit((atomic_uint *volatile)(v3 + 56), memory_order_acquire);
        }
        while (v2 == -3);
      }
      if (v2 > v1) {
        signed int v1 = v2;
      }
      signed int v4 = atomic_load_explicit((atomic_uint *volatile)(explicit + 52), memory_order_acquire);
      if (atomic_load_explicit((atomic_uint *volatile)(explicit + 52), memory_order_acquire) == -3)
      {
        unint64_t v5 = explicit;
        do
        {
          signed int v4 = atomic_load_explicit((atomic_uint *volatile)(v5 + 44), memory_order_acquire);
          if (v4 != -2) {
            break;
          }
          unint64_t v5 = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
          signed int v4 = atomic_load_explicit((atomic_uint *volatile)(v5 + 52), memory_order_acquire);
        }
        while (atomic_load_explicit((atomic_uint *volatile)(v5 + 52), memory_order_acquire) == -3);
      }
      if (v4 > v1) {
        signed int v1 = v4;
      }
      unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)explicit, memory_order_acquire);
    }
    while (explicit);
  }
  else
  {
    signed int v1 = -1;
  }
  atomic_store(v1, &_CPLoggingMaxAcceptedLevel);
}

void __CPLoggingAddCustomLogConfiguration_block_invoke_2(uint64_t a1)
{
}

void _configurationQueueRereadDefaultsForSetting(uint64_t a1)
{
  CFStringRef explicit = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 112), memory_order_acquire);
  CFStringRef v3 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 120), memory_order_acquire);
  CFStringRef v4 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 128), memory_order_acquire);
  CFStringRef v5 = (const __CFString *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 136), memory_order_acquire);
  if (!v3)
  {
    if (!v5) {
      goto LABEL_8;
    }
    DefaultsCFBooleanRef Value = _configurationQueueReadDefaultsValue(v4, v5);
    goto LABEL_6;
  }
  unsigned int v6 = _configurationQueueReadDefaultsValue(explicit, v3);
  unsigned int v7 = v6;
  if (v5)
  {
    DefaultsCFBooleanRef Value = _configurationQueueReadDefaultsValue(v4, v5);
    atomic_store(v7, (unsigned int *)(a1 + 52));
LABEL_6:
    atomic_store(DefaultsValue, (unsigned int *)(a1 + 56));
    goto LABEL_8;
  }
  atomic_store(v6, (unsigned int *)(a1 + 52));
LABEL_8:
  if (_recomputeQueue_onceToken != -1) {
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_257);
  }
  uint64_t v9 = _recomputeQueue_queue;
  dispatch_async(v9, &__block_literal_global_263);
}

BOOL CPLoggingIsFacilityDefined(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v2 = _settingsForFacility(a1);
  return v2 != atomic_load_explicit(&_logFileSettings, memory_order_acquire);
}

BOOL CPLoggingFlush(dispatch_time_t timeout)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  if (_workGroup_once != -1) {
    dispatch_once(&_workGroup_once, &__block_literal_global_169);
  }
  return dispatch_group_wait((dispatch_group_t)_workGroup_group, timeout) == 0;
}

void CPLoggingFlushWithCompletion(uint64_t a1, uint64_t a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CPLoggingFlushWithCompletion_block_invoke;
  v5[3] = &unk_1E56695F8;
  v5[4] = a2;
  v5[5] = a1;
  dispatch_async(global_queue, v5);
}

uint64_t __CPLoggingFlushWithCompletion_block_invoke(uint64_t a1)
{
  CPLoggingFlush(*(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    CFStringRef v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void CPLoggingStartNewLogFile(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v2 = _settingsForFacility(a1);
  WorkSettingsFromSettings = _createWorkSettingsFromSettings(v2);
  atomic_store(0, (unsigned __int8 *)(v2 + 164));
  if (WorkSettingsFromSettings)
  {
    CFStringRef v4 = WorkSettingsFromSettings;
    if (_workGroup_once != -1) {
      dispatch_once(&_workGroup_once, &__block_literal_global_169);
    }
    CFStringRef v5 = _workGroup_group;
    if (_workQueue_once != -1) {
      dispatch_once(&_workQueue_once, &__block_literal_global_171);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CPLoggingStartNewLogFile_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v4;
    dispatch_group_async(v5, (dispatch_queue_t)_workQueue_queue, block);
  }
}

void __CPLoggingStartNewLogFile_block_invoke(uint64_t a1)
{
  CFStringRef v2 = 0;
  unsigned int v3 = 0;
  CFStringRef v4 = *(void **)(a1 + 32);
  CFStringRef v5 = *(const __CFString **)(v4[8] + 8);
  do
  {
    if (!v5)
    {
      _workQueueRefreshUUIDForWorkSettings((uint64_t)v4);
      CFStringRef v5 = *(const __CFString **)(*(void *)(*(void *)(a1 + 32) + 64) + 8);
      if (!v5) {
        goto LABEL_20;
      }
    }
    if (v2)
    {
      CFRelease(v2);
      CFStringRef v5 = *(const __CFString **)(*(void *)(*(void *)(a1 + 32) + 64) + 8);
    }
    uint64_t v6 = _workQueueCopyConnection();
    if (v6)
    {
      unsigned int v7 = (void *)v6;
      UTF8StringFromString = _createUTF8StringFromString(v5);
      uint64_t v19 = 0;
      CFTypeRef v20 = &v19;
      uint64_t v21 = 0x3052000000;
      CFTypeRef v22 = __Block_byref_object_copy__1;
      CFDateRef v23 = __Block_byref_object_dispose__1;
      uint64_t v24 = 0;
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v9, "message", 3);
      xpc_dictionary_set_string(v9, "uuid", (const char *)UTF8StringFromString);
      if (_waitForResponseQueue_once != -1) {
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___workQueueStartNewLogFile_block_invoke;
      block[3] = &unk_1E5668FF8;
      block[4] = v7;
      void block[5] = v9;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
      if (_waitForResponseSema_once != -1) {
        dispatch_once(&_waitForResponseSema_once, &__block_literal_global_221);
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
      xpc_release(v9);
      if (_waitForResponseQueue_once != -1) {
        dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = ___workQueueStartNewLogFile_block_invoke_2;
      v17[3] = &unk_1E5669188;
      v17[4] = &v19;
      dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v17);
      int64_t v10 = (void *)v20[5];
      if (v10)
      {
        string = xpc_dictionary_get_string(v10, "newfilepath");
        CFStringRef v2 = (CFStringRef)string;
        if (string)
        {
          size_t v12 = strlen(string);
          CFStringRef v2 = CFStringCreateWithBytes(0, (const UInt8 *)v2, v12, 0x8000100u, 0);
        }
        BOOL v13 = xpc_dictionary_get_BOOL((xpc_object_t)v20[5], "retval");
        xpc_release((xpc_object_t)v20[5]);
        if (UTF8StringFromString) {
          goto LABEL_17;
        }
      }
      else
      {
        CFLog();
        CFStringRef v2 = 0;
        BOOL v13 = 0;
        if (UTF8StringFromString) {
LABEL_17:
        }
          free(UTF8StringFromString);
      }
      xpc_release(v7);
      _Block_object_dispose(&v19, 8);
      if (v13) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    CFStringRef v2 = 0;
LABEL_19:
    CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 64) + 8));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 8) = 0;
LABEL_20:
    CFStringRef v5 = 0;
    CFStringRef v4 = *(void **)(a1 + 32);
    if (*(void *)(v4[8] + 8)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = ++v3 >= 3;
    }
  }
  while (!v14);
  if (v3 >= 3)
  {
    CFLog();
    CFStringRef v4 = *(void **)(a1 + 32);
  }
  uint64_t v15 = v4[6];
  if (v15) {
    BOOL v16 = v2 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    (*(void (**)(void, CFStringRef))(v15 + 16))(v4[6], v2);
    goto LABEL_37;
  }
  if (v2)
  {
LABEL_37:
    CFRelease(v2);
    CFStringRef v4 = *(void **)(a1 + 32);
  }
  free(v4);
}

void sub_18FBA9BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _workQueueRefreshUUIDForWorkSettings(uint64_t a1)
{
  CFStringRef v2 = *(const __CFString **)(a1 + 8);
  UTF8StringFromString = _createUTF8StringFromString(*(const __CFString **)(a1 + 16));
  CFStringRef v4 = _createUTF8StringFromString(v2);
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3052000000;
  int v18 = __Block_byref_object_copy__1;
  uint64_t v19 = __Block_byref_object_dispose__1;
  uint64_t v20 = 0;
  CFStringRef v5 = (void *)_workQueueCopyConnection();
  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "message", 1);
    xpc_dictionary_set_string(v6, "folder", (const char *)UTF8StringFromString);
    xpc_dictionary_set_string(v6, "basename", (const char *)v4);
    if (_waitForResponseQueue_once != -1) {
      dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___workQueueCopyFileUUIDForLogPath_block_invoke;
    block[3] = &unk_1E5668FF8;
    block[4] = v5;
    void block[5] = v6;
    dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, block);
    if (_waitForResponseSema_once != -1) {
      dispatch_once(&_waitForResponseSema_once, &__block_literal_global_221);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)_waitForResponseSema_sema, 0xFFFFFFFFFFFFFFFFLL);
    xpc_release(v6);
    if (_waitForResponseQueue_once != -1) {
      dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___workQueueCopyFileUUIDForLogPath_block_invoke_2;
    v13[3] = &unk_1E5669188;
    v13[4] = &v15;
    dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v13);
    unsigned int v7 = (void *)v16[5];
    if (v7)
    {
      string = xpc_dictionary_get_string(v7, "uuid");
      xpc_object_t v9 = (const UInt8 *)string;
      if (string)
      {
        size_t v10 = strlen(string);
        xpc_object_t v9 = (const UInt8 *)CFStringCreateWithBytes(0, v9, v10, 0x8000100u, 1u);
      }
      xpc_release((xpc_object_t)v16[5]);
      if (UTF8StringFromString) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    CFLog();
  }
  xpc_object_t v9 = 0;
  if (UTF8StringFromString) {
LABEL_12:
  }
    free(UTF8StringFromString);
LABEL_13:
  if (v4) {
    free(v4);
  }
  if (v5) {
    xpc_release(v5);
  }
  _Block_object_dispose(&v15, 8);
  uint64_t v11 = *(void *)(a1 + 64);
  size_t v12 = *(const void **)(v11 + 8);
  if (v12)
  {
    CFRelease(v12);
    uint64_t v11 = *(void *)(a1 + 64);
  }
  *(void *)(v11 + 8) = v9;
}

void sub_18FBA9EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t CPLoggingStartNewLogFileNextLine(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t result = _settingsForFacility(a1);
  atomic_store(1u, (unsigned __int8 *)(result + 164));
  return result;
}

void CPLoggingSetCustomLogName(const void *a1, const void *a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v4 = _settingsForFacility(a1);
  if (a2) {
    CFRetain(a2);
  }
  CFStringRef v5 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v4 + 16), (unint64_t)a2, memory_order_release);
  int v6 = v4 + 165;
  LOBYTE(v6) = atomic_load_explicit((atomic_uchar *volatile)(v4 + 165), memory_order_acquire);
  if (v5)
  {
    if (v6)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v4 + 8), memory_order_acquire);
      CFLog();
    }
    else
    {
      CFRelease(v5);
    }
  }
  if (_workQueue_once != -1) {
    dispatch_once(&_workQueue_once, &__block_literal_global_171);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___setLogName_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)_workQueue_queue, block);
}

const void *CPLoggingCopyCustomLogName(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  CFStringRef explicit = (const void *)atomic_load_explicit((atomic_ullong *volatile)(_settingsForFacility(a1) + 16), memory_order_acquire);
  if (explicit) {
    CFRetain(explicit);
  }
  return explicit;
}

void CPLoggingSetCustomLogDirectory(const void *a1, const void *a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v4 = _settingsForFacility(a1);
  if (a2) {
    CFRetain(a2);
  }
  CFStringRef v5 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v4 + 24), (unint64_t)a2, memory_order_release);
  int v6 = v4 + 165;
  LOBYTE(v6) = atomic_load_explicit((atomic_uchar *volatile)(v4 + 165), memory_order_acquire);
  if (v5)
  {
    if (v6)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v4 + 8), memory_order_acquire);
      CFLog();
    }
    else
    {
      CFRelease(v5);
    }
  }
  if (_workQueue_once != -1) {
    dispatch_once(&_workQueue_once, &__block_literal_global_171);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___setLogDirectory_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)_workQueue_queue, block);
}

const void *CPLoggingCopyCustomLogDirectory(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  CFStringRef explicit = (const void *)atomic_load_explicit((atomic_ullong *volatile)(_settingsForFacility(a1) + 24), memory_order_acquire);
  if (explicit) {
    CFRetain(explicit);
  }
  return explicit;
}

unint64_t CPLoggingSetCustomMaxLogFileSize(const void *a1, unint64_t a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t result = _settingsForFacility(a1);
  atomic_store(a2, (unint64_t *)(result + 32));
  return result;
}

unint64_t CPLoggingCustomMaxLogFileSize(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  for (unint64_t result = atomic_load_explicit((atomic_ullong *volatile)(_settingsForFacility(a1) + 32), memory_order_acquire);
        result == -2;
        unint64_t result = atomic_load_explicit((atomic_ullong *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 32), memory_order_acquire))
  {
    ;
  }
  return result;
}

unint64_t CPLoggingSetCustomMaxLogFileCount(const void *a1, unsigned int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t result = _settingsForFacility(a1);
  atomic_store(a2, (unsigned int *)(result + 40));
  return result;
}

uint64_t CPLoggingCustomMaxLogFileCount(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  for (uint64_t result = atomic_load_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 40), memory_order_acquire);
        result == -2;
        uint64_t result = atomic_load_explicit((atomic_uint *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 40), memory_order_acquire))
  {
    ;
  }
  return result;
}

unint64_t CPLoggingSetCustomWantsCompressedFiles(const void *a1, int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t result = _settingsForFacility(a1);
  if (a2) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 1;
  }
  atomic_store(v5, (unsigned int *)(result + 152));
  return result;
}

BOOL CPLoggingCustomWantsCompressedFiles(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  for (unsigned int i = atomic_load_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 152), memory_order_acquire);
        !i;
        unsigned int i = atomic_load_explicit((atomic_uint *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 152), memory_order_acquire))
  {
    ;
  }
  return i == 2;
}

unint64_t CPLoggingSetCustomConsoleUsesRealLevels(const void *a1, int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t result = _settingsForFacility(a1);
  if (a2) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 1;
  }
  atomic_store(v5, (unsigned int *)(result + 156));
  return result;
}

BOOL CPLoggingCustomConsoleUsesRealLevels(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  for (unsigned int i = atomic_load_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 156), memory_order_acquire);
        !i;
        unsigned int i = atomic_load_explicit((atomic_uint *volatile)(atomic_load_explicit(&_logFileSettings, memory_order_acquire) + 156), memory_order_acquire))
  {
    ;
  }
  return i == 2;
}

void CPLoggingSetCustomMaxConsoleLevel(const void *a1, unsigned int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  if (atomic_exchange_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 44), a2, memory_order_release) != a2)
  {
    if (_recomputeQueue_onceToken != -1) {
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_257);
    }
    unint64_t v4 = _recomputeQueue_queue;
    dispatch_sync(v4, &__block_literal_global_288);
  }
}

uint64_t CPLoggingCustomMaxConsoleLevel(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t explicit = _settingsForFacility(a1);
  for (uint64_t result = atomic_load_explicit((atomic_uint *volatile)(explicit + 52), memory_order_acquire);
        atomic_load_explicit((atomic_uint *volatile)(explicit + 52), memory_order_acquire) == -3;
        uint64_t result = atomic_load_explicit((atomic_uint *volatile)(explicit + 52), memory_order_acquire))
  {
    uint64_t result = atomic_load_explicit((atomic_uint *volatile)(explicit + 44), memory_order_acquire);
    if (result != -2) {
      break;
    }
    unint64_t explicit = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
  }
  return result;
}

void CPLoggingSetCustomMaxLogFileLevel(const void *a1, unsigned int a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  if (atomic_exchange_explicit((atomic_uint *volatile)(_settingsForFacility(a1) + 48), a2, memory_order_release) != a2)
  {
    if (_recomputeQueue_onceToken != -1) {
      dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_257);
    }
    unint64_t v4 = _recomputeQueue_queue;
    dispatch_sync(v4, &__block_literal_global_290);
  }
}

uint64_t CPLoggingCustomMaxLogFileLevel(const void *a1)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t explicit = _settingsForFacility(a1);
  for (uint64_t result = atomic_load_explicit((atomic_uint *volatile)(explicit + 56), memory_order_acquire);
        result == -3;
        uint64_t result = atomic_load_explicit((atomic_uint *volatile)(explicit + 56), memory_order_acquire))
  {
    uint64_t result = atomic_load_explicit((atomic_uint *volatile)(explicit + 48), memory_order_acquire);
    if (result != -2) {
      break;
    }
    unint64_t explicit = atomic_load_explicit(&_logFileSettings, memory_order_acquire);
  }
  return result;
}

void CPLoggingSetCustomCreateLogFormatBlock(const void *a1, const void *a2)
{
}

void _setCustomCreateLogFormatBlock(const void *a1, const void *a2, int a3, int a4)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v8 = _settingsForFacility(a1);
  if (a3)
  {
    xpc_object_t v9 = a2 ? _Block_copy(a2) : 0;
    size_t v10 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v8 + 64), (unint64_t)v9, memory_order_release);
    int v11 = v8 + 165;
    LOBYTE(v11) = atomic_load_explicit((atomic_uchar *volatile)(v8 + 165), memory_order_acquire);
    if (v10)
    {
      if (!v11)
      {
        CFRelease(v10);
        if (!a4) {
          return;
        }
        goto LABEL_11;
      }
      atomic_load_explicit((atomic_ullong *volatile)(v8 + 8), memory_order_acquire);
      CFLog();
    }
  }
  if (!a4) {
    return;
  }
LABEL_11:
  if (a2) {
    size_t v12 = _Block_copy(a2);
  }
  else {
    size_t v12 = 0;
  }
  BOOL v13 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v8 + 72), (unint64_t)v12, memory_order_release);
  int v14 = v8 + 165;
  LOBYTE(v14) = atomic_load_explicit((atomic_uchar *volatile)(v8 + 165), memory_order_acquire);
  if (v13)
  {
    if (v14)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v8 + 8), memory_order_acquire);
      CFLog();
    }
    else
    {
      CFRelease(v13);
    }
  }
}

void CPLoggingSetCustomCreateFileLogFormatBlock(const void *a1, const void *a2)
{
}

void CPLoggingSetCustomCreateConsoleLogFormatBlock(const void *a1, const void *a2)
{
}

void CPLoggingSetCustomDidCreateNewFileBlock(const void *a1, const void *a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v4 = _settingsForFacility(a1);
  if (a2) {
    unsigned int v5 = _Block_copy(a2);
  }
  else {
    unsigned int v5 = 0;
  }
  int v6 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v4 + 80), (unint64_t)v5, memory_order_release);
  int v7 = v4 + 165;
  LOBYTE(v7) = atomic_load_explicit((atomic_uchar *volatile)(v4 + 165), memory_order_acquire);
  if (v6)
  {
    if (v7)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v4 + 8), memory_order_acquire);
      CFLog();
    }
    else
    {
      CFRelease(v6);
    }
  }
}

void CPLoggingSetCustomWillLogToConsoleBlock(const void *a1, const void *a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v4 = _settingsForFacility(a1);
  if (a2) {
    unsigned int v5 = _Block_copy(a2);
  }
  else {
    unsigned int v5 = 0;
  }
  int v6 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v4 + 88), (unint64_t)v5, memory_order_release);
  int v7 = v4 + 165;
  LOBYTE(v7) = atomic_load_explicit((atomic_uchar *volatile)(v4 + 165), memory_order_acquire);
  if (v6)
  {
    if (v7)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v4 + 8), memory_order_acquire);
      CFLog();
    }
    else
    {
      _Block_release(v6);
    }
  }
}

void CPLoggingSetCustomWillLogToLogFileBlock(const void *a1, const void *a2)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v4 = _settingsForFacility(a1);
  if (a2) {
    unsigned int v5 = _Block_copy(a2);
  }
  else {
    unsigned int v5 = 0;
  }
  int v6 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v4 + 96), (unint64_t)v5, memory_order_release);
  int v7 = v4 + 165;
  LOBYTE(v7) = atomic_load_explicit((atomic_uchar *volatile)(v4 + 165), memory_order_acquire);
  if (v6)
  {
    if (v7)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v4 + 8), memory_order_acquire);
      CFLog();
    }
    else
    {
      _Block_release(v6);
    }
  }
}

void CPLoggingSetCustomConsoleLevelDefaults(const void *a1, const void *a2, const void *a3)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v7 = _settingsForFacility(a1);
  if (a2) {
    CFRetain(a2);
  }
  if (a3) {
    CFRetain(a3);
  }
  unint64_t v8 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v7 + 120), (unint64_t)a3, memory_order_release);
  LOBYTE(v3) = atomic_load_explicit((atomic_uchar *volatile)(v7 + 165), memory_order_acquire);
  if (v8)
  {
    if (!v3)
    {
      CFRelease(v8);
      xpc_object_t v9 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v7 + 112), (unint64_t)a2, memory_order_release);
      if (!v9) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    atomic_load_explicit((atomic_ullong *volatile)(v7 + 8), memory_order_acquire);
    CFLog();
  }
  xpc_object_t v9 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v7 + 112), (unint64_t)a2, memory_order_release);
  if (v9)
  {
    if (v3)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v7 + 8), memory_order_acquire);
      CFLog();
      goto LABEL_15;
    }
LABEL_14:
    CFRelease(v9);
  }
LABEL_15:
  if (a3 && _startObservingDefaultChanges_once != -1) {
    dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_246);
  }
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_260);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __CPLoggingSetCustomConsoleLevelDefaults_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v7;
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, block);
}

void __CPLoggingSetCustomConsoleLevelDefaults_block_invoke(uint64_t a1)
{
}

void CPLoggingSetCustomLogFileLevelDefaults(const void *a1, const void *a2, const void *a3)
{
  if (_init_once != -1) {
    dispatch_once(&_init_once, &__block_literal_global_66);
  }
  unint64_t v7 = _settingsForFacility(a1);
  if (a2) {
    CFRetain(a2);
  }
  if (a3) {
    CFRetain(a3);
  }
  unint64_t v8 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v7 + 136), (unint64_t)a3, memory_order_release);
  LOBYTE(v3) = atomic_load_explicit((atomic_uchar *volatile)(v7 + 165), memory_order_acquire);
  if (v8)
  {
    if (!v3)
    {
      CFRelease(v8);
      xpc_object_t v9 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v7 + 128), (unint64_t)a2, memory_order_release);
      if (!v9) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    atomic_load_explicit((atomic_ullong *volatile)(v7 + 8), memory_order_acquire);
    CFLog();
  }
  xpc_object_t v9 = (const void *)atomic_exchange_explicit((atomic_ullong *volatile)(v7 + 128), (unint64_t)a2, memory_order_release);
  if (v9)
  {
    if (v3)
    {
      atomic_load_explicit((atomic_ullong *volatile)(v7 + 8), memory_order_acquire);
      CFLog();
      goto LABEL_15;
    }
LABEL_14:
    CFRelease(v9);
  }
LABEL_15:
  if (a3 && _startObservingDefaultChanges_once != -1) {
    dispatch_once(&_startObservingDefaultChanges_once, &__block_literal_global_246);
  }
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_260);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __CPLoggingSetCustomLogFileLevelDefaults_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v7;
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, block);
}

void __CPLoggingSetCustomLogFileLevelDefaults_block_invoke(uint64_t a1)
{
}

uint64_t CPLoggingSetUsesOwnAslClient(uint64_t result)
{
  return result;
}

void CPLoggingSetLogName(const void *a1)
{
}

const void *CPLoggingCopyLogName()
{
  return CPLoggingCopyCustomLogName(0);
}

void CPLoggingSetLogDirectory(const void *a1)
{
}

const void *CPLoggingCopyLogDirectory()
{
  return CPLoggingCopyCustomLogDirectory(0);
}

unint64_t CPLoggingSetMaxLogFileSize(unint64_t a1)
{
  return CPLoggingSetCustomMaxLogFileSize(0, a1);
}

unint64_t CPLoggingMaxLogFileSize()
{
  return CPLoggingCustomMaxLogFileSize(0);
}

unint64_t CPLoggingSetMaxLogFileCount(unsigned int a1)
{
  return CPLoggingSetCustomMaxLogFileCount(0, a1);
}

uint64_t CPLoggingMaxLogFileCount()
{
  return CPLoggingCustomMaxLogFileCount(0);
}

unint64_t CPLoggingSetWantsCompressedFiles(int a1)
{
  return CPLoggingSetCustomWantsCompressedFiles(0, a1);
}

BOOL CPLoggingWantsCompressedFiles()
{
  return CPLoggingCustomWantsCompressedFiles(0);
}

unint64_t CPLoggingSetConsoleUsesRealLevels(int a1)
{
  return CPLoggingSetCustomConsoleUsesRealLevels(0, a1);
}

BOOL CPLoggingConsoleUsesRealLevels()
{
  return CPLoggingCustomConsoleUsesRealLevels(0);
}

void CPLoggingSetMaxConsoleLevel(unsigned int a1)
{
}

uint64_t CPLoggingMaxConsoleLevel()
{
  return CPLoggingCustomMaxConsoleLevel(0);
}

void CPLoggingSetMaxLogFileLevel(unsigned int a1)
{
}

uint64_t CPLoggingMaxLogFileLevel()
{
  return CPLoggingCustomMaxLogFileLevel(0);
}

void CPLoggingSetCreateLogFormatBlock(const void *a1)
{
}

void CPLoggingSetCreateFileLogFormatBlock(const void *a1)
{
}

void CPLoggingSetCreateConsoleLogFormatBlock(const void *a1)
{
}

void CPLoggingSetDidCreateNewFileBlock(const void *a1)
{
}

void CPLoggingSetWillLogToConsoleBlock(const void *a1)
{
}

void CPLoggingSetWillLogToLogFileBlock(const void *a1)
{
}

void CPLoggingSetConsoleLevelDefaults(const void *a1, const void *a2)
{
}

void CPLoggingSetLogFileLevelDefaults(const void *a1, const void *a2)
{
}

uint64_t ___init_block_invoke()
{
  _processName = (uint64_t)_createDefaultLogFileName();
  _pid = getpid();
  DefaultSettings = _createDefaultSettings();
  if (DefaultSettings)
  {
    unint64_t v1 = (unint64_t)DefaultSettings;
    *((void *)DefaultSettings + 2) = CFRetain((CFTypeRef)_processName);
    *(void *)(v1 + 24) = CFRetain(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs");
    atomic_store(v1, (unint64_t *)&_logFileSettings);
  }
  else
  {
    CFLog();
  }
  atexit((void (*)(void))_flushAtExit);
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_260);
  }
  dispatch_async((dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_71);
  return _rereadObfuscationPreferences();
}

BOOL _flushAtExit()
{
  dispatch_time_t v0 = dispatch_time(0, 5000000000);
  return CPLoggingFlush(v0);
}

void ___init_block_invoke_2()
{
}

uint64_t _rereadObfuscationPreferences()
{
  CFPreferencesAppSynchronize(@".GlobalPreferences");
  keyExistsAndHasValidCFStringRef Format = 0;
  AppBooleanCFBooleanRef Value = CFPreferencesGetAppBooleanValue(@"CPLoggingUnobfuscate", @".GlobalPreferences", &keyExistsAndHasValidFormat);
  uint64_t result = CPIsInternalDevice();
  unsigned __int8 v2 = 0;
  if (!result)
  {
    if (keyExistsAndHasValidFormat) {
      BOOL v3 = AppBooleanValue == 0;
    }
    else {
      BOOL v3 = 1;
    }
    unsigned __int8 v2 = v3;
  }
  atomic_store(v2, (unsigned __int8 *)_shouldObfuscate);
  return result;
}

__CFString *_createStandardConsoleLogLine(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  CFDictionaryRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, @"(");
  if (a1 <= 7)
  {
    CFStringAppendFormat(Mutable, 0, @"%@"), _createStandardConsoleLogLine_levelLabels[a1]);
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  CFStringAppend(Mutable, @"(Unknown)");
  if (a2) {
LABEL_5:
  }
    CFStringAppendFormat(Mutable, 0, @" %@:", a2);
LABEL_6:
  if (a3 && a4) {
    CFStringAppendFormat(Mutable, 0, @" <%s %s:%ld>", a3, a4, a5);
  }
  CFStringAppendFormat(Mutable, 0, @" %@", a6);
  return Mutable;
}

CFStringRef _createStandardFileLogLine(CFDateRef date, uint64_t a2)
{
  if (_logDateFormatter_once != -1) {
    dispatch_once(&_logDateFormatter_once, &__block_literal_global_130);
  }
  CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)_logDateFormatter_dateFormatter, date);
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%@ %@[%d] %@", StringWithDate, _processName, _pid, a2);
  CFRelease(StringWithDate);
  return v5;
}

void ___logDateFormatter_block_invoke()
{
  dispatch_time_t v0 = CFDateFormatterCreate(0, 0, kCFDateFormatterShortStyle, kCFDateFormatterFullStyle);
  _logDateFormatter_dateFormatter = (uint64_t)v0;
  CFDateFormatterSetFormat(v0, @"yyyy-MM-dd'T'HH:mm:ss.SSS");
}

unsigned __int16 *_createUTF8StringFromString(const __CFString *a1)
{
  unsigned __int8 v2 = (unsigned __int16 *)malloc_type_malloc(0xC8uLL, 0x32E04B71uLL);
  if (v2)
  {
    uint64_t v3 = 200;
    while (!CFStringGetCString(a1, (char *)v2, v3, 0x8000100u))
    {
      free(v2);
      if (v3 < 0x100000)
      {
        v3 *= 2;
        unsigned __int8 v2 = (unsigned __int16 *)malloc_type_malloc(v3, 0xC640418DuLL);
        if (v2) {
          continue;
        }
      }
      CFLog();
      CFIndex Length = CFStringGetLength(a1);
      if (Length)
      {
        CFIndex v5 = Length;
        unsigned __int8 v2 = (unsigned __int16 *)malloc_type_malloc(2 * Length, 0x15A09C9CuLL);
        if (!v2) {
          return v2;
        }
        v11.location = 0;
        v11.CFIndex length = v5;
        CFStringGetCharacters(a1, v11, v2);
        CFDictionaryRef Mutable = CFStringCreateMutable(0, 0);
        if (Mutable)
        {
          unint64_t v7 = Mutable;
          CFStringAppend(Mutable, @"UTF-16 Bytes: ");
          if (v5 >= 1)
          {
            unint64_t v8 = v2;
            do
            {
              unsigned int v9 = *v8++;
              CFStringAppendFormat(v7, 0, @"%04x ", v9);
              --v5;
            }
            while (v5);
          }
          CFLog();
          CFRelease(v7);
        }
        free(v2);
      }
      return 0;
    }
  }
  else
  {
    CFLog();
  }
  return v2;
}

void ___performLog_block_invoke(uint64_t a1)
{
  _workQueueAppendDataToLogFile(*(void *)(a1 + 32), *(const __CFData **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  unsigned __int8 v2 = *(void **)(a1 + 32);
  free(v2);
}

void ___aslClient_block_invoke()
{
  dispatch_time_t v0 = _usesOwnAslClient;
  LOBYTE(vCFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = atomic_load_explicit((atomic_uchar *volatile)_usesOwnAslClient, memory_order_acquire);
  if (v0) {
    _aslClient_client = (uint64_t)asl_open(0, 0, 0);
  }
}

dispatch_queue_t ___callbackQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CPLogging.callbackQueue", 0);
  _callbackQueue_queue = (uint64_t)result;
  return result;
}

dispatch_group_t ___workGroup_block_invoke()
{
  dispatch_group_t result = dispatch_group_create();
  _workGroup_group = (uint64_t)result;
  return result;
}

void ___workQueue_block_invoke()
{
  dispatch_time_t v0 = dispatch_queue_create("com.apple.CPLogging.workQueue", 0);
  _workQueue_queue = (uint64_t)v0;
  global_queue = dispatch_get_global_queue(-2, 0);
  dispatch_set_target_queue(v0, global_queue);
}

uint64_t _workQueueCopyConnection()
{
  if (_workQueueCopyConnection_once != -1) {
    dispatch_once(&_workQueueCopyConnection_once, &__block_literal_global_197);
  }
  uint64_t v3 = 0;
  unint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  int v6 = __Block_byref_object_copy__1;
  unint64_t v7 = __Block_byref_object_dispose__1;
  uint64_t v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___workQueueCopyConnection_block_invoke_2;
  block[3] = &unk_1E5669188;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)_workQueueCopyConnection_connQueue, block);
  uint64_t v0 = v4[5];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___workQueueLogToFileUUID_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueLogToFileUUID_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

dispatch_queue_t ___workQueueCopyConnection_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CPLogging.connQueue", 0);
  _workQueueCopyConnection_connQueue = (uint64_t)result;
  return result;
}

xpc_object_t ___workQueueCopyConnection_block_invoke_2(uint64_t a1)
{
  xpc_object_t result = (xpc_object_t)_workQueueCopyConnection_conn;
  if (_workQueueCopyConnection_conn
    || (global_queue = dispatch_get_global_queue(0, 0),
        _workQueueCopyConnection_conn = (uint64_t)xpc_connection_create_mach_service("com.apple.appsupport.cplogd", global_queue, 0), xpc_connection_set_event_handler((xpc_connection_t)_workQueueCopyConnection_conn, &__block_literal_global_202), xpc_connection_resume((xpc_connection_t)_workQueueCopyConnection_conn), (xpc_object_t result = (xpc_object_t)_workQueueCopyConnection_conn) != 0))
  {
    xpc_object_t result = xpc_retain(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = result;
  }
  return result;
}

void ___workQueueCopyConnection_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x192FC0190](a2);
  if (v3 != MEMORY[0x1E4F14590])
  {
    if (v3 != MEMORY[0x1E4F145A8]) {
      goto LABEL_3;
    }
    if (a2 == MEMORY[0x1E4F14528])
    {
      CFLog();
      dispatch_sync((dispatch_queue_t)_workQueueCopyConnection_connQueue, &__block_literal_global_207);
      goto LABEL_4;
    }
    if (a2 != MEMORY[0x1E4F14520]) {
LABEL_3:
    }
      CFLog();
LABEL_4:
    char v4 = 0;
    goto LABEL_6;
  }
  char v4 = 1;
LABEL_6:
  if (_waitForResponseQueue_once != -1) {
    dispatch_once(&_waitForResponseQueue_once, &__block_literal_global_218_0);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___workQueueCopyConnection_block_invoke_5;
  v5[3] = &unk_1E56696A0;
  char v6 = v4;
  v5[4] = a2;
  dispatch_sync((dispatch_queue_t)_waitForResponseQueue_queue, v5);
}

void ___workQueueCopyConnection_block_invoke_4()
{
  if (_workQueueCopyConnection_conn)
  {
    xpc_connection_cancel((xpc_connection_t)_workQueueCopyConnection_conn);
    xpc_release((xpc_object_t)_workQueueCopyConnection_conn);
    _workQueueCopyConnection_conn = 0;
  }
}

intptr_t ___workQueueCopyConnection_block_invoke_5(intptr_t result)
{
  if (_waitForResponseQueueIsWaiting == 1)
  {
    _waitForResponseQueueIsWaiting = 0;
    if (*(unsigned char *)(result + 40)) {
      _waitForResponseQueueResponse = (uint64_t)xpc_retain(*(xpc_object_t *)(result + 32));
    }
    if (_waitForResponseSema_once != -1) {
      dispatch_once(&_waitForResponseSema_once, &__block_literal_global_221);
    }
    unint64_t v1 = _waitForResponseSema_sema;
    return dispatch_semaphore_signal(v1);
  }
  return result;
}

dispatch_queue_t ___waitForResponseQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CPLogging.waitForResponseQueue", 0);
  _waitForResponseQueue_queue = (uint64_t)result;
  return result;
}

dispatch_semaphore_t ___waitForResponseSema_block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(0);
  _waitForResponseSema_sema = (uint64_t)result;
  return result;
}

void ___workQueueSlurpToFileUUID_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueSlurpToFileUUID_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

uint64_t ___obfuscatedStringKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_obfuscatedStringKey_key, (void (__cdecl *)(void *))_releaseObfuscatedStrings);
}

CFNumberFormatterRef ___obfuscatedRepresentation_block_invoke()
{
  Systeint m = CFLocaleGetSystem();
  CFNumberFormatterRef result = CFNumberFormatterCreate(0, System, kCFNumberFormatterNoStyle);
  _obfuscatedRepresentation_numberFormatter = (uint64_t)result;
  return result;
}

uint64_t ___startObservingDefaultChanges_block_invoke()
{
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_260);
  }
  notify_register_dispatch("com.apple.managedconfiguration.defaultsdidchange", (int *)&_startObservingDefaultChanges_token, (dispatch_queue_t)_configurationQueue_queue, &__block_literal_global_250);
  if (_configurationQueue_once != -1) {
    dispatch_once(&_configurationQueue_once, &__block_literal_global_260);
  }
  uint64_t v0 = _configurationQueue_queue;
  return notify_register_dispatch("com.apple.AppSupport.loggingDefaultsChanged", (int *)&_startObservingDefaultChanges_token, v0, &__block_literal_global_253);
}

uint64_t _configurationQueueRereadAllDefaults()
{
  for (unsigned int i = (atomic_ullong *)atomic_load_explicit(&_logFileSettings, memory_order_acquire);
        i;
        unsigned int i = (atomic_ullong *)atomic_load_explicit(i, memory_order_acquire))
  {
    _configurationQueueRereadDefaultsForSetting((uint64_t)i);
  }
  if (_recomputeQueue_onceToken != -1) {
    dispatch_once(&_recomputeQueue_onceToken, &__block_literal_global_257);
  }
  dispatch_async((dispatch_queue_t)_recomputeQueue_queue, &__block_literal_global_255);
  return _rereadObfuscationPreferences();
}

dispatch_queue_t ___recomputeQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CPLogging.recomputeQueue", 0);
  _recomputeQueue_queue = (uint64_t)result;
  return result;
}

dispatch_queue_t ___configurationQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CPLogging.configurationQueue", 0);
  _configurationQueue_queue = (uint64_t)result;
  return result;
}

uint64_t _configurationQueueReadDefaultsValue(const __CFString *a1, const __CFString *a2)
{
  uint64_t v3 = 4294967293;
  int valuePtr = -3;
  if (a1) {
    CFStringRef v4 = a1;
  }
  else {
    CFStringRef v4 = @".GlobalPreferences";
  }
  CFPreferencesAppSynchronize(v4);
  CFNumberRef v5 = (const __CFNumber *)CFPreferencesCopyAppValue(a2, v4);
  if (!v5) {
    return v3;
  }
  CFNumberRef v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 == CFNumberGetTypeID())
  {
    if (CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  CFTypeID v8 = CFGetTypeID(v6);
  if (v8 != CFStringGetTypeID()
    || (IntCFBooleanRef Value = CFStringGetIntValue((CFStringRef)v6), (IntValue - 0x7FFFFFFF) <= 1))
  {
LABEL_10:
    CFLog();
    goto LABEL_11;
  }
  int valuePtr = IntValue;
LABEL_11:
  CFRelease(v6);
  uint64_t v3 = valuePtr;
  if (valuePtr <= -4)
  {
    CFLog();
    return 4294967293;
  }
  return v3;
}

void ___workQueueCopyFileUUIDForLogPath_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueCopyFileUUIDForLogPath_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

void ___workQueueStartNewLogFile_block_invoke(uint64_t a1)
{
  _waitForResponseQueueIsWaiting = 1;
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
}

void ___workQueueStartNewLogFile_block_invoke_2(uint64_t a1)
{
  if (_waitForResponseQueueResponse)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = xpc_retain((xpc_object_t)_waitForResponseQueueResponse);
    xpc_release((xpc_object_t)_waitForResponseQueueResponse);
    _waitForResponseQueueResponse = 0;
  }
}

void ___setLogName_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 144);
  if (v1)
  {
    unsigned __int8 v2 = *(const void **)(v1 + 8);
    if (v2) {
      CFRelease(v2);
    }
    *(void *)(v1 + 8) = 0;
  }
}

void ___setLogDirectory_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 144);
  if (v1)
  {
    unsigned __int8 v2 = *(const void **)(v1 + 8);
    if (v2) {
      CFRelease(v2);
    }
    *(void *)(v1 + 8) = 0;
  }
}

uint64_t CPFileCompressionZDeflate(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  uint64_t v3 = v2;
  CFStringRef v4 = (FILE *)v1;
  v12[1024] = *MEMORY[0x1E4F143B8];
  memset(&v10, 0, sizeof(v10));
  uint64_t v6 = deflateInit2_(&v10, v5, 8, 31, 8, 0, "1.2.12", 112);
  if (!v6)
  {
LABEL_2:
    v10.avail_in = fread(v12, 1uLL, 0x2000uLL, v4);
    if (!ferror(v4))
    {
      int v7 = feof(v4);
      v10.next_in = (Bytef *)v12;
      while (1)
      {
        v10.avail_out = 0x2000;
        v10.next_out = __ptr;
        deflate(&v10, 4 * (v7 != 0));
        size_t v8 = 0x2000 - v10.avail_out;
        if (fwrite(__ptr, 1uLL, v8, v3) != v8 || ferror(v3)) {
          break;
        }
        if (v10.avail_out)
        {
          if (!v7) {
            goto LABEL_2;
          }
          uint64_t v6 = 0;
          goto LABEL_10;
        }
      }
    }
    uint64_t v6 = 0xFFFFFFFFLL;
LABEL_10:
    deflateEnd(&v10);
  }
  return v6;
}

uint64_t __deallocatorCallback(uint64_t a1, void *a2)
{
  return [a2 returnSlot:a1];
}

uint64_t CPDNCheckIn(int a1, int a2)
{
  int v5 = 0;
  *(_OWORD *)&msg[4] = 0u;
  int v4 = a2;
  int v6 = 1310720;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(void *)&msg[20] = 0x1000130B0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x28u, 0, 0, 0, 0);
}

uint64_t (*CPDistributedNotificationCheckIn_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 78000) {
    return _XCheckIn;
  }
  else {
    return 0;
  }
}

uint64_t _XCheckIn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 40) && *(_DWORD *)(result + 44) > 0x1Fu)
      {
        uint64_t v4 = *(unsigned int *)(result + 12);
        uint64_t v5 = *(unsigned int *)(result + 28);
        long long v6 = *(_OWORD *)(result + 76);
        v7[0] = *(_OWORD *)(result + 60);
        v7[1] = v6;
        dispatch_queue_t result = _CPDNCheckIn(v4, v5, (uint64_t)v7);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      int v3 = -309;
    }
    else
    {
      int v3 = -300;
    }
  }
  else
  {
    int v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t CPDistributedNotificationCheckIn_server(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  int v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 4) = 36;
  *(_DWORD *)(a2 + 8) = v3;
  int v4 = *(_DWORD *)(a1 + 20) + 100;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 2CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v4;
  *(_DWORD *)(a2 + 12) = 0;
  if (*(_DWORD *)(a1 + 20) != 78000)
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 40)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(a1 + 40) && *(_DWORD *)(a1 + 44) > 0x1Fu)
      {
        uint64_t v7 = *(unsigned int *)(a1 + 12);
        uint64_t v8 = *(unsigned int *)(a1 + 28);
        long long v9 = *(_OWORD *)(a1 + 76);
        v10[0] = *(_OWORD *)(a1 + 60);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = _CPDNCheckIn(v7, v8, (uint64_t)v10);
        return 1;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return 1;
}

uint64_t CPDNDeliverNotification(int a1, vm_address_t a2, int a3, uint64_t a4, int a5)
{
  vm_address_t v12 = a2;
  int v13 = 16777472;
  v14[0] = a3;
  *(void *)&v14[1] = a4;
  v14[3] = 16777472;
  v15[0] = a5;
  *(void *)&v15[1] = *MEMORY[0x1E4F14068];
  void v15[3] = a3;
  v15[4] = a5;
  uint64_t v9 = 2147483667;
  int v10 = a1;
  long long v11 = xmmword_18FBBC0B0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v9, 17, 0x4Cu, 0, 0, 0, 0);
  if (v7 == 268435460)
  {
    if (v12 != a2) {
      mig_deallocate(v12, v14[0]);
    }
    if (*(void *)&v14[1] != a4) {
      mig_deallocate(*(vm_address_t *)&v14[1], v15[0]);
    }
  }
  return v7;
}

void (*CPDistributedNotification_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 77000) {
    return _XDeliverNotification;
  }
  else {
    return 0;
  }
}

void _XDeliverNotification(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && *(unsigned char *)(a1 + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(a1 + 40);
      if (v3 == *(_DWORD *)(a1 + 68))
      {
        unsigned int v4 = *(_DWORD *)(a1 + 56);
        if (v4 == *(_DWORD *)(a1 + 72))
        {
          *(_DWORD *)(a2 + 32) = _CPDNDeliverNotification(*(unsigned int *)(a1 + 12), *(void *)(a1 + 28), v3, *(void *)(a1 + 44), v4);
          mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
          *(void *)(a1 + 44) = 0;
          *(_DWORD *)(a1 + 56) = 0;
          mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
          *(void *)(a1 + 28) = 0;
          *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
          return;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

uint64_t CPDistributedNotification_server(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = *(_DWORD *)(a1 + 20) + 100;
  *(void *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 2CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v3;
  if (*(_DWORD *)(a1 + 20) != 77000)
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 76)
  {
    int v8 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v8;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return 1;
  }
  if (*(unsigned char *)(a1 + 39) != 1
    || *(unsigned char *)(a1 + 55) != 1
    || (unsigned int v5 = *(_DWORD *)(a1 + 40), v5 != *(_DWORD *)(a1 + 68))
    || (unsigned int v6 = *(_DWORD *)(a1 + 56), v6 != *(_DWORD *)(a1 + 72)))
  {
    int v8 = -300;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 32) = _CPDNDeliverNotification(*(unsigned int *)(a1 + 12), *(void *)(a1 + 28), v5, *(void *)(a1 + 44), v6);
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
  return 1;
}

uint64_t CPDMMessage(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  uint64_t v11 = a2;
  int v12 = 16777472;
  int v13 = a3;
  uint64_t v14 = a4;
  int v15 = 16777472;
  int v16 = a5;
  uint64_t v17 = a6;
  int v18 = 16777472;
  int v19 = a7;
  uint64_t v20 = a8;
  int v21 = 16777472;
  int v22 = a9;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  int v26 = a7;
  int v27 = a9;
  *(void *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18FBBC0E0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 1, 0x74u, 0, 0, 0, 0);
}

uint64_t CPDMTwoWayMessage(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, uint64_t a8, int a9, uint64_t a10, int a11, void *a12, _DWORD *a13, void *a14, _DWORD *a15)
{
  int v26 = 4;
  uint64_t v27 = a2;
  int v28 = 16777472;
  int v29 = a3;
  uint64_t v30 = a4;
  int v31 = 16777472;
  int v32 = a5;
  uint64_t v33 = a8;
  int v34 = 16777472;
  int v35 = a9;
  uint64_t v36 = a10;
  int v37 = 16777472;
  int v38 = a11;
  uint64_t v39 = *MEMORY[0x1E4F14068];
  int v40 = a3;
  int v41 = a5;
  int v42 = a9;
  int v43 = a11;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.mach_msg_bits_t msgh_bits = 2147489043;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1349900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v19 = mach_msg(&msg, 3, 0x74u, 0x68u, reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v19)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v20 = 4294966988;
      }
      else if (msg.msgh_id == 79101)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v20 = 4294966996;
          if (v26 == 3
            && msg.msgh_size == 96
            && !msg.msgh_remote_port
            && HIBYTE(v28) == 1
            && HIBYTE(v31) == 1
            && HIBYTE(v34) == 1)
          {
            int v21 = v29;
            if (v29 == v37)
            {
              int v22 = v32;
              if (v32 == v38)
              {
                int v23 = v35;
                if (v35 == v39)
                {
                  uint64_t v20 = 0;
                  *a6 = v27;
                  *a7 = v21;
                  *a12 = v30;
                  *a13 = v22;
                  *a14 = v33;
                  *a15 = v23;
                  return v20;
                }
              }
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v20 = 4294966996;
          if (HIDWORD(v27))
          {
            if (msg.msgh_remote_port) {
              uint64_t v20 = 4294966996;
            }
            else {
              uint64_t v20 = HIDWORD(v27);
            }
          }
        }
        else
        {
          uint64_t v20 = 4294966996;
        }
      }
      else
      {
        uint64_t v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t CPDMTwoWayMessageWithPortPassing(int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, void *a7, _DWORD *a8, uint64_t a9, int a10, uint64_t a11, int a12, void *a13, _DWORD *a14, void *a15, _DWORD *a16)
{
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_DWORD *)&rcv_name[20] = 5;
  *(_DWORD *)&rcv_name[24] = a2;
  int v28 = 1310720;
  *(void *)int v29 = a3;
  *(_DWORD *)&v29[8] = 16777472;
  int v30 = a4;
  *(void *)int v31 = a5;
  *(_DWORD *)&v31[8] = 16777472;
  int v32 = a6;
  uint64_t v33 = a9;
  int v34 = 16777472;
  int v35 = a10;
  uint64_t v36 = a11;
  int v37 = 16777472;
  int v38 = a12;
  uint64_t v39 = *MEMORY[0x1E4F14068];
  int v40 = a4;
  int v41 = a6;
  int v42 = a10;
  int v43 = a12;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v26 = -2147478253;
  *(void *)&rcv_name[12] = 0x1349A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v26);
    mach_port_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v20 = mach_msg((mach_msg_header_t *)&v26, 3, 0x80u, 0x68u, reply_port, 0, 0);
  uint64_t v21 = v20;
  if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v20)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v21 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 79102)
      {
        if (v26 < 0)
        {
          uint64_t v21 = 4294966996;
          if (*(_DWORD *)&rcv_name[20] == 3
            && *(_DWORD *)rcv_name == 96
            && !*(_DWORD *)&rcv_name[4]
            && HIBYTE(v28) == 1
            && HIBYTE(v30) == 1
            && HIBYTE(v32) == 1)
          {
            int v22 = *(_DWORD *)v29;
            if (*(_DWORD *)v29 == v35)
            {
              int v23 = *(_DWORD *)v31;
              if (*(_DWORD *)v31 == v36)
              {
                int v24 = v33;
                if (v33 == HIDWORD(v36))
                {
                  uint64_t v21 = 0;
                  *a7 = *(void *)&rcv_name[24];
                  *a8 = v22;
                  *a13 = *(void *)&v29[4];
                  *a14 = v23;
                  *a15 = *(void *)&v31[4];
                  *a16 = v24;
                  return v21;
                }
              }
            }
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          uint64_t v21 = 4294966996;
          if (*(_DWORD *)&rcv_name[28])
          {
            if (*(_DWORD *)&rcv_name[4]) {
              uint64_t v21 = 4294966996;
            }
            else {
              uint64_t v21 = *(unsigned int *)&rcv_name[28];
            }
          }
        }
        else
        {
          uint64_t v21 = 4294966996;
        }
      }
      else
      {
        uint64_t v21 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v26);
      return v21;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  return v21;
}

uint64_t CPDMNonBlockingMessage(int a1, vm_address_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, mach_msg_timeout_t a10)
{
  vm_address_t v17 = a2;
  int v18 = 16777472;
  v19[0] = a3;
  *(void *)&v19[1] = a4;
  char v19[3] = 16777472;
  v20[0] = a5;
  *(void *)&v20[1] = a6;
  v20[3] = 16777472;
  v21[0] = a7;
  *(void *)&v21[1] = a8;
  unint64_t v21[3] = 16777472;
  v22[0] = a9;
  *(void *)&v22[1] = *MEMORY[0x1E4F14068];
  v22[3] = a3;
  v22[4] = a5;
  v22[5] = a7;
  v22[6] = a9;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18FBBC0F0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v14 = mach_msg((mach_msg_header_t *)msg, 17, 0x74u, 0, 0, a10, 0);
  if (v14 == 268435460)
  {
    if (v17 != a2) {
      mig_deallocate(v17, v19[0]);
    }
    if (*(void *)&v19[1] != a4) {
      mig_deallocate(*(vm_address_t *)&v19[1], v20[0]);
    }
    if (*(void *)&v20[1] != a6) {
      mig_deallocate(*(vm_address_t *)&v20[1], v21[0]);
    }
    if (*(void *)&v21[1] != a8) {
      mig_deallocate(*(vm_address_t *)&v21[1], v22[0]);
    }
  }
  return v14;
}

uint64_t (*CPDistributedMessaging_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 79004) >= 0xFFFFFFFC) {
    return _CPDMCPDistributedMessaging_subsystem[5 * (v1 - 79000) + 5];
  }
  else {
    return 0;
  }
}

void _XMessage(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 116)
  {
    if (*(unsigned char *)(a1 + 39) == 1
      && *(unsigned char *)(a1 + 55) == 1
      && *(unsigned char *)(a1 + 71) == 1
      && *(unsigned char *)(a1 + 87) == 1
      && (unsigned int v2 = *(_DWORD *)(a1 + 40), v2 == *(_DWORD *)(a1 + 100))
      && (unsigned int v3 = *(_DWORD *)(a1 + 56), v3 == *(_DWORD *)(a1 + 104))
      && (unsigned int v4 = *(_DWORD *)(a1 + 72), v4 == *(_DWORD *)(a1 + 108))
      && (unsigned int v5 = *(_DWORD *)(a1 + 88), v5 == *(_DWORD *)(a1 + 112)))
    {
      if (!*(_DWORD *)(a1 + 116) && *(_DWORD *)(a1 + 120) > 0x1Fu)
      {
        uint64_t v7 = *(unsigned int *)(a1 + 12);
        uint64_t v8 = *(void *)(a1 + 28);
        uint64_t v9 = *(void *)(a1 + 44);
        uint64_t v10 = *(void *)(a1 + 60);
        uint64_t v11 = *(UInt8 **)(a1 + 76);
        long long v12 = *(_OWORD *)(a1 + 152);
        v14[0] = *(_OWORD *)(a1 + 136);
        v14[1] = v12;
        *(_DWORD *)(a2 + 32) = _CPDMMessage(v7, v8, v2, v9, v3, v10, v4, v11, v5, (uint64_t)v14);
        mig_deallocate(*(void *)(a1 + 60), *(unsigned int *)(a1 + 72));
        *(void *)(a1 + 6CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
        *(_DWORD *)(a1 + 72) = 0;
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
        return;
      }
      int v6 = -309;
    }
    else
    {
      int v6 = -300;
    }
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

void _XTwoWayMessage(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 4 || *(_DWORD *)(a1 + 4) != 116)
  {
    int v2 = -304;
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 39) != 1
    || *(unsigned char *)(a1 + 55) != 1
    || *(unsigned char *)(a1 + 71) != 1
    || *(unsigned char *)(a1 + 87) != 1
    || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 100)
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 104)
    || *(_DWORD *)(a1 + 72) != *(_DWORD *)(a1 + 108)
    || *(_DWORD *)(a1 + 88) != *(_DWORD *)(a1 + 112))
  {
    int v2 = -300;
    goto LABEL_16;
  }
  if (*(_DWORD *)(a1 + 116) || *(_DWORD *)(a1 + 120) <= 0x1Fu)
  {
    int v2 = -309;
LABEL_16:
    *(_DWORD *)(a2 + 32) = v2;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return;
  }
  *(_DWORD *)(a2 + 84) = 0;
  uint64_t v3 = a2 + 84;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v4 = a2 + 28;
  unsigned int v5 = (void *)(a2 + 44);
  *(_DWORD *)(a2 + 52) = 16777472;
  int v6 = (void *)(a2 + 60);
  *(_DWORD *)(a2 + 68) = 16777472;
  *(_DWORD *)(a2 + 88) = 0;
  uint64_t v7 = (_DWORD *)(a2 + 88);
  unsigned int v8 = *(_DWORD *)(a1 + 8);
  uint64_t v9 = *(unsigned int *)(a1 + 12);
  uint64_t v10 = *(void *)(a1 + 28);
  unsigned int v11 = *(_DWORD *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 44);
  unsigned int v13 = *(_DWORD *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 60);
  unsigned int v15 = *(_DWORD *)(a1 + 72);
  int v16 = *(UInt8 **)(a1 + 76);
  unsigned int v17 = *(_DWORD *)(a1 + 88);
  long long v18 = *(_OWORD *)(a1 + 152);
  v23[0] = *(_OWORD *)(a1 + 136);
  v23[1] = v18;
  int v20 = _CPDMTwoWayMessage(v9, v8, v10, v11, v12, v13, v4, v3, v14, v15, v16, v17, v5, v7, v6, (_DWORD *)(v3 + 8), (uint64_t)v23);
  mig_deallocate(*(void *)(a1 + 60), *(unsigned int *)(a1 + 72));
  *(void *)(a1 + 6CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
  *(_DWORD *)(a1 + 72) = 0;
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
  if (v20)
  {
    *(_DWORD *)(a2 + 32) = v20;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    int v21 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a2 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = *(_DWORD *)(a2 + 84);
    *(_DWORD *)(a2 + 56) = v21;
    *(_DWORD *)(a2 + 72) = *(_DWORD *)(a2 + 92);
    *(void *)(a2 + 76) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 96;
    *(_DWORD *)(a2 + 24) = 3;
  }
}

void _XTwoWayMessageWithPortPassing(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 5 || *(_DWORD *)(a1 + 4) != 128)
  {
    int v3 = -304;
    goto LABEL_17;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(unsigned char *)(a1 + 51) != 1
    || *(unsigned char *)(a1 + 67) != 1
    || *(unsigned char *)(a1 + 83) != 1
    || *(unsigned char *)(a1 + 99) != 1
    || *(_DWORD *)(a1 + 52) != *(_DWORD *)(a1 + 112)
    || *(_DWORD *)(a1 + 68) != *(_DWORD *)(a1 + 116)
    || *(_DWORD *)(a1 + 84) != *(_DWORD *)(a1 + 120)
    || *(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 124))
  {
    int v3 = -300;
    goto LABEL_17;
  }
  uint64_t v2 = a1 + 128;
  if (*(_DWORD *)(a1 + 128) || *(_DWORD *)(a1 + 132) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v3;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return;
  }
  *(_DWORD *)(a2 + 84) = 0;
  uint64_t v4 = a2 + 84;
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v5 = a2 + 28;
  int v6 = (void *)(a2 + 44);
  *(_DWORD *)(a2 + 52) = 16777472;
  uint64_t v7 = (void *)(a2 + 60);
  *(_DWORD *)(a2 + 68) = 16777472;
  *(_DWORD *)(a2 + 88) = 0;
  unsigned int v8 = (_DWORD *)(a2 + 88);
  uint64_t v10 = *(unsigned int *)(a1 + 12);
  unsigned int v11 = *(_DWORD *)(a1 + 8);
  unsigned int v12 = *(_DWORD *)(a1 + 28);
  uint64_t v13 = *(void *)(a1 + 40);
  unsigned int v14 = *(_DWORD *)(a1 + 52);
  uint64_t v15 = *(void *)(a1 + 56);
  unsigned int v16 = *(_DWORD *)(a1 + 68);
  uint64_t v17 = *(void *)(a1 + 72);
  unsigned int v18 = *(_DWORD *)(a1 + 84);
  uint64_t v19 = *(UInt8 **)(a1 + 88);
  unsigned int v20 = *(_DWORD *)(a1 + 100);
  long long v21 = *(_OWORD *)(v2 + 36);
  v25[0] = *(_OWORD *)(v2 + 20);
  v25[1] = v21;
  int v22 = _CPDMTwoWayMessageWithPortPassing(v10, v11, v12, v13, v14, v15, v16, v5, v4, v17, v18, v19, v20, v6, v8, v7, (_DWORD *)(v4 + 8), (uint64_t)v25);
  mig_deallocate(*(void *)(a1 + 72), *(unsigned int *)(a1 + 84));
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  mig_deallocate(*(void *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  if (v22)
  {
    *(_DWORD *)(a2 + 32) = v22;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    int v23 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)(a2 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = *(_DWORD *)(a2 + 84);
    *(_DWORD *)(a2 + 56) = v23;
    *(_DWORD *)(a2 + 72) = *(_DWORD *)(a2 + 92);
    *(void *)(a2 + 76) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 96;
    *(_DWORD *)(a2 + 24) = 3;
  }
}

void _XNonBlockingMessage(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 116)
  {
    if (*(unsigned char *)(a1 + 39) == 1
      && *(unsigned char *)(a1 + 55) == 1
      && *(unsigned char *)(a1 + 71) == 1
      && *(unsigned char *)(a1 + 87) == 1
      && (unsigned int v2 = *(_DWORD *)(a1 + 40), v2 == *(_DWORD *)(a1 + 100))
      && (unsigned int v3 = *(_DWORD *)(a1 + 56), v3 == *(_DWORD *)(a1 + 104))
      && (unsigned int v4 = *(_DWORD *)(a1 + 72), v4 == *(_DWORD *)(a1 + 108))
      && (unsigned int v5 = *(_DWORD *)(a1 + 88), v5 == *(_DWORD *)(a1 + 112)))
    {
      if (!*(_DWORD *)(a1 + 116) && *(_DWORD *)(a1 + 120) > 0x1Fu)
      {
        uint64_t v7 = *(unsigned int *)(a1 + 12);
        uint64_t v8 = *(void *)(a1 + 28);
        uint64_t v9 = *(void *)(a1 + 44);
        uint64_t v10 = *(void *)(a1 + 60);
        unsigned int v11 = *(UInt8 **)(a1 + 76);
        long long v12 = *(_OWORD *)(a1 + 152);
        v14[0] = *(_OWORD *)(a1 + 136);
        v14[1] = v12;
        *(_DWORD *)(a2 + 32) = _CPDMNonBlockingMessage(v7, v8, v2, v9, v3, v10, v4, v11, v5, (uint64_t)v14);
        mig_deallocate(*(void *)(a1 + 60), *(unsigned int *)(a1 + 72));
        *(void *)(a1 + 6CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
        *(_DWORD *)(a1 + 72) = 0;
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = 0;
        return;
      }
      int v6 = -309;
    }
    else
    {
      int v6 = -300;
    }
  }
  else
  {
    int v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

uint64_t CPDistributedMessaging_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 2CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_revertRecord, 0) = v3;
  int v4 = a1[5];
  if ((v4 - 79004) >= 0xFFFFFFFC
    && (unsigned int v5 = (void (*)(void))_CPDMCPDistributedMessaging_subsystem[5 * (v4 - 79000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t CPDMTwoWayMessageReply(unsigned int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  memset(v17, 0, sizeof(v17));
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  if (a2)
  {
    HIDWORD(v14) = a2;
    *(void *)((char *)&v14 + 4) = *MEMORY[0x1E4F14068];
    int v9 = 18;
  }
  else
  {
    DWORD1(v14) = 3;
    *((void *)&v14 + 1) = a3;
    LODWORD(v15) = 16777472;
    DWORD1(v15) = a4;
    *((void *)&v15 + 1) = a5;
    LODWORD(v16) = 16777472;
    DWORD1(v16) = a6;
    *((void *)&v16 + 1) = a7;
    *(_DWORD *)uint64_t v17 = 16777472;
    *(_DWORD *)&v17[4] = a8;
    *(void *)&v17[8] = *MEMORY[0x1E4F14068];
    *(_DWORD *)&v17[16] = a4;
    *(_DWORD *)&v17[20] = a6;
    *(_DWORD *)&unsigned char v17[24] = a8;
    int v9 = -2147483630;
  }
  int v12 = v9;
  *(void *)((char *)&v13 + 4) = a1;
  HIDWORD(v13) = 0;
  LODWORD(v14) = 79101;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  }
  if (a2) {
    mach_msg_size_t v10 = 36;
  }
  else {
    mach_msg_size_t v10 = 96;
  }
  return mach_msg((mach_msg_header_t *)&v12, 1, v10, 0, 0, 0, 0);
}

uint64_t CPDMTwoWayMessageReplyWithPortPassing(unsigned int a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  memset(v17, 0, sizeof(v17));
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  if (a2)
  {
    HIDWORD(v14) = a2;
    *(void *)((char *)&v14 + 4) = *MEMORY[0x1E4F14068];
    int v9 = 18;
  }
  else
  {
    DWORD1(v14) = 3;
    *((void *)&v14 + 1) = a3;
    LODWORD(v15) = 16777472;
    DWORD1(v15) = a4;
    *((void *)&v15 + 1) = a5;
    LODWORD(v16) = 16777472;
    DWORD1(v16) = a6;
    *((void *)&v16 + 1) = a7;
    *(_DWORD *)uint64_t v17 = 16777472;
    *(_DWORD *)&v17[4] = a8;
    *(void *)&v17[8] = *MEMORY[0x1E4F14068];
    *(_DWORD *)&v17[16] = a4;
    *(_DWORD *)&v17[20] = a6;
    *(_DWORD *)&unsigned char v17[24] = a8;
    int v9 = -2147483630;
  }
  int v12 = v9;
  *(void *)((char *)&v13 + 4) = a1;
  HIDWORD(v13) = 0;
  LODWORD(v14) = 79102;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v12);
  }
  if (a2) {
    mach_msg_size_t v10 = 36;
  }
  else {
    mach_msg_size_t v10 = 96;
  }
  return mach_msg((mach_msg_header_t *)&v12, 1, v10, 0, 0, 0, 0);
}

void CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_1(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a2;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "free space request: caller requested unsupported effort level %d for block %p", (uint8_t *)v2, 0x12u);
}

void CPFreeSpaceRequestBytesAtPathWithCompletionBlock_cold_2(void *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 136315650;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "domain"), "UTF8String");
  __int16 v6 = 2048;
  uint64_t v7 = [a1 code];
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "free space request: failed to get total space and available space with error domain %s code %lld for block %p", (uint8_t *)&v4, 0x20u);
}

void GetTotalCapacityAndAvailableCapacityForMountPoint_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "free space request: failed to stat the mount point", v0, 2u);
}

void __CPFreeSpaceRequestBytesAtPathWithCompletionBlock_block_invoke_9_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "domain"), "UTF8String");
  uint64_t v3 = [*(id *)(a1 + 40) code];
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = 136315650;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "free space request: failed to get capacity and available space with error domain %s code %lld for block %p", (uint8_t *)&v5, 0x20u);
}

void checkResultWithStatement_cold_1(uint64_t a1, int a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109634;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a3;
  __int16 v6 = 2082;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "SQLITE Error: %i, extended error: %i, error message: %{public}s", (uint8_t *)v3, 0x18u);
}

void CPDeleteTree_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18FB7F000, v1, v2, "fts_close failed: %s", v3, v4, v5, v6, v7);
}

void CPPathUtils_MakePath_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_18FB7F000, log, OS_LOG_TYPE_ERROR, "_CStringPathUtils_FileAtPathExists: stat failed. errno = %d, path = %s", (uint8_t *)v3, 0x12u);
}

void __getRBSProcessHandleClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRBSProcessHandleClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPInhibitor.m", 15, @"Unable to find class %s", "RBSProcessHandle");

  __break(1u);
}

void RunningBoardServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *RunningBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CPInhibitor.m", 13, @"%s", *a1);

  __break(1u);
}

void __getRBSTargetClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRBSTargetClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPInhibitor.m", 16, @"Unable to find class %s", "RBSTarget");

  __break(1u);
}

void __getRBSDomainAttributeClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRBSDomainAttributeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPInhibitor.m", 17, @"Unable to find class %s", "RBSDomainAttribute");

  __break(1u);
}

void __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRBSAcquisitionCompletionAttributeClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPInhibitor.m", 18, @"Unable to find class %s", "RBSAcquisitionCompletionAttribute");

  __break(1u);
}

void __getRBSAssertionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getRBSAssertionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPInhibitor.m", 14, @"Unable to find class %s", "RBSAssertion");

  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)"), @"SysConfigUtils.m", 29, @"%s", *a1);
  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNPSDomainAccessorClass(void)_block_invoke"), @"SysConfigUtils.m", 30, @"Unable to find class %s", "NPSDomainAccessor");
  __break(1u);
}

void __getNSSManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *NanoSystemSettingsLibrary(void)"), @"SysConfigUtils.m", 21, @"%s", *a1);
  __break(1u);
}

void __getNSSManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = (unsigned __int8 *)objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNSSManagerClass(void)_block_invoke"), @"SysConfigUtils.m", 22, @"Unable to find class %s", "NSSManager");
  __break(1u);
  CC_SHA1_Final(v1, v2);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73B8](allocator, capacity);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1F40D73D8](bv);
}

CFIndex CFBitVectorGetFirstIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1F40D73E8](bv, range.location, range.length, *(void *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D78A8](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

uint64_t CFDateFormatterCreateDateFormatsFromTemplates()
{
  return MEMORY[0x1F40D78C0]();
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1F40D78F8](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BE8](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D7C48](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x1F40D7C50]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1F40D7D98](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithNumber(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number)
{
  return (CFStringRef)MEMORY[0x1F40D7DA8](allocator, formatter, number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8700](allocator, name, tryAbbrev);
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  MEMORY[0x1F40D8718](tz, at);
  return result;
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1F40D8808](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2B8](info, cbks);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9748](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1F40DA9E8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99A8](provider, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F78](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x1F40E8FC0](time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9018]();
}

IOReturn IOPMSchedulePowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x1F40E9060](time_to_wake, my_id, type);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1F4114240]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1F4114250]();
}

uint64_t PNDecomposeForCountry()
{
  return MEMORY[0x1F4114258]();
}

uint64_t PNPhoneNumbersEqual()
{
  return MEMORY[0x1F4114270]();
}

int SCError(void)
{
  return MEMORY[0x1F4101E20]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x1F4101E28](*(void *)&status);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F18](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4101F30](target, runLoop, runLoopMode);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FE8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4101FF0](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1F4102000](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4102010](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1F4102018](prefs, wait);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102028](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1F4102030](prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return MEMORY[0x1F4102040](prefs, queue);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x1F4102058](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1F4102068](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1F4102070](prefs, runLoop, runLoopMode);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _PNCopyCountryCodeForInternationalCode()
{
  return MEMORY[0x1F4114278]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _sqlite3_system_busy_handler()
{
  return MEMORY[0x1F4181F58]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void asl_free(asl_object_t obj)
{
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x1F40CA408](client, msg, *(void *)&level, format);
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1F40CA410](*(void *)&type);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1F40CA418](ident, facility, *(void *)&opts);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1F40CA488](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1F40CA540]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40CA550]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1F40CA560]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
}

uint64_t decomposedPhoneNumbersEqual()
{
  return MEMORY[0x1F41142A8]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA8](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1F40CC348](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1F40CCE00](path, omode);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE38](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE80](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x1F40CD3A0]();
}

uint64_t os_log_shim_with_CFString()
{
  return MEMORY[0x1F40CD3A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1F4182040](a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

void *__cdecl sqlite3_commit_hook(sqlite3 *a1, int (__cdecl *a2)(void *), void *a3)
{
  return (void *)MEMORY[0x1F41820E8](a1, a2, a3);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_free_table(char **result)
{
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1F41821F0](a1);
}

int sqlite3_get_table(sqlite3 *db, const char *zSql, char ***pazResult, int *pnRow, int *pnColumn, char **pzErrmsg)
{
  return MEMORY[0x1F4182200](db, zSql, pazResult, pnRow, pnColumn, pzErrmsg);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

void *__cdecl sqlite3_profile(sqlite3 *a1, void (__cdecl *xProfile)(void *, const char *, sqlite3_uint64), void *a3)
{
  return (void *)MEMORY[0x1F41822A0](a1, xProfile, a3);
}

void sqlite3_progress_handler(sqlite3 *a1, int a2, int (__cdecl *a3)(void *), void *a4)
{
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

void *__cdecl sqlite3_update_hook(sqlite3 *a1, void (__cdecl *a2)(void *, int, const char *, const char *, sqlite3_int64), void *a3)
{
  return (void *)MEMORY[0x1F4182400](a1, a2, a3);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1F4182408](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1F4182440](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

void srandom(unsigned int a1)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

float strtof(const char *a1, char **a2)
{
  MEMORY[0x1F40CE270](a1, a2);
  return result;
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1F417F728](*(void *)&code);
}

UBool u_isUUppercase(UChar32 c)
{
  return MEMORY[0x1F417F798](*(void *)&c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (UChar *)MEMORY[0x1F417F838](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

void u_versionToString(const UVersionInfo versionArray, char *versionString)
{
}

uint64_t ubrk_close()
{
  return MEMORY[0x1F417FA30]();
}

uint64_t ubrk_isBoundary()
{
  return MEMORY[0x1F417FA68]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1F417FA80]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x1F417FAA0]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1F417FDA0]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1F417FDC8]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x1F417FDD0]();
}

uint64_t uloc_setKeywordValue()
{
  return MEMORY[0x1F41801C8]();
}

uint64_t ulocdata_getCLDRVersion()
{
  return MEMORY[0x1F41801F0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t usearch_close()
{
  return MEMORY[0x1F4180610]();
}

uint64_t usearch_first()
{
  return MEMORY[0x1F4180618]();
}

uint64_t usearch_getMatchedLength()
{
  return MEMORY[0x1F4180628]();
}

uint64_t usearch_last()
{
  return MEMORY[0x1F4180630]();
}

uint64_t usearch_next()
{
  return MEMORY[0x1F4180638]();
}

uint64_t usearch_openFromCollator()
{
  return MEMORY[0x1F4180648]();
}

uint64_t usearch_setPattern()
{
  return MEMORY[0x1F4180670]();
}

uint64_t usearch_setText()
{
  return MEMORY[0x1F4180678]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1F4180780](ut);
}

UBool utext_moveIndex32(UText *ut, int32_t delta)
{
  return MEMORY[0x1F41807A8](ut, *(void *)&delta);
}

UChar32 utext_next32(UText *ut)
{
  return MEMORY[0x1F41807B8](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1F41807C0](ut, s, length, status);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}
CTFontDescriptorRef MACaptionAppearanceCopyFontDescriptorForStyle(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior, MACaptionAppearanceFontStyle fontStyle)
{
  return MACaptionAppearanceCopyFontDescriptorWithStrokeForStyle(domain, behavior, fontStyle, 0, 0, 12.0);
}

CGFloat MACaptionAppearanceGetRelativeCharacterSize(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  return MACaptionAppearanceGetRelativeCharacterSizeForLanguage(domain, behavior, 0);
}

BOOL MADimFlashingLightsEnabled(void)
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  v0 = (unsigned int (*)(void))get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  v6 = get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_1E6223850;
    v2[4] = &v3;
    __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (unsigned int (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    MADimFlashingLightsEnabled_cold_1();
  }
  return v0() != 0;
}

void sub_1BA6D0B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA6D0D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___xpcConnection_block_invoke()
{
  _xpcConnection__XpcConnection = (uint64_t)xpc_connection_create_mach_service("com.apple.accessibility.mediaaccessibilityd", 0, 0);
  xpc_connection_set_event_handler((xpc_connection_t)_xpcConnection__XpcConnection, &__block_literal_global_49);
  v0 = (_xpc_connection_s *)_xpcConnection__XpcConnection;

  xpc_connection_resume(v0);
}

void __MAPreferenceInitializeIfNeeded_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_settingsChangedNotificationHandler, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_settingsChangedNotificationHandler, @"com.apple.mediaaccessibility.audibleMediaSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  MAPreferenceAddPublicWriteableKey(@"MACaptionPreferredLanguages");

  MAPreferenceAddPublicWriteableKey(@"MACaptionDisplayType");
}

void MAPreferenceAddPublicWriteableKey(void *value)
{
  Mutable = (__CFSet *)MAPublicWriteableKeys;
  if (!MAPublicWriteableKeys)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
    MAPublicWriteableKeys = (uint64_t)Mutable;
  }

  CFSetAddValue(Mutable, value);
}

MACaptionAppearanceDisplayType MACaptionAppearanceGetDisplayType(MACaptionAppearanceDomain domain)
{
  CFNumberRef v1 = MACaptionAppearancePrefCopyDisplayType();
  if (!v1) {
    return 0;
  }
  CFNumberRef v2 = v1;
  int valuePtr = 0;
  if (CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr)) {
    MACaptionAppearanceDisplayType v3 = valuePtr;
  }
  else {
    MACaptionAppearanceDisplayType v3 = kMACaptionAppearanceDisplayTypeForcedOnly;
  }
  CFRelease(v2);
  return v3;
}

CFNumberRef MACaptionAppearancePrefCopyDisplayType()
{
  CFNumberRef v0 = (const __CFNumber *)MAPreferencesCopyNumber(@"MACaptionDisplayType");
  if (!v0) {
    return 0;
  }
  CFNumberRef v1 = v0;
  int valuePtr = 0;
  if (CFNumberGetValue(v0, kCFNumberSInt32Type, &valuePtr))
  {
    if (valuePtr == 2) {
      int v2 = 1;
    }
    else {
      int v2 = 2 * (valuePtr == 3);
    }
    int valuePtr = v2;
    CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  }
  else
  {
    CFNumberRef v3 = 0;
  }
  CFRelease(v1);
  return v3;
}

const void *MAPreferencesCopyNumber(__CFString *a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(0, a1, TypeID);
}

CGColorRef MACaptionAppearanceCopyForegroundColor(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = 0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundColor, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundColor, domain, &v6, behavior);
  CGColorRef result = v6;
  if (domain && !v6)
  {
    _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundColor, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundColor, 0, &v6, behavior);
    CGColorRef result = v6;
  }
  if (!result)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_1BA6E0748;
    long long v8 = unk_1BA6E0758;
    CGColorRef result = CGColorCreate(DeviceRGB, components);
    v6 = result;
    if (DeviceRGB)
    {
      CFRelease(DeviceRGB);
      return v6;
    }
  }
  return result;
}

CGFloat MACaptionAppearanceGetForegroundOpacity(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  CFNumberRef number = 0;
  double valuePtr = 1.0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundOpacity, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity, domain, &number, behavior);
  if (!number) {
    return 1.0;
  }
  CFNumberGetValue(number, kCFNumberCGFloatType, &valuePtr);
  CFRelease(number);
  return valuePtr;
}

CGFloat MACaptionAppearanceGetWindowOpacity(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  CFNumberRef number = 0;
  double valuePtr = 1.0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowOpacity, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowOpacity, domain, &number, behavior);
  if (!number) {
    return 1.0;
  }
  CFNumberGetValue(number, kCFNumberCGFloatType, &valuePtr);
  CFRelease(number);
  return valuePtr;
}

CGFloat MACaptionAppearanceGetBackgroundOpacity(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  CFNumberRef number = 0;
  double valuePtr = 1.0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundOpacity, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity, domain, &number, behavior);
  if (!number) {
    return 1.0;
  }
  CFNumberGetValue(number, kCFNumberCGFloatType, &valuePtr);
  CFRelease(number);
  return valuePtr;
}

CGColorRef MACaptionAppearanceCopyBackgroundColor(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = 0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundColor, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundColor, domain, &v6, behavior);
  CGColorRef result = v6;
  if (domain && !v6)
  {
    _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundColor, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideBackgroundColor, 0, &v6, behavior);
    CGColorRef result = v6;
  }
  if (!result)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = 0u;
    long long v8 = 0u;
    CGColorRef result = CGColorCreate(DeviceRGB, components);
    v6 = result;
    if (DeviceRGB)
    {
      CFRelease(DeviceRGB);
      return v6;
    }
  }
  return result;
}

CGColorRef MACaptionAppearanceCopyWindowColor(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = 0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowColor, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowColor, domain, &v6, behavior);
  CGColorRef result = v6;
  if (domain && !v6)
  {
    _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowColor, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideWindowColor, 0, &v6, behavior);
    CGColorRef result = v6;
  }
  if (!result)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = 0u;
    long long v8 = 0u;
    CGColorRef result = CGColorCreate(DeviceRGB, components);
    v6 = result;
    if (DeviceRGB)
    {
      CFRelease(DeviceRGB);
      return v6;
    }
  }
  return result;
}

CFArrayRef MACaptionAppearanceCopySelectedLanguages(MACaptionAppearanceDomain domain)
{
  MAPreferenceInitializeIfNeeded();
  CFArrayRef OrderedCanonicalLanguageIdentifiersFromString = MACaptionAppearancePrefCopyPreferredLanguages();
  CFBooleanRef v2 = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
  if (v2)
  {
    CFBooleanRef v3 = v2;
    BOOL v4 = CFBooleanGetValue(v2) != 0;
    CFRelease(v3);
    if (!OrderedCanonicalLanguageIdentifiersFromString) {
      goto LABEL_11;
    }
LABEL_5:
    CFIndex Count = CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString);
    uint64_t v6 = Count;
    if (Count) {
      char v7 = v4;
    }
    else {
      char v7 = 1;
    }
    if (v7)
    {
      if (!Count)
      {
        CFRelease(OrderedCanonicalLanguageIdentifiersFromString);
        goto LABEL_11;
      }
    }
    else
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(OrderedCanonicalLanguageIdentifiersFromString, 0);
      CFStringRef LanguageFromLocaleIdentifier = (const __CFString *)MAXUtilitiesCreateLanguageFromLocaleIdentifier(ValueAtIndex);
      if (LanguageFromLocaleIdentifier)
      {
        CFStringRef v15 = LanguageFromLocaleIdentifier;
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        CFArrayAppendValue(Mutable, ValueAtIndex);
        if (v6 >= 2)
        {
          for (CFIndex i = 1; i != v6; ++i)
          {
            CFStringRef v18 = (const __CFString *)CFArrayGetValueAtIndex(OrderedCanonicalLanguageIdentifiersFromString, i);
            CFStringRef v19 = (const __CFString *)MAXUtilitiesCreateLanguageFromLocaleIdentifier(v18);
            if (v19)
            {
              CFStringRef v20 = v19;
              if (CFStringCompare(v19, v15, 1uLL) == kCFCompareEqualTo) {
                CFArrayAppendValue(Mutable, v18);
              }
              CFRelease(v20);
            }
          }
        }
        CFRelease(v15);
        if (!Mutable) {
          goto LABEL_28;
        }
        CFRelease(OrderedCanonicalLanguageIdentifiersFromString);
        return Mutable;
      }
    }
    return OrderedCanonicalLanguageIdentifiersFromString;
  }
  BOOL v4 = 0;
  if (OrderedCanonicalLanguageIdentifiersFromString) {
    goto LABEL_5;
  }
LABEL_11:
  CFLocaleRef v8 = CFLocaleCopyCurrent();
  if (!v8) {
    goto LABEL_30;
  }
  CFLocaleRef v9 = v8;
  CFStringRef v10 = (const __CFString *)MEMORY[0x1BA9EEDC0]();
  if (v10
    && (CFStringRef CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(v10)) != 0)
  {
    CFStringRef v12 = CanonicalLanguageIdentifierFromString;
    CFArrayRef OrderedCanonicalLanguageIdentifiersFromString = MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(CanonicalLanguageIdentifierFromString);
    CFRelease(v12);
  }
  else
  {
    CFArrayRef OrderedCanonicalLanguageIdentifiersFromString = 0;
  }
  CFRelease(v9);
LABEL_28:
  Mutable = OrderedCanonicalLanguageIdentifiersFromString;
  if (OrderedCanonicalLanguageIdentifiersFromString) {
    return Mutable;
  }
LABEL_30:
  v22 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];

  return CFArrayCreate(0, 0, 0, v22);
}

__CFArray *MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(const __CFString *a1)
{
  CFStringRef CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(a1);
  if (!CanonicalLanguageIdentifierFromString) {
    return 0;
  }
  CFStringRef v2 = CanonicalLanguageIdentifierFromString;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  CFArrayAppendValue(Mutable, v2);
  CFStringRef LanguageFromLocaleIdentifier = MAXUtilitiesCreateLanguageFromLocaleIdentifier(v2);
  if (LanguageFromLocaleIdentifier)
  {
    uint64_t v5 = LanguageFromLocaleIdentifier;
    if (!CFEqual(LanguageFromLocaleIdentifier, @"zh")) {
      CFArrayAppendValue(Mutable, v5);
    }
    CFRelease(v5);
  }
  CFRelease(v2);
  return Mutable;
}

CFStringRef MAUtilitiesCreateCanonicalLanguageIdentifierFromString(CFStringRef localeIdentifier)
{
  CFStringRef CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, localeIdentifier);
  if (!CanonicalLanguageIdentifierFromString) {
    return 0;
  }
  CFStringRef v2 = CanonicalLanguageIdentifierFromString;
  CFIndex Length = CFStringGetLength(CanonicalLanguageIdentifierFromString);
  CFIndex v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v5 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
  if (CFStringGetCString(v2, v5, v4, 0x8000100u) && (int)uloc_toLanguageTag() >= 1)
  {
    CFRetain(v2);
    CFStringRef v6 = v2;
  }
  else
  {
    CFStringRef v6 = 0;
  }
  free(v5);
  CFRelease(v2);
  return v6;
}

const void *MAXUtilitiesCreateLanguageFromLocaleIdentifier(CFLocaleIdentifier localeID)
{
  CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, localeID);
  if (!ComponentsFromLocaleIdentifier) {
    return 0;
  }
  CFDictionaryRef v2 = ComponentsFromLocaleIdentifier;
  Value = CFDictionaryGetValue(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E4F1D218]);
  CFIndex v4 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v2);
  return v4;
}

const void *MAPreferencesCopyBoolean(__CFString *a1)
{
  CFTypeID TypeID = CFBooleanGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(0, a1, TypeID);
}

CFArrayRef MACaptionAppearancePrefCopyPreferredLanguages()
{
  CFTypeID TypeID = CFArrayGetTypeID();
  CFArrayRef v1 = (const __CFArray *)MAPreferencesCopyProfileValueWithExpectedType(0, @"MACaptionPreferredLanguages", TypeID);
  CFArrayRef v2 = v1;
  if (v1)
  {
    CFIndex Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v2, v5);
        CFTypeID v7 = CFGetTypeID(ValueAtIndex);
        if (v7 != CFStringGetTypeID()) {
          break;
        }
        if (v4 == ++v5) {
          return v2;
        }
      }
      CFRelease(v2);
      return 0;
    }
  }
  return v2;
}

const void *MACaptionAppearancePrefCopyPreferAccessibleCaptions()
{
  return MAPreferencesCopyBoolean(@"MACaptionPreferAccessibleCaptions");
}

CGFloat MACaptionAppearanceGetWindowRoundedCornerRadius(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  CFNumberRef number = 0;
  double valuePtr = 0.0;
  _copyValue((uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowRoundedCornerRadius, 0, domain, &number, behavior);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberCGFloatType, &valuePtr);
    CFRelease(number);
  }
  double RelativeCharacterSizeForLanguage = MACaptionAppearanceGetRelativeCharacterSizeForLanguage(domain, 0, 0);
  if (RelativeCharacterSizeForLanguage <= 0.0) {
    double RelativeCharacterSizeForLanguage = 1.0;
  }
  CGFloat result = valuePtr * RelativeCharacterSizeForLanguage;
  if (result > 10.0) {
    return 10.0;
  }
  return result;
}

CFStringRef MACaptionAppearancePrefCopyProfileName(const __CFString *a1)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef v3 = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, @"MACaptionProfileName", TypeID);
  if (v3)
  {
    if (!MACaptionAppearancePrefIsProfileEditable(a1))
    {
      if (CFStringHasPrefix(v3, @"MALocalize-"))
      {
        Bundle = MAUtiltiesGetBundle();
        if (Bundle)
        {
          CFStringRef v6 = CFBundleCopyLocalizedString(Bundle, v3, 0, @"ProfileNames");
          if (v6)
          {
            CFStringRef v7 = v6;
            CFRelease(v3);
            return v7;
          }
        }
      }
    }
  }
  return v3;
}

void ___copyResultPreferenceXPCCall_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 72);
  CFStringRef v3 = *(const __CFString **)(a1 + 48);
  CFStringRef v4 = *(const __CFString **)(a1 + 56);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(unsigned char *)(v5 + 24) = 0;
  if (v3)
  {
    if (_xpcConnection_onceToken != -1) {
      dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_44);
    }
    CFStringRef v6 = (_xpc_connection_s *)_xpcConnection__XpcConnection;
    buffer[0] = 0;
    CFStringGetCString(v3, buffer, 1024, 0x600u);
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "preferenceName", buffer);
    if (v2)
    {
      xpc_object_t v8 = MAXCreateXPCObjectFromCF(v4);
      if (v8)
      {
        CFLocaleRef v9 = v8;
        xpc_dictionary_set_value(v7, "preferenceValue", v8);
        CFRelease(v9);
      }
      CFStringRef v10 = "set";
    }
    else
    {
      CFStringRef v10 = "get";
    }
    xpc_dictionary_set_string(v7, "getOrSet", v10);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v12, "reqiestTypePreferences", v7);
    xpc_object_t v13 = xpc_connection_send_message_with_reply_sync(v6, v12);
    v14 = v13;
    CFStringRef v11 = 0;
    if (v13 != (xpc_object_t)MEMORY[0x1E4F14528] && v13 != (xpc_object_t)MEMORY[0x1E4F14520])
    {
      if (MEMORY[0x1BA9EF7D0](v13) == MEMORY[0x1E4F14590]
        && (*(unsigned char *)(v5 + 24) = xpc_dictionary_get_BOOL(v14, "success"),
            (xpc_object_t value = xpc_dictionary_get_value(v14, "result")) != 0))
      {
        CFStringRef v11 = MAXCreateCFObjectFromXPC(value);
      }
      else
      {
        CFStringRef v11 = 0;
      }
    }
    xpc_release(v14);
    xpc_release(v12);
    xpc_release(v7);
  }
  else
  {
    CFStringRef v11 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
  v16 = *(const void **)(a1 + 48);
  if (v16) {
    CFRelease(v16);
  }
  v17 = *(const void **)(a1 + 56);
  if (v17) {
    CFRelease(v17);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

NSObject *_copyResultPreferenceXPCCall(const void *a1, char a2, const void *a3)
{
  CFStringRef v6 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_object_t v8 = dispatch_group_create();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2000000000;
  char v19 = 0;
  uint64_t v14 = 0;
  CFStringRef v15 = &v14;
  uint64_t v16 = 0x2000000000;
  uint64_t v17 = 0;
  dispatch_retain(v6);
  CFRetain(a1);
  if (a3) {
    CFRetain(a3);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___copyResultPreferenceXPCCall_block_invoke;
  block[3] = &unk_1E6223BF0;
  char v13 = a2;
  block[6] = a1;
  block[7] = a3;
  block[4] = &v14;
  block[5] = v18;
  block[8] = v6;
  dispatch_group_async(v8, global_queue, block);
  dispatch_time_t v9 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v6, v9))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 0x40000000;
    v11[2] = ___copyResultPreferenceXPCCall_block_invoke_2;
    v11[3] = &unk_1E6223C18;
    v11[4] = &v14;
    dispatch_group_notify(v8, global_queue, v11);
    if (v8) {
      dispatch_release(v8);
    }
    if (v6)
    {
      dispatch_release(v6);
      CFStringRef v6 = 0;
    }
  }
  else
  {
    if (v8) {
      dispatch_release(v8);
    }
    if (v6) {
      dispatch_release(v6);
    }
    CFStringRef v6 = v15[3];
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  return v6;
}

double MACaptionAppearanceGetRelativeCharacterSizeForLanguage(uint64_t a1, void *a2, const __CFString *a3)
{
  CFNumberRef number = 0;
  _copyValue((uint64_t (*)(__CFString *))_copyCharSizeFromPrefsAsNumber, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize, a1, &number, a2);
  if (number)
  {
    uint64_t v11 = 40;
    double v5 = 1.0;
    if (CFNumberGetValue(number, kCFNumberCFIndexType, &v11))
    {
      if (v11 > 49)
      {
        switch(v11)
        {
          case '2':
            double v5 = 1.5;
            break;
          case '<':
            double v5 = 2.0;
            break;
          case 'F':
            double v5 = 2.5;
            break;
        }
      }
      else
      {
        switch(v11)
        {
          case 10:
            double v5 = 0.2;
            break;
          case 20:
            double v5 = 0.35;
            break;
          case 30:
            double v5 = 0.6;
            break;
        }
      }
    }
    CFRelease(number);
  }
  else
  {
    double v5 = 1.0;
  }
  if (a1 == 1)
  {
    CFStringRef v6 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!v6) {
      return v5;
    }
  }
  else
  {
    CFStringRef v6 = @"MACaptionSystemDefaultProfile";
    CFRetain(@"MACaptionSystemDefaultProfile");
  }
  int IsProfileEditable = MACaptionAppearancePrefIsProfileEditable(v6);
  BOOL v9 = v5 < 1.5 && a3 != 0 && IsProfileEditable == 0;
  if (v9 && MAUtilitiesLanguageStringMatchesLanguage(a3, @"ko")) {
    double v5 = 1.5;
  }
  CFRelease(v6);
  return v5;
}

uint64_t MACaptionAppearancePrefIsProfileEditable(const __CFString *a1)
{
  CFTypeID TypeID = CFBooleanGetTypeID();
  CFStringRef v3 = MAPreferencesCopyProfileValueWithExpectedType(a1, @"MAIsEditable", TypeID);
  if (!v3) {
    return 1;
  }
  CFStringRef v4 = v3;
  BOOL v5 = CFEqual((CFTypeRef)*MEMORY[0x1E4F1CFC8], v3) == 0;
  CFRelease(v4);
  return v5;
}

uint64_t MACaptionAppearancePrefGetRelativeCharSize(const __CFString *a1)
{
  CFNumberRef v2 = (const __CFNumber *)MAPreferencesCopyProfileNumber(a1, @"MACaptionCharScaleEnum");
  if (v2)
  {
    CFNumberRef v3 = v2;
    double valuePtr = 0.0;
    if (CFNumberGetValue(v2, kCFNumberCFIndexType, &valuePtr))
    {
      uint64_t v4 = *(void *)&valuePtr;
      if ((unint64_t)(*(void *)&valuePtr - 10) <= 0x3C
        && ((1 << (LOBYTE(valuePtr) - 10)) & 0x1004010040100401) != 0)
      {
        CFNumberRef v6 = v3;
LABEL_19:
        CFRelease(v6);
        return v4;
      }
    }
    CFRelease(v3);
  }
  CFNumberRef v7 = (const __CFNumber *)MAPreferencesCopyProfileNumber(a1, @"MACaptionCharScale");
  if (v7)
  {
    CFNumberRef v8 = v7;
    double valuePtr = 0.0;
    if (CFNumberGetValue(v7, kCFNumberCGFloatType, &valuePtr))
    {
      if (valuePtr < 0.5)
      {
        uint64_t v4 = 20;
LABEL_18:
        CFNumberRef v6 = v8;
        goto LABEL_19;
      }
      if (valuePtr < 0.9)
      {
        uint64_t v4 = 30;
        goto LABEL_18;
      }
      if (valuePtr >= 1.2)
      {
        if (valuePtr >= 1.9)
        {
          if (valuePtr >= 2.1) {
            uint64_t v4 = 40;
          }
          else {
            uint64_t v4 = 60;
          }
        }
        else
        {
          uint64_t v4 = 50;
        }
        goto LABEL_18;
      }
    }
    uint64_t v4 = 40;
    goto LABEL_18;
  }
  return 40;
}

CTFontDescriptorRef MACaptionAppearanceCopyFontDescriptorWithStrokeForStyle(MACaptionAppearanceDomain a1, void *a2, unint64_t a3, const __CFString *a4, double *a5, double a6)
{
  MAPreferenceInitializeIfNeeded();
  if (a1 == kMACaptionAppearanceDomainUser)
  {
    CFStringRef v12 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!a2) {
      goto LABEL_10;
    }
    *a2 = 0;
  }
  else
  {
    CFStringRef v12 = @"MACaptionSystemDefaultProfile";
    CFRetain(@"MACaptionSystemDefaultProfile");
    if (!a2) {
      goto LABEL_10;
    }
    *a2 = 0;
    if (a1 == kMACaptionAppearanceDomainDefault) {
      goto LABEL_10;
    }
  }
  CFBooleanRef v13 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideFontForStyle(v12, a3);
  if (v13)
  {
    CFBooleanRef v14 = v13;
    if (CFBooleanGetValue(v13)) {
      *a2 = 1;
    }
    CFRelease(v14);
  }
LABEL_10:
  CFStringRef v15 = MACaptionAppearancePrefCopyFontDescriptorForStyle(v12, a3);
  CTFontDescriptorWithName = (const __CTFontDescriptor *)v15;
  if (a1 && !v15)
  {
    if (v12) {
      CFRelease(v12);
    }
    CFStringRef v12 = @"MACaptionSystemDefaultProfile";
    CFRetain(@"MACaptionSystemDefaultProfile");
    CTFontDescriptorWithName = (const __CTFontDescriptor *)MACaptionAppearancePrefCopyFontDescriptorForStyle(@"MACaptionSystemDefaultProfile", a3);
  }
  if (a4 && CTFontDescriptorWithName)
  {
    CFStringRef v17 = (const __CFString *)MAUtilitiesCopyFontOverideLanguage(a4);
    if (!v17)
    {
      if (MAUtilitiesFontSupportsLanguage(CTFontDescriptorWithName, a4)) {
        goto LABEL_31;
      }
      CFRelease(CTFontDescriptorWithName);
      CTFontDescriptorWithName = (const __CTFontDescriptor *)CTFontDescriptorCreateForCSSFamily();
      if (CTFontDescriptorWithName) {
        goto LABEL_31;
      }
      goto LABEL_23;
    }
    CFStringRef v18 = v17;
    if (!MAUtilitiesFontSupportsLanguage(CTFontDescriptorWithName, v17))
    {
      CFStringRef PreferredPostScriptNameForLanguage = (const __CFString *)MAUtilitiesCreatePreferredPostScriptNameForLanguage(v18);
      if (PreferredPostScriptNameForLanguage)
      {
        CFStringRef v20 = PreferredPostScriptNameForLanguage;
        CFRelease(CTFontDescriptorWithName);
        CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(v20);
        CFRelease(v20);
      }
    }
    CFRelease(v18);
  }
  if (CTFontDescriptorWithName) {
    goto LABEL_31;
  }
LABEL_23:
  CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(@".AXAppleSystemFont");
  if (!CTFontDescriptorWithName)
  {
    CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(@"Helvetica");
    if (!CTFontDescriptorWithName)
    {
      CFDictionaryRef v21 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CTFontDescriptorRef CopyWithAttributes = v21;
      if (!v21) {
        goto LABEL_44;
      }
      CTFontDescriptorWithName = CTFontDescriptorCreateWithAttributes(v21);
      CFRelease(CopyWithAttributes);
      if (!CTFontDescriptorWithName)
      {
        CTFontDescriptorRef CopyWithAttributes = 0;
        if (!v12) {
          goto LABEL_46;
        }
LABEL_45:
        CFRelease(v12);
        goto LABEL_46;
      }
    }
  }
LABEL_31:
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int valuePtr = 1065353216;
  MACaptionAppearanceTextEdgeStyle TextEdgeStyle = MACaptionAppearanceGetTextEdgeStyle(a1, 0);
  if ((unint64_t)TextEdgeStyle < kMACaptionAppearanceTextEdgeStyleUniform)
  {
    int valuePtr = 0;
    goto LABEL_38;
  }
  if (TextEdgeStyle == kMACaptionAppearanceTextEdgeStyleUniform)
  {
    int v25 = 1077936128;
  }
  else
  {
    if (TextEdgeStyle != kMACaptionAppearanceTextEdgeStyleDropShadow) {
      goto LABEL_38;
    }
    int v25 = 1065353216;
  }
  int valuePtr = v25;
LABEL_38:
  CFNumberRef v26 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  CFDictionarySetValue(Mutable, @"MACaptionFontAttributeStrokeWidth", v26);
  CTFontDescriptorRef CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorWithName, Mutable);
  if (v26) {
    CFRelease(v26);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (CopyWithAttributes)
  {
    CFRelease(CTFontDescriptorWithName);
LABEL_44:
    if (!v12) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  CTFontDescriptorRef CopyWithAttributes = CTFontDescriptorWithName;
  if (v12) {
    goto LABEL_45;
  }
LABEL_46:
  if (a5)
  {
    MACaptionAppearanceTextEdgeStyle v27 = MACaptionAppearanceGetTextEdgeStyle(a1, 0);
    double v28 = 0.0972222222;
    if (v27 != kMACaptionAppearanceTextEdgeStyleUniform) {
      double v28 = 0.0;
    }
    if (v27 == kMACaptionAppearanceTextEdgeStyleDropShadow) {
      double v28 = 0.0277777778;
    }
    if (a6 <= 60.0) {
      double v29 = v28 * a6;
    }
    else {
      double v29 = v28 * 60.0 + (a6 + -60.0) * (v28 * 0.125);
    }
    *a5 = v29;
  }
  return CopyWithAttributes;
}

MACaptionAppearanceTextEdgeStyle MACaptionAppearanceGetTextEdgeStyle(MACaptionAppearanceDomain domain, MACaptionAppearanceBehavior *behavior)
{
  MAPreferenceInitializeIfNeeded();
  if (domain == kMACaptionAppearanceDomainUser)
  {
    CFStringRef v4 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!behavior) {
      goto LABEL_10;
    }
    *behavior = kMACaptionAppearanceBehaviorUseValue;
  }
  else
  {
    CFStringRef v4 = @"MACaptionSystemDefaultProfile";
    CFRetain(@"MACaptionSystemDefaultProfile");
    if (!behavior) {
      goto LABEL_10;
    }
    *behavior = kMACaptionAppearanceBehaviorUseValue;
    if (domain == kMACaptionAppearanceDomainDefault) {
      goto LABEL_10;
    }
  }
  CFBooleanRef v5 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(v4);
  if (v5)
  {
    CFBooleanRef v6 = v5;
    if (CFBooleanGetValue(v5)) {
      *behavior = kMACaptionAppearanceBehaviorUseContentIfAvailable;
    }
    CFRelease(v6);
  }
LABEL_10:
  CFNumberRef v7 = MACaptionAppearancePrefCopyTextEdgeStyle(v4);
  if (!v7)
  {
    MACaptionAppearanceTextEdgeStyle v9 = kMACaptionAppearanceTextEdgeStyleUndefined;
    if (!v4) {
      return v9;
    }
    goto LABEL_15;
  }
  CFNumberRef v8 = v7;
  int valuePtr = 0;
  if (CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr)) {
    MACaptionAppearanceTextEdgeStyle v9 = valuePtr;
  }
  else {
    MACaptionAppearanceTextEdgeStyle v9 = kMACaptionAppearanceTextEdgeStyleUndefined;
  }
  CFRelease(v8);
  if (v4) {
LABEL_15:
  }
    CFRelease(v4);
  return v9;
}

void _copyValue(uint64_t (*a1)(__CFString *), uint64_t (*a2)(__CFString *), uint64_t a3, void *a4, void *a5)
{
  MAPreferenceInitializeIfNeeded();
  if (a3 == 1)
  {
    CFStringRef v10 = (__CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!a5) {
      goto LABEL_11;
    }
  }
  else
  {
    CFStringRef v10 = @"MACaptionSystemDefaultProfile";
    CFRetain(@"MACaptionSystemDefaultProfile");
    if (!a5) {
      goto LABEL_11;
    }
  }
  *a5 = 0;
  if (a2)
  {
    if (a3)
    {
      CFBooleanRef v11 = (const __CFBoolean *)a2(v10);
      if (v11)
      {
        CFBooleanRef v12 = v11;
        if (CFBooleanGetValue(v11)) {
          *a5 = 1;
        }
        CFRelease(v12);
      }
    }
  }
LABEL_11:
  if (a4) {
    *a4 = a1(v10);
  }
  if (v10)
  {
    CFRelease(v10);
  }
}

CFTypeRef MACaptionAppearancePrefCopyActiveProfileID()
{
  CFNumberRef v0 = (const void *)_MACaptionAppearanceTempProfileID;
  if (!_MACaptionAppearanceTempProfileID)
  {
    CFStringRef ValueAtIndex = MAPreferencesCopyString(@"MACaptionActiveProfile");
    int v3 = _AllowNullProfile;
    if (ValueAtIndex || _AllowNullProfile)
    {
LABEL_18:
      if (!ValueAtIndex && !v3)
      {
        MACaptionAppearanceTextEdgeStyle v9 = MAPreferencesCopyProfileIDs(@"MACaptionProfile-");
        if (v9)
        {
          CFArrayRef v10 = v9;
          if (CFArrayGetCount(v9) < 1)
          {
            CFStringRef ValueAtIndex = 0;
          }
          else
          {
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v10, 0);
            CFRetain(ValueAtIndex);
          }
          CFRelease(v10);
        }
        else
        {
          return 0;
        }
      }
      return ValueAtIndex;
    }
    CFArrayRef v4 = MACaptionAppearancePrefCopySystemLanguage();
    if (v4)
    {
      CFArrayRef v5 = v4;
      CFStringRef LowercaseString = MAUtilitiesCreateLowercaseString((CFStringRef)v4);
      if (LowercaseString)
      {
        CFStringRef v7 = LowercaseString;
        if (_languagesUsingAlternateDefaults_onceToken != -1) {
          dispatch_once(&_languagesUsingAlternateDefaults_onceToken, &__block_literal_global_0);
        }
        if (_languagesUsingAlternateDefaults__alternateDefaultLanguages)
        {
          int v8 = CFSetContainsValue((CFSetRef)_languagesUsingAlternateDefaults__alternateDefaultLanguages, v7);
          CFRelease(v7);
          CFRelease(v5);
          if (v8)
          {
            CFStringRef ValueAtIndex = MAPreferencesCopyString(@"MACaptionDefaultAlternateActiveProfile");
            if (ValueAtIndex) {
              return ValueAtIndex;
            }
          }
          goto LABEL_17;
        }
        CFRelease(v7);
      }
      CFRelease(v5);
    }
LABEL_17:
    CFStringRef ValueAtIndex = MAPreferencesCopyString(@"MACaptionDefaultActiveProfile");
    int v3 = _AllowNullProfile;
    goto LABEL_18;
  }

  return CFRetain(v0);
}

const void *MAPreferencesCopyProfileValueWithExpectedType(const __CFString *a1, __CFString *a2, uint64_t a3)
{
  CFArrayRef v4 = MAPreferencesCopyProfileValue(a1, a2);
  CFArrayRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != a3)
    {
      CFTypeID v7 = v6;
      char valuePtr = 0;
      if (CFBooleanGetTypeID() == a3
        && v7 == CFNumberGetTypeID()
        && CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt8Type, &valuePtr))
      {
        CFRelease(v5);
        uint64_t v8 = MEMORY[0x1E4F1CFD0];
        if (!valuePtr) {
          uint64_t v8 = MEMORY[0x1E4F1CFC8];
        }
        return *(const void **)v8;
      }
      else
      {
        CFRelease(v5);
        return 0;
      }
    }
  }
  return v5;
}

void *MAPreferencesCopyProfileValue(CFStringRef theString, __CFString *value)
{
  if (!value) {
    return 0;
  }
  if (theString && CFStringGetLength(theString))
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFDictionaryRef v5 = (const __CFDictionary *)MAPreferencesCopyProfileValueWithExpectedType(0, theString, TypeID);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      CFTypeID v7 = (void *)CFDictionaryGetValue(v5, value);
      uint64_t v8 = v7;
      if (v7) {
        CFRetain(v7);
      }
      CFRelease(v6);
      return v8;
    }
    return 0;
  }
  if (_preferenceAccessRequiresXPC(value))
  {
    MACaptionAppearanceTextEdgeStyle v9 = _copyResultPreferenceXPCCall(value, 0, 0);
  }
  else
  {
    if (_MADomainOverride) {
      CFStringRef v10 = (const __CFString *)_MADomainOverride;
    }
    else {
      CFStringRef v10 = @"com.apple.mediaaccessibility";
    }
    MACaptionAppearanceTextEdgeStyle v9 = (void *)CFPreferencesCopyAppValue(value, v10);
  }
  uint64_t v8 = v9;
  if (!v9)
  {
    CFDictionaryRef v11 = (const __CFDictionary *)_preferencesDefaults();
    if (!v11) {
      return 0;
    }
    CFBooleanRef v12 = (void *)CFDictionaryGetValue(v11, value);
    uint64_t v8 = v12;
    if (v12) {
      CFRetain(v12);
    }
  }
  return v8;
}

uint64_t _preferencesDefaults()
{
  if ((_preferencesDefaults__DidSet & 1) == 0)
  {
    CFNumberRef v0 = MAUtilitiesCopyResourceDictionary(@"Defaults");
    pthread_mutex_lock(&_preferencesDefaults__Lock);
    if (_preferencesDefaults__DidSet)
    {
      pthread_mutex_unlock(&_preferencesDefaults__Lock);
      if (v0) {
        CFRelease(v0);
      }
    }
    else
    {
      _preferencesDefaults__Defaults = (uint64_t)v0;
      _preferencesDefaults__DidSet = 1;
      pthread_mutex_unlock(&_preferencesDefaults__Lock);
    }
  }
  return _preferencesDefaults__Defaults;
}

BOOL _preferenceAccessRequiresXPC(void *value)
{
  CFSetRef v2 = (const __CFSet *)MAPublicWriteableKeys;
  if (!MAPublicWriteableKeys)
  {
    if (MAPreferenceInitializeIfNeeded_onceToken != -1) {
      dispatch_once(&MAPreferenceInitializeIfNeeded_onceToken, &__block_literal_global_1);
    }
    CFSetRef v2 = (const __CFSet *)MAPublicWriteableKeys;
    if (!MAPublicWriteableKeys) {
      return 0;
    }
  }
  return CFSetContainsValue(v2, value) != 0;
}

const void *MAPreferencesCopyString(__CFString *a1)
{
  CFTypeID TypeID = CFStringGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(0, a1, TypeID);
}

CFArrayRef MACaptionAppearancePrefCopySystemLanguage()
{
  CFStringRef Copy = (const __CFString *)_SystemLanguageOverride;
  if (_SystemLanguageOverride) {
    goto LABEL_2;
  }
  Bundle = MAUtiltiesGetBundle();
  if (!Bundle) {
    return 0;
  }
  CFArrayRef v4 = CFBundleCopyBundleLocalizations(Bundle);
  if (!v4) {
    return 0;
  }
  CFSetRef v2 = v4;
  CFArrayRef v5 = CFBundleCopyPreferredLocalizationsFromArray(v4);
  CFArrayRef LowercaseString = v5;
  if (!v5) {
    goto LABEL_3;
  }
  if (CFArrayGetCount(v5) < 1) {
    goto LABEL_14;
  }
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(LowercaseString, 0);
  CFStringRef Copy = ValueAtIndex;
  if (!ValueAtIndex) {
    goto LABEL_15;
  }
  CFTypeID v7 = CFGetTypeID(ValueAtIndex);
  if (v7 == CFStringGetTypeID()
    && (CFStringRef CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, Copy)) != 0)
  {
    CFStringRef v9 = CanonicalLanguageIdentifierFromString;
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, CanonicalLanguageIdentifierFromString);
    if (ComponentsFromLocaleIdentifier)
    {
      CFDictionaryRef v11 = ComponentsFromLocaleIdentifier;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E4F1D218]);
      if (Value) {
        CFStringRef Copy = CFStringCreateCopy(0, Value);
      }
      else {
        CFStringRef Copy = 0;
      }
      CFRelease(v11);
    }
    else
    {
      CFStringRef Copy = 0;
    }
    CFRelease(v9);
  }
  else
  {
LABEL_14:
    CFStringRef Copy = 0;
  }
LABEL_15:
  CFRelease(LowercaseString);
  CFRelease(v2);
  if (!Copy) {
    return 0;
  }
LABEL_2:
  CFArrayRef LowercaseString = (const __CFArray *)MAUtilitiesCreateLowercaseString(Copy);
  CFSetRef v2 = Copy;
LABEL_3:
  CFRelease(v2);
  return LowercaseString;
}

CFStringRef MAUtilitiesCreateLowercaseString(CFStringRef theString)
{
  CFStringRef v1 = theString;
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    MutableCFStringRef Copy = CFStringCreateMutableCopy(0, Length, v1);
    CFStringRef v1 = MutableCopy;
    if (MutableCopy) {
      CFStringLowercase(MutableCopy, 0);
    }
  }
  return v1;
}

CFBundleRef MAUtiltiesGetBundle()
{
  return CFBundleGetBundleWithIdentifier(@"com.apple.MediaAccessibility");
}

void MAPreferenceInitializeIfNeeded()
{
  if (MAPreferenceInitializeIfNeeded_onceToken != -1) {
    dispatch_once(&MAPreferenceInitializeIfNeeded_onceToken, &__block_literal_global_1);
  }
}

CFNumberRef MACaptionAppearancePrefCopyTextEdgeStyle(const __CFString *a1)
{
  CFNumberRef v1 = (const __CFNumber *)MAPreferencesCopyProfileNumber(a1, @"MACaptionTextEdgeStyle");
  if (!v1) {
    return 0;
  }
  CFNumberRef v2 = v1;
  int valuePtr = 0;
  if (CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr))
  {
    int v3 = valuePtr;
    if ((valuePtr - 1) >= 5) {
      int v3 = 0;
    }
    int valuePtr = v3;
    CFNumberRef v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  }
  else
  {
    CFNumberRef v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

const void *MAPreferencesCopyProfileNumber(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
}

const void *MACaptionAppearancePrefCopyVideoOverrideFontForStyle(const __CFString *a1, unint64_t a2)
{
  if (a2 >= 8) {
    return (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFStringRef v3 = off_1E6223B48[a2];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex Length = CFStringGetLength(@"MACaptionVideOverrideFont");
  MutableCFStringRef Copy = CFStringCreateMutableCopy(v4, Length, @"MACaptionVideOverrideFont");
  CFStringAppend(MutableCopy, v3);
  CFTypeID v7 = MAPreferencesCopyProfileBoolean(a1, MutableCopy);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v7;
}

const void *MAPreferencesCopyProfileBoolean(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID = CFBooleanGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
}

CFStringRef MAPreferencesCopyProfileFontDescriptor(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef result = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
  if (result)
  {
    CFStringRef v6 = result;
    CTFontDescriptorWithName = MAUtilitiesCreateCTFontDescriptorWithName(result);
    CFRelease(v6);
    return (const __CFString *)CTFontDescriptorWithName;
  }
  return result;
}

const __CTFontDescriptor *MAUtilitiesCreateCTFontDescriptorWithName(const __CFString *a1)
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 0;
  }
  CFDictionaryRef v3 = Mutable;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F245A8];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F245A8], a1);
  uint64_t SystemFontType = MACaptionAppearancePrefGetSystemFontType(a1);
  if (a1 && CFStringGetLength(a1) > 1)
  {
    UniChar buffer = 0;
    v17.location = 0;
    v17.length = 1;
    CFStringGetCharacters(a1, v17, &buffer);
    int v6 = buffer;
    CTFontDescriptorForuint64_t SystemFontType = _MAUtilitiesCreateCTFontDescriptorForSystemFontType(SystemFontType);
    uint64_t v8 = CTFontDescriptorForSystemFontType;
    if (v6 != 46 || CTFontDescriptorForSystemFontType) {
      goto LABEL_9;
    }
    uint64_t v9 = CTFontDescriptorCreateWithAttributesAndOptions();
  }
  else
  {
    uint64_t v9 = (uint64_t)_MAUtilitiesCreateCTFontDescriptorForSystemFontType(SystemFontType);
  }
  uint64_t v8 = (const __CTFontDescriptor *)v9;
LABEL_9:
  if (!v8)
  {
    uint64_t v8 = CTFontDescriptorCreateWithAttributes(v3);
    if (!v8)
    {
      CFBooleanRef v14 = 0;
LABEL_23:
      CFRelease(v3);
      return v14;
    }
  }
  CFStringRef v10 = CFSetCreateMutable(0, 1, MEMORY[0x1E4F1D548]);
  if (v10)
  {
    CFSetRef v11 = v10;
    CFSetAddValue(v10, v4);
    MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v8, v11);
    CFRelease(v11);
  }
  else
  {
    MatchingFontDescriptor = 0;
  }
  CFRelease(v8);
  CFRelease(v3);
  if (MatchingFontDescriptor)
  {
    CFDictionaryRef v13 = (const __CFDictionary *)CTFontDescriptorCopyAttribute(MatchingFontDescriptor, v4);
    if (v13) {
      CFDictionaryRef v3 = v13;
    }
    else {
      CFDictionaryRef v3 = MatchingFontDescriptor;
    }
    if (v13) {
      CFBooleanRef v14 = MatchingFontDescriptor;
    }
    else {
      CFBooleanRef v14 = 0;
    }
    goto LABEL_23;
  }
  return 0;
}

CTFontDescriptorRef _MAUtilitiesCreateCTFontDescriptorForSystemFontType(uint64_t a1)
{
  if (a1 == -1) {
    return 0;
  }
  uint64_t valuePtr = *MEMORY[0x1E4F246B8];
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFStringRef v4 = (const void *)*MEMORY[0x1E4F24660];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24660], (const void *)*MEMORY[0x1E4F24640]);
  if (a1 == 2)
  {
    CFNumberRef v5 = (CFNumberRef)*MEMORY[0x1E4F24648];
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    CFStringRef v4 = (const void *)*MEMORY[0x1E4F246D8];
    CFNumberRef v5 = v2;
LABEL_7:
    CFDictionarySetValue(Mutable, v4, v5);
  }
  CFTypeID v7 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(v7, (const void *)*MEMORY[0x1E4F24620], Mutable);
  CTFontDescriptorRef v6 = CTFontDescriptorCreateWithAttributes(v7);
  if (v2) {
    CFRelease(v2);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v6;
}

uint64_t MACaptionAppearancePrefGetSystemFontType(const void *a1)
{
  int v2 = CFEqual(a1, @".AXAppleSystemFontMono");
  int v3 = CFEqual(a1, @".AXAppleSystemFontBold");
  int v4 = CFEqual(a1, @".AXAppleSystemFont");
  uint64_t v5 = 2;
  uint64_t v6 = -1;
  if (v3) {
    uint64_t v6 = 1;
  }
  if (!v2) {
    uint64_t v5 = v6;
  }
  if (v4) {
    return 0;
  }
  else {
    return v5;
  }
}

CFStringRef MACaptionAppearancePrefCopyFontDescriptorForStyle(const __CFString *a1, unint64_t a2)
{
  if (a2 > 7) {
    int v2 = 0;
  }
  else {
    int v2 = off_1E6223B48[a2];
  }
  return MAPreferencesCopyProfileFontDescriptor(a1, v2);
}

CGColorRef MAPreferencesCopyProfileColor(const __CFString *a1, __CFString *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef v5 = (const __CFDictionary *)MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
  if (!v5) {
    return 0;
  }
  CFDictionaryRef v6 = v5;
  CFStringRef Value = CFDictionaryGetValue(v5, @"Red");
  uint64_t v8 = CFDictionaryGetValue(v6, @"Green");
  uint64_t v9 = CFDictionaryGetValue(v6, @"Blue");
  CFStringRef v10 = CFDictionaryGetValue(v6, @"Alpha");
  CFTypeID v11 = CFNumberGetTypeID();
  CGColorRef v12 = 0;
  if (Value && v8 && v9 && v10)
  {
    CFTypeID v13 = v11;
    if (CFGetTypeID(Value) == v11
      && CFGetTypeID(v8) == v13
      && CFGetTypeID(v9) == v13
      && CFGetTypeID(v10) == v13
      && CFNumberGetValue((CFNumberRef)Value, kCFNumberFloatType, &v17)
      && CFNumberGetValue((CFNumberRef)v8, kCFNumberFloatType, (char *)&v17 + 4)
      && CFNumberGetValue((CFNumberRef)v9, kCFNumberFloatType, &v18)
      && CFNumberGetValue((CFNumberRef)v10, kCFNumberFloatType, (char *)&v18 + 4)
      && (*(float64x2_t *)components = vcvtq_f64_f32(v17),
          float64x2_t v20 = vcvtq_f64_f32(v18),
          (DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0))
    {
      CFStringRef v15 = DeviceRGB;
      CGColorRef v12 = CGColorCreate(DeviceRGB, components);
      CFRelease(v15);
    }
    else
    {
      CGColorRef v12 = 0;
    }
  }
  CFRelease(v6);
  return v12;
}

CFNumberRef _copyCharSizeFromPrefsAsNumber(const __CFString *a1)
{
  uint64_t valuePtr = MACaptionAppearancePrefGetRelativeCharSize(a1);
  return CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
}

const void *MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideCharScale");
}

const void *MACaptionAppearancePrefCopyVideoOverrideBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideBackgroundColor");
}

const void *MACaptionAppearancePrefCopyWindowRoundedCornerRadius(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionWindowRoundedCorners");
}

const void *MACaptionAppearancePrefCopyWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionWindowOpacity");
}

CGColorRef MACaptionAppearancePrefCopyWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, @"MACaptionWindowColor");
}

const void *MACaptionAppearancePrefCopyVideoOverrideWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideWindowOpacity");
}

const void *MACaptionAppearancePrefCopyVideoOverrideWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideWindowColor");
}

const void *MACaptionAppearancePrefCopyVideoOverrideForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideForegroundColor");
}

const void *MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideBackgroundOpacity");
}

CGColorRef MACaptionAppearancePrefCopyForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, @"MACaptionForegroundColor");
}

const void *MACaptionAppearancePrefCopyBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionBackgroundOpacity");
}

CGColorRef MACaptionAppearancePrefCopyBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, @"MACaptionBackgroundColor");
}

const void *MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideForegroundOpacity");
}

const void *MACaptionAppearancePrefCopyForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionForegroundOpacity");
}

const void *MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideTextEdgeStyle");
}

const void *MAUtilitiesCopyResourceDictionary(const __CFString *a1)
{
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.MediaAccessibility");
  if (!BundleWithIdentifier) {
    return 0;
  }
  CFURLRef v3 = CFBundleCopyResourceURL(BundleWithIdentifier, a1, @"plist", 0);
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = v3;
  CFNumberRef propertyValueTypeRefPtr = 0;
  CFDictionaryRef v5 = 0;
  if (CFURLCopyResourcePropertyForKey(v3, (CFStringRef)*MEMORY[0x1E4F1D640], &propertyValueTypeRefPtr, 0)) {
    BOOL v6 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    CFIndex valuePtr = 0;
    if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberCFIndexType, &valuePtr))
    {
      Mutable = CFDataCreateMutable(0, valuePtr);
      CFDataSetLength(Mutable, valuePtr);
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      uint64_t v9 = CFReadStreamCreateWithFile(0, v4);
      if (v9)
      {
        CFStringRef v10 = v9;
        if (CFReadStreamOpen(v9) && valuePtr >= 1)
        {
          CFTypeID v11 = &MutableBytePtr[valuePtr];
          while (1)
          {
            CFIndex v12 = CFReadStreamRead(v10, MutableBytePtr, (v11 - MutableBytePtr));
            if ((unint64_t)(v12 + 1) < 2) {
              break;
            }
            MutableBytePtr += v12;
            if (MutableBytePtr >= v11)
            {
              CFErrorRef error = 0;
              CFPropertyListRef v13 = CFPropertyListCreateWithData(0, Mutable, 0, 0, &error);
              CFDictionaryRef v5 = v13;
              if (v13)
              {
                CFTypeID v14 = CFGetTypeID(v13);
                if (v14 != CFDictionaryGetTypeID())
                {
                  CFRelease(v5);
                  break;
                }
              }
              goto LABEL_18;
            }
          }
        }
        CFDictionaryRef v5 = 0;
LABEL_18:
        CFReadStreamClose(v10);
        CFRelease(v10);
      }
      else
      {
        CFDictionaryRef v5 = 0;
      }
      CFRelease(Mutable);
    }
    else
    {
      CFDictionaryRef v5 = 0;
    }
    CFRelease(propertyValueTypeRefPtr);
  }
  CFRelease(v4);
  return v5;
}

void ___languagesUsingAlternateDefaults_block_invoke()
{
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
  CFSetAddValue(Mutable, @"ja");
  _languagesUsingAlternateDefaults__alternateDefaultLanguages = (uint64_t)Mutable;
}

CFStringRef MAXCreateCFObjectFromXPC(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = MEMORY[0x1BA9EF7D0]();
  if (v2 == MEMORY[0x1E4F145C0])
  {
    valuePtr[0] = xpc_int64_get_value(a1);
    return (CFStringRef)CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
  }
  if (v2 == MEMORY[0x1E4F145F0])
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return CFStringCreateWithCString(0, string_ptr, 0x8000100u);
  }
  else
  {
    if (v2 == MEMORY[0x1E4F14568])
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      size_t count = xpc_array_get_count(a1);
      if (count)
      {
        size_t v7 = count;
        for (size_t i = 0; i != v7; ++i)
        {
          xpc_object_t value = xpc_array_get_value(a1, i);
          CFStringRef v10 = (const void *)MAXCreateCFObjectFromXPC(value);
          if (v10)
          {
            CFTypeID v11 = v10;
            CFArrayAppendValue(Mutable, v10);
            CFRelease(v11);
          }
        }
      }
      return (CFStringRef)Mutable;
    }
    if (v2 == MEMORY[0x1E4F14590])
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      valuePtr[0] = MEMORY[0x1E4F143A8];
      valuePtr[1] = 0x40000000;
      valuePtr[2] = ___createCFDictionaryFromXPCDictionary_block_invoke;
      valuePtr[3] = &__block_descriptor_tmp;
      valuePtr[4] = Mutable;
      xpc_dictionary_apply(a1, valuePtr);
      return (CFStringRef)Mutable;
    }
    if (v2 != MEMORY[0x1E4F14570]) {
      return 0;
    }
    BOOL v12 = xpc_BOOL_get_value(a1);
    CFPropertyListRef v13 = (const void **)MEMORY[0x1E4F1CFD0];
    if (!v12) {
      CFPropertyListRef v13 = (const void **)MEMORY[0x1E4F1CFC8];
    }
    CFTypeID v14 = *v13;
    return (CFStringRef)CFRetain(v14);
  }
}

xpc_object_t MAXCreateXPCObjectFromCF(const __CFString *a1)
{
  valuePtr[256] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFNumberGetTypeID())
  {
    valuePtr[0] = 0;
    CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, valuePtr);
    return xpc_int64_create(valuePtr[0]);
  }
  if (v2 == CFStringGetTypeID())
  {
    LOBYTE(valuePtr[0]) = 0;
    CFStringGetCString(a1, (char *)valuePtr, 2048, 0x8000100u);
    return xpc_string_create((const char *)valuePtr);
  }
  if (v2 == CFArrayGetTypeID())
  {
    xpc_object_t v4 = xpc_array_create(0, 0);
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
        uint64_t v9 = (void *)MAXCreateXPCObjectFromCF(ValueAtIndex);
        if (v9)
        {
          CFStringRef v10 = v9;
          xpc_array_append_value(v4, v9);
          CFRelease(v10);
        }
      }
    }
    return v4;
  }
  if (v2 != CFDictionaryGetTypeID()) {
    return 0;
  }

  return _createXPCObjectFromCFDictionary((const __CFDictionary *)a1);
}

xpc_object_t _createXPCObjectFromCFDictionary(const __CFDictionary *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int64_t Count = CFDictionaryGetCount(a1);
  xpc_object_t v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  CFDictionaryRef v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1, v4, v5);
  if (Count >= 1)
  {
    do
    {
      CFStringRef v6 = (const __CFString *)*v4;
      if (*v4)
      {
        CFTypeID v7 = CFGetTypeID(*v4);
        if (v7 == CFStringGetTypeID())
        {
          buffer[0] = 0;
          if (CFStringGetCString(v6, buffer, 2048, 0x8000100u))
          {
            uint64_t v8 = (void *)MAXCreateXPCObjectFromCF(*v5);
            if (v8)
            {
              uint64_t v9 = v8;
              xpc_dictionary_set_value(v2, buffer, v8);
              CFRelease(v9);
            }
          }
        }
      }
      --Count;
    }
    while (Count);
  }
  free(v4);
  free(v5);
  return v2;
}

uint64_t ___createCFDictionaryFromXPCDictionary_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x8000100u);
      if (v5)
      {
        CFStringRef v6 = v5;
        CFTypeID v7 = (const void *)MAXCreateCFObjectFromXPC(a3);
        if (v7)
        {
          uint64_t v8 = v7;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v6, v7);
          CFRelease(v8);
        }
        CFRelease(v6);
      }
    }
  }
  return 1;
}

uint64_t MAImageCaptioningSetCaptionIntoMetadata(void *a1, __CFString *a2, CFErrorRef *a3)
{
  userInfoKeys = (void *)*MEMORY[0x1E4F1D140];
  if (!a1 || (CFTypeID v6 = CFGetTypeID(a1), v6 != CGImageMetadataGetTypeID()))
  {
    if (a3)
    {
      userInfoValues = @"Invalid metadata";
      CFErrorRef v14 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
      uint64_t result = 0;
      *a3 = v14;
      return result;
    }
    return 0;
  }
  if (!a2) {
    a2 = &stru_1F1425700;
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F2F488];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F2F498];
  CGImageMetadataRegisterNamespaceForPrefix((CGMutableImageMetadataRef)a1, (CFStringRef)*MEMORY[0x1E4F2F488], (CFStringRef)*MEMORY[0x1E4F2F498], 0);
  uint64_t v9 = *MEMORY[0x1E4F2FB98];
  CGImageMetadataTagRef v10 = CGImageMetadataTagCreate(v7, v8, (CFStringRef)*MEMORY[0x1E4F2FB98], kCGImageMetadataTypeString, a2);
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@:%@", v8, v9);
  if (!CGImageMetadataSetTagWithPath((CGMutableImageMetadataRef)a1, 0, v12, v10))
  {
    if (a3)
    {
      userInfoValues = @"Error setting metadata";
      *a3 = CFErrorCreateWithUserInfoKeysAndValues(v11, @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    }
    if (v10) {
      CFRelease(v10);
    }
    if (v12) {
      CFRelease(v12);
    }
    return 0;
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v10) {
    CFRelease(v10);
  }
  return 1;
}

CFStringRef MAImageCaptioningCopyMetadataTagPath(void)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@:%@", *MEMORY[0x1E4F2F498], *MEMORY[0x1E4F2FB98]);
}

const CGImageMetadata *MAImageCaptioningCopyCaptionWithSource(CGImageSource *a1, CFErrorRef *a2)
{
  userInfoKeys = (void *)*MEMORY[0x1E4F1D140];
  if (a1)
  {
    xpc_object_t v2 = CGImageSourceCopyMetadataAtIndex(a1, 0, 0);
    if (v2)
    {
      userInfoValues = 0;
      p_userInfoValues = &userInfoValues;
      uint64_t v13 = 0x2000000000;
      uint64_t v14 = 0;
      CFStringRef v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@:%@", *MEMORY[0x1E4F2F498], *MEMORY[0x1E4F2FB98]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = __MAImageCaptioningCopyCaptionWithSource_block_invoke;
      block[3] = &unk_1E6223820;
      block[4] = &userInfoValues;
      block[5] = v3;
      CGImageMetadataEnumerateTagsUsingBlock(v2, 0, 0, block);
      CFRelease(v2);
      if (v3) {
        CFRelease(v3);
      }
      xpc_object_t v4 = (CGImageMetadataTag *)p_userInfoValues[3];
      if (!v4)
      {
        xpc_object_t v2 = 0;
        goto LABEL_15;
      }
      if (CGImageMetadataTagGetType(v4) == kCGImageMetadataTypeString)
      {
        CFStringRef v5 = (const __CFString *)CGImageMetadataTagCopyValue((CGImageMetadataTagRef)p_userInfoValues[3]);
        xpc_object_t v2 = (const CGImageMetadata *)v5;
        if (!v5 || CFStringGetLength(v5)) {
          goto LABEL_11;
        }
        CFRelease(v2);
      }
      xpc_object_t v2 = 0;
LABEL_11:
      CFRelease(p_userInfoValues[3]);
LABEL_15:
      _Block_object_dispose(&userInfoValues, 8);
    }
  }
  else if (a2)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    userInfoValues = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Invalid image source");
    CFErrorRef v8 = CFErrorCreateWithUserInfoKeysAndValues(v7, @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    xpc_object_t v2 = 0;
    *a2 = v8;
  }
  else
  {
    return 0;
  }
  return v2;
}

BOOL __MAImageCaptioningCopyCaptionWithSource_block_invoke(uint64_t a1, CFTypeRef cf1, uint64_t a3)
{
  int v5 = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if (v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  return v5 == 0;
}

CFStringRef MAImageCaptioningCopyCaption(CFURLRef url, CFErrorRef *error)
{
  userInfoKeys = (void *)*MEMORY[0x1E4F1D140];
  if (url)
  {
    xpc_object_t v4 = CGImageSourceCreateWithURL(url, 0);
    if (v4)
    {
      int v5 = v4;
      CFTypeID v6 = MAImageCaptioningCopyCaptionWithSource(v4, error);
      CFRelease(v5);
      return (CFStringRef)v6;
    }
    if (error)
    {
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      userInfoValues = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Invalid url: %@", url);
      CFAllocatorRef v8 = v9;
      goto LABEL_8;
    }
  }
  else if (error)
  {
    userInfoValues = @"Missing url";
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
LABEL_8:
    *CFErrorRef error = CFErrorCreateWithUserInfoKeysAndValues(v8, @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
  }
  return 0;
}

BOOL MAImageCaptioningSetCaption(CFURLRef url, CFStringRef string, CFErrorRef *error)
{
  userInfoKeys = (void *)*MEMORY[0x1E4F1D140];
  if (!url)
  {
    if (error)
    {
      uint64_t v16 = @"Missing url";
      LOBYTE(Mutable) = 0;
      *CFErrorRef error = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&v16, 1);
      return (char)Mutable;
    }
LABEL_22:
    LOBYTE(Mutable) = 0;
    return (char)Mutable;
  }
  CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
  if ((MAImageCaptioningSetCaptionIntoMetadata(Mutable, (__CFString *)string, error) & 1) == 0) {
    goto LABEL_14;
  }
  CFAllocatorRef v7 = CGImageSourceCreateWithURL(url, 0);
  if (!v7)
  {
    if (error)
    {
      uint64_t v16 = @"Could not create image source";
      *CFErrorRef error = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&v16, 1);
    }
LABEL_14:
    if (!Mutable) {
      return (char)Mutable;
    }
    CGMutableImageMetadataRef v14 = Mutable;
    goto LABEL_21;
  }
  CFAllocatorRef v8 = v7;
  CFStringRef Type = CGImageSourceGetType(v7);
  size_t Count = CGImageSourceGetCount(v8);
  CGImageDestinationRef v11 = CGImageDestinationCreateWithURL(url, Type, Count, 0);
  if (!v11)
  {
    if (error)
    {
      uint64_t v16 = @"Could not create image destination";
      *CFErrorRef error = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.media.accessibility", 0, (const void *const *)&userInfoKeys, (const void *const *)&v16, 1);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    CGMutableImageMetadataRef v14 = v8;
LABEL_21:
    CFRelease(v14);
    goto LABEL_22;
  }
  CFStringRef v12 = v11;
  uint64_t v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(v13, (const void *)*MEMORY[0x1E4F2F440], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFDictionaryAddValue(v13, (const void *)*MEMORY[0x1E4F2F448], Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  LOBYTE(Mutable) = CGImageDestinationCopyImageSource(v12, v8, v13, error);
  if (v13) {
    CFRelease(v13);
  }
  CFRelease(v12);
  CFRelease(v8);
  return (char)Mutable;
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL MACaptionAppearanceAddSelectedLanguage(MACaptionAppearanceDomain domain, CFStringRef language)
{
  MAPreferenceInitializeIfNeeded();
  CFArrayRef OrderedCanonicalLanguageIdentifiersFromString = MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(language);
  if (OrderedCanonicalLanguageIdentifiersFromString)
  {
    CFArrayRef v4 = MACaptionAppearancePrefCopyPreferredLanguages();
    if (v4)
    {
      CFArrayRef v5 = v4;
      uint64_t Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v8.length = Count;
        v8.location = 0;
        CFArrayAppendArray(OrderedCanonicalLanguageIdentifiersFromString, v5, v8);
      }
      if (CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString) >= 1) {
        MACaptionAppearancePrefSetPreferredLanguages(OrderedCanonicalLanguageIdentifiersFromString);
      }
      CFRelease(v5);
    }
    else if (CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString) >= 1)
    {
      MACaptionAppearancePrefSetPreferredLanguages(OrderedCanonicalLanguageIdentifiersFromString);
    }
    CFRelease(OrderedCanonicalLanguageIdentifiersFromString);
  }
  return OrderedCanonicalLanguageIdentifiersFromString != 0;
}

void MACaptionAppearanceSetDisplayType(MACaptionAppearanceDomain domain, MACaptionAppearanceDisplayType displayType)
{
  int valuePtr = displayType;
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    MACaptionAppearancePrefSetDisplayType(v2);
    CFRelease(v3);
  }
}

CFArrayRef MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(MACaptionAppearanceDomain domain)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  MAPreferenceInitializeIfNeeded();
  CFBooleanRef v1 = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
  if (!v1) {
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  CFBooleanRef v2 = v1;
  if (!CFBooleanGetValue(v1))
  {
    CFRelease(v2);
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  long long v5 = xmmword_1E62238D0;
  CFArrayRef v3 = CFArrayCreate(0, (const void **)&v5, 2, MEMORY[0x1E4F1D510]);
  CFRelease(v2);
  if (!v3) {
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  return v3;
}

BOOL MACaptionAppearanceIsCustomized(uint64_t a1)
{
  if (a1 != 1) {
    return 0;
  }
  CFStringRef v1 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  BOOL v2 = MACaptionAppearancePrefIsProfileEditable(v1) != 0;
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

CGColorRef MACaptionAppearanceCopyStrokeColor()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v3[0] = xmmword_1BA6E0768;
  v3[1] = unk_1BA6E0778;
  CGColorRef v1 = CGColorCreate(DeviceRGB, (const CGFloat *)v3);
  if (DeviceRGB) {
    CFRelease(DeviceRGB);
  }
  return v1;
}

CTFontDescriptorRef MACaptionAppearanceCopyFontDescriptorForLanguage(MACaptionAppearanceDomain a1, void *a2, unint64_t a3, const __CFString *a4)
{
  return MACaptionAppearanceCopyFontDescriptorWithStrokeForStyle(a1, a2, a3, a4, 0, 12.0);
}

MACaptionAppearanceTextEdgeStyle MACaptionAppearanceGetStrokeWidth(MACaptionAppearanceDomain a1)
{
  return MACaptionAppearanceGetTextEdgeStyle(a1, 0);
}

void *MACaptionAppearanceSetDidDisplayCaptionsCallback(void *result)
{
  _DidDisplayCaptionsCallback = result;
  return result;
}

void MACaptionAppearanceDidDisplayCaptions(CFArrayRef strings)
{
  if (strings)
  {
    CFTypeID v2 = CFGetTypeID(strings);
    if (v2 == CFArrayGetTypeID())
    {
      uint64_t Count = CFArrayGetCount(strings);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
      if (Mutable)
      {
        long long v5 = Mutable;
        CFTypeID TypeID = CFAttributedStringGetTypeID();
        CFTypeID v7 = CFStringGetTypeID();
        if (Count >= 1)
        {
          CFTypeID v8 = v7;
          for (CFIndex i = 0; i != Count; ++i)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(strings, i);
            CFTypeID v11 = CFGetTypeID(ValueAtIndex);
            if (v11 == TypeID)
            {
              CFArrayAppendValue(v5, ValueAtIndex);
            }
            else if (v11 == v8)
            {
              CFAttributedStringRef v12 = CFAttributedStringCreate(0, ValueAtIndex, 0);
              if (v12)
              {
                CFAttributedStringRef v13 = v12;
                CFArrayAppendValue(v5, v12);
                CFRelease(v13);
              }
            }
          }
        }
        if (CFArrayGetCount(v5) >= 1 && _DidDisplayCaptionsCallback) {
          _DidDisplayCaptionsCallback(strings);
        }
        CFRelease(v5);
      }
    }
  }
}

const void *MAAudibleMediaPrefCopyPreferDescriptiveVideo()
{
  return MAPreferencesCopyBoolean(@"MAAudibleMediaPrefPreferDescriptiveVideo");
}

void MAAudibleMediaPrefSetPreferDescriptiveVideo(const void *a1)
{
  CFTypeID v2 = MAPreferencesCopyBoolean(@"MAAudibleMediaPrefPreferDescriptiveVideo");
  MAPreferencesSetValue(@"MAAudibleMediaPrefPreferDescriptiveVideo", a1);
  MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v2, (unint64_t)a1, @"com.apple.mediaaccessibility.audibleMediaSettingsChanged");
  if (v2)
  {
    CFRelease(v2);
  }
}

void MAAudibleMediaPrefResetAll()
{
}

CFArrayRef MAAudibleMediaCopyPreferredCharacteristics(void)
{
  v4[1] = *(const void **)MEMORY[0x1E4F143B8];
  MAPreferenceInitializeIfNeeded();
  CFBooleanRef v0 = (const __CFBoolean *)MAAudibleMediaPrefCopyPreferDescriptiveVideo();
  if (!v0) {
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  CFBooleanRef v1 = v0;
  if (!CFBooleanGetValue(v0))
  {
    CFRelease(v1);
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  v4[0] = @"public.accessibility.describes-video";
  CFArrayRef v2 = CFArrayCreate(0, v4, 1, MEMORY[0x1E4F1D510]);
  CFRelease(v1);
  if (!v2) {
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  return v2;
}

id getAXSettingsClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  CFBooleanRef v0 = (void *)getAXSettingsClass_softClass;
  uint64_t v7 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getAXSettingsClass_block_invoke;
    v3[3] = &unk_1E6223850;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke((uint64_t)v3);
    CFBooleanRef v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1BA6D4DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXSHapticMusicEnabled()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  CFBooleanRef v0 = (uint64_t (*)(void))get_AXSHapticMusicEnabledSymbolLoc_ptr;
  uint64_t v6 = get_AXSHapticMusicEnabledSymbolLoc_ptr;
  if (!get_AXSHapticMusicEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __get_AXSHapticMusicEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_1E6223850;
    v2[4] = &v3;
    __get_AXSHapticMusicEnabledSymbolLoc_block_invoke((uint64_t)v2);
    CFBooleanRef v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXSHapticMusicEnabled_cold_1();
  }
  return v0();
}

void sub_1BA6D4F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA6D5228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HMLog()
{
  if (HMLog_onceToken != -1) {
    dispatch_once(&HMLog_onceToken, &__block_literal_global_489);
  }
  CFBooleanRef v0 = (void *)HMLog__HMLog;

  return v0;
}

id getAXAccessQueueClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  CFBooleanRef v0 = (void *)getAXAccessQueueClass_softClass;
  uint64_t v7 = getAXAccessQueueClass_softClass;
  if (!getAXAccessQueueClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    _OWORD v3[2] = __getAXAccessQueueClass_block_invoke;
    v3[3] = &unk_1E6223850;
    v3[4] = &v4;
    __getAXAccessQueueClass_block_invoke((uint64_t)v3);
    CFBooleanRef v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1BA6D55CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6223A40;
    uint64_t v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary) {
    __getAXSettingsClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXSettingsClass_block_invoke_cold_2();
  }
  getAXSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BA6D6C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6223A90;
    uint64_t v5 = 0;
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUILibraryCore_frameworkLibrary) {
    __getAXUIClientClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXUIClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXUIClientClass_block_invoke_cold_2();
  }
  getAXUIClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __HMLog_block_invoke()
{
  HMLog__HMLog = (uint64_t)os_log_create("com.apple.Accessibility", "AXHapticMusic");

  return MEMORY[0x1F41817F8]();
}

Class __getAXAccessQueueClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AXCoreUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v3[2] = (void *)3221225472;
    v3[3] = __AXCoreUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6223AA8;
    uint64_t v5 = 0;
    AXCoreUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AXCoreUtilitiesLibraryCore_frameworkLibrary) {
    __getAXAccessQueueClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXAccessQueue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXAccessQueueClass_block_invoke_cold_2();
  }
  getAXAccessQueueClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXCoreUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXCoreUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void MALegibleOutputDidOutputAttributedStrings(CFArrayRef theArray, uint64_t a2, CFDictionaryRef a3)
{
  if (!_Callback) {
    return;
  }
  CFArrayRef v5 = theArray;
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1) {
      goto LABEL_11;
    }
    CFIndex v7 = Count;
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
    CFTypeID v9 = CFGetTypeID(ValueAtIndex);
    if (v9 == CFAttributedStringGetTypeID())
    {
      CFIndex v10 = 1;
      while (v7 != v10)
      {
        CFTypeID v11 = CFArrayGetValueAtIndex(v5, v10);
        CFTypeID v12 = CFGetTypeID(v11);
        ++v10;
        if (v12 != CFAttributedStringGetTypeID())
        {
          if (v10 - 1 >= v7) {
            break;
          }
          goto LABEL_9;
        }
      }
LABEL_11:
      CFArrayRef v13 = 0;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }
LABEL_9:
  CFArrayRef v13 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  CFArrayRef v5 = v13;
  if (!a3)
  {
LABEL_12:
    a3 = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryRef v14 = a3;
    goto LABEL_13;
  }
LABEL_10:
  CFDictionaryRef v14 = 0;
LABEL_13:
  _Callback(v5, a2, a3);
  if (v13) {
    CFRelease(v13);
  }
  if (v14)
  {
    CFRelease(v14);
  }
}

void *MALegibleOutputDidOutputAttributedStringsRegisterCallback(void *result)
{
  _Callback = result;
  return result;
}

__CFArray *MADisplayFilterPrefCopyCategoriesForCurrentPlatform()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t valuePtr = 1;
  CFNumberRef v1 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    CFArrayAppendValue(Mutable, v1);
    CFRelease(v2);
  }
  uint64_t valuePtr = 2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFArrayAppendValue(Mutable, v3);
    CFRelease(v4);
  }
  uint64_t valuePtr = 3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFArrayAppendValue(Mutable, v5);
    CFRelease(v6);
  }
  uint64_t valuePtr = 4;
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v7)
  {
    CFNumberRef v8 = v7;
    CFArrayAppendValue(Mutable, v7);
    CFRelease(v8);
  }
  uint64_t valuePtr = 5;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v9)
  {
    CFNumberRef v10 = v9;
    CFArrayAppendValue(Mutable, v9);
    CFRelease(v10);
  }
  return Mutable;
}

uint64_t MADisplayFilterPrefPossibleTypesForCategory(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1BA6E0830[a1 - 1];
  }
}

uint64_t MADisplayFilterPrefSuspendNotifications(uint64_t result)
{
  _NotificationsSuspended = result;
  return result;
}

uint64_t MADisplayFilterPrefGetType(uint64_t a1)
{
  uint64_t valuePtr = 0;
  CFNumberRef v2 = _copyPrefFilterType(a1);
  if (v2)
  {
    CFNumberRef v3 = (const __CFNumber *)v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFNumberGetTypeID()) {
      CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
    }
    CFRelease(v3);
    uint64_t v5 = valuePtr;
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v6 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_1BA6E0830[v6];
  }
  uint64_t v8 = 0;
  uint64_t result = v7 & v5;
  do
  {
    if (((1 << v8) & (unint64_t)~result) == 0) {
      return 1 << v8;
    }
    ++v8;
  }
  while (v8 != 64);
  if (!result)
  {
    if (v6 > 4) {
      return 0;
    }
    else {
      return qword_1BA6E0858[v6];
    }
  }
  return result;
}

__CFString *_copyPrefFilterType(uint64_t a1)
{
  uint64_t result = (__CFString *)_createPrefCategoryKey(a1, @"MADisplayFilterType");
  if (result)
  {
    CFNumberRef v2 = result;
    CFNumberRef v3 = MAPreferencesCopyNumber(result);
    CFRelease(v2);
    return (__CFString *)v3;
  }
  return result;
}

void MADisplayFilterPrefSetType(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  CFStringRef PrefCategoryKey = _createPrefCategoryKey(a1, @"MADisplayFilterType");
  if (PrefCategoryKey)
  {
    CFStringRef v4 = PrefCategoryKey;
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      uint64_t v7 = _copyPrefFilterType(a1);
      _setPreferenceValueWithOldValue(v4, v6, (unint64_t)v7, 1);
      if (v7) {
        CFRelease(v7);
      }
      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

CFStringRef _createPrefCategoryKey(uint64_t a1, CFTypeRef cf)
{
  if ((unint64_t)(a1 - 1) <= 4) {
    return CFStringCreateWithFormat(0, 0, @"%@.%@", off_1E6223AC8[a1 - 1], cf, v2, v3);
  }
  return (CFStringRef)CFRetain(cf);
}

void _setPreferenceValueWithOldValue(const void *a1, void *a2, unint64_t a3, int a4)
{
  uint64_t v7 = (__CFString *)CFRetain(a1);
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  CFTypeID v9 = CFGetTypeID(a2);
  if (v9 == CGColorGetTypeID())
  {
    MAPreferencesSetColor(v8, (CGColor *)a2);
    if (!a4) {
      goto LABEL_9;
    }
LABEL_7:
    if (!_NotificationsSuspended) {
      MAPreferencesPostChangeNotificationIfNeeded(a3, (unint64_t)a2, @"com.apple.mediaaccessibility.displayFilterSettingsChanged");
    }
    goto LABEL_9;
  }
  MAPreferencesSetValue(v8, a2);
  if (a4) {
    goto LABEL_7;
  }
LABEL_9:

  CFRelease(v8);
}

void MADisplayFilterPrefSetCategoryEnabled(uint64_t a1, int a2)
{
  CFStringRef PrefCategoryKey = _createPrefCategoryKey(a1, @"MADisplayFilterCategoryEnabled");
  if (PrefCategoryKey)
  {
    CFStringRef v5 = PrefCategoryKey;
    BOOL valuePtr = a2 != 0;
    CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      uint64_t v8 = _copyPrefCategoryEnabled(a1);
      _setPreferenceValueWithOldValue(v5, v7, (unint64_t)v8, 1);
      if (v8) {
        CFRelease(v8);
      }
      CFRelease(v7);
    }
    CFRelease(v5);
  }
}

__CFString *_copyPrefCategoryEnabled(uint64_t a1)
{
  uint64_t result = (__CFString *)_createPrefCategoryKey(a1, @"MADisplayFilterCategoryEnabled");
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = MAPreferencesCopyNumber(result);
    CFRelease(v2);
    return (__CFString *)v3;
  }
  return result;
}

BOOL MADisplayFilterPrefGetCategoryEnabled(uint64_t a1)
{
  CFNumberRef v1 = _copyPrefCategoryEnabled(a1);
  if (!v1) {
    return 0;
  }
  CFNumberRef v2 = (const __CFNumber *)v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFNumberGetTypeID())
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberSInt64Type, &valuePtr);
    BOOL v4 = valuePtr != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

void MADisplayFilterPrefGetRedColorCorrectionIntensity()
{
}

void _getIntensity(uint64_t (*a1)(void), double a2, double a3)
{
  double v3 = a3;
  double valuePtr = a3;
  CFNumberRef v5 = (const __CFNumber *)a1();
  CFNumberRef v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberCGFloatType, &valuePtr);
      double v3 = valuePtr;
    }
  }
  if (v3 <= 1.0) {
    double v8 = v3;
  }
  else {
    double v8 = 1.0;
  }
  if (v8 >= a2) {
    double v9 = v8;
  }
  else {
    double v9 = a2;
  }
  if (v3 > 1.0 || v8 < a2) {
    double valuePtr = v9;
  }
  if (v6) {
    CFRelease(v6);
  }
}

__CFString *_copyPrefRedColorCorrectionIntensity()
{
  uint64_t result = (__CFString *)CFRetain(@"MADisplayFilterRedColorCorrectionIntensity");
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberRef v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetRedColorCorrectionIntensity(double a1)
{
}

void _setIntensity(const void *a1, uint64_t (*a2)(void), double a3)
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    if (a2)
    {
      CFTypeID v7 = (const void *)a2();
      _setPreferenceValueWithOldValue(a1, v6, (unint64_t)v7, 1);
      if (v7) {
        CFRelease(v7);
      }
    }
    else
    {
      _setPreferenceValueWithOldValue(a1, v5, 0, 0);
    }
    CFRelease(v6);
  }
}

void MADisplayFilterPrefGetGreenColorCorrectionIntensity()
{
}

__CFString *_copyPrefGreenColorCorrectionIntensity()
{
  uint64_t result = (__CFString *)CFRetain(@"MADisplayFilterGreenColorCorrectionIntensity");
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberRef v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetGreenColorCorrectionIntensity(double a1)
{
}

void MADisplayFilterPrefGetBlueColorCorrectionIntensity()
{
}

__CFString *_copyPrefBlueColorCorrectionIntensity()
{
  uint64_t result = (__CFString *)CFRetain(@"MADisplayFilterBlueColorCorrectionIntensity");
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberRef v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetBlueColorCorrectionIntensity(double a1)
{
}

void MADisplayFilterPrefGetGrayscaleCorrectionIntensity()
{
}

__CFString *_copyPrefGrayscaleCorrectionIntensity()
{
  uint64_t result = (__CFString *)CFRetain(@"MADisplayFilterGrayscaleCorrectionIntensity");
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberRef v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetGrayscaleCorrectionIntensity(double a1)
{
}

void MADisplayFilterPrefGetBrightnessIntensity()
{
}

void *_copyPrefBrightnessIntensity()
{
  CFBooleanRef v0 = (__CFString *)CFRetain(@"MADisplayFilterBrightnessIntensity");
  if (!v0) {
    return 0;
  }
  CFNumberRef v1 = v0;
  CFNumberRef v2 = (void *)MAPreferencesCopyNumber(v0);
  if (!v2)
  {
    uint64_t valuePtr = 0x3F9EB851EB851EB8;
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  }
  CFRelease(v1);
  return v2;
}

void MADisplayFilterPrefSetBrightnessIntensity(double a1)
{
}

void MADisplayFilterPrefGetWarmthIntensity()
{
}

void *_copyPrefWarmthIntensity()
{
  CFBooleanRef v0 = (__CFString *)CFRetain(@"MADisplayFilterWarmthIntensity");
  if (!v0) {
    return 0;
  }
  CFNumberRef v1 = v0;
  CFNumberRef v2 = (void *)MAPreferencesCopyNumber(v0);
  if (!v2)
  {
    uint64_t valuePtr = 0x3FF0000000000000;
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  }
  CFRelease(v1);
  return v2;
}

void MADisplayFilterPrefSetWarmthIntensity(double a1)
{
}

void MADisplayFilterPrefGetReduceWhitePointIntensity()
{
}

void *_copyPrefReduceWhitePointIntensity()
{
  CFBooleanRef v0 = (__CFString *)CFRetain(@"MADisplayFilterReduceWhitePointIntensity");
  if (!v0) {
    return 0;
  }
  CFNumberRef v1 = v0;
  CFNumberRef v2 = (void *)MAPreferencesCopyNumber(v0);
  if (!v2)
  {
    uint64_t valuePtr = 0x3FE999999999999ALL;
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  }
  CFRelease(v1);
  return v2;
}

void MADisplayFilterPrefSetReduceWhitePointIntensity(double a1)
{
}

void MADisplayFilterPrefGetSingleColorIntensity()
{
}

CFNumberRef _copyPrefSingleColorIntensity()
{
  CFBooleanRef v0 = (__CFString *)CFRetain(@"MADisplayFilterSingleColorIntensity");
  if (v0)
  {
    CFNumberRef v1 = v0;
    CFNumberRef v2 = MAPreferencesCopyNumber(v0);
    CFRelease(v1);
    return (CFNumberRef)v2;
  }
  else
  {
    int valuePtr = 0;
    return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  }
}

void MADisplayFilterPrefSetSingleColorIntensity(double a1)
{
}

void MADisplayFilterPrefGetSingleColorHue()
{
}

__CFString *_copyPrefSingleColorHue()
{
  uint64_t result = (__CFString *)CFRetain(@"MADisplayFilterSingleColorHue");
  if (result)
  {
    CFNumberRef v1 = result;
    CFNumberRef v2 = MAPreferencesCopyNumber(result);
    CFRelease(v1);
    return (__CFString *)v2;
  }
  return result;
}

void MADisplayFilterPrefSetSingleColorHue(double a1)
{
}

void MADisplayFilterPrefResetAll()
{
  CFBooleanRef v0 = (__CFString *)CFRetain(@"MADisplayFilterType");
  if (v0)
  {
    CFNumberRef v1 = v0;
    MAPreferencesSetValue(v0, 0);
    CFRelease(v1);
  }
  CFNumberRef v2 = (__CFString *)CFRetain(@"MADisplayFilterRedColorCorrectionIntensity");
  if (v2)
  {
    double v3 = v2;
    MAPreferencesSetValue(v2, 0);
    CFRelease(v3);
  }
  BOOL v4 = (__CFString *)CFRetain(@"MADisplayFilterGreenColorCorrectionIntensity");
  if (v4)
  {
    CFNumberRef v5 = v4;
    MAPreferencesSetValue(v4, 0);
    CFRelease(v5);
  }
  CFNumberRef v6 = (__CFString *)CFRetain(@"MADisplayFilterBlueColorCorrectionIntensity");
  if (v6)
  {
    CFTypeID v7 = v6;
    MAPreferencesSetValue(v6, 0);
    CFRelease(v7);
  }
  double v8 = (__CFString *)CFRetain(@"MADisplayFilterSingleColorHue");
  if (v8)
  {
    double v9 = v8;
    MAPreferencesSetValue(v8, 0);
    CFRelease(v9);
  }
  CFNumberRef v10 = MADisplayFilterPrefCopyCategoriesForCurrentPlatform();
  if (v10)
  {
    CFArrayRef v11 = v10;
    CFIndex Count = CFArrayGetCount(v10);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      for (CFIndex i = 0; i != v13; ++i)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v11, i);
        uint64_t valuePtr = 0;
        CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr);
        CFStringRef PrefCategoryKey = (__CFString *)_createPrefCategoryKey(valuePtr, @"MADisplayFilterCategoryEnabled");
        if (PrefCategoryKey)
        {
          float32x2_t v17 = PrefCategoryKey;
          MAPreferencesSetValue(PrefCategoryKey, 0);
          CFRelease(v17);
        }
        float32x2_t v18 = (__CFString *)_createPrefCategoryKey(valuePtr, @"MADisplayFilterType");
        if (v18)
        {
          char v19 = v18;
          MAPreferencesSetValue(v18, 0);
          CFRelease(v19);
        }
      }
    }
    CFRelease(v11);
  }
  MAPreferencesPostChangeNotification(@"com.apple.mediaaccessibility.displayFilterSettingsChanged");
}

uint64_t MACaptionAppearancePrefSetAllowNullProfile(uint64_t result)
{
  _AllowNullProfile = result;
  return result;
}

void MACaptionAppearancePrefSaveState()
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  if (_SavedState)
  {
    CFRelease((CFTypeRef)_SavedState);
    _SavedState = 0;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  CFNumberRef v1 = MAPreferencesCopyProfileIDs(@"MACaptionProfile-");
  if (v1)
  {
    CFArrayRef v2 = v1;
    CFIndex Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, i);
        if (MACaptionAppearancePrefIsProfileEditable(ValueAtIndex)) {
          CFArrayAppendValue(Mutable, ValueAtIndex);
        }
      }
    }
    if (CFArrayGetCount(Mutable) >= 1) {
      _SavedState = (uint64_t)MAPreferencesCopyMultipleProfiles(Mutable);
    }
    CFRelease(v2);
  }

  CFRelease(Mutable);
}

__CFArray *MACaptionAppearancePrefCopyProfileIDs()
{
  return MAPreferencesCopyProfileIDs(@"MACaptionProfile-");
}

void MACaptionAppearancePrefRestoreState()
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  if (_SavedState)
  {
    MAPreferencesSetMultipleProfiles((const __CFDictionary *)_SavedState);
    MAPreferencesPostChangeNotification(@"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    CFRelease((CFTypeRef)_SavedState);
    _SavedState = 0;
  }
}

void MACaptionAppearancePrefSetActiveProfileID(CFStringRef theString)
{
  if (!theString || !CFStringGetLength(theString))
  {
    MAPreferencesSetValue(@"MACaptionActiveProfile", theString);
LABEL_11:
    MAPreferencesPostChangeNotification(@"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    return;
  }
  if (!CFStringHasPrefix(theString, @"MACaptionProfile-")) {
    return;
  }
  CFArrayRef v2 = MAPreferencesCopyProfileIDs(@"MACaptionProfile-");
  if (!v2) {
    return;
  }
  double v3 = v2;
  v7.length = CFArrayGetCount(v2);
  v7.location = 0;
  if (CFArrayContainsValue(v3, v7, theString))
  {
    CFTypeRef v4 = MACaptionAppearancePrefCopyActiveProfileID();
    if (v4)
    {
      CFNumberRef v5 = v4;
      if (!CFEqual(v4, theString)) {
        MAPreferencesSetValue(@"MACaptionActiveProfile", theString);
      }
      CFRelease(v5);
    }
    else
    {
      MAPreferencesSetValue(@"MACaptionActiveProfile", theString);
    }
    CFRelease(v3);
    goto LABEL_11;
  }

  CFRelease(v3);
}

void MACaptionAppearancePrefSetSystemLanguageOverride(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  if (_SystemLanguageOverride) {
    CFRelease((CFTypeRef)_SystemLanguageOverride);
  }
  _SystemLanguageOverride = (uint64_t)cf;
}

void MACaptionAppearancePrefSetTempProfileID(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = (uint64_t)cf;
}

const void *MACaptionAppearancePrefCopyProfileOrder(const __CFString *a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(a1, @"MACaptionProfileOrder", TypeID);
}

void MACaptionAppearancePrefSetProfileOrder(__CFString *a1, const void *a2)
{
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    MAPreferencesSetProfileValue(a1, @"MACaptionProfileOrder", a2);
  }
}

void MACaptionAppearancePrefSetProfileName(__CFString *a1, const void *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    MAPreferencesSetProfileValue(a1, @"MACaptionProfileName", a2);
  }
}

CFStringRef MACaptionAppearancePrefCreateNewProfileID()
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  CFUUIDRef v0 = CFUUIDCreate(0);
  if (!v0) {
    return 0;
  }
  CFUUIDRef v1 = v0;
  CFStringRef v2 = CFUUIDCreateString(0, v0);
  if (v2)
  {
    CFStringRef v3 = v2;
    CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%@-%@", @"MACaptionProfile", v2);
    CFRelease(v3);
  }
  else
  {
    CFStringRef v4 = 0;
  }
  CFRelease(v1);
  return v4;
}

__CFString *MACaptionAppearancePrefCreateNewProfileFromProfile(__CFString *a1)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  NewProfileID = (__CFString *)MACaptionAppearancePrefCreateNewProfileID();
  _copyProfileToProfile(a1, NewProfileID, 0);
  return NewProfileID;
}

void _copyProfileToProfile(__CFString *a1, __CFString *a2, char a3)
{
  _NotificationsSuspended_0 = 1;
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyTextEdgeStyle, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetTextEdgeStyle, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideTextEdgeStyle, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideTextEdgeStyle, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyForegroundColor, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetForegroundColor, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideForegroundColor, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideForegroundColor, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyBackgroundColor, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetBackgroundColor, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideBackgroundColor, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideBackgroundColor, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyWindowColor, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetWindowColor, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideWindowColor, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideWindowColor, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyForegroundOpacity, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetForegroundOpacity, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideForegroundOpacity, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideForegroundOpacity, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyBackgroundOpacity, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetBackgroundOpacity, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideBackgroundOpacity, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyWindowOpacity, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetWindowOpacity, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideWindowOpacity, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideWindowOpacity, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))_MACaptionAppearancePrefCopyRelativeCharSize, (uint64_t)a2, (void (*)(uint64_t, const void *))_MACaptionAppearancePrefSetRelativeCharSize, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyRelativeCharacterSize, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetRelativeCharacterSize, a3);
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyVideoOverrideRelativeCharSize, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetVideoOverrideRelativeCharSize, a3);
  _copyFontSetting(a1, (uint64_t (*)(__CFString *, uint64_t))MACaptionAppearancePrefCopyFontDescriptorForStyle, (uint64_t)a2, (void (*)(uint64_t, const void *, uint64_t))MACaptionAppearancePrefSetFontDescriptorForStyle, a3);
  _copyFontSetting(a1, (uint64_t (*)(__CFString *, uint64_t))MACaptionAppearancePrefCopyFontSpecifiedByUserForStyle, (uint64_t)a2, (void (*)(uint64_t, const void *, uint64_t))MACaptionAppearancePrefSetFontSpecifiedByUserForStyle, a3);
  for (unint64_t i = 0; i != 8; ++i)
  {
    if (a1)
    {
      CFRange v7 = MACaptionAppearancePrefCopyVideoOverrideFontForStyle(a1, i);
      if (a3) {
        goto LABEL_8;
      }
    }
    else
    {
      CFRange v7 = 0;
      if (a3) {
        goto LABEL_8;
      }
    }
    if (!v7) {
      CFRange v7 = MACaptionAppearancePrefCopyVideoOverrideFontForStyle(@"MACaptionSystemDefaultProfile", i);
    }
LABEL_8:
    MACaptionAppearancePrefSetVideoOverrideFontForStyle(a2, i, v7);
    if (v7) {
      CFRelease(v7);
    }
  }
  _copySetting((uint64_t)a1, (uint64_t (*)(void))MACaptionAppearancePrefCopyWindowRoundedCornerRadius, (uint64_t)a2, (void (*)(uint64_t, const void *))MACaptionAppearancePrefSetWindowRoundedCornerRadius, a3);
  for (unint64_t j = 0; j != 8; ++j)
  {
    unint64_t v9 = -1;
    if (a1 && MACaptionAppearancePrefIsSystemFont(a1, j, (uint64_t *)&v9)) {
      MACaptionAppearancePrefSetIsSystemFont(a2, 1, j, v9);
    }
  }
  _NotificationsSuspended_0 = 0;
  MAPreferencesPostChangeNotification(@"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
}

void MACaptionAppearancePrefRemoveProfile(__CFString *a1)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    MAPreferencesRemoveProfile(a1);
  }
}

void MACaptionAppearancePrefResetProfile(__CFString *a1)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _copyProfileToProfile(0, a1, 1);
}

void MACaptionAppearancePrefResetAll()
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  MACaptionAppearancePrefResetProfile(0);
  CFUUIDRef v0 = MAPreferencesCopyProfileIDs(@"MACaptionProfile-");
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFIndex Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      CFIndex v3 = Count;
      for (CFIndex i = 0; i != v3; ++i)
      {
        CFStringRef ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(v1, i);
        if (MACaptionAppearancePrefIsProfileEditable(ValueAtIndex)) {
          MAPreferencesRemoveProfile(ValueAtIndex);
        }
      }
    }
    CFRelease(v1);
  }
  MAPreferencesSetValue(@"MACaptionShowCaptions", 0);
  MACaptionAppearancePrefSetDisplayType(0);
  MACaptionAppearancePrefSetPreferAccessibleCaptions(0);

  MACaptionAppearancePrefSetPreferredLanguages(0);
}

void MACaptionAppearancePrefSetDisplayType(const __CFNumber *a1)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  CFStringRef v2 = MAPreferencesCopyNumber(@"MACaptionDisplayType");
  if (a1)
  {
    unsigned int valuePtr = 0;
    if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr) && valuePtr <= 2)
    {
      ++valuePtr;
      a1 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    }
    else
    {
      a1 = 0;
    }
  }
  MAPreferencesSetValue(@"MACaptionDisplayType", a1);
  if ((_NotificationsSuspended_0 & 1) == 0) {
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v2, (unint64_t)a1, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
  }
  if (v2) {
    CFRelease(v2);
  }
  if (a1) {
    CFRelease(a1);
  }
}

void MACaptionAppearancePrefSetPreferAccessibleCaptions(const void *a1)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  CFStringRef v2 = MAPreferencesCopyBoolean(@"MACaptionPreferAccessibleCaptions");
  MAPreferencesSetValue(@"MACaptionPreferAccessibleCaptions", a1);
  if ((_NotificationsSuspended_0 & 1) == 0) {
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v2, (unint64_t)a1, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

void MACaptionAppearancePrefSetPreferredLanguages(CFArrayRef theArray)
{
  if (theArray)
  {
    MutableCFArrayRef Copy = CFArrayCreateMutableCopy(0, 0, theArray);
    if (MutableCopy)
    {
      CFArrayRef Copy = CFArrayCreateCopy(0, MutableCopy);
      CFArrayRemoveAllValues(MutableCopy);
      CFIndex Count = CFArrayGetCount(Copy);
      if (Count >= 1)
      {
        CFIndex v4 = Count;
        for (CFIndex i = 0; i != v4; ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Copy, i);
          if (ValueAtIndex)
          {
            CFStringRef CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(ValueAtIndex);
            if (CanonicalLanguageIdentifierFromString)
            {
              CFStringRef v8 = CanonicalLanguageIdentifierFromString;
              if (CFStringGetLength(CanonicalLanguageIdentifierFromString) >= 1) {
                CFArrayAppendValue(MutableCopy, v8);
              }
              CFRelease(v8);
            }
          }
        }
      }
      CFRelease(Copy);
      CFArrayRef v9 = CFArrayCreateCopy(0, MutableCopy);
      CFIndex v10 = CFArrayGetCount(v9);
      CFArrayRemoveAllValues(MutableCopy);
      if (v10 >= 1)
      {
        for (CFIndex j = 0; j != v10; ++j)
        {
          CFTypeID v12 = CFArrayGetValueAtIndex(v9, j);
          v18.length = CFArrayGetCount(MutableCopy);
          v18.location = 0;
          if (!CFArrayContainsValue(MutableCopy, v18, v12)) {
            CFArrayAppendValue(MutableCopy, v12);
          }
        }
      }
      CFRelease(v9);
      CFIndex v13 = CFArrayGetCount(MutableCopy);
      if (v13 >= 21)
      {
        unint64_t v14 = v13 + 1;
        do
        {
          CFArrayRemoveValueAtIndex(MutableCopy, v14 - 2);
          --v14;
        }
        while (v14 > 0x15);
      }
    }
  }
  else
  {
    MutableCFArrayRef Copy = 0;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  uint64_t v16 = MAPreferencesCopyProfileValueWithExpectedType(0, @"MACaptionPreferredLanguages", TypeID);
  MAPreferencesSetProfileValue(0, @"MACaptionPreferredLanguages", MutableCopy);
  if ((_NotificationsSuspended_0 & 1) == 0) {
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v16, (unint64_t)MutableCopy, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (v16)
  {
    CFRelease(v16);
  }
}

uint64_t MACaptionAppearancePrefCopyShowCaptionsWhenAvailable()
{
  uint64_t v0 = *MEMORY[0x1E4F1CFC8];
  CFNumberRef v1 = (const __CFNumber *)MAPreferencesCopyNumber(@"MACaptionDisplayType");
  if (v1)
  {
    CFNumberRef v2 = v1;
    int valuePtr = 0;
    int Value = CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr == 3 && Value != 0) {
      uint64_t v0 = *MEMORY[0x1E4F1CFD0];
    }
    CFRelease(v2);
  }
  return v0;
}

void MACaptionAppearancePrefSetShowCaptionsWhenAvailable(const __CFBoolean *a1)
{
  if (a1)
  {
    int valuePtr = 0;
    if (CFBooleanGetValue(a1)) {
      int valuePtr = 2;
    }
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    if (v2)
    {
      CFNumberRef v3 = v2;
      MACaptionAppearancePrefSetDisplayType(v2);
      CFRelease(v3);
    }
  }
  else
  {
    MACaptionAppearancePrefSetDisplayType(0);
  }
}

void MACaptionAppearancePrefSetForegroundColor(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionForegroundColor", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundColor);
}

void _setPreferenceValue(__CFString *a1, __CFString *a2, CGColor *a3, uint64_t (*a4)(__CFString *))
{
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    CFStringRef v8 = (const void *)a4(a1);
    if (a3 && (CFTypeID v9 = CFGetTypeID(a3), v9 == CGColorGetTypeID())) {
      MAPreferencesSetProfileColor(a1, a2, a3);
    }
    else {
      MAPreferencesSetProfileValue(a1, a2, a3);
    }
    if ((_NotificationsSuspended_0 & 1) == 0) {
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v8, (unint64_t)a3, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    }
    if (v8)
    {
      CFRelease(v8);
    }
  }
}

void MACaptionAppearancePrefSetBackgroundColor(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionBackgroundColor", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundColor);
}

void MACaptionAppearancePrefSetWindowColor(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionWindowColor", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowColor);
}

void MACaptionAppearancePrefSetForegroundOpacity(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionForegroundOpacity", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyForegroundOpacity);
}

void MACaptionAppearancePrefSetBackgroundOpacity(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionBackgroundOpacity", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyBackgroundOpacity);
}

void MACaptionAppearancePrefSetWindowOpacity(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionWindowOpacity", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowOpacity);
}

BOOL MACaptionAppearancePrefIsSystemFont(const __CFString *a1, unint64_t a2, uint64_t *a3)
{
  if (a3) {
    *a3 = -1;
  }
  if (a2 > 7) {
    CFNumberRef v5 = 0;
  }
  else {
    CFNumberRef v5 = off_1E6223B48[a2];
  }
  CFTypeID TypeID = CFStringGetTypeID();
  CFRange v7 = MAPreferencesCopyProfileValueWithExpectedType(a1, v5, TypeID);
  if (!v7) {
    return 0;
  }
  CFStringRef v8 = v7;
  uint64_t SystemFontType = MACaptionAppearancePrefGetSystemFontType(v7);
  BOOL v10 = SystemFontType != -1;
  if (a3) {
    *a3 = SystemFontType;
  }
  CFRelease(v8);
  return v10;
}

void MACaptionAppearancePrefSetIsSystemFont(__CFString *a1, int a2, unint64_t a3, unint64_t a4)
{
  if (a3 > 7)
  {
    CFNumberRef v6 = 0;
    if (a2) {
      goto LABEL_3;
    }
LABEL_9:
    FallbackPSFontNameForuint64_t SystemFontType = MAUtilitiesGetFallbackPSFontNameForSystemFontType(a4);
    if (FallbackPSFontNameForSystemFontType) {
      CFStringRef v8 = FallbackPSFontNameForSystemFontType;
    }
    else {
      CFStringRef v8 = @"Helvetica";
    }
    goto LABEL_12;
  }
  CFNumberRef v6 = off_1E6223B48[a3];
  if (!a2) {
    goto LABEL_9;
  }
LABEL_3:
  CFRange v7 = @".AXAppleSystemFont";
  if (a4 == 2) {
    CFRange v7 = @".AXAppleSystemFontMono";
  }
  if (a4 == 1) {
    CFStringRef v8 = @".AXAppleSystemFontBold";
  }
  else {
    CFStringRef v8 = v7;
  }
LABEL_12:
  CFTypeID TypeID = CFStringGetTypeID();
  CFArrayRef v11 = (__CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, v6, TypeID);
  MAPreferencesSetProfileValue(a1, v6, v8);
  if (v8 != v11 && (!v11 || !CFEqual(v8, v11))) {
    MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(a1, (const void *)*MEMORY[0x1E4F1CFD0], a3);
  }
  if ((_NotificationsSuspended_0 & 1) == 0) {
    MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v11, (unint64_t)v8, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
  }
  if (v11)
  {
    CFRelease(v11);
  }
}

void MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(__CFString *a1, const void *a2, unint64_t a3)
{
  if (MACaptionAppearancePrefIsProfileEditable(a1) && a3 <= 7)
  {
    CFStringRef v6 = off_1E6223B48[a3];
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex Length = CFStringGetLength(@"MACaptionFontSpecifiedByUser");
    MutableCFArrayRef Copy = CFStringCreateMutableCopy(v7, Length, @"MACaptionFontSpecifiedByUser");
    CFStringAppend(MutableCopy, v6);
    BOOL v10 = MACaptionAppearancePrefCopyFontSpecifiedByUserForStyle(a1, a3);
    MAPreferencesSetProfileValue(a1, MutableCopy, a2);
    if (v10) {
      CFRelease(v10);
    }
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
  }
}

BOOL MACaptionAppearancePrefIsFontSystemForStyle(const __CFString *a1, unint64_t a2, BOOL *a3)
{
  uint64_t v5 = 0;
  BOOL result = MACaptionAppearancePrefIsSystemFont(a1, a2, &v5);
  if (a3) {
    *a3 = v5 == 2;
  }
  return result;
}

void MACaptionAppearancePrefSetIsFontSystemForStyle(__CFString *a1, int a2, unint64_t a3, int a4)
{
  MACaptionAppearancePrefSetIsSystemFont(a1, a2, a3, 2 * (a4 != 0));
}

CFStringRef MACaptionAppearancePrefCopyFontForStyle(const __CFString *a1, unint64_t a2)
{
  if (a2 > 7) {
    CFNumberRef v2 = 0;
  }
  else {
    CFNumberRef v2 = off_1E6223B48[a2];
  }
  return MAPreferencesCopyProfileFont(a1, v2);
}

void MACaptionAppearancePrefSetFontForStyle(__CFString *a1, CGFont *a2, unint64_t a3)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    if (a3 > 7) {
      CFStringRef v6 = 0;
    }
    else {
      CFStringRef v6 = off_1E6223B48[a3];
    }
    CFStringRef v7 = MAPreferencesCopyProfileFont(a1, v6);
    MAPreferencesSetProfileFont(a1, v6, a2);
    if (v7 != (const __CFString *)a2 && (!a2 || !v7 || !CFEqual(a2, v7))) {
      MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(a1, (const void *)*MEMORY[0x1E4F1CFD0], a3);
    }
    if ((_NotificationsSuspended_0 & 1) == 0) {
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v7, (unint64_t)a2, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    }
    if (v7)
    {
      CFRelease(v7);
    }
  }
}

void MACaptionAppearancePrefSetFontDescriptorForStyle(__CFString *a1, const __CTFontDescriptor *a2, unint64_t a3)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    if (a3 > 7) {
      CFStringRef v6 = 0;
    }
    else {
      CFStringRef v6 = off_1E6223B48[a3];
    }
    CFStringRef v7 = MAPreferencesCopyProfileFontDescriptor(a1, v6);
    MAPreferencesSetProfileFontDescriptor(a1, v6, a2);
    if (v7 != (const __CFString *)a2
      && !MAUtilitiesFontsUseSamePostScriptName(a2, (const __CTFontDescriptor *)v7))
    {
      MACaptionAppearancePrefSetFontSpecifiedByUserForStyle(a1, (const void *)*MEMORY[0x1E4F1CFD0], a3);
    }
    if ((_NotificationsSuspended_0 & 1) == 0) {
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v7, (unint64_t)a2, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    }
    if (v7)
    {
      CFRelease(v7);
    }
  }
}

const void *_MACaptionAppearancePrefCopyRelativeCharSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionCharScaleEnum");
}

void MACaptionAppearancePrefSetRelativeCharSize(__CFString *a1, uint64_t a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;
  uint64_t valuePtr = a2;
  CFIndex v4 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  _MACaptionAppearancePrefSetRelativeCharSize(a1, v4);
}

void _MACaptionAppearancePrefSetRelativeCharSize(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionCharScaleEnum", a2, (uint64_t (*)(__CFString *))_MACaptionAppearancePrefCopyRelativeCharSize);
}

const void *MACaptionAppearancePrefCopyRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionCharScale");
}

void MACaptionAppearancePrefSetRelativeCharacterSize(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionCharScale", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyRelativeCharacterSize);
}

void MACaptionAppearancePrefSetWindowRoundedCornerRadius(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionWindowRoundedCorners", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyWindowRoundedCornerRadius);
}

const void *MACaptionAppearancePrefCopyUsesAppleLookAndFeel(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionAppleLookAndFeel");
}

void MACaptionAppearancePrefSetUsesAppleLookAndFeel(__CFString *a1, CGColor *a2)
{
  if (_MACaptionAppearanceTempProfileID) {
    CFRelease((CFTypeRef)_MACaptionAppearanceTempProfileID);
  }
  _MACaptionAppearanceTempProfileID = 0;

  _setPreferenceValue(a1, @"MACaptionAppleLookAndFeel", a2, (uint64_t (*)(__CFString *))MACaptionAppearancePrefCopyUsesAppleLookAndFeel);
}

void MACaptionAppearancePrefSetTextEdgeStyle(__CFString *a1, const __CFNumber *a2)
{
  if (MACaptionAppearancePrefIsProfileEditable(a1))
  {
    CFNumberRef v4 = MACaptionAppearancePrefCopyTextEdgeStyle(a1);
    if (a2)
    {
      int valuePtr = 0;
      if (CFNumberGetValue(a2, kCFNumberSInt32Type, &valuePtr) && (unint64_t)(valuePtr - 1) <= 4) {
        a2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      }
      else {
        a2 = 0;
      }
    }
    MAPreferencesSetProfileValue(a1, @"MACaptionTextEdgeStyle", a2);
    if ((_NotificationsSuspended_0 & 1) == 0) {
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v4, (unint64_t)a2, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    }
    if (v4) {
      CFRelease(v4);
    }
    if (a2) {
      CFRelease(a2);
    }
  }
}

void MACaptionAppearancePrefSetVideoOverrideForegroundColor(__CFString *a1, CGColor *a2)
{
}

void MACaptionAppearancePrefSetVideoOverrideBackgroundColor(__CFString *a1, CGColor *a2)
{
}

void MACaptionAppearancePrefSetVideoOverrideWindowColor(__CFString *a1, CGColor *a2)
{
}

void MACaptionAppearancePrefSetVideoOverrideForegroundOpacity(__CFString *a1, CGColor *a2)
{
}

void MACaptionAppearancePrefSetVideoOverrideBackgroundOpacity(__CFString *a1, CGColor *a2)
{
}

void MACaptionAppearancePrefSetVideoOverrideWindowOpacity(__CFString *a1, CGColor *a2)
{
}

const void *MACaptionAppearancePrefCopyFontSpecifiedByUserForStyle(const __CFString *a1, unint64_t a2)
{
  if (a2 >= 8) {
    return (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFStringRef v3 = off_1E6223B48[a2];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex Length = CFStringGetLength(@"MACaptionFontSpecifiedByUser");
  MutableCFArrayRef Copy = CFStringCreateMutableCopy(v4, Length, @"MACaptionFontSpecifiedByUser");
  CFStringAppend(MutableCopy, v3);
  CFStringRef v7 = MAPreferencesCopyProfileBoolean(a1, MutableCopy);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v7;
}

void MACaptionAppearancePrefSetVideoOverrideFontForStyle(__CFString *a1, unint64_t a2, const void *a3)
{
  if (MACaptionAppearancePrefIsProfileEditable(a1) && a2 <= 7)
  {
    CFStringRef v6 = off_1E6223B48[a2];
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFIndex Length = CFStringGetLength(@"MACaptionVideOverrideFont");
    MutableCFArrayRef Copy = CFStringCreateMutableCopy(v7, Length, @"MACaptionVideOverrideFont");
    CFStringAppend(MutableCopy, v6);
    BOOL v10 = MACaptionAppearancePrefCopyVideoOverrideFontForStyle(a1, a2);
    MAPreferencesSetProfileValue(a1, MutableCopy, a3);
    if ((_NotificationsSuspended_0 & 1) == 0) {
      MAPreferencesPostChangeNotificationIfNeeded((unint64_t)v10, (unint64_t)a3, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged");
    }
    if (v10) {
      CFRelease(v10);
    }
    if (MutableCopy)
    {
      CFRelease(MutableCopy);
    }
  }
}

void MACaptionAppearancePrefSetVideoOverrideRelativeCharSize(__CFString *a1, CGColor *a2)
{
}

const void *MACaptionAppearancePrefCopyVideoOverrideRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideCharScale");
}

void MACaptionAppearancePrefSetVideoOverrideRelativeCharacterSize(__CFString *a1, CGColor *a2)
{
}

void MACaptionAppearancePrefSetVideoOverrideTextEdgeStyle(__CFString *a1, CGColor *a2)
{
}

__CFArray *MAXCaptionAppearancePrefCopyProfileIDs()
{
  return MAPreferencesCopyProfileIDs(@"MACaptionProfile-");
}

const void *MAXCaptionAppearancePrefCopyProfileOrder(const __CFString *a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();

  return MAPreferencesCopyProfileValueWithExpectedType(a1, @"MACaptionProfileOrder", TypeID);
}

CGColorRef MAXCaptionAppearancePrefCopyForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, @"MACaptionForegroundColor");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideForegroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideForegroundColor");
}

void MAXCaptionAppearancePrefSetVideoOverrideForegroundColor(__CFString *a1, CGColor *a2)
{
}

CGColorRef MAXCaptionAppearancePrefCopyBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, @"MACaptionBackgroundColor");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideBackgroundColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideBackgroundColor");
}

void MAXCaptionAppearancePrefSetVideoOverrideBackgroundColor(__CFString *a1, CGColor *a2)
{
}

CGColorRef MAXCaptionAppearancePrefCopyWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileColor(a1, @"MACaptionWindowColor");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideWindowColor(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideWindowColor");
}

void MAXCaptionAppearancePrefSetVideoOverrideWindowColor(__CFString *a1, CGColor *a2)
{
}

const void *MAXCaptionAppearancePrefCopyForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionForegroundOpacity");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideForegroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideForegroundOpacity");
}

void MAXCaptionAppearancePrefSetVideoOverrideForegroundOpacity(__CFString *a1, CGColor *a2)
{
}

const void *MAXCaptionAppearancePrefCopyBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionBackgroundOpacity");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideBackgroundOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideBackgroundOpacity");
}

void MAXCaptionAppearancePrefSetVideoOverrideBackgroundOpacity(__CFString *a1, CGColor *a2)
{
}

const void *MAXCaptionAppearancePrefCopyWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionWindowOpacity");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideWindowOpacity(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideWindowOpacity");
}

void MAXCaptionAppearancePrefSetVideoOverrideWindowOpacity(__CFString *a1, CGColor *a2)
{
}

const void *MAXCaptionAppearancePrefCopyRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionCharScale");
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideRelativeCharacterSize(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideCharScale");
}

void MAXCaptionAppearancePrefSetVideoOverrideRelativeCharacterSize(__CFString *a1, CGColor *a2)
{
}

const void *MAXCaptionAppearancePrefCopyVideoOverrideTextEdgeStyle(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionVideoOverrideTextEdgeStyle");
}

void MAXCaptionAppearancePrefSetVideoOverrideTextEdgeStyle(__CFString *a1, CGColor *a2)
{
}

const void *MAXCaptionAppearancePrefCopyWindowRoundedCornerRadius(const __CFString *a1)
{
  return MAPreferencesCopyProfileNumber(a1, @"MACaptionWindowRoundedCorners");
}

const void *MAXCaptionAppearancePrefCopyUsesAppleLookAndFeel(const __CFString *a1)
{
  return MAPreferencesCopyProfileBoolean(a1, @"MACaptionAppleLookAndFeel");
}

void MACaptionAppearanceMacBuddySettingsToTransfer(__CFDictionary *a1)
{
  CFBooleanRef v2 = (const __CFBoolean *)MAPreferencesCopyBoolean(@"MACaptionPreferAccessibleCaptions");
  if (v2)
  {
    CFBooleanRef v3 = v2;
    if (CFBooleanGetValue(v2))
    {
      CFDictionarySetValue(a1, @"MACaptionPreferAccessibleCaptions", (const void *)*MEMORY[0x1E4F1CFD0]);
      int valuePtr = 3;
      CFNumberRef v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      if (v4)
      {
        CFNumberRef v5 = v4;
        CFDictionarySetValue(a1, @"MACaptionDisplayType", v4);
        CFRelease(v5);
      }
    }
    CFRelease(v3);
  }
}

void _copySetting(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void (*a4)(uint64_t, const void *), char a5)
{
  if (a1)
  {
    CFTypeID v9 = (const void *)a2();
    if (a5) {
      goto LABEL_7;
    }
  }
  else
  {
    CFTypeID v9 = 0;
    if (a5) {
      goto LABEL_7;
    }
  }
  if (!v9) {
    CFTypeID v9 = (const void *)((uint64_t (*)(__CFString *))a2)(@"MACaptionSystemDefaultProfile");
  }
LABEL_7:
  a4(a3, v9);
  if (v9)
  {
    CFRelease(v9);
  }
}

void _copyFontSetting(__CFString *a1, uint64_t (*a2)(__CFString *, uint64_t), uint64_t a3, void (*a4)(uint64_t, const void *, uint64_t), char a5)
{
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (a1)
    {
      CFArrayRef v11 = (const void *)a2(a1, i);
      if (a5) {
        goto LABEL_8;
      }
    }
    else
    {
      CFArrayRef v11 = 0;
      if (a5) {
        goto LABEL_8;
      }
    }
    if (!v11) {
      CFArrayRef v11 = (const void *)a2(@"MACaptionSystemDefaultProfile", i);
    }
LABEL_8:
    a4(a3, v11, i);
    if (v11) {
      CFRelease(v11);
    }
  }
}

void sub_1BA6DA520(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BA6DA798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

Class __getPSEVideoProcessorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!PhotosensitivityProcessingLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v3[2] = (void *)3221225472;
    v3[3] = __PhotosensitivityProcessingLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6223BB0;
    uint64_t v5 = 0;
    PhotosensitivityProcessingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosensitivityProcessingLibraryCore_frameworkLibrary) {
    __getPSEVideoProcessorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("PSEVideoProcessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPSEVideoProcessorClass_block_invoke_cold_2();
  }
  getPSEVideoProcessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotosensitivityProcessingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosensitivityProcessingLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t MADisplayFilterGetTypeID()
{
  if ((__MADisplayFilterInitialized & 1) == 0) {
    __MADisplayFilterInitialize();
  }
  return __kMADisplayFilterTypeID;
}

uint64_t __MADisplayFilterInitialize(void)
{
  pthread_mutex_lock(&sInitLock);
  if ((__MADisplayFilterInitialized & 1) == 0)
  {
    __kMADisplayFilterCFTypeID TypeID = _CFRuntimeRegisterClass();
    __MADisplayFilterInitialized = 1;
  }

  return pthread_mutex_unlock(&sInitLock);
}

double MADisplayFilterGetPostOffsets(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

double *MADisplayFilterSetPostOffsets(double *result, double a2, double a3, double a4)
{
  if (result)
  {
    result[5] = a2;
    result[9] = a3;
    result[13] = a4;
  }
  return result;
}

double MADisplayFilterGetGain(uint64_t a1)
{
  return *(double *)(a1 + 144);
}

uint64_t MADisplayFilterSetGain(uint64_t result, double a2)
{
  if (result) {
    *(double *)(result + 144) = a2;
  }
  return result;
}

double MADisplayFilterGetReduceWhitePoint(uint64_t a1)
{
  return *(double *)(a1 + 152);
}

uint64_t MADisplayFilterSetReduceWhitePoint(uint64_t result, double a2)
{
  if (result) {
    *(double *)(result + 152) = a2;
  }
  return result;
}

__n128 MADisplayFilterGetMatrix@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 96);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 16);
  *(void *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 48);
  *(void *)(a2 + 40) = v3;
  __n128 result = *(__n128 *)(a1 + 80);
  *(__n128 *)(a2 + 48) = result;
  *(void *)(a2 + 64) = v4;
  return result;
}

double MADisplayFilterSetMatrix(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
    *(void *)(a1 + 32) = *(void *)(a2 + 16);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 64) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 48);
    double result = *(double *)(a2 + 64);
    *(double *)(a1 + 96) = result;
  }
  return result;
}

uint64_t MADisplayFilterCopySystemFilter(int a1, int a2, int a3)
{
  uint64_t Type = _MADisplayFilterGetType();
  if (!Type)
  {
    unint64_t v30 = 0;
    *(void *)&long long v31 = 0;
    *(void *)&long long v33 = 0;
    int64x2_t v29 = (int64x2_t)0x3FF0000000000000uLL;
    *((void *)&v31 + 1) = 0x3FF0000000000000;
    long long v32 = 0uLL;
    *((void *)&v33 + 1) = 0x3FF0000000000000;
    return _MADisplayFilterCreateWithPostOffset((uint64_t)&v29, 0.0, 0.0, 0.0);
  }
  __int16 v7 = Type;
  unint64_t v30 = 0;
  *(void *)&long long v31 = 0;
  *(void *)&long long v33 = 0;
  int64x2_t v29 = (int64x2_t)0x3FF0000000000000uLL;
  *((void *)&v31 + 1) = 0x3FF0000000000000;
  long long v32 = 0uLL;
  *((void *)&v33 + 1) = 0x3FF0000000000000;
  uint64_t v8 = (const void *)_MADisplayFilterCreateWithPostOffset((uint64_t)&v29, 0.0, 0.0, 0.0);
  uint64_t v9 = (uint64_t)v8;
  if (a1 && (v7 & 0x20) != 0)
  {
    if (v8) {
      CFRelease(v8);
    }
    int64x2_t v29 = vdupq_n_s64(0xBFD51EB851EB851FLL);
    unint64_t v30 = 0xBFD51EB851EB851FLL;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v9 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v29, 0.0, 0.0, 0.0);
    *(void *)(v9 + 40) = 0x3FF0000000000000;
  }
  if ((v7 & 0x10) != 0)
  {
    MADisplayFilterPrefGetSingleColorHue();
    double v11 = v10;
    MADisplayFilterPrefGetSingleColorIntensity();
    SingleColor = (double *)MADisplayFilterCreateSingleColor(v11, v13, v14, v12);
    MADisplayFilterCombine((double *)v9, SingleColor);
    if (SingleColor) {
      CFRelease(SingleColor);
    }
  }
  if ((v7 & 2) != 0)
  {
    MADisplayFilterPrefGetRedColorCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateRedColorCorrection(v18);
    goto LABEL_20;
  }
  if ((v7 & 4) != 0)
  {
    MADisplayFilterPrefGetGreenColorCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateGreenColorCorrection(v19);
    goto LABEL_20;
  }
  if ((v7 & 8) != 0)
  {
    MADisplayFilterPrefGetBlueColorCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateBlueColorCorrection(v20);
LABEL_20:
    uint64_t v21 = RedColorCorrection;
    MADisplayFilterCombine((double *)v9, RedColorCorrection);
    if (v21) {
      CFRelease(v21);
    }
    goto LABEL_22;
  }
  if (a2 && (v7 & 1) != 0)
  {
    MADisplayFilterPrefGetGrayscaleCorrectionIntensity();
    RedColorCorrection = (double *)MADisplayFilterCreateGrayscale(v16);
    goto LABEL_20;
  }
LABEL_22:
  if ((v7 & 0x100) != 0)
  {
    MADisplayFilterPrefGetWarmthIntensity();
    MADisplayFilterCreateBrightnessAdjust(a3, v22);
    v24 = v23;
    MADisplayFilterCombine((double *)v9, v23);
    if (v24) {
      CFRelease(v24);
    }
  }
  if ((v7 & 0x40) != 0)
  {
    MADisplayFilterPrefGetBrightnessIntensity();
    MADisplayFilterCreateBrightnessAdjust(a3, v25);
    MACaptionAppearanceTextEdgeStyle v27 = v26;
    MADisplayFilterCombine((double *)v9, v26);
    if (v27) {
      CFRelease(v27);
    }
  }
  return v9;
}

uint64_t _MADisplayFilterGetType(void)
{
  uint64_t v0 = MADisplayFilterPrefCopyCategoriesForCurrentPlatform();
  if (!v0) {
    return 0;
  }
  CFArrayRef v1 = v0;
  CFIndex Count = CFArrayGetCount(v0);
  if (Count < 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    CFIndex v3 = Count;
    uint64_t v4 = 0;
    for (CFIndex i = 0; i != v3; ++i)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v1, i);
      uint64_t valuePtr = 0;
      CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr);
      if (MADisplayFilterPrefGetCategoryEnabled(valuePtr)) {
        v4 |= MADisplayFilterPrefGetType(valuePtr);
      }
    }
  }
  CFRelease(v1);
  return v4;
}

uint64_t MADisplayFilterCreateIdentity()
{
  v1[0] = 0x3FF0000000000000;
  memset(&v1[1], 0, 24);
  v1[4] = 0x3FF0000000000000;
  memset(&v1[5], 0, 24);
  v1[8] = 0x3FF0000000000000;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v1, 0.0, 0.0, 0.0);
}

uint64_t MADisplayFilterCreateRedNightMode()
{
  int64x2_t v1 = vdupq_n_s64(0xBFD51EB851EB851FLL);
  unint64_t v2 = 0xBFD51EB851EB851FLL;
  long long v3 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t result = _MADisplayFilterCreateWithPostOffset((uint64_t)&v1, 0.0, 0.0, 0.0);
  *(void *)(result + 40) = 0x3FF0000000000000;
  return result;
}

uint64_t MADisplayFilterCreateSingleColor(double a1, double a2, double a3, double a4)
{
  BOOL v6 = MAUtilitiesDoubleAlmostEqual(1.0, 0.0);
  double v7 = 1.0;
  double v8 = 1.0;
  double v9 = 1.0;
  if (!v6)
  {
    double v12 = a1 * 359.9 / 60.0;
    int v13 = vcvtmd_s64_f64(v12);
    double v14 = v12 - (double)v13;
    double v9 = 1.0;
    double v15 = 1.0 - v14;
    double v16 = 1.0 - (1.0 - v14);
    double v7 = 0.0;
    double v8 = v16;
    switch(v13)
    {
      case 0:
        break;
      case 1:
        double v8 = 1.0;
        double v9 = v15;
        break;
      case 2:
        double v9 = 0.0;
        double v8 = 1.0;
        double v7 = v16;
        break;
      case 3:
        double v9 = 0.0;
        double v7 = 1.0;
        double v8 = v15;
        break;
      case 4:
        double v8 = 0.0;
        double v7 = 1.0;
        double v9 = v16;
        break;
      default:
        double v8 = 0.0;
        double v7 = v15;
        break;
    }
  }
  double v17 = 1.0 - a4 + v9 * a4;
  double v18 = a4 * 0.0 + (1.0 - a4) * 0.0;
  double v19 = v18;
  double v20 = v18;
  double v21 = 1.0 - a4 + v8 * a4;
  double v22 = v18;
  double v23 = v18;
  double v24 = v18;
  double v25 = 1.0 - a4 + v7 * a4;
  uint64_t v10 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v17, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v10);
  return v10;
}

double *MADisplayFilterCombine(double *result, double *a2)
{
  if (result && a2)
  {
    double v2 = result[2];
    double v3 = result[3];
    double v5 = result[4];
    double v4 = result[5];
    double v6 = result[6];
    double v7 = result[7];
    double v9 = result[8];
    double v8 = result[9];
    double v10 = result[10];
    double v11 = result[11];
    double v12 = result[14];
    double v13 = result[15];
    double v14 = a2[2];
    double v15 = a2[3];
    double v16 = a2[4];
    double v17 = a2[5];
    double v18 = a2[6];
    double v19 = a2[7];
    double v21 = a2[8];
    double v20 = a2[9];
    double v23 = a2[10];
    double v22 = a2[11];
    double v24 = a2[12];
    double v25 = a2[13];
    double v27 = a2[14];
    double v26 = a2[15];
    double v28 = a2[16];
    double v29 = a2[17];
    double v65 = v6 * v15 + v2 * v14 + v10 * v16 + v12 * v17;
    double v30 = v6 * v19 + v2 * v18 + v10 * v21 + v12 * v20;
    double v31 = v6 * v22 + v2 * v23 + v10 * v24 + v12 * v25;
    double v32 = v6 * v26 + v2 * v27 + v10 * v28 + v12 * v29;
    double v33 = v7 * v15 + v3 * v14 + v11 * v16 + v13 * v17;
    double v34 = v7 * v19 + v3 * v18 + v11 * v21 + v13 * v20;
    double v35 = v7 * v22 + v3 * v23 + v11 * v24 + v13 * v25;
    double v36 = v7 * v26 + v3 * v27 + v11 * v28 + v13 * v29;
    double v37 = v9 * v15 + v5 * v14;
    double v38 = v9 * v19 + v5 * v18;
    double v39 = v9 * v22 + v5 * v23;
    double v40 = v9 * v26 + v5 * v27;
    double v41 = result[12];
    double v42 = result[13];
    double v43 = v37 + v41 * v16;
    double v44 = v38 + v41 * v21;
    double v45 = v39 + v41 * v24;
    double v46 = v40 + v41 * v28;
    double v48 = result[16];
    double v47 = result[17];
    double v49 = v43 + v48 * v17;
    double v50 = v44 + v48 * v20;
    double v51 = v45 + v48 * v25;
    double v52 = v46 + v48 * v29;
    double v53 = v8 * v15 + v4 * v14 + v42 * v16 + v47 * v17;
    double v54 = v8 * v19 + v4 * v18 + v42 * v21 + v47 * v20;
    double v55 = v8 * v22 + v4 * v23 + v42 * v24 + v47 * v25;
    double v56 = v8 * v26 + v4 * v27 + v42 * v28 + v47 * v29;
    double v57 = result[18];
    double v58 = a2[18];
    if (v57 >= v58) {
      double v59 = result[18];
    }
    else {
      double v59 = a2[18];
    }
    if (v57 >= v58) {
      double v60 = a2[18];
    }
    else {
      double v60 = result[18];
    }
    if (v58 <= 1.0 && v57 <= 1.0) {
      double v62 = v60;
    }
    else {
      double v62 = v59;
    }
    double v63 = result[19] + a2[19];
    result[2] = v65;
    result[3] = v33;
    result[4] = v49;
    result[5] = v53;
    if (v62 < 0.0) {
      double v62 = 1.0;
    }
    if (v63 < 0.0) {
      double v63 = 0.0;
    }
    result[6] = v30;
    result[7] = v34;
    result[8] = v50;
    result[9] = v54;
    result[10] = v31;
    result[11] = v35;
    result[12] = v51;
    result[13] = v55;
    result[14] = v32;
    result[15] = v36;
    result[16] = v52;
    result[17] = v56;
    if (v63 <= 1.0) {
      double v64 = v63;
    }
    else {
      double v64 = 1.0;
    }
    result[18] = v62;
    result[19] = v64;
  }
  return result;
}

uint64_t MADisplayFilterCreateRedColorCorrection(double a1)
{
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a1 > 1.0) {
    a1 = 1.0;
  }
  double v3 = a1 * 0.123284686 + 1.0;
  float64x2_t v4 = vmulq_n_f64((float64x2_t)xmmword_1BA6E0950, a1);
  double v5 = a1 * -0.120003647;
  double v6 = a1 * 0.120002868 + 1.0;
  float64x2_t v7 = vmulq_n_f64((float64x2_t)xmmword_1BA6E0960, a1);
  double v8 = a1 * -0.732505139;
  double v9 = a1 * 0.000000990726569 + 1.0;
  uint64_t v1 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v3, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v1);
  return v1;
}

uint64_t MADisplayFilterCreateGreenColorCorrection(double a1)
{
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a1 > 1.0) {
    a1 = 1.0;
  }
  double v3 = a1 * -0.235688939 + 1.0;
  float64x2_t v4 = vmulq_n_f64((float64x2_t)xmmword_1BA6E0970, a1);
  double v5 = a1 * -0.0719766168;
  double v6 = a1 * 0.130708203 + 1.0;
  float64x2_t v7 = vmulq_n_f64((float64x2_t)xmmword_1BA6E0980, a1);
  double v8 = a1 * -0.8926484;
  double v9 = a1 * 0.0625030946 + 1.0;
  uint64_t v1 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v3, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v1);
  return v1;
}

uint64_t MADisplayFilterCreateBlueColorCorrection(double a1)
{
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a1 > 1.0) {
    a1 = 1.0;
  }
  v3[0] = a1 * 0.1332794 + 1.0;
  v3[1] = 0.0;
  _OWORD v3[2] = a1 * -0.1332794;
  v3[3] = 0.0;
  v3[4] = a1 * 0.52448918 + 1.0;
  void v3[5] = a1 * -0.52448918;
  v3[6] = 0.0;
  v3[7] = 0.0;
  v3[8] = 1.0;
  uint64_t v1 = _MADisplayFilterCreateWithPostOffset((uint64_t)v3, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v1);
  return v1;
}

uint64_t MADisplayFilterCreateGrayscale(double a1)
{
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a1 > 1.0) {
    a1 = 1.0;
  }
  double v1 = 1.0 - a1;
  double v2 = a1 * 0.3;
  double v3 = 1.0 - a1 + a1 * 0.3;
  double v4 = a1 * 0.59;
  double v5 = a1 * 0.59 + (1.0 - a1) * 0.0;
  double v6 = a1 * 0.11;
  *(double *)double v9 = v3;
  *(double *)&v9[1] = v5;
  double v10 = v6 + v1 * 0.0;
  double v11 = v2 + v1 * 0.0;
  double v12 = v1 + v4;
  double v13 = v10;
  double v14 = v11;
  double v15 = v5;
  double v16 = v1 + v6;
  uint64_t v7 = _MADisplayFilterCreateWithPostOffset((uint64_t)v9, 0.0, 0.0, 0.0);
  MADisplayFilterNormalize(v7);
  return v7;
}

void MADisplayFilterCreateBrightnessAdjust(int a1, double a2)
{
  double v2 = 1.0 - a2;
  double v3 = (1.0 - a2) * 0.75;
  if (a1)
  {
    MADisplayFilterCreateSaturation(v3 + 0.13);
  }
  else
  {
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v19[0] = 0.41350211;
    memset(&v19[1], 0, 24);
    v19[4] = 0.275342466;
    memset(&v19[5], 0, 24);
    v19[8] = 0.0470198675;
    v17[0] = xmmword_1BA6E0990;
    v17[1] = xmmword_1BA6E09A0;
    v17[2] = xmmword_1BA6E09B0;
    v17[3] = xmmword_1BA6E09C0;
    uint64_t v18 = 0x3FF779335D249E45;
    MAFilterMatrix3Multiply(v19, (double *)v17, (double *)&v20);
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    memset(v13, 0, sizeof(v13));
    v11[0] = xmmword_1BA6E09D0;
    v11[1] = xmmword_1BA6E09E0;
    v11[2] = xmmword_1BA6E09F0;
    v11[3] = xmmword_1BA6E0A00;
    uint64_t v12 = 0x3FE631422CCB3A26;
    void v9[2] = v22;
    v9[3] = v23;
    uint64_t v10 = v24;
    v9[0] = v20;
    v9[1] = v21;
    MAFilterMatrix3Multiply((double *)v11, (double *)v9, v13);
    *(double *)double v8 = v13[0];
    memset(&v8[1], 0, 24);
    v8[4] = v14;
    memset(&v8[5], 0, 24);
    v8[8] = v16;
    MAFilterMatrix3IOMFBNormalize(v8, &v25);
    float64x2_t v4 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v3 * 0.0), 0);
    float64x2_t v26 = vmlaq_n_f64(v4, v26, 1.0 - v3);
    double v25 = v3 + v25 * (1.0 - v3);
    double v27 = v3 * 0.0 + v27 * (1.0 - v3);
    double v28 = v3 + v28 * (1.0 - v3);
    float64x2_t v29 = vmlaq_n_f64(v4, v29, 1.0 - v3);
    double v30 = v3 * 0.0 + v30 * (1.0 - v3);
    double v31 = v3 + v31 * (1.0 - v3);
    uint64_t v5 = _MADisplayFilterCreateWithPostOffset((uint64_t)&v25, 0.0, 0.0, 0.0);
    if (v5)
    {
      double v6 = 0.3;
      double v7 = v2 * 0.7 + 0.3;
      if (v7 < 0.3) {
        double v7 = 0.3;
      }
      if (v7 <= 1.0) {
        double v6 = v7;
      }
      *(double *)(v5 + 144) = v6;
    }
    MADisplayFilterNormalize(v5);
  }
}

double MADisplayFilterNormalize(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 96);
  long long v10 = *(_OWORD *)(a1 + 16);
  uint64_t v11 = v2;
  long long v12 = *(_OWORD *)(a1 + 48);
  uint64_t v13 = v3;
  long long v14 = *(_OWORD *)(a1 + 80);
  uint64_t v15 = v4;
  MAFilterMatrix3IOMFBNormalize((uint64_t *)&v10, &v16);
  double result = v17;
  uint64_t v6 = v19;
  uint64_t v7 = v21;
  long long v8 = v18;
  long long v9 = v20;
  *(_OWORD *)(a1 + 16) = v16;
  *(double *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v8;
  *(void *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 80) = v9;
  *(void *)(a1 + 96) = v7;
  return result;
}

double MAFilterMatrix3Multiply@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *a2;
  double v4 = a2[1];
  double v6 = a1[2];
  double v5 = a1[3];
  double v7 = a1[1];
  double v8 = a2[2];
  double v9 = a2[3];
  double v10 = a1[6];
  double v11 = a1[7];
  double v12 = v5 * v4 + *a1 * *a2 + v10 * v8;
  double v13 = a2[4];
  double v14 = a2[5];
  double v15 = v5 * v13 + *a1 * v9 + v10 * v14;
  double v16 = a2[6];
  double v17 = a2[7];
  double v18 = a2[8];
  double v19 = v5 * v17 + *a1 * v16 + v10 * v18;
  double v20 = a1[4];
  double v21 = a1[5];
  double v22 = v4 * v20 + v7 * *a2 + v11 * v8;
  *a3 = v12;
  a3[1] = v22;
  a3[6] = v19;
  a3[7] = v17 * v20 + v7 * v16 + v11 * v18;
  double v23 = v4 * v21 + v6 * v3;
  double v24 = a1[8];
  a3[2] = v23 + v24 * v8;
  a3[3] = v15;
  a3[4] = v13 * v20 + v7 * v9 + v11 * v14;
  a3[5] = v13 * v21 + v6 * v9 + v24 * v14;
  double result = v17 * v21 + v6 * v16 + v24 * v18;
  a3[8] = result;
  return result;
}

uint64_t *MAFilterMatrix3IOMFBNormalize@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = 0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *result;
  uint64_t v4 = result[1];
  uint64_t v19 = *result;
  uint64_t v20 = v4;
  uint64_t v5 = result[2];
  uint64_t v6 = result[3];
  uint64_t v21 = v5;
  uint64_t v22 = v6;
  uint64_t v7 = result[4];
  uint64_t v8 = result[5];
  uint64_t v23 = v7;
  uint64_t v24 = v8;
  uint64_t v9 = result[6];
  uint64_t v10 = result[7];
  uint64_t v25 = v9;
  uint64_t v26 = v10;
  uint64_t v11 = result[8];
  uint64_t v27 = v11;
  double v12 = 0.0;
  double v13 = &v19;
  do
  {
    uint64_t v14 = 0;
    double v15 = 0.0;
    do
      double v15 = v15 + *(double *)&v13[v14++];
    while (v14 != 3);
    if (v15 > v12) {
      double v12 = v15;
    }
    ++v2;
    v13 += 3;
  }
  while (v2 != 3);
  if (v12 < 1.0)
  {
    uint64_t v16 = 0;
    double v17 = &v19;
    do
    {
      for (uint64_t i = 0; i != 3; ++i)
        *(double *)&v17[i] = 1.0 / v12 * *(double *)&v17[i];
      ++v16;
      v17 += 3;
    }
    while (v16 != 3);
    uint64_t v3 = v19;
    uint64_t v4 = v20;
    uint64_t v5 = v21;
    uint64_t v6 = v22;
    uint64_t v7 = v23;
    uint64_t v8 = v24;
    uint64_t v9 = v25;
    uint64_t v10 = v26;
    uint64_t v11 = v27;
  }
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  a2[4] = v7;
  a2[5] = v8;
  a2[6] = v9;
  a2[7] = v10;
  a2[8] = v11;
  return result;
}

float64x2_t MADisplayFilterCreateSaturation(double a1)
{
  uint64_t Grayscale = MADisplayFilterCreateGrayscale(1.0);
  double v3 = (1.0 - a1) * *(double *)(Grayscale + 48);
  double v4 = a1 + (1.0 - a1) * *(double *)(Grayscale + 56);
  double v5 = (1.0 - a1) * *(double *)(Grayscale + 64);
  double v6 = a1 + (1.0 - a1) * *(double *)(Grayscale + 96);
  *(double *)(Grayscale + 16) = a1 + (1.0 - a1) * *(double *)(Grayscale + 16);
  *(float64x2_t *)(Grayscale + 24) = vmulq_n_f64(*(float64x2_t *)(Grayscale + 24), 1.0 - a1);
  *(double *)(Grayscale + 48) = v3;
  *(double *)(Grayscale + 56) = v4;
  *(double *)(Grayscale + 64) = v5;
  float64x2_t result = vmulq_n_f64(*(float64x2_t *)(Grayscale + 80), 1.0 - a1);
  *(float64x2_t *)(Grayscale + 80) = result;
  *(double *)(Grayscale + 96) = v6;
  return result;
}

void *MADisplayFilterInversionCompensationForNightShift()
{
  v1[0] = 0x3FF0000000000000;
  memset(&v1[1], 0, 24);
  v1[4] = 0x3FF0000000000000;
  memset(&v1[5], 0, 24);
  v1[8] = 0x3FF0000000000000;
  float64x2_t result = (void *)_MADisplayFilterCreateWithPostOffset((uint64_t)v1, 0.0, 0.0, 0.0);
  result[2] = 0x3FE6666666666666;
  result[7] = 0x3FF0000000000000;
  result[12] = 0x4000000000000000;
  return result;
}

uint64_t MADisplayFilterCreateTwoColor(double a1, double a2, double a3, double a4, double a5, double a6)
{
  v7[0] = (a4 - a1) * 0.33333333;
  v7[1] = v7[0];
  v7[2] = v7[0];
  double v8 = (a5 - a2) * 0.33333333;
  double v9 = v8;
  double v10 = v8;
  double v11 = (a6 - a3) * 0.33333333;
  double v12 = v11;
  double v13 = v11;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v7, a1, a2, a3);
}

uint64_t _MADisplayFilterCreateWithPostOffset(uint64_t a1, double a2, double a3, double a4)
{
  if ((__MADisplayFilterInitialized & 1) == 0) {
    __MADisplayFilterInitialize();
  }
  uint64_t result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_OWORD *)(result + 112) = 0u;
    *(_OWORD *)(result + 128) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 96) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 64);
    long long v12 = *(_OWORD *)(a1 + 24);
    long long v13 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(result + 16) = *(_OWORD *)a1;
    *(_OWORD *)(result + 48) = v12;
    *(_OWORD *)(result + 80) = v13;
    *(void *)(result + 32) = v9;
    *(double *)(result + 40) = a2;
    *(void *)(result + 64) = v10;
    *(double *)(result + 72) = a3;
    *(void *)(result + 96) = v11;
    *(double *)(result + 104) = a4;
    *(void *)(result + 152) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(result + 136) = _Q0;
  }
  return result;
}

uint64_t MADisplayFilterCreateYellowBlue()
{
  v1[0] = vdupq_n_s64(0xBFD5555551C112DALL);
  v1[1] = v1[0];
  v1[2] = v1[0];
  v1[3] = vdupq_n_s64(0x3FD5555551C112DAuLL);
  uint64_t v2 = 0x3FD5555551C112DALL;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v1, 1.0, 1.0, 0.0);
}

uint64_t MADisplayFilterCreateYellowBlack()
{
  v1[0] = vdupq_n_s64(0xBFD5555551C112DALL);
  v1[1] = v1[0];
  v1[2] = v1[0];
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)v1, 1.0, 1.0, 0.0);
}

uint64_t MADisplayFilterCreateRedBlack()
{
  int64x2_t v1 = vdupq_n_s64(0xBFD5555551C112DALL);
  unint64_t v2 = 0xBFD5555551C112DALL;
  long long v3 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  return _MADisplayFilterCreateWithPostOffset((uint64_t)&v1, 1.0, 0.0, 0.0);
}

double MADisplayFilterCreateInterpolated(float64x2_t *a1, float64x2_t *a2, double a3)
{
  v16[0] = 0x3FF0000000000000;
  memset(&v16[1], 0, 24);
  v16[4] = 0x3FF0000000000000;
  memset(&v16[5], 0, 24);
  v16[8] = 0x3FF0000000000000;
  uint64_t v5 = _MADisplayFilterCreateWithPostOffset((uint64_t)v16, 0.0, 0.0, 0.0);
  if (a1)
  {
    if (a2)
    {
      double result = 1.0 - a3;
      float64x2_t v7 = vmlaq_n_f64(vmulq_n_f64(a2[2], a3), a1[2], 1.0 - a3);
      float64x2_t v8 = vmlaq_n_f64(vmulq_n_f64(a2[3], a3), a1[3], 1.0 - a3);
      float64x2_t v9 = vmlaq_n_f64(vmulq_n_f64(a2[4], a3), a1[4], 1.0 - a3);
      float64x2_t v10 = vmlaq_n_f64(vmulq_n_f64(a2[5], a3), a1[5], 1.0 - a3);
      float64x2_t v11 = vmlaq_n_f64(vmulq_n_f64(a2[6], a3), a1[6], 1.0 - a3);
      float64x2_t v12 = vmlaq_n_f64(vmulq_n_f64(a2[7], a3), a1[7], 1.0 - a3);
      float64x2_t v13 = vmlaq_n_f64(vmulq_n_f64(a2[8], a3), a1[8], 1.0 - a3);
      float64x2_t v14 = vmlaq_n_f64(vmulq_n_f64(a2[9], a3), a1[9], 1.0 - a3);
      *(float64x2_t *)(v5 + 16) = vmlaq_n_f64(vmulq_n_f64(a2[1], a3), a1[1], 1.0 - a3);
      *(float64x2_t *)(v5 + 32) = v7;
      *(float64x2_t *)(v5 + 48) = v8;
      *(float64x2_t *)(v5 + 64) = v9;
      *(float64x2_t *)(v5 + 80) = v10;
      *(float64x2_t *)(v5 + 96) = v11;
      *(float64x2_t *)(v5 + 112) = v12;
      *(float64x2_t *)(v5 + 128) = v13;
      *(float64x2_t *)(v5 + 144) = v14;
    }
  }
  return result;
}

uint64_t MADisplayFilterCanUseGamutRemap()
{
  unsigned int Type = _MADisplayFilterGetType();
  if ((Type & 2) != 0) {
    return 1;
  }
  else {
    return (Type >> 2) & 1;
  }
}

uint64_t MADisplayFilterGetGamutRemapLeafNodeCount()
{
  return 79;
}

uint64_t MADisplayFilterGetGamutRemapNonLeafNodeCount()
{
  return 78;
}

CFDataRef MADisplayFilterCopyGamutRemapXYZtoYuvCoeffs()
{
  return CFDataCreateWithBytesNoCopy(0, XYZtoYuvCoeffs, 48, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
}

CFDataRef MADisplayFilterCopyGamutRemapYuvtoXYZCoeffs()
{
  return CFDataCreateWithBytesNoCopy(0, YuvtoXYZCoeffs, 48, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodeConfigForFilter(uint64_t a1)
{
  return CFDataCreateWithBytesNoCopy(0, &LorikeetNonleafNodes[624 * a1], 624, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodeConfig()
{
  uint64_t v0 = &LorikeetNonleafNodes[624 * (((unint64_t)_MADisplayFilterGetType() >> 2) & 1)];
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];

  return CFDataCreateWithBytesNoCopy(0, v0, 624, v1);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodesForFilter(uint64_t a1)
{
  return CFDataCreateWithBytesNoCopy(0, &LorikeetNonleafHyperplanes[1248 * a1], 1248, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
}

CFDataRef MADisplayFilterCopyGamutRemapNonLeafNodes()
{
  uint64_t v0 = &LorikeetNonleafHyperplanes[1248 * (((unint64_t)_MADisplayFilterGetType() >> 2) & 1)];
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];

  return CFDataCreateWithBytesNoCopy(0, v0, 1248, v1);
}

CFMutableDataRef MADisplayFilterCopyGamutRemapLeafNodesForFilter(uint64_t a1, __n128 a2)
{
  __n128 v58 = a2;
  __C[16] = *(double *)MEMORY[0x1E4F143B8];
  CFMutableArrayRef Mutable = CFDataCreateMutable(0, 3792);
  CFMutableDataRef v57 = Mutable;
  uint64_t v4 = 0;
  uint64_t v5 = (char *)&LorikeetLeafNodes[560 * a1 + 1];
  uint64_t v56 = a1;
  __asm { FMOV            V5.2D, #1.0 }
  v55[1] = vdupq_lane_s64(v58.n128_i64[0], 0);
  v55[0] = _Q5;
  do
  {
    double v59 = v55;
    if (LorikeetLeafNodes[560 * v56 + 7 * v4] == 2) {
      unint64_t v11 = 6;
    }
    else {
      unint64_t v11 = 4;
    }
    uint64_t v12 = MEMORY[0x1F4188790](Mutable, 24);
    uint64_t v14 = MEMORY[0x1F4188790](v12, v13);
    uint64_t v19 = (double *)&v55[1] - v18;
    uint64_t v21 = (double *)(v20 + 16);
    uint64_t v22 = (unsigned __int16 *)v5;
    unint64_t v23 = v11;
    do
    {
      unsigned int v24 = *v22++;
      uint64_t v25 = (float32x2_t *)((char *)&LorikeetLeafNodePoints + 564 * a1 + 12 * v24);
      float64x2_t v26 = vcvtq_f64_f32(*v25);
      *((float64x2_t *)v21 - 1) = v26;
      double v27 = v25[1].f32[0];
      *uint64_t v21 = v27;
      v21 += 3;
      uint64_t v28 = (float32x2_t *)((char *)&LorikeetLeafNodeTargets + 564 * a1 + 12 * v24);
      *((float64x2_t *)v19 - 1) = vmlaq_f64(v26, v17, vsubq_f64(vcvtq_f64_f32(*v28), v26));
      *uint64_t v19 = v27 + (v28[1].f32[0] - v27) * v16;
      v19 += 3;
      --v23;
    }
    while (v23);
    MEMORY[0x1F4188790](v14, v15);
    double v33 = (char *)v55 - 8 * v32;
    uint64_t v34 = 0;
    do
    {
      float64x2x3_t v62 = vld3q_f64(v30);
      v30 += 6;
      *(float64x2_t *)&v33[v34] = v62.val[0];
      *(float64x2_t *)&v33[8 * v11 + v34] = v62.val[1];
      *(float64x2_t *)&v33[16 * v11 + v34] = v62.val[2];
      *(_OWORD *)&v33[v11 * (unint64_t)v29 + v34] = v31;
      v34 += 16;
    }
    while (8 * v11 != v34);
    uint64_t v35 = MEMORY[0x1F4188790](v33, v29);
    double v41 = (const double *)((char *)v55 - v40);
    unint64_t v42 = 0;
    double v43 = (char *)&v55[v11 / 2] - v40;
    double v44 = (char *)v55 + v11 * (unint64_t)v36 - v40;
    double v45 = (char *)&v55[v11] - v40;
    do
    {
      float64x2x3_t v63 = vld3q_f64(v37);
      v37 += 6;
      *(float64x2_t *)&v41[v42 / 8] = v63.val[0];
      *(float64x2_t *)&v43[v42] = v63.val[1];
      *(float64x2_t *)&v45[v42] = v63.val[2];
      *(_OWORD *)&v44[v42] = v39;
      v42 += 16;
    }
    while (v38 != v42);
    double v46 = (double *)MEMORY[0x1F4188790](v35, v36);
    __B = (const double *)((char *)v55 - v47);
    pinv(v46, v11, (double *)((char *)v55 - v47), v49);
    double v50 = __C;
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, 4, 4, v11, 1.0, v41, v11, __B, 4, 0.0, __C, 4);
    for (uint64_t i = 0; i != 48; i += 16)
    {
      float64x2_t v53 = *(float64x2_t *)v50;
      float64x2_t v52 = *(float64x2_t *)(v50 + 2);
      v50 += 4;
      *(float32x4_t *)&bytes[i] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v53), v52);
    }
    CFDataAppendBytes(v57, bytes, 48);
    ++v4;
    v5 += 14;
  }
  while (v4 != 79);
  return v57;
}

void pinv(double *a1, int a2, double *a3, double *a4)
{
  uint64_t v18 = a3;
  __s[4] = *(__CLPK_doublereal *)MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790]();
  float64x2_t v7 = (__CLPK_doublereal *)((char *)&v18 - v6);
  char __jobz = 65;
  __CLPK_integer __lda = v8;
  __CLPK_integer __n = 4;
  __CLPK_integer __ldu = v8;
  __work = (__CLPK_doublereal *)malloc_type_malloc(0x10uLL, 0x100004000313F17uLL);
  __CLPK_integer v20 = -1;
  __iwork = (__CLPK_integer *)malloc_type_malloc(0x80uLL, 0xCF8FD928uLL);
  __CLPK_integer v19 = 0;
  dgesdd_(&__jobz, &__ldu, &__n, a1, &__lda, __s, v7, &__ldu, __vt, &__n, __work, &v20, __iwork, &v19);
  int v11 = (int)*__work;
  __CLPK_integer v20 = v11;
  free(__work);
  uint64_t v12 = (__CLPK_doublereal *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
  dgesdd_(&__jobz, &__ldu, &__n, a1, &__lda, __s, v7, &__ldu, __vt, &__n, v12, &v20, __iwork, &v19);
  free(v12);
  free(__iwork);
  MEMORY[0x1F4188790]();
  uint64_t v13 = &(&v18)[-(4 * a2)];
  bzero(v13, 8 * (4 * a2));
  if (a2 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = __s;
    do
    {
      if (fabs(*v15) > 1.0e-14) {
        *(double *)&v13[v14] = 1.0 / *v15;
      }
      v14 += 5;
      ++v15;
    }
    while (5 * a2 != v14);
  }
  MEMORY[0x1F4188790]();
  float64x2_t v17 = (char *)&v18 - ((v16 + 15) & 0xFFFFFFFF0);
  bzero(v17, 8 * (4 * a2));
  cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasTrans, a2, 4, 4, 1.0, (const double *)v13, 4, __vt, 4, 0.0, (double *)v17, 4);
  cblas_dgemm(CblasRowMajor, CblasTrans, CblasNoTrans, a2, 4, a2, 1.0, v7, a2, (const double *)v17, 4, 0.0, v18, 4);
}

CFMutableDataRef MADisplayFilterCopyGamutRemapLeafNodes()
{
  if ((_MADisplayFilterGetType() & 4) != 0) {
    MADisplayFilterPrefGetGreenColorCorrectionIntensity();
  }
  else {
    MADisplayFilterPrefGetRedColorCorrectionIntensity();
  }
  unint64_t v1 = v0;
  unint64_t v2 = ((unint64_t)_MADisplayFilterGetType() >> 2) & 1;
  v3.n128_u64[0] = v1;

  return MADisplayFilterCopyGamutRemapLeafNodesForFilter(v2, v3);
}

BOOL __MADisplayFilterEqual(double *cf, double *a2)
{
  if ((__MADisplayFilterInitialized & 1) == 0) {
    __MADisplayFilterInitialize();
  }
  uint64_t v4 = __kMADisplayFilterTypeID;
  return (!cf || a2)
      && (cf || !a2)
      && (cf == a2
       || v4 == CFGetTypeID(cf)
       && v4 == CFGetTypeID(a2)
       && MAUtilitiesDoubleAlmostEqual(cf[2], a2[2])
       && MAUtilitiesDoubleAlmostEqual(cf[3], a2[3])
       && MAUtilitiesDoubleAlmostEqual(cf[4], a2[4])
       && MAUtilitiesDoubleAlmostEqual(cf[5], a2[5])
       && MAUtilitiesDoubleAlmostEqual(cf[6], a2[6])
       && MAUtilitiesDoubleAlmostEqual(cf[7], a2[7])
       && MAUtilitiesDoubleAlmostEqual(cf[8], a2[8])
       && MAUtilitiesDoubleAlmostEqual(cf[9], a2[9])
       && MAUtilitiesDoubleAlmostEqual(cf[10], a2[10])
       && MAUtilitiesDoubleAlmostEqual(cf[11], a2[11])
       && MAUtilitiesDoubleAlmostEqual(cf[12], a2[12])
       && MAUtilitiesDoubleAlmostEqual(cf[13], a2[13])
       && MAUtilitiesDoubleAlmostEqual(cf[14], a2[14])
       && MAUtilitiesDoubleAlmostEqual(cf[15], a2[15])
       && MAUtilitiesDoubleAlmostEqual(cf[16], a2[16])
       && MAUtilitiesDoubleAlmostEqual(cf[17], a2[17])
       && MAUtilitiesDoubleAlmostEqual(cf[18], a2[18])
       && MAUtilitiesDoubleAlmostEqual(cf[19], a2[19]));
}

unint64_t __MADisplayFilterHash(double *a1)
{
  return (unint64_t)(a1[2]
                          + a1[3]
                          + a1[4]
                          + a1[5]
                          + a1[6]
                          + a1[7]
                          + a1[8]
                          + a1[9]
                          + a1[10]
                          + a1[11]
                          + a1[12]
                          + a1[13]
                          + a1[14]
                          + a1[15]
                          + a1[16]
                          + a1[17]
                          + a1[18]
                          + a1[19]);
}

CFStringRef __MADisplayFilterCopyDescription(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<MADisplayFilter %p>\n[ [%0.2f, %0.2f, %0.2f, %0.2f]\n  [%0.2f, %0.2f, %0.2f, %0.2f]\n  [%0.2f, %0.2f, %0.2f, %0.2f]\n  [%0.2f, %0.2f, %0.2f, %0.2f] ]", a1, *((void *)a1 + 2), *((void *)a1 + 3), *((void *)a1 + 4), *((void *)a1 + 5), *((void *)a1 + 6), *((void *)a1 + 7), *((void *)a1 + 8), *((void *)a1 + 9), *((void *)a1 + 10), *((void *)a1 + 11), *((void *)a1 + 12), *((void *)a1 + 13), *((void *)a1 + 14), *((void *)a1 + 15), *((void *)a1 + 16),
           *((void *)a1 + 17));
}

void MAPreferencesPostChangeNotification(const __CFString *a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, 0, 0, 1u);
  }
}

void MAPreferencesPostChangeNotificationIfNeeded(unint64_t a1, unint64_t a2, const __CFString *a3)
{
  if (a1 && a2)
  {
    if (CFEqual((CFTypeRef)a1, (CFTypeRef)a2)) {
      return;
    }
  }
  else if (!(a1 | a2))
  {
    return;
  }

  MAPreferencesPostChangeNotification(a3);
}

void _settingsChangedNotificationHandler(uint64_t a1, uint64_t a2, const void *a3)
{
  if (_MADomainOverride) {
    CFStringRef v4 = (const __CFString *)_MADomainOverride;
  }
  else {
    CFStringRef v4 = @"com.apple.mediaaccessibility";
  }
  CFPreferencesAppSynchronize(v4);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  if (CFEqual(a3, @"com.apple.mediaaccessibility.captionAppearanceSettingsChanged"))
  {
    uint64_t v6 = &kMACaptionAppearanceSettingsChangedNotification;
  }
  else
  {
    if (!CFEqual(a3, @"com.apple.mediaaccessibility.audibleMediaSettingsChanged")) {
      return;
    }
    uint64_t v6 = &kMAAudibleMediaSettingsChangedNotification;
  }
  CFStringRef v7 = *v6;

  CFNotificationCenterPostNotification(LocalCenter, v7, 0, 0, 1u);
}

__CFDictionary *MAPreferencesCopyMultipleProfiles(const __CFArray *a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFIndex Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0; i != v4; ++i)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, i);
      CFStringRef v7 = ValueAtIndex;
      if (_MADomainOverride) {
        CFStringRef v8 = (const __CFString *)_MADomainOverride;
      }
      else {
        CFStringRef v8 = @"com.apple.mediaaccessibility";
      }
      CFPropertyListRef v9 = CFPreferencesCopyAppValue(ValueAtIndex, v8);
      if (v9)
      {
        float64x2_t v10 = v9;
        CFDictionarySetValue(Mutable, v7, v9);
        CFRelease(v10);
      }
    }
  }
  return Mutable;
}

void MAPreferencesSetMultipleProfiles(const __CFDictionary *a1)
{
  int64_t Count = CFDictionaryGetCount(a1);
  if (Count >= 1)
  {
    size_t v3 = Count;
    CFIndex v4 = (const void **)malloc_type_calloc(8uLL, Count, 0xB9A00BFCuLL);
    uint64_t v5 = (const void **)malloc_type_calloc(8uLL, v3, 0x4C02D5AFuLL);
    CFDictionaryGetKeysAndValues(a1, v4, v5);
    for (uint64_t i = 0; i != v3; ++i)
    {
      CFStringRef v7 = v5[i];
      CFStringRef v8 = (const __CFString *)v4[i];
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9)
      {
        if (_MADomainOverride) {
          CFStringRef v10 = (const __CFString *)_MADomainOverride;
        }
        else {
          CFStringRef v10 = @"com.apple.mediaaccessibility";
        }
        CFPreferencesSetAppValue(v8, v7, v10);
      }
    }
    free(v4);
    free(v5);
  }
}

void MAPreferencesRemoveProfile(__CFString *a1)
{
  if (a1) {
    _preferencesSetValue(a1, 0);
  }
}

__CFArray *MAPreferencesCopyProfileIDs(const __CFString *a1)
{
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  CFDictionaryRef v3 = (const __CFDictionary *)_preferencesDefaults();
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFIndex Count = CFDictionaryGetCount(v3);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFStringRef v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v4, v7, 0);
      for (uint64_t i = 0; i != v6; ++i)
      {
        v23.length = CFArrayGetCount(Mutable);
        v23.location = 0;
        if (!CFArrayContainsValue(Mutable, v23, v7[i])) {
          CFArrayAppendValue(Mutable, v7[i]);
        }
      }
      free(v7);
    }
  }
  CFDictionaryRef v9 = (const __CFDictionary *)_CFPrefsCopyAppDictionaryWithContainer();
  if (v9)
  {
    CFDictionaryRef v10 = v9;
    int64_t v11 = CFDictionaryGetCount(v9);
    if (v11 >= 1)
    {
      int64_t v12 = v11;
      uint64_t v13 = (const void **)malloc_type_calloc(8uLL, v11, 0x4ABDB0B2uLL);
      CFDictionaryGetKeysAndValues(v10, v13, 0);
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v15 = v13[j];
        if (v15)
        {
          v24.length = CFArrayGetCount(Mutable);
          v24.location = 0;
          if (!CFArrayContainsValue(Mutable, v24, v15)) {
            CFArrayAppendValue(Mutable, v15);
          }
        }
      }
      free(v13);
    }
    CFRelease(v10);
  }
  if (!Mutable) {
    return 0;
  }
  if (a1)
  {
    uint64_t v16 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFIndex v17 = CFArrayGetCount(Mutable);
    if (v17 >= 1)
    {
      CFIndex v18 = v17;
      for (CFIndex k = 0; k != v18; ++k)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Mutable, k);
        CFTypeID v21 = CFGetTypeID(ValueAtIndex);
        if (v21 == CFStringGetTypeID() && CFStringHasPrefix(ValueAtIndex, a1)) {
          CFArrayAppendValue(v16, ValueAtIndex);
        }
      }
    }
  }
  else
  {
    uint64_t v16 = (__CFArray *)CFRetain(Mutable);
  }
  CFRelease(Mutable);
  return v16;
}

void MAPreferencesSetProfileValue(__CFString *theString, __CFString *a2, const void *a3)
{
  if (a2)
  {
    if (theString && CFStringGetLength(theString))
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      CFDictionaryRef v7 = (const __CFDictionary *)MAPreferencesCopyProfileValueWithExpectedType(0, theString, TypeID);
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        MutableCFArrayRef Copy = CFDictionaryCreateMutableCopy(0, 0, v7);
        CFRelease(v8);
        if (!MutableCopy) {
          return;
        }
      }
      else
      {
        MutableCFArrayRef Copy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (!MutableCopy) {
          return;
        }
      }
      if (a3) {
        CFDictionarySetValue(MutableCopy, a2, a3);
      }
      else {
        CFDictionaryRemoveValue(MutableCopy, a2);
      }
      _preferencesSetValue(theString, MutableCopy);
      CFRelease(MutableCopy);
    }
    else
    {
      _preferencesSetValue(a2, a3);
    }
  }
}

void _preferencesSetValue(__CFString *a1, const void *a2)
{
  if (_preferenceAccessRequiresXPC(a1))
  {
    CFDictionaryRef v4 = _copyResultPreferenceXPCCall(a1, 1, a2);
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    if (_MADomainOverride) {
      CFStringRef v5 = (const __CFString *)_MADomainOverride;
    }
    else {
      CFStringRef v5 = @"com.apple.mediaaccessibility";
    }
    CFPreferencesSetAppValue(a1, a2, v5);
    if (_MADomainOverride) {
      CFStringRef v6 = (const __CFString *)_MADomainOverride;
    }
    else {
      CFStringRef v6 = @"com.apple.mediaaccessibility";
    }
    CFPreferencesAppSynchronize(v6);
  }
}

void MAPreferencesSetProfileColor(__CFString *theString, __CFString *a2, CGColor *a3)
{
  if (a3)
  {
    double v21 = 0.0;
    double v22 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    if (!MAUtilitiesRGBValuesForColor(a3, &v22, &v21, &v20, &v19)) {
      return;
    }
    CFArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    float v6 = v22;
    float v7 = v20;
    float v17 = v7;
    float valuePtr = v6;
    float v8 = v21;
    float v9 = v19;
    float v15 = v9;
    float v16 = v8;
    CFNumberRef v10 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberFloatType, &v17);
    CFNumberRef v12 = CFNumberCreate(0, kCFNumberFloatType, &v16);
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberFloatType, &v15);
    CFNumberRef v14 = v13;
    if (v10 && v12 && v11 && v13)
    {
      CFDictionarySetValue(Mutable, @"Red", v10);
      CFDictionarySetValue(Mutable, @"Blue", v11);
      CFDictionarySetValue(Mutable, @"Green", v12);
      CFDictionarySetValue(Mutable, @"Alpha", v14);
      MAPreferencesSetProfileValue(theString, a2, Mutable);
    }
    else if (!v10)
    {
LABEL_13:
      if (v12) {
        CFRelease(v12);
      }
      if (v11) {
        CFRelease(v11);
      }
      if (v14) {
        CFRelease(v14);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      return;
    }
    CFRelease(v10);
    goto LABEL_13;
  }

  MAPreferencesSetProfileValue(theString, a2, 0);
}

CFStringRef MAPreferencesCopyProfileFont(const __CFString *a1, __CFString *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef result = (const __CFString *)MAPreferencesCopyProfileValueWithExpectedType(a1, a2, TypeID);
  if (result)
  {
    CFStringRef v6 = result;
    CGFontRef CGFontWithName = MAUtilitiesCreateCGFontWithName(result);
    CFRelease(v6);
    return (const __CFString *)CGFontWithName;
  }
  return result;
}

void MAPreferencesSetProfileFont(__CFString *theString, __CFString *a2, CGFontRef font)
{
  if (font)
  {
    CFStringRef v5 = CGFontCopyPostScriptName(font);
    if (v5)
    {
      CFStringRef v6 = v5;
      MAPreferencesSetProfileValue(theString, a2, v5);
      CFRelease(v6);
    }
  }
  else
  {
    MAPreferencesSetProfileValue(theString, a2, 0);
  }
}

void MAPreferencesSetProfileFontDescriptor(__CFString *theString, __CFString *a2, const __CTFontDescriptor *a3)
{
  if (a3)
  {
    PostScriptNameFromFontDescriptor = MAUtilitiesCreatePostScriptNameFromFontDescriptor(a3);
    if (PostScriptNameFromFontDescriptor)
    {
      CFStringRef v6 = PostScriptNameFromFontDescriptor;
      MAPreferencesSetProfileValue(theString, a2, PostScriptNameFromFontDescriptor);
      CFRelease(v6);
    }
  }
  else
  {
    MAPreferencesSetProfileValue(theString, a2, 0);
  }
}

void MAPreferencesSetValue(__CFString *a1, const void *a2)
{
  if (a1) {
    _preferencesSetValue(a1, a2);
  }
}

void MAPreferencesSetColor(__CFString *a1, CGColor *a2)
{
}

void MASetCaptionCallStatus(int a1)
{
  if (_xpcConnection_onceToken != -1) {
    dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_44);
  }
  CFAllocatorRef v2 = (_xpc_connection_s *)_xpcConnection__XpcConnection;
  if (_xpcConnection__XpcConnection)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "getOrSet", "set");
    xpc_dictionary_set_BOOL(v3, "preferenceValue", a1 != 0);
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v4, "callStatus", v3);
    xpc_connection_send_message(v2, v4);
    if (v3) {
      CFRelease(v3);
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v5) {
      MASetCaptionCallStatus_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

BOOL MAGetCaptionCallStatus()
{
  if (_xpcConnection_onceToken != -1) {
    dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_44);
  }
  unint64_t v0 = (_xpc_connection_s *)_xpcConnection__XpcConnection;
  if (_xpcConnection__XpcConnection)
  {
    xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v1, "getOrSet", "get");
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v2, "callStatus", v1);
    xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v0, v2);
    xpc_object_t v4 = v3;
    if (v3 == (xpc_object_t)MEMORY[0x1E4F14528])
    {
      BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v14) {
        MAGetCaptionCallStatus_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      if (v3 != (xpc_object_t)MEMORY[0x1E4F14520])
      {
        if (MEMORY[0x1BA9EF7D0](v3) == MEMORY[0x1E4F14590])
        {
          BOOL v5 = xpc_dictionary_get_BOOL(v4, "result");
          if (!v4) {
            goto LABEL_18;
          }
        }
        else
        {
          BOOL v5 = 0;
          if (!v4) {
            goto LABEL_18;
          }
        }
LABEL_17:
        CFRelease(v4);
LABEL_18:
        if (v1) {
          CFRelease(v1);
        }
        if (v2) {
          CFRelease(v2);
        }
        return v5;
      }
      BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v22) {
        MAGetCaptionCallStatus_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    BOOL v5 = 0;
    goto LABEL_17;
  }
  BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v6) {
    MAGetCaptionCallStatus_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return 0;
}

void MAMacBuddySettingsToTransfer(const __CFDictionary *a1)
{
  if (a1)
  {
    CFBooleanRef v2 = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
    if (v2)
    {
      CFBooleanRef v3 = v2;
      if (CFBooleanGetValue(v2))
      {
        if (_MADomainOverride) {
          xpc_object_t v4 = (__CFString *)_MADomainOverride;
        }
        else {
          xpc_object_t v4 = @"com.apple.mediaaccessibility";
        }
        int Value = (__CFDictionary *)CFDictionaryGetValue(a1, v4);
        if (Value)
        {
          CFMutableDictionaryRef Mutable = Value;
          CFRetain(Value);
        }
        else
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          if (_MADomainOverride) {
            uint64_t v7 = (__CFString *)_MADomainOverride;
          }
          else {
            uint64_t v7 = @"com.apple.mediaaccessibility";
          }
          CFDictionarySetValue(a1, v7, Mutable);
        }
        MACaptionAppearanceMacBuddySettingsToTransfer(Mutable);
        CFRelease(Mutable);
      }
      CFRelease(v3);
    }
  }
}

void MAPreferencesSetDomainOverride(const __CFString *a1)
{
  xpc_object_t v1 = (const void *)_MADomainOverride;
  if (a1)
  {
    MutableCFArrayRef Copy = CFStringCreateMutableCopy(0, 0, @"com.apple.mediaaccessibility");
    CFStringAppend(MutableCopy, @"-");
    CFStringAppend(MutableCopy, a1);
  }
  else
  {
    MutableCFArrayRef Copy = 0;
  }
  _MADomainOverride = (uint64_t)MutableCopy;
  if (v1)
  {
    CFRelease(v1);
  }
}

void ___copyResultPreferenceXPCCall_block_invoke_2(uint64_t a1)
{
  xpc_object_t v1 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t MAUtilitiesFontsUseSamePostScriptName(const __CTFontDescriptor *a1, const __CTFontDescriptor *a2)
{
  unint64_t PostScriptNameFromFontDescriptor = (unint64_t)MAUtilitiesCreatePostScriptNameFromFontDescriptor(a1);
  unint64_t v4 = (unint64_t)MAUtilitiesCreatePostScriptNameFromFontDescriptor(a2);
  if (!(PostScriptNameFromFontDescriptor | v4)) {
    return 1;
  }
  BOOL v6 = (const void *)v4;
  if (PostScriptNameFromFontDescriptor && v4)
  {
    uint64_t v7 = CFEqual((CFTypeRef)PostScriptNameFromFontDescriptor, (CFTypeRef)v4);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    if (!PostScriptNameFromFontDescriptor) {
      goto LABEL_8;
    }
  }
  CFRelease((CFTypeRef)PostScriptNameFromFontDescriptor);
  uint64_t v5 = v7;
LABEL_8:
  if (v6) {
    CFRelease(v6);
  }
  return v5;
}

const void *MAUtilitiesCreatePostScriptNameFromFontDescriptor(const __CTFontDescriptor *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeRef v1 = CTFontDescriptorCopyAttribute(a1, (CFStringRef)*MEMORY[0x1E4F245A8]);
  CFBooleanRef v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 != CFStringGetTypeID())
    {
      CFRelease(v2);
      return 0;
    }
  }
  return v2;
}

uint64_t MAUtilitiesFontSupportsLanguage(const __CTFontDescriptor *a1, const __CFString *a2)
{
  if (!a2) {
    return 1;
  }
  if (!a1) {
    return 0;
  }
  CFArrayRef OrderedCanonicalLanguageIdentifiersFromString = MAUtilitiesCreateOrderedCanonicalLanguageIdentifiersFromString(a2);
  if (!OrderedCanonicalLanguageIdentifiersFromString) {
    return 0;
  }
  unint64_t v4 = OrderedCanonicalLanguageIdentifiersFromString;
  CFIndex Count = CFArrayGetCount(OrderedCanonicalLanguageIdentifiersFromString);
  if (!Count)
  {
    CFRelease(v4);
    return 0;
  }
  uint64_t v6 = Count;
  CFArrayRef v7 = (const __CFArray *)CTFontDescriptorCopyAttribute(a1, (CFStringRef)*MEMORY[0x1E4F24588]);
  if (v7)
  {
    CFArrayRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    CFTypeID TypeID = CFArrayGetTypeID();
    BOOL v11 = v9 == TypeID;
    uint64_t v12 = v9 != TypeID;
    if (v11)
    {
      CFIndex v13 = CFArrayGetCount(v8);
      if (v13 < 1)
      {
        uint64_t v12 = 0;
      }
      else
      {
        CFIndex v14 = v13;
        CFIndex v15 = 0;
        char v16 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, v15);
          if (ValueAtIndex)
          {
            CFStringRef v18 = ValueAtIndex;
            CFTypeID v19 = CFGetTypeID(ValueAtIndex);
            if (v19 == CFStringGetTypeID())
            {
              CFLocaleRef v20 = CFLocaleCreate(0, v18);
              if (v6 >= 1)
              {
                uint64_t v21 = 1;
                do
                {
                  CFStringRef v22 = (const __CFString *)CFArrayGetValueAtIndex(v4, v21 - 1);
                  CFLocaleRef v23 = CFLocaleCreate(0, v22);
                  if (CFEqual(v20, v23)) {
                    char v16 = 1;
                  }
                  if (v23) {
                    CFRelease(v23);
                  }
                  if (v16) {
                    break;
                  }
                }
                while (v21++ < v6);
              }
              if (v20) {
                CFRelease(v20);
              }
              if (v16) {
                break;
              }
            }
          }
          if (++v15 == v14)
          {
            uint64_t v12 = v16 & 1;
            goto LABEL_31;
          }
        }
        uint64_t v12 = 1;
      }
    }
LABEL_31:
    CFRelease(v4);
  }
  else
  {
    uint64_t v12 = 1;
    CFArrayRef v8 = v4;
  }
  CFRelease(v8);
  return v12;
}

__CFString *MAUtilitiesGetFallbackPSFontNameForSystemFontType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E6223C98[a1];
  }
}

CGFontRef MAUtilitiesCreateCGFontWithName(const __CFString *a1)
{
  uint64_t SystemFontType = MACaptionAppearancePrefGetSystemFontType(a1);
  CTFontDescriptorForuint64_t SystemFontType = _MAUtilitiesCreateCTFontDescriptorForSystemFontType(SystemFontType);
  if (CTFontDescriptorForSystemFontType)
  {
    unint64_t v4 = CTFontDescriptorForSystemFontType;
    uint64_t v5 = CTFontCreateWithFontDescriptor(CTFontDescriptorForSystemFontType, 0.0, 0);
    if (v5)
    {
      uint64_t v6 = v5;
      CGFontRef v7 = CTFontCopyGraphicsFont(v5, 0);
      CFRelease(v6);
      CFRelease(v4);
      if (v7) {
        return v7;
      }
    }
    else
    {
      CFRelease(v4);
    }
  }

  return CGFontCreateWithFontName(a1);
}

CGColor *MAUtilitiesRGBValuesForColor(CGColor *result, void *a2, void *a3, void *a4, void *a5)
{
  if (result)
  {
    CFTypeID v9 = result;
    CFStringRef result = CGColorGetColorSpace(result);
    if (result)
    {
      if (CGColorSpaceGetModel(result) == kCGColorSpaceModelRGB)
      {
        Components = CGColorGetComponents(v9);
        if (a2) {
          *a2 = *(void *)Components;
        }
        if (a3) {
          *a3 = *((void *)Components + 1);
        }
        if (a4) {
          *a4 = *((void *)Components + 2);
        }
        if (a5) {
          *a5 = *((void *)Components + 3);
        }
        return (CGColor *)1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

CFArrayRef __MAUtilitiesCustomizedFontLanguages_block_invoke()
{
  v1[1] = *(const void **)MEMORY[0x1E4F143B8];
  v1[0] = @"ja";
  CFArrayRef result = CFArrayCreate(0, v1, 1, MEMORY[0x1E4F1D510]);
  MAUtilitiesCustomizedFontLanguages_customizedLanguages = (uint64_t)result;
  return result;
}

BOOL MAUtilitiesLanguageStringMatchesLanguage(const __CFString *a1, const __CFString *a2)
{
  CFStringRef CanonicalLanguageIdentifierFromString = MAUtilitiesCreateCanonicalLanguageIdentifierFromString(a1);
  if (!CanonicalLanguageIdentifierFromString) {
    return 0;
  }
  CFStringRef v4 = CanonicalLanguageIdentifierFromString;
  CFStringRef LanguageFromLocaleIdentifier = (const __CFString *)MAXUtilitiesCreateLanguageFromLocaleIdentifier(CanonicalLanguageIdentifierFromString);
  if (LanguageFromLocaleIdentifier)
  {
    CFStringRef v6 = LanguageFromLocaleIdentifier;
    BOOL v7 = CFStringCompare(LanguageFromLocaleIdentifier, a2, 1uLL) == kCFCompareEqualTo;
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

CFTypeRef MAUtilitiesCopyFontOverideLanguage(const __CFString *a1)
{
  if (MAUtilitiesCustomizedFontLanguages_onceToken != -1) {
    dispatch_once(&MAUtilitiesCustomizedFontLanguages_onceToken, &__block_literal_global_2);
  }
  CFArrayRef v2 = (const __CFArray *)MAUtilitiesCustomizedFontLanguages_customizedLanguages;
  if (!MAUtilitiesCustomizedFontLanguages_customizedLanguages) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)MAUtilitiesCustomizedFontLanguages_customizedLanguages);
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = Count;
  CFIndex v5 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, v5);
    if (MAUtilitiesLanguageStringMatchesLanguage(a1, ValueAtIndex)) {
      break;
    }
    if (v4 == ++v5) {
      return 0;
    }
  }

  return CFRetain(ValueAtIndex);
}

CFTypeRef MAUtilitiesCreatePreferredPostScriptNameForLanguage(const __CFString *a1)
{
  if (!a1 || !MAUtilitiesLanguageStringMatchesLanguage(a1, @"ja")) {
    return 0;
  }

  return CFRetain(@"HiraMaruProN-W4");
}

BOOL MAUtilitiesDoubleAlmostEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 0.0000001;
}

BOOL MACaptionAppearanceAddPreferredLanguage(CFStringRef language)
{
  return MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, language);
}

CFArrayRef MACaptionAppearanceCopyPreferredLanguages()
{
  return MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
}

BOOL MAXCaptionAppearanceSetPreferredLanguage(CFStringRef language)
{
  return MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, language);
}

CFArrayRef MAXCaptionAppearanceCopyPreferredLanguages()
{
  return MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
}

BOOL MACaptionAppearanceGetShowCaptions()
{
  CFBooleanRef v0 = (const __CFBoolean *)MACaptionAppearancePrefCopyShowCaptionsWhenAvailable();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  BOOL v2 = CFBooleanGetValue(v0) != 0;
  CFRelease(v1);
  return v2;
}

void MACaptionAppearanceSetShowCaptions(uint64_t a1, int a2)
{
  BOOL v2 = (const __CFBoolean **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    BOOL v2 = (const __CFBoolean **)MEMORY[0x1E4F1CFC8];
  }
  MACaptionAppearancePrefSetShowCaptionsWhenAvailable(*v2);
}

uint64_t MAXCaptionAppearanceHasUserDefinedValues()
{
  return 1;
}

uint64_t MAXCaptionAppearanceBehaviorCopyForegroundColor(MACaptionAppearanceDomain domain, CGColorRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGColorRef v3 = MACaptionAppearanceCopyForegroundColor((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
  {
    *a2 = v3;
  }
  else if (v3)
  {
    CFRelease(v3);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyBackgroundColor(MACaptionAppearanceDomain domain, CGColorRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGColorRef v3 = MACaptionAppearanceCopyBackgroundColor((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
  {
    *a2 = v3;
  }
  else if (v3)
  {
    CFRelease(v3);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyWindowColor(MACaptionAppearanceDomain domain, CGColorRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGColorRef v3 = MACaptionAppearanceCopyWindowColor((MACaptionAppearanceDomain)domain, &behavior);
  if (a2)
  {
    *a2 = v3;
  }
  else if (v3)
  {
    CFRelease(v3);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyForegroundOpacity(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGFloat ForegroundOpacity = MACaptionAppearanceGetForegroundOpacity((MACaptionAppearanceDomain)domain, &behavior);
  if (a2) {
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &ForegroundOpacity);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyBackgroundOpacity(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGFloat BackgroundOpacity = MACaptionAppearanceGetBackgroundOpacity((MACaptionAppearanceDomain)domain, &behavior);
  if (a2) {
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &BackgroundOpacity);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyWindowOpacity(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGFloat WindowOpacity = MACaptionAppearanceGetWindowOpacity((MACaptionAppearanceDomain)domain, &behavior);
  if (a2) {
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &WindowOpacity);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyWindowRoundedCornerRadius(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGFloat WindowRoundedCornerRadius = MACaptionAppearanceGetWindowRoundedCornerRadius((MACaptionAppearanceDomain)domain, &behavior);
  if (a2) {
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &WindowRoundedCornerRadius);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorCopyFontForStyle(unsigned int a1, unsigned int a2, const __CFString **a3)
{
  uint64_t v6 = 0;
  CFStringRef v4 = MACaptionAppearanceCopyFontForStyle(a1, &v6, a2);
  if (a3)
  {
    *a3 = v4;
  }
  else if (v4)
  {
    CFRelease(v4);
  }
  return v6;
}

CFStringRef MACaptionAppearanceCopyFontForStyle(uint64_t a1, void *a2, unint64_t a3)
{
  if (a1 == 1)
  {
    CFStringRef v5 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
    if (!a2) {
      goto LABEL_11;
    }
    *a2 = 0;
LABEL_7:
    CFBooleanRef v7 = (const __CFBoolean *)MACaptionAppearancePrefCopyVideoOverrideFontForStyle(v5, a3);
    if (v7)
    {
      CFBooleanRef v8 = v7;
      if (CFBooleanGetValue(v7)) {
        *a2 = 1;
      }
      CFRelease(v8);
    }
LABEL_11:
    CFStringRef v9 = MACaptionAppearancePrefCopyFontForStyle(v5, a3);
    if (!v5) {
      return v9;
    }
    goto LABEL_14;
  }
  CFRetain(@"MACaptionSystemDefaultProfile");
  if (a2)
  {
    *a2 = 0;
    if (a1)
    {
      CFStringRef v5 = @"MACaptionSystemDefaultProfile";
      goto LABEL_7;
    }
  }
  CFStringRef v5 = @"MACaptionSystemDefaultProfile";
  CFStringRef v9 = MACaptionAppearancePrefCopyFontForStyle(@"MACaptionSystemDefaultProfile", a3);
LABEL_14:
  CFRelease(v5);
  return v9;
}

uint64_t MAXCaptionAppearanceBehaviorCopyRelativeCharacterSize(MACaptionAppearanceDomain domain, CFNumberRef *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  CGFloat RelativeCharacterSize = MACaptionAppearanceGetRelativeCharacterSize((MACaptionAppearanceDomain)domain, &behavior);
  if (a2) {
    *a2 = CFNumberCreate(0, kCFNumberCGFloatType, &RelativeCharacterSize);
  }
  return behavior;
}

uint64_t MAXCaptionAppearanceBehaviorGetTextEdgeStyle(MACaptionAppearanceDomain domain, _DWORD *a2)
{
  MACaptionAppearanceBehavior behavior = kMACaptionAppearanceBehaviorUseValue;
  int TextEdgeStyle = MACaptionAppearanceGetTextEdgeStyle((MACaptionAppearanceDomain)domain, &behavior);
  if (a2) {
    *a2 = TextEdgeStyle;
  }
  return behavior;
}

CGColorRef MAXCaptionAppearanceCopyForegroundColor()
{
  CFStringRef v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CGColorRef v1 = MACaptionAppearancePrefCopyForegroundColor(v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

CGColorRef MAXCaptionAppearanceCopyBackgroundColor()
{
  CFStringRef v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CGColorRef v1 = MACaptionAppearancePrefCopyBackgroundColor(v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

CGColorRef MAXCaptionAppearanceCopyWindowColor()
{
  CFStringRef v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CGColorRef v1 = MACaptionAppearancePrefCopyWindowColor(v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

BOOL MAXCaptionAppearanceGetForegroundOpacity(void *a1)
{
  CFStringRef v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFNumberRef v3 = (const __CFNumber *)MACaptionAppearancePrefCopyForegroundOpacity(v2);
  if (!v3)
  {
    BOOL v5 = 0;
    if (!v2) {
      return v5;
    }
    goto LABEL_8;
  }
  CFNumberRef v4 = v3;
  if (a1) {
    BOOL v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  }
  else {
    BOOL v5 = 1;
  }
  CFRelease(v4);
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
  return v5;
}

BOOL MAXCaptionAppearanceGetBackgroundOpacity(void *a1)
{
  CFStringRef v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFNumberRef v3 = (const __CFNumber *)MACaptionAppearancePrefCopyBackgroundOpacity(v2);
  if (!v3)
  {
    BOOL v5 = 0;
    if (!v2) {
      return v5;
    }
    goto LABEL_8;
  }
  CFNumberRef v4 = v3;
  if (a1) {
    BOOL v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  }
  else {
    BOOL v5 = 1;
  }
  CFRelease(v4);
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
  return v5;
}

BOOL MAXCaptionAppearanceGetWindowOpacity(void *a1)
{
  CFStringRef v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFNumberRef v3 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowOpacity(v2);
  if (!v3)
  {
    BOOL v5 = 0;
    if (!v2) {
      return v5;
    }
    goto LABEL_8;
  }
  CFNumberRef v4 = v3;
  if (a1) {
    BOOL v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  }
  else {
    BOOL v5 = 1;
  }
  CFRelease(v4);
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
  return v5;
}

BOOL MAXCaptionAppearanceGetWindowRoundedCornerRadius(void *a1)
{
  CFStringRef v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFNumberRef v3 = (const __CFNumber *)MACaptionAppearancePrefCopyWindowRoundedCornerRadius(v2);
  if (!v3)
  {
    BOOL v5 = 0;
    if (!v2) {
      return v5;
    }
    goto LABEL_8;
  }
  CFNumberRef v4 = v3;
  if (a1) {
    BOOL v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  }
  else {
    BOOL v5 = 1;
  }
  CFRelease(v4);
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
  return v5;
}

CFStringRef MAXCaptionAppearanceCopyFontForStyle(unsigned int a1)
{
  CFStringRef v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFStringRef v3 = MACaptionAppearancePrefCopyFontForStyle(v2, a1);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

BOOL MAXCaptionAppearanceGetRelativeCharacterSize(void *a1)
{
  CFStringRef v2 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFNumberRef v3 = (const __CFNumber *)MACaptionAppearancePrefCopyRelativeCharacterSize(v2);
  if (!v3)
  {
    BOOL v5 = 0;
    if (!v2) {
      return v5;
    }
    goto LABEL_8;
  }
  CFNumberRef v4 = v3;
  if (a1) {
    BOOL v5 = CFNumberGetValue(v3, kCFNumberCGFloatType, a1) != 0;
  }
  else {
    BOOL v5 = 1;
  }
  CFRelease(v4);
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
  return v5;
}

uint64_t MAXCaptionAppearanceGetTextEdgeStyle()
{
  CFStringRef v0 = (const __CFString *)MACaptionAppearancePrefCopyActiveProfileID();
  CFNumberRef v1 = MACaptionAppearancePrefCopyTextEdgeStyle(v0);
  if (!v1)
  {
    uint64_t v3 = 0;
    if (!v0) {
      return v3;
    }
    goto LABEL_6;
  }
  CFNumberRef v2 = v1;
  unsigned int valuePtr = 0;
  if (CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr)) {
    uint64_t v3 = valuePtr;
  }
  else {
    uint64_t v3 = 0;
  }
  CFRelease(v2);
  if (v0) {
LABEL_6:
  }
    CFRelease(v0);
  return v3;
}

uint64_t static MAMusicHaptics.enabledStatusDidChangeNotification.getter()
{
  return sub_1BA6DF640();
}

void type metadata accessor for OptionKey()
{
  if (!qword_1E9F74DA0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9F74DA0);
    }
  }
}

uint64_t sub_1BA6DE708(uint64_t a1, uint64_t a2)
{
  return sub_1BA6DE800(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1BA6DE720()
{
  sub_1BA6DF670();
  sub_1BA6DF680();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA6DE774()
{
  sub_1BA6DF670();
  sub_1BA6DF6B0();
  sub_1BA6DF680();
  uint64_t v0 = sub_1BA6DF6C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BA6DE7E8(uint64_t a1, uint64_t a2)
{
  return sub_1BA6DE800(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1BA6DE800(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1BA6DF670();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BA6DE844(uint64_t a1, id *a2)
{
  uint64_t result = sub_1BA6DF650();
  *a2 = 0;
  return result;
}

uint64_t sub_1BA6DE8BC(uint64_t a1, id *a2)
{
  char v3 = sub_1BA6DF660();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BA6DE93C@<X0>(uint64_t *a1@<X8>)
{
  sub_1BA6DF670();
  uint64_t v2 = sub_1BA6DF640();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BA6DE980()
{
  uint64_t v0 = sub_1BA6DF670();
  uint64_t v2 = v1;
  if (v0 == sub_1BA6DF670() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BA6DF6A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BA6DEA0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BA6DF640();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BA6DEA54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BA6DF670();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BA6DEA80(uint64_t a1)
{
  uint64_t v2 = sub_1BA6DEBB4((unint64_t *)&qword_1E9F74DC0);
  uint64_t v3 = sub_1BA6DEBB4(&qword_1E9F74DC8);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1BA6DEB18()
{
  return sub_1BA6DEBB4(&qword_1E9F74DA8);
}

uint64_t sub_1BA6DEB4C()
{
  return sub_1BA6DEBB4(&qword_1E9F74DB0);
}

uint64_t sub_1BA6DEB80()
{
  return sub_1BA6DEBB4(&qword_1E9F74DB8);
}

uint64_t sub_1BA6DEBB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OptionKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t MAFlashingLightsProcessor.Result.surfaceProcessed.getter()
{
  return *v0;
}

float MAFlashingLightsProcessor.Result.mitigationLevel.getter()
{
  return *(float *)(v0 + 4);
}

float MAFlashingLightsProcessor.Result.intensityLevel.getter()
{
  return *(float *)(v0 + 8);
}

void MAFlashingLightsProcessor.processSurface(_:outSurface:timestamp:options:)(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v6 = a3;
  uint64_t v10 = *a2;
  if (a3)
  {
    type metadata accessor for OptionKey();
    sub_1BA6DED04();
    uint64_t v6 = (void *)sub_1BA6DF630();
  }
  id v11 = objc_msgSend(v5, sel_processSurface_outSurface_timestamp_options_, a1, v10, v6, a5);

  unsigned __int8 v12 = objc_msgSend(v11, sel_surfaceProcessed);
  objc_msgSend(v11, sel_mitigationLevel);
  int v14 = v13;
  objc_msgSend(v11, sel_intensityLevel);
  int v16 = v15;

  *(unsigned char *)a4 = v12;
  *(_DWORD *)(a4 + 4) = v14;
  *(_DWORD *)(a4 + 8) = v16;
}

unint64_t sub_1BA6DED04()
{
  unint64_t result = qword_1E9F74DC0;
  if (!qword_1E9F74DC0)
  {
    type metadata accessor for OptionKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9F74DC0);
  }
  return result;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t _s6ResultVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[12]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s6ResultVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 12) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 12) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MAFlashingLightsProcessor.Result()
{
  return &type metadata for MAFlashingLightsProcessor.Result;
}

void MADimFlashingLightsEnabled_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Boolean soft_AXSPhotosensitiveMitigationEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MAVideoAccommodations.m", 13, @"%s", dlerror());

  __break(1u);
}

void soft_AXSHapticMusicEnabled_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Boolean soft_AXSHapticMusicEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MAMusicHaptics.m", 16, @"%s", dlerror());

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MAMusicHaptics.m", 20, @"%s", *a1);

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAXSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MAMusicHaptics.m", 21, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void __getAXUIClientClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *AccessibilityUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MAMusicHaptics.m", 26, @"%s", *a1);

  __break(1u);
}

void __getAXUIClientClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAXUIClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MAMusicHaptics.m", 27, @"Unable to find class %s", "AXUIClient");

  __break(1u);
}

void __getAXAccessQueueClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *AXCoreUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MAMusicHaptics.m", 31, @"%s", *a1);

  __break(1u);
}

void __getAXAccessQueueClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getAXAccessQueueClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MAMusicHaptics.m", 32, @"Unable to find class %s", "AXAccessQueue");

  __break(1u);
}

void __getPSEVideoProcessorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned int v3 = [NSString stringWithUTF8String:"void *PhotosensitivityProcessingLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MAFlashingLightsProcessing.m", 13, @"%s", *a1);

  __break(1u);
}

void __getPSEVideoProcessorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPSEVideoProcessorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MAFlashingLightsProcessing.m", 14, @"Unable to find class %s", "PSEVideoProcessor");

  __break(1u);
}

void MASetCaptionCallStatus_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MAGetCaptionCallStatus_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MAGetCaptionCallStatus_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MAGetCaptionCallStatus_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_1BA6DF630()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BA6DF640()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BA6DF650()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BA6DF660()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BA6DF670()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BA6DF680()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BA6DF6A0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BA6DF6B0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BA6DF6C0()
{
  return MEMORY[0x1F4185EF8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x1F40D72A8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x1F40D74C0](locArray);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
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

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BE8](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7C00](allocator, localeID);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8000](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
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

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DA3E8](font);
}

CGFontRef CGFontCreateWithFontName(CFStringRef name)
{
  return (CGFontRef)MEMORY[0x1F40DA438](name);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1F40E9728](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
}

CFTypeID CGImageMetadataGetTypeID(void)
{
  return MEMORY[0x1F40E97F0]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1F40E9810](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9820](metadata, parent, path, tag);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x1F40E9850](tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x1F40E9858](xmlns, prefix, name, *(void *)&type, value);
}

CGImageMetadataType CGImageMetadataTagGetType(CGImageMetadataTagRef tag)
{
  return MEMORY[0x1F40E9860](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1F40E9918](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x1F40DF2D0](font, attributes);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3C0](original, attributes);
}

uint64_t CTFontDescriptorCreateForCSSFamily()
{
  return MEMORY[0x1F40DF3D8]();
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3F0](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x1F40DF410]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPrefsCopyAppDictionaryWithContainer()
{
  return MEMORY[0x1F40D8FF0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void bzero(void *a1, size_t a2)
{
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

int dgesdd_(char *__jobz, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1710](__jobz, __m, __n, __a, __lda, __s, __u, __ldu);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t uloc_toLanguageTag()
{
  return MEMORY[0x1F41801D0]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
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

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}
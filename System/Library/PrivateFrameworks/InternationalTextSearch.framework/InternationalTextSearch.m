uint64_t ITSTokenListGetCount(uint64_t a1)
{
  if (!a1) {
    ITSTokenizerNext_cold_1();
  }
  return *(void *)(a1 + 32);
}

CFStringRef ITSTokenListCopyEscapedTokenAtIndex(uint64_t a1, uint64_t a2)
{
  CFStringRef result = (CFStringRef)ITSTokenListGetTokenAtIndex(a1, a2);
  if (result) {
    return CFStringCreateWithFormat(0, 0, @"##&%@", result);
  }
  return result;
}

uint64_t ITSTokenListGetTokenAtIndex(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    ITSTokenListGetTokenAtIndex_cold_1();
  }
  if (*(void *)(a1 + 32) <= a2) {
    ITSTokenListGetTokenAtIndex_cold_2();
  }
  return *(void *)(*(void *)(a1 + 16) + 56 * a2);
}

CFStringTokenizerTokenType ITSTokenListPopulateFromString(uint64_t a1, __CFStringTokenizer *a2, uint64_t a3, const __CFString *a4, int a5, int a6, uint64_t a7)
{
  if (!a1) {
    ITSTokenListPopulateFromString_cold_1();
  }
  ITSTokenListRemoveAllTokens(a1);
  v40.length = CFStringGetLength(a4);
  v40.location = 0;
  CFStringTokenizerSetString(a2, a4, v40);
  CFStringTokenizerTokenType result = CFStringTokenizerAdvanceToNextToken(a2);
  if (result)
  {
    char v12 = result;
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    int v23 = a6;
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(a2);
      CFIndex v36 = 0;
      usedBufLen[0] = 0;
      v38.location = 0;
      v38.length = CurrentTokenRange.location;
      CFStringGetBytes(a4, v38, 0x8000100u, 0, 0, 0, 0, usedBufLen);
      v39.length = CurrentTokenRange.location + CurrentTokenRange.length;
      v39.location = 0;
      CFStringGetBytes(a4, v39, 0x8000100u, 0, 0, 0, 0, &v36);
      v14 = (char *)usedBufLen[0];
      uint64_t v15 = v36 - usedBufLen[0];
      v16 = (__CFString *)CFStringCreateWithSubstring(alloc, a4, CurrentTokenRange);
      if ((v12 & 0x20) == 0) {
        goto LABEL_8;
      }
      if (a6)
      {
        context = (void *)MEMORY[0x216686470]();
        uint64_t v17 = a7;
        v18 = *(void **)(a1 + 40);
        uint64_t v19 = [(__CFString *)v16 length];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __ITSTokenListPopulateFromString_block_invoke;
        v29[3] = &__block_descriptor_96_e37_v32__0__NSTextCheckingResult_8Q16_B24l;
        v29[4] = v16;
        CFRange v30 = CurrentTokenRange;
        uint64_t v31 = a1;
        CFStringRef v32 = a4;
        uint64_t v33 = a3;
        v34 = v14;
        uint64_t v35 = v15;
        v20 = v18;
        a7 = v17;
        a6 = v23;
        objc_msgSend(v20, "enumerateMatchesInString:options:range:usingBlock:", v16, 0, 0, v19, v29);
      }
      if (a7) {
LABEL_8:
      }
        _AddTokenListEntryForRangeInString(a1, (uint64_t)a4, a3, v14, v15, (const void *)CurrentTokenRange.location, (const void *)CurrentTokenRange.length, v16);
      if (a5)
      {
        CFStringRef v21 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(a2, 0x10000uLL);
        if (v21)
        {
          CFStringRef v22 = v21;
          if (CFStringCompare(v21, v16, 0)) {
            _AddTokenListEntryForRangeInString(a1, (uint64_t)a4, a3, v14, v15, (const void *)CurrentTokenRange.location, (const void *)CurrentTokenRange.length, v22);
          }
          CFRelease(v22);
        }
      }
      if (v16) {
        CFRelease(v16);
      }
      CFStringTokenizerTokenType result = CFStringTokenizerAdvanceToNextToken(a2);
      char v12 = result;
    }
    while (result);
  }
  return result;
}

void _AddTokenListEntryForRangeInString(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, const void *a6, const void *a7, CFStringRef theString)
{
  if (a2 && a1 && theString && CFStringGetLength(theString))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15 == *(void *)(a1 + 24))
    {
      v16 = malloc_type_realloc(*(void **)(a1 + 16), 56 * v15 + 2800, 0x1070040AB53498DuLL);
      uint64_t v17 = *(void *)(a1 + 24) + 50;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = v17;
    }
    size_t v21 = 0;
    if (a3)
    {
      v18 = (char *)ITSCreateSortKey(theString, a3, 0, &v21);
      if (!v18 || !v21)
      {
        if (v18) {
          free(v18);
        }
        return;
      }
    }
    else
    {
      v18 = 0;
    }
    uint64_t v19 = &a4[a5];
    v20 = (CFTypeRef *)(*(void *)(a1 + 16) + 56 * *(void *)(a1 + 32));
    v20[3] = a4;
    v20[4] = v19;
    v20[1] = v18;
    CFTypeRef *v20 = CFRetain(theString);
    v20[2] = (CFTypeRef)v21;
    v20[5] = a6;
    v20[6] = a7;
    ++*(void *)(a1 + 32);
  }
}

void ITSTokenListDestroy(uint64_t a1)
{
  if (!a1) {
    ITSTokenListDestroy_cold_1();
  }
  ITSTokenListRemoveAllTokens(a1);

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
  }
}

uint64_t ITSTokenizerClose(CFTypeRef *a1)
{
  v2 = (CFMutableArrayRef *)*a1;
  CFRelease(a1[1]);
  CFArrayAppendValue(v2[7], a1[6]);
  ITSTokenListRemoveAllTokens((uint64_t)a1[6]);
  CFRelease(a1[6]);
  v3 = (void *)a1[4];
  if (v3) {
    free(v3);
  }
  sqlite3_free(a1);
  return 0;
}

void ITSTokenListRemoveAllTokens(uint64_t a1)
{
  if (!a1) {
    ITSTokenListRemoveAllTokens_cold_1();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(a1 + 16) + v3;
      CFRelease(*(CFTypeRef *)v4);
      v5 = *(void **)(v4 + 8);
      if (v5) {
        free(v5);
      }
      v3 += 56;
      --v2;
    }
    while (v2);
  }
  *(void *)(a1 + 32) = 0;
}

uint64_t ITSTokenizerNext(uint64_t *a1, void *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v11 = *a1;
  *a3 = 0;
  int v12 = *((_DWORD *)a1 + 4);
  if (v12)
  {
    v28 = a6;
    if (v12 == 1)
    {
      CFIndex v13 = a1[5];
      do
      {
        v35.length = CFStringGetLength((CFStringRef)a1[1]) - a1[5];
        result.CFIndex location = 0;
        result.length = 0;
        CFIndex v31 = 0;
        CFIndex usedBufLen = 0;
        size_t v30 = 0;
        v35.CFIndex location = v13;
        if (!CFStringFindCharacterFromSet((CFStringRef)a1[1], *(CFCharacterSetRef *)(v11 + 24), v35, 0, &result)) {
          return 101;
        }
        v34.length = result.location;
        v34.CFIndex location = 0;
        CFStringGetBytes((CFStringRef)a1[1], v34, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
        CFIndex location = result.location;
        *a4 = usedBufLen;
        v15.length = CFStringGetLength((CFStringRef)a1[1]) - location;
        if (v15.length >= 1
          && (v15.CFIndex location = location,
              CFStringFindCharacterFromSet((CFStringRef)a1[1], *(CFCharacterSetRef *)(v11 + 32), v15, 0, &result)))
        {
          v16.length = result.location;
          CFIndex v17 = result.location - v13;
          CFStringRef v18 = (const __CFString *)a1[1];
        }
        else
        {
          CFIndex Length = CFStringGetLength((CFStringRef)a1[1]);
          CFIndex v17 = Length - result.location;
          CFStringRef v18 = (const __CFString *)a1[1];
          v16.length = CFStringGetLength(v18);
        }
        v16.CFIndex location = 0;
        CFStringGetBytes(v18, v16, 0x8000100u, 0, 0, 0, 0, &v31);
        *a5 = v31;
        v36.CFIndex location = v13;
        v36.length = v17;
        CFStringRef v20 = CFStringCreateWithSubstring(0, (CFStringRef)a1[1], v36);
        size_t v21 = (void *)a1[4];
        if (v21) {
          free(v21);
        }
        CFStringRef v22 = ITSCreateSortKey(v20, *(void *)(v11 + 16), 0, &v30);
        a1[4] = (uint64_t)v22;
        *a3 = v30;
        *a2 = v22;
        CFRelease(v20);
        CFIndex v23 = v17 + v13;
        if (*a3)
        {
          a1[5] = v23;
          break;
        }
        v37.length = CFStringGetLength((CFStringRef)a1[1]) - v23;
        v29.CFIndex location = 0;
        v29.length = 0;
        v37.CFIndex location = v23;
        if (!CFStringFindWithOptions((CFStringRef)a1[1], @"##&", v37, 0, &v29)) {
          return 101;
        }
        CFIndex v13 = v29.length + v29.location;
        a1[5] = v29.length + v29.location;
      }
      while (!*a3);
    }
  }
  else
  {
    uint64_t v24 = a1[6];
    if (!v24) {
      ITSTokenizerNext_cold_1();
    }
    uint64_t v25 = a1[3];
    if (*(void *)(v24 + 32) == v25) {
      return 101;
    }
    v28 = a6;
    *a3 = ITSTokenListGetTokenCollationKeyLengthAtIndex(v24, v25);
    *a2 = ITSTokenListGetTokenCollationKeyAtIndex(a1[6], a1[3]);
    *a4 = ITSTokenListGetTokenStartByteOffsetAtIndex(a1[6], a1[3]);
    *a5 = ITSTokenListGetTokenEndByteOffsetAtIndex(a1[6], a1[3]);
  }
  uint64_t v26 = 0;
  uint64_t v27 = a1[3];
  a1[3] = v27 + 1;
  _DWORD *v28 = v27;
  return v26;
}

const char *ITSCreateSortKey(CFStringRef theString, uint64_t a2, uint64_t a3, size_t *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (theString) {
    uint64_t Length = CFStringGetLength(theString);
  }
  else {
    uint64_t Length = 0;
  }
  uint64_t v8 = a2;
  if (!a2) {
    uint64_t v8 = ITSCreateCollatorWithPreferredLocale(0, 0);
  }
  if (Length >= 1)
  {
    CharactersPtr = CFStringGetCharactersPtr(theString);
    v10 = (UniChar *)CharactersPtr;
    if (!CharactersPtr)
    {
      v10 = (UniChar *)malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
      v17.CFIndex location = 0;
      v17.length = Length;
      CFStringGetCharacters(theString, v17, v10);
    }
    ucol_setStrength();
    unsigned int SortKey = ucol_getSortKey();
    int v12 = (char *)malloc_type_calloc(SortKey, 1uLL, 0x9E99809DuLL);
    CFIndex v13 = v12;
    if (SortKey < 0xFA1)
    {
      memcpy(v12, __src, SortKey);
      if (CharactersPtr) {
        goto LABEL_16;
      }
    }
    else
    {
      unsigned int SortKey = ucol_getSortKey();
      if (CharactersPtr) {
        goto LABEL_16;
      }
    }
    free(v10);
LABEL_16:
    if (a4)
    {
      *a4 = SortKey - 1;
      *a4 = strlen(v13);
    }
    goto LABEL_18;
  }
  CFIndex v13 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_18:
  if (v8 && v8 != a2) {
    ucol_close();
  }
  return v13;
}

uint64_t ITSTokenListCreate()
{
  pthread_once(&kITSTokenListRegisterClass, (void (*)(void))ITSTokenListRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v1 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    if (ITSTokenListCreate_onceToken != -1) {
      dispatch_once(&ITSTokenListCreate_onceToken, &__block_literal_global);
    }
    *(void *)(v1 + 40) = (id)ITSTokenListCreate_sharedSubtokenRegex;
  }
  return v1;
}

uint64_t ITSTokenizerOpen(uint64_t a1, char *__s, int a3, void *a4)
{
  int v5 = a3;
  *a4 = 0;
  if (a3 < 0)
  {
    if (!__s) {
      return 1;
    }
    int v5 = strlen(__s);
  }
  uint64_t v8 = sqlite3_malloc(56);
  if (!v8) {
    return 7;
  }
  v9 = v8;
  v8[6] = 0;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  *(_OWORD *)uint64_t v8 = 0u;
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 56)))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), 0);
    *((void *)v9 + 6) = CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), 0);
  }
  else
  {
    *((void *)v9 + 6) = ITSTokenListCreate();
  }
  int v12 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!*(unsigned char *)(a1 + 48))
  {
    CFIndex v13 = ITSGetCollationContextForDatabaseConnectionHandle(*(const void **)(*(void *)a1 + 48));
    if (v13)
    {
      CFLocaleRef v14 = (const __CFLocale *)*((void *)v13 + 1);
      if (v14)
      {
        *(unsigned char *)(a1 + 49) = 1;
        CFRange v15 = *(const void **)(a1 + 8);
        if (v15) {
          CFRelease(v15);
        }
        *(void *)(a1 + 8) = v14;
        uint64_t v16 = *(const void **)(a1 + 40);
        if (v16) {
          CFRelease(v16);
        }
        v24.CFIndex location = 0;
        v24.length = 0;
        *(void *)(a1 + 40) = CFStringTokenizerCreate(*v12, &stru_26C3C4E68, v24, 0x810000uLL, v14);
      }
    }
    CFRange v17 = (uint64_t *)ITSGetCollationContextForDatabaseConnectionHandle(*(const void **)(*(void *)a1 + 48));
    if (v17)
    {
      uint64_t v18 = *v17;
      if (*v17)
      {
        if (*(void *)(a1 + 16)) {
          ucol_close();
        }
        *(void *)(a1 + 16) = v18;
        *(unsigned char *)(a1 + 50) = 1;
      }
    }
    *(unsigned char *)(a1 + 48) = 1;
  }
  CFStringRef v19 = CFStringCreateWithBytes(*v12, (const UInt8 *)__s, v5, 0x8000100u, 0);
  *((void *)v9 + 1) = v19;
  if (v19)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v19);
    CFStringTrimWhitespace(MutableCopy);
    if (CFStringHasPrefix(MutableCopy, @"##&"))
    {
      *((_DWORD *)v9 + 4) = 1;
      CFRange v21 = CFStringFind((CFStringRef)*((void *)v9 + 1), @"##&", 0);
      *((void *)v9 + 5) = v21.length + v21.location;
    }
    else
    {
      *((_DWORD *)v9 + 4) = 0;
    }
    CFRelease(MutableCopy);
    CFIndex Length = CFStringGetLength(*((CFStringRef *)v9 + 1));
    if (*((_DWORD *)v9 + 4))
    {
      v25.length = Length;
      v25.CFIndex location = 0;
      CFStringTokenizerSetString(*(CFStringTokenizerRef *)(a1 + 40), *((CFStringRef *)v9 + 1), v25);
    }
    else
    {
      ITSTokenListPopulateFromString(*((void *)v9 + 6), *(__CFStringTokenizer **)(a1 + 40), *(void *)(a1 + 16), *((const __CFString **)v9 + 1), 1, 1, 0);
    }
    CFIndex v23 = (const void *)*((void *)v9 + 1);
    if (v23)
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t result = 0;
        *a4 = v9;
        return result;
      }
      CFRelease(v23);
    }
  }
  sqlite3_free(v9);
  return 1;
}

uint64_t ITSFTSIsEnabled()
{
  return 1;
}

CFLocaleIdentifier ITSCopySearchCollatorForLanguage(CFLocaleIdentifier localeID)
{
  CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, localeID);
  if (!ComponentsFromLocaleIdentifier) {
    return 0;
  }
  CFDictionaryRef v2 = ComponentsFromLocaleIdentifier;
  CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0, 2, ComponentsFromLocaleIdentifier);
  if (MutableCopy)
  {
    CFDictionaryRef v4 = MutableCopy;
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263EFFCA8], @"search");
    CFLocaleIdentifier LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(0, v4);
    CFRelease(v4);
  }
  else
  {
    CFLocaleIdentifier LocaleIdentifierFromComponents = 0;
  }
  CFRelease(v2);
  return LocaleIdentifierFromComponents;
}

CFStringRef ITSCopyFTSTableCreateStatementUsingCurrentLanguage(uint64_t a1, uint64_t a2)
{
  CFStringRef v4 = ITSCopyUserLanguage();
  CFLocaleIdentifier v5 = ITSCopySearchCollatorForLanguage(v4);
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"CREATE VIRTUAL TABLE IF NOT EXISTS %@ USING fts4(tokenize=ab_cf_tokenizer language=\"%@\" collator=\"%@\", %@);",
         a1,
         v4,
         v5,
         a2);
  CFRelease(v4);
  CFRelease(v5);
  return v6;
}

CFLocaleIdentifier ITSCopyUserLanguage()
{
  CFArrayRef v0 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48]);
  if (!v0) {
    goto LABEL_6;
  }
  CFArrayRef v1 = v0;
  if (CFArrayGetCount(v0) <= 0)
  {
    CFRelease(v1);
LABEL_6:
    CFLocaleIdentifier CanonicalLanguageIdentifierFromString = @"en";
    CFRetain(@"en");
    return CanonicalLanguageIdentifierFromString;
  }
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, 0);
  CFLocaleIdentifier CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, ValueAtIndex);
  CFRelease(v1);
  if (!CanonicalLanguageIdentifierFromString) {
    goto LABEL_6;
  }
  return CanonicalLanguageIdentifierFromString;
}

CFStringRef ITSCopyFTSTableCreateStatementWithLanguageAndCollator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"CREATE VIRTUAL TABLE IF NOT EXISTS %@ USING fts4(tokenize=ab_cf_tokenizer language=\"%@\" collator=\"%@\", %@);",
           a1,
           a2,
           a3,
           a4);
}

uint64_t ITSCreateCollatorWithPreferredLocale(int a1, CFTypeRef cf)
{
  int v14 = 0;
  if (cf)
  {
    CFStringRef v2 = (const __CFString *)CFRetain(cf);
    if (v2)
    {
      CFLocaleIdentifier v3 = v2;
      if (CFStringGetLength(v2)) {
        goto LABEL_6;
      }
      CFRelease(v3);
    }
  }
  CFLocaleIdentifier v3 = ITSCopyUserLanguage();
  if (!v3)
  {
    CFLocaleIdentifier v5 = 0;
    char v6 = 1;
    goto LABEL_9;
  }
LABEL_6:
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    CFLocaleIdentifier v5 = (UInt8 *)CStringPtr;
    char v6 = 0;
LABEL_9:
    char v7 = 1;
    goto LABEL_11;
  }
  CFIndex Length = CFStringGetLength(v3);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x600u);
  CFIndex usedBufLen = 0;
  CFLocaleIdentifier v5 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x4B672883uLL);
  v15.CFIndex location = 0;
  v15.length = Length;
  CFStringGetBytes(v3, v15, 0x600u, 0, 0, v5, MaximumSizeForEncoding, &usedBufLen);
  char v6 = 0;
  char v7 = 0;
  v5[usedBufLen] = 0;
LABEL_11:
  if (!v5) {
    CFLocaleIdentifier v5 = (UInt8 *)"en";
  }
  uint64_t v10 = ucol_open();
  if (v14 >= 1) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  ucol_setAttribute();
  if ((v6 & 1) == 0) {
    CFRelease(v3);
  }
  if ((v7 & 1) == 0) {
    free(v5);
  }
  return v11;
}

uint64_t ITSCreateCollator()
{
  return ITSCreateCollatorWithPreferredLocale(0, 0);
}

void *ITSSetCollatorOverrideForDatabaseConnectionHandle(const void *a1, void *a2)
{
  uint64_t result = ITSGetCollationContextForDatabaseConnectionHandle(a1);
  if (result)
  {
    CFStringRef v4 = result;
    uint64_t result = (void *)*result;
    if (result != a2)
    {
      if (result) {
        uint64_t result = (void *)ucol_close();
      }
      *CFStringRef v4 = a2;
    }
  }
  return result;
}

const void *ITSGetCollationContextForDatabaseConnectionHandle(const void *a1)
{
  if (ITSGetCollationContextDictionary_predicate != -1) {
    dispatch_once(&ITSGetCollationContextDictionary_predicate, &__block_literal_global_27);
  }
  CFDictionaryRef v2 = (const __CFDictionary *)ITSGetCollationContextDictionary_collalationContextDict;
  pthread_mutex_lock(&gDictionaryMutex);
  Value = CFDictionaryGetValue(v2, a1);
  pthread_mutex_unlock(&gDictionaryMutex);
  return Value;
}

void *ITSSetLocaleOverrideForDatabaseConnectionHandle(const void *a1, void *a2)
{
  uint64_t result = ITSGetCollationContextForDatabaseConnectionHandle(a1);
  if (result)
  {
    CFStringRef v4 = result;
    uint64_t result = (void *)result[1];
    if (result != a2)
    {
      if (result) {
        CFRelease(result);
      }
      v4[1] = a2;
      return CFRetain(a2);
    }
  }
  return result;
}

uint64_t ITSCollationContextFreeContextForDatabaseHandle(const void *a1)
{
  CFDictionaryRef v2 = ITSGetCollationContextForDatabaseConnectionHandle(a1);
  if (v2)
  {
    CFLocaleIdentifier v3 = v2;
    if (*v2) {
      ucol_close();
    }
    CFStringRef v4 = (const void *)v3[1];
    if (v4) {
      CFRelease(v4);
    }
    CFLocaleIdentifier v5 = (const void *)v3[2];
    if (v5) {
      CFRelease(v5);
    }
    free((void *)v3[3]);
    free(v3);
  }

  return ITSSetCollationContextForDatabaseConnectionHandle(a1, 0);
}

uint64_t ITSSetCollationContextForDatabaseConnectionHandle(const void *a1, const void *a2)
{
  if (ITSGetCollationContextDictionary_predicate != -1) {
    dispatch_once(&ITSGetCollationContextDictionary_predicate, &__block_literal_global_27);
  }
  CFStringRef v4 = (__CFDictionary *)ITSGetCollationContextDictionary_collalationContextDict;
  pthread_mutex_lock(&gDictionaryMutex);
  if (a2) {
    CFDictionarySetValue(v4, a1, a2);
  }
  else {
    CFDictionaryRemoveValue(v4, a1);
  }

  return pthread_mutex_unlock(&gDictionaryMutex);
}

uint64_t ITSRegisterSQLiteICUTokenizer(sqlite3 *a1)
{
  uint64_t result = sqlite3_db_config(a1, 1004, 1, 0);
  if (!result)
  {
    ppStmt = 0;
    uint64_t result = sqlite3_prepare_v2(a1, "SELECT fts3_tokenizer(?, ?)", -1, &ppStmt, 0);
    if (!result)
    {
      CFLocaleIdentifier v3 = malloc_type_calloc(1uLL, 0x38uLL, 0x10A0040CD2B339FuLL);
      CFLocaleIdentifier v5 = v3;
      *(_DWORD *)CFLocaleIdentifier v3 = 0;
      v3[1] = ITSTokenizerCreate;
      v3[2] = ITSTokenizerDestroy;
      v3[3] = ITSTokenizerOpen;
      v3[4] = ITSTokenizerClose;
      v3[5] = ITSTokenizerNext;
      v3[6] = a1;
      sqlite3_bind_text(ppStmt, 1, "ab_cf_tokenizer", -1, 0);
      sqlite3_bind_blob(ppStmt, 2, &v5, 8, 0);
      CFStringRef v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x6004073DA8B2BuLL);
      v4[3] = v5;
      ITSSetCollationContextForDatabaseConnectionHandle(a1, v4);
      sqlite3_step(ppStmt);
      return sqlite3_finalize(ppStmt);
    }
  }
  return result;
}

uint64_t ITSTokenizerCreate(int a1, uint64_t a2, void *a3)
{
  char v6 = sqlite3_malloc(64);
  if (!v6) {
    return 7;
  }
  char v7 = v6;
  v6[2] = 0u;
  v6[3] = 0u;
  *char v6 = 0u;
  v6[1] = 0u;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  *((void *)v7 + 3) = CFCharacterSetCreateInvertedSet(0, Predefined);
  CFCharacterSetRef v9 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0, v9);
  *((void *)v7 + 4) = MutableCopy;
  if (MutableCopy) {
    CFCharacterSetAddCharactersInString(MutableCopy, @"*");
  }
  if (a1 <= 1)
  {
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "en", 0x8000100u);
LABEL_9:
    CFStringRef v14 = 0;
    goto LABEL_10;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const char **)(a2 + 8), 0x8000100u);
  if (a1 < 4) {
    goto LABEL_9;
  }
  CFIndex v13 = *(const char **)(a2 + 24);
  if (!v13) {
    goto LABEL_9;
  }
  CFStringRef v14 = CFStringCreateWithCString(v11, v13, 0x8000100u);
LABEL_10:
  *((void *)v7 + 1) = CFLocaleCreate(v11, v12);
  if (v14) {
    CFStringRef v15 = v14;
  }
  else {
    CFStringRef v15 = v12;
  }
  *((void *)v7 + 2) = ITSCreateCollatorWithPreferredLocale(0, v15);
  v19.CFIndex location = 0;
  v19.length = 0;
  *((void *)v7 + 5) = CFStringTokenizerCreate(v11, &stru_26C3C4E68, v19, 0x810000uLL, *((CFLocaleRef *)v7 + 1));
  *((void *)v7 + 7) = CFArrayCreateMutable(0, 2, MEMORY[0x263EFFF70]);
  if (v12) {
    CFRelease(v12);
  }
  if (v14) {
    CFRelease(v14);
  }
  uint64_t v16 = (const void *)*((void *)v7 + 3);
  if (v16)
  {
    if (*((void *)v7 + 4))
    {
      uint64_t result = 0;
      *a3 = v7;
      return result;
    }
    CFRelease(v16);
  }
  uint64_t v18 = (const void *)*((void *)v7 + 4);
  if (v18) {
    CFRelease(v18);
  }
  return 7;
}

uint64_t ITSTokenizerDestroy(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 24));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  if (!*(unsigned char *)(a1 + 49))
  {
    CFLocaleIdentifier v3 = *(const void **)(a1 + 8);
    if (v3) {
      CFRelease(v3);
    }
  }
  if (!*(unsigned char *)(a1 + 50) && *(void *)(a1 + 16)) {
    ucol_close();
  }
  CFStringRef v4 = *(const void **)(a1 + 56);
  if (v4) {
    CFRelease(v4);
  }
  sqlite3_free((void *)a1);
  return 0;
}

void __ITSTokenListCreate_block_invoke()
{
  CFArrayRef v0 = (void *)MEMORY[0x216686470]();
  ITSTokenListCreate_sharedSubtokenRegex = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[[:script=Hiragana:][:script=Katakana:]]+|[^[[:script=Hiragana:][:script=Katakana:]]]{1}" options:1 error:0];
}

void __ITSTokenListPopulateFromString_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 range];
  CFLocaleIdentifier v5 = v4;
  CFStringRef v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
  char v7 = (const void *)(*(void *)(a1 + 40) + v3);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  CFAllocatorRef v11 = *(char **)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);

  _AddTokenListEntryForRangeInString(v8, v9, v10, v11, v12, v7, v5, v6);
}

uint64_t ITSTokenListGetTokenStartByteOffsetAtIndex(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    ITSTokenListGetTokenStartByteOffsetAtIndex_cold_1();
  }
  if (*(void *)(a1 + 32) <= a2) {
    ITSTokenListGetTokenStartByteOffsetAtIndex_cold_2();
  }
  return *(void *)(*(void *)(a1 + 16) + 56 * a2 + 24);
}

uint64_t ITSTokenListGetTokenEndByteOffsetAtIndex(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    ITSTokenListGetTokenEndByteOffsetAtIndex_cold_1();
  }
  if (*(void *)(a1 + 32) <= a2) {
    ITSTokenListGetTokenEndByteOffsetAtIndex_cold_2();
  }
  return *(void *)(*(void *)(a1 + 16) + 56 * a2 + 32);
}

uint64_t ITSTokenListGetTokenCollationKeyAtIndex(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    ITSTokenListGetTokenCollationKeyAtIndex_cold_1();
  }
  if (*(void *)(a1 + 32) <= a2) {
    ITSTokenListGetTokenCollationKeyAtIndex_cold_2();
  }
  return *(void *)(*(void *)(a1 + 16) + 56 * a2 + 8);
}

uint64_t ITSTokenListGetTokenCollationKeyLengthAtIndex(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    ITSTokenListGetTokenCollationKeyLengthAtIndex_cold_1();
  }
  if (*(void *)(a1 + 32) <= a2) {
    ITSTokenListGetTokenCollationKeyLengthAtIndex_cold_2();
  }
  return *(void *)(*(void *)(a1 + 16) + 56 * a2 + 16);
}

uint64_t ITSTokenListGetTokenRangeAtIndex(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    ITSTokenListGetTokenRangeAtIndex_cold_1();
  }
  if (*(void *)(a1 + 32) <= a2) {
    ITSTokenListGetTokenRangeAtIndex_cold_2();
  }
  return *(void *)(*(void *)(a1 + 16) + 56 * a2 + 40);
}

CFMutableDictionaryRef __ITSGetCollationContextDictionary_block_invoke()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
  ITSGetCollationContextDictionary_collalationContextDict = (uint64_t)result;
  return result;
}

uint64_t ITSTokenListRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kITSTokenListTypeID = result;
  return result;
}

void ITSTokenizerNext_cold_1()
{
  __assert_rtn("ITSTokenListGetCount", "ITSSQLiteFTSTokenizer.m", 999, "list != NULL");
}

void ITSTokenListDestroy_cold_1()
{
}

void ITSTokenListRemoveAllTokens_cold_1()
{
}

void ITSTokenListPopulateFromString_cold_1()
{
  __assert_rtn("ITSTokenListPopulateFromString", "ITSSQLiteFTSTokenizer.m", 949, "list != NULL");
}

void ITSTokenListGetTokenAtIndex_cold_1()
{
}

void ITSTokenListGetTokenAtIndex_cold_2()
{
}

void ITSTokenListGetTokenStartByteOffsetAtIndex_cold_1()
{
}

void ITSTokenListGetTokenStartByteOffsetAtIndex_cold_2()
{
}

void ITSTokenListGetTokenEndByteOffsetAtIndex_cold_1()
{
}

void ITSTokenListGetTokenEndByteOffsetAtIndex_cold_2()
{
}

void ITSTokenListGetTokenCollationKeyAtIndex_cold_1()
{
}

void ITSTokenListGetTokenCollationKeyAtIndex_cold_2()
{
}

void ITSTokenListGetTokenCollationKeyLengthAtIndex_cold_1()
{
}

void ITSTokenListGetTokenCollationKeyLengthAtIndex_cold_2()
{
}

void ITSTokenListGetTokenRangeAtIndex_cold_1()
{
}

void ITSTokenListGetTokenRangeAtIndex_cold_2()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4728](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4738](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4A88](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x270EE4A98](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AA8](allocator, dictionary);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.CFIndex location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x270EE5288](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.CFIndex location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x270F9B618](a1, *(void *)&op);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x270F9B6E8](*(void *)&a1);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t ucol_close()
{
  return MEMORY[0x270F99698]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x270F996A8]();
}

uint64_t ucol_open()
{
  return MEMORY[0x270F996C8]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x270F996D0]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x270F996D8]();
}
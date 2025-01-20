DIR *IterateDirectory(const char *a1, unsigned int (*a2)(char *, uint64_t, uint64_t), uint64_t a3)
{
  DIR *result;
  DIR *v7;
  size_t v8;
  char *v9;
  size_t v10;
  char *v11;
  dirent *v12;
  dirent *v13;
  const char *d_name;
  int v15;
  stat v16;

  result = opendir(a1);
  if (result)
  {
    v7 = result;
    v8 = strlen(a1) + 256;
    v9 = (char *)malloc_type_malloc(v8, 0x413E99EuLL);
    strlcpy(v9, a1, v8);
    v10 = strlen(a1);
    *(_WORD *)&v9[v10] = 47;
    v11 = &v9[v10 + 1];
    memset(&v16, 0, sizeof(v16));
    v12 = readdir(v7);
    if (v12)
    {
      v13 = v12;
      do
      {
        v15 = v13->d_name[0];
        d_name = v13->d_name;
        if (v15 != 46)
        {
          strlcpy(v11, d_name, 0x100uLL);
          if ((stat(v9, &v16) & 0x80000000) == 0)
          {
            if ((v16.st_mode & 0xF000) == 0x4000)
            {
              if (a2(v9, 1, a3)) {
                IterateDirectory(v9, a2, a3);
              }
            }
            else
            {
              a2(v9, 0, a3);
            }
          }
        }
        v13 = readdir(v7);
      }
      while (v13);
    }
    free(v9);
    return (DIR *)closedir(v7);
  }
  return result;
}

BOOL ItemExistsAtPath(const char *a1, int a2)
{
  if (a2)
  {
    memset(&v4, 0, sizeof(v4));
    return !stat(a1, &v4) && (v4.st_mode & 0xF000) == 0x4000;
  }
  else
  {
    return access(a1, 0) == 0;
  }
}

uint64_t ItemExistsAtURL(const __CFURL *a1)
{
  uint64_t result = CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024);
  if (result)
  {
    int v3 = CFURLHasDirectoryPath(a1);
    return ItemExistsAtPath((const char *)buffer, v3);
  }
  return result;
}

CFStringRef CopyFileObjectIdentifierAtURL(const __CFURL *a1)
{
  CFURLRef v1 = CFURLCopyAbsoluteURL(a1);
  CFStringRef v2 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  CFRelease(v1);
  return v2;
}

void BuildWordBreakTable(CFStringRef str, CFRange range, const __CFLocale *a3, char *__b)
{
  CFIndex length = range.length;
  CFIndex location = range.location;
  if ((range.length & 0x8000000000000000) == 0) {
    memset(__b, 255, 8 * range.length + 8);
  }
  v12.CFIndex location = location;
  v12.CFIndex length = length;
  CFStringRef v9 = CFStringCreateWithSubstring(0, str, v12);
  v13.CFIndex location = 0;
  v13.CFIndex length = length;
  CFStringTokenizerRef v10 = CFStringTokenizerCreate(0, v9, v13, 0x80uLL, a3);
  if (v10)
  {
    CFStringTokenizerRef v11 = v10;
    while (_CFStringTokenizerTokenize())
    {
      *(void *)__b = 1;
      bzero(__b + 8, 0xFFFFFFFFFFFFFFF8);
    }
    CFRelease(v11);
    CFRelease(v9);
  }
}

CFTypeRef CopyPreferredEnglishLanguage(CFLocaleIdentifier localeID)
{
  CFLocaleIdentifier v18 = localeID;
  CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, localeID);
  if (ComponentsFromLocaleIdentifier)
  {
    CFDictionaryRef v2 = ComponentsFromLocaleIdentifier;
    if (CFDictionaryGetValue(ComponentsFromLocaleIdentifier, kCFLocaleCountryCode))
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v2);
      CFDictionarySetValue(MutableCopy, kCFLocaleLanguageCode, @"en");
      CFLocaleIdentifier LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(0, MutableCopy);
      CFRelease(MutableCopy);
      if (LocaleIdentifierFromComponents)
      {
        char v5 = 0;
        CFLocaleIdentifier v18 = LocaleIdentifierFromComponents;
LABEL_8:
        CFRelease(v2);
        goto LABEL_9;
      }
    }
    else
    {
      CFLocaleIdentifier LocaleIdentifierFromComponents = 0;
    }
    char v5 = 1;
    goto LABEL_8;
  }
  CFLocaleIdentifier LocaleIdentifierFromComponents = 0;
  char v5 = 1;
LABEL_9:
  uint64_t v6 = 0;
  keys[0] = (void *)kCFLocaleLanguageCode;
  keys[1] = (void *)kCFLocaleCountryCode;
  CFTypeRef cf = 0;
  CFTypeRef v21 = 0;
  char v7 = 1;
  do
  {
    v8 = *(&off_100008458 + v6);
    char v9 = v7;
    values[0] = @"en";
    values[1] = v8;
    CFDictionaryRef v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(&cf + v6) = CFLocaleCreateLocaleIdentifierFromComponents(0, v10);
    CFRelease(v10);
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v9 & 1) != 0);
  CFArrayRef v11 = CFArrayCreate(0, &cf, 2, &kCFTypeArrayCallBacks);
  CFArrayRef v12 = CFArrayCreate(0, (const void **)&v18, 1, &kCFTypeArrayCallBacks);
  CFArrayRef v13 = CFBundleCopyLocalizationsForPreferences(v11, v12);
  if (v13)
  {
    CFArrayRef v14 = v13;
    ValueAtIndex = CFArrayGetValueAtIndex(v13, 0);
    CFTypeRef v16 = CFRetain(ValueAtIndex);
    CFRelease(v14);
  }
  else
  {
    CFTypeRef v16 = 0;
  }
  CFRelease(v11);
  CFRelease(v12);
  CFRelease(cf);
  CFRelease(v21);
  if ((v5 & 1) == 0) {
    CFRelease(LocaleIdentifierFromComponents);
  }
  return v16;
}

uint64_t CompareLanguageCode(const __CFString *a1, CFStringRef theString2, unsigned char *a3)
{
  uint64_t CanonicalLocaleIdentifierFromString = 0;
  CFStringRef v43 = 0;
  CFStringRef v44 = 0;
  CFStringRef theString1 = 0;
  CFStringRef theString2a = 0;
  long long v40 = 0uLL;
  if (!a1 || !theString2) {
    return CanonicalLocaleIdentifierFromString;
  }
  if (CFStringCompare(a1, theString2, 1uLL) == kCFCompareEqualTo
    || CFEqual(a1, @"*")
    || CFEqual(theString2, @"*"))
  {
    uint64_t CanonicalLocaleIdentifierFromString = 1;
    if (a3) {
      *a3 = 1;
    }
    return CanonicalLocaleIdentifierFromString;
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t CanonicalLocaleIdentifierFromString = (uint64_t)CFLocaleCreateCanonicalLocaleIdentifierFromString(0, a1);
  uint64_t v45 = CanonicalLocaleIdentifierFromString;
  if (!CanonicalLocaleIdentifierFromString) {
    return CanonicalLocaleIdentifierFromString;
  }
  if (!CFLocaleCreateCanonicalLocaleIdentifierFromString(0, theString2))
  {
    CFRelease((CFTypeRef)CanonicalLocaleIdentifierFromString);
    return 0;
  }
  v38 = a3;
  uint64_t v7 = 0;
  v39[0] = 0;
  v39[1] = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, (CFLocaleIdentifier)*(&v45 + v7));
    v39[v7] = ComponentsFromLocaleIdentifier;
    if (ComponentsFromLocaleIdentifier)
    {
      CFDictionaryRef v11 = ComponentsFromLocaleIdentifier;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, kCFLocaleLanguageCode);
      CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(v11, kCFLocaleCountryCode);
      CFDictionaryRef ComponentsFromLocaleIdentifier = (const __CFDictionary *)CFDictionaryGetValue(v11, kCFLocaleScriptCode);
    }
    else
    {
      CFStringRef Value = 0;
      CFStringRef v13 = 0;
    }
    char v8 = 0;
    *(&v43 + v7) = Value;
    *(&theString1 + v7) = v13;
    *((void *)&v40 + v7) = ComponentsFromLocaleIdentifier;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  uint64_t v14 = 0;
  char v15 = 1;
  CFStringRef v16 = @"en";
  CFStringRef v17 = @"nb";
  do
  {
    char v18 = v15;
    CFStringRef v19 = *(&v43 + v14);
    if (!v19) {
      goto LABEL_36;
    }
    if (CFStringCompare(*(&v43 + v14), @"zh", 0))
    {
      if (CFStringCompare(v19, v16, 0) || !*(&theString1 + v14))
      {
        if (CFEqual(v19, v17)
          || CFEqual(v19, @"nn"))
        {
          *(&v43 + v14) = @"no";
        }
      }
      else
      {
        CFStringRef v22 = v17;
        CFStringRef v23 = (const __CFString *)CopyPreferredEnglishLanguage((CFLocaleIdentifier)*(&v45 + v14));
        v24 = (const void *)v39[v14];
        if (v24) {
          CFRelease(v24);
        }
        CFStringRef v25 = v16;
        CFDictionaryRef v26 = CFLocaleCreateComponentsFromLocaleIdentifier(0, v23);
        v39[v14] = v26;
        if (v26)
        {
          CFDictionaryRef v27 = v26;
          CFStringRef v28 = (const __CFString *)CFDictionaryGetValue(v26, kCFLocaleLanguageCode);
          CFStringRef v29 = (const __CFString *)CFDictionaryGetValue(v27, kCFLocaleCountryCode);
          CFDictionaryRef v26 = (const __CFDictionary *)CFDictionaryGetValue(v27, kCFLocaleScriptCode);
        }
        else
        {
          CFStringRef v28 = 0;
          CFStringRef v29 = 0;
        }
        *(&v43 + v14) = v28;
        *(&theString1 + v14) = v29;
        *((void *)&v40 + v14) = v26;
        CFRelease(v23);
        CFStringRef v16 = v25;
        CFStringRef v17 = v22;
      }
    }
    else if (!*((void *)&v40 + v14))
    {
      CFStringRef v20 = *(&theString1 + v14);
      if (v20)
      {
        if (CFStringCompare(*(&theString1 + v14), @"CN", 1uLL))
        {
          if (CFStringCompare(v20, @"TW", 1uLL)) {
            goto LABEL_36;
          }
          CFStringRef v21 = @"Hant";
        }
        else
        {
          CFStringRef v21 = @"Hans";
        }
        *((void *)&v40 + v14) = v21;
      }
    }
LABEL_36:
    char v15 = 0;
    uint64_t v14 = 1;
  }
  while ((v18 & 1) != 0);
  if (v43) {
    BOOL v30 = v44 == 0;
  }
  else {
    BOOL v30 = 1;
  }
  if (v30 || CFStringCompare(v43, v44, 1uLL))
  {
    uint64_t CanonicalLocaleIdentifierFromString = 0;
  }
  else
  {
    if (v38) {
      unsigned char *v38 = 1;
    }
    CFStringRef v37 = (const __CFString *)*((void *)&v40 + 1);
    CFStringRef v36 = (const __CFString *)v40;
    if (v40 == 0)
    {
      CFStringRef v36 = theString1;
      uint64_t CanonicalLocaleIdentifierFromString = 1;
      if (!theString1) {
        goto LABEL_43;
      }
      CFStringRef v37 = theString2a;
    }
    else
    {
      uint64_t CanonicalLocaleIdentifierFromString = 0;
      if (!(void)v40) {
        goto LABEL_43;
      }
    }
    if (v37) {
      uint64_t CanonicalLocaleIdentifierFromString = CFStringCompare(v36, v37, 1uLL) == kCFCompareEqualTo;
    }
  }
LABEL_43:
  uint64_t v31 = 0;
  char v32 = 1;
  do
  {
    char v33 = v32;
    CFRelease((CFTypeRef)*(&v45 + v31));
    v34 = (const void *)v39[v31];
    if (v34) {
      CFRelease(v34);
    }
    char v32 = 0;
    uint64_t v31 = 1;
  }
  while ((v33 & 1) != 0);
  return CanonicalLocaleIdentifierFromString;
}

CFStringRef GetScriptForLanguage(CFStringRef theString1)
{
  if (qword_10000C058 != -1) {
    dispatch_once(&qword_10000C058, &stru_100008488);
  }
  if (CFStringCompare(theString1, @"ja", 1uLL) == kCFCompareEqualTo) {
    return @"Jpan";
  }
  if (CFStringCompare(theString1, @"ko", 1uLL) == kCFCompareEqualTo) {
    return @"Kore";
  }
  if (CFStringCompare(theString1, @"zh-Hans", 1uLL) == kCFCompareEqualTo) {
    return @"Hans";
  }
  if (CFStringCompare(theString1, @"zh-Hant", 1uLL) == kCFCompareEqualTo) {
    return @"Hant";
  }
  CFArrayRef v2 = (const __CFArray *)qword_10000C050;
  v4.CFIndex length = CFArrayGetCount((CFArrayRef)qword_10000C050);
  v4.CFIndex location = 0;
  if (CFArrayContainsValue(v2, v4, theString1)) {
    return @"Latn";
  }
  else {
    return 0;
  }
}

void sub_100004628(id a1)
{
  memcpy(__dst, &off_1000084A8, sizeof(__dst));
  qword_10000C050 = (uint64_t)CFArrayCreate(0, __dst, 124, &kCFTypeArrayCallBacks);
}

uint64_t DetectEncodingOfStringData(const __CFData *a1)
{
  ucsdet_open();
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  ucsdet_setText();
  ucsdet_detect();
  Name = (const char *)ucsdet_getName();
  if (Name && (CFStringRef v5 = CFStringCreateWithCString(0, Name, 0x8000100u)) != 0)
  {
    CFStringRef v6 = v5;
    uint64_t v2 = CFStringConvertIANACharSetNameToEncoding(v5);
    CFRelease(v6);
  }
  else
  {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  ucsdet_close();
  return v2;
}

uint64_t ExtraNormalizeStringForArabic(__CFString *a1, int a2)
{
  CFStringNormalize(a1, kCFStringNormalizationFormD);
  v6.CFIndex location = 0;
  v6.CFIndex length = CFStringGetLength(a1);
  if (a2) {
    CFStringRef v4 = @"[\\u0610-\\u061A \\u064B-\\u065F \\u0670 \\u06D6-\\u06DC \\u06DF-\\u06E4 \\u06E7-\\u06E8 \\u06EA-\\u06ED] Remove";
  }
  else {
    CFStringRef v4 = @"[\\u0610-\\u061A \\u064B-\\u0652 \\u0656-\\u065F \\u0670 \\u06D6-\\u06DC \\u06E1-\\u06E3 \\u06E7-\\u06E8 \\u06EA-\\u06ED] Remove";
  }
  return CFStringTransform(a1, &v6, v4, 0);
}

BOOL ContainsLatinAlphabets(const __CFString *a1)
{
  uint64_t Length = CFStringGetLength(a1);
  __chkstk_darwin();
  CFStringRef v4 = (UniChar *)((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10.CFIndex location = 0;
  v10.CFIndex length = Length;
  CFStringGetCharacters(a1, v10, v4);
  if (Length < 1) {
    return 0;
  }
  if ((*v4 & 0xFFDFu) - 65 < 0x1A) {
    return 1;
  }
  uint64_t v6 = 1;
  do
  {
    uint64_t v7 = v6;
    if (Length == v6) {
      break;
    }
    unsigned int v8 = (v4[v6++] & 0xFFDF) - 65;
  }
  while (v8 > 0x19);
  return v7 < Length;
}

void DistanceBetweenWords(CFStringRef theString, const __CFString *a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  CFMutableStringRef v4 = CFStringCreateMutableCopy(0, 0, a2);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  CFStringNormalize(v4, kCFStringNormalizationFormD);
  CFIndex Length = CFStringGetLength(MutableCopy);
  __chkstk_darwin();
  CFMutableStringRef v34 = MutableCopy;
  v40.CFIndex location = 0;
  v40.CFIndex length = Length;
  CFStringRef v37 = (char *)v32 - v6;
  CFStringGetCharacters(MutableCopy, v40, (UniChar *)((char *)v32 - v6));
  CFIndex v7 = CFStringGetLength(v4);
  __chkstk_darwin();
  CFMutableStringRef v33 = v4;
  v41.CFIndex location = 0;
  v41.CFIndex length = v7;
  CFStringRef v36 = (char *)v32 - v8;
  CFStringGetCharacters(v4, v41, (UniChar *)((char *)v32 - v8));
  uint64_t v39 = v7;
  v32[1] = Length + 1 + (Length + 1) * v7;
  __chkstk_darwin();
  CFDictionaryRef v11 = (double *)((char *)v32 - v10);
  uint64_t v38 = Length;
  if ((Length & 0x8000000000000000) == 0)
  {
    uint64_t v12 = 0;
    do
    {
      v11[v12] = (double)v12;
      ++v12;
    }
    while (v9 != v12);
  }
  uint64_t v13 = v38;
  if ((v39 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v39 + 1;
    CFStringRef v16 = v11;
    do
    {
      *CFStringRef v16 = (double)v14++;
      CFStringRef v16 = (double *)((char *)v16 + v13 * 8 + 8);
    }
    while (v15 != v14);
  }
  v35 = v11;
  if (v38 >= 1)
  {
    CFStringRef v17 = v35 + 1;
    uint64_t v18 = 1;
    do
    {
      if (v39 >= 1)
      {
        int v19 = *(unsigned __int16 *)&v37[2 * v18 - 2];
        BOOL v20 = sub_100004C04(v19);
        if (v20) {
          double v21 = 0.1;
        }
        else {
          double v21 = 1.0;
        }
        CFStringRef v22 = (unsigned __int16 *)v36;
        CFStringRef v23 = v17;
        uint64_t v24 = v39;
        do
        {
          int v26 = *v22++;
          int v25 = v26;
          if (v19 == v26) {
            double v27 = 0.0;
          }
          else {
            double v27 = 2.0;
          }
          BOOL v28 = sub_100004C04(v25);
          if (v20 && v28)
          {
            double v29 = v27 / 100.0;
          }
          else
          {
            double v29 = v27 * 0.5;
            if (!v20 && !v28) {
              double v29 = v27;
            }
          }
          if (v28) {
            double v30 = 0.1;
          }
          else {
            double v30 = 1.0;
          }
          v23[v13 + 1] = fmin(v29 + *(v23 - 1), fmin(v21 + v23[v13], v30 + *v23));
          CFStringRef v23 = (double *)((char *)v23 + v13 * 8 + 8);
          --v24;
        }
        while (v24);
      }
      ++v17;
    }
    while (v18++ != v38);
  }
  CFRelease(v34);
  CFRelease(v33);
}

BOOL sub_100004C04(int a1)
{
  unsigned int v2 = a1 - 1552;
  BOOL result = 1;
  if (v2 >= 0xB
    && (a1 - 1611) >= 0x15
    && ((a1 - 1750) > 0x17 || ((1 << (a1 + 42)) & 0xF67E7F) == 0))
  {
    return a1 == 1648;
  }
  return result;
}

uint64_t IsWorkingInDictionaryApp()
{
  if (qword_10000C060 != -1) {
    dispatch_once(&qword_10000C060, &stru_1000088A8);
  }
  return byte_10000C068;
}

void sub_100004C98(id a1)
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
    if (Identifier) {
      BOOL v3 = CFEqual(Identifier, @"com.apple.Dictionary");
    }
    else {
      BOOL v3 = 0;
    }
    byte_10000C068 = v3;
  }
}

void DCSLog(int a1, CFStringRef format, ...)
{
  va_start(va, format);
  if (qword_10000C098 != -1) {
    dispatch_once(&qword_10000C098, &stru_1000088E8);
  }
  if (a1 > 15)
  {
    if (a1 == 16)
    {
      uint64_t v4 = 3;
      goto LABEL_13;
    }
    if (a1 == 17)
    {
      uint64_t v4 = 4;
      goto LABEL_13;
    }
  }
  else
  {
    if (a1 == 1)
    {
      uint64_t v4 = 1;
      goto LABEL_13;
    }
    if (a1 == 2)
    {
      uint64_t v4 = 2;
      goto LABEL_13;
    }
  }
  uint64_t v4 = 0;
LABEL_13:
  CFStringRef v5 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFIndex v7 = qword_10000C070[v4];
    if (os_log_type_enabled(v7, (os_log_type_t)a1))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)a1, "%{public}@", buf, 0xCu);
    }
    CFRelease(v6);
  }
}

void sub_100004E34(id a1)
{
  for (uint64_t i = 0; i != 5; ++i)
    qword_10000C070[i] = (uint64_t)os_log_create("com.apple.DictionaryServices", off_100008908[i]);
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_100004EC8(_xpc_connection_s *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100004F48;
  handler[3] = &unk_100008940;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_100004F48(uint64_t a1, xpc_object_t object)
{
  BOOL v3 = *(_xpc_connection_s **)(a1 + 32);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error) {
    return;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    sub_100006CA4();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(object);
  string = xpc_dictionary_get_string(object, "command");
  if (!strncmp(string, "read_preference", 0xFuLL))
  {
    if (!ReadSharedPreference(object, reply)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!strncmp(string, "update_preference", 0x11uLL))
  {
    if (!UpdateSharedPreference(object)) {
      goto LABEL_10;
    }
LABEL_9:
    xpc_connection_send_message(v3, reply);
    goto LABEL_10;
  }
  if (!strncmp(string, "sync_preference", 0xFuLL) && SynchronizeSharedPreference()) {
    goto LABEL_9;
  }
LABEL_10:
  if (reply)
  {
    xpc_release(reply);
  }
}

uint64_t CreateDictionaryAssets(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  CFStringRef v6 = sub_100005118(a2, a3);
  if (v6)
  {
    CFIndex v7 = v6;
    if (a3)
    {
      CFDataRef Data = CFPropertyListCreateData(0, v6, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      if (Data)
      {
        CFDataRef v9 = Data;
        BytePtr = CFDataGetBytePtr(Data);
        size_t Length = CFDataGetLength(v9);
        xpc_dictionary_set_data(a4, "result", BytePtr, Length);
        CFRelease(v9);
      }
    }
    CFRelease(v7);
  }
  return a3;
}

__CFArray *sub_100005118(uint64_t a1, int a2)
{
  uint64_t v3 = DCSMACopyDictionaryAssetsList();
  if (!v3) {
    return 0;
  }
  CFArrayRef v4 = (const __CFArray *)v3;
  if (a2)
  {
    CFStringRef v5 = (__CFDictionary *)sub_100005980(1);
    CFDictionaryRemoveAllValues(v5);
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      CFDataRef v9 = 0;
    }
    else
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0;
      CFDataRef v9 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v8);
        CFDictionaryRef v11 = DCSMAGetAssetAttributes(ValueAtIndex);
        CFURLRef v12 = (const __CFURL *)DCSMACreateAssetInstalledURL();
        if (v12)
        {
          CFURLRef v13 = v12;
          CFStringRef v14 = CFURLCopyFileSystemPath(v12, kCFURLPOSIXPathStyle);
          CFRelease(v13);
        }
        else
        {
          CFStringRef v14 = 0;
        }
        Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionarySetValue(Mutable, @"attributes", v11);
        if (v14) {
          CFDictionarySetValue(Mutable, @"installedPath", v14);
        }
        if (!v9) {
          CFDataRef v9 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        }
        CFArrayAppendValue(v9, Mutable);
        CFRelease(Mutable);
        if (v14) {
          CFRelease(v14);
        }
        CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v11, @"DictionaryIdentifier");
        if (Value) {
          CFDictionarySetValue(v5, Value, ValueAtIndex);
        }
        ++v8;
      }
      while (v7 != v8);
    }
    sub_100005980(0);
  }
  else
  {
    CFDataRef v9 = 0;
  }
  CFRelease(v4);
  return v9;
}

uint64_t DownloadDictionaryAssets(void *a1)
{
  unsigned int v2 = sub_100005324(a1);
  if (v2)
  {
    uint64_t v3 = v2;
    BOOL v4 = xpc_dictionary_get_BOOL(a1, "userInitiatedDownload");
    DCSMAForceTransparentDownload(v4);
    DCSMADownloadDictionaryAsset(v3, 0);
    DCSMAForceTransparentDownload(0);
    CFRelease(v3);
  }
  return 0;
}

const void *sub_100005324(void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)sub_100005980(1);
  if (!CFDictionaryGetCount(v2))
  {
    sub_100005980(0);
    uint64_t v3 = sub_100005118(1, 1);
    if (v3) {
      CFRelease(v3);
    }
    CFDictionaryRef v2 = (const __CFDictionary *)sub_100005980(1);
  }
  string = xpc_dictionary_get_string(a1, "dictionaryID");
  if (string && (CFStringRef v5 = CFStringCreateWithCString(0, string, 0x8000100u)) != 0)
  {
    CFStringRef v6 = v5;
    CFStringRef Value = CFDictionaryGetValue(v2, v5);
    CFIndex v8 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v6);
  }
  else
  {
    CFIndex v8 = 0;
  }
  sub_100005980(0);
  return v8;
}

uint64_t PurgeDictionaryAssets(void *a1)
{
  CFURLRef v1 = sub_100005324(a1);
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    DCSMAPurgeDictionaryAsset();
    CFRelease(v2);
  }
  return 0;
}

uint64_t CopyInstalledPathDictionaryAssets(void *a1, void *a2)
{
  uint64_t v3 = sub_100005324(a1);
  if (v3)
  {
    BOOL v4 = v3;
    CFURLRef v5 = (const __CFURL *)DCSMACreateAssetInstalledURL();
    CFRelease(v4);
    if (v5)
    {
      CFStringRef v6 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      CFRelease(v5);
      if (v6)
      {
        CFStringGetCString(v6, buffer, 255, 0x8000100u);
        xpc_dictionary_set_string(a2, "result", buffer);
        CFRelease(v6);
      }
    }
  }
  return 1;
}

uint64_t GetStateDictionaryAssets(void *a1, void *a2)
{
  uint64_t v3 = sub_100005324(a1);
  if (v3)
  {
    BOOL v4 = v3;
    int v5 = DCSMAGetAssetState();
    xpc_dictionary_set_int64(a2, "result", v5);
    CFRelease(v4);
  }
  return 1;
}

uint64_t PrepareDefaultAssets(void *a1)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, "dictionaryIDs");
  xpc_object_t v3 = value;
  if (value || (xpc_object_t v3 = xpc_dictionary_get_value(a1, "languageIDs")) != 0)
  {
    size_t count = xpc_array_get_count(v3);
    if (count)
    {
      size_t v5 = count;
      size_t v6 = 0;
      Mutable = 0;
      do
      {
        string = xpc_array_get_string(v3, v6);
        if (string)
        {
          CFStringRef v9 = CFStringCreateWithCString(0, string, 0x8000100u);
          if (v9)
          {
            CFStringRef v10 = v9;
            if (!Mutable) {
              Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
            }
            CFArrayAppendValue(Mutable, v10);
            CFRelease(v10);
          }
        }
        ++v6;
      }
      while (v5 != v6);
      if (Mutable)
      {
        if (value) {
          CFDictionaryRef v11 = Mutable;
        }
        else {
          CFDictionaryRef v11 = 0;
        }
        if (value) {
          CFURLRef v12 = 0;
        }
        else {
          CFURLRef v12 = Mutable;
        }
        DCSMAPrepareDefaultDictionaryAssets(v11, v12);
      }
    }
  }
  return 0;
}

uint64_t CreateUserDictionariesDirectory(uint64_t a1, void *a2)
{
  CFURLRef v3 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v3)
  {
    CFURLRef v4 = v3;
    CFURLRef v5 = CFURLCreateCopyAppendingPathComponent(0, v3, @"Library/Dictionaries", 1u);
    if (v5)
    {
      CFURLRef v6 = v5;
      CFStringRef v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        CFStringRef v8 = v7;
        CFIndex Length = CFStringGetLength(v7);
        CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
        CFDictionaryRef v11 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0xA2C8340uLL);
        CFStringGetCString(v8, v11, MaximumSizeForEncoding, 0x8000100u);
        BOOL v12 = mkdir(v11, 0x1FFu) == 0;
        free(v11);
        CFRelease(v8);
      }
      else
      {
        BOOL v12 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      BOOL v12 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    BOOL v12 = 0;
  }
  xpc_dictionary_set_BOOL(a2, "result", v12);
  return 1;
}

uint64_t ReadSharedPreference(void *a1, void *a2)
{
  string = xpc_dictionary_get_string(a1, "key");
  CFStringRef v5 = CFStringCreateWithCString(0, string, 0x8000100u);
  uint64_t value = 0;
  uint64_t uint64 = xpc_dictionary_get_uint64(a1, "currentVersion");
  BOOL v7 = xpc_dictionary_get_BOOL(a1, "checkVersion");
  if (v7) {
    p_uint64_t value = &value;
  }
  else {
    p_uint64_t value = 0;
  }
  CFPropertyListRef v9 = DCSCopySharedPreferenceValue(v5, uint64, p_value);
  CFRelease(v5);
  if (v9)
  {
    CFDataRef Data = CFPropertyListCreateData(0, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if (Data)
    {
      CFDataRef v11 = Data;
      BytePtr = CFDataGetBytePtr(Data);
      size_t Length = CFDataGetLength(v11);
      xpc_dictionary_set_data(a2, "value", BytePtr, Length);
      if (v7) {
        xpc_dictionary_set_uint64(a2, "savedVersion", value);
      }
      CFRelease(v11);
    }
    CFRelease(v9);
  }
  return 1;
}

uint64_t UpdateSharedPreference(void *a1)
{
  string = xpc_dictionary_get_string(a1, "key");
  if (string) {
    CFStringRef v3 = CFStringCreateWithCString(0, string, 0x8000100u);
  }
  else {
    CFStringRef v3 = 0;
  }
  size_t length = 0;
  data = (const UInt8 *)xpc_dictionary_get_data(a1, "value", &length);
  CFPropertyListRef v5 = 0;
  if (data && length)
  {
    CFDataRef v6 = CFDataCreate(0, data, length);
    CFPropertyListRef v5 = CFPropertyListCreateWithData(0, v6, 0, 0, 0);
    CFRelease(v6);
  }
  DCSUpdateSharedPreferenceValue(v3, v5);
  if (v3) {
    CFRelease(v3);
  }
  if (v5) {
    CFRelease(v5);
  }
  return 0;
}

uint64_t SynchronizeSharedPreference()
{
  return 0;
}

uint64_t sub_100005980(int a1)
{
  if (qword_10000C0E8 != -1) {
    dispatch_once(&qword_10000C0E8, &stru_100008980);
  }
  if (a1) {
    pthread_mutex_lock(&stru_10000C0A8);
  }
  else {
    pthread_mutex_unlock(&stru_10000C0A8);
  }
  return qword_10000C0A0;
}

void sub_1000059E8(id a1)
{
  qword_10000C0A0 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);

  pthread_mutex_init(&stru_10000C0A8, 0);
}

uint64_t DCSMACreateLocalDictionaryAssets_XPC()
{
  return 0;
}

uint64_t DCSMACreateAssetInstalledURL_XPC()
{
  return 0;
}

uint64_t DCSMAGetAssetState_XPC()
{
  return 1;
}

CFPropertyListRef DCSCopySharedPreferenceValue(const __CFString *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  return CFPreferencesCopyAppValue(a1, @"com.apple.DictionaryServices");
}

uint64_t DCSUpdateSharedPreferenceValue(const __CFString *a1, const void *a2)
{
  if (a1 && a2)
  {
    CFPreferencesSetAppValue(a1, a2, @"com.apple.DictionaryServices");
    uint64_t v2 = vars8;
  }
  return CFPreferencesAppSynchronize(@"com.apple.DictionaryServices");
}

uint64_t DCSSynchronizeSharedPreference()
{
  return CFPreferencesAppSynchronize(@"com.apple.DictionaryServices");
}

uint64_t DCSCreateUserDictionariesDirectory_XPC()
{
  return 0;
}

uint64_t DCSMAGetDictionaryAssetCompatibilityVersion()
{
  return 14;
}

CFStringRef DCSMAGetDictionaryAssetType()
{
  return @"com.apple.MobileAsset.DictionaryServices.dictionary2";
}

__CFArray *DCSMACopyAndUpdateDictionaryCompatibilityVersionHistory()
{
  uint64_t valuePtr = 5;
  CFNumberRef v0 = (const __CFNumber *)DCSCopySharedPreferenceValue(@"DCSLastUsedAssetCompatibilityVersion", 0, 0);
  if (v0)
  {
    CFNumberRef v1 = v0;
    CFNumberGetValue(v0, kCFNumberCFIndexType, &valuePtr);
    CFRelease(v1);
    if (valuePtr > 13) {
      return 0;
    }
  }
  uint64_t v8 = 14;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberCFIndexType, &v8);
  DCSUpdateSharedPreferenceValue(@"DCSLastUsedAssetCompatibilityVersion", v4);
  CFRelease(v4);
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  for (uint64_t i = valuePtr; ; uint64_t i = v7)
  {
    uint64_t v7 = i + 1;
    if (i >= v8) {
      break;
    }
    CFNumberRef v6 = CFNumberCreate(0, kCFNumberCFIndexType, &v7);
    CFArrayAppendValue(Mutable, v6);
    CFRelease(v6);
  }
  return Mutable;
}

uint64_t DCSMAPrepareMobileAssetQuery()
{
  return 1;
}

uint64_t DCSMACreateDictionaryAssets()
{
  return 0;
}

uint64_t _SetOrGetForceTransparentDownloadFlag()
{
  return 1;
}

uint64_t DCSMATransparentDownloadAllowed()
{
  return 1;
}

uint64_t DCSMAGetAssetState()
{
  return 1;
}

uint64_t DCSMACreateAssetInstalledURL()
{
  return 0;
}

const void *DCSMAGetAssetAttributes(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"attributes");
}

CFStringRef DCSMAGetAssetLanguage(const __CFDictionary *a1)
{
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"attributes");
  if (!Value) {
    return 0;
  }
  CFDictionaryRef v2 = Value;
  CFStringRef v3 = (const __CFString *)CFDictionaryGetValue(Value, @"Language");
  CFStringRef v4 = v3;
  if (v3)
  {
    if (CFStringCompare(v3, @"en", 1uLL) == kCFCompareEqualTo)
    {
      CFArrayRef v5 = (const __CFArray *)CFDictionaryGetValue(v2, @"Countries");
      if (v5)
      {
        CFArrayRef v6 = v5;
        v8.size_t length = CFArrayGetCount(v5);
        v8.CFIndex location = 0;
        if (CFArrayGetFirstIndexOfValue(v6, v8, @"US") == -1) {
          return @"en_GB";
        }
        else {
          return @"en_US";
        }
      }
    }
  }
  return v4;
}

uint64_t DCSMAIsLanguageDictionaryAsset(const __CFDictionary *a1)
{
  if (DCSMAGetAssetLanguage(a1)) {
    return 1;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"attributes");
  CFArrayRef v4 = (const __CFArray *)CFDictionaryGetValue(Value, @"IndexLanguages");
  if (v4)
  {
    CFArrayRef v5 = v4;
    uint64_t Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v8.CFIndex location = 0;
      v8.size_t length = Count;
      BOOL v7 = CFArrayGetFirstIndexOfValue(v5, v8, @"*") == -1;
      return Count > 1 && v7;
    }
  }
  else
  {
    uint64_t Count = 0;
  }
  BOOL v7 = 1;
  return Count > 1 && v7;
}

uint64_t DCSMAPreferredOrderOfDictionaryAssetAttributesForLanguages(const void *a1, CFArrayRef theArray)
{
  if (!theArray) {
    return -1;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  uint64_t v5 = -1;
  if (a1)
  {
    uint64_t v6 = Count;
    if (Count)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, @"attributes", a1);
      if (!DCSMAIsLanguageDictionaryAsset(Mutable))
      {
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"DictionaryIdentifier");
        if (Value)
        {
          if (CFStringCompare(Value, @"com.apple.dictionary.AppleDictionary", 0)) {
            uint64_t v5 = -1;
          }
          else {
            uint64_t v5 = 1000;
          }
        }
        goto LABEL_46;
      }
      CFStringRef v8 = DCSMAGetAssetLanguage(Mutable);
      if (!v8)
      {
        CFArrayRef v14 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a1, @"IndexLanguages");
        if (v14)
        {
          CFArrayRef v15 = v14;
          CFIndex v16 = CFArrayGetCount(v14);
          if (v16 >= 1)
          {
            CFIndex v17 = v16;
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
            CFStringRef v19 = (const __CFString *)CFArrayGetValueAtIndex(v15, 0);
            if (CompareLanguageCode(ValueAtIndex, v19, 0))
            {
              BOOL v20 = 1;
            }
            else
            {
              CFIndex v23 = 1;
              do
              {
                if (v17 == v23)
                {
LABEL_13:
                  uint64_t v5 = -1;
                  goto LABEL_46;
                }
                CFStringRef v24 = (const __CFString *)CFArrayGetValueAtIndex(v15, v23++);
              }
              while (!CompareLanguageCode(ValueAtIndex, v24, 0));
              BOOL v20 = v23 - 1 < v17;
            }
            uint64_t v5 = -1;
            if (v20 && v6 >= 2)
            {
              CFIndex v25 = 1;
              uint64_t v26 = 1;
              while (2)
              {
                CFStringRef v27 = (const __CFString *)CFArrayGetValueAtIndex(theArray, v25);
                CFIndex v28 = 0;
                while (1)
                {
                  CFStringRef v29 = (const __CFString *)CFArrayGetValueAtIndex(v15, v28);
                  if (CompareLanguageCode(v27, v29, 0)) {
                    break;
                  }
                  if (v17 == ++v28) {
                    goto LABEL_41;
                  }
                }
                if (++v26 == v17)
                {
                  uint64_t v5 = 3;
                  goto LABEL_46;
                }
LABEL_41:
                ++v25;
                uint64_t v5 = -1;
                if (v25 != v6) {
                  continue;
                }
                break;
              }
            }
          }
        }
        goto LABEL_46;
      }
      if (v6 >= 1)
      {
        CFStringRef v9 = v8;
        uint64_t v5 = 0;
        CFIndex v10 = 0;
        while (1)
        {
          CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(theArray, v10);
          if (CompareLanguageCode(v11, v9, 0)) {
            break;
          }
          int v12 = CompareLanguageCode(v11, @"hi", 0);
          if (!v10 && v12 && CompareLanguageCode(v9, @"en_GB", 0))
          {
            uint64_t v5 = 10;
            break;
          }
          ++v10;
          v5 += 20;
          if (v6 == v10) {
            goto LABEL_13;
          }
        }
        CFStringRef v21 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"DictionaryType");
        if (!v21)
        {
LABEL_28:
          v5 += 4;
          goto LABEL_46;
        }
        CFStringRef v22 = v21;
        if (CFStringCompare(v21, @"Monolingual", 1uLL))
        {
          if (CFStringCompare(v22, @"Bilingual", 1uLL) == kCFCompareEqualTo)
          {
            v5 += 2;
            goto LABEL_46;
          }
          if (CFStringCompare(v22, @"Thesaurus", 1uLL) == kCFCompareEqualTo)
          {
            v5 |= 1uLL;
            goto LABEL_46;
          }
          goto LABEL_28;
        }
      }
LABEL_46:
      CFRelease(Mutable);
    }
  }
  return v5;
}

uint64_t DCSMACopyDictionaryAssetsList()
{
  return 0;
}

CFDictionaryRef DCSMAGetAssetObj(const __CFDictionary *result)
{
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, @"asset");
  }
  return result;
}

void DCSMAUpdateLinguisticData(uint64_t a1, const __CFArray *a2, int a3)
{
  if (a1 && a2)
  {
    if (a3) {
      AddLinguisticDataAssetion(a1, a2);
    }
    else {
      RemoveLinguisticDataAssetion(a1, a2);
    }
  }
}

void DCSMAUpdateLinguisticDataForDictionaryAssetAttribute(const __CFDictionary *a1, int a2)
{
  if (a1)
  {
    CFStringRef Value = CFDictionaryGetValue(a1, @"DictionaryIdentifier");
    if (Value)
    {
      uint64_t v5 = (uint64_t)Value;
      CFArrayRef v6 = (const __CFArray *)CFDictionaryGetValue(a1, @"IndexLanguages");
      if (v6)
      {
        CFArrayRef v7 = v6;
        CFRetain(v6);
      }
      else
      {
        values = (void *)CFDictionaryGetValue(a1, @"Language");
        if (!values) {
          return;
        }
        CFArrayRef v7 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
        if (!v7) {
          return;
        }
      }
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, @"attributes", a1);
      if (DCSMAIsLanguageDictionaryAsset(Mutable))
      {
        if (a2) {
          AddLinguisticDataAssetion(v5, v7);
        }
        else {
          RemoveLinguisticDataAssetion(v5, v7);
        }
      }
      CFRelease(Mutable);
      CFRelease(v7);
    }
  }
}

id DCSMAIsInstalledAsset(const __CFDictionary *Value)
{
  if (Value) {
    CFStringRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"asset");
  }

  return [(__CFDictionary *)Value wasLocal];
}

id DCSMAIsDeletableAsset(const __CFDictionary *Value)
{
  if (Value) {
    CFStringRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, @"asset");
  }

  return [(__CFDictionary *)Value wasPurgeable];
}

uint64_t NewAutoReleasePool()
{
  if (qword_10000C108 != -1) {
    dispatch_once(&qword_10000C108, &stru_100008AF8);
  }
  if (!qword_10000C110) {
    return 0;
  }
  uint64_t v0 = *(void *)qword_10000C110;

  return _objc_opt_new(v0);
}

BOOL IsManagedConfigProfanityFilterForced()
{
  if (qword_10000C118 != -1) {
    dispatch_once(&qword_10000C118, &stru_100008B18);
  }
  uint64_t v0 = qword_10000C120;
  if (!qword_10000C120) {
    return 0;
  }
  CFNumberRef v1 = (void *)NewAutoReleasePool();
  unsigned int v2 = objc_msgSend(objc_msgSend(*(id *)(v0 + 8), "sharedConnection"), "effectiveBoolValueForSetting:", *(void *)(v0 + 16));

  return v2 == 1;
}

void SetManagedConfigChangedCallback(uint64_t a1)
{
  if (qword_10000C118 != -1) {
    dispatch_once(&qword_10000C118, &stru_100008B18);
  }
  if (qword_10000C120)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006438;
    block[3] = &unk_100008A28;
    block[4] = qword_10000C120;
    if (qword_10000C0F0 != -1) {
      dispatch_once(&qword_10000C0F0, block);
    }
    if (qword_10000C100) {
      [(id)qword_10000C100 setCallbackBlock:a1];
    }
  }
}

IMP sub_100006438(uint64_t a1)
{
  Class = objc_getClass("NSObject");
  qword_10000C0F8 = (uint64_t)objc_allocateClassPair(Class, "DCSManagedConfigChangeReceiver", 0);
  BOOL v3 = class_addIvar((Class)qword_10000C0F8, "_callbackBlock", 8uLL, 3u, "@");
  objc_registerClassPair((Class)qword_10000C0F8);
  if (v3)
  {
    CFArrayRef v4 = imp_implementationWithBlock(&stru_1000089C8);
    BOOL v5 = class_addMethod((Class)qword_10000C0F8, "setCallbackBlock:", v4, "v@:@");
    IMP result = imp_implementationWithBlock(&stru_100008A08);
    if (v5)
    {
      IMP result = (IMP)class_addMethod((Class)qword_10000C0F8, "profileConnectionDidReceiveEffectiveSettingsChangedNotification:userInfo:", result, "v@:@@");
      if (result)
      {
        qword_10000C100 = (uint64_t)[(id)qword_10000C0F8 new];
        id v7 = [*(id *)(*(void *)(a1 + 32) + 8) sharedConnection];
        uint64_t v8 = qword_10000C100;
        return (IMP)[v7 addObserver:v8];
      }
    }
  }
  else
  {
    if (qword_10000C0F8) {
      objc_disposeClassPair((Class)qword_10000C0F8);
    }
    qword_10000C0F8 = 0;
    imp_implementationWithBlock(&stru_1000089C8);
    return imp_implementationWithBlock(&stru_100008A08);
  }
  return result;
}

void sub_1000065A8(id a1, id a2, id a3)
{
  InstanceVariable = class_getInstanceVariable((Class)qword_10000C0F8, "_callbackBlock");
  id Ivar = object_getIvar(a2, InstanceVariable);
  if (Ivar) {

  }
  id v7 = _Block_copy(a3);

  object_setIvar(a2, InstanceVariable, v7);
}

void sub_100006624(id a1, id a2, id a3, id a4)
{
  InstanceVariable = class_getInstanceVariable((Class)qword_10000C0F8, "_callbackBlock");
  id Ivar = object_getIvar(a2, InstanceVariable);
  if (Ivar)
  {
    id v7 = (void (*)(void))*((void *)Ivar + 2);
    v7();
  }
}

void AddLinguisticDataAssetion(uint64_t a1, const __CFArray *a2)
{
  DCSLog(16, @"AddLinguisticDataAssetion_iOS for dictionary (%@) with languages (%@)", a1, a2);
  if (a1 && a2)
  {
    if (qword_10000C128 != -1) {
      dispatch_once(&qword_10000C128, &stru_100008B38);
    }
    CFArrayRef v4 = (id *)qword_10000C130;
    if (qword_10000C130)
    {
      int v12 = (void *)NewAutoReleasePool();
      id v5 = [*v4 new];
      *(_OWORD *)keys = *(_OWORD *)&off_100008A48;
      CFStringRef v16 = @"City";
      *(_OWORD *)values = *(_OWORD *)&off_100008A60;
      CFStringRef v14 = &stru_100009FF8;
      CFDictionaryRef v6 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFIndex Count = CFArrayGetCount(a2);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
          CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%@;%@;%@",
                  @"com.apple.DictionaryServices",
                  ValueAtIndex,
                  a1);
          DCSLog(16, @"AddLinguisticDataAssetion_iOS actually adding language (%@) to client (%@)", ValueAtIndex, v5);
          [v5 addLinguisticAssetsAssertionForLanguage:ValueAtIndex assertionID:v11 region:v6 clientID:@"com.apple.DictionaryServices" withHandler:&stru_100008A98];
          CFRelease(v11);
        }
      }
      CFRelease(v6);
    }
  }
}

void RemoveLinguisticDataAssetion(uint64_t a1, const __CFArray *a2)
{
  DCSLog(16, @"RemoveLinguisticDataAssetion_iOS for dictionary (%@) with languages (%@)", a1, a2);
  if (a1 && a2)
  {
    if (qword_10000C128 != -1) {
      dispatch_once(&qword_10000C128, &stru_100008B38);
    }
    CFArrayRef v4 = (id *)qword_10000C130;
    if (qword_10000C130)
    {
      id v11 = (id)NewAutoReleasePool();
      id v5 = [*v4 new];
      CFIndex Count = CFArrayGetCount(a2);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        for (CFIndex i = 0; i != v7; ++i)
        {
          CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
          CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%@;%@;%@",
                  @"com.apple.DictionaryServices",
                  ValueAtIndex,
                  a1);
          DCSLog(16, @"RemoveLinguisticDataAssetion_iOS actually removing language (%@) from client (%@)", ValueAtIndex, v5);
          [v5 removeLinguisticAssetsAssertionWithIdentifier:v10 forClientID:@"com.apple.DictionaryServices" withHandler:&stru_100008AB8];
          CFRelease(v10);
        }
      }
    }
  }
}

void sub_100006A18(id a1)
{
  qword_10000C110 = (uint64_t)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  CFURLRef v1 = CFURLCreateWithFileSystemPath(0, @"/System/Library/Frameworks/Foundation.framework", kCFURLPOSIXPathStyle, 1u);
  if (v1)
  {
    CFURLRef v2 = v1;
    BOOL v3 = CFBundleCreate(0, v1);
    CFRelease(v2);
    if (v3)
    {
      if (!CFBundleIsExecutableLoaded(v3)) {
        CFBundleLoadExecutable(v3);
      }
      if (CFBundleIsExecutableLoaded(v3)) {
        *(void *)qword_10000C110 = objc_getClass("NSAutoreleasePool");
      }
    }
  }
  if (!*(void *)qword_10000C110)
  {
    free((void *)qword_10000C110);
    qword_10000C110 = 0;
  }
}

void sub_100006AE4(id a1)
{
  qword_10000C120 = (uint64_t)malloc_type_calloc(1uLL, 0x18uLL, 0xE00409BBF8FE8uLL);
  CFURLRef v1 = CFURLCreateWithFileSystemPath(0, @"/System/Library/PrivateFrameworks/ManagedConfiguration.framework", kCFURLPOSIXPathStyle, 1u);
  if (v1)
  {
    CFURLRef v2 = v1;
    BOOL v3 = CFBundleCreate(0, v1);
    CFRelease(v2);
    if (v3)
    {
      if (!CFBundleIsExecutableLoaded(v3)) {
        CFBundleLoadExecutable(v3);
      }
      if (CFBundleIsExecutableLoaded(v3))
      {
        *(void *)(qword_10000C120 + 8) = objc_getClass("MCProfileConnection");
        DataPointerForName = CFBundleGetDataPointerForName(v3, @"MCFeatureAssistantProfanityFilterForced");
        if (DataPointerForName) {
          *(void *)(qword_10000C120 + 16) = *DataPointerForName;
        }
      }
    }
  }
  if (!*(void *)(qword_10000C120 + 8) || !*(void *)(qword_10000C120 + 16))
  {
    free((void *)qword_10000C120);
    qword_10000C120 = 0;
  }
}

void sub_100006BD8(id a1)
{
  qword_10000C130 = (uint64_t)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  CFURLRef v1 = CFURLCreateWithFileSystemPath(0, @"/System/Library/PrivateFrameworks/TextInput.framework", kCFURLPOSIXPathStyle, 1u);
  if (v1)
  {
    CFURLRef v2 = v1;
    BOOL v3 = CFBundleCreate(0, v1);
    CFRelease(v2);
    if (v3)
    {
      if (!CFBundleIsExecutableLoaded(v3)) {
        CFBundleLoadExecutable(v3);
      }
      if (CFBundleIsExecutableLoaded(v3)) {
        *(void *)qword_10000C130 = objc_getClass("TILinguisticAssetDownloadClient");
      }
    }
  }
  if (!*(void *)qword_10000C130)
  {
    free((void *)qword_10000C130);
    qword_10000C130 = 0;
  }
}

void sub_100006CA4()
{
  __assert_rtn("DictionaryServiceHelper_peer_event_handler", "main.c", 74, "type == XPC_TYPE_DICTIONARY");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return _CFBundleCopyLocalizationsForPreferences(locArray, prefArray);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return _CFBundleGetDataPointerForName(bundle, symbolName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return _CFBundleIsExecutableLoaded(bundle);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return _CFBundleLoadExecutable(bundle);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return _CFCopyHomeDirectoryURLForUser();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLocaleIdentifierFromString(allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return _CFLocaleCreateComponentsFromLocaleIdentifier(allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return _CFLocaleCreateLocaleIdentifierFromComponents(allocator, dictionary);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return _CFStringConvertIANACharSetNameToEncoding(theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return _CFStringTransform(string, range, transform, reverse);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return _CFURLCopyAbsoluteURL(relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return _CFURLHasDirectoryPath(anURL);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

uint64_t _CFStringTokenizerTokenize()
{
  return __CFStringTokenizerTokenize();
}

uint64_t _CFStringTokenizerTokenizeCompoundWord()
{
  return __CFStringTokenizerTokenizeCompoundWord();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return _asl_log(client, msg, level, format);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addIvar(Class cls, const char *name, size_t size, uint8_t alignment, const char *types)
{
  return _class_addIvar(cls, name, size, alignment, types);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return _class_getInstanceVariable(cls, name);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return _objc_allocateClassPair(superclass, name, extraBytes);
}

void objc_disposeClassPair(Class cls)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

id object_getIvar(id a1, Ivar a2)
{
  return _object_getIvar(a1, a2);
}

void object_setIvar(id obj, Ivar ivar, id value)
{
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t ucsdet_close()
{
  return _ucsdet_close();
}

uint64_t ucsdet_detect()
{
  return _ucsdet_detect();
}

uint64_t ucsdet_getName()
{
  return _ucsdet_getName();
}

uint64_t ucsdet_open()
{
  return _ucsdet_open();
}

uint64_t ucsdet_setText()
{
  return _ucsdet_setText();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}
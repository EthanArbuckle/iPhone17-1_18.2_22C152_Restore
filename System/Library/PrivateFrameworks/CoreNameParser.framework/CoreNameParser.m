void sub_1E3BBE608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id charSetWithEndpoints(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v14 = &a9;
  v10 = objc_opt_new();
  if (a1 >= 1)
  {
    int v11 = 1;
    do
    {
      v14 += 2;
      objc_msgSend(v10, "addCharactersInRange:");
      v11 += 2;
    }
    while (v11 <= a1);
  }
  v12 = (void *)[v10 copy];

  return v12;
}

uint64_t _NPStripDiatritics(void *a1, const char *a2)
{
  return [a1 stringByApplyingTransform:@"NFKD; Latin-ASCII; NFC;" reverse:0];
}

__CFString *_NPCollapseWhitespaceAndStrip(void *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v2 = [v1 length];
  if (!v2) {
    goto LABEL_35;
  }
  unint64_t v3 = v2;
  if (v2 > 0x1FF)
  {
    v5 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    if (v5) {
      goto LABEL_5;
    }
LABEL_35:
    v29 = (__CFString *)v1;
    goto LABEL_48;
  }
  MEMORY[0x1F4188790]();
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v5, v4);
LABEL_5:
  v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  CFStringRef v7 = (const __CFString *)v1;
  v8 = (__CFString *)v7;
  if (v7)
  {
    memset(buffer, 0, sizeof(buffer));
    CFIndex Length = CFStringGetLength(v7);
    v37 = v8;
    uint64_t v40 = 0;
    CFIndex v41 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v8);
    CStringPtr = 0;
    v38 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
    }
    v34 = v8;
    unint64_t v35 = v3;
    int64_t v42 = 0;
    int64_t v43 = 0;
    v39 = CStringPtr;
    if (Length < 1)
    {
      unint64_t v15 = 0;
      char v14 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      int64_t v13 = 0;
      char v14 = 0;
      unint64_t v15 = 0;
      char v16 = 1;
      uint64_t v17 = 64;
      do
      {
        if ((unint64_t)v13 >= 4) {
          uint64_t v18 = 4;
        }
        else {
          uint64_t v18 = v13;
        }
        CFIndex v19 = v41;
        if (v41 <= v13)
        {
          UniChar v20 = 0;
        }
        else if (v38)
        {
          UniChar v20 = v38[v13 + v40];
        }
        else if (v39)
        {
          UniChar v20 = v39[v40 + v13];
        }
        else
        {
          int64_t v22 = v42;
          if (v43 <= v13 || v42 > v13)
          {
            uint64_t v24 = -v18;
            uint64_t v25 = v18 + v12;
            uint64_t v26 = v17 - v18;
            int64_t v27 = v13 + v24;
            CFIndex v28 = v27 + 64;
            if (v27 + 64 >= v41) {
              CFIndex v28 = v41;
            }
            int64_t v42 = v27;
            int64_t v43 = v28;
            if (v41 >= v26) {
              CFIndex v19 = v26;
            }
            v46.length = v19 + v25;
            v46.location = v27 + v40;
            CFStringGetCharacters(v37, v46, (UniChar *)buffer);
            int64_t v22 = v42;
          }
          UniChar v20 = *((_WORD *)buffer + v13 - v22);
        }
        int v21 = objc_msgSend(v6, "characterIsMember:", v20, v34, v35);
        if (v21)
        {
          if ((v16 & 1) == 0)
          {
            *(_WORD *)&v5[2 * v15++] = 32;
            char v14 = v14 & 1 | (v20 != 32);
          }
        }
        else
        {
          *(_WORD *)&v5[2 * v15++] = v20;
        }
        ++v13;
        --v12;
        ++v17;
        char v16 = v21;
      }
      while (Length != v13);
    }
    char v30 = v14;
    unint64_t v3 = v35;
    v8 = v34;
  }
  else
  {
    unint64_t v15 = 0;
    char v30 = 0;
  }

  do
  {
    unint64_t v31 = v15;
    if (!v15) {
      break;
    }
    --v15;
  }
  while (*(_WORD *)&v5[2 * v31 - 2] == 32);
  if ((v30 & 1) != 0 || v31 < [(__CFString *)v8 length])
  {
    uint64_t v32 = [[NSString alloc] initWithCharacters:v5 length:v31];

    v8 = (__CFString *)v32;
  }
  if (v3 >= 0x200) {
    free(v5);
  }
  v29 = v8;

LABEL_48:
  return v29;
}

id _NPStripQuotationMarks(void *a1)
{
  id v1 = a1;
  if (![v1 length]) {
    goto LABEL_7;
  }
  if (_NPStripQuotationMarks_onceToken != -1) {
    dispatch_once(&_NPStripQuotationMarks_onceToken, &__block_literal_global_2);
  }
  uint64_t v2 = [v1 characterAtIndex:0];
  uint64_t v3 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1);
  if ([(id)_NPStripQuotationMarks_quotationMarksCharset characterIsMember:v2]
    && [(id)_NPStripQuotationMarks_quotationMarksCharset characterIsMember:v3])
  {
    id v4 = [v1 stringByTrimmingCharactersInSet:_NPStripQuotationMarks_quotationMarksCharset];
  }
  else
  {
LABEL_7:
    id v4 = v1;
  }
  v5 = v4;

  return v5;
}

id _NPRemoveEmojis(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  int64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  [v1 length];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  UniChar v20 = ___NPRemoveEmojis_block_invoke;
  int v21 = &unk_1E6E1CB40;
  int64_t v22 = &v23;
  CEMEnumerateEmojiTokensInStringWithBlock();
  if (v24[5])
  {
    uint64_t v2 = (void *)[v1 mutableCopy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v3 = objc_msgSend((id)v24[5], "reverseObjectEnumerator", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v3);
          }
          CFStringRef v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v8 = (void *)MEMORY[0x1E4E70970]();
          unint64_t v9 = [v7 rangeValue];
          uint64_t v11 = v10;
          if (v9 < [v2 length] - 1) {
            objc_msgSend(v2, "replaceCharactersInRange:withString:", v9, v11, &stru_1F3F3F078);
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v29 count:16];
      }
      while (v4);
    }

    id v12 = (id)[v2 copy];
  }
  else
  {
    id v12 = v1;
  }
  _Block_object_dispose(&v23, 8);

  return v12;
}

void sub_1E3BC165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id _NPTrimNonLetters(void *a1)
{
  uint64_t v1 = _NPTrimNonLetters_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_NPTrimNonLetters_onceToken, &__block_literal_global_14);
  }
  uint64_t v3 = [v2 stringByTrimmingCharactersInSet:_NPTrimNonLetters_nonLetterCharacterSet];

  return v3;
}

id _NPTokenizeName(void *a1)
{
  id v1 = a1;
  if (![v1 length])
  {
    uint64_t v3 = 0;
    goto LABEL_40;
  }
  id v2 = malloc_type_malloc(2 * [v1 length], 0x1000040BDFB0063uLL);
  uint64_t v3 = objc_opt_new();
  CFStringRef v4 = (const __CFString *)v1;
  if (!v4) {
    goto LABEL_38;
  }
  uint64_t v5 = (__CFString *)v4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  CFIndex Length = CFStringGetLength(v4);
  CFStringRef theString = v5;
  uint64_t v38 = 0;
  CFIndex v39 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v5);
  CStringPtr = 0;
  v36 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  }
  int64_t v40 = 0;
  int64_t v41 = 0;
  v37 = CStringPtr;
  if (Length < 1)
  {
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v9 = 0;
  int64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 64;
  do
  {
    if ((unint64_t)v10 >= 4) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = v10;
    }
    CFIndex v14 = v39;
    if (v39 <= v10)
    {
      UniChar v15 = 0;
LABEL_31:
      v2[v11++] = v15;
      goto LABEL_34;
    }
    if (v36)
    {
      UniChar v15 = v36[v10 + v38];
    }
    else if (v37)
    {
      UniChar v15 = v37[v38 + v10];
    }
    else
    {
      int64_t v16 = v40;
      if (v41 <= v10 || v40 > v10)
      {
        uint64_t v18 = -v13;
        uint64_t v19 = v13 + v9;
        uint64_t v20 = v12 - v13;
        int64_t v21 = v10 + v18;
        CFIndex v22 = v21 + 64;
        if (v21 + 64 >= v39) {
          CFIndex v22 = v39;
        }
        int64_t v40 = v21;
        int64_t v41 = v22;
        if (v39 >= v20) {
          CFIndex v14 = v20;
        }
        v43.length = v14 + v19;
        v43.location = v21 + v38;
        CFStringGetCharacters(theString, v43, (UniChar *)&v27);
        int64_t v16 = v40;
      }
      UniChar v15 = *((_WORD *)&v27 + v10 - v16);
    }
    if (v15 == 47) {
      goto LABEL_29;
    }
    if (v15 != 44)
    {
      if (v15 != 32) {
        goto LABEL_31;
      }
LABEL_29:
      if (!v11) {
        goto LABEL_34;
      }
      uint64_t v23 = (void *)[[NSString alloc] initWithCharacters:v2 length:v11];
      [v3 addObject:v23];

      goto LABEL_33;
    }
    id v24 = [NSString alloc];
    uint64_t v25 = objc_msgSend(v24, "initWithCharacters:length:", v2, v11, v27, v28, v29, v30, v31, v32, v33, v34);
    [v3 addObject:v25];

    [v3 addObject:@","];
LABEL_33:
    uint64_t v11 = 0;
LABEL_34:
    ++v10;
    --v9;
    ++v12;
  }
  while (Length != v10);

  if (v11)
  {
    uint64_t v5 = (__CFString *)[[NSString alloc] initWithCharacters:v2 length:v11];
    [v3 addObject:v5];
    goto LABEL_37;
  }
LABEL_38:
  free(v2);
LABEL_40:

  return v3;
}

id _NPRemoveParenthesisBracketsAndInside(void *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___NPRemoveParenthesisBracketsAndInside_block_invoke;
  block[3] = &unk_1E6E1CB68;
  v6 = @"(\\(.*?\\)|\\[.*?\\]|<.*?>)";
  uint64_t v1 = _NPRemoveParenthesisBracketsAndInside_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_NPRemoveParenthesisBracketsAndInside_onceToken, block);
  }
  uint64_t v3 = objc_msgSend((id)_NPRemoveParenthesisBracketsAndInside_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1F3F3F078);

  return v3;
}

id _NPRemoveAppSignature(void *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___NPRemoveAppSignature_block_invoke;
  block[3] = &unk_1E6E1CB68;
  v6 = @"via linkedin";
  uint64_t v1 = _NPRemoveAppSignature_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_NPRemoveAppSignature_onceToken, block);
  }
  uint64_t v3 = objc_msgSend((id)_NPRemoveAppSignature_appSignatureRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1F3F3F078);

  return v3;
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1F4113C70]();
}

uint64_t CFBurstTrieContains()
{
  return MEMORY[0x1F40D7620]();
}

uint64_t CFBurstTrieCreateFromFile()
{
  return MEMORY[0x1F40D7638]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x1F40D7658]();
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}
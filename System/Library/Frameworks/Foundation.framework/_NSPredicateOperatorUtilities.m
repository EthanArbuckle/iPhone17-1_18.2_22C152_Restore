@interface _NSPredicateOperatorUtilities
+ (BOOL)doRegexForString:(id)a3 pattern:(id)a4 likeProtect:(BOOL)a5 flags:(unint64_t)a6 context:(id *)a7;
+ (__CFLocale)retainedLocale;
+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4;
+ (int64_t)copyRegexFindSafePattern:(id)a3 toBuffer:(unsigned __int16 *)a4;
@end

@implementation _NSPredicateOperatorUtilities

+ (BOOL)doRegexForString:(id)a3 pattern:(id)a4 likeProtect:(BOOL)a5 flags:(unint64_t)a6 context:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  CFStringRef v46 = (const __CFString *)a4;
  unint64_t v12 = [a4 length];
  if (v12 >> 30 || (unint64_t v13 = v12, v14 = [a3 length], v14 >> 30)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid string or pattern length (too long)" userInfo:0]);
  }
  unint64_t v44 = a6 & 2;
  unint64_t v45 = a6 & 1;
  if ((a6 & 2) != 0) {
    CFStringCompareFlags v15 = ((uint64_t)(a6 << 63) >> 63) & 1 | 0x180;
  }
  else {
    CFStringCompareFlags v15 = ((uint64_t)(a6 << 63) >> 63) & 0x101;
  }
  UErrorCode status = U_ZERO_ERROR;
  a7->var2 = 3;
  if (!a7->var1)
  {
    v43[1] = v43;
    CFIndex v49 = v13;
    MEMORY[0x1F4188790](v14);
    v17 = (UChar *)((char *)v43 - v16);
    unsigned __int8 v48 = 0;
    if (v13 >= 0x1C2)
    {
      size_t v18 = v13 + 200;
      v17 = (UChar *)malloc_type_malloc(2 * (v13 + 200), 0x1000040BDFB0063uLL);
      unsigned __int8 v48 = 1;
    }
    else
    {
      size_t v18 = 1024;
    }
    v47 = v17;
    if ((a6 & 4) != 0)
    {
      v52.location = 0;
      v52.length = v13;
      CFStringGetCharacters(v46, v52, v17);
      v17[v13] = 0;
      a7->var0 = (id)CFStringCreateWithCharacters(0, v17, v13);
      if (v9)
      {
        [a1 copyRegexFindSafePattern:v46 toBuffer:v17];
        LODWORD(v13) = u_strlen(v17);
        CFIndex v49 = (int)v13;
      }
    }
    else
    {
      _doPatternNormalization(v46, (void **)&v47, &v48, v9, (CFStringRef *)a7, v15, &v49, v18, kCFStringNormalizationFormKC);
      v17 = v47;
      LODWORD(v13) = v49;
    }
    v19 = uregex_open(v17, v13, 0x28u, 0, &status);
    UErrorCode v20 = status;
    if (status < U_ILLEGAL_ARGUMENT_ERROR || (a6 & 4) != 0)
    {
      if (status < U_ILLEGAL_ARGUMENT_ERROR)
      {
        int64_t v22 = 3;
        goto LABEL_24;
      }
    }
    else
    {

      a7->var0 = 0;
      _doPatternNormalization(v46, (void **)&v47, &v48, v9, (CFStringRef *)a7, v15, &v49, v18, kCFStringNormalizationFormC);
      if (v19) {
        uregex_close(v19);
      }
      UErrorCode status = U_ZERO_ERROR;
      v19 = uregex_open(v47, v49, 0x28u, 0, &status);
      if (status < U_ILLEGAL_ARGUMENT_ERROR)
      {
        int64_t v22 = 2;
LABEL_24:
        a7->var1 = v19;
        a7->var2 = v22;
        if (v48) {
          free(v47);
        }
        goto LABEL_26;
      }
      UErrorCode status = v20;
    }
    v39 = +[NSString stringWithFormat:@"Can't open pattern %s (string %@, pattern %@, case %ld, canon %ld)", u_errorName(v20), a3, v46, v45, v44];
    uregex_close(v19);
    if (v48) {
      free(v47);
    }
    v40 = (void *)MEMORY[0x1E4F1CA00];
    if (status == U_REGEX_RULE_SYNTAX)
    {
      v41 = +[NSString stringWithFormat:@"Can't do regex matching, reason: (%@)", v39];
      objc_exception_throw((id)[v40 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v41 userInfo:0]);
    }
    v42 = +[NSString stringWithFormat:@"Can't do regex matching, reason: %@", v39];
    objc_exception_throw((id)[v40 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v42 userInfo:0]);
  }
LABEL_26:
  uint64_t Length = CFStringGetLength((CFStringRef)a3);
  BOOL v24 = Length > 899;
  MEMORY[0x1F4188790](Length);
  v26 = (UniChar *)((char *)v43 - v25);
  if (v27 < 900)
  {
    CFIndex v28 = 1024;
  }
  else
  {
    CFIndex v28 = Length + 200;
    v26 = (UniChar *)malloc_type_malloc(2 * (Length + 200), 0x1000040BDFB0063uLL);
  }
  v53.location = 0;
  v53.length = Length;
  CFStringGetCharacters((CFStringRef)a3, v53, v26);
  v26[Length] = 0;
  if (((a6 >> 2) & 1) == 0)
  {
    MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v26, Length, v28, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    v30 = MutableWithExternalCharactersNoCopy;
    if ((a6 & 3) != 0) {
      CFStringFold(MutableWithExternalCharactersNoCopy, v15, 0);
    }
    CFStringNormalize(v30, (CFStringNormalizationForm)a7->var2);
    if (CFStringGetCharactersPtr(v30) == v26)
    {
      LODWORD(Length) = CFStringGetLength(v30);
    }
    else
    {
      if (Length >= 900) {
        free(v26);
      }
      uint64_t Length = CFStringGetLength(v30);
      v31 = (UniChar *)malloc_type_malloc(2 * Length + 2, 0x1000040BDFB0063uLL);
      BOOL v24 = 1;
      v54.location = 0;
      v54.length = Length;
      CFStringGetCharacters(v30, v54, v31);
      v31[Length] = 0;
      v26 = v31;
    }
    CFRelease(v30);
  }
  uregex_setText((URegularExpression *)a7->var1, v26, Length, &status);
  UErrorCode v32 = status;
  if (status > U_ZERO_ERROR)
  {
    v35 = @"Can't setText %s (string %@, pattern %@, case %ld, canon %ld)";
    goto LABEL_46;
  }
  int v33 = uregex_matches((URegularExpression *)a7->var1, 0, &status);
  UErrorCode v32 = status;
  if (status >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    v35 = @"Can't do match %s (string %@, pattern %@, case %ld, canon %ld)";
LABEL_46:
    v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, u_errorName(v32), a3, v46, v45, v44);
    if (v24) {
      free(v26);
    }
    v37 = (void *)MEMORY[0x1E4F1CA00];
    v38 = +[NSString stringWithFormat:@"Can't do regex matching, reason: %@", v36];
    objc_exception_throw((id)[v37 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v38 userInfo:0]);
  }
  if (v24) {
    free(v26);
  }
  return v33 != 0;
}

+ (__CFLocale)retainedLocale
{
  CFLocaleRef v2 = (CFLocaleRef)qword_1EB1ED8F0;
  if (!qword_1EB1ED8F0)
  {
    objc_sync_enter(a1);
    if ((_MergedGlobals_131 & 1) == 0)
    {
      _MergedGlobals_131 = 1;
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_localeDidChange, (CFStringRef)*MEMORY[0x1E4F1D200], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
    CFStringRef ValueAtIndex = (const __CFString *)CFPreferencesCopyAppValue(@"AppleCollationOrder", (CFStringRef)*MEMORY[0x1E4F1D3D8]);
    if (ValueAtIndex
      || (CFArrayRef v10 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", v5), (v11 = v10) != 0)
      && (CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v10, 0),
          CFRetain(ValueAtIndex),
          CFRelease(v11),
          ValueAtIndex))
    {
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], ValueAtIndex);
      if (!CanonicalLanguageIdentifierFromString)
      {
        CFStringRef CanonicalLanguageIdentifierFromString = &stru_1ECA5C228;
        CFRetain(&stru_1ECA5C228);
      }
      char v9 = 0;
    }
    else
    {
      CFRetain(&stru_1ECA5C228);
      CFStringRef ValueAtIndex = 0;
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef CanonicalLanguageIdentifierFromString = &stru_1ECA5C228;
      char v9 = 1;
    }
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v7, CanonicalLanguageIdentifierFromString);
    unint64_t v13 = (const void *)*MEMORY[0x1E4F1D218];
    if (CFDictionaryContainsKey(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E4F1D218])) {
      Value = (__CFString *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, v13);
    }
    else {
      Value = &stru_1ECA5C228;
    }
    if (Value) {
      CFStringRef v15 = Value;
    }
    else {
      CFStringRef v15 = &stru_1ECA5C228;
    }
    CFLocaleRef v16 = CFLocaleCreate(0, v15);
    CFLocaleRef v2 = v16;
    uint64_t v17 = 0;
    atomic_compare_exchange_strong(&qword_1EB1ED8F0, (unint64_t *)&v17, (unint64_t)v16);
    if (v17)
    {
      CFRelease(v16);
      CFLocaleRef v2 = (CFLocaleRef)qword_1EB1ED8F0;
    }
    if ((v9 & 1) == 0) {
      CFRelease(ValueAtIndex);
    }
    CFRelease(CanonicalLanguageIdentifierFromString);
    CFRelease(ComponentsFromLocaleIdentifier);
    objc_sync_exit(a1);
  }
  CFRetain(v2);
  return v2;
}

+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a3 length] >> 30) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid string length (too long)" userInfo:0]);
  }
  if ((a4 & 2) != 0) {
    CFStringCompareFlags v6 = ((uint64_t)(a4 << 63) >> 63) & 1 | 0x180;
  }
  else {
    CFStringCompareFlags v6 = ((uint64_t)(a4 << 63) >> 63) & 0x101;
  }
  uint64_t Length = CFStringGetLength((CFStringRef)a3);
  BOOL v8 = Length > 899;
  MEMORY[0x1F4188790](Length);
  CFArrayRef v10 = (UniChar *)((char *)v16 - v9);
  if (v11 < 900)
  {
    CFIndex v12 = 1024;
  }
  else
  {
    CFIndex v12 = Length + 200;
    CFArrayRef v10 = (UniChar *)malloc_type_malloc(2 * (Length + 200), 0x1000040BDFB0063uLL);
  }
  v17.location = 0;
  v17.length = Length;
  CFStringGetCharacters((CFStringRef)a3, v17, v10);
  v10[Length] = 0;
  if ((a4 & 4) != 0)
  {
    if (Length < 900) {
      return (id)CFStringCreateWithCharacters(0, v10, Length);
    }
  }
  else
  {
    MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, Length, v12, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    unint64_t v14 = MutableWithExternalCharactersNoCopy;
    if ((a4 & 3) != 0) {
      CFStringFold(MutableWithExternalCharactersNoCopy, v6, 0);
    }
    CFStringNormalize(v14, kCFStringNormalizationFormKC);
    if (CFStringGetCharactersPtr(v14) != v10)
    {
      if (Length >= 900) {
        free(v10);
      }
      uint64_t Length = CFStringGetLength(v14);
      BOOL v8 = 1;
      CFArrayRef v10 = (UniChar *)malloc_type_malloc(2 * Length + 2, 0x1000040BDFB0063uLL);
      v18.location = 0;
      v18.length = Length;
      CFStringGetCharacters(v14, v18, v10);
    }
    CFRelease(v14);
    v10[Length] = 0;
    if (!v8) {
      return (id)CFStringCreateWithCharacters(0, v10, Length);
    }
  }
  return (id)CFStringCreateWithCharactersNoCopy(0, v10, Length, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
}

+ (int64_t)copyRegexFindSafePattern:(id)a3 toBuffer:(unsigned __int16 *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  CFIndex Length = CFStringGetLength((CFStringRef)a3);
  long long v49 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  theString[0] = (CFStringRef)a3;
  CFIndex v51 = 0;
  long long v50 = (unint64_t)Length;
  CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr((CFStringRef)a3);
  theString[1] = CharactersPtr;
  if (CharactersPtr)
  {
    *((void *)&v50 + 1) = 0;
    CFIndex v51 = 0;
    *(void *)&long long v49 = 0;
    if (Length >= 1)
    {
      uint64_t v8 = 0;
      __int16 v9 = *((_WORD *)CharactersPtr + Length - 1);
      goto LABEL_15;
    }
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
    *((void *)&v50 + 1) = 0;
    CFIndex v51 = 0;
    *(void *)&long long v49 = CStringPtr;
    if (Length > 0)
    {
      CFIndex v11 = Length - 1;
      if (CStringPtr)
      {
        uint64_t v8 = 0;
        __int16 v9 = CStringPtr[v11];
      }
      else
      {
        if ((unint64_t)Length >= 5) {
          v14.location = Length - 5;
        }
        else {
          v14.location = 0;
        }
        CFIndex v15 = v14.location + 64;
        if (v14.location + 64 >= Length) {
          CFIndex v15 = Length;
        }
        *((void *)&v50 + 1) = v14.location;
        CFIndex v51 = v15;
        v14.length = v15 - v14.location;
        CFStringGetCharacters((CFStringRef)a3, v14, (UniChar *)&v40);
        uint64_t v8 = *((void *)&v50 + 1);
        __int16 v9 = *((_WORD *)&v40 + v11 - *((void *)&v50 + 1));
      }
LABEL_15:
      if (v9 != 92)
      {
LABEL_24:
        uint64_t v21 = 0;
        char v22 = 0;
        uint64_t v23 = 0;
        int64_t v12 = 0;
        uint64_t v24 = 64;
        while (1)
        {
          if ((unint64_t)v23 >= 4) {
            uint64_t v25 = 4;
          }
          else {
            uint64_t v25 = v23;
          }
          uint64_t v26 = v50;
          if ((uint64_t)v50 <= v23)
          {
            unsigned __int16 v27 = 0;
          }
          else
          {
            if (theString[1])
            {
              unsigned __int16 v27 = *((_WORD *)&theString[1]->isa + v23 + *((void *)&v49 + 1));
            }
            else if ((void)v49)
            {
              unsigned __int16 v27 = *(char *)(v49 + *((void *)&v49 + 1) + v23);
            }
            else
            {
              if (v51 <= v23 || v8 > v23)
              {
                uint64_t v29 = v25 + v21;
                uint64_t v30 = v24 - v25;
                uint64_t v31 = v23 - v25;
                CFIndex v32 = v31 + 64;
                if (v31 + 64 >= (uint64_t)v50) {
                  CFIndex v32 = v50;
                }
                *((void *)&v50 + 1) = v31;
                CFIndex v51 = v32;
                if ((uint64_t)v50 >= v30) {
                  uint64_t v26 = v30;
                }
                v53.length = v26 + v29;
                v53.location = v31 + *((void *)&v49 + 1);
                CFStringGetCharacters(theString[0], v53, (UniChar *)&v40);
                uint64_t v8 = *((void *)&v50 + 1);
              }
              unsigned __int16 v27 = *((_WORD *)&v40 + v23 - v8);
            }
            if (v27 <= 0x2Au)
            {
              if (v27 - 40 < 2 || v27 == 36) {
                goto LABEL_61;
              }
              if (v27 == 42)
              {
                v34 = &a4[v12];
                if (v22) {
                  __int16 v35 = 92;
                }
                else {
                  __int16 v35 = 46;
                }
                unsigned __int16 *v34 = v35;
                v34[1] = 42;
                v12 += 2;
                char v22 = 0;
                goto LABEL_62;
              }
            }
            else
            {
              uint64_t v33 = v27 - 43;
              if (v33 <= 0x33)
              {
                if (((1 << (v27 - 43)) & 0x9000000000019) != 0) {
                  goto LABEL_61;
                }
                if (v33 == 20)
                {
                  if (v22)
                  {
                    int64_t v37 = v12 + 1;
                    a4[v12 + 1] = 63;
                    unsigned __int16 v38 = 92;
                  }
                  else
                  {
                    unsigned __int16 v38 = 46;
                    int64_t v37 = v12;
                  }
                  char v22 = 0;
                  a4[v12] = v38;
                  int64_t v12 = v37 + 1;
                  goto LABEL_62;
                }
                if (v33 == 49)
                {
                  if (v22)
                  {
                    *(_DWORD *)&a4[v12] = 6029404;
                    v12 += 2;
                  }
                  v22 ^= 1u;
                  goto LABEL_62;
                }
              }
              if (v27 - 123 < 3)
              {
LABEL_61:
                char v22 = 0;
                v36 = &a4[v12];
                unsigned __int16 *v36 = 92;
                v12 += 2;
                v36[1] = v27;
                goto LABEL_62;
              }
            }
          }
          char v22 = 0;
          a4[v12++] = v27;
LABEL_62:
          ++v23;
          --v21;
          ++v24;
          if (Length == v23) {
            goto LABEL_8;
          }
        }
      }
      if (Length == 1 || (int64_t v16 = Length - 2, v17 = v50, (uint64_t)v50 <= Length - 2)) {
LABEL_76:
      }
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"The backslash is a wildcard char, and cannot appear unescaped at the end of a string.", 0, v40, v41, v42, v43, v44, v45, v46, v47 reason userInfo]);
      CFStringRef v18 = theString[1];
      if (theString[1])
      {
        int64_t v19 = *((void *)&v49 + 1) + v16;
      }
      else
      {
        if ((void)v49)
        {
          __int16 v20 = *(char *)(v49 + *((void *)&v49 + 1) + v16);
LABEL_23:
          if (v20 == 92) {
            goto LABEL_24;
          }
          goto LABEL_76;
        }
        if (v8 > v16 || v51 <= v16)
        {
          CFIndex v39 = Length - 6;
          if ((unint64_t)v16 < 4) {
            CFIndex v39 = 0;
          }
          if (v39 + 64 < (uint64_t)v50) {
            CFIndex v17 = v39 + 64;
          }
          *((void *)&v50 + 1) = v39;
          CFIndex v51 = v17;
          v54.location = *((void *)&v49 + 1) + v39;
          v54.length = v17 - v39;
          CFStringGetCharacters(theString[0], v54, (UniChar *)&v40);
          uint64_t v8 = *((void *)&v50 + 1);
        }
        int64_t v19 = v16 - v8;
        CFStringRef v18 = (CFStringRef)&v40;
      }
      __int16 v20 = *((_WORD *)&v18->isa + v19);
      goto LABEL_23;
    }
  }
  int64_t v12 = 0;
LABEL_8:
  a4[v12] = 0;
  return v12;
}

@end
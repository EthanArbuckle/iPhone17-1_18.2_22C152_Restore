@interface NSString(CoreRecentsUtilities)
- (uint64_t)cr_copyIDNADecodedEmailAddress;
- (uint64_t)cr_copyIDNAEncodedEmailAddress;
- (uint64_t)cr_lowercaseStringWithStandardLocale;
- (uint64_t)cr_rangeOfAddressDomain;
- (void)cr_copyStringByDecodingIDNAInRange:()CoreRecentsUtilities;
- (void)cr_copyStringByEncodingIDNAInRange:()CoreRecentsUtilities;
- (void)cr_uniqueFilenameWithRespectToFilenames:()CoreRecentsUtilities;
@end

@implementation NSString(CoreRecentsUtilities)

- (uint64_t)cr_rangeOfAddressDomain
{
  CFIndex Length = CFStringGetLength(a1);
  memset(v31, 0, sizeof(v31));
  CFStringRef theString = a1;
  uint64_t v35 = 0;
  CFIndex v36 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v33 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v37 = 0;
  int64_t v38 = 0;
  v34 = CStringPtr;
  if (Length < 1)
  {
    uint64_t v10 = -1;
    int64_t v6 = Length;
    goto LABEL_43;
  }
  int64_t v5 = 0;
  int64_t v6 = 0;
  char v7 = 0;
  BOOL v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = -1;
  do
  {
    if (v6 < 0 || (CFIndex v11 = v36, v36 <= v6))
    {
      UniChar v12 = 0;
    }
    else
    {
      if (v33)
      {
        UniChar v12 = v33[v35 + v6];
      }
      else if (v34)
      {
        UniChar v12 = v34[v35 + v6];
      }
      else
      {
        if (v38 <= v6 || v5 > v6)
        {
          int64_t v13 = v6 - 4;
          if ((unint64_t)v6 < 4) {
            int64_t v13 = 0;
          }
          if (v13 + 64 < v36) {
            CFIndex v11 = v13 + 64;
          }
          uint64_t v37 = v13;
          int64_t v38 = v11;
          v39.location = v35 + v13;
          v39.length = v11 - v13;
          CFStringGetCharacters(theString, v39, (UniChar *)v31);
          int64_t v5 = v37;
        }
        UniChar v12 = *((_WORD *)v31 + v6 - v5);
      }
      if (v12 == 92)
      {
        ++v6;
        goto LABEL_34;
      }
    }
    if (v8)
    {
      BOOL v8 = v12 != 34;
    }
    else if (v12 == 34)
    {
      BOOL v8 = 1;
    }
    else if (v12 == 40)
    {
      BOOL v8 = 0;
      ++v9;
    }
    else if (v9)
    {
      BOOL v8 = 0;
      v9 -= v12 == 41;
    }
    else if (v12 == 60)
    {
      uint64_t v9 = 0;
      BOOL v8 = 0;
      uint64_t v10 = -1;
      char v7 = 1;
    }
    else if (v12 == 64)
    {
      if (v10 != -1) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v9 = 0;
      BOOL v8 = 0;
      uint64_t v10 = v6 + 1;
    }
    else
    {
      if (v12 == 62 && (v7 & 1) != 0) {
        goto LABEL_43;
      }
      uint64_t v9 = 0;
      BOOL v8 = 0;
    }
LABEL_34:
    ++v6;
  }
  while (v6 < Length);
  if (v7) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = Length;
  }
LABEL_43:
  int64_t v14 = -v6;
  int64_t v15 = v6 + 64;
  uint64_t v16 = MEMORY[0x1E4F14390];
  while (2)
  {
    uint64_t v17 = v6;
    if ((unint64_t)v6 >= 5) {
      uint64_t v18 = 5;
    }
    else {
      uint64_t v18 = v6;
    }
    if (v6 != -1 && v6 > v10)
    {
      --v6;
      if (v17 < 1 || v36 < v17)
      {
        unsigned int v19 = 0;
        goto LABEL_52;
      }
      if (v33)
      {
        UniChar v21 = v33[v17 - 1 + v35];
      }
      else if (v34)
      {
        UniChar v21 = v34[v35 - 1 + v17];
      }
      else
      {
        if (v38 < v17 || (uint64_t v22 = v37, v37 >= v17))
        {
          uint64_t v23 = -v18;
          uint64_t v24 = v18 + v14;
          int64_t v25 = v15 - v18;
          uint64_t v26 = v17 + v23;
          CFIndex v27 = v26 + 64;
          if (v26 + 64 >= v36) {
            CFIndex v27 = v36;
          }
          uint64_t v37 = v26;
          int64_t v38 = v27;
          if (v36 < v25) {
            int64_t v25 = v36;
          }
          v40.length = v25 + v24;
          v40.location = v26 + v35;
          CFStringGetCharacters(theString, v40, (UniChar *)v31);
          uint64_t v22 = v37;
        }
        UniChar v21 = *((_WORD *)&v31[-1] + v17 - v22 + 7);
      }
      unsigned int v19 = v21;
      if (v21 <= 0x7Fu) {
LABEL_52:
      }
        int v20 = *(_DWORD *)(v16 + 4 * v19 + 60) & 0x4000;
      else {
        int v20 = __maskrune(v21, 0x4000uLL);
      }
      ++v14;
      --v15;
      if (!v20) {
        break;
      }
      continue;
    }
    break;
  }
  if (v10 == -1 || v17 == -1 || v17 == v10) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v10;
  }
}

- (void)cr_copyStringByDecodingIDNAInRange:()CoreRecentsUtilities
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0) {
    goto LABEL_8;
  }
  if (_posixLocale_onceToken != -1) {
    dispatch_once(&_posixLocale_onceToken, &__block_literal_global_27);
  }
  if (objc_msgSend(a1, "rangeOfString:options:range:locale:", @"xn--", 1, a3, a4, _posixLocale__locale) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    return (void *)[a1 copy];
  }
  else
  {
    uint64_t v9 = (uint64_t (*)(char *, unint64_t, UniChar *, uint64_t, uint64_t, void, int *))MEMORY[0x1E4FBA610];
    return _createStringByApplyingIDNATranslationWithRange(a1, a3, a4, v9);
  }
}

- (void)cr_copyStringByEncodingIDNAInRange:()CoreRecentsUtilities
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0) {
    goto LABEL_8;
  }
  if (_unsafeDomainNameCharacterSet_onceToken != -1) {
    dispatch_once(&_unsafeDomainNameCharacterSet_onceToken, &__block_literal_global_32);
  }
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", _unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet, 0, a3, a4) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    return (void *)[a1 copy];
  }
  else
  {
    uint64_t v9 = (uint64_t (*)(char *, unint64_t, UniChar *, uint64_t, uint64_t, void, int *))MEMORY[0x1E4FBA608];
    return _createStringByApplyingIDNATranslationWithRange(a1, a3, a4, v9);
  }
}

- (uint64_t)cr_copyIDNADecodedEmailAddress
{
  uint64_t v3 = objc_msgSend(a1, "cr_rangeOfAddressDomain");
  return objc_msgSend(a1, "cr_copyStringByDecodingIDNAInRange:", v3, v2);
}

- (uint64_t)cr_copyIDNAEncodedEmailAddress
{
  uint64_t v3 = objc_msgSend(a1, "cr_rangeOfAddressDomain");
  return objc_msgSend(a1, "cr_copyStringByEncodingIDNAInRange:", v3, v2);
}

- (void)cr_uniqueFilenameWithRespectToFilenames:()CoreRecentsUtilities
{
  LODWORD(v5) = 0;
  int64_t v6 = 0;
  uint64_t v7 = 0;
  BOOL v8 = 0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  do
  {
    while (1)
    {
      if (!v8)
      {
        BOOL v8 = a1;
        goto LABEL_12;
      }
      if (v7)
      {
        if (!v6) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v7 = [a1 stringByDeletingPathExtension];
        if (!v6) {
LABEL_9:
        }
          int64_t v6 = (void *)[a1 pathExtension];
      }
      uint64_t v5 = (v5 + 1);
      uint64_t v9 = [v6 length]
         ? [NSString stringWithFormat:@"%@-%d.%@", v7, v5, v6]
         : [NSString stringWithFormat:@"%@-%d", v7, v5, v16];
      BOOL v8 = (void *)v9;
LABEL_12:
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      CFIndex v11 = v8;
      if (!v10) {
        break;
      }
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v18;
LABEL_14:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * v14) isEqualToString:v8]) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            goto LABEL_14;
          }
          CFIndex v11 = v8;
          goto LABEL_21;
        }
      }
    }
LABEL_21:
    ;
  }
  while (!v11);
  return v8;
}

- (uint64_t)cr_lowercaseStringWithStandardLocale
{
  if (cr_lowercaseStringWithStandardLocale_onceToken != -1) {
    dispatch_once(&cr_lowercaseStringWithStandardLocale_onceToken, &__block_literal_global_5);
  }
  uint64_t v2 = cr_lowercaseStringWithStandardLocale__someLocale;
  return [a1 lowercaseStringWithLocale:v2];
}

@end
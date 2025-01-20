@interface SGNames
+ ($D369DFA4738CCB2DC34F10FA2F14702B)namePayload:(id)a3;
+ (BOOL)isCapitalized:(id)a3;
+ (BOOL)isCommonNameWord:(id)a3;
+ (BOOL)isCommonVietnameseSurname:(id)a3;
+ (BOOL)isDifficultName:(id)a3;
+ (BOOL)isFamilyName:(id)a3;
+ (BOOL)isLowercaseStringCommonNameWord:(id)a3;
+ (BOOL)isProbablyShortCJKName:(id)a3;
+ (BOOL)isSalientName:(id)a3;
+ (BOOL)isSalientNameByChars:(id)a3;
+ (BOOL)namesApproximatelyMatch:(id)a3 and:(id)a4;
+ (BOOL)namesApproximatelyMatch:(id)a3 and:(id)a4 threshold:(double)a5;
+ (BOOL)shouldInvertOrderOfFirst:(id)a3 last:(id)a4;
+ (BOOL)unnormalizedNamesApproximatelyMatch:(id)a3 and:(id)a4;
+ (BOOL)unnormalizedNamesApproximatelyMatch:(id)a3 and:(id)a4 threshold:(double)a5;
+ (double)nameSimilarity:(id)a3 and:(id)a4;
+ (double)unnormalizedNameSimilarity:(id)a3 and:(id)a4;
+ (id)bestName:(id)a3;
+ (id)cjkSpacerCharacters;
+ (id)cjkSpacersToWhiteSpace:(id)a3;
+ (id)cleanName:(id)a3;
+ (id)handleLastNameFirstOrder:(id)a3;
+ (id)nameFromEmail:(id)a3;
+ (id)nameStringFromEmailAddress:(id)a3;
+ (id)possibleNameStringFromEmailAddress:(id)a3;
+ (id)sgNameFromString:(id)a3 origin:(id)a4 recordId:(id)a5 extractionInfo:(id)a6;
+ (id)sketchesForName:(id)a3;
+ (id)stripAndReturnHonorifics:(id)a3;
+ (id)stripHonorifics:(id)a3;
+ (id)surnameFromName:(id)a3;
+ (id)universalCleanName:(id)a3;
+ (unsigned)attributesForNameWord:(id)a3;
@end

@implementation SGNames

+ (BOOL)shouldInvertOrderOfFirst:(id)a3 last:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = _PASIsAllUppercase();
  if (_PASIsAllUppercase() + v7 == 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v10 = [v5 lowercaseString];

    v11 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v12 = [v6 lowercaseString];

    BOOL v8 = +[SGNameInversionPredictor shouldInvertFirst:v10 last:v12];
    id v6 = (id)v12;
    id v5 = (id)v10;
  }

  return v8;
}

+ (id)cjkSpacersToWhiteSpace:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[SGNames cjkSpacerCharacters];
  uint64_t v5 = [v3 length];
  if (!v5)
  {
    v29 = &stru_1F24EEF20;
    goto LABEL_41;
  }
  uint64_t v6 = v5;
  size_t v7 = (2 * v5) | 1;
  buffer[0] = 0uLL;
  if (v7 > 0x200)
  {
    int v33 = malloc_type_posix_memalign((void **)buffer, 8uLL, 2 * v5, 0x1000040BDFB0063uLL);
    BYTE8(buffer[0]) = 0;
    if (v33)
    {
      id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v34);
    }
    BOOL v8 = *(char **)&buffer[0];
  }
  else
  {
    MEMORY[0x1F4188790]();
    BOOL v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, v7);
  }
  v9 = (__CFString *)v3;
  uint64_t v10 = self;

  if (!v10) {
    goto LABEL_35;
  }
  memset(buffer, 0, sizeof(buffer));
  CFIndex Length = CFStringGetLength(v9);
  v40 = v9;
  uint64_t v43 = 0;
  CFIndex v44 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v41 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  }
  int64_t v45 = 0;
  int64_t v46 = 0;
  v42 = CStringPtr;
  if (Length <= 0)
  {
LABEL_35:

LABEL_38:
    uint64_t v30 = [(__CFString *)v9 copy];
    goto LABEL_39;
  }
  v36 = v9;
  uint64_t v35 = v6;
  size_t v37 = v7;
  id v38 = v3;
  uint64_t v14 = 0;
  int64_t v15 = 0;
  char v16 = 0;
  uint64_t v17 = 64;
  do
  {
    if ((unint64_t)v15 >= 4) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = v15;
    }
    CFIndex v19 = v44;
    if (v44 <= v15)
    {
      unsigned __int16 v20 = 0;
    }
    else if (v41)
    {
      unsigned __int16 v20 = v41[v15 + v43];
    }
    else if (v42)
    {
      unsigned __int16 v20 = v42[v43 + v15];
    }
    else
    {
      int64_t v23 = v45;
      if (v46 <= v15 || v45 > v15)
      {
        uint64_t v25 = v18 + v14;
        uint64_t v26 = v17 - v18;
        int64_t v27 = v15 - v18;
        CFIndex v28 = v27 + 64;
        if (v27 + 64 >= v44) {
          CFIndex v28 = v44;
        }
        int64_t v45 = v27;
        int64_t v46 = v28;
        if (v44 >= v26) {
          CFIndex v19 = v26;
        }
        v49.length = v19 + v25;
        v49.location = v27 + v43;
        CFStringGetCharacters(v40, v49, (UniChar *)buffer);
        int64_t v23 = v45;
      }
      unsigned __int16 v20 = *((_WORD *)buffer + v15 - v23);
    }
    int v21 = objc_msgSend(v4, "characterIsMember:", v20, v35);
    if (v21) {
      __int16 v22 = 32;
    }
    else {
      __int16 v22 = v20;
    }
    if (v21) {
      char v16 = 1;
    }
    *(_WORD *)&v8[2 * v15++] = v22;
    --v14;
    ++v17;
  }
  while (Length != v15);
  v9 = v36;

  id v3 = v38;
  size_t v7 = v37;
  if ((v16 & 1) == 0) {
    goto LABEL_38;
  }
  id v32 = [NSString alloc];
  uint64_t v30 = [v32 initWithCharacters:v8 length:v35];
LABEL_39:
  v29 = (__CFString *)v30;
  if (v7 >= 0x201) {
    free(v8);
  }
LABEL_41:

  return v29;
}

+ (id)cjkSpacerCharacters
{
  if (cjkSpacerCharacters__pasOnceToken53 != -1) {
    dispatch_once(&cjkSpacerCharacters__pasOnceToken53, &__block_literal_global_122);
  }
  v2 = (void *)cjkSpacerCharacters__pasExprOnceResult;
  return v2;
}

void __30__SGNames_cjkSpacerCharacters__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = (void *)MEMORY[0x1E4F28B88];
  v2 = patterns_17196();
  id v3 = [v2 rawValueForKey:@"CJKSpacers"];
  uint64_t v4 = [v1 characterSetWithCharactersInString:v3];
  uint64_t v5 = (void *)cjkSpacerCharacters__pasExprOnceResult;
  cjkSpacerCharacters__pasExprOnceResult = v4;
}

+ (id)nameStringFromEmailAddress:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 possibleNameStringFromEmailAddress:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = (void *)MEMORY[0x1CB79B230](v5);
  size_t v7 = [v5 componentsSeparatedByString:@" "];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 length] != 1 && !objc_msgSend(a1, "isCommonNameWord:", v12))
        {

          id v13 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v13 = v5;
LABEL_12:

  return v13;
}

+ (id)possibleNameStringFromEmailAddress:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SGInhumans isInhumanEmailAddress:v3])
  {
    id v4 = 0;
    goto LABEL_52;
  }
  size_t v5 = (2 * [v3 length]) | 1;
  buffer[0] = 0uLL;
  if (v5 > 0x200)
  {
    int v32 = malloc_type_posix_memalign((void **)buffer, 8uLL, 2 * [v3 length], 0x1000040BDFB0063uLL);
    BYTE8(buffer[0]) = 0;
    if (v32)
    {
      id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v33);
    }
    size_t v37 = *(char **)&buffer[0];
  }
  else
  {
    MEMORY[0x1F4188790]();
    size_t v37 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v37, v5);
  }
  if (possibleNameStringFromEmailAddress___pasOnceToken48 != -1) {
    dispatch_once(&possibleNameStringFromEmailAddress___pasOnceToken48, &__block_literal_global_117_17209);
  }
  id v6 = (id)possibleNameStringFromEmailAddress___pasExprOnceResult;
  size_t v7 = (__CFString *)v3;
  uint64_t v8 = self;

  if (v8)
  {
    memset(buffer, 0, sizeof(buffer));
    id v36 = v3;
    size_t v35 = v5;
    CFIndex Length = CFStringGetLength(v7);
    v39 = v7;
    uint64_t v42 = 0;
    CFIndex v43 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    id v34 = v7;
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    }
    int64_t v44 = 0;
    int64_t v45 = 0;
    v41 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v11 = 0;
      int64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 1;
      uint64_t v15 = 64;
      do
      {
        if ((unint64_t)v12 >= 4) {
          uint64_t v16 = 4;
        }
        else {
          uint64_t v16 = v12;
        }
        CFIndex v17 = v43;
        if (v43 <= v12)
        {
          __darwin_ct_rune_t v19 = 0;
          UniChar v18 = 0;
        }
        else
        {
          if (CharactersPtr)
          {
            UniChar v18 = CharactersPtr[v12 + v42];
          }
          else if (v41)
          {
            UniChar v18 = v41[v42 + v12];
          }
          else
          {
            int64_t v20 = v44;
            if (v45 <= v12 || v44 > v12)
            {
              uint64_t v22 = v16 + v11;
              uint64_t v23 = v15 - v16;
              int64_t v24 = v12 - v16;
              CFIndex v25 = v24 + 64;
              if (v24 + 64 >= v43) {
                CFIndex v25 = v43;
              }
              int64_t v44 = v24;
              int64_t v45 = v25;
              if (v43 >= v23) {
                CFIndex v17 = v23;
              }
              v48.length = v17 + v22;
              v48.location = v24 + v42;
              CFStringGetCharacters(v39, v48, (UniChar *)buffer);
              int64_t v20 = v44;
            }
            UniChar v18 = *((_WORD *)buffer + v12 - v20);
          }
          __darwin_ct_rune_t v19 = v18;
          if (v18 == 64)
          {
            if (v13)
            {
              if (*(_WORD *)&v37[2 * v13 - 2] == 32) {
                uint64_t v30 = v13 - 1;
              }
              else {
                uint64_t v30 = v13;
              }
            }
            else
            {
              uint64_t v30 = 0;
            }
            id v3 = v36;
            size_t v5 = v35;
            CFIndex v28 = v34;
            id v31 = [NSString alloc];
            id v4 = (void *)[v31 initWithCharacters:v37 length:v30];
            goto LABEL_50;
          }
        }
        uint64_t v26 = objc_msgSend(v6, "characterIsMember:", v18, v34);
        if (v26)
        {
          if (v13 && *(_WORD *)&v37[2 * v13 - 2] != 32)
          {
            LOWORD(v19) = 32;
LABEL_42:
            *(_WORD *)&v37[2 * v13++] = v19;
            goto LABEL_43;
          }
          uint64_t v26 = v14;
        }
        else
        {
          if ((unsigned __int16)(v18 - 48) >= 0xAu)
          {
            if (v14) {
              LOWORD(v19) = __toupper(v19);
            }
            goto LABEL_42;
          }
          uint64_t v26 = 0;
        }
LABEL_43:
        ++v12;
        --v11;
        ++v15;
        uint64_t v14 = v26;
      }
      while (Length != v12);
    }
    id v3 = v36;
    size_t v5 = v35;
    size_t v7 = v34;
  }

  int64_t v27 = sgLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buffer[0]) = 0;
    _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "Given a putative e-mail address with no @", (uint8_t *)buffer, 2u);
  }

  CFIndex v28 = sgLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buffer[0]) = 138412290;
    *(void *)((char *)buffer + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEBUG, "Given a putative e-mail address with no @: %@", (uint8_t *)buffer, 0xCu);
  }
  id v4 = 0;
LABEL_50:

  if (v5 >= 0x201) {
    free(v37);
  }
LABEL_52:

  return v4;
}

void __46__SGNames_possibleNameStringFromEmailAddress___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-_. "];
  v2 = (void *)possibleNameStringFromEmailAddress___pasExprOnceResult;
  possibleNameStringFromEmailAddress___pasExprOnceResult = v1;
}

+ (id)sgNameFromString:(id)a3 origin:(id)a4 recordId:(id)a5 extractionInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 length])
  {
    uint64_t v13 = +[SGIdentityName nameWithString:v9];
    uint64_t v14 = [v13 toSGNameWithOrigin:v10 recordId:v11 extractionInfo:v12];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)bestName:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    uint64_t v8 = @"@";
    do
    {
      uint64_t v9 = 0;
      uint64_t v33 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        if (objc_msgSend(v10, "rangeOfString:options:", v8, 2, v33) == 0x7FFFFFFFFFFFFFFFLL
          && [v10 length])
        {
          uint64_t v11 = v7;
          id v12 = v8;
          uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          uint64_t v15 = [v10 componentsSeparatedByCharactersInSet:v14];
          unint64_t v16 = [v15 count];

          CFIndex v17 = [v4 objectForKeyedSubscript:v10];
          uint64_t v18 = [v17 unsignedIntegerValue];

          if (v16 <= 3) {
            uint64_t v19 = kNameScoreByWordCount[v16];
          }
          else {
            uint64_t v19 = 1;
          }
          uint64_t v7 = v11;
          int64_t v20 = [NSNumber numberWithUnsignedInteger:v18 + v19 + 1];
          [v4 setObject:v20 forKeyedSubscript:v10];

          uint64_t v8 = v12;
          uint64_t v6 = v33;
        }
        else
        {
          [v4 setObject:&unk_1F25359E8 forKeyedSubscript:v10];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v6);
  }

  id v21 = v4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    unint64_t v24 = 0;
    CFIndex v25 = 0;
    uint64_t v26 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v21);
        }
        CFIndex v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v29 = [v21 objectForKeyedSubscript:v28];
        unint64_t v30 = [v29 unsignedIntegerValue];

        if (v30 > v24)
        {
          id v31 = v28;

          unint64_t v24 = v30;
          CFIndex v25 = v31;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v23);
  }
  else
  {
    CFIndex v25 = 0;
  }

  return v25;
}

+ (id)surnameFromName:(id)a3
{
  if (a3)
  {
    id v3 = +[SGIdentityName nameWithString:](SGIdentityName, "nameWithString:");
    id v4 = [v3 surname];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)sketchesForName:(id)a3
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  [(__CFString *)v3 rangeOfString:@"@" options:2];
  if (v4 || ![(__CFString *)v3 length])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_3;
  }
  id v3 = v3;
  uint64_t v7 = self;

  if (!v7) {
    goto LABEL_39;
  }
  memset(v84, 0, sizeof(v84));
  CFIndex Length = CFStringGetLength(v3);
  v85 = v3;
  uint64_t v88 = 0;
  CFIndex v89 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v86 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  }
  int64_t v90 = 0;
  int64_t v91 = 0;
  v87 = CStringPtr;
  if (Length <= 0)
  {
LABEL_39:

LABEL_40:
    CFIndex v25 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v26 = [(__CFString *)v3 lowercaseString];
    v98[0] = v26;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:1];

    goto LABEL_41;
  }
  uint64_t v11 = 0;
  int64_t v12 = 0;
  int64_t v13 = 0;
  char v14 = 0;
  uint64_t v15 = 64;
  do
  {
    if ((unint64_t)v13 >= 4) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v13;
    }
    CFIndex v17 = v89;
    if (v89 <= v13)
    {
LABEL_42:

      if (v3)
      {
        int64_t v27 = SGNamesAsciify(v3);

        _PASRemoveSomePunctuation();
        id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      CFIndex v28 = objc_opt_new();
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v29 = (void *)MEMORY[0x1CB79B230]();
      unint64_t v30 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v31 = [(__CFString *)v3 componentsSeparatedByCharactersInSet:v30];

      uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v96 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v81 != v34) {
              objc_enumerationMutation(v31);
            }
            long long v36 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            if ([v36 length] && (objc_msgSend(v36, "hasSuffix:", @":") & 1) == 0) {
              [v28 addObject:v36];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v80 objects:v96 count:16];
        }
        while (v33);
      }

      if (![v28 count])
      {
        uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
        long long v41 = &stru_1F24EEF20;
        v50 = &stru_1F24EEF20;
        v51 = &stru_1F24EEF20;
LABEL_102:

        goto LABEL_3;
      }
      if ([v28 count] == 1)
      {
        long long v37 = [v28 objectAtIndexedSubscript:0];
        long long v38 = letters(v37);
        v95 = v38;
        long long v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
        long long v40 = (void *)[v39 mutableCopy];

        long long v41 = &stru_1F24EEF20;
        v74 = &stru_1F24EEF20;
        v75 = &stru_1F24EEF20;
LABEL_91:
        uint64_t v5 = objc_opt_new();
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v66 = v40;
        uint64_t v67 = [v66 countByEnumeratingWithState:&v76 objects:v92 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v77;
          do
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v77 != v69) {
                objc_enumerationMutation(v66);
              }
              uint64_t v71 = *(void *)(*((void *)&v76 + 1) + 8 * j);
              if (v71 && [*(id *)(*((void *)&v76 + 1) + 8 * j) length]) {
                [v5 addObject:v71];
              }
            }
            uint64_t v68 = [v66 countByEnumeratingWithState:&v76 objects:v92 count:16];
          }
          while (v68);
        }

        v50 = v74;
        v51 = v75;
        goto LABEL_102;
      }
      uint64_t v52 = MEMORY[0x1CB79B230]();
      v53 = objc_msgSend(v28, "_pas_componentsJoinedByString:", @" ");
      v54 = +[SGIdentityName nameWithString:v53];

      uint64_t v55 = [v54 firstname];
      v56 = [v54 middlename];
      uint64_t v57 = [v54 surname];
      if (v55) {
        BOOL v58 = v57 == 0;
      }
      else {
        BOOL v58 = 0;
      }
      if (v58) {
        long long v41 = 0;
      }
      else {
        long long v41 = (__CFString *)v55;
      }
      if (v58) {
        v59 = (__CFString *)v55;
      }
      else {
        v59 = (__CFString *)v57;
      }
      v75 = v59;
      v60 = v56;
      [(__CFString *)v56 rangeOfString:@" " options:2];
      v61 = (void *)v52;
      if (v62)
      {

        v60 = &stru_1F24EEF20;
      }
      if (v41 && [(__CFString *)v41 length])
      {
        v63 = sketchWithInitialAndName(v41, v75);
        v94 = v63;
        v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
        long long v40 = (void *)[v64 mutableCopy];

        if (!v60 || (unint64_t)[(__CFString *)v60 length] < 2) {
          goto LABEL_90;
        }
        v65 = sketchWithInitialAndName(v41, v60);
        [v40 addObject:v65];
      }
      else
      {
        if (!v75 || ![(__CFString *)v75 length])
        {
          long long v40 = 0;
LABEL_90:
          v74 = v60;

          goto LABEL_91;
        }
        v93 = v75;
        v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
        long long v40 = (void *)[v65 mutableCopy];
      }

      goto LABEL_90;
    }
    if (v86)
    {
      UniChar v18 = v86[v13 + v88];
    }
    else if (v87)
    {
      UniChar v18 = v87[v88 + v13];
    }
    else
    {
      if (v91 <= v13 || v12 > v13)
      {
        uint64_t v20 = v16 + v11;
        uint64_t v21 = v15 - v16;
        int64_t v22 = v13 - v16;
        CFIndex v23 = v22 + 64;
        if (v22 + 64 >= v89) {
          CFIndex v23 = v89;
        }
        int64_t v90 = v22;
        int64_t v91 = v23;
        if (v89 >= v21) {
          CFIndex v17 = v21;
        }
        v100.length = v17 + v20;
        v100.location = v22 + v88;
        CFStringGetCharacters(v85, v100, (UniChar *)v84);
        int64_t v12 = v90;
      }
      UniChar v18 = *((_WORD *)v84 + v13 - v12);
    }
    if (v18 - 65 > 0x39 || ((1 << (v18 - 65)) & 0x3FFFFFF03FFFFFFLL) == 0)
    {
      if (v18 != 32 || (v14 & 1) != 0) {
        goto LABEL_42;
      }
      char v14 = 1;
    }
    ++v13;
    --v11;
    ++v15;
  }
  while (Length != v13);

  if ((v14 & 1) == 0) {
    goto LABEL_40;
  }
  CFIndex v25 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v42 = [(__CFString *)v3 rangeOfString:@" " options:2];
  char v43 = [(__CFString *)v3 characterAtIndex:0];
  size_t v44 = [(__CFString *)v3 length] - v42 + 3;
  v84[0] = 0uLL;
  if (v44 > 0x200)
  {
    int v72 = malloc_type_posix_memalign((void **)v84, 8uLL, v44, 0x418FDE2EuLL);
    BYTE8(v84[0]) = 0;
    if (v72)
    {
      id v73 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v73);
    }
    uint64_t v45 = *(char **)&v84[0];
  }
  else
  {
    MEMORY[0x1F4188790]();
    uint64_t v45 = (char *)&v74 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v45, v44);
  }
  id v3 = v3;
  snprintf(v45, v44, "%c.%s", v43, (const char *)([(__CFString *)v3 UTF8String] + v42 + 1));
  if (v44)
  {
    uint64_t v46 = v45;
    size_t v47 = v44;
    do
    {
      int v48 = *v46;
      if ((v48 - 65) <= 0x19) {
        *uint64_t v46 = v48 + 32;
      }
      ++v46;
      --v47;
    }
    while (v47);
  }
  CFRange v49 = [NSString stringWithUTF8String:v45];
  v97 = v49;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];

  if (v44 > 0x200) {
    free(v45);
  }
LABEL_41:
LABEL_3:

  return v5;
}

+ (id)nameFromEmail:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = (__CFString *)v3;
    uint64_t v6 = self;

    if (v6)
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v74 = 0u;
      CFIndex Length = CFStringGetLength(v5);
      long long v81 = v5;
      uint64_t v84 = 0;
      CFIndex v85 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v5);
      CStringPtr = 0;
      long long v82 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
      }
      v70 = v4;
      long long v83 = CStringPtr;
      uint64_t v86 = 0;
      int64_t v87 = 0;
      if (Length >= 1)
      {
        uint64_t v10 = 0;
        int64_t v11 = 0;
        int64_t v12 = 0;
        int v13 = 0;
        int v14 = 0;
        uint64_t v15 = 64;
        while (1)
        {
          if ((unint64_t)v12 >= 4) {
            uint64_t v16 = 4;
          }
          else {
            uint64_t v16 = v12;
          }
          CFIndex v17 = v85;
          if (v85 <= v12)
          {
            int v18 = 0;
          }
          else
          {
            if (v82)
            {
              int v18 = v82[v12 + v84];
            }
            else if (v83)
            {
              int v18 = v83[v84 + v12];
            }
            else
            {
              if (v87 <= v12 || v11 > v12)
              {
                uint64_t v20 = v16 + v10;
                uint64_t v21 = v15 - v16;
                uint64_t v22 = v12 - v16;
                CFIndex v23 = v22 + 64;
                if (v22 + 64 >= v85) {
                  CFIndex v23 = v85;
                }
                uint64_t v86 = v22;
                int64_t v87 = v23;
                if (v85 >= v21) {
                  CFIndex v17 = v21;
                }
                v89.length = v17 + v20;
                v89.location = v22 + v84;
                CFStringGetCharacters(v81, v89, buffer);
                int64_t v11 = v86;
              }
              int v18 = buffer[v12 - v11];
            }
            if ((unsigned __int16)v18 == 64) {
              goto LABEL_39;
            }
          }
          int v24 = (unsigned __int16)v18;
          int v25 = ((unsigned __int16)(v18 - 45) < 0x33u) & (0x4000000000003uLL >> (v18
                                                                                                - 45)) & ((unsigned __int16)v13 == 0);
          if ((((unsigned __int16)(v18 - 45) < 0x33u) & (0x4000000000003uLL >> (v18
                                                                                                - 45)) & ((unsigned __int16)v13 == 0)) == 0)
            int v18 = v13;
          BOOL v26 = v24 == (unsigned __int16)v13;
          if (v24 == (unsigned __int16)v13) {
            int v27 = 1;
          }
          else {
            int v27 = v25;
          }
          if (!v26) {
            int v13 = v18;
          }
          v14 += v27;
          ++v12;
          --v10;
          ++v15;
          if (Length == v12) {
            goto LABEL_39;
          }
        }
      }
      int v14 = 0;
      LOWORD(v13) = 0;
LABEL_39:
      uint64_t v4 = v70;
    }
    else
    {
      int v14 = 0;
      LOWORD(v13) = 0;
    }

    if ((v14 - 1) >= 3) {
      __int16 v29 = 0;
    }
    else {
      __int16 v29 = v13;
    }

    __int16 v72 = v29;
    unint64_t v30 = v5;
    id v31 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v32 = [(__CFString *)v30 componentsSeparatedByString:@"@"];
    if ([v32 count] == 2)
    {
      uint64_t v33 = [v32 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v33 = 0;
    }

    if (v29)
    {
      uint64_t v34 = (void *)MEMORY[0x1CB79B230]();
      long long v35 = (void *)[[NSString alloc] initWithCharacters:&v72 length:1];
      long long v36 = [v33 componentsSeparatedByString:v35];
      [v4 addObjectsFromArray:v36];

      goto LABEL_53;
    }
    if (v33)
    {
      long long v37 = v33;
      if ((unint64_t)[(__CFString *)v37 length] < 2
        || [(__CFString *)v37 characterAtIndex:0] - 91 < 0xFFFFFFE6)
      {

        goto LABEL_52;
      }
      long long v40 = objc_opt_new();
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v74 = 0u;
      CFIndex v41 = CFStringGetLength(v37);
      long long v81 = v37;
      uint64_t v84 = 0;
      CFIndex v85 = v41;
      uint64_t v42 = CFStringGetCharactersPtr(v37);
      char v43 = 0;
      long long v82 = v42;
      if (!v42) {
        char v43 = CFStringGetCStringPtr(v37, 0x600u);
      }
      CFIndex v44 = 0;
      long long v83 = v43;
      uint64_t v86 = 0;
      int64_t v87 = 0;
      if (v41 < 2)
      {
LABEL_93:
        v61 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v62 = [(__CFString *)v37 substringFromIndex:v44];
        [v40 addObject:v62];

        goto LABEL_94;
      }
      uint64_t v67 = v40;
      uint64_t v68 = v37;
      uint64_t v45 = 0;
      CFIndex v44 = 0;
      id v66 = v33;
      CFIndex v65 = v41;
      CFIndex v69 = v41 - 1;
      uint64_t v71 = v4;
      uint64_t v46 = -1;
      unint64_t v47 = 1;
      uint64_t v48 = 65;
      while (1)
      {
        uint64_t v49 = v45 + 1;
        if (v47 >= 4) {
          uint64_t v50 = 4;
        }
        else {
          uint64_t v50 = v47;
        }
        v51 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v52 = v85;
        if (v85 <= v49)
        {
          unsigned int v54 = 0;
          UniChar v53 = 0;
        }
        else
        {
          if (v82)
          {
            UniChar v53 = v82[v45 + 1 + v84];
          }
          else if (v83)
          {
            UniChar v53 = v83[v84 + 1 + v45];
          }
          else
          {
            if (v87 <= v49 || (uint64_t v55 = v86, v86 > v49))
            {
              uint64_t v56 = v45 - v50 + 65;
              if (v56 >= v85) {
                uint64_t v56 = v85;
              }
              uint64_t v86 = v45 - v50 + 1;
              int64_t v87 = v56;
              if (v85 >= v48 - v50) {
                uint64_t v52 = v48 - v50;
              }
              v90.length = v52 + v50 + v46;
              v90.location = v45 - v50 + 1 + v84;
              CFStringGetCharacters(v81, v90, buffer);
              uint64_t v55 = v86;
            }
            UniChar v53 = buffer[v45 + 1 - v55];
          }
          unsigned int v54 = v53;
          if (v53 > 0x7Fu)
          {
            int v57 = __maskrune(v53, 0x2000uLL);
            goto LABEL_84;
          }
        }
        int v57 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v54 + 60) & 0x2000;
LABEL_84:
        if (v57) {
          BOOL v58 = 1;
        }
        else {
          BOOL v58 = (unsigned __int16)(v53 - 65) > 0x19u;
        }
        if (v58)
        {
          if (v57)
          {
            id v64 = 0;
            uint64_t v4 = v71;
            uint64_t v33 = v66;
            long long v40 = v67;
            long long v37 = v68;
            goto LABEL_100;
          }
        }
        else
        {
          v59 = (void *)MEMORY[0x1CB79B230]();
          v60 = -[__CFString substringWithRange:](v68, "substringWithRange:", v44, v45 - v44 + 1);
          [v67 addObject:v60];

          CFIndex v44 = v45 + 1;
        }
        ++v47;
        ++v45;
        --v46;
        ++v48;
        if (v69 == v45)
        {
          uint64_t v33 = v66;
          uint64_t v4 = v71;
          long long v40 = v67;
          long long v37 = v68;
          if (v44 <= v65) {
            goto LABEL_93;
          }
LABEL_94:
          if ((unint64_t)objc_msgSend(v40, "count", v65) < 2)
          {
            v63 = 0;
          }
          else if ((unint64_t)[v40 count] >= 4)
          {
            v63 = 0;
          }
          else
          {
            v63 = v40;
          }
          id v64 = v63;
LABEL_100:

          if (v64)
          {
            [v4 addObjectsFromArray:v64];

            break;
          }
LABEL_52:
          objc_msgSend(v4, "addObject:", v37, v65);
          break;
        }
      }
    }
LABEL_53:
    if (objc_msgSend(v4, "count", v65))
    {
      long long v38 = (void *)MEMORY[0x1CB79B230]();
      CFIndex v28 = objc_msgSend(v4, "_pas_componentsJoinedByString:", @" ");
    }
    else
    {
      CFIndex v28 = 0;
    }
  }
  else
  {
    CFIndex v28 = 0;
  }

  return v28;
}

+ (BOOL)unnormalizedNamesApproximatelyMatch:(id)a3 and:(id)a4 threshold:(double)a5
{
  +[SGNames unnormalizedNameSimilarity:a3 and:a4];
  return v6 > a5;
}

+ (BOOL)unnormalizedNamesApproximatelyMatch:(id)a3 and:(id)a4
{
  return +[SGNames unnormalizedNamesApproximatelyMatch:a3 and:a4 threshold:4.0];
}

+ (BOOL)namesApproximatelyMatch:(id)a3 and:(id)a4 threshold:(double)a5
{
  id v7 = a4;
  uint64_t v8 = SGNormalizeName((uint64_t)a3);
  uint64_t v9 = SGNormalizeName((uint64_t)v7);

  +[SGNames nameSimilarity:v8 and:v9];
  BOOL v11 = v10 >= a5;

  return v11;
}

+ (BOOL)namesApproximatelyMatch:(id)a3 and:(id)a4
{
  return [a1 namesApproximatelyMatch:a3 and:a4 threshold:4.0];
}

+ (double)unnormalizedNameSimilarity:(id)a3 and:(id)a4
{
  id v5 = a4;
  double v6 = SGNormalizeName((uint64_t)a3);
  id v7 = SGNormalizeName((uint64_t)v5);

  +[SGNames nameSimilarity:v6 and:v7];
  double v9 = v8;

  return v9;
}

+ (double)nameSimilarity:(id)a3 and:(id)a4
{
  v92[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1CB79B230]();
  double v8 = 0.0;
  if (![v5 length] || !objc_msgSend(v6, "length")) {
    goto LABEL_80;
  }
  double v9 = (__CFString *)v5;
  double v10 = self;

  if (!v10) {
    goto LABEL_28;
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v77 = 0u;
  CFIndex Length = CFStringGetLength(v9);
  CFStringRef theString = v9;
  uint64_t v87 = 0;
  CFIndex v88 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  CFIndex v85 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  }
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v86 = CStringPtr;
  if (Length < 1)
  {
LABEL_28:

LABEL_29:
    BOOL v26 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    [(__CFString *)v9 rangeOfCharacterFromSet:v26];
    uint64_t v28 = v27;
    [v6 rangeOfCharacterFromSet:v26];
    double v8 = 0.0;
    if (v28 | v29)
    {
      uint64_t v30 = v29;
      double v8 = 10.0;
      if (([(__CFString *)v9 isEqualToString:v6] & 1) == 0)
      {
        if (v28 && v30) {
          goto LABEL_34;
        }
        id v31 = SGNamesOnlyNameChars(v9);
        uint64_t v32 = SGNamesOnlyNameChars(v6);
        char v33 = [v31 isEqualToString:v32];

        double v8 = 8.0;
        if ((v33 & 1) == 0)
        {
LABEL_34:
          uint64_t v34 = tokenizeName(v9);
          long long v35 = tokenizeName(v6);
          double v8 = 0.0;
          if ([v34 count] && objc_msgSend(v35, "count"))
          {
            if ((unint64_t)[v34 count] >= 4)
            {
              long long v36 = [v34 objectAtIndexedSubscript:0];
              v92[0] = v36;
              long long v37 = [v34 objectAtIndexedSubscript:1];
              v92[1] = v37;
              long long v38 = objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v34, "count") - 1);
              v92[2] = v38;
              uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3];

              uint64_t v34 = (void *)v39;
            }
            if ((unint64_t)[v35 count] >= 4)
            {
              long long v40 = [v35 objectAtIndexedSubscript:0];
              v91[0] = v40;
              CFIndex v41 = [v35 objectAtIndexedSubscript:1];
              v91[1] = v41;
              uint64_t v42 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v35, "count") - 1);
              v91[2] = v42;
              uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:3];

              long long v35 = (void *)v43;
            }
            unint64_t v44 = [v35 count];
            unint64_t v45 = [v34 count];
            BOOL v46 = v44 >= v45;
            if (v44 >= v45) {
              unint64_t v47 = v34;
            }
            else {
              unint64_t v47 = v35;
            }
            if (!v46) {
              long long v35 = v34;
            }
            if ([v47 count] == 2 && objc_msgSend(v35, "count") == 3)
            {
              uint64_t v48 = [v47 objectAtIndexedSubscript:1];
              if ([v48 length])
              {
                uint64_t v49 = [v35 objectAtIndexedSubscript:1];
                if ((unint64_t)[v49 length] < 3)
                {
                  BOOL v52 = 0;
                }
                else
                {
                  long long v74 = [v47 objectAtIndexedSubscript:1];
                  int v50 = [v74 characterAtIndex:0];
                  v51 = [v35 objectAtIndexedSubscript:1];
                  BOOL v52 = v50 == [v51 characterAtIndex:0];
                }
              }
              else
              {
                BOOL v52 = 0;
              }
            }
            else
            {
              BOOL v52 = 0;
            }
            UniChar v53 = objc_msgSend(v47, "objectAtIndexedSubscript:", objc_msgSend(v47, "count") - 1);
            id v73 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v35, "count") - 1);
            unsigned int v54 = [v47 objectAtIndexedSubscript:0];
            uint64_t v55 = [v35 objectAtIndexedSubscript:0];
            BOOL v71 = v52;
            if (v52 || [v53 isEqualToString:v73])
            {
              long long v75 = v53;
              int v56 = [v54 characterAtIndex:0];
              BOOL v57 = v56 == [v55 characterAtIndex:0];
              UniChar v53 = v75;
              if (v57
                || (+[SGNicknames nicknamesForName:v54],
                    BOOL v58 = objc_claimAutoreleasedReturnValue(),
                    int v59 = [v58 containsObject:v55],
                    v58,
                    UniChar v53 = v75,
                    v59))
              {
                if ([v47 count] != 3 || objc_msgSend(v35, "count") != 3) {
                  goto LABEL_67;
                }
                v60 = [v47 objectAtIndexedSubscript:1];
                int v70 = [v60 characterAtIndex:0];
                v61 = [v35 objectAtIndexedSubscript:1];
                int v62 = [v61 characterAtIndex:0];
                int v63 = v71;
                if (v70 == v62) {
                  int v63 = 1;
                }
                int v72 = v63;

                UniChar v53 = v75;
                if (v72 == 1)
                {
LABEL_67:
                  double v64 = 0.0;
                  if ([v35 containsObject:v54]) {
                    double v64 = limitedTermProb(v54) + 0.0;
                  }
                  if (([v54 isEqualToString:v53] & 1) == 0
                    && [v35 containsObject:v53])
                  {
                    double v64 = v64 + limitedTermProb(v53);
                  }
                  CFIndex v65 = +[SGNicknames nicknamesForName:v54];
                  int v66 = [v65 containsObject:v55];

                  if (v66)
                  {
                    double v67 = limitedTermProb(v54);
                    double v68 = limitedTermProb(v55);
                    if (v67 < v68) {
                      double v68 = v67;
                    }
                    double v64 = v64 + v68 + 0.602059991;
                  }
                  double v8 = -v64;
                  UniChar v53 = v75;
                }
              }
            }
          }
          else
          {
            unint64_t v47 = v34;
          }
        }
      }
    }

    goto LABEL_80;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 64;
  while (1)
  {
    uint64_t v18 = (unint64_t)v16 >= 4 ? 4 : v16;
    CFIndex v19 = v88;
    if (v88 > v16)
    {
      if (v85)
      {
        UniChar v20 = v85[v16 + v87];
      }
      else if (v86)
      {
        UniChar v20 = v86[v87 + v16];
      }
      else
      {
        if (v90 <= v16 || v15 > v16)
        {
          uint64_t v22 = v18 + v14;
          uint64_t v23 = v17 - v18;
          uint64_t v24 = v16 - v18;
          CFIndex v25 = v24 + 64;
          if (v24 + 64 >= v88) {
            CFIndex v25 = v88;
          }
          uint64_t v89 = v24;
          uint64_t v90 = v25;
          if (v88 >= v23) {
            CFIndex v19 = v23;
          }
          v93.length = v19 + v22;
          v93.location = v24 + v87;
          CFStringGetCharacters(theString, v93, buffer);
          uint64_t v15 = v89;
        }
        UniChar v20 = buffer[v16 - v15];
      }
      if (v20 > 0x7Fu) {
        break;
      }
    }
    ++v16;
    --v14;
    ++v17;
    if (Length == v16) {
      goto LABEL_28;
    }
  }

  double v8 = 10.0;
  if (([(__CFString *)v9 isEqualToString:v6] & 1) == 0) {
    goto LABEL_29;
  }
LABEL_80:

  return v8;
}

+ (id)handleLastNameFirstOrder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  id v7 = (__CFString *)v5;
  double v8 = v7;
  if (v6)
  {
    double v9 = self;

    if (!v9) {
      goto LABEL_29;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v37 = 0u;
    CFIndex Length = CFStringGetLength(v7);
    CFStringRef theString = v7;
    uint64_t v47 = 0;
    CFIndex v48 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    CStringPtr = 0;
    unint64_t v45 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    }
    int64_t v49 = 0;
    int64_t v50 = 0;
    BOOL v46 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v13 = 0;
      int64_t v14 = 0;
      int v15 = 0;
      int64_t v16 = 0;
      uint64_t v17 = 64;
      do
      {
        if ((unint64_t)v16 >= 4) {
          uint64_t v18 = 4;
        }
        else {
          uint64_t v18 = v16;
        }
        CFIndex v19 = v48;
        if (v48 > v16)
        {
          if (v45)
          {
            UniChar v20 = v45[v16 + v47];
          }
          else if (v46)
          {
            UniChar v20 = v46[v47 + v16];
          }
          else
          {
            if (v50 <= v16 || v14 > v16)
            {
              uint64_t v22 = v18 + v13;
              uint64_t v23 = v17 - v18;
              int64_t v24 = v16 - v18;
              CFIndex v25 = v24 + 64;
              if (v24 + 64 >= v48) {
                CFIndex v25 = v48;
              }
              int64_t v49 = v24;
              int64_t v50 = v25;
              if (v48 >= v23) {
                CFIndex v19 = v23;
              }
              v52.length = v19 + v22;
              v52.location = v24 + v47;
              CFStringGetCharacters(theString, v52, buffer);
              int64_t v14 = v49;
            }
            UniChar v20 = buffer[v16 - v14];
          }
          if (v20 == 44) {
            ++v15;
          }
        }
        ++v16;
        --v13;
        ++v17;
      }
      while (Length != v16);
    }
    else
    {
LABEL_29:
      int v15 = 0;
    }

    *(void *)buffer = 0;
    *(void *)&buffer[4] = buffer;
    *(void *)&long long v37 = 0x3032000000;
    *((void *)&v37 + 1) = __Block_byref_object_copy__17263;
    *(void *)&long long v38 = __Block_byref_object_dispose__17264;
    BOOL v26 = v7;
    *((void *)&v38 + 1) = v26;
    if (v15 == 1)
    {
      uint64_t v27 = (void *)MEMORY[0x1CB79B230]();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__SGNames_handleLastNameFirstOrder___block_invoke;
      block[3] = &__block_descriptor_48_e5_v8__0l;
      block[4] = a2;
      block[5] = a1;
      if (handleLastNameFirstOrder___pasOnceToken24 != -1) {
        dispatch_once(&handleLastNameFirstOrder___pasOnceToken24, block);
      }
      id v28 = (id)handleLastNameFirstOrder___pasExprOnceResult;
      uint64_t v29 = [v28 result];

      uint64_t v30 = [(__CFString *)v26 length];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __36__SGNames_handleLastNameFirstOrder___block_invoke_3;
      v32[3] = &unk_1E65B8998;
      char v33 = v26;
      uint64_t v34 = buffer;
      objc_msgSend(v29, "enumerateMatchesInString:options:range:usingBlock:", v33, 0, 0, v30, v32);

      BOOL v26 = *(__CFString **)(*(void *)&buffer[4] + 40);
    }
    double v8 = v26;
    _Block_object_dispose(buffer, 8);
  }
  return v8;
}

void __36__SGNames_handleLastNameFirstOrder___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = objc_alloc(MEMORY[0x1E4F93B60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SGNames_handleLastNameFirstOrder___block_invoke_2;
  v6[3] = &__block_descriptor_48_e26___NSRegularExpression_8__0l;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = [v3 initWithBlock:v6];
  id v5 = (void *)handleLastNameFirstOrder___pasExprOnceResult;
  handleLastNameFirstOrder___pasExprOnceResult = v4;
}

void __36__SGNames_handleLastNameFirstOrder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v33 = a2;
  id v5 = objc_opt_new();
  uint64_t v6 = [v33 rangeAtIndex:1];
  uint64_t v8 = v7;
  uint64_t v31 = [v33 rangeAtIndex:2];
  uint64_t v10 = v9;
  uint64_t v11 = [v33 rangeAtIndex:3];
  uint64_t v13 = v12;
  uint64_t v14 = [v33 rangeAtIndex:4];
  uint64_t v16 = v15;
  if (v13)
  {
    uint64_t v17 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v11, v13);
    [v5 addObject:v18];
  }
  if (v16)
  {
    CFIndex v19 = (void *)MEMORY[0x1CB79B230]();
    UniChar v20 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v16);
    [v5 addObject:v20];
  }
  if (v8)
  {
    uint64_t v21 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v22 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v8);
    [v5 addObject:v22];
  }
  if (v10)
  {
    uint64_t v23 = (void *)MEMORY[0x1CB79B230]();
    int64_t v24 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v31, v10);
    CFIndex v25 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    BOOL v26 = [v24 stringByTrimmingCharactersInSet:v25];

    [v5 addObject:v26];
  }
  uint64_t v27 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v28 = objc_msgSend(v5, "_pas_componentsJoinedByString:", @" ");
  uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;

  *a4 = 1;
}

id __36__SGNames_handleLastNameFirstOrder___block_invoke_2(uint64_t a1)
{
  v2 = patterns_17196();
  id v3 = [v2 rawValueForKey:@"LastNameFirst"];

  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGNames.m" lineNumber:914 description:@"Could not initialize pattern."];
  }
  id v9 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v3 options:0 error:&v9];
  id v5 = v9;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGNames.m", 917, @"Could not initialize regular expression: %@", v5 object file lineNumber description];
  }
  return v4;
}

+ (id)cleanName:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length])
  {
    id v5 = (__CFString *)v3;
    goto LABEL_69;
  }
  unsigned int v4 = [v3 characterAtIndex:0];
  if (v4 > 0x7F)
  {
    if (!__maskrune(v4, 0x4000uLL)) {
      goto LABEL_7;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v4 + 60) & 0x4000) == 0)
  {
LABEL_7:
    unsigned int v6 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
    if (v6 > 0x7F)
    {
      if (__maskrune(v6, 0x4000uLL)) {
        goto LABEL_9;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v6 + 60) & 0x4000) != 0)
    {
      goto LABEL_9;
    }
    int v7 = [v3 hasSuffix:@" via LinkedIn"] ^ 1;
    goto LABEL_10;
  }
LABEL_9:
  int v7 = 0;
LABEL_10:
  if (cleanName__onceToken == -1)
  {
    if (!v7) {
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  dispatch_once(&cleanName__onceToken, &__block_literal_global_81);
  if (v7)
  {
LABEL_12:
    id v81 = v3;
    CFStringRef theString = (__CFString *)v3;
    uint64_t v8 = self;

    id v9 = theString;
    if (!v8) {
      goto LABEL_67;
    }
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long buffer = 0u;
    long long v95 = 0u;
    CFIndex Length = CFStringGetLength(theString);
    CFStringRef v102 = theString;
    uint64_t v105 = 0;
    CFIndex v106 = Length;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    CStringPtr = 0;
    v103 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    }
    uint64_t v107 = 0;
    uint64_t v108 = 0;
    v104 = CStringPtr;
    if (Length <= 0)
    {
LABEL_67:

      id v3 = v81;
      goto LABEL_68;
    }
    uint64_t v13 = 0;
    char v14 = 0;
    uint64_t v15 = 0;
    char v16 = 1;
    uint64_t v17 = 64;
    uint64_t v18 = MEMORY[0x1E4F14390];
    while (1)
    {
      uint64_t v19 = (unint64_t)v15 >= 4 ? 4 : v15;
      CFIndex v20 = v106;
      if (v106 <= v15) {
        break;
      }
      if (v103)
      {
        UniChar v21 = v103[v15 + v105];
      }
      else if (v104)
      {
        UniChar v21 = v104[v105 + v15];
      }
      else
      {
        uint64_t v23 = v107;
        if (v108 <= v15 || v107 > v15)
        {
          uint64_t v25 = v19 + v13;
          uint64_t v26 = v17 - v19;
          uint64_t v27 = v15 - v19;
          CFIndex v28 = v27 + 64;
          if (v27 + 64 >= v106) {
            CFIndex v28 = v106;
          }
          uint64_t v107 = v27;
          uint64_t v108 = v28;
          if (v106 >= v26) {
            CFIndex v20 = v26;
          }
          v111.length = v20 + v25;
          v111.location = v27 + v105;
          CFStringGetCharacters(v102, v111, (UniChar *)&buffer);
          uint64_t v23 = v107;
        }
        UniChar v21 = *((_WORD *)&buffer + v15 - v23);
      }
      unsigned int v22 = v21;
      if (v21 <= 0x7Fu) {
        goto LABEL_37;
      }
      if (__maskrune(v21, 0x4000uLL))
      {
LABEL_41:
        if (v14) {
          char v16 = 0;
        }
        char v14 = 1;
        goto LABEL_47;
      }
      if (!__maskrune(v21, 0x500uLL))
      {
LABEL_45:
        char v14 = 0;
        if (CFCharacterSetIsCharacterMember((CFCharacterSetRef)cleanName__suspiciousChars, v21)) {
          char v16 = 0;
        }
        goto LABEL_47;
      }
LABEL_39:
      char v14 = 0;
LABEL_47:
      ++v15;
      --v13;
      ++v17;
      if (Length == v15)
      {

        id v3 = v81;
        id v9 = theString;
        if ((v16 & 1) == 0) {
          goto LABEL_49;
        }
LABEL_68:
        id v5 = v9;
LABEL_69:
        int v59 = v5;
        goto LABEL_102;
      }
    }
    unsigned int v22 = 0;
    UniChar v21 = 0;
LABEL_37:
    int v29 = *(_DWORD *)(v18 + 4 * v22 + 60);
    if ((v29 & 0x4000) != 0) {
      goto LABEL_41;
    }
    if ((v29 & 0x500) == 0) {
      goto LABEL_45;
    }
    goto LABEL_39;
  }
LABEL_49:
  uint64_t v84 = 0;
  CFIndex v85 = &v84;
  uint64_t v86 = 0x3032000000;
  uint64_t v87 = __Block_byref_object_copy__17263;
  CFIndex v88 = __Block_byref_object_dispose__17264;
  id v89 = 0;
  id v30 = v3;
  removeParens(v3);
  id v89 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = _PASCollapseWhitespaceAndStrip();
  uint64_t v32 = (void *)v85[5];
  v85[5] = v31;

  uint64_t v33 = _PASStripQuotationMarks();
  uint64_t v34 = (void *)v85[5];
  v85[5] = v33;

  if ([(id)v85[5] hasSuffix:@" via LinkedIn"])
  {
    long long v35 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v36 = objc_msgSend((id)v85[5], "substringToIndex:", objc_msgSend((id)v85[5], "length") - 13);
    long long v37 = (void *)v85[5];
    v85[5] = v36;
  }
  id v38 = (id)v85[5];
  long long v39 = v38;
  if (v38 && (uint64_t v40 = [v38 rangeOfString:@"@" options:2], v41))
  {
    long long v42 = (void *)MEMORY[0x1CB79B230](v40);
    long long v43 = [v39 componentsSeparatedByString:@" "];
    unint64_t v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v43, "count"));
    long long v93 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v90 = 0u;
    id v45 = v43;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v90 objects:&buffer count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v91 != v47) {
            objc_enumerationMutation(v45);
          }
          int64_t v49 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          [v49 rangeOfString:@"@" options:2];
          if (!v50) {
            [v44 addObject:v49];
          }
        }
        uint64_t v46 = [v45 countByEnumeratingWithState:&v90 objects:&buffer count:16];
      }
      while (v46);
    }

    v51 = (void *)MEMORY[0x1CB79B230]();
    objc_msgSend(v44, "_pas_componentsJoinedByString:", @" ");
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = v39;
  }

  UniChar v53 = (void *)v85[5];
  v85[5] = (uint64_t)v52;

  CFCharacterSetRef v54 = (const __CFCharacterSet *)_PASGetQuotationMarkCharacterSet();
  uint64_t v55 = (__CFString *)(id)v85[5];
  int v56 = self;

  if (!v56) {
    goto LABEL_100;
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long buffer = 0u;
  long long v95 = 0u;
  CFIndex v57 = CFStringGetLength(v55);
  CFStringRef v102 = v55;
  uint64_t v105 = 0;
  CFIndex v106 = v57;
  v103 = CFStringGetCharactersPtr(v55);
  BOOL v58 = v103 ? 0 : CFStringGetCStringPtr(v55, 0x600u);
  uint64_t v107 = 0;
  uint64_t v108 = 0;
  v104 = v58;
  if (v57 <= 0)
  {
LABEL_100:

    goto LABEL_101;
  }
  uint64_t v60 = 0;
  int64_t v61 = 0;
  int v62 = 0;
  uint64_t v63 = 64;
  do
  {
    if ((unint64_t)v61 >= 4) {
      uint64_t v64 = 4;
    }
    else {
      uint64_t v64 = v61;
    }
    CFIndex v65 = v106;
    if (v106 <= v61)
    {
      UniChar v66 = 0;
LABEL_95:
      if (!CFCharacterSetIsCharacterMember(v54, v66)) {
        goto LABEL_97;
      }
      goto LABEL_96;
    }
    if (v103)
    {
      UniChar v66 = v103[v61 + v105];
    }
    else if (v104)
    {
      UniChar v66 = v104[v105 + v61];
    }
    else
    {
      uint64_t v67 = v107;
      if (v108 <= v61 || v107 > v61)
      {
        uint64_t v69 = v64 + v60;
        uint64_t v70 = v63 - v64;
        int64_t v71 = v61 - v64;
        CFIndex v72 = v71 + 64;
        if (v71 + 64 >= v106) {
          CFIndex v72 = v106;
        }
        uint64_t v107 = v71;
        uint64_t v108 = v72;
        if (v106 >= v70) {
          CFIndex v65 = v70;
        }
        v112.length = v65 + v69;
        v112.location = v71 + v105;
        CFStringGetCharacters(v102, v112, (UniChar *)&buffer);
        uint64_t v67 = v107;
      }
      UniChar v66 = *((_WORD *)&buffer + v61 - v67);
    }
    if (v66 != 34) {
      goto LABEL_95;
    }
LABEL_96:
    ++v62;
LABEL_97:
    ++v61;
    --v60;
    ++v63;
  }
  while (v57 != v61);

  if (v62 >= 2)
  {
    id v73 = (void *)MEMORY[0x1CB79B230]();
    long long v74 = patterns_17196();
    long long v75 = [v74 regex2ForKey:@"QuotedNickname"];
    uint64_t v76 = v85[5];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __21__SGNames_cleanName___block_invoke_2;
    v83[3] = &unk_1E65BA268;
    v83[4] = &v84;
    [v75 enumerateMatchesInString:v76 ngroups:2 block:v83];
  }
LABEL_101:
  long long v77 = (void *)MEMORY[0x1CB79B230]();
  long long v78 = (void *)v85[5];
  long long v79 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  int v59 = [v78 stringByTrimmingCharactersInSet:v79];

  _Block_object_dispose(&v84, 8);

  id v3 = v30;
LABEL_102:

  return v59;
}

uint64_t __21__SGNames_cleanName___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2[3] != 0x7FFFFFFFFFFFFFFFLL && a2[6] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v4 = (void *)MEMORY[0x1CB79B230]();
    id v5 = [NSString alloc];
    unsigned int v6 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "substringWithRange:", a2[3], a2[4]);
    int v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "substringWithRange:", a2[6], a2[7]);
    uint64_t v8 = [v5 initWithFormat:@"%@ %@", v6, v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return 0;
}

void __21__SGNames_cleanName___block_invoke()
{
  Mutable = CFCharacterSetCreateMutable(0);
  CFCharacterSetAddCharactersInString(Mutable, @"()<>[]\"@");
  CFCharacterSetRef v1 = (const __CFCharacterSet *)_PASGetQuotationMarkCharacterSet();
  CFCharacterSetUnion(Mutable, v1);
  cleanName__suspiciousChars = (uint64_t)CFCharacterSetCreateCopy(0, Mutable);
  CFRelease(Mutable);
}

+ (id)universalCleanName:(id)a3
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
  CFStringTrimWhitespace(MutableCopy);
  CFIndex Length = CFStringGetLength(MutableCopy);
  if (Length >= 2)
  {
    CFIndex v5 = Length;
    if (CFStringGetCharacterAtIndex(MutableCopy, 0) == 34)
    {
      CFIndex v6 = v5 - 1;
      if (CFStringGetCharacterAtIndex(MutableCopy, v6) == 34)
      {
        v9.location = v6;
        v9.length = 1;
        CFStringDelete(MutableCopy, v9);
        v10.location = 0;
        v10.length = 1;
        CFStringDelete(MutableCopy, v10);
        CFStringTrimWhitespace(MutableCopy);
      }
    }
  }
  return MutableCopy;
}

+ (id)stripAndReturnHonorifics:(id)a3
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__SGNames_stripAndReturnHonorifics___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (stripAndReturnHonorifics__onceToken != -1) {
      dispatch_once(&stripAndReturnHonorifics__onceToken, block);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
    CFIndex v6 = [(id)stripAndReturnHonorifics__cache objectForKeyedSubscript:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
    if (!v6)
    {
      int v7 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x3032000000;
      CFIndex v28 = __Block_byref_object_copy__17263;
      int v29 = __Block_byref_object_dispose__17264;
      id v30 = &stru_1F24EEF20;
      uint64_t v19 = 0;
      CFIndex v20 = &v19;
      uint64_t v21 = 0x3032000000;
      unsigned int v22 = __Block_byref_object_copy__17263;
      uint64_t v23 = __Block_byref_object_dispose__17264;
      int64_t v24 = &stru_1F24EEF20;
      uint64_t v13 = 0;
      char v14 = &v13;
      uint64_t v15 = 0x3032000000;
      char v16 = __Block_byref_object_copy__17263;
      uint64_t v17 = __Block_byref_object_dispose__17264;
      id v8 = v5;
      id v18 = v8;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __36__SGNames_stripAndReturnHonorifics___block_invoke_69;
      v12[3] = &unk_1E65B8900;
      v12[4] = &v13;
      v12[5] = &v25;
      findEndOfHonorificPrefixCandidate(v8, v12);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      _PASMemoryHeavyOperation();
      uint64_t v9 = v14[5];
      v32[0] = v26[5];
      v32[1] = v9;
      v32[2] = v20[5];
      CFIndex v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 3, v11, 3221225472, __36__SGNames_stripAndReturnHonorifics___block_invoke_2, &unk_1E65B8950, &v13, &v19);
      os_unfair_lock_lock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
      if ((unint64_t)[(id)stripAndReturnHonorifics__cache count] >= 0xA) {
        [(id)stripAndReturnHonorifics__cache removeAllObjects];
      }
      [(id)stripAndReturnHonorifics__cache setObject:v6 forKeyedSubscript:v8];
      os_unfair_lock_unlock((os_unfair_lock_t)&stripAndReturnHonorifics__cacheLock);
      _Block_object_dispose(&v13, 8);

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v25, 8);
    }
  }
  else
  {
    CFIndex v6 = 0;
  }

  return v6;
}

void __36__SGNames_stripAndReturnHonorifics___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  id v3 = (void *)stripAndReturnHonorifics__cache;
  stripAndReturnHonorifics__cache = v2;

  unsigned int v4 = patterns_17196();
  id v13 = [v4 rawValueForKey:@"LeadingHonorificPeriodRequired"];

  if (!v13)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGNames.m" lineNumber:755 description:@"failed to get patterns for LeadingHonorificPeriodRequired"];
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
  CFIndex v6 = (void *)stripAndReturnHonorifics__prefixesPeriodRequired;
  stripAndReturnHonorifics__prefixesPeriodRequired = v5;

  int v7 = patterns_17196();
  id v8 = [v7 rawValueForKey:@"LeadingHonorificPeriodOptional"];

  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGNames.m" lineNumber:758 description:@"failed to get patterns for LeadingHonorificPeriodOptional"];
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
  CFRange v10 = (void *)stripAndReturnHonorifics__prefixesPeriodOptional;
  stripAndReturnHonorifics__prefixesPeriodOptional = v9;
}

void __36__SGNames_stripAndReturnHonorifics___block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) substringToIndex:a2 - a4];
  int v8 = objc_msgSend((id)stripAndReturnHonorifics__prefixesPeriodOptional, "containsObject:");
  if ((v8 & 1) == 0 && a4)
  {
    if (([(id)stripAndReturnHonorifics__prefixesPeriodRequired containsObject:v15] & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v8)
  {
LABEL_4:
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) substringToIndex:a2];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) substringFromIndex:a3];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    char v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
LABEL_5:
}

void __36__SGNames_stripAndReturnHonorifics___block_invoke_2(int8x16_t *a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  int8x16_t v1 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v2 = *(void **)(*(void *)(a1[2].i64[0] + 8) + 40);
  v8[1] = 3221225472;
  v8[2] = __36__SGNames_stripAndReturnHonorifics___block_invoke_3;
  v8[3] = &unk_1E65B8928;
  int8x16_t v9 = v1;
  id v3 = v8;
  uint64_t v4 = enumerateTrailingHonorificMatchesInString_onceToken;
  id v5 = v2;
  if (v4 != -1) {
    dispatch_once(&enumerateTrailingHonorificMatchesInString_onceToken, &__block_literal_global_226_17290);
  }
  CFIndex v6 = (void *)enumerateTrailingHonorificMatchesInString_trailingRe;
  uint64_t v7 = [v5 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __enumerateTrailingHonorificMatchesInString_block_invoke_2;
  v10[3] = &unk_1E65B89C0;
  id v11 = v3;
  objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v5, 0, 0, v7, v10);
}

uint64_t __36__SGNames_stripAndReturnHonorifics___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "substringWithRange:", a2, a3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  int v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  int8x16_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) substringToIndex:a2];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hasSuffix:@","])
  {
    uint64_t v16 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "length") - 1);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  return 0;
}

+ (id)stripHonorifics:(id)a3
{
  id v3 = [a1 stripAndReturnHonorifics:a3];
  uint64_t v4 = [v3 objectAtIndexedSubscript:1];

  return v4;
}

+ (BOOL)isCapitalized:(id)a3
{
  id v3 = a3;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  uint64_t v5 = (__CFString *)v3;
  uint64_t v6 = self;

  if (v6)
  {
    memset(v27, 0, sizeof(v27));
    CFIndex Length = CFStringGetLength(v5);
    CFStringRef theString = v5;
    uint64_t v31 = 0;
    CFIndex v32 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    int v29 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    int64_t v33 = 0;
    int64_t v34 = 0;
    id v30 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v10 = 0;
      int64_t v11 = 0;
      int v12 = 0;
      char v13 = 0;
      uint64_t v14 = 64;
      while (1)
      {
        if ((unint64_t)v11 >= 4) {
          uint64_t v15 = 4;
        }
        else {
          uint64_t v15 = v11;
        }
        CFIndex v16 = v32;
        if (v32 <= v11)
        {
          UniChar v17 = 0;
        }
        else if (v29)
        {
          UniChar v17 = v29[v11 + v31];
        }
        else if (v30)
        {
          UniChar v17 = v30[v31 + v11];
        }
        else
        {
          int64_t v19 = v33;
          if (v34 <= v11 || v33 > v11)
          {
            uint64_t v21 = v15 + v10;
            uint64_t v22 = v14 - v15;
            int64_t v23 = v11 - v15;
            CFIndex v24 = v23 + 64;
            if (v23 + 64 >= v32) {
              CFIndex v24 = v32;
            }
            int64_t v33 = v23;
            int64_t v34 = v24;
            if (v32 >= v22) {
              CFIndex v16 = v22;
            }
            v35.length = v16 + v21;
            v35.location = v23 + v31;
            CFStringGetCharacters(theString, v35, (UniChar *)v27);
            int64_t v19 = v33;
          }
          UniChar v17 = *((_WORD *)v27 + v11 - v19);
        }
        int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v17);
        if (v13)
        {
          if (!IsCharacterMember) {
            ++v12;
          }
        }
        else if (!IsCharacterMember)
        {
          BOOL v25 = 0;
          goto LABEL_34;
        }
        ++v11;
        --v10;
        ++v14;
        char v13 = 1;
        if (Length == v11) {
          goto LABEL_33;
        }
      }
    }
  }
  int v12 = 0;
LABEL_33:
  BOOL v25 = 1;
LABEL_34:

  if (v12 <= 0) {
    BOOL v25 = 0;
  }

  return v25;
}

+ (BOOL)isDifficultName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  int v5 = SGGuessNamingTradition(v3);
  BOOL v7 = v5 == 5 || (v5 & 0xFFFFFFFD) == 4;

  return v7;
}

+ (BOOL)isCommonVietnameseSurname:(id)a3
{
  id v3 = (__CFString *)a3;
  if (isCommonVietnameseSurname___pasOnceToken13 != -1) {
    dispatch_once(&isCommonVietnameseSurname___pasOnceToken13, &__block_literal_global_57_17369);
  }
  id v4 = (id)isCommonVietnameseSurname___pasExprOnceResult;
  if ([(__CFString *)v3 length] && (CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v3)) != 0)
  {
    uint64_t v6 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);
    CFStringCapitalize(v6, 0);
    char v7 = [v4 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __37__SGNames_isCommonVietnameseSurname___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = patterns_17196();
  uint64_t v3 = [v2 rawValueForKey:@"CommonVietnameseSurnameList"];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = [v1 initWithArray:v5];
  char v7 = (void *)isCommonVietnameseSurname___pasExprOnceResult;
  isCommonVietnameseSurname___pasExprOnceResult = v6;
}

+ (BOOL)isProbablyShortCJKName:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 5)
  {
    if (isProbablyShortCJKName__onceToken != -1) {
      dispatch_once(&isProbablyShortCJKName__onceToken, &__block_literal_global_55_17374);
    }
    uint64_t v5 = (__CFString *)v3;
    uint64_t v6 = self;

    if (!v6) {
      goto LABEL_32;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    CFIndex Length = CFStringGetLength(v5);
    CFStringRef theString = v5;
    uint64_t v34 = 0;
    CFIndex v35 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    CFIndex v32 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    int64_t v36 = 0;
    int64_t v37 = 0;
    int64_t v33 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v10 = 0;
      int64_t v11 = 0;
      BOOL v4 = 1;
      uint64_t v12 = 64;
      do
      {
        if ((unint64_t)v11 >= 4) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = v11;
        }
        CFIndex v14 = v35;
        if (v35 <= v11)
        {
          UniChar v15 = 0;
        }
        else if (v32)
        {
          UniChar v15 = v32[v11 + v34];
        }
        else if (v33)
        {
          UniChar v15 = v33[v34 + v11];
        }
        else
        {
          int64_t v16 = v36;
          if (v37 <= v11 || v36 > v11)
          {
            uint64_t v18 = v13 + v10;
            uint64_t v19 = v12 - v13;
            int64_t v20 = v11 - v13;
            CFIndex v21 = v20 + 64;
            if (v20 + 64 >= v35) {
              CFIndex v21 = v35;
            }
            int64_t v36 = v20;
            int64_t v37 = v21;
            if (v35 >= v19) {
              CFIndex v14 = v19;
            }
            v38.length = v14 + v18;
            v38.location = v20 + v34;
            CFStringGetCharacters(theString, v38, (UniChar *)&v23);
            int64_t v16 = v36;
          }
          UniChar v15 = *((_WORD *)&v23 + v11 - v16);
        }
        if (objc_msgSend((id)isProbablyShortCJKName__commonCJKCharsets, "characterIsMember:", v15, v23, v24, v25, v26, v27, v28, v29, v30))break; {
        BOOL v4 = ++v11 < Length;
        }
        --v10;
        ++v12;
      }
      while (Length != v11);
    }
    else
    {
LABEL_32:
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __34__SGNames_isProbablyShortCJKName___block_invoke()
{
  v0 = chineseCharSet();
  id v5 = (id)[v0 mutableCopy];

  id v1 = japaneseCharSet();
  [v5 formUnionWithCharacterSet:v1];

  uint64_t v2 = hangulCharSet();
  [v5 formUnionWithCharacterSet:v2];

  uint64_t v3 = [v5 copy];
  BOOL v4 = (void *)isProbablyShortCJKName__commonCJKCharsets;
  isProbablyShortCJKName__commonCJKCharsets = v3;
}

+ (BOOL)isLowercaseStringCommonNameWord:(id)a3
{
  uint64_t v3 = +[SGWords normalizeLowercaseWord:a3];
  char v4 = nameData(v3);

  return v4 & 1;
}

+ (unsigned)attributesForNameWord:(id)a3
{
  unsigned int v3 = [a1 namePayload:a3];
  return (v3 >> 2) & 2 | v3 & 5;
}

+ (BOOL)isSalientNameByChars:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] < 2)
  {
    BOOL v12 = 0;
  }
  else
  {
    char v5 = 0;
    uint64_t v6 = -1;
    unint64_t v7 = 1;
    do
    {
      int v8 = (void *)MEMORY[0x1CB79B230]();
      int8x16_t v9 = objc_msgSend(v4, "substringWithRange:", 0, v7);
      if ([a1 isFamilyName:v9])
      {
        uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
        int64_t v11 = objc_msgSend(v4, "substringWithRange:", v7, objc_msgSend(v4, "length") + v6);
        if ([a1 isSalientName:v11]) {
          char v5 = 1;
        }
      }
      BOOL v12 = v5 & 1;
      if (v7 > 1) {
        break;
      }
      ++v7;
      --v6;
    }
    while ((v5 & 1) == 0);
  }

  return v12;
}

+ (BOOL)isFamilyName:(id)a3
{
  return (~[a1 namePayload:a3] & 0xC) == 0;
}

+ (BOOL)isSalientName:(id)a3
{
  return ([a1 namePayload:a3] >> 2) & 1;
}

+ (BOOL)isCommonNameWord:(id)a3
{
  return [a1 namePayload:a3] & 1;
}

+ ($D369DFA4738CCB2DC34F10FA2F14702B)namePayload:(id)a3
{
  id v4 = a3;
  if ([a1 isProbablyShortCJKName:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[SGWords normalizeWord:v4];
  }
  uint64_t v6 = v5;
  $D369DFA4738CCB2DC34F10FA2F14702B v7 = ($D369DFA4738CCB2DC34F10FA2F14702B)nameData(v5);

  return v7;
}

@end
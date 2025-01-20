@interface SGInhumans
+ (BOOL)_isInhumanEmailAddressPatternMatch:(id)a3;
+ (BOOL)areHumanHeaders:(id)a3;
+ (BOOL)hasTooManyLongNumbers:(id)a3;
+ (BOOL)isInhumanBody:(id)a3;
+ (BOOL)isInhumanName:(id)a3;
+ (BOOL)isInhumanNamedEmailAddress:(id)a3;
+ (BOOL)isInhumanPerson:(id)a3;
+ (BOOL)isInhumanPhoneNumber:(id)a3;
@end

@implementation SGInhumans

+ (BOOL)areHumanHeaders:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SGInhumans_areHumanHeaders___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (areHumanHeaders___pasOnceToken5 != -1) {
    dispatch_once(&areHumanHeaders___pasOnceToken5, block);
  }
  id v6 = (id)areHumanHeaders___pasExprOnceResult;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1CB79B230](v8);
        v14 = objc_msgSend(v12, "key", (void)v18);
        v15 = [v14 lowercaseString];
        char v16 = [v6 containsObject:v15];

        if (v16)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v9;
}

void __30__SGInhumans_areHumanHeaders___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  v3 = patterns_9321();
  v4 = [v3 rawValueForKey:@"HumanMailingListHeaders"];

  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGInhumans.m", 263, @"Invalid parameter not satisfying: %@", @"a" object file lineNumber description];
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

  id v6 = (void *)areHumanHeaders___pasExprOnceResult;
  areHumanHeaders___pasExprOnceResult = v5;
}

+ (BOOL)isInhumanBody:(id)a3
{
  uint64_t v5 = (__CFString *)a3;
  if (([a1 hasTooManyLongNumbers:v5] & 1) != 0
    || (patterns_9321(),
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 stringSetMatcherForKey:@"InhumanBodyLiterals"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 existsInString:v5],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    if (CStringPtr)
    {
      v12 = CStringPtr;
      v13 = patterns_9321();
      v14 = [v13 regex2ForKey:@"InhumanBodyRegexp/F"];
      v15 = [v14 existsInUtf8:v12];
      BOOL v9 = v15 != 0;
    }
    else if ([(__CFString *)v5 length])
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = [(__CFString *)v5 length];
        if ((unint64_t)(v18 + v16) >= 0x800) {
          uint64_t v19 = 2048;
        }
        else {
          uint64_t v19 = v18 + v16;
        }
        long long v20 = malloc_type_calloc(3 * v19 + 1, 1uLL, 0x100004077774924uLL);
        -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v20, 3 * v19, 0, 4, 0, v17, v19, 0);
        if (v20[3 * v19])
        {
          uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2 object:a1 file:@"SGInhumans.m" lineNumber:249 description:@"NUL-terminator overwritten. This should be impossible."];
        }
        long long v21 = patterns_9321();
        v22 = [v21 regex2ForKey:@"InhumanBodyRegexp/F"];
        v23 = [v22 existsInUtf8:v20];

        BOOL v9 = v23 != 0;
        free(v20);
        if (v23) {
          break;
        }
        v17 += 2048;
        BOOL v9 = 0;
        v16 -= 2048;
      }
      while (v17 < [(__CFString *)v5 length]);
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)hasTooManyLongNumbers:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = self;

  if (v4)
  {
    memset(v23, 0, sizeof(v23));
    CFIndex Length = CFStringGetLength(v3);
    CFStringRef theString = v3;
    uint64_t v27 = 0;
    CFIndex v28 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    v25 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    }
    int64_t v29 = 0;
    int64_t v30 = 0;
    v26 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v8 = 0;
      int64_t v9 = 0;
      int64_t v10 = 0;
      int v11 = 0;
      int v12 = 0;
      uint64_t v13 = 64;
      do
      {
        if ((unint64_t)v10 >= 4) {
          uint64_t v14 = 4;
        }
        else {
          uint64_t v14 = v10;
        }
        CFIndex v15 = v28;
        if (v28 <= v10) {
          goto LABEL_28;
        }
        if (v25)
        {
          UniChar v16 = v25[v10 + v27];
        }
        else if (v26)
        {
          UniChar v16 = v26[v27 + v10];
        }
        else
        {
          if (v30 <= v10 || v9 > v10)
          {
            uint64_t v18 = v14 + v8;
            uint64_t v19 = v13 - v14;
            int64_t v20 = v10 - v14;
            CFIndex v21 = v20 + 64;
            if (v20 + 64 >= v28) {
              CFIndex v21 = v28;
            }
            int64_t v29 = v20;
            int64_t v30 = v21;
            if (v28 >= v19) {
              CFIndex v15 = v19;
            }
            v31.length = v15 + v18;
            v31.location = v20 + v27;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            int64_t v9 = v29;
          }
          UniChar v16 = *((_WORD *)v23 + v10 - v9);
        }
        if ((unsigned __int16)(v16 - 48) > 9u)
        {
LABEL_28:
          int v11 = 0;
        }
        else if (++v11 == 4)
        {
          if (v12 > 8)
          {
            LOBYTE(v4) = 1;
            goto LABEL_31;
          }
          ++v12;
          int v11 = 4;
        }
        ++v10;
        --v8;
        ++v13;
      }
      while (Length != v10);
    }
    LOBYTE(v4) = 0;
  }
LABEL_31:

  return (char)v4;
}

+ (BOOL)isInhumanPhoneNumber:(id)a3
{
  id v3 = a3;
  CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  v4 = _PASKeepOnlyCharacterSet();

  LOBYTE(v3) = (unint64_t)[v4 length] < 7;
  return (char)v3;
}

+ (BOOL)isInhumanPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 handles];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [v5 handleIdentifier];
      int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1ADC8]];

      if (v9)
      {
        int64_t v10 = [v5 handles];
        int v11 = [v10 objectAtIndexedSubscript:0];
        char v12 = [a1 isInhumanEmailAddress:v11];
      }
      else
      {
        uint64_t v14 = [v5 handleIdentifier];
        int v15 = [v14 isEqualToString:*MEMORY[0x1E4F1AEE0]];

        if (!v15) {
          goto LABEL_10;
        }
        int64_t v10 = [v5 handles];
        int v11 = [v10 objectAtIndexedSubscript:0];
        char v12 = [a1 isInhumanPhoneNumber:v11];
      }
      char v16 = v12;

      if (v16)
      {
        char v13 = 1;
        goto LABEL_11;
      }
LABEL_10:
      unint64_t v17 = [v5 displayName];
      char v13 = [a1 isInhumanName:v17];

      goto LABEL_11;
    }
  }
  char v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)isInhumanNamedEmailAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 emailAddress];
    if ([a1 isInhumanEmailAddress:v6])
    {
      char v7 = 1;
    }
    else
    {
      uint64_t v8 = [v5 name];
      char v7 = [a1 isInhumanName:v8];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)_isInhumanEmailAddressPatternMatch:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, a1, @"SGInhumans.m", 110, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  id v6 = patterns_9321();
  char v7 = [v6 regex2ForKey:@"InhumanEmailExceptions"];
  uint64_t v8 = [v7 existsInString:v5];

  if (v8)
  {
    BOOL v9 = 0;
    goto LABEL_62;
  }
  int64_t v10 = (__CFString *)v5;
  int v11 = self;

  if (v11)
  {
    v47 = a2;
    id v48 = a1;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    *(_OWORD *)buffer = 0u;
    CFIndex Length = CFStringGetLength(v10);
    CFStringRef theString = v10;
    uint64_t v62 = 0;
    CFIndex v63 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v10);
    CStringPtr = 0;
    v60 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
    }
    int64_t v64 = 0;
    int64_t v65 = 0;
    v61 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v15 = 0;
      int64_t v16 = 0;
      int v17 = 0;
      int v18 = 0;
      uint64_t v19 = 64;
      uint64_t v20 = MEMORY[0x1E4F14390];
      do
      {
        if ((unint64_t)v16 >= 4) {
          uint64_t v21 = 4;
        }
        else {
          uint64_t v21 = v16;
        }
        CFIndex v22 = v63;
        if (v63 <= v16)
        {
          int v17 = 0;
          unsigned int v24 = 0;
          UniChar v23 = 0;
        }
        else
        {
          if (v60)
          {
            UniChar v23 = v60[v16 + v62];
          }
          else if (v61)
          {
            UniChar v23 = v61[v62 + v16];
          }
          else
          {
            int64_t v25 = v64;
            if (v65 <= v16 || v64 > v16)
            {
              uint64_t v27 = v21 + v15;
              uint64_t v28 = v19 - v21;
              int64_t v29 = v16 - v21;
              CFIndex v30 = v29 + 64;
              if (v29 + 64 >= v63) {
                CFIndex v30 = v63;
              }
              int64_t v64 = v29;
              int64_t v65 = v30;
              if (v63 >= v28) {
                CFIndex v22 = v28;
              }
              v66.length = v22 + v27;
              uint64_t v31 = v20;
              v66.location = v29 + v62;
              CFStringGetCharacters(theString, v66, buffer);
              uint64_t v20 = v31;
              int64_t v25 = v64;
            }
            UniChar v23 = buffer[v16 - v25];
          }
          unsigned int v24 = v23;
          if (v23 <= 0x3Eu && ((1 << v23) & 0x5000080000000000) != 0)
          {
LABEL_55:
            BOOL v9 = 1;
            goto LABEL_61;
          }
          if (v23 - 48 > 9)
          {
            if (v23 > 0x7Fu)
            {
              uint64_t v34 = v20;
              int v33 = __maskrune(v23, 0x10000uLL);
              uint64_t v20 = v34;
              int v17 = 0;
              goto LABEL_40;
            }
            int v17 = 0;
          }
          else
          {
            if (v17 > 5) {
              goto LABEL_55;
            }
            ++v17;
          }
        }
        int v33 = *(_DWORD *)(v20 + 4 * v24 + 60) & 0x10000;
LABEL_40:
        if (v23 == 45 || v33)
        {
          if (v18 > 30) {
            goto LABEL_55;
          }
          ++v18;
        }
        else
        {
          int v18 = 0;
        }
        ++v16;
        --v15;
        ++v19;
      }
      while (Length != v16);
    }
    a2 = v47;
    a1 = v48;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (_isInhumanEmailAddressPatternMatch__onceToken != -1) {
    dispatch_once(&_isInhumanEmailAddressPatternMatch__onceToken, block);
  }
  emailAddressDomain(v10);
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(id)_isInhumanEmailAddressPatternMatch__inhumanEmailDomains containsObject:v35]) {
    goto LABEL_54;
  }
  uint64_t v36 = [(__CFString *)v10 rangeOfString:@"@" options:2];
  if (!v37) {
    goto LABEL_56;
  }
  uint64_t v38 = v36;
  v39 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v40 = [(__CFString *)v10 substringToIndex:v38];
  v41 = [(id)v40 stringByAppendingString:@"."];

  LOBYTE(v40) = [(__CFString *)v35 containsString:v41];
  if (v40)
  {
LABEL_54:
    BOOL v9 = 1;
  }
  else
  {
LABEL_56:
    *(void *)buffer = 0;
    *(void *)&buffer[4] = buffer;
    *(void *)&long long v52 = 0x2020000000;
    BYTE8(v52) = 0;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke_2;
    v49[3] = &unk_1E65B7120;
    v49[4] = buffer;
    enumerateTokensInEmailAddress(v10, v49);
    if (*(unsigned char *)(*(void *)&buffer[4] + 24))
    {
      BOOL v9 = 1;
    }
    else
    {
      v42 = patterns_9321();
      v43 = [v42 regex2ForKey:@"InhumanEmailPatterns/F"];
      v44 = [v43 existsInString:v10];
      BOOL v9 = v44 != 0;
    }
    _Block_object_dispose(buffer, 8);
  }
  int64_t v10 = v35;
LABEL_61:

LABEL_62:
  return v9;
}

void __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke(uint64_t a1)
{
  v2 = patterns_9321();
  id v11 = [v2 rawValueForKey:@"InhumanEmailDomains"];

  if (!v11)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGInhumans.m" lineNumber:136 description:@"failed to look up raw value for rawValueKeyInhumanEmailDomains"];
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
  id v4 = (void *)_isInhumanEmailAddressPatternMatch__inhumanEmailDomains;
  _isInhumanEmailAddressPatternMatch__inhumanEmailDomains = v3;

  id v5 = patterns_9321();
  id v6 = [v5 rawValueForKey:@"InhumanEmailTokens"];

  if (!v6)
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGInhumans.m" lineNumber:139 description:@"failed to look up raw value for rawValueKeyInhumanEmailTokens"];
  }
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  uint64_t v8 = (void *)_isInhumanEmailAddressPatternMatch__inhumanEmailTokens;
  _isInhumanEmailAddressPatternMatch__inhumanEmailTokens = v7;
}

uint64_t __49__SGInhumans__isInhumanEmailAddressPatternMatch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = [(id)_isInhumanEmailAddressPatternMatch__inhumanEmailTokens containsObject:a2];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return v3 ^ 1u;
}

+ (BOOL)isInhumanName:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__SGInhumans_isInhumanName___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a2;
    block[5] = a1;
    if (isInhumanName__onceToken != -1) {
      dispatch_once(&isInhumanName__onceToken, block);
    }
    [(id)isInhumanName__cacheLock lock];
    if ([(id)isInhumanName__yesCache containsObject:v5])
    {
      LOBYTE(v6) = 1;
LABEL_9:
      uint64_t v7 = (uint64_t)v5;
LABEL_24:
      [(id)isInhumanName__cacheLock unlock];
      id v5 = (id)v7;
      goto LABEL_25;
    }
    if ([(id)isInhumanName__noCache containsObject:v5])
    {
      LOBYTE(v6) = 0;
      goto LABEL_9;
    }
    uint64_t v7 = _PASNormalizeUnicodeString();
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __28__SGInhumans_isInhumanName___block_invoke_2;
    v17[3] = &unk_1E65B70F8;
    v17[4] = &v18;
    +[SGTokenizer enumerateTokensInString:v7 block:v17];
    if (*((unsigned char *)v19 + 24))
    {
      BOOL v6 = 1;
      if (v5)
      {
LABEL_12:
        uint64_t v8 = &isInhumanName__yesCache;
        if (!v6) {
          uint64_t v8 = &isInhumanName__noCache;
        }
        id v9 = (id)*v8;
        if (objc_msgSend(v5, "_pas_retainsConmingledBackingStore"))
        {
          uint64_t v10 = [[NSString alloc] initWithString:v5];

          id v5 = (id)v10;
        }
        [v9 addObject:v5];
        if ((unint64_t)[v9 count] >= 0x19) {
          [v9 removeObjectAtIndex:0];
        }

LABEL_23:
        _Block_object_dispose(&v18, 8);
        goto LABEL_24;
      }
    }
    else
    {
      id v11 = patterns_9321();
      char v12 = [v11 regex2ForKey:@"InhumanName/F"];
      char v13 = [v12 existsInString:v7];
      BOOL v6 = v13 != 0;

      if (v5) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int64_t v16 = 0;
      _os_log_fault_impl(&dword_1CA650000, v14, OS_LOG_TYPE_FAULT, "Got nil name", v16, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    goto LABEL_23;
  }
  LOBYTE(v6) = 0;
LABEL_25:

  return v6;
}

void __28__SGInhumans_isInhumanName___block_invoke(uint64_t a1)
{
  v2 = patterns_9321();
  id v12 = [v2 rawValueForKey:@"InhumanNameComponents"];

  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SGInhumans.m" lineNumber:61 description:@"failed to get raw value for InhumanNameComponents"];
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
  id v4 = (void *)isInhumanName__inhumanNameTokens;
  isInhumanName__inhumanNameTokens = v3;

  uint64_t v5 = objc_opt_new();
  BOOL v6 = (void *)isInhumanName__cacheLock;
  isInhumanName__cacheLock = v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:25];
  uint64_t v8 = (void *)isInhumanName__yesCache;
  isInhumanName__yesCache = v7;

  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:25];
  uint64_t v10 = (void *)isInhumanName__noCache;
  isInhumanName__noCache = v9;
}

uint64_t __28__SGInhumans_isInhumanName___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [(id)isInhumanName__inhumanNameTokens containsObject:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
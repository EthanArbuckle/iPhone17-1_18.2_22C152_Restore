@interface EAEmailAddressParser
+ (BOOL)addressIsEmptyGroup:(id)a3;
+ (BOOL)isLegalEmailAddress:(id)a3;
+ (OS_os_log)log;
+ (_NSRange)rangeOfAddressDomainFromAddress:(id)a3;
+ (id)_stringByDecodingIDNAString:(id)a3 inRange:(_NSRange)a4;
+ (id)_stringByEncodingIDNAString:(id)a3 inRange:(_NSRange)a4;
+ (id)addressDomainFromAddress:(id)a3;
+ (id)displayNameFromAddress:(id)a3;
+ (id)displayNameFromAddress:(id)a3 cacheResults:(BOOL)a4;
+ (id)idnaDecodedAddressForAddress:(id)a3;
+ (id)idnaEncodedAddressForAddress:(id)a3;
+ (id)localPartFromAddress:(id)a3;
+ (id)rawAddressFromFullAddress:(id)a3;
+ (id)rawAddressFromFullAddress:(id)a3 cacheResults:(BOOL)a4;
+ (id)rawAddressRespectingGroupsFromFullAddress:(id)a3;
+ (void)_componentsForFullAddress:(id)a3 rawAddressIndexes:(id *)a4 localPartIndexes:(id *)a5 domainIndexes:(id *)a6;
+ (void)insertPreviousRoute:(unsigned __int16 *)a3 ofLength:(unint64_t)a4 toBuffer:(unsigned __int16 *)a5 ofLength:(unint64_t)a6 atPosition:(unsigned __int16 *)a7 addSpace:(BOOL)a8;
@end

@implementation EAEmailAddressParser

+ (id)idnaEncodedAddressForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 rangeOfAddressDomainFromAddress:v4];
  v7 = objc_msgSend(a1, "_stringByEncodingIDNAString:inRange:", v4, v5, v6);

  return v7;
}

+ (_NSRange)rangeOfAddressDomainFromAddress:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  [a1 _componentsForFullAddress:v4 rawAddressIndexes:0 localPartIndexes:0 domainIndexes:&v11];
  id v5 = v11;
  if ([v5 rangeCount])
  {
    uint64_t v6 = [v5 rangeAtIndex:0];
    NSUInteger v8 = v7;
  }
  else
  {
    NSUInteger v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

+ (id)_stringByEncodingIDNAString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || (objc_msgSend(MEMORY[0x263F08708], "ef_unsafeDomainNameCharacterSet"),
        NSUInteger v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v7, 0, location, length),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = [v6 copy];
  }
  else
  {
    uint64_t v9 = _createStringByApplyingIDNATranslationWithRange(v6, location, length, MEMORY[0x263F8C478]);
  }
  NSUInteger v10 = (void *)v9;

  return v10;
}

+ (id)rawAddressFromFullAddress:(id)a3
{
  v3 = [a1 rawAddressFromFullAddress:a3 cacheResults:1];
  return v3;
}

+ (id)rawAddressFromFullAddress:(id)a3 cacheResults:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (rawAddressFromFullAddress_cacheResults__onceToken != -1) {
      dispatch_once(&rawAddressFromFullAddress_cacheResults__onceToken, &__block_literal_global_1);
    }
    objc_sync_enter(@"com.apple.EmailAddressing.rawAddressesLock");
    NSUInteger v7 = [(id)rawAddressFromFullAddress_cacheResults__rawAddresses objectForKeyedSubscript:v6];
    objc_sync_exit(@"com.apple.EmailAddressing.rawAddressesLock");
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v12 = 0;
      [a1 _componentsForFullAddress:v6 rawAddressIndexes:&v12 localPartIndexes:0 domainIndexes:0];
      id v9 = v12;
      if ([v9 count])
      {
        NSUInteger v10 = objc_msgSend(v6, "ef_substringWithIndexes:", v9);
        if (v4)
        {
          objc_sync_enter(@"com.apple.EmailAddressing.rawAddressesLock");
          [(id)rawAddressFromFullAddress_cacheResults__rawAddresses setObject:v10 forKeyedSubscript:v6];
          objc_sync_exit(@"com.apple.EmailAddressing.rawAddressesLock");
        }
        id v8 = v10;
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)_componentsForFullAddress:(id)a3 rawAddressIndexes:(id *)a4 localPartIndexes:(id *)a5 domainIndexes:(id *)a6
{
  id v41 = a3;
  unint64_t v7 = [v41 length];
  id v8 = objc_alloc_init(MEMORY[0x263F089C8]);
  v37 = a5;
  if (!v7)
  {
    uint64_t v24 = 0;
    int v40 = 0;
    int v25 = 1;
    goto LABEL_56;
  }
  unint64_t v34 = 0;
  char v9 = 0;
  char v33 = 0;
  int v40 = 0;
  char v35 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = MEMORY[0x263EF8318];
  int v36 = 1;
  BOOL v15 = 1;
  do
  {
    unsigned int v16 = [v41 characterAtIndex:v10];
    unsigned int v17 = v16;
    if (v15)
    {
      if (v16 > 0x7F)
      {
        if (__maskrune(v16, 0x4000uLL))
        {
LABEL_6:
          if (v12)
          {
            objc_msgSend(v8, "addIndexesInRange:", v11, v12);
            unint64_t v11 = v10;
          }
          uint64_t v12 = 0;
          ++v11;
          goto LABEL_9;
        }
      }
      else if ((*(_DWORD *)(v14 + 4 * v16 + 60) & 0x4000) != 0)
      {
        goto LABEL_6;
      }
    }
    if (v17 == 92)
    {
      if (v10 + 1 < v7)
      {
        BOOL v15 = 0;
        v12 += 2;
        ++v10;
        goto LABEL_27;
      }
      if (v9)
      {
LABEL_18:
        BOOL v15 = 0;
        ++v12;
        v9 &= v17 != 34;
        goto LABEL_27;
      }
      if (v13 > 0)
      {
LABEL_26:
        BOOL v15 = 0;
        char v9 = 0;
        goto LABEL_27;
      }
      v12 += (v35 & 1) == 0;
      goto LABEL_32;
    }
    if (v9) {
      goto LABEL_18;
    }
    if (v17 == 40)
    {
      BOOL v15 = 0;
      char v9 = 0;
      ++v13;
      goto LABEL_27;
    }
    if (v13 <= 0)
    {
      if (v17 == 60)
      {
        [v8 removeAllIndexes];
        uint64_t v12 = 0;
        char v35 = 0;
        int v40 = 0;
        char v9 = 0;
        unint64_t v34 = 0;
        unint64_t v11 = v10 + 1;
        BOOL v15 = 1;
        char v33 = 1;
        goto LABEL_27;
      }
      if ((v33 & (v17 == 62)) != 0)
      {
        BOOL v15 = 0;
        char v33 = 0;
        char v9 = 0;
        char v35 = 1;
        goto LABEL_27;
      }
      v12 += (v35 & 1) == 0;
      if (v17 != 64)
      {
        if (v17 > 0x7F)
        {
          if (__maskrune(v17, 0x4000uLL))
          {
LABEL_33:
            char v9 = 0;
LABEL_9:
            BOOL v15 = 1;
            goto LABEL_27;
          }
          goto LABEL_42;
        }
LABEL_32:
        if ((*(_DWORD *)(v14 + 4 * v17 + 60) & 0x4000) != 0) {
          goto LABEL_33;
        }
LABEL_42:
        int v21 = v36;
        int v22 = (v40 ^ 1) & v36;
        if ((v33 & 1) == 0) {
          int v22 = v36;
        }
        BOOL v15 = 0;
        char v9 = v17 == 34;
        if (v17 == 34) {
          int v21 = v22;
        }
        int v36 = v21;
        goto LABEL_27;
      }
      BOOL v15 = 0;
      char v9 = 0;
      v36 &= v40 ^ 1;
      unint64_t v20 = v34;
      if ((v40 & 1) == 0) {
        unint64_t v20 = v10;
      }
      unint64_t v34 = v20;
      int v40 = 1;
    }
    else
    {
      if (v17 != 41) {
        goto LABEL_26;
      }
      if (--v13) {
        goto LABEL_26;
      }
      if (v12)
      {
        unsigned int v18 = [v41 characterAtIndex:v12 + v11 - 1];
        if (v18 > 0x7F) {
          int v19 = __maskrune(v18, 0x4000uLL);
        }
        else {
          int v19 = *(_DWORD *)(v14 + 4 * v18 + 60) & 0x4000;
        }
        BOOL v15 = v19 != 0;
        objc_msgSend(v8, "addIndexesInRange:", v11, v12);
      }
      else
      {
        BOOL v15 = 0;
      }
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      char v9 = 0;
      unint64_t v11 = v10 + 1;
    }
LABEL_27:
    ++v10;
  }
  while (v10 < v7);
  if (!v12)
  {
    uint64_t v24 = v34;
    int v25 = v36;
LABEL_56:
    uint64_t v27 = [v8 lastIndex];
    if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_64;
    }
    unsigned int v28 = [v41 characterAtIndex:v27];
    if (v28 > 0x7F)
    {
      if (!__maskrune(v28, 0x4000uLL)) {
        goto LABEL_64;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v28 + 60) & 0x4000) == 0)
    {
      goto LABEL_64;
    }
    [v8 removeIndex:v27];
    goto LABEL_64;
  }
  unsigned int v23 = [v41 characterAtIndex:v12 + v11 - 1];
  uint64_t v24 = v34;
  int v25 = v36;
  if (v23 > 0x7F) {
    int v26 = __maskrune(v23, 0x4000uLL);
  }
  else {
    int v26 = *(_DWORD *)(v14 + 4 * v23 + 60) & 0x4000;
  }
  objc_msgSend(v8, "addIndexesInRange:", v11, v12 - (v26 != 0));
LABEL_64:
  if (a4) {
    *a4 = (id)[v8 copy];
  }
  if (v37)
  {
    if ((v25 & v40 & 1) == 0)
    {
      id *v37 = objc_alloc_init(MEMORY[0x263F088D0]);
      goto LABEL_76;
    }
    v29 = (void *)[v8 mutableCopy];
    objc_msgSend(v29, "removeIndexesInRange:", v24, v7 - v24);
    uint64_t v30 = [v29 lastIndex];
    if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_75;
    }
    unsigned int v31 = [v41 characterAtIndex:v30];
    if (v31 > 0x7F)
    {
      if (!__maskrune(v31, 0x4000uLL)) {
        goto LABEL_75;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v31 + 60) & 0x4000) == 0)
    {
LABEL_75:
      id *v37 = (id)[v29 copy];

      goto LABEL_76;
    }
    [v29 removeIndex:v30];
    goto LABEL_75;
  }
LABEL_76:
  if (a6)
  {
    if (v25 & v40)
    {
      v32 = (void *)[v8 mutableCopy];
      objc_msgSend(v32, "removeIndexesInRange:", 0, v24 + 1);
      *a6 = (id)[v32 copy];
    }
    else
    {
      *a6 = objc_alloc_init(MEMORY[0x263F088D0]);
    }
  }
}

uint64_t __63__EAEmailAddressParser_rawAddressFromFullAddress_cacheResults___block_invoke()
{
  rawAddressFromFullAddress_cacheResults__rawAddresses = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__EAEmailAddressParser_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __27__EAEmailAddressParser_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

+ (BOOL)isLegalEmailAddress:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 rawAddressRespectingGroupsFromFullAddress:v4];
  uint64_t v6 = [(__CFString *)v5 length];
  uint64_t v7 = v6;
  if (v6 < 3) {
    goto LABEL_40;
  }
  long long v50 = 0u;
  memset(v48, 0, sizeof(v48));
  *(_OWORD *)buffer = 0u;
  theString[0] = v5;
  uint64_t v52 = 0;
  long long v51 = (unint64_t)v6;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v5);
  if (theString[1]) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  char v11 = 0;
  char v12 = 0;
  uint64_t v13 = 0;
  *((void *)&v51 + 1) = 0;
  uint64_t v52 = 0;
  *(void *)&long long v50 = CStringPtr;
  while (1)
  {
    uint64_t v14 = v12 & 1;
    uint64_t v15 = v13;
    if (v13 >= v7) {
      break;
    }
    while (1)
    {
      if (v15 < 0 || (uint64_t)v51 <= v15) {
        goto LABEL_26;
      }
      if (theString[1])
      {
        UniChar v16 = *((_WORD *)&theString[1]->isa + *((void *)&v50 + 1) + v15);
      }
      else if ((void)v50)
      {
        UniChar v16 = *(char *)(v50 + *((void *)&v50 + 1) + v15);
      }
      else
      {
        if (v52 <= v15 || v10 > v15)
        {
          uint64_t v17 = v15 - 4;
          if ((unint64_t)v15 < 4) {
            uint64_t v17 = 0;
          }
          uint64_t v18 = v17 + 64;
          if (v17 + 64 >= (uint64_t)v51) {
            uint64_t v18 = v51;
          }
          *((void *)&v51 + 1) = v17;
          uint64_t v52 = v18;
          v54.NSUInteger location = *((void *)&v50 + 1) + v17;
          v54.NSUInteger length = v18 - v17;
          CFStringGetCharacters(theString[0], v54, buffer);
          uint64_t v9 = *((void *)&v51 + 1);
        }
        UniChar v16 = buffer[v15 - v9];
        uint64_t v10 = v9;
      }
      if (v16 == 64)
      {
        if (v14) {
          unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v15;
        }
        goto LABEL_27;
      }
      if (v16 == 92)
      {
        v15 += v14;
        goto LABEL_26;
      }
      if (v16 == 34) {
        break;
      }
LABEL_26:
      unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_27:
      ++v15;
      BOOL v20 = v19 == 0x7FFFFFFFFFFFFFFFLL;
      if (v15 >= v7 || v19 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_39;
      }
    }
    char v12 = v14 ^ 1;
    if (!v14) {
      char v11 = 1;
    }
    uint64_t v13 = v15 + 1;
    if ((v14 & 1) == 0 && v15) {
      goto LABEL_40;
    }
  }
  BOOL v20 = 1;
  unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_39:
  if (v20)
  {
LABEL_40:
    BOOL v21 = 0;
  }
  else
  {
    if (v11)
    {
      if (v19 < 3) {
        goto LABEL_40;
      }
      if ([(__CFString *)v5 characterAtIndex:v19 - 1] != 34) {
        goto LABEL_40;
      }
      int v25 = -[__CFString substringWithRange:](v5, "substringWithRange:", 0, v19);
      char v26 = [v25 canBeConvertedToEncoding:1];

      if ((v26 & 1) == 0) {
        goto LABEL_40;
      }
    }
    else
    {
      if (!v19) {
        goto LABEL_40;
      }
      if ([(__CFString *)v5 characterAtIndex:0] == 46) {
        goto LABEL_40;
      }
      if ([(__CFString *)v5 characterAtIndex:v19 - 1] == 46) {
        goto LABEL_40;
      }
      if ([(__CFString *)v5 rangeOfString:@"..", 0, 0, v19 options range] != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_40;
      }
      unsigned int v23 = objc_msgSend(MEMORY[0x263F08708], "ef_unsafeAddressLocalPartCharacterSet");
      BOOL v24 = -[__CFString rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v23, 0, 0, v19) == 0x7FFFFFFFFFFFFFFFLL;

      if (!v24) {
        goto LABEL_40;
      }
    }
    unint64_t v27 = v7 + ~v19;
    if (!v27) {
      goto LABEL_40;
    }
    unint64_t v28 = v19 + 1;
    if ([(__CFString *)v5 characterAtIndex:v19 + 1] == 91)
    {
      int v29 = [(__CFString *)v5 characterAtIndex:v7 - 1];
      BOOL v21 = 0;
      if (v27 >= 9 && v29 == 93)
      {
        v46[0] = 0;
        v46[1] = 0;
        *(_OWORD *)buffer = 0u;
        memset(v48, 0, 30);
        int v45 = 0;
        unint64_t v30 = v19 + 2;
        v44[0] = 0;
        v44[1] = 0;
        if ([(__CFString *)v5 rangeOfString:@"IPv6:", 1, v19 + 2, 5 options range] == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v31 = v27 - 2;
          v32 = &v45;
          char v33 = (UniChar *)v46;
          int v34 = 2;
          uint64_t v35 = 15;
        }
        else
        {
          unint64_t v30 = v19 + 7;
          unint64_t v31 = v27 - 7;
          v32 = (int *)v44;
          char v33 = buffer;
          int v34 = 30;
          uint64_t v35 = 45;
        }
        uint64_t v43 = 0;
        long long v42 = xmmword_2146E49E0;
        int v40 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v33, v35, &v43, 1, 0, v30, v31, &v42);
        if (*((void *)&v42 + 1)) {
          int v41 = 0;
        }
        else {
          int v41 = v40;
        }
        if (v41 != 1) {
          goto LABEL_40;
        }
        *((unsigned char *)v33 + v43) = 0;
        BOOL v21 = inet_pton(v34, (const char *)v33, v32) == 1;
      }
    }
    else
    {
      int v36 = [(__CFString *)v5 characterAtIndex:v19 + 1];
      int v37 = [(__CFString *)v5 characterAtIndex:v7 - 1];
      BOOL v21 = 0;
      if (v27 >= 3 && v36 != 46 && v36 != 45 && v37 != 46 && v37 != 45)
      {
        if ([(__CFString *)v5 rangeOfString:@".-", 0, v28, v27 options range] != 0x7FFFFFFFFFFFFFFFLL
          || [(__CFString *)v5 rangeOfString:@"-.", 0, v28, v27 options range] != 0x7FFFFFFFFFFFFFFFLL)
        {
          goto LABEL_40;
        }
        v38 = [MEMORY[0x263F08708] alphanumericCharacterSet];
        v39 = (void *)[v38 mutableCopy];

        [v39 addCharactersInString:@".-"];
        [v39 invert];
        BOOL v21 = -[__CFString rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v39, 0, v28, v27) == 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }

  return v21;
}

+ (BOOL)addressIsEmptyGroup:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [v3 rangeOfString:@":" options:2];
    unint64_t v5 = [v3 rangeOfString:@";" options:14];
    char v6 = 0;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = v5;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v8 = v4 + 1;
        char v6 = 1;
        if (v8 < v5)
        {
          uint64_t v9 = MEMORY[0x263EF8318];
          do
          {
            unsigned int v10 = [v3 characterAtIndex:v8];
            unsigned int v11 = v10;
            if (v10 > 0x7F)
            {
              if (__maskrune(v10, 0x4000uLL)) {
                goto LABEL_12;
              }
            }
            else if ((*(_DWORD *)(v9 + 4 * v10 + 60) & 0x4000) != 0)
            {
              goto LABEL_12;
            }
            if ((v11 | 2) != 0x3E)
            {
              char v6 = 0;
              break;
            }
LABEL_12:
            ++v8;
          }
          while (v7 != v8);
        }
      }
    }
    BOOL v12 = v6 & 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)rawAddressRespectingGroupsFromFullAddress:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 rangeOfString:@"@"];
    uint64_t v7 = [v5 rangeOfString:@"<"];
    id v8 = v5;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL || v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [a1 rawAddressFromFullAddress:v8];

      id v8 = (id)v9;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)localPartFromAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = 0;
    [a1 _componentsForFullAddress:v4 rawAddressIndexes:0 localPartIndexes:&v8 domainIndexes:0];
    id v5 = v8;
    if ([v5 count])
    {
      uint64_t v6 = objc_msgSend(v4, "ef_substringWithIndexes:", v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)addressDomainFromAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = 0;
    [a1 _componentsForFullAddress:v4 rawAddressIndexes:0 localPartIndexes:0 domainIndexes:&v8];
    id v5 = v8;
    if ([v5 count])
    {
      uint64_t v6 = objc_msgSend(v4, "ef_substringWithIndexes:", v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)displayNameFromAddress:(id)a3
{
  id v3 = [a1 displayNameFromAddress:a3 cacheResults:1];
  return v3;
}

+ (id)displayNameFromAddress:(id)a3 cacheResults:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v9 = 0;
    goto LABEL_113;
  }
  if (displayNameFromAddress_cacheResults__onceToken != -1) {
    dispatch_once(&displayNameFromAddress_cacheResults__onceToken, &__block_literal_global_34);
  }
  objc_sync_enter(@"com.apple.EmailAddressing.displayNamesLock");
  uint64_t v7 = [(id)displayNameFromAddress_cacheResults__displayNames objectForKeyedSubscript:v6];
  objc_sync_exit(@"com.apple.EmailAddressing.displayNamesLock");
  if (v7)
  {
    id v8 = v7;
    goto LABEL_112;
  }
  uint64_t v53 = v6;
  unint64_t v10 = [v6 length];
  NSUInteger v11 = 2 * v10 + 2;
  BOOL v12 = (unsigned __int16 *)NSZoneMalloc(0, v11);
  uint64_t v13 = NSZoneMalloc(0, v11);
  [v6 getCharacters:v13];
  id v51 = a1;
  BOOL v52 = v4;
  if (v10)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    int v16 = 0;
    BOOL v17 = 1;
    while (1)
    {
      int v18 = (unsigned __int16)v13[v14];
      if (v18 != 92)
      {
        if (v18 == 34 && v15 == 0)
        {
          uint64_t v15 = 0;
          v16 ^= 1u;
        }
        else if ((v18 != 40) | v16 & 1)
        {
          if ((v18 != 41) | v16 & 1)
          {
            if (v18 == 60 && ((v16 ^ 1) & 1) != 0 && !v15) {
              goto LABEL_26;
            }
          }
          else
          {
            int v16 = 0;
            --v15;
          }
        }
        else
        {
          int v16 = 0;
          ++v15;
        }
      }
      BOOL v17 = ++v14 < v10;
      if (v10 == v14) {
        goto LABEL_26;
      }
    }
  }
  BOOL v17 = 0;
LABEL_26:
  ptr = NSZoneMalloc(0, v11);
  v60 = v12;
  if (!v10)
  {
    uint64_t v23 = 0;
    LOBYTE(v25) = 0;
    char v33 = v12;
    BOOL v34 = v4;
    goto LABEL_83;
  }
  uint64_t v20 = 0;
  int v21 = 0;
  uint64_t v57 = 0;
  CFRange v54 = 0;
  char v56 = 0;
  char v22 = 0;
  uint64_t v23 = 0;
  char v24 = 0;
  int v25 = 0;
  uint64_t v26 = MEMORY[0x263EF8318];
  v58 = ptr;
  do
  {
    unsigned int v27 = (unsigned __int16)v13[v20];
    if (v27 == 92)
    {
      if (!(v24 & 1 | (v13[v20 + 1] == 0)))
      {
        char v24 = 1;
        goto LABEL_72;
      }
      unsigned int v27 = 92;
LABEL_47:
      if ((*(_DWORD *)(v26 + 4 * v27 + 60) & 0x4000) == 0) {
        goto LABEL_55;
      }
      goto LABEL_48;
    }
    if (v27 == 34 && v23 == 0)
    {
      uint64_t v23 = 0;
      v25 ^= 1u;
      unsigned int v27 = 34;
      goto LABEL_47;
    }
    if (!((v27 != 41) | v25 & 1))
    {
      int v25 = 0;
      --v23;
      unsigned int v27 = 41;
      goto LABEL_47;
    }
    if (v27 == 60 && ((v25 ^ 1) & 1) != 0 && !v23)
    {
      if (v56)
      {
        [v51 insertPreviousRoute:ptr ofLength:v57 toBuffer:&v60 ofLength:v10 atPosition:v54 addSpace:v21 > 0];
        v21 -= v21 > 0;
        unsigned int v27 = (unsigned __int16)v13[v20];
      }
      else
      {
        unsigned int v27 = 60;
      }
      uint64_t v23 = 0;
      char v56 = 0;
      char v22 = 1;
      CFRange v54 = v60;
      uint64_t v57 = 0;
      v58 = ptr;
    }
    if (v27 <= 0x7F) {
      goto LABEL_47;
    }
    if (!__maskrune(v27, 0x4000uLL)) {
      goto LABEL_55;
    }
LABEL_48:
    if (v60 == v12) {
      goto LABEL_53;
    }
    unint64_t v29 = *(v60 - 1);
    if (v29 > 0x7F)
    {
      if (__maskrune(v29, 0x4000uLL))
      {
LABEL_53:
        ++v21;
        goto LABEL_65;
      }
    }
    else if ((*(_DWORD *)(v26 + 4 * v29 + 60) & 0x4000) != 0)
    {
      goto LABEL_53;
    }
LABEL_55:
    int v30 = (unsigned __int16)v13[v20];
    if (v30 != 34 || v23)
    {
      if (v17)
      {
        if ((v22 & 1) == 0) {
          goto LABEL_61;
        }
LABEL_63:
        _WORD *v58 = v30;
        ++v57;
        ++v58;
        char v22 = 1;
        goto LABEL_65;
      }
      if (v23 >= 1)
      {
LABEL_61:
        unint64_t v31 = v60;
        unsigned __int16 *v60 = v30;
        v60 = v31 + 1;
        goto LABEL_65;
      }
      if (v22) {
        goto LABEL_63;
      }
      char v22 = 0;
    }
LABEL_65:
    int v32 = (unsigned __int16)v13[v20];
    if ((v32 != 40) | v25 & 1)
    {
      char v24 = 0;
      if (!((v32 != 62) | v25 & 1) && !v23)
      {
        int v25 = 0;
        char v24 = 0;
        uint64_t v23 = 0;
        if (v22)
        {
          char v22 = 0;
          _WORD *v58 = 0;
          char v56 = 1;
        }
        else
        {
          char v22 = 0;
        }
      }
    }
    else
    {
      int v25 = 0;
      char v24 = 0;
      ++v23;
    }
LABEL_72:
    ++v20;
  }
  while (v10 != v20);
  char v33 = v60;
  BOOL v34 = v52;
  if (v60 > v12)
  {
    uint64_t v35 = v60 - 1;
    while (1)
    {
      unint64_t v36 = *v35;
      if (!(v36 > 0x7F ? __maskrune(v36, 0x4000uLL) : *(_DWORD *)(v26 + 4 * v36 + 60) & 0x4000)) {
        break;
      }
      v60 = v35;
      v38 = v35 - 1;
      if (v35-- <= v12)
      {
        char v33 = v38 + 1;
        goto LABEL_83;
      }
    }
    char v33 = v60;
  }
LABEL_83:
  *char v33 = 0;
  id v6 = v53;
  if (v23 || (v25 & 1) != 0)
  {
    id v42 = v53;
LABEL_95:
    if (!v42) {
      goto LABEL_96;
    }
    goto LABEL_100;
  }
  if (v33 <= v12 + 1) {
    goto LABEL_96;
  }
  int v40 = 0;
  while (2)
  {
    int v41 = *v12;
    if (v41 == 39)
    {
      if (*(v33 - 1) != 39) {
        break;
      }
      goto LABEL_92;
    }
    if (v41 == 34 && *(v33 - 1) == 34)
    {
LABEL_92:
      *(v33 - 1) = 0;
      objc_msgSend(NSString, "stringWithCharacters:length:", v12 + 1, v33 - v12 - 2, v51);
      id v42 = (id)objc_claimAutoreleasedReturnValue();

      char v33 = v60 - 1;
      v60 = v33;
      int v40 = v42;
      if (v33 <= v12 + 1) {
        goto LABEL_95;
      }
      continue;
    }
    break;
  }
  id v42 = v40;
  if (v40) {
    goto LABEL_100;
  }
LABEL_96:
  if (v60 == v12)
  {
    id v42 = 0;
  }
  else
  {
    id v42 = [NSString stringWithCharacters:v12 length:v60 - v12];
  }
LABEL_100:
  NSZoneFree(0, v12);
  NSZoneFree(0, v13);
  NSZoneFree(0, ptr);
  if (v60 == v12)
  {
    id v43 = v53;

    id v59 = 0;
    [v51 _componentsForFullAddress:v43 rawAddressIndexes:0 localPartIndexes:0 domainIndexes:&v59];
    id v44 = v59;
    if ([v44 count])
    {
      int v45 = objc_msgSend(v43, "ef_substringWithIndexes:", v44);
      v46 = objc_msgSend(v45, "_lp_userVisibleHost");
      if (([v46 isEqualToString:v45] & 1) == 0)
      {
        uint64_t v47 = objc_msgSend(v43, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v44, "firstIndex"), objc_msgSend(v44, "lastIndex") - objc_msgSend(v44, "firstIndex") + 1, v46);

        id v43 = (id)v47;
      }
    }
    id v42 = v43;
  }
  if (objc_msgSend(v42, "containsString:", &stru_26C55C4C0, v51))
  {
    uint64_t v48 = [v42 stringByReplacingOccurrencesOfString:&stru_26C55C4C0 withString:&stru_26C55BFE0];

    id v42 = (id)v48;
  }
  if (v34)
  {
    objc_sync_enter(@"com.apple.EmailAddressing.displayNamesLock");
    v49 = (void *)[v42 copy];

    [(id)displayNameFromAddress_cacheResults__displayNames setObject:v49 forKeyedSubscript:v53];
    objc_sync_exit(@"com.apple.EmailAddressing.displayNamesLock");
  }
  else
  {
    v49 = v42;
  }
  id v8 = v49;
LABEL_112:
  uint64_t v9 = v8;

LABEL_113:
  return v9;
}

uint64_t __60__EAEmailAddressParser_displayNameFromAddress_cacheResults___block_invoke()
{
  displayNameFromAddress_cacheResults__displayNames = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (void)insertPreviousRoute:(unsigned __int16 *)a3 ofLength:(unint64_t)a4 toBuffer:(unsigned __int16 *)a5 ofLength:(unint64_t)a6 atPosition:(unsigned __int16 *)a7 addSpace:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v13 = NSZoneMalloc(0, 2 * a6 + 2);
  size_t v14 = (char *)*a5 - (char *)a7;
  memcpy(v13, a7, v14);
  memcpy(a7, a3, 2 * a4);
  uint64_t v15 = &a7[a4];
  if (v8) {
    *v15++ = 32;
  }
  memcpy(v15, v13, v14);
  *a5 = (unsigned __int16 *)((char *)v15 + v14);
  NSZoneFree(0, v13);
}

+ (id)idnaDecodedAddressForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 rangeOfAddressDomainFromAddress:v4];
  uint64_t v7 = objc_msgSend(a1, "_stringByDecodingIDNAString:inRange:", v4, v5, v6);

  return v7;
}

+ (id)_stringByDecodingIDNAString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || (objc_msgSend(MEMORY[0x263EFF960], "ef_posixLocale"),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = objc_msgSend(v6, "rangeOfString:options:range:locale:", @"xn--", 1, location, length, v7),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = [v6 copy];
  }
  else
  {
    uint64_t v9 = _createStringByApplyingIDNATranslationWithRange(v6, location, length, MEMORY[0x263F8C480]);
  }
  unint64_t v10 = (void *)v9;

  return v10;
}

@end
@interface NSString(EmailAddressingAdditions)
- (BOOL)ea_isEqualToEmailAddress:()EmailAddressingAdditions;
- (BOOL)ea_isLegalEmailAddress;
- (id)ea_addressComment;
- (id)ea_addressCommentPersonNameComponents;
- (id)ea_uncommentedAddress;
- (id)ea_uncommentedAddressRespectingGroups;
- (uint64_t)ea_isLegalCommentedEmailAddress;
@end

@implementation NSString(EmailAddressingAdditions)

- (id)ea_uncommentedAddress
{
  int64_t v47 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = 0xAAAAAAAAAAAAAAAALL;
  int64_t v46 = 0xAAAAAAAAAAAAAAAALL;
  long long v42 = v2;
  long long v40 = v2;
  long long v41 = v2;
  long long v38 = v2;
  long long v39 = v2;
  long long v36 = v2;
  long long v37 = v2;
  *(_OWORD *)buffer = v2;
  unint64_t v3 = [(__CFString *)a1 length];
  v4 = (UniChar *)NSZoneMalloc(0, 2 * v3 + 2);
  theString[0] = a1;
  int64_t v45 = v3;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(a1);
  if (theString[1]) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  int64_t v46 = 0;
  int64_t v47 = 0;
  *(void *)&long long v44 = CStringPtr;
  v6 = v4;
  uint64_t v7 = MEMORY[0x263EF8318];
  if (v3)
  {
    char v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    int v11 = 0;
    char v34 = 0;
    char v12 = 1;
    v6 = v4;
    do
    {
      if ((v10 & 0x8000000000000000) != 0 || (int64_t v13 = v45, v45 <= (uint64_t)v10))
      {
        if (v8)
        {
          *v6++ = 0;
          char v8 = 1;
        }
        else
        {
          if (v11 <= 0)
          {
            unsigned int v15 = 0;
            UniChar v14 = 0;
            goto LABEL_15;
          }
          char v8 = 0;
        }
      }
      else
      {
        if (theString[1])
        {
          UniChar v14 = *((_WORD *)&theString[1]->isa + *((void *)&v44 + 1) + v10);
        }
        else if ((void)v44)
        {
          UniChar v14 = *(char *)(v44 + *((void *)&v44 + 1) + v10);
        }
        else
        {
          if (v47 <= (uint64_t)v10 || (int64_t v16 = v46, v46 > (uint64_t)v10))
          {
            int64_t v17 = v10 - 4;
            if (v10 < 4) {
              int64_t v17 = 0;
            }
            uint64_t v18 = v9;
            if (v17 + 64 < v45) {
              int64_t v13 = v17 + 64;
            }
            int64_t v46 = v17;
            int64_t v47 = v13;
            v49.location = *((void *)&v44 + 1) + v17;
            v49.length = v13 - v17;
            CFStringGetCharacters(theString[0], v49, buffer);
            uint64_t v9 = v18;
            int64_t v16 = v46;
          }
          UniChar v14 = buffer[v10 - v16];
        }
        unsigned int v15 = v14;
        if (v14 == 92)
        {
          int64_t v19 = v10 + 1;
          if (v10 + 1 < v3)
          {
            UniChar *v6 = 92;
            int64_t v20 = v45;
            if (v45 <= v19)
            {
              UniChar v21 = 0;
            }
            else if (theString[1])
            {
              UniChar v21 = *((_WORD *)&theString[1]->isa + *((void *)&v44 + 1) + v19);
            }
            else if ((void)v44)
            {
              UniChar v21 = *(char *)(v44 + *((void *)&v44 + 1) + v19);
            }
            else
            {
              if (v47 <= v19 || (int64_t v22 = v46, v46 > v19))
              {
                int64_t v23 = v10 - 3;
                if (v10 < 3) {
                  int64_t v23 = 0;
                }
                uint64_t v24 = v9;
                if (v23 + 64 < v45) {
                  int64_t v20 = v23 + 64;
                }
                int64_t v46 = v23;
                int64_t v47 = v20;
                v50.location = *((void *)&v44 + 1) + v23;
                v50.length = v20 - v23;
                CFStringGetCharacters(theString[0], v50, buffer);
                uint64_t v9 = v24;
                int64_t v22 = v46;
              }
              UniChar v21 = buffer[v19 - v22];
            }
            v6[1] = v21;
            v6 += 2;
            unint64_t v10 = v19;
            goto LABEL_64;
          }
          if ((v8 & 1) == 0)
          {
            if (v11 <= 0)
            {
              unsigned int v15 = 92;
              UniChar v14 = 92;
              goto LABEL_15;
            }
LABEL_45:
            char v8 = 0;
            v11 -= v14 == 41;
            goto LABEL_64;
          }
LABEL_38:
          *v6++ = v14;
          char v8 = v14 != 34;
          goto LABEL_64;
        }
        if (v8) {
          goto LABEL_38;
        }
        if (v14 == 40)
        {
          char v8 = 0;
          ++v11;
        }
        else
        {
          if (v11 > 0) {
            goto LABEL_45;
          }
          if (v14 == 60)
          {
            uint64_t v9 = 0;
            char v8 = 0;
            char v34 = 1;
            v6 = v4;
          }
          else
          {
            if ((v34 & (v14 == 62)) == 0)
            {
              if (v14 > 0x7Fu)
              {
                uint64_t v25 = v9;
                int v26 = __maskrune(v14, 0x4000uLL);
                uint64_t v9 = v25;
                if (!v26)
                {
LABEL_61:
                  if ((v9 & 1) == 0) {
                    *v6++ = v14;
                  }
                  char v12 = 0;
                  v8 |= v14 == 34;
                  goto LABEL_64;
                }
                goto LABEL_16;
              }
LABEL_15:
              if ((*(_DWORD *)(v7 + 4 * v15 + 60) & 0x4000) == 0) {
                goto LABEL_61;
              }
LABEL_16:
              char v8 = 0;
              if ((v12 & 1) == 0) {
                *v6++ = 32;
              }
              char v12 = 1;
              goto LABEL_64;
            }
            char v34 = 0;
            char v8 = 0;
            uint64_t v9 = 1;
          }
        }
      }
LABEL_64:
      ++v10;
    }
    while (v10 < v3);
  }
  uint64_t v27 = (char *)v6 - (char *)v4;
  do
  {
    v28 = v6;
    uint64_t v29 = v27;
    if (v6 <= v4) {
      break;
    }
    --v6;
    unint64_t v30 = *(v28 - 1);
    int v31 = v30 > 0x7F ? __maskrune(v30, 0x4000uLL) : *(_DWORD *)(v7 + 4 * v30 + 60) & 0x4000;
    uint64_t v27 = v29 - 2;
  }
  while (v31);
  UniChar *v28 = 0;
  v32 = (void *)[[NSString alloc] initWithCharacters:v4 length:v29 >> 1];
  NSZoneFree(0, v4);
  return v32;
}

- (BOOL)ea_isLegalEmailAddress
{
  if (ea_isLegalEmailAddress_onceToken != -1) {
    dispatch_once(&ea_isLegalEmailAddress_onceToken, &__block_literal_global_2);
  }
  long long v2 = +[EAEmailAddressParser idnaEncodedAddressForAddress:a1];
  unint64_t v3 = +[EAEmailAddressParser rangeOfAddressDomainFromAddress:v2];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  if (v2) {
    BOOL v7 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || v3 < 2)
  {
    BOOL v9 = 0;
    goto LABEL_90;
  }
  int64_t v10 = v3 - 1;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int64_t v69 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  long long v62 = v11;
  long long v63 = v11;
  long long v60 = v11;
  long long v61 = v11;
  *(_OWORD *)&buffer.ai_addr = v11;
  long long v59 = v11;
  *(_OWORD *)&buffer.ai_flags = v11;
  *(_OWORD *)&buffer.ai_addrlen = v11;
  CFStringRef theString = v2;
  uint64_t v67 = 0;
  int64_t v68 = v3 - 1;
  int64_t v70 = 0xAAAAAAAAAAAAAAAALL;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  }
  int64_t v69 = 0;
  int64_t v70 = 0;
  unint64_t v66 = (unint64_t)CStringPtr;
  if (v4 < 2)
  {
    uint64_t v13 = 0;
    BOOL v14 = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_89;
  }
  v56 = v2;
  uint64_t v16 = 0;
  BOOL v17 = 0;
  int64_t v18 = 0;
  char v19 = 0;
  uint64_t v20 = 64;
  do
  {
    if ((unint64_t)v18 >= 4) {
      uint64_t v21 = 4;
    }
    else {
      uint64_t v21 = v18;
    }
    int64_t v22 = v68;
    if (v68 <= v18)
    {
      UniChar v23 = 0;
LABEL_39:
      if (![(id)ea_isLegalEmailAddress_validLocalPartSet characterIsMember:v23]) {
        break;
      }
      char v31 = 1;
      goto LABEL_41;
    }
    if (CharactersPtr)
    {
      UniChar v23 = CharactersPtr[v18 + v67];
    }
    else if (v66)
    {
      UniChar v23 = *(char *)(v66 + v67 + v18);
    }
    else
    {
      int64_t v24 = v69;
      if (v70 <= v18 || v69 > v18)
      {
        uint64_t v26 = -v21;
        uint64_t v27 = v21 + v16;
        uint64_t v28 = v20 - v21;
        int64_t v29 = v18 + v26;
        int64_t v30 = v29 + 64;
        if (v29 + 64 >= v68) {
          int64_t v30 = v68;
        }
        int64_t v69 = v29;
        int64_t v70 = v30;
        if (v68 >= v28) {
          int64_t v22 = v28;
        }
        v71.length = v22 + v27;
        v71.location = v29 + v67;
        CFStringGetCharacters(theString, v71, (UniChar *)&buffer);
        int64_t v24 = v69;
      }
      UniChar v23 = *((_WORD *)&buffer.ai_flags + v18 - v24);
    }
    if (v23 != 46) {
      goto LABEL_39;
    }
    char v31 = 0;
    if ((v19 & 1) == 0)
    {
      uint64_t v13 = 0;
      BOOL v14 = 0;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_88:
      long long v2 = v56;
      goto LABEL_89;
    }
LABEL_41:
    BOOL v17 = ++v18 >= v10;
    --v16;
    ++v20;
    char v19 = v31;
  }
  while (v10 != v18);
  BOOL v14 = 0;
  uint64_t v13 = 0;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v19 & 1) == 0) {
    goto LABEL_88;
  }
  long long v2 = v56;
  if (!v17) {
    goto LABEL_89;
  }
  CFStringRef theString = v56;
  uint64_t v67 = v4;
  int64_t v68 = v6;
  CharactersPtr = CFStringGetCharactersPtr(v56);
  if (CharactersPtr) {
    v32 = 0;
  }
  else {
    v32 = CFStringGetCStringPtr(v56, 0x600u);
  }
  unint64_t v66 = (unint64_t)v32;
  int64_t v69 = 0;
  int64_t v70 = 0;
  if (v6 < 1)
  {
    BOOL v14 = 0;
    goto LABEL_87;
  }
  uint64_t v33 = 0;
  int64_t v34 = 0;
  uint64_t v35 = 0;
  char v55 = 0;
  char v36 = 0;
  BOOL v37 = 1;
  uint64_t v38 = 64;
  uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    if ((unint64_t)v34 >= 4) {
      uint64_t v40 = 4;
    }
    else {
      uint64_t v40 = v34;
    }
    int64_t v41 = v68;
    if (v68 <= v34)
    {
      UniChar v42 = 0;
    }
    else
    {
      if (CharactersPtr)
      {
        UniChar v42 = CharactersPtr[v34 + v67];
      }
      else if (v66)
      {
        UniChar v42 = *(char *)(v66 + v67 + v34);
      }
      else
      {
        int64_t v43 = v69;
        if (v70 <= v34 || v69 > v34)
        {
          uint64_t v45 = -v40;
          uint64_t v46 = v40 + v33;
          uint64_t v47 = v38 - v40;
          int64_t v48 = v34 + v45;
          int64_t v49 = v48 + 64;
          if (v48 + 64 >= v68) {
            int64_t v49 = v68;
          }
          int64_t v69 = v48;
          int64_t v70 = v49;
          if (v68 >= v47) {
            int64_t v41 = v47;
          }
          v72.length = v41 + v46;
          v72.location = v48 + v67;
          CFStringGetCharacters(theString, v72, (UniChar *)&buffer);
          int64_t v43 = v69;
        }
        UniChar v42 = *((_WORD *)&buffer.ai_flags + v34 - v43);
      }
      if (v42 == 46)
      {
        if ((v36 & 1) == 0) {
          break;
        }
        char v36 = 0;
        uint64_t v35 = 0;
        uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
        char v55 = 1;
        goto LABEL_77;
      }
    }
    if ([(id)ea_isLegalEmailAddress_validDomainPartSet characterIsMember:v42])
    {
      char v36 = 1;
      if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v35 = 1;
      }
      else {
        ++v35;
      }
      if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v39 = v4 + v34;
      }
LABEL_77:
      BOOL v37 = ++v34 < v6;
      --v33;
      ++v38;
      if (v6 == v34)
      {
        int v50 = 1;
        goto LABEL_81;
      }
      continue;
    }
    break;
  }
  int v50 = 0;
LABEL_81:
  if (((v39 != 0x7FFFFFFFFFFFFFFFLL) & v55) != 0) {
    BOOL v14 = v50;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v37 && ((v39 != 0x7FFFFFFFFFFFFFFFLL) & v55) != 0)
  {
    v51 = -[__CFString substringWithRange:](v56, "substringWithRange:", v39, v35);
    BOOL v14 = [v51 rangeOfCharacterFromSet:ea_isLegalEmailAddress_invalidTLDPartSet] == 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_87:
  uint64_t v15 = v4;
  uint64_t v13 = v6;
LABEL_89:
  BOOL v9 = v14;
  uint64_t v4 = v15;
  uint64_t v6 = v13;
  if (!v14)
  {
LABEL_90:
    if (v6)
    {
      v52 = -[__CFString substringWithRange:](v2, "substringWithRange:", v4, v6);
      v53 = v52;
      if (v52 && [v52 length])
      {
        v57 = 0;
        memset(&buffer, 0, sizeof(buffer));
        buffer.ai_flags = 4;
        BOOL v9 = 0;
        if (!getaddrinfo((const char *)[v53 UTF8String], 0, &buffer, &v57)
          && v57)
        {
          BOOL v9 = v57->ai_addr != 0;
          freeaddrinfo(v57);
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }

  return v9;
}

- (id)ea_uncommentedAddressRespectingGroups
{
  uint64_t v2 = [a1 rangeOfString:@"@"];
  uint64_t v3 = [a1 rangeOfString:@"<"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL && v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "ea_uncommentedAddress");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)ea_addressCommentPersonNameComponents
{
  uint64_t v2 = objc_msgSend(a1, "ea_addressComment");
  if ([v2 isEqualToString:a1])
  {

    uint64_t v2 = 0;
  }
  uint64_t v3 = objc_msgSend(v2, "ea_personNameComponents");

  return v3;
}

- (id)ea_addressComment
{
  id v1 = a1;
  size_t v2 = [v1 maximumLengthOfBytesUsingEncoding:4] + 1;
  uint64_t v3 = (char *)malloc_type_malloc(v2, 0xE4F97978uLL);
  uint64_t v4 = v1;
  if ([v1 getCString:v3 maxLength:v2 encoding:4])
  {
    size_t v5 = strlen(v3);
    uint64_t v6 = (unsigned __int8 *)malloc_type_malloc(v5 + 1, 0xCEE1A32BuLL);
    BOOL v7 = EAAddressComment((unsigned __int8 *)v3, v5, v6);
    uint64_t v4 = v1;
    if (v7 != (unsigned __int8 *)v3)
    {
      uint64_t v4 = [NSString stringWithUTF8String:v7];
    }
    free(v6);
  }
  free(v3);

  return v4;
}

- (uint64_t)ea_isLegalCommentedEmailAddress
{
  id v1 = objc_msgSend(a1, "ea_uncommentedAddressRespectingGroups");
  uint64_t v2 = objc_msgSend(v1, "ea_isLegalEmailAddress");

  return v2;
}

- (BOOL)ea_isEqualToEmailAddress:()EmailAddressingAdditions
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

@end
@interface ECEmailAddressParser
+ (BOOL)_validateString:(id)a3 withFunction:(void *)a4;
+ (BOOL)parseEmailAddressString:(id)a3 displayName:(id *)a4 localPart:(id *)a5 domain:(id *)a6 groupList:(id *)a7;
+ (BOOL)parseString:(id)a3 emailAddressList:(id *)a4;
+ (BOOL)validateDisplayName:(id)a3;
+ (BOOL)validateDomain:(id)a3;
+ (BOOL)validateLocalPart:(id)a3;
@end

@implementation ECEmailAddressParser

+ (BOOL)parseEmailAddressString:(id)a3 displayName:(id *)a4 localPart:(id *)a5 domain:(id *)a6 groupList:(id *)a7
{
  id v11 = a3;
  if ([v11 length])
  {
    unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v12;
    long long v28 = v12;
    v25[7] = v12;
    long long v26 = v12;
    v25[6] = v12;
    v25[4] = v12;
    v25[5] = v12;
    v25[2] = v12;
    v25[3] = v12;
    v25[0] = v12;
    v25[1] = v12;
    unint64_t v20 = 0xAAAAAAAAAAAA0000;
    v13 = (__CFString *)v11;
    v21 = v13;
    v22 = v25;
    uint64_t v23 = 0;
    uint64_t v24 = [(__CFString *)v13 length];
    *(void *)&long long v26 = v13;
    *((void *)&v27 + 1) = 0;
    *(void *)&long long v28 = v24;
    *((void *)&v26 + 1) = CFStringGetCharactersPtr(v13);
    if (*((void *)&v26 + 1)) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v13, 0x600u);
    }
    *((void *)&v28 + 1) = 0;
    unint64_t v29 = 0;
    *(void *)&long long v27 = CStringPtr;
    char v16 = _parseAddress(&v20, a4, a5, a6, a7);
    if (v23 == v24) {
      char v17 = v16;
    }
    else {
      char v17 = 0;
    }
    if (v17)
    {
      BOOL v15 = 1;
    }
    else
    {
      uint64_t v23 = 0;
      LOWORD(v20) = 257;
      char v18 = _parseAddress(&v20, a4, a5, a6, a7);
      if (v23 == v24) {
        BOOL v15 = v18;
      }
      else {
        BOOL v15 = 0;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)validateDomain:(id)a3
{
  return [a1 _validateString:a3 withFunction:_parseDomain];
}

+ (BOOL)_validateString:(id)a3 withFunction:(void *)a4
{
  id v5 = a3;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v6;
  long long v20 = v6;
  v17[7] = v6;
  long long v18 = v6;
  v17[6] = v6;
  v17[4] = v6;
  v17[5] = v6;
  v17[2] = v6;
  v17[3] = v6;
  v17[0] = v6;
  v17[1] = v6;
  unint64_t v12 = 0xAAAAAAAAAAAA0000;
  v7 = (__CFString *)v5;
  v13 = v7;
  v14 = v17;
  uint64_t v15 = 0;
  uint64_t v16 = [(__CFString *)v7 length];
  *(void *)&long long v18 = v7;
  *((void *)&v19 + 1) = 0;
  *(void *)&long long v20 = v16;
  *((void *)&v18 + 1) = CFStringGetCharactersPtr(v7);
  if (*((void *)&v18 + 1)) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  }
  *((void *)&v20 + 1) = 0;
  unint64_t v21 = 0;
  *(void *)&long long v19 = CStringPtr;
  char v9 = ((uint64_t (*)(unint64_t *, void))a4)(&v12, 0);
  if (v15 == v16) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)validateLocalPart:(id)a3
{
  return [a1 _validateString:a3 withFunction:_parseLocalPart];
}

+ (BOOL)validateDisplayName:(id)a3
{
  return [a1 _validateString:a3 withFunction:_parseDisplayName];
}

+ (BOOL)parseString:(id)a3 emailAddressList:(id *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v6;
    long long v22 = v6;
    v19[7] = v6;
    long long v20 = v6;
    v19[6] = v6;
    v19[4] = v6;
    v19[5] = v6;
    v19[2] = v6;
    v19[3] = v6;
    v19[0] = v6;
    v19[1] = v6;
    unint64_t v14 = 0xAAAAAAAAAAAA0100;
    v7 = (__CFString *)v5;
    uint64_t v15 = v7;
    uint64_t v16 = v19;
    uint64_t v17 = 0;
    uint64_t v18 = [(__CFString *)v7 length];
    *(void *)&long long v20 = v7;
    *((void *)&v21 + 1) = 0;
    *(void *)&long long v22 = v18;
    *((void *)&v20 + 1) = CFStringGetCharactersPtr(v7);
    if (*((void *)&v20 + 1)) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    }
    *((void *)&v22 + 1) = 0;
    unint64_t v23 = 0;
    *(void *)&long long v21 = CStringPtr;
    char v10 = _parseElementList((uint64_t)&v14, 1, _parseAddressAppendingToList, a4);
    if (v17 == v18) {
      char v11 = v10;
    }
    else {
      char v11 = 0;
    }
    BOOL v9 = 1;
    if ((v11 & 1) == 0)
    {
      uint64_t v17 = 0;
      LOBYTE(v14) = 1;
      char v12 = _parseElementList((uint64_t)&v14, BYTE1(v14), _parseAddressAppendingToList, a4);
      if (v17 == v18) {
        BOOL v9 = v12;
      }
      else {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end
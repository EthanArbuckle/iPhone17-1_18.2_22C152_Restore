@interface MFHTMLParser
+ (id)plainTextFromHTML:(id)a3;
+ (id)plainTextFromHTML:(id)a3 limit:(unint64_t)a4;
+ (id)plainTextFromHTML:(id)a3 limit:(unint64_t)a4 preserveNewlines:(BOOL)a5;
+ (id)plainTextFromHTMLSnippet:(id)a3;
@end

@implementation MFHTMLParser

+ (id)plainTextFromHTML:(id)a3 limit:(unint64_t)a4 preserveNewlines:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [a3 length];
  CFStringRef theString = (CFStringRef)a3;
  uint64_t v38 = 0;
  int64_t v39 = v8;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0;
  v36 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  }
  int64_t v40 = 0;
  int64_t v41 = 0;
  v37 = CStringPtr;
  if (!v8) {
    goto LABEL_51;
  }
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[6] = v13;
  v34[7] = v13;
  v34[4] = v13;
  v34[5] = v13;
  v34[2] = v13;
  v34[3] = v13;
  uint64_t v14 = 65;
  uint64_t v15 = 64;
  v34[0] = v13;
  v34[1] = v13;
  do
  {
    if (v12 >= 4) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v12;
    }
    if ((v12 & 0x8000000000000000) != 0) {
      goto LABEL_36;
    }
    int64_t v17 = v39;
    if (v39 <= (uint64_t)v12) {
      goto LABEL_36;
    }
    if (v36)
    {
      UniChar v18 = v36[v12 + v38];
    }
    else if (v37)
    {
      UniChar v18 = v37[v38 + v12];
    }
    else
    {
      if (v41 <= (uint64_t)v12 || (int64_t v19 = v40, v40 > (uint64_t)v12))
      {
        uint64_t v20 = v16 + v11;
        uint64_t v21 = v15 - v16;
        int64_t v22 = v12 + 64 - v16;
        int64_t v23 = v22 - 64;
        if (v22 >= v39) {
          int64_t v22 = v39;
        }
        int64_t v40 = v23;
        int64_t v41 = v22;
        if (v39 >= v21) {
          int64_t v17 = v21;
        }
        v45.length = v17 + v20;
        v45.location = v23 + v38;
        CFStringGetCharacters(theString, v45, (UniChar *)v34);
        int64_t v19 = v40;
      }
      UniChar v18 = *((_WORD *)v34 + v12 - v19);
    }
    BOOL v24 = v18 != 60 || v12 >= v8 - 5;
    if (v24 || (int64_t v25 = v12 + 5, (uint64_t)(v12 + 5) < 0) || (v26 = v39, v39 <= v25))
    {
LABEL_36:
      BOOL v29 = 0;
      goto LABEL_37;
    }
    if (v36)
    {
      v27 = &v36[v12 + v38];
    }
    else
    {
      if (v37)
      {
        UniChar v28 = v37[v38 + 5 + v12];
        goto LABEL_33;
      }
      if (v41 <= v25 || (int64_t v30 = v40, v40 > v25))
      {
        unint64_t v31 = v12 + 65;
        if ((uint64_t)(v12 + 65) >= v39) {
          unint64_t v31 = v39;
        }
        int64_t v40 = v12 + 1;
        int64_t v41 = v31;
        if (v39 >= v14) {
          uint64_t v26 = v14;
        }
        v47.length = v26 + v11 - 1;
        v47.location = v12 + 1 + v38;
        CFStringGetCharacters(theString, v47, (UniChar *)v34);
        int64_t v30 = v40;
      }
      v27 = (const UniChar *)v34 + v12 - v30;
    }
    UniChar v28 = v27[5];
LABEL_33:
    if (v28 != 62 && v28 != 32) {
      goto LABEL_36;
    }
    v46.location = v12 + 1;
    *(void *)buffer = 0xAAAAAAAAAAAAAAAALL;
    __int16 v43 = -21846;
    v46.length = 4;
    CFStringGetCharacters((CFStringRef)a3, v46, buffer);
    BOOL v29 = ustrncasecmp((char *)buffer, "body", 4) == 0;
LABEL_37:
    ++v12;
    if (v29) {
      break;
    }
    --v11;
    ++v15;
    ++v14;
  }
  while (v12 < v8);
  if (!v29 || v12 == 0x8000000000000000)
  {
LABEL_51:
    uint64_t v32 = 0;
    return copyMutablePlainTextFromPoint((const __CFString *)a3, v32, a4, v5);
  }
  uint64_t v32 = v12 - 1;
  return copyMutablePlainTextFromPoint((const __CFString *)a3, v32, a4, v5);
}

+ (id)plainTextFromHTML:(id)a3 limit:(unint64_t)a4
{
  return (id)[a1 plainTextFromHTML:a3 limit:a4 preserveNewlines:0];
}

+ (id)plainTextFromHTML:(id)a3
{
  return (id)[a1 plainTextFromHTML:a3 limit:0xFFFFFFFFLL];
}

+ (id)plainTextFromHTMLSnippet:(id)a3
{
  v3 = copyMutablePlainTextFromPoint((const __CFString *)a3, 0, 0xFFFFFFFFuLL, 0);
  return v3;
}

@end
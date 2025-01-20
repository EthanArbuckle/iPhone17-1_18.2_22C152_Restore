@interface NSString(GTMNSStringHTMLAdditions)
- (__CFString)gtm_stringByEscapingHTMLUsingTable:()GTMNSStringHTMLAdditions ofSize:escapingUnicode:;
- (id)gtm_stringByUnescapingFromHTML;
- (uint64_t)gtm_stringByEscapingForAsciiHTML;
- (uint64_t)gtm_stringByEscapingForHTML;
@end

@implementation NSString(GTMNSStringHTMLAdditions)

- (id)gtm_stringByUnescapingFromHTML
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = objc_msgSend(a1, "rangeOfString:options:range:", @"&", 4, 0, v2);
  if (v4)
  {
    uint64_t v5 = v3;
    v27 = [MEMORY[0x263F089D8] stringWithString:a1];
    do
    {
      uint64_t v6 = objc_msgSend(a1, "rangeOfString:options:range:", @";", 0, v5, v2 - v5);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = v6 - v5 + 1;
        v8 = objc_msgSend(a1, "substringWithRange:", v5, v7);
        uint64_t v9 = [v8 length];
        uint64_t v10 = v9 - 4;
        if ((unint64_t)(v9 - 4) <= 6)
        {
          uint64_t v11 = v9;
          if ([v8 characterAtIndex:1] == 35)
          {
            if (([v8 characterAtIndex:2] & 0xFFFFFFDF) == 0x58)
            {
              v12 = objc_msgSend(v8, "substringWithRange:", 3, v10);
              v13 = [MEMORY[0x263F08B08] scannerWithString:v12];
              unsigned int v31 = 0;
              if ([v13 scanHexInt:&v31]) {
                BOOL v14 = v31 > 0xFFFE;
              }
              else {
                BOOL v14 = 1;
              }
              BOOL v15 = v14 || v31 == 0;
              if (!v15 && [v13 scanLocation] == v10)
              {
                __int16 v30 = v31;
                v16 = [NSString stringWithCharacters:&v30 length:1];
                objc_msgSend(v27, "replaceCharactersInRange:withString:", v5, v7, v16);
              }
            }
            else
            {
              uint64_t v19 = v11 - 3;
              v12 = objc_msgSend(v8, "substringWithRange:", 2, v11 - 3);
              v20 = [MEMORY[0x263F08B08] scannerWithString:v12];
              int v29 = 0;
              if ([v20 scanInt:&v29]) {
                BOOL v21 = v29 <= 65534;
              }
              else {
                BOOL v21 = 0;
              }
              BOOL v22 = !v21 || v29 < 1;
              if (!v22 && [v20 scanLocation] == v19)
              {
                __int16 v28 = v29;
                v23 = [NSString stringWithCharacters:&v28 length:1];
                objc_msgSend(v27, "replaceCharactersInRange:withString:", v5, v7, v23);
              }
            }
          }
          else
          {
            uint64_t v17 = 0;
            v18 = &gAsciiHTMLEscapeMap;
            while (![v8 isEqualToString:*v18])
            {
              ++v17;
              v18 += 2;
              if (v17 == 253) {
                goto LABEL_33;
              }
            }
            v12 = [NSString stringWithCharacters:&gAsciiHTMLEscapeMap + 2 * v17 + 1 length:1];
            objc_msgSend(v27, "replaceCharactersInRange:withString:", v5, v7, v12);
          }
        }
LABEL_33:
      }
      uint64_t v2 = v5;
      uint64_t v5 = objc_msgSend(a1, "rangeOfString:options:range:", @"&", 4, 0, v5);
    }
    while (v24);
    id v25 = v27;
  }
  else
  {
    id v25 = a1;
  }
  return v25;
}

- (uint64_t)gtm_stringByEscapingForAsciiHTML
{
  return objc_msgSend(a1, "gtm_stringByEscapingHTMLUsingTable:ofSize:escapingUnicode:", &gAsciiHTMLEscapeMap, 4048, 1);
}

- (uint64_t)gtm_stringByEscapingForHTML
{
  return objc_msgSend(a1, "gtm_stringByEscapingHTMLUsingTable:ofSize:escapingUnicode:", &gUnicodeHTMLEscapeMap, 528, 0);
}

- (__CFString)gtm_stringByEscapingHTMLUsingTable:()GTMNSStringHTMLAdditions ofSize:escapingUnicode:
{
  uint64_t v9 = [(__CFString *)a1 length];
  if (!v9)
  {
    uint64_t v17 = a1;
    goto LABEL_26;
  }
  uint64_t v10 = v9;
  uint64_t v11 = [MEMORY[0x263F089D8] string];
  v12 = [MEMORY[0x263EFF990] dataWithCapacity:2 * v10];
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr) {
    goto LABEL_5;
  }
  BOOL v14 = [MEMORY[0x263EFF990] dataWithLength:2 * v10];
  if (v14)
  {
    id v15 = v14;
    -[__CFString getCharacters:](a1, "getCharacters:", [v15 mutableBytes]);
    id v16 = v15;
    CharactersPtr = (const UniChar *)[v16 bytes];

LABEL_5:
    uint64_t v17 = 0;
    if (CharactersPtr && v12)
    {
      uint64_t v24 = v12;
      v18 = (const UniChar *)[v12 mutableBytes];
      CFIndex v19 = 0;
      size_t v20 = a4 >> 4;
      do
      {
        BOOL v21 = bsearch(CharactersPtr, a3, v20, 0x10uLL, (int (__cdecl *)(const void *, const void *))EscapeMapCompare);
        if (v21 || (unsigned int v22 = *CharactersPtr, a5) && v22 >= 0x80)
        {
          if (v19) {
            CFStringAppendCharacters(v11, v18, v19);
          }
          if (v21) {
            [(__CFString *)v11 appendString:*v21];
          }
          else {
            [(__CFString *)v11 appendFormat:@"&#%d;", *CharactersPtr];
          }
          CFIndex v19 = 0;
        }
        else
        {
          v18[v19++] = v22;
        }
        ++CharactersPtr;
        --v10;
      }
      while (v10);
      if (v19) {
        CFStringAppendCharacters(v11, v18, v19);
      }
      uint64_t v17 = v11;
      v12 = v24;
    }
    goto LABEL_25;
  }
  uint64_t v17 = 0;
LABEL_25:

LABEL_26:
  return v17;
}

@end
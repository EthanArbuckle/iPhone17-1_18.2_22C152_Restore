@interface NSString(GKAdditions)
- (__CFString)_gkLocaleSensitiveUppercaseString;
- (id)_gkArrayByTokenizingString;
- (id)_gkSHA256Hash;
- (id)_gkSHA256HashData;
- (id)_gkStringByUnescapingFromURLQuery;
- (uint64_t)_gkIsNaturallyRTL;
- (uint64_t)_gkSearchMatchesItem:()GKAdditions withSearchTerms:;
- (void)processUTF16CharactersForBidi:()GKAdditions;
@end

@implementation NSString(GKAdditions)

- (id)_gkSHA256Hash
{
  v1 = [a1 _gkSHA256HashData];
  v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

- (id)_gkSHA256HashData
{
  v1 = [a1 dataUsingEncoding:1];
  v2 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  id v3 = v1;
  v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];
  id v6 = v2;
  CC_SHA256(v4, v5, (unsigned __int8 *)[v6 mutableBytes]);

  return v6;
}

- (void)processUTF16CharactersForBidi:()GKAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = ubidi_open();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(__CFString *)a1 length];
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
    {
      v4[2](v4, v6, v7, CharactersPtr);
    }
    else
    {
      if ((unint64_t)(v7 << 32) < 0x8000000001) {
        v9 = (UniChar *)&v10;
      }
      else {
        v9 = (UniChar *)malloc_type_malloc(2 * (int)v7, 0x1000040BDFB0063uLL);
      }
      [(__CFString *)a1 getCharacters:v9];
      v4[2](v4, v6, v7, v9);
      if ((unint64_t)(v7 << 32) >= 0x8000000001) {
        free(v9);
      }
    }
    ubidi_close();
  }
}

- (uint64_t)_gkIsNaturallyRTL
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__NSString_GKAdditions___gkIsNaturallyRTL__block_invoke;
  v3[3] = &unk_1E646E1C0;
  v3[4] = &v4;
  [a1 processUTF16CharactersForBidi:v3];
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_gkSearchMatchesItem:()GKAdditions withSearchTerms:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count] && objc_msgSend(a1, "length"))
  {
    id v17 = v7;
    v8 = [v6 valueForKeyPath:a1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v13 length])
          {
            uint64_t v19 = 0;
            v20 = &v19;
            uint64_t v21 = 0x2020000000;
            char v22 = 0;
            uint64_t v14 = [v8 length];
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __62__NSString_GKAdditions___gkSearchMatchesItem_withSearchTerms___block_invoke;
            v18[3] = &unk_1E646E1E8;
            v18[4] = v13;
            v18[5] = &v19;
            objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v14, 1027, v18);
            int v15 = *((unsigned __int8 *)v20 + 24);
            _Block_object_dispose(&v19, 8);
            if (v15)
            {
              uint64_t v10 = 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    id v7 = v17;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (__CFString)_gkLocaleSensitiveUppercaseString
{
  uint64_t v1 = (__CFString *)[a1 mutableCopy];
  CFLocaleRef v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  CFStringUppercase(v1, v2);

  return v1;
}

- (id)_gkStringByUnescapingFromURLQuery
{
  uint64_t v1 = [a1 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  CFLocaleRef v2 = [v1 stringByRemovingPercentEncoding];

  return v2;
}

- (id)_gkArrayByTokenizingString
{
  CFLocaleRef v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v3 = [a1 stringByTrimmingCharactersInSet:v2];
  uint64_t v4 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
  [v4 setCharactersToBeSkipped:0];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = [v4 scanLocation];
  if (v5 < [v3 length])
  {
    id v6 = 0;
    while (1)
    {
      unsigned int v7 = objc_msgSend(a1, "characterAtIndex:", objc_msgSend(v4, "scanLocation"));
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v7);
      id v9 = [&unk_1F1E7ECF0 objectForKey:v8];
      if (v9)
      {
        [v4 scanString:v8 intoString:0];
        id v16 = v6;
        [v4 scanUpToString:v9 intoString:&v16];
        id v10 = v16;

        [v4 scanString:v9 intoString:0];
        if (v10) {
          goto LABEL_5;
        }
      }
      else
      {
        id v15 = v6;
        [v4 scanUpToCharactersFromSet:v2 intoString:&v15];
        id v10 = v15;

        if (v10)
        {
LABEL_5:
          id v6 = [v10 stringByTrimmingCharactersInSet:v2];

          if ([v6 length]) {
            [v14 addObject:v6];
          }
          goto LABEL_9;
        }
      }
      id v6 = 0;
LABEL_9:
      [v4 scanCharactersFromSet:v2 intoString:0];

      unint64_t v11 = [v4 scanLocation];
      if (v11 >= [v3 length])
      {

        break;
      }
    }
  }
  v12 = (void *)[v14 copy];

  return v12;
}

@end
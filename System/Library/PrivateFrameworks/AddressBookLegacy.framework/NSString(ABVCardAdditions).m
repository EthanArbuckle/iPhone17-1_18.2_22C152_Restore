@interface NSString(ABVCardAdditions)
- (__CFString)abEscapeStringForUnichar:()ABVCardAdditions and:advance:;
- (__CFString)abStringByRemovingCharactersFromSet:()ABVCardAdditions;
- (__CFString)abStringByStrippingControlCharacters;
- (uint64_t)copyABVCardDataRepresentation;
- (void)abVCardKoshify;
@end

@implementation NSString(ABVCardAdditions)

- (uint64_t)copyABVCardDataRepresentation
{
  if (![a1 canBeConvertedToEncoding:4]) {
    return 0;
  }
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v3 = [a1 UTF8String];
  uint64_t v4 = [a1 lengthOfBytesUsingEncoding:4];
  return [v2 initWithBytes:v3 length:v4];
}

- (__CFString)abEscapeStringForUnichar:()ABVCardAdditions and:advance:
{
  *a5 = 1;
  if (a3 > 57)
  {
    if (a3 == 58) {
      return @"\\:";
    }
    if (a3 != 59)
    {
      if (a3 == 92) {
        return @"\\\\"";
      }
      goto LABEL_11;
    }
    return @"\\;";
  }
  else
  {
    if (a3 == 10) {
      return @"\\n";
    }
    if (a3 != 13)
    {
      if (a3 == 44) {
        return @"\\,";
      }
LABEL_11:
      result = 0;
      *a5 = 0;
      return result;
    }
    if (a4 != 10)
    {
      return @"\\n";
    }
    else
    {
      *a5 = 2;
      return @"\\n\\n";
    }
  }
}

- (__CFString)abStringByRemovingCharactersFromSet:()ABVCardAdditions
{
  uint64_t v4 = a1;
  CFIndex v5 = [(__CFString *)a1 length];
  if (v5)
  {
    v10.length = v5;
    v10.location = 0;
    if (CFStringFindCharacterFromSet(v4, (CFCharacterSetRef)a3, v10, 0, 0))
    {
      uint64_t v4 = (__CFString *)[(__CFString *)v4 mutableCopy];
      uint64_t v6 = [(__CFString *)v4 length];
      if (v6 - 1 >= 0)
      {
        uint64_t v7 = v6;
        do
        {
          if (objc_msgSend(a3, "characterIsMember:", -[__CFString characterAtIndex:](v4, "characterAtIndex:", --v7)))-[__CFString deleteCharactersInRange:](v4, "deleteCharactersInRange:", v7, 1); {
        }
          }
        while (v7 > 0);
      }
      v8 = v4;
    }
  }
  return v4;
}

- (__CFString)abStringByStrippingControlCharacters
{
  if (abStringByStrippingControlCharacters_onceToken != -1) {
    dispatch_once(&abStringByStrippingControlCharacters_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)[a1 abStringByRemovingCharactersFromSet:abStringByStrippingControlCharacters___invalidChars];
  if ([v2 length]) {
    return (__CFString *)v2;
  }
  else {
    return &stru_1EF03E278;
  }
}

- (void)abVCardKoshify
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  strcpy(v12, "\r\n;,\\"");
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a1];
  [v2 setCharactersToBeSkipped:0];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", objc_msgSend(NSString, "stringWithUTF8String:", v12));
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
  unint64_t v5 = [a1 length];
  if (([v2 isAtEnd] & 1) == 0)
  {
    do
    {
      uint64_t v14 = 1;
      int v6 = [v2 scanUpToCharactersFromSet:v3 intoString:&v13];
      unint64_t v7 = [v2 scanLocation];
      if (v6) {
        [v4 appendString:v13];
      }
      while (v7 < v5)
      {
        uint64_t v8 = [a1 characterAtIndex:v7];
        uint64_t v9 = v7 + 1 >= v5 ? 0 : objc_msgSend(a1, "characterAtIndex:");
        uint64_t v10 = [a1 abEscapeStringForUnichar:v8 and:v9 advance:&v14];
        if (!v10) {
          break;
        }
        [v4 appendString:v10];
        v7 += v14;
      }
      [v2 setScanLocation:v7];
    }
    while (![v2 isAtEnd]);
  }

  return v4;
}

@end
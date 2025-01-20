@interface NSString(IntentsFoundation)
+ (id)if_hexStringFromBytes:()IntentsFoundation length:;
+ (id)if_hexStringFromData:()IntentsFoundation;
+ (id)if_stringWithData:()IntentsFoundation;
- (__CFString)if_stringByLowercasingFirstCharacter;
- (__CFString)if_stringByUppercasingFirstCharacter;
- (id)if_ASCIIStringByLowercasingFirstCharacter;
- (id)if_ASCIIStringByUppercasingFirstCharacter;
@end

@implementation NSString(IntentsFoundation)

- (id)if_ASCIIStringByUppercasingFirstCharacter
{
  if ([a1 length])
  {
    v2 = (void *)[a1 mutableCopy];
    char v5 = __toupper((char)[v2 characterAtIndex:0]);
    objc_msgSend(v2, "replaceCharactersInRange:withCString:length:", 0, 1, &v5, 1);
    id v3 = (id)[v2 copy];
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (__CFString)if_stringByLowercasingFirstCharacter
{
  if ([a1 length])
  {
    unsigned int v2 = [a1 characterAtIndex:0];
    if (v2 < 0x41 || v2 - 91 <= 0x24)
    {
      v8 = (__CFString *)[a1 copy];
    }
    else
    {
      id v3 = (void *)MEMORY[0x1E01A2D20]();
      v4 = (void *)[a1 mutableCopy];
      char v5 = [a1 substringToIndex:1];
      v6 = [v5 lowercaseString];
      objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, 1, v6);

      if ([a1 isEqual:v4]) {
        v7 = a1;
      }
      else {
        v7 = v4;
      }
      v8 = (__CFString *)[v7 copy];
    }
  }
  else
  {
    v8 = &stru_1F37C4EF0;
  }
  return v8;
}

- (id)if_ASCIIStringByLowercasingFirstCharacter
{
  if ([a1 length])
  {
    unsigned int v2 = (void *)[a1 mutableCopy];
    char v5 = __tolower((char)[v2 characterAtIndex:0]);
    objc_msgSend(v2, "replaceCharactersInRange:withCString:length:", 0, 1, &v5, 1);
    id v3 = (id)[v2 copy];
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (__CFString)if_stringByUppercasingFirstCharacter
{
  if ([a1 length])
  {
    unsigned int v2 = [a1 characterAtIndex:0];
    if (v2 < 0x61 || v2 - 123 <= 4)
    {
      v8 = (__CFString *)[a1 copy];
    }
    else
    {
      id v3 = (void *)MEMORY[0x1E01A2D20]();
      v4 = (void *)[a1 mutableCopy];
      char v5 = [a1 substringToIndex:1];
      v6 = [v5 uppercaseString];
      objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, 1, v6);

      if ([a1 isEqual:v4]) {
        v7 = a1;
      }
      else {
        v7 = v4;
      }
      v8 = (__CFString *)[v7 copy];
    }
  }
  else
  {
    v8 = &stru_1F37C4EF0;
  }
  return v8;
}

+ (id)if_stringWithData:()IntentsFoundation
{
  if (a3)
  {
    id v6 = 0;
    [NSString stringEncodingForData:a3 encodingOptions:0 convertedString:&v6 usedLossyConversion:0];
    id v4 = v6;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)if_hexStringFromData:()IntentsFoundation
{
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = [v5 bytes];
    uint64_t v7 = [v5 length];

    v8 = objc_msgSend(a1, "if_hexStringFromBytes:length:", v6, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)if_hexStringFromBytes:()IntentsFoundation length:
{
  uint64_t v4 = a4;
  uint64_t v7 = malloc_type_malloc(2 * a4, 0x9FEF5B4AuLL);
  v8 = v7;
  if (v4)
  {
    v9 = v7;
    do
    {
      if (*a3 <= 0x9Fu) {
        char v10 = 48;
      }
      else {
        char v10 = 87;
      }
      unsigned char *v9 = v10 + (*a3 >> 4);
      char v11 = *a3++;
      unsigned int v12 = v11 & 0xF;
      if (v12 <= 9) {
        char v13 = 48;
      }
      else {
        char v13 = 87;
      }
      v8 = v9 + 2;
      v9[1] = v13 + v12;
      v9 += 2;
      --v4;
    }
    while (v4);
  }
  v14 = (void *)[[a1 alloc] initWithBytesNoCopy:v7 length:v8 - v7 encoding:1 freeWhenDone:1];
  return v14;
}

@end
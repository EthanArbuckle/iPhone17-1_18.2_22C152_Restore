@interface NSString(FBKUtils)
+ (id)whitespaceSet;
- (id)snakeCaseString;
- (uint64_t)visibleCharactersCount;
@end

@implementation NSString(FBKUtils)

- (id)snakeCaseString
{
  v1 = [MEMORY[0x263F08B08] scannerWithString:a1];
  [v1 setCaseSensitive:1];
  v2 = [NSString string];
  if ([v1 isAtEnd])
  {
    id v3 = 0;
LABEL_11:
    id v13 = v2;
    v2 = v13;
  }
  else
  {
    uint64_t v4 = 0;
    id v3 = 0;
    while (1)
    {
      v5 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
      id v16 = v3;
      int v6 = [v1 scanCharactersFromSet:v5 intoString:&v16];
      id v7 = v16;

      if (v6)
      {
        v8 = [v2 stringByAppendingString:v7];

        v9 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
        id v15 = v7;
        int v10 = [v1 scanCharactersFromSet:v9 intoString:&v15];
        id v3 = v15;

        if (v10)
        {
          v11 = [v8 stringByAppendingString:@"_"];

          v12 = [v3 lowercaseString];
          v2 = [v11 stringByAppendingString:v12];
        }
        else
        {
          v2 = v8;
        }
      }
      else
      {
        id v3 = v7;
      }
      if (v4 == [v1 scanLocation]) {
        break;
      }
      uint64_t v4 = [v1 scanLocation];
      if ([v1 isAtEnd]) {
        goto LABEL_11;
      }
    }
    id v13 = 0;
  }

  return v13;
}

- (uint64_t)visibleCharactersCount
{
  uint64_t result = [a1 length];
  if (result)
  {
    id v3 = [NSString whitespaceSet];
    uint64_t v4 = [a1 stringByTrimmingCharactersInSet:v3];
    uint64_t v5 = [v4 length];

    return v5;
  }
  return result;
}

+ (id)whitespaceSet
{
  if (whitespaceSet_onceToken != -1) {
    dispatch_once(&whitespaceSet_onceToken, &__block_literal_global_36);
  }
  v0 = (void *)whitespaceSet_set;

  return v0;
}

@end
@interface NSString(TWStringAdditions)
- (uint64_t)TWTwitterCharacterCountWithShortenedURLLength:()TWStringAdditions;
@end

@implementation NSString(TWStringAdditions)

- (uint64_t)TWTwitterCharacterCountWithShortenedURLLength:()TWStringAdditions
{
  uint64_t v19 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263F08770]) initWithTypes:32 error:&v19];
  v5 = (void *)[a1 mutableCopy];
  v17 = v4;
  v6 = objc_msgSend(v4, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  int v7 = [v6 count];
  if (v7 >= 1)
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = v7 + 1;
    while (1)
    {
      v11 = (void *)[v6 objectAtIndex:(v10 - 2)];
      if ([v11 resultType] == 32)
      {
        v12 = objc_msgSend((id)objc_msgSend(v11, "URL"), "scheme");
        if (![v12 compare:@"https" options:1])
        {
          ++v9;
          goto LABEL_8;
        }
        if (![v12 compare:@"http" options:1])
        {
          ++v8;
LABEL_8:
          uint64_t v13 = [v11 range];
          objc_msgSend(v5, "replaceCharactersInRange:withString:", v13, v14, &stru_26E265210);
        }
      }
      if ((unint64_t)--v10 <= 1) {
        goto LABEL_12;
      }
    }
  }
  int v9 = 0;
  int v8 = 0;
LABEL_12:
  uint64_t v15 = v9
      + v9 * a3
      + v8 * a3
      + objc_msgSend((id)objc_msgSend(v5, "precomposedStringWithCanonicalMapping"), "length");

  return v15;
}

@end
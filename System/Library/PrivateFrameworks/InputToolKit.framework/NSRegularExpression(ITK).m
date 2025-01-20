@interface NSRegularExpression(ITK)
+ (id)itk_regexForSearchStrings:()ITK;
@end

@implementation NSRegularExpression(ITK)

+ (id)itk_regexForSearchStrings:()ITK
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
    objc_msgSend(v4, "appendString:", @"(");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [MEMORY[0x263F08AE8] escapedPatternForString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v4 appendString:v10];

          [v4 appendString:@"|"];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if ([v4 length]) {
      objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, &stru_2702F71A0);
    }
    [v4 appendString:@""]);
    uint64_t v13 = 0;
    v11 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v4 options:1 error:&v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
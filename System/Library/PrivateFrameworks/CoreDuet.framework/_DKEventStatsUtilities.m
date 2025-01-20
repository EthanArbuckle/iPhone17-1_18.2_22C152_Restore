@interface _DKEventStatsUtilities
+ (id)componentsPrunedOfLeadingBlanksFromComponents:(uint64_t)a1;
+ (id)safeStringWithString:(id)a3;
+ (id)safeStringsWithStrings:(id)a3;
@end

@implementation _DKEventStatsUtilities

+ (id)componentsPrunedOfLeadingBlanksFromComponents:(uint64_t)a1
{
  id v2 = a2;
  self;
  while ([v2 count])
  {
    v3 = [v2 firstObject];
    if ([v3 length])
    {

      break;
    }
    [v2 removeObjectAtIndex:0];
  }
  return v2;
}

+ (id)safeStringWithString:(id)a3
{
  uint64_t v4 = safeStringWithString__initialized;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&safeStringWithString__initialized, &__block_literal_global_590);
  }
  v6 = [v5 componentsSeparatedByCharactersInSet:safeStringWithString__nonPermittedCharacterSet];

  v7 = (void *)[v6 mutableCopy];
  +[_DKEventStatsUtilities componentsPrunedOfLeadingBlanksFromComponents:]((uint64_t)a1, v7);
  objc_claimAutoreleasedReturnValue();
  v8 = [v7 componentsJoinedByString:@"_"];

  return v8;
}

+ (id)safeStringsWithStrings:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(a1, "safeStringWithString:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  v13 = objc_msgSend(0, "copy", (void)v15);

  return v13;
}

@end
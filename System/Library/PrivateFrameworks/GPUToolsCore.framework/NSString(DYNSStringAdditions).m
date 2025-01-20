@interface NSString(DYNSStringAdditions)
+ (uint64_t)dy_timeFormat:()DYNSStringAdditions unit:;
- (BOOL)dy_versionIsOlderThan:()DYNSStringAdditions;
- (id)dy_removeWhiteSpaceCharacters;
- (uint64_t)dy_appendComponents:()DYNSStringAdditions usingSeparator:unique:;
- (uint64_t)dy_appendComponentsString:()DYNSStringAdditions usingSeparator:unique:;
- (uint64_t)dy_numericCompare:()DYNSStringAdditions;
- (uint64_t)dy_scanBuildPrefix:()DYNSStringAdditions number:;
- (uint64_t)simplifiedTestFileName:()DYNSStringAdditions;
@end

@implementation NSString(DYNSStringAdditions)

+ (uint64_t)dy_timeFormat:()DYNSStringAdditions unit:
{
  v6 = objc_opt_new();
  [v6 setMaximumFractionDigits:2];
  [v6 setAllowsFloats:1];
  [v6 setUsesGroupingSeparator:0];
  [v6 setRoundingMode:3];
  double v7 = fabs(a1);
  if (v7 >= 1.0)
  {
    v8 = NSString;
    uint64_t v9 = [NSNumber numberWithDouble:a1];
    v10 = @" s";
  }
  else if (v7 >= 0.001)
  {
    v8 = NSString;
    uint64_t v9 = [NSNumber numberWithDouble:a1 * 1000.0];
    v10 = @" ms";
  }
  else
  {
    v8 = NSString;
    if (v7 >= 0.000001)
    {
      uint64_t v9 = [NSNumber numberWithDouble:a1 * 1000000.0];
      v10 = @" μs";
    }
    else
    {
      uint64_t v9 = [NSNumber numberWithDouble:a1 * 1000000000.0];
      v10 = @" ns";
    }
  }
  uint64_t v11 = [v6 stringFromNumber:v9];
  v12 = &stru_2700E6440;
  if (a4) {
    v12 = v10;
  }
  uint64_t v13 = [v8 stringWithFormat:@"%@%@", v11, v12];

  return v13;
}

- (uint64_t)dy_numericCompare:()DYNSStringAdditions
{
  return [a1 compare:a3 options:64];
}

- (id)dy_removeWhiteSpaceCharacters
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = (void *)[a1 mutableCopy];
  uint64_t v4 = [v3 rangeOfCharacterFromSet:v2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v4; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v3 rangeOfCharacterFromSet:v2])
      objc_msgSend(v3, "deleteCharactersInRange:", i, v5);
  }

  return v3;
}

- (uint64_t)dy_scanBuildPrefix:()DYNSStringAdditions number:
{
  double v7 = (void *)[MEMORY[0x263F08B08] scannerWithString:a1];
  if (![v7 scanInteger:0]
    || !objc_msgSend(v7, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0))
  {
    return 0;
  }
  if (a3) {
    *a3 = objc_msgSend(a1, "substringToIndex:", objc_msgSend(v7, "scanLocation"));
  }

  return [v7 scanInteger:a4];
}

- (BOOL)dy_versionIsOlderThan:()DYNSStringAdditions
{
  return [a1 compare:a3 options:64] == -1;
}

- (uint64_t)dy_appendComponents:()DYNSStringAdditions usingSeparator:unique:
{
  v28[2] = *MEMORY[0x263EF8340];
  if ([a1 length])
  {
    uint64_t v9 = (void *)[a1 componentsSeparatedByString:a4];
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a5)
    {
LABEL_3:
      v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      uint64_t v12 = 0;
      v28[0] = v9;
      v28[1] = a3;
      char v13 = 1;
      do
      {
        char v14 = v13;
        v15 = (void *)v28[v12];
        if (v15)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v24 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
                if (([v10 containsObject:v20] & 1) == 0)
                {
                  [v11 addObject:v20];
                  [v10 addObject:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
            }
            while (v17);
          }
        }
        char v13 = 0;
        uint64_t v12 = 1;
      }
      while ((v14 & 1) != 0);

      id v21 = v11;
      goto LABEL_19;
    }
  }
  if ([v9 count])
  {
    id v21 = (id)[v9 arrayByAddingObjectsFromArray:a3];
LABEL_19:
    a3 = v21;
  }
  return [a3 componentsJoinedByString:a4];
}

- (uint64_t)dy_appendComponentsString:()DYNSStringAdditions usingSeparator:unique:
{
  if (![a3 length]) {
    return (uint64_t)a1;
  }
  uint64_t v9 = [a3 componentsSeparatedByString:a4];

  return objc_msgSend(a1, "dy_appendComponents:usingSeparator:unique:", v9, a4, a5);
}

- (uint64_t)simplifiedTestFileName:()DYNSStringAdditions
{
  if (![a1 length])
  {
    *a3 = 0;
    return 0;
  }
  uint64_t v5 = malloc_type_malloc([a1 length] + 1, 0xD459B532uLL);
  v6 = (unsigned char *)[a1 cStringUsingEncoding:1];
  double v7 = v5;
  while (1)
  {
    int v8 = *v6;
    char v9 = v8 - 32;
    if ((v8 - 32) > 0x3D) {
      goto LABEL_9;
    }
    if (((1 << v9) & 0x2800000004008301) == 0) {
      break;
    }
    if (v7 > v5 && *(v7 - 1) != 95)
    {
      LOBYTE(v8) = 95;
      goto LABEL_10;
    }
LABEL_11:
    ++v6;
  }
  if (((1 << v9) & 0x84) != 0) {
    goto LABEL_11;
  }
LABEL_9:
  if (*v6)
  {
LABEL_10:
    *v7++ = v8;
    goto LABEL_11;
  }
  v10 = v7 - 1;
  if (*(v7 - 1) != 95) {
    v10 = v7;
  }
  unsigned char *v10 = 0;
  uint64_t v11 = (void *)[NSString stringWithUTF8String:v5];
  free(v5);
  uint64_t v12 = [v11 length];
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", @"_0x[0-9a-f]+", 1, 0), "stringByReplacingMatchesInString:options:range:withTemplate:", v11, 0, 0, v12, &stru_2700E6440);
  *a3 = 0;
  return result;
}

@end
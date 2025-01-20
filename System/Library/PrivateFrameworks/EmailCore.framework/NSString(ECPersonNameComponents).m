@interface NSString(ECPersonNameComponents)
+ (id)ec_nameExtensions;
+ (id)ec_partialSurnames;
+ (void)__ec_extractFirstName:()ECPersonNameComponents middleName:lastName:extension:fromString:;
- (__CFString)ec_trimCommasSpacesQuotes;
- (id)ec_personNameComponents;
- (uint64_t)ec_appearsToBeAnInitial;
@end

@implementation NSString(ECPersonNameComponents)

+ (void)__ec_extractFirstName:()ECPersonNameComponents middleName:lastName:extension:fromString:
{
  id v52 = a7;
  v7 = [v52 componentsSeparatedByString:@","];
  v8 = v52;
  v51 = v7;
  if ((unint64_t)[v7 count] >= 2)
  {
    v9 = objc_msgSend(NSString, "ec_nameExtensions");
    v10 = [v7 lastObject];
    v11 = objc_msgSend(v10, "ec_trimCommasSpacesQuotes");
    v12 = [v11 lowercaseString];
    char v13 = [v9 containsObject:v12];

    v8 = v52;
    if ((v13 & 1) == 0)
    {
      if ((unint64_t)[v7 count] < 3)
      {
        v18 = NSString;
        v14 = [v7 objectAtIndex:1];
        v16 = [v7 objectAtIndex:0];
        v8 = [v18 stringWithFormat:@"%@ %@", v14, v16];
        v17 = v52;
      }
      else
      {
        v14 = (void *)[v7 mutableCopy];
        [v14 removeLastObject];
        v15 = NSString;
        v16 = [v7 lastObject];
        v17 = [v14 componentsJoinedByString:@" "];
        v8 = [v15 stringWithFormat:@"%@ %@", v16, v17];
      }
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = [v8 length];
  if (v21)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    for (uint64_t i = 0; v21 != i; ++i)
    {
      uint64_t v25 = [v8 characterAtIndex:i];
      if ((int)v25 > 90)
      {
        if (v25 == 91)
        {
          if ([v19 length]) {
            [v20 addObject:v19];
          }
          id v26 = objc_alloc_init(MEMORY[0x1E4F28E78]);

          ++v22;
          goto LABEL_26;
        }
        if (v25 == 93)
        {
          if (v22) {
            --v22;
          }
          else {
            uint64_t v22 = 0;
          }
          continue;
        }
      }
      else
      {
        if (v25 == 40)
        {
          if ([v19 length]) {
            [v20 addObject:v19];
          }
          id v26 = objc_alloc_init(MEMORY[0x1E4F28E78]);

          ++v23;
          goto LABEL_26;
        }
        if (v25 == 41)
        {
          if (v23) {
            --v23;
          }
          else {
            uint64_t v23 = 0;
          }
          continue;
        }
      }
      if (v23 | v22) {
        continue;
      }
      if (v25 != 32)
      {
        objc_msgSend(v19, "appendFormat:", @"%C", v25);
LABEL_34:
        uint64_t v23 = 0;
        uint64_t v22 = 0;
        continue;
      }
      if (![v19 length]) {
        goto LABEL_34;
      }
      [v20 addObject:v19];
      id v26 = objc_alloc_init(MEMORY[0x1E4F28E78]);

      uint64_t v23 = 0;
      uint64_t v22 = 0;
LABEL_26:
      id v19 = v26;
    }
  }
  if ([v19 length]) {
    [v20 addObject:v19];
  }
  unint64_t v27 = [v20 count];
  if (v27 == 2)
  {
    *a3 = [v20 objectAtIndex:0];
    *a4 = 0;
    *a5 = [v20 objectAtIndex:1];
    goto LABEL_41;
  }
  if (v27 <= 1)
  {
    *a3 = v8;
    *a4 = 0;
    *a5 = 0;
LABEL_41:
    *a6 = 0;
    goto LABEL_59;
  }
  v28 = [v20 lastObject];
  v29 = objc_msgSend(NSString, "ec_nameExtensions");
  v46 = v28;
  v30 = [v28 lowercaseString];
  int v31 = [v29 containsObject:v30];

  if (v31)
  {
    *a6 = v28;
    [v20 removeLastObject];
  }
  else
  {
    *a6 = 0;
  }
  v32 = 0;
  for (unint64_t j = 1; ; ++j)
  {
    v34 = v19;
    if (j >= [v20 count] - 1) {
      break;
    }
    id v19 = [v20 objectAtIndex:j];

    v35 = objc_msgSend(NSString, "ec_partialSurnames");
    v36 = [v19 lowercaseString];
    char v37 = [v35 containsObject:v36];

    if (v37)
    {
      v38 = (void *)MEMORY[0x1E4F28E78];
      v39 = [v20 objectAtIndex:j + 1];
      uint64_t v40 = [v38 stringWithFormat:@"%@ %@", v19, v39];

      [v20 replaceObjectAtIndex:j withObject:v40];
      v32 = (void *)v40;
      [v20 removeObjectAtIndex:j + 1];
    }
  }
  unint64_t v41 = [v20 count];
  if (v41 < 4)
  {
    *a5 = [v20 lastObject];
    v43 = v46;
    [v20 removeLastObject];
  }
  else
  {
    v42 = [v20 objectAtIndex:v41 - 2];

    if (objc_msgSend(v42, "ec_appearsToBeAnInitial"))
    {
      *a5 = [v20 lastObject];
      id v19 = v42;
      v43 = v46;
    }
    else
    {
      uint64_t v44 = [v20 lastObject];

      *a5 = [NSString stringWithFormat:@"%@ %@", v42, v44];
      [v20 removeLastObject];
      id v19 = v42;
      v43 = (void *)v44;
    }
    [v20 removeLastObject];
  }
  *a3 = [v20 objectAtIndex:0];
  [v20 removeObjectAtIndex:0];
  id v45 = (id)[v20 count];
  if (v45)
  {
    id v45 = [v20 componentsJoinedByString:@" "];
  }
  *a4 = v45;

LABEL_59:
}

+ (id)ec_partialSurnames
{
  if (ec_partialSurnames_onceToken != -1) {
    dispatch_once(&ec_partialSurnames_onceToken, &__block_literal_global_89);
  }
  v0 = (void *)ec_partialSurnames_partialSurnames;
  return v0;
}

+ (id)ec_nameExtensions
{
  if (ec_nameExtensions_onceToken != -1) {
    dispatch_once(&ec_nameExtensions_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)ec_nameExtensions_nameExtensions;
  return v0;
}

- (uint64_t)ec_appearsToBeAnInitial
{
  uint64_t v2 = [a1 length];
  if (v2 == 1) {
    return 1;
  }
  if (v2 != 2) {
    return 0;
  }
  uint64_t v3 = 1;
  if ([a1 characterAtIndex:1] != 46)
  {
    uint64_t v3 = 1;
    if ([a1 characterAtIndex:1] != 93) {
      return 0;
    }
  }
  return v3;
}

- (id)ec_personNameComponents
{
  id v9 = 0;
  id v10 = 0;
  id v7 = 0;
  id v8 = 0;
  objc_msgSend((id)objc_opt_class(), "__ec_extractFirstName:middleName:lastName:extension:fromString:", &v10, &v9, &v8, &v7, a1);
  id v1 = v10;
  id v2 = v9;
  id v3 = v8;
  id v4 = v7;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  [v5 setGivenName:v1];
  [v5 setMiddleName:v2];
  [v5 setFamilyName:v3];
  [v5 setNameSuffix:v4];

  return v5;
}

- (__CFString)ec_trimCommasSpacesQuotes
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    goto LABEL_15;
  }
  unsigned __int16 v3 = [a1 characterAtIndex:0];
  char v4 = 0;
  uint64_t v5 = 1;
  while (v3 <= 0x2Cu && ((1 << v3) & 0x100500000000) != 0)
  {
    v4 ^= v3 == 34;
    if (v2 == v5)
    {
      uint64_t v6 = v2;
      goto LABEL_9;
    }
    unsigned __int16 v3 = [a1 characterAtIndex:v5++];
  }
  uint64_t v6 = v5 - 1;
LABEL_9:
  uint64_t v7 = v2 - 1;
  unsigned __int16 v8 = [a1 characterAtIndex:v7];
  char v9 = 0;
  while (v8 <= 0x2Cu)
  {
    if (((1 << v8) & 0x100500000000) == 0) {
      break;
    }
    --v7;
    v9 ^= v8 == 34;
    if (v7 <= v6) {
      break;
    }
    unsigned __int16 v8 = [a1 characterAtIndex:v7];
  }
  if (v7 < v6)
  {
LABEL_15:
    id v10 = &stru_1F1A635E8;
    goto LABEL_21;
  }
  objc_msgSend(a1, "substringWithRange:", v6, v7 - v6 + 1);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9 & 1 | ((v4 & 1) == 0))
  {
    if (v4 & 1 | ((v9 & 1) == 0)) {
      goto LABEL_21;
    }
    v11 = @"%@\"";
  }
  else
  {
    v11 = @"\"%@";
  }
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", v11, v10);

  id v10 = (__CFString *)v12;
LABEL_21:
  return v10;
}

@end
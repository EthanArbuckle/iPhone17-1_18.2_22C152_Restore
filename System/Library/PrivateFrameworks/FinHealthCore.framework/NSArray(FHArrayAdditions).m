@interface NSArray(FHArrayAdditions)
- (id)_firstObjectWithPredicate:()FHArrayAdditions order:;
- (id)decimalNumberAtIndex:()FHArrayAdditions;
- (id)stringAtIndex:()FHArrayAdditions;
- (uint64_t)firstObjectWithPredicate:()FHArrayAdditions;
- (uint64_t)intAtIndex:()FHArrayAdditions;
- (uint64_t)lastObjectWithPredicate:()FHArrayAdditions;
- (uint64_t)signedIntegerAtIndex:()FHArrayAdditions;
- (uint64_t)unsignedIntAtIndex:()FHArrayAdditions;
@end

@implementation NSArray(FHArrayAdditions)

- (uint64_t)intAtIndex:()FHArrayAdditions
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (uint64_t)signedIntegerAtIndex:()FHArrayAdditions
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (id)stringAtIndex:()FHArrayAdditions
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  uint64_t v2 = [v1 stringValue];

  return v2;
}

- (uint64_t)unsignedIntAtIndex:()FHArrayAdditions
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (id)decimalNumberAtIndex:()FHArrayAdditions
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = (void *)MEMORY[0x263F087B0];
    if (v1)
    {
      [v1 decimalValue];
    }
    else
    {
      v9[0] = 0;
      v9[1] = 0;
      int v10 = 0;
    }
    uint64_t v3 = [v2 decimalNumberWithDecimal:v9];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v1 length]) {
      goto LABEL_14;
    }
    uint64_t v3 = [MEMORY[0x263F087B0] decimalNumberWithString:v1];
  }
  v4 = (void *)v3;
  if (v3)
  {
    v5 = [MEMORY[0x263F087B0] notANumber];
    if ([v4 isEqualToNumber:v5]) {
      v6 = 0;
    }
    else {
      v6 = v4;
    }
    id v7 = v6;

    goto LABEL_15;
  }
LABEL_14:
  id v7 = 0;
LABEL_15:

  return v7;
}

- (uint64_t)firstObjectWithPredicate:()FHArrayAdditions
{
  return [a1 _firstObjectWithPredicate:a3 order:0];
}

- (uint64_t)lastObjectWithPredicate:()FHArrayAdditions
{
  return [a1 _firstObjectWithPredicate:a3 order:1];
}

- (id)_firstObjectWithPredicate:()FHArrayAdditions order:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v6 = a3;
  if (v6)
  {
    if (a4 == 1) {
      [a1 reverseObjectEnumerator];
    }
    else {
      [a1 objectEnumerator];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = (id)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v8);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (v6[2](v6, v11))
          {
            id v7 = v11;
            goto LABEL_16;
          }
        }
        id v7 = (id)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end
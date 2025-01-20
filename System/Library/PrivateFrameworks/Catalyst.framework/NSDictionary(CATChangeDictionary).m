@interface NSDictionary(CATChangeDictionary)
- (id)cat_calculateAddedObjects;
- (id)cat_calculateRemovedObjects;
@end

@implementation NSDictionary(CATChangeDictionary)

- (id)cat_calculateAddedObjects
{
  v4 = [a1 valueForKey:*MEMORY[0x263F081B0]];
  int v5 = [v4 unsignedIntValue];

  if (!v5)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"NSDictionary+ChangeDictionary.m" lineNumber:18 description:@"This is not a KVO change dictionary"];
  }
  v6 = [a1 valueForKey:*MEMORY[0x263F081B8]];
  if (!v6 || ([MEMORY[0x263EFF9D0] null], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v6 == (void *)v7))
  {
    v10 = [MEMORY[0x263EFFA08] set];
    v8 = v6;
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [MEMORY[0x263EFFA08] setWithArray:v6];
    }
    else
    {
      id v9 = v6;
    }
    v10 = v9;
  }

LABEL_12:
  v11 = [a1 valueForKey:*MEMORY[0x263F081C8]];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    if (v11 != (void *)v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [MEMORY[0x263EFFA08] setWithArray:v11];
      }
      else
      {
        id v14 = v11;
      }
      v15 = v14;
      goto LABEL_20;
    }
  }
  v15 = [MEMORY[0x263EFFA08] set];
  v13 = v11;
  if (v11) {
LABEL_20:
  }

  if ((v5 - 2) >= 3)
  {
    if (v5 == 1)
    {
      v16 = (void *)[v10 mutableCopy];
      [v16 minusSet:v15];
      uint64_t v17 = [v16 copy];

      v10 = (void *)v17;
    }
    else
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2 object:a1 file:@"NSDictionary+ChangeDictionary.m" lineNumber:40 description:@"Unexpected change type from a KVO'd collection"];
    }
  }

  return v10;
}

- (id)cat_calculateRemovedObjects
{
  v4 = [a1 valueForKey:*MEMORY[0x263F081B0]];
  int v5 = [v4 unsignedIntValue];

  if (!v5)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"NSDictionary+ChangeDictionary.m" lineNumber:50 description:@"This is not a KVO change dictionary"];
  }
  v6 = [a1 valueForKey:*MEMORY[0x263F081B8]];
  if (!v6 || ([MEMORY[0x263EFF9D0] null], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v6 == (void *)v7))
  {
    v10 = [MEMORY[0x263EFFA08] set];
    v8 = v6;
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [MEMORY[0x263EFFA08] setWithArray:v6];
    }
    else
    {
      id v9 = v6;
    }
    v10 = v9;
  }

LABEL_12:
  v11 = [a1 valueForKey:*MEMORY[0x263F081C8]];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    if (v11 != (void *)v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [MEMORY[0x263EFFA08] setWithArray:v11];
      }
      else
      {
        id v14 = v11;
      }
      v15 = v14;
      goto LABEL_20;
    }
  }
  v15 = [MEMORY[0x263EFFA08] set];
  v13 = v11;
  if (v11) {
LABEL_20:
  }

  if ((v5 - 2) >= 3)
  {
    if (v5 == 1)
    {
      v16 = (void *)[v15 mutableCopy];
      [v16 minusSet:v10];
      uint64_t v17 = [v16 copy];

      v15 = (void *)v17;
    }
    else
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2 object:a1 file:@"NSDictionary+ChangeDictionary.m" lineNumber:72 description:@"Unexpected change type from a KVO'd collection"];
    }
  }

  return v15;
}

@end
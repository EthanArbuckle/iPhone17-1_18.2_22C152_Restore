@interface NSSet(EmailFoundationAdditions)
- (BOOL)ef_all:()EmailFoundationAdditions;
- (BOOL)ef_any:()EmailFoundationAdditions;
- (id)ef_anyPassingTest:()EmailFoundationAdditions;
- (id)ef_compactMap:()EmailFoundationAdditions;
- (id)ef_filter:()EmailFoundationAdditions;
- (id)ef_flatMap:()EmailFoundationAdditions;
- (id)ef_flatten;
- (id)ef_notEmpty;
- (id)ef_partition:()EmailFoundationAdditions;
- (id)ef_setByRemovingObjectsFromSet:()EmailFoundationAdditions;
- (id)ef_subsets;
- (uint64_t)ef_countObjectsPassingTest:()EmailFoundationAdditions;
@end

@implementation NSSet(EmailFoundationAdditions)

- (id)ef_notEmpty
{
  if ([a1 count]) {
    v2 = a1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)ef_filter:()EmailFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"EFNSSetAdditions.m", 90, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v5[2](v5, v11)) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)ef_compactMap:()EmailFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"EFNSSetAdditions.m", 64, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = v5[2](v5, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)ef_flatten
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          uint64_t v9 = objc_msgSend(v8, "ef_flatten");
          [v2 unionSet:v9];
        }
        else
        {
          objc_msgSend(v2, "addObject:", v7, (void)v11);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)ef_subsets
{
  v14[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 count];
  if (v2 == 1)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a1);
    v13[1] = v4;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else if (v2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (unint64_t)fmin(exp2((double)v2), 1.84467441e19));
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    [v3 addObject:v5];

    v6 = (void *)[a1 mutableCopy];
    uint64_t v7 = 1;
    while ([v6 count])
    {
      id v8 = [v6 anyObject];
      [v6 removeObject:v8];
      if (v7)
      {
        uint64_t v9 = 0;
        while (v7 - 1 != v9 || [v6 count])
        {
          v10 = [v3 objectAtIndexedSubscript:v9];
          long long v11 = (void *)[v10 mutableCopy];
          [v11 addObject:v8];
          [v3 addObject:v11];

          if (v7 == ++v9) {
            goto LABEL_14;
          }
        }
        [v3 addObject:a1];
      }
LABEL_14:

      v7 *= 2;
    }
  }
  else
  {
    v14[0] = a1;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  return v3;
}

- (id)ef_flatMap:()EmailFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  if (!v5)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"EFNSSetAdditions.m", 77, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = v5[2](v5, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 unionSet:v11];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)ef_anyPassingTest:()EmailFoundationAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)ef_any:()EmailFoundationAdditions
{
  v1 = objc_msgSend(a1, "ef_anyPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)ef_all:()EmailFoundationAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__NSSet_EmailFoundationAdditions__ef_all___block_invoke;
  v9[3] = &unk_1E6122488;
  id v10 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "ef_anyPassingTest:", v9);
  BOOL v7 = v6 == 0;

  return v7;
}

- (uint64_t)ef_countObjectsPassingTest:()EmailFoundationAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v6 += v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v6;
}

- (id)ef_partition:()EmailFoundationAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          long long v12 = v5;
        }
        else {
          long long v12 = v6;
        }
        objc_msgSend(v12, "addObject:", v11, (void)v15);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v13 = +[EFPair pairWithFirst:v5 second:v6];

  return v13;
}

- (id)ef_setByRemovingObjectsFromSet:()EmailFoundationAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__NSSet_EmailFoundationAdditions__ef_setByRemovingObjectsFromSet___block_invoke;
  v8[3] = &unk_1E6121D90;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "ef_filter:", v8);

  return v6;
}

@end
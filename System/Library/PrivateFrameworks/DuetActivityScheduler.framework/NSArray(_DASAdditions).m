@interface NSArray(_DASAdditions)
+ (id)array:()_DASAdditions withItemsIn:;
+ (id)arrayWithIntersectionOf:()_DASAdditions and:;
+ (id)arrayWithObjectsFrom:()_DASAdditions;
+ (id)arrayWithUnionOf:()_DASAdditions and:;
- (double)cooccurrencesWith:()_DASAdditions;
- (double)correlationWith:()_DASAdditions;
- (double)mean;
- (double)standardDeviation;
- (double)standardDeviationWithMean:()_DASAdditions;
- (uint64_t)anyItemsIntersectArray:()_DASAdditions;
@end

@implementation NSArray(_DASAdditions)

+ (id)arrayWithObjectsFrom:()_DASAdditions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t v11 = [v10 count];
  v12 = [MEMORY[0x1E4F1CA80] setWithObject:v10];
  v39 = (id *)&a10;
  id v13 = a9;
  if (v13)
  {
    id v14 = v13;
    while ([v14 conformsToProtocol:&unk_1F0E772B0])
    {
      v11 += [v14 count];
      [v12 addObject:v14];
      v15 = v39++;
      id v16 = *v15;

      id v14 = v16;
      if (!v16) {
        goto LABEL_5;
      }
    }
    v18 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v17 = 2;
    if (v11 > 2) {
      uint64_t v17 = v11;
    }
    v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1 << ((unint64_t)log2((double)(unint64_t)(v17 - 1)) + 1)];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v12;
    uint64_t v19 = [v14 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v30 = v10;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v14);
          }
          v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v32 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v18 addObject:*(void *)(*((void *)&v31 + 1) + 8 * j)];
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v26);
          }
        }
        uint64_t v20 = [v14 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v20);
      id v10 = v30;
    }
  }

  return v18;
}

+ (id)arrayWithIntersectionOf:()_DASAdditions and:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1BA99F610]();
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v14, (void)v17)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];

  return v15;
}

+ (id)arrayWithUnionOf:()_DASAdditions and:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1BA99F610]();
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (([v8 containsObject:v14] & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        if ((objc_msgSend(v8, "containsObject:", v20, (void)v23) & 1) == 0) {
          [v8 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  uint64_t v21 = (void *)[v8 copy];

  return v21;
}

+ (id)array:()_DASAdditions withItemsIn:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if ([v6 count])
    {
      id v8 = v5;
      id v9 = (void *)MEMORY[0x1BA99F610]();
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v7, "containsObject:", v16, (void)v20)) {
              [v10 addObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      uint64_t v17 = [v10 count];
      if (v17 != [v11 count])
      {
        uint64_t v18 = [v10 copy];

        id v11 = (id)v18;
      }
    }
    else
    {
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (uint64_t)anyItemsIntersectArray:()_DASAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(a1, "containsObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            uint64_t v11 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (double)mean
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = 0.0;
  if ([a1 count])
  {
    v3 = [a1 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = a1;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "doubleValue", (void)v12);
            double v2 = v2 + v10;
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      return v2 / (double)(unint64_t)[v5 count];
    }
  }
  return v2;
}

- (double)standardDeviationWithMean:()_DASAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
        double v7 = v7 + (v9 - a2) * (v9 - a2);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return sqrt(v7 / (double)(unint64_t)([v3 count] - 1));
}

- (double)standardDeviation
{
  if ((unint64_t)[a1 count] < 2) {
    return 0.0;
  }
  double v2 = [a1 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0.0;
  }
  [a1 mean];

  objc_msgSend(a1, "standardDeviationWithMean:");
  return result;
}

- (double)cooccurrencesWith:()_DASAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    double v14 = 1.79769313e308;
    goto LABEL_12;
  }
  uint64_t v6 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v8 = [v4 count];
  if (v8 != [a1 count]) {
    goto LABEL_11;
  }
  if ([a1 count])
  {
    unint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      long long v11 = [a1 objectAtIndexedSubscript:v9];
      long long v12 = [v4 objectAtIndexedSubscript:v9];
      int v13 = [v11 isEqual:v12];

      if (v13) {
        double v10 = v10 + 1.0;
      }
      ++v9;
    }
    while (v9 < [a1 count]);
  }
  else
  {
    double v10 = 0.0;
  }
  double v14 = v10 / (double)(unint64_t)[a1 count];
LABEL_12:

  return v14;
}

- (double)correlationWith:()_DASAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    double v14 = 1.79769313e308;
    goto LABEL_12;
  }
  uint64_t v6 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v8 = [v4 count];
  if (v8 != [a1 count]) {
    goto LABEL_11;
  }
  unint64_t v9 = [a1 count];
  if (v9 < 2) {
    goto LABEL_11;
  }
  unint64_t v10 = v9;
  [a1 mean];
  double v12 = v11;
  objc_msgSend(a1, "standardDeviationWithMean:");
  double v14 = 0.0;
  if (v13 != 0.0)
  {
    double v15 = v13;
    [v4 mean];
    double v17 = v16;
    objc_msgSend(v4, "standardDeviationWithMean:");
    if (v18 != 0.0)
    {
      double v19 = v18;
      for (uint64_t i = 0; i != v10; ++i)
      {
        long long v21 = [a1 objectAtIndexedSubscript:i];
        [v21 doubleValue];
        double v23 = v22 - v12;
        long long v24 = [v4 objectAtIndexedSubscript:i];
        [v24 doubleValue];
        double v14 = v14 + v23 * (v25 - v17);
      }
      double v14 = 1.0 / (double)(v10 - 1) * (v14 / (v15 * v19));
    }
  }
LABEL_12:

  return v14;
}

@end
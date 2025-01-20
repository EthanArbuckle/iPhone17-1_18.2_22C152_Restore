@interface NSArray(BRAdditions)
- (id)_br_minMaxWithMax:()BRAdditions comparator:;
- (id)br_copy_if:()BRAdditions;
- (id)br_firstItemOf:()BRAdditions;
- (id)br_transform:()BRAdditions keepNull:;
- (uint64_t)br_all_of:()BRAdditions;
- (uint64_t)br_all_of_type:()BRAdditions;
- (uint64_t)br_any_of:()BRAdditions;
- (uint64_t)br_count_if:()BRAdditions;
- (uint64_t)br_lastIndexOfObject:()BRAdditions;
- (uint64_t)br_maxWithComparator:()BRAdditions;
- (uint64_t)br_minWithComparator:()BRAdditions;
- (uint64_t)br_none_of:()BRAdditions;
- (uint64_t)br_transform:()BRAdditions;
@end

@implementation NSArray(BRAdditions)

- (id)br_transform:()BRAdditions keepNull:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = v6[2](v6, *(void *)(*((void *)&v19 + 1) + 8 * i), v11 + i);
        v15 = (void *)v14;
        if (!a4 || v14)
        {
          if (!v14) {
            goto LABEL_12;
          }
          v17 = v7;
          uint64_t v16 = (uint64_t)v15;
        }
        else
        {
          uint64_t v16 = objc_opt_class();
          v17 = v7;
        }
        objc_msgSend(v17, "addObject:", v16, (void)v19);
LABEL_12:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      v11 += i;
    }
    while (v10);
  }

  return v7;
}

- (uint64_t)br_transform:()BRAdditions
{
  return objc_msgSend(a1, "br_transform:keepNull:", a3, 0);
}

- (id)br_copy_if:()BRAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)br_count_if:()BRAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)br_all_of:()BRAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (uint64_t)br_any_of:()BRAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)br_none_of:()BRAdditions
{
  return objc_msgSend(a1, "br_any_of:") ^ 1;
}

- (uint64_t)br_all_of_type:()BRAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__NSArray_BRAdditions__br_all_of_type___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  return objc_msgSend(a1, "br_all_of:", v4);
}

- (uint64_t)br_maxWithComparator:()BRAdditions
{
  return objc_msgSend(a1, "_br_minMaxWithMax:comparator:", 1, a3);
}

- (uint64_t)br_minWithComparator:()BRAdditions
{
  return objc_msgSend(a1, "_br_minMaxWithMax:comparator:", 0, a3);
}

- (id)_br_minMaxWithMax:()BRAdditions comparator:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  if (a3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }
  long long v20 = 0uLL;
  long long v21 = 0uLL;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v11)
        {
          if (v6[2](v6, v11, *(void *)(*((void *)&v18 + 1) + 8 * i)) == v7) {
            uint64_t v15 = v11;
          }
          else {
            uint64_t v15 = v14;
          }
          id v16 = v15;

          id v11 = v16;
        }
        else
        {
          id v11 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)br_firstItemOf:()BRAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
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

- (uint64_t)br_lastIndexOfObject:()BRAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = [a1 count];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = objc_msgSend(a1, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        uint64_t v10 = 0;
        uint64_t v11 = v5 - v8;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * v10) isEqual:v4])
          {
            uint64_t v12 = ~v10 + v5;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v5 = v11;
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

@end
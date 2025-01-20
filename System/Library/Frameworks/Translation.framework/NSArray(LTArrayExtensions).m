@interface NSArray(LTArrayExtensions)
- (BOOL)lt_hasObjectPassingTest:()LTArrayExtensions;
- (id)_ltCompactMap:()LTArrayExtensions;
- (id)lt_filterUsingBlock:()LTArrayExtensions;
- (id)lt_firstObjectPassingTest:()LTArrayExtensions;
- (id)lt_suffixWithMaxLength:()LTArrayExtensions;
- (uint64_t)lt_ensureElementType:()LTArrayExtensions;
@end

@implementation NSArray(LTArrayExtensions)

- (id)_ltCompactMap:()LTArrayExtensions
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __44__NSArray_LTArrayExtensions___ltCompactMap___block_invoke;
  v13 = &unk_2651DCDB8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v6, v10, v11, v12, v13);

  return v8;
}

- (id)lt_filterUsingBlock:()LTArrayExtensions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

- (id)lt_firstObjectPassingTest:()LTArrayExtensions
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    if (v5 == 1)
    {
      id v6 = [a1 objectAtIndexedSubscript:0];
      if (v4[2](v4, v6)) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __56__NSArray_LTArrayExtensions__lt_firstObjectPassingTest___block_invoke;
      v11[3] = &unk_2651DCDE0;
      v12 = v4;
      uint64_t v9 = [a1 indexOfObjectPassingTest:v11];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [a1 objectAtIndexedSubscript:v9];
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)lt_hasObjectPassingTest:()LTArrayExtensions
{
  v1 = objc_msgSend(a1, "lt_firstObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)lt_suffixWithMaxLength:()LTArrayExtensions
{
  unint64_t v5 = [a1 count];
  uint64_t v6 = v5 - a3;
  if (v5 <= a3)
  {
    uint64_t v7 = objc_msgSend(a1, "copy", v6);
  }
  else
  {
    uint64_t v7 = objc_msgSend(a1, "subarrayWithRange:", v6, a3);
  }

  return v7;
}

- (uint64_t)lt_ensureElementType:()LTArrayExtensions
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__NSArray_LTArrayExtensions__lt_ensureElementType___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  return objc_msgSend(a1, "lt_hasObjectPassingTest:", v4) ^ 1;
}

@end
@interface NSArray(FuzzyMatch)
- (uint64_t)atx_INCustomObjectComparator:()FuzzyMatch object2:;
- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch;
@end

@implementation NSArray(FuzzyMatch)

- (uint64_t)atx_INCustomObjectComparator:()FuzzyMatch object2:
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v6;
    v8 = [v5 identifier];
    v9 = [v7 identifier];

    uint64_t v10 = [v8 compare:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = -1;
    }
  }

  return v10;
}

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a1 == v4)
    {
      uint64_t v12 = 1;
    }
    else
    {
      id v5 = v4;
      uint64_t v6 = [a1 count];
      if (v6 == [v5 count])
      {
        id v7 = (void *)[a1 mutableCopy];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __40__NSArray_FuzzyMatch__atx_isFuzzyMatch___block_invoke;
        v15[3] = &unk_1E68A3700;
        v15[4] = a1;
        [v7 sortUsingComparator:v15];
        v8 = (void *)[v5 mutableCopy];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __40__NSArray_FuzzyMatch__atx_isFuzzyMatch___block_invoke_2;
        v14[3] = &unk_1E68A3700;
        v14[4] = a1;
        [v8 sortUsingComparator:v14];
        if ([v7 count])
        {
          unint64_t v9 = 0;
          do
          {
            uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
            v11 = [v8 objectAtIndexedSubscript:v9];
            uint64_t v12 = objc_msgSend(v10, "atx_isFuzzyMatch:", v11);

            if ((v12 & 1) == 0) {
              break;
            }
            ++v9;
          }
          while (v9 < [v7 count]);
        }
        else
        {
          uint64_t v12 = 1;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end
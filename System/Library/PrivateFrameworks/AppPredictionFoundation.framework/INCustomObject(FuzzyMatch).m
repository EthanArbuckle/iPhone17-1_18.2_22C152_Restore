@interface INCustomObject(FuzzyMatch)
- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch;
@end

@implementation INCustomObject(FuzzyMatch)

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [a1 identifier];
    v7 = [v5 identifier];
    if (v6 == v7)
    {
      uint64_t v10 = 1;
    }
    else
    {
      v8 = [a1 identifier];
      v9 = [v5 identifier];
      uint64_t v10 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end
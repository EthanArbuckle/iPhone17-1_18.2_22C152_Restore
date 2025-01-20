@interface CLPlacemark(FuzzyMatch)
- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch;
@end

@implementation CLPlacemark(FuzzyMatch)

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4 = a3;
  if ([a1 isEqual:v4])
  {
    uint64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      v7 = [a1 location];
      v8 = [v6 location];
      if (v7 == v8)
      {
        uint64_t v5 = 1;
      }
      else
      {
        v9 = [a1 location];
        v10 = [v6 location];
        uint64_t v5 = objc_msgSend(v9, "atx_isFuzzyMatch:", v10);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

@end
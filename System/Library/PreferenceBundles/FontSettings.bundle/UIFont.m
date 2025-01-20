@interface UIFont
+ (id)closestToRegular:(id)a3;
- (double)weight;
- (id)localizedStyleName;
- (int64_t)compareWeight:(id)a3;
@end

@implementation UIFont

- (id)localizedStyleName
{
  v2 = (__CFString *)CTFontCopyLocalizedName((CTFontRef)self, kCTFontStyleNameKey, 0);

  return v2;
}

- (int64_t)compareWeight:(id)a3
{
  id v4 = a3;
  [(UIFont *)self weight];
  double v6 = v5;
  [v4 weight];
  if (v6 < v7) {
    goto LABEL_4;
  }
  if (v6 > v7)
  {
LABEL_7:
    int64_t v10 = 1;
    goto LABEL_8;
  }
  CTFontSymbolicTraits SymbolicTraits = CTFontGetSymbolicTraits((CTFontRef)self);
  CTFontSymbolicTraits v9 = CTFontGetSymbolicTraits((CTFontRef)v4);
  if (SymbolicTraits >= v9)
  {
    if (SymbolicTraits <= v9)
    {
      v12 = [(UIFont *)self localizedStyleName];
      v13 = [v4 localizedStyleName];
      int64_t v10 = (int64_t)[v12 localizedStandardCompare:v13];

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  int64_t v10 = -1;
LABEL_8:

  return v10;
}

- (double)weight
{
  CFDictionaryRef v2 = CTFontCopyTraits((CTFontRef)self);
  v3 = [(__CFDictionary *)v2 objectForKeyedSubscript:kCTFontWeightTrait];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

+ (id)closestToRegular:(id)a3
{
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    double v6 = 0;
    uint64_t v7 = *(void *)v20;
    unint64_t v8 = -1;
    double v9 = INFINITY;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v11 weight];
        double v13 = fabs(v12);
        CTFontSymbolicTraits SymbolicTraits = CTFontGetSymbolicTraits((CTFontRef)v11);
        unint64_t v15 = SymbolicTraits;
        if (v13 >= v9)
        {
          BOOL v16 = v13 == v9 && v8 > SymbolicTraits;
          double v13 = v9;
          if (!v16) {
            continue;
          }
        }
        id v17 = v11;

        double v9 = v13;
        unint64_t v8 = v15;
        double v6 = v17;
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

@end
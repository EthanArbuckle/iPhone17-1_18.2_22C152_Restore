@interface NSHTTPURLResponse(GKCachingAdditions)
- (double)_maxAge;
@end

@implementation NSHTTPURLResponse(GKCachingAdditions)

- (double)_maxAge
{
  v1 = [a1 allHeaderFields];
  v2 = [v1 objectForKey:@"Cache-Control"];

  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v20 = v2;
    v4 = [v2 componentsSeparatedByString:@","];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      double v8 = 10.0;
      do
      {
        v9 = [v4 objectAtIndex:v7];
        v10 = [v9 stringByTrimmingCharactersInSet:v3];

        v11 = [v10 componentsSeparatedByString:@"="];
        if ([v11 count] == 2)
        {
          v12 = [v11 objectAtIndex:0];
          int v13 = [v12 hasPrefix:@"max-age"];

          if (v13)
          {
            v14 = [v11 objectAtIndex:1];
            [v14 doubleValue];
            double v8 = v15;
          }
        }

        ++v7;
      }
      while (v6 != v7);
    }
    else
    {
      double v8 = 10.0;
    }

    v2 = v20;
  }
  else
  {
    double v8 = 10.0;
  }
  v16 = +[GKPreferences shared];
  double v17 = fmin(v8, 86400.0);
  [v16 minimumCacheTTL];
  if (v17 < v18) {
    double v17 = v18;
  }

  return v17;
}

@end
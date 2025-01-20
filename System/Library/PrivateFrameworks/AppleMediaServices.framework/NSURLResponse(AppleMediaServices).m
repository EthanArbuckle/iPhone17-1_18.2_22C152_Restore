@interface NSURLResponse(AppleMediaServices)
- (double)ams_expirationInterval;
- (id)ams_allHeaderFields;
- (id)ams_valueForHTTPHeaderField:()AppleMediaServices;
- (uint64_t)_getCacheControlMaxAge:()AppleMediaServices;
- (uint64_t)ams_statusCode;
@end

@implementation NSURLResponse(AppleMediaServices)

- (id)ams_valueForHTTPHeaderField:()AppleMediaServices
{
  id v4 = a1;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  v7 = [v6 valueForHTTPHeaderField:v5];

  return v7;
}

- (uint64_t)ams_statusCode
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  uint64_t v3 = [v2 statusCode];
  return v3;
}

- (id)ams_allHeaderFields
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  uint64_t v3 = [v2 allHeaderFields];

  return v3;
}

- (double)ams_expirationInterval
{
  double v8 = -1.0;
  if (([a1 _getCacheControlMaxAge:&v8] & 1) == 0)
  {
    id v2 = objc_msgSend(a1, "ams_valueForHTTPHeaderField:", @"Expires");
    double v3 = -1.0;
    if (v2)
    {
      id v4 = [MEMORY[0x1E4F1C9C8] dateWithNaturalLanguageString:v2];
      if (v4)
      {
        id v5 = v4;
        [v4 timeIntervalSinceNow];
        double v3 = v6;
      }
    }
    double v8 = v3;
  }
  return v8;
}

- (uint64_t)_getCacheControlMaxAge:()AppleMediaServices
{
  id v4 = objc_msgSend(a1, "ams_valueForHTTPHeaderField:", @"Cache-Control");
  if (!v4)
  {
    uint64_t v19 = 0;
    uint64_t v11 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v22 = a3;
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v21 = v4;
  double v6 = [v4 componentsSeparatedByString:@","];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    do
    {
      v12 = [v6 objectAtIndex:v10];
      v13 = [v12 stringByTrimmingCharactersInSet:v5];

      v14 = [v13 componentsSeparatedByString:@"="];
      if ([v14 count] == 2)
      {
        v15 = [v14 objectAtIndex:0];
        int v16 = [v15 hasPrefix:@"max-age"];

        if (v16)
        {
          char v9 = 1;
          v17 = [v14 objectAtIndex:1];
          [v17 doubleValue];
          uint64_t v11 = v18;
        }
      }

      ++v10;
    }
    while (v8 != v10);
  }
  else
  {
    char v9 = 0;
    uint64_t v11 = 0;
  }

  uint64_t v19 = v9 & 1;
  id v4 = v21;
  a3 = v22;
  if (v22) {
LABEL_13:
  }
    *a3 = v11;
LABEL_14:

  return v19;
}

@end
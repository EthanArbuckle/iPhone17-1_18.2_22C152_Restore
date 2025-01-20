@interface NSURL(ClipServicesExtras)
+ (id)cps_preIngestedURLWithBundleIdentifier:()ClipServicesExtras;
+ (id)cps_resolvedURLWithStoreIconURLString:()ClipServicesExtras iconSize:;
- (BOOL)cps_isFileURL;
- (BOOL)cps_isHTTPFamilyURL;
- (id)cps_domain;
- (id)cps_fallbackBundleIdentifier;
@end

@implementation NSURL(ClipServicesExtras)

+ (id)cps_resolvedURLWithStoreIconURLString:()ClipServicesExtras iconSize:
{
  v19[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v18[0] = @"{w}";
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
    v19[0] = v6;
    v18[1] = @"{h}";
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
    v19[1] = v7;
    v18[2] = @"{f}";
    v18[3] = @"{c}";
    v19[2] = @"png";
    v19[3] = @"bb";
    v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    id v17 = (id)[v5 copy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__NSURL_ClipServicesExtras__cps_resolvedURLWithStoreIconURLString_iconSize___block_invoke;
    v11[3] = &unk_26424EBA8;
    v11[4] = &v12;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
    v9 = [NSURL URLWithString:v13[5]];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)cps_preIngestedURLWithBundleIdentifier:()ClipServicesExtras
{
  v3 = NSURL;
  v4 = [NSString stringWithFormat:@"%@/%@", @"https://pre-ingested.apple.com/", a3];
  id v5 = [v3 URLWithString:v4];

  return v5;
}

- (BOOL)cps_isHTTPFamilyURL
{
  v2 = [a1 scheme];
  if ([v2 caseInsensitiveCompare:@"https"])
  {
    v3 = [a1 scheme];
    BOOL v4 = [v3 caseInsensitiveCompare:@"http"] == 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)cps_isFileURL
{
  v1 = [a1 scheme];
  BOOL v2 = [v1 caseInsensitiveCompare:@"file"] == 0;

  return v2;
}

- (id)cps_domain
{
  v1 = [MEMORY[0x263F08BA0] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  BOOL v2 = [v1 host];
  v3 = v2;
  if (v2)
  {
    if ([v2 rangeOfString:@"www." options:9] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 substringFromIndex:4];
    }
    v6 = v4;
    if ([v4 length])
    {
      id v5 = [v6 lowercaseString];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)cps_fallbackBundleIdentifier
{
  BOOL v2 = [MEMORY[0x263F08BA0] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  v3 = [v2 host];
  id v4 = [v3 lowercaseString];
  int v5 = [v4 isEqualToString:@"appclip.apple.com"];

  if (v5
    && ([a1 lastPathComponent],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 caseInsensitiveCompare:@"id"],
        v6,
        !v7))
  {
    v10 = [v2 queryItems];
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 objectAtIndexedSubscript:0];
      v13 = [v12 name];
      uint64_t v14 = [v13 caseInsensitiveCompare:@"p"];

      id v8 = 0;
      if (!v14)
      {
        v15 = [v12 value];
        v16 = [v15 stringByRemovingPercentEncoding];

        id v17 = [v16 componentsSeparatedByString:@"."];
        if ((unint64_t)[v17 count] >= 3)
        {
          v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          if ([v16 rangeOfCharacterFromSet:v18] == 0x7FFFFFFFFFFFFFFFLL) {
            id v8 = v16;
          }
          else {
            id v8 = 0;
          }
        }
        else
        {
          id v8 = 0;
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end
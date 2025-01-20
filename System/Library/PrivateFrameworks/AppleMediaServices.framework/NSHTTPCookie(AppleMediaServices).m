@interface NSHTTPCookie(AppleMediaServices)
+ (id)ams_cookieByMarkingCookieAsDeleted:()AppleMediaServices;
- (BOOL)ams_isExpired;
- (id)hashedDescription;
- (uint64_t)_domainMatchesURL:()AppleMediaServices;
- (uint64_t)_httpOnlyMatchesURL:()AppleMediaServices;
- (uint64_t)_pathMatchesURL:()AppleMediaServices;
- (uint64_t)_secureOnlyMatchesURL:()AppleMediaServices;
- (uint64_t)ams_isCookieValidForBag;
- (uint64_t)ams_isDeleted;
- (uint64_t)ams_isEqualToCookie:()AppleMediaServices;
- (uint64_t)ams_isEquivalent:()AppleMediaServices;
- (uint64_t)ams_matchesURL:()AppleMediaServices;
- (uint64_t)ams_shouldReplaceCookie:()AppleMediaServices;
@end

@implementation NSHTTPCookie(AppleMediaServices)

- (uint64_t)ams_matchesURL:()AppleMediaServices
{
  id v4 = a3;
  if ([a1 _domainMatchesURL:v4]
    && [a1 _pathMatchesURL:v4]
    && [a1 _secureOnlyMatchesURL:v4])
  {
    uint64_t v5 = [a1 _httpOnlyMatchesURL:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)ams_isExpired
{
  v2 = [a1 expiresDate];
  if (v2)
  {
    v3 = [a1 expiresDate];
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    BOOL v5 = [v3 compare:v4] != 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)ams_isDeleted
{
  v1 = [a1 expiresDate];
  v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v3 = [v1 isEqualToDate:v2];

  return v3;
}

- (uint64_t)_secureOnlyMatchesURL:()AppleMediaServices
{
  id v4 = a3;
  if ([a1 isSecure]) {
    uint64_t v5 = objc_msgSend(v4, "ams_isSecure");
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

- (uint64_t)_httpOnlyMatchesURL:()AppleMediaServices
{
  id v4 = a3;
  if ([a1 isHTTPOnly]) {
    uint64_t v5 = objc_msgSend(v4, "ams_isHTTP");
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

- (uint64_t)_domainMatchesURL:()AppleMediaServices
{
  id v4 = [a3 host];
  uint64_t v5 = v4;
  if (v4 && ([v4 hasPrefix:@"."] & 1) == 0)
  {
    uint64_t v6 = [@"." stringByAppendingString:v5];

    uint64_t v5 = (void *)v6;
  }
  v7 = [v5 lowercaseString];
  v8 = [a1 domain];
  v9 = [v8 lowercaseString];
  uint64_t v10 = [v7 hasSuffix:v9];

  return v10;
}

- (uint64_t)ams_isCookieValidForBag
{
  v2 = [a1 domain];
  int v3 = [v2 containsString:@".apple.com"];

  if (!v3) {
    return 0;
  }
  id v4 = [a1 name];
  if ([v4 isEqualToString:@"itspod"])
  {
    uint64_t v5 = [a1 value];
    int v6 = [v5 isEqualToString:@"100"];

    return v6 ^ 1u;
  }
  else
  {

    return 1;
  }
}

- (uint64_t)_pathMatchesURL:()AppleMediaServices
{
  uint64_t v5 = [a3 path];
  if (![(__CFString *)v5 length])
  {

    uint64_t v5 = @"/";
  }
  int v6 = [a1 path];
  if (([v6 isEqualToString:v5] & 1) == 0)
  {
    v8 = [a1 path];
    int v9 = [(__CFString *)v5 hasPrefix:v8];
    if (v9
      && ([a1 path],
          int v3 = objc_claimAutoreleasedReturnValue(),
          ([v3 hasSuffix:@"/"] & 1) != 0))
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v10 = [a1 path];
      if ([(__CFString *)v5 hasPrefix:v10])
      {
        v11 = [a1 path];
        v12 = -[__CFString substringFromIndex:](v5, "substringFromIndex:", [v11 length]);
        uint64_t v7 = [v12 hasPrefix:@"/"];

        if ((v9 & 1) == 0) {
          goto LABEL_13;
        }
      }
      else
      {

        uint64_t v7 = 0;
        if (!v9)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
    }

    goto LABEL_13;
  }
  uint64_t v7 = 1;
LABEL_14:

  return v7;
}

+ (id)ams_cookieByMarkingCookieAsDeleted:()AppleMediaServices
{
  int v3 = [a3 properties];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F18C08]];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F18C18]];

  int v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperties:v4];
  return v6;
}

- (uint64_t)ams_isEqualToCookie:()AppleMediaServices
{
  id v5 = a3;
  int v6 = [a1 domain];
  uint64_t v7 = [v5 domain];
  if ([v6 isEqualToString:v7])
  {
    v8 = [a1 path];
    int v9 = [v5 path];
    if (![v8 isEqualToString:v9])
    {
      uint64_t v12 = 0;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v10 = [a1 portList];
    if (v10 || ([v5 portList], (v58 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = [a1 portList];
      int v3 = [v5 portList];
      if (![v11 isEqual:v3])
      {
        uint64_t v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v57 = v11;
      int v59 = 1;
    }
    else
    {
      v58 = 0;
      int v59 = 0;
    }
    uint64_t v13 = [a1 name];
    uint64_t v14 = [v5 name];
    v60 = (void *)v13;
    v15 = (void *)v13;
    v16 = (void *)v14;
    if (![v15 isEqualToString:v14])
    {
      uint64_t v12 = 0;
      goto LABEL_20;
    }
    uint64_t v17 = [a1 value];
    uint64_t v18 = [v5 value];
    v56 = (void *)v17;
    v19 = (void *)v17;
    v20 = (void *)v18;
    if (![v19 isEqualToString:v18]
      || (v55 = v16, uint64_t v21 = [a1 version], v22 = v21 == objc_msgSend(v5, "version"), v16 = v55, !v22))
    {

      uint64_t v12 = 0;
      if ((v59 & 1) == 0)
      {
LABEL_25:
        if (!v10) {

        }
        goto LABEL_28;
      }
      goto LABEL_23;
    }
    v53 = v3;
    uint64_t v54 = [a1 expiresDate];
    if (v54 || ([v5 expiresDate], (v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v23 = [a1 expiresDate];
      int v3 = [v5 expiresDate];
      v52 = v23;
      if (([v23 isEqual:v3] & 1) == 0)
      {

        v25 = (void *)v54;
        if (!v54)
        {

          v25 = 0;
        }

        uint64_t v12 = 0;
        int v3 = v53;
        if ((v59 & 1) == 0) {
          goto LABEL_25;
        }
LABEL_23:
        v11 = v57;
        goto LABEL_24;
      }
      int v50 = 1;
    }
    else
    {
      v49 = 0;
      int v50 = 0;
    }
    v51 = v20;
    int v26 = [a1 isSessionOnly];
    if (v26 != [v5 isSessionOnly]
      || (int v27 = [a1 isHTTPOnly], v27 != objc_msgSend(v5, "isHTTPOnly"))
      || (int v28 = [a1 isSecure], v28 != objc_msgSend(v5, "isSecure")))
    {
      uint64_t v12 = 0;
      v29 = v58;
      v16 = v55;
      if (v50)
      {
LABEL_39:
        v58 = v29;

LABEL_65:
        int v3 = v53;
        v36 = (void *)v54;
        if (!v54)
        {

          v36 = 0;
        }

LABEL_20:
        if (!v59) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
LABEL_64:
      v58 = v29;
      goto LABEL_65;
    }
    [a1 sameSitePolicy];
    uint64_t v48 = v16 = v55;
    if (v48 || ([v5 sameSitePolicy], (v41 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = [a1 sameSitePolicy];
      v46 = [v5 sameSitePolicy];
      v47 = v30;
      if (![v30 isEqual:v46])
      {
        uint64_t v12 = 0;
        goto LABEL_60;
      }
      int v44 = 1;
    }
    else
    {
      v41 = 0;
      int v44 = 0;
    }
    uint64_t v45 = [a1 comment];
    if (v45 || ([v5 comment], (v38 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31 = [a1 comment];
      v42 = [v5 comment];
      v43 = v31;
      if (![v31 isEqual:v42])
      {
        uint64_t v12 = 0;
        goto LABEL_56;
      }
      char v40 = 1;
    }
    else
    {
      v38 = 0;
      char v40 = 0;
    }
    v39 = [a1 commentURL];
    if (v39 || ([v5 commentURL], (v37 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v32 = [a1 commentURL];
      v33 = [v5 commentURL];
      uint64_t v12 = [v32 isEqual:v33];

      if (v39)
      {

        v16 = v55;
        if ((v40 & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
    }
    else
    {
      v37 = 0;
      uint64_t v12 = 1;
    }
    v16 = v55;

    if ((v40 & 1) == 0)
    {
LABEL_57:
      v34 = (void *)v45;
      if (!v45)
      {

        v34 = 0;
      }

      if (!v44)
      {
LABEL_61:
        v35 = (void *)v48;
        if (!v48)
        {

          v35 = 0;
        }

        v29 = v58;
        if (v50) {
          goto LABEL_39;
        }
        goto LABEL_64;
      }
LABEL_60:

      goto LABEL_61;
    }
LABEL_56:

    goto LABEL_57;
  }
  uint64_t v12 = 0;
LABEL_29:

  return v12;
}

- (uint64_t)ams_isEquivalent:()AppleMediaServices
{
  id v4 = a3;
  id v5 = [a1 domain];
  int v6 = [v4 domain];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [a1 name];
    v8 = [v4 name];
    if ([v7 isEqualToString:v8])
    {
      int v9 = [a1 path];
      uint64_t v10 = [v4 path];
      uint64_t v11 = [v9 isEqualToString:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)ams_shouldReplaceCookie:()AppleMediaServices
{
  id v4 = a3;
  if (!objc_msgSend(a1, "ams_isEquivalent:", v4))
  {
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [a1 expiresDate];
  if (!v5) {
    goto LABEL_6;
  }
  int v6 = (void *)v5;
  uint64_t v7 = [v4 expiresDate];

  if (!v7
    || ([a1 expiresDate],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 expiresDate],
        int v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v8 compare:v9],
        v9,
        v8,
        (unint64_t)(v10 + 1) >= 3))
  {
LABEL_6:
    if ((objc_msgSend(a1, "ams_isExpired") & 1) == 0)
    {
      uint64_t v11 = objc_msgSend(v4, "ams_isExpired");
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v11 = (((_BYTE)v10 + 1) & 7) == 2;
LABEL_9:

  return v11;
}

- (id)hashedDescription
{
  v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<NSHTTPCookie: %p {", a1);
  int v3 = [a1 name];
  [v2 appendFormat:@"\n  name = %@,", v3];

  id v4 = [a1 domain];
  [v2 appendFormat:@"\n  domain = %@,", v4];

  uint64_t v5 = [a1 path];
  [v2 appendFormat:@"\n  path = %@,", v5];

  int v6 = [a1 expiresDate];
  [v2 appendFormat:@"\n  expires = %@,", v6];

  int v7 = [a1 isSecure];
  v8 = @"false";
  if (v7) {
    v8 = @"true";
  }
  [v2 appendFormat:@"\n  isSecure = %@,", v8];
  int v9 = [a1 value];
  uint64_t v10 = AMSHashIfNeeded(v9);
  [v2 appendFormat:@"\n  value = %@,", v10];

  [v2 appendString:@"\n}>"];
  return v2;
}

@end
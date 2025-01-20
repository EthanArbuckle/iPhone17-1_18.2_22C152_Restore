@interface NSURL(EmailFoundationAdditions)
+ (id)ef_accountAllowedCharacterSet;
+ (id)ef_defaultAllowedCharacterSet;
+ (id)ef_gmailAuthAllowedCharacterSet;
+ (id)ef_messageAllowedCharacterSet;
+ (id)ef_urlWithString:()EmailFoundationAdditions;
+ (id)ef_yahooAuthAllowedCharacterSet;
- (BOOL)ef_isHTTPOrHTTPSURL;
- (id)ef_URLByAppendingTimestampedPathComponent:()EmailFoundationAdditions withExtension:;
- (id)ef_caseNormalizedURL;
- (id)ef_highLevelDomain;
- (id)ef_hostNilForEmpty;
- (id)ef_urlByAddingPrefixToScheme:()EmailFoundationAdditions;
- (id)ef_urlByAddingSchemeIfNeeded;
- (id)ef_urlByRemovingPrefixFromScheme:()EmailFoundationAdditions;
- (id)ef_urlByReplacingSchemeWithScheme:()EmailFoundationAdditions;
- (uint64_t)ef_hasHost:()EmailFoundationAdditions;
- (uint64_t)ef_hasScheme:()EmailFoundationAdditions;
- (uint64_t)ef_isEligibleForRichLink;
@end

@implementation NSURL(EmailFoundationAdditions)

- (id)ef_hostNilForEmpty
{
  v1 = [a1 host];
  if ([v1 length]) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

+ (id)ef_urlWithString:()EmailFoundationAdditions
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
  if (!v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet");
    v6 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v5];

    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
  }

  return v4;
}

- (id)ef_caseNormalizedURL
{
  v1 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  v2 = [v1 scheme];
  id v3 = [v2 lowercaseString];
  [v1 setScheme:v3];

  v4 = [v1 host];
  v5 = [v4 lowercaseString];
  [v1 setHost:v5];

  v6 = [v1 URL];

  return v6;
}

- (uint64_t)ef_hasScheme:()EmailFoundationAdditions
{
  id v4 = a3;
  v5 = [a1 scheme];
  uint64_t v6 = objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", v4);

  return v6;
}

- (uint64_t)ef_hasHost:()EmailFoundationAdditions
{
  id v4 = a3;
  v5 = [a1 host];
  uint64_t v6 = objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", v4);

  return v6;
}

- (BOOL)ef_isHTTPOrHTTPSURL
{
  v1 = [a1 scheme];
  v2 = v1;
  if (v1)
  {
    if ([v1 caseInsensitiveCompare:@"http"]) {
      BOOL v3 = [v2 caseInsensitiveCompare:@"https"] == 0;
    }
    else {
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)ef_isEligibleForRichLink
{
  if (objc_msgSend(a1, "ef_isHTTPOrHTTPSURL")) {
    return 1;
  }
  BOOL v3 = [a1 scheme];
  BOOL v2 = [v3 length] == 0;

  return v2;
}

- (id)ef_urlByAddingSchemeIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [a1 absoluteString];
  if ([v2 length] && !objc_msgSend(a1, "ef_isHTTPOrHTTPSURL"))
  {
    id v4 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:32 error:0];
    objc_msgSend(v4, "matchesInString:options:range:", v2, 1, 0, objc_msgSend(v2, "length"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "URL", (void)v12);

          if (v10)
          {
            id v3 = [v9 URL];

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v3 = a1;
LABEL_14:
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

- (id)ef_highLevelDomain
{
  v1 = objc_msgSend(a1, "ef_urlByAddingSchemeIfNeeded");
  BOOL v2 = objc_msgSend(v1, "_lp_highLevelDomain");

  return v2;
}

- (id)ef_urlByReplacingSchemeWithScheme:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  [v5 setScheme:v4];
  uint64_t v6 = [v5 URL];

  return v6;
}

- (id)ef_urlByAddingPrefixToScheme:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  uint64_t v6 = [v5 scheme];
  uint64_t v7 = [v4 stringByAppendingString:v6];
  [v5 setScheme:v7];

  v8 = [v5 URL];

  return v8;
}

- (id)ef_urlByRemovingPrefixFromScheme:()EmailFoundationAdditions
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  uint64_t v6 = [v5 scheme];
  uint64_t v7 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v4, "length"));
  [v5 setScheme:v7];

  v8 = [v5 URL];

  return v8;
}

- (id)ef_URLByAppendingTimestampedPathComponent:()EmailFoundationAdditions withExtension:
{
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  v9 = objc_msgSend(MEMORY[0x1E4F28C10], "ef_isoDateFormatter");
  v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [v9 stringFromDate:v10];
  long long v12 = [v8 stringWithFormat:@"%@_%@", v6, v11];

  long long v13 = [a1 URLByAppendingPathComponent:v12];
  long long v14 = [v13 URLByAppendingPathExtension:v7];

  return v14;
}

+ (id)ef_defaultAllowedCharacterSet
{
  v0 = ;
  v1 = [v0 invertedSet];

  return v1;
}

+ (id)ef_accountAllowedCharacterSet
{
  v0 = ;
  v1 = [v0 invertedSet];

  return v1;
}

+ (id)ef_messageAllowedCharacterSet
{
  v0 = ;
  v1 = [v0 invertedSet];

  return v1;
}

+ (id)ef_gmailAuthAllowedCharacterSet
{
  v0 = ;
  v1 = [v0 invertedSet];

  return v1;
}

+ (id)ef_yahooAuthAllowedCharacterSet
{
  v0 = ;
  v1 = [v0 invertedSet];

  return v1;
}

@end
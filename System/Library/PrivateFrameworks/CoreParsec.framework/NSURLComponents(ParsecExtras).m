@interface NSURLComponents(ParsecExtras)
+ (id)parsec_componentsWithString:()ParsecExtras;
+ (id)parsec_componentsWithURL:()ParsecExtras resolvingAgainstBaseURL:;
- (id)parsec_componentsAfterRemovingSubdomains;
- (id)parsec_componentsForEmbeddedAMPURLFromRange:()ParsecExtras;
- (id)parsec_normalizedURLStringWithOptions:()ParsecExtras;
- (uint64_t)embeddedAMPURLRange;
- (uint64_t)parsec_normalizedURLStringForDeepLinkIngest;
- (uint64_t)parsec_normalizedURLStringForDeepLinkWhitelist;
- (uint64_t)parsec_normalizedURLStringForLDAModel;
- (uint64_t)parsec_normalizedURLStringForTLDFeatures;
@end

@implementation NSURLComponents(ParsecExtras)

- (id)parsec_componentsAfterRemovingSubdomains
{
  v2 = [a1 URL];
  v3 = [v2 absoluteString];
  v4 = objc_msgSend(v3, "parsec_readableURLStringAfterRemovingSubdomains");

  if (v4) {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v4];
  }
  else {
    id v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (id)parsec_componentsForEmbeddedAMPURLFromRange:()ParsecExtras
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_3;
  }
  uint64_t v6 = [a1 rangeOfPath];
  v7 = [a1 URL];
  v8 = [v7 absoluteString];
  uint64_t v9 = [v8 length];
  uint64_t v10 = v6 + a4;

  if (v9 == v10)
  {
LABEL_3:
    v11 = 0;
  }
  else
  {
    v12 = NSString;
    uint64_t v13 = [a1 scheme];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"http";
    }
    v16 = [a1 URL];
    v17 = [v16 absoluteString];
    v18 = [v17 substringFromIndex:v10];
    v19 = [v12 stringWithFormat:@"%@://%@", v15, v18];

    v11 = [MEMORY[0x1E4F29088] componentsWithString:v19];
  }

  return v11;
}

- (uint64_t)embeddedAMPURLRange
{
  v1 = [a1 path];
  uint64_t v2 = [v1 rangeOfString:@"^/?amp/(\\w/)?" options:1024];

  return v2;
}

- (uint64_t)parsec_normalizedURLStringForDeepLinkWhitelist
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 15);
}

- (uint64_t)parsec_normalizedURLStringForDeepLinkIngest
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 3);
}

- (uint64_t)parsec_normalizedURLStringForLDAModel
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 11);
}

- (uint64_t)parsec_normalizedURLStringForTLDFeatures
{
  return objc_msgSend(a1, "parsec_normalizedURLStringWithOptions:", 7);
}

- (id)parsec_normalizedURLStringWithOptions:()ParsecExtras
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v6 = [a1 URL];
    v8 = [v6 absoluteString];
    goto LABEL_29;
  }
  char v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v6 = v5;
  if (v4) {
    [v5 addObject:@"www."];
  }
  if ((v4 & 2) != 0) {
    [v6 addObjectsFromArray:&unk_1EED830F0];
  }
  v7 = [a1 string];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v7, "length"));
  uint64_t v9 = [a1 rangeOfHost];
  if (v10)
  {
    v30 = v7;
    v11 = objc_msgSend(v7, "substringWithRange:", v9, v10);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [v11 rangeOfString:*(void *)(*((void *)&v31 + 1) + 8 * i) options:9];
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v19 = [v11 substringFromIndex:v17 + v18];

            v11 = (void *)v19;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    [v8 appendString:v11];
    v7 = v30;
  }
  uint64_t v20 = [a1 rangeOfPath];
  if ((v4 & 4) == 0 && v21)
  {
    v22 = objc_msgSend(v7, "substringWithRange:", v20, v21);
    id v23 = v22;
    if ((v4 & 8) != 0)
    {
      id v23 = v22;
      v24 = [v23 lastPathComponent];
      if ([v24 containsString:@"."])
      {

LABEL_24:
        uint64_t v26 = [v23 stringByDeletingLastPathComponent];

        id v23 = (id)v26;
        goto LABEL_25;
      }
      int v25 = objc_msgSend(v23, "parsec_hasCaseInsensitiveSuffix:", @"html");

      if (v25) {
        goto LABEL_24;
      }
    }
LABEL_25:
    uint64_t v27 = [v23 rangeOfString:@"/" options:13];
    if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v28 = [v23 substringToIndex:v27];

      id v23 = (id)v28;
    }
    [v8 appendString:v23];
  }
LABEL_29:

  return v8;
}

+ (id)parsec_componentsWithString:()ParsecExtras
{
  v0 = objc_msgSend(MEMORY[0x1E4F29088], "componentsWithString:");
  fixQueryComponentEncoding(v0);
  objc_claimAutoreleasedReturnValue();

  return v0;
}

+ (id)parsec_componentsWithURL:()ParsecExtras resolvingAgainstBaseURL:
{
  v0 = objc_msgSend(MEMORY[0x1E4F29088], "componentsWithURL:resolvingAgainstBaseURL:");
  fixQueryComponentEncoding(v0);
  objc_claimAutoreleasedReturnValue();

  return v0;
}

@end
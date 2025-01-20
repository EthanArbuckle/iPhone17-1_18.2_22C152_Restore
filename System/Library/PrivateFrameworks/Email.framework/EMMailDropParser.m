@interface EMMailDropParser
+ (BOOL)_domainIsAllowed:(id)a3;
+ (BOOL)urlIsValid:(id)a3;
+ (id)_parseURLQuery:(id)a3;
+ (id)allowedMailDropDownloadDomains;
+ (id)parseExpiration:(double)a3;
+ (id)parseHeaderValue:(id)a3 forField:(id)a4;
+ (void)_parseDirectURL:(id)a3 intoMetadata:(id)a4;
+ (void)_parseWrappedURL:(id)a3 intoMetadata:(id)a4;
+ (void)parseURL:(id)a3 intoMetadata:(id)a4;
@end

@implementation EMMailDropParser

+ (id)allowedMailDropDownloadDomains
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v3 = [v2 objectForKey:@"allowedDownloadDomains"];

  if (![v3 count])
  {

    v3 = &unk_1F1A61FF8;
  }
  return v3;
}

+ (id)parseExpiration:(double)a3
{
  if (a3 >= 9999999.0)
  {
    if (a3 > 1.0e10) {
      a3 = a3 / 1000.0;
    }
  }
  else
  {
    a3 = a3 * 1000.0;
  }
  if (a3 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  }
  return v3;
}

+ (id)parseHeaderValue:(id)a3 forField:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v26 = a4;
  id v30 = +[EMMailDropMetadata mailDropMetadata];
  if ([v26 isEqualToString:*MEMORY[0x1E4F606C0]])
  {
    [v30 setMimeType:@"application/zip"];
    uint64_t v6 = [v30 flags] | 2;
LABEL_5:
    [v30 setFlags:v6];
    goto LABEL_6;
  }
  if ([v26 isEqualToString:*MEMORY[0x1E4F60708]])
  {
    uint64_t v6 = [v30 flags] | 4;
    goto LABEL_5;
  }
LABEL_6:
  v27 = [v28 componentsSeparatedByString:@";"];
  if ((unint64_t)[v27 count] < 2)
  {
    v7 = [MEMORY[0x1E4F1CB10] URLWithString:v28];
    if (v7) {
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v27;
  v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v8) {
    goto LABEL_34;
  }
  uint64_t v9 = *(void *)v33;
  do
  {
    uint64_t v10 = 0;
    v11 = v4;
    do
    {
      if (*(void *)v33 != v9) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
      v13 = [v12 componentsSeparatedByString:@"="];
      v14 = [v13 firstObject];
      v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v16 = [v14 stringByTrimmingCharactersInSet:v15];

      if ([v16 hasPrefix:@"https://"])
      {
        [MEMORY[0x1E4F1CB10] URLWithString:v12];
        v7 = v4 = v7;
        goto LABEL_19;
      }
      if ([v16 isEqualToString:@"filename"])
      {
        v4 = [v13 lastObject];
        v17 = objc_msgSend(v4, "ef_sanitizedFileName");
        [v30 setFileName:v17];
        goto LABEL_18;
      }
      if ([v16 isEqualToString:@"mimeType"])
      {
        v4 = [v13 lastObject];
        v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\""];
        v18 = [v4 stringByTrimmingCharactersInSet:v17];
        [v30 setMimeType:v18];

LABEL_18:
LABEL_19:

        goto LABEL_20;
      }
      if ([v16 isEqualToString:@"filesize"])
      {
        v4 = [v13 lastObject];
        objc_msgSend(v30, "setFileSize:", objc_msgSend(v4, "integerValue"));
        goto LABEL_19;
      }
      if (![v16 isEqualToString:@"expiration-date"])
      {
        if ([v16 isEqualToString:@"x-mac-auto-archive"])
        {
          v4 = [v13 lastObject];
          objc_msgSend(v30, "setAutoArchive:", objc_msgSend(v4, "BOOLValue"));
          goto LABEL_19;
        }
LABEL_20:
        v4 = v11;
        goto LABEL_21;
      }
      v19 = [v13 lastObject];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 == 0.0)
      {
        v22 = 0;
        v4 = v11;
      }
      else
      {
        v4 = [a1 parseExpiration:v21];
        v22 = v4;
      }
      [v30 setExpiration:v22];
      v11 = v4;
      if (v21 != 0.0) {
        goto LABEL_19;
      }
LABEL_21:

      ++v10;
      v11 = v4;
    }
    while (v8 != v10);
    uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    uint64_t v8 = v23;
  }
  while (v23);
LABEL_34:

  if (!v7) {
    goto LABEL_38;
  }
LABEL_37:
  [a1 parseURL:v7 intoMetadata:v30];
LABEL_38:
  id v24 = v30;

  return v24;
}

+ (void)parseURL:(id)a3 intoMetadata:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([a1 _domainIsAllowed:v11])
  {
    v7 = [v11 absoluteString];
    int v8 = [v7 hasPrefix:@"https://www.icloud.com/attachment/"];

    if (v8) {
      [a1 _parseWrappedURL:v11 intoMetadata:v6];
    }
    else {
      [a1 _parseDirectURL:v11 intoMetadata:v6];
    }
    uint64_t v9 = [v6 fileName];
    int v10 = [v9 isEqualToString:@"Images.zip"];

    if (v10) {
      objc_msgSend(v6, "setFlags:", objc_msgSend(v6, "flags") | 2);
    }
  }
  else
  {
    [v6 setIsInvalid:1];
  }
}

+ (BOOL)urlIsValid:(id)a3
{
  id v3 = a3;
  v4 = +[EMMailDropMetadata mailDropMetadata];
  +[EMMailDropParser parseURL:v3 intoMetadata:v4];
  char v5 = [v4 isInvalid] ^ 1;

  return v5;
}

+ (id)_parseURLQuery:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [v14 query];
  [v4 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v9 count])
        {
          if ([v9 count] == 2)
          {
            int v10 = [v9 lastObject];
            id v11 = [v10 stringByRemovingPercentEncoding];

            v12 = [v9 firstObject];
            [v3 setValue:v11 forKey:v12];
          }
          else
          {
            id v11 = [v9 firstObject];
            [v3 setValue:0 forKey:v11];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)_domainIsAllowed:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 scheme];
  LODWORD(v6) = [v5 isEqualToString:@"https"];

  if (v6)
  {
    uint64_t v7 = [v4 host];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__EMMailDropParser__domainIsAllowed___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_domainIsAllowed__onceToken != -1) {
      dispatch_once(&_domainIsAllowed__onceToken, block);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = (id)_allowedDownloadDomains;
    uint64_t v6 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(v7, "hasSuffix:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v6;
}

void __37__EMMailDropParser__domainIsAllowed___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allowedMailDropDownloadDomains];
  v2 = (void *)_allowedDownloadDomains;
  _allowedDownloadDomains = v1;
}

+ (void)_parseWrappedURL:(id)a3 intoMetadata:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  [v6 setWrappedUrl:v19];
  uint64_t v7 = [a1 _parseURLQuery:v19];
  if ([v7 count]
    && ([v7 objectForKeyedSubscript:@"u"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = (void *)[v8 mutableCopy],
        v8,
        v9))
  {
    int v10 = [v7 objectForKeyedSubscript:@"f"];
    if (v10)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet");
      long long v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];

      objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"${f}", v12, 0, 0, objc_msgSend(v9, "length"));
      long long v13 = objc_msgSend(v10, "ef_sanitizedFileName");
      [v6 setFileName:v13];
    }
    long long v14 = [v7 objectForKeyedSubscript:@"uk"];
    uint64_t v15 = [v9 length];
    if (v14) {
      long long v16 = v14;
    }
    else {
      long long v16 = &stru_1F1A3DFB0;
    }
    objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"${uk}", v16, 0, 0, v15);

    long long v17 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    uint64_t v18 = [v7 objectForKeyedSubscript:@"sz"];
    objc_msgSend(v6, "setFileSize:", objc_msgSend(v18, "integerValue"));

    if (v17) {
      [a1 _parseDirectURL:v17 intoMetadata:v6];
    }
  }
  else
  {
    long long v17 = 0;
  }
}

+ (void)_parseDirectURL:(id)a3 intoMetadata:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if ([a1 _domainIsAllowed:v16])
  {
    [v6 setDirectUrl:v16];
    uint64_t v7 = [v16 lastPathComponent];
    id v8 = objc_msgSend(v7, "ef_sanitizedFileName");
    [v6 setFileName:v8];

    uint64_t v9 = [a1 _parseURLQuery:v16];
    if ([v9 count])
    {
      int v10 = [v9 objectForKeyedSubscript:@"e"];
      [v10 doubleValue];
      double v12 = v11;

      if (v12 == 0.0)
      {
        long long v13 = 0;
      }
      else
      {
        long long v13 = [a1 parseExpiration:v12];
      }
      [v6 setExpiration:v13];
      if (v12 != 0.0) {

      }
      long long v14 = [v9 objectForKeyedSubscript:@"r"];
      uint64_t v15 = [v14 uppercaseString];
      [v6 setUUID:v15];
    }
  }
  else
  {
    [v6 setIsInvalid:1];
  }
}

@end
@interface AKIDPUtility
+ (BOOL)dictionary:(id)a3 containsKeys:(id)a4;
+ (BOOL)isMicrosoftRequestDictionary:(id)a3;
+ (id)convertError:(id)a3;
+ (id)idpURLFromRequest:(id)a3;
+ (id)microsoftLoginURLFromParameters:(id)a3;
+ (id)parametersFromRequest:(id)a3;
+ (id)parametersFromResponseURL:(id)a3 request:(id)a4;
@end

@implementation AKIDPUtility

+ (id)convertError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  v5 = getASWebAuthenticationSessionErrorDomain();
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = v3;
LABEL_6:
  v8 = v7;

  return v8;
}

+ (id)idpURLFromRequest:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 HTTPBody];
  id v7 = (void *)[v5 initWithData:v6 encoding:4];

  v8 = [v4 URL];
  v9 = [v8 absoluteString];

  v10 = +[AKIDPUtility parametersFromRequest:v4];

  if (+[AKIDPUtility isMicrosoftRequestDictionary:v10])
  {
    [v10 objectForKeyedSubscript:@"SAMLRequest"];
    v11 = v26 = v7;
    v12 = [v11 stringByRemovingPercentEncoding];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:1];
    v13 = [v25 compressedDataUsingAlgorithm:3 error:0];
    v14 = [v13 base64EncodedStringWithOptions:0];
    v15 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:charsToEscape];
    v16 = [v15 invertedSet];

    v17 = [v10 objectForKeyedSubscript:@"RelayState"];
    v18 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v16];
    int v19 = [v9 containsString:@"?"];
    v20 = &urlWithQueryParametersFormatString;
    if (!v19) {
      v20 = &urlWithoutQueryParametersFormatString;
    }
    v21 = objc_msgSend(NSString, "stringWithFormat:", *v20, v9, @"RelayState", v17, @"SAMLRequest", v18);
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v21];

    id v7 = v26;
  }
  else
  {
    v23 = [v9 stringByAppendingString:@"?"];
    v12 = [v23 stringByAppendingString:v7];

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v12];
  }

  return v22;
}

+ (id)parametersFromResponseURL:(id)a3 request:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F4F0C8] sharedBag];
  id v7 = [v6 acsURL];

  if (v5)
  {
    v8 = [v5 query];

    v9 = 0;
    if (a4 && v8 && v7)
    {
      v12[0] = *MEMORY[0x1E4F4EED0];
      v10 = [v5 query];
      v12[1] = *MEMORY[0x1E4F4EED8];
      v13[0] = v10;
      v13[1] = v7;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)parametersFromRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSString alloc];
  v22 = v3;
  id v5 = [v3 HTTPBody];
  uint64_t v6 = (void *)[v4 initWithData:v5 encoding:4];

  v21 = v6;
  id v7 = [v6 componentsSeparatedByString:@"&"];
  id v23 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v13 rangeOfString:@"="];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = v14;
          uint64_t v17 = v15;
          v18 = [v13 substringToIndex:v14];
          int v19 = [v13 substringFromIndex:v16 + v17];
          [v23 setObject:v19 forKey:v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v23;
}

+ (id)microsoftLoginURLFromParameters:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"SAMLRequest"];
  id v4 = [v3 stringByRemovingPercentEncoding];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:1];
  uint64_t v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  uint64_t v7 = [v6 rangeOfString:@"AssertionConsumerServiceURL=\""];
  uint64_t v9 = objc_msgSend(v6, "substringWithRange:", v7 + v8, objc_msgSend(v6, "length") - (v7 + v8));
  uint64_t v10 = objc_msgSend(v9, "substringWithRange:", 0, objc_msgSend(v9, "rangeOfString:", @"\""));
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];

  return v11;
}

+ (BOOL)dictionary:(id)a3 containsKeys:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(v5, "valueForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (BOOL)isMicrosoftRequestDictionary:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"RelayState";
  v7[1] = @"SAMLRequest";
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v7 count:2];
  LOBYTE(v3) = +[AKIDPUtility dictionary:v4 containsKeys:v5];

  return (char)v3;
}

@end
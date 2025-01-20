@interface DAEASOAuthRequest
+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3;
+ (id)authCodeFromRequest:(id)a3;
+ (id)errorDescriptionFromRequest:(id)a3;
+ (id)errorDomainFromRequest:(id)a3;
+ (id)requestForURL:(id)a3;
+ (id)stateFromRequest:(id)a3;
+ (id)urlForOAuthURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 scope:(id)a6 username:(id)a7 state:(id)a8 codeChallenge:(id)a9 codeChallengeMethod:(int64_t)a10;
+ (id)urlForOnPremOAuthURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 username:(id)a6 state:(id)a7 resource:(id)a8 claims:(id)a9;
@end

@implementation DAEASOAuthRequest

+ (id)urlForOAuthURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 scope:(id)a6 username:(id)a7 state:(id)a8 codeChallenge:(id)a9 codeChallengeMethod:(int64_t)a10
{
  v48[9] = *MEMORY[0x263EF8340];
  id v44 = a7;
  v15 = (void *)MEMORY[0x263EFF960];
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v47 = a3;
  v21 = [v15 currentLocale];
  v22 = [v21 objectForKey:*MEMORY[0x263EFF500]];
  v23 = [v22 lowercaseString];
  uint64_t v24 = [v23 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  uint64_t v25 = [v18 componentsJoinedByString:@" "];

  v48[0] = @"response_type=code";
  v43 = [NSString stringWithFormat:@"client_id=%@", v20];

  v48[1] = v43;
  v26 = [NSString stringWithFormat:@"redirect_uri=%@", v19];

  v48[2] = v26;
  v45 = (void *)v25;
  v27 = [NSString stringWithFormat:@"scope=%@", v25];
  v48[3] = v27;
  v46 = (void *)v24;
  v28 = [NSString stringWithFormat:@"ui_locales=%@", v24];
  v48[4] = v28;
  v29 = [NSString stringWithFormat:@"display=%@", @"ios"];
  v48[5] = v29;
  v30 = [NSString stringWithFormat:@"state=%@", v17];

  v48[6] = v30;
  v31 = [NSString stringWithFormat:@"code_challenge=%@", v16];

  v48[7] = v31;
  v32 = NSString;
  v33 = +[DAEASOAuthPKCEChallenge convertToString:a10];
  v34 = [v32 stringWithFormat:@"code_challenge_method=%@", v33];
  v48[8] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:9];

  if (v44)
  {
    v36 = [NSString stringWithFormat:@"login_hint=%@", v44];
    uint64_t v37 = [v35 arrayByAddingObject:v36];

    v35 = (void *)v37;
  }
  v38 = [v35 componentsJoinedByString:@"&"];
  v39 = [v38 stringByAddingPercentEscapesUsingEncoding:4];

  v40 = [NSString stringWithFormat:@"%@?%@", v47, v39];

  v41 = [NSURL URLWithString:v40];

  return v41;
}

+ (id)urlForOnPremOAuthURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 username:(id)a6 state:(id)a7 resource:(id)a8 claims:(id)a9
{
  v44[8] = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v42 = a6;
  id v15 = a8;
  id v16 = (void *)MEMORY[0x263EFF960];
  id v17 = a9;
  id v18 = a7;
  id v19 = a5;
  id v41 = a3;
  id v20 = [v16 currentLocale];
  v21 = [v20 objectForKey:*MEMORY[0x263EFF500]];
  v22 = [v21 lowercaseString];
  uint64_t v23 = [v22 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  if (([v15 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v24 = [v15 stringByAppendingString:@"/"];

    id v15 = (id)v24;
  }
  v43 = v14;
  v44[0] = @"response_type=code";
  uint64_t v25 = [NSString stringWithFormat:@"client_id=%@", v14];
  v44[1] = v25;
  v26 = [NSString stringWithFormat:@"redirect_uri=%@", v19];

  v44[2] = v26;
  v40 = (void *)v23;
  v27 = [NSString stringWithFormat:@"ui_locales=%@", v23];
  v44[3] = v27;
  v28 = [NSString stringWithFormat:@"display=%@", @"ios"];
  v44[4] = v28;
  v29 = [NSString stringWithFormat:@"state=%@", v18];

  v44[5] = v29;
  v30 = [NSString stringWithFormat:@"resource=%@", v15];
  v44[6] = v30;
  v31 = [NSString stringWithFormat:@"claims=%@", v17];

  v44[7] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:8];

  if (v42)
  {
    v33 = [NSString stringWithFormat:@"login_hint=%@", v42];
    uint64_t v34 = [v32 arrayByAddingObject:v33];

    v32 = (void *)v34;
  }
  v35 = [v32 componentsJoinedByString:@"&"];
  v36 = [v35 stringByAddingPercentEscapesUsingEncoding:4];

  uint64_t v37 = [NSString stringWithFormat:@"%@?%@", v41, v36];

  v38 = [NSURL URLWithString:v37];

  return v38;
}

+ (id)requestForURL:(id)a3
{
  v3 = [MEMORY[0x263F089E0] requestWithURL:a3];
  [v3 setCachePolicy:1];
  return v3;
}

+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3
{
  v3 = [a3 absoluteString];
  char v4 = [v3 hasPrefix:@"urn:ietf:wg:oauth:2.0:oob"];

  return v4;
}

+ (id)authCodeFromRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08BA0];
  char v4 = [a3 URL];
  v5 = [v3 componentsWithURL:v4 resolvingAgainstBaseURL:1];
  v6 = [v5 queryItems];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 name];
        int v14 = [v13 isEqualToString:@"code"];

        if (v14)
        {
          id v15 = [v12 value];
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  id v16 = DALoggingwithCategory();
  os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_22C076000, v16, v17, "Extracted auth code from request URL", v19, 2u);
  }

  return v15;
}

+ (id)stateFromRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08BA0];
  char v4 = [a3 URL];
  v5 = [v3 componentsWithURL:v4 resolvingAgainstBaseURL:1];
  v6 = [v5 queryItems];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 name];
        int v14 = [v13 isEqualToString:@"state"];

        if (v14)
        {
          id v15 = [v12 value];
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  id v16 = DALoggingwithCategory();
  os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_22C076000, v16, v17, "Extracted state from request URL", v19, 2u);
  }

  return v15;
}

+ (id)errorDomainFromRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = (void *)MEMORY[0x263F08BA0];
  v5 = [v3 URL];
  v6 = [v4 componentsWithURL:v5 resolvingAgainstBaseURL:1];
  id v7 = [v6 queryItems];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "name", (void)v21);
        int v15 = [v14 isEqualToString:@"error"];

        if (v15)
        {
          id v16 = [v13 value];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  os_log_type_t v17 = DALoggingwithCategory();
  os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = [v3 URL];
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_22C076000, v17, v18, "Extracted error - %@ from request URL - %@ ", buf, 0x16u);
  }
  return v16;
}

+ (id)errorDescriptionFromRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = (void *)MEMORY[0x263F08BA0];
  v5 = [v3 URL];
  v6 = [v4 componentsWithURL:v5 resolvingAgainstBaseURL:1];
  id v7 = [v6 queryItems];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "name", (void)v21);
        int v15 = [v14 isEqualToString:@"error_description"];

        if (v15)
        {
          id v16 = [v13 value];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  os_log_type_t v17 = DALoggingwithCategory();
  os_log_type_t v18 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = [v3 URL];
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_22C076000, v17, v18, "Extracted error_description - %@ from request URL - %@ ", buf, 0x16u);
  }
  return v16;
}

@end
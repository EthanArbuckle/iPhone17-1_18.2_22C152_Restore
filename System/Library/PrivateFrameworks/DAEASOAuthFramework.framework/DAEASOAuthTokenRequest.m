@interface DAEASOAuthTokenRequest
+ (id)_urlRequestForTokenRequestURI:(id)a3 params:(id)a4 clientID:(id)a5;
+ (id)claimsValueWithClaimsChallenge:(id)a3;
+ (id)oauthTokenRefreshRequestForTokenRequestURI:(id)a3 clientID:(id)a4 scope:(id)a5 refreshToken:(id)a6 claims:(id)a7;
+ (id)urlRequestForTokenRequestURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 authCode:(id)a6 scope:(id)a7 codeVerifier:(id)a8 claims:(id)a9;
@end

@implementation DAEASOAuthTokenRequest

+ (id)claimsValueWithClaimsChallenge:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v26 = v3;
  if (v3 && (uint64_t v4 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0]) != 0)
  {
    v25 = (void *)v4;
    v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:0];
  }
  else
  {
    v5 = 0;
    v25 = 0;
  }
  v24 = [@"{\"access_token\":{\"xms_cc\":{\"values\":[\"cp1\"]}}}" dataUsingEncoding:4];
  v6 = objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:");
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v23 = v6;
  v8 = [v6 objectForKeyedSubscript:@"access_token"];
  v9 = [v8 objectForKeyedSubscript:@"xms_cc"];
  [v7 setValue:v9 forKey:@"xms_cc"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v10 = [v5 objectForKeyedSubscript:@"access_token"];
  v11 = [v10 allKeys];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v17 = [v5 objectForKeyedSubscript:@"access_token"];
        v18 = [v17 objectForKeyedSubscript:v16];
        [v7 setValue:v18 forKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  [v22 setValue:v7 forKey:@"access_token"];
  v19 = [MEMORY[0x263F08900] dataWithJSONObject:v22 options:0 error:0];
  v20 = (void *)[[NSString alloc] initWithData:v19 encoding:4];

  return v20;
}

+ (id)urlRequestForTokenRequestURI:(id)a3 clientID:(id)a4 redirectURI:(id)a5 authCode:(id)a6 scope:(id)a7 codeVerifier:(id)a8 claims:(id)a9
{
  id v26 = a9;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_opt_new();
  [v21 setObject:v19 forKeyedSubscript:@"client_id"];
  [v21 setObject:v17 forKeyedSubscript:@"code"];

  id v22 = [v16 componentsJoinedByString:@" "];

  [v21 setObject:v22 forKeyedSubscript:@"scope"];
  [v21 setObject:@"authorization_code" forKeyedSubscript:@"grant_type"];
  [v21 setObject:v18 forKeyedSubscript:@"redirect_uri"];

  [v21 setObject:v15 forKeyedSubscript:@"code_verifier"];
  v23 = [(id)objc_opt_class() claimsValueWithClaimsChallenge:v26];

  [v21 setObject:v23 forKeyedSubscript:@"claims"];
  v24 = [a1 _urlRequestForTokenRequestURI:v20 params:v21 clientID:v19];

  return v24;
}

+ (id)oauthTokenRefreshRequestForTokenRequestURI:(id)a3 clientID:(id)a4 scope:(id)a5 refreshToken:(id)a6 claims:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  id v17 = objc_opt_new();
  [v17 setObject:v12 forKeyedSubscript:@"client_id"];
  if (v13)
  {
    id v18 = [v13 componentsJoinedByString:@" "];
    [v17 setObject:v18 forKeyedSubscript:@"scope"];
  }
  [v17 setObject:v14 forKeyedSubscript:@"refresh_token"];
  [v17 setObject:@"refresh_token" forKeyedSubscript:@"grant_type"];
  id v19 = [(id)objc_opt_class() claimsValueWithClaimsChallenge:v15];

  [v17 setObject:v19 forKeyedSubscript:@"claims"];
  id v20 = [a1 _urlRequestForTokenRequestURI:v16 params:v17 clientID:v12];

  return v20;
}

+ (id)_urlRequestForTokenRequestURI:(id)a3 params:(id)a4 clientID:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = v6;
  id obj = [v6 allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = [v8 objectForKeyedSubscript:v13];
        id v15 = NSString;
        id v16 = [v13 stringByAddingPercentEscapesUsingEncoding:4];
        id v17 = [v14 stringByAddingPercentEscapesUsingEncoding:4];
        id v18 = [v15 stringWithFormat:@"%@=%@", v16, v17];

        [v7 addObject:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  id v19 = [v7 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  id v20 = [v19 componentsJoinedByString:@"&"];
  v21 = (void *)MEMORY[0x263F089E0];
  id v22 = [NSURL URLWithString:v26];
  v23 = [v21 requestWithURL:v22];

  v24 = [v20 dataUsingEncoding:4];
  [v23 setHTTPBody:v24];

  [v23 setCachePolicy:1];
  [v23 setHTTPMethod:@"POST"];
  [v23 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v23;
}

@end
@interface SLGoogleOAuth2TokenRequest
+ (id)_urlRequestForParams:(id)a3 tokenURL:(id)a4;
+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7;
+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7 codeVerifier:(id)a8;
+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 refreshToken:(id)a5 tokenURL:(id)a6;
@end

@implementation SLGoogleOAuth2TokenRequest

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7
{
  return (id)[a1 urlRequestForClientID:a3 secret:a4 redirectURI:a5 authCode:a6 tokenURL:a7 codeVerifier:0];
}

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7 codeVerifier:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v17 = (void *)MEMORY[0x1E4F1CA60];
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  v21 = [v17 dictionary];
  [v21 setObject:v18 forKeyedSubscript:@"code"];

  [v21 setObject:@"authorization_code" forKeyedSubscript:@"grant_type"];
  [v21 setObject:v19 forKeyedSubscript:@"redirect_uri"];

  [v21 setObject:v20 forKeyedSubscript:@"client_id"];
  [v21 setObject:@"true" forKeyedSubscript:@"enable_granular_consent"];
  [v21 setObject:@"true" forKeyedSubscript:@"include_granted_scopes"];
  if (v14) {
    [v21 setObject:v14 forKeyedSubscript:@"client_secret"];
  }
  if (v16) {
    [v21 setObject:v16 forKeyedSubscript:@"code_verifier"];
  }
  v22 = [a1 _urlRequestForParams:v21 tokenURL:v15];

  return v22;
}

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 refreshToken:(id)a5 tokenURL:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = objc_opt_new();
  [v14 setObject:v12 forKeyedSubscript:@"refresh_token"];

  [v14 setObject:@"refresh_token" forKeyedSubscript:@"grant_type"];
  [v14 setObject:v13 forKeyedSubscript:@"client_id"];

  [v14 setObject:@"true" forKeyedSubscript:@"enable_granular_consent"];
  [v14 setObject:@"true" forKeyedSubscript:@"include_granted_scopes"];
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"client_secret"];
  }
  id v15 = [a1 _urlRequestForParams:v14 tokenURL:v11];

  return v15;
}

+ (id)_urlRequestForParams:(id)a3 tokenURL:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v28 = v5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v5 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v11 = [v28 objectForKeyedSubscript:v10];
        id v12 = NSString;
        id v13 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        id v14 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v13];
        id v15 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        id v16 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v15];
        v17 = [v12 stringWithFormat:@"%@=%@", v14, v16];

        [v27 addObject:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  id v18 = [v27 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  id v19 = [v18 componentsJoinedByString:@"&"];
  id v20 = (void *)MEMORY[0x1E4F28E88];
  v21 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
  v22 = [v20 requestWithURL:v21];

  v23 = [v19 dataUsingEncoding:4];
  [v22 setHTTPBody:v23];

  [v22 setCachePolicy:1];
  [v22 setHTTPMethod:@"POST"];
  [v22 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v22;
}

@end
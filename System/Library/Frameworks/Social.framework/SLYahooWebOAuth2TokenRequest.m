@interface SLYahooWebOAuth2TokenRequest
+ (id)_urlRequestForParams:(id)a3 clientID:(id)a4 secret:(id)a5 tokenURL:(id)a6;
+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7;
+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 refreshToken:(id)a5 tokenURL:(id)a6;
@end

@implementation SLYahooWebOAuth2TokenRequest

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 redirectURI:(id)a5 authCode:(id)a6 tokenURL:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_opt_new();
  [v17 setObject:v13 forKeyedSubscript:@"code"];

  [v17 setObject:@"authorization_code" forKeyedSubscript:@"grant_type"];
  [v17 setObject:v14 forKeyedSubscript:@"redirect_uri"];

  v18 = [a1 _urlRequestForParams:v17 clientID:v16 secret:v15 tokenURL:v12];

  return v18;
}

+ (id)urlRequestForClientID:(id)a3 secret:(id)a4 refreshToken:(id)a5 tokenURL:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  [v14 setObject:v11 forKeyedSubscript:@"refresh_token"];

  [v14 setObject:@"refresh_token" forKeyedSubscript:@"grant_type"];
  id v15 = objc_alloc_init(SLYahooWebClient);
  id v16 = [(SLYahooWebClient *)v15 clientRedirect];
  [v14 setObject:v16 forKeyedSubscript:@"redirect_uri"];

  v17 = [a1 _urlRequestForParams:v14 clientID:v13 secret:v12 tokenURL:v10];

  return v17;
}

+ (id)_urlRequestForParams:(id)a3 clientID:(id)a4 secret:(id)a5 tokenURL:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  v39 = v9;
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [v9 allKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v15 = [v39 objectForKeyedSubscript:v14];
        id v16 = NSString;
        v17 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        v18 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v17];
        v19 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        v20 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v19];
        v21 = [v16 stringWithFormat:@"%@=%@", v18, v20];

        [v40 addObject:v21];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v11);
  }

  id obja = [v40 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  v22 = [obja componentsJoinedByString:@"&"];
  v23 = (void *)MEMORY[0x1E4F28E88];
  v24 = [MEMORY[0x1E4F1CB10] URLWithString:v34];
  v25 = [v23 requestWithURL:v24];

  v26 = [v22 dataUsingEncoding:4];
  [v25 setHTTPBody:v26];

  [v25 setCachePolicy:1];
  [v25 setHTTPMethod:@"POST"];
  v27 = [NSString stringWithFormat:@"%@:%@", v36, v35];
  id v28 = [NSString alloc];
  v29 = [v27 dataUsingEncoding:4];
  v30 = [v29 base64EncodedDataWithOptions:0];
  v31 = (void *)[v28 initWithData:v30 encoding:4];

  v32 = [NSString stringWithFormat:@"Basic %@", v31];

  [v25 setValue:v32 forHTTPHeaderField:@"Authorization"];
  [v25 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

  return v25;
}

@end
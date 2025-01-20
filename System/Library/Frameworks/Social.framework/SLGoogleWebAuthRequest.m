@interface SLGoogleWebAuthRequest
+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3;
+ (id)_parametersForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 codeChallenge:(id)a7;
+ (id)authCodeFromRedirectURL:(id)a3;
+ (id)authCodeFromWebPageTitle:(id)a3;
+ (id)requestForURL:(id)a3;
+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7;
+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7 codeChallenge:(id)a8;
+ (id)urlRequestForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7;
+ (void)clearCookiesFromStorage:(id)a3 authRequestURL:(id)a4;
@end

@implementation SLGoogleWebAuthRequest

+ (void)clearCookiesFromStorage:(id)a3 authRequestURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [NSString stringWithFormat:@"https://%@/", a4];
  v8 = [v6 URLWithString:v7];

  v9 = [v5 cookiesForURL:v8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [v5 deleteCookie:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7
{
  return (id)[a1 urlForClientID:a3 redirectURI:a4 scope:a5 username:a6 authRequestURL:a7 codeChallenge:0];
}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7 codeChallenge:(id)a8
{
  id v14 = a7;
  long long v15 = [a1 _parametersForClientID:a3 redirectURI:a4 scope:a5 username:a6 codeChallenge:a8];
  long long v16 = [v15 componentsJoinedByString:@"&"];
  long long v17 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v18 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v17];

  uint64_t v19 = [NSString stringWithFormat:@"%@?%@", v14, v18];

  v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];

  return v20;
}

+ (id)_parametersForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 codeChallenge:(id)a7
{
  v27[7] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  long long v15 = [a5 componentsJoinedByString:@" "];
  v27[0] = @"response_type=code";
  v27[1] = @"enable_granular_consent=true";
  v27[2] = @"include_granted_scopes=true";
  v27[3] = @"prompt=consent";
  long long v16 = [NSString stringWithFormat:@"client_id=%@", v14];

  v27[4] = v16;
  long long v17 = [NSString stringWithFormat:@"redirect_uri=%@", v13];

  v27[5] = v17;
  v18 = [NSString stringWithFormat:@"scope=%@", v15];
  v27[6] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:7];

  if (v11)
  {
    v20 = [NSString stringWithFormat:@"login_hint=%@", v11];
    uint64_t v21 = [v19 arrayByAddingObject:v20];

    uint64_t v19 = (void *)v21;
  }
  if (v12)
  {
    v22 = [NSString stringWithFormat:@"code_challenge=%@", v12];
    v26[0] = v22;
    v26[1] = @"code_challenge_method=S256";
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v24 = [v19 arrayByAddingObjectsFromArray:v23];

    uint64_t v19 = (void *)v24;
  }

  return v19;
}

+ (id)requestForURL:(id)a3
{
  v3 = [MEMORY[0x1E4F28E88] requestWithURL:a3];
  [v3 setCachePolicy:1];

  return v3;
}

+ (id)urlRequestForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7
{
  v8 = [a1 urlForClientID:a3 redirectURI:a4 scope:a5 username:a6 authRequestURL:a7];
  v9 = [a1 requestForURL:v8];

  return v9;
}

+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3
{
  v3 = [a3 absoluteString];
  char v4 = [v3 hasPrefix:@"https://accounts.google.com/o/oauth2/approval"];

  return v4;
}

+ (id)authCodeFromWebPageTitle:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"Success code="])
  {
    char v4 = [v3 substringFromIndex:objc_msgSend(@"Success code=", "length")];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (id)authCodeFromRedirectURL:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  char v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = [v4 queryItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SLGoogleWebAuthRequest_authCodeFromRedirectURL___block_invoke;
  v8[3] = &unk_1E6467D20;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__SLGoogleWebAuthRequest_authCodeFromRedirectURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [v11 name];
  uint64_t v7 = [v6 caseInsensitiveCompare:@"code"];

  if (!v7)
  {
    uint64_t v8 = [v11 value];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

@end
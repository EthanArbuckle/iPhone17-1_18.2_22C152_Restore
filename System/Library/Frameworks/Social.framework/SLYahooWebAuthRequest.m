@interface SLYahooWebAuthRequest
+ (BOOL)supportsSecureCoding;
+ (BOOL)urlPageWillContainAuthorizationCode:(id)a3;
+ (id)_parametersForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6;
+ (id)authCodeFromURLRequest:(id)a3;
+ (id)requestForURL:(id)a3;
+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7;
+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7 codeChallenge:(id)a8;
+ (id)urlRequestForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7;
+ (void)clearCookiesFromStorage:(id)a3 authRequestURL:(id)a4;
- (SLYahooWebAuthRequest)initWithCoder:(id)a3;
@end

@implementation SLYahooWebAuthRequest

- (SLYahooWebAuthRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLYahooWebAuthRequest;
  return [(SLYahooWebAuthRequest *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)clearCookiesFromStorage:(id)a3 authRequestURL:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = NSString;
  v8 = [MEMORY[0x1E4F1CB10] URLWithString:a4];
  v9 = [v8 host];
  v10 = [v7 stringWithFormat:@"https://%@/", v9];
  v11 = [v6 URLWithString:v10];

  v12 = [v5 cookiesForURL:v11];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [v5 deleteCookie:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7
{
  return (id)[a1 urlForClientID:a3 redirectURI:a4 scope:a5 username:a6 authRequestURL:a7 codeChallenge:0];
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
  v3 = [a3 query];
  char v4 = [v3 hasPrefix:@"code="];

  return v4;
}

+ (id)authCodeFromURLRequest:(id)a3
{
  v3 = [a3 URL];
  char v4 = [v3 query];
  id v5 = [v4 substringFromIndex:objc_msgSend(@"code=", "length")];
  v6 = [v5 componentsSeparatedByString:@"&"];
  v7 = [v6 objectAtIndexedSubscript:0];

  return v7;
}

+ (id)urlForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6 authRequestURL:(id)a7 codeChallenge:(id)a8
{
  id v13 = a7;
  uint64_t v14 = [a1 _parametersForClientID:a3 redirectURI:a4 scope:a5 username:a6];
  uint64_t v15 = [v14 componentsJoinedByString:@"&"];
  uint64_t v16 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  long long v17 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v16];

  long long v18 = [NSString stringWithFormat:@"%@?%@", v13, v17];

  long long v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];

  return v19;
}

+ (id)_parametersForClientID:(id)a3 redirectURI:(id)a4 scope:(id)a5 username:(id)a6
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  v9 = (void *)MEMORY[0x1E4F1CA20];
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 currentLocale];
  id v13 = [v12 objectForKey:*MEMORY[0x1E4F1C430]];
  uint64_t v14 = [v13 lowercaseString];
  uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  uint64_t v16 = [NSString stringWithFormat:@"client_id=%@", v11, @"response_type=code"];

  v23[1] = v16;
  long long v17 = [NSString stringWithFormat:@"redirect_uri=%@", v10];

  v23[2] = v17;
  long long v18 = [NSString stringWithFormat:@"language=%@", v15];
  v23[3] = v18;
  long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  if (v8)
  {
    long long v20 = [NSString stringWithFormat:@"login_hint=%@", v8];
    uint64_t v21 = [v19 arrayByAddingObject:v20];

    long long v19 = (void *)v21;
  }

  return v19;
}

@end
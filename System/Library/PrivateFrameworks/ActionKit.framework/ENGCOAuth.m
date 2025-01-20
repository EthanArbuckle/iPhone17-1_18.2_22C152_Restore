@interface ENGCOAuth
+ (id)URLRequestForPath:(id)a3 GETParameters:(id)a4 host:(id)a5 consumerKey:(id)a6 consumerSecret:(id)a7 accessToken:(id)a8 tokenSecret:(id)a9;
+ (id)URLRequestForPath:(id)a3 GETParameters:(id)a4 scheme:(id)a5 host:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 accessToken:(id)a9 tokenSecret:(id)a10;
+ (id)URLRequestForPath:(id)a3 POSTParameters:(id)a4 host:(id)a5 consumerKey:(id)a6 consumerSecret:(id)a7 accessToken:(id)a8 tokenSecret:(id)a9;
+ (id)nonce;
+ (id)queryStringFromParameters:(id)a3;
+ (id)timeStamp;
+ (void)setHTTPShouldHandleCookies:(BOOL)a3;
+ (void)setTimeStampOffset:(int64_t)a3;
+ (void)setUserAgent:(id)a3;
- (ENGCOAuth)initWithConsumerKey:(id)a3 consumerSecret:(id)a4 accessToken:(id)a5 tokenSecret:(id)a6;
- (NSDictionary)OAuthParameters;
- (NSDictionary)requestParameters;
- (NSString)HTTPMethod;
- (NSString)signatureSecret;
- (NSURL)URL;
- (id)authorizationHeader;
- (id)request;
- (id)signature;
- (id)signatureBase;
- (void)setHTTPMethod:(id)a3;
- (void)setOAuthParameters:(id)a3;
- (void)setRequestParameters:(id)a3;
- (void)setSignatureSecret:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation ENGCOAuth

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OAuthParameters, 0);
  objc_storeStrong((id *)&self->_signatureSecret, 0);
  objc_storeStrong((id *)&self->__url, 0);
  objc_storeStrong((id *)&self->__method, 0);
  objc_storeStrong((id *)&self->__parameters, 0);
}

- (void)setOAuthParameters:(id)a3
{
}

- (NSDictionary)OAuthParameters
{
  return self->_OAuthParameters;
}

- (void)setSignatureSecret:(id)a3
{
}

- (NSString)signatureSecret
{
  return self->_signatureSecret;
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->__url;
}

- (void)setHTTPMethod:(id)a3
{
}

- (NSString)HTTPMethod
{
  return self->__method;
}

- (void)setRequestParameters:(id)a3
{
}

- (NSDictionary)requestParameters
{
  return self->__parameters;
}

- (id)signatureBase
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(ENGCOAuth *)self OAuthParameters];
  [v3 addEntriesFromDictionary:v4];

  v39 = self;
  v5 = [(ENGCOAuth *)self requestParameters];
  [v3 addEntriesFromDictionary:v5];

  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v40 = v3;
  v7 = [v3 allKeys];
  v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v15 = [v40 objectForKey:v14];
        v16 = NSString;
        v17 = [v14 pcen];
        v18 = [v15 pcen];
        v19 = [v16 stringWithFormat:@"%@=%@", v17, v18];

        [v6 addObject:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v11);
  }

  v38 = v6;
  v20 = [v6 componentsJoinedByString:@"&"];
  v21 = [(ENGCOAuth *)v39 URL];
  v22 = NSString;
  v23 = [v21 scheme];
  v24 = [v23 lowercaseString];
  v25 = [v21 host];
  v26 = [v25 lowercaseString];
  v27 = [v21 path];
  v28 = [v22 stringWithFormat:@"%@://%@%@", v24, v26, v27];

  v29 = (void *)MEMORY[0x263EFF8C0];
  v30 = [(ENGCOAuth *)v39 HTTPMethod];
  v31 = [v30 pcen];
  v32 = v28;
  v33 = [v28 pcen];
  v34 = [v20 pcen];
  v35 = objc_msgSend(v29, "arrayWithObjects:", v31, v33, v34, 0);

  v36 = [v35 componentsJoinedByString:@"&"];

  return v36;
}

- (id)signature
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(ENGCOAuth *)self signatureBase];
  v4 = [v3 dataUsingEncoding:4];

  v5 = [(ENGCOAuth *)self signatureSecret];
  v6 = [v5 dataUsingEncoding:4];

  memset(&v12, 0, sizeof(v12));
  id v7 = v6;
  CCHmacInit(&v12, 0, (const void *)objc_msgSend(v7, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0),
    [v7 length]);
  id v8 = v4;
  CCHmacUpdate(&v12, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  CCHmacFinal(&v12, macOut);
  id v9 = [MEMORY[0x263EFF8F8] dataWithBytes:macOut length:20];
  uint64_t v10 = [v9 base64EncodedStringWithOptions:0];

  return v10;
}

- (id)authorizationHeader
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(ENGCOAuth *)self OAuthParameters];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(ENGCOAuth *)self signature];
  [v5 setObject:v6 forKey:@"oauth_signature"];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __32__ENGCOAuth_authorizationHeader__block_invoke;
  v11[3] = &unk_264E5A8A8;
  id v12 = v3;
  id v7 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
  id v8 = [v7 componentsJoinedByString:@","];
  id v9 = [@"OAuth " stringByAppendingString:v8];

  return v9;
}

void __32__ENGCOAuth_authorizationHeader__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSString;
  id v6 = a3;
  id v7 = [a2 pcen];
  id v8 = [v6 pcen];

  [v5 stringWithFormat:@"%@=\"%@\"", v7, v8];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v9];
}

- (id)request
{
  v3 = (void *)MEMORY[0x263EFC5E8];
  v4 = [(ENGCOAuth *)self URL];
  v5 = [v3 requestWithURL:v4 cachePolicy:1 timeoutInterval:10.0];

  if (GCOAuthUserAgent) {
    [v5 setValue:GCOAuthUserAgent forHTTPHeaderField:@"User-Agent"];
  }
  id v6 = [(ENGCOAuth *)self authorizationHeader];
  [v5 setValue:v6 forHTTPHeaderField:@"Authorization"];

  [v5 setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
  id v7 = [(ENGCOAuth *)self HTTPMethod];
  [v5 setHTTPMethod:v7];

  [v5 setHTTPShouldHandleCookies:GCOAuthUseHTTPSCookieStorage];
  return v5;
}

- (ENGCOAuth)initWithConsumerKey:(id)a3 consumerSecret:(id)a4 accessToken:(id)a5 tokenSecret:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (__CFString *)a6;
  v27.receiver = self;
  v27.super_class = (Class)ENGCOAuth;
  uint64_t v14 = [(ENGCOAuth *)&v27 init];
  if (v14)
  {
    id v15 = objc_alloc(NSDictionary);
    v16 = (void *)[v10 copy];
    v17 = +[ENGCOAuth nonce];
    v18 = +[ENGCOAuth timeStamp];
    v19 = (void *)[v12 copy];
    v20 = objc_msgSend(v15, "initWithObjectsAndKeys:", v16, @"oauth_consumer_key", v17, @"oauth_nonce", v18, @"oauth_timestamp", @"1.0", @"oauth_version", @"HMAC-SHA1", @"oauth_signature_method", v19, @"oauth_token", 0);
    [(ENGCOAuth *)v14 setOAuthParameters:v20];

    v21 = NSString;
    v22 = [v11 pcen];
    if (v13) {
      v23 = v13;
    }
    else {
      v23 = &stru_26F008428;
    }
    v24 = [(__CFString *)v23 pcen];
    v25 = [v21 stringWithFormat:@"%@&%@", v22, v24];
    [(ENGCOAuth *)v14 setSignatureSecret:v25];
  }
  return v14;
}

+ (id)URLRequestForPath:(id)a3 POSTParameters:(id)a4 host:(id)a5 consumerKey:(id)a6 consumerSecret:(id)a7 accessToken:(id)a8 tokenSecret:(id)a9
{
  id v9 = 0;
  if (a3 && a5)
  {
    id v16 = a9;
    id v17 = a8;
    id v18 = a7;
    id v19 = a6;
    id v20 = a5;
    id v21 = a4;
    id v22 = a3;
    v23 = [[ENGCOAuth alloc] initWithConsumerKey:v19 consumerSecret:v18 accessToken:v17 tokenSecret:v16];

    [(ENGCOAuth *)v23 setHTTPMethod:@"POST"];
    [(ENGCOAuth *)v23 setRequestParameters:v21];

    v24 = (void *)[objc_alloc(NSURL) initWithScheme:@"https" host:v20 path:v22];
    [(ENGCOAuth *)v23 setURL:v24];
    id v9 = [(ENGCOAuth *)v23 request];
    v25 = [(ENGCOAuth *)v23 requestParameters];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      objc_super v27 = [(ENGCOAuth *)v23 requestParameters];
      v28 = +[ENGCOAuth queryStringFromParameters:v27];

      v29 = [v28 dataUsingEncoding:4];
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v29, "length"));
      [v9 setHTTPBody:v29];
      [v9 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
      [v9 setValue:v30 forHTTPHeaderField:@"Content-Length"];
    }
  }
  return v9;
}

+ (id)URLRequestForPath:(id)a3 GETParameters:(id)a4 scheme:(id)a5 host:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 accessToken:(id)a9 tokenSecret:(id)a10
{
  id v10 = 0;
  if (a3 && a6)
  {
    id v17 = a10;
    id v18 = a9;
    id v19 = a8;
    id v20 = a7;
    id v21 = a6;
    id v22 = a5;
    id v23 = a4;
    id v24 = a3;
    v25 = [[ENGCOAuth alloc] initWithConsumerKey:v20 consumerSecret:v19 accessToken:v18 tokenSecret:v17];

    [(ENGCOAuth *)v25 setHTTPMethod:@"GET"];
    [(ENGCOAuth *)v25 setRequestParameters:v23];

    uint64_t v26 = [v24 stringByAddingPercentEscapesUsingEncoding:4];

    objc_super v27 = [NSString stringWithFormat:@"%@://%@%@", v22, v21, v26];

    v28 = [(ENGCOAuth *)v25 requestParameters];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      v30 = [(ENGCOAuth *)v25 requestParameters];
      v31 = +[ENGCOAuth queryStringFromParameters:v30];

      uint64_t v32 = [NSString stringWithFormat:@"%@?%@", v27, v31];

      objc_super v27 = (void *)v32;
    }
    v33 = [NSURL URLWithString:v27];
    [(ENGCOAuth *)v25 setURL:v33];

    id v10 = [(ENGCOAuth *)v25 request];
  }
  return v10;
}

+ (id)URLRequestForPath:(id)a3 GETParameters:(id)a4 host:(id)a5 consumerKey:(id)a6 consumerSecret:(id)a7 accessToken:(id)a8 tokenSecret:(id)a9
{
  return (id)[a1 URLRequestForPath:a3 GETParameters:a4 scheme:@"http" host:a5 consumerKey:a6 consumerSecret:a7 accessToken:a8 tokenSecret:a9];
}

+ (id)queryStringFromParameters:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = [v3 array];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__ENGCOAuth_queryStringFromParameters___block_invoke;
  v9[3] = &unk_264E5A8A8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = [v6 componentsJoinedByString:@"&"];

  return v7;
}

void __39__ENGCOAuth_queryStringFromParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSString;
  id v6 = a3;
  id v7 = [a2 pcen];
  id v8 = [v6 pcen];

  [v5 stringWithFormat:@"%@=%@", v7, v8];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v9];
}

+ (id)timeStamp
{
  time_t v5 = 0;
  time(&v5);
  v2 = gmtime(&v5);
  mktime(v2);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", GCOAuthTimeStampOffset + v5);
  return v3;
}

+ (id)nonce
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return v3;
}

+ (void)setHTTPShouldHandleCookies:(BOOL)a3
{
  GCOAuthUseHTTPSCookieStorage = a3;
}

+ (void)setTimeStampOffset:(int64_t)a3
{
  GCOAuthTimeStampOffset = a3;
}

+ (void)setUserAgent:(id)a3
{
  uint64_t v3 = [a3 copy];
  id v4 = (void *)GCOAuthUserAgent;
  GCOAuthUserAgent = v3;
}

@end
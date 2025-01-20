@interface MPHomeSharingURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)initialize;
- (void)startLoading;
@end

@implementation MPHomeSharingURLProtocol

- (void)startLoading
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = MEMORY[0x19971DE60](self, a2);
  v34 = self;
  v3 = [(NSURLProtocol *)self request];
  v4 = [v3 URL];

  v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingURLProtocol] Starting loading for %{public}@", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E4F28E78];
  v7 = [v4 absoluteString];
  v8 = [v6 stringWithString:v7];

  v35 = v4;
  v9 = [v4 scheme];
  objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, objc_msgSend(v9, "length"), @"http");

  v37 = v8;
  [v8 appendString:@"&daap-no-disconnect=1"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v10 = +[MPMediaLibrary mediaLibraries];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v11)
  {
LABEL_13:

LABEL_20:
    v16 = [(NSURLProtocol *)v34 client];
    v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HomeSharingURLProtocolErrorDomain" code:-1 userInfo:0];
    [v16 URLProtocol:v34 didFailWithError:v25];
    v23 = v35;
    v22 = (void *)v36;
    goto LABEL_21;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v39;
LABEL_5:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v39 != v13) {
      objc_enumerationMutation(v10);
    }
    v15 = [*(id *)(*((void *)&v38 + 1) + 8 * v14) libraryDataProvider];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    v16 = [v15 homeSharingLibrary];
    v17 = [v16 baseURL];
    v18 = [v17 absoluteString];
    char v19 = [v37 hasPrefix:v18];

    if (v19) {
      break;
    }

LABEL_11:
    if (v12 == ++v14)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v12) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }

  if (!v16) {
    goto LABEL_20;
  }
  v20 = [v16 homeSharingGroupID];
  uint64_t v21 = [v20 length];

  v23 = v35;
  v22 = (void *)v36;
  if (v21)
  {
    v24 = [v16 homeSharingGroupID];
    [v37 appendFormat:@"&hsgid=%@", v24];
  }
  [v37 appendString:@"&hs-mobile-device-client=1"];
  v25 = [MEMORY[0x1E4F1CB10] URLWithString:v37];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F290D8]) initWithURL:v35 MIMEType:@"text/plain" expectedContentLength:0 textEncodingName:0];
  v27 = [MEMORY[0x1E4F28E88] requestWithURL:v25];
  v28 = [(NSURLProtocol *)v34 request];
  v29 = [v28 allHTTPHeaderFields];
  v30 = (void *)[v29 mutableCopy];

  v31 = [v16 securityInfoForURL:v25];
  if (v31) {
    [v30 setObject:v31 forKey:@"Client-Daap-Validation"];
  }
  v32 = objc_msgSend(NSString, "stringWithFormat:", @"%u", atomic_fetch_add_explicit(&startLoading___requestID, 1u, memory_order_relaxed) + 1);
  [v30 setObject:v32 forKey:@"Client-Daap-Request-Id"];

  [v27 setAllHTTPHeaderFields:v30];
  v33 = [(NSURLProtocol *)v34 client];
  [v33 URLProtocol:v34 wasRedirectedToRequest:v27 redirectResponse:v26];
  [v33 URLProtocolDidFinishLoading:v34];

LABEL_21:
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x19971DE60]();
  v5 = [v3 URL];
  v6 = [v5 scheme];
  char v7 = [v6 isEqualToString:@"home-sharing"];

  return v7;
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = (void *)MEMORY[0x1E4F290C0];
    [v4 registerClass:a1];
  }
}

@end
@interface SLRequest
+ (SLRequest)requestForServiceType:(NSString *)serviceType requestMethod:(SLRequestMethod)requestMethod URL:(NSURL *)url parameters:(NSDictionary *)parameters;
- (ACAccount)account;
- (BOOL)_requiresAuthorization;
- (BOOL)_shouldAppendTencentWeiboParametersToRequest;
- (BOOL)_shouldRetryAfterCount:(int)a3 delay:(float *)a4;
- (BOOL)shouldIncludeParameterString;
- (NSDictionary)parameters;
- (NSURL)URL;
- (NSURLRequest)preparedURLRequest;
- (SLRequest)init;
- (SLRequest)initWithServiceType:(id)a3 URL:(id)a4 parameters:(id)a5 requestMethod:(int64_t)a6;
- (SLRequestMethod)requestMethod;
- (id)OAuthCredential;
- (id)_HTTPMethodName;
- (id)_allParameters;
- (id)_commandName;
- (id)_parameterString;
- (id)_preparedURL;
- (id)_urlEncodedString:(id)a3;
- (id)completeMultiParts;
- (id)dictionaryRepresentationForJSONSerialization;
- (id)multiPartBodyData;
- (id)multiPartBoundary;
- (id)multiParts;
- (id)parameterForKey:(id)a3;
- (int)callingPID;
- (unint64_t)networkServiceType;
- (void)_addAuthenticationParameters:(id)a3;
- (void)addMultiPart:(id)a3;
- (void)addMultipartData:(NSData *)data withName:(NSString *)name type:(NSString *)type;
- (void)addMultipartData:(NSData *)data withName:(NSString *)name type:(NSString *)type filename:(NSString *)filename;
- (void)performJSONRequestWithHandler:(id)a3;
- (void)performJSONRequestWithHandler:(id)a3 retryCount:(int)a4;
- (void)performRequestWithHandler:(SLRequestHandler)handler;
- (void)removeParameterForKey:(id)a3;
- (void)setAccount:(ACAccount *)account;
- (void)setApplicationID:(id)a3;
- (void)setCallingPID:(int)a3;
- (void)setContentType:(id)a3;
- (void)setMultiPartBoundary:(id)a3;
- (void)setNetworkServiceType:(unint64_t)a3;
- (void)setOAuthCredential:(id)a3;
- (void)setParameterValue:(id)a3 forKey:(id)a4;
- (void)setPayload:(id)a3;
@end

@implementation SLRequest

- (SLRequest)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"SLRequestMultiPart must be obtained through!" userInfo:0];
  objc_exception_throw(v2);
}

- (SLRequest)initWithServiceType:(id)a3 URL:(id)a4 parameters:(id)a5 requestMethod:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = +[SLService serviceForServiceType:a3];
  if (v12)
  {
    v23.receiver = self;
    v23.super_class = (Class)SLRequest;
    v13 = [(SLRequest *)&v23 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_service, v12);
      uint64_t v15 = [v10 copy];
      url = v14->_url;
      v14->_url = (NSURL *)v15;

      if (v11)
      {
        uint64_t v17 = [v11 mutableCopy];
      }
      else
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      }
      parameters = v14->_parameters;
      v14->_parameters = (NSMutableDictionary *)v17;

      v14->_requestMethod = a6;
      v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      multiParts = v14->_multiParts;
      v14->_multiParts = v20;
    }
    self = v14;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (SLRequest)requestForServiceType:(NSString *)serviceType requestMethod:(SLRequestMethod)requestMethod URL:(NSURL *)url parameters:(NSDictionary *)parameters
{
  id v10 = parameters;
  id v11 = url;
  v12 = serviceType;
  v13 = (void *)[objc_alloc((Class)a1) initWithServiceType:v12 URL:v11 parameters:v10 requestMethod:requestMethod];

  return (SLRequest *)v13;
}

- (void)setParameterValue:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!v7 || !v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Parameter key or value cannot be nil"];
  }
  [(NSMutableDictionary *)self->_parameters setObject:v7 forKey:v6];
}

- (void)removeParameterForKey:(id)a3
{
}

- (id)parameterForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parameters objectForKey:a3];
}

- (id)_urlEncodedString:(id)a3
{
  v3 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)a3, 0, @":/?#[]@!$&‚Äö√Ñ√¥()*+,;='",
                       0x8000100u);

  return v3;
}

- (id)multiPartBoundary
{
  if (!self->_multiPartBoundary)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    id v6 = (__CFString *)CFUUIDCreateString(v4, v5);
    CFRelease(v5);
    id v7 = [NSString stringWithFormat:@"__mIm310v34411-%@__", v6];
    multiPartBoundary = self->_multiPartBoundary;
    self->_multiPartBoundary = v7;
  }
  _SLLog(v2, 6, @"Multipart boundary %@");
  v9 = self->_multiPartBoundary;

  return v9;
}

- (void)setMultiPartBoundary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_multiPartBoundary = &self->_multiPartBoundary;
  objc_storeStrong((id *)&self->_multiPartBoundary, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_multiParts;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setMultiPartBoundary:", *p_multiPartBoundary, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)multiParts
{
  return self->_multiParts;
}

- (void)addMultiPart:(id)a3
{
}

- (void)addMultipartData:(NSData *)data withName:(NSString *)name type:(NSString *)type
{
}

- (void)addMultipartData:(NSData *)data withName:(NSString *)name type:(NSString *)type filename:(NSString *)filename
{
  uint64_t v10 = filename;
  uint64_t v11 = type;
  long long v12 = name;
  long long v13 = data;
  long long v14 = [(SLRequest *)self multiPartBoundary];
  id v15 = +[SLRequestMultiPart multiPartWithName:v12 payload:v13 type:v11 multiPartBoundary:v14];

  [v15 setFilename:v10];
  [(NSMutableArray *)self->_multiParts addObject:v15];
}

- (id)multiPartBodyData
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA58] data];
  v28 = self;
  CFAllocatorRef v4 = [(SLRequest *)self _allParameters];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKey:v9];
        uint64_t v11 = [v10 dataUsingEncoding:4];
        long long v12 = [(SLRequest *)v28 multiPartBoundary];
        long long v13 = +[SLRequestMultiPart multiPartWithName:v9 payload:v11 type:0 multiPartBoundary:v12];

        if (v13)
        {
          long long v14 = [v13 partData];
          [v3 appendData:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }
  v26 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  _SLLog(v27, 6, @"Body before binaries: %@");

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v28->_multiParts;
  uint64_t v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16, v26);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v29 + 1) + 8 * j) partData];
        [v3 appendData:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v17);
  }

  v21 = NSString;
  v22 = [(SLRequest *)v28 multiPartBoundary];
  objc_super v23 = [v21 stringWithFormat:@"--%@--\r\n", v22];
  v24 = [v23 dataUsingEncoding:4];
  [v3 appendData:v24];

  return v3;
}

- (id)completeMultiParts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v15 = self;
  CFAllocatorRef v4 = [(SLRequest *)self _allParameters];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKey:v9];
        uint64_t v11 = [v10 dataUsingEncoding:4];
        long long v12 = [(SLRequest *)v15 multiPartBoundary];
        long long v13 = +[SLRequestMultiPart multiPartWithName:v9 payload:v11 type:0 multiPartBoundary:v12];

        [v3 addObject:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  [v3 addObjectsFromArray:v15->_multiParts];

  return v3;
}

- (void)setAccount:(ACAccount *)account
{
  CFAllocatorRef v4 = account;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(ACAccount *)v4 accountType];
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = [(SLService *)self->_service accountTypeIdentifier];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid account type for this request" userInfo:0];
      objc_exception_throw(v11);
    }
  }
  uint64_t v10 = self->_account;
  self->_account = v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setOAuthCredential:(id)a3
{
}

- (id)OAuthCredential
{
  return self->_OAuthCredential;
}

- (void)setCallingPID:(int)a3
{
  self->_callingPID = a3;
}

- (int)callingPID
{
  return self->_callingPID;
}

- (void)setApplicationID:(id)a3
{
}

- (id)_allParameters
{
  v3 = (void *)[(NSMutableDictionary *)self->_parameters mutableCopy];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  }
  [(SLService *)self->_service addExtraParameters:v3 forRequest:self];
  [(SLRequest *)self _addAuthenticationParameters:v3];

  return v3;
}

- (BOOL)_shouldAppendTencentWeiboParametersToRequest
{
  uint64_t v2 = [(SLRequest *)self account];
  v3 = [v2 accountType];
  CFAllocatorRef v4 = [v3 identifier];
  char v5 = [v4 isEqual:*MEMORY[0x1E4F17860]];

  return v5;
}

- (void)_addAuthenticationParameters:(id)a3
{
  v37[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SLService *)self->_service authenticationStyle] == 1)
  {
    uint64_t v6 = [(SLRequest *)self account];

    if (v6)
    {
      uint64_t v7 = [(SLRequest *)self account];
      uint64_t v8 = [v7 credential];

      if (v8)
      {
        char v9 = [v8 credentialType];
        int v10 = [v9 isEqualToString:*MEMORY[0x1E4F178B8]];

        if (v10)
        {
          id v11 = [v8 oauthToken];

          if (v11)
          {
            long long v12 = [v8 oauthToken];
            [v5 setObject:v12 forKey:@"access_token"];
          }
        }
      }
    }
  }
  if ([(SLRequest *)self _shouldAppendTencentWeiboParametersToRequest])
  {
    long long v13 = [(SLRequest *)self account];
    long long v14 = [v13 credential];
    uint64_t v15 = [v14 oauthToken];
    if (v15)
    {
      long long v16 = (void *)v15;
      long long v17 = [(SLRequest *)self account];
      long long v18 = [v17 credential];
      long long v19 = [v18 oauthRefreshToken];

      if (v19)
      {
        v20 = [(SLRequest *)self account];
        uint64_t v21 = [v20 credential];
        v22 = [v21 credentialItemForKey:*MEMORY[0x1E4F17980]];

        if (v22)
        {
          v36[0] = @"format";
          v36[1] = @"clientip";
          v37[0] = @"json";
          v37[1] = @"0.0.0.0";
          v36[2] = @"oauth_version";
          v36[3] = @"scope";
          v37[2] = @"2.a";
          v37[3] = @"all";
          v37[4] = v22;
          v36[4] = @"oauth_consumer_key";
          v36[5] = @"access_token";
          objc_super v23 = [(SLRequest *)self account];
          v24 = [v23 credential];
          v25 = [v24 oauthToken];
          v37[5] = v25;
          v36[6] = @"openid";
          v26 = [(SLRequest *)self account];
          uint64_t v27 = [v26 credential];
          v28 = [v27 oauthRefreshToken];
          v37[6] = v28;
          long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:7];

          [v5 addEntriesFromDictionary:v29];
        }
        else
        {
          _SLLog(v3, 6, @"Missing credential's consumer key, forfeiting the addition of parameters");
        }

        goto LABEL_17;
      }
    }
    else
    {
    }
    long long v30 = [(SLRequest *)self account];
    long long v31 = [v30 credential];
    long long v32 = [v31 oauthToken];
    long long v33 = [(SLRequest *)self account];
    long long v34 = [v33 credential];
    long long v35 = [v34 oauthRefreshToken];
    _SLLog(v3, 6, @"Missing oauthToken (%@) or oauthRefreshToken (%@)");
  }
LABEL_17:
}

- (id)_parameterString
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = [(SLRequest *)self _allParameters];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __29__SLRequest__parameterString__block_invoke;
  v37[3] = &unk_1E6467410;
  id v23 = v5;
  id v38 = v23;
  uint64_t v39 = self;
  uint64_t v6 = (void (**)(void, void, void))MEMORY[0x1C876A6A0](v37);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    uint64_t v24 = *(void *)v34;
    id v25 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * v11);
        long long v13 = [v7 objectForKey:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ((void (**)(void, uint64_t, void *))v6)[2](v6, v12, v13);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = v13;
            uint64_t v28 = v11;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v14 = v13;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v40 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v30 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    v6[2](v6, v12, v19);
                  }
                  else {
                    _SLLog(v2, 3, @"Invalid parameter type");
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v40 count:16];
              }
              while (v16);
            }

            uint64_t v10 = v24;
            id v7 = v25;
            uint64_t v9 = v26;
            long long v13 = v27;
            uint64_t v11 = v28;
          }
          else
          {
            _SLLog(v2, 3, @"Invalid parameter type");
          }
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v9);
  }

  v20 = [v23 sortedArrayUsingSelector:sel_compare_];
  uint64_t v21 = [v20 componentsJoinedByString:@"&"];

  return v21;
}

void __29__SLRequest__parameterString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSString;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v8 = a3;
  id v11 = [v7 _urlEncodedString:a2];
  uint64_t v9 = [*(id *)(a1 + 40) _urlEncodedString:v8];

  uint64_t v10 = [v5 stringWithFormat:@"%@=%@", v11, v9];
  [v6 addObject:v10];
}

- (BOOL)_requiresAuthorization
{
  return self->_account || self->_OAuthCredential != 0;
}

- (BOOL)shouldIncludeParameterString
{
  BOOL result = 0;
  if (self->_requestMethod != 1)
  {
    if ([(NSMutableDictionary *)self->_parameters count]) {
      return 1;
    }
    uint64_t v4 = [(SLRequest *)self account];
    if (v4)
    {
      id v5 = (void *)v4;
      uint64_t v6 = [(SLService *)self->_service authenticationStyle];

      if (v6 == 1) {
        return 1;
      }
    }
  }
  return result;
}

- (id)_preparedURL
{
  if ([(SLRequest *)self shouldIncludeParameterString])
  {
    uint64_t v3 = NSString;
    uint64_t v4 = [(NSURL *)self->_url absoluteString];
    id v5 = [(SLRequest *)self _parameterString];
    uint64_t v6 = [v3 stringWithFormat:@"%@?%@", v4, v5];

    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  }
  else
  {
    id v7 = self->_url;
  }

  return v7;
}

- (id)_HTTPMethodName
{
  unint64_t requestMethod = self->_requestMethod;
  if (requestMethod > 3) {
    return 0;
  }
  else {
    return off_1E64674A8[requestMethod];
  }
}

- (NSURLRequest)preparedURLRequest
{
  uint64_t v3 = [(SLRequest *)self _preparedURL];
  uint64_t v4 = [MEMORY[0x1E4F28E88] requestWithURL:v3];
  objc_msgSend(v4, "setNetworkServiceType:", -[SLRequest networkServiceType](self, "networkServiceType"));
  id v5 = [(SLRequest *)self _HTTPMethodName];
  [v4 setHTTPMethod:v5];

  if ((self->_requestMethod | 2) != 3) {
    goto LABEL_8;
  }
  if (self->_payload)
  {
    objc_msgSend(v4, "setHTTPBody:");
    contentType = self->_contentType;
    if (contentType) {
      [v4 addValue:contentType forHTTPHeaderField:@"Content-Type"];
    }
    goto LABEL_8;
  }
  if (![(NSMutableArray *)self->_multiParts count])
  {
    uint64_t v16 = [(SLRequest *)self _parameterString];
    uint64_t v17 = [v16 dataUsingEncoding:4];
    [v4 setHTTPBody:v17];

LABEL_8:
    long long v13 = 0;
    int v15 = 0;
    goto LABEL_9;
  }
  id v7 = NSString;
  id v8 = [(SLRequest *)self multiPartBoundary];
  uint64_t v9 = [v7 stringWithFormat:@"multipart/form-data boundary=%@", v8];;

  [v4 addValue:v9 forHTTPHeaderField:@"Content-Type"];
  uint64_t v10 = [SLRequestBodyInputStream alloc];
  id v11 = [(SLRequest *)self completeMultiParts];
  uint64_t v12 = [(SLRequest *)self multiPartBoundary];
  long long v13 = [(SLRequestBodyInputStream *)v10 initWithMultiParts:v11 multiPartBoundary:v12];

  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[SLRequestBodyInputStream totalBytes](v13, "totalBytes"));
  [v4 addValue:v14 forHTTPHeaderField:@"Content-Length"];

  int v15 = 1;
LABEL_9:
  id v18 = v4;
  uint64_t v19 = v18;
  if (![(SLService *)self->_service authenticationStyle])
  {
    uint64_t v19 = v18;
    if ([(SLRequest *)self _requiresAuthorization])
    {
      if (self->_account)
      {
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F179F0]) initWithAccount:self->_account];
        [v20 setShouldIncludeAppIdInRequest:0];
        if (self->_callingPID < 1)
        {
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:");
        }
        uint64_t v19 = [v20 signedURLRequestWithURLRequest:v18 callingPID:v21 timestamp:0];
      }
      else
      {
        uint64_t v19 = v18;
        if (!self->_OAuthCredential) {
          goto LABEL_19;
        }
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F83918]) initWithCredential:self->_OAuthCredential];
        uint64_t v19 = [v20 signedURLRequestWithRequest:v18 applicationID:0 timestamp:0];
        uint64_t v21 = v18;
      }
    }
  }
LABEL_19:
  if (v15)
  {
    v22 = (void *)[v19 mutableCopy];

    [v22 setHTTPBodyStream:v13];
    uint64_t v19 = v22;
  }

  return (NSURLRequest *)v19;
}

- (id)dictionaryRepresentationForJSONSerialization
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(SLRequest *)self _HTTPMethodName];
  [v3 setObject:v4 forKeyedSubscript:@"method"];

  id v5 = [(SLRequest *)self _preparedURL];
  uint64_t v6 = [v5 query];

  id v7 = [v5 relativePath];
  if (v6)
  {
    id v8 = [v5 query];
    uint64_t v9 = [v7 stringByAppendingString:v8];
    [v3 setObject:v9 forKeyedSubscript:@"relative_url"];
  }
  else
  {
    [v3 setObject:v7 forKeyedSubscript:@"relative_url"];
  }

  if (self->_requestMethod == 1)
  {
    uint64_t v10 = [(SLRequest *)self _parameterString];
    [v3 setObject:v10 forKeyedSubscript:@"body"];

    if ([(NSMutableArray *)self->_multiParts count])
    {
      id v11 = objc_opt_new();
      multiParts = self->_multiParts;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__SLRequest_dictionaryRepresentationForJSONSerialization__block_invoke;
      v16[3] = &unk_1E6467438;
      id v17 = v11;
      id v13 = v11;
      [(NSMutableArray *)multiParts enumerateObjectsUsingBlock:v16];
      id v14 = [v13 componentsJoinedByString:@","];
      [v3 setObject:v14 forKeyedSubscript:@"attached_files"];
    }
  }

  return v3;
}

void __57__SLRequest_dictionaryRepresentationForJSONSerialization__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

- (void)performRequestWithHandler:(SLRequestHandler)handler
{
  v17[1] = *MEMORY[0x1E4F143B8];
  SLRequestHandler v5 = handler;
  uint64_t v6 = [(SLRequest *)self preparedURLRequest];
  uint64_t v12 = [v6 URL];
  _SLLog(v3, 7, @"Prepared Request URL: %@");

  if (v6)
  {
    id v7 = objc_msgSend(v5, "copy", v12);
    id v8 = dispatch_queue_create("SLRequest performRequest queue", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__SLRequest_performRequestWithHandler___block_invoke;
    block[3] = &unk_1E6467460;
    id v14 = v6;
    id v15 = v7;
    id v9 = v7;
    dispatch_async(v8, block);

    uint64_t v10 = v14;
  }
  else
  {
    _SLLog(v3, 3, @"Failed to prepare request");
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Could not prepare the URL request.";
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v11 errorWithDomain:@"SLErrorDomain" code:0 userInfo:v9];
    (*((void (**)(SLRequestHandler, void, void, void *))v5 + 2))(v5, 0, 0, v10);
  }
}

void __39__SLRequest_performRequestWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v12 = 0;
  id v13 = 0;
  uint64_t v4 = [MEMORY[0x1E4F29090] sendSynchronousRequest:v3 returningResponse:&v13 error:&v12];
  id v5 = v13;
  id v6 = v12;
  uint64_t v7 = [v5 statusCode];
  if (v6)
  {
    id v11 = [v6 localizedDescription];
    _SLLog(v1, 3, @"Request error: %@");

    if (!v5)
    {
      id v8 = objc_msgSend(v6, "userInfo", v11);
      id v9 = [v8 objectForKey:*MEMORY[0x1E4F28A50]];

      if (v9)
      {
        uint64_t v10 = [v9 userInfo];
        id v5 = (id)[v10 objectForKey:*MEMORY[0x1E4F18F40]];

        if (v5)
        {
          id v5 = [MEMORY[0x1E4F28D20] _responseWithCFURLResponse:v5];
        }
      }
      else
      {
        id v5 = 0;
      }
    }
  }
  else if (v7 != 200)
  {
    _SLLog(v1, 3, @"Request status was %d");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_shouldRetryAfterCount:(int)a3 delay:(float *)a4
{
  if (a4)
  {
    float v4 = (double)a3 * 5.0;
    *a4 = v4;
  }
  return a3 < 4;
}

- (id)_commandName
{
  uint64_t v2 = [(NSURL *)self->_url path];
  uint64_t v3 = [v2 lastPathComponent];

  return v3;
}

- (void)performJSONRequestWithHandler:(id)a3 retryCount:(int)a4
{
  id v6 = (void *)[a3 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SLRequest_performJSONRequestWithHandler_retryCount___block_invoke;
  v9[3] = &unk_1E6467488;
  v9[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v7 = v6;
  id v8 = (void *)MEMORY[0x1C876A6A0](v9);
  [(SLRequest *)self performRequestWithHandler:v8];
}

void __54__SLRequest_performJSONRequestWithHandler_retryCount___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 statusCode];
  if (!v9 && v10)
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_10:
    v12();
    goto LABEL_11;
  }
  if (v11 > 499)
  {
    float v18 = 0.0;
    if (v11 != 503
      || ![*(id *)(a1 + 32) _shouldRetryAfterCount:*(unsigned int *)(a1 + 48) delay:&v18])
    {
      id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_10;
    }
    id v15 = [*(id *)(a1 + 32) _commandName];
    double v17 = v18;
    uint64_t v16 = (*(_DWORD *)(a1 + 48) + 1);
    _SLLog(v4, 6, @"(503) %@ retrying:%d of %d delay: %f");

    sleep((int)v18);
    objc_msgSend(*(id *)(a1 + 32), "performJSONRequestWithHandler:retryCount:", *(void *)(a1 + 40), (*(_DWORD *)(a1 + 48) + 1), v15, v16, 4, *(void *)&v17);
  }
  else
  {
    id v19 = 0;
    id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v19];
    id v14 = v19;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_11:
}

- (void)performJSONRequestWithHandler:(id)a3
{
}

- (void)setContentType:(id)a3
{
}

- (void)setPayload:(id)a3
{
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  self->_networkServiceType = a3;
}

- (unint64_t)networkServiceType
{
  return self->_networkServiceType;
}

- (NSURL)URL
{
  return self->_url;
}

- (NSDictionary)parameters
{
  return &self->_parameters->super;
}

- (SLRequestMethod)requestMethod
{
  return self->_requestMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_multiPartBoundary, 0);
  objc_storeStrong((id *)&self->_multiParts, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_OAuthCredential, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end
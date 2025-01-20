@interface AARegisterRequest
+ (Class)responseClass;
- (AARegisterRequest)initWithURLString:(id)a3 username:(id)a4 password:(id)a5;
- (id)urlRequest;
- (id)urlString;
- (void)addCookieHeaders:(id)a3;
@end

@implementation AARegisterRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AARegisterRequest)initWithURLString:(id)a3 username:(id)a4 password:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AARegisterRequest;
  v10 = [(AARequest *)&v13 initWithURLString:a3];
  v11 = v10;
  if (v10)
  {
    [(AAAuthenticateRequest *)v10 setUsername:v8];
    [(AAAuthenticateRequest *)v11 setPassword:v9];
  }

  return v11;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 signInURL];

  return v3;
}

- (void)addCookieHeaders:(id)a3
{
  id v4 = a3;
  additionalCookieHeaders = self->_additionalCookieHeaders;
  id v8 = v4;
  if (!additionalCookieHeaders)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = self->_additionalCookieHeaders;
    self->_additionalCookieHeaders = v6;

    id v4 = v8;
    additionalCookieHeaders = self->_additionalCookieHeaders;
  }
  [(NSMutableDictionary *)additionalCookieHeaders addEntriesFromDictionary:v4];
}

- (id)urlRequest
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)AARegisterRequest;
  v3 = [(AAAuthenticateRequest *)&v31 urlRequest];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(AARequest *)self bodyDictionary];
  v6 = objc_msgSend(v4, "aa_setXMLBodyWithParameters:", v5);

  id v7 = [NSString alloc];
  id v8 = v6;
  id v9 = objc_msgSend(v7, "initWithBytes:length:encoding:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 4);
  v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v9;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v11 = (void *)[(NSMutableDictionary *)self->_additionalCookieHeaders copy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v18 = objc_msgSend(v12, "objectForKeyedSubscript:", v17, (void)v27);
        [v4 setValue:v18 forHTTPHeaderField:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v14);
  }

  v19 = +[AADeviceInfo udid];
  [v4 setValue:v19 forHTTPHeaderField:@"Device-UDID"];

  objc_msgSend(v4, "aa_addMultiUserDeviceHeaderIfEnabled");
  v20 = _AALogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v34 = v21;
    _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_opt_class();
    v24 = [v4 allHTTPHeaderFields];
    v25 = [v23 redactedHeadersFromHTTPHeaders:v24];
    *(_DWORD *)buf = 138412290;
    v34 = v25;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "HTTP Headers: %@", buf, 0xCu);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
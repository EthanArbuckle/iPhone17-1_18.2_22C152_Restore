@interface BCOAuth2ResponseFactory
+ (id)makeResponseObjectWithDictionary:(id)a3 version:(int64_t)a4;
+ (id)makeResponseObjectWithRedirectURI:(id)a3;
@end

@implementation BCOAuth2ResponseFactory

+ (id)makeResponseObjectWithDictionary:(id)a3 version:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4 < 2)
  {
    v6 = [BCNativeOAuth2Response alloc];
    id v7 = v5;
    if (v6)
    {
      v35.receiver = v6;
      v35.super_class = (Class)BCNativeOAuth2Response;
      v6 = objc_msgSendSuper2(&v35, sel_init);
      if (v6)
      {
        v8 = LogCategory_Daemon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [v7 description];
          *(_DWORD *)buf = 138412290;
          v37 = v9;
          _os_log_impl(&dword_228C26000, v8, OS_LOG_TYPE_DEFAULT, "BCAuthenticationResponse: initWithDictionary %@", buf, 0xCu);
        }
        v10 = [v7 objectForKeyedSubscript:@"errors"];
        v11 = [MEMORY[0x263EFF9D0] null];
        if (v10 == v11)
        {
          v12 = 0;
        }
        else
        {
          v12 = [v7 objectForKeyedSubscript:@"errors"];
        }

        v13 = [v7 objectForKeyedSubscript:@"token"];
        v14 = [MEMORY[0x263EFF9D0] null];
        if (v13 == v14)
        {
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v15 = [v7 objectForKeyedSubscript:@"token"];
        }

        v16 = [v7 objectForKeyedSubscript:@"status"];
        v17 = [MEMORY[0x263EFF9D0] null];
        if (v16 == v17)
        {
          v18 = 0;
        }
        else
        {
          v18 = [v7 objectForKeyedSubscript:@"status"];
        }

        if (v12)
        {
          v29 = v18;
          uint64_t v30 = v15;
          v19 = (NSArray *)objc_opt_new();
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v20 = v12;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:buf count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v32 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = [[BCError alloc] initWithDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i)];
                if (v25) {
                  [(NSArray *)v19 addObject:v25];
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:buf count:16];
            }
            while (v22);
          }

          errors = v6->_errors;
          v6->_errors = v19;

          uint64_t v15 = v30;
          v18 = v29;
        }
        token = v6->_token;
        v6->_token = (NSString *)v15;

        v6->_status = NativeAuthStatusFromNSString(v18);
      }
    }
  }
  else
  {
    v6 = [[BCServerSideOAuth2Response alloc] _initWithDictionary:v5];
  }

  return v6;
}

+ (id)makeResponseObjectWithRedirectURI:(id)a3
{
  id v3 = a3;
  v4 = [[BCServerSideOAuth2Response alloc] initWithRedirectURI:v3];

  return v4;
}

@end
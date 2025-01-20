@interface TokenChallenger
- (BOOL)isTokenUnlocked;
- (NSArray)components;
- (NSArray)fdrTypes;
- (NSString)token;
- (NSURL)endpoint;
- (NSURL)endpointBaseURL;
- (StartPreflightSigner)signer;
- (TokenChallenger)initWithToken:(id)a3 components:(id)a4 fdrTypes:(id)a5 endpoint:(id)a6 signer:(id)a7;
- (id)baseURL:(id)a3;
- (id)description;
- (id)localizedComponents;
- (id)localizedComponentsMap;
- (int64_t)_sanityCheckBuddyMLResponse:(id)a3 data:(id)a4;
- (int64_t)constructChallengeRequestDataWithToken:(id)a3 data:(id *)a4;
- (void)_requestBuddyML:(id)a3 session:(id)a4 completion:(id)a5;
- (void)fetchPasswordWithCompletion:(id)a3;
- (void)setComponents:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setEndpointBaseURL:(id)a3;
- (void)setFdrTypes:(id)a3;
- (void)setIsTokenUnlocked:(BOOL)a3;
- (void)setSigner:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation TokenChallenger

- (TokenChallenger)initWithToken:(id)a3 components:(id)a4 fdrTypes:(id)a5 endpoint:(id)a6 signer:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TokenChallenger;
  v17 = [(TokenChallenger *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_token, a3);
    objc_storeStrong((id *)&v18->_signer, a7);
    objc_storeStrong((id *)&v18->_endpoint, a6);
    objc_storeStrong((id *)&v18->_components, a4);
    objc_storeStrong((id *)&v18->_fdrTypes, a5);
    uint64_t v19 = [(TokenChallenger *)v18 baseURL:v15];
    endpointBaseURL = v18->_endpointBaseURL;
    v18->_endpointBaseURL = (NSURL *)v19;

    v18->_isTokenUnlocked = 0;
  }

  return v18;
}

- (void)fetchPasswordWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, int64_t))a3;
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(TokenChallenger *)self token];
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching password UI with token: %@", buf, 0xCu);
  }
  v7 = [(TokenChallenger *)self token];
  id v18 = 0;
  int64_t v8 = [(TokenChallenger *)self constructChallengeRequestDataWithToken:v7 data:&v18];
  id v9 = v18;

  if (v8)
  {
    v10 = handleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000100F4();
    }

    v4[2](v4, 0, v8);
  }
  else
  {
    v11 = [(TokenChallenger *)self endpoint];
    v12 = +[NSMutableURLRequest requestWithURL:v11];

    [v12 setHTTPMethod:@"POST"];
    [v12 setHTTPBody:v9];
    [v12 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    id v13 = +[NSLocale preferredLanguages];
    uint64_t v14 = [v13 firstObject];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = @"en";
    }
    [v12 setValue:v16 forHTTPHeaderField:@"Accept-Language"];

    v17 = +[NSURLSession sharedSession];
    [(TokenChallenger *)self _requestBuddyML:v12 session:v17 completion:v4];
  }
}

- (int64_t)constructChallengeRequestDataWithToken:(id)a3 data:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    CFStringRef v28 = @"Token";
    id v29 = v6;
    int64_t v8 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v25 = 0;
    id v9 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:100 options:0 error:&v25];
    id v10 = v25;
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v9 == 0;
    }
    if (v11)
    {
      id v12 = v10;
      id v13 = handleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10001022C();
      }
      int64_t v14 = -108;
    }
    else
    {
      id v15 = [(TokenChallenger *)self signer];
      CFStringRef v16 = [v15 baaCert];

      if (v16)
      {
        v17 = [(TokenChallenger *)self signer];
        id v13 = [v17 signData:v9];

        if (v13)
        {
          v27[0] = v9;
          v26[0] = @"Payload";
          v26[1] = @"RKCertification";
          id v18 = [(TokenChallenger *)self signer];
          uint64_t v19 = [v18 baaCert];
          v26[2] = @"RKSignature";
          v27[1] = v19;
          v27[2] = v13;
          v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

          id v24 = 0;
          v21 = +[NSPropertyListSerialization dataWithPropertyList:v20 format:100 options:0 error:&v24];
          id v12 = v24;
          if (v12)
          {
            id v22 = handleForCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_1000101C4();
            }

            int64_t v14 = -108;
          }
          else
          {
            int64_t v14 = 0;
            if (a4) {
              *a4 = v21;
            }
          }
        }
        else
        {
          id v13 = handleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_100010190();
          }
          id v12 = 0;
          int64_t v14 = -110;
        }
      }
      else
      {
        id v13 = handleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10001015C();
        }
        id v12 = 0;
        int64_t v14 = -109;
      }
    }
  }
  else
  {
    int64_t v14 = -309;
  }

  return v14;
}

- (id)localizedComponents
{
  v3 = +[NSMutableArray array];
  v4 = [(TokenChallenger *)self components];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(TokenChallenger *)self components];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          BOOL v11 = +[NSBundle mainBundle];
          id v12 = [v11 localizedStringForKey:v10 value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];
          [v3 addObject:v12];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }

  return v3;
}

- (id)localizedComponentsMap
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(TokenChallenger *)self components];
  id v5 = [v4 count];
  id v6 = [(TokenChallenger *)self fdrTypes];
  id v7 = [v6 count];

  if (v5 == v7)
  {
    uint64_t v8 = [(TokenChallenger *)self fdrTypes];
    id v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        BOOL v11 = [(TokenChallenger *)self fdrTypes];
        id v12 = [v11 objectAtIndexedSubscript:v10];

        id v13 = [(TokenChallenger *)self components];
        long long v14 = [v13 objectAtIndexedSubscript:v10];

        long long v15 = +[NSBundle mainBundle];
        long long v16 = [v15 localizedStringForKey:v14 value:&stru_100018BD0 table:@"StartPreflightPlugin-Release"];

        [v3 setObject:v16 forKeyedSubscript:v12];
        ++v10;
        long long v17 = [(TokenChallenger *)self fdrTypes];
        id v18 = [v17 count];
      }
      while (v10 < (unint64_t)v18);
    }
  }
  else
  {
    uint64_t v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100010294(self, v19);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v20 = [(TokenChallenger *)self fdrTypes];
    id v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [v3 setObject:*(void *)(*((void *)&v26 + 1) + 8 * i) forKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        }
        id v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v22);
    }
  }

  return v3;
}

- (void)_requestBuddyML:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 URL];
    *(_DWORD *)buf = 138543362;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request URL: %{public}@", buf, 0xCu);
  }
  id v13 = handleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = [v8 allHTTPHeaderFields];
    *(_DWORD *)buf = 138543362;
    id v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request Headers: %{public}@", buf, 0xCu);
  }
  long long v15 = [v8 HTTPBody];

  if (v15)
  {
    long long v16 = handleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_alloc((Class)NSString);
      id v18 = [v8 HTTPBody];
      id v19 = [v17 initWithData:v18 encoding:4];
      *(_DWORD *)buf = 138477827;
      id v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request Body: %{private}@", buf, 0xCu);
    }
  }
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_100009404;
  id v25 = &unk_100018840;
  long long v26 = self;
  id v27 = v10;
  id v20 = v10;
  id v21 = [v9 dataTaskWithRequest:v8 completionHandler:&v22];
  [v21 resume:v22, v23, v24, v25, v26];
}

- (int64_t)_sanityCheckBuddyMLResponse:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000103D4();
    }
    goto LABEL_10;
  }
  if (!v6)
  {
    id v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100010408();
    }
LABEL_10:
    int64_t v12 = -306;
LABEL_17:

    goto LABEL_18;
  }
  id v8 = [v5 MIMEType];
  unsigned __int8 v9 = [v8 isEqualToString:@"application/x-buddyml"];

  if ((v9 & 1) == 0)
  {
    id v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100010470(v5, v13);
    }
    int64_t v12 = -307;
    goto LABEL_17;
  }
  id v10 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
  unsigned __int8 v11 = [v10 containsString:@"<xmlui"];

  if ((v11 & 1) == 0)
  {
    id v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001043C();
    }
    int64_t v12 = -308;
    goto LABEL_17;
  }
  int64_t v12 = 0;
LABEL_18:

  return v12;
}

- (id)baseURL:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = [v3 scheme];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [v4 host];

  if (v6)
  {
    id v7 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:0];
    [v7 setPath:&stru_100018BD0];
    [v7 setQuery:0];
    [v7 setFragment:0];
    id v5 = [v7 URL];
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(TokenChallenger *)self token];
  id v6 = [(TokenChallenger *)self localizedComponentsMap];
  id v7 = [v6 allKeys];
  id v8 = +[NSString stringWithFormat:@"<%@: token = %@, components = %@>", v4, v5, v7];

  return v8;
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSURL)endpointBaseURL
{
  return self->_endpointBaseURL;
}

- (void)setEndpointBaseURL:(id)a3
{
}

- (BOOL)isTokenUnlocked
{
  return self->_isTokenUnlocked;
}

- (void)setIsTokenUnlocked:(BOOL)a3
{
  self->_isTokenUnlocked = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (StartPreflightSigner)signer
{
  return self->_signer;
}

- (void)setSigner:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (NSArray)fdrTypes
{
  return self->_fdrTypes;
}

- (void)setFdrTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdrTypes, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_signer, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_endpointBaseURL, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
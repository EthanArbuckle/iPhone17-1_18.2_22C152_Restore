@interface _DPSubmissionServiceHTTPClient
- (BOOL)uploadWithOHTTP;
- (NSDictionary)defaultHeaders;
- (NSString)defaultMethod;
- (NSString)defaultTLSTrustPinningPolicyName;
- (NSString)domain;
- (_DPSubmissionServiceHTTPClient)initWithDomain:(id)a3 retries:(unint64_t)a4;
- (_DPSubmissionServiceHTTPClient)initWithDomain:(id)a3 retries:(unint64_t)a4 method:(id)a5 tlsTrustPinningPolicyName:(id)a6 defaultHeaders:(id)a7 uploadWithOHTTP:(BOOL)a8;
- (id)_dataUploadRequest:(id)a3;
- (id)_session;
- (unint64_t)retries;
- (void)_downloadConfigFromURL:(id)a3 retries:(unint64_t)a4 onCompletion:(id)a5;
- (void)_uploadData:(id)a3 withHeaders:(id)a4 withRetries:(unint64_t)a5 onCompletion:(id)a6;
- (void)downloadConfigFromURL:(id)a3 completion:(id)a4;
- (void)setDefaultMethod:(id)a3;
- (void)setDefaultTLSTrustPinningPolicyName:(id)a3;
- (void)setDomain:(id)a3;
- (void)setRetries:(unint64_t)a3;
- (void)setUploadWithOHTTP:(BOOL)a3;
- (void)uploadData:(id)a3 onCompletion:(id)a4;
- (void)uploadData:(id)a3 withHeaders:(id)a4 onCompletion:(id)a5;
@end

@implementation _DPSubmissionServiceHTTPClient

- (_DPSubmissionServiceHTTPClient)initWithDomain:(id)a3 retries:(unint64_t)a4
{
  if (a4 >= 0xA) {
    a4 = 10;
  }
  return [(_DPSubmissionServiceHTTPClient *)self initWithDomain:a3 retries:a4 method:@"POST" tlsTrustPinningPolicyName:kSecPolicyNameAppleMMCSService defaultHeaders:&off_100079A18 uploadWithOHTTP:0];
}

- (_DPSubmissionServiceHTTPClient)initWithDomain:(id)a3 retries:(unint64_t)a4 method:(id)a5 tlsTrustPinningPolicyName:(id)a6 defaultHeaders:(id)a7 uploadWithOHTTP:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_DPSubmissionServiceHTTPClient;
  v18 = [(_DPSubmissionServiceHTTPClient *)&v22 init];
  if (v18)
  {
    v19 = (NSString *)[v14 copy];
    domain = v18->_domain;
    v18->_domain = v19;

    v18->_retries = a4;
    objc_storeStrong((id *)&v18->_defaultMethod, a5);
    objc_storeStrong((id *)&v18->_defaultTLSTrustPinningPolicyName, a6);
    objc_storeStrong((id *)&v18->_defaultHeaders, a7);
    v18->_uploadWithOHTTP = a8;
  }

  return v18;
}

- (void)uploadData:(id)a3 onCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[_DPLog service];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    id v11 = [v6 length];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Client is starting data upload, size: %lu", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(_DPSubmissionServiceHTTPClient *)self defaultHeaders];
  [(_DPSubmissionServiceHTTPClient *)self _uploadData:v6 withHeaders:v9 withRetries:[(_DPSubmissionServiceHTTPClient *)self retries] onCompletion:v7];
}

- (void)uploadData:(id)a3 withHeaders:(id)a4 onCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = +[_DPLog service];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    id v13 = [v8 length];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Client is starting data upload, size: %lu", (uint8_t *)&v12, 0xCu);
  }

  [(_DPSubmissionServiceHTTPClient *)self _uploadData:v8 withHeaders:v10 withRetries:[(_DPSubmissionServiceHTTPClient *)self retries] onCompletion:v9];
}

- (void)downloadConfigFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_DPSubmissionServiceHTTPClient *)self _downloadConfigFromURL:v7 retries:[(_DPSubmissionServiceHTTPClient *)self retries] onCompletion:v6];
}

- (void)_uploadData:(id)a3 withHeaders:(id)a4 withRetries:(unint64_t)a5 onCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    id v13 = [(_DPSubmissionServiceHTTPClient *)self _session];
    id v14 = [(_DPSubmissionServiceHTTPClient *)self _dataUploadRequest:v11];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100007D18;
    v17[3] = &unk_1000750D8;
    id v20 = v12;
    unint64_t v21 = a5;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v15 = [v13 uploadTaskWithRequest:v14 fromData:v18 completionHandler:v17];

    [v15 resume];
  }
  else
  {
    id v16 = +[_DPDediscoError errorWithCode:201 description:@"Cannot upload nil payload"];
    (*((void (**)(id, void *))v12 + 2))(v12, v16);
  }
}

- (void)_downloadConfigFromURL:(id)a3 retries:(unint64_t)a4 onCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_DPSubmissionServiceHTTPClient *)self _session];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10000806C;
  id v17 = &unk_100075100;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  unint64_t v21 = a4;
  id v11 = v9;
  id v12 = v8;
  id v13 = [v10 dataTaskWithURL:v12 completionHandler:&v14];

  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

- (id)_session
{
  v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v3 setRequestCachePolicy:1];
  [v3 setURLCache:0];
  if (self->_defaultTLSTrustPinningPolicyName) {
    objc_msgSend(v3, "set_tlsTrustPinningPolicyName:");
  }
  if ([(_DPSubmissionServiceHTTPClient *)self uploadWithOHTTP]) {
    objc_msgSend(v3, "set_usesNWLoader:", 1);
  }
  v4 = +[NSURLSession sessionWithConfiguration:v3];

  return v4;
}

- (id)_dataUploadRequest:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:@"%@", self->_domain];
  id v6 = +[NSURL URLWithString:v5];
  id v7 = +[NSMutableURLRequest requestWithURL:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v8 objectForKeyedSubscript:v13];
        [v7 setValue:v14 forHTTPHeaderField:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [(_DPSubmissionServiceHTTPClient *)self defaultMethod];
  [v7 setHTTPMethod:v15];

  if ([(_DPSubmissionServiceHTTPClient *)self uploadWithOHTTP]) {
    [v7 _setPrivacyProxyFailClosed:1];
  }

  return v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (unint64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(unint64_t)a3
{
  self->_retries = a3;
}

- (NSString)defaultMethod
{
  return self->_defaultMethod;
}

- (void)setDefaultMethod:(id)a3
{
}

- (NSString)defaultTLSTrustPinningPolicyName
{
  return self->_defaultTLSTrustPinningPolicyName;
}

- (void)setDefaultTLSTrustPinningPolicyName:(id)a3
{
}

- (BOOL)uploadWithOHTTP
{
  return self->_uploadWithOHTTP;
}

- (void)setUploadWithOHTTP:(BOOL)a3
{
  self->_uploadWithOHTTP = a3;
}

- (NSDictionary)defaultHeaders
{
  return self->_defaultHeaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultHeaders, 0);
  objc_storeStrong((id *)&self->_defaultTLSTrustPinningPolicyName, 0);
  objc_storeStrong((id *)&self->_defaultMethod, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
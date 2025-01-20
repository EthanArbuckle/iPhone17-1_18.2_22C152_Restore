@interface MCLURLDataLoaderTask
- (BOOL)background;
- (BOOL)cachedResponse;
- (BOOL)cancelled;
- (BOOL)download;
- (BOOL)responseClientError;
- (BOOL)responseOk;
- (BOOL)responseTimeout;
- (MCLURLDataLoaderTask)initWithCoder:(id)a3;
- (MCLURLDataLoaderTask)initWithURLRequest:(id)a3 targetPath:(id)a4 category:(id)a5 completionHandler:(id)a6 receiveData:(id)a7;
- (NSData)responseData;
- (NSError)error;
- (NSHTTPURLResponse)response;
- (NSString)category;
- (NSString)targetPath;
- (NSURL)URL;
- (NSURLRequest)originalRequest;
- (NSURLRequest)request;
- (float)progress;
- (id)completion;
- (id)contentType;
- (id)description;
- (id)receiveDataHandler;
- (id)redirectHandler;
- (id)userInfo;
- (void)applyFileExtension:(id)a3;
- (void)applyMimeType;
- (void)dispatchCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedResponse:(BOOL)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCategory:(id)a3;
- (void)setProgress:(float)a3;
- (void)setRedirectHandler:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MCLURLDataLoaderTask

- (MCLURLDataLoaderTask)initWithURLRequest:(id)a3 targetPath:(id)a4 category:(id)a5 completionHandler:(id)a6 receiveData:(id)a7
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  id v22 = 0;
  objc_storeStrong(&v22, a6);
  id v21 = 0;
  objc_storeStrong(&v21, a7);
  v7 = v26;
  v26 = 0;
  v20.receiver = v7;
  v20.super_class = (Class)MCLURLDataLoaderTask;
  v26 = [(MCLURLDataLoaderTask *)&v20 init];
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    uint64_t v8 = [location[0] copy];
    originalRequest = v26->_originalRequest;
    v26->_originalRequest = (NSURLRequest *)v8;

    objc_storeStrong((id *)&v26->_request, v26->_originalRequest);
    objc_storeStrong((id *)&v26->_category, v23);
    objc_storeStrong((id *)&v26->_targetPath, v24);
    v10 = _Block_copy(v22);
    id completion = v26->_completion;
    v26->_id completion = v10;

    v12 = _Block_copy(v21);
    id receiveDataHandler = v26->_receiveDataHandler;
    v26->_id receiveDataHandler = v12;
  }
  v15 = v26;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v15;
}

- (NSURL)URL
{
  return [(NSURLRequest *)self->_request URL];
}

- (BOOL)download
{
  return self->_targetPath != 0;
}

- (BOOL)responseOk
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return [(NSHTTPURLResponse *)self->_response expectedContentLength] != 0;
  }
  NSInteger v4 = [(NSHTTPURLResponse *)self->_response statusCode] / 100;
  BOOL v3 = 1;
  if (v4 != 2) {
    return v4 == 3;
  }
  return v3;
}

- (BOOL)responseClientError
{
  if (objc_opt_isKindOfClass()) {
    return [(NSHTTPURLResponse *)self->_response statusCode] / 100 == 4;
  }
  else {
    return [(NSHTTPURLResponse *)self->_response expectedContentLength] == 0;
  }
}

- (BOOL)responseTimeout
{
  BOOL v3 = [(NSError *)self->_error domain];
  BOOL v4 = 0;
  if ([(NSString *)v3 isEqualToString:*MEMORY[0x263F08570]]) {
    BOOL v4 = [(NSError *)self->_error code] == -1001;
  }

  return v4;
}

- (id)description
{
  BOOL v3 = NSString;
  v5 = [(NSURLRequest *)self->_request URL];
  BOOL v4 = [(NSURL *)v5 absoluteString];
  id v6 = (id)[v3 stringWithFormat:@"%@ - %@", v4, self->_category];

  return v6;
}

- (id)completion
{
  v2 = _Block_copy(self->_completion);
  return v2;
}

- (void)setRequest:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  request = v6->_request;
  v6->_request = (NSURLRequest *)v3;

  objc_storeStrong(location, 0);
}

- (void)setResponse:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  response = v6->_response;
  v6->_response = (NSHTTPURLResponse *)v3;

  objc_storeStrong(location, 0);
}

- (void)setResponseData:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_responseData, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setCachedResponse:(BOOL)a3
{
  self->_cachedResponse = a3;
}

- (void)setCategory:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  category = v6->_category;
  v6->_category = (NSString *)v3;

  objc_storeStrong(location, 0);
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void)dispatchCompletion:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_error, location[0]);
  if (v6->_completion)
  {
    (*((void (**)(void))v6->_completion + 2))();
    id completion = v6->_completion;
    v6->_id completion = 0;
  }
  if (!location[0])
  {
    LODWORD(v3) = 1.0;
    [(MCLURLDataLoaderTask *)v6 setProgress:v3];
  }
  objc_storeStrong(location, 0);
}

- (id)receiveDataHandler
{
  v2 = _Block_copy(self->_receiveDataHandler);
  return v2;
}

- (id)contentType
{
  v7 = self;
  v6[1] = (id)a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(NSHTTPURLResponse *)v7->_response allHeaderFields];
    v6[0] = [(NSDictionary *)v4 objectForKeyedSubscript:@"Content-Type"];

    id v5 = (id)[v6[0] componentsSeparatedByString:@";"];
    id v8 = (id)[v5 firstObject];

    objc_storeStrong(v6, 0);
  }
  else
  {
    id v8 = 0;
  }
  v2 = v8;
  return v2;
}

- (void)applyMimeType
{
  BOOL v4 = self;
  v3[1] = (id)a2;
  if ([(NSString *)self->_targetPath hasSuffix:@"[content_type]"])
  {
    id v2 = [(MCLURLDataLoaderTask *)v4 contentType];
    v3[0] = +[MCLURLDataLoader fileExtensionForMimeType:](MCLURLDataLoader, "fileExtensionForMimeType:");

    [(MCLURLDataLoaderTask *)v4 applyFileExtension:v3[0]];
    objc_storeStrong(v3, 0);
  }
}

- (void)applyFileExtension:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(NSString *)v7->_targetPath stringByDeletingPathExtension];
  double v3 = [(NSString *)v5 stringByAppendingPathExtension:location[0]];
  targetPath = v7->_targetPath;
  v7->_targetPath = v3;

  objc_storeStrong(location, 0);
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] encodeObject:v4->_category forKey:@"category"];
  [location[0] encodeObject:v4->_originalRequest forKey:@"request"];
  [location[0] encodeObject:v4->_targetPath forKey:@"targetPath"];
  [location[0] encodeObject:v4->_userInfo forKey:@"userInfo"];
  objc_storeStrong(location, 0);
}

- (MCLURLDataLoaderTask)initWithCoder:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)[location[0] decodeObjectForKey:@"category"];
  id v8 = (id)[location[0] decodeObjectForKey:@"request"];
  id v7 = (id)[location[0] decodeObjectForKey:@"targetPath"];
  double v3 = v11;
  v11 = 0;
  v11 = -[MCLURLDataLoaderTask initWithURLRequest:targetPath:category:completionHandler:receiveData:](v3, "initWithURLRequest:targetPath:category:completionHandler:receiveData:", v8, v7, v9, 0);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    id v6 = (id)[location[0] decodeObjectForKey:@"userInfo"];
    -[MCLURLDataLoaderTask setUserInfo:](v11, "setUserInfo:");
  }
  id v5 = v11;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (NSString)targetPath
{
  return self->_targetPath;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSData)responseData
{
  return &self->_responseData->super;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (BOOL)cachedResponse
{
  return self->_cachedResponse;
}

- (BOOL)background
{
  return self->_background;
}

- (float)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (id)redirectHandler
{
  return self->_redirectHandler;
}

- (void)setRedirectHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
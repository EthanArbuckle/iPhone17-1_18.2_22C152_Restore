@interface ENCloudNetworkRequest
+ (id)requestWithURL:(id)a3 httpMethod:(unint64_t)a4 headers:(id)a5 parameters:(id)a6 andBody:(id)a7;
- (NSData)body;
- (NSDictionary)headers;
- (NSDictionary)parameters;
- (NSURL)url;
- (NSUUID)requestID;
- (id)description;
- (id)httpMethodString;
- (unint64_t)httpMethod;
- (void)setBody:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setHttpMethod:(unint64_t)a3;
- (void)setParameters:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ENCloudNetworkRequest

+ (id)requestWithURL:(id)a3 httpMethod:(unint64_t)a4 headers:(id)a5 parameters:(id)a6 andBody:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = objc_alloc_init(ENCloudNetworkRequest);
  v16 = [MEMORY[0x1E4F29120] UUID];
  [(ENCloudNetworkRequest *)v15 setRequestID:v16];

  [(ENCloudNetworkRequest *)v15 setUrl:v14];
  [(ENCloudNetworkRequest *)v15 setHeaders:v13];

  [(ENCloudNetworkRequest *)v15 setParameters:v12];
  [(ENCloudNetworkRequest *)v15 setHttpMethod:a4];
  [(ENCloudNetworkRequest *)v15 setBody:v11];

  return v15;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F29020];
  v4 = [(ENCloudNetworkRequest *)self requestID];
  v5 = [v4 UUIDString];
  v6 = [(ENCloudNetworkRequest *)self url];
  v7 = [(ENCloudNetworkRequest *)self httpMethodString];
  v8 = [(ENCloudNetworkRequest *)self headers];
  v9 = [(ENCloudNetworkRequest *)self body];
  v10 = [v3 stringWithFormat:@"ENCloudNetworkRequest[%@] - URL: %@, Method: %@, \n Headers - %@, body - %@", v5, v6, v7, v8, v9];

  return v10;
}

- (id)httpMethodString
{
  if ([(ENCloudNetworkRequest *)self httpMethod]) {
    return @"POST";
  }
  else {
    return @"GET";
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (unint64_t)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(unint64_t)a3
{
  self->_httpMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end
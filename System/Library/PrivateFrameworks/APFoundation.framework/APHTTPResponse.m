@interface APHTTPResponse
- (APHTTPResponse)init;
- (BOOL)valid;
- (NSData)responseBody;
- (NSDictionary)responseHeaders;
- (NSError)responseError;
- (NSHTTPURLResponse)URLResponse;
- (id)_initWithResponseData:(id)a3 URLResponse:(id)a4 error:(id)a5;
- (id)valueForResponseHeaderField:(id)a3;
- (int64_t)responseStatusCode;
- (void)setResponseBody:(id)a3;
- (void)setResponseError:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setResponseStatusCode:(int64_t)a3;
- (void)setURLResponse:(id)a3;
@end

@implementation APHTTPResponse

- (APHTTPResponse)init
{
  return 0;
}

- (id)_initWithResponseData:(id)a3 URLResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)APHTTPResponse;
  v12 = [(APHTTPResponse *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_responseBody, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v13->_URLResponse, a4);
      v13->_responseStatusCode = [v10 statusCode];
      uint64_t v14 = [v10 allHeaderFields];
      responseHeaders = v13->_responseHeaders;
      v13->_responseHeaders = (NSDictionary *)v14;
    }
    objc_storeStrong((id *)&v13->_responseError, a5);
  }

  return v13;
}

- (id)valueForResponseHeaderField:(id)a3
{
  id v4 = a3;
  v5 = [(APHTTPResponse *)self responseHeaders];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)valid
{
  v3 = [(APHTTPResponse *)self responseError];
  BOOL v4 = !v3
    && [(APHTTPResponse *)self responseStatusCode] >= 200
    && [(APHTTPResponse *)self responseStatusCode] < 300;

  return v4;
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)setResponseStatusCode:(int64_t)a3
{
  self->_responseStatusCode = a3;
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSData)responseBody
{
  return self->_responseBody;
}

- (void)setResponseBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
}

@end
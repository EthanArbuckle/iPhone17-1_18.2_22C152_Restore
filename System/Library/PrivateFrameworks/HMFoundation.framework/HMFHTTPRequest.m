@interface HMFHTTPRequest
- (HMFHTTPRequest)init;
- (HMFHTTPRequest)initWithInternalRequest:(id)a3;
- (HMFHTTPRequestInternal)internal;
- (NSData)body;
- (NSDictionary)headerFields;
- (NSString)method;
- (NSURL)URL;
- (NSURLRequest)urlRequest;
- (double)timeoutInterval;
- (id)attributeDescriptions;
- (id)responseWithStatusCode:(int64_t)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation HMFHTTPRequest

- (HMFHTTPRequest)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFHTTPRequest)initWithInternalRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFHTTPRequest;
  v6 = [(HMFHTTPRequest *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internal, a3);
    v7->_timeoutInterval = 60.0;
  }

  return v7;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  v4 = [(HMFHTTPRequest *)self URL];
  id v5 = [v4 absoluteString];
  v6 = [(HMFAttributeDescription *)v3 initWithName:@"URL" value:v5];
  v18[0] = v6;
  id v7 = [HMFAttributeDescription alloc];
  v8 = [(HMFHTTPRequest *)self method];
  objc_super v9 = [(HMFAttributeDescription *)v7 initWithName:@"Method" value:v8];
  v18[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  v11 = [(HMFHTTPRequest *)self headerFields];
  v12 = [(HMFAttributeDescription *)v10 initWithName:@"Headers" value:v11];
  v18[2] = v12;
  v13 = [HMFAttributeDescription alloc];
  v14 = [(HMFHTTPRequest *)self body];
  v15 = [(HMFAttributeDescription *)v13 initWithName:@"Body" value:v14 options:1 formatter:0];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return v16;
}

- (id)responseWithStatusCode:(int64_t)a3
{
  id v5 = [(HMFHTTPRequest *)self internal];
  v6 = [v5 responseWithStatusCode:a3];

  id v7 = [[HMFHTTPResponse alloc] initWithRequest:self internalResponse:v6];
  return v7;
}

- (NSURL)URL
{
  v2 = [(HMFHTTPRequest *)self internal];
  uint64_t v3 = [v2 URL];

  return (NSURL *)v3;
}

- (NSString)method
{
  v2 = [(HMFHTTPRequest *)self internal];
  uint64_t v3 = [v2 method];

  return (NSString *)v3;
}

- (NSDictionary)headerFields
{
  v2 = [(HMFHTTPRequest *)self internal];
  uint64_t v3 = [v2 headerFields];

  return (NSDictionary *)v3;
}

- (NSData)body
{
  v2 = [(HMFHTTPRequest *)self internal];
  uint64_t v3 = [v2 body];

  return (NSData *)v3;
}

- (NSURLRequest)urlRequest
{
  id v3 = objc_alloc(MEMORY[0x1E4F18D50]);
  v4 = [(HMFHTTPRequest *)self URL];
  [(HMFHTTPRequest *)self timeoutInterval];
  id v5 = objc_msgSend(v3, "initWithURL:cachePolicy:timeoutInterval:", v4, 1);

  v6 = [(HMFHTTPRequest *)self body];
  [v5 setHTTPBody:v6];

  id v7 = [(HMFHTTPRequest *)self method];
  [v5 setHTTPMethod:v7];

  v8 = [(HMFHTTPRequest *)self headerFields];
  [v5 setAllHTTPHeaderFields:v8];

  objc_super v9 = (void *)[v5 copy];
  return (NSURLRequest *)v9;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (HMFHTTPRequestInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
}

@end
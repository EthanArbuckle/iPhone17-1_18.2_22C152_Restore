@interface HMFHTTPResponse
- (HMFHTTPRequest)request;
- (HMFHTTPResponse)init;
- (HMFHTTPResponse)initWithRequest:(id)a3 internalResponse:(id)a4;
- (HMFHTTPResponseInternal)internal;
- (NSData)body;
- (NSDictionary)headerFields;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)statusCode;
@end

@implementation HMFHTTPResponse

- (HMFHTTPResponse)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFHTTPResponse)initWithRequest:(id)a3 internalResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMFHTTPResponse;
  v9 = [(HMFHTTPResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_internal, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMFHTTPResponse statusCode](self, "statusCode"));
  v5 = [(HMFAttributeDescription *)v3 initWithName:@"Status Code" value:v4];
  v17[0] = v5;
  v6 = [HMFAttributeDescription alloc];
  id v7 = [(HMFHTTPResponse *)self headerFields];
  id v8 = [(HMFAttributeDescription *)v6 initWithName:@"Headers" value:v7];
  v17[1] = v8;
  v9 = [HMFAttributeDescription alloc];
  v10 = [(HMFHTTPResponse *)self body];
  v11 = [(HMFAttributeDescription *)v9 initWithName:@"Body" value:v10 options:1 formatter:0];
  v17[2] = v11;
  objc_super v12 = [HMFAttributeDescription alloc];
  v13 = [(HMFHTTPResponse *)self request];
  v14 = [(HMFAttributeDescription *)v12 initWithName:@"Request" value:v13 options:1 formatter:0];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[HMFMutableHTTPResponse allocWithZone:a3];
  v5 = [(HMFHTTPResponse *)self request];
  v6 = [(HMFHTTPResponse *)self internal];
  id v7 = (void *)[v6 copy];
  id v8 = [(HMFHTTPResponse *)v4 initWithRequest:v5 internalResponse:v7];

  return v8;
}

- (int64_t)statusCode
{
  v2 = [(HMFHTTPResponse *)self internal];
  int64_t v3 = [v2 statusCode];

  return v3;
}

- (NSDictionary)headerFields
{
  v2 = [(HMFHTTPResponse *)self internal];
  int64_t v3 = [v2 headerFields];

  return (NSDictionary *)v3;
}

- (NSData)body
{
  v2 = [(HMFHTTPResponse *)self internal];
  int64_t v3 = [v2 body];

  return (NSData *)v3;
}

- (HMFHTTPRequest)request
{
  return self->_request;
}

- (HMFHTTPResponseInternal)internal
{
  return self->_internal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
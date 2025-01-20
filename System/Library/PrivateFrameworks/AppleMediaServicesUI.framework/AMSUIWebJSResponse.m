@interface AMSUIWebJSResponse
+ (BOOL)supportsSecureCoding;
- (AMSUIWebJSRequest)originalRequest;
- (AMSUIWebJSResponse)initWithCoder:(id)a3;
- (AMSUIWebJSResponse)initWithRequest:(id)a3 duration:(double)a4;
- (NSDictionary)body;
- (double)duration;
- (void)encodeWithCoder:(id)a3;
- (void)setBody:(id)a3;
@end

@implementation AMSUIWebJSResponse

- (AMSUIWebJSResponse)initWithRequest:(id)a3 duration:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebJSResponse;
  v8 = [(AMSUIWebJSResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_duration = a4;
    objc_storeStrong((id *)&v8->_originalRequest, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(AMSUIWebJSResponse *)self originalRequest];
  [v6 encodeObject:v4 forKey:@"kCodingKeyRequest"];

  v5 = [(AMSUIWebJSResponse *)self body];
  [v6 encodeObject:v5 forKey:@"kCodingKeyBody"];

  [(AMSUIWebJSResponse *)self duration];
  objc_msgSend(v6, "encodeDouble:forKey:", @"kCodingKeyDuration");
}

- (AMSUIWebJSResponse)initWithCoder:(id)a3
{
  v16[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebJSResponse;
  v5 = [(AMSUIWebJSResponse *)&v15 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:5];
    v8 = [v6 setWithArray:v7];

    [v4 decodeDoubleForKey:@"kCodingKeyDuration"];
    v5->_duration = v9;
    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:@"kCodingKeyBody"];
    body = v5->_body;
    v5->_body = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyRequest"];
    originalRequest = v5->_originalRequest;
    v5->_originalRequest = (AMSUIWebJSRequest *)v12;
  }
  return v5;
}

- (NSDictionary)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (AMSUIWebJSRequest)originalRequest
{
  return self->_originalRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
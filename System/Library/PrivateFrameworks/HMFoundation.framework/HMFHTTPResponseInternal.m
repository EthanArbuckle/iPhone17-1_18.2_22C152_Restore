@interface HMFHTTPResponseInternal
- (HMFActivity)activity;
- (HMFHTTPResponseInternal)init;
- (HMFHTTPResponseInternal)initWithStatusCode:(int64_t)a3 headerFields:(id)a4 body:(id)a5 activity:(id)a6;
- (NSData)body;
- (NSDictionary)headerFields;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)statusCode;
- (void)setBody:(id)a3;
- (void)setHeaderFields:(id)a3;
- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4;
@end

@implementation HMFHTTPResponseInternal

- (HMFHTTPResponseInternal)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFHTTPResponseInternal)initWithStatusCode:(int64_t)a3 headerFields:(id)a4 body:(id)a5 activity:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMFHTTPResponseInternal;
  v13 = [(HMFHTTPResponseInternal *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_statusCode = a3;
    uint64_t v15 = [v10 copy];
    headerFields = v14->_headerFields;
    v14->_headerFields = (NSDictionary *)v15;

    uint64_t v17 = [v11 copy];
    body = v14->_body;
    v14->_body = (NSData *)v17;

    objc_storeStrong((id *)&v14->_activity, a6);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStatusCode:headerFields:body:activity:", 0, MEMORY[0x1E4F1CC08], 0, 0);
  if (v5)
  {
    v5[2] = [(HMFHTTPResponseInternal *)self statusCode];
    v6 = [(HMFHTTPResponseInternal *)self headerFields];
    uint64_t v7 = [v6 copyWithZone:a3];
    v8 = (void *)v5[3];
    v5[3] = v7;

    v9 = [(HMFHTTPResponseInternal *)self body];
    uint64_t v10 = [v9 copyWithZone:a3];
    id v11 = (void *)v5[4];
    v5[4] = v10;
  }
  return v5;
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMFHTTPResponseInternal *)self headerFields];
  v8 = (void *)[v7 mutableCopy];

  if (v6)
  {
    if (v11) {
      [v8 setObject:v11 forKey:v6];
    }
    else {
      [v8 removeObjectForKey:v6];
    }
  }
  v9 = (NSDictionary *)[v8 copy];
  headerFields = self->_headerFields;
  self->_headerFields = v9;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
@interface APHTTPRequest
- (APHTTPRequest)initWithURL:(id)a3 HTTPMethod:(int64_t)a4 HTTPHeaders:(id)a5 HTTPBody:(id)a6 completionHandler:(id)a7;
- (APHTTPRequest)initWithURL:(id)a3 HTTPMethod:(int64_t)a4 HTTPHeaders:(id)a5 HTTPBody:(id)a6 serviceName:(id)a7 completionHandler:(id)a8;
- (NSData)HTTPBody;
- (NSDictionary)allHTTPHeaderFields;
- (NSMutableDictionary)internalHTTPHeaderFields;
- (NSString)serviceName;
- (NSURL)URL;
- (NSUUID)identifier;
- (id)completionHandler;
- (int64_t)HTTPMethod;
- (void)setCompletionHandler:(id)a3;
- (void)setHTTPBody:(id)a3;
- (void)setHTTPMethod:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalHTTPHeaderFields:(id)a3;
- (void)setRequestHeader:(id)a3 withValue:(id)a4;
- (void)setServiceName:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation APHTTPRequest

- (APHTTPRequest)initWithURL:(id)a3 HTTPMethod:(int64_t)a4 HTTPHeaders:(id)a5 HTTPBody:(id)a6 completionHandler:(id)a7
{
  return [(APHTTPRequest *)self initWithURL:a3 HTTPMethod:a4 HTTPHeaders:a5 HTTPBody:a6 serviceName:0 completionHandler:a7];
}

- (APHTTPRequest)initWithURL:(id)a3 HTTPMethod:(int64_t)a4 HTTPHeaders:(id)a5 HTTPBody:(id)a6 serviceName:(id)a7 completionHandler:(id)a8
{
  id v27 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)APHTTPRequest;
  v19 = [(APHTTPRequest *)&v28 init];
  if (v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    identifier = v19->_identifier;
    v19->_identifier = (NSUUID *)v20;

    objc_storeStrong((id *)&v19->_URL, a3);
    v19->_HTTPMethod = a4;
    if (v15)
    {
      uint64_t v22 = [v15 mutableCopy];
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    internalHTTPHeaderFields = v19->_internalHTTPHeaderFields;
    v19->_internalHTTPHeaderFields = (NSMutableDictionary *)v22;

    objc_storeStrong((id *)&v19->_HTTPBody, a6);
    objc_storeStrong((id *)&v19->_serviceName, a7);
    uint64_t v24 = [v18 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = (id)v24;
  }
  return v19;
}

- (void)setRequestHeader:(id)a3 withValue:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = [(APHTTPRequest *)self internalHTTPHeaderFields];
  v8 = v7;
  if (v9) {
    [v7 setValue:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (NSDictionary)allHTTPHeaderFields
{
  v2 = [(APHTTPRequest *)self internalHTTPHeaderFields];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (int64_t)HTTPMethod
{
  return self->_HTTPMethod;
}

- (void)setHTTPMethod:(int64_t)a3
{
  self->_HTTPMethod = a3;
}

- (NSData)HTTPBody
{
  return self->_HTTPBody;
}

- (void)setHTTPBody:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSMutableDictionary)internalHTTPHeaderFields
{
  return self->_internalHTTPHeaderFields;
}

- (void)setInternalHTTPHeaderFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalHTTPHeaderFields, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_HTTPBody, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
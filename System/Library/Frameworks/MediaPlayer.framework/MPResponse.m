@interface MPResponse
+ (id)builderProtocol;
- (BOOL)isValid;
- (MPResponse)initWithRequest:(id)a3 middleware:(id)a4;
- (NSArray)middleware;
- (NSString)description;
- (id)_stateDumpObject;
- (id)builder;
- (id)chain;
- (id)request;
- (void)invalidate;
- (void)setMiddleware:(id)a3;
@end

@implementation MPResponse

- (id)builder
{
  return self->_builder;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_valid)
  {
    [(MPResponse *)self willChangeValueForKey:@"valid"];
    self->_valid = 0;
    [(MPResponse *)self didChangeValueForKey:@"valid"];
    v3 = os_log_create("com.apple.amp.mediaplayer", "Middleware");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(MPResponse *)self request];
      int v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_INFO, "INVALIDATE: Notifying invalidation for request: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:MPResponseDidInvalidateNotification object:self];
  }
}

- (id)request
{
  return self->_request;
}

- (MPResponse)initWithRequest:(id)a3 middleware:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MPResponse;
  v9 = [(MPResponse *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_request, a3);
    objc_storeStrong((id *)&v10->_middleware, a4);
    v10->_valid = 1;
    v11 = [(id)objc_opt_class() builderProtocol];
    uint64_t v12 = +[MPMiddlewareChain builderProxyForProtocol:v11];
    id builder = v10->_builder;
    v10->_id builder = (id)v12;
  }
  return v10;
}

- (id)chain
{
  v3 = [MPMiddlewareChain alloc];
  v4 = [(MPResponse *)self middleware];
  v5 = [(id)objc_opt_class() builderProtocol];
  int v6 = [(MPMiddlewareChain *)v3 initWithMiddleware:v4 protocol:v5];

  return v6;
}

- (NSArray)middleware
{
  return self->_middleware;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p request=%p>", objc_opt_class(), self, self->_request];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_builder, 0);
  objc_storeStrong((id *)&self->_middleware, 0);

  objc_storeStrong(&self->_request, 0);
}

- (void)setMiddleware:(id)a3
{
}

- (id)_stateDumpObject
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"_obj";
  v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v10[0] = v3;
  v9[1] = @"valid";
  uint64_t v4 = [NSNumber numberWithBool:self->_valid];
  v5 = (void *)v4;
  v9[2] = @"_middleware";
  middleware = self->_middleware;
  if (!middleware) {
    middleware = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v10[1] = v4;
  v10[2] = middleware;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

+ (id)builderProtocol
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, a1, @"MPRequest.m", 281, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[MPResponse class]" object file lineNumber description];
  }

  return &unk_1EE6EFAE8;
}

@end
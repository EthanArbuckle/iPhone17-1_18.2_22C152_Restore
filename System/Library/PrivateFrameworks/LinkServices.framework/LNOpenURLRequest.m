@interface LNOpenURLRequest
+ (BOOL)supportsSecureCoding;
- (LNOpenURLRequest)initWithCoder:(id)a3;
- (LNOpenURLRequest)initWithIdentifier:(id)a3 url:(id)a4;
- (NSURL)url;
- (NSUUID)identifier;
- (id)completionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)respondWithError:(id)a3;
- (void)respondWithSuccess;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNOpenURLRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (LNOpenURLRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(LNOpenURLRequest *)self initWithIdentifier:v5 url:v6];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNOpenURLRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(LNOpenURLRequest *)self url];
  [v4 encodeObject:v6 forKey:@"url"];
}

- (void)respondWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    id v5 = self->_completionHandler;
    self->_completionHandler = 0;
  }
  else
  {
    id v6 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_opt_class();
      v8 = [(LNOpenURLRequest *)self identifier];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      v12 = v8;
    }
  }
}

- (void)respondWithSuccess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_completionHandler)
  {
    v3 = [LNOpenURLResponse alloc];
    id v4 = [(LNOpenURLRequest *)self identifier];
    int v9 = [(LNOpenURLResponse *)v3 initWithIdentifier:v4];

    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  else
  {
    id v6 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_opt_class();
      v8 = [(LNOpenURLRequest *)self identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
    }
  }
}

- (LNOpenURLRequest)initWithIdentifier:(id)a3 url:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNOpenURLRequest.m", 20, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNOpenURLRequest;
  uint64_t v10 = [(LNOpenURLRequest *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    uint64_t v12 = [v9 copy];
    url = v11->_url;
    v11->_url = (NSURL *)v12;

    uint64_t v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
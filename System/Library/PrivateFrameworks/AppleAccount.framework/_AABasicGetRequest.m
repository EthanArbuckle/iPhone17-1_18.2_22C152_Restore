@interface _AABasicGetRequest
- (_AABasicGetRequest)initWithAccount:(id)a3;
- (id)urlRequest;
@end

@implementation _AABasicGetRequest

- (_AABasicGetRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AABasicGetRequest;
  v6 = [(_AABasicGetRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlRequest
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if (!self->_account)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"AARequest.m", 1537, @"%@ cannot run without an ACAccount.", v5 object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_AABasicGetRequest;
  v6 = [(AARequest *)&v12 urlRequest];
  v7 = (void *)[v6 mutableCopy];

  [v7 setHTTPMethod:@"GET"];
  v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [v7 URL];
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Sending GET to %@", buf, 0xCu);
  }
  objc_msgSend(v7, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);

  return v7;
}

- (void).cxx_destruct
{
}

@end
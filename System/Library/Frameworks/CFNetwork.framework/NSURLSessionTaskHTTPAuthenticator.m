@interface NSURLSessionTaskHTTPAuthenticator
+ (NSURLSessionTaskHTTPAuthenticator)sessionTaskHTTPAuthenticatorWithContext:(id)a3 statusCodes:(id)a4;
- (NSSet)statusCodes;
- (NSURLSessionTaskHTTPAuthenticator)initWithStatusCodes:(id)a3;
- (void)dealloc;
- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6;
- (void)setStatusCodes:(id)a3;
@end

@implementation NSURLSessionTaskHTTPAuthenticator

- (void)setStatusCodes:(id)a3
{
}

- (NSSet)statusCodes
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "NSURLSessionTaskHTTPAuthenticator requires a sub class.", v6, 2u);
  }
}

- (void)dealloc
{
  [(NSURLSessionTaskHTTPAuthenticator *)self setStatusCodes:0];
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskHTTPAuthenticator;
  [(NSURLSessionTaskHTTPAuthenticator *)&v3 dealloc];
}

- (NSURLSessionTaskHTTPAuthenticator)initWithStatusCodes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSURLSessionTaskHTTPAuthenticator;
  v4 = [(NSURLSessionTaskHTTPAuthenticator *)&v7 init];
  v5 = v4;
  if (v4) {
    [(NSURLSessionTaskHTTPAuthenticator *)v4 setStatusCodes:a3];
  }
  return v5;
}

+ (NSURLSessionTaskHTTPAuthenticator)sessionTaskHTTPAuthenticatorWithContext:(id)a3 statusCodes:(id)a4
{
  if (a3)
  {
    v4 = [[NSURLSessionTaskLocalHTTPAuthenticator alloc] initWithSessionAuthenticator:a3 statusCodes:a4];
  }
  else if (a4)
  {
    v4 = [[NSURLSessionTaskBackgroundHTTPAuthenticator alloc] initWithStatusCodes:a4];
  }
  else
  {
    v4 = 0;
  }

  return (NSURLSessionTaskHTTPAuthenticator *)v4;
}

@end
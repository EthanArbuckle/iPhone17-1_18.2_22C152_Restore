@interface TWRequest
- (ACAccount)account;
- (NSDictionary)parameters;
- (NSURL)URL;
- (NSURLRequest)signedURLRequest;
- (TWRequestMethod)requestMethod;
- (id)initWithURL:(NSURL *)url parameters:(NSDictionary *)parameters requestMethod:(TWRequestMethod)requestMethod;
- (void)dealloc;
@end

@implementation TWRequest

- (id)initWithURL:(NSURL *)url parameters:(NSDictionary *)parameters requestMethod:(TWRequestMethod)requestMethod
{
  v6.receiver = self;
  v6.super_class = (Class)TWRequest;
  return [(TWRequest *)&v6 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TWRequest;
  [(TWRequest *)&v2 dealloc];
}

- (TWRequestMethod)requestMethod
{
  return 1;
}

- (NSURL)URL
{
  return 0;
}

- (NSDictionary)parameters
{
  return 0;
}

- (ACAccount)account
{
  return 0;
}

- (NSURLRequest)signedURLRequest
{
  return 0;
}

@end
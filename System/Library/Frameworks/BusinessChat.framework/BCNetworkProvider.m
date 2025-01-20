@interface BCNetworkProvider
- (BCNetworkProvider)init;
- (void)performDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation BCNetworkProvider

- (BCNetworkProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)BCNetworkProvider;
  v2 = [(BCNetworkProvider *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F08BF8];
    v4 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    uint64_t v5 = [v3 sessionWithConfiguration:v4];
    session = v2->_session;
    v2->_session = (NSURLSession *)v5;
  }
  return v2;
}

- (void)performDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  if (self) {
    self = (BCNetworkProvider *)self->_session;
  }
  id v4 = [(BCNetworkProvider *)self dataTaskWithRequest:a3 completionHandler:a4];
  [v4 resume];
}

- (void).cxx_destruct
{
}

@end
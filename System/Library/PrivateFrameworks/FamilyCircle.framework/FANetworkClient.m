@interface FANetworkClient
- (FANetworkClient)initWithNetworkService:(id)a3;
- (FANetworkService)networkService;
@end

@implementation FANetworkClient

- (FANetworkClient)initWithNetworkService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FANetworkClient;
  v6 = [(FANetworkClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkService, a3);
  }

  return v7;
}

- (FANetworkService)networkService
{
  return self->_networkService;
}

- (void).cxx_destruct
{
}

@end
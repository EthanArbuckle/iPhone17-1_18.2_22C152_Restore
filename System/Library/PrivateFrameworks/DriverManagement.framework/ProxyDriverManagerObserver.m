@interface ProxyDriverManagerObserver
- (ProxyDriverManagerObserver)initWithObserver:(id)a3;
- (void)approvalStateDidChange:(BOOL)a3;
@end

@implementation ProxyDriverManagerObserver

- (ProxyDriverManagerObserver)initWithObserver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ProxyDriverManagerObserver;
  v6 = [(ProxyDriverManagerObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observer, a3);
  }

  return v7;
}

- (void)approvalStateDidChange:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface ACDFakeRemoteAccountStoreSession
- (ACDFakeRemoteAccountStoreSession)initWithFakeProxy:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
@end

@implementation ACDFakeRemoteAccountStoreSession

- (ACDFakeRemoteAccountStoreSession)initWithFakeProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACDFakeRemoteAccountStoreSession;
  v5 = [(ACRemoteAccountStoreSession *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_proxy, v4);
  }

  return v6;
}

- (id)remoteObjectProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);

  return WeakRetained;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);

  return WeakRetained;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end
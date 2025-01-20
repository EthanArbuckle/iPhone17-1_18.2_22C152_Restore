@interface CLIntersiloProxyToInitiator
- (CLIntersiloProxy)peer;
- (CLIntersiloProxyToInitiator)initWithDelegateObject:(id)a3 delegateSilo:(id)a4 uninitializedPeer:(id)a5;
@end

@implementation CLIntersiloProxyToInitiator

- (CLIntersiloProxyToInitiator)initWithDelegateObject:(id)a3 delegateSilo:(id)a4 uninitializedPeer:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CLIntersiloProxyToInitiator;
  v9 = [(CLIntersiloProxy *)&v12 initWithDelegateObject:a3 delegateSilo:a4];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_peer, v8);
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (CLIntersiloProxy)peer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peer);
  return (CLIntersiloProxy *)WeakRetained;
}

@end
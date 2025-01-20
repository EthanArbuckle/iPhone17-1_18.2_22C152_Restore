@interface CLIntersiloProxyToRecipient
- (CLIntersiloProxy)peer;
- (CLIntersiloProxyToRecipient)initWithUninitializedPeer:(id)a3;
@end

@implementation CLIntersiloProxyToRecipient

- (CLIntersiloProxyToRecipient)initWithUninitializedPeer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIntersiloProxyToRecipient;
  v6 = [(CLIntersiloProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peer, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (CLIntersiloProxy)peer
{
  return self->_peer;
}

@end
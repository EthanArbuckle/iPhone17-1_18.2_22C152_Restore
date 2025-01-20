@interface ACCBLEPairingDelegateReference
- (ACCBLEPairingDelegateReference)initWithDelegate:(id)a3 provider:(id)a4;
- (ACCBLEPairingProvider)provider;
- (ACCBLEPairingProviderProtocol)delegate;
- (void)setDelegate:(id)a3;
- (void)setProvider:(id)a3;
@end

@implementation ACCBLEPairingDelegateReference

- (ACCBLEPairingDelegateReference)initWithDelegate:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACCBLEPairingDelegateReference;
  v8 = [(ACCBLEPairingDelegateReference *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_provider, v7);
  }

  return v9;
}

- (ACCBLEPairingProviderProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCBLEPairingProviderProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACCBLEPairingProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (ACCBLEPairingProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
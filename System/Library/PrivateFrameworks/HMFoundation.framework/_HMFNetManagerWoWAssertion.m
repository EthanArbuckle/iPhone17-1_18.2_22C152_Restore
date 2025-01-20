@interface _HMFNetManagerWoWAssertion
- (HMFWiFiManager)manager;
- (_HMFNetManagerWoWAssertion)initWithWifiManager:(id)a3;
- (void)dealloc;
@end

@implementation _HMFNetManagerWoWAssertion

- (_HMFNetManagerWoWAssertion)initWithWifiManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMFNetManagerWoWAssertion;
  v6 = [(_HMFNetManagerWoWAssertion *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    [(HMFWiFiManager *)v7->_manager takeWoWAssertion];
  }

  return v7;
}

- (void)dealloc
{
  [(HMFWiFiManager *)self->_manager releaseWoWAssertion];
  v3.receiver = self;
  v3.super_class = (Class)_HMFNetManagerWoWAssertion;
  [(_HMFNetManagerWoWAssertion *)&v3 dealloc];
}

- (HMFWiFiManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
}

@end
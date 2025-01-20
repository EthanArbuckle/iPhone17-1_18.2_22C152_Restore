@interface HMDAccessoryNetworkCredential
- (HMDAccessoryNetworkCredential)initWithNetworkRouterUUID:(id)a3 clientIdentifier:(id)a4 wiFiPSK:(id)a5;
- (NSData)wiFiPSK;
- (NSNumber)clientIdentifier;
- (NSUUID)networkRouterUUID;
@end

@implementation HMDAccessoryNetworkCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wiFiPSK, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_networkRouterUUID, 0);
}

- (NSData)wiFiPSK
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)clientIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)networkRouterUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessoryNetworkCredential)initWithNetworkRouterUUID:(id)a3 clientIdentifier:(id)a4 wiFiPSK:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryNetworkCredential;
  v12 = [(HMDAccessoryNetworkCredential *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkRouterUUID, a3);
    objc_storeStrong((id *)&v13->_clientIdentifier, a4);
    objc_storeStrong((id *)&v13->_wiFiPSK, a5);
  }

  return v13;
}

@end
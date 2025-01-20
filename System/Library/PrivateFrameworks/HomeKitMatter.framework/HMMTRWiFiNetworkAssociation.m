@interface HMMTRWiFiNetworkAssociation
- (HMMTRWiFiNetworkAssociation)initWithSSID:(id)a3 credentials:(id)a4;
- (NSData)credentials;
- (NSData)ssid;
@end

@implementation HMMTRWiFiNetworkAssociation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

- (NSData)credentials
{
  return self->_credentials;
}

- (NSData)ssid
{
  return self->_ssid;
}

- (HMMTRWiFiNetworkAssociation)initWithSSID:(id)a3 credentials:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRWiFiNetworkAssociation;
  v9 = [(HMMTRWiFiNetworkAssociation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ssid, a3);
    objc_storeStrong((id *)&v10->_credentials, a4);
  }

  return v10;
}

@end
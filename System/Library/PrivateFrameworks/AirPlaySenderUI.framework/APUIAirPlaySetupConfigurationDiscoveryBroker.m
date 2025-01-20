@interface APUIAirPlaySetupConfigurationDiscoveryBroker
- (NSString)ID;
- (NSString)authToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAuthToken:(id)a3;
- (void)setID:(id)a3;
@end

@implementation APUIAirPlaySetupConfigurationDiscoveryBroker

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(APUIAirPlaySetupConfigurationDiscoveryBroker *)self ID];
  [v4 setID:v5];

  v6 = [(APUIAirPlaySetupConfigurationDiscoveryBroker *)self authToken];
  [v4 setAuthToken:v6];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(APUIAirPlaySetupConfigurationDiscoveryBroker *)self ID];
  v5 = [(APUIAirPlaySetupConfigurationDiscoveryBroker *)self authToken];
  if (v5 && !IsAppleInternalBuild())
  {
    v7 = [v3 stringWithFormat:@"Broker<systemID=%@|authToken=%@>", v4, @"#Redacted#"];
  }
  else
  {
    v6 = [(APUIAirPlaySetupConfigurationDiscoveryBroker *)self authToken];
    v7 = [v3 stringWithFormat:@"Broker<systemID=%@|authToken=%@>", v4, v6];
  }

  return v7;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authToken, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end
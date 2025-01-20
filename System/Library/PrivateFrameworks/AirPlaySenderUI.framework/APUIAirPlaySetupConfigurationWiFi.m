@interface APUIAirPlaySetupConfigurationWiFi
- (NSString)SSID;
- (NSString)captivePortalBypassToken;
- (NSString)passphrase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCaptivePortalBypassToken:(id)a3;
- (void)setPassphrase:(id)a3;
- (void)setSSID:(id)a3;
@end

@implementation APUIAirPlaySetupConfigurationWiFi

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(APUIAirPlaySetupConfigurationWiFi *)self SSID];
  [v4 setSSID:v5];

  v6 = [(APUIAirPlaySetupConfigurationWiFi *)self passphrase];
  [v4 setPassphrase:v6];

  v7 = [(APUIAirPlaySetupConfigurationWiFi *)self captivePortalBypassToken];
  [v4 setCaptivePortalBypassToken:v7];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(APUIAirPlaySetupConfigurationWiFi *)self SSID];
  if (v4 && !IsAppleInternalBuild())
  {
    int v6 = 0;
    v5 = @"#Redacted#";
  }
  else
  {
    v5 = [(APUIAirPlaySetupConfigurationWiFi *)self SSID];
    int v6 = 1;
  }
  v7 = [(APUIAirPlaySetupConfigurationWiFi *)self passphrase];
  if (v7 && !IsAppleInternalBuild())
  {
    int v9 = 0;
    v8 = @"#Redacted#";
  }
  else
  {
    v8 = [(APUIAirPlaySetupConfigurationWiFi *)self passphrase];
    int v9 = 1;
  }
  v10 = [(APUIAirPlaySetupConfigurationWiFi *)self captivePortalBypassToken];
  if (v10 && !IsAppleInternalBuild())
  {
    v12 = [v3 stringWithFormat:@"WiFi<SSID=%@|passphrase=%@|captivePortalBypassToken=%@>", v5, v8, @"#Redacted#"];
  }
  else
  {
    v11 = [(APUIAirPlaySetupConfigurationWiFi *)self captivePortalBypassToken];
    v12 = [v3 stringWithFormat:@"WiFi<SSID=%@|passphrase=%@|captivePortalBypassToken=%@>", v5, v8, v11];
  }
  if (v9) {

  }
  if (v6) {

  }
  return v12;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
}

- (NSString)captivePortalBypassToken
{
  return self->_captivePortalBypassToken;
}

- (void)setCaptivePortalBypassToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captivePortalBypassToken, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);

  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
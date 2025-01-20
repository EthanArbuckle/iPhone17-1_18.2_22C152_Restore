@interface AppleEthernetDetailsContext
- (AppleEthernetDetailsContextDelegate)delegate;
- (BOOL)autoJoinEnabled;
- (BOOL)autoLoginEnabled;
- (BOOL)diagnosable;
- (BOOL)isConnectedWithHardwareAddress;
- (BOOL)isCurrent;
- (BOOL)isInSaveDataMode;
- (BOOL)isKnownNetwork;
- (BOOL)isPrivacyProxyEnabled;
- (BOOL)isRandomMACAddressConfigurable;
- (BOOL)isRandomMACAddressDisabled;
- (BOOL)isRandomMACFeatureEnabled;
- (BOOL)isRandomMACSwitchOn;
- (NSArray)recommendations;
- (NSString)hardwareMACAddress;
- (NSString)randomMACAddress;
- (NSString)staticPrivateMACFooterText;
- (NSString)turnOFFPrivateMACFooterText;
- (NSString)turnONPrivateMACFooterText;
- (WFNetworkListRecord)network;
- (id)diagnosticsContext;
- (int64_t)requestedFields;
- (void)setAutoJoinEnabled:(BOOL)a3;
- (void)setAutoLoginEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosable:(BOOL)a3;
- (void)setIsInSaveDataMode:(BOOL)a3;
- (void)setIsPrivacyProxyEnabled:(BOOL)a3;
- (void)setStaticPrivateMACFooterText:(id)a3;
- (void)setTurnOFFPrivateMACFooterText:(id)a3;
- (void)setTurnONPrivateMACFooterText:(id)a3;
@end

@implementation AppleEthernetDetailsContext

- (void)setIsPrivacyProxyEnabled:(BOOL)a3
{
  self->_privacyProxyIsEnabled = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained detailsContextChanged];
}

- (BOOL)isPrivacyProxyEnabled
{
  return self->_privacyProxyIsEnabled;
}

- (id)diagnosticsContext
{
  return 0;
}

- (BOOL)autoLoginEnabled
{
  return self->autoLoginEnabled;
}

- (void)setAutoLoginEnabled:(BOOL)a3
{
  self->autoLoginEnabled = a3;
}

- (BOOL)autoJoinEnabled
{
  return self->autoJoinEnabled;
}

- (void)setAutoJoinEnabled:(BOOL)a3
{
  self->autoJoinEnabled = a3;
}

- (BOOL)isConnectedWithHardwareAddress
{
  return self->connectedWithHardwareAddress;
}

- (BOOL)diagnosable
{
  return self->diagnosable;
}

- (void)setDiagnosable:(BOOL)a3
{
  self->diagnosable = a3;
}

- (NSString)hardwareMACAddress
{
  return self->hardwareMACAddress;
}

- (BOOL)isCurrent
{
  return self->current;
}

- (BOOL)isInSaveDataMode
{
  return self->isInSaveDataMode;
}

- (void)setIsInSaveDataMode:(BOOL)a3
{
  self->isInSaveDataMode = a3;
}

- (BOOL)isKnownNetwork
{
  return self->knownNetwork;
}

- (int64_t)requestedFields
{
  return self->requestedFields;
}

- (NSArray)recommendations
{
  return self->recommendations;
}

- (NSString)turnOFFPrivateMACFooterText
{
  return self->turnOFFPrivateMACFooterText;
}

- (void)setTurnOFFPrivateMACFooterText:(id)a3
{
}

- (NSString)turnONPrivateMACFooterText
{
  return self->turnONPrivateMACFooterText;
}

- (void)setTurnONPrivateMACFooterText:(id)a3
{
}

- (NSString)staticPrivateMACFooterText
{
  return self->staticPrivateMACFooterText;
}

- (void)setStaticPrivateMACFooterText:(id)a3
{
}

- (BOOL)isRandomMACSwitchOn
{
  return self->randomMACSwitchOn;
}

- (BOOL)isRandomMACAddressDisabled
{
  return self->randomMACAddressDisabled;
}

- (BOOL)isRandomMACAddressConfigurable
{
  return self->randomMACAddressConfigurable;
}

- (NSString)randomMACAddress
{
  return self->randomMACAddress;
}

- (WFNetworkListRecord)network
{
  return self->network;
}

- (BOOL)isRandomMACFeatureEnabled
{
  return self->randomMACFeatureEnabled;
}

- (AppleEthernetDetailsContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AppleEthernetDetailsContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->network, 0);
  objc_storeStrong((id *)&self->randomMACAddress, 0);
  objc_storeStrong((id *)&self->staticPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->turnONPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->turnOFFPrivateMACFooterText, 0);
  objc_storeStrong((id *)&self->recommendations, 0);

  objc_storeStrong((id *)&self->hardwareMACAddress, 0);
}

@end
@interface MTRCommissioningParameters
- (BOOL)skipCommissioningComplete;
- (NSData)attestationNonce;
- (NSData)csrNonce;
- (NSData)threadOperationalDataset;
- (NSData)wifiCredentials;
- (NSData)wifiSSID;
- (NSNumber)failSafeTimeout;
- (NSString)countryCode;
- (id)deviceAttestationDelegate;
- (void)setAttestationNonce:(NSData *)attestationNonce;
- (void)setCountryCode:(NSString *)countryCode;
- (void)setCsrNonce:(NSData *)csrNonce;
- (void)setDeviceAttestationDelegate:(id)deviceAttestationDelegate;
- (void)setFailSafeExpiryTimeoutSecs:(NSNumber *)failSafeExpiryTimeoutSecs;
- (void)setFailSafeTimeout:(NSNumber *)failSafeTimeout;
- (void)setSkipCommissioningComplete:(BOOL)skipCommissioningComplete;
- (void)setThreadOperationalDataset:(NSData *)threadOperationalDataset;
- (void)setWifiCredentials:(NSData *)wifiCredentials;
- (void)setWifiSSID:(NSData *)wifiSSID;
@end

@implementation MTRCommissioningParameters

- (NSData)csrNonce
{
  return self->_csrNonce;
}

- (void)setCsrNonce:(NSData *)csrNonce
{
}

- (NSData)attestationNonce
{
  return self->_attestationNonce;
}

- (void)setAttestationNonce:(NSData *)attestationNonce
{
}

- (NSData)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(NSData *)wifiSSID
{
}

- (NSData)wifiCredentials
{
  return self->_wifiCredentials;
}

- (void)setWifiCredentials:(NSData *)wifiCredentials
{
}

- (NSData)threadOperationalDataset
{
  return self->_threadOperationalDataset;
}

- (void)setThreadOperationalDataset:(NSData *)threadOperationalDataset
{
}

- (id)deviceAttestationDelegate
{
  return self->_deviceAttestationDelegate;
}

- (void)setDeviceAttestationDelegate:(id)deviceAttestationDelegate
{
}

- (NSNumber)failSafeTimeout
{
  return self->_failSafeTimeout;
}

- (void)setFailSafeTimeout:(NSNumber *)failSafeTimeout
{
}

- (BOOL)skipCommissioningComplete
{
  return self->_skipCommissioningComplete;
}

- (void)setSkipCommissioningComplete:(BOOL)skipCommissioningComplete
{
  self->_skipCommissioningComplete = skipCommissioningComplete;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(NSString *)countryCode
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_failSafeTimeout, 0);
  objc_storeStrong((id *)&self->_deviceAttestationDelegate, 0);
  objc_storeStrong((id *)&self->_threadOperationalDataset, 0);
  objc_storeStrong((id *)&self->_wifiCredentials, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_attestationNonce, 0);

  objc_storeStrong((id *)&self->_csrNonce, 0);
}

- (void)setFailSafeExpiryTimeoutSecs:(NSNumber *)failSafeExpiryTimeoutSecs
{
}

@end
@interface HMDUnpairedHAPAccessoryConfiguration
- (BOOL)requiresUserConsent;
- (HMDAccessoryNetworkCredential)networkCredential;
- (NSNumber)chipFabricID;
- (NSString)isoCountryCode;
- (NSString)setupCode;
- (NSUUID)homeUUID;
- (id)setupCodeProvider;
- (void)setChipFabricID:(id)a3;
- (void)setHomeUUID:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setNetworkCredential:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
- (void)setSetupCode:(id)a3;
- (void)setSetupCodeProvider:(id)a3;
@end

@implementation HMDUnpairedHAPAccessoryConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_chipFabricID, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong(&self->_setupCodeProvider, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
}

- (void)setHomeUUID:(id)a3
{
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChipFabricID:(id)a3
{
}

- (NSNumber)chipFabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkCredential:(id)a3
{
}

- (HMDAccessoryNetworkCredential)networkCredential
{
  return (HMDAccessoryNetworkCredential *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setSetupCodeProvider:(id)a3
{
}

- (id)setupCodeProvider
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setSetupCode:(id)a3
{
}

- (NSString)setupCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end
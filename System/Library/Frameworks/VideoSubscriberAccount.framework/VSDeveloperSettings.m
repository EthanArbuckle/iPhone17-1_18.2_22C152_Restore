@interface VSDeveloperSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)cacheBusterEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInSetTopBoxMode;
- (BOOL)requestTimeoutsDisabled;
- (BOOL)setTopBoxSupportsOptOut;
- (BOOL)setTopBoxUseDeviceProfile;
- (BOOL)simulateExpiredToken;
- (NSString)setTopBoxBundleIdentifier;
- (NSString)setTopBoxIdentityProviderID;
- (NSString)setTopBoxUserToken;
- (VSDeveloperSettings)init;
- (VSDeveloperSettings)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheBusterEnabled:(BOOL)a3;
- (void)setDefaults;
- (void)setIsInSetTopBoxMode:(BOOL)a3;
- (void)setRequestTimeoutsDisabled:(BOOL)a3;
- (void)setSetTopBoxBundleIdentifier:(id)a3;
- (void)setSetTopBoxIdentityProviderID:(id)a3;
- (void)setSetTopBoxSupportsOptOut:(BOOL)a3;
- (void)setSetTopBoxUseDeviceProfile:(BOOL)a3;
- (void)setSetTopBoxUserToken:(id)a3;
- (void)setSimulateExpiredToken:(BOOL)a3;
@end

@implementation VSDeveloperSettings

- (void)setDefaults
{
  [(VSDeveloperSettings *)self setIsInSetTopBoxMode:0];
  [(VSDeveloperSettings *)self setCacheBusterEnabled:0];
  [(VSDeveloperSettings *)self setRequestTimeoutsDisabled:0];
  [(VSDeveloperSettings *)self setSimulateExpiredToken:0];
  [(VSDeveloperSettings *)self setSetTopBoxBundleIdentifier:0];
  [(VSDeveloperSettings *)self setSetTopBoxUserToken:0];
  [(VSDeveloperSettings *)self setSetTopBoxIdentityProviderID:0];
  [(VSDeveloperSettings *)self setSetTopBoxUseDeviceProfile:0];

  [(VSDeveloperSettings *)self setSetTopBoxSupportsOptOut:0];
}

- (VSDeveloperSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSDeveloperSettings;
  v2 = [(VSDeveloperSettings *)&v5 init];
  if (v2)
  {
    v3 = VSDeveloperSettingsValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSDeveloperSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSDeveloperSettings;
  objc_super v5 = [(VSDeveloperSettings *)&v8 init];
  if (v5)
  {
    v6 = VSDeveloperSettingsValueType();
    VSValueTypeInitWithCoder(v6, v5, v4);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSDeveloperSettingsValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSDeveloperSettingsValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSDeveloperSettingsValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSDeveloperSettingsValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSDeveloperSettingsValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (BOOL)isInSetTopBoxMode
{
  return self->_isInSetTopBoxMode;
}

- (void)setIsInSetTopBoxMode:(BOOL)a3
{
  self->_isInSetTopBoxMode = a3;
}

- (BOOL)cacheBusterEnabled
{
  return self->_cacheBusterEnabled;
}

- (void)setCacheBusterEnabled:(BOOL)a3
{
  self->_cacheBusterEnabled = a3;
}

- (BOOL)requestTimeoutsDisabled
{
  return self->_requestTimeoutsDisabled;
}

- (void)setRequestTimeoutsDisabled:(BOOL)a3
{
  self->_requestTimeoutsDisabled = a3;
}

- (BOOL)simulateExpiredToken
{
  return self->_simulateExpiredToken;
}

- (void)setSimulateExpiredToken:(BOOL)a3
{
  self->_simulateExpiredToken = a3;
}

- (NSString)setTopBoxBundleIdentifier
{
  return self->_setTopBoxBundleIdentifier;
}

- (void)setSetTopBoxBundleIdentifier:(id)a3
{
}

- (NSString)setTopBoxUserToken
{
  return self->_setTopBoxUserToken;
}

- (void)setSetTopBoxUserToken:(id)a3
{
}

- (NSString)setTopBoxIdentityProviderID
{
  return self->_setTopBoxIdentityProviderID;
}

- (void)setSetTopBoxIdentityProviderID:(id)a3
{
}

- (BOOL)setTopBoxUseDeviceProfile
{
  return self->_setTopBoxUseDeviceProfile;
}

- (void)setSetTopBoxUseDeviceProfile:(BOOL)a3
{
  self->_setTopBoxUseDeviceProfile = a3;
}

- (BOOL)setTopBoxSupportsOptOut
{
  return self->_setTopBoxSupportsOptOut;
}

- (void)setSetTopBoxSupportsOptOut:(BOOL)a3
{
  self->_setTopBoxSupportsOptOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setTopBoxIdentityProviderID, 0);
  objc_storeStrong((id *)&self->_setTopBoxUserToken, 0);

  objc_storeStrong((id *)&self->_setTopBoxBundleIdentifier, 0);
}

@end
@interface HMNetworkConfigurationWiFiOptions
- (BOOL)rotate;
- (HMNetworkConfigurationWiFiOptions)initWithCredentialType:(int64_t)a3;
- (id)description;
- (int64_t)credentialType;
- (void)setRotate:(BOOL)a3;
@end

@implementation HMNetworkConfigurationWiFiOptions

- (void)setRotate:(BOOL)a3
{
  self->_rotate = a3;
}

- (BOOL)rotate
{
  return self->_rotate;
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (id)description
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = HMAccessoryWiFiCredentialTypeAsString(self->_credentialType);
  v6 = HMFBooleanToString();
  v7 = [v3 stringWithFormat:@"<%@ CredentialType = %@, Rotate = %@>", v4, v5, v6];

  return v7;
}

- (HMNetworkConfigurationWiFiOptions)initWithCredentialType:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)HMNetworkConfigurationWiFiOptions;
    v4 = [(HMNetworkConfigurationWiFiOptions *)&v7 init];
    if (v4) {
      v4->_credentialType = a3;
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
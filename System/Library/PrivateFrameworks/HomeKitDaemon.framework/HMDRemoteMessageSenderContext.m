@interface HMDRemoteMessageSenderContext
- (HMDAccountHandle)accountHandle;
- (HMDAccountIdentifier)accountIdentifier;
- (HMDDeviceHandle)deviceHandle;
- (HMDDeviceHandle)localDeviceHandle;
- (HMDHomeKitVersion)deviceVersion;
- (HMDRemoteMessageSenderContext)initWithDeviceHandle:(id)a3 accountHandle:(id)a4 accountIdentifier:(id)a5 deviceVersion:(id)a6 pairingIdentityIdentifier:(id)a7;
- (NSString)mergeID;
- (NSString)pairingIdentityIdentifier;
- (NSString)propertyDescription;
- (void)setLocalDeviceHandle:(id)a3;
@end

@implementation HMDRemoteMessageSenderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingIdentityIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_localDeviceHandle, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

- (NSString)pairingIdentityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHomeKitVersion)deviceVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 40, 1);
}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccountIdentifier)accountIdentifier
{
  return (HMDAccountIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalDeviceHandle:(id)a3
{
}

- (HMDDeviceHandle)localDeviceHandle
{
  return (HMDDeviceHandle *)objc_getProperty(self, a2, 16, 1);
}

- (HMDDeviceHandle)deviceHandle
{
  return (HMDDeviceHandle *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)propertyDescription
{
  v3 = NSString;
  v4 = [(HMDRemoteMessageSenderContext *)self deviceHandle];
  v5 = [(HMDRemoteMessageSenderContext *)self accountHandle];
  v6 = [(HMDRemoteMessageSenderContext *)self accountIdentifier];
  v7 = [(HMDRemoteMessageSenderContext *)self deviceVersion];
  v8 = [(HMDRemoteMessageSenderContext *)self pairingIdentityIdentifier];
  v9 = [v3 stringWithFormat:@", Device Handle = %@, Account Handle = %@, Account Identifier = %@, Device Version = %@, Pairing Identity Identifier = %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)mergeID
{
  v2 = [(HMDRemoteMessageSenderContext *)self accountIdentifier];
  v3 = [v2 senderCorrelationIdentifier];

  return (NSString *)v3;
}

- (HMDRemoteMessageSenderContext)initWithDeviceHandle:(id)a3 accountHandle:(id)a4 accountIdentifier:(id)a5 deviceVersion:(id)a6 pairingIdentityIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    v30.receiver = self;
    v30.super_class = (Class)HMDRemoteMessageSenderContext;
    v17 = [(HMDRemoteMessageSenderContext *)&v30 init];
    if (v17)
    {
      uint64_t v18 = [v12 copy];
      deviceHandle = v17->_deviceHandle;
      v17->_deviceHandle = (HMDDeviceHandle *)v18;

      uint64_t v20 = [v13 copy];
      accountHandle = v17->_accountHandle;
      v17->_accountHandle = (HMDAccountHandle *)v20;

      uint64_t v22 = [v14 copy];
      accountIdentifier = v17->_accountIdentifier;
      v17->_accountIdentifier = (HMDAccountIdentifier *)v22;

      uint64_t v24 = [v15 copy];
      deviceVersion = v17->_deviceVersion;
      v17->_deviceVersion = (HMDHomeKitVersion *)v24;

      uint64_t v26 = [v16 copy];
      pairingIdentityIdentifier = v17->_pairingIdentityIdentifier;
      v17->_pairingIdentityIdentifier = (NSString *)v26;
    }
    self = v17;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end
@interface HMDHomeReprovisioningPendingInformation
- (HMDAccessoryNetworkCredential)networkCredential;
- (HMDHomeReprovisioningPendingInformation)initWithMessageUUID:(id)a3 networkCredential:(id)a4;
- (NSUUID)messageIdentifier;
@end

@implementation HMDHomeReprovisioningPendingInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

- (HMDAccessoryNetworkCredential)networkCredential
{
  return (HMDAccessoryNetworkCredential *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHomeReprovisioningPendingInformation)initWithMessageUUID:(id)a3 networkCredential:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeReprovisioningPendingInformation;
  v9 = [(HMDHomeReprovisioningPendingInformation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageIdentifier, a3);
    objc_storeStrong((id *)&v10->_networkCredential, a4);
  }

  return v10;
}

@end
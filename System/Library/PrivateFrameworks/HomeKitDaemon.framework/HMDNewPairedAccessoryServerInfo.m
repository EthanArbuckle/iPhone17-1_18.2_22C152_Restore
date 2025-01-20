@interface HMDNewPairedAccessoryServerInfo
- (HAPAccessoryServer)server;
- (HMDAccessoryNetworkCredential)networkCredential;
- (HMDAccessoryPairingEvent)pairingEvent;
- (HMDHome)home;
- (HMDNewPairedAccessoryServerInfo)initWithServer:(id)a3 home:(id)a4 primaryAccessoryUUID:(id)a5 certificationStatus:(int64_t)a6 hostAccessory:(id)a7 networkCredential:(id)a8 pairingEvent:(id)a9;
- (MKFAccessory)hostAccessory;
- (NSUUID)primaryAccessoryUUID;
- (id)description;
- (int64_t)certificationStatus;
@end

@implementation HMDNewPairedAccessoryServerInfo

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pairingEvent, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_hostAccessory, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDAccessoryPairingEvent)pairingEvent
{
  return (HMDAccessoryPairingEvent *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAccessoryNetworkCredential)networkCredential
{
  return (HMDAccessoryNetworkCredential *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (MKFAccessory)hostAccessory
{
  return (MKFAccessory *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)primaryAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HAPAccessoryServer)server
{
  return (HAPAccessoryServer *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HMDNewPairedAccessoryServerInfo;
  v4 = [(HMDNewPairedAccessoryServerInfo *)&v10 description];
  v5 = [(HMDNewPairedAccessoryServerInfo *)self primaryAccessoryUUID];
  v6 = [(HMDNewPairedAccessoryServerInfo *)self server];
  v7 = [v6 identifier];
  v8 = [v3 stringWithFormat:@"%@ [%@/%@]", v4, v5, v7];

  return v8;
}

- (HMDNewPairedAccessoryServerInfo)initWithServer:(id)a3 home:(id)a4 primaryAccessoryUUID:(id)a5 certificationStatus:(int64_t)a6 hostAccessory:(id)a7 networkCredential:(id)a8 pairingEvent:(id)a9
{
  id v24 = a3;
  id v15 = a4;
  id v23 = a5;
  id v22 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HMDNewPairedAccessoryServerInfo;
  v18 = [(HMDNewPairedAccessoryServerInfo *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_server, a3);
    objc_storeWeak((id *)&v19->_home, v15);
    objc_storeStrong((id *)&v19->_primaryAccessoryUUID, a5);
    v19->_certificationStatus = a6;
    objc_storeStrong((id *)&v19->_networkCredential, a8);
    objc_storeStrong((id *)&v19->_hostAccessory, a7);
    objc_storeStrong((id *)&v19->_pairingEvent, a9);
  }

  return v19;
}

@end